Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D427625634
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746926888; cv=none; b=VZIRE14xXHwuLtZzn6h0W+LyBzWvHIYl6IBDWqp4EXLWtwiyQed0YWGrjZuBK5bYB7ARTA0k/vJtqFxcGFPmItIPayRCQm9FPFQLXVZ3EgvqziBJhKMbt/ntzsw2E+VFAkU1jHjfwsn7O+cw91yT8JwkLc5hph1SMth80yYVgm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746926888; c=relaxed/simple;
	bh=RiEoYYTZ3omd/72Zupf6OcSzDYU77NKi93m+rVRKQdY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CdC7k6VCmYB5B6Ms8wKRXYnv6IweNDtBIO+t5NwmutSxpLHo2fjIP/lWBRL9fN9eYXD/Jm/4wtiddsZvEkCIpTra/BB7qpmYmEAML4Cd01dbKzQC2tlkhtQitBH9FmF56sEVjTqwXqp6Q5OoT/vac8DZWUh6SKsf62akFnaHDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3da6f284ca5so71618755ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 18:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746926885; x=1747531685;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBYImd7MxiJM6bzV9w7y/749hj6I9i8Of1K5aqBpPmk=;
        b=lzyvwc9gm77DagA2FPjml0jKFoLfOFlogEudGEXUSJQzIImyKiwDRHMUn/5YumOH+M
         wqxqxORgh8vYzBplNnLDkf6hGWPD3+1ZFQ3LGCXHn5jLKD47XvdloJ8+LxxP//TgdfVu
         05B29UO852x45u/ci7eujXZVwHeAdYY2O20UcaQhCciMui09gvteZBapVGNqcWivBNUE
         ujP/msUUDBm2921jha8SFF/A4kjuAR+wasA/N05Sym0TI51NMypYxaX2xpWS7QddFjyU
         DyW+2gWAzY33EVdVEJwhIzUKWpk4mXS0XghFuOnmvJkmrXpngMxK8OmViUnYOjgQy6nt
         fMlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9HotT495xwDShM4LBoV9kroTLAxKG7Q7CgCM7sflwGrpeTeZBJrp8MaaCM/mKYjGTpaiZRPkH1dinu4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC1KUYrs9yedAf0N8aoAoOR4m9DxoZzK9wd3zYCshKqj7BVYcr
	zvT9a4VaBZp/E9j0pz7WA9Rpwk5sYULz51UxM33jtzoDSZ9eXW/Ih+PIR9dnswNnt3hkkwGNJjU
	FqFPPtXIVTz9BHwjZtSDLane6uGxgXGwkv9VVdRQDHKgf33Q4t8QT6C8=
X-Google-Smtp-Source: AGHT+IHmBW23OQG6Ul0rHTJPUUn+EnBWsnbcgnlcwFp9N6ZSAwpqrfyKRK9cZaxXdDsBz97Sj2GnZ2iorpjCdOoLmLd1I3JQ3q9a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17cc:b0:3d6:d145:2ffb with SMTP id
 e9e14a558f8ab-3da7e2173cemr124268995ab.21.1746926884859; Sat, 10 May 2025
 18:28:04 -0700 (PDT)
Date: Sat, 10 May 2025 18:28:04 -0700
In-Reply-To: <20250511001723.1876-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681ffd24.050a0220.f2294.001d.GAE@google.com>
Subject: Re: [syzbot] [v9fs?] INFO: task hung in v9fs_evict_inode
From: syzbot <syzbot+56bd5818697f0f93fdd9@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in v9fs_evict_inode

INFO: task syz-executor:6613 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc5-syzkaller-00300-g3ce9925823c7-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:22232 pid:6613  tgid:6613  ppid:1      task_flags:0x400140 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6860
 netfs_wait_for_outstanding_io include/linux/netfs.h:558 [inline]
 v9fs_evict_inode+0x170/0x320 fs/9p/vfs_inode.c:348
 evict+0x501/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:660
 dput+0x19f/0x2b0 fs/dcache.c:902
 shrink_dcache_for_umount+0xa0/0x170 fs/dcache.c:1612
 generic_shutdown_super+0x67/0x2c0 fs/super.c:620
 kill_anon_super+0x3b/0x70 fs/super.c:1237
 v9fs_kill_super+0x4c/0x90 fs/9p/vfs_super.c:193
 deactivate_locked_super+0xb9/0x130 fs/super.c:473
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1431
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 resume_user_mode_work+0x5e/0x80 include/linux/resume_user_mode.h:50
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x9a/0x120 kernel/entry/common.c:218
 do_syscall_64+0x103/0x210 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa60458fc97
RSP: 002b:00007fffd9b8ae58 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007fa60461089d RCX: 00007fa60458fc97
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007fffd9b8af10
RBP: 00007fffd9b8af10 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007fffd9b8bfa0
R13: 00007fa60461089d R14: 000000000003486c R15: 00007fffd9b8bfe0
 </TASK>
