Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552D523C51E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834001; cv=none; b=iSNVwUXZffaUYe2AMaaCRywXnIQ4wXODMcAj7sxTmcy9TNXgS+Q85M9Zjfu/6WY2k2R4P7pnAVmy2i3eKmGf6adIiP5gHb1zkMr/vOL+lM+1g/DNobteP8zDb/iCyGF23WMjLxq3ekT+llWcNxAVrSUrAB7o0F40Pjh29Uxc+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834001; c=relaxed/simple;
	bh=pxe+KSylDXYywY4D/hg4cTjXIkAtLSV0sYlD5wTnk0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIHc2JAbAI4TJlThN3HfeMJ5IxJiRRjQsoX89DkqE4b+6fjYLklQL8cWGKovqjxhG3wweV46/Lm+NpvJSCfkbopWMD8rMel+CDV39vXE30a7tLUWa+6YRiDIudFN2GLlmMlwM6d6Yck/MwG/OZDFzI+I5OIWZ655nw7i9B51qNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 779981515;
	Wed, 21 May 2025 06:26:24 -0700 (PDT)
Received: from [10.57.94.227] (unknown [10.57.94.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7897E3F5A1;
	Wed, 21 May 2025 06:26:34 -0700 (PDT)
Message-ID: <b3064b82-dcea-4b88-940b-9419d869a39a@arm.com>
Date: Wed, 21 May 2025 14:26:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] mm: Optimize mprotect() by PTE batching
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-4-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250519074824.42909-4-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2025 08:48, Dev Jain wrote:
> Use folio_pte_batch to batch process a large folio. Reuse the folio from prot_numa
> case if possible. Since modify_prot_start_ptes() gathers access/dirty bits,
> it lets us batch around pte_needs_flush() (for parisc, the definition includes
> the access bit).

parisc's pte_needs_flush() is a different (static) function, just coincidentally 
named - it takes different arguments.

But powerpc and x86 both specialize it and they consider the dirty bit. Both 
implementations look to me like they will function correctly but it is a bit 
ugly. They both conclude that if there is no change or if dirty has gone from 
clear to set, then no flush is needed. (flush only needed when dirty goes from 
set to clear). Given after your change, oldpte may have dirty set when it wasn't 
really set for the pte in question that means the function could detect no 
change when really its a clear -> set change; it gives the same answer in both 
cases so it's safe. Perhaps a bit fragile though...

> For all cases other than the PageAnonExclusive case, if the case holds true
> for one pte in the batch, one can confirm that that case will hold true for
> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty and access bits
> across the batch, therefore batching across pte_dirty(): this is correct since
> the dirty bit on the PTE really is just an indication that the folio got written
> to, so even if the PTE is not actually dirty (but one of the PTEs in the batch is),
> the wp-fault optimization can be made.
> The crux now is how to batch around the PageAnonExclusive case; we must check
> the corresponding condition for every single page. Therefore, from the large
> folio batch, we process sub batches of ptes mapping pages with the same PageAnonExclusive
> condition, and process that sub batch, then determine and process the next sub batch,
> and so on. Note that this does not cause any extra overhead; if suppose the size of
> the folio batch is 512, then the sub batch processing in total will take 512 iterations,
> which is the same as what we would have done before.

This commit log could do with some reformatting; blank lines between paragraphs 
and break at whatever the usual git commit log char limit is (72 chars?).

> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/mm.h |   7 ++-
>  mm/mprotect.c      | 126 +++++++++++++++++++++++++++++++++++----------
>  2 files changed, 104 insertions(+), 29 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 43748c8f3454..7d5b96f005dc 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2542,8 +2542,11 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
>  #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
>  					    MM_CP_UFFD_WP_RESOLVE)
>  
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> -			     pte_t pte);
> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
> +			     pte_t pte, int max_len, int *len);
> +#define can_change_pte_writable(vma, addr, pte)	\
> +	can_change_ptes_writable(vma, addr, pte, 1, NULL)

nit: add an extra tab for readability:

#define can_change_pte_writable(vma, addr, pte)	\
		can_change_ptes_writable(vma, addr, pte, 1, NULL)

