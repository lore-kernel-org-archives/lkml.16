Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8914C154457
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749134165; cv=none; b=iGapE/CQBIgriumT0SpRyclyCEEMAentSGZVwOmZYSGSHQ4wI8OKadct0XjBReubwiCFwd/zayfbSbpycyRyNVmLOcF4VjcClrZu/IPBCKffy9VOxNuM6sjssmgGs/DfxFRQH1khOAejNnwbgyRmSkhjVsxm3fiFNY6kdpG8xUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749134165; c=relaxed/simple;
	bh=xNgWHesA4MpAxyzyjfbvxsgN2h1+0cInSmxdKAuSg+o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=N/1OWzBaf/pWC7bL81UhS8W/lkBtzPHjoNlp6IykrcKGr89VcVnMrDzsMwRZwef6xNC0KzuJTCNF6x2KfULjljMaIt3BLNET8gVIUtG/G2HonJWtHfJMWvdwJl3CjKXq9Ryuh6K9I4bb0OfSUS9ZqJB3QRdpjjvtGNlIeNYUkFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddc158b78aso12811915ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 07:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749134162; x=1749738962;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwNez352C+0vLnrjKDxvQz6y/XZ5LQqbLNXM7j73vXA=;
        b=Ifcy0JEShJXmOPKdeHBC4UoYjHfV8wC4aPpvO7CGpD+m06tyn3xcrYGOajDZoX9OCW
         GEmnsh59LQ1EvNPYPyGbHgbTakiU0EUoosVDF6IjC4KmOrHwH8aGkDpP0WNPNnJJzTCA
         0xGqbXmgQXPEC44S+OKKtCYBwDmFI0k0SLH08DW96I4z1omzmv9mz+eV5fANvCDdS8r3
         zE/FlWjIBwHht+7varZiA+KBcGEN13SbFzAtPufSfXwJRn9USVTauGPGvVIBrsW9/ssC
         oS5EVazJy05HXmR+57UzpyuqQ62DIlWovAW+XzmcCLTslVYL6n1V/U2xzn1qF1nZlzQm
         Rf4w==
X-Forwarded-Encrypted: i=1; AJvYcCWDOgPZEaBPmHaAPi5YLXspK4M3c+DO0npWRH5chAIzITrqBxsiWpPYTywCNIFmBd94i7P2VlKZZg1O17c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQWylmejwEvjlonHmU09kjhaaUQOGSYHeZyR9P413BGyA8oT9L
	X8ieZgY3Yav6EqgmJXbVFT+BurDpfv+QdhS39QfnuFR7ffLbhC+ZRg3/1EaVpLnvlyXNOc/935g
	C5OFaWD2wp1qUwdPSDGnMxuhczCEdZCqqzsres3pNV9HcyAtxHqeadwnrezw=
X-Google-Smtp-Source: AGHT+IEgV7VFustUpAl0/PS6HgiAGzZsDGwGcIoNzCutuqWG0mtUcCjw/VNJONoAgX50gAG6IC9yk0cLl1XE2EK7IzAL9w9CbqJR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:398e:b0:3dd:b726:cc52 with SMTP id
 e9e14a558f8ab-3ddbece8c89mr91335225ab.5.1749134162620; Thu, 05 Jun 2025
 07:36:02 -0700 (PDT)
Date: Thu, 05 Jun 2025 07:36:02 -0700
In-Reply-To: <a4c7f11b-b503-4525-adb4-2d7263292614@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6841ab52.a00a0220.d4325.001e.GAE@google.com>
Subject: Re: [syzbot] [gfs2?] KASAN: slab-use-after-free Read in gfs2_invalidate_folio
From: syzbot <syzbot+3a36aeabd31497d63f6e@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in block_invalidate_folio

INFO: task kworker/0:1H:152 blocked for more than 143 seconds.
      Not tainted 6.15.0-syzkaller-12141-gec7714e49479-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:1H    state:D stack:28456 pid:152   tgid:152   ppid:2      task_flags:0x4208060 flags:0x00004000
