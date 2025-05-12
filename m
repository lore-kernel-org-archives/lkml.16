Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41D61B95B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057997; cv=none; b=u9oVgbjXQSPKkc7xusPQBIgIOokEBNuVcv0TtFXusiF6rHXcMP88Q/OX6vVUw6pwL6Ol3YBr86pkgyg+VnUVvKFkUSDV6/SsOjJKU2cPra5njc3JLiwu1oQzw+IBqpwvDIeyE+rBGV8n1UzIHqFqY/lt+HJanqAk8D+wKriuPUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057997; c=relaxed/simple;
	bh=nB85RuFBNsM/6djL4CI+WUsQIJEBz5sF04yhaipuhm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXigvW8M0aXD4x/1YXCa1h/ubMea+zKZ1W7xOY+y39Ka/ynvt6pS0zDSE/6UEtujpkt6ynAz9q4DDbFKIP1uK8XR2YvFy5Yfl4qmSAp8ew6ljeosElFVmpJKbjnB6hZZTPRnl1shQHRUEq19JKsv5u9lU4jGISg24BB9hytg7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59A05150C;
	Mon, 12 May 2025 06:53:03 -0700 (PDT)
Received: from [10.57.90.222] (unknown [10.57.90.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B76E63F673;
	Mon, 12 May 2025 06:53:11 -0700 (PDT)
Message-ID: <7852c047-e8da-44d4-8220-68c2ebca5206@arm.com>
Date: Mon, 12 May 2025 14:53:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
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
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
 <aCH0TLRQslXHin5Q@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aCH0TLRQslXHin5Q@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/05/2025 14:14, Catalin Marinas wrote:
> On Mon, May 12, 2025 at 11:22:40AM +0100, Ryan Roberts wrote:
>> @@ -79,7 +83,9 @@ static inline void queue_pte_barriers(void)
>>  #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>>  static inline void arch_enter_lazy_mmu_mode(void)
>>  {
>> -	VM_WARN_ON(in_interrupt());
>> +	if (in_interrupt())
>> +		return;
>> +
>>  	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
> 
> I still get this warning trigger with some debugging enabled (more
> specifically, CONFIG_DEBUG_PAGEALLOC). Patch applied on top of the arm64
> for-kernelci.

Thanks for the report...

I'll admit I didn't explicitly test CONFIG_DEBUG_PAGEALLOC since I thought we
concluded when talking that the failure mode was the same as KFENCE in that it
was due to pte manipulations in the interrupt context.

But that's not what this trace shows...

The warning is basically saying we have nested lazy mmu mode regions, both in
task context, which is completely illegal as far as lazy mmu is concerned.

Looks like the first nest is zap_pte_range(), which is batching with mmu_gather
and that allocates memory in tlb_next_batch(). And when CONFIG_DEBUG_PAGEALLOC
is enabled, it calls into the arch to make the allocated page valid in the
linear map. arm64 does that with apply_to_page_range(), which does a second lazy
mmu nest.

I need to have a think about what the right fix is. Will get back to you shortly.

Thanks,
Ryan

> 
> Is it because the unmap code uses arch_enter_lazy_mmu_mode() already and
> __apply_to_page_range() via __kernel_map_pages() is attempting another
> nested call? I think it's still safe, we just drop the optimisation in
> the outer code and issue the barriers immediately. So maybe drop this
> warning as well but add a comment on how nesting works.
> 
> ------------[ cut here ]------------
> WARNING: CPU: 6 PID: 1 at arch/arm64/include/asm/pgtable.h:89 __apply_to_page_range+0x85c/0x9f8
> Modules linked in: ip_tables x_tables ipv6
> CPU: 6 UID: 0 PID: 1 Comm: systemd Not tainted 6.15.0-rc5-00075-g676795fe9cf6 #1 PREEMPT 
> Hardware name: QEMU KVM Virtual Machine, BIOS 2024.08-4 10/25/2024
> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __apply_to_page_range+0x85c/0x9f8
> lr : __apply_to_page_range+0x2b4/0x9f8
> sp : ffff80008009b3c0
> x29: ffff80008009b460 x28: ffff0000c43a3000 x27: ffff0001ff62b108
> x26: ffff0000c43a4000 x25: 0000000000000001 x24: 0010000000000001
> x23: ffffbf24c9c209c0 x22: ffff80008009b4d0 x21: ffffbf24c74a3b20
> x20: ffff0000c43a3000 x19: ffff0001ff609d18 x18: 0000000000000001
> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000003
> x14: 0000000000000028 x13: ffffbf24c97c1000 x12: ffff0000c43a3fff
> x11: ffffbf24cacc9a70 x10: ffff0000c43a3fff x9 : ffff0001fffff018
> x8 : 0000000000000012 x7 : ffff0000c43a4000 x6 : ffff0000c43a4000
> x5 : ffffbf24c9c209c0 x4 : ffff0000c43a3fff x3 : ffff0001ff609000
> x2 : 0000000000000d18 x1 : ffff0000c03e8000 x0 : 0000000080000000
> Call trace:
>  __apply_to_page_range+0x85c/0x9f8 (P)
>  apply_to_page_range+0x14/0x20
>  set_memory_valid+0x5c/0xd8
>  __kernel_map_pages+0x84/0xc0
>  get_page_from_freelist+0x1110/0x1340
>  __alloc_frozen_pages_noprof+0x114/0x1178
>  alloc_pages_mpol+0xb8/0x1d0
>  alloc_frozen_pages_noprof+0x48/0xc0
>  alloc_pages_noprof+0x10/0x60
>  get_free_pages_noprof+0x14/0x90
>  __tlb_remove_folio_pages_size.isra.0+0xe4/0x140
>  __tlb_remove_folio_pages+0x10/0x20
>  unmap_page_range+0xa1c/0x14c0
>  unmap_single_vma.isra.0+0x48/0x90
>  unmap_vmas+0xe0/0x200
>  vms_clear_ptes+0xf4/0x140
>  vms_complete_munmap_vmas+0x7c/0x208
>  do_vmi_align_munmap+0x180/0x1a8
>  do_vmi_munmap+0xac/0x188
>  __vm_munmap+0xe0/0x1e0
>  __arm64_sys_munmap+0x20/0x38
>  invoke_syscall+0x48/0x104
>  el0_svc_common.constprop.0+0x40/0xe0
>  do_el0_svc+0x1c/0x28
>  el0_svc+0x4c/0x16c
>  el0t_64_sync_handler+0x10c/0x140
>  el0t_64_sync+0x198/0x19c
> irq event stamp: 281312
> hardirqs last  enabled at (281311): [<ffffbf24c780fd04>] bad_range+0x164/0x1c0
> hardirqs last disabled at (281312): [<ffffbf24c89c4550>] el1_dbg+0x24/0x98
> softirqs last  enabled at (281054): [<ffffbf24c752d99c>] handle_softirqs+0x4cc/0x518
> softirqs last disabled at (281019): [<ffffbf24c7450694>] __do_softirq+0x14/0x20
> ---[ end trace 0000000000000000 ]---
> 

