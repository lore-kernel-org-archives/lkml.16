Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043761FF603
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228043; cv=none; b=D2LSzZM4oy6T7c7SoI49c2isbChKsLXpFRrPN828MN9o2WBP56zMvZQHtQleW2P9uIGWVQp84z4+ls/TQFI7tYcY21AlNW77eE+Fm9OZ8xaaYKVwNtkkmjDv7WQ1TX+xrM9JmrmHeMPC+LHek+spaphZB9NHShZvaEXgS6xZyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228043; c=relaxed/simple;
	bh=WzLV0Wj+fzNHsRZqS9aAjxuy8h/ReG3Azt/4AMCaIdI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qTinpf7sLHXJjbvrIOZZBmqgp+e1X2ftUj1xF+N4+IKcZMIrinBsEmWKAanzSYrWed4qzRwUS0G5vfWN8GgB0c2jXqAh3f7XHfi/TUB3mTNlsledTC1D6qliqxRgqHnkUIVpUu8jIUMw32xw5aEabhGNN3frBewTM3hiz3/bswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bMYgP2PdhzKHMT7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:27:13 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id ABD981A0CD3
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:27:11 +0800 (CST)
Received: from [10.174.99.169] (unknown [10.174.99.169])
	by APP4 (Coremail) with SMTP id gCh0CgC3ZVo9XFJokUSBPw--.42356S2;
	Wed, 18 Jun 2025 14:27:11 +0800 (CST)
Subject: Re: [PATCH 3/4] mm/shmem, swap: improve mthp swapin process
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthew Wilcox <willy@infradead.org>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250617183503.10527-1-ryncsn@gmail.com>
 <20250617183503.10527-4-ryncsn@gmail.com>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <06bf5a2f-6687-dc24-cdb2-408faf413dd4@huaweicloud.com>
Date: Wed, 18 Jun 2025 14:27:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250617183503.10527-4-ryncsn@gmail.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgC3ZVo9XFJokUSBPw--.42356S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GF4rCr17AFW7Zr1xAFWrXwb_yoW7Zw1fpF
	y2gFn3tFykJry2kr42qw48trZ8W3yFqF1rJa43Cw13Z3ZxJw12kry8Jw18AFyUC34DAay0
	qF47Jryq93Z8taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
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
> Tidy up the mTHP swapin workflow. There should be no feature change, but
> consolidates the mTHP related check to one place so they are now all
> wrapped by CONFIG_TRANSPARENT_HUGEPAGE, and will be trimmed off by
> compiler if not needed.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/shmem.c | 175 ++++++++++++++++++++++++-----------------------------
>  1 file changed, 78 insertions(+), 97 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 0ad49e57f736..46dea2fa1b43 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c

...

