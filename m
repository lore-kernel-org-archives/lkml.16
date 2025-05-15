Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE371B4140
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747281568; cv=none; b=mI61qU1Gju1G6pOP6moYngzONdqcEyymdAfiz8LJdopYn9nQ5If1DNny8fgag10oBokzotrYXJP8SJMX2fmMgCAF2Vz4lzv/hhoiUpcAfJ45ea/8h5Ttq2WfVhCjr2NzD5mZZxf8G3fTZn0BJkNsQmd9q0jp7Gurzw+cYdiOILA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747281568; c=relaxed/simple;
	bh=whQizIeyGW42Zl99GNuqjMQ5PXU6M7matiCigSNfyM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k363oOeEB9jkXsQr3MOgpleJ09XkpT4ZRXT8biq/9YDAW4APxXiFwlVA9gtMpfhRd+zJO4GBplYa5TEYSppjdd3G01j0PwA8MaAbkOIGxz0Xv8Pc1c00Xecf1wZjHKCui3seDvCosB6q3uzbikZHV2fdUnYT4YcnN1L09SSYZ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QOG3g1we; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QOG3g1we"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747281555; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=TFdZ6vQjYgvoP+lEGuUuMLwUa7mcXBQhvQk2iDXRQ5U=;
	b=QOG3g1weY7bke/tLe/B0mRJzxes4mNcV2bReeK1JzSdFTDM6GoSe6J56FreedYw4oqnYA/sblvMxyMevOCsuxKvubsnrkrstKkmHufSOTQ4nN5eJPfaiIBjBgBzTOXWHI+q+RiQH25AVSfpm1viWVzEij1LpfxkdKz5ciO7VqwY=
Received: from 30.74.144.114(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wap9KyY_1747281555 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 15 May 2025 11:59:15 +0800
Message-ID: <453015aa-e18f-4e37-86b1-001ec4e994d1@linux.alibaba.com>
Date: Thu, 15 May 2025 11:59:13 +0800
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
 <b7b6d5d0-2c3f-43ba-b2a9-3c9669f3f96d@linux.alibaba.com>
 <634a73ce-a24e-01d4-1d00-86272bc78860@huaweicloud.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <634a73ce-a24e-01d4-1d00-86272bc78860@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/15 09:05, Kemeng Shi wrote:
> 
> 
> on 5/14/2025 5:24 PM, Baolin Wang wrote:
>>
>>
>> On 2025/5/15 00:50, Kemeng Shi wrote:
>>> If multi shmem_unuse() for different swap type is called concurrently,
>>> a dead loop could occur as following:
>>> shmem_unuse(typeA)               shmem_unuse(typeB)
>>>    mutex_lock(&shmem_swaplist_mutex)
>>>    list_for_each_entry_safe(info, next, ...)
>>>     ...
>>>     mutex_unlock(&shmem_swaplist_mutex)
>>>     /* info->swapped may drop to 0 */
>>>     shmem_unuse_inode(&info->vfs_inode, type)
>>>
>>>                                     mutex_lock(&shmem_swaplist_mutex)
>>>                                     list_for_each_entry(info, next, ...)
>>>                                      if (!info->swapped)
>>>                                       list_del_init(&info->swaplist)
>>>
>>>                                     ...
>>>                                     mutex_unlock(&shmem_swaplist_mutex)
>>>
>>>     mutex_lock(&shmem_swaplist_mutex)
>>>     /* iterate with offlist entry and encounter a dead loop */
>>>     next = list_next_entry(info, swaplist);
>>>     ...
>>>
>>> Restart the iteration if the inode is already off shmem_swaplist list
>>> to fix the issue.
>>>
>>> Fixes: b56a2d8af9147 ("mm: rid swapoff of quadratic complexity")
>>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>>> ---
>>>    mm/shmem.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>> index 495e661eb8bb..0fed94c2bc09 100644
>>> --- a/mm/shmem.c
>>> +++ b/mm/shmem.c
>>> @@ -1505,6 +1505,7 @@ int shmem_unuse(unsigned int type)
>>>            return 0;
>>>          mutex_lock(&shmem_swaplist_mutex);
>>> +start_over:
>>>        list_for_each_entry_safe(info, next, &shmem_swaplist, swaplist) {
>>>            if (!info->swapped) {
>>>                list_del_init(&info->swaplist);
>>> @@ -1530,6 +1531,8 @@ int shmem_unuse(unsigned int type)
>>
>>          next = list_next_entry(info, swaplist);
>>          if (!info->swapped)
>>              list_del_init(&info->swaplist);
>>          if (atomic_dec_and_test(&info->stop_eviction))
>>              wake_up_var(&info->stop_eviction);
>>
>> We may still hit the list warning when calling list_del_init() for the off-list info->swaplist? So I hope we can add a check for the possible off-list:
> Hello,
> When entry is taken off list, it will be initialized to a valid empty entry
> with INIT_LIST_HEAD(). So it should be fine to call list_del_init() for
> off-list entry.
> Please correct me if I miss anything. Thanks!

Ah, yes. I got confused with list_del(), but I still think we should not 
continue to operate on an off-list entry.

>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index 99327c30507c..f5ae5e2d6fb4 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -1523,9 +1523,11 @@ int shmem_unuse(unsigned int type)
>>                  cond_resched();
>>
>>                  mutex_lock(&shmem_swaplist_mutex);
>> -               next = list_next_entry(info, swaplist);
>> -               if (!info->swapped)
>> -                       list_del_init(&info->swaplist);
>> +               if (!list_empty(&info->swaplist)) {
>> +                       next = list_next_entry(info, swaplist);
>> +                       if (!info->swapped)
>> +                               list_del_init(&info->swaplist);
>> +               }
>>                  if (atomic_dec_and_test(&info->stop_eviction))
>>                          wake_up_var(&info->stop_eviction);
>>                  if (error)
>>
>>>                wake_up_var(&info->stop_eviction);
>>>            if (error)
>>>                break;
>>> +        if (list_empty(&info->swaplist))
>>> +            goto start_over;
>>>        }
>>>        mutex_unlock(&shmem_swaplist_mutex);
>>>    
>>
