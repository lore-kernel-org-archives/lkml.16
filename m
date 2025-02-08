Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB320DF4
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739026230; cv=none; b=UJ77fNdpyERaMauzlW234+Tjqh4JEAhj6M25xL6LtZqdiJ10ni7poxUql6btQxilc6W/VA8sMYl+WoDeLxXGq6liy37JJ/36KSvE82LMWRKk9R4Io9dPMBp3FeA/UpouNPE0QoEGqETO6rNdXXlc8Ou0bzUvGyP0Lf25yG5lolE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739026230; c=relaxed/simple;
	bh=2gcPBuI/5LqzyhnwVXaqZSFMaPFzcPfMcexrVgwII+k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HMR1VjZxAUBtf+gLCugIlpMOWkBTY5zQWelAqsjVp/JjuCOW8CcheGQGZBVixoIGCVxBCg0CuW23np627O73DY/tDH8MVi1qla+69cD1XffJ2UKfowsTKbIpyvW8vqz5LPxaYspM9B2I+X0xt6Yjz2VbkLOMGhr2MFN+AzU9yBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d13d1f8420so13619215ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 06:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739026228; x=1739631028;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tkPip4nGovSQskv+a+u4eGJmkP8lu/F5vsQMTP0ODgg=;
        b=MswBfPNgVDuazqSGWNAMJsTeKpiDXGF7yT/glMK4qPwjgPvmlNg3pn3l/UmtoUmdpd
         jx0JzloR6UoeAdYaBDfPbiUQk7wn5j2OAdauab/hp8PcQb4bDhH6tz1vejgarvR8GB1R
         Kj0+pWeaOUByujBYsORlaIpCT/zJqCxNPp4OhqpCCeFKQfOeqs4SOFAB/9VrdQ8/iHaH
         mgktCAiphoqIt8um4CjrzKNhoR+whwSKX3475yDM3BObAJWsdpz8Ea1avXVC3RsZRGwg
         r5c5Q0j1JKQQvKZKprnCbm3g1r3ROJzy1L+Fa1FH8oEKTiVlSzIurdtzG4PYDbO28npV
         DHRA==
X-Forwarded-Encrypted: i=1; AJvYcCWVA5AA0rz784N504sr3PFpyDc9FSAHk6P4YcADAm5RiCsQshOsxFxzU95ut/+bwy/tUYRympVybaNibg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwREW0sWUQCZdCc7vTWXjhN9KyYpcmQHe0/Md0sDsmyLegI49J
	8YG45zI8xe/sPtBsWoEBycFZbyO2IBPnBhBwTylXa/V0Popvhsf9eEyHGSxvppsTDBzeIdvLNb+
	5ODQaZfKHTfYS5+d7G8pQQdKTPvpsN4u5MxgrPVE0giJaskBbpAx8qUg=
X-Google-Smtp-Source: AGHT+IExduGGfPGLXkKYLQ2cabEPITn8aZWxhd7ChbZ3By2ymyfd1erLTGBy2FESFomHu+98YJgWNK1hydtsZ8bY1cebeGBEOaJG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160d:b0:3cf:c9b9:3eb with SMTP id
 e9e14a558f8ab-3d13da21ff0mr49169235ab.0.1739026227817; Sat, 08 Feb 2025
 06:50:27 -0800 (PST)
Date: Sat, 08 Feb 2025 06:50:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a76f33.050a0220.3d72c.0028.GAE@google.com>
Subject: [syzbot] [mm?] KASAN: slab-use-after-free Write in folio_get_anon_vma
From: syzbot <syzbot+1b49c591bd17d5732417@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0de63bb7d919 Merge tag 'pull-fix' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=128b4f64580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c48f582603dcb16c
dashboard link: https://syzkaller.appspot.com/bug?extid=1b49c591bd17d5732417
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-0de63bb7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4dd046669a28/vmlinux-0de63bb7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4d33e4954ef0/bzImage-0de63bb7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1b49c591bd17d5732417@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-use-after-free in atomic_inc_not_zero include/linux/atomic/atomic-instrumented.h:1536 [inline]
BUG: KASAN: slab-use-after-free in folio_get_anon_vma+0x1e2/0x760 mm/rmap.c:512
Write of size 4 at addr ffff88802294aa30 by task kcompactd0/44

CPU: 2 UID: 0 PID: 44 Comm: kcompactd0 Not tainted 6.14.0-rc1-syzkaller-00020-g0de63bb7d919 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0xef/0x1a0 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_inc_not_zero include/linux/atomic/atomic-instrumented.h:1536 [inline]
 folio_get_anon_vma+0x1e2/0x760 mm/rmap.c:512
 migrate_folio_unmap mm/migrate.c:1280 [inline]
 migrate_pages_batch+0xd68/0x3150 mm/migrate.c:1866
 migrate_pages_sync+0x109/0x8f0 mm/migrate.c:1989
 migrate_pages+0x1acf/0x2290 mm/migrate.c:2098
 compact_zone+0x1f66/0x4220 mm/compaction.c:2663
 compact_node+0x1a2/0x2d0 mm/compaction.c:2932
 kcompactd+0x707/0xd40 mm/compaction.c:3226
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 5954:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x89/0x90 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4115 [inline]
 slab_alloc_node mm/slub.c:4164 [inline]
 kmem_cache_alloc_noprof+0x1c8/0x3b0 mm/slub.c:4171
 anon_vma_alloc mm/rmap.c:94 [inline]
 anon_vma_fork+0xe6/0x620 mm/rmap.c:360
 dup_mmap kernel/fork.c:711 [inline]
 dup_mm kernel/fork.c:1700 [inline]
 copy_mm+0x1b7b/0x2730 kernel/fork.c:1752
 copy_process+0x3e6d/0x6f20 kernel/fork.c:2403
 kernel_clone+0xfd/0x960 kernel/fork.c:2815
 __do_compat_sys_ia32_clone+0xb7/0x100 arch/x86/kernel/sys_ia32.c:254
 do_syscall_32_irqs_on arch/x86/entry/common.c:165 [inline]
 __do_fast_syscall_32+0x73/0x120 arch/x86/entry/common.c:386
 do_fast_syscall_32+0x32/0x80 arch/x86/entry/common.c:411
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

