Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A351BF58
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747271144; cv=none; b=Ji5Mxj2S6JXrMBxJkfjCJFh0hXuKsdOMj3V71FNjZcreX6SjFeHFGd7QMmOgm8Gy7L4acjs3fH0RmdSFl4zyJeptsC0W023MB97mQEDpdzn1wazu6VZ29N7lL2Pnp4bZ0odq/WRUVi1+yedxP8ohJZWIWH/9p8nVqCf94RKTYXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747271144; c=relaxed/simple;
	bh=r4S+O0YAQFKqTEg8akIgB+GBIOdi2Q0IHUu4+3BijEc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Ukqj7ooIM3N1rV+KDXM0MUV0SbKCvU3AyEnVWVPEHcUweESbg9P+NvpmRVP5NeBuZHbEpA5W11UWaxwB8qrEZ7Bv6PDpYcXb98UgewHG66wqck0R6kxlbAh9ppj/AgFA93TyZGxPRBswONmiCYqQFxYt+eIy6O1Skw5cQXklCSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4ZyX830WPjzYQtqL
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:05:39 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 54E501A0E7C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:05:38 +0800 (CST)
Received: from [10.174.178.129] (unknown [10.174.178.129])
	by APP3 (Coremail) with SMTP id _Ch0CgB3F8LQPSVodxACMQ--.16943S2;
	Thu, 15 May 2025 09:05:38 +0800 (CST)
Subject: Re: [PATCH 3/5] mm/shmem: Fix potential dead loop in shmem_unuse()
To: Baolin Wang <baolin.wang@linux.alibaba.com>, hughd@google.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250514165047.946884-1-shikemeng@huaweicloud.com>
 <20250514165047.946884-4-shikemeng@huaweicloud.com>
 <b7b6d5d0-2c3f-43ba-b2a9-3c9669f3f96d@linux.alibaba.com>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <634a73ce-a24e-01d4-1d00-86272bc78860@huaweicloud.com>
Date: Thu, 15 May 2025 09:05:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <b7b6d5d0-2c3f-43ba-b2a9-3c9669f3f96d@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgB3F8LQPSVodxACMQ--.16943S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw4UAFW7WF15WFyrZw48Crg_yoWrury5pr
	1kJryUJrW5Ar1kGr1UJr1UGry5Xr1UJw1UJr1UAFy8Jr1UJr1jgr1UXr1jgr1UAr48Jr4U
	tr1UXr1UZF1UJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkEb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UK2N
	tUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 5/14/2025 5:24 PM, Baolin Wang wrote:
> 
> 
> On 2025/5/15 00:50, Kemeng Shi wrote:
>> If multi shmem_unuse() for different swap type is called concurrently,
>> a dead loop could occur as following:
>> shmem_unuse(typeA)               shmem_unuse(typeB)
>>   mutex_lock(&shmem_swaplist_mutex)
>>   list_for_each_entry_safe(info, next, ...)
>>    ...
>>    mutex_unlock(&shmem_swaplist_mutex)
>>    /* info->swapped may drop to 0 */
>>    shmem_unuse_inode(&info->vfs_inode, type)
>>
>>                                    mutex_lock(&shmem_swaplist_mutex)
>>                                    list_for_each_entry(info, next, ...)
>>                                     if (!info->swapped)
>>                                      list_del_init(&info->swaplist)
>>
>>                                    ...
>>                                    mutex_unlock(&shmem_swaplist_mutex)
>>
>>    mutex_lock(&shmem_swaplist_mutex)
>>    /* iterate with offlist entry and encounter a dead loop */
>>    next = list_next_entry(info, swaplist);
>>    ...
>>
>> Restart the iteration if the inode is already off shmem_swaplist list
>> to fix the issue.
>>
>> Fixes: b56a2d8af9147 ("mm: rid swapoff of quadratic complexity")
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>   mm/shmem.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index 495e661eb8bb..0fed94c2bc09 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -1505,6 +1505,7 @@ int shmem_unuse(unsigned int type)
>>           return 0;
>>         mutex_lock(&shmem_swaplist_mutex);
>> +start_over:
>>       list_for_each_entry_safe(info, next, &shmem_swaplist, swaplist) {
>>           if (!info->swapped) {
>>               list_del_init(&info->swaplist);
>> @@ -1530,6 +1531,8 @@ int shmem_unuse(unsigned int type)
> 
>         next = list_next_entry(info, swaplist);
>         if (!info->swapped)
>             list_del_init(&info->swaplist);
>         if (atomic_dec_and_test(&info->stop_eviction))
>             wake_up_var(&info->stop_eviction);
> 
> We may still hit the list warning when calling list_del_init() for the off-list info->swaplist? So I hope we can add a check for the possible off-list:
Hello,
When entry is taken off list, it will be initialized to a valid empty entry
with INIT_LIST_HEAD(). So it should be fine to call list_del_init() for
off-list entry.
Please correct me if I miss anything. Thanks!

> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 99327c30507c..f5ae5e2d6fb4 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1523,9 +1523,11 @@ int shmem_unuse(unsigned int type)
>                 cond_resched();
> 
>                 mutex_lock(&shmem_swaplist_mutex);
> -               next = list_next_entry(info, swaplist);
> -               if (!info->swapped)
> -                       list_del_init(&info->swaplist);
> +               if (!list_empty(&info->swaplist)) {
> +                       next = list_next_entry(info, swaplist);
> +                       if (!info->swapped)
> +                               list_del_init(&info->swaplist);
> +               }
>                 if (atomic_dec_and_test(&info->stop_eviction))
>                         wake_up_var(&info->stop_eviction);
>                 if (error)
> 
>>               wake_up_var(&info->stop_eviction);
>>           if (error)
>>               break;
>> +        if (list_empty(&info->swaplist))
>> +            goto start_over;
>>       }
>>       mutex_unlock(&shmem_swaplist_mutex);
>>   
> 

