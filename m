Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9496A28F1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355222; cv=none; b=SiwjoB7gE1c9hUeaU0aQLwYDX8ByVldYxZKpRnYOaNF2p+5HEbELtF2HRiJDDMxT/Ua+boSPnRn9nPx162bEt0xYbSL75VDc4WoI/yHlFljifDDfoy3OCrmSoSgXs3e6mylVGxnEF+XOwf2ssYX8a8VLVifh4712Wr2oYR8mMI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355222; c=relaxed/simple;
	bh=fbGdfd40WQEcJg/zfA0Iioyi/s8mQEXXJt46ANnMZ8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOiNsYbSDsvmOA7JdIBA6zkS9SHt7/oluk+wePzcrEDKAKny92ZtWuULv3S8PPCeA6KiVsfJ3FJAhLv08gr0NuLcyvTfbH09g11oUx674RlC51JT9MMem6MPvqjGtcuGdakPK7iMwRkZXhAtLjujTsErNR5Nf17cgE/yjuwM3b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 359941595;
	Tue,  1 Jul 2025 00:33:23 -0700 (PDT)
Received: from [10.57.84.129] (unknown [10.57.84.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 606453F6A8;
	Tue,  1 Jul 2025 00:33:34 -0700 (PDT)
Message-ID: <23a213b8-280a-4544-a210-7c18a0caf8a9@arm.com>
Date: Tue, 1 Jul 2025 08:33:32 +0100
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
To: Dev Jain <dev.jain@arm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-3-dev.jain@arm.com>
 <a305816d-7770-47ec-bb21-1572c7c7783b@lucifer.local>
 <c12e2958-5a51-439d-aa86-e72d85699562@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c12e2958-5a51-439d-aa86-e72d85699562@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2025 05:44, Dev Jain wrote:
> 
> On 30/06/25 6:27 pm, Lorenzo Stoakes wrote:
>> On Sat, Jun 28, 2025 at 05:04:33PM +0530, Dev Jain wrote:
>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>>> Architecture can override these helpers; in case not, they are implemented
>>> as a simple loop over the corresponding single pte helpers.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> Looks generally sensible! Some comments below.
>>
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
>>>
>>>   /*
>>>    * Commit an update to a pte, leaving any hardware-controlled bits in
>>> - * the PTE unmodified.
>>> + * the PTE unmodified. The pte may have been "upgraded" w.r.t a/d bits compared
>>> + * to the old_pte, as in, it may have a/d bits on which were off in old_pte.
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
>> Weird place to put this increment, maybe just stick it in the for loop.
>>
>>> +        addr += PAGE_SIZE;
>> Same comment here.
> 
> Sure.
> 
>>
>>> +        old_pte = pte_next_pfn(old_pte);
>> Could be:
>>
>>         old_pte = pte;
>>
>> No?
> 
> We will need to update old_pte also since that
> is used by powerpc in radix__ptep_modify_prot_commit().

I think perhaps Lorenzo has the model in his head where old_pte is the previous
pte in the batch. That's not the case. old_pte is the value of the pte in the
current position of the batch before any changes were made. pte is the new value
for the pte. So we need to expliticly advance the PFN in both old_pte and pte
each iteration round the loop.

> 
>>
>>> +        pte = pte_next_pfn(pte);
>>> +    }
>>> +}
>>> +#endif
>>> +
>>>   #endif /* CONFIG_MMU */
>>>
>>>   /*
>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>> index af10a7fbe6b8..627b0d67cc4a 100644
>>> --- a/mm/mprotect.c
>>> +++ b/mm/mprotect.c
>>> @@ -206,7 +206,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>                       continue;
>>>               }
>>>
>>> -            oldpte = ptep_modify_prot_start(vma, addr, pte);
>>> +            oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>>               ptent = pte_modify(oldpte, newprot);
>>>
>>>               if (uffd_wp)
>>> @@ -232,7 +232,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>                   can_change_pte_writable(vma, addr, ptent))
>>>                   ptent = pte_mkwrite(ptent, vma);
>>>
>>> -            ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
>>> +            modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>>               if (pte_needs_flush(oldpte, ptent))
>>>                   tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>>               pages++;
>>> -- 
>>> 2.30.2
>>>

