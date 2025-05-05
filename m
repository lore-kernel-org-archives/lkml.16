Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CD11CD1F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 06:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746426750; cv=none; b=c9C2EEFIKgwtXeH4sGg4FsH+28DLagIg89kcNsT0S2pn7+H+kPY3O6OSyianU7PqMWtqIkIO8Lq6y2PeqUr7wnGkqiH/mujD77obGduSbPporxjX/ynnAfWu+Mfei3uXLdG01mMWVibgqsWi/2brIue7mEox175aHZiiutZg46Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746426750; c=relaxed/simple;
	bh=OtNU6mzCem93CXwpanDEXPuyHLI6NhY6SdGt5/Y4z74=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=PoBUp9tpTwp7GSYqG2eVJhDJ/8LiQuWYW+tFP9A1CABBGbJnLU18SSw41dVLjFSYbFeBZVwa4TtEZLrmmwBOdv0o7aRU7itkPjxaPGPmVmTwn3PiOOg/IdLT+lMBl8RNox4KuNiVAqPX7MSzijqu98HPFKu3DPKe9oFjzbszYKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3da644c8ffeso7748425ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 23:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746426748; x=1747031548;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jciCBvpJMPCsGzJAvlJuyv4rYfnLubqw6+5EsVzDqYM=;
        b=JQv8YtYu71EAecT7Fn7YoUMxWvkboLiLNq40DCwSH8JDQYu4OvDX+4rzz5XqnGp35x
         y2djm4yLjU4iOJRpl1/2Fx+t3pGvgTmWrEN2KKnXPJudT2leSpzQmOQk9/xFDUklr6vf
         MxYAtBE+SdPu50ICZKIJzl6ym0V2QM+8/jraCV8pKw7CrPbilTPtlSWDMzw8fmUFPTyo
         lKbMMrQyPnXjnpPACwT17V7KZtKjvZKfo4mcBe2Cimf3mP8rORiK1d/InFBbs4cJ9aVg
         QCnndm8TMuLMQfu/JLRve2j852h2qs7jLOm9GDKMhyWWvhzAprtAeMM4DOiIHLGgTQar
         0q7g==
X-Forwarded-Encrypted: i=1; AJvYcCWvL8XlHGreB2pcyKKEc3SyzTl0yFI+E9HJdBen3CeEKwBUFiZdjCIwUgz8bH5Hz7uoUz4Mtj61AvgT9p0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVTgNyU/Cy1ClKtd1nVmQB5/FlI/QbKSAw4muyOYh+q6R/qxCS
	fd5BnU/59DY5zyE0hfqsPEcc62zt/mu5k+wybnGpaykg47rlI5Gkf5H7S+ERzuJvW94ke6lEJfU
	MUEjxaig9XeHUibD9cNaI5zGKqIKMoY6ic6rtkePGuvs3W8eQDrcjY8c=
X-Google-Smtp-Source: AGHT+IFSLSNPAVyoQ4sFcmlUIENB3FviF0hXfelk2zvpKzKiaA3VUb6/Z4KU9XvFcfFLH6QuhGwowcbQyRlz2rqBpcHl6eJknjU/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:250e:b0:3d8:211c:9891 with SMTP id
 e9e14a558f8ab-3da5b23b7e2mr56631335ab.2.1746426747907; Sun, 04 May 2025
 23:32:27 -0700 (PDT)
Date: Sun, 04 May 2025 23:32:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68185b7b.a70a0220.254cdc.0046.GAE@google.com>
Subject: [syzbot] [afs?] INFO: task hung in afs_cell_purge (2)
From: syzbot <syzbot+750f21d691e244b473b1@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7a13c14ee59d Merge tag 'for-6.15-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=149171b3980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a42a9d552788177b
dashboard link: https://syzkaller.appspot.com/bug?extid=750f21d691e244b473b1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13a101cc580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2d34ac632fce/disk-7a13c14e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2ec4e8918d72/vmlinux-7a13c14e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/43b472fdcb30/bzImage-7a13c14e.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/9edd5a22bff1/mount_0.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=15a101cc580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+750f21d691e244b473b1@syzkaller.appspotmail.com

INFO: task kworker/u8:0:12 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc4-syzkaller-00051-g7a13c14ee59d #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:0    state:D stack:22568 pid:12    tgid:12    ppid:2      task_flags:0x4208060 flags:0x00004000
Workqueue: netns cleanup_net
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6860
 afs_cell_purge+0x3d9/0x540 fs/afs/cell.c:893
 afs_net_exit+0x50/0x100 fs/afs/main.c:146
 ops_exit_list net/core/net_namespace.c:172 [inline]
 cleanup_net+0x717/0xbd0 net/core/net_namespace.c:654
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/u8:0/12:
 #0: ffff88801aef3948 ((wq_completion)netns){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801aef3948 ((wq_completion)netns){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
 #1: ffffc90000117c60 (net_cleanup_work){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90000117c60 (net_cleanup_work){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
 #2: ffffffff8f2d54d0 (pernet_ops_rwsem){++++}-{4:4}, at: cleanup_net+0x145/0xbd0 net/core/net_namespace.c:608
