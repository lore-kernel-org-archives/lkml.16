Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36BE272E48
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793561; cv=none; b=l12O56wIGqTaMFthB62Fm2CA/ZUBlBN1e36dFMe/3toYpqD7gJEU+2vzvXtxYPJLsaqAjplRuwjcjHhZw9kVHnqoqXoeJcUoKEQwqcB4Q9FRiKn2Hq/rkzLOQb1af3C1Jqxcs3w1UfQTkO0kKx/i4ph9Z5nOA6R81tNO7g5RW2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793561; c=relaxed/simple;
	bh=ijJYXrptjViAwmHAuvri8OCe7PUy4skQXcbImZvLItE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njU5w0dkUi7IQW6QJCUI6FUcXeV5do1NAdfod/HAr9Uhtsugb2haaHQnh0lnahWYO3xQ9rLDe7pLP+jFEERH8ZHrm3ZXPKZNNlEd5LE0jJnutu1Ku3eURLhozubg5vqDDdrj0hsrbyGBtIo7wbP/Nvb2gQ4k8IJ6OKgPZwkEc2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=KzYJYMNx; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="KzYJYMNx"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746793554; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=s1OBMHH9lNcbiwBxHcJKRHLpPG0d29gL0JUaEp0FVkA=;
	b=KzYJYMNxsGSFumHTq1KJi/XMVuPPyDbPIh1alGvCI9CALF2ZCoOFd0XtRYFMbtr14eG9Bu0dgMgpqwNXb8Nbe8FEThh1aGEJqlSii0XnAM1+pP0dkkIRpYmpYX3l1deYxrxccmyqqz5wSJ1igJHmyZ4J12FhUOVpmJ0BgGikvHI=
Received: from 30.120.133.168(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wa3cyme_1746793552 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 20:25:53 +0800
Message-ID: <3d52c5bb-60c5-4bfd-958e-737a8cc90853@linux.alibaba.com>
Date: Fri, 9 May 2025 20:25:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: mincore: use pte_batch_bint() to batch process
 large folios
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: 21cnbao@gmail.com, ryan.roberts@arm.com, dev.jain@arm.com,
 ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <99cb00ee626ceb6e788102ca36821815cd832237.1746697240.git.baolin.wang@linux.alibaba.com>
 <c83ddc32-565b-40e3-b43f-12fe6e70586c@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <c83ddc32-565b-40e3-b43f-12fe6e70586c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/9 15:51, David Hildenbrand wrote:
> On 09.05.25 02:45, Baolin Wang wrote:
>> When I tested the mincore() syscall, I observed that it takes longer with
>> 64K mTHP enabled on my Arm64 server. The reason is the 
>> mincore_pte_range()
>> still checks each PTE individually, even when the PTEs are contiguous,
>> which is not efficient.
>>
>> Thus we can use pte_batch_hint() to get the batch number of the present
>> contiguous PTEs, which can improve the performance. I tested the 
>> mincore()
>> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
>> obvious performance improvement:
>>
>> w/o patch        w/ patch        changes
>> 6022us            549us            +91%
>>
>> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
>> see any obvious regression for base pages.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>> Changes from v2:
>> - Re-calculate the max_nr, per Barry.
>> Changes from v1:
>> - Change to use pte_batch_hint() to get the batch number, per Ryan.
>>
>> Note: I observed the min_t() can introduce a slight performance 
>> regression
>> for base pages, so I change to add a batch size check for base pages,
>> which can resolve the performance regression issue.
>> ---
>>   mm/mincore.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/mincore.c b/mm/mincore.c
>> index 832f29f46767..42d6c9c8da86 100644
>> --- a/mm/mincore.c
>> +++ b/mm/mincore.c
>> @@ -21,6 +21,7 @@
>>   #include <linux/uaccess.h>
>>   #include "swap.h"
>> +#include "internal.h"
>>   static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned 
>> long addr,
>>               unsigned long end, struct mm_walk *walk)
>> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned 
>> long addr, unsigned long end,
>>       pte_t *ptep;
>>       unsigned char *vec = walk->private;
>>       int nr = (end - addr) >> PAGE_SHIFT;
>> +    int step, i;
>>       ptl = pmd_trans_huge_lock(pmd, vma);
>>       if (ptl) {
>> @@ -118,16 +120,26 @@ static int mincore_pte_range(pmd_t *pmd, 
>> unsigned long addr, unsigned long end,
>>           walk->action = ACTION_AGAIN;
>>           return 0;
>>       }
>> -    for (; addr != end; ptep++, addr += PAGE_SIZE) {
>> +    for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>           pte_t pte = ptep_get(ptep);
>> +        step = 1;
>>           /* We need to do cache lookup too for pte markers */
>>           if (pte_none_mostly(pte))
>>               __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>                            vma, vec);
>> -        else if (pte_present(pte))
>> -            *vec = 1;
>> -        else { /* pte is a swap entry */
>> +        else if (pte_present(pte)) {
>> +            unsigned int batch = pte_batch_hint(ptep, pte);
>> +
>> +            if (batch > 1) {
>> +                unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
> 
> Nit: probably would have called this max_step to match step.

OK. If need respin the patch, I'll rename it.

>> +
>> +                step = min_t(unsigned int, batch, max_nr);
>> +            }
>> +
>> +            for (i = 0; i < step; i++)
>> +                vec[i] = 1;
> 
> I'm surprised this micro-optimization matters that much. Probably the 

Me too.

> compiler
> defers the calculation of max_nr. I am not convinced we need that level of
> micro-optimization in this code ...
> 
> 
> But if we're already micro-optimizing, you could have optimized out the 
> loop as
> well for order-0:
> 
>      unsigned int batch = pte_batch_hint(ptep, pte);
> 
>      if (batch > 1) {
>          unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
> 
>          step = min_t(unsigned int, batch, max_nr);
>          for (i = 0; i < step; i++)
>              vec[i] = 1;
>      } else {
>          *vec = 1;
>      }

I tried this method, and it had no impact on performance.

> In any case
> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks.