> +
>  extern long change_protection(struct mmu_gather *tlb,
>  			      struct vm_area_struct *vma, unsigned long start,
>  			      unsigned long end, unsigned long cp_flags);
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 124612ce3d24..6cd8cdc168fa 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -40,25 +40,36 @@
>  
>  #include "internal.h"
>  
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> -			     pte_t pte)
> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
> +			     pte_t pte, int max_len, int *len)
>  {
>  	struct page *page;
> +	bool temp_ret;
> +	bool ret;
> +	int i;
>  
> -	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
> -		return false;
> +	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE))) {
> +		ret = false;
> +		goto out;
> +	}
>  
>  	/* Don't touch entries that are not even readable. */
> -	if (pte_protnone(pte))
> -		return false;
> +	if (pte_protnone(pte)) {
> +		ret = false;
> +		goto out;
> +	}
>  
>  	/* Do we need write faults for softdirty tracking? */
> -	if (pte_needs_soft_dirty_wp(vma, pte))
> -		return false;
> +	if (pte_needs_soft_dirty_wp(vma, pte)) {
> +		ret = false;
> +		goto out;
> +	}
>  
>  	/* Do we need write faults for uffd-wp tracking? */
> -	if (userfaultfd_pte_wp(vma, pte))
> -		return false;
> +	if (userfaultfd_pte_wp(vma, pte)) {
> +		ret = false;
> +		goto out;
> +	}
>  
>  	if (!(vma->vm_flags & VM_SHARED)) {
>  		/*
> @@ -68,7 +79,19 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>  		 * any additional checks while holding the PT lock.
>  		 */
>  		page = vm_normal_page(vma, addr, pte);
> -		return page && PageAnon(page) && PageAnonExclusive(page);
> +		ret = (page && PageAnon(page) && PageAnonExclusive(page));
> +		if (!len)
> +			return ret;
> +
> +		/* Check how many consecutive pages are AnonExclusive or not */
> +		for (i = 1; i < max_len; ++i) {
> +			++page;
> +			temp_ret = (page && PageAnon(page) && PageAnonExclusive(page));
> +			if (temp_ret != ret)
> +				break;
> +		}
> +		*len = i;
> +		return ret;
>  	}
>  
>  	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
> @@ -80,21 +103,55 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>  	 * FS was already notified and we can simply mark the PTE writable
>  	 * just like the write-fault handler would do.
>  	 */
> -	return pte_dirty(pte);
> +	ret = pte_dirty(pte);
> +
> +out:
> +	/* The entire batch is guaranteed to have the same return value */
> +	if (len)
> +		*len = max_len;
> +	return ret;
>  }
>  
>  static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,
> -		pte_t pte, int max_nr_ptes)
> +		pte_t pte, int max_nr_ptes, bool ignore_soft_dirty)

We'll almost certainly want more flags here in future. I wonder if it's cleaner 
just to pass "fpb_t extra_flags" here instead of the bool, then OR them in. You 
can pass 0 or FPB_IGNORE_SOFT_DIRTY at your 2 callsites. No strong opinion 
though.

