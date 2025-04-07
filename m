Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F01221DAB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007629; cv=none; b=ETyFXwTcblacP/sPPsYTfaaUZlYJVROugcZZ0wV/5Thkfq4WtEYvZBD0Lyesyw5GeqNngqjPtyAzF7CHX5EMJEhDk4zQrjq4DHvhGspl6NcavXB+4i+w/sq9sYmDp5CRcQh2kc9LgkTNnLVpPtaEzq/WWNnKct1ZeiRdlNy1hTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007629; c=relaxed/simple;
	bh=4LA6bPmEZCqBMKfqP8QmdNeHq01xK3hVs3A90O3N2vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRHHh8Cmwbd6Yr95HZkHxlUZMd00c1V9xd3JUMNVvheD/re1P9Kdk02bo/Z/fZ6KlBj7wcup/HIIA615tMjbPlzI86dKBnbw6TXFHO/T4Q7/dt7Ffl9SLDSUatmEDomIaR9RxozER1KdK+jx1TONMzPTv1R9clyE+snf2OVirj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=DwvkZ5pd; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="DwvkZ5pd"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744007616; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KcRhuW9PUbZW9/kAH2D13dhIoDb6tqrn1VA1EdFByS8=;
	b=DwvkZ5pdvM6RQ5IBNGEYhB26bMVo7porqh8jXPko/CI5g+/pWIL4AUkWwBvJrZATcwBQH/0YxsiKM6xn8njpOqWdJ2/Yhf8sJrxJka6SnD+AdaIPTNqkAFAM6ZIEou7kq2m5bF6mvp5DbABK54eYbtv3iXiMv1jaGfIHzjdMKFk=
