Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E23214211
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748426914; cv=none; b=RtNf+ckZkDNEuKHXEAGHM6lHaN0uqd1LZo5TsAPrXOBlD1DpZxlobvGZPfoJYkcIf3o30yVWAvlz7cnnVcwNsw2DBy87X43TvW4Z4qtXqi2ZuvyQFGShMDxiRAWvvFmMZ/E991/Ko/i4ZR9mOymOQEAUS8fSTfHiPgufra3M4HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748426914; c=relaxed/simple;
	bh=lvBocvR3mMSNbVVnSRolMGmuBM9k96/8He6R+6JhIvM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QHLSF7HlNxtVDu268FJ2hKjs7fgr59c0y3muiz6j0F0iAiQPApS7WsNuNQuUE6iphrPeCoMOPqcl+ppDiZIpm/GIBqewKlIDuiGJIb8KwGsv3xYYYwIReAAR5Brh51BY2gTgCaJizwAZqdz9Qgwtn4Z2cM7OA3q57oYApqW4aUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-85e4f920dacso321879739f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748426911; x=1749031711;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tlAbtLPCjJbKhUV4OSvbkSnMZspOL3ZGmMs8BGjds5I=;
        b=fNPn8/4/2cMEWocy/T/YAMacD0vHRwJOi2vA9APeV0T4XCtDakn7ldc3VQ9NC8td46
         n3jebK63EOMBDPFl61AcnM4E63TOOwD64QuB+ZsB4VdA81iWIWr4uAIGjikzX3mvqTaj
         pwyySaznfpc3PmT0DDPU2owJ8x+w6+M6BT7Ksac/8EJPF+E3KLPAG+mQMb4g244KeW3Q
         7DDyX6VWES4pDSaUbSJ8u7uigdndJ8ZeMFuPH3O8ppA+DFxFsGd/YlUrEM3nnalVWY/F
         kx+1vt/zkeSjhfYKfqZ0uLceI5uvTECfQygp+oWOU+NWf91D898H1rKsBAhc50r+76mw
         JQsA==
X-Forwarded-Encrypted: i=1; AJvYcCWoH1YnZ09afn8KKkXrjsFyrtFGTebhzRLLpC6rBbBCYz2eHZfewHr3kP64b1H3QJRvwzKzvM2Hhwf5ipA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwljbfkpYOY5W8SwMEsklGYcJGehTClcg0/YfJOaI+Z2s2YGAjh
	HQuE0CU5cB79BDy6ZE86FGRzIUEJQubE9ac7OambxU/xahmKQvRh/jh4NdDlCfwxvpcNl01TTIY
	B8702xP8kAgTF+LwzRjcKii7b5MisnWpTSQkFlIHEUU8Dh4WU5azGK+nqiHE=
X-Google-Smtp-Source: AGHT+IEvcUSWl0jgFYihi0H2EUPfRWBoZwBcww7GsnobayXNbrLsLJxfI+4j/zT/hLHaeyIAI+g9ag3FBn5bVEp9ccIDkuQNwvEl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4a03:b0:867:237f:381e with SMTP id
 ca18e2360f4ac-86cbb818153mr1439473739f.2.1748426911339; Wed, 28 May 2025
 03:08:31 -0700 (PDT)
Date: Wed, 28 May 2025 03:08:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6836e09f.a70a0220.253bc2.00c7.GAE@google.com>
Subject: [syzbot] [gfs2?] KASAN: slab-use-after-free Write in gfs2_qd_dealloc (3)
From: syzbot <syzbot+42a37bf8045847d8f9d2@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    01c6df60d5d4 Add linux-next specific files for 20250411
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13deaa3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
dashboard link: https://syzkaller.appspot.com/bug?extid=42a37bf8045847d8f9d2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/928246b3f3d5/disk-01c6df60.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/79a68c4e1134/vmlinux-01c6df60.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9caf8c293819/bzImage-01c6df60.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+42a37bf8045847d8f9d2@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-use-after-free in atomic_dec_and_test include/linux/atomic/atomic-instrumented.h:1383 [inline]
BUG: KASAN: slab-use-after-free in gfs2_qd_dealloc+0x83/0xf0 fs/gfs2/quota.c:112
Write of size 4 at addr ffff888033e98a80 by task kworker/u8:3/53

