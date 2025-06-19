Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9F32111
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750296516; cv=none; b=ahK9GtfNywk3MHX/f2c6okyJ36JTogjWUbOT1WjXK7obP/7co54ug2qaFWN6UVi2NvyqexZjZgQDCb2F9wwZeR3rP4R2fLGymwUuBdO2og2BM64qCkRoz9KyNZ4j49qkwQojSdNRdVqbX62qhGq69nfC4SvIgwQL5DVf7sgWh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750296516; c=relaxed/simple;
	bh=1V4qR39x/0CxD2Dcftke53i6oounT8H/FbUAW/LpriM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ESxh3I5SgIYTQfV/SgqtOONEIfCan5CeyuH1d5i+BE1E4F4iijnp/mWwG1GxA1pPx5a3pTTD/czUyz09Oi5wlLPxPjyNkVfuyYK/m7MzRHnViyt3NSM+Iz8FYV50LNKgDrrfpqdTPUr5EQMPfLp+eqsJYXoQFYbbGD385PpgKTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bN30G6Nz2zYQvcV
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:28:30 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id D072A1A0AD2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:28:29 +0800 (CST)
Received: from [10.174.99.169] (unknown [10.174.99.169])
	by APP3 (Coremail) with SMTP id _Ch0CgCHJ8K8Z1NoCAraPg--.14009S2;
	Thu, 19 Jun 2025 09:28:29 +0800 (CST)
Subject: Re: [PATCH 4/4] mm/shmem, swap: avoid false positive swap cache
 lookup
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthew Wilcox <willy@infradead.org>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250617183503.10527-1-ryncsn@gmail.com>
 <20250617183503.10527-5-ryncsn@gmail.com>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <a9a2e167-1617-7f7c-22ed-f949afcbe656@huaweicloud.com>
Date: Thu, 19 Jun 2025 09:28:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250617183503.10527-5-ryncsn@gmail.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_Ch0CgCHJ8K8Z1NoCAraPg--.14009S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFyDXF18uF47WF4ktw4fZrb_yoWxtrWrpF
	WagFs3JFW8XrWxCw4xta1DZrya93yFgF48JFy3Cw4fA3Zxt340kF1UJ347AFyUCrykC3yI
	qF47Kr98ua1qqrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUF1v3UUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 6/18/2025 2:35 AM, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> If the shmem read request's index points to the middle of a large swap
