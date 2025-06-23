Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E41DFDAB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660810; cv=none; b=eCNNYKy5dr9RgJMzwWgBAV1MKtbwoeSPy33pLNFftQqR8jZGapvKxREcUSnhfdCEG8cJ9KXa0EYfxJX0pVdDGEoxMCGPKiQE0XECwKHpA7x0vAyi3LI8KC4DjlJzhW8kmNgLv3JvSCXl/zfEHByKTJB1vqw05I7oP33PtxrJfAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660810; c=relaxed/simple;
	bh=v8pnIGYUJZcCyt23VdAnkPtpVzj4nuPrqSdxAzDymw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aipdROndlmV2focLNC3eqNkFs40uE6aR19QrsdN4UtzQPye6liPBozV2Qicp46bYmSPE5ilB03E6NNgiJAaGn7KDXfX6K9fvQU3PfRANu4nmYYoc8Uie7MOndPgwQwEiJtGStcmyRBwJoYlSJpuB/0kKyDzMhxQxOnoX5tDT/ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=YCwjOfnJ; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="YCwjOfnJ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750660802; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=txxf/mEmvb0hGWCrZrJmfpM7BlC/+NU8hdUWgKz3uC8=;
	b=YCwjOfnJCm4f99AWfvt3UfY2IGVVdIx71yhNrAL0Bph3bYZNx15w5Fj0lwyxajl2ZisaUAufIoUwiFezzajMp7XF35TBCyVHI/l6bBLe+n7RS4tBpfMAGO7oLvE/67BjWB3sjYd9ftv65e2qLj+SG/s1KXOXrRlaSzpNeNGdsaI=
Received: from 30.74.144.128(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeU45O2_1750660801 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 23 Jun 2025 14:40:02 +0800
Message-ID: <d2aee3d9-d3a9-4c69-ad03-8e5774d12dab@linux.alibaba.com>
Date: Mon, 23 Jun 2025 14:40:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize collapse_pte_mapped_thp() for large
 folios by PTE batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250618155608.18580-1-dev.jain@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250618155608.18580-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/18 23:56, Dev Jain wrote:
> Use PTE batching to optimize collapse_pte_mapped_thp().
> 
> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
> Then, calling ptep_clear() for every pte will cause a TLB flush for every
> contpte block. Instead, clear_full_ptes() does a
> contpte_try_unfold_partial() which will flush the TLB only for the (if any)
> starting and ending contpte block, if they partially overlap with the range
> khugepaged is looking at.
> 
> For all arches, there should be a benefit due to batching atomic operations
> on mapcounts due to folio_remove_rmap_ptes().
> 
> Note that we do not need to make a change to the check
> "if (folio_page(folio, i) != page)"; if i'th page of the folio is equal
> to the first page of our batch, then i + 1, .... i + nr_batch_ptes - 1
> pages of the folio will be equal to the corresponding pages of our
> batch mapping consecutive pages.
> 
> No issues were observed with mm-selftests.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> 
> This is rebased on:
> https://lore.kernel.org/all/20250618102607.10551-1-dev.jain@arm.com/
> If there will be a v2 of either version I'll send them together.
> 
>   mm/khugepaged.c | 38 +++++++++++++++++++++++++-------------
>   1 file changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 649ccb2670f8..7d37058eda5b 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>   int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>   			    bool install_pmd)
>   {
> +	int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
>   	struct mmu_notifier_range range;
>   	bool notified = false;
>   	unsigned long haddr = addr & HPAGE_PMD_MASK;
> +	unsigned long end = haddr + HPAGE_PMD_SIZE;
>   	struct vm_area_struct *vma = vma_lookup(mm, haddr);
>   	struct folio *folio;
>   	pte_t *start_pte, *pte;
>   	pmd_t *pmd, pgt_pmd;
>   	spinlock_t *pml = NULL, *ptl;
> -	int nr_ptes = 0, result = SCAN_FAIL;
>   	int i;
>   
>   	mmap_assert_locked(mm);
> @@ -1620,12 +1621,17 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>   	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>   		goto abort;
>   
> +	i = 0, addr = haddr, pte = start_pte;
>   	/* step 2: clear page table and adjust rmap */
> -	for (i = 0, addr = haddr, pte = start_pte;
> -	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
> +	do {
> +		const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +		int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
> +		struct folio *this_folio;
>   		struct page *page;
>   		pte_t ptent = ptep_get(pte);
>   
> +		nr_batch_ptes = 1;
> +
>   		if (pte_none(ptent))
>   			continue;
>   		/*
> @@ -1639,6 +1645,11 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>   			goto abort;
>   		}
>   		page = vm_normal_page(vma, addr, ptent);
> +		this_folio = page_folio(page);
> +		if (folio_test_large(this_folio) && max_nr_batch_ptes != 1)
> +			nr_batch_ptes = folio_pte_batch(this_folio, addr, pte, ptent,
> +					max_nr_batch_ptes, flags, NULL, NULL, NULL);
> +
>   		if (folio_page(folio, i) != page)
>   			goto abort;

IMO, 'this_folio' is always equal 'folio', right? Can't we just use 'folio'?

In addition, I think the folio_test_large() and max_nr_batch_ptes checks 
are redundant, since the 'folio' must be PMD-sized large folio after 
'folio_page(folio, i) != page' check.

So I think we can move the 'nr_batch_ptes' calculation after the 
folio_page() check, then shoule be:

nr_batch_ptes = folio_pte_batch(folio, addr, pte, ptent,
			max_nr_batch_ptes, flags, NULL, NULL, NULL);

> @@ -1647,18 +1658,19 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>   		 * TLB flush can be left until pmdp_collapse_flush() does it.
>   		 * PTE dirty? Shmem page is already dirty; file is read-only.
>   		 */
> -		ptep_clear(mm, addr, pte);
> -		folio_remove_rmap_pte(folio, page, vma);
> -		nr_ptes++;
> -	}
> +		clear_full_ptes(mm, addr, pte, nr_batch_ptes, false);
> +		folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
> +		nr_mapped_ptes += nr_batch_ptes;
> +	} while (i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
> +		 pte += nr_batch_ptes, i < HPAGE_PMD_NR);
>   
>   	if (!pml)
>   		spin_unlock(ptl);
>   
>   	/* step 3: set proper refcount and mm_counters. */
> -	if (nr_ptes) {
> -		folio_ref_sub(folio, nr_ptes);
> -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
> +	if (nr_mapped_ptes) {
> +		folio_ref_sub(folio, nr_mapped_ptes);
> +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>   	}
>   
>   	/* step 4: remove empty page table */
> @@ -1691,10 +1703,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>   			: SCAN_SUCCEED;
>   	goto drop_folio;
>   abort:
> -	if (nr_ptes) {
> +	if (nr_mapped_ptes) {
>   		flush_tlb_mm(mm);
> -		folio_ref_sub(folio, nr_ptes);
> -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
> +		folio_ref_sub(folio, nr_mapped_ptes);
> +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>   	}
>   unlock:
>   	if (start_pte)

