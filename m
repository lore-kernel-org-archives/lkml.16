Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C63212B04
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526826; cv=none; b=g965ODypmp4iGuFgqdHRSPi4Njnxiji1NqBHPgukUrdKJKvrbBnPXdMC/P/NDsXdJQ2U3zDhvW/9MGfzz/NB5JxELo5UfnmQauIFIvkIGBTAG405Ihg/LNjSOTr4jm+CX+ufZtIOYBMn+FqzacOXsdLmL1krh0shc3dJoQzQE7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526826; c=relaxed/simple;
	bh=+1pd1hUFweb7CCwtak3nlYPflslSIxDWfznZ7NCj4Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoAz1n/SxVHFWAm9uRAjLQnaMrqFyaQy8YGoJqTTqdu24PEcETsy7BA8qi0RNFgvWrTHzn1Z0fnJ9RkrVXVBHPv2B4olY9d6nhmSn0MDQ/z0BLGxw3m/0gEoNydbU2es21inaxe0aEy2dO4KEkWzorKHsgyfoCvPWhe4sI7Gocc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BBC6113E;
	Tue,  6 May 2025 03:20:14 -0700 (PDT)
Received: from [10.162.43.13] (K4MQJ0H1H2.blr.arm.com [10.162.43.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1A813F5A1;
	Tue,  6 May 2025 03:20:18 -0700 (PDT)
Message-ID: <35966495-6922-4e18-a852-efb5d159a343@arm.com>
Date: Tue, 6 May 2025 15:50:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm: Optimize mremap() by PTE batching
To: Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-4-dev.jain@arm.com>
 <e430344b-76b9-43be-b497-0152a8910faf@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <e430344b-76b9-43be-b497-0152a8910faf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/05/25 3:40 pm, Anshuman Khandual wrote:
> On 5/6/25 10:30, Dev Jain wrote:
>> Use folio_pte_batch() to optimize move_ptes(). Use get_and_clear_full_ptes()
>> so as to elide TLBIs on each contig block, which was previously done by
>> ptep_get_and_clear().
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
>> -		if (pte_none(ptep_get(old_ptep)))
>> +		const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +		int max_nr = (old_end - old_addr) >> PAGE_SHIFT;
>> +
>> +		nr = 1;
>> +		old_pte = ptep_get(old_ptep);
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
> 
> maybe_contiguous_pte_pfns() cost will be applicable for memory
> areas greater than a single PAGE_SIZE (i.e max_nr != 1) ? This
> helper extracts an additional consecutive pte, ensures that it
> is valid mapped and extracts pfn before comparing for the span.
> 
> There is some cost associated with the above code sequence which
> looks justified for sequential access of memory buffers that has
> consecutive physical memory backing.

I did not see any regression for the simple case of mremapping base pages.

> But what happens when such
> buffers are less probable, will those buffers take a performance
> hit for all the comparisons that just turn out to be negative ?

When would that be the case? We are remapping consecutive ptes to 
consecutive ptes.

> 
>> +				struct folio *folio = vm_normal_folio(vma, old_addr, old_pte);
>> +
>> +				if (folio && folio_test_large(folio))
>> +					nr = folio_pte_batch(folio, old_addr, old_ptep,
>> +					old_pte, max_nr, fpb_flags, NULL, NULL, NULL);
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

