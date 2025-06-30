Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC64A1BD01F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265271; cv=none; b=K5n8rjuNL9z7M+F1FS+xQHL1+cs/7Gpuk1nwfjcox0UOPuC4N+z0AVswr5zpNxkMgmlfjdgT3wF/W+jVWPCWjtvok0pmK8baLCW3L9N9NY9w4f47Godw2hgsmh0HQsJhzPi+GB/YeMHCepW+kVeGfd0yN3hLEPq1qqVXfrK7Fho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265271; c=relaxed/simple;
	bh=cbTLyHfex3c1DVCNdZ5woH8azzyaPNYFrGRBeDmoCwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvE59sI6ykarbigV38B1WkHDs/rey8K/uBQJMyorUNdK5wac5IR/sYPeZgwQ84O8CnrfDSi6/Ilw+qy7toovdvVzKAIfsLobuYxYptNg2i3R38VqsXzEflNOuxIhVID0OKBmqxzuvHB18sIguNwPHniZ2PN4a9p3+h0cBcJAFYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=wHoi08bn; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="wHoi08bn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751265262; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+954zuYfOBzQ/NN2RSgZxXJ7Xf4Vhhw6jCTTsBd8IuM=;
	b=wHoi08bnagsGgCsazOO7zopjcj1il4+xLjISWlqTGRDNhzMuHd4WPl8pEVRaf3Xv+92PtR3KeX6Z/AdNJIEsn3sTG7Kxj4U7LzucS3/fHuk1OvZOQkIph61Afklev4eoKUDHvk6CCuvzmkN4wdBGt1ULo++s9cjEmhvIxl9CuZI=
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wg5U5Yi_1751265260 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Jun 2025 14:34:21 +0800
Message-ID: <3d317ce9-2304-4361-adda-32abcc06e3dd@linux.alibaba.com>
Date: Mon, 30 Jun 2025 14:34:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] mm/shmem, swap: clean up swap entry splitting
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250627062020.534-1-ryncsn@gmail.com>
 <20250627062020.534-5-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250627062020.534-5-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/27 14:20, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Instead of keeping different paths of splitting the entry and
> recalculating the swap entry and index, do it in one place.
> 
> Whenever swapin brought in a folio smaller than the entry, split the
> entry. And always recalculate the entry and index, in case it might
> read in a folio that's larger than the entry order. This removes
> duplicated code and function calls, and makes the code more robust.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/shmem.c | 103 +++++++++++++++++++++--------------------------------
>   1 file changed, 41 insertions(+), 62 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index f85a985167c5..5be9c905396e 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2178,8 +2178,12 @@ static void shmem_set_folio_swapin_error(struct inode *inode, pgoff_t index,
>   	swap_free_nr(swap, nr_pages);
>   }
>   
> -static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
> -				   swp_entry_t swap, gfp_t gfp)
> +/*
> + * Split an existing large swap entry. @index should point to one sub mapping
> + * slot within the entry @swap, this sub slot will be split into order 0.
> + */
> +static int shmem_split_swap_entry(struct inode *inode, pgoff_t index,
> +				  swp_entry_t swap, gfp_t gfp)
>   {
>   	struct address_space *mapping = inode->i_mapping;
>   	XA_STATE_ORDER(xas, &mapping->i_pages, index, 0);
> @@ -2250,7 +2254,7 @@ static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
>   	if (xas_error(&xas))
>   		return xas_error(&xas);
>   
> -	return entry_order;
> +	return 0;
>   }
>   
>   /*
> @@ -2267,11 +2271,11 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   	struct address_space *mapping = inode->i_mapping;
>   	struct mm_struct *fault_mm = vma ? vma->vm_mm : NULL;
>   	struct shmem_inode_info *info = SHMEM_I(inode);
> +	int error, nr_pages, order, swap_order;
>   	struct swap_info_struct *si;
>   	struct folio *folio = NULL;
>   	bool skip_swapcache = false;
>   	swp_entry_t swap;
> -	int error, nr_pages, order, split_order;
>   
>   	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
>   	swap = radix_to_swp_entry(*foliop);
> @@ -2321,70 +2325,43 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   				goto failed;
>   		}
>   
> -		/*
> -		 * Now swap device can only swap in order 0 folio, then we
> -		 * should split the large swap entry stored in the pagecache
> -		 * if necessary.
> -		 */
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
>   		/* Here we actually start the io */
>   		folio = shmem_swapin_cluster(swap, gfp, info, index);
>   		if (!folio) {
>   			error = -ENOMEM;
>   			goto failed;
>   		}
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
> -		swap.val = round_down(swap.val, 1 << folio_order(folio));
>   	}
>   
>   alloced:
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

Nit: 'swap_order' is confusing, and can you just use folio_order() or a 
btter name?

> +	if (order > swap_order) {
> +		error = shmem_split_swap_entry(inode, index, swap, gfp);
> +		if (error)
> +			goto failed_nolock;
> +	}
> +
> +	index = round_down(index, 1 << swap_order);
> +	swap.val = round_down(swap.val, 1 << swap_order);

The round_down() of index and swap value here may cause 
shmem_add_to_page_cache() to fail to insert a new folio, because the 
swap value stored at that index in the shmem mapping does not match, 
leading to another swapin page fault for correction.

For example, shmem stores a large swap entry of order 4 in the range of 
index 0-64. When a swapin fault occurs at index = 3, with swap.val = 
0x4000, if a split happens and this round_down() logic is applied, then 
index = 3, swap.val = 0x4000. However, the actual swap.val should be 
0x4003 stored in the shmem mapping. This would cause another swapin fault.

I still prefer my original alignment method, and do you find this will 
cause any issues?

"
if (split_order > 0) {
	pgoff_t offset = index - round_down(index, 1 << split_order);

	swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
}
"

> +
>   	/* We have to do this with folio locked to prevent races */
>   	folio_lock(folio);
>   	if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
>   	    folio->swap.val != swap.val) {
>   		error = -EEXIST;
> -		goto unlock;
> +		goto failed_unlock;
>   	}
>   	if (!folio_test_uptodate(folio)) {
>   		error = -EIO;
> @@ -2405,8 +2382,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   			goto failed;
>   	}
>   
> -	error = shmem_add_to_page_cache(folio, mapping,
> -					round_down(index, nr_pages),
> +	error = shmem_add_to_page_cache(folio, mapping, index,
>   					swp_to_radix_entry(swap), gfp);
>   	if (error)
>   		goto failed;
> @@ -2417,8 +2393,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   		folio_mark_accessed(folio);
>   
>   	if (skip_swapcache) {
> +		swapcache_clear(si, folio->swap, folio_nr_pages(folio));
>   		folio->swap.val = 0;
> -		swapcache_clear(si, swap, nr_pages);
>   	} else {
>   		delete_from_swap_cache(folio);
>   	}
> @@ -2434,13 +2410,16 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   	if (error == -EIO)
>   		shmem_set_folio_swapin_error(inode, index, folio, swap,
>   					     skip_swapcache);
> -unlock:
> -	if (skip_swapcache)
> -		swapcache_clear(si, swap, folio_nr_pages(folio));
> -	if (folio) {
> +failed_unlock:
> +	if (folio)
>   		folio_unlock(folio);
> -		folio_put(folio);
> +failed_nolock:
> +	if (skip_swapcache) {
> +		swapcache_clear(si, folio->swap, folio_nr_pages(folio));
> +		folio->swap.val = 0;
>   	}
> +	if (folio)
> +		folio_put(folio);
>   	put_swap_device(si);
>   	return error;
>   }

