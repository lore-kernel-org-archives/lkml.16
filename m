Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF821993B2
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 05:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746422585; cv=none; b=bzej/vHsZNvV8CPrLMK2hU8i7m4iqfkUDn+MXlx+YmrQrgVuhRtwckyTm8gy5XgWtpkwqSTzCXyEFM2mSGDPPY/Wmh9Vnf1ZWo1zw6EqPML/LtJlMlJ7XLvf9D4lccj5wnAgixo32kuk7rKRIK+dQf3McU1B9Lfs2jbHb9+O2mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746422585; c=relaxed/simple;
	bh=tzwmhQRPZDK3Xt2ZXWSqFbIwwt0o3daqDftBVjmQHsA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eR21nPIuKauaMDsLGJaYAHDbVj0kHWeez9ce3xK0o2fP43ZPlV/H9itOAmUCG4HGYGJqQX63zU0HexD1Dvaujgcn1+HyjEzT2Zn+LnQj/FY+C7UvGTYmPlZv09B3AoBmMtvt6TCB45ayp5/RbU3+mhEJpw7ecQABg8/hm0uzEzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d8a9b1c84eso51914585ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 22:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746422583; x=1747027383;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=as/mnPUqjdpOxFtkgE3apIVNnCbaDSd5xglEArfysU4=;
        b=Wk8xw3NOdSgEMz5mH9I4fQ7UJkVdJ936PueC6ceMxVTtTDXoOa2C8oCDFBznG5YGsB
         xT/EYmp+DJyo9YDdTE3z3BeUVGLVH9BYWQHdNMl3bsAcsnFNrK6LAJr9aN2VUHqQ/Qiy
         Y2gY3W+gckZG+nCOnUvBwaKunyFO+o7Fm44KhWKpK0RxaGpSqzxuiQ2hW6Dv6dY7LUPz
         Fk1XAjzgA7nUd/e/Rkh3HEqqo9yBnn+ZGtvAQDK9Govwr/5W9i6jZ9CQnsrZt+WO4Q6M
         FCzQBalZ8Alu0xLsGJWECboNVxS5HbMQzDRKkjAB+VeAF6O46SCpN1MREj+XmkGiqRjR
         kGIA==
X-Forwarded-Encrypted: i=1; AJvYcCVWfNYdXe3p//OwG1NBQcQIk1j5AoIQ8fQuJZm4wh6zT/p6V3ROO5iX/TSJWDEwbEijTuSo+2zHFb/i3N4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5L+d7tvU0vvhmX+tn4zV/DSTa0HlyXcaotd53OnElz84BGNC
	o/r7NZ+1vkMJDi0jmY829KW2n79OLmjnT/VT/l1AnjtU9svpUokVmi6PKu0zq5e3IiUyHrJZ3/9
	HISj8thtx610ldHw6SM1bmMqZ0KtobyBVkMSx7lxE1DN/ztwiEQwgFXo=
X-Google-Smtp-Source: AGHT+IFPKaggKgNuETI4Ee9DUNLKo0oJ3cm4ID9+ndFSu8JV/YPDzoQoWQjZHJHVEpUE9oOAIaJUbHniFEqhPkatlh23ZLKOsonQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1845:b0:3d2:aa73:7b7a with SMTP id
 e9e14a558f8ab-3da5b2a5bdbmr59695055ab.12.1746422582866; Sun, 04 May 2025
 22:23:02 -0700 (PDT)
Date: Sun, 04 May 2025 22:23:02 -0700
In-Reply-To: <20250505045149.1718-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68184b36.a70a0220.254cdc.0043.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-out-of-bounds Read in hci_cmd_sync_alloc
From: syzbot <syzbot+5fe2d5bfbfbec0b675a0@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in hci_cmd_sync_clear

INFO: task syz-executor:6385 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc5-syzkaller-g92a09c47464d-dirty #0
      Blocked by coredump.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:23880 pid:6385  tgid:6385  ppid:1      task_flags:0x40054c flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_timeout+0x257/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common+0x2fc/0x4e0 kernel/sched/completion.c:116
 __flush_work+0x7d7/0xcc0 kernel/workqueue.c:4244
 __cancel_work_sync+0x10c/0x130 kernel/workqueue.c:4364
 hci_cmd_sync_clear+0x33/0x100 net/bluetooth/hci_sync.c:655
 hci_unregister_dev+0x1b8/0x620 net/bluetooth/hci_core.c:2674
 vhci_release+0x79/0xf0 drivers/bluetooth/hci_vhci.c:665
 __fput+0x3ff/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xafb/0x2c30 kernel/exit.c:953
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1102
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x7d0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x260 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4ebbb8d2d0
RSP: 002b:00007ffd82122880 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: 0000000000000003 RBX: 0000000000000002 RCX: 00007f4ebbb8d2d0
RDX: 0000000000000002 RSI: 00007ffd82122990 RDI: 00000000ffffff9c
RBP: 00007ffd82122990 R08: 0000000000000000 R09: 00007ffd82122647
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000258
R13: 00000000000927c0 R14: 000000000002393a R15: 00007ffd82122990
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/41:
 #0: ffffffff8e3bf5c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8e3bf5c0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8e3bf5c0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x36/0x1c0 kernel/locking/lockdep.c:6764
2 locks held by getty/5727:
 #0: ffff8880276460a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000343b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x41b/0x14f0 drivers/tty/n_tty.c:2222
