Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EB3261574
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051215; cv=none; b=Qu1l5752G1Xjrx/8FHJMJvO9ETmrhFqOKOpwcHBzfZaCLYeY/L7wzq2qzveQken4eTZe24efpJiHvpIhe0d+b/11ZcXOyuBh0jQ4uVqiP8wRoAK1QBVBOnfVSwwciePclNnBgFHl6opGipbGK045Bso9ozTZwanmo2tzWctsjTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051215; c=relaxed/simple;
	bh=3Na1Ke6o+QZJp7uoY5MGg8R1W2mEwARTrYYs/7Qgmfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBwvi2klZ2VKAyOpsveYSZcR1Wruo8PhJpDhAoSCVAJho02VsIVyy0YgXgf6zhbwgpZF/Sa/XczbLU2hKyZ0Z1UC+0BGVOtiiCvowXpmNBgu8GCgWyf9oA8eY/RnMKaWLvWSJSUfxgSs/GOTLE0D9hfbiHgF8HnhirhgMM/yTfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 391E1150C;
	Mon, 12 May 2025 04:59:59 -0700 (PDT)
Received: from [10.57.90.222] (unknown [10.57.90.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 881C03F673;
	Mon, 12 May 2025 05:00:07 -0700 (PDT)
Message-ID: <e37d5e61-54e7-4425-837f-25a13f5a68b5@arm.com>
Date: Mon, 12 May 2025 13:00:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
 <001dfd4f-27f2-407f-bd1c-21928a754342@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <001dfd4f-27f2-407f-bd1c-21928a754342@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/05/2025 12:07, David Hildenbrand wrote:
> On 12.05.25 12:22, Ryan Roberts wrote:
>> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
>> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
>> flags in order to defer barriers until exiting the mode. At the same
>> time, it added warnings to check that pte manipulations were never
>> performed in interrupt context, because the tracking implementation
>> could not deal with nesting.
>>
>> But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
>> do manipulate ptes in softirq context, which triggered the warnings.
>>
>> So let's take the simplest and safest route and disable the batching
>> optimization in interrupt contexts. This makes these users no worse off
>> than prior to the optimization. Additionally the known offenders are
>> debug features that only manipulate a single PTE, so there is no
>> performance gain anyway.
>>
>> There may be some obscure case of encrypted/decrypted DMA with the
>> dma_free_coherent called from an interrupt context, but again, this is
>> no worse off than prior to the commit.
>>
>> Some options for supporting nesting were considered, but there is a
>> difficult to solve problem if any code manipulates ptes within interrupt
>> context but *outside of* a lazy mmu region. If this case exists, the
>> code would expect the updates to be immediate, but because the task
>> context may have already been in lazy mmu mode, the updates would be
>> deferred, which could cause incorrect behaviour. This problem is avoided
>> by always ensuring updates within interrupt context are immediate.
>>
>> Fixes: 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel mappings")
>> Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/linux-arm-
>> kernel/681f2a09.050a0220.f2294.0006.GAE@google.com/
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>
>> Hi Will,
>>
>> I've tested before and after with KFENCE enabled and it solves the issue. I've
>> also run all the mm-selftests which all continue to pass.
>>
>> Catalin suggested a Fixes patch targetting the SHA as it is in for-next/mm was
>> the preferred approach, but shout if you want something different. I'm hoping
>> that with this fix we can still make it for this cycle, subject to not finding
>> any more issues.
>>
>> Thanks,
>> Ryan
>>
>>
>>   arch/arm64/include/asm/pgtable.h | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index ab4a1b19e596..e65083ec35cb 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -64,7 +64,11 @@ static inline void queue_pte_barriers(void)
>>   {
>>       unsigned long flags;
>>
>> -    VM_WARN_ON(in_interrupt());
>> +    if (in_interrupt()) {
>> +        emit_pte_barriers();
>> +        return;
>> +    }
>> +
>>       flags = read_thread_flags();
>>
>>       if (flags & BIT(TIF_LAZY_MMU)) {
>> @@ -79,7 +83,9 @@ static inline void queue_pte_barriers(void)
>>   #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>>   static inline void arch_enter_lazy_mmu_mode(void)
>>   {
>> -    VM_WARN_ON(in_interrupt());
>> +    if (in_interrupt())
>> +        return;
>> +
>>       VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
>>
>>       set_thread_flag(TIF_LAZY_MMU);
>> @@ -87,12 +93,18 @@ static inline void arch_enter_lazy_mmu_mode(void)
>>
>>   static inline void arch_flush_lazy_mmu_mode(void)
>>   {
>> +    if (in_interrupt())
>> +        return;
>> +
>>       if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
>>           emit_pte_barriers();
>>   }
>>
>>   static inline void arch_leave_lazy_mmu_mode(void)
>>   {
>> +    if (in_interrupt())
>> +        return;
>> +
>>       arch_flush_lazy_mmu_mode();
>>       clear_thread_flag(TIF_LAZY_MMU);
>>   }
> 
> I guess in all cases we could optimize out the in_interrupt() check on !debug
> configs.

I think that assumes we can easily and accurately identify all configs that
cause this? We've identified 2 but I'm not confident that it's a full list.
Also, KFENCE isn't really a debug config (despite me calling it that in the
commit log) - it's supposed to be something that can be enabled in production
builds.

> 
> Hm, maybe there is an elegant way to catch all of these "problematic" users?

I'm all ears if you have any suggestions? :)


It actaully looks like x86/XEN tries to solves this problem in a similar way:

enum xen_lazy_mode xen_get_lazy_mode(void)
{
	if (in_interrupt())
		return XEN_LAZY_NONE;

	return this_cpu_read(xen_lazy_mode);
}

Although I'm not convinced it's fully robust. It also has:

static inline void enter_lazy(enum xen_lazy_mode mode)
{
	BUG_ON(this_cpu_read(xen_lazy_mode) != XEN_LAZY_NONE);

	this_cpu_write(xen_lazy_mode, mode);
}

which is called as part of its arch_enter_lazy_mmu_mode() implementation. If a
task was already in lazy mmu mode when an interrupt comes in and causes the
nested arch_enter_lazy_mmu_mode() that we saw in this bug report, surely that
BUG_ON() should trigger?

Thanks,
Ryan

