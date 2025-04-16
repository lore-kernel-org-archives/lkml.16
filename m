Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A46232368
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793737; cv=none; b=kAcF1otinTrD4x9xCzAWgsM4fQAWui3mF1hP4DVVWHBzDd9YQtx5CMWfqtb7MJi2rhkHUpVbh2PfO0ZUzkg8A9waWcEBdJUaNoA/4Tjm7mYFb8LWqWbjDBzJLBVUbabvGDY/xjBCPejkkTVdKyamNnC/fNdYZNoOPoUSAmewlNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793737; c=relaxed/simple;
	bh=tHTbotaHIx1TRZDQHKUtMWVP60FIcBQOR/mllBoTpaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q24BOVKxMsT8oo/P65gaKMGguH6BztZQMNABUSnlIEbkgV5Po4oq/HMCEyLShpEWrC991gC2qJsePW3KIT1n/QLUIBpiXlzBrqmxSmdh3++kbEk4dAGjWdG7PrHCs3GP29gH0wmqwmQaJshPLAX6WwgDjxg/aWHZ0o5XeTlSrss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B773152B;
	Wed, 16 Apr 2025 01:55:31 -0700 (PDT)
Received: from [10.163.75.121] (unknown [10.163.75.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F9F03F66E;
	Wed, 16 Apr 2025 01:55:28 -0700 (PDT)
Message-ID: <4089150b-0cb8-45f1-bdae-035b047bd9a6@arm.com>
Date: Wed, 16 Apr 2025 14:25:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hughd@google.com, vishal.moola@gmail.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250411081301.8533-1-dev.jain@arm.com>
 <09c77ab5-65fc-4bca-a7e5-2b11bba9330d@redhat.com>
 <9ed4c113-37eb-4e3d-98a1-f46f786aaea9@arm.com>
 <fa4ee2f1-223d-4af3-8e3e-a1371688a548@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <fa4ee2f1-223d-4af3-8e3e-a1371688a548@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/04/25 1:03 pm, Baolin Wang wrote:
> 
> 
> On 2025/4/15 19:47, Dev Jain wrote:
>>
>>
>> On 15/04/25 3:47 pm, David Hildenbrand wrote:
>>> On 11.04.25 10:13, Dev Jain wrote:
>>>> After the check for queue_folio_required(), the code only cares 
>>>> about the
>>>> folio in the for loop, i.e the PTEs are redundant. Therefore, 
>>>> optimize this
>>>> loop by skipping over a PTE batch mapping the same folio.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>> Unfortunately I have only build tested this since my test 
>>>> environment is
>>>> broken.
>>>>
>>>>   mm/mempolicy.c | 12 +++++++++++-
>>>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>>> index b28a1e6ae096..b019524da8a2 100644
>>>> --- a/mm/mempolicy.c
>>>> +++ b/mm/mempolicy.c
>>>> @@ -573,6 +573,9 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>>> unsigned long addr,
>>>>       pte_t *pte, *mapped_pte;
>>>>       pte_t ptent;
>>>>       spinlock_t *ptl;
>>>> +    int max_nr;
>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +    int nr = 1;
>>>
>>> Try sticking to reverse xmas tree, please. (not completely the case 
>>> here, but fpb_flags can easily be moved all he way to the top)
>>
>> I thought that the initializations were to be kept at the bottom.
>> Asking for future patches, should I put all declarations in reverse- 
>> xmas fashion (even those which I don't intend to touch w.r.t the patch 
>> logic), or do I do that for only my additions?
>>
>>>
>>> Also, why are you initializing nr to 1 here if you reinitialize it 
>>> below?
>>
>> Yup no need, I thought pte += nr will blow up due to nr not being 
>> initialized, but it won't because it gets executed just before the 
>> start of the second iteration.
>>
>>>
>>>  >       ptl = pmd_trans_huge_lock(pmd, vma);>       if (ptl) {
>>>> @@ -586,7 +589,8 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>>> unsigned long addr,
>>>>           walk->action = ACTION_AGAIN;
>>>>           return 0;
>>>>       }
>>>  > -    for (; addr != end; pte++, addr += PAGE_SIZE) {> +    for (; 
>>> addr != end; pte += nr, addr += nr * PAGE_SIZE) {
>>>> +        nr = 1;
>>>>           ptent = ptep_get(pte);
>>>>           if (pte_none(ptent))
>>>>               continue;
>>>> @@ -607,6 +611,11 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>>> unsigned long addr,
>>>>           if (!queue_folio_required(folio, qp))
>>>>               continue;
>>>>           if (folio_test_large(folio)) {
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
>>
>>>
>>>>               /*
>>>>                * A large folio can only be isolated from LRU once,
>>>>                * but may be mapped by many PTEs (and Copy-On-Write may
>>>> @@ -633,6 +642,7 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>>> unsigned long addr,
>>>>               qp->nr_failed++;
>>>>               if (strictly_unmovable(flags))
>>>>                   break;
>>>> +            qp->nr_failed += nr - 1;
>>>
>>> Can't we do qp->nr_failed += nr; above?
>>
>> I did not dive deep into the significance of nr_failed, but I did that
>> to keep the code, before and after the change, equivalent:
>>
>> Claim: if we reach qp->nr_failed++ for a single pte, we will reach 
>> here for all ptes belonging to the same batch.
> 
> Sorry, I missed the previous discussion (I replied to your new version). 
> I think this claim is incorrect, we will skip remaining ptes belonging 
> to the same batch with checking 'qp->large'.
> 
>          if (folio_test_large(folio)) {
>              if (folio == qp->large)
>                  continue;
>              qp->large = folio;
>          }

Oops you are right, I missed that.
