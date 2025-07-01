Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04FB4A0C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358290; cv=none; b=mkZZ2kL9FHF6U3pB9vePjINcVxVzOs8MJ6MpfCpENCjZCUOHie1KIcRA6wtEkiP7XmkJicMSiRYizVYskmcbF5xr/usxbSPjN3AkRsh/s5HY6wZvAdcCb26ZHXeAYCH2ZpfT0lL8A0K5eEgx5kMucBJFy90GWEmirpJWoA8pg0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358290; c=relaxed/simple;
	bh=07SQp45ItPBZ03+iVcKSIheXzeLvHdb2pCIgf63VvBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oobdvjpFlwPh6gyqhXEQ0R7Qpd+B/U0yhxl9hjHlKK+Llg7s1ZjujvxL1c4+43kPoyjG4yKhs0fFJGRsostNRcsLHGS/wg/m2vuCLeTfrpxri+nWjkAEbBGk10aCa1AcO2eu+TZ4ROW48bp4asSEmHR1XKTrtXy+ni12n9x6Kbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C004A1595;
	Tue,  1 Jul 2025 01:24:31 -0700 (PDT)
Received: from [10.57.84.129] (unknown [10.57.84.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF66A3F58B;
	Tue,  1 Jul 2025 01:24:42 -0700 (PDT)
Message-ID: <a2277182-53c8-4b3e-a2d1-3115030fdd5a@arm.com>
Date: Tue, 1 Jul 2025 09:24:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
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
 <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
 <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <f5b68790-b997-49f5-ac90-aeb3e34df690@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <f5b68790-b997-49f5-ac90-aeb3e34df690@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2025 09:06, Dev Jain wrote:
> 
> On 01/07/25 1:33 pm, Ryan Roberts wrote:
>> On 30/06/2025 13:52, Lorenzo Stoakes wrote:
>>> On Sat, Jun 28, 2025 at 05:04:34PM +0530, Dev Jain wrote:
>>>> Use folio_pte_batch to batch process a large folio. Reuse the folio from
>>>> prot_numa case if possible.
>>>>
>>>> For all cases other than the PageAnonExclusive case, if the case holds true
>>>> for one pte in the batch, one can confirm that that case will hold true for
>>>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
>>>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty
>>>> and access bits across the batch, therefore batching across
>>>> pte_dirty(): this is correct since the dirty bit on the PTE really is
>>>> just an indication that the folio got written to, so even if the PTE is
>>>> not actually dirty (but one of the PTEs in the batch is), the wp-fault
>>>> optimization can be made.
>>>>
>>>> The crux now is how to batch around the PageAnonExclusive case; we must
>>>> check the corresponding condition for every single page. Therefore, from
>>>> the large folio batch, we process sub batches of ptes mapping pages with
>>>> the same PageAnonExclusive condition, and process that sub batch, then
>>>> determine and process the next sub batch, and so on. Note that this does
>>>> not cause any extra overhead; if suppose the size of the folio batch
>>>> is 512, then the sub batch processing in total will take 512 iterations,
>>>> which is the same as what we would have done before.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>   mm/mprotect.c | 143 +++++++++++++++++++++++++++++++++++++++++---------
>>>>   1 file changed, 117 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>>> index 627b0d67cc4a..28c7ce7728ff 100644
>>>> --- a/mm/mprotect.c
>>>> +++ b/mm/mprotect.c
>>>> @@ -40,35 +40,47 @@
>>>>
>>>>   #include "internal.h"
>>>>
>>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> -                 pte_t pte)
>>>> -{
>>>> -    struct page *page;
>>>> +enum tristate {
>>>> +    TRI_FALSE = 0,
>>>> +    TRI_TRUE = 1,
>>>> +    TRI_MAYBE = -1,
>>>> +};
>>> Yeah no, absolutely not, this is horrible, I don't want to see an arbitrary type
>>> like this added, to a random file, and I absolutely think this adds confusion
>>> and does not in any way help clarify things.
>>>
>>>> +/*
>>>> + * Returns enum tristate indicating whether the pte can be changed to
>>>> writable.
>>>> + * If TRI_MAYBE is returned, then the folio is anonymous and the user must
>>>> + * additionally check PageAnonExclusive() for every page in the desired range.
>>>> + */
>>>> +static int maybe_change_pte_writable(struct vm_area_struct *vma,
>>>> +                     unsigned long addr, pte_t pte,
>>>> +                     struct folio *folio)
>>>> +{
>>>>       if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>>>> -        return false;
>>>> +        return TRI_FALSE;
>>>>
>>>>       /* Don't touch entries that are not even readable. */
>>>>       if (pte_protnone(pte))
>>>> -        return false;
>>>> +        return TRI_FALSE;
>>>>
>>>>       /* Do we need write faults for softdirty tracking? */
>>>>       if (pte_needs_soft_dirty_wp(vma, pte))
>>>> -        return false;
>>>> +        return TRI_FALSE;
>>>>
>>>>       /* Do we need write faults for uffd-wp tracking? */
>>>>       if (userfaultfd_pte_wp(vma, pte))
>>>> -        return false;
>>>> +        return TRI_FALSE;
>>>>
>>>>       if (!(vma->vm_flags & VM_SHARED)) {
>>>>           /*
>>>>            * Writable MAP_PRIVATE mapping: We can only special-case on
>>>>            * exclusive anonymous pages, because we know that our
>>>>            * write-fault handler similarly would map them writable without
>>>> -         * any additional checks while holding the PT lock.
>>>> +         * any additional checks while holding the PT lock. So if the
>>>> +         * folio is not anonymous, we know we cannot change pte to
>>>> +         * writable. If it is anonymous then the caller must further
>>>> +         * check that the page is AnonExclusive().
>>>>            */
>>>> -        page = vm_normal_page(vma, addr, pte);
>>>> -        return page && PageAnon(page) && PageAnonExclusive(page);
>>>> +        return (!folio || folio_test_anon(folio)) ? TRI_MAYBE : TRI_FALSE;
>>>>       }
>>>>
>>>>       VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>>>> @@ -80,15 +92,61 @@ bool can_change_pte_writable(struct vm_area_struct *vma,
>>>> unsigned long addr,
>>>>        * FS was already notified and we can simply mark the PTE writable
>>>>        * just like the write-fault handler would do.
>>>>        */
>>>> -    return pte_dirty(pte);
>>>> +    return pte_dirty(pte) ? TRI_TRUE : TRI_FALSE;
>>>> +}
>>> Yeah not a fan of this at all.
>>>
>>> This is squashing all the logic into one place when we don't really need to.
>>>
>>> We can separate out the shared logic and just do something like:
>>>
>>> ////// Lorenzo's suggestion //////
>>>
>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>> -                 pte_t pte)
>>> +static bool maybe_change_pte_writable(struct vm_area_struct *vma,
>>> +        pte_t pte)
>>>   {
>>> -    struct page *page;
>>> -
>>>       if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>>>           return false;
>>>
>>> @@ -60,16 +58,14 @@ bool can_change_pte_writable(struct vm_area_struct *vma,
>>> unsigned long addr,
>>>       if (userfaultfd_pte_wp(vma, pte))
>>>           return false;
>>>
>>> -    if (!(vma->vm_flags & VM_SHARED)) {
>>> -        /*
>>> -         * Writable MAP_PRIVATE mapping: We can only special-case on
>>> -         * exclusive anonymous pages, because we know that our
>>> -         * write-fault handler similarly would map them writable without
>>> -         * any additional checks while holding the PT lock.
>>> -         */
>>> -        page = vm_normal_page(vma, addr, pte);
>>> -        return page && PageAnon(page) && PageAnonExclusive(page);
>>> -    }
>>> +    return true;
>>> +}
>>> +
>>> +static bool can_change_shared_pte_writable(struct vm_area_struct *vma,
>>> +        pte_t pte)
>>> +{
>>> +    if (!maybe_change_pte_writable(vma, pte))
>>> +        return false;
>>>
>>>       VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>>>
>>> @@ -83,6 +79,33 @@ bool can_change_pte_writable(struct vm_area_struct *vma,
>>> unsigned long addr,
>>>       return pte_dirty(pte);
>>>   }
>>>
>>> +static bool can_change_private_pte_writable(struct vm_area_struct *vma,
>>> +        unsigned long addr, pte_t pte)
>>> +{
>>> +    struct page *page;
>>> +
>>> +    if (!maybe_change_pte_writable(vma, pte))
>>> +        return false;
>>> +
>>> +    /*
>>> +     * Writable MAP_PRIVATE mapping: We can only special-case on
>>> +     * exclusive anonymous pages, because we know that our
>>> +     * write-fault handler similarly would map them writable without
>>> +     * any additional checks while holding the PT lock.
>>> +     */
>>> +    page = vm_normal_page(vma, addr, pte);
>>> +    return page && PageAnon(page) && PageAnonExclusive(page);
>>> +}
>>> +
>>> +bool can_change_pte_writable(struct vm_area_struct *vma,
>>> +        unsigned long addr, pte_t pte)
>>> +{
>>> +    if (vma->vm_flags & VM_SHARED)
>>> +        return can_change_shared_pte_writable(vma, pte);
>>> +
>>> +    return can_change_private_pte_writable(vma, addr, pte);
>>> +}
>>> +
>>>
>>> ////// end of Lorenzo's suggestion //////
>>>
>>> You can obviously modify this to change other stuff like whether you feed back
>>> the PAE or not in private case for use in your code.
>> This sugestion for this part of the problem looks much cleaner!
>>
>> Sorry; this whole struct tristate thing was my idea. I never really liked it but
>> I was more focussed on trying to illustrate the big picture flow that I thought
>> would work well with a batch and sub-batches (which it seems below that you
>> hate... but let's talk about that down there).
>>
>>>> +
>>>> +/*
>>>> + * Returns the number of pages within the folio, starting from the page
>>>> + * indicated by pgidx and up to pgidx + max_nr, that have the same value of
>>>> + * PageAnonExclusive(). Must only be called for anonymous folios. Value of
>>>> + * PageAnonExclusive() is returned in *exclusive.
>>>> + */
>>>> +static int anon_exclusive_batch(struct folio *folio, int pgidx, int max_nr,
>>>> +                bool *exclusive)
>>> Let's generalise it to something like count_folio_fungible_pages()
>>>
>>> or maybe count_folio_batchable_pages()?
>>>
>>> Yes naming is hard... :P but right now it reads like this is returning a batch
>>> or doing something with a batch.
>>>
>>>> +{
>>>> +    struct page *page;
>>>> +    int nr = 1;
>>>> +
>>>> +    if (!folio) {
>>>> +        *exclusive = false;
>>>> +        return nr;
>>>> +    }
>>>> +
>>>> +    page = folio_page(folio, pgidx++);
>>>> +    *exclusive = PageAnonExclusive(page);
>>>> +    while (nr < max_nr) {
>>> The C programming language asks why you don't like using for :)
>>>
>>>> +        page = folio_page(folio, pgidx++);
>>>> +        if ((*exclusive) != PageAnonExclusive(page))
>>>> +            break;
>>>> +        nr++;
>>> This *exclusive stuff makes me want to cry :)
>>>
>>> Just set a local variable and hand it back at the end.
>>>
>>>> +    }
>>>> +
>>>> +    return nr;
>>>> +}
>>>> +
>>>> +bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> +                 pte_t pte)
>>>> +{
>>>> +    struct page *page;
>>>> +    int ret;
>>>> +
>>>> +    ret = maybe_change_pte_writable(vma, addr, pte, NULL);
>>>> +    if (ret == TRI_MAYBE) {
>>>> +        page = vm_normal_page(vma, addr, pte);
>>>> +        ret = page && PageAnon(page) && PageAnonExclusive(page);
>>>> +    }
>>>> +
>>>> +    return ret;
>>>>   }
>>> See above comments on this stuff.
>>>
>>>>   static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>>>> -        pte_t *ptep, pte_t pte, int max_nr_ptes)
>>>> +        pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t switch_off_flags)
>>> This last parameter is pretty horrible. It's a negative mask so now you're
>>> passing 'ignore soft dirty' to the function meaning 'don't ignore it'. This is
>>> just planting land mines.
>>>
>>> Obviously David's flag changes will also alter all this.
>>>
>>> Just add a boolean re: soft dirty.
>> Dev had a boolean for this in the last round. I've seen various functions expand
>> over time with increasing numbers of bool flags. So I asked to convert to a
>> flags parameter and just pass in the flags we need. Then it's a bit more future
>> proof and self documenting. (For the record I dislike the "switch_off_flags"
>> approach taken here).
>>
>>>>   {
>>>> -    const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +    fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +
>>>> +    flags &= ~switch_off_flags;
>>>>
>>>> -    if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>>>> +    if (!folio || !folio_test_large(folio))
>>>>           return 1;
>>> Why remove this last check?
>>>
>>>>       return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>>>> @@ -154,7 +212,8 @@ static int prot_numa_skip_ptes(struct folio **foliop,
>>>> struct vm_area_struct *vma
>>>>       }
>>>>
>>>>   skip_batch:
>>>> -    nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
>>>> +    nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>>>> +                       max_nr_ptes, 0);
>>> See above about flag param. If you change to boolean, please prefix this with
>>> e.g. /* set_soft_dirty= */ true or whatever the flag ends up being :)
>>>
>>>>   out:
>>>>       *foliop = folio;
>>>>       return nr_ptes;
>>>> @@ -191,7 +250,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>           if (pte_present(oldpte)) {
>>>>               int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>>>               struct folio *folio = NULL;
>>>> -            pte_t ptent;
>>>> +            int sub_nr_ptes, pgidx = 0;
>>>> +            pte_t ptent, newpte;
>>>> +            bool sub_set_write;
>>>> +            int set_write;
>>>>
>>>>               /*
>>>>                * Avoid trapping faults against the zero or KSM
>>>> @@ -206,6 +268,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                       continue;
>>>>               }
>>>>
>>>> +            if (!folio)
>>>> +                folio = vm_normal_folio(vma, addr, oldpte);
>>>> +
>>>> +            nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>>>> +                               max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);
>>> Don't we only care about S/D if pte_needs_soft_dirty_wp()?
>>>
>>>>               oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>>>               ptent = pte_modify(oldpte, newprot);
>>>>
>>>> @@ -227,15 +294,39 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                * example, if a PTE is already dirty and no other
>>>>                * COW or special handling is required.
>>>>                */
>>>> -            if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>>> -                !pte_write(ptent) &&
>>>> -                can_change_pte_writable(vma, addr, ptent))
>>>> -                ptent = pte_mkwrite(ptent, vma);
>>>> -
>>>> -            modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>>> -            if (pte_needs_flush(oldpte, ptent))
>>>> -                tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>>> -            pages++;
>>>> +            set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>>> +                    !pte_write(ptent);
>>>> +            if (set_write)
>>>> +                set_write = maybe_change_pte_writable(vma, addr, ptent,
>>>> folio);
>>>> +
>>>> +            while (nr_ptes) {
>>>> +                if (set_write == TRI_MAYBE) {
>>>> +                    sub_nr_ptes = anon_exclusive_batch(folio,
>>>> +                        pgidx, nr_ptes, &sub_set_write);
>>>> +                } else {
>>>> +                    sub_nr_ptes = nr_ptes;
>>>> +                    sub_set_write = (set_write == TRI_TRUE);
>>>> +                }
>>>> +
>>>> +                if (sub_set_write)
>>>> +                    newpte = pte_mkwrite(ptent, vma);
>>>> +                else
>>>> +                    newpte = ptent;
>>>> +
>>>> +                modify_prot_commit_ptes(vma, addr, pte, oldpte,
>>>> +                            newpte, sub_nr_ptes);
>>>> +                if (pte_needs_flush(oldpte, newpte))
>>>> +                    tlb_flush_pte_range(tlb, addr,
>>>> +                        sub_nr_ptes * PAGE_SIZE);
>>>> +
>>>> +                addr += sub_nr_ptes * PAGE_SIZE;
>>>> +                pte += sub_nr_ptes;
>>>> +                oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
>>>> +                ptent = pte_advance_pfn(ptent, sub_nr_ptes);
>>>> +                nr_ptes -= sub_nr_ptes;
>>>> +                pages += sub_nr_ptes;
>>>> +                pgidx += sub_nr_ptes;
>>>> +            }
>>> I hate hate hate having this loop here, let's abstract this please.
>>>
>>> I mean I think we can just use mprotect_folio_pte_batch() no? It's not
>>> abstracting much here, and we can just do all this handling there. Maybe have to
>>> pass in a bunch more params, but it saves us having to do all this.
>> In an ideal world we would flatten and just have mprotect_folio_pte_batch()
>> return the batch size considering all the relevant PTE bits AND the
>> AnonExclusive bit on the pages. IIRC one of Dev's earlier versions modified the
>> core folio_pte_batch() function to also look at the AnonExclusive bit, but I
>> really disliked changing that core function (I think others did too?).
> 
> That patch was in our private exchange, not on the list.

