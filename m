Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FB126A1CC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358194; cv=none; b=Tei/Zv4884/WWZ5nd0NP8es4XGWw1T9DXyDqvCwjTy2oWxcJEuDhjRWPW5KW3V9lzTq46ToYdY2Bude27cifbaN2PT0hJ/4NooPjJj7I81kMHeH0Km/H7xzyWxu/LZzSuZTAughX58c50vLAvL3ZyxJR4WG9CpWKLbcuq1z/Ew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358194; c=relaxed/simple;
	bh=Z0gWxbm3ywzk3uodK//Wdljvan3Q/kV1K7Ncxkf3ekQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoL6UHOnx0VZLd1YJgnEej9zJNJqkoiwS2jz/MxvYQCssHfQDymwHk8wOEITnnmbHTzDmbxAnF6xjBoQItoUr1XmW70UoM2tIB2iDYtg3tiDrVrBCAd+8vubjVSVYGu0DYeSzR9Y0R4QzupRAnOLIy4KzkQTDla79wBKs1zNnjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A94E51595;
	Tue,  1 Jul 2025 01:22:56 -0700 (PDT)
Received: from [10.57.84.129] (unknown [10.57.84.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE0583F58B;
	Tue,  1 Jul 2025 01:23:07 -0700 (PDT)
Message-ID: <3959a598-c7c0-4321-ae2f-f45e5ff144e4@arm.com>
Date: Tue, 1 Jul 2025 09:23:05 +0100
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
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-3-dev.jain@arm.com>
 <a305816d-7770-47ec-bb21-1572c7c7783b@lucifer.local>
 <c12e2958-5a51-439d-aa86-e72d85699562@arm.com>
 <23a213b8-280a-4544-a210-7c18a0caf8a9@arm.com>
 <b214edda-4162-47fd-a9e0-c2a4cee3ac88@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <b214edda-4162-47fd-a9e0-c2a4cee3ac88@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2025 09:06, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 08:33:32AM +0100, Ryan Roberts wrote:
>> On 01/07/2025 05:44, Dev Jain wrote:
>>>
>>> On 30/06/25 6:27 pm, Lorenzo Stoakes wrote:
>>>> On Sat, Jun 28, 2025 at 05:04:33PM +0530, Dev Jain wrote:
>>>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>>>>> Architecture can override these helpers; in case not, they are implemented
>>>>> as a simple loop over the corresponding single pte helpers.
>>>>>
>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> Looks generally sensible! Some comments below.
>>>>
>>>>> ---
>>>>>   include/linux/pgtable.h | 83 ++++++++++++++++++++++++++++++++++++++++-
>>>>>   mm/mprotect.c           |  4 +-
>>>>>   2 files changed, 84 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>>> index cf1515c163e2..662f39e7475a 100644
>>>>> --- a/include/linux/pgtable.h
>>>>> +++ b/include/linux/pgtable.h
>>>>> @@ -1331,7 +1331,8 @@ static inline pte_t ptep_modify_prot_start(struct
>>>>> vm_area_struct *vma,
>>>>>
>>>>>   /*
>>>>>    * Commit an update to a pte, leaving any hardware-controlled bits in
>>>>> - * the PTE unmodified.
>>>>> + * the PTE unmodified. The pte may have been "upgraded" w.r.t a/d bits compared
>>>>> + * to the old_pte, as in, it may have a/d bits on which were off in old_pte.
>>>>>    */
>>>>>   static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>>>>                          unsigned long addr,
>>>>> @@ -1340,6 +1341,86 @@ static inline void ptep_modify_prot_commit(struct
>>>>> vm_area_struct *vma,
>>>>>       __ptep_modify_prot_commit(vma, addr, ptep, pte);
>>>>>   }
>>>>>   #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
>>>>> +
>>>>> +/**
>>>>> + * modify_prot_start_ptes - Start a pte protection read-modify-write
>>>>> transaction
>>>>> + * over a batch of ptes, which protects against asynchronous hardware
>>>>> + * modifications to the ptes. The intention is not to prevent the hardware from
>>>>> + * making pte updates, but to prevent any updates it may make from being lost.
>>>>> + * Please see the comment above ptep_modify_prot_start() for full description.
>>>>> + *
>>>>> + * @vma: The virtual memory area the pages are mapped into.
>>>>> + * @addr: Address the first page is mapped at.
>>>>> + * @ptep: Page table pointer for the first entry.
>>>>> + * @nr: Number of entries.
>>>>> + *
>>>>> + * May be overridden by the architecture; otherwise, implemented as a simple
>>>>> + * loop over ptep_modify_prot_start(), collecting the a/d bits from each pte
>>>>> + * in the batch.
>>>>> + *
>>>>> + * Note that PTE bits in the PTE batch besides the PFN can differ.
>>>>> + *
>>>>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>>>>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>>>>> + * Since the batch is determined from folio_pte_batch, the PTEs must differ
>>>>> + * only in a/d bits (and the soft dirty bit; see fpb_t flags in
>>>>> + * mprotect_folio_pte_batch()).
>>>>> + */
>>>>> +#ifndef modify_prot_start_ptes
>>>>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>>>>> +        unsigned long addr, pte_t *ptep, unsigned int nr)
>>>>> +{
>>>>> +    pte_t pte, tmp_pte;
>>>>> +
>>>>> +    pte = ptep_modify_prot_start(vma, addr, ptep);
>>>>> +    while (--nr) {
>>>>> +        ptep++;
>>>>> +        addr += PAGE_SIZE;
>>>>> +        tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>>>>> +        if (pte_dirty(tmp_pte))
>>>>> +            pte = pte_mkdirty(pte);
>>>>> +        if (pte_young(tmp_pte))
>>>>> +            pte = pte_mkyoung(pte);
>>>>> +    }
>>>>> +    return pte;
>>>>> +}
>>>>> +#endif
>>>>> +
>>>>> +/**
>>>>> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
>>>>> + * hardware-controlled bits in the PTE unmodified.
>>>>> + *
>>>>> + * @vma: The virtual memory area the pages are mapped into.
>>>>> + * @addr: Address the first page is mapped at.
>>>>> + * @ptep: Page table pointer for the first entry.
>>>>> + * @old_pte: Old page table entry (for the first entry) which is now cleared.
>>>>> + * @pte: New page table entry to be set.
>>>>> + * @nr: Number of entries.
>>>>> + *
>>>>> + * May be overridden by the architecture; otherwise, implemented as a simple
>>>>> + * loop over ptep_modify_prot_commit().
>>>>> + *
>>>>> + * Context: The caller holds the page table lock. The PTEs are all in the same
>>>>> + * PMD. On exit, the set ptes in the batch map the same folio. The pte may have
>>>>> + * been "upgraded" w.r.t a/d bits compared to the old_pte, as in, it may have
>>>>> + * a/d bits on which were off in old_pte.
>>>>> + */
>>>>> +#ifndef modify_prot_commit_ptes
>>>>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma,
>>>>> unsigned long addr,
>>>>> +        pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>>>>> +{
>>>>> +    int i;
>>>>> +
>>>>> +    for (i = 0; i < nr; ++i) {
>>>>> +        ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>>>>> +        ptep++;
>>>> Weird place to put this increment, maybe just stick it in the for loop.
>>>>
>>>>> +        addr += PAGE_SIZE;
>>>> Same comment here.
>>>
>>> Sure.
>>>
>>>>
>>>>> +        old_pte = pte_next_pfn(old_pte);
>>>> Could be:
>>>>
>>>>         old_pte = pte;
>>>>
>>>> No?
>>>
>>> We will need to update old_pte also since that
>>> is used by powerpc in radix__ptep_modify_prot_commit().
>>
>> I think perhaps Lorenzo has the model in his head where old_pte is the previous
>> pte in the batch. That's not the case. old_pte is the value of the pte in the
>> current position of the batch before any changes were made. pte is the new value
>> for the pte. So we need to expliticly advance the PFN in both old_pte and pte
>> each iteration round the loop.
> 
> Yeah, you're right, apologies, I'd misinterpreted.
> 
> I really, really, really hate how all this is implemented. This is obviously an
> mprotect() and legacy thing but it's almost designed for confusion. Not the
> fault of this series, and todo++ on improving mprotect as a whole (been on my
> list for a while...)

Agreed. I struggled for a long time with some of the pgtable helper abstractions
to the arch and all the assumptions they make. But ultimately all Dev is trying
to do here is make some incremental improvements, following the established
patterns. Hopefully you agree that cleanups on a larger scale should be reserved
for a systematic, focussed series.

> 
> So we're ultimately updating ptep (this thing that we update, of course, is
> buried in the middle of the function invocation) in:
> 
> 	ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> 
> We are setting *ptep++ = pte essentially (roughly speaking) right?

Yeah, pretty much.

The API was originally created for Xen IIRC. The problem is that the HW can
update the A/D bits asynchronously if the PTE is valid (from the HW perspective)
so the previous approach was to get_and_clear (atomic), modify, write. But that
required 2 Xen hypervisor calls per PTE. This start/commit approach allows Xen
to both avoid the get_and_clear() and batch the writes for all PTEs in a lazy
mmu batch. So hypervisor calls are reduced from 2 per PTE to 1 per lazy mmu
batch. TBH I'm no Xen expert; some of those details may be off, but big picture
is correct.

Anyway, arm64 doesn't care about any of that, but it does override
ptep_modify_prot_start() / ptep_modify_prot_commit() to implement an erratum
workaround. And it can benefit substantially from batching.

> 
> And the arch needs to know about any bits that have changed I guess hence
> providing old_pte as well right?
> 
> OK so yeah, I get it now, we're not actually advancing through ptes here, we're
> just advancing the PFN and applying the same 'template'.
> 
> How about something like:
> 
> static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> 	       pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> {
> 	int i;
> 
> 	for (i = 0; i < nr; i++, ptep++, addr += PAGE_SIZE) {
> 		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> 
> 		/* Advance PFN only, set same flags. */
> 		old_pte = pte_next_pfn(old_pte);
> 		pte = pte_next_pfn(pte);
> 	}
> }
> 
> Neatens it up a bit and makes it clear that we're effectively propagating the
> flags here.

Yes, except we don't usually refer to the non-pfn parts of a pte as "flags". We
normally call them pgprot or prot. God knows why...

> 
>>
>>>
>>>>
>>>>> +        pte = pte_next_pfn(pte);
>>>>> +    }
>>>>> +}
>>>>> +#endif
>>>>> +
>>>>>   #endif /* CONFIG_MMU */
>>>>>
>>>>>   /*
>>>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>>>> index af10a7fbe6b8..627b0d67cc4a 100644
>>>>> --- a/mm/mprotect.c
>>>>> +++ b/mm/mprotect.c
>>>>> @@ -206,7 +206,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>>                       continue;
>>>>>               }
>>>>>
>>>>> -            oldpte = ptep_modify_prot_start(vma, addr, pte);
>>>>> +            oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>>>>               ptent = pte_modify(oldpte, newprot);
>>>>>
>>>>>               if (uffd_wp)
>>>>> @@ -232,7 +232,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>>                   can_change_pte_writable(vma, addr, ptent))
>>>>>                   ptent = pte_mkwrite(ptent, vma);
>>>>>
>>>>> -            ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
>>>>> +            modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>>>>               if (pte_needs_flush(oldpte, ptent))
>>>>>                   tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>>>>               pages++;
>>>>> --
>>>>> 2.30.2
>>>>>
>>

