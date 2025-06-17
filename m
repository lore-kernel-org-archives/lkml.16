Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63713BBF2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750182725; cv=none; b=YfoGSk+QF4cQJW97Lge274LMyuLWHYAQCqNa8DCxtTw/k1iL0upoCcdQI0D3MV7Ah2U95mojFuISOvvhEY3NV5pmBskZV+F+mOFJ5igIq2EktG+DyzG6hETkpRw0g/KCpaacC/F8/orfaTWZKoZZeCw2C5MY/VbMapD2qliksoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750182725; c=relaxed/simple;
	bh=VlMA8Y97UBbaoyXvJx0h0GaAzHx6awCw+YqOGf/prjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7FytwrFFtAu2f0JWf8ZHxtRTNUDFe6MwFxwDW9BwqzC/5ltS8t29e4PM+Cjvunx6aHyEL4JGaGdGASMmWGP4/cdcY72KRo86hZ0FJhW7zrAveXeeO1+XK8+FZsIhoc4pT/PuGjWIf9rLElNQXsYhk4kroUAiK29AsqAuZu+ROg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JaadzyNh; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JaadzyNh"
Date: Tue, 17 Jun 2025 10:51:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750182720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9H/iaRf40PeLw7FvouwIQ5qs9ZEfzW9xC+JE7Z9klJ8=;
	b=JaadzyNhevveq+vZ8dIcdKKaPKuCecNr0d21VLID7tFlRNIz64VPIzWilCmDsaOsZS71DG
	1wer4h9Yc7RXamq/su+Jb4DBgzcAsUg30BK6pQHRS2KNWJ+Ec9rT9eWJylV/z3nUk4AbTJ
	XloVox0tXwOQJilPwqMg882PpK30gCI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add further core files to mm core
 section
Message-ID: <bfnbgxtvo4avlktnk6dmusns4iq4ksjvjmcuw6kqekpsrh324x@xulw3cq3uxih>
References: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
 <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>
 <35kubwcjkvyu34k7ejp2ykydtrbcl2gptcurs7rhqzi3cy3l5h@gcxndb7dfdgq>
 <c8d6c655-282c-41a7-9cae-a18e0cc5e15d@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8d6c655-282c-41a7-9cae-a18e0cc5e15d@lucifer.local>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 17, 2025 at 04:22:33PM +0100, Lorenzo Stoakes wrote:
> On Mon, Jun 16, 2025 at 03:56:02PM -0700, Shakeel Butt wrote:
> > On Mon, Jun 16, 2025 at 11:10:41PM +0200, David Hildenbrand wrote:
> > > On 16.06.25 22:38, Lorenzo Stoakes wrote:
> > > > There are a number of files which don't quite belong anywhere else, so
> > > > place them in the core section. If we determine in future they belong
> > > > elsewhere we can update incrementally but it is preferable that we assign
> > > > each file to a section as best we can.
> > > >
> > > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > ---
> > > > REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> > > > this. even if they are not quite best placed a 'best effort' is still
> > > > worthwhile so we establish a place to put all mm files, we can always
> > > > incrementally update these later.
> > > >
> > > >   MAINTAINERS | 28 ++++++++++++++++++++++++----
> > > >   1 file changed, 24 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 4523a6409186..a61d56bd7aa4 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -15740,10 +15740,6 @@ F:	include/linux/memory_hotplug.h
> > > >   F:	include/linux/memory-tiers.h
> > > >   F:	include/linux/mempolicy.h
> > > >   F:	include/linux/mempool.h
> > > > -F:	include/linux/memremap.h
> > > > -F:	include/linux/mmzone.h
> > > > -F:	include/linux/mmu_notifier.h
> > > > -F:	include/linux/pagewalk.h
> > > >   F:	include/trace/events/ksm.h
> > > >   F:	mm/
> > > >   F:	tools/mm/
> > >
> > > Probably better to have some section than none ... was just briefly
> > > wondering if "CORE" is the right section for some of that. Some of that
> > > might be better of in a "MM MISC" section, maybe.
> > >
> > > > @@ -15764,16 +15760,40 @@ S:	Maintained
> > > >   W:	http://www.linux-mm.org
> > > >   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > > >   F:	include/linux/memory.h
> > > > +F:	include/linux/memremap.h
> > > >   F:	include/linux/mm.h
> > > >   F:	include/linux/mm_*.h
> > > >   F:	include/linux/mmdebug.h
> > > > +F:	include/linux/mmu_notifier.h
> > > > +F:	include/linux/mmzone.h
> > > >   F:	include/linux/pagewalk.h
> > > >   F:	kernel/fork.c
> > > >   F:	mm/Kconfig
> > > >   F:	mm/debug.c
> > > > +F:	mm/debug_page_ref.c
> > > > +F:	mm/debug_vm_pgtable.c
> > >
> > > Wondering if there should be a MM DEBUG section. But then, no idea who in
> > > their right mind would be willing to maintain that ;)
> > >
> > > > +F:	mm/folio-compat.c
> > > > +F:	mm/highmem.c
> > > >   F:	mm/init-mm.c
> > > > +F:	mm/internal.h
> > > > +F:	mm/interval_tree.c
> > > > +F:	mm/io-mapping.c> +F:	mm/ioremap.c
> > > > +F:	mm/list_lru.c
> > >
> > > Smells like reclaim/memcg.
> >
> > Shrinker might be more appropriate (along with the list_lru.h)
> 
> Yeah I struggled with this one. It's a weird one, it's like a generic LRU
> algorithm:
> 
> zswap_lru_add()
> binder_lru_freelist_add()
> -> list_lru_add()
> 
> Also called internally by list_lru_add_obj() which is used for dentry LRUs by a
> number of filesystems
> 
> But also by the working set code in workingset_update_node() :)
> 
> So it's a bit all over the place.
> 
> I wonder whether best for mm misc as a result?

list_lru is the data structure / abstraction to interact with the
shrinker. Kernel components which can consume large amount of kernel
memory and has a way to drop some on memory pressure (e.g. some form of
cache) register themselves with the shrinker and list_lru is used to
store/link their internal objects which the shrinker can drop/reclaim
during memory reclaim.
