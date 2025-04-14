Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28494291153
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655336; cv=none; b=fHne4DNqc8lML4f07gFu3qt+qNMkQDr7yuNn7KXMI+6oH8mg/pGwmvmO/tORzPYinoYeFaJXN+R8AYYVUoT8x9PomzMIEIYtdTxZcbG2yaG1K/IK2P3uJoUBvHYdITfDKs7pA0RfH2hh+aUdhLl8ATXdZ7JY0K09+iHXYlTv3fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655336; c=relaxed/simple;
	bh=yQZIRN/m/NNacuYZmQ+79acxFhU3m+L3SUA4DUZTEO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=auJAiSal4NyKdDmIibT5k/sFYnN6/mtrIXxqNLqMyMGZ+9/WKJoKItAkOflwiodHAFm+dxyCOZeO82WcURQVkzrkd5evLOjZJsWkPwyOv2rIURyfHl82O2UUYiqElsqcXWKqWYpezt/KNqGYJ/zLroCRa8lwWi7JioZR1mmaGMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 662741595;
	Mon, 14 Apr 2025 11:28:51 -0700 (PDT)
Received: from [10.57.86.225] (unknown [10.57.86.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 191BD3F59E;
	Mon, 14 Apr 2025 11:28:47 -0700 (PDT)
Message-ID: <aabc9fb1-4e74-409a-b25b-8e844e65c502@arm.com>
Date: Mon, 14 Apr 2025 19:28:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] arm64/mm: Batch barriers when updating kernel
 mappings
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-12-ryan.roberts@arm.com> <Z_1IC-_Fp-yGLRSc@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z_1IC-_Fp-yGLRSc@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2025 18:38, Catalin Marinas wrote:
> On Tue, Mar 04, 2025 at 03:04:41PM +0000, Ryan Roberts wrote:
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 1898c3069c43..149df945c1ab 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -40,6 +40,55 @@
>>  #include <linux/sched.h>
>>  #include <linux/page_table_check.h>
>>  
>> +static inline void emit_pte_barriers(void)
>> +{
>> +	/*
>> +	 * These barriers are emitted under certain conditions after a pte entry
>> +	 * was modified (see e.g. __set_pte_complete()). The dsb makes the store
>> +	 * visible to the table walker. The isb ensures that any previous
>> +	 * speculative "invalid translation" marker that is in the CPU's
>> +	 * pipeline gets cleared, so that any access to that address after
>> +	 * setting the pte to valid won't cause a spurious fault. If the thread
>> +	 * gets preempted after storing to the pgtable but before emitting these
>> +	 * barriers, __switch_to() emits a dsb which ensure the walker gets to
>> +	 * see the store. There is no guarrantee of an isb being issued though.
>> +	 * This is safe because it will still get issued (albeit on a
>> +	 * potentially different CPU) when the thread starts running again,
>> +	 * before any access to the address.
>> +	 */
>> +	dsb(ishst);
>> +	isb();
>> +}
>> +
>> +static inline void queue_pte_barriers(void)
>> +{
>> +	if (test_thread_flag(TIF_LAZY_MMU))
>> +		set_thread_flag(TIF_LAZY_MMU_PENDING);
> 
> As we can have lots of calls here, it might be slightly cheaper to test
> TIF_LAZY_MMU_PENDING and avoid setting it unnecessarily.

Yes, good point.

> 
> I haven't checked - does the compiler generate multiple mrs from sp_el0
> for subsequent test_thread_flag()?

It emits a single mrs but it loads from the pointer twice. I think v3 is the version we want?


void TEST_queue_pte_barriers_v1(void)
{
	if (test_thread_flag(TIF_LAZY_MMU))
		set_thread_flag(TIF_LAZY_MMU_PENDING);
	else
		emit_pte_barriers();
}

void TEST_queue_pte_barriers_v2(void)
{
	if (test_thread_flag(TIF_LAZY_MMU) &&
	    !test_thread_flag(TIF_LAZY_MMU_PENDING))
		set_thread_flag(TIF_LAZY_MMU_PENDING);
	else
		emit_pte_barriers();
}

void TEST_queue_pte_barriers_v3(void)
{
	unsigned long flags = read_thread_flags();

	if ((flags & (_TIF_LAZY_MMU | _TIF_LAZY_MMU_PENDING)) == _TIF_LAZY_MMU)
		set_thread_flag(TIF_LAZY_MMU_PENDING);
	else
		emit_pte_barriers();
}


000000000000101c <TEST_queue_pte_barriers_v1>:
    101c:	d5384100 	mrs	x0, sp_el0
    1020:	f9400001 	ldr	x1, [x0]
    1024:	37f80081 	tbnz	w1, #31, 1034 <TEST_queue_pte_barriers_v1+0x18>
    1028:	d5033a9f 	dsb	ishst
    102c:	d5033fdf 	isb
    1030:	d65f03c0 	ret
    1034:	14000004 	b	1044 <TEST_queue_pte_barriers_v1+0x28>
    1038:	d2c00021 	mov	x1, #0x100000000           	// #4294967296
    103c:	f821301f 	stset	x1, [x0]
    1040:	d65f03c0 	ret
    1044:	f9800011 	prfm	pstl1strm, [x0]
    1048:	c85f7c01 	ldxr	x1, [x0]
    104c:	b2600021 	orr	x1, x1, #0x100000000
    1050:	c8027c01 	stxr	w2, x1, [x0]
    1054:	35ffffa2 	cbnz	w2, 1048 <TEST_queue_pte_barriers_v1+0x2c>
    1058:	d65f03c0 	ret

000000000000105c <TEST_queue_pte_barriers_v2>:
    105c:	d5384100 	mrs	x0, sp_el0
    1060:	f9400001 	ldr	x1, [x0]
    1064:	37f80081 	tbnz	w1, #31, 1074 <TEST_queue_pte_barriers_v2+0x18>
    1068:	d5033a9f 	dsb	ishst
    106c:	d5033fdf 	isb
    1070:	d65f03c0 	ret
    1074:	f9400001 	ldr	x1, [x0]
    1078:	b707ff81 	tbnz	x1, #32, 1068 <TEST_queue_pte_barriers_v2+0xc>
    107c:	14000004 	b	108c <TEST_queue_pte_barriers_v2+0x30>
    1080:	d2c00021 	mov	x1, #0x100000000           	// #4294967296
    1084:	f821301f 	stset	x1, [x0]
    1088:	d65f03c0 	ret
    108c:	f9800011 	prfm	pstl1strm, [x0]
    1090:	c85f7c01 	ldxr	x1, [x0]
    1094:	b2600021 	orr	x1, x1, #0x100000000
    1098:	c8027c01 	stxr	w2, x1, [x0]
    109c:	35ffffa2 	cbnz	w2, 1090 <TEST_queue_pte_barriers_v2+0x34>
    10a0:	d65f03c0 	ret

00000000000010a4 <TEST_queue_pte_barriers_v3>:
    10a4:	d5384101 	mrs	x1, sp_el0
    10a8:	f9400020 	ldr	x0, [x1]
    10ac:	d2b00002 	mov	x2, #0x80000000            	// #2147483648
    10b0:	92610400 	and	x0, x0, #0x180000000
    10b4:	eb02001f 	cmp	x0, x2
    10b8:	54000080 	b.eq	10c8 <TEST_queue_pte_barriers_v3+0x24>  // b.none
    10bc:	d5033a9f 	dsb	ishst
    10c0:	d5033fdf 	isb
    10c4:	d65f03c0 	ret
    10c8:	14000004 	b	10d8 <TEST_queue_pte_barriers_v3+0x34>
    10cc:	d2c00020 	mov	x0, #0x100000000           	// #4294967296
    10d0:	f820303f 	stset	x0, [x1]
    10d4:	d65f03c0 	ret
    10d8:	f9800031 	prfm	pstl1strm, [x1]
    10dc:	c85f7c20 	ldxr	x0, [x1]
    10e0:	b2600000 	orr	x0, x0, #0x100000000
    10e4:	c8027c20 	stxr	w2, x0, [x1]
    10e8:	35ffffa2 	cbnz	w2, 10dc <TEST_queue_pte_barriers_v3+0x38>
    10ec:	d65f03c0 	ret



> 
>> +	else
>> +		emit_pte_barriers();
>> +}
>> +
>> +#define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>> +static inline void arch_enter_lazy_mmu_mode(void)
>> +{
>> +	VM_WARN_ON(in_interrupt());
>> +	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
>> +
>> +	set_thread_flag(TIF_LAZY_MMU);
>> +}
>> +
>> +static inline void arch_flush_lazy_mmu_mode(void)
>> +{
>> +	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
>> +		emit_pte_barriers();
>> +}
>> +
>> +static inline void arch_leave_lazy_mmu_mode(void)
>> +{
>> +	arch_flush_lazy_mmu_mode();
>> +	clear_thread_flag(TIF_LAZY_MMU);
>> +}
>> +
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>>  
>> @@ -323,10 +372,8 @@ static inline void __set_pte_complete(pte_t pte)
>>  	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
>>  	 * has the necessary barriers.
>>  	 */
>> -	if (pte_valid_not_user(pte)) {
>> -		dsb(ishst);
>> -		isb();
>> -	}
>> +	if (pte_valid_not_user(pte))
>> +		queue_pte_barriers();
>>  }
> 
> I think this scheme works, I couldn't find a counter-example unless
> __set_pte() gets called in an interrupt context. You could add
> VM_WARN_ON(in_interrupt()) in queue_pte_barriers() as well.
> 
> With preemption, the newly mapped range shouldn't be used before
> arch_flush_lazy_mmu_mode() is called, so it looks safe as well. I think
> x86 uses a per-CPU variable to track this but per-thread is easier to
> reason about if there's no nesting.
> 
>>  static inline void __set_pte(pte_t *ptep, pte_t pte)
>> @@ -778,10 +825,8 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>>  
>>  	WRITE_ONCE(*pmdp, pmd);
>>  
>> -	if (pmd_valid(pmd)) {
>> -		dsb(ishst);
>> -		isb();
>> -	}
>> +	if (pmd_valid(pmd))
>> +		queue_pte_barriers();
>>  }
> 
> We discussed on a previous series - for pmd/pud we end up with barriers
> even for user mappings but they are at a much coarser granularity (and I
> wasn't keen on 'user' attributes for the table entries).
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!

Ryan

