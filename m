Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9707F2D052
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 08:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747556275; cv=none; b=lXtUYKwSfkRcnb9Kh6FH2bptk9W0+kGKl6NusHYWoIiAy4s4+WlckE8XB0g0bMyg0X08XjkrMpXrMSC8qDzcX1uXmBPhmNAmGF65tSqc12xMbbvWXsPVdeeHdg3imhcY46mna8QINP8YyWsb09iApIY9igPjdkk8oBAQLsSlxw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747556275; c=relaxed/simple;
	bh=8nOMTyDBpnVjP/8xhCSWCTrAd8a48AOqYUz4iKbqsGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sp1GZRhL60o432Gqz0SIdxyokIHGE5dNUbWNPqynlcGwgA9FH/oiHlp4VvLT0B1P74mR8sUm7OVDbjCM4iZlgDsnHiy5PBiFB8dKt1rVaPONAVlhg1ED+7TgHfC/7f5SgoVzps4lE1xl09jkDbJ7D4V9tocDCaY4gKUwi8dK36c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBD0716F2;
	Sun, 18 May 2025 01:17:32 -0700 (PDT)
Received: from [10.163.82.43] (unknown [10.163.82.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C4463F5A1;
	Sun, 18 May 2025 01:17:38 -0700 (PDT)
Message-ID: <c038b7cf-3b72-403f-b988-bf3009287502@arm.com>
Date: Sun, 18 May 2025 13:47:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-3-dev.jain@arm.com>
 <fdb76016-396a-4ee4-9c9d-beb18c86cfdb@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <fdb76016-396a-4ee4-9c9d-beb18c86cfdb@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/05/25 3:34 pm, Lorenzo Stoakes wrote:
> Before getting into the review, just to say thanks for refactoring as per
> my (and of course other's) comments, much appreciated and big improvement!
> :)
> 
> We're getting there...
> 
> On Wed, May 07, 2025 at 11:32:56AM +0530, Dev Jain wrote:
>> To use PTE batching, we want to determine whether the folio mapped by
>> the PTE is large, thus requiring the use of vm_normal_folio(). We want
>> to avoid the cost of vm_normal_folio() if the code path doesn't already
>> require the folio. For arm64, pte_batch_hint() does the job. To generalize
>> this hint, add a helper which will determine whether two consecutive PTEs
>> point to consecutive PFNs, in which case there is a high probability that
>> the underlying folio is large.
>> Next, use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
>> are painted with the contig bit, then ptep_get() will iterate through all 16
>> entries to collect a/d bits. Hence this optimization will result in a 16x
>> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
>> will eventually call contpte_try_unfold() on every contig block, thus
>> flushing the TLB for the complete large folio range. Instead, use
>> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
>> do them on the starting and ending contig block.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>>   mm/mremap.c             | 37 ++++++++++++++++++++++++++++++-------
>>   2 files changed, 59 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..38dab1f562ed 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>>   }
>>   #endif
>>
>> +/**
>> + * maybe_contiguous_pte_pfns - Hint whether the page mapped by the pte belongs
>> + * to a large folio.
>> + * @ptep: Pointer to the page table entry.
>> + * @pte: The page table entry.
>> + *
>> + * This helper is invoked when the caller wants to batch over a set of ptes
>> + * mapping a large folio, but the concerned code path does not already have
>> + * the folio. We want to avoid the cost of vm_normal_folio() only to find that
>> + * the underlying folio was small; i.e keep the small folio case as fast as
>> + * possible.
>> + *
>> + * The caller must ensure that ptep + 1 exists.
>> + */
>> +static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
>> +{
>> +	pte_t *next_ptep, next_pte;
>> +
>> +	if (pte_batch_hint(ptep, pte) != 1)
>> +		return true;
>> +
>> +	next_ptep = ptep + 1;
>> +	next_pte = ptep_get(next_ptep);
>> +	if (!pte_present(next_pte))
>> +		return false;
>> +
>> +	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == 1);
> 
> Let's not do unlikely()'s unless we have data for them... it shouldn't mean
> 'what the programmer believes' :)
> 
>> +}
> 
> Yeah I'm with Andrew and Anshuman, I mean this is kind of a nasty interface
> (I mean _perhaps_ unavoidably) and we've done the relevant check in
> mremap_folio_pte_batch(), so let's just move it there with comments, as this
> 
>> +
>>   #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
>>   static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
>>   					    unsigned long address,
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 0163e02e5aa8..9c88a276bec4 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>>   	return pte;
>>   }
>>
>> +/* mremap a batch of PTEs mapping the same large folio */
>> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
>> +		pte_t *ptep, pte_t pte, int max_nr)
>> +{
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +	struct folio *folio;
>> +	int nr = 1;
>> +
>> +	if ((max_nr != 1) && maybe_contiguous_pte_pfns(ptep, pte)) {
>> +		folio = vm_normal_folio(vma, addr, pte);
>> +		if (folio && folio_test_large(folio))
>> +			nr = folio_pte_batch(folio, addr, ptep, pte, max_nr,
>> +					     flags, NULL, NULL, NULL);
>> +	}
> 
> This needs some refactoring, avoid nesting at all costs :)
> 
> We'll want to move the maybe_contiguous_pte_pfns() function over here, so
> that'll change things, but in general let's use a guard clause.
> 
> So an if block like:
> 
> if (foo) {
> 	... bunch of logic ...
> }
> 
> Is better replaced with a guard clause so you have:
> 
> if (!foo)
> 	return ...;
> 
> ... bunch of logic ...
> 
> Here we could really expand things out to make things SUPER clear like:
> 
> static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> 		pte_t *ptep, pte_t pte, int max_nr)
> {
> 	const fpb_t flags;
> 	struct folio *folio;
> 
> 	if (max_nr == 1)
> 		return 1;
> 	if (!maybe_contiguous_pte_pfns(ptep, pte)) // obviously replace with open code...
> 		return 1;
> 
> 	folio = vm_normal_folio(vma, addr, pte);
> 	if (!folio)
> 		return 1;
> 	if (!folio_test_large(folio))
> 		return 1;
> 
> 	flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> 	return folio_pte_batch(folio, addr, ptep, pte, max_nr,
> 		flags, NULL, NULL, NULL);
> }
> 
> I mean you could argue assign nr would be neater here, but you get the point!
> 
> David mentioned a point about this code over in v1 discussion (see
> [0]). Trying to bring converastion here to avoid it being split across
> old/new series. There he said:
> 
> David H:
>> (2) Do we really need "must be part of the same folio", or could be just batch over present
>> ptes that map consecutive PFNs? In that case, a helper that avoids folio_pte_batch() completely
>> might be better.
> 
> Hm, if we didn't do the batch test, can we batch a split large folio here ok?
> I'm guessing we can in which case this check is actually limiting...
> 
> Are we _explicitly_ only considering the cont pte case and ignoring the
> split THP case?
> 
> [0]: https://lore.kernel.org/all/887fb371-409e-4dad-b4ff-38b85bfddf95@redhat.com/
> 
> And in what circumstances will the hint be set, with a present subsequent
> PTE but !folio_test_large()?
> 
> I guess the hint might not be taken? But then isn't the valid check just
> folio_test_large() and we don't need this batched check at all?
> 
> Is it only to avoid the split THP case?
> 
> We definitely need some clarity here, and a comment in the code explaining
> what's going on as this is subtle stuff.

