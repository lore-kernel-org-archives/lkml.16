Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458E728469B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718809; cv=none; b=dDc+1SYFP/+6EmzOMCaSLSMP4lhLVtmDQfAsJES/QaEIAisgKilzpdrPaayAP0JmK7ygm1EVIt8flJVEeMPTWF5I4gcEifKytQ7U3dr/HQ7pDdjGm290Xhr6dHYwBrH45DtzMFNSj2doxIIodZXjRFYErQ29ujDtf9czR6ZhA8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718809; c=relaxed/simple;
	bh=3zjVv3OxqpO942bA5m0yLQFRbhjeXO3ZrV6JHCAa4cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwYQYEDueFpBsmVqusqGwbHlIQY8noTaMcheGiUg9SvqtxbMvf6R3L+oilDam+rn2XCu8VaXoO2JM5L5iqYS/pXIQ6SlNABNxsDTQw6r/PJofY3VIOtT7lAWsaoxPPuBl7PHmRGUtCuig+LuWUSFftIxCtxKamGjQjPEZStndvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8133A15A1;
	Tue, 15 Apr 2025 05:06:43 -0700 (PDT)
Received: from [10.163.73.130] (unknown [10.163.73.130])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12D113F694;
	Tue, 15 Apr 2025 05:06:40 -0700 (PDT)
Message-ID: <140c6ab6-fbc4-4ae1-a804-726bfd5fdcb0@arm.com>
Date: Tue, 15 Apr 2025 17:36:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hughd@google.com, vishal.moola@gmail.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250411081301.8533-1-dev.jain@arm.com>
 <09c77ab5-65fc-4bca-a7e5-2b11bba9330d@redhat.com>
 <9ed4c113-37eb-4e3d-98a1-f46f786aaea9@arm.com>
 <1d6d7842-1700-40d2-9d5b-e044fbc242de@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <1d6d7842-1700-40d2-9d5b-e044fbc242de@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15/04/25 5:29 pm, David Hildenbrand wrote:
> On 15.04.25 13:47, Dev Jain wrote:
>>
>>
>> On 15/04/25 3:47 pm, David Hildenbrand wrote:
>>> On 11.04.25 10:13, Dev Jain wrote:
>>>> After the check for queue_folio_required(), the code only cares 
>>>> about the
>>>> folio in the for loop, i.e the PTEs are redundant. Therefore, optimize
>>>> this
>>>> loop by skipping over a PTE batch mapping the same folio.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>> Unfortunately I have only build tested this since my test 
>>>> environment is
>>>> broken.
>>>>
>>>>    mm/mempolicy.c | 12 +++++++++++-
>>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>>> index b28a1e6ae096..b019524da8a2 100644
>>>> --- a/mm/mempolicy.c
>>>> +++ b/mm/mempolicy.c
>>>> @@ -573,6 +573,9 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>> unsigned long addr,
>>>>        pte_t *pte, *mapped_pte;
>>>>        pte_t ptent;
>>>>        spinlock_t *ptl;
>>>> +    int max_nr;
>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +    int nr = 1;
>>>
>>> Try sticking to reverse xmas tree, please. (not completely the case
>>> here, but fpb_flags can easily be moved all he way to the top)
>>
>> I thought that the initializations were to be kept at the bottom.
> 
> Not that I am aware of.
> 
>> Asking for future patches, should I put all declarations in reverse-xmas
>> fashion (even those which I don't intend to touch w.r.t the patch
>> logic), or do I do that for only my additions?
> 
> We try to stay as close to reverse-xmas tree as possible. It's not 
> always possible (e.g., dependent assignments), but fpb_flags in this 
> case here can easily go all the way to the top.

Sure.

> 
> ...
> 
>>
>>>
>>>   >       ptl = pmd_trans_huge_lock(pmd, vma);>       if (ptl) {
>>>> @@ -586,7 +589,8 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>> unsigned long addr,
>>>>            walk->action = ACTION_AGAIN;
>>>>            return 0;
>>>>        }
>>>   > -    for (; addr != end; pte++, addr += PAGE_SIZE) {> +    for (;
>>> addr != end; pte += nr, addr += nr * PAGE_SIZE) {
>>>> +        nr = 1;
>>>>            ptent = ptep_get(pte);
>>>>            if (pte_none(ptent))
>>>>                continue;
>>>> @@ -607,6 +611,11 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>> unsigned long addr,
>>>>            if (!queue_folio_required(folio, qp))
>>>>                continue;
>>>>            if (folio_test_large(folio)) {
>>>> +            max_nr = (end - addr) >> PAGE_SHIFT;
>>>> +            if (max_nr != 1)
>>>> +                nr = folio_pte_batch(folio, addr, pte, ptent,
>>>> +                             max_nr, fpb_flags,
>>>> +                             NULL, NULL, NULL);
>>>
>>> We should probably do that immediately after we verified that
>>> vm_normal_folio() have us something reasonable.
>>
>> But shouldn't we keep the small folio case separate to avoid the
>> overhead of folio_pte_batch()?
> 
> Yes, just do something like
> 
> if (folio_test_large(folio) && end - addr > 1)
>      nr = folio_pte_batch(folio, addr, pte, ptent, end - addr,
>                   max_nr, fpb_flags, ...);
> 
> before the folio_test_reserved().
> 
> Then you'd also skip the all ptes if !queue_folio_required.

Ah got you, thanks.

> 
>>
>>>
>>>>                /*
>>>>                 * A large folio can only be isolated from LRU once,
>>>>                 * but may be mapped by many PTEs (and Copy-On-Write may
>>>> @@ -633,6 +642,7 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>> unsigned long addr,
>>>>                qp->nr_failed++;
>>>>                if (strictly_unmovable(flags))
>>>>                    break;
>>>> +            qp->nr_failed += nr - 1;
>>>
>>> Can't we do qp->nr_failed += nr; above?
>>
>> I did not dive deep into the significance of nr_failed, but I did that
>> to keep the code, before and after the change, equivalent:
> 
> And I question exactly that.
> 
> If we hit strictly_unmovable(flags), we end up returning "-EIO" from
> queue_folios_pte_range().
> 
> And staring at queue_pages_range(), we ignore nr_failed if 
> walk_page_range() returned an error.
> 
> So looks like we can just add everything in one shot, independent of 
> strictly_unmovable()?

Looks good to me this way. I'll change it, thanks.

> 

