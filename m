Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA46256C7D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521415; cv=none; b=KpN4nX3vknagH1mMDMEuBv/bf8ZiMqL/hSS5Y/cEK7/gUPiV0tv37pqRc06NCXVR0Qqm5uzuODts7c8AxqRs0A5OeNLMjErKbkQ1BkcT8zBkrYxfI6Rmms5c5qQaZgAUAjSdiQF+MLj5FQATmHkwTxmjDMx4S39v3Hc+KNqaeN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521415; c=relaxed/simple;
	bh=3RvPLD8Bc/MghdA2heAQ7y4RvOnnzNfb+rU6nieE8e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLZzO7ygAyv+kinA2XxwN0wRlGBuMtk7LU4JfQQsVqRogIn971RmhSK2ziqbT/942+8p5Pi5uxHjC3dG9fsDcYxrEpvEc6Yo5tstO5bQHB+Tss3sQRfr/RZUY4QCCNdf7LcSzj8jGbaHwMcYR4eOdgVrx8acDAamgzIstaPs/FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7381D113E;
	Tue,  6 May 2025 01:50:03 -0700 (PDT)
Received: from [10.163.54.208] (unknown [10.163.54.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C04EC3F673;
	Tue,  6 May 2025 01:50:04 -0700 (PDT)
Message-ID: <4cee3168-cb9f-4b73-a2f5-51ac177c35dc@arm.com>
Date: Tue, 6 May 2025 14:20:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: Call pointers to ptes as ptep
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-2-dev.jain@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506050056.59250-2-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/25 10:30, Dev Jain wrote:
> Avoid confusion between pte_t* and pte_t data types by appending pointer
> type variables by p. No functional change.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/mremap.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7db9da609c84..1a08a7c3b92f 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -176,7 +176,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	struct vm_area_struct *vma = pmc->old;
>  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>  	struct mm_struct *mm = vma->vm_mm;
> -	pte_t *old_pte, *new_pte, pte;
> +	pte_t *old_ptep, *new_ptep, pte;
>  	pmd_t dummy_pmdval;
>  	spinlock_t *old_ptl, *new_ptl;
>  	bool force_flush = false;
> @@ -211,8 +211,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	 * We don't have to worry about the ordering of src and dst
>  	 * pte locks because exclusive mmap_lock prevents deadlock.
>  	 */
> -	old_pte = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> -	if (!old_pte) {
> +	old_ptep = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> +	if (!old_ptep) {
>  		err = -EAGAIN;
>  		goto out;
>  	}
> @@ -223,10 +223,10 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	 * mmap_lock, so this new_pte page is stable, so there is no need to get
>  	 * pmdval and do pmd_same() check.
>  	 */
> -	new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
> +	new_ptep = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
>  					   &new_ptl);
> -	if (!new_pte) {
> -		pte_unmap_unlock(old_pte, old_ptl);
> +	if (!new_ptep) {
> +		pte_unmap_unlock(old_ptep, old_ptl);
>  		err = -EAGAIN;
>  		goto out;
>  	}
> @@ -235,12 +235,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>  
> -	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
> -				   new_pte++, new_addr += PAGE_SIZE) {
> -		if (pte_none(ptep_get(old_pte)))
> +	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> +				   new_ptep++, new_addr += PAGE_SIZE) {
> +		if (pte_none(ptep_get(old_ptep)))
>  			continue;
>  
> -		pte = ptep_get_and_clear(mm, old_addr, old_pte);
> +		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>  		/*
>  		 * If we are remapping a valid PTE, make sure
>  		 * to flush TLB before we drop the PTL for the
> @@ -258,7 +258,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		pte = move_soft_dirty_pte(pte);
>  
>  		if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
> -			pte_clear(mm, new_addr, new_pte);
> +			pte_clear(mm, new_addr, new_ptep);
>  		else {
>  			if (need_clear_uffd_wp) {
>  				if (pte_present(pte))
> @@ -266,7 +266,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  				else if (is_swap_pte(pte))
>  					pte = pte_swp_clear_uffd_wp(pte);
>  			}
> -			set_pte_at(mm, new_addr, new_pte, pte);
> +			set_pte_at(mm, new_addr, new_ptep, pte);
>  		}
>  	}
>  
> @@ -275,8 +275,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		flush_tlb_range(vma, old_end - len, old_end);
>  	if (new_ptl != old_ptl)
>  		spin_unlock(new_ptl);
> -	pte_unmap(new_pte - 1);
> -	pte_unmap_unlock(old_pte - 1, old_ptl);
> +	pte_unmap(new_ptep - 1);
> +	pte_unmap_unlock(old_ptep - 1, old_ptl);
>  out:
>  	if (pmc->need_rmap_locks)
>  		drop_rmap_locks(vma);

Although this makes sense, mm/mremap.c might not be the only place with such
naming confusions regarding page table entry and page table pointers. Rather
than fixing this in just a single file, I guess generic MM wide change will
be better.
