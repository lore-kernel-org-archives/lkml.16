Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70A290F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 19:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748804492; cv=none; b=JSDTr5Ea5ZjCjYbYq/xg99u2Oy1neIqTjc/ooHBXQwosP6wRAKNKRBWtjX3Hm+m7LW/tH8VidsYUwUgt4x7fFSlhG4sdrTZbY0r0TyQPMXoTkXI/jMMQSQsO3SKwcd2DzLUH1PveOlwzWUFhw81VSErPuuOkzSMtDSZ5lvhJZbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748804492; c=relaxed/simple;
	bh=vbZzConT2FgDBqpII3pt/b5GiX997RgJ5NepqEI28C8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=E0HXW3oqXH3cGKGXSBwhtIwhMPzT0YDoMX4p5xcNt++jS9Me8Zr7cxfftjiMOnuFMPRgYm+fPN6+4Kpzent/E1Jb4EtoMKwwK9WNKO8hAbb8rhBn0aqPAFWSyCATeABthECI1vmJ0VxpfPU5R96nMgD8n6LODdbIyiazaqcddVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddaf7e38b8so1326745ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 12:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748804489; x=1749409289;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8LQSFVsmhUETHXvdnRnBEUiIlK+JLOkbpQZFOmVT6s=;
        b=t/1Q+z2qS7Du4QGXFlkIr9eKsd/SVgPk3jiN9BPSxDJW2xNLioohK5HU5EMRFA7owL
         4wHfcy/M9piIxkZQ5fIxzxz9Kx1OFWIrDN+AroXX6q/Lrbn6wpSmMIQQwUx2pWJ01i1Y
         AgjdKQgW9LeddMPsbRUzZppYwKhXacqUb9i0L0SLowwOY/V80btvEKJvzxDIiCMe0deU
         lHVZRgMHVJRC6dIV0N0fZDUcczkunyaPk6ntixwg9YkL7KtByNuJ+dIW5YevhM4+dl4P
         SsuPvaQY8io7E+khlusDgRBuIkedmA6ZxTCVGCDbPJ1C63XPTM+30b7xZYlEzL4aFyDa
         DnVg==
X-Forwarded-Encrypted: i=1; AJvYcCV7ZqRpDszp7+Yg4rSL9PLOuUJ7qbG/zHvYdGWXFpdYhLOWZrxZGVaLLoyACYDOLLfjWUvWNzTn199FDM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiv1CY08YQf6yU51ZOAXl6RXiKrDVjJXQy1bPzinaamPG14vll
	NqyFCF8vdZYxry5wfPONK1OWerfL7RkxdpaTqCia5m05N+1wWf23x/O9yyMQg7erzMa+4whRZ39
	4sF43WIO8gMyzcHsinox2DYlYHMe0z6CGaA8kAOtW1RQQGemQa7pYN0OYbZw=
X-Google-Smtp-Source: AGHT+IE1wDDINUgOl74CH5XRej5qd/D2PGk4Bskh6kWDzGJEjcSo38atyk81xfV9vL/ofMGpXSrtZ9zEYYkUJWcK1/wkPiOftE/t
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5e8a:b0:3dd:a55b:39dd with SMTP id
 e9e14a558f8ab-3dda55b431dmr30453785ab.19.1748804489292; Sun, 01 Jun 2025
 12:01:29 -0700 (PDT)
Date: Sun, 01 Jun 2025 12:01:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683ca389.a00a0220.d8eae.0035.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-out-of-bounds Read in __futex_pivot_hash
From: syzbot <syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com>
To: andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    feacb1774bd5 Merge tag 'sched_ext-for-6.16' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=172ec482580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2e9181801c1d2a6
dashboard link: https://syzkaller.appspot.com/bug?extid=0a5079ee014f4b907817
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14cc0970580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1436fbf4580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-feacb177.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d08852142ce8/vmlinux-feacb177.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7e6cf2dd1995/bzImage-feacb177.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
BUG: KASAN: slab-out-of-bounds in _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
Read of size 1 at addr ffff8880254867e0 by task syz-executor404/6471

