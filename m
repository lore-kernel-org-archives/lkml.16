Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23633171CD
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746991278; cv=none; b=dwZtM6Bm9QojxMfdIlNXKVU7VDmEFqenkZkj5YxnUBahgyQdbDlams0saxjA1bgiye/IQTEDgyxG4DY3CEbRgWo+P2WlOHK9nZleB/h/1S4w/SxbPAZLcyX4hVgn0BiBdRVvjcQ7a+A7j68J67c78xKbR6g5ad/JIpfPxZ5R2iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746991278; c=relaxed/simple;
	bh=p7+jc/TLVnKWScWgij1bUJtoVHT+N+/s3CHbeSAPCFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+Djk7vPGVvanmtrrKQH76TSLcvw7oM84A0c3c+hxV5ZfnT3EI55XUJRTqSJzCV0QUpwxfUn/ew78RA7CPvQSlY+aUzz8NlOckNmTFMw+pfI4aGwmtmIfiEXqKSYU1hBePFwr5R5+QUNYSRsRYRSJ2y9wIASH87qbULGkJP7JxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 227EC1516;
	Sun, 11 May 2025 12:21:01 -0700 (PDT)
Received: from [10.57.90.222] (unknown [10.57.90.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76C543F63F;
	Sun, 11 May 2025 12:21:10 -0700 (PDT)
Message-ID: <89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com>
Date: Sun, 11 May 2025 20:21:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [arm?] upstream-arm64 test error: WARNING in
 __apply_to_page_range
Content-Language: en-GB
To: Will Deacon <will@kernel.org>,
 syzbot <syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 anshuman.khandual@arm.com, luizcap@redhat.com
References: <681f2a09.050a0220.f2294.0006.GAE@google.com>
 <20250511103624.GA7848@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250511103624.GA7848@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/05/2025 11:36, Will Deacon wrote:
> [+Ryan as this looks like his warning]

Yes I added this warning...

> 
> Looks like we're trying to enter lazy mmu mode in softirq context?
> Full report below (hence the top-posting).

The entering of lazy mmu mode is not new; but what's new (as of my series) is
that arm64 implements the lazy mmu hooks and assumes (and asserts) that this
never gets called in interrupt context.

It was a key part of my understanding that pgtables would never be modified
outside of task context and therefore the arm64 implementation is using TIF
flags to track the lazy mmu state. That doesn't work in interrupt context
because the interrupt could be preempting a section of code that is already in
lazy mmu mode.

Clearly my understanding is wrong because, as per below, kfence is manipulating
the pgtable as part of a kfree in a softirq.

Despite this, I don't think there is a correctness issue. But things clearly are
not operating as I thought so I'll investigate more in the morning. A couple of
options spring to mind;

 - remove the warning and let things continue to work correctly, but not always
with the intended optimization.

 - Don't actually enter lazy mmu mode if called from an interrupt

 - Don't use TIF flags to track lazy mmu state and instead use per-cpu state.

I'll provide a recommendation tomorrow. Either way, I guess you will want to
back the series out of -next? Sorry about this...

Thanks,
Ryan

> 
> Will
> 
> --->8
> 
> On Sat, May 10, 2025 at 03:27:21AM -0700, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    ac57c6b0f09c Merge branch 'for-next/core' into for-kernelci
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1556e670580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=ea4635ffd6ad5b4a
>> dashboard link: https://syzkaller.appspot.com/bug?extid=5c0d9392e042f41d45c5
>> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
>> userspace arch: arm64
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/4818e8577303/disk-ac57c6b0.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/53920b0d80b6/vmlinux-ac57c6b0.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/66529cd2f94a/Image-ac57c6b0.gz.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 6368 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 6368 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 6368 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 6368 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 6368 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 6368 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 6368 Comm: dhcpcd-run-hook Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff800080017900
>> x29: ffff800080017a20 x28: ffff0001ffbbefff x27: ffff0001fec50fe8
>> x26: ffff0001ffbbf000 x25: dfff800000000000 x24: ffff0001ffbbe000
>> x23: ffff0001fea8edf0 x22: 0000000000000100 x21: ffff0000c2d35b80
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 0000000000000000
>> x17: ffff80010d10c000 x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb95d x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb95e x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c2d35b80 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800080017b00 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000100 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  __kfence_free+0x104/0x198 mm/kfence/core.c:1187
>>  kfence_free include/linux/kfence.h:187 [inline]
>>  slab_free_hook mm/slub.c:2318 [inline]
>>  slab_free mm/slub.c:4642 [inline]
>>  kfree+0x268/0x474 mm/slub.c:4841
>>  slab_free_after_rcu_debug+0x78/0x2f4 mm/slub.c:4679
>>  rcu_do_batch kernel/rcu/tree.c:2568 [inline]
>>  rcu_core+0x848/0x17a4 kernel/rcu/tree.c:2824
>>  rcu_core_si+0x10/0x1c kernel/rcu/tree.c:2841
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  __do_softirq+0x14/0x20 kernel/softirq.c:613
>>  ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
>>  call_on_irq_stack+0x24/0x30 arch/arm64/kernel/entry.S:891
>>  do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
>>  invoke_softirq kernel/softirq.c:460 [inline]
>>  __irq_exit_rcu+0x1b0/0x478 kernel/softirq.c:680
>>  irq_exit_rcu+0x14/0x84 kernel/softirq.c:696
>>  __el1_irq arch/arm64/kernel/entry-common.c:584 [inline]
>>  el1_interrupt+0x38/0x54 arch/arm64/kernel/entry-common.c:598
>>  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:603
>>  el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
>>  __sanitizer_cov_trace_cmp8+0x8/0x98 kernel/kcov.c:293 (P)
>>  mas_wr_walk lib/maple_tree.c:3526 [inline]
>>  mas_wr_store_type+0x104/0x1350 lib/maple_tree.c:4203
>>  mas_store+0x370/0xa8c lib/maple_tree.c:5393
>>  vma_iter_bulk_store include/linux/mm.h:1125 [inline]
>>  dup_mmap kernel/fork.c:702 [inline]
>>  dup_mm kernel/fork.c:1734 [inline]
>>  copy_mm+0xc30/0x1bd8 kernel/fork.c:1786
>>  copy_process+0x1518/0x318c kernel/fork.c:2429
>>  kernel_clone+0x1d8/0x7a0 kernel/fork.c:2844
>>  __do_sys_clone kernel/fork.c:2987 [inline]
>>  __se_sys_clone kernel/fork.c:2955 [inline]
>>  __arm64_sys_clone+0x144/0x1a0 kernel/fork.c:2955
>>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>> irq event stamp: 9751
>> hardirqs last  enabled at (9750): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (9750): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (9751): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (9570): [<ffff8000801fbf10>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
>> softirqs last disabled at (9713): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 6392 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 6392 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 6392 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 6392 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 6392 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 6392 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 6392 Comm: cmp Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff800080017900
>> x29: ffff800080017a20 x28: ffff0001ffbc2fff x27: ffff0001fec50fe8
>> x26: ffff0001ffbc3000 x25: dfff800000000000 x24: ffff0001ffbc2000
>> x23: ffff0001fea8ee10 x22: 0000000000000100 x21: ffff0000c7f98000
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 0000000000000000
>> x17: ffff80010d10c000 x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb9d7 x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb9d8 x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c7f98000 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800080017b00 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000100 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  __kfence_free+0x104/0x198 mm/kfence/core.c:1187
>>  kfence_free include/linux/kfence.h:187 [inline]
>>  slab_free_hook mm/slub.c:2318 [inline]
>>  slab_free mm/slub.c:4642 [inline]
>>  kfree+0x268/0x474 mm/slub.c:4841
>>  slab_free_after_rcu_debug+0x78/0x2f4 mm/slub.c:4679
>>  rcu_do_batch kernel/rcu/tree.c:2568 [inline]
>>  rcu_core+0x848/0x17a4 kernel/rcu/tree.c:2824
>>  rcu_core_si+0x10/0x1c kernel/rcu/tree.c:2841
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  __do_softirq+0x14/0x20 kernel/softirq.c:613
>>  ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
>>  call_on_irq_stack+0x24/0x30 arch/arm64/kernel/entry.S:891
>>  do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
>>  invoke_softirq kernel/softirq.c:460 [inline]
>>  __irq_exit_rcu+0x1b0/0x478 kernel/softirq.c:680
>>  irq_exit_rcu+0x14/0x84 kernel/softirq.c:696
>>  __el1_irq arch/arm64/kernel/entry-common.c:584 [inline]
>>  el1_interrupt+0x38/0x54 arch/arm64/kernel/entry-common.c:598
>>  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:603
>>  el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
>>  __daif_local_irq_restore arch/arm64/include/asm/irqflags.h:175 [inline] (P)
>>  arch_local_irq_restore arch/arm64/include/asm/irqflags.h:195 [inline] (P)
>>  __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline] (P)
>>  _raw_spin_unlock_irqrestore+0x44/0x98 kernel/locking/spinlock.c:194 (P)
>>  debug_object_activate+0x240/0x460 lib/debugobjects.c:836
>>  debug_rcu_head_queue kernel/rcu/rcu.h:224 [inline]
>>  __call_rcu_common kernel/rcu/tree.c:3067 [inline]
>>  call_rcu+0x50/0x96c kernel/rcu/tree.c:3202
>>  ma_free_rcu lib/maple_tree.c:211 [inline]
>>  mas_free lib/maple_tree.c:1313 [inline]
>>  mas_replace_node+0x34c/0x5d0 lib/maple_tree.c:1750
>>  mas_wr_node_store lib/maple_tree.c:3863 [inline]
>>  mas_wr_store_entry+0x1194/0x1f80 lib/maple_tree.c:4083
>>  mas_store_prealloc+0x8bc/0xce4 lib/maple_tree.c:5475
>>  vma_iter_store_overwrite+0x314/0x870 mm/vma.h:448
>>  vma_iter_store_new mm/vma.h:455 [inline]
>>  vma_complete+0x3cc/0xa08 mm/vma.c:323
>>  __split_vma+0x778/0x8d4 mm/vma.c:523
>>  vms_gather_munmap_vmas+0x2a0/0xf54 mm/vma.c:1315
>>  __mmap_prepare mm/vma.c:2303 [inline]
>>  __mmap_region mm/vma.c:2506 [inline]
>>  mmap_region+0x4e8/0x1a24 mm/vma.c:2597
>>  do_mmap+0x968/0xf78 mm/mmap.c:561
>>  vm_mmap_pgoff+0x2b8/0x43c mm/util.c:579
>>  ksys_mmap_pgoff+0x394/0x5b8 mm/mmap.c:607
>>  __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
>>  __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
>>  __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
>>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>> irq event stamp: 3737
>> hardirqs last  enabled at (3736): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (3736): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (3737): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (1634): [<ffff8000801fbf10>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
>> softirqs last disabled at (3711): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 23 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 23 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 23 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 23 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 23 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 23 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 23 Comm: ksoftirqd/1 Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff800097717700
>> x29: ffff800097717820 x28: ffff0001ffbc6fff x27: ffff0001fec50fe8
>> x26: ffff0001ffbc7000 x25: dfff800000000000 x24: ffff0001ffbc6000
>> x23: ffff0001fea8ee30 x22: 0000000000000100 x21: ffff0000c1b95b80
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 1fffe0003386f276
>> x17: ffff80008f31e000 x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb99b x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb99c x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c1b95b80 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800097717900 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000100 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  rcu_guarded_free+0x4c/0x5c mm/kfence/core.c:587
>>  rcu_do_batch kernel/rcu/tree.c:2568 [inline]
>>  rcu_core+0x848/0x17a4 kernel/rcu/tree.c:2824
>>  rcu_core_si+0x10/0x1c kernel/rcu/tree.c:2841
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  run_ksoftirqd+0x70/0xc0 kernel/softirq.c:968
>>  smpboot_thread_fn+0x4d8/0x9cc kernel/smpboot.c:164
>>  kthread+0x5fc/0x75c kernel/kthread.c:464
>>  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
>> irq event stamp: 551089
>> hardirqs last  enabled at (551088): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (551088): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (551089): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (550580): [<ffff8000803ce71c>] softirq_handle_end kernel/softirq.c:425 [inline]
>> softirqs last  enabled at (550580): [<ffff8000803ce71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
>> softirqs last disabled at (550583): [<ffff8000803d1418>] run_ksoftirqd+0x70/0xc0 kernel/softirq.c:968
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 6424 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 6424 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 6424 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 6424 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 6424 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 6424 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 6424 Comm: dhcpcd-run-hook Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff800080017900
>> x29: ffff800080017a20 x28: ffff0001ffbd2fff x27: ffff0001fec50fe8
>> x26: ffff0001ffbd3000 x25: dfff800000000000 x24: ffff0001ffbd2000
>> x23: ffff0001fea8ee90 x22: 0000000000000100 x21: ffff0000c825bd00
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 0000000000000000
>> x17: ffff80010d10c000 x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb9d7 x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb9d8 x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c825bd00 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800080017b00 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000100 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  __kfence_free+0x104/0x198 mm/kfence/core.c:1187
>>  kfence_free include/linux/kfence.h:187 [inline]
>>  slab_free_hook mm/slub.c:2318 [inline]
>>  slab_free mm/slub.c:4642 [inline]
>>  kfree+0x268/0x474 mm/slub.c:4841
>>  slab_free_after_rcu_debug+0x78/0x2f4 mm/slub.c:4679
>>  rcu_do_batch kernel/rcu/tree.c:2568 [inline]
>>  rcu_core+0x848/0x17a4 kernel/rcu/tree.c:2824
>>  rcu_core_si+0x10/0x1c kernel/rcu/tree.c:2841
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  __do_softirq+0x14/0x20 kernel/softirq.c:613
>>  ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
>>  call_on_irq_stack+0x24/0x30 arch/arm64/kernel/entry.S:891
>>  do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
>>  invoke_softirq kernel/softirq.c:460 [inline]
>>  __irq_exit_rcu+0x1b0/0x478 kernel/softirq.c:680
>>  irq_exit_rcu+0x14/0x84 kernel/softirq.c:696
>>  __el1_irq arch/arm64/kernel/entry-common.c:584 [inline]
>>  el1_interrupt+0x38/0x54 arch/arm64/kernel/entry-common.c:598
>>  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:603
>>  el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
>>  __daif_local_irq_restore arch/arm64/include/asm/irqflags.h:175 [inline] (P)
>>  arch_local_irq_restore arch/arm64/include/asm/irqflags.h:195 [inline] (P)
>>  lock_release+0x270/0x39c kernel/locking/lockdep.c:5890 (P)
>>  fs_reclaim_acquire+0xd0/0x118 mm/page_alloc.c:4082
>>  might_alloc include/linux/sched/mm.h:318 [inline]
>>  slab_pre_alloc_hook mm/slub.c:4098 [inline]
>>  slab_alloc_node mm/slub.c:4176 [inline]
>>  kmem_cache_alloc_noprof+0x58/0x3e8 mm/slub.c:4203
>>  vm_area_dup+0x34/0x50c kernel/fork.c:488
>>  dup_mmap kernel/fork.c:672 [inline]
>>  dup_mm kernel/fork.c:1734 [inline]
>>  copy_mm+0x9e0/0x1bd8 kernel/fork.c:1786
>>  copy_process+0x1518/0x318c kernel/fork.c:2429
>>  kernel_clone+0x1d8/0x7a0 kernel/fork.c:2844
>>  __do_sys_clone kernel/fork.c:2987 [inline]
>>  __se_sys_clone kernel/fork.c:2955 [inline]
>>  __arm64_sys_clone+0x144/0x1a0 kernel/fork.c:2955
>>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>> irq event stamp: 9375
>> hardirqs last  enabled at (9374): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (9374): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (9375): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (8082): [<ffff8000801fbf10>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
>> softirqs last disabled at (8227): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff800080017900
>> x29: ffff800080017a20 x28: ffff0001ffbd6fff x27: ffff0001fec50fe8
>> x26: ffff0001ffbd7000 x25: dfff800000000000 x24: ffff0001ffbd6000
>> x23: ffff0001fea8eeb0 x22: 0000000000000100 x21: ffff0000c1a0db80
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 1fffe0003386f276
>> x17: 0000000000000000 x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb958 x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb959 x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c1a0db80 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800080017b00 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000100 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  __kfence_free+0x104/0x198 mm/kfence/core.c:1187
>>  kfence_free include/linux/kfence.h:187 [inline]
>>  slab_free_hook mm/slub.c:2318 [inline]
>>  slab_free mm/slub.c:4642 [inline]
>>  kmem_cache_free+0x250/0x550 mm/slub.c:4744
>>  put_cred_rcu+0x258/0x320 kernel/cred.c:89
>>  rcu_do_batch kernel/rcu/tree.c:2568 [inline]
>>  rcu_core+0x848/0x17a4 kernel/rcu/tree.c:2824
>>  rcu_core_si+0x10/0x1c kernel/rcu/tree.c:2841
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  __do_softirq+0x14/0x20 kernel/softirq.c:613
>>  ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
>>  call_on_irq_stack+0x24/0x30 arch/arm64/kernel/entry.S:891
>>  do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
>>  invoke_softirq kernel/softirq.c:460 [inline]
>>  __irq_exit_rcu+0x1b0/0x478 kernel/softirq.c:680
>>  irq_exit_rcu+0x14/0x84 kernel/softirq.c:696
>>  __el1_irq arch/arm64/kernel/entry-common.c:584 [inline]
>>  el1_interrupt+0x38/0x54 arch/arm64/kernel/entry-common.c:598
>>  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:603
>>  el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
>>  __daif_local_irq_enable arch/arm64/include/asm/irqflags.h:26 [inline] (P)
>>  arch_local_irq_enable+0x8/0xc arch/arm64/include/asm/irqflags.h:48 (P)
>>  cpuidle_idle_call kernel/sched/idle.c:185 [inline]
>>  do_idle+0x1d8/0x454 kernel/sched/idle.c:325
>>  cpu_startup_entry+0x5c/0x74 kernel/sched/idle.c:423
>>  secondary_start_kernel+0x1b8/0x1e0 arch/arm64/kernel/smp.c:279
>>  __secondary_switched+0xc0/0xc4 arch/arm64/kernel/head.S:401
>> irq event stamp: 160227
>> hardirqs last  enabled at (160226): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (160226): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (160227): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (160106): [<ffff8000803ce71c>] softirq_handle_end kernel/softirq.c:425 [inline]
>> softirqs last  enabled at (160106): [<ffff8000803ce71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
>> softirqs last disabled at (160151): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff800080017900
>> x29: ffff800080017a20 x28: ffff0001ffbdefff x27: ffff0001fec50fe8
>> x26: ffff0001ffbdf000 x25: dfff800000000000 x24: ffff0001ffbde000
>> x23: ffff0001fea8eef0 x22: 0000000000000100 x21: ffff0000c1a0db80
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 1fffe0003386f276
>> x17: ffff80010d10c000 x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb93d x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb93e x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c1a0db80 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800080017b00 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000100 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  __kfence_free+0x104/0x198 mm/kfence/core.c:1187
>>  kfence_free include/linux/kfence.h:187 [inline]
>>  slab_free_hook mm/slub.c:2318 [inline]
>>  slab_free mm/slub.c:4642 [inline]
>>  kfree+0x268/0x474 mm/slub.c:4841
>>  slab_free_after_rcu_debug+0x78/0x2f4 mm/slub.c:4679
>>  rcu_do_batch kernel/rcu/tree.c:2568 [inline]
>>  rcu_core+0x848/0x17a4 kernel/rcu/tree.c:2824
>>  rcu_core_si+0x10/0x1c kernel/rcu/tree.c:2841
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  __do_softirq+0x14/0x20 kernel/softirq.c:613
>>  ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
>>  call_on_irq_stack+0x24/0x30 arch/arm64/kernel/entry.S:891
>>  do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
>>  invoke_softirq kernel/softirq.c:460 [inline]
>>  __irq_exit_rcu+0x1b0/0x478 kernel/softirq.c:680
>>  irq_exit_rcu+0x14/0x84 kernel/softirq.c:696
>>  __el1_irq arch/arm64/kernel/entry-common.c:584 [inline]
>>  el1_interrupt+0x38/0x54 arch/arm64/kernel/entry-common.c:598
>>  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:603
>>  el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
>>  __daif_local_irq_enable arch/arm64/include/asm/irqflags.h:26 [inline] (P)
>>  arch_local_irq_enable+0x8/0xc arch/arm64/include/asm/irqflags.h:48 (P)
>>  cpuidle_idle_call kernel/sched/idle.c:185 [inline]
>>  do_idle+0x1d8/0x454 kernel/sched/idle.c:325
>>  cpu_startup_entry+0x5c/0x74 kernel/sched/idle.c:423
>>  secondary_start_kernel+0x1b8/0x1e0 arch/arm64/kernel/smp.c:279
>>  __secondary_switched+0xc0/0xc4 arch/arm64/kernel/head.S:401
>> irq event stamp: 167057
>> hardirqs last  enabled at (167056): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (167056): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (167057): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (166994): [<ffff8000803ce71c>] softirq_handle_end kernel/softirq.c:425 [inline]
>> softirqs last  enabled at (166994): [<ffff8000803ce71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
>> softirqs last disabled at (167011): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff800080017120
>> x29: ffff800080017240 x28: ffff0001ffbecfff x27: ffff0001fec50fe8
>> x26: ffff0001ffbed000 x25: dfff800000000000 x24: ffff0001ffbec000
>> x23: ffff0001fea8ef60 x22: 0000000000000500 x21: ffff0000c1a0db80
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 1fffe0003386f276
>> x17: 0000000000a000ae x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb9b7 x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb9b8 x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c1a0db80 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800080017320 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000500 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  __kfence_free+0x104/0x198 mm/kfence/core.c:1187
>>  kfence_free include/linux/kfence.h:187 [inline]
>>  slab_free_hook mm/slub.c:2318 [inline]
>>  slab_free mm/slub.c:4642 [inline]
>>  kmem_cache_free+0x250/0x550 mm/slub.c:4744
>>  kfree_skbmem+0x14c/0x1dc net/core/skbuff.c:-1
>>  __kfree_skb net/core/skbuff.c:1177 [inline]
>>  consume_skb+0xb8/0x130 net/core/skbuff.c:1408
>>  ifb_xmit+0x174/0x53c drivers/net/ifb.c:346
>>  __netdev_start_xmit include/linux/netdevice.h:5203 [inline]
>>  netdev_start_xmit include/linux/netdevice.h:5212 [inline]
>>  xmit_one net/core/dev.c:3776 [inline]
>>  dev_hard_start_xmit+0x2b0/0x8ac net/core/dev.c:3792
>>  sch_direct_xmit+0x1fc/0x468 net/sched/sch_generic.c:343
>>  __dev_xmit_skb net/core/dev.c:4018 [inline]
>>  __dev_queue_xmit+0x13b4/0x31f0 net/core/dev.c:4595
>>  dev_queue_xmit include/linux/netdevice.h:3350 [inline]
>>  lapbeth_data_transmit+0x1fc/0x2a8 drivers/net/wan/lapbether.c:260
>>  lapb_data_transmit+0x8c/0xb0 net/lapb/lapb_iface.c:447
>>  lapb_transmit_buffer+0x160/0x208 net/lapb/lapb_out.c:149
>>  lapb_send_control+0x21c/0x320 net/lapb/lapb_subr.c:251
>>  lapb_t1timer_expiry+0x490/0x864 net/lapb/lapb_timer.c:-1
>>  call_timer_fn+0x1b4/0x818 kernel/time/timer.c:1789
>>  expire_timers kernel/time/timer.c:1840 [inline]
>>  __run_timers kernel/time/timer.c:2414 [inline]
>>  __run_timer_base+0x51c/0x76c kernel/time/timer.c:2426
>>  run_timer_base kernel/time/timer.c:2435 [inline]
>>  run_timer_softirq+0xcc/0x194 kernel/time/timer.c:2445
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  __do_softirq+0x14/0x20 kernel/softirq.c:613
>>  ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
>>  call_on_irq_stack+0x24/0x30 arch/arm64/kernel/entry.S:891
>>  do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
>>  invoke_softirq kernel/softirq.c:460 [inline]
>>  __irq_exit_rcu+0x1b0/0x478 kernel/softirq.c:680
>>  irq_exit_rcu+0x14/0x84 kernel/softirq.c:696
>>  __el1_irq arch/arm64/kernel/entry-common.c:584 [inline]
>>  el1_interrupt+0x38/0x54 arch/arm64/kernel/entry-common.c:598
>>  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:603
>>  el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
>>  __daif_local_irq_enable arch/arm64/include/asm/irqflags.h:26 [inline] (P)
>>  arch_local_irq_enable+0x8/0xc arch/arm64/include/asm/irqflags.h:48 (P)
>>  cpuidle_idle_call kernel/sched/idle.c:185 [inline]
>>  do_idle+0x1d8/0x454 kernel/sched/idle.c:325
>>  cpu_startup_entry+0x5c/0x74 kernel/sched/idle.c:423
>>  secondary_start_kernel+0x1b8/0x1e0 arch/arm64/kernel/smp.c:279
>>  __secondary_switched+0xc0/0xc4 arch/arm64/kernel/head.S:401
>> irq event stamp: 171221
>> hardirqs last  enabled at (171220): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (171220): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (171221): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (171182): [<ffff8000803ce71c>] softirq_handle_end kernel/softirq.c:425 [inline]
>> softirqs last  enabled at (171182): [<ffff8000803ce71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
>> softirqs last disabled at (171197): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff800080017120
>> x29: ffff800080017240 x28: ffff0001ffbeefff x27: ffff0001fec50fe8
>> x26: ffff0001ffbef000 x25: dfff800000000000 x24: ffff0001ffbee000
>> x23: ffff0001fea8ef70 x22: 0000000000000500 x21: ffff0000c1a0db80
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 00000000ffffffff
>> x17: 0000000000a000ae x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb9b7 x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb9b8 x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c1a0db80 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800080017320 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000500 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  __kfence_free+0x104/0x198 mm/kfence/core.c:1187
>>  kfence_free include/linux/kfence.h:187 [inline]
>>  slab_free_hook mm/slub.c:2318 [inline]
>>  slab_free mm/slub.c:4642 [inline]
>>  kmem_cache_free+0x250/0x550 mm/slub.c:4744
>>  kfree_skbmem+0x14c/0x1dc net/core/skbuff.c:-1
>>  __kfree_skb net/core/skbuff.c:1177 [inline]
>>  consume_skb+0xb8/0x130 net/core/skbuff.c:1408
>>  ifb_xmit+0x174/0x53c drivers/net/ifb.c:346
>>  __netdev_start_xmit include/linux/netdevice.h:5203 [inline]
>>  netdev_start_xmit include/linux/netdevice.h:5212 [inline]
>>  xmit_one net/core/dev.c:3776 [inline]
>>  dev_hard_start_xmit+0x2b0/0x8ac net/core/dev.c:3792
>>  sch_direct_xmit+0x1fc/0x468 net/sched/sch_generic.c:343
>>  __dev_xmit_skb net/core/dev.c:4018 [inline]
>>  __dev_queue_xmit+0x13b4/0x31f0 net/core/dev.c:4595
>>  dev_queue_xmit include/linux/netdevice.h:3350 [inline]
>>  lapbeth_data_transmit+0x1fc/0x2a8 drivers/net/wan/lapbether.c:260
>>  lapb_data_transmit+0x8c/0xb0 net/lapb/lapb_iface.c:447
>>  lapb_transmit_buffer+0x160/0x208 net/lapb/lapb_out.c:149
>>  lapb_send_control+0x21c/0x320 net/lapb/lapb_subr.c:251
>>  lapb_t1timer_expiry+0x490/0x864 net/lapb/lapb_timer.c:-1
>>  call_timer_fn+0x1b4/0x818 kernel/time/timer.c:1789
>>  expire_timers kernel/time/timer.c:1840 [inline]
>>  __run_timers kernel/time/timer.c:2414 [inline]
>>  __run_timer_base+0x51c/0x76c kernel/time/timer.c:2426
>>  run_timer_base kernel/time/timer.c:2435 [inline]
>>  run_timer_softirq+0xcc/0x194 kernel/time/timer.c:2445
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  __do_softirq+0x14/0x20 kernel/softirq.c:613
>>  ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
>>  call_on_irq_stack+0x24/0x30 arch/arm64/kernel/entry.S:891
>>  do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
>>  invoke_softirq kernel/softirq.c:460 [inline]
>>  __irq_exit_rcu+0x1b0/0x478 kernel/softirq.c:680
>>  irq_exit_rcu+0x14/0x84 kernel/softirq.c:696
>>  __el1_irq arch/arm64/kernel/entry-common.c:584 [inline]
>>  el1_interrupt+0x38/0x54 arch/arm64/kernel/entry-common.c:598
>>  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:603
>>  el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
>>  __daif_local_irq_enable arch/arm64/include/asm/irqflags.h:26 [inline] (P)
>>  arch_local_irq_enable+0x8/0xc arch/arm64/include/asm/irqflags.h:48 (P)
>>  cpuidle_idle_call kernel/sched/idle.c:185 [inline]
>>  do_idle+0x1d8/0x454 kernel/sched/idle.c:325
>>  cpu_startup_entry+0x5c/0x74 kernel/sched/idle.c:423
>>  secondary_start_kernel+0x1b8/0x1e0 arch/arm64/kernel/smp.c:279
>>  __secondary_switched+0xc0/0xc4 arch/arm64/kernel/head.S:401
>> irq event stamp: 171733
>> hardirqs last  enabled at (171732): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (171732): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (171733): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (171696): [<ffff8000803ce71c>] softirq_handle_end kernel/softirq.c:425 [inline]
>> softirqs last  enabled at (171696): [<ffff8000803ce71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
>> softirqs last disabled at (171703): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 6475 Comm: syz-executor Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff8000800179c0
>> x29: ffff800080017ae0 x28: ffff0001ffbf8fff x27: ffff0001fec50fe8
>> x26: ffff0001ffbf9000 x25: dfff800000000000 x24: ffff0001ffbf8000
>> x23: ffff0001fea8efc0 x22: 0000000000000100 x21: ffff0000c9033d00
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 0000000000000000
>> x17: ffff80010d10c000 x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb9a5 x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb9a6 x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c9033d00 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800080017bc0 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000100 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  rcu_guarded_free+0x4c/0x5c mm/kfence/core.c:587
>>  rcu_do_batch kernel/rcu/tree.c:2568 [inline]
>>  rcu_core+0x848/0x17a4 kernel/rcu/tree.c:2824
>>  rcu_core_si+0x10/0x1c kernel/rcu/tree.c:2841
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  __do_softirq+0x14/0x20 kernel/softirq.c:613
>>  ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
>>  call_on_irq_stack+0x24/0x30 arch/arm64/kernel/entry.S:891
>>  do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
>>  invoke_softirq kernel/softirq.c:460 [inline]
>>  __irq_exit_rcu+0x1b0/0x478 kernel/softirq.c:680
>>  irq_exit_rcu+0x14/0x84 kernel/softirq.c:696
>>  __el1_irq arch/arm64/kernel/entry-common.c:584 [inline]
>>  el1_interrupt+0x38/0x54 arch/arm64/kernel/entry-common.c:598
>>  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:603
>>  el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
>>  __daif_local_irq_restore arch/arm64/include/asm/irqflags.h:175 [inline] (P)
>>  arch_local_irq_restore arch/arm64/include/asm/irqflags.h:195 [inline] (P)
>>  __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline] (P)
>>  _raw_spin_unlock_irqrestore+0x44/0x98 kernel/locking/spinlock.c:194 (P)
>>  spin_unlock_irqrestore include/linux/spinlock.h:406 [inline]
>>  unlock_page_lruvec_irqrestore include/linux/memcontrol.h:1526 [inline]
>>  folio_batch_move_lru+0x2c4/0x378 mm/swap.c:174
>>  __folio_batch_add_and_move+0x3c4/0x630 mm/swap.c:196
>>  folio_add_lru+0xc4/0x154 mm/swap.c:505
>>  folio_add_lru_vma+0xc4/0x118 mm/swap.c:524
>>  do_anonymous_page mm/memory.c:5047 [inline]
>>  do_pte_missing mm/memory.c:4158 [inline]
>>  handle_pte_fault mm/memory.c:5997 [inline]
>>  __handle_mm_fault mm/memory.c:6140 [inline]
>>  handle_mm_fault+0x3e64/0x4cf0 mm/memory.c:6309
>>  do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
>>  do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
>>  do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
>>  el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
>>  el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
>>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>> irq event stamp: 19357
>> hardirqs last  enabled at (19356): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (19356): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (19357): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (17602): [<ffff8000803ce71c>] softirq_handle_end kernel/softirq.c:425 [inline]
>> softirqs last  enabled at (17602): [<ffff8000803ce71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
>> softirqs last disabled at (19255): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 6475 Comm: syz-executor Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff8000800178a0
>> x29: ffff8000800179c0 x28: ffff0001ffa0cfff x27: ffff0001fec50fe8
>> x26: ffff0001ffa0d000 x25: dfff800000000000 x24: ffff0001ffa0c000
>> x23: ffff0001fea8e060 x22: 0000000000000100 x21: ffff0000c9033d00
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 0000000000000000
>> x17: ffff80010d10c000 x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb9ab x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb9ac x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c9033d00 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800080017aa0 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000100 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  __kfence_free+0x104/0x198 mm/kfence/core.c:1187
>>  kfence_free include/linux/kfence.h:187 [inline]
>>  slab_free_hook mm/slub.c:2318 [inline]
>>  slab_free mm/slub.c:4642 [inline]
>>  kmem_cache_free+0x250/0x550 mm/slub.c:4744
>>  ptlock_free+0x54/0x6c mm/memory.c:7364
>>  pagetable_dtor include/linux/mm.h:3109 [inline]
>>  pagetable_dtor_free include/linux/mm.h:3116 [inline]
>>  __tlb_remove_table+0x30/0x274 include/asm-generic/tlb.h:215
>>  __tlb_remove_table_free mm/mmu_gather.c:227 [inline]
>>  tlb_remove_table_rcu+0x8c/0x19c mm/mmu_gather.c:290
>>  rcu_do_batch kernel/rcu/tree.c:2568 [inline]
>>  rcu_core+0x848/0x17a4 kernel/rcu/tree.c:2824
>>  rcu_core_si+0x10/0x1c kernel/rcu/tree.c:2841
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  __do_softirq+0x14/0x20 kernel/softirq.c:613
>>  ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
>>  call_on_irq_stack+0x24/0x30 arch/arm64/kernel/entry.S:891
>>  do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
>>  invoke_softirq kernel/softirq.c:460 [inline]
>>  __irq_exit_rcu+0x1b0/0x478 kernel/softirq.c:680
>>  irq_exit_rcu+0x14/0x84 kernel/softirq.c:696
>>  __el1_irq arch/arm64/kernel/entry-common.c:584 [inline]
>>  el1_interrupt+0x38/0x54 arch/arm64/kernel/entry-common.c:598
>>  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:603
>>  el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
>>  preempt_count arch/arm64/include/asm/preempt.h:13 [inline] (P)
>>  check_kcov_mode kernel/kcov.c:183 [inline] (P)
>>  __sanitizer_cov_trace_pc+0x14/0x84 kernel/kcov.c:217 (P)
>>  vsnprintf+0x814/0xd60 lib/vsprintf.c:2852
>>  seq_vprintf fs/seq_file.c:391 [inline]
>>  seq_printf+0x148/0x22c fs/seq_file.c:406
>>  s_show+0x194/0x294 kernel/kallsyms.c:743
>>  seq_read_iter+0x85c/0xc2c fs/seq_file.c:272
>>  seq_read+0x238/0x33c fs/seq_file.c:162
>>  pde_read fs/proc/inode.c:308 [inline]
>>  proc_reg_read+0x17c/0x2d4 fs/proc/inode.c:320
>>  vfs_read+0x22c/0x898 fs/read_write.c:568
>>  ksys_read+0x120/0x210 fs/read_write.c:713
>>  __do_sys_read fs/read_write.c:722 [inline]
>>  __se_sys_read fs/read_write.c:720 [inline]
>>  __arm64_sys_read+0x7c/0x90 fs/read_write.c:720
>>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>> irq event stamp: 177625
>> hardirqs last  enabled at (177624): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (177624): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (177625): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (177108): [<ffff8000803ce71c>] softirq_handle_end kernel/softirq.c:425 [inline]
>> softirqs last  enabled at (177108): [<ffff8000803ce71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
>> softirqs last disabled at (177563): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 6475 Comm: syz-executor Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range mm/memory.c:2936 [inline]
>> lr : apply_to_pmd_range mm/memory.c:2985 [inline]
>> lr : apply_to_pud_range mm/memory.c:3021 [inline]
>> lr : apply_to_p4d_range mm/memory.c:3057 [inline]
>> lr : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> sp : ffff8000800178a0
>> x29: ffff8000800179c0 x28: ffff0001ffa0efff x27: ffff0001fec50fe8
>> x26: ffff0001ffa0f000 x25: dfff800000000000 x24: ffff0001ffa0e000
>> x23: ffff0001fea8e070 x22: 0000000000000100 x21: ffff0000c9033d00
>> x20: 100000023ea8e403 x19: 0000000000000001 x18: 0000000000000000
>> x17: ffff80010d10c000 x16: ffff80008051bab8 x15: 0000000000000001
>> x14: 1ffff00012dfb9ab x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff700012dfb9ac x10: 0000000000ff0100 x9 : 0000000000000000
>> x8 : ffff0000c9033d00 x7 : ffff800080c2b0a4 x6 : 0000000000000000
>> x5 : 0000000000000001 x4 : ffff800080017aa0 x3 : ffff8000802595f4
>> x2 : 0000000000001000 x1 : 0000000000000100 x0 : 0000000000000000
>> Call trace:
>>  arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline] (P)
>>  apply_to_pte_range mm/memory.c:2936 [inline] (P)
>>  apply_to_pmd_range mm/memory.c:2985 [inline] (P)
>>  apply_to_pud_range mm/memory.c:3021 [inline] (P)
>>  apply_to_p4d_range mm/memory.c:3057 [inline] (P)
>>  __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093 (P)
>>  apply_to_page_range+0x4c/0x64 mm/memory.c:3112
>>  __change_memory_common+0xac/0x3f8 arch/arm64/mm/pageattr.c:64
>>  set_memory_valid+0x68/0x7c arch/arm64/mm/pageattr.c:-1
>>  kfence_protect_page arch/arm64/include/asm/kfence.h:17 [inline]
>>  kfence_protect mm/kfence/core.c:247 [inline]
>>  kfence_guarded_free+0x278/0x5a8 mm/kfence/core.c:565
>>  __kfence_free+0x104/0x198 mm/kfence/core.c:1187
>>  kfence_free include/linux/kfence.h:187 [inline]
>>  slab_free_hook mm/slub.c:2318 [inline]
>>  slab_free mm/slub.c:4642 [inline]
>>  kmem_cache_free+0x250/0x550 mm/slub.c:4744
>>  ptlock_free+0x54/0x6c mm/memory.c:7364
>>  pagetable_dtor include/linux/mm.h:3109 [inline]
>>  pagetable_dtor_free include/linux/mm.h:3116 [inline]
>>  __tlb_remove_table+0x30/0x274 include/asm-generic/tlb.h:215
>>  __tlb_remove_table_free mm/mmu_gather.c:227 [inline]
>>  tlb_remove_table_rcu+0x8c/0x19c mm/mmu_gather.c:290
>>  rcu_do_batch kernel/rcu/tree.c:2568 [inline]
>>  rcu_core+0x848/0x17a4 kernel/rcu/tree.c:2824
>>  rcu_core_si+0x10/0x1c kernel/rcu/tree.c:2841
>>  handle_softirqs+0x328/0xc88 kernel/softirq.c:579
>>  __do_softirq+0x14/0x20 kernel/softirq.c:613
>>  ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
>>  call_on_irq_stack+0x24/0x30 arch/arm64/kernel/entry.S:891
>>  do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
>>  invoke_softirq kernel/softirq.c:460 [inline]
>>  __irq_exit_rcu+0x1b0/0x478 kernel/softirq.c:680
>>  irq_exit_rcu+0x14/0x84 kernel/softirq.c:696
>>  __el1_irq arch/arm64/kernel/entry-common.c:584 [inline]
>>  el1_interrupt+0x38/0x54 arch/arm64/kernel/entry-common.c:598
>>  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:603
>>  el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
>>  preempt_count arch/arm64/include/asm/preempt.h:13 [inline] (P)
>>  check_kcov_mode kernel/kcov.c:183 [inline] (P)
>>  __sanitizer_cov_trace_pc+0x14/0x84 kernel/kcov.c:217 (P)
>>  vsnprintf+0x814/0xd60 lib/vsprintf.c:2852
>>  seq_vprintf fs/seq_file.c:391 [inline]
>>  seq_printf+0x148/0x22c fs/seq_file.c:406
>>  s_show+0x194/0x294 kernel/kallsyms.c:743
>>  seq_read_iter+0x85c/0xc2c fs/seq_file.c:272
>>  seq_read+0x238/0x33c fs/seq_file.c:162
>>  pde_read fs/proc/inode.c:308 [inline]
>>  proc_reg_read+0x17c/0x2d4 fs/proc/inode.c:320
>>  vfs_read+0x22c/0x898 fs/read_write.c:568
>>  ksys_read+0x120/0x210 fs/read_write.c:713
>>  __do_sys_read fs/read_write.c:722 [inline]
>>  __se_sys_read fs/read_write.c:720 [inline]
>>  __arm64_sys_read+0x7c/0x90 fs/read_write.c:720
>>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>> irq event stamp: 177641
>> hardirqs last  enabled at (177640): [<ffff80008add91e8>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>> hardirqs last  enabled at (177640): [<ffff80008add91e8>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
>> hardirqs last disabled at (177641): [<ffff80008adb3680>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
>> softirqs last  enabled at (177108): [<ffff8000803ce71c>] softirq_handle_end kernel/softirq.c:425 [inline]
>> softirqs last  enabled at (177108): [<ffff8000803ce71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
>> softirqs last disabled at (177563): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pte_range mm/memory.c:2936 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pmd_range mm/memory.c:2985 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_pud_range mm/memory.c:3021 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 apply_to_p4d_range mm/memory.c:3057 [inline]
>> WARNING: CPU: 1 PID: 6475 at ./arch/arm64/include/asm/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 6475 Comm: syz-executor Tainted: G        W           6.15.0-rc5-syzkaller-gac57c6b0f09c #0 PREEMPT 
>> Tainted: [W]=WARN
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> pc : apply_to_pte_range mm/memory.c:2936 [inline]
>> pc : apply_to_pmd_range mm/memory.c:2985 [inline]
>> pc : apply_to_pud_range mm/memory.c:3021 [inline]
>> pc : apply_to_p4d_range mm/memory.c:3057 [inline]
>> pc : __apply_to_page_range+0xdb4/0x13e4 mm/memory.c:3093
>> lr : arch_enter_lazy_mmu_mode arch/arm64/include/asm/pgtable.h:82 [inline]
>> lr : apply_to_pte_range
>>
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>>
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>>
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>>
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>>
>> If you want to undo deduplication, reply with:
>> #syz undup

