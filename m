Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FC6149C4D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279720; cv=none; b=dlFxlELlcTg73lXjod51VZJ+MOL07ZkOfPnCxkkOBUpLp7gxCAdKQevM6Bl61b08A/dgqih8r45LpnPWzUKTlaBj42AJb1O9nQn36YOK0XzsOz8H86xD/rZpGvQP05y+cvkWb/iy4b3Ql0ziB3FQjDz/PXigCpDCGTTzkfOSLGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279720; c=relaxed/simple;
	bh=GbLLnyi1CxtxL4NZZ5A2wjiLRahn7+ZcNBqo1KMMroA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O/4/HwYiez4Bd3NnTm2d3h4IB9tQzhO41vfgngWm1rnuRM8HbdLEIVvq1iazdJ3iIzycTp+JdIl6AsWWETwR4RykgpoS71McnsRq4pCm0ZkwLmjRrSW2Hnfko1m/a7rbtiTER4LYMIV/xRxjtULT5b9OyAL6+MicujeGfpVHiYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70F191D34;
	Mon, 30 Jun 2025 03:35:02 -0700 (PDT)
Received: from [10.1.34.165] (XHFQ2J9959.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54EB33F58B;
	Mon, 30 Jun 2025 03:35:14 -0700 (PDT)
Message-ID: <ced934c3-a1ea-4d1c-954a-613eb20a9105@arm.com>
Date: Mon, 30 Jun 2025 11:35:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] mm: Add batched versions of
 ptep_modify_prot_start/commit
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-3-dev.jain@arm.com>
 <5f2eb53d-5fce-411f-857b-2ac16295a9f9@arm.com>
 <e1ce9e4e-03e2-4133-bbf6-9e0533dd13b1@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <e1ce9e4e-03e2-4133-bbf6-9e0533dd13b1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/06/2025 11:17, Dev Jain wrote:
