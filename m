Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0151C84CB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973920; cv=none; b=EsmzqbtxrGTEluMhHqNclATfA5ozUu0hqGV7mxAQrL5jdEWXOnfpTC9tw7PzCiAl9EKNSF6KQTPHmSdxuRucuGbxtRkWFs8MgKqtwOR+MesaW4dKzIP6ghyQKme7whr3H3G1DM6WLVBr3R4ewwIo7IJUDxy2n7SDR/n1pCYyB44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973920; c=relaxed/simple;
	bh=MQGLxLuyKk+ah03ws0mwUoTDm6S50N6unJbGPn/pnLk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQeAMJNIKmKgI6293MrHyt47UY9zOM0eAwFXuehBIz6owPrFNSH+L7i8dFMgAafmc5PbgqG6PSI+mk59giPV+P4EZoOkLwHbhr8RCNzgqhTYyr9Hytk+RwET8iWUupjG5hGMU55w3l5WbMZ+MoKBpDJytCITtkN+0Lfxi3qRVAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF51CC4CEED;
	Tue,  3 Jun 2025 18:05:17 +0000 (UTC)
Date: Tue, 3 Jun 2025 14:06:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>, Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250603140632.168190f9@gandalf.local.home>
In-Reply-To: <CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
References: <20250602170500.48713a2b@gandalf.local.home>
	<20250602171458.7ceabb1c@gandalf.local.home>
	<aD4boBrdZXtz_5kL@casper.infradead.org>
	<fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
	<20250603102959.20c85adb@gandalf.local.home>
	<aD8iL4cFoXpIVK_0@casper.infradead.org>
	<20250603132736.554f611d@gandalf.local.home>
	<CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Jun 2025 10:54:49 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, 3 Jun 2025 at 10:26, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> >  config DRM_TTM
> >         tristate
> > -       depends on DRM && MMU
> > +       depends on DRM && MMU && SHMEM  
> 
> Yeah, except I think you should just make it be
> 
>           depends on DRM && SHMEM
> 
> because SHMEM already depends on MMU.

Yeah, if I had made this a real patch I would have done that, but this was
only for seeing it it would work.

> 
> That said, our docs already say that if you disable SHMEM, it gets
> replaced by RAMFS, so maybe just having a ramfs version is the
> RightThing(tm).
> 
> I don't think such a ramfs version should just return 0 - much less an
> error. I think it should always redirty the page.
> 
> IOW, I think the "ramfs" version should look something like
> 
>         folio_mark_dirty(folio);
>         if (wbc->for_reclaim)
>                 return AOP_WRITEPAGE_ACTIVATE;  /* Return with folio locked */
>         folio_unlock(folio);
>         return 0;
> 
> which is what shmem does for the "page is locked" case.

I'll let someone that understand the code a bit more than I do to make such
a change. My patch was just a "this makes my system build" thing and let
those that know this code do the RightThing(tm).

-- Steve

