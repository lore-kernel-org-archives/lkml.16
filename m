Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4764E2561D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738912046; cv=none; b=tHVEVb3ZqX05ft0IukuBKqJlhusklRNIHmgjxciTQk7bgBh5+HSVCe5LigJbyqA9TQBLjk49nkNfhnPgaoKbpESZAz/kyf8PlKKf5CPTYOIY9r54foF6RK0Q6ik7Hoc5P2DsIssjc7jz6JKGYg43Z7OUzDKLJtbDGUGij9sKhmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738912046; c=relaxed/simple;
	bh=Aj039XsEWP+sGCivMJBKD6M0hVQhJg6k/ifCwfbYvDI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=VeHbsZtWwnCCzc3HjTiaKHsgaB/PByGS2HiM0XVMJ0hoMV+E0utOiK89to2O53//5EyYIDAdUBE3Q9u6wd+qT/NuEYjvfN8QuFJZvik43G6tmZ8IRP7ZGGZw0YBzIrcDSBZYJZ6EY3Mak5t8ASxoIZr25i3vpnVcTVOwjp6Pcu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d00f199b76so30872055ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738912043; x=1739516843;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/QFyKbRpEeS7gg5dXYfTo3yOFDpvQPpl4kj6hmE3oYE=;
        b=Rdn3UBk33dGOVJ/SggfBhjW/RYn0vecKx2LwE30lPEhFgBUDWf6m4faZgHYbDmZyV6
         hveWeGPJDUJU5yHRllzorrbfJv53ITEmlAly+Ce43aGB5w6XeMeC78+icfXuQve+tneE
         T7tkdNZYFxMWpZed96ONDgOLDEESUdmYruJoHTGhSfRaB/Y5etxHmZUqYvLhSilZv7vs
         TBpnmFlQAPeX6YpvSrNHMQ5EebQ+URZUoDIqwCEGh0BsH1CLeRu2g+rKJVJhTku5L80g
         yKQ16DwUg2qKVUB5qfkgM+OFutod+D9NbNw0W4G5yIAe8NjnPWoIEh/uftlgC73oIVm6
         24iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAvDsJArQ72/YqDr3uicE8WQSAR3K+ntIANrjuzZfl6vhDEpftsbQAQUMGs7wykmGZLZi5CO4wifiGc/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu7MmBCcv9AloE/R7rvJyKPOUrnZj9oyIMJzKjwuzOhLHN6ZDB
	nyLYE41CY/dsbCBMLqczE1oWx3PebYHZNH/6NNCiBrdNih4nvBLakAzxZDbzqhUzvyqSZVv5ShF
	f4sRyUo0rSeXFl2sSKZh0mbMKt6zXF+gbNBqzbsVN+MvkfEL4SDF+L84=
X-Google-Smtp-Source: AGHT+IG+LoZF4xn7KexU5YD08NQT0vAh+RMrOpTShpEkT+VMZHNZPtERcYYMqoqrtgANUSoTkb192FW6QMwLXe/kul0baGhLfkXM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3785:b0:3d0:4e57:bbd9 with SMTP id
 e9e14a558f8ab-3d13dd4d375mr15204995ab.10.1738912043373; Thu, 06 Feb 2025
 23:07:23 -0800 (PST)
Date: Thu, 06 Feb 2025 23:07:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5b12b.050a0220.2b1e6.0016.GAE@google.com>
Subject: [syzbot] [mm?] INFO: task hung in rmap_walk_file
From: syzbot <syzbot+038e767da0db0a0d9b59@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2014c95afece Linux 6.14-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1131c3df980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=19886416c83671c4
dashboard link: https://syzkaller.appspot.com/bug?extid=038e767da0db0a0d9b59
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b1d724580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1531c3df980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/829b24bcce21/disk-2014c95a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6fe35dde263a/vmlinux-2014c95a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/aeece1d48196/bzImage-2014c95a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+038e767da0db0a0d9b59@syzkaller.appspotmail.com

