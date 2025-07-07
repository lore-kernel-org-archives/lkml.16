Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C0428C01A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874824; cv=none; b=tXq45YZqXCbpyAcJDYmrrjjxO5hhUGIq6z4SZhcAA5tiCGFtQP1jnD4Rl4s7/IT0SIP1bzbdYhjOQ2CN5EyMrTv3Q/yhqmCHTCSn2p9b4rqj+10AtdGAWOWu+g7tFTaNIJtufuPGlwQohoccXqNq2VBIwn4S6cGbCjRASPaP29k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874824; c=relaxed/simple;
	bh=yW4lt3+nco7XStImQp1R9yncTsqNbuy0qQCxkxKGhdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJSyr5DAN6MVJ+TGQTFkGbOEr8+2lyytbpPgmlDYt4p8eJVeZysfFKOmV0+bk13lMSjljf6YCjdp3ZScvlNriaFBtKICe7QoDFtbJv6bFAs+hZI4ROJ4q3sNxjhxPPLkB8KfN+B/wursqpneVdEz3ThWcINMjJT0A3mOU02vvZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Lp5+v987; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Lp5+v987"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751874813; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=YZOzuZhRDmIXxtNY1Xnrb4GtMpbKizrBm60btrY1XIY=;
	b=Lp5+v987Xjj3xXnLBljMSBFGDnymS4LhAv7UIFvi86FEFNyervbdyiZ0bQ1J0C3pToRBT4fptikUVVe/6LE/3XcPtjRAtLTMOFQ0jqEwzBHltMuRfEf0+F9YQ6RkvZXSk8MC5QTQKOdzeJj+Di26xgZxwKFeY6JxbxfCdask9fk=
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wi33KdW_1751874811 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Jul 2025 15:53:31 +0800
Message-ID: <17d23ed0-3b12-42a5-a5de-994f570b1bca@linux.alibaba.com>
Date: Mon, 7 Jul 2025 15:53:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] mm/shmem, swap: avoid false positive swap cache
 lookup
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250704181748.63181-1-ryncsn@gmail.com>
 <20250704181748.63181-6-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250704181748.63181-6-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kairui,

On 2025/7/5 02:17, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> If a shmem read request's index points to the middle of a large swap
> entry, shmem swap in will try the swap cache lookup using the large
> swap entry's starting value (which is the first sub swap entry of this
> large entry).  This will lead to false positive lookup results, if only
> the first few swap entries are cached but the actual requested swap
> entry pointed by index is uncached. This is not a rare event as swap
> readahead always try to cache order 0 folios when possible.
> 
> Currently, shmem will do a large entry split when it occurs, aborts
> due to a mismatching folio swap value, then retry the swapin from
> the beginning, which is a waste of CPU and adds wrong info to
> the readahead statistics.
> 
> This can be optimized easily by doing the lookup using the right
> swap entry value.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/shmem.c | 31 +++++++++++++++----------------
>   1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 217264315842..2ab214e2771c 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2274,14 +2274,15 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   	pgoff_t offset;
>   
>   	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> -	swap = index_entry = radix_to_swp_entry(*foliop);
> +	index_entry = radix_to_swp_entry(*foliop);
> +	swap = index_entry;
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
> @@ -2293,6 +2294,12 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   		return -EEXIST;
>   	}
>   
> +	/* index may point to the middle of a large entry, get the sub entry */
> +	if (order) {
> +		offset = index - round_down(index, 1 << order);
> +		swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
> +	}
> +
>   	/* Look it up and read it in.. */
>   	folio = swap_cache_get_folio(swap, NULL, 0);

Please drop this patch, which will cause a swapin fault dead loop.

Assume an order-4 shmem folio has been swapped out, and the swap cache 
holds this order-4 folio (assuming index == 0, swap.val == 0x4000).

During swapin, if the index is 1, and the recalculation of the swap 
value here will result in 'swap.val == 0x4001'. This will cause the 
subsequent 'folio->swap.val != swap.val' check to fail, continuously 
triggering a dead-loop swapin fault, ultimately causing the CPU to hang.