> 
> On 30/06/25 3:40 pm, Ryan Roberts wrote:
>> On 28/06/2025 12:34, Dev Jain wrote:
>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>>> Architecture can override these helpers; in case not, they are implemented
>>> as a simple loop over the corresponding single pte helpers.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>   include/linux/pgtable.h | 83 ++++++++++++++++++++++++++++++++++++++++-
>>>   mm/mprotect.c           |  4 +-
>>>   2 files changed, 84 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>> index cf1515c163e2..662f39e7475a 100644
>>> --- a/include/linux/pgtable.h
>>> +++ b/include/linux/pgtable.h
>>> @@ -1331,7 +1331,8 @@ static inline pte_t ptep_modify_prot_start(struct
>>> vm_area_struct *vma,
>>>     /*
>>>    * Commit an update to a pte, leaving any hardware-controlled bits in
>>> - * the PTE unmodified.
>>> + * the PTE unmodified. The pte may have been "upgraded" w.r.t a/d bits compared
>>> + * to the old_pte, as in, it may have a/d bits on which were off in old_pte.
>> I find this last sentance a bit confusing. I think what you are trying to say is
>> somehthing like:
>>
>> """
>> old_pte is the value returned from ptep_modify_prot_start() but may additionally
>> have have young and/or dirty bits set where previously they were not.
>> """
> 
> Thanks.
> 
>> ?
>>
>>>    */
>>>   static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>>                          unsigned long addr,
>>> @@ -1340,6 +1341,86 @@ static inline void ptep_modify_prot_commit(struct
>>> vm_area_struct *vma,
>>>       __ptep_modify_prot_commit(vma, addr, ptep, pte);
>>>   }
>>>   #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
>>> +
>>> +/**
>>> + * modify_prot_start_ptes - Start a pte protection read-modify-write
>>> transaction
>>> + * over a batch of ptes, which protects against asynchronous hardware
>>> + * modifications to the ptes. The intention is not to prevent the hardware from
>>> + * making pte updates, but to prevent any updates it may make from being lost.
>>> + * Please see the comment above ptep_modify_prot_start() for full description.
>>> + *
>>> + * @vma: The virtual memory area the pages are mapped into.
>>> + * @addr: Address the first page is mapped at.
>>> + * @ptep: Page table pointer for the first entry.
>>> + * @nr: Number of entries.
>>> + *
>>> + * May be overridden by the architecture; otherwise, implemented as a simple
>>> + * loop over ptep_modify_prot_start(), collecting the a/d bits from each pte
>>> + * in the batch.
>>> + *
>>> + * Note that PTE bits in the PTE batch besides the PFN can differ.
>>> + *
>>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>>> + * Since the batch is determined from folio_pte_batch, the PTEs must differ
>>> + * only in a/d bits (and the soft dirty bit; see fpb_t flags in
>>> + * mprotect_folio_pte_batch()).
>> This last sentence is confusing... You had previous said the PFN can differ, but
>> here you imply on a, d and sd bits are allowed to differ.
> 
> Forgot to mention the PFNs, kind of took them as implied. So mentioning the PFNs
> also will do or do you suggest a better wording?

Perhaps:

"""
Context: The caller holds the page table lock.  The PTEs map consecutive
pages that belong to the same folio.  All other PTE bits must be identical for
all PTEs in the batch except for young and dirty bits.  The PTEs are all in the
same PMD.
"""

You mention the soft dirty bit not needing to be the same in your current
wording, but I don't think that is correct? soft dirty needs to be the same, right?

> 
>>
>>> + */
>>> +#ifndef modify_prot_start_ptes
>>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>>> +        unsigned long addr, pte_t *ptep, unsigned int nr)
>>> +{
>>> +    pte_t pte, tmp_pte;
>>> +
>>> +    pte = ptep_modify_prot_start(vma, addr, ptep);
>>> +    while (--nr) {
>>> +        ptep++;
>>> +        addr += PAGE_SIZE;
>>> +        tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>>> +        if (pte_dirty(tmp_pte))
>>> +            pte = pte_mkdirty(pte);
>>> +        if (pte_young(tmp_pte))
>>> +            pte = pte_mkyoung(pte);
>>> +    }
>>> +    return pte;
>>> +}
>>> +#endif
>>> +
>>> +/**
>>> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
>>> + * hardware-controlled bits in the PTE unmodified.
>>> + *
>>> + * @vma: The virtual memory area the pages are mapped into.
>>> + * @addr: Address the first page is mapped at.
>>> + * @ptep: Page table pointer for the first entry.
>>> + * @old_pte: Old page table entry (for the first entry) which is now cleared.
>>> + * @pte: New page table entry to be set.
>>> + * @nr: Number of entries.
>>> + *
>>> + * May be overridden by the architecture; otherwise, implemented as a simple
>>> + * loop over ptep_modify_prot_commit().
>>> + *
>>> + * Context: The caller holds the page table lock. The PTEs are all in the same
>>> + * PMD. On exit, the set ptes in the batch map the same folio. The pte may have
>>> + * been "upgraded" w.r.t a/d bits compared to the old_pte, as in, it may have
>>> + * a/d bits on which were off in old_pte.
>> Same comment as for ptep_modify_prot_start().
>>
>>> + */
>>> +#ifndef modify_prot_commit_ptes
>>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma,
>>> unsigned long addr,
>>> +        pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < nr; ++i) {
>>> +        ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>>> +        ptep++;
>>> +        addr += PAGE_SIZE;
>>> +        old_pte = pte_next_pfn(old_pte);
>>> +        pte = pte_next_pfn(pte);
>>> +    }
>>> +}
>>> +#endif
>>> +
>>>   #endif /* CONFIG_MMU */
>>>     /*
>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>> index af10a7fbe6b8..627b0d67cc4a 100644
>>> --- a/mm/mprotect.c
>>> +++ b/mm/mprotect.c
>>> @@ -206,7 +206,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>                       continue;
>>>               }
>>>   -            oldpte = ptep_modify_prot_start(vma, addr, pte);
>>> +            oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>> You're calling this with nr_ptes = 0 for the prot_numa case. But the
>> implementation expects minimum nr_ptes == 1.
> 
> This will get fixed when I force nr_ptes = 1 in the previous patch right?

Yep, just pointing it out.

> 
>>
>>>               ptent = pte_modify(oldpte, newprot);
>>>                 if (uffd_wp)
>>> @@ -232,7 +232,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>                   can_change_pte_writable(vma, addr, ptent))
>>>                   ptent = pte_mkwrite(ptent, vma);
>>>   -            ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
>>> +            modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>>               if (pte_needs_flush(oldpte, ptent))
>>>                   tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>>               pages++;