I am focussed only on batching large folios. Split THPs won't be 
batched; you can use pte_batch() (from David's refactoring) and
figure the split THP batch out, but then get_and_clear_full_ptes()
will be gathering a/d bits and smearing them across the batch, which 
will be incorrect. Even if we introduce a new version of 
get_and_clear_full_ptes() which does not gather a/d bits, then if the 
pte_batch actually belongs to a folio, then we will *not* be smearing 
a/d bits, which is again wrong. So in any case we must know what the 
underlying folio looks like :) So my agenda for v3 is,

- Incorporate your refactoring comments
- Remove maybe_contiguous_pte_pfns and just use vm_normal_folio + 
folio_test_large
- Fix indentation

Sounds good?

> 
>> +	return nr;
>> +}
>> +
>>   static int move_ptes(struct pagetable_move_control *pmc,
>>   		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>>   {
>> @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>   	struct mm_struct *mm = vma->vm_mm;
>>   	pte_t *old_ptep, *new_ptep;
>> -	pte_t pte;
>> +	pte_t old_pte, pte;
>>   	pmd_t dummy_pmdval;
>>   	spinlock_t *old_ptl, *new_ptl;
>>   	bool force_flush = false;
>> @@ -186,6 +203,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	unsigned long old_end = old_addr + extent;
>>   	unsigned long len = old_end - old_addr;
>>   	int err = 0;
>> +	int max_nr;
>>
>>   	/*
>>   	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
>> @@ -236,12 +254,13 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>
>> -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
>> -				   new_ptep++, new_addr += PAGE_SIZE) {
>> -		if (pte_none(ptep_get(old_ptep)))
>> +	for (int nr = 1; old_addr < old_end; old_ptep += nr, old_addr += nr * PAGE_SIZE,
>> +				   new_ptep += nr, new_addr += nr * PAGE_SIZE) {
> 
> Really nitty thing here but the indentation is all messed up here, I mean
> nothing is going to be nice but maybe indent by two tabs below 'for'.
> 
> I'm not a fan of this declaration of nr, typically in a for loop a declaration
> here would be the counter, so this is just confusing.
> 
> In the old implementation, declaring nr in the for loop would make sense,
> but in the newly refactored one you should just declare it at the top.
> 
> Also as per Anshuman review, I think nr_ptes, max_nr_ptes would be better.
> 
> I don't think 'nr' needs to be initialised either, since the conditional is
> 'old_addr < old_end' and you _should_ only perform the
> 
>> +		max_nr = (old_end - old_addr) >> PAGE_SHIFT;
>> +		old_pte = ptep_get(old_ptep);
>> +		if (pte_none(old_pte))
> 
> This seems broken.
> 
> You're missing a nr assignment here, so you'll happen to offset by the
> number of pages of the last folio you encountered?
> 
> Should be:
> 
> 	if (pte_none(old_pte)) {
> 		nr_ptes = 1;
> 		continue;
> 	}
> 
> Or, alternatively, you can reset nr_ptes to 1 at the start of each loop.
> 
> 
>>   			continue;
>>
>> -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
> 
>>   		/*
>>   		 * If we are remapping a valid PTE, make sure
>>   		 * to flush TLB before we drop the PTL for the
>> @@ -253,8 +272,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   		 * the TLB entry for the old mapping has been
>>   		 * flushed.
>>   		 */
>> -		if (pte_present(pte))
>> +		if (pte_present(old_pte)) {
>> +			nr = mremap_folio_pte_batch(vma, old_addr, old_ptep,
>> +						    old_pte, max_nr);
>>   			force_flush = true;
>> +		}
> 
> Thanks this is much clearer compared to v1
> 
>> +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, 0);
> 
> Nit but...
> 
> Can we have a comment indicating what the last parameter refers to? I think
> David maybe doens't like this so obviously if he prefers not that fine, but
> I'm thinking something like:
> 
> pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, /*full=*/false);
> 
> I think we are good to just use 'false' here right? As it's only an int for
> historical purposes...
> 
>>   		pte = move_pte(pte, old_addr, new_addr);
>>   		pte = move_soft_dirty_pte(pte);
>>
>> @@ -267,7 +290,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   				else if (is_swap_pte(pte))
>>   					pte = pte_swp_clear_uffd_wp(pte);
>>   			}
>> -			set_pte_at(mm, new_addr, new_ptep, pte);
>> +			set_ptes(mm, new_addr, new_ptep, pte, nr);
>>   		}
>>   	}
>>
>> --
>> 2.30.2
>>

