Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4451EB9FA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109287; cv=none; b=PoNnFUOmZn3buVbH5GvnWYrA9+LF8Ila8sKu+juo8i6niWPOioLpT+Grp6pUfYDJHRXwXA5pYQOJdEAquO7/4T0tKXleakFOi9Zl2oitSprN1Kmsrn61BYTr/CW02l1+dZ5Odjmm/zr0W85hLxmOq36g00bU1q6P+HylNvsDurY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109287; c=relaxed/simple;
	bh=lmZMUhJc/RUM1Y2atd9G3IsircftwdnZdNMJDV8MIf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ob/Vt4z2MfV8rTuKAXWsxmthC3mehT3hk+uQ4tvzbSRkO8SVVNVbCL0bT3IdFyjn2K+G0MXKjp4v9K0BLOncDUb0q0xnyTgHfErH8MOFlQSnz+30VFVTpGRy4BvB5vG7En1GcOjFSlwD9ZGuY8mJTTwBV/7QNbvE53mCA/r1bPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E7E2150C;
	Mon, 16 Jun 2025 14:27:43 -0700 (PDT)
Received: from [10.57.84.117] (unknown [10.57.84.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35D953F58B;
	Mon, 16 Jun 2025 14:28:00 -0700 (PDT)
Message-ID: <355818a3-cee2-4802-ab16-2045da1ca950@arm.com>
Date: Mon, 16 Jun 2025 22:27:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
Content-Language: en-GB
To: Barry Song <21cnbao@gmail.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 david@redhat.com, peterx@redhat.com, mingo@kernel.org,
 libang.li@antgroup.com, maobibo@loongson.cn, zhengqi.arch@bytedance.com,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-3-dev.jain@arm.com>
 <CAGsJ_4xPq-eJ7JE-SFhhO2TboH8HKGifaYCwKw8cqd_2K=uD4w@mail.gmail.com>
 <bf185ecc-8310-48ad-b9cc-5c78e3da6d0b@arm.com>
 <CAGsJ_4yEJLoxuH=tTJLxgsS5Hu6pPhJfwXAttoFrHNUwJL6=YA@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAGsJ_4yEJLoxuH=tTJLxgsS5Hu6pPhJfwXAttoFrHNUwJL6=YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2025 09:11, Barry Song wrote:
> On Tue, Jun 10, 2025 at 7:45 PM Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>> On 10/06/25 12:33 pm, Barry Song wrote:
>>> Hi Dev,
>>>
>>> On Tue, Jun 10, 2025 at 3:51 PM Dev Jain <dev.jain@arm.com> wrote:
>>>> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
>>>> are painted with the contig bit, then ptep_get() will iterate through all 16
>>>> entries to collect a/d bits. Hence this optimization will result in a 16x
>>>> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
>>>> will eventually call contpte_try_unfold() on every contig block, thus
>>>> flushing the TLB for the complete large folio range. Instead, use
>>>> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
>>>> do them on the starting and ending contig block.
>>>>
>>>> For split folios, there will be no pte batching; nr_ptes will be 1. For
>>>> pagetable splitting, the ptes will still point to the same large folio;
>>>> for arm64, this results in the optimization described above, and for other
>>>> arches (including the general case), a minor improvement is expected due to
>>>> a reduction in the number of function calls.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>   mm/mremap.c | 39 ++++++++++++++++++++++++++++++++-------
>>>>   1 file changed, 32 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>>> index 180b12225368..18b215521ada 100644
>>>> --- a/mm/mremap.c
>>>> +++ b/mm/mremap.c
>>>> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>>>>          return pte;
>>>>   }
>>>>
>>>> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
>>>> +               pte_t *ptep, pte_t pte, int max_nr)
>>>> +{
>>>> +       const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +       struct folio *folio;
>>>> +
>>>> +       if (max_nr == 1)
>>>> +               return 1;
>>>> +
>>>> +       folio = vm_normal_folio(vma, addr, pte);
>>>> +       if (!folio || !folio_test_large(folio))
>>> I'm curious about the following case:
>>> If the addr/ptep is not the first subpage of the folio—for example, the
>>> 14th subpage—will mremap_folio_pte_batch() return 3?
>>
>> It will return the number of PTEs, starting from the PTE pointing to the 14th
>> subpage, that point to consecutive pages of the same large folio, up till max_nr.
>> For an example, if we are operating on a single large folio of order 4, then max_nr
>> will be 16 - 14 + 1 = 3. So in this case we will return 3, since the 14th, 15th and
>> 16th PTE point to consec pages of the same large folio.
>>
>>> If so, get_and_clear_full_ptes() would operate on 3 subpages of the folio.
>>> In that case, can unfold still work correctly?
>>
>> Yes, first we unfold as in, we do a BBM sequence: cont -> clear -> non-cont.
>> Then, on this non-contig block, we will clear only the PTEs which were asked
>> for us to do.
> 
> While going through the code,
> 
> static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
>                                 unsigned long addr, pte_t *ptep,
>                                 unsigned int nr, int full)
> {
>         pte_t pte;
>         if (likely(nr == 1)) {
>                 contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
>                 pte = __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
>         } else {
>                 pte = contpte_get_and_clear_full_ptes(mm, addr, ptep, nr, full);
>         }
> 
>         return pte;
> }
> 
> Initially, I thought it only unfolded when nr == 1, but after reading
> contpte_get_and_clear_full_ptes more closely, I realized we do
> support partial unfolding—that's what I had missed.
> 
> pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>                                 unsigned long addr, pte_t *ptep,
>                                 unsigned int nr, int full)
> {
>         contpte_try_unfold_partial(mm, addr, ptep, nr);
>         return __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
> }
> 
> I think you are right.

