Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F8220F26
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414805; cv=none; b=ZV0H4NMVlGrJSh51v2FZ4QRsTxogUyf1eaRmjk/BPrJmpe0DuN5qpUBA6BLtkaDInKMyiaKwK9bISEeg4epMu8VmaVdwk/FX/99d60VN+qECkjOIWNYFs64OZjI+LeS2zHgowg8LUkxhBw35P5gmfMvHTJY8EwroPxQ1PryYKoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414805; c=relaxed/simple;
	bh=g5AWeMNF7b/Bv5VR/PvuAXrzBDfsKZcK8Je77u9EtJ4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Tl2ydKxGyV+DMjs6/oqq8Ti2DUI4wJU7I9/WPZ+05qn/X91pYbE34T4ghHsSpB3793XLYzxpAMJoDINbWl+mO3XcUBVMAfbdEiXW03dwjBXZg5iT2Ol4gUjgTHaPLIoNMskt4xzIiqg40mM7R++T1mVFmlxKZeVSldksms1mvZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc5137992so18046095ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750414803; x=1751019603;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAvkCI4OA2ppEariM0JWJWI0L0lHNQVVcU1KM5QVnzQ=;
        b=TXI47155BmHzGmeWv15QcrwpkM3HyyUygmA4E77dQq9AygpE0sfchGnPoYwDd/7MVW
         4XlAIOHA1nRqGivE2mvZBilWhs2cv9StFR0ELlN/+8/uJ7G0TBQkj+c0tL6GeJNmhEyx
         b4ppRr323xKmh2hs4el2tFgO6Tm1TA7GRdKmlgsOEuzzTqry4v58DzFY4FCrrxm13z7B
         3lqzsOLG3tKQG47U2BUGpUZUNGEPFTc5GPJmbtphmmIJp9sFr/RJBhqUUl9yVCTaoR7e
         IE+eQrtSwxPt5DYhoGEqdxUWd8TjHJtZQ6WwyVa92aI6qnIfGv1AwT8WLMSw+eFMWpr1
         1FJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVal89L2ewP6BsxUurKfZHIZdkD/ok0Wr8DLrJygC8jgqTQ72S08ESg1UiXuRwQKW1/7RgGV/NdGsevv+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcccxI2K9YcneWmRR8lcwdIz0KU8wIc+IZiospDUcMcDH8M/tv
	qUzLVBtj7V6msqsZ41ip17Z6LtPBpfX69/gGlmHnqMELI46hJQbqv3sRofmgaw2QXsfkLjZY53G
	qwZiTbwPUVLISOy1sBy6+/0J7Oq3C7+1MQhGTQbvyR0r6fE8Voov/5zM8+2g=
X-Google-Smtp-Source: AGHT+IF/EDEBzdacBRCuS8/mwWmo7YoWpTZHDcaKPHauaI9lNrV6t1MWfmIxaM2F3U7gwHcmvjfVz7KfoDAV8J6czi1K1UG4RI1q
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216e:b0:3dd:e7d7:3e1b with SMTP id
 e9e14a558f8ab-3de38cca784mr20093395ab.18.1750414802708; Fri, 20 Jun 2025
 03:20:02 -0700 (PDT)
Date: Fri, 20 Jun 2025 03:20:02 -0700
In-Reply-To: <20250620094529.1318-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685535d2.a00a0220.137b3.0045.GAE@google.com>
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
Read of size 8 at addr ffff888028ba3410 by task syz.3.92/7189

