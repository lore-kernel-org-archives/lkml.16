Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BFA43151
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178720; cv=none; b=EHdtQ0BlBts5gUXQJD2bXLmX3DXez/8zAZW4mi0mjqB5/MFqeIOHUwHK51DSqTPlpl2Ltx92dFHbY9G2AiNyBdkklz99zzhvHN2nGRtPwFpksUP3VG75CC+pCOav5HxOHB4KZ1rVyzXpRPWlckK8f53Iot4ZLw/SOpPiiV7Rnek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178720; c=relaxed/simple;
	bh=sIGn5qtn7yGRNR9u/CPWDcRoGYGP30j1zfKvbK6uYuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmFEDq3CMTKPzhUpHslD1O1LrJ+P4HlM78CshBFZKfJk0QZxXDpMytSNvnLHBdbUdlZl4Sz5/NdVoFrx/MtXtPZvgywAvPIHxKJR7Bxsp++EBeSjIoj5rLaergb/xBxxwNhhgpf4MMlQk0PQimEFvZ3SMs6LruoY2uhsRzJP5aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=C2t81RCu; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="C2t81RCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=j7ozK7S3jHPyjGgp2DQBnLMNQOAiWnt4fBinrs0WJAA=;
	b=C2t81RCuRZk9imSBghwq3cONqrw4uTlS4f1fnpcF47aNBbPhoE727hMAIE9Mgh
	L1Ptj+B757x3bDybqLbi3cGGCG2S9R/991eBvfhgr/dk4CkEv3Sk2vimM6x+4GF6
	uPHwpBInZcCfXh8Cq4t+mf+A7qymmx41H95pVgvJhVn7c=
Received: from [172.19.20.199] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3P10xv6lna8IjAw--.4182S2;
	Mon, 10 Feb 2025 16:56:17 +0800 (CST)
Message-ID: <bf050059-546b-4e04-9bfa-d601d09b3852@126.com>
Date: Mon, 10 Feb 2025 16:56:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mm/cma: using per-CMA locks to improve concurrent
 allocation performance
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 baolin.wang@linux.alibaba.com, aisheng.dong@nxp.com, liuzixing@hygon.cn
References: <1739152566-744-1-git-send-email-yangge1116@126.com>
 <51514ffd-a1ca-4eb4-90ab-c6871ab92c95@redhat.com>
From: Ge Yang <yangge1116@126.com>
In-Reply-To: <51514ffd-a1ca-4eb4-90ab-c6871ab92c95@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P10xv6lna8IjAw--.4182S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF1xXF15XF47XFy8Kr1Utrb_yoWrXw15pr
	W8GFWjyrWkJr13Aw42vw1DWFyF9wn7KFWUKr1Fva4fCasxCr93Ww48t3WY9rW8urZ7WFyI
	vr1jqasxZ3WUZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYpB-UUUUU=
X-CM-SenderInfo: 51dqwwjhrrila6rslhhfrp/1tbifgbvG2epu8cumgAAsK



在 2025/2/10 16:34, David Hildenbrand 写道:
> On 10.02.25 02:56, yangge1116@126.com wrote:
>> From: yangge <yangge1116@126.com>
>>
>> For different CMAs, concurrent allocation of CMA memory ideally should 
>> not
>> require synchronization using locks. Currently, a global cma_mutex 
>> lock is
>> employed to synchronize all CMA allocations, which can impact the
>> performance of concurrent allocations across different CMAs.
>>
>> To test the performance impact, follow these steps:
>> 1. Boot the kernel with the command line argument hugetlb_cma=30G to
>>     allocate a 30GB CMA area specifically for huge page allocations. 
>> (note:
>>     on my machine, which has 3 nodes, each node is initialized with 
>> 10G of
>>     CMA)
>> 2. Use the dd command with parameters if=/dev/zero of=/dev/shm/file bs=1G
>>     count=30 to fully utilize the CMA area by writing zeroes to a file in
>>     /dev/shm.
>> 3. Open three terminals and execute the following commands 
>> simultaneously:
>>     (Note: Each of these commands attempts to allocate 10GB [2621440 * 
>> 4KB
>>     pages] of CMA memory.)
>>     On Terminal 1: time echo 2621440 > /sys/kernel/debug/cma/hugetlb1/ 
>> alloc
>>     On Terminal 2: time echo 2621440 > /sys/kernel/debug/cma/hugetlb2/ 
>> alloc
>>     On Terminal 3: time echo 2621440 > /sys/kernel/debug/cma/hugetlb3/ 
>> alloc
>>
> 
> Hi,
> 
> I'm curious, what is the real workload you are trying to optimize for? I 
> assume this example here is just to have some measurement.
> 
Some of our drivers require this optimization, but they haven't been 
merged into the mainline yet. Therefore, we optimize the debug code for 
them.
> Is concurrency within a single CMA area also a problem for your use case?
> 
Yes, we will first optimize the concurrent performance for multiple 
CMAs, and then proceed to optimize the concurrent performance for a 
single CMA later.
> 
>> We attempt to allocate pages through the CMA debug interface and use the
>> time command to measure the duration of each allocation.
>> Performance comparison:
>>               Without this patch      With this patch
>> Terminal1        ~7s                     ~7s
>> Terminal2       ~14s                     ~8s
>> Terminal3       ~21s                     ~7s
>>
>> To slove problem above, we could use per-CMA locks to improve concurrent
>> allocation performance. This would allow each CMA to be managed
>> independently, reducing the need for a global lock and thus improving
>> scalability and performance.
>>
>> Signed-off-by: yangge <yangge1116@126.com>
>> ---
>>
>> V2:
>> - update code and message suggested by Barry.
>>
>>   mm/cma.c | 7 ++++---
>>   mm/cma.h | 1 +
>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/cma.c b/mm/cma.c
>> index 34a4df2..a0d4d2f 100644
>> --- a/mm/cma.c
>> +++ b/mm/cma.c
>> @@ -34,7 +34,6 @@
>>   struct cma cma_areas[MAX_CMA_AREAS];
>>   unsigned int cma_area_count;
>> -static DEFINE_MUTEX(cma_mutex);
>>   static int __init __cma_declare_contiguous_nid(phys_addr_t base,
>>               phys_addr_t size, phys_addr_t limit,
>> @@ -175,6 +174,8 @@ static void __init cma_activate_area(struct cma *cma)
>>       spin_lock_init(&cma->lock);
>> +    mutex_init(&cma->alloc_mutex);
>> +
>>   #ifdef CONFIG_CMA_DEBUGFS
>>       INIT_HLIST_HEAD(&cma->mem_head);
>>       spin_lock_init(&cma->mem_head_lock);
>> @@ -813,9 +814,9 @@ static int cma_range_alloc(struct cma *cma, struct 
>> cma_memrange *cmr,
>>           spin_unlock_irq(&cma->lock);
>>           pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
>> -        mutex_lock(&cma_mutex);
>> +        mutex_lock(&cma->alloc_mutex);
>>           ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp);
>> -        mutex_unlock(&cma_mutex);
>> +        mutex_unlock(&cma->alloc_mutex);
> 
> 
> As raised, a better approach might be to return -EAGAIN  in case we hit 
> an isolated pageblock and deal with that more gracefully here (e.g., try 
> another block, or retry this one if there are not others left, ...)
> 
> In any case, this change here looks like an improvement.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 

