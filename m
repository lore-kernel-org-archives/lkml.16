Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418BF22171B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214665; cv=none; b=aisKZDsKK+qeb8v0jfvAbzhUNyCJ9VWiHQThJxNs6ZI1ast686M387ZiTHKUolXEBkE/E+gVQZAFTOgqoKyTma7TSNuja3HfYlOqMSnuXKl2cYh9wjK3p/90weuxzpeXBYDxALdkoTNsQAt838p+fGGf29aqzVk4Gyy/51PrnIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214665; c=relaxed/simple;
	bh=fWZcBjIn6D9rWCR+7OXq+vuwXCYLtAxddM65kTRJJfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISzjQ5i2/bJysMIJLLFUv7o4g22xBOtnt8z1wUdplcwBIprumSHVpBNmg2YsEN1Gp5A3sQb0YzjkxkSoUBB3AT8U8Mr0WbnSA98G5n+SFpFVly3CnG4Th/BAoiL3mPWlfCw9xPlOLWCnzp+RG1bZlYJZ9HJE/x07At2wNIh4Kws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=yCbXE9ig; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="yCbXE9ig"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747214653; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=yjMo+3hO/FV1JWL2k0Av/+NkF5itKNAXmcU15iNakR4=;
	b=yCbXE9igQg9q02wtlgHek+k6b1u2ccw5Ab/eH/zL3POF4YG6iVTxnPWMNQFHP2Oc2TCr2qeToqgLLDsAJy1opVoFqQ+Ec37vixoIJlZsLeZZpnlTQKObIoAvYEw5qx02sN6GDSWbmvDfpIJnf5nqi3CloKANWnCxapMDAm4yrQw=
Received: from 30.74.144.106(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WalMTtq_1747214652 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 May 2025 17:24:13 +0800
Message-ID: <b7b6d5d0-2c3f-43ba-b2a9-3c9669f3f96d@linux.alibaba.com>
Date: Wed, 14 May 2025 17:24:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] mm/shmem: Fix potential dead loop in shmem_unuse()
To: Kemeng Shi <shikemeng@huaweicloud.com>, hughd@google.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250514165047.946884-1-shikemeng@huaweicloud.com>
 <20250514165047.946884-4-shikemeng@huaweicloud.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250514165047.946884-4-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/15 00:50, Kemeng Shi wrote:
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
> ---
>   mm/shmem.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 495e661eb8bb..0fed94c2bc09 100644
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
> @@ -1530,6 +1531,8 @@ int shmem_unuse(unsigned int type)

		next = list_next_entry(info, swaplist);
		if (!info->swapped)
			list_del_init(&info->swaplist);
		if (atomic_dec_and_test(&info->stop_eviction))
			wake_up_var(&info->stop_eviction);

We may still hit the list warning when calling list_del_init() for the 
off-list info->swaplist? So I hope we can add a check for the possible 
off-list:

diff --git a/mm/shmem.c b/mm/shmem.c
index 99327c30507c..f5ae5e2d6fb4 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1523,9 +1523,11 @@ int shmem_unuse(unsigned int type)
                 cond_resched();

                 mutex_lock(&shmem_swaplist_mutex);
-               next = list_next_entry(info, swaplist);
-               if (!info->swapped)
-                       list_del_init(&info->swaplist);
+               if (!list_empty(&info->swaplist)) {
+                       next = list_next_entry(info, swaplist);
+                       if (!info->swapped)
+                               list_del_init(&info->swaplist);
+               }
                 if (atomic_dec_and_test(&info->stop_eviction))
                         wake_up_var(&info->stop_eviction);
                 if (error)

>   			wake_up_var(&info->stop_eviction);
>   		if (error)
>   			break;
> +		if (list_empty(&info->swaplist))
> +			goto start_over;
>   	}
>   	mutex_unlock(&shmem_swaplist_mutex);
>   