CPU: 0 UID: 0 PID: 6471 Comm: syz-executor404 Not tainted 6.15.0-syzkaller-03589-gfeacb1774bd5 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xcd/0x680 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 __kasan_check_byte+0x36/0x50 mm/kasan/common.c:557
 kasan_check_byte include/linux/kasan.h:399 [inline]
 lock_acquire kernel/locking/lockdep.c:5845 [inline]
 lock_acquire+0xfc/0x350 kernel/locking/lockdep.c:5828
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:351 [inline]
 futex_rehash_private kernel/futex/core.c:213 [inline]
 __futex_pivot_hash+0x1dd/0x540 kernel/futex/core.c:251
 futex_hash_allocate+0xad1/0xf00 kernel/futex/core.c:1662
 futex_hash_prctl+0x1f4/0x650 kernel/futex/core.c:1757
 __do_sys_prctl+0x171f/0x24c0 kernel/sys.c:2825
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1955b6f2a9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1955b28238 EFLAGS: 00000246 ORIG_RAX: 000000000000009d
RAX: ffffffffffffffda RBX: 00007f1955bf9308 RCX: 00007f1955b6f2a9
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 000000000000004e
RBP: 00007f1955bf9300 R08: 0000000000000000 R09: 00007f1955b286c0
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f1955bf930c
R13: 0000000000000000 R14: 00007ffeebf41a80 R15: 00007ffeebf41b68
 </TASK>

Allocated by task 6472:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kvmalloc_node_noprof+0x279/0x620 mm/slub.c:5012
 futex_hash_allocate+0x49d/0xf00 kernel/futex/core.c:1601
 futex_hash_prctl+0x1f4/0x650 kernel/futex/core.c:1757
 __do_sys_prctl+0x171f/0x24c0 kernel/sys.c:2825
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888025486780
 which belongs to the cache kmalloc-cg-64 of size 64
The buggy address is located 32 bytes to the right of
 allocated 64-byte region [ffff888025486780, ffff8880254867c0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x25486
ksm flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801b449a40 ffffea000074d500 dead000000000003
raw: 0000000000000000 0000000080200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 223, tgid 223 (kworker/u32:5), ts 8925570999, free_ts 8794215069
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1714
 prep_new_page mm/page_alloc.c:1722 [inline]
 get_page_from_freelist+0x135c/0x3950 mm/page_alloc.c:3684
 __alloc_frozen_pages_noprof+0x261/0x23f0 mm/page_alloc.c:4974
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab mm/slub.c:2618 [inline]
 new_slab+0x23b/0x330 mm/slub.c:2672
 ___slab_alloc+0xd9c/0x1940 mm/slub.c:3858
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3948
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_noprof+0x2f2/0x510 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 lsm_blob_alloc+0x68/0x90 security/security.c:684
 lsm_cred_alloc security/security.c:701 [inline]
 security_prepare_creds+0x30/0x270 security/security.c:3241
 prepare_creds+0x56f/0x7d0 kernel/cred.c:242
 copy_creds+0xa7/0xa50 kernel/cred.c:312
 copy_process+0x10ff/0x9170 kernel/fork.c:2293
 kernel_clone+0xfc/0x960 kernel/fork.c:2859
 user_mode_thread+0xc7/0x110 kernel/fork.c:2937
 call_usermodehelper_exec_work kernel/umh.c:171 [inline]
 call_usermodehelper_exec_work+0xcb/0x170 kernel/umh.c:157
page last free pid 54 tgid 54 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1258 [inline]
 __free_frozen_pages+0x7f8/0x1180 mm/page_alloc.c:2721
 vfree+0x176/0xa40 mm/vmalloc.c:3384
 delayed_vfree_work+0x56/0x70 mm/vmalloc.c:3304
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888025486680: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888025486700: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff888025486780: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
                                                       ^
 ffff888025486800: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888025486880: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