> entry, shmem swap in does the swap cache lookup use the large swap
> entry's starting value (the first sub swap entry of this large entry).
> This will lead to false positive lookup result if only the first few
> swap entries are cached, but the requested swap entry pointed by index
> is uncached.
> 
> Currently shmem will do a large entry split then retry the swapin from
> beginning, which is a waste of CPU and fragile. Handle this correctly.
> 
> Also add some sanity checks to help understand the code and ensure
> things won't go wrong.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/shmem.c | 61 ++++++++++++++++++++++++++----------------------------
>  1 file changed, 29 insertions(+), 32 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 46dea2fa1b43..0bc30dafad90 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1977,12 +1977,12 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
>  
>  static struct folio *shmem_swapin_direct(struct inode *inode,
>  		struct vm_area_struct *vma, pgoff_t index,
> -		swp_entry_t entry, int *order, gfp_t gfp)
> +		swp_entry_t swap_entry, swp_entry_t swap,
> +		int *order, gfp_t gfp)
>  {
>  	struct shmem_inode_info *info = SHMEM_I(inode);
>  	int nr_pages = 1 << *order;
>  	struct folio *new;
> -	pgoff_t offset;
>  	void *shadow;
>  
>  	/*
> @@ -2003,13 +2003,11 @@ static struct folio *shmem_swapin_direct(struct inode *inode,
>  		 */
>  		if ((vma && userfaultfd_armed(vma)) ||
>  		    !zswap_never_enabled() ||
> -		    non_swapcache_batch(entry, nr_pages) != nr_pages) {
> -			offset = index - round_down(index, nr_pages);
> -			entry = swp_entry(swp_type(entry),
> -					  swp_offset(entry) + offset);
> +		    non_swapcache_batch(swap_entry, nr_pages) != nr_pages) {
>  			*order = 0;
>  			nr_pages = 1;
>  		} else {
> +			swap.val = swap_entry.val;
>  			gfp_t huge_gfp = vma_thp_gfp_mask(vma);
>  
>  			gfp = limit_gfp_mask(huge_gfp, gfp);
> @@ -2021,7 +2019,7 @@ static struct folio *shmem_swapin_direct(struct inode *inode,
>  		return ERR_PTR(-ENOMEM);
>  
>  	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
> -					   gfp, entry)) {
> +					   gfp, swap)) {
>  		folio_put(new);
>  		return ERR_PTR(-ENOMEM);
>  	}
> @@ -2036,17 +2034,17 @@ static struct folio *shmem_swapin_direct(struct inode *inode,
>  	 * In this case, shmem_add_to_page_cache() will help identify the
>  	 * concurrent swapin and return -EEXIST.
>  	 */
> -	if (swapcache_prepare(entry, nr_pages)) {
> +	if (swapcache_prepare(swap, nr_pages)) {
>  		folio_put(new);
>  		return ERR_PTR(-EEXIST);
>  	}
>  
>  	__folio_set_locked(new);
>  	__folio_set_swapbacked(new);
> -	new->swap = entry;
> +	new->swap = swap;
>  
> -	memcg1_swapin(entry, nr_pages);
> -	shadow = get_shadow_from_swap_cache(entry);
> +	memcg1_swapin(swap, nr_pages);
> +	shadow = get_shadow_from_swap_cache(swap);
>  	if (shadow)
>  		workingset_refault(new, shadow);
>  	folio_add_lru(new);
> @@ -2278,20 +2276,21 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>  	struct mm_struct *fault_mm = vma ? vma->vm_mm : NULL;
>  	struct shmem_inode_info *info = SHMEM_I(inode);
>  	int error, nr_pages, order, swap_order;
> +	swp_entry_t swap, swap_entry;
>  	struct swap_info_struct *si;
>  	struct folio *folio = NULL;
>  	bool skip_swapcache = false;
> -	swp_entry_t swap;
> +	pgoff_t offset;
>  
>  	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> -	swap = radix_to_swp_entry(*foliop);
> +	swap_entry = radix_to_swp_entry(*foliop);
>  	*foliop = NULL;
>  
> -	if (is_poisoned_swp_entry(swap))
> +	if (is_poisoned_swp_entry(swap_entry))
>  		return -EIO;
>  
> -	si = get_swap_device(swap);
> -	order = shmem_swap_check_entry(mapping, index, swap);
> +	si = get_swap_device(swap_entry);
> +	order = shmem_swap_check_entry(mapping, index, swap_entry);
>  	if (unlikely(!si)) {
>  		if (order < 0)
>  			return -EEXIST;
> @@ -2303,7 +2302,9 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>  		return -EEXIST;
>  	}
>  
> -	/* Look it up and read it in.. */
> +	/* @index may points to the middle of a large entry, get the real swap value first */
> +	offset = index - round_down(index, 1 << order);
> +	swap.val = swap_entry.val + offset;
>  	folio = swap_cache_get_folio(swap, NULL, 0);
>  	if (!folio) {
>  		/* Or update major stats only when swapin succeeds?? */
> @@ -2315,7 +2316,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>  		/* Try direct mTHP swapin bypassing swap cache and readahead */
>  		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
>  			swap_order = order;
> -			folio = shmem_swapin_direct(inode, vma, index,
> +			folio = shmem_swapin_direct(inode, vma, index, swap_entry,
>  						    swap, &swap_order, gfp);
>  			if (!IS_ERR(folio)) {
>  				skip_swapcache = true;
> @@ -2338,28 +2339,25 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>  		}
>  	}
>  alloced:
> +	swap_order = folio_order(folio);
> +	nr_pages = folio_nr_pages(folio);
> +
> +	/* The swap-in should cover both @swap and @index */
> +	swap.val = round_down(swap.val, nr_pages);
> +	VM_WARN_ON_ONCE(swap.val > swap_entry.val + offset);
> +	VM_WARN_ON_ONCE(swap.val + nr_pages <= swap_entry.val + offset);> +
>  	/*
>  	 * We need to split an existing large entry if swapin brought in a
>  	 * smaller folio due to various of reasons.
> -	 *
> -	 * And worth noting there is a special case: if there is a smaller
> -	 * cached folio that covers @swap, but not @index (it only covers
> -	 * first few sub entries of the large entry, but @index points to
> -	 * later parts), the swap cache lookup will still see this folio,
> -	 * And we need to split the large entry here. Later checks will fail,
> -	 * as it can't satisfy the swap requirement, and we will retry
> -	 * the swapin from beginning.
>  	 */
> -	swap_order = folio_order(folio);
> +	index = round_down(index, nr_pages);
>  	if (order > swap_order) {
> -		error = shmem_split_swap_entry(inode, index, swap, gfp);
> +		error = shmem_split_swap_entry(inode, index, swap_entry, gfp);
>  		if (error)
>  			goto failed_nolock;
>  	}
>  
> -	index = round_down(index, 1 << swap_order);
> -	swap.val = round_down(swap.val, 1 << swap_order);
> -
>  	/* We have to do this with folio locked to prevent races */
>  	folio_lock(folio);
>  	if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
> @@ -2372,7 +2370,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>  		goto failed;
>  	}
>  	folio_wait_writeback(folio);
> -	nr_pages = folio_nr_pages(folio);
>  
>  	/*
>  	 * Some architectures may have to restore extra metadata to the
> 
The patch look good to me, just some small suggestion.
I think the name "swap" and "swap_entry" is not good enough. Maybe something
like "index_entry" and "align_entry" will be more clean.
Besides we pass "swap" and "order" already, we can calculate swap_entry easily
and the code will be more easy to understand.
Not a big deal anyway, so:
Reviewed-by: Kemeng Shi <shikemeng@huaweicloud.com>