>  {
> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	fpb_t flags = FPB_IGNORE_DIRTY;
>  
> -	if (!folio_test_large(folio) || (max_nr_ptes == 1))
> +	if (ignore_soft_dirty)
> +		flags |= FPB_IGNORE_SOFT_DIRTY;
> +
> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>  		return 1;
>  
>  	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>  			       NULL, NULL, NULL);
>  }
>  
> +/**
> + * modify_sub_batch - Identifies a sub-batch which has the same return value
> + * of can_change_pte_writable(), from within a folio batch. max_len is the
> + * max length of the possible sub-batch. sub_batch_idx is the offset from
> + * the start of the original folio batch.
> + */
> +static int modify_sub_batch(struct vm_area_struct *vma, struct mmu_gather *tlb,
> +		unsigned long addr, pte_t *ptep, pte_t oldpte, pte_t ptent,
> +		int max_len, int sub_batch_idx)
> +{
> +	unsigned long new_addr = addr + sub_batch_idx * PAGE_SIZE;
> +	pte_t new_oldpte = pte_advance_pfn(oldpte, sub_batch_idx);
> +	pte_t new_ptent = pte_advance_pfn(ptent, sub_batch_idx);
> +	pte_t *new_ptep = ptep + sub_batch_idx;
> +	int len = 1;
> +
> +	if (can_change_ptes_writable(vma, new_addr, new_ptent, max_len, &len))
> +		new_ptent = pte_mkwrite(new_ptent, vma);
> +
> +	modify_prot_commit_ptes(vma, new_addr, new_ptep, new_oldpte, new_ptent, len);
> +	if (pte_needs_flush(new_oldpte, new_ptent))
> +		tlb_flush_pte_range(tlb, new_addr, len * PAGE_SIZE);
> +	return len;
> +}
> +
>  static long change_pte_range(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
> @@ -106,7 +163,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>  	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>  	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
> -	int nr_ptes;
> +	int sub_batch_idx, max_len, len, nr_ptes;
>  
>  	tlb_change_page_size(tlb, PAGE_SIZE);
>  	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> @@ -121,10 +178,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>  	do {
> +		sub_batch_idx = 0;
>  		nr_ptes = 1;
>  		oldpte = ptep_get(pte);
>  		if (pte_present(oldpte)) {
>  			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
> +			struct folio *folio = NULL;
>  			pte_t ptent;
>  
>  			/*
> @@ -132,7 +191,6 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			 * pages. See similar comment in change_huge_pmd.
>  			 */
>  			if (prot_numa) {
> -				struct folio *folio;
>  				int nid;
>  				bool toptier;
>  
> @@ -180,7 +238,8 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				    toptier) {
>  skip_batch:
>  					nr_ptes = mprotect_batch(folio, addr, pte,
> -								 oldpte, max_nr_ptes);
> +								 oldpte, max_nr_ptes,
> +								 true);
>  					continue;
>  				}
>  				if (folio_use_access_time(folio))
> @@ -188,6 +247,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>  						jiffies_to_msecs(jiffies));
>  			}
>  
> +			if (!folio)
> +				folio = vm_normal_folio(vma, addr, oldpte);
> +
> +			nr_ptes = mprotect_batch(folio, addr, pte, oldpte,
> +						 max_nr_ptes, false);
>  			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>  			ptent = pte_modify(oldpte, newprot);
>  
> @@ -209,15 +273,23 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			 * example, if a PTE is already dirty and no other
>  			 * COW or special handling is required.
>  			 */
> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> -			    !pte_write(ptent) &&

Don't you need to keep the !pte_write(ptent) condition here? No need to sub-
batch if write is already set.

> -			    can_change_pte_writable(vma, addr, ptent))
> -				ptent = pte_mkwrite(ptent, vma);
> -
> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
> -			if (pte_needs_flush(oldpte, ptent))
> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
> -			pages++;
> +			if (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) {
> +				max_len = nr_ptes;
> +				while (sub_batch_idx < nr_ptes) {
> +
> +					/* Get length of sub batch */
> +					len = modify_sub_batch(vma, tlb, addr, pte,
> +							       oldpte, ptent, max_len,
> +							       sub_batch_idx);
> +					sub_batch_idx += len;
> +					max_len -= len;
> +				}
> +			} else {
> +				modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
> +				if (pte_needs_flush(oldpte, ptent))
> +					tlb_flush_pte_range(tlb, addr, nr_ptes * PAGE_SIZE);
> +			}

This if/else block and modify_sub_block() is all pretty ugly. I wonder if 
something like this would be neater:

			use_sub_batch = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) && 
					!pte_write(ptent) && 
					LIKE_can_change_pte_writable(vma, addr, ptent, folio);

			while (nr_ptes) {
				if (use_sub_batch)
					sub_nr_ptes = sub_batch(...);
				else
					sub_nr_ptes = nr_ptes;

				modify_prot_commit_ptes(vma, addr, pte, oldpte, 
							ptent, sub_nr_ptes);
				if (pte_needs_flush(oldpte, ptent))
					tlb_flush_pte_range(tlb, addr,
						sub_nr_ptes * PAGE_SIZE);

				addr += sub_nr_ptes * PAGE_SIZE;
				pte += sub_nr_ptes;
				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
				nr_ptes -= sub_nr_ptes;
				pages += sub_nr_ptes;
			}

Where:

 - LIKE_can_change_pte_writable() is similar to can_change_pte_writable() but
   does everything except checking the per-page exclusive flag. Note that we
   already have the folio so can pass that rather than calling vm_normal_page()
   again.

 - sub_batch() can be passed the folio and the index of the first page within
   the folio and the max number of pages to check (nr_ptes). Then returns the
   number of pages where exclusive flag is the same.

Obviously they both need better names...

Thanks,
Ryan


> +			pages += nr_ptes;
>  		} else if (is_swap_pte(oldpte)) {
>  			swp_entry_t entry = pte_to_swp_entry(oldpte);
>  			pte_t newpte;