Yes, Dev is correct; this works as intended. And yes, the code looks a bit dumb,
but IIRC, this inline special-casing on nr=1 was needed to prevent fork and/or
munmap microbenchmarks from regressing for the common small folio case.

Thanks,
Ryan

> 
>>
>>>
>>> Similarly, if the addr/ptep points to the first subpage, but max_nr is
>>> less than CONT_PTES, what will happen in that case?
>>>
>>>
>>>> +               return 1;
>>>> +
>>>> +       return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
>>>> +                              NULL, NULL);
>>>> +}
>>>> +
>>>>   static int move_ptes(struct pagetable_move_control *pmc,
>>>>                  unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>>>>   {
>>>> @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>>>          bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>>>          struct mm_struct *mm = vma->vm_mm;
>>>>          pte_t *old_ptep, *new_ptep;
>>>> -       pte_t pte;
>>>> +       pte_t old_pte, pte;
>>>>          pmd_t dummy_pmdval;
>>>>          spinlock_t *old_ptl, *new_ptl;
>>>>          bool force_flush = false;
>>>> @@ -185,6 +202,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>>>          unsigned long new_addr = pmc->new_addr;
>>>>          unsigned long old_end = old_addr + extent;
>>>>          unsigned long len = old_end - old_addr;
>>>> +       int max_nr_ptes;
>>>> +       int nr_ptes;
>>>>          int err = 0;
>>>>
>>>>          /*
>>>> @@ -236,14 +255,16 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>>>          flush_tlb_batched_pending(vma->vm_mm);
>>>>          arch_enter_lazy_mmu_mode();
>>>>
>>>> -       for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
>>>> -                                  new_ptep++, new_addr += PAGE_SIZE) {
>>>> +       for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
>>>> +               new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
>>>>                  VM_WARN_ON_ONCE(!pte_none(*new_ptep));
>>>>
>>>> -               if (pte_none(ptep_get(old_ptep)))
>>>> +               nr_ptes = 1;
>>>> +               max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>>>> +               old_pte = ptep_get(old_ptep);
>>>> +               if (pte_none(old_pte))
>>>>                          continue;
>>>>
>>>> -               pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>>>>                  /*
>>>>                   * If we are remapping a valid PTE, make sure
>>>>                   * to flush TLB before we drop the PTL for the
>>>> @@ -255,8 +276,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>>>                   * the TLB entry for the old mapping has been
>>>>                   * flushed.
>>>>                   */
>>>> -               if (pte_present(pte))
>>>> +               if (pte_present(old_pte)) {
>>>> +                       nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
>>>> +                                                        old_pte, max_nr_ptes);
>>>>                          force_flush = true;
>>>> +               }
>>>> +               pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
>>>>                  pte = move_pte(pte, old_addr, new_addr);
>>>>                  pte = move_soft_dirty_pte(pte);
>>>>
>>>> @@ -269,7 +294,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>>>                                  else if (is_swap_pte(pte))
>>>>                                          pte = pte_swp_clear_uffd_wp(pte);
>>>>                          }
>>>> -                       set_pte_at(mm, new_addr, new_ptep, pte);
>>>> +                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>>>>                  }
>>>>          }
>>>>
>>>> --
>>>> 2.30.2
> 
> Thanks
> Barry

