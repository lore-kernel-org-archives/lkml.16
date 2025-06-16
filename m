Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6179914C5B0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750114582; cv=none; b=KBs9x+piAGgkIN9V4XlSEZ48UUkgqY4bvfGXonUejBxMu8puwEo4u6RhPiPe5I2TQScc3gMdfXdHYKDtSXBuU2PtEzQk0J8SnJskT3lk4wfUIY9AqTy06iY86CuczfjRQU5T+PVABBVl46t3ySWFBc26gHnijTbFSDN8X1uTurk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750114582; c=relaxed/simple;
	bh=nmDdx+pP0H38NdKv072XQf8thk7tTAg2KJDwDQI60Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cS25eGRZJSbZ64aijQkyvMPPLCSA/VBmegi4OsO7oitYZDh9SGh71eExzavs33N2y2rjNRMP+w6JhgCNRpPkAfkZnuJafdHq0adECvuqUAScbG1Yjuu+cGTh1meaXgiA/SK3JJKmVgVsGulTNzv20r+OP89B7CSD1/N9UvJDiTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ji5fPsx5; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ji5fPsx5"
Date: Mon, 16 Jun 2025 15:56:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750114577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vBF0zojgAYzzJ5lMjiUR1nnWNeajMbt4wna1wGlVy9E=;
	b=ji5fPsx5J2eIPmYLm1BQ3oOmbithArlzeW3d9reowesgLSa+A2mfsaLXrF+IPGc1gfcxu0
	3quarNyuOo2PukdCRd6GOPH6dGqHCWO3aZv0svcEm1X61MPL6r//rX2c4x/qUV38wwH/w0
	tRJDrnsCzD+P6Vfry15HPk6T0JN65i0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add further core files to mm core
 section
Message-ID: <35kubwcjkvyu34k7ejp2ykydtrbcl2gptcurs7rhqzi3cy3l5h@gcxndb7dfdgq>
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
X-Migadu-Flow: FLOW_OUT

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
> 
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
> 
> > +F:	mm/folio-compat.c
> > +F:	mm/highmem.c
> >   F:	mm/init-mm.c
> > +F:	mm/internal.h
> > +F:	mm/interval_tree.c
> > +F:	mm/io-mapping.c> +F:	mm/ioremap.c
> > +F:	mm/list_lru.c
> 
> Smells like reclaim/memcg.

Shrinker might be more appropriate (along with the list_lru.h)

> 
> > +F:	mm/maccess.c
> > +F:	mm/mapping_dirty_helpers.c
> >   F:	mm/memory.c> +F:	mm/memremap.c
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

I think Michal already has a patch on OOM section which I expect he will
send out soon.

