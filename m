Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505EC28C5D9
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301476; cv=none; b=og7dP8gAw7h4Oz6Nfl0F8SJQ6dJRtZQQ6FsJNCa8YxIxS2cdfEibNLlJZ0yrIRRmp2UqZ0qwvcleVjmxX6mjn7gH5AnBmlY9sNXsw+mOy6vptW8Zjqx8PZHUTwlpsD9VXnWQ3tUG6hhjy/T4oYsZ8RRK1guLw8U6JbmwY3tOFXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301476; c=relaxed/simple;
	bh=5tC3D5O8m/sVa2FOqWVu3lYA1t6/V1icBJOotZCCpWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcytQuAgjntXwM8IGCsnC5gSqBqS/p2H2TakHPNIVU83hRJQ8hlcNlJyfQQI+51bDZdaV4yZ7lv4p6NZmRtZ6dRmVJ/WE15H45yt2D9xNnAAnnaHJpuiId0xoLBtxYisXnhy8TC+XOkrevB0zqKlKrhjYE7NxHORZJ11UTvRn+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ls/Dcnhp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ls/Dcnhp"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54e7967cf67so728762e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747301472; x=1747906272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H+yp4Rs1RGpTtEKE1ruco0L8UqkFY0S2ulNF6Jl1CRU=;
        b=Ls/Dcnhp7oRVGZjj73Q7s18XJNeZiAtxN2uzcythpZ3p2k1PiSrnRiK9r6v2yg4on6
         JBLlZcEwX5K/LQ5QyJhd8DlPCYEEhO0GPYHcNwZB6EPb7w2nBPYox/o7YRj7ZIdT/OrN
         hdGSS5lwmu1yChiMiormFsVCnp63NSuG+0pkd9aIx1Wg9z2Hlea5ahwnjTGIyt9PlLPV
         jLN9L9QiukrNa416Ds/Gk8KhmhDK5Gdn2dlGI4V76RwoPm2y5iYTt6HRedEZpCidQe0G
         NMgQsj9bw/JFcY1l7yk2QB4YvkJZjK0K8lNxvfh7EOYw/Y/ws5QU7XehZYpXYS/5BPjx
         6pMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301472; x=1747906272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+yp4Rs1RGpTtEKE1ruco0L8UqkFY0S2ulNF6Jl1CRU=;
        b=p9uiddt7H2DLd509O7t6WbvQtWI9TDhiVj1Hxp3bInRse3v1ady/AIK2h5IFQvgLCH
         cCJUjKOo2qfwDBU8JHoeWfi0E3vzbN2fIvvJBRA1hFM3EAceqnIYRrzKqm+uMcUnf7Gt
         94jiQ8o2VGMqP0GVnIZS2f9DcHd2P9kbW1tTugG+L7PciRNjnF1N0BVoQfouw26BmL/l
         9QUEmqqCms2EpbPodb2mzMi9YIPMTyBS/LabIfTRgyFoODYO+GCiBE6I/Rs4FT8DECGt
         okP9xP/CdiFgSHimpon2+8BQ+yXvJs9yGhz3qrB6dFGLTR2Uw2LYWZO3eszwclJkzxex
         CoGA==
X-Forwarded-Encrypted: i=1; AJvYcCVm8XFveP8DeyWsrv/W3Ohcny0OGc4C65pc1inJezzkCpIDRxKVk8cmsKwUa1E3PCb2zu4B0QnQPpy4F+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUmrZGlJb1PO3opyr2rEUWsyorYRle1I3kuV0lCWf/rNeJQrO3
	VnLAN9Q3AZyClrAl1rCONkrEhkJf0gaSkQAlDxR1LW7camhCQyWC
X-Gm-Gg: ASbGncvF3TvsEeuENcDB57HjIreNgmYMM0Xsrz/ELVCT2DixYXLYM5owqio19kywiFp
	Ey4NAC3VBQdubSuTtOpnuPmryet7cpgczt5Givkhe5/Gq6K0Rx02hUVXca0WGMWE7xGatFG7RxC
	+zALCE5M6Wq1mLnb76AMmxmFX+HWnU4EEJsSv2VwzPjtHcbFdDabnYiPDcA3/VYKm0H0bFN6jhd
	t5+labAzKYvQ+62ZodE7g9dtnaJ4SEWS/+Mq1/teiieXKBdhaRSS6O+Sywq8zQ8VBncuWrcZ3Az
	hDHymgVRuDKdzf2ipeMMV0KxMZZnEfv0UzgcS6lS3TYcM5Tu8STyTyIP/FrRy9UPow==
