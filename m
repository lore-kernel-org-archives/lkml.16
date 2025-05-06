Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB4622DFB1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532377; cv=none; b=ohopMDHumkvvqhipKLGjgMpomhM+GOhno5LaIDK/Zk4yHE9IiUsPP2ulVVCXFtGPRbidMSyE66zEEe7/ZHTWWSO8IA2B9N6rowqX3KF9c+r4dz/+v6iCRNu5ctxb3GJuZfep/sYqYUQxpVQBi2x2cfxi7fOIw5dtCUvRoQjohK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532377; c=relaxed/simple;
	bh=4Dj8J1B6emEgedZ+BggE2aDkhwBb3aam1vzdhifBmI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7t5MWRCgeerS6eXEfiPPoFecHEZc3LUt3EHPZ9czj7sCNu0jllOGFMQiS9jRZWweovCGr5lriIk6tB4BK1uslWr6li/mMHnlGbFSpclpun9A+hdfspbRkl51RMWZSadP2U46J70P4ML43Fzqz50j/+Fz0FDNtEiDO29Zj9Jrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 512CF113E;
	Tue,  6 May 2025 04:52:43 -0700 (PDT)
Received: from [10.163.80.199] (unknown [10.163.80.199])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5A223F58B;
	Tue,  6 May 2025 04:52:42 -0700 (PDT)
Message-ID: <060ce34c-6729-4128-9190-264f7684e299@arm.com>
Date: Tue, 6 May 2025 17:22:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: Call pointers to ptes as ptep
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-2-dev.jain@arm.com>
 <5c20ada8-4863-4a33-bb1d-3b5695d0bf66@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <5c20ada8-4863-4a33-bb1d-3b5695d0bf66@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/05/25 4:22 pm, Lorenzo Stoakes wrote:
> On Tue, May 06, 2025 at 10:30:54AM +0530, Dev Jain wrote:
>> Avoid confusion between pte_t* and pte_t data types by appending pointer
>> type variables by p. No functional change.
> 
> NIT: 'appending'->'suffixing' and 'by p' -> with p'.

Thanks.

> 
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> 
> This looks generally fine, could you fix the nit below however... sorry to
> be a pain!
> 
> Thanks!
> 
>> ---
>>   mm/mremap.c | 28 ++++++++++++++--------------
>>   1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 7db9da609c84..1a08a7c3b92f 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -176,7 +176,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	struct vm_area_struct *vma = pmc->old;
>>   	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>   	struct mm_struct *mm = vma->vm_mm;
>> -	pte_t *old_pte, *new_pte, pte;
>> +	pte_t *old_ptep, *new_ptep, pte;
> 
> While we're at it, can we please move the pte decl to a new line? Mixing
> pointers and non-pointers is not great (I refactored it but mremap still
> has a bunch of less-than-ideal stuff in it :)

Sure.

> 
>>   	pmd_t dummy_pmdval;
>>   	spinlock_t *old_ptl, *new_ptl;
>>   	bool force_flush = false;
>> @@ -211,8 +211,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	 * We don't have to worry about the ordering of src and dst
>>   	 * pte locks because exclusive mmap_lock prevents deadlock.
>>   	 */
>> -	old_pte = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
>> -	if (!old_pte) {
>> +	old_ptep = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
>> +	if (!old_ptep) {
>>   		err = -EAGAIN;
>>   		goto out;
>>   	}
>> @@ -223,10 +223,10 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	 * mmap_lock, so this new_pte page is stable, so there is no need to get
>>   	 * pmdval and do pmd_same() check.
>>   	 */
>> -	new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
>> +	new_ptep = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
>>   					   &new_ptl);
>> -	if (!new_pte) {
>> -		pte_unmap_unlock(old_pte, old_ptl);
>> +	if (!new_ptep) {
>> +		pte_unmap_unlock(old_ptep, old_ptl);
>>   		err = -EAGAIN;
>>   		goto out;
>>   	}
>> @@ -235,12 +235,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>
>> -	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
>> -				   new_pte++, new_addr += PAGE_SIZE) {
>> -		if (pte_none(ptep_get(old_pte)))
>> +	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
>> +				   new_ptep++, new_addr += PAGE_SIZE) {
>> +		if (pte_none(ptep_get(old_ptep)))
>>   			continue;
>>
>> -		pte = ptep_get_and_clear(mm, old_addr, old_pte);
>> +		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>>   		/*
>>   		 * If we are remapping a valid PTE, make sure
>>   		 * to flush TLB before we drop the PTL for the
>> @@ -258,7 +258,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   		pte = move_soft_dirty_pte(pte);
>>
>>   		if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
>> -			pte_clear(mm, new_addr, new_pte);
>> +			pte_clear(mm, new_addr, new_ptep);
>>   		else {
>>   			if (need_clear_uffd_wp) {
>>   				if (pte_present(pte))
>> @@ -266,7 +266,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   				else if (is_swap_pte(pte))
>>   					pte = pte_swp_clear_uffd_wp(pte);
>>   			}
>> -			set_pte_at(mm, new_addr, new_pte, pte);
>> +			set_pte_at(mm, new_addr, new_ptep, pte);
>>   		}
>>   	}
>>
>> @@ -275,8 +275,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   		flush_tlb_range(vma, old_end - len, old_end);
>>   	if (new_ptl != old_ptl)
>>   		spin_unlock(new_ptl);
>> -	pte_unmap(new_pte - 1);
>> -	pte_unmap_unlock(old_pte - 1, old_ptl);
>> +	pte_unmap(new_ptep - 1);
>> +	pte_unmap_unlock(old_ptep - 1, old_ptl);
>>   out:
>>   	if (pmc->need_rmap_locks)
>>   		drop_rmap_locks(vma);
>> --
>> 2.30.2
>>

