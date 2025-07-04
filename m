Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25DE288519
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623658; cv=none; b=ZzqoA4crws9nlVKvmxl42Zjug08jxY6Cqc33dt8fnsW8hlPeaZUqmGx1jVtvwbZyd/Yv1L9AhM6JIkuZFxJi8lPhdQcaGxDj4LhqLwcMIEFUe+5R3md2O0LI9klkb2IkgV4vzpXqif/bkXEzuXT3BexK0WgYRrK6IktLX3SIL7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623658; c=relaxed/simple;
	bh=hBohiR+yixTenx1PPMFtKDPPcL6n0ib88j1vojhPXNc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=D0jjh/Sb/39pgt0hpFy9J4Z/Bz8ZxImN4ZbBj6tncpwsIs2z70EqgNvPSNz1SgnWUH36STgxprAvkXlftoZzIDyrz+XNutXAYMgJ5KyDxtP2hevY8NicI/Ti5oCOyM3W+lCCHmzqrNZVVgW6mfmtKEsCufaIIEs6BJJ1AsqOHwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3df6030ea2fso18588485ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751623655; x=1752228455;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMv5m+04peWmGOlb9xw+Y5TeBq2l+62yKhu0Uua0kXU=;
        b=Vw95eT3tEIpvmNX30+izXL9/zgoaasIujPpzm7fjVbqKIPYs6nSRlZUgEXvqP5bjy5
         XcDguni11qiwgZM4KZwMfmBf1e6mMEB5vnvoBVy7ruGZbtYvyUzQj39pHWZcG+9OTBsg
         KolYJ64ZbDqcP/1BpVQoXVgYokojyGHbdINpyruaWa6ESto8d9b/QjnlkiIirZttWPWm
         o3uS2kgu15jZGwobWOCKXKU5YGiA8AkcOya3tGOISf8Z9/hvKVv+gGtXXXXHXftzJISd
         MYiZa0W3QoaQ3H2PPhz17jeCLbIcH5pyRpKyugMWLtxnrSFbXKl4YGbBfDBM5LajksZ9
         gntw==
X-Forwarded-Encrypted: i=1; AJvYcCXSgjN+9LvmFo7yKWhMiHMKCdKKMv38zFFUdKkUONV9H/ILJGvYsQUa7p1bE+WY0RjGPL0pFSy0G5yycYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5cfMsNjOq80H0vSTHi773J3Yfz6fvyl9l+4jRnN/xPOUOgIpO
	rLnPqTnBaSoCiRfJt1HNHl1rfkuuxefqorxpVB0FsBL/aY6EEbdVnRtoDki5VJu+3VxlJ/xUdkA
	VI8nrVRbIzqdVecs5glNnRQIkkUbkWdIJb7JdACpoAgCJLVOOLi3In4vOP2Y=
X-Google-Smtp-Source: AGHT+IF11xHT/pqB9Y/nYKAHM6LlPwupuvXq9906vGmwFTfyHSeZlVRM9uzFA1dndUyqvbL92NL6NOE0o0ZmLkD8uZGn9nEmNF3+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c3:b0:3e0:4f66:3106 with SMTP id
 e9e14a558f8ab-3e13547ddf5mr17855765ab.2.1751623654592; Fri, 04 Jul 2025
 03:07:34 -0700 (PDT)
Date: Fri, 04 Jul 2025 03:07:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6867a7e6.a00a0220.c7b3.001a.GAE@google.com>
Subject: [syzbot] [f2fs?] INFO: task hung in f2fs_issue_checkpoint (2)
From: syzbot <syzbot+8a7eea50810efde15b0a@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    66701750d556 Merge tag 'io_uring-6.16-20250630' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e4388c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e29b8115bf337f53
dashboard link: https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/523bba6cff2e/disk-66701750.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0fcf3d9d70ad/vmlinux-66701750.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8b9c399a35d9/bzImage-66701750.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8a7eea50810efde15b0a@syzkaller.appspotmail.com

INFO: task kworker/u8:8:5978 blocked for more than 143 seconds.
      Not tainted 6.16.0-rc4-syzkaller-00013-g66701750d556 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:8    state:D stack:21160 pid:5978  tgid:5978  ppid:2      task_flags:0x4208060 flags:0x00004000