CPU: 1 UID: 0 PID: 7189 Comm: syz.3.92 Not tainted 6.16.0-rc2-next-20250619-syzkaller-03877-g2c923c845768-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 do_sync_mmap_readahead+0x4bf/0x830 mm/filemap.c:3282
 filemap_fault+0x62c/0x1200 mm/filemap.c:3444
 __do_fault+0x138/0x390 mm/memory.c:5187
 do_read_fault mm/memory.c:5608 [inline]
 do_fault mm/memory.c:5742 [inline]
 do_pte_missing mm/memory.c:4269 [inline]
 handle_pte_fault mm/memory.c:6087 [inline]
 __handle_mm_fault+0x37ed/0x5620 mm/memory.c:6230
 handle_mm_fault+0x40a/0x8e0 mm/memory.c:6399
 faultin_page mm/gup.c:1186 [inline]
 __get_user_pages+0x1b0c/0x3210 mm/gup.c:1491
 populate_vma_page_range+0x29f/0x3a0 mm/gup.c:1931
 __mm_populate+0x24c/0x380 mm/gup.c:2034
 mm_populate include/linux/mm.h:3372 [inline]
 vm_mmap_pgoff+0x3f0/0x4c0 mm/util.c:584
 ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdcf798e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fdcf87cc038 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 00007fdcf7bb5fa0 RCX: 00007fdcf798e929
RDX: 0000000001000006 RSI: 0000000000b36000 RDI: 0000200000000000
RBP: 00007fdcf7a10b39 R08: 0000000000000006 R09: 0000000000000000
R10: 0000000000028011 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fdcf7bb5fa0 R15: 00007fff64f68fd8
 </TASK>

Allocated by task 7189:
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

Freed by task 7194:
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
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1050
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

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

The buggy address belongs to the object at ffff888028ba33c0
 which belongs to the cache vm_area_struct of size 256
The buggy address is located 80 bytes inside of
 freed 256-byte region [ffff888028ba33c0, ffff888028ba34c0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x28ba3
memcg:ffff888079f4d581
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88814047eb40 dead000000000122 0000000000000000
raw: 0000000000000000 00000000000c000c 00000000f5000000 ffff888079f4d581
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 7181, tgid 7181 (syz.2.91), ts 155840311602, free_ts 155832927152
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
 split_vma mm/vma.c:579 [inline]
 vma_modify+0x23e/0x460 mm/vma.c:1606
 vma_modify_flags+0x1e8/0x230 mm/vma.c:1632
 mprotect_fixup+0x400/0x9b0 mm/mprotect.c:658
 do_mprotect_pkey+0x8cd/0xce0 mm/mprotect.c:832
 __do_sys_mprotect mm/mprotect.c:853 [inline]
 __se_sys_mprotect mm/mprotect.c:850 [inline]
 __x64_sys_mprotect+0x80/0x90 mm/mprotect.c:850
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 49 tgid 49 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
 rcu_do_batch kernel/rcu/tree.c:2582 [inline]
 rcu_core+0xca5/0x1710 kernel/rcu/tree.c:2838
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 do_softirq+0xec/0x180 kernel/softirq.c:480
 __local_bh_enable_ip+0x17d/0x1c0 kernel/softirq.c:407
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 rcu_read_unlock_bh include/linux/rcupdate.h:910 [inline]
 __dev_queue_xmit+0x1cd7/0x3a70 net/core/dev.c:4738
 dev_queue_xmit include/linux/netdevice.h:3355 [inline]
 batadv_send_skb_packet+0x44f/0x6d0 net/batman-adv/send.c:108
 batadv_iv_ogm_send_to_if net/batman-adv/bat_iv_ogm.c:392 [inline]
 batadv_iv_ogm_emit net/batman-adv/bat_iv_ogm.c:420 [inline]
 batadv_iv_send_outstanding_bat_ogm_packet+0x62f/0x7e0 net/batman-adv/bat_iv_ogm.c:1708
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888028ba3300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888028ba3380: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
>ffff888028ba3400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff888028ba3480: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888028ba3500: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         2c923c84 Add linux-next specific files for 20250619
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=146c5370580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58afc4b78b52b7e3
dashboard link: https://syzkaller.appspot.com/bug?extid=8e4be574cb8c40140a2a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1493f5d4580000

