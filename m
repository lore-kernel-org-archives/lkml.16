Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CE11DED53
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 12:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748088450; cv=none; b=rw6OPznyWEAGRK8Sk5BhZ6JFClUMlcmadqmIPwFZctG3Mohsv3VjZM/HFwBq1yjnVMr0ymy+WznrUmGyXb8CxYO8iT8Oz9kwdKq/6Ey+JEJQ56KQw8n+AnOL/tXqRwMC0nt9e/DpLLxsGLSnAjcBIC+vHLt7d/m0gFmLdyQkiCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748088450; c=relaxed/simple;
	bh=byzrulIhUmfZCOdY/3339FyKuNp+82ELMS2R7T9dWlE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TkUh6ZxKqcGxV87aIv790wz/18zhX/NFhSpN6VuheR/hf7sNBXpyY1uGQGpztmTY1yi8/A5E1N8z4z38ImZB4AWjuHGJUkTknTTbtkcvvw1bxqPWpqZK42ObrK0OKeuX+Zai1zJMx1HrZB0GPZJSgbzzrMhf1zLIv6cay/VLeC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85e318dc464so126177839f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 05:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748088447; x=1748693247;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBM1ZVukleA4QrmjCl+ICO+Gyvb3F9idQAQk4NMTrH0=;
        b=H1ij9lLiVjCLqoOGateotEpTSbsGEaGqS6O2RCSEiLtWnqr8KEUXUeeZ3lSAdo9ZWf
         UwGgfhSL0+LCEnTVkRQHqZnuBBFmpgI2leYHdQBBgIXEdu/HdDds8BCkjOIaRS/GaKkF
         FZKI97oeUJ2eQ6dOqXj5YnMytHn0hBmXERGmxghq7CP/WFD33M05Jdv5GDBd9YcWAtuF
         VNOJAilPN5+tb8BEo2ATSG313wU40c9GwHXH9lfKGPxFUeGb4JVpinSBjvP8BbrMXyo3
         S2IovqRzCcf+H+OqaBGb44xh8b5xRpUKWE1cYttH8S9IzXLII8NOXq0TDVlc6ZnfHRS3
         K/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuJRB1qkoAgd706hPE4ZINQKt27YI6huZ8WvwHRzQr2Y9lHI5ygZ5E20rDm5st1g9I8/iUDtTmf227w9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUKy49cdbhtQqWGT7uFNM50AQiGzi9/6t7xVSTkLAfSRkNqGp
	aN0iQ5aFRTexMHuMH6lr0CKSoxC2fHT35mUiNY/KYZ7jh+xGaIMMazidJ6OuKY+lNd7vIKxN7Ht
	bCVww0FOmnjc3Nu2EHRGvQTWtPXrl0RlWHAEDWG86NCfX7EzZV4AOGNBnUKI=
X-Google-Smtp-Source: AGHT+IFQlYUUA8D3VWOmAEXI8CCg7zvZtnZ0d4kumRPyDsyNYD57acW/f+pOhZQiN+8Pi8XFiOXCJFaeG5+Vn4oAHv22xR/FQp5h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4894:b0:86a:93b:ce96 with SMTP id
 ca18e2360f4ac-86cbb818198mr257434639f.1.1748088447603; Sat, 24 May 2025
 05:07:27 -0700 (PDT)
Date: Sat, 24 May 2025 05:07:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6831b67f.a70a0220.253bc2.006f.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-use-after-free Write in binder_remove_device
From: syzbot <syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com>
To: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, joelagnelf@nvidia.com, 
	linux-kernel@vger.kernel.org, maco@android.com, surenb@google.com, 
	syzkaller-bugs@googlegroups.com, tkjos@android.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    176e917e010c Add linux-next specific files for 20250523
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1399a170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=4af454407ec393de51d6
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108b55f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1145e5f4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5f7692c642fa/disk-176e917e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/057a442d42d0/vmlinux-176e917e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8f8ebdb4dd96/bzImage-176e917e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in __hlist_del include/linux/list.h:982 [inline]
BUG: KASAN: slab-use-after-free in hlist_del_init include/linux/list.h:1008 [inline]
BUG: KASAN: slab-use-after-free in binder_remove_device+0xa1/0xe0 drivers/android/binder.c:7006
Write of size 8 at addr ffff888029560408 by task syz-executor158/5863