X-Google-Smtp-Source: AGHT+IE6i83yVNZlqINw13SaGwTdHej02o+ZoOXkE+9oIBwKs6K8O7oWHQO69i0g2D3fwUc2Ma1IaA==
X-Received: by 2002:a05:6512:4614:b0:545:2837:17d0 with SMTP id 2adb3069b0e04-550d5f7c298mr2657153e87.12.1747301471874;
        Thu, 15 May 2025 02:31:11 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-54fc64cc24bsm2577513e87.215.2025.05.15.02.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 02:31:11 -0700 (PDT)
Date: Thu, 15 May 2025 11:31:10 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Yosry Ahmed <yosryahmed@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Kalesh Singh <kaleshsingh@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/28] mm, swap: clean up and consolidate helper for mTHP
 swapin check
Message-ID: <iqcrqzvoqt7dcmboh75u5g5cwgzaevlota3izpsfmaeotdnnzw@f7udsv2gghwa>
References: <20250514201729.48420-1-ryncsn@gmail.com>
 <20250514201729.48420-12-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514201729.48420-12-ryncsn@gmail.com>

Hi,

On 2025-05-15 04:17:11 +0800, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Move all mTHP swapin check into can_swapin_thp and use it for both pre
> IO check and post IO check. This way the code is more consolidated and
> make later commit easier to maintain.

From what I can see, can_swapin_thp is gated behind
CONFIG_TRANSPARENT_HUGEPAGE and this fails to build when it's not
enabled.