3 locks held by kworker/u33:2/5995:
 #0: ffff88804e1bd148 ((wq_completion)hci0){+.+.}-{0:0}, at: process_one_work+0x12a2/0x1b70 kernel/workqueue.c:3213
 #1: ffffc900016cfd18 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x929/0x1b70 kernel/workqueue.c:3214
 #2: ffff888035efcd80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x175/0x430 net/bluetooth/hci_sync.c:331
2 locks held by syz-executor/11948:

=============================================

NMI backtrace for cpu 2
CPU: 2 UID: 0 PID: 41 Comm: khungtaskd Not tainted 6.15.0-rc5-syzkaller-g92a09c47464d-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x27b/0x390 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x29c/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:274 [inline]
 watchdog+0xf70/0x12c0 kernel/hung_task.c:437
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 2 to CPUs 0-1,3:
NMI backtrace for cpu 3
CPU: 3 UID: 0 PID: 64 Comm: kworker/u32:3 Not tainted 6.15.0-rc5-syzkaller-g92a09c47464d-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: bat_events batadv_nc_worker
RIP: 0010:hlock_class kernel/locking/lockdep.c:245 [inline]
RIP: 0010:mark_lock+0x63/0x610 kernel/locking/lockdep.c:4732
Code: 6d 41 bd 01 00 00 00 89 d9 41 d3 e5 4d 63 ed 41 0f b7 44 24 20 66 25 ff 1f 0f b7 c0 48 0f a3 05 73 d6 12 14 0f 83 86 00 00 00 <48> 8d 04 80 48 8d 04 80 48 8d 04 c5 60 bf aa 95 4c 89 ea 48 23 50
RSP: 0018:ffffc90000b5f940 EFLAGS: 00000003
RAX: 0000000000000007 RBX: 0000000000000009 RCX: 0000000000000000
RDX: 0000000000000008 RSI: ffff8880205e0b40 RDI: ffff8880205e0000
RBP: ffffc90000b5f9d8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff8e3bf5c0 R12: ffff8880205e0b40
R13: 0000000000000200 R14: ffff8880205e0000 R15: ffff8880205e0000
FS:  0000000000000000(0000) GS:ffff8880d6cdf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2e75ffff CR3: 000000002e962000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 mark_usage kernel/locking/lockdep.c:4675 [inline]
 __lock_acquire+0x499/0x1ba0 kernel/locking/lockdep.c:5189
 lock_acquire kernel/locking/lockdep.c:5866 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5823
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:841 [inline]
 batadv_nc_purge_orig_hash net/batman-adv/network-coding.c:408 [inline]
 batadv_nc_worker+0x16a/0x1030 net/batman-adv/network-coding.c:719
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc5-syzkaller-g92a09c47464d-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:81
Code: 15 62 02 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 73 1a 1d 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffffff8e007e10 EFLAGS: 00000286
RAX: 0000000000353fd5 RBX: 0000000000000000 RCX: ffffffff8b6cd419
RDX: 0000000000000000 RSI: ffffffff8dbe124f RDI: ffffffff8bf482e0
RBP: fffffbfff1c12ee8 R08: 0000000000000001 R09: ffffed100d4865bd
R10: ffff88806a432deb R11: 0000000000000000 R12: 0000000000000000
R13: ffffffff8e097740 R14: ffffffff90850510 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d69df000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000030b80000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x13/0x20 arch/x86/kernel/process.c:748
 default_idle_call+0x6d/0xb0 kernel/sched/idle.c:117
 cpuidle_idle_call kernel/sched/idle.c:185 [inline]
 do_idle+0x391/0x510 kernel/sched/idle.c:325
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:423
 rest_init+0x16b/0x2b0 init/main.c:743
 start_kernel+0x3e9/0x4d0 init/main.c:1099
 x86_64_start_reservations+0x18/0x30 arch/x86/kernel/head64.c:513
 x86_64_start_kernel+0xb0/0xc0 arch/x86/kernel/head64.c:494
 common_startup_64+0x13e/0x148
 </TASK>
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.15.0-rc5-syzkaller-g92a09c47464d-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:81
Code: 15 62 02 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 73 1a 1d 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffc90000177df8 EFLAGS: 00000286
RAX: 00000000003033b7 RBX: 0000000000000001 RCX: ffffffff8b6cd419
RDX: 0000000000000000 RSI: ffffffff8dbe124f RDI: ffffffff8bf482e0
RBP: ffffed1003ad0488 R08: 0000000000000001 R09: ffffed100d4a65bd
R10: ffff88806a532deb R11: 0000000000000000 R12: 0000000000000001
R13: ffff88801d682440 R14: ffffffff90850510 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d6adf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2e75ffff CR3: 000000004c951000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x13/0x20 arch/x86/kernel/process.c:748
 default_idle_call+0x6d/0xb0 kernel/sched/idle.c:117
 cpuidle_idle_call kernel/sched/idle.c:185 [inline]
 do_idle+0x391/0x510 kernel/sched/idle.c:325
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:423
 start_secondary+0x21d/0x2b0 arch/x86/kernel/smpboot.c:315
 common_startup_64+0x13e/0x148
 </TASK>


Tested on:

commit:         92a09c47 Linux 6.15-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10c1d0f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b39cb28b0a399ed3
dashboard link: https://syzkaller.appspot.com/bug?extid=5fe2d5bfbfbec0b675a0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13eff0f4580000