INFO: task syz-executor278:10447 blocked for more than 143 seconds.
      Not tainted 6.14.0-rc1-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor278 state:D stack:25912 pid:10447 tgid:10445 ppid:5838   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5377 [inline]
 __schedule+0x190e/0x4c90 kernel/sched/core.c:6764
 __schedule_loop kernel/sched/core.c:6841 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6856
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6913
 rwsem_down_read_slowpath kernel/locking/rwsem.c:1084 [inline]
 __down_read_common kernel/locking/rwsem.c:1248 [inline]
 __down_read kernel/locking/rwsem.c:1261 [inline]
 down_read+0x705/0xa40 kernel/locking/rwsem.c:1526
 i_mmap_lock_read include/linux/fs.h:565 [inline]
 rmap_walk_file+0x69c/0x780 mm/rmap.c:2694
 remove_migration_ptes mm/migrate.c:365 [inline]
 unmap_and_move_huge_page mm/migrate.c:1518 [inline]
 migrate_hugetlbs mm/migrate.c:1640 [inline]
 migrate_pages+0xd34/0x34a0 mm/migrate.c:2070
 do_mbind mm/mempolicy.c:1394 [inline]
 kernel_mbind mm/mempolicy.c:1537 [inline]
 __do_sys_mbind mm/mempolicy.c:1611 [inline]
 __se_sys_mbind+0x14b8/0x1980 mm/mempolicy.c:1607
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc308171e89
RSP: 002b:00007fc308120168 EFLAGS: 00000246 ORIG_RAX: 00000000000000ed
RAX: ffffffffffffffda RBX: 00007fc3081f63e8 RCX: 00007fc308171e89
RDX: 0000000000000000 RSI: 0000000000800000 RDI: 0000000020001000
RBP: 00007fc3081f63e0 R08: 0000000000000040 R09: 0000000000000002
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fc3081f63ec
R13: 0000000000000016 R14: 00007ffc9e93b110 R15: 00007ffc9e93b1f8
 </TASK>
INFO: task syz-executor278:10464 blocked for more than 143 seconds.
      Not tainted 6.14.0-rc1-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor278 state:D stack:25688 pid:10464 tgid:10445 ppid:5838   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5377 [inline]
 __schedule+0x190e/0x4c90 kernel/sched/core.c:6764
 __schedule_loop kernel/sched/core.c:6841 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6856
 io_schedule+0x8d/0x110 kernel/sched/core.c:7689
 folio_wait_bit_common+0x839/0xee0 mm/filemap.c:1318
 __folio_lock mm/filemap.c:1665 [inline]
 folio_lock include/linux/pagemap.h:1163 [inline]
 __filemap_get_folio+0x14e/0xae0 mm/filemap.c:1918
 filemap_lock_folio include/linux/pagemap.h:800 [inline]
 filemap_lock_hugetlb_folio include/linux/hugetlb.h:790 [inline]
 hugetlbfs_zero_partial_page+0xb0/0x590 fs/hugetlbfs/inode.c:656
 hugetlbfs_punch_hole fs/hugetlbfs/inode.c:710 [inline]
 hugetlbfs_fallocate+0xbd2/0x11a0 fs/hugetlbfs/inode.c:743
 vfs_fallocate+0x623/0x7a0 fs/open.c:338
 madvise_remove mm/madvise.c:1025 [inline]
 madvise_vma_behavior mm/madvise.c:1260 [inline]
 madvise_walk_vmas mm/madvise.c:1502 [inline]
 do_madvise+0x23c9/0x4d90 mm/madvise.c:1689
 __do_sys_madvise mm/madvise.c:1705 [inline]
 __se_sys_madvise mm/madvise.c:1703 [inline]
 __x64_sys_madvise+0xa6/0xc0 mm/madvise.c:1703
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc308171e89
RSP: 002b:00007fc3080ff178 EFLAGS: 00000246 ORIG_RAX: 000000000000001c
RAX: ffffffffffffffda RBX: 00007fc3081f63f8 RCX: 00007fc308171e89
RDX: 0000000000000009 RSI: 0000000000600002 RDI: 0000000020000000
RBP: 00007fc3081f63f0 R08: 00007ffc9e93b1f7 R09: 00007fc3080ff6c0
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fc3081f63fc
R13: 000000000000006e R14: 00007ffc9e93b110 R15: 00007ffc9e93b1f8
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/30:
 #0: ffffffff8e9387e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 #0: ffffffff8e9387e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8e9387e0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x55/0x2a0 kernel/locking/lockdep.c:6746
5 locks held by kworker/u8:8/3011:
2 locks held by getty/5593:
 #0: ffff88803570a0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc90002fde2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x6a6/0x1e00 drivers/tty/n_tty.c:2211
