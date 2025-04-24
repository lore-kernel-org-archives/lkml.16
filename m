Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76630280CE0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745522508; cv=none; b=RygQsck89NYSjJ0Zea2jQZX8X1caGSUXnBqu27MWS1hRzqCdZubYcOC7vTghO+NRzTvDPvi5bJtVTePbeRmrwO4v9YrnFVmO3eckSuB6QmyMtn2oYH2lJurHH0142EgnG5WAIbfdSel6FbothKOff+jQtpIVF5iketgLAs7QqbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745522508; c=relaxed/simple;
	bh=GhdbNQqm5Mo0SBjik8a+TZCQ4tcJfPyU15uycDKJe+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R57GSY7EwoQcWpQ3IHbxWmjmv8q1WPocyFMae4/4w1UosI5t0Hh9ymW/VnwWJ7F1lN0wrzhf9ogHauu33kR/JcWrNz4EKUgM3jtC5la2mtgS+r0NTP75T1sWzphM7rQsTJSUQQspxxIyZTlOOV3h9wRuiLwLbfv8L7cA4JeFEsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kkk/fRpn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kkk/fRpn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9AFC4CEE3;
	Thu, 24 Apr 2025 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745522507;
	bh=GhdbNQqm5Mo0SBjik8a+TZCQ4tcJfPyU15uycDKJe+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kkk/fRpnyVIZuC8XW1BNl+GeAiHGvQiP5wFA9U+P0w1U8GPcrEWw0/96xqshVHKeA
	 tg6z7OOpWYKREYVPVGuoU5eSaV8N/xU5VkkCnRbKCshzeHN5cFNs+kccmEhjnDsU5F
	 PHrVsHnfXHYNbcN45hS24ZrwTbF9VGEbMM5cxg6YemiDGkDCCrwNw9XIPnmWR5DLKd
	 rmeyeMsLuY2r1I97h4IccM2ryI+MfC2gw+geMGhy6Thv/cvdbQrX17s6ccnFXgyoBz
	 gG8BEIZya3g51i820hoLPoCvWCheYL8Yy9kVAdWBGlh4NbEz/P9eXnDQLPAmCPbPrP
	 mUvE/4E4NSrGg==
Date: Thu, 24 Apr 2025 22:21:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Wei Yang <richard.weiyang@gmail.com>,
	Baoquan He <bhe@redhat.com>, Suren Baghdasaryan <surenb@google.com>,
	Frank van der Linden <fvdl@google.com>,
	York Jasper Niebuhr <yjnworkstation@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memblock: mark init_deferred_page as __init_memblock
Message-ID: <aAqPQgjgkPNtOElr@kernel.org>
References: <20250423160824.1498493-1-arnd@kernel.org>
 <aApm344CnIwy4s2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aApm344CnIwy4s2d@kernel.org>

On Thu, Apr 24, 2025 at 07:29:29PM +0300, Mike Rapoport wrote:
> On Wed, Apr 23, 2025 at 06:08:08PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > On architectures that set CONFIG_ARCH_KEEP_MEMBLOCK, memmap_init_kho_scratch_pages
> > is not discarded but calls a function that is:
> > 
> > WARNING: modpost: vmlinux: section mismatch in reference: memmap_init_kho_scratch_pages+0x120 (section: .text) -> init_deferred_page (section: .init.text)
> > ERROR: modpost: Section mismatches detected.
> > Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
> > 
> > Mark init_deferred_page the same way as memmap_init_kho_scratch_pages
> > to avoid that warning. Unfortunately this requires marking additional
> > functions the same way to have them stay around as well.
> > 
> > Ideally memmap_init_kho_scratch_pages would become __meminit instead
> > of __init_memblock, but I could not convince myself that this is safe.
> 
> It should be __init even, as well as a few other kho-memblock
> functions.
> I'll run some builds to make sure I'm not missing anything.

Yeah, it looks like everything inside CONFIG_MEMBLOCK_KHO_SCRATCH can be
just __init unconditionally:

diff --git a/mm/memblock.c b/mm/memblock.c
index 44d3bacf86a0..994792829ebe 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -942,17 +942,17 @@ int __init_memblock memblock_physmem_add(phys_addr_t base, phys_addr_t size)
 #endif
 
 #ifdef CONFIG_MEMBLOCK_KHO_SCRATCH