> @@ -2283,110 +2306,66 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>  	/* Look it up and read it in.. */
>  	folio = swap_cache_get_folio(swap, NULL, 0);
>  	if (!folio) {
> -		int nr_pages = 1 << order;
> -		bool fallback_order0 = false;
> -
>  		/* Or update major stats only when swapin succeeds?? */
>  		if (fault_type) {
>  			*fault_type |= VM_FAULT_MAJOR;
>  			count_vm_event(PGMAJFAULT);
>  			count_memcg_event_mm(fault_mm, PGMAJFAULT);
>  		}
> -
> -		/*
> -		 * If uffd is active for the vma, we need per-page fault
> -		 * fidelity to maintain the uffd semantics, then fallback
> -		 * to swapin order-0 folio, as well as for zswap case.
> -		 * Any existing sub folio in the swap cache also blocks
> -		 * mTHP swapin.
> -		 */
> -		if (order > 0 && ((vma && unlikely(userfaultfd_armed(vma))) ||
> -				  !zswap_never_enabled() ||
> -				  non_swapcache_batch(swap, nr_pages) != nr_pages))
> -			fallback_order0 = true;
> -
> -		/* Skip swapcache for synchronous device. */
> -		if (!fallback_order0 && data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
> -			folio = shmem_swap_alloc_folio(inode, vma, index, swap, order, gfp);
> +		/* Try direct mTHP swapin bypassing swap cache and readahead */
> +		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
> +			swap_order = order;
> +			folio = shmem_swapin_direct(inode, vma, index,
> +						    swap, &swap_order, gfp);
>  			if (!IS_ERR(folio)) {
>  				skip_swapcache = true;
>  				goto alloced;
>  			}
> -
> -			/*
> -			 * Fallback to swapin order-0 folio unless the swap entry
> -			 * already exists.
> -			 */
> +			/* Fallback if order > 0 swapin failed with -ENOMEM */
>  			error = PTR_ERR(folio);
>  			folio = NULL;
> -			if (error == -EEXIST)
> +			if (error != -ENOMEM || !swap_order)
>  				goto failed;
>  		}
> -
>  		/*
> -		 * Now swap device can only swap in order 0 folio, then we
> -		 * should split the large swap entry stored in the pagecache
> -		 * if necessary.
> +		 * Try order 0 swapin using swap cache and readahead, it still
> +		 * may return order > 0 folio due to raced swap cache.
>  		 */
> -		split_order = shmem_split_large_entry(inode, index, swap, gfp);
> -		if (split_order < 0) {
> -			error = split_order;
> -			goto failed;
> -		}
> -
> -		/*
> -		 * If the large swap entry has already been split, it is
> -		 * necessary to recalculate the new swap entry based on
> -		 * the old order alignment.
> -		 */
> -		if (split_order > 0) {
> -			pgoff_t offset = index - round_down(index, 1 << split_order);
> -
> -			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
> -		}
> -
For fallback order 0, we always call shmem_swapin_cluster() before but we will call
shmem_swap_alloc_folio() now. It seems fine to me. Just point this out for others
to recheck this.
> -		/* Here we actually start the io */
>  		folio = shmem_swapin_cluster(swap, gfp, info, index);
>  		if (!folio) {
>  			error = -ENOMEM;
>  			goto failed;
>  		}
> -	} else if (order > folio_order(folio)) {
> -		/*
> -		 * Swap readahead may swap in order 0 folios into swapcache
> -		 * asynchronously, while the shmem mapping can still stores
> -		 * large swap entries. In such cases, we should split the
> -		 * large swap entry to prevent possible data corruption.
> -		 */
> -		split_order = shmem_split_large_entry(inode, index, swap, gfp);
> -		if (split_order < 0) {
> -			folio_put(folio);
> -			folio = NULL;
> -			error = split_order;
> -			goto failed;
> -		}
> -
> -		/*
> -		 * If the large swap entry has already been split, it is
> -		 * necessary to recalculate the new swap entry based on
> -		 * the old order alignment.
> -		 */
> -		if (split_order > 0) {
> -			pgoff_t offset = index - round_down(index, 1 << split_order);
> -
> -			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
> -		}
> -	} else if (order < folio_order(folio)) {
> -		swap.val = round_down(swp_type(swap), folio_order(folio));
>  	}
> -
>  alloced:
> +	/*
> +	 * We need to split an existing large entry if swapin brought in a
> +	 * smaller folio due to various of reasons.
> +	 *
> +	 * And worth noting there is a special case: if there is a smaller
> +	 * cached folio that covers @swap, but not @index (it only covers
> +	 * first few sub entries of the large entry, but @index points to
> +	 * later parts), the swap cache lookup will still see this folio,
> +	 * And we need to split the large entry here. Later checks will fail,
> +	 * as it can't satisfy the swap requirement, and we will retry
> +	 * the swapin from beginning.
> +	 */
> +	swap_order = folio_order(folio);
> +	if (order > swap_order) {
> +		error = shmem_split_swap_entry(inode, index, swap, gfp);
> +		if (error)
> +			goto failed_nolock;
> +	}
> +
> +	index = round_down(index, 1 << swap_order);
> +	swap.val = round_down(swap.val, 1 << swap_order);
> +
If swap entry order is reduced but index and value keep unchange,
the shmem_split_swap_entry() will split the reduced large swap entry
successfully but index and swap.val will be incorrect beacuse of wrong
swap_order. We can catch unexpected order and swap entry in
shmem_add_to_page_cache() and will retry the swapin, but this will
introduce extra cost.
If we return order of entry which is splited in shmem_split_swap_entry()
and update index and swap.val with returned order, we can avoid the extra
cost for mentioned racy case.

