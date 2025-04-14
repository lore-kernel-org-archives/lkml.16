Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0927D28BAB5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638422; cv=none; b=tGUHe1KZzppPn5dugiYsehnwvXbd9Yb4t6ULy8Sm5x+6b+MHXocC1qI6uYloeZHB7goL+53+AcbaM53W91rjbn+qZNy09PJWXCpkZn2D2VLFaukJ3qGfdukbJro61WxZ+AEFEfswGd+gtRYP/o0T+D0pkQHF6x1aSsfSIbUDIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638422; c=relaxed/simple;
	bh=g4PSsfGP2ZB/LZ78LvXODfCFQZZ86Q66goPz4U6q6HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFDOK/KsgR7UykPFucf9x3extY7wQrzaY9VtjwdQeLKLuph+083YcWHnjBKJ3CYxaenDbgtN5Hxf4OtYUikjmnwteVV46LNlN+vGs05XTGevCTz9bzOCMjY8NoALj7SDnr7IKKv+RulqNpnvUzUkt7l5tLGp8sHctZLdA1YwcLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9CA51007;
	Mon, 14 Apr 2025 06:46:57 -0700 (PDT)
Received: from [10.57.86.225] (unknown [10.57.86.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBF3D3F66E;
	Mon, 14 Apr 2025 06:46:57 -0700 (PDT)
Message-ID: <cab96acc-1b2a-4126-976a-337dd48dd85f@arm.com>
Date: Mon, 14 Apr 2025 14:46:56 +0100
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
 David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: willy@infradead.org, 21cnbao@gmail.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
 <54886038-3707-4ea0-bd84-00a8f4a19a6a@arm.com>
 <f6f4f4ff-0074-4ba7-b2a5-02727661843c@linux.alibaba.com>
 <145ec273-7223-45b8-a7f6-4e593a3cc8ee@arm.com>
 <d17b69a1-2f22-4a8d-8260-ddea38ebc7b0@redhat.com>
 <fbfbfe84-0422-425c-ab0a-77627deb9d16@linux.alibaba.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <fbfbfe84-0422-425c-ab0a-77627deb9d16@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 07:33, Baolin Wang wrote:
> 
> 
> On 2025/4/1 21:04, David Hildenbrand wrote:
>> On 01.04.25 12:45, Ryan Roberts wrote:
>>> On 30/03/2025 15:57, Baolin Wang wrote:
>>>>
>>>>
>>>> On 2025/3/27 22:08, Ryan Roberts wrote:
>>>>> On 25/03/2025 23:38, Baolin Wang wrote:
>>>>>> When I tested the mincore() syscall, I observed that it takes longer with
>>>>>> 64K mTHP enabled on my Arm64 server. The reason is the mincore_pte_range()
>>>>>> still checks each PTE individually, even when the PTEs are contiguous,
>>>>>> which is not efficient.
>>>>>>
>>>>>> Thus we can use folio_pte_batch() to get the batch number of the present
>>>>>> contiguous PTEs, which can improve the performance. I tested the mincore()
>>>>>> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
>>>>>> obvious performance improvement:
>>>>>>
>>>>>> w/o patch        w/ patch        changes
>>>>>> 6022us            1115us            +81%
>>>>>>
>>>>>> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
>>>>>> see any obvious regression.
>>>>>>
>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>> ---
>>>>>>    mm/mincore.c | 27 ++++++++++++++++++++++-----
>>>>>>    1 file changed, 22 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/mm/mincore.c b/mm/mincore.c
>>>>>> index 832f29f46767..88be180b5550 100644
>>>>>> --- a/mm/mincore.c
>>>>>> +++ b/mm/mincore.c
>>>>>> @@ -21,6 +21,7 @@
>>>>>>      #include <linux/uaccess.h>
>>>>>>    #include "swap.h"
>>>>>> +#include "internal.h"
>>>>>>      static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned
>>>>>> long
>>>>>> addr,
>>>>>>                unsigned long end, struct mm_walk *walk)
>>>>>> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long
>>>>>> addr, unsigned long end,
>>>>>>        pte_t *ptep;
>>>>>>        unsigned char *vec = walk->private;
>>>>>>        int nr = (end - addr) >> PAGE_SHIFT;
>>>>>> +    int step, i;
>>>>>>          ptl = pmd_trans_huge_lock(pmd, vma);
>>>>>>        if (ptl) {
>>>>>> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long
>>>>>> addr, unsigned long end,
>>>>>>            walk->action = ACTION_AGAIN;
>>>>>>            return 0;
>>>>>>        }
>>>>>> -    for (; addr != end; ptep++, addr += PAGE_SIZE) {
>>>>>> +    for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>>>>>            pte_t pte = ptep_get(ptep);
>>>>>>    +        step = 1;
>>>>>>            /* We need to do cache lookup too for pte markers */
>>>>>>            if (pte_none_mostly(pte))
>>>>>>                __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>>>>>                             vma, vec);
>>>>>> -        else if (pte_present(pte))
>>>>>> -            *vec = 1;
>>>>>> -        else { /* pte is a swap entry */
>>>>>> +        else if (pte_present(pte)) {
>>>>>> +            if (pte_batch_hint(ptep, pte) > 1) {
>>>>>> +                struct folio *folio = vm_normal_folio(vma, addr, pte);
>>>>>> +
>>>>>> +                if (folio && folio_test_large(folio)) {
>>>>>> +                    const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>>>>>> +                                FPB_IGNORE_SOFT_DIRTY;
>>>>>> +                    int max_nr = (end - addr) / PAGE_SIZE;
>>>>>> +
>>>>>> +                    step = folio_pte_batch(folio, addr, ptep, pte,
>>>>>> +                            max_nr, fpb_flags, NULL, NULL, NULL);
>>>>>> +                }
>>>>>> +            }
>>>>>
>>>>> You could simplify to the following, I think, to avoid needing to grab the
>>>>> folio
>>>>> and call folio_pte_batch():
>>>>>
>>>>>              else if (pte_present(pte)) {
>>>>>                  int max_nr = (end - addr) / PAGE_SIZE;
>>>>>                  step = min(pte_batch_hint(ptep, pte), max_nr);
>>>>>              } ...
>>>>>
>>>>> I expect the regression you are seeing here is all due to calling
>>>>> ptep_get() for
>>>>> every pte in the contpte batch, which will cause 16 memory reads per pte (to
>>>>> gather the access/dirty bits). For small folios its just 1 read per pte.
>>>>
>>>> Right.
>>>>
>>>>> pte_batch_hint() will skip forward in blocks of 16 so you now end up with the
>>>>> same number as for the small folio case. You don't need all the fancy extras
>>>>> that folio_pte_batch() gives you here.
>>>>
>>>> Sounds reasonable. Your suggestion looks simple, but my method can batch the
>>>> whole large folio (such as large folios containing more than 16 contiguous
>>>> PTEs)
>>>> at once.
>>>
>>> Sure but folio_pte_batch() just implements that with another loop that calls
>>> pte_batch_hint(), so it all amounts to the same thing. In fact there are some
>>> extra checks in folio_pte_batch() that you don't need so it might be a bit
>>> slower.
> 
> Right. I tested your suggestion, yes, much better.
> 
>> I don't enjoy open-coding the batching, especially if only cont-pte users will
>> benefit from it. But I also don't enjoy the open-coded pte_batch_hint() :)

I'm not quite sure what you are saying here? Is:

    else if (pte_present(pte)) {
        int max_nr = (end - addr) / PAGE_SIZE;
        step = min(pte_batch_hint(ptep, pte), max_nr);
    }

really to be considered open-coding? pte_batch_hint() is a generic API and it
feels pretty reasonable to use it in this situation?

>>
>> But we really don't need the folio here, so I assume the short variant you
>> (Ryan) suggest is alright to just avoid the ptep_get().

Yes, that would get my vote.

>>
>> As Oscar says, these details might soon be hidden inside a new page table
>> walker API (even though it will likely end up using folio_pte_batch()
>> internally, TBD).
> 
> OK. I can drop this patch if it will be addressed in the following patches.

I'm assuming a large chunk of the speedup is actually fixing a regression (it
would be good to see the numbers for non-mTHP mappings for comparison), so
personally I'd prefer we put this patch in now rather than waiting for the new
API to land then waiting for someone to get around to converting this user.

Thanks,
Ryan



