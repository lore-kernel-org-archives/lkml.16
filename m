Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7981FDD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268125; cv=none; b=CaXR9ABMt8t1T/YkCCZNlvPbhWr9WJik0U5gEtnDrJ0+JbcG9StgPrLFG5/bxdEokiZWYs+5TU+m3dU6gAHnODd8dYKSHbI44M8hY8FxeyILHUB+SChmbzJnk/JixbaFEMYrHovzC9fOuWNgsymxEFglvKcbjt3Pk1wLtG8/w80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268125; c=relaxed/simple;
	bh=QQkBTqCn3fiGgJfyo0xFKA5m9KMjAbCLMpN5tDOYp7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nfyMTtKdZhxKncM9YWrMMVlHdRNwleVymKm1oct2p7qi1zQ31PmXlCIkH4kJtCM7uhPc/9giYrjUwpx60w27CLHhMl0ZdU8dXOJdfbzgi6V3WFL1SRi6WQnXLh2RdDlpIOFfzFcsjn5hXPMc+WBNUGGdtEN/ZLDvOWsoa94p7cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=wdIM7kB3; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="wdIM7kB3"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751268120; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=19m9ySZV/UYUd6rfS9gQ02pLAwrWjqGoPGuMgpPsrv4=;
	b=wdIM7kB3qSpgKA5pd4ah1m4QAXGTXDDfvG/Q1+10nMD0E5ocrnXBw4wrCQUVT6yUwMNliocp8kuYQbsLyZ04oVuJhAzxvYRFmmphNU+gidRVTJd2FunmkvZRo34MxBk5ddzwM4vIgsqSv/c1zvhK8i3LuS4Oon18vYIxAF+yFkI=
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wg5v-l4_1751268118 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Jun 2025 15:21:58 +0800
Message-ID: <b3e15124-f29a-4c73-b26e-184553b9137e@linux.alibaba.com>
Date: Mon, 30 Jun 2025 15:21:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] mm/shmem, swap: avoid false positive swap cache
 lookup
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250627062020.534-1-ryncsn@gmail.com>
 <20250627062020.534-8-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250627062020.534-8-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/27 14:20, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> If the shmem read request's index points to the middle of a large swap
> entry, shmem swap in does the swap cache lookup use the large swap entry's
> starting value (the first sub swap entry of this large entry).  

Right.

This will
> lead to false positive lookup result if only the first few swap entries
> are cached, but the requested swap entry pointed by index is uncached.
> 
> Currently shmem will do a large entry split then retry the swapin from
> beginning, which is a waste of CPU and fragile.  Handle this correctly.

Sorry, I did not get you here. Only when the 'order' (get from 
shmem_confirm_swap()) is not equal to folio_order(), will it trigger the 
large swap entry split. Could you describe the issue in more detail?

I also found a false positive swap-in in your patch 4, seems they are 
related?