1 lock held by syz-executor278/10447:
 #0: ffff88801f749d68 (&hugetlbfs_i_mmap_rwsem_key){++++}-{4:4}, at: i_mmap_lock_read include/linux/fs.h:565 [inline]
 #0: ffff88801f749d68 (&hugetlbfs_i_mmap_rwsem_key){++++}-{4:4}, at: rmap_walk_file+0x69c/0x780 mm/rmap.c:2694
3 locks held by syz-executor278/10464:
 #0: ffff888021aa4420 (sb_writers#9){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3023 [inline]
 #0: ffff888021aa4420 (sb_writers#9){.+.+}-{0:0}, at: vfs_fallocate+0x59d/0x7a0 fs/open.c:337
 #1: ffff88801f749a98 (&sb->s_type->i_mutex_key#16){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:865 [inline]
 #1: ffff88801f749a98 (&sb->s_type->i_mutex_key#16){+.+.}-{4:4}, at: hugetlbfs_punch_hole fs/hugetlbfs/inode.c:685 [inline]
 #1: ffff88801f749a98 (&sb->s_type->i_mutex_key#16){+.+.}-{4:4}, at: hugetlbfs_fallocate+0x408/0x11a0 fs/hugetlbfs/inode.c:743
 #2: ffff88801f749d68 (&hugetlbfs_i_mmap_rwsem_key){++++}-{4:4}, at: i_mmap_lock_write include/linux/fs.h:545 [inline]
 #2: ffff88801f749d68 (&hugetlbfs_i_mmap_rwsem_key){++++}-{4:4}, at: hugetlbfs_punch_hole fs/hugetlbfs/inode.c:693 [inline]
 #2: ffff88801f749d68 (&hugetlbfs_i_mmap_rwsem_key){++++}-{4:4}, at: hugetlbfs_fallocate+0x4ce/0x11a0 fs/hugetlbfs/inode.c:743
1 lock held by syz-executor278/3275:
 #0: ffffffff8e93dcb8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:334 [inline]
 #0: ffffffff8e93dcb8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x451/0x830 kernel/rcu/tree_exp.h:996
1 lock held by syz-executor278/3284:
 #0: ffffffff8e93dcb8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:334 [inline]
 #0: ffffffff8e93dcb8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x451/0x830 kernel/rcu/tree_exp.h:996

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 30 Comm: khungtaskd Not tainted 6.14.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x49c/0x4d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x198/0x320 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:236 [inline]
 watchdog+0x1058/0x10a0 kernel/hung_task.c:399
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 2974 Comm: kworker/u8:6 Not tainted 6.14.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: events_unbound nsim_dev_trap_report_work
RIP: 0010:rcu_is_watching+0x70/0xb0 kernel/rcu/tree.c:718
Code: c3 58 79 03 00 49 03 1e 48 89 d8 48 c1 e8 03 42 0f b6 04 38 84 c0 75 22 8b 03 65 ff 0d 01 bb 5e 7e 74 10 83 e0 04 c1 e8 02 5b <41> 5e 41 5f c3 cc cc cc cc e8 f2 1c 85 ff eb e9 89 d9 80 e1 07 80
RSP: 0018:ffffc9000c1877b0 EFLAGS: 00000002
RAX: 0000000000000001 RBX: 0000000000000001 RCX: ffffffff81c720ac
RDX: 0000000000000000 RSI: ffffffff8c608960 RDI: ffffffff8c608920
RBP: ffffc9000c187870 R08: ffffffff901b5177 R09: 1ffffffff2036a2e
R10: dffffc0000000000 R11: fffffbfff2036a2f R12: 0000000000000246
R13: 1ffff92001830efc R14: ffffffff8e313b58 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc3080ffd58 CR3: 00000000122f4000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <TASK>
 trace_irq_disable+0x3b/0x120 include/trace/events/preemptirq.h:36
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:108 [inline]
 _raw_spin_lock_irqsave+0xb0/0x120 kernel/locking/spinlock.c:162
 __debug_check_no_obj_freed lib/debugobjects.c:1088 [inline]
 debug_check_no_obj_freed+0x234/0x580 lib/debugobjects.c:1129
 slab_free_hook mm/slub.c:2284 [inline]
 slab_free mm/slub.c:4609 [inline]
 kmem_cache_free+0x114/0x410 mm/slub.c:4711
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:821 [inline]
 nsim_dev_trap_report_work+0x7cc/0xb50 drivers/net/netdevsim/dev.c:851
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
INFO: NMI handler (nmi_cpu_backtrace_handler) took too long to run: 1.311 msecs


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
