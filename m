Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AFA17A2EF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466896; cv=none; b=ntHnCeFR0UDIrluXrGuWf9Oc5SVU0Vuz63F0OTj2xwzG2/cljoKsyPeIISkjQDyF4mpPTsxPKhcP+pXwANyB5MGV3lpfhXPKib3Fbp2kYiALTWztCccHJ1XX0gmw4jTOtLun8q2tcA6zt6alxWYzZ+fNsR5zcEpyyDHkXWtCX28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466896; c=relaxed/simple;
	bh=sW/tuZS+zOkPGXhMcIMsU9CmOXZjhK5Sr/PFTnT/LY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLDHWgUV8CV4MlHMTnza0ePM2MlK8qbGMYtxLeoveI9JlAQu6hgGUuc1Mh1/Yz6YAhEDXsdlhwWzYWJBnqfjkPqZ1jGhJEpE1la3xRlpEJTAEudHIAm1kwIkc02pnY8kg8nxS1rJdf2QgMMZNn3R6Q9sf6fyo9VQMI5Ykon7ZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F02C2150C;
	Mon,  9 Jun 2025 04:01:13 -0700 (PDT)
Received: from [10.1.39.162] (XHFQ2J9959.cambridge.arm.com [10.1.39.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C82543F59E;
	Mon,  9 Jun 2025 04:01:29 -0700 (PDT)
Message-ID: <b86971db-c326-46df-9553-d89cf5609a75@arm.com>
Date: Mon, 9 Jun 2025 12:01:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm: Remove arch_flush_tlb_batched_pending() arch
 helper
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250609103132.447370-1-ryan.roberts@arm.com>
 <48375ad8-7461-446e-9002-8d326fba137b@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <48375ad8-7461-446e-9002-8d326fba137b@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/06/2025 11:45, Lorenzo Stoakes wrote:
> On Mon, Jun 09, 2025 at 11:31:30AM +0100, Ryan Roberts wrote:
>> Since commit 4b634918384c ("arm64/mm: Close theoretical race where stale
>> TLB entry remains valid"), all arches that use tlbbatch for reclaim
>> (arm64, riscv, x86) implement arch_flush_tlb_batched_pending() with a
>> flush_tlb_mm().
>>
>> So let's simplify by removing the unnecessary abstraction and doing the
>> flush_tlb_mm() directly in flush_tlb_batched_pending(). This effectively
>> reverts commit db6c1f6f236d ("mm/tlbbatch: introduce
>> arch_flush_tlb_batched_pending()").
>>
>> Suggested-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> Thanks, love to see an arch_*() helper go :)
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks!

> 
> Couple points below.
> 
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 11 -----------
>>  arch/riscv/include/asm/tlbflush.h |  1 -
>>  arch/riscv/mm/tlbflush.c          |  5 -----
>>  arch/x86/include/asm/tlbflush.h   |  5 -----
>>  mm/rmap.c                         |  2 +-
>>  5 files changed, 1 insertion(+), 23 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index aa9efee17277..18a5dc0c9a54 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -322,17 +322,6 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>  	return true;
>>  }
>>
>> -/*
>> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
>> - * all the previously issued TLBIs targeting mm have completed. But since we
>> - * can be executing on a remote CPU, a DSB cannot guarantee this like it can
>> - * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>> - */
> 
> Hm are we losing information here? I guess it's hard to know whewre to put
> this though.

The generic version of this comment exists above flush_tlb_batched_pending() in
rmap.c.

For the arm64-specific description of why we need to flush the whole mm, that's
captured in Commit 4b634918384c ("arm64/mm: Close theoretical race where stale
TLB entry remains valid"), although I accept that may not be the first place
someone looks.

I don't think we should be defining arch_ helpers just to provide a hook for
some arch-specific comments though.

> 
>> -static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>> -{
>> -	flush_tlb_mm(mm);
>> -}
>> -
>>  /*
>>   * To support TLB batched flush for multiple pages unmapping, we only send
>>   * the TLBI for each page in arch_tlbbatch_add_pending() and wait for the
>> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
>> index 1a20dd746a49..eed0abc40514 100644
>> --- a/arch/riscv/include/asm/tlbflush.h
>> +++ b/arch/riscv/include/asm/tlbflush.h
>> @@ -63,7 +63,6 @@ void flush_pud_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>  bool arch_tlbbatch_should_defer(struct mm_struct *mm);
>>  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>>  		struct mm_struct *mm, unsigned long start, unsigned long end);
>> -void arch_flush_tlb_batched_pending(struct mm_struct *mm);
>>  void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
>>
>>  extern unsigned long tlb_flush_all_threshold;
>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> index e737ba7949b1..8404530ec00f 100644
>> --- a/arch/riscv/mm/tlbflush.c
>> +++ b/arch/riscv/mm/tlbflush.c
>> @@ -234,11 +234,6 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
>>  }
>>
>> -void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>> -{
>> -	flush_tlb_mm(mm);
>> -}
>> -
>>  void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>>  {
>>  	__flush_tlb_range(NULL, &batch->cpumask,
>> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
>> index e9b81876ebe4..00daedfefc1b 100644
>> --- a/arch/x86/include/asm/tlbflush.h
>> +++ b/arch/x86/include/asm/tlbflush.h
>> @@ -356,11 +356,6 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
>>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>>  }
>>
>> -static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>> -{
>> -	flush_tlb_mm(mm);
>> -}
>> -
>>  extern void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
>>
>>  static inline bool pte_flags_need_flush(unsigned long oldflags,
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fb63d9256f09..fd160ddaa980 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -746,7 +746,7 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>>  	int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;
>>
>>  	if (pending != flushed) {
>> -		arch_flush_tlb_batched_pending(mm);
>> +		flush_tlb_mm(mm);
> 
> I see that CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH is only implemented in
> riscv (if !nommu), x86, arm64, and therefore we are only going to invoke
> this for those arches which previously did the same anyway, so this is
> safe.

It's also the way it used to be done before arm64 joined the party and thought
it could optimize by just issuing a DSB. I since discoved that the DSB approach
is buggy so arm64 has now fallen back to flush_tlb_mm() so the reason for the
original introduction of arch_flush_tlb_batched_pending() has gone.

Thanks,
Ryan

> 
> Kinda wish we could avoid this ugly #ifdef #else #endif pattern here in
> mm/rmap.c but probably necessary in this case.
> 
>>  		/*
>>  		 * If the new TLB flushing is pending during flushing, leave
>>  		 * mm->tlb_flush_batched as is, to avoid losing flushing.
>> --
>> 2.43.0
>>