INFO: task syz-executor:6620 blocked for more than 144 seconds.
      Not tainted 6.15.0-rc5-syzkaller-00300-g3ce9925823c7-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:22072 pid:6620  tgid:6620  ppid:1      task_flags:0x400140 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6860
 netfs_wait_for_outstanding_io include/linux/netfs.h:558 [inline]
 v9fs_evict_inode+0x170/0x320 fs/9p/vfs_inode.c:348
 evict+0x501/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:660
 dput+0x19f/0x2b0 fs/dcache.c:902
 shrink_dcache_for_umount+0xa0/0x170 fs/dcache.c:1612
 generic_shutdown_super+0x67/0x2c0 fs/super.c:620
 kill_anon_super+0x3b/0x70 fs/super.c:1237
 v9fs_kill_super+0x4c/0x90 fs/9p/vfs_super.c:193
 deactivate_locked_super+0xb9/0x130 fs/super.c:473
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1431
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 resume_user_mode_work+0x5e/0x80 include/linux/resume_user_mode.h:50
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x9a/0x120 kernel/entry/common.c:218
 do_syscall_64+0x103/0x210 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1cd6b8fc97
RSP: 002b:00007ffc6ff322e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007f1cd6c1089d RCX: 00007f1cd6b8fc97
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc6ff323a0
RBP: 00007ffc6ff323a0 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffc6ff33430
R13: 00007f1cd6c1089d R14: 0000000000034c04 R15: 00007ffc6ff33470
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/0:0/9:
 #0: ffff88801a080d48 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801a080d48 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
 #1: ffffc900000e7c60 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc900000e7c60 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
 #2: ffff888068497240 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x26b/0x3180 drivers/net/netdevsim/fib.c:1490
1 lock held by khungtaskd/31:
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6764
3 locks held by kworker/u8:3/54:
 #0: ffff88803041b148 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88803041b148 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
 #1: ffffc90000bf7c60 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90000bf7c60 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
 #2: ffffffff8f2e27c8 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #2: ffffffff8f2e27c8 (rtnl_mutex){+.+.}-{4:4}, at: addrconf_dad_work+0x112/0x14b0 net/ipv6/addrconf.c:4198
3 locks held by kworker/u8:4/63:
2 locks held by kworker/u8:5/131:
 #0: ffff88801a089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801a089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
 #1: ffffc90002e2fc60 ((work_completion)(&rreq->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90002e2fc60 ((work_completion)(&rreq->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
2 locks held by kworker/u8:6/1079:
 #0: ffff88801a089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801a089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
 #1: ffffc90003807c60 ((work_completion)(&rreq->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90003807c60 ((work_completion)(&rreq->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
2 locks held by kworker/u8:9/3002:
 #0: ffff88801a089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801a089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
 #1: ffffc9000baffc60 ((work_completion)(&rreq->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc9000baffc60 ((work_completion)(&rreq->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
1 lock held by klogd/5180:
2 locks held by getty/5580:
 #0: ffff888030f7e0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900036cb2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
1 lock held by syz-executor/6613:
 #0: ffff88802ca5e0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:56 [inline]
 #0: ffff88802ca5e0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:71 [inline]
 #0: ffff88802ca5e0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xa9/0xe0 fs/super.c:505
1 lock held by syz-executor/6620:
 #0: ffff88807cd440e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:56 [inline]
 #0: ffff88807cd440e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:71 [inline]
 #0: ffff88807cd440e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xa9/0xe0 fs/super.c:505
1 lock held by syz-executor/12720:
 #0: ffff8880687d40e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:56 [inline]
 #0: ffff8880687d40e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:71 [inline]
 #0: ffff8880687d40e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xa9/0xe0 fs/super.c:505
1 lock held by syz-executor/13177:
 #0: ffffffff8df41200 (rcu_state.barrier_mutex){+.+.}-{4:4}, at: rcu_barrier+0x4c/0x570 kernel/rcu/tree.c:3774
1 lock held by syz-executor/13628:
 #0: ffffffff8df41200 (rcu_state.barrier_mutex){+.+.}-{4:4}, at: rcu_barrier+0x4c/0x570 kernel/rcu/tree.c:3774
1 lock held by syz-executor/18686:
 #0: ffffffff8df41200 (rcu_state.barrier_mutex){+.+.}-{4:4}, at: rcu_barrier+0x4c/0x570 kernel/rcu/tree.c:3774
3 locks held by syz-executor/19117:
 #0: ffffffff8f2e27c8 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #0: ffffffff8f2e27c8 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:341 [inline]
 #0: ffffffff8f2e27c8 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0x8db/0x1c70 net/core/rtnetlink.c:4064
 #1: ffff88805dc594e8 (&wg->device_update_lock){+.+.}-{4:4}, at: wg_open+0x227/0x420 drivers/net/wireguard/device.c:50
 #2: ffffffff8df41338 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:304 [inline]
 #2: ffffffff8df41338 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x2f4/0x730 kernel/rcu/tree_exp.h:998