CPU: 1 UID: 0 PID: 53 Comm: kworker/u8:3 Not tainted 6.15.0-rc1-next-20250411-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: bat_events batadv_tt_purge
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0x16e/0x5b0 mm/kasan/report.c:521
 kasan_report+0x143/0x180 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x28f/0x2a0 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_dec_and_test include/linux/atomic/atomic-instrumented.h:1383 [inline]
 gfs2_qd_dealloc+0x83/0xf0 fs/gfs2/quota.c:112
 rcu_do_batch kernel/rcu/tree.c:2546 [inline]
 rcu_core+0xaac/0x17a0 kernel/rcu/tree.c:2802
 handle_softirqs+0x2d6/0x9b0 kernel/softirq.c:579
 do_softirq+0x11f/0x1e0 kernel/softirq.c:480
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x1be/0x200 kernel/softirq.c:407
 spin_unlock_bh include/linux/spinlock.h:396 [inline]
 batadv_tt_local_purge+0x2a0/0x340 net/batman-adv/translation-table.c:1315
 batadv_tt_purge+0x35/0xa40 net/batman-adv/translation-table.c:3509
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
 worker_thread+0x870/0xd50 kernel/workqueue.c:3400
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 6071:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x9d/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x236/0x370 mm/slub.c:4362
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 init_sbd fs/gfs2/ops_fstype.c:77 [inline]
 gfs2_fill_super+0x13e/0x27b0 fs/gfs2/ops_fstype.c:1140
 get_tree_bdev_flags+0x490/0x5c0 fs/super.c:1686
 gfs2_get_tree+0x54/0x220 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x90/0x2b0 fs/super.c:1809
 do_new_mount+0x2cf/0xb70 fs/namespace.c:3879
 do_mount fs/namespace.c:4219 [inline]
 __do_sys_mount fs/namespace.c:4430 [inline]
 __se_sys_mount+0x38c/0x400 fs/namespace.c:4407
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6071:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2389 [inline]
 slab_free mm/slub.c:4646 [inline]
 kfree+0x198/0x430 mm/slub.c:4845
 free_sbd fs/gfs2/ops_fstype.c:69 [inline]
 gfs2_fill_super+0x14bf/0x27b0 fs/gfs2/ops_fstype.c:1313
 get_tree_bdev_flags+0x490/0x5c0 fs/super.c:1686
 gfs2_get_tree+0x54/0x220 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x90/0x2b0 fs/super.c:1809
 do_new_mount+0x2cf/0xb70 fs/namespace.c:3879
 do_mount fs/namespace.c:4219 [inline]
 __do_sys_mount fs/namespace.c:4430 [inline]
 __se_sys_mount+0x38c/0x400 fs/namespace.c:4407
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888033e98000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 2688 bytes inside of
 freed 8192-byte region [ffff888033e98000, ffff888033e9a000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x33e98
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b042280 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b042280 dead000000000100 dead000000000122
head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0000cfa601 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5487, tgid 5487 (run-parts), ts 55699630622, free_ts 55641758587
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x360a/0x37a0 mm/page_alloc.c:3700
 __alloc_frozen_pages_noprof+0x211/0x5b0 mm/page_alloc.c:4982
 alloc_pages_mpol+0x339/0x690 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2459 [inline]
 allocate_slab+0x8f/0x3a0 mm/slub.c:2623
 new_slab mm/slub.c:2676 [inline]
 ___slab_alloc+0xc3b/0x1500 mm/slub.c:3862
 __slab_alloc+0x58/0xa0 mm/slub.c:3952
 __slab_alloc_node mm/slub.c:4027 [inline]
 slab_alloc_node mm/slub.c:4188 [inline]
 __kmalloc_cache_noprof+0x26a/0x370 mm/slub.c:4357
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 tomoyo_print_bprm security/tomoyo/audit.c:26 [inline]
 tomoyo_init_log+0x121e/0x2150 security/tomoyo/audit.c:264
 tomoyo_supervisor+0x3c0/0x18b0 security/tomoyo/common.c:2198
 tomoyo_audit_env_log security/tomoyo/environ.c:36 [inline]
 tomoyo_env_perm+0x17b/0x220 security/tomoyo/environ.c:63
 tomoyo_environ security/tomoyo/domain.c:672 [inline]
 tomoyo_find_next_domain+0x1497/0x1dd0 security/tomoyo/domain.c:888
 tomoyo_bprm_check_security+0x11a/0x180 security/tomoyo/tomoyo.c:102
 security_bprm_check+0x86/0x250 security/security.c:1302
 search_binary_handler fs/exec.c:1768 [inline]
 exec_binprm fs/exec.c:1810 [inline]
 bprm_execve+0x903/0x1430 fs/exec.c:1862
 do_execveat_common+0x57c/0x710 fs/exec.c:1968
page last free pid 5485 tgid 5485 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0xde8/0x10a0 mm/page_alloc.c:2725
 __slab_free+0x2c6/0x390 mm/slub.c:4557
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9a/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x14f/0x170 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x23/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4151 [inline]
 slab_alloc_node mm/slub.c:4200 [inline]
 __do_kmalloc_node mm/slub.c:4330 [inline]
 __kmalloc_noprof+0x238/0x4d0 mm/slub.c:4343
 kmalloc_noprof include/linux/slab.h:909 [inline]
 tomoyo_add_entry security/tomoyo/common.c:2132 [inline]
 tomoyo_supervisor+0xc94/0x18b0 security/tomoyo/common.c:2204
 tomoyo_audit_path_log security/tomoyo/file.c:168 [inline]
 tomoyo_path_permission+0x243/0x360 security/tomoyo/file.c:587
 tomoyo_check_open_permission+0x309/0x4f0 security/tomoyo/file.c:777
 security_file_open+0xac/0x250 security/security.c:3114
 do_dentry_open+0x320/0x1960 fs/open.c:933
 vfs_open+0x3b/0x370 fs/open.c:1086
 do_open fs/namei.c:3849 [inline]
 path_openat+0x2caf/0x35d0 fs/namei.c:4008
 do_filp_open+0x284/0x4e0 fs/namei.c:4035
 do_sys_openat2+0x12b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x249/0x2a0 fs/open.c:1455

Memory state around the buggy address:
 ffff888033e98980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888033e98a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888033e98a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888033e98b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888033e98b80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