> 
> Also clean up the comments while at it. The current comment of
> non_swapcache_batch is not correct: swap in bypassing swap cache won't
> reach the swap device as long as the entry is cached, because it still
> sets the SWAP_HAS_CACHE flag. If the folio is already in swap cache, raced
> swap in will either fail due to -EEXIST with swapcache_prepare, or see the
> cached folio.
> 
> The real reason this non_swapcache_batch is needed is that if a smaller
> folio is in the swap cache but not mapped, mTHP swapin will be blocked
> forever as it won't see the folio due to index offset, nor it can set the
> SWAP_HAS_CACHE bit, so it has to fallback to order 0 swap in.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/memory.c | 90 ++++++++++++++++++++++++-----------------------------
>  1 file changed, 41 insertions(+), 49 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index f2897d9059f2..1b6e192de6ec 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4319,12 +4319,6 @@ static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
>  	pgoff_t offset = swp_offset(entry);
>  	int i;
>  
> -	/*
> -	 * While allocating a large folio and doing swap_read_folio, which is
> -	 * the case the being faulted pte doesn't have swapcache. We need to
> -	 * ensure all PTEs have no cache as well, otherwise, we might go to
> -	 * swap devices while the content is in swapcache.
> -	 */
>  	for (i = 0; i < max_nr; i++) {
>  		if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
>  			return i;

> @@ -4334,34 +4328,30 @@ static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
>  }
>  
>  /*
> - * Check if the PTEs within a range are contiguous swap entries
> - * and have consistent swapcache, zeromap.
> + * Check if the page table is still suitable for large folio swap in.
> + * @vmf: The fault triggering the swap-in.
> + * @ptep: Pointer to the PTE that should be the head of the swap in folio.
> + * @addr: The address corresponding to the PTE.
> + * @nr_pages: Number of pages of the folio that suppose to be swapped in.
>   */
> -static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep, int nr_pages)
> +static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep,
> +			   unsigned long addr, unsigned int nr_pages)
>  {
> -	unsigned long addr;
> -	swp_entry_t entry;
> -	int idx;
> -	pte_t pte;
> -
> -	addr = ALIGN_DOWN(vmf->address, nr_pages * PAGE_SIZE);
> -	idx = (vmf->address - addr) / PAGE_SIZE;
> -	pte = ptep_get(ptep);
> +	pte_t pte = ptep_get(ptep);
> +	unsigned long addr_end = addr + (PAGE_SIZE * nr_pages);
> +	unsigned long pte_offset = (vmf->address - addr) / PAGE_SIZE;
>  
> -	if (!pte_same(pte, pte_move_swp_offset(vmf->orig_pte, -idx)))
> +	VM_WARN_ON_ONCE(!IS_ALIGNED(addr, PAGE_SIZE) ||
> +			addr > vmf->address || addr_end <= vmf->address);
> +	if (unlikely(addr < max(addr & PMD_MASK, vmf->vma->vm_start) ||
> +		     addr_end > pmd_addr_end(addr, vmf->vma->vm_end)))
>  		return false;
> -	entry = pte_to_swp_entry(pte);
> -	if (swap_pte_batch(ptep, nr_pages, pte) != nr_pages)
> -		return false;
> -
>  	/*
> -	 * swap_read_folio() can't handle the case a large folio is hybridly
> -	 * from different backends. And they are likely corner cases. Similar
> -	 * things might be added once zswap support large folios.
> +	 * All swap entries must from the same swap device, in same
> +	 * cgroup, with same exclusiveness, only differs in offset.
>  	 */
> -	if (unlikely(swap_zeromap_batch(entry, nr_pages, NULL) != nr_pages))
> -		return false;
> -	if (unlikely(non_swapcache_batch(entry, nr_pages) != nr_pages))
> +	if (!pte_same(pte, pte_move_swp_offset(vmf->orig_pte, -pte_offset)) ||
> +	    swap_pte_batch(ptep, nr_pages, pte) != nr_pages)
>  		return false;
>  
>  	return true;
> @@ -4441,13 +4431,24 @@ static struct folio *alloc_swap_folio(struct vm_fault *vmf)
>  	 * completely swap entries with contiguous swap offsets.
>  	 */
>  	order = highest_order(orders);
> -	while (orders) {
> -		addr = ALIGN_DOWN(vmf->address, PAGE_SIZE << order);
> -		if (can_swapin_thp(vmf, pte + pte_index(addr), 1 << order))
> -			break;
> -		order = next_order(&orders, order);
> +	for (; orders; order = next_order(&orders, order)) {
> +		unsigned long nr_pages = 1 << order;
> +		swp_entry_t swap_entry = { .val = ALIGN_DOWN(entry.val, nr_pages) };
> +		addr = ALIGN_DOWN(vmf->address, nr_pages * PAGE_SIZE);
> +		if (!can_swapin_thp(vmf, pte + pte_index(addr), addr, nr_pages))
> +			continue;
> +		/*
> +		 * If there is already a smaller folio in cache, it will
> +		 * conflict with the larger folio in the swap cache layer
> +		 * and block the swap in.
> +		 */
> +		if (unlikely(non_swapcache_batch(swap_entry, nr_pages) != nr_pages))
> +			continue;
> +		/* Zero map doesn't work with large folio yet. */
> +		if (unlikely(swap_zeromap_batch(swap_entry, nr_pages, NULL) != nr_pages))
> +			continue;
> +		break;
>  	}
> -
>  	pte_unmap_unlock(pte, ptl);
>  
>  	/* Try allocating the highest of the remaining orders. */
> @@ -4731,27 +4732,18 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  	page_idx = 0;
>  	address = vmf->address;
>  	ptep = vmf->pte;
> +
>  	if (folio_test_large(folio) && folio_test_swapcache(folio)) {
> -		int nr = folio_nr_pages(folio);
> +		unsigned long nr = folio_nr_pages(folio);
>  		unsigned long idx = folio_page_idx(folio, page);
> -		unsigned long folio_start = address - idx * PAGE_SIZE;
> -		unsigned long folio_end = folio_start + nr * PAGE_SIZE;
> -		pte_t *folio_ptep;
> -		pte_t folio_pte;
> +		unsigned long folio_address = address - idx * PAGE_SIZE;
> +		pte_t *folio_ptep = vmf->pte - idx;
>  
> -		if (unlikely(folio_start < max(address & PMD_MASK, vma->vm_start)))
> -			goto check_folio;
> -		if (unlikely(folio_end > pmd_addr_end(address, vma->vm_end)))
> -			goto check_folio;
> -
> -		folio_ptep = vmf->pte - idx;
> -		folio_pte = ptep_get(folio_ptep);
> -		if (!pte_same(folio_pte, pte_move_swp_offset(vmf->orig_pte, -idx)) ||
> -		    swap_pte_batch(folio_ptep, nr, folio_pte) != nr)

> +		if (!can_swapin_thp(vmf, folio_ptep, folio_address, nr))
>  			goto check_folio;

At this point we're outside CONFIG_TRANSPARENT_HUGEPAGE.

>  
>  		page_idx = idx;
> -		address = folio_start;
> +		address = folio_address;
>  		ptep = folio_ptep;
>  		nr_pages = nr;
>  		entry = folio->swap;
> -- 
> 2.49.0
> 

Regards,
Klara Modin
