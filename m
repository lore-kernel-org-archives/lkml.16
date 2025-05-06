Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E8728137A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540666; cv=none; b=kblYK8SKhTk3djgPN8EaAWGXSAWo7nwlXDqEYsQp/2FHhzNOMmcIKGdqbUECXedlzUSNGurK4kCND6+oZ5STgN3vyQvPLkoh0mj7+DZQFFsqxnBU5ho1GticKYFS20nOAk3fr8W/E52YEvjiKfV4rkPaCjAMRpS60cLidLwbxGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540666; c=relaxed/simple;
	bh=1TZzGn6F/5VYj2A7QcqgMgDngVaYTlbVcSWQeeOGxFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UiyMPbmu7vwjLiT5uJ+ls3zxBL/42uIoWU6LU6sBg+Sja0CqmX8zEp8ISdZeri/uVGCnBPUCF3TmideJB96cuqihXMi+Ld7dNknKmjOpJsX6xeU0coxOy5u6Y5EoxpjGOX0lwIX7p0lMwtEErTCknGS/CFYpxYOC//Lw+oIyaUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E19D9339;
	Tue,  6 May 2025 07:10:53 -0700 (PDT)
Received: from [10.163.81.21] (unknown [10.163.81.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F7AC3F5A1;
	Tue,  6 May 2025 07:10:53 -0700 (PDT)
Message-ID: <9c2844c9-5c1a-4250-a89a-0c4d01d47d5e@arm.com>
Date: Tue, 6 May 2025 19:40:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm: Optimize mremap() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-4-dev.jain@arm.com>
 <7c6e61fa-2437-4c99-b1d3-97af5e2b37a3@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <7c6e61fa-2437-4c99-b1d3-97af5e2b37a3@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/05/25 7:19 pm, Lorenzo Stoakes wrote:
> On Tue, May 06, 2025 at 10:30:56AM +0530, Dev Jain wrote:
>> Use folio_pte_batch() to optimize move_ptes(). Use get_and_clear_full_ptes()
>> so as to elide TLBIs on each contig block, which was previously done by
>> ptep_get_and_clear().
> 
> No mention of large folios
> 
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mremap.c | 24 +++++++++++++++++++-----
>>   1 file changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 1a08a7c3b92f..3621c07d8eea 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -176,7 +176,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	struct vm_area_struct *vma = pmc->old;
>>   	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>   	struct mm_struct *mm = vma->vm_mm;
>> -	pte_t *old_ptep, *new_ptep, pte;
>> +	pte_t *old_ptep, *new_ptep, old_pte, pte;
> 
> Obviously given previous comment you know what I'm going to say here :) let's
> put old_pte, pte in a new decl.
> 
>>   	pmd_t dummy_pmdval;
>>   	spinlock_t *old_ptl, *new_ptl;
>>   	bool force_flush = false;
>> @@ -185,6 +185,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	unsigned long old_end = old_addr + extent;
>>   	unsigned long len = old_end - old_addr;
>>   	int err = 0;
>> +	int nr;
>>
>>   	/*
>>   	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
>> @@ -237,10 +238,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>
>>   	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
>>   				   new_ptep++, new_addr += PAGE_SIZE) {
> 
> Hm this just seems wrong, even if we're dealing with a large folio we're still
> offsetting by PAGE_SIZE each time and iterating through further sub-pages?
> 
> Shouldn't we be doing something like += nr and += PAGE_SIZE * nr?

This is embarrassing *facepalm* . The crazy part is that I didn't even 
notice this because I got an optimization due to get_and_clear_full_ptes 
-> the number of TLB flushes reduced, and the loop continued due to 
pte_none().

> 
> Then it'd make sense to initialise nr to 1.
> 
> Honestly I'd prefer us though to refactor move_ptes() to something like:
> 
> 	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> 				   new_ptep++, new_addr += PAGE_SIZE) {
> 		pte_t old_pte = ptep_get(old_ptep);
> 
> 		if (pte_none(old_pte))
> 			continue;
> 
> 		move_pte(pmc, vma, old_ptep, old_pte);
> 	}
> 
> Declaring this new move_pte() where you can put the rest of the stuff.
> 
> I'd much rather we do this than add to the mess as-is.
> 
> 
> 
>> -		if (pte_none(ptep_get(old_ptep)))
>> +		const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +		int max_nr = (old_end - old_addr) >> PAGE_SHIFT;
>> +
>> +		nr = 1;
>> +		old_pte = ptep_get(old_ptep);
> 
> You can declare this in the for loop, no need for us to contaminate whole
> function scope with it.
> 
> Same with 'nr' in this implementation (though I'd rather you changed it up, see
> above).
> 
>> +		if (pte_none(old_pte))
>>   			continue;
>>
>> -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>>   		/*
>>   		 * If we are remapping a valid PTE, make sure
>>   		 * to flush TLB before we drop the PTL for the
>> @@ -252,8 +257,17 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   		 * the TLB entry for the old mapping has been
>>   		 * flushed.
>>   		 */
>> -		if (pte_present(pte))
>> +		if (pte_present(old_pte)) {
>> +			if ((max_nr != 1) && maybe_contiguous_pte_pfns(old_ptep, old_pte)) {
>> +				struct folio *folio = vm_normal_folio(vma, old_addr, old_pte);
>> +
>> +				if (folio && folio_test_large(folio))
>> +					nr = folio_pte_batch(folio, old_addr, old_ptep,
>> +					old_pte, max_nr, fpb_flags, NULL, NULL, NULL);
> 
> Indentation seems completely broken here? I also hate that we're nesting to this
> degree? Can we please find a way not to?
> 
> This function is already a bit of a clogged mess, I'd rather we clean up then
> add to it.
> 
> (See above again :)
> 
> 
>> +			}
>>   			force_flush = true;
>> +		}
>> +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, 0);
>>   		pte = move_pte(pte, old_addr, new_addr);
>>   		pte = move_soft_dirty_pte(pte);
>>
>> @@ -266,7 +280,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
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
> 
> Cheers, Lorenzo

