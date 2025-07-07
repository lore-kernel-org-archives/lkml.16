Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAEE288530
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875552; cv=none; b=AKUteDe/GQq35D6toahOzNfGNCU1gCn9fElEtaTr5ROAHZEXRR9DG1cRCBXb/M4kcGBzmbnw5t7JxfCBgo8ZM6ckgbYw33c+m2HbCfXd1qa2NfyfnXRqg3BjCjDmE49ctWz96uSjB4r8LpC31KdiirJ081NnOg5xg4pJUrnfqIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875552; c=relaxed/simple;
	bh=zVS4eUUXEyCGzEMd4nwd8vgnioEF2O+BO0GVlZ++aBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfUFHYMtbQ8mci6RtlbTJF2lzl0H4cwNCfXF5qxdgEG29svRhWWrgMKaGcvsh5vAT5Fi8mR4SdY+aIqIRY2GgPMHMGuQjNdRe2rnBsTNfcKDeaOODFDJ3CMVi5MnG/+7XQWZKoRCO40PV3069da1f3obR7EHYcNiYsn7zYPwSHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ncEG1NsO; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ncEG1NsO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751875542; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=3Pzd5KEVdO94fQQ2PxE2ZqO2v+Merdc/BNYLsIfYkjo=;
	b=ncEG1NsO1SGsZd/xo6CmR8LgLeicRQOrpumbmYjv14vJx7RQSc7d1QnyHV95QnLTWUOP8edfT6wVqpdaMtlICBN10HCTETGsTFWDx0a5tP/b2eBe6aGP+afUEGzWhVv1eN9ZHndqlEgjHInvbQ4GvRZ+0pEK4kKCJy57a1e9cvs=
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wi3WIrV_1751875540 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Jul 2025 16:05:40 +0800
Message-ID: <2b1c5548-bf66-4d4a-a379-d9c6bf35283c@linux.alibaba.com>
Date: Mon, 7 Jul 2025 16:05:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] mm/shmem, swap: never use swap cache and readahead
 for SWP_SYNCHRONOUS_IO
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250704181748.63181-1-ryncsn@gmail.com>
 <20250704181748.63181-7-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250704181748.63181-7-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/7/5 02:17, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Currently if a THP swapin failed due to reasons like partially
> conflicting swap cache or ZSWAP enabled, it will fallback to
> cached swapin.
> 
> Right now the swap cache still has a non-trivial overhead, and readahead
> is not helpful for SWP_SYNCHRONOUS_IO devices, so we should always skip
> the readahead and swap cache even if the swapin falls back to order 0.
> 
> So handle the fallback logic without falling back to the cached read.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/shmem.c | 55 +++++++++++++++++++++++++++++++++++-------------------
>   1 file changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 2ab214e2771c..1fe9a3eb92b1 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1975,13 +1975,16 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
>   	return ERR_PTR(error);
>   }
>   
> -static struct folio *shmem_swap_alloc_folio(struct inode *inode,
> +static struct folio *shmem_swapin_direct(struct inode *inode,
>   		struct vm_area_struct *vma, pgoff_t index,
> -		swp_entry_t entry, int order, gfp_t gfp)
> +		swp_entry_t swap, swp_entry_t index_entry,

IMO, 'swap' and 'index_entry' are confusing, and it's easy to be unclear 
about their roles. I suggest only passing the original swap value. If it 
falls back to order 0, the swap value can be recalculated, which is more 
readable as well as maintaining the independence of the function.

> +		int order, gfp_t gfp)
>   {
>   	struct shmem_inode_info *info = SHMEM_I(inode);
> +	swp_entry_t entry = index_entry;
>   	int nr_pages = 1 << order;
>   	struct folio *new;
> +	gfp_t alloc_gfp;
>   	void *shadow;
>   
>   	/*
> @@ -1989,6 +1992,7 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
>   	 * limit chance of success with further cpuset and node constraints.
>   	 */
>   	gfp &= ~GFP_CONSTRAINT_MASK;
> +	alloc_gfp = gfp;
>   	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>   		if (WARN_ON_ONCE(order))
>   			return ERR_PTR(-EINVAL);
> @@ -2003,19 +2007,22 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
>   		if ((vma && unlikely(userfaultfd_armed(vma))) ||
>   		     !zswap_never_enabled() ||
>   		     non_swapcache_batch(entry, nr_pages) != nr_pages)
> -			return ERR_PTR(-EINVAL);
> +			goto fallback;
>   
> -		gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
> +		alloc_gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
> +	}
> +retry:
> +	new = shmem_alloc_folio(alloc_gfp, order, info, index);
> +	if (!new) {
> +		new = ERR_PTR(-ENOMEM);
> +		goto fallback;
>   	}
> -
> -	new = shmem_alloc_folio(gfp, order, info, index);
> -	if (!new)
> -		return ERR_PTR(-ENOMEM);
>   
>   	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
> -					   gfp, entry)) {
> +					   alloc_gfp, entry)) {
>   		folio_put(new);
> -		return ERR_PTR(-ENOMEM);
> +		new = ERR_PTR(-ENOMEM);
> +		goto fallback;
>   	}
>   
>   	/*
> @@ -2030,7 +2037,9 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
>   	 */
>   	if (swapcache_prepare(entry, nr_pages)) {
>   		folio_put(new);
> -		return ERR_PTR(-EEXIST);
> +		new = ERR_PTR(-EEXIST);
> +		/* Try smaller folio to avoid cache conflict */
> +		goto fallback;
>   	}
>   
>   	__folio_set_locked(new);
> @@ -2044,6 +2053,15 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
>   	folio_add_lru(new);
>   	swap_read_folio(new, NULL);
>   	return new;
> +fallback:
> +	/* Order 0 swapin failed, nothing to fallback to, abort */
> +	if (!order)
> +		return new;
> +	order = 0;
> +	nr_pages = 1;
> +	alloc_gfp = gfp;
> +	entry = swap;
> +	goto retry;
>   }
>   
>   /*
> @@ -2309,25 +2327,24 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   			count_vm_event(PGMAJFAULT);
>   			count_memcg_event_mm(fault_mm, PGMAJFAULT);
>   		}
> -

Nit: do not add unnecessary change.

>   		/* Skip swapcache for synchronous device. */
>   		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
> -			folio = shmem_swap_alloc_folio(inode, vma, index,
> -						       index_entry, order, gfp);
> +			folio = shmem_swapin_direct(inode, vma, index, swap,
> +						    index_entry, order, gfp);
>   			if (!IS_ERR(folio)) {
> -				swap = index_entry;
> +				if (folio_test_large(folio))
> +					swap = index_entry;
>   				skip_swapcache = true;
>   				goto alloced;
>   			}
>   
>   			/*
> -			 * Fallback to swapin order-0 folio unless the swap entry
> -			 * already exists.
> +			 * Direct swapin handled order 0 fallback already,
> +			 * if it failed, abort.
>   			 */
>   			error = PTR_ERR(folio);
>   			folio = NULL;
> -			if (error == -EEXIST)
> -				goto failed;
> +			goto failed;
>   		}
>   		/* Cached swapin with readahead, only supports order 0 */
>   		folio = shmem_swapin_cluster(swap, gfp, info, index);

