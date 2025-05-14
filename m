Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0E521129C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209399; cv=none; b=RDznagG2+Er7tW0OSocIf1B2j8f2omVKZNEoI6oV5/rrtDlh8chIrod2Rb/MHWaZfhJFvv52tn8JiFvoh+ugMTyzUyLHhWKnC/P1EmlgyesjfjNzMqIgdPPFh5DZJVGnd8Jw1PuADjqenbMBDtYHsjWWoM1TAsxUxC+a1C4CseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209399; c=relaxed/simple;
	bh=mcMo7PQHI1ZDZEzm9Zv9hS0UhuE9ezIrT2xvL8UJLOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPxm1TuqrcbXzHbrof971oJosmh/PhRswkejtsokVGsnn5uRiy6rq0VQIXkr6P+e5UTE4jpcAotDsprHcnjn/lMVHO55qLDUNNkvROoI7Uwog0vuD3Lg+PbvvLA+Rur++OnQ3F3qMtttSI2lRGAQpbGNHLxnkkbWlkwQRjgJndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CFF41688;
	Wed, 14 May 2025 00:56:23 -0700 (PDT)
Received: from [10.162.43.24] (K4MQJ0H1H2.blr.arm.com [10.162.43.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA4EF3F673;
	Wed, 14 May 2025 00:56:26 -0700 (PDT)
Message-ID: <b083d377-ae92-486f-9c6b-5fe30bb88397@arm.com>
Date: Wed, 14 May 2025 13:26:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] mm: make try_to_unmap_one support batched unmap for
 anon large folios
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>,
 Baoquan He <bhe@redhat.com>, Dan Schatzberg <schatzberg.dan@gmail.com>,
 Kaixiong Yu <yukaixiong@huawei.com>, Fan Ni <fan.ni@samsung.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250513084620.58231-1-21cnbao@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250513084620.58231-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/05/25 2:16 pm, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> My commit 354dffd29575c ("mm: support batched unmap for lazyfree large
> folios during reclamation") introduced support for unmapping entire
> lazyfree anonymous large folios at once, instead of one page at a time.
> This patch extends that support to generic (non-lazyfree) anonymous
> large folios.
> 
> Handling __folio_try_share_anon_rmap() and swap_duplicate() becomes
> extremely complex—if not outright impractical—for non-exclusive
> anonymous folios. As a result, this patch limits support to exclusive
> large folios. Fortunately, most anonymous folios are exclusive in
> practice, so this restriction should be acceptable in the majority of
> cases.
> 
> SPARC is currently the only architecture that implements
> arch_unmap_one(), which also needs to be batched for consistency.
> However, this is not yet supported, so the platform is excluded for
> now.
> 
> Using the following micro-benchmark to measure the time taken to perform
> PAGEOUT on 256MB of 64KiB anonymous large folios.
> 
>   #define _GNU_SOURCE
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <sys/mman.h>
>   #include <string.h>
>   #include <time.h>
>   #include <unistd.h>
>   #include <errno.h>
> 
>   #define SIZE_MB 256
>   #define SIZE_BYTES (SIZE_MB * 1024 * 1024)
> 
>   int main() {
>       void *addr = mmap(NULL, SIZE_BYTES, PROT_READ | PROT_WRITE,
>                         MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>       if (addr == MAP_FAILED) {
>           perror("mmap failed");
>           return 1;
>       }
> 
>       memset(addr, 0, SIZE_BYTES);
> 
>       struct timespec start, end;
>       clock_gettime(CLOCK_MONOTONIC, &start);
> 
>       if (madvise(addr, SIZE_BYTES, MADV_PAGEOUT) != 0) {
>           perror("madvise(MADV_PAGEOUT) failed");
>           munmap(addr, SIZE_BYTES);
>           return 1;
>       }
> 
>       clock_gettime(CLOCK_MONOTONIC, &end);
> 
>       long duration_ns = (end.tv_sec - start.tv_sec) * 1e9 +
>                          (end.tv_nsec - start.tv_nsec);
>       printf("madvise(MADV_PAGEOUT) took %ld ns (%.3f ms)\n",
>              duration_ns, duration_ns / 1e6);
> 
>       munmap(addr, SIZE_BYTES);
>       return 0;
>   }
> 
> w/o patch:
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 1337334000 ns (1337.334 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 1340471008 ns (1340.471 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 1385718992 ns (1385.719 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 1366070000 ns (1366.070 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 1347834992 ns (1347.835 ms)
> 
> w/patch:
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 698178000 ns (698.178 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 708570000 ns (708.570 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 693884000 ns (693.884 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 693366000 ns (693.366 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 690790000 ns (690.790 ms)
> 
> We found that the time to reclaim this memory was reduced by half.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Rik van Riel <riel@surriel.com>
> Cc: Harry Yoo <harry.yoo@oracle.com>
> Cc: Kairui Song <kasong@tencent.com>
> Cc: Chris Li <chrisl@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Dan Schatzberg <schatzberg.dan@gmail.com>
> Cc: Kaixiong Yu <yukaixiong@huawei.com>
> Cc: Fan Ni <fan.ni@samsung.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   include/linux/swap.h |  4 +--
>   mm/memory.c          |  2 +-
>   mm/rmap.c            | 79 +++++++++++++++++++++++++++++---------------
>   mm/swapfile.c        | 10 ++++--
>   4 files changed, 62 insertions(+), 33 deletions(-)
> 
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index bc0e1c275fc0..8fbb8ce72016 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -479,7 +479,7 @@ void put_swap_folio(struct folio *folio, swp_entry_t entry);
>   extern swp_entry_t get_swap_page_of_type(int);
>   extern int add_swap_count_continuation(swp_entry_t, gfp_t);
>   extern void swap_shmem_alloc(swp_entry_t, int);
> -extern int swap_duplicate(swp_entry_t);
> +extern int swap_duplicate(swp_entry_t, int nr);

Missed writing the parameter name here.

>   extern int swapcache_prepare(swp_entry_t entry, int nr);
>   extern void swap_free_nr(swp_entry_t entry, int nr_pages);
>   extern void free_swap_and_cache_nr(swp_entry_t entry, int nr);
> @@ -546,7 +546,7 @@ static inline void swap_shmem_alloc(swp_entry_t swp, int nr)
>   {
>   }
>   
> -static inline int swap_duplicate(swp_entry_t swp)
> +static inline int swap_duplicate(swp_entry_t swp, int nr)
>   {
>   	return 0;
>   }
> diff --git a/mm/memory.c b/mm/memory.c
> index 99af83434e7c..5a7e4c0e89c7 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -803,7 +803,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>   	swp_entry_t entry = pte_to_swp_entry(orig_pte);
>   
>   	if (likely(!non_swap_entry(entry))) {
> -		if (swap_duplicate(entry) < 0)
> +		if (swap_duplicate(entry, 1) < 0)
>   			return -EIO;
>   
>   		/* make sure dst_mm is on swapoff's mmlist. */
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fb63d9256f09..2607e02a0960 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1845,23 +1845,42 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>   #endif
>   }
>   
> -/* We support batch unmapping of PTEs for lazyfree large folios */
> +/*
> + * We support batch unmapping of PTEs for lazyfree or exclusive anon large
> + * folios
> + */
>   static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -			struct folio *folio, pte_t *ptep)
> +		struct folio *folio, pte_t *ptep, bool exclusive)
>   {
>   	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>   	int max_nr = folio_nr_pages(folio);
> +#ifndef __HAVE_ARCH_UNMAP_ONE
> +	bool no_arch_unmap = true;
> +#else
> +	bool no_arch_unmap = false;
> +#endif
>   	pte_t pte = ptep_get(ptep);
> +	int mapped_nr;
>   
> -	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> +	if (!folio_test_anon(folio))
>   		return false;
>   	if (pte_unused(pte))
>   		return false;
>   	if (pte_pfn(pte) != folio_pfn(folio))
>   		return false;
>   
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
> -			       NULL, NULL) == max_nr;
> +	mapped_nr = folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
> +			NULL, NULL);
> +	if (mapped_nr != max_nr)
> +		return false;
> +	if (!folio_test_swapbacked(folio))
> +		return true;
> +
> +	/*
> +	 * The large folio is fully mapped and its mapcount is the same as its
> +	 * number of pages, it must be exclusive.
> +	 */
> +	return no_arch_unmap && exclusive && folio_mapcount(folio) == max_nr;
>   }
>   
>   /*
> @@ -2025,7 +2044,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   				folio_mark_dirty(folio);
>   		} else if (likely(pte_present(pteval))) {
>   			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
> -			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
> +			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte,
> +			    anon_exclusive))
>   				nr_pages = folio_nr_pages(folio);
>   			end_addr = address + nr_pages * PAGE_SIZE;
>   			flush_cache_range(vma, address, end_addr);
> @@ -2141,8 +2161,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   				goto discard;
>   			}
>   
> -			if (swap_duplicate(entry) < 0) {
> -				set_pte_at(mm, address, pvmw.pte, pteval);
> +			if (swap_duplicate(entry, nr_pages) < 0) {
> +				set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
>   				goto walk_abort;
>   			}
>   
> @@ -2159,9 +2179,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   
>   			/* See folio_try_share_anon_rmap(): clear PTE first. */
>   			if (anon_exclusive &&
> -			    folio_try_share_anon_rmap_pte(folio, subpage)) {
> -				swap_free(entry);
> -				set_pte_at(mm, address, pvmw.pte, pteval);
> +			    __folio_try_share_anon_rmap(folio, subpage, nr_pages,
> +							RMAP_LEVEL_PTE)) {
> +				swap_free_nr(entry, nr_pages);
> +				set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
>   				goto walk_abort;
>   			}
>   			if (list_empty(&mm->mmlist)) {
> @@ -2170,23 +2191,27 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   					list_add(&mm->mmlist, &init_mm.mmlist);
>   				spin_unlock(&mmlist_lock);
>   			}
> -			dec_mm_counter(mm, MM_ANONPAGES);
> -			inc_mm_counter(mm, MM_SWAPENTS);
> -			swp_pte = swp_entry_to_pte(entry);
> -			if (anon_exclusive)
> -				swp_pte = pte_swp_mkexclusive(swp_pte);
> -			if (likely(pte_present(pteval))) {
> -				if (pte_soft_dirty(pteval))
> -					swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -				if (pte_uffd_wp(pteval))
> -					swp_pte = pte_swp_mkuffd_wp(swp_pte);
> -			} else {
> -				if (pte_swp_soft_dirty(pteval))
> -					swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -				if (pte_swp_uffd_wp(pteval))
> -					swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			add_mm_counter(mm, MM_ANONPAGES, -nr_pages);
> +			add_mm_counter(mm, MM_SWAPENTS, nr_pages);
> +			/* TODO: let set_ptes() support swp_offset advance */
> +			for (pte_t *ptep = pvmw.pte; address < end_addr;
> +			     entry.val++, address += PAGE_SIZE, ptep++) {
> +				swp_pte = swp_entry_to_pte(entry);
> +				if (anon_exclusive)
> +					swp_pte = pte_swp_mkexclusive(swp_pte);
> +				if (likely(pte_present(pteval))) {
> +					if (pte_soft_dirty(pteval))
> +						swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +					if (pte_uffd_wp(pteval))
> +						swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +				} else {
> +					if (pte_swp_soft_dirty(pteval))
> +						swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +					if (pte_swp_uffd_wp(pteval))
> +						swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +				}
> +				set_pte_at(mm, address, ptep, swp_pte);
>   			}
> -			set_pte_at(mm, address, pvmw.pte, swp_pte);
>   		} else {
>   			/*
>   			 * This is a locked file-backed folio,
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 026090bf3efe..189e3474ffc6 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3550,13 +3550,17 @@ static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
>   
>   	offset = swp_offset(entry);
>   	VM_WARN_ON(nr > SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER);
> -	VM_WARN_ON(usage == 1 && nr > 1);
>   	ci = lock_cluster(si, offset);
>   
>   	err = 0;
>   	for (i = 0; i < nr; i++) {
>   		count = si->swap_map[offset + i];
>   
> +		/*
> +		 * We only support batched swap_duplicate() for unmapping
> +		 * exclusive large folios where count should be zero
> +		 */
> +		VM_WARN_ON(usage == 1 && nr > 1 && swap_count(count));
>   		/*
>   		 * swapin_readahead() doesn't check if a swap entry is valid, so the
>   		 * swap entry could be SWAP_MAP_BAD. Check here with lock held.
> @@ -3626,11 +3630,11 @@ void swap_shmem_alloc(swp_entry_t entry, int nr)
>    * if __swap_duplicate() fails for another reason (-EINVAL or -ENOENT), which
>    * might occur if a page table entry has got corrupted.
>    */
> -int swap_duplicate(swp_entry_t entry)
> +int swap_duplicate(swp_entry_t entry, int nr)
>   {
>   	int err = 0;
>   
> -	while (!err && __swap_duplicate(entry, 1, 1) == -ENOMEM)
> +	while (!err && __swap_duplicate(entry, 1, nr) == -ENOMEM)
>   		err = add_swap_count_continuation(entry, GFP_ATOMIC);
>   	return err;
>   }

