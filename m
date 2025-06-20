Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A371C245C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750390506; cv=none; b=oxK8HzC/eDViheWbCnRJq1Xv9tjAssI3DIA8rskuXMFC3H/SqtN5xluz9cq+/P3RPjwQm2DyNUtbkIb7JCMOXBOwV3XAjevZ5cD/8swjEOIgWjZaqIsvFJEBVdlpG6NfszITdCpg4za9T18ovBKxx2Wy8yZNy8QOPLakZAfoRQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750390506; c=relaxed/simple;
	bh=3iJqkdi3V1LqP7uDIzPjFSLx1UYY/U4fh805aVB8my0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eQZ9ORHlCxq2YeZ2t79WsE5JvQnp9rQUeCVA7zyMiTEi7rQob7E5clq17O5UQaebjjbeV5ioqaD9GELLCIwgLn7LQXRDjVLyFR6P4WiLnPLgUb0tBBUETfJVWnwXoV67l81svO1Nl6RWuqAXnIJsRGpzTjOgpLnrWrplAjsqr6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd03db24dso13259895ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750390504; x=1750995304;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQpeA/rVYxUoZ/THT69eyteH8L13PIvg+xSZMlZZVpc=;
        b=n2Znd9sS5SP/HelWydVDTYP4IXVH0IE5FAabSCaOitVAxNFvYORD/oTW6Es1A+lSRL
         JW7B/8OqgZASf1ZCn0y5pWqWADKfi2kxKsG+4U8J6Es+ub7DomoVaXUYJCmarYfEIoAM
         fI3qpajLDRt8lFFSbH2MaOiDeMfxTVg0wXSiOI6vGr0rtM8IT2u4ysYGBmmIL4MTcveb
         Zpx1y7SMnlxWPdcsetu4uAK3aNFKcHb/AGpNk71lsDGM06l9cBucug7CmRxT4ZOBp4Wu
         BTR1VHTqI+0ubPVwU01zxVUvUAnOlhvUoku+z25XUmsn+n9LmULbxFy+6WuS9OgjopIU
         joMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMuNHaClmclkTgodkdazBOBdKvB1x/AZKxiKNzcoW+QvJWcnaRJAoyiAPXyAP9yeR4voKgf2js4CLL0xQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZQDu2/Z75IoC4hpgJn5ui718KlnePqJwCGh97qJ85RvpYqQfR
	5lFMSeJDm2sX6Y1oFNJGf3iHTZLL5cxkJ8My3MtVDI26ol3E81qdFFvmNr82wuRgkC5+xo+5mip
	QfK7sjLT69O8sWF7S63Q8uevdQd0ZJ1ON/XU8RkxM0St7Io4sjdhSnQUixCI=
X-Google-Smtp-Source: AGHT+IEwx6XwHqi7m4sO3q0MYcgTx8h6Lt0bH/kjfYqkBSfEbG7yBCNMZi9XLGZnrtkaU4b0ONQugXVMj4z4SQvxDgu5Hc3nG88S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c267:0:b0:3de:25cb:42c2 with SMTP id
 e9e14a558f8ab-3de38cc4f87mr14530765ab.18.1750390503815; Thu, 19 Jun 2025
 20:35:03 -0700 (PDT)
Date: Thu, 19 Jun 2025 20:35:03 -0700
In-Reply-To: <20250620030111.1259-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6854d6e7.a00a0220.137b3.0029.GAE@google.com>
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in do_sync_mmap_readahead
From: syzbot <syzbot+8e4be574cb8c40140a2a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in do_sync_mmap_readahead

==================================================================
BUG: KASAN: slab-use-after-free in do_sync_mmap_readahead+0x4bf/0x830 mm/filemap.c:3282
Read of size 8 at addr ffff88805ddc6a50 by task syz.1.161/7593

CPU: 1 UID: 0 PID: 7593 Comm: syz.1.161 Not tainted 6.16.0-rc2-next-20250619-syzkaller-03877-g2c923c845768-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 do_sync_mmap_readahead+0x4bf/0x830 mm/filemap.c:3282
 filemap_fault+0x62c/0x1200 mm/filemap.c:3444
 __do_fault+0x135/0x390 mm/memory.c:5187
 do_read_fault mm/memory.c:5608 [inline]
 do_fault mm/memory.c:5742 [inline]
 do_pte_missing mm/memory.c:4269 [inline]
 handle_pte_fault mm/memory.c:6087 [inline]
 __handle_mm_fault+0x37ed/0x5620 mm/memory.c:6230
 handle_mm_fault+0x40a/0x8e0 mm/memory.c:6399
 faultin_page mm/gup.c:1186 [inline]
 __get_user_pages+0x1aef/0x30b0 mm/gup.c:1488
 populate_vma_page_range+0x29f/0x3a0 mm/gup.c:1922
 __mm_populate+0x24c/0x380 mm/gup.c:2025
 mm_populate include/linux/mm.h:3372 [inline]
 vm_mmap_pgoff+0x3f0/0x4c0 mm/util.c:584
 ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc98df8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc98edd4038 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 00007fc98e1b5fa0 RCX: 00007fc98df8e929