Freed by task 29:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free_after_rcu_debug+0x115/0x340 mm/slub.c:4659
 rcu_do_batch kernel/rcu/tree.c:2546 [inline]
 rcu_core+0x79d/0x14d0 kernel/rcu/tree.c:2802
 handle_softirqs+0x213/0x8f0 kernel/softirq.c:561
 run_ksoftirqd kernel/softirq.c:950 [inline]
 run_ksoftirqd+0x3a/0x60 kernel/softirq.c:942
 smpboot_thread_fn+0x661/0xa30 kernel/smpboot.c:164
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Last potentially related work creation:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xb8/0xd0 mm/kasan/generic.c:548
 slab_free_hook mm/slub.c:2314 [inline]
 slab_free mm/slub.c:4609 [inline]
 kmem_cache_free+0x166/0x4d0 mm/slub.c:4711
 anon_vma_free mm/rmap.c:137 [inline]
 __put_anon_vma+0x114/0x3a0 mm/rmap.c:2568
 put_anon_vma include/linux/rmap.h:116 [inline]
 unlink_anon_vmas+0x58a/0x820 mm/rmap.c:444
 free_pgtables+0x12c/0x950 mm/memory.c:387
 exit_mmap+0x406/0xba0 mm/mmap.c:1295
 __mmput+0x12a/0x410 kernel/fork.c:1356
 mmput+0x62/0x70 kernel/fork.c:1378
 exit_mm kernel/exit.c:570 [inline]
 do_exit+0x9ba/0x2d70 kernel/exit.c:925
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
 __do_sys_exit_group kernel/exit.c:1098 [inline]
 __se_sys_exit_group kernel/exit.c:1096 [inline]
 __ia32_sys_exit_group+0x3e/0x50 kernel/exit.c:1096
 ia32_sys_call+0x1b1c/0x1c20 arch/x86/include/generated/asm/syscalls_32.h:253
 do_syscall_32_irqs_on arch/x86/entry/common.c:165 [inline]
 __do_fast_syscall_32+0x73/0x120 arch/x86/entry/common.c:386
 do_fast_syscall_32+0x32/0x80 arch/x86/entry/common.c:411
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

The buggy address belongs to the object at ffff88802294a990
 which belongs to the cache anon_vma of size 208
The buggy address is located 160 bytes inside of
 freed 208-byte region [ffff88802294a990, ffff88802294aa60)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2294a
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff888023092001
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b051cc0 ffffea000126e600 dead000000000002
raw: 0000000000000000 00000000801e001e 00000000f5000000 ffff888023092001
head: 00fff00000000040 ffff88801b051cc0 ffffea000126e600 dead000000000002
head: 0000000000000000 00000000801e001e 00000000f5000000 ffff888023092001
head: 00fff00000000001 ffffea00008a5281 ffffffffffffffff 0000000000000000
head: 0000000000000002 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 16720319341, free_ts 16101426947
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x221/0x2470 mm/page_alloc.c:4739
 alloc_pages_mpol+0x1fc/0x540 mm/mempolicy.c:2270
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2587 [inline]
 new_slab+0x23d/0x330 mm/slub.c:2640
 ___slab_alloc+0xbfa/0x1600 mm/slub.c:3826
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3916
 __slab_alloc_node mm/slub.c:3991 [inline]
 slab_alloc_node mm/slub.c:4152 [inline]
 kmem_cache_alloc_noprof+0xeb/0x3b0 mm/slub.c:4171
 anon_vma_alloc mm/rmap.c:94 [inline]
 __anon_vma_prepare+0x344/0x5e0 mm/rmap.c:202
 __vmf_anon_prepare+0x11c/0x240 mm/memory.c:3389
 vmf_anon_prepare mm/internal.h:372 [inline]
 do_anonymous_page mm/memory.c:4875 [inline]
 do_pte_missing+0x1032/0x3e10 mm/memory.c:4045
 handle_pte_fault mm/memory.c:5889 [inline]
 __handle_mm_fault+0x1166/0x2c60 mm/memory.c:6032
 handle_mm_fault+0x3fa/0xaa0 mm/memory.c:6201
 faultin_page mm/gup.c:1196 [inline]
 __get_user_pages+0x773/0x36f0 mm/gup.c:1491
 __get_user_pages_locked mm/gup.c:1757 [inline]
 get_user_pages_remote+0x25e/0xb30 mm/gup.c:2661
 get_arg_page+0xf3/0x310 fs/exec.c:217
page last free pid 63 tgid 63 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_frozen_pages+0x6db/0xfb0 mm/page_alloc.c:2660
 vfree+0x174/0x950 mm/vmalloc.c:3383
 delayed_vfree_work+0x56/0x70 mm/vmalloc.c:3303
 process_one_work+0x958/0x1b30 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Memory state around the buggy address:
 ffff88802294a900: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
 ffff88802294a980: fc fc fa fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802294aa00: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                                     ^
 ffff88802294aa80: fc fc fc fc fa fb fb fb fb fb fb fb fb fb fb fb
 ffff88802294ab00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