Workqueue: gfs2-glock/syz:syz glock_work_func
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5396 [inline]
 __schedule+0x116a/0x5de0 kernel/sched/core.c:6785
 __schedule_loop kernel/sched/core.c:6863 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6878
 io_schedule+0xbf/0x130 kernel/sched/core.c:7723
 bit_wait_io+0x15/0xe0 kernel/sched/wait_bit.c:247
 __wait_on_bit_lock+0x112/0x1a0 kernel/sched/wait_bit.c:90
 out_of_line_wait_on_bit_lock+0xd9/0x110 kernel/sched/wait_bit.c:117
 wait_on_bit_lock_io include/linux/wait_bit.h:221 [inline]
 __lock_buffer fs/buffer.c:71 [inline]
 lock_buffer include/linux/buffer_head.h:434 [inline]
 discard_buffer fs/buffer.c:1612 [inline]
 block_invalidate_folio+0x56c/0x600 fs/buffer.c:1669
 folio_invalidate mm/truncate.c:140 [inline]
 truncate_cleanup_folio+0x2f6/0x490 mm/truncate.c:160
 truncate_inode_pages_range+0x24e/0xe50 mm/truncate.c:379
 rgrp_go_inval+0x1a4/0x210 fs/gfs2/glops.c:239
 do_xmote+0x9ca/0xf70 fs/gfs2/glock.c:759
 run_queue+0x4c4/0x6d0 fs/gfs2/glock.c:871
 glock_work_func+0x127/0x4d0 fs/gfs2/glock.c:1096
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d7/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task syz-executor.0:5338 blocked for more than 143 seconds.
      Not tainted 6.15.0-syzkaller-12141-gec7714e49479-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.0  state:D stack:24136 pid:5338  tgid:5338  ppid:1      task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5396 [inline]
 __schedule+0x116a/0x5de0 kernel/sched/core.c:6785
 __schedule_loop kernel/sched/core.c:6863 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6878
 schedule_timeout+0x257/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common+0x2fc/0x4e0 kernel/sched/completion.c:116
 __flush_work+0x7d7/0xcc0 kernel/workqueue.c:4246
 gfs2_clear_rgrpd+0x28d/0x330 fs/gfs2/rgrp.c:731
 gfs2_put_super+0x4a1/0x780 fs/gfs2/super.c:637
 generic_shutdown_super+0x153/0x390 fs/super.c:643
 kill_block_super+0x3b/0x90 fs/super.c:1753
 gfs2_kill_sb+0x371/0x420 fs/gfs2/ops_fstype.c:1798
 deactivate_locked_super+0xc1/0x1a0 fs/super.c:474
 deactivate_super fs/super.c:507 [inline]
 deactivate_super+0xde/0x100 fs/super.c:503
 cleanup_mnt+0x225/0x450 fs/namespace.c:1417
 task_work_run+0x150/0x240 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xeb/0x110 kernel/entry/common.c:114
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x3f6/0x4c0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd41ae7f197
RSP: 002b:00007ffc04a0b268 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007fd41aec93b9 RCX: 00007fd41ae7f197
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc04a0b320
RBP: 00007ffc04a0b320 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffc04a0c3e0
R13: 00007fd41aec93b9 R14: 000000000000f02b R15: 0000000000000001
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/41:
 #0: ffffffff8dfc0140 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8dfc0140 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8dfc0140 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x36/0x1c0 kernel/locking/lockdep.c:6770
2 locks held by kworker/0:1H/152:
 #0: ffff888021117148 ((wq_completion)gfs2-glock/syz:syz){+.+.}-{0:0}, at: process_one_work+0x12a2/0x1b70 kernel/workqueue.c:3213
 #1: ffffc9000305fd10 ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{0:0}, at: process_one_work+0x929/0x1b70 kernel/workqueue.c:3214
2 locks held by getty/5001:
 #0: ffff88802b11f0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900000db2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x41b/0x14f0 drivers/tty/n_tty.c:2222