RDX: 0000000001000006 RSI: 0000000000b36000 RDI: 0000200000000000
RBP: 00007fc98e010b39 R08: 0000000000000006 R09: 0000000000000000
R10: 0000000000028011 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fc98e1b5fa0 R15: 00007fffd4637e18
 </TASK>

Allocated by task 7593:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4179 [inline]
 slab_alloc_node mm/slub.c:4228 [inline]
 kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4235
 vm_area_alloc+0x24/0x140 mm/vma_init.c:31
 __mmap_new_vma mm/vma.c:2469 [inline]
 __mmap_region mm/vma.c:2679 [inline]
 mmap_region+0xe0d/0x2080 mm/vma.c:2749
 do_mmap+0xc45/0x10d0 mm/mmap.c:561
 vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
 ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 15:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2416 [inline]
 slab_free_after_rcu_debug+0x129/0x2a0 mm/slub.c:4729
 rcu_do_batch kernel/rcu/tree.c:2582 [inline]
 rcu_core+0xca5/0x1710 kernel/rcu/tree.c:2838
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 run_ksoftirqd+0x9b/0x100 kernel/softirq.c:968
 smpboot_thread_fn+0x53f/0xa60 kernel/smpboot.c:160
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:548
 slab_free_hook mm/slub.c:2377 [inline]
 slab_free mm/slub.c:4679 [inline]
 kmem_cache_free+0x2f6/0x400 mm/slub.c:4781
 remove_vma mm/vma.c:449 [inline]
 vms_complete_munmap_vmas+0x6a6/0xab0 mm/vma.c:1275
 __mmap_complete mm/vma.c:2535 [inline]
 __mmap_region mm/vma.c:2687 [inline]
 mmap_region+0x1221/0x2080 mm/vma.c:2749
 do_mmap+0xc45/0x10d0 mm/mmap.c:561
 vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88805ddc6a00
 which belongs to the cache vm_area_struct of size 256
The buggy address is located 80 bytes inside of
 freed 256-byte region [ffff88805ddc6a00, ffff88805ddc6b00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x5ddc6
memcg:ffff88802850ff01
anon flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801bad4b40 ffffea00009f9e40 0000000000000005
raw: 0000000000000000 00000000000c000c 00000000f5000000 ffff88802850ff01
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 7260, tgid 7260 (cmp), ts 149257300647, free_ts 149219699845
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4959
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2486 [inline]
 allocate_slab+0x8a/0x370 mm/slub.c:2654
 new_slab mm/slub.c:2708 [inline]
 ___slab_alloc+0xbeb/0x1410 mm/slub.c:3890
 __slab_alloc mm/slub.c:3980 [inline]
 __slab_alloc_node mm/slub.c:4055 [inline]
 slab_alloc_node mm/slub.c:4216 [inline]
 kmem_cache_alloc_noprof+0x283/0x3c0 mm/slub.c:4235
 vm_area_dup+0x2b/0x680 mm/vma_init.c:122
 __split_vma+0x1a9/0xa00 mm/vma.c:496
 vms_gather_munmap_vmas+0x2de/0x12b0 mm/vma.c:1342
 __mmap_prepare mm/vma.c:2368 [inline]
 __mmap_region mm/vma.c:2658 [inline]
 mmap_region+0x71a/0x2080 mm/vma.c:2749
 do_mmap+0xc45/0x10d0 mm/mmap.c:561
 vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
 ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 3479 tgid 3479 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
 pagetable_free include/linux/mm.h:2903 [inline]
 pagetable_dtor_free include/linux/mm.h:3001 [inline]
 __tlb_remove_table+0x2d2/0x3b0 include/asm-generic/tlb.h:220
 __tlb_remove_table_free mm/mmu_gather.c:227 [inline]
 tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:290
 rcu_do_batch kernel/rcu/tree.c:2582 [inline]
 rcu_core+0xca5/0x1710 kernel/rcu/tree.c:2838
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1050
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

Memory state around the buggy address:
 ffff88805ddc6900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88805ddc6980: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff88805ddc6a00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff88805ddc6a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88805ddc6b00: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
==================================================================


Tested on:

commit:         2c923c84 Add linux-next specific files for 20250619
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10f2f5d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58afc4b78b52b7e3
dashboard link: https://syzkaller.appspot.com/bug?extid=8e4be574cb8c40140a2a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17c2f5d4580000