Workqueue: writeback wb_workfn (flush-7:5)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5396 [inline]
 __schedule+0x16a2/0x4cb0 kernel/sched/core.c:6785
 __schedule_loop kernel/sched/core.c:6863 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6878
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6935
 rwsem_down_write_slowpath+0xbec/0x1030 kernel/locking/rwsem.c:1176
 __down_write_common kernel/locking/rwsem.c:1304 [inline]
 __down_write kernel/locking/rwsem.c:1313 [inline]
 down_write+0x1ab/0x1f0 kernel/locking/rwsem.c:1578
 f2fs_down_write fs/f2fs/f2fs.h:2229 [inline]
 f2fs_issue_checkpoint+0x39c/0x570 fs/f2fs/checkpoint.c:1846
 f2fs_balance_fs_bg+0x54d/0x980 fs/f2fs/segment.c:543
 f2fs_write_node_pages+0x146/0x6e0 fs/f2fs/node.c:2161
 do_writepages+0x32e/0x550 mm/page-writeback.c:2636
 __writeback_single_inode+0x145/0xff0 fs/fs-writeback.c:1680
 writeback_sb_inodes+0x6b5/0x1000 fs/fs-writeback.c:1976
 __writeback_inodes_wb+0x111/0x240 fs/fs-writeback.c:2047
 wb_writeback+0x44f/0xaf0 fs/fs-writeback.c:2158
 wb_check_old_data_flush fs/fs-writeback.c:2262 [inline]
 wb_do_writeback fs/fs-writeback.c:2315 [inline]
 wb_workfn+0xaef/0xef0 fs/fs-writeback.c:2343
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8e13ee20 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8e13ee20 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8e13ee20 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6770
2 locks held by getty/5577:
 #0: ffff8880343b20a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000332b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
4 locks held by kworker/u8:8/5978:
 #0: ffff888140a89948 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff888140a89948 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3321
 #1: ffffc900053efbc0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc900053efbc0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3321
 #2: ffff88804c9700e0 (&type->s_umount_key#99){++++}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:563
 #3: ffff888077745410 (&sbi->gc_lock){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2229 [inline]
 #3: ffff888077745410 (&sbi->gc_lock){+.+.}-{4:4}, at: f2fs_issue_checkpoint+0x39c/0x570 fs/f2fs/checkpoint.c:1846
6 locks held by syz.5.260/8622:

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.16.0-rc4-syzkaller-00013-g66701750d556 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:307 [inline]
 watchdog+0xfee/0x1030 kernel/hung_task.c:470
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 78 Comm: kworker/u8:4 Not tainted 6.16.0-rc4-syzkaller-00013-g66701750d556 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events_unbound nsim_dev_trap_report_work
RIP: 0010:lockdep_enabled kernel/locking/lockdep.c:118 [inline]
RIP: 0010:lock_acquire+0x8d/0x360 kernel/locking/lockdep.c:5847
Code: f6 05 be ad eb 0d 01 0f 84 d7 01 00 00 83 3d 19 eb 01 0e 00 0f 84 f0 00 00 00 48 8b b4 24 90 00 00 00 4c 89 ef e8 43 5a 83 00 <83> 3d fc ea 01 0e 00 0f 84 fa 00 00 00 65 8b 05 ff de fb 10 85 c0
RSP: 0018:ffffc9000210f3d8 EFLAGS: 00000202
RAX: 0000000000000001 RBX: 0000000000000000 RCX: 5bd6d986281a0c00
RDX: 0000000000000000 RSI: ffffffff81728b12 RDI: 1ffffffff1c27dc4
RBP: ffffffff81728af5 R08: 0000000000000000 R09: 0000000000000000
R10: ffffc9000210f5f8 R11: fffff52000421ec1 R12: 0000000000000002
R13: ffffffff8e13ee20 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125d84000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563853e3a168 CR3: 0000000030b5e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:841 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1155 [inline]
 unwind_next_frame+0xc2/0x2390 arch/x86/kernel/unwind_orc.c:479
 __unwind_start+0x5b9/0x760 arch/x86/kernel/unwind_orc.c:758
 unwind_start arch/x86/include/asm/unwind.h:64 [inline]
 arch_stack_walk+0xe4/0x150 arch/x86/kernel/stacktrace.c:24
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kmem_cache_free+0x18f/0x400 mm/slub.c:4745
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:821 [inline]
 nsim_dev_trap_report_work+0x7cf/0xb80 drivers/net/netdevsim/dev.c:851
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