-__init_memblock void memblock_set_kho_scratch_only(void)
+__init void memblock_set_kho_scratch_only(void)
 {
 	kho_scratch_only = true;
 }
 
-__init_memblock void memblock_clear_kho_scratch_only(void)
+__init void memblock_clear_kho_scratch_only(void)
 {
 	kho_scratch_only = false;
 }
 
-void __init_memblock memmap_init_kho_scratch_pages(void)
+__init void memmap_init_kho_scratch_pages(void)
 {
 	phys_addr_t start, end;
 	unsigned long pfn;
  
> > Fixes: 1b7936623970 ("memblock: introduce memmap_init_kho_scratch()")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  mm/internal.h | 7 ++++---
> >  mm/mm_init.c  | 8 ++++----
> >  2 files changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/mm/internal.h b/mm/internal.h
> > index 838f840ded83..40464f755092 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -9,6 +9,7 @@
> >  
> >  #include <linux/fs.h>
> >  #include <linux/khugepaged.h>
> > +#include <linux/memblock.h>
> >  #include <linux/mm.h>
> >  #include <linux/mm_inline.h>
> >  #include <linux/pagemap.h>
> > @@ -543,7 +544,7 @@ extern int defrag_mode;
> >  
> >  void setup_per_zone_wmarks(void);
> >  void calculate_min_free_kbytes(void);
> > -int __meminit init_per_zone_wmark_min(void);
> > +int __init_memblock init_per_zone_wmark_min(void);
> >  void page_alloc_sysctl_init(void);
> >  
> >  /*
> > @@ -1532,9 +1533,9 @@ static inline bool pte_needs_soft_dirty_wp(struct vm_area_struct *vma, pte_t pte
> >  	return vma_soft_dirty_enabled(vma) && !pte_soft_dirty(pte);
> >  }
> >  
> > -void __meminit __init_single_page(struct page *page, unsigned long pfn,
> > +void __init_memblock __init_single_page(struct page *page, unsigned long pfn,
> >  				unsigned long zone, int nid);
> > -void __meminit __init_page_from_nid(unsigned long pfn, int nid);
> > +void __init_memblock __init_page_from_nid(unsigned long pfn, int nid);
> >  
> >  /* shrinker related functions */
> >  unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index 7bb5f77cf195..31cf8bc31cc2 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -578,7 +578,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
> >  	node_states[N_MEMORY] = saved_node_state;
> >  }
> >  
> > -void __meminit __init_single_page(struct page *page, unsigned long pfn,
> > +void __init_memblock __init_single_page(struct page *page, unsigned long pfn,
> >  				unsigned long zone, int nid)
> >  {
> >  	mm_zero_struct_page(page);
> > @@ -669,7 +669,7 @@ static inline void fixup_hashdist(void) {}
> >  /*
> >   * Initialize a reserved page unconditionally, finding its zone first.
> >   */
> > -void __meminit __init_page_from_nid(unsigned long pfn, int nid)
> > +void __init_memblock __init_page_from_nid(unsigned long pfn, int nid)
> >  {
> >  	pg_data_t *pgdat;
> >  	int zid;
> > @@ -744,7 +744,7 @@ defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
> >  	return false;
> >  }
> >  
> > -static void __meminit __init_deferred_page(unsigned long pfn, int nid)
> > +static void __init_memblock __init_deferred_page(unsigned long pfn, int nid)
> >  {
> >  	if (early_page_initialised(pfn, nid))
> >  		return;
> > @@ -769,7 +769,7 @@ static inline void __init_deferred_page(unsigned long pfn, int nid)
> >  }
> >  #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
> >  
> > -void __meminit init_deferred_page(unsigned long pfn, int nid)
> > +void __init_memblock init_deferred_page(unsigned long pfn, int nid)
> >  {
> >  	__init_deferred_page(pfn, nid);
> >  }
> > -- 
> > 2.39.5
> > 
> 
> -- 
> Sincerely yours,
> Mike.

-- 
Sincerely yours,
Mike.
