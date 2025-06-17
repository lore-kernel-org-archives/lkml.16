Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386BB13B58D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750132441; cv=none; b=JWxl3MQ7iF2ebgpQM4+SLFnleQoe2sjGkwHxG4eI0eaC9s0Yi+EMhvO+XLbcVcTH9cOxYdzZp+vKJ5+o0pW2zg2yMDeKX8vtlKPM7vhLmIaFCunoLbDpeXikcTCHtMkdjdTWU87f7wJwEt05MChye7W+a7sROokKCrsO6x2LLgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750132441; c=relaxed/simple;
	bh=T/OKqkeDi+4ifeO4oxLf71wbRvA5+2EW8V9yeqB5SIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=je/j+3jJHBXQ42K+mTEW2pcd6gCmbYEDmWYgAstZeRy3nRhUKegoRPSuQwUWbTxrPUnoI9G1p/5QIpIzG1LAVcBbbojKyCcXxedXaJiKUDWwmrFnQeAbiQxjde5Is5Bc/CEk94JJJDPlOM9blovwfynCVgqiskMu5XBAV2W0ya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfi9Wqyl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfi9Wqyl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14093C4CEE3;
	Tue, 17 Jun 2025 03:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750132440;
	bh=T/OKqkeDi+4ifeO4oxLf71wbRvA5+2EW8V9yeqB5SIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nfi9Wqyl9vFmTcaXwZw1livpaoZRSlcPaWxZWLDnuuoI0O72JO9/QSHtBh6mxqXRJ
	 cMX8kfebMfhH2aEq+A/FoX0nm/s/OtT0EJ0MhvB0KouqIV3W2CXaO/b3RxKwUKMRLx
	 JjpLqvP/3sCSDjVNH2zGy5nECoUgSjvlM48FSqhh0LIoJx3xM/X3u+nn8YnPVXlSDP
	 sSWHRme+owO0vPmhi7MmsJbp42+iZP2GYgIPCvNo46Efdzh2ZMHeZvCp/u5bkvkVfg
	 j/C3hCXQB8LRC8JnzFhyBFf63k1/qVcTJS539b2roRAwiV9bD/FPXiT6RjFbNZ6HTq
	 ocowID+m3pDyA==
Date: Tue, 17 Jun 2025 06:53:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add further core files to mm core
 section
Message-ID: <aFDm0YrbSAvXc5Wp@kernel.org>
References: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
 <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>

On Mon, Jun 16, 2025 at 11:10:41PM +0200, David Hildenbrand wrote:
> On 16.06.25 22:38, Lorenzo Stoakes wrote:
> > There are a number of files which don't quite belong anywhere else, so
> > place them in the core section. If we determine in future they belong
> > elsewhere we can update incrementally but it is preferable that we assign
> > each file to a section as best we can.
> > 
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> > REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> > this. even if they are not quite best placed a 'best effort' is still
> > worthwhile so we establish a place to put all mm files, we can always
> > incrementally update these later.
> > 
> >   MAINTAINERS | 28 ++++++++++++++++++++++++----
> >   1 file changed, 24 insertions(+), 4 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4523a6409186..a61d56bd7aa4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15740,10 +15740,6 @@ F:	include/linux/memory_hotplug.h
> >   F:	include/linux/memory-tiers.h
> >   F:	include/linux/mempolicy.h
> >   F:	include/linux/mempool.h
> > -F:	include/linux/memremap.h
> > -F:	include/linux/mmzone.h
> > -F:	include/linux/mmu_notifier.h
> > -F:	include/linux/pagewalk.h
> >   F:	include/trace/events/ksm.h
> >   F:	mm/
> >   F:	tools/mm/
> 
> Probably better to have some section than none ... was just briefly
> wondering if "CORE" is the right section for some of that. Some of that
> might be better of in a "MM MISC" section, maybe.

Maybe rather than add files to MM CORE we should move mm/ there and add the
MM MISC section for files we explicitly want to exclude from MM CORE?
 
> > @@ -15764,16 +15760,40 @@ S:	Maintained
> >   W:	http://www.linux-mm.org
> >   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> >   F:	include/linux/memory.h
> > +F:	include/linux/memremap.h
> >   F:	include/linux/mm.h
> >   F:	include/linux/mm_*.h
> >   F:	include/linux/mmdebug.h
> > +F:	include/linux/mmu_notifier.h
> > +F:	include/linux/mmzone.h
> >   F:	include/linux/pagewalk.h
> >   F:	kernel/fork.c
> >   F:	mm/Kconfig
> >   F:	mm/debug.c
> > +F:	mm/debug_page_ref.c
> > +F:	mm/debug_vm_pgtable.c
> 
> Wondering if there should be a MM DEBUG section. But then, no idea who in
> their right mind would be willing to maintain that ;)

The same people that maintain MM CORE? ;-)
 
> > +F:	mm/folio-compat.c
> > +F:	mm/highmem.c
> >   F:	mm/init-mm.c
> > +F:	mm/internal.h
> > +F:	mm/interval_tree.c

Looks like VMA to me.

> > +F:	mm/io-mapping.c

This is an interesting one. There are no in tree users of the only function
it contains.

> > +F:	mm/ioremap.c
> > +F:	mm/list_lru.c
> 
> Smells like reclaim/memcg.
> 
> > +F:	mm/maccess.c
> > +F:	mm/mapping_dirty_helpers.c
> >  F:	mm/memory.c
> > +F:	mm/memremap.c
> 
> memory hotplug related. Well, one could argue that it's just a memory
> hotplug user. It's mostly ZONE_DEVICE handling. Wonder if that would be
> worth a separate section ...
> 
> > +F:	mm/mmu_notifier.c
> > +F:	mm/mmzone.c
> > +F:	mm/oom_kill.c
> 
> This contains quite some meat. I wonder if a OOM section would be
> appropriate (Michal, I'm looking at you :) )
>
> -- 
> Cheers,
> 
> David / dhildenb

-- 
Sincerely yours,
Mike.