1 lock held by khungtaskd/31:
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6764
3 locks held by kworker/u8:4/62:
 #0: ffff88803005a948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88803005a948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
 #1: ffffc9000154fc60 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc9000154fc60 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
 #2: ffffffff8f2e2008 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #2: ffffffff8f2e2008 (rtnl_mutex){+.+.}-{4:4}, at: addrconf_dad_work+0x112/0x14b0 net/ipv6/addrconf.c:4195
3 locks held by kworker/u8:8/1156:
 #0: ffff88801a089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801a089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
 #1: ffffc90003f3fc60 ((linkwatch_work).work){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90003f3fc60 ((linkwatch_work).work){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
 #2: ffffffff8f2e2008 (rtnl_mutex){+.+.}-{4:4}, at: linkwatch_event+0xe/0x60 net/core/link_watch.c:303
2 locks held by getty/5576:
 #0: ffff88803068f0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc90002fee2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
1 lock held by udevd/5864:
2 locks held by udevd/5888:
1 lock held by syz-executor/18951:
 #0: ffffffff8df41338 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:336 [inline]
 #0: ffffffff8df41338 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x3b7/0x730 kernel/rcu/tree_exp.h:998
3 locks held by syz-executor/19370:
 #0: ffffffff8ea7bd60 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8ea7bd60 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8ea7bd60 (&ops->srcu#2){.+.+}-{0:0}, at: rtnl_link_ops_get+0x23/0x250 net/core/rtnetlink.c:570
 #1: ffffffff8f2e2008 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #1: ffffffff8f2e2008 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:341 [inline]
 #1: ffffffff8f2e2008 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0x8db/0x1c70 net/core/rtnetlink.c:4064
 #2: ffffffff8df41338 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:304 [inline]
 #2: ffffffff8df41338 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x2f4/0x730 kernel/rcu/tree_exp.h:998

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-rc4-syzkaller-00051-g7a13c14ee59d #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:274 [inline]
 watchdog+0xfee/0x1030 kernel/hung_task.c:437
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 5960 Comm: udevd Not tainted 6.15.0-rc4-syzkaller-00051-g7a13c14ee59d #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
RIP: 0010:memset_orig+0x46/0xb0 arch/x86/lib/memset_64.S:73
Code: 75 74 48 89 d1 48 c1 e9 06 74 39 66 0f 1f 84 00 00 00 00 00 48 ff c9 48 89 07 48 89 47 08 48 89 47 10 48 89 47 18 48 89 47 20 <48> 89 47 28 48 89 47 30 48 89 47 38 48 8d 7f 40 75 d8 0f 1f 84 00
RSP: 0018:ffffc90003eef9c0 EFLAGS: 00000202
RAX: 0000000000000000 RBX: ffff888030be4000 RCX: 0000000000000037
RDX: 0000000000001000 RSI: 0000000000000000 RDI: ffff888030be4200
RBP: 0000000000000c40 R08: ffffffff8f7daa77 R09: 0000000000000000
R10: ffff888030be4000 R11: fffffbfff1efb54f R12: ffff88801a042140
R13: ffff888030be4000 R14: 0000000000000000 R15: 0000000000001000
FS:  00007ff5bdb62c80(0000) GS:ffff888126200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564955db1000 CR3: 0000000030456000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 slab_post_alloc_hook mm/slub.c:4164 [inline]
 slab_alloc_node mm/slub.c:4210 [inline]
 __do_kmalloc_node mm/slub.c:4340 [inline]
 __kmalloc_noprof+0x248/0x4f0 mm/slub.c:4353
 kmalloc_noprof include/linux/slab.h:909 [inline]
 tomoyo_realpath_from_path+0xe3/0x5d0 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x213/0x4b0 security/tomoyo/file.c:822
 security_inode_getattr+0x12f/0x330 security/security.c:2377
 vfs_getattr fs/stat.c:256 [inline]
 vfs_fstat fs/stat.c:278 [inline]
 vfs_fstatat+0xad/0x160 fs/stat.c:370
 __do_sys_newfstatat fs/stat.c:536 [inline]
 __se_sys_newfstatat fs/stat.c:530 [inline]
 __x64_sys_newfstatat+0x11c/0x1a0 fs/stat.c:530
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff5bd7165f4
Code: 64 c7 00 09 00 00 00 83 c8 ff c3 48 89 f2 b9 00 01 00 00 48 89 fe bf 9c ff ff ff e9 00 00 00 00 41 89 ca b8 06 01 00 00 0f 05 <45> 31 c0 3d 00 f0 ff ff 76 10 48 8b 15 03 a8 0d 00 f7 d8 41 83 c8
RSP: 002b:00007ffccc212828 EFLAGS: 00000206 ORIG_RAX: 0000000000000106
RAX: ffffffffffffffda RBX: 00007ff5bd7ee460 RCX: 00007ff5bd7165f4
RDX: 00007ffccc212830 RSI: 00007ff5bd7b3130 RDI: 0000000000000009
RBP: 0000564955796100 R08: 0000000000000000 R09: 0000000000000001
R10: 0000000000001000 R11: 0000000000000206 R12: 0000000000000002
R13: 0000000000000002 R14: 0000564955796100 R15: 0000564920123ea6
 </TASK>


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
