Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66BF2B9A6
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748398092; cv=none; b=JDgmaMJ+v/Qusz1nnoJxAhnsVyf2m/0a1m2te2pB87JZ6nZg/XbN6zA0wLrcz9QSL9aVSMe+rj69bVSJ+AGehWr/lyG5hdjCKz47lfoSqWMUGCWOjg3P1qL0qH5wSDhhehLdSSTp7Zj/8yKj13pzMBemovaFgULwjBGKToku3Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748398092; c=relaxed/simple;
	bh=QToKGrlvFUYinwPi5NW51sedo2o3ko9Iy1rwyPVIWos=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nZztrB3cyr+KF27NOsVDtCb8Z2W39kNGptUkJvvTFL1Qr0OHENHE2JbhB/Ta0zJtACsg6d6vXPeku6tmUPG2V/R2gDyXz39YlETlYwBWcRHzFjNCL2SSxal+w6hgVbGDQndATW9dollH1QHn2c6j/sDjqouFMdYwOvpeZao5G1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h2uilgXu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h2uilgXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6D5C4CEE9;
	Wed, 28 May 2025 02:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1748398092;
	bh=QToKGrlvFUYinwPi5NW51sedo2o3ko9Iy1rwyPVIWos=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h2uilgXu7mAlYkZJqMoAFSxXeLzcpbOHHnEgdHyFhhn/0Tss3I0KeD7B0wD7pHm8D
	 wUGX3hdEOTtvUUR8GWnw4ojq6l+gm9nEkEFM1d64XoHvcRlWSz2aWZSVBDFu7yQQKz
	 busFYqMMtqupeErVIcql88N4cMQWlJ0mZEw9tk0Y=
Date: Tue, 27 May 2025 19:08:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org,
 osalvador@suse.de, mcgrof@kernel.org, a.manzanares@samsung.com,
 dave@stgolabs.net, david@redhat.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>, Sidhartha Kumar
 <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH v4 2/4] mm/hugetlb: Refactor unmap_hugepage_range() to
 take folio instead of page
Message-Id: <20250527190811.08e3c035f30187ba852f1914@linux-foundation.org>
In-Reply-To: <aBkYmLOiTZt1sLr_@fedora>
References: <20250505182345.506888-2-nifan.cxl@gmail.com>
	<20250505182345.506888-4-nifan.cxl@gmail.com>
	<aBkYmLOiTZt1sLr_@fedora>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 May 2025 12:59:20 -0700 "Vishal Moola (Oracle)" <vishal.moola@gmail.com> wrote:

> On Mon, May 05, 2025 at 11:22:42AM -0700, nifan.cxl@gmail.com wrote:
> > From: Fan Ni <fan.ni@samsung.com>
> > 
> > The function unmap_hugepage_range() has two kinds of users:
> > 1) unmap_ref_private(), which passes in the head page of a folio.  Since
> >    unmap_ref_private() already takes folio and there are no other uses
> >    of the folio struct in the function, it is natural for
> >    unmap_hugepage_range() to take folio also.
> > 2) All other uses, which pass in NULL pointer.
> > 
> > In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
> > take folio.
> 
> It looks like unmap_ref_private() is the only caller that cares about
> passing a particular folio to unmap_hugepage_range(). Is there any
> reason we shouldn't drop the folio argument and call
> __unmap_hugepage_range() directly? 

afaict there was no response to this review comment.

I'll proceed with the patchset, but please let's not lose sight of this.