CPU: 0 UID: 0 PID: 5863 Comm: syz-executor158 Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 __hlist_del include/linux/list.h:982 [inline]
 hlist_del_init include/linux/list.h:1008 [inline]
 binder_remove_device+0xa1/0xe0 drivers/android/binder.c:7006
 binderfs_evict_inode+0x16b/0x240 drivers/android/binderfs.c:277
 evict+0x501/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 shrink_kill+0xa9/0x2c0 fs/dcache.c:1114
 shrink_dentry_list+0x2e0/0x5e0 fs/dcache.c:1141
 shrink_dcache_parent+0xa1/0x2c0 fs/dcache.c:-1
 do_one_tree+0x23/0xe0 fs/dcache.c:1604
 shrink_dcache_for_umount+0xa0/0x170 fs/dcache.c:1621
 generic_shutdown_super+0x67/0x2c0 fs/super.c:621
 kill_anon_super fs/super.c:1280 [inline]
 kill_litter_super+0x76/0xb0 fs/super.c:1290
 binderfs_kill_super+0x44/0x90 drivers/android/binderfs.c:792
 deactivate_locked_super+0xb9/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 ptrace_notify+0x281/0x2c0 kernel/signal.c:2520
 ptrace_report_syscall include/linux/ptrace.h:415 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
 syscall_exit_work+0xc6/0x1d0 kernel/entry/common.c:173
 syscall_exit_to_user_mode_work include/linux/entry-common.h:412 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2ad/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9ccf02a0c0
Code: ff f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 80 3d c1 9f 07 00 00 74 17 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 48 c3 0f 1f 80 00 00 00 00 48 83 ec 18 89 7c
RSP: 002b:00007ffdf1ea3858 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000005 RCX: 00007f9ccf02a0c0
RDX: 00007f9ccf02af99 RSI: 0000000000000002 RDI: 0000000000000004
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007f9ccf074036
R13: 00007ffdf1ea3890 R14: 00007ffdf1ea38d0 R15: 0000000000000000
 </TASK>

Allocated by task 5853:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4358
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 binderfs_binder_device_create+0x1eb/0xc40 drivers/android/binderfs.c:147
 binderfs_fill_super+0xa0e/0xe90 drivers/android/binderfs.c:730
 vfs_get_super fs/super.c:1323 [inline]
 get_tree_nodev+0xbb/0x150 fs/super.c:1342
 vfs_get_tree+0x92/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 918:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x18e/0x440 mm/slub.c:4841
 binder_free_proc drivers/android/binder.c:5245 [inline]
 binder_proc_dec_tmpref+0x228/0x4f0 drivers/android/binder.c:1567
 binder_deferred_release drivers/android/binder.c:6289 [inline]
 binder_deferred_func+0x13a5/0x1520 drivers/android/binder.c:6316
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888029560400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 8 bytes inside of
 freed 512-byte region [ffff888029560400, ffff888029560600)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x29560
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a441c80 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801a441c80 dead000000000100 dead000000000122
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffea0000a55801 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5208, tgid 5208 (udevd), ts 39951856979, free_ts 39922872746
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4959
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __kmalloc_cache_noprof+0x296/0x3d0 mm/slub.c:4353
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 kernfs_fop_open+0x397/0xca0 fs/kernfs/file.c:623
 do_dentry_open+0xdf0/0x1970 fs/open.c:964
 vfs_open+0x3b/0x340 fs/open.c:1094
 do_open fs/namei.c:3887 [inline]
 path_openat+0x2ee5/0x3830 fs/namei.c:4046
 do_filp_open+0x1fa/0x410 fs/namei.c:4073
 do_sys_openat2+0x121/0x1c0 fs/open.c:1437
 do_sys_open fs/open.c:1452 [inline]
 __do_sys_openat fs/open.c:1468 [inline]
 __se_sys_openat fs/open.c:1463 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1463
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5207 tgid 5207 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
 __slab_free+0x326/0x400 mm/slub.c:4553
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4147 [inline]
 slab_alloc_node mm/slub.c:4196 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_noprof+0x224/0x4f0 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 tomoyo_realpath_from_path+0xe3/0x5d0 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path2_perm+0x288/0x680 security/tomoyo/file.c:923
 tomoyo_path_rename+0x141/0x190 security/tomoyo/tomoyo.c:300
 security_path_rename+0x250/0x490 security/security.c:2026
 do_renameat2+0x64d/0xc50 fs/namei.c:5264
 __do_sys_rename fs/namei.c:5324 [inline]
 __se_sys_rename fs/namei.c:5322 [inline]
 __x64_sys_rename+0x82/0x90 fs/namei.c:5322
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888029560300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888029560380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888029560400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff888029560480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888029560500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