1 lock held by syz-executor.0/5338:
 #0: ffff888023eb40e0 (&type->s_umount_key#66){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
 #0: ffff888023eb40e0 (&type->s_umount_key#66){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
 #0: ffff888023eb40e0 (&type->s_umount_key#66){+.+.}-{4:4}, at: deactivate_super fs/super.c:506 [inline]
 #0: ffff888023eb40e0 (&type->s_umount_key#66){+.+.}-{4:4}, at: deactivate_super+0xd6/0x100 fs/super.c:503

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 41 Comm: khungtaskd Not tainted 6.15.0-syzkaller-12141-gec7714e49479-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x27b/0x390 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x29c/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:307 [inline]
 watchdog+0xfd1/0x1760 kernel/hung_task.c:470
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d7/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0,2-3:
NMI backtrace for cpu 3
CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Not tainted 6.15.0-syzkaller-12141-gec7714e49479-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:82
Code: 7b 57 02 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 43 c0 1e 00 fb f4 <e9> 7c fa 02 00 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffc90000197df8 EFLAGS: 00000282
RAX: 0000000000076507 RBX: 0000000000000003 RCX: ffffffff8b4b4c79
RDX: 0000000000000000 RSI: ffffffff8d925e13 RDI: ffffffff8bd436e0
RBP: ffffed10030d3000 R08: 0000000000000001 R09: ffffed100d66664d
R10: ffff88806b33326b R11: 0000000000000001 R12: 0000000000000003
R13: ffff888018698000 R14: ffffffff9037c950 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d7e50000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7be17576e8 CR3: 0000000025b50000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x13/0x20 arch/x86/kernel/process.c:743
 default_idle_call+0x6d/0xb0 kernel/sched/idle.c:117
 cpuidle_idle_call kernel/sched/idle.c:185 [inline]
 do_idle+0x391/0x510 kernel/sched/idle.c:325
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:423
 start_secondary+0x21d/0x2b0 arch/x86/kernel/smpboot.c:315
 common_startup_64+0x13e/0x148
 </TASK>
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-syzkaller-12141-gec7714e49479-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:82
Code: 7b 57 02 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 43 c0 1e 00 fb f4 <e9> 7c fa 02 00 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffffff8dc07e08 EFLAGS: 00000282
RAX: 00000000000c0e89 RBX: 0000000000000000 RCX: ffffffff8b4b4c79
RDX: 0000000000000000 RSI: ffffffff8d925e13 RDI: ffffffff8bd436e0
RBP: fffffbfff1b92ef0 R08: 0000000000000001 R09: ffffed100d60664d
R10: ffff88806b03326b R11: 0000000000000001 R12: 0000000000000000
R13: ffffffff8dc97780 R14: ffffffff9037c950 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d7b50000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fad04958b18 CR3: 000000000dd82000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x13/0x20 arch/x86/kernel/process.c:743
 default_idle_call+0x6d/0xb0 kernel/sched/idle.c:117
 cpuidle_idle_call kernel/sched/idle.c:185 [inline]
 do_idle+0x391/0x510 kernel/sched/idle.c:325
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:423
 rest_init+0x16b/0x2b0 init/main.c:744
 start_kernel+0x3ee/0x4d0 init/main.c:1101
 x86_64_start_reservations+0x18/0x30 arch/x86/kernel/head64.c:307
 x86_64_start_kernel+0x130/0x190 arch/x86/kernel/head64.c:288
 common_startup_64+0x13e/0x148
 </TASK>
NMI backtrace for cpu 2
CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Not tainted 6.15.0-syzkaller-12141-gec7714e49479-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:82
Code: 7b 57 02 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 43 c0 1e 00 fb f4 <e9> 7c fa 02 00 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffc90000187df8 EFLAGS: 00000282
RAX: 000000000006f871 RBX: 0000000000000002 RCX: ffffffff8b4b4c79
RDX: 0000000000000000 RSI: ffffffff8d925e13 RDI: ffffffff8bd436e0
RBP: ffffed1003051910 R08: 0000000000000001 R09: ffffed100d64664d
R10: ffff88806b23326b R11: 0000000000000001 R12: 0000000000000002
R13: ffff88801828c880 R14: ffffffff9037c950 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d7d50000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fad04915480 CR3: 00000000334de000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x13/0x20 arch/x86/kernel/process.c:743
 default_idle_call+0x6d/0xb0 kernel/sched/idle.c:117
 cpuidle_idle_call kernel/sched/idle.c:185 [inline]
 do_idle+0x391/0x510 kernel/sched/idle.c:325
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:423
 start_secondary+0x21d/0x2b0 arch/x86/kernel/smpboot.c:315
 common_startup_64+0x13e/0x148
 </TASK>


Tested on:

commit:         ec7714e4 Merge tag 'rust-6.16' of git://git.kernel.org..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17a9e570580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b90d4aac37eea48
dashboard link: https://syzkaller.appspot.com/bug?extid=3a36aeabd31497d63f6e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14a2d282580000