> Also add some sanity checks to help understand the code and ensure things
> won't go wrong.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/shmem.c | 60 +++++++++++++++++++++++++++++-------------------------
>   1 file changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index ea9a105ded5d..9341c51c3d10 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1977,14 +1977,19 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
>   
>   static struct folio *shmem_swapin_direct(struct inode *inode,
>   		struct vm_area_struct *vma, pgoff_t index,
> -		swp_entry_t entry, int order, gfp_t gfp)
> +		swp_entry_t index_entry, swp_entry_t swap,
> +		int order, gfp_t gfp)
>   {
>   	struct shmem_inode_info *info = SHMEM_I(inode);
> -	int nr_pages = 1 << order;
>   	struct folio *new;
> -	pgoff_t offset;
> +	swp_entry_t entry;
>   	gfp_t swap_gfp;
>   	void *shadow;
> +	int nr_pages;
> +
> +	/* Prefer aligned THP swapin */
> +	entry.val = index_entry.val;
> +	nr_pages = 1 << order;
>   
>   	/*
>   	 * We have arrived here because our zones are constrained, so don't
> @@ -2011,6 +2016,7 @@ static struct folio *shmem_swapin_direct(struct inode *inode,
>   			swap_gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
>   		}
>   	}
> +
>   retry:
>   	new = shmem_alloc_folio(swap_gfp, order, info, index);
>   	if (!new) {
> @@ -2056,11 +2062,10 @@ static struct folio *shmem_swapin_direct(struct inode *inode,
>   	if (!order)
>   		return new;
>   	/* High order swapin failed, fallback to order 0 and retry */
> -	order = 0;
> -	nr_pages = 1;
> +	entry.val = swap.val;
>   	swap_gfp = gfp;
> -	offset = index - round_down(index, nr_pages);
> -	entry = swp_entry(swp_type(entry), swp_offset(entry) + offset);
> +	nr_pages = 1;
> +	order = 0;
>   	goto retry;
>   }
>   
> @@ -2288,20 +2293,21 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   	struct mm_struct *fault_mm = vma ? vma->vm_mm : NULL;
>   	struct shmem_inode_info *info = SHMEM_I(inode);
>   	int error, nr_pages, order, swap_order;
> +	swp_entry_t swap, index_entry;
>   	struct swap_info_struct *si;
>   	struct folio *folio = NULL;
>   	bool skip_swapcache = false;
> -	swp_entry_t swap;
> +	pgoff_t offset;
>   
>   	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> -	swap = radix_to_swp_entry(*foliop);
> +	index_entry = radix_to_swp_entry(*foliop);
>   	*foliop = NULL;
>   
> -	if (is_poisoned_swp_entry(swap))
> +	if (is_poisoned_swp_entry(index_entry))
>   		return -EIO;
>   
> -	si = get_swap_device(swap);
> -	order = shmem_confirm_swap(mapping, index, swap);
> +	si = get_swap_device(index_entry);
> +	order = shmem_confirm_swap(mapping, index, index_entry);
>   	if (unlikely(!si)) {
>   		if (order < 0)
>   			return -EEXIST;
> @@ -2313,13 +2319,15 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   		return -EEXIST;
>   	}
>   
> -	/* Look it up and read it in.. */
> +	/* @index may points to the middle of a large entry, get the real swap value first */
> +	offset = index - round_down(index, 1 << order);
> +	swap.val = index_entry.val + offset;
>   	folio = swap_cache_get_folio(swap, NULL, 0);
>   	if (!folio) {
>   		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
>   			/* Direct mTHP swapin without swap cache or readahead */
>   			folio = shmem_swapin_direct(inode, vma, index,
> -						    swap, order, gfp);
> +						    index_entry, swap, order, gfp);
>   			if (IS_ERR(folio)) {
>   				error = PTR_ERR(folio);
>   				folio = NULL;
> @@ -2341,28 +2349,25 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   			count_memcg_event_mm(fault_mm, PGMAJFAULT);
>   		}
>   	}
> +
> +	swap_order = folio_order(folio);
> +	nr_pages = folio_nr_pages(folio);
> +	/* The swap-in should cover both @swap and @index */
> +	swap.val = round_down(swap.val, nr_pages);
> +	VM_WARN_ON_ONCE(swap.val > index_entry.val + offset);
> +	VM_WARN_ON_ONCE(swap.val + nr_pages <= index_entry.val + offset);
> +
>   	/*
>   	 * We need to split an existing large entry if swapin brought in a
>   	 * smaller folio due to various of reasons.
> -	 *
> -	 * And worth noting there is a special case: if there is a smaller
> -	 * cached folio that covers @swap, but not @index (it only covers
> -	 * first few sub entries of the large entry, but @index points to
> -	 * later parts), the swap cache lookup will still see this folio,
> -	 * And we need to split the large entry here. Later checks will fail,
> -	 * as it can't satisfy the swap requirement, and we will retry
> -	 * the swapin from beginning.
>   	 */
> -	swap_order = folio_order(folio);
> +	index = round_down(index, nr_pages);
>   	if (order > swap_order) {
> -		error = shmem_split_swap_entry(inode, index, swap, gfp);
> +		error = shmem_split_swap_entry(inode, index, index_entry, gfp);
>   		if (error)
>   			goto failed_nolock;
>   	}
>   
> -	index = round_down(index, 1 << swap_order);
> -	swap.val = round_down(swap.val, 1 << swap_order);
> -
>   	/* We have to do this with folio locked to prevent races */
>   	folio_lock(folio);
>   	if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
> @@ -2375,7 +2380,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   		goto failed;
>   	}
>   	folio_wait_writeback(folio);
> -	nr_pages = folio_nr_pages(folio);
>   
>   	/*
>   	 * Some architectures may have to restore extra metadata to the

