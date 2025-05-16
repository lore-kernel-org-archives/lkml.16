Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CC810E9
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747360877; cv=none; b=j5047jbgKWq665nemOVGZLS9/yLLdyZvle3K5MTqqssXrLu9MFRA+9ZNkYzcKbuvuzXQBYDEeQ2CbglQXOy29b/2ulQ4vMJBg94c6yTqBBYygdtjG0MWGGVFpE7YNlH+u93NR0jen1vvdH6k68cNnPAw7TaZ3h1BOwgQgD8IDrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747360877; c=relaxed/simple;
	bh=XlICSyhZtiC+lQ21ruBqJ8mrVe6Yhi//yEeTxQbjBR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JV/no5VPrHXztWGjfL6PetCC/+X9towSQTSdeeMZmp68C36kRGz/7rDZZdDX6xn1E+FaZULTLF/AWeAQySYnFZgC4TdzRJSbw3Yj6S21MOibqCEO+K2Zf671f8GmvVibotAZFazWviAanbyO925vZANF0/APuUXjNpJy6sIoMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=KS+Hy49G; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="KS+Hy49G"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747360866; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=iPc1PvF0dwxDqAYLnzz/0dGulbyEpLZhL6UsI7vwnVU=;
	b=KS+Hy49GYFEjDjnsg6hLyg6QrEeJAzjNzyNQGYGnCEx12VtvPh+5Rk3QU92ZCivXv/INGQEKN9WhXMiOC6poSgLD2V1716yHF6Z1Y482y89BiRe2s9OIq518D1I9Hhg+kb5/jgPIVUNNGPGIiCwHvNyNVvXnltLD3msUIeRzSQk=
Received: from 30.74.144.109(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WatJqau_1747360864 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 16 May 2025 10:01:05 +0800
Message-ID: <767f68f3-40c4-4112-bc25-1429899e26f9@linux.alibaba.com>
Date: Fri, 16 May 2025 10:01:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] mm/shmem: Fix potential dead loop in shmem_unuse()
To: Kemeng Shi <shikemeng@huaweicloud.com>, hughd@google.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250515154758.956521-1-shikemeng@huaweicloud.com>
 <20250515154758.956521-4-shikemeng@huaweicloud.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250515154758.956521-4-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/15 23:47, Kemeng Shi wrote:
> If multi shmem_unuse() for different swap type is called concurrently,
> a dead loop could occur as following:
> shmem_unuse(typeA)               shmem_unuse(typeB)
>   mutex_lock(&shmem_swaplist_mutex)
>   list_for_each_entry_safe(info, next, ...)
>    ...
>    mutex_unlock(&shmem_swaplist_mutex)
>    /* info->swapped may drop to 0 */
>    shmem_unuse_inode(&info->vfs_inode, type)
> 
>                                    mutex_lock(&shmem_swaplist_mutex)
>                                    list_for_each_entry(info, next, ...)
>                                     if (!info->swapped)
>                                      list_del_init(&info->swaplist)
> 
>                                    ...
>                                    mutex_unlock(&shmem_swaplist_mutex)
> 
>    mutex_lock(&shmem_swaplist_mutex)
>    /* iterate with offlist entry and encounter a dead loop */
>    next = list_next_entry(info, swaplist);
>    ...
> 
> Restart the iteration if the inode is already off shmem_swaplist list
> to fix the issue.
> 
> Fixes: b56a2d8af9147 ("mm: rid swapoff of quadratic complexity")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   mm/shmem.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 495e661eb8bb..aeeddf612baa 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1505,6 +1505,7 @@ int shmem_unuse(unsigned int type)
>   		return 0;
>   
>   	mutex_lock(&shmem_swaplist_mutex);
> +start_over:
>   	list_for_each_entry_safe(info, next, &shmem_swaplist, swaplist) {
>   		if (!info->swapped) {
>   			list_del_init(&info->swaplist);
> @@ -1523,13 +1524,15 @@ int shmem_unuse(unsigned int type)
>   		cond_resched();
>   
>   		mutex_lock(&shmem_swaplist_mutex);
> -		next = list_next_entry(info, swaplist);
> -		if (!info->swapped)
> -			list_del_init(&info->swaplist);
>   		if (atomic_dec_and_test(&info->stop_eviction))
>   			wake_up_var(&info->stop_eviction);
>   		if (error)
>   			break;
> +		if (list_empty(&info->swaplist))
> +			goto start_over;
> +		next = list_next_entry(info, swaplist);
> +		if (!info->swapped)
> +			list_del_init(&info->swaplist);
>   	}
>   	mutex_unlock(&shmem_swaplist_mutex);
>   