2 locks held by dhcpcd/19459:
 #0: ffff888061b2c258 (sk_lock-AF_PACKET){+.+.}-{0:0}, at: lock_sock include/net/sock.h:1651 [inline]
 #0: ffff888061b2c258 (sk_lock-AF_PACKET){+.+.}-{0:0}, at: packet_do_bind+0x32/0xcd0 net/packet/af_packet.c:3252
 #1: ffffffff8df41338 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:336 [inline]
 #1: ffffffff8df41338 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x3b7/0x730 kernel/rcu/tree_exp.h:998

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-rc5-syzkaller-00300-g3ce9925823c7-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
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
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 19463 Comm: syz.4.5724 Not tainted 6.15.0-rc5-syzkaller-00300-g3ce9925823c7-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:unwind_next_frame+0xc93/0x2390 arch/x86/kernel/unwind_orc.c:592
Code: 80 3c 28 00 48 8b 5c 24 70 4c 8b 6c 24 50 4c 8b 64 24 10 74 08 48 89 df e8 8a e9 ad 00 4c 89 23 ba 10 00 00 00 4c 89 ef 31 f6 <e8> 58 eb ad 00 48 8b 14 24 e9 c5 04 00 00 4c 89 7c 24 28 48 89 5c
RSP: 0018:ffffc90005206b58 EFLAGS: 00000046
RAX: 1ffff92000a40d98 RBX: ffffc90005206cc0 RCX: 1ffff92000a40d01
RDX: 0000000000000010 RSI: 0000000000000000 RDI: ffffc90005206cd8
RBP: dffffc0000000000 R08: 0000000000000009 R09: 0000000000080000
R10: 0000000000000000 R11: ffffffff8171a9f5 R12: ffffc90005206c88
R13: ffffc90005206cd8 R14: ffffc90005206c88 R15: ffffc90005206cd0
FS:  000055556d1b9500(0000) GS:ffff888126100000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000c006aae000 CR3: 00000000709c2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __unwind_start+0x5b9/0x760 arch/x86/kernel/unwind_orc.c:758
 unwind_start arch/x86/include/asm/unwind.h:64 [inline]
 arch_stack_walk+0xe4/0x150 arch/x86/kernel/stacktrace.c:24
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xbc/0xd0 mm/kasan/generic.c:548
 insert_work+0x3d/0x330 kernel/workqueue.c:2183
 __queue_work+0xcfc/0xfe0 kernel/workqueue.c:2341
 queue_work_on+0x181/0x270 kernel/workqueue.c:2392
 queue_work include/linux/workqueue.h:662 [inline]
 schedule_work include/linux/workqueue.h:723 [inline]
 p9_fd_request+0x2a8/0x4c0 net/9p/trans_fd.c:695
 p9_client_rpc+0x2da/0xa70 net/9p/client.c:706
 p9_client_write+0x33b/0x740 net/9p/client.c:1648
 v9fs_issue_write+0xdd/0x180 fs/9p/vfs_addr.c:59
 netfs_do_issue_write fs/netfs/write_issue.c:239 [inline]
 netfs_issue_write fs/netfs/write_issue.c:269 [inline]
 netfs_advance_write+0x4c1/0xc30 fs/netfs/write_issue.c:310
 netfs_write_folio+0x11cb/0x1bb0 fs/netfs/write_issue.c:498
 netfs_writepages+0x700/0x8e0 fs/netfs/write_issue.c:594
 do_writepages+0x3ae/0x7b0 mm/page-writeback.c:2656
 filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
 __filemap_fdatawrite_range mm/filemap.c:419 [inline]
 __filemap_fdatawrite mm/filemap.c:425 [inline]
 filemap_fdatawrite+0x191/0x230 mm/filemap.c:430
 v9fs_dir_release+0x15d/0x510 fs/9p/vfs_dir.c:219
 __fput+0x449/0xa70 fs/file_table.c:465
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 resume_user_mode_work+0x5e/0x80 include/linux/resume_user_mode.h:50
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x9a/0x120 kernel/entry/common.c:218
 do_syscall_64+0x103/0x210 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fedd5b8e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffebd6c8048 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 0000000000058570 RCX: 00007fedd5b8e969
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007fedd5db7ba0 R08: 0000000000000001 R09: 0000000abd6c833f
R10: 00007fedd5a00000 R11: 0000000000000246 R12: 00007fedd5db5fac
R13: 00007fedd5db5fa0 R14: ffffffffffffffff R15: 00007ffebd6c8160
 </TASK>


Tested on:

commit:         3ce99258 Merge tag 'mm-hotfixes-stable-2025-05-10-14-2..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11cad768580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9683d529ec1b880
dashboard link: https://syzkaller.appspot.com/bug?extid=56bd5818697f0f93fdd9
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=124cccf4580000

