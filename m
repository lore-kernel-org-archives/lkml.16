Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D663268FEF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053216; cv=none; b=Xen+KE6t0osw53OpUgslfOcfAZ4jOhd4H/41i+idsbwBBD74pB8OElAp+SpD9NEGqy5/9JD5A2aBHlIaRV+vD73CtAiH+gRfIqXGX0Wuez/Jj3dOaRgHZm0REDJYu3upq+EOmr/yQ6fEKL6WlZGpzGcrgB/yOmRu11rmqy/4HII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053216; c=relaxed/simple;
	bh=dltHHoczqbQwVpz/nig7P4hxrYWe9zpFUqsvBUXMNNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlOlsUj3uV8TV/fMbWLU7tr1ESgHukvccu6kQJIj7SDRCcFPxeYbzhKRgbKcYhKjiMVILp62F+6ttD4+CNGrNUp0DAWixYGhf1iJPTQjm8ZpttZMT3nnHSSyb8I31kahJ9ZJz8pPB9ObnFc2iFQXVf+HdtA9LIyIXlezNmDJVVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AC20150C;
	Mon, 12 May 2025 05:33:21 -0700 (PDT)
Received: from [10.57.90.222] (unknown [10.57.90.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1098A3F673;
	Mon, 12 May 2025 05:33:29 -0700 (PDT)
Message-ID: <20e6ac75-6c4b-499b-ba26-cc1a2110509e@arm.com>
Date: Mon, 12 May 2025 13:33:28 +0100
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
 <e37d5e61-54e7-4425-837f-25a13f5a68b5@arm.com>
 <836f2574-cb60-44c5-865c-7f13a90779ec@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <836f2574-cb60-44c5-865c-7f13a90779ec@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/05/2025 13:05, David Hildenbrand wrote:
> 
>>>>    static inline void arch_leave_lazy_mmu_mode(void)
>>>>    {
>>>> +    if (in_interrupt())
>>>> +        return;
>>>> +
>>>>        arch_flush_lazy_mmu_mode();
>>>>        clear_thread_flag(TIF_LAZY_MMU);
>>>>    }
>>>
>>> I guess in all cases we could optimize out the in_interrupt() check on !debug
>>> configs.
>>
>> I think that assumes we can easily and accurately identify all configs that
>> cause this? We've identified 2 but I'm not confident that it's a full list.
> 
> Agreed. I was wondering if we could convert the ones to use different pte
> helpers, whereby these helpers would not be available without CONFIG_WHATEVER.
> Then, make these features select CONFIG_WHATEVER.

Trouble is, in KFENCE's case, there is quite a bit of code between the general
API it calls and the pte manipulations:

 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
 apply_to_pte_range mm/memory.c:2936 [inline] (P)
 apply_to_pmd_range mm/memory.c:2985 [inline] (P)
 apply_to_pud_range mm/memory.c:3021 [inline] (P)
 apply_to_p4d_range mm/memory.c:3057 [inline] (P)
 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
 apply_to_page_range+0x4c/0x64 mm/memory.c:3112
 __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
 set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
 kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
 kfence_protect mm/kfence/core.c:247 [inline]
 kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
 __kfence_free+0x104/0x198 mm/kfence/core.c:1187
 kfence_free include/linux/kfence.h:187 [inline]
 slab_free_hook mm/slub.c:2318 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x268/0x474 mm/slub.c:4841
 slab_free_after_rcu_debug+0x78/0x2f4 mm/slub.c:4679
 rcu_do_batch kernel/rcu/tree.c:2568 [inline]
 rcu_core+0x848/0x17a4 kernel/rcu/tree.c:2824
 rcu_core_si+0x10/0x1c kernel/rcu/tree.c:2841
 handle_softirqs+0x328/0xc88 kernel/softirq.c:579
 __do_softirq+0x14/0x20 kernel/softirq.c:613

> 
> VM_WARN_ON_* would be used to catch any violations / wrong use of pte helpers.
> 
>> Also, KFENCE isn't really a debug config (despite me calling it that in the
>> commit log) - it's supposed to be something that can be enabled in production
>> builds.
> 
> Agreed. Even Fedora has it.
> 
>>
>>>
>>> Hm, maybe there is an elegant way to catch all of these "problematic" users?
>>
>> I'm all ears if you have any suggestions? :)
>>
>>
>> It actaully looks like x86/XEN tries to solves this problem in a similar way:
> 
> Heh, yes. Good old xen ...
> 
>>
>> enum xen_lazy_mode xen_get_lazy_mode(void)
>> {
>>     if (in_interrupt())
>>         return XEN_LAZY_NONE;
>>
>>     return this_cpu_read(xen_lazy_mode);
>> }
>>
>> Although I'm not convinced it's fully robust. It also has:
>>
>> static inline void enter_lazy(enum xen_lazy_mode mode)
>> {
>>     BUG_ON(this_cpu_read(xen_lazy_mode) != XEN_LAZY_NONE);
>>
>>     this_cpu_write(xen_lazy_mode, mode);
>> }
>>
>> which is called as part of its arch_enter_lazy_mmu_mode() implementation. If a
>> task was already in lazy mmu mode when an interrupt comes in and causes the
>> nested arch_enter_lazy_mmu_mode() that we saw in this bug report, surely that
>> BUG_ON() should trigger?
> 
> Hm, good point. But that code is old, so probably something seems to be
> preventing that?
> 
> 
> In any case, just a thought on the in_interrupt() check, I think this commit is
> good enough as is.

OK thanks. I'll leave it as-is then in the absence of other feedback :)