Ahh, my bad. Well perhaps that type of approach is what Lorenzo is arguing in
favour of then? Perhaps I should just shut up and get out of the way :)

> 
>>
>> So barring that approach, we are really only left with the batch and sub-batch
>> approach - although, yes, it could be abstracted more. We could maintain a
>> context struct that persists across all calls to mprotect_folio_pte_batch() and
>> it can use that to keep it's state to remember if we are in the middle of a
>> sub-batch and decide either to call folio_pte_batch() to get a new batch, or
>> call anon_exclusive_batch() to get the next sub-batch within the current batch.
>> But that started to feel overly abstracted to me.
>>
>> This loop approach, as written, felt more straightforward for the reader to
>> understand (i.e. the least-worst option). Is the context approach what you are
>> suggesting or do you have something else in mind?
>>
>>> Alternatively, we could add a new wrapper function, but yeah definitely not
>>> this.
>>>
>>> Also the C programming language asks... etc etc. ;)
>>>
>>> Overall since you always end up processing folio_nr_pages(folio) you can just
>>> have the batch function or a wrapper return this and do updates as necessary
>>> here on that basis, and leave the 'sub' batching to that function.
>> Sorry I don't understand this statement - could you clarify? Especially the bit
>> about "always ... processing folio_nr_pages(folio)"; I don't think we do. In
>> various corner cases the size of the folio has no relationship to the way the
>> PTEs are mapped.
>>
>> Thanks,
>> Ryan
>>
>>>
>>>>           } else if (is_swap_pte(oldpte)) {
>>>>               swp_entry_t entry = pte_to_swp_entry(oldpte);
>>>>               pte_t newpte;
>>>> -- 
>>>> 2.30.2
>>>>

