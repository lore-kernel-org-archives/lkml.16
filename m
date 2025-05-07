Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B62C201002
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616499; cv=none; b=eOFyOtTCRwBC+U51Iqyft90/5P8VatZkvktruP2aszNIGaCQ1WJhwvT5XvWasjIwf4EG3442NbkevhDaHKRkHOnjDGab0m2I1HIRsf9WLZbLR2kfWi9vWblAIJ/Rj4cTS5pC3YAaF7/qK0SsHxmkBE0QmWozn3O75Zsbx5V7/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616499; c=relaxed/simple;
	bh=SWis41KfkUp167eFR24ajK7XpLMlMyjoXep8v+NyqH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=expf9JlXQmINdHburpeaP1yPVcC/tqwLeSqfIeRobnjLXgwIEYvDTveNxg8PBI8ikeJ6mHGFWbqphSvimv80HCRFjmEWht1BTaMn7Fjq1POkfur6YXU+AKFVLZhDPHnOX6lQGLMAWI7ZpQ2/mlwGvyPHbVX0SjBU5ZrBerg8KAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E860F339;
	Wed,  7 May 2025 04:14:44 -0700 (PDT)
Received: from [10.1.26.133] (XHFQ2J9959.cambridge.arm.com [10.1.26.133])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58DFE3F673;
	Wed,  7 May 2025 04:14:53 -0700 (PDT)
Message-ID: <6e0be4f6-0ac2-4861-b25d-3d94c6f35a9f@arm.com>
Date: Wed, 7 May 2025 12:14:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
Content-Language: en-GB
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
 akpm@linux-foundation.org, hughd@google.com
Cc: willy@infradead.org, 21cnbao@gmail.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
 <17289428-894a-4397-9d61-c8500d032b28@arm.com>
 <6a8418ba-dbd1-489f-929b-e31831bea0cf@linux.alibaba.com>
 <fc883e4c-41cb-4f05-a5ef-3b756c689da3@redhat.com>
 <c0b2221f-2686-49a7-a1bd-97f5181065e0@linux.alibaba.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c0b2221f-2686-49a7-a1bd-97f5181065e0@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2025 11:03, Baolin Wang wrote:
> 
> 
> On 2025/5/7 17:54, David Hildenbrand wrote:
>> On 07.05.25 11:48, Baolin Wang wrote:
>>>
>>>
>>> On 2025/5/7 13:12, Dev Jain wrote:
>>>>
>>>>
>>>> On 26/03/25 9:08 am, Baolin Wang wrote:
>>>>> When I tested the mincore() syscall, I observed that it takes longer with
>>>>> 64K mTHP enabled on my Arm64 server. The reason is the
>>>>> mincore_pte_range()
>>>>> still checks each PTE individually, even when the PTEs are contiguous,
>>>>> which is not efficient.
>>>>>
>>>>> Thus we can use folio_pte_batch() to get the batch number of the present
>>>>> contiguous PTEs, which can improve the performance. I tested the
>>>>> mincore()
>>>>> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
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
>>>>>    #include <linux/uaccess.h>
>>>>>    #include "swap.h"
>>>>> +#include "internal.h"
>>>>>    static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned
>>>>> long addr,
>>>>>                unsigned long end, struct mm_walk *walk)
>>>>> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned
>>>>> long addr, unsigned long end,
>>>>>        pte_t *ptep;
>>>>>        unsigned char *vec = walk->private;
>>>>>        int nr = (end - addr) >> PAGE_SHIFT;
>>>>> +    int step, i;
>>>>>        ptl = pmd_trans_huge_lock(pmd, vma);
>>>>>        if (ptl) {
>>>>> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd,
>>>>> unsigned long addr, unsigned long end,
>>>>>            walk->action = ACTION_AGAIN;
>>>>>            return 0;
>>>>>        }
>>>>> -    for (; addr != end; ptep++, addr += PAGE_SIZE) {
>>>>> +    for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>>>>            pte_t pte = ptep_get(ptep);
>>>>> +        step = 1;
>>>>>            /* We need to do cache lookup too for pte markers */
>>>>>            if (pte_none_mostly(pte))
>>>>>                __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>>>>                             vma, vec);
>>>>> -        else if (pte_present(pte))
>>>>> -            *vec = 1;
>>>>> -        else { /* pte is a swap entry */
>>>>> +        else if (pte_present(pte)) {
>>>>> +            if (pte_batch_hint(ptep, pte) > 1) {
>>>>> +                struct folio *folio = vm_normal_folio(vma, addr, pte);
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
>>>> Can we go ahead with this along with [1], that will help us generalize
>>>> for all arches.
>>>>
>>>> [1] https://lore.kernel.org/all/20250506050056.59250-3-dev.jain@arm.com/
>>>> (Please replace PAGE_SIZE with 1)
>>>
>>> As discussed with Ryan, we don’t need to call folio_pte_batch()
>>> (something like the code below), so your patch seems unnecessarily
>>> complicated. However, David is unhappy about the open-coded
>>> pte_batch_hint().
>>
>> I can live with the below :)
>>
>> Having something more universal does maybe not make sense here. Any form of
>> patching contiguous PTEs (contiguous PFNs) -- whether with folios or not -- is
>> not required here as we really only want to
>>
>> (a) Identify pte_present() PTEs
>> (b) Avoid the cost of repeated ptep_get() with cont-pte.
> 
> Good. I will change the patch and resend it. Thanks.

Agreed. Thanks Baolin!