Received: from 30.74.144.125(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WVoJvbb_1744007614 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Apr 2025 14:33:35 +0800
Message-ID: <fbfbfe84-0422-425c-ab0a-77627deb9d16@linux.alibaba.com>
Date: Mon, 7 Apr 2025 14:33:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
To: David Hildenbrand <david@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, akpm@linux-foundation.org, hughd@google.com
Cc: willy@infradead.org, 21cnbao@gmail.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
 <54886038-3707-4ea0-bd84-00a8f4a19a6a@arm.com>
 <f6f4f4ff-0074-4ba7-b2a5-02727661843c@linux.alibaba.com>
 <145ec273-7223-45b8-a7f6-4e593a3cc8ee@arm.com>
 <d17b69a1-2f22-4a8d-8260-ddea38ebc7b0@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <d17b69a1-2f22-4a8d-8260-ddea38ebc7b0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/1 21:04, David Hildenbrand wrote:
> On 01.04.25 12:45, Ryan Roberts wrote:
>> On 30/03/2025 15:57, Baolin Wang wrote:
>>>
>>>
>>> On 2025/3/27 22:08, Ryan Roberts wrote:
>>>> On 25/03/2025 23:38, Baolin Wang wrote:
>>>>> When I tested the mincore() syscall, I observed that it takes 
>>>>> longer with
>>>>> 64K mTHP enabled on my Arm64 server. The reason is the 
>>>>> mincore_pte_range()
>>>>> still checks each PTE individually, even when the PTEs are contiguous,
>>>>> which is not efficient.
>>>>>
>>>>> Thus we can use folio_pte_batch() to get the batch number of the 
>>>>> present
>>>>> contiguous PTEs, which can improve the performance. I tested the 
>>>>> mincore()
>>>>> syscall with 1G anonymous memory populated with 64K mTHP, and 
>>>>> observed an
>>>>> obvious performance improvement:
>>>>>
>>>>> w/o patch        w/ patch        changes
>>>>> 6022us            1115us            +81%
>>>>>
>>>>> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
>>>>> see any obvious regression.
>>>>>
>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>> ---
>>>>>    mm/mincore.c | 27 ++++++++++++++++++++++-----
>>>>>    1 file changed, 22 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/mm/mincore.c b/mm/mincore.c
>>>>> index 832f29f46767..88be180b5550 100644
>>>>> --- a/mm/mincore.c
>>>>> +++ b/mm/mincore.c
>>>>> @@ -21,6 +21,7 @@
>>>>>      #include <linux/uaccess.h>
>>>>>    #include "swap.h"
>>>>> +#include "internal.h"
>>>>>      static int mincore_hugetlb(pte_t *pte, unsigned long hmask, 
>>>>> unsigned long
>>>>> addr,
>>>>>                unsigned long end, struct mm_walk *walk)
>>>>> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, 
>>>>> unsigned long
>>>>> addr, unsigned long end,
>>>>>        pte_t *ptep;
>>>>>        unsigned char *vec = walk->private;
>>>>>        int nr = (end - addr) >> PAGE_SHIFT;
>>>>> +    int step, i;
>>>>>          ptl = pmd_trans_huge_lock(pmd, vma);
>>>>>        if (ptl) {
>>>>> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd, 
>>>>> unsigned long
>>>>> addr, unsigned long end,
>>>>>            walk->action = ACTION_AGAIN;
>>>>>            return 0;
>>>>>        }
>>>>> -    for (; addr != end; ptep++, addr += PAGE_SIZE) {
>>>>> +    for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>>>>            pte_t pte = ptep_get(ptep);
>>>>>    +        step = 1;
>>>>>            /* We need to do cache lookup too for pte markers */
>>>>>            if (pte_none_mostly(pte))
>>>>>                __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>>>>                             vma, vec);
>>>>> -        else if (pte_present(pte))
>>>>> -            *vec = 1;
>>>>> -        else { /* pte is a swap entry */
>>>>> +        else if (pte_present(pte)) {
>>>>> +            if (pte_batch_hint(ptep, pte) > 1) {
>>>>> +                struct folio *folio = vm_normal_folio(vma, addr, 
>>>>> pte);
>>>>> +
>>>>> +                if (folio && folio_test_large(folio)) {
>>>>> +                    const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>>>>> +                                FPB_IGNORE_SOFT_DIRTY;
>>>>> +                    int max_nr = (end - addr) / PAGE_SIZE;
>>>>> +
>>>>> +                    step = folio_pte_batch(folio, addr, ptep, pte,
>>>>> +                            max_nr, fpb_flags, NULL, NULL, NULL);
>>>>> +                }
>>>>> +            }
>>>>
>>>> You could simplify to the following, I think, to avoid needing to 
>>>> grab the folio
>>>> and call folio_pte_batch():
>>>>
>>>>              else if (pte_present(pte)) {
>>>>                  int max_nr = (end - addr) / PAGE_SIZE;
>>>>                  step = min(pte_batch_hint(ptep, pte), max_nr);
>>>>              } ...
>>>>
>>>> I expect the regression you are seeing here is all due to calling 
>>>> ptep_get() for
>>>> every pte in the contpte batch, which will cause 16 memory reads per 
>>>> pte (to
>>>> gather the access/dirty bits). For small folios its just 1 read per 
>>>> pte.
>>>
>>> Right.
>>>
>>>> pte_batch_hint() will skip forward in blocks of 16 so you now end up 
>>>> with the
>>>> same number as for the small folio case. You don't need all the 
>>>> fancy extras
>>>> that folio_pte_batch() gives you here.
>>>
>>> Sounds reasonable. Your suggestion looks simple, but my method can 
>>> batch the
>>> whole large folio (such as large folios containing more than 16 
>>> contiguous PTEs)
>>> at once.
>>
>> Sure but folio_pte_batch() just implements that with another loop that 
>> calls
>> pte_batch_hint(), so it all amounts to the same thing. In fact there 
>> are some
>> extra checks in folio_pte_batch() that you don't need so it might be a 
>> bit slower.

Right. I tested your suggestion, yes, much better.

> I don't enjoy open-coding the batching, especially if only cont-pte 
> users will benefit from it. But I also don't enjoy the open-coded 
> pte_batch_hint() :)
> 
> But we really don't need the folio here, so I assume the short variant 
> you (Ryan) suggest is alright to just avoid the ptep_get().
> 
> As Oscar says, these details might soon be hidden inside a new page 
> table walker API (even though it will likely end up using 
> folio_pte_batch() internally, TBD).

OK. I can drop this patch if it will be addressed in the following patches.
