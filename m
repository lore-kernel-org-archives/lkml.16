Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0BC195FE8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688617; cv=none; b=bWnRXK+P/Xp34JwwRthc2JzIPbuW6J8L7iA/e1BHrTXBiSKTEqOExwDR9OqGnKsd3SotkRL5L6CmN+nuGkyhYQK27AmWYjfndiqq+KzDVNehWo+DgShaF9gFGfe+DMpJ/4nTy39XnzVH/zqmhtnnRRPrDzNq6DqEkTWClOy+u4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688617; c=relaxed/simple;
	bh=5znAwNEjUxb9R+3/37XSy3080i0Uwe89td6C9yxqzAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W76NHKiRbXzvIYxxIDATpRZxPN3x4XPqpCBY+dlVF5bXg+iAfi+KaPozY0ZG6/3cctfdEbR3K1QTkl2DLUaYepv43Tw3OV9K/bQHZ27iaGWOhiUsNrtT7ONVXwPP/N9Ttw9k5M4gzYB+vsckEaEBVPOysRZZZ+NhZVlvag2bsXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60FBD106F;
	Thu,  8 May 2025 00:16:44 -0700 (PDT)
Received: from [10.163.54.182] (unknown [10.163.54.182])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC9A53F673;
	Thu,  8 May 2025 00:16:45 -0700 (PDT)
Message-ID: <f8c21905-a03a-4e4b-b897-71beb6b8b393@arm.com>
Date: Thu, 8 May 2025 12:46:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-3-dev.jain@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250507060256.78278-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 11:32, Dev Jain wrote:
> To use PTE batching, we want to determine whether the folio mapped by
> the PTE is large, thus requiring the use of vm_normal_folio(). We want
> to avoid the cost of vm_normal_folio() if the code path doesn't already
> require the folio. For arm64, pte_batch_hint() does the job. To generalize
> this hint, add a helper which will determine whether two consecutive PTEs
> point to consecutive PFNs, in which case there is a high probability that
> the underlying folio is large.
> Next, use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> are painted with the contig bit, then ptep_get() will iterate through all 16
> entries to collect a/d bits. Hence this optimization will result in a 16x
> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> will eventually call contpte_try_unfold() on every contig block, thus
> flushing the TLB for the complete large folio range. Instead, use
> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> do them on the starting and ending contig block.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>  mm/mremap.c             | 37 ++++++++++++++++++++++++++++++-------
>  2 files changed, 59 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b50447ef1c92..38dab1f562ed 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>  }
>  #endif
>  
> +/**
> + * maybe_contiguous_pte_pfns - Hint whether the page mapped by the pte belongs
> + * to a large folio.
> + * @ptep: Pointer to the page table entry.
> + * @pte: The page table entry.
> + *
> + * This helper is invoked when the caller wants to batch over a set of ptes
> + * mapping a large folio, but the concerned code path does not already have
> + * the folio. We want to avoid the cost of vm_normal_folio() only to find that
> + * the underlying folio was small; i.e keep the small folio case as fast as
> + * possible.
> + *
> + * The caller must ensure that ptep + 1 exists.
> + */
> +static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
> +{
> +	pte_t *next_ptep, next_pte;
> +
> +	if (pte_batch_hint(ptep, pte) != 1)
> +		return true;
> +
> +	next_ptep = ptep + 1;
> +	next_pte = ptep_get(next_ptep);
> +	if (!pte_present(next_pte))
> +		return false;
> +
> +	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == 1);
> +}
> +
>  #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
>  static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
>  					    unsigned long address,
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 0163e02e5aa8..9c88a276bec4 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>  	return pte;
>  }
>  
> +/* mremap a batch of PTEs mapping the same large folio */
> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> +		pte_t *ptep, pte_t pte, int max_nr)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	struct folio *folio;
> +	int nr = 1;

A small nit - s/nr/nr_pages ?

> +
> +	if ((max_nr != 1) && maybe_contiguous_pte_pfns(ptep, pte)) {

Like mentioned earlier in v1, could maybe_contiguous_pte_pfns() here
add some additional cost for buffers that are actually not mapped to
contig physical pages.

The test case you have mentioned in the cover demonstrating performance
gains might have always been run just after boot, thus increasing the
probability of contiguous physical mapping, which will not be the case
on fragmented memory systems. In that case the proposed consecutive PFN
comparison will always happen unconditionally without any benefit ?

Just curious.

From V1

--------------------------------------------------------------------
maybe_contiguous_pte_pfns() cost will be applicable for memory
areas greater than a single PAGE_SIZE (i.e max_nr != 1) ? This
helper extracts an additional consecutive pte, ensures that it
is valid mapped and extracts pfn before comparing for the span.

There is some cost associated with the above code sequence which
looks justified for sequential access of memory buffers that has
consecutive physical memory backing. But what happens when such
buffers are less probable, will those buffers take a performance
hit for all the comparisons that just turn out to be negative ?
--------------------------------------------------------------------

> +		folio = vm_normal_folio(vma, addr, pte);
> +		if (folio && folio_test_large(folio))
> +			nr = folio_pte_batch(folio, addr, ptep, pte, max_nr,
> +					     flags, NULL, NULL, NULL);
> +	}
> +	return nr;
> +}
> +
>  static int move_ptes(struct pagetable_move_control *pmc,
>  		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>  {
> @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>  	struct mm_struct *mm = vma->vm_mm;
>  	pte_t *old_ptep, *new_ptep;
> -	pte_t pte;
> +	pte_t old_pte, pte;
>  	pmd_t dummy_pmdval;
>  	spinlock_t *old_ptl, *new_ptl;
>  	bool force_flush = false;
> @@ -186,6 +203,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	unsigned long old_end = old_addr + extent;
>  	unsigned long len = old_end - old_addr;
>  	int err = 0;
> +	int max_nr;

A small nit - s/max_nr/max_nr_pages ?

>  
>  	/*
>  	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
> @@ -236,12 +254,13 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>  
> -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> -				   new_ptep++, new_addr += PAGE_SIZE) {
> -		if (pte_none(ptep_get(old_ptep)))
> +	for (int nr = 1; old_addr < old_end; old_ptep += nr, old_addr += nr * PAGE_SIZE,
> +				   new_ptep += nr, new_addr += nr * PAGE_SIZE) {


> +		max_nr = (old_end - old_addr) >> PAGE_SHIFT;
> +		old_pte = ptep_get(old_ptep);
> +		if (pte_none(old_pte))
>  			continue;
>  
> -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>  		/*
>  		 * If we are remapping a valid PTE, make sure
>  		 * to flush TLB before we drop the PTL for the
> @@ -253,8 +272,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		 * the TLB entry for the old mapping has been
>  		 * flushed.
>  		 */
> -		if (pte_present(pte))
> +		if (pte_present(old_pte)) {
> +			nr = mremap_folio_pte_batch(vma, old_addr, old_ptep,
> +						    old_pte, max_nr);
>  			force_flush = true;
> +		}
> +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, 0);
>  		pte = move_pte(pte, old_addr, new_addr);
>  		pte = move_soft_dirty_pte(pte);
>  
> @@ -267,7 +290,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  				else if (is_swap_pte(pte))
>  					pte = pte_swp_clear_uffd_wp(pte);
>  			}
> -			set_pte_at(mm, new_addr, new_ptep, pte);
> +			set_ptes(mm, new_addr, new_ptep, pte, nr);
>  		}
>  	}
>  
