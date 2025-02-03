Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335DA209F26
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596546; cv=none; b=Mu6LvV64akrYON/lrjWLpiu3sEOqdbJ9gHrepl29kDLT1vqTpveFSgyCkgJiVofw90SzcyTRGF0WnWXY3RCjIsC/PlxyRr6S1wRYTRSjHyj1AjgpUBnbBNQbUjhWdVYlMYqNa2LNmUO6MDyy5FWazP6KRnJWgLvQmCReCqIRVk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596546; c=relaxed/simple;
	bh=6U4bDw0wUDpN2LDJ2WcNje6Bydl2lSMsualEJqFWpcI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QtdPGXsQM+27QZFGfs/IWnci/nuzLL69+/K3q3ORJ5IeLpfEkxa/Hh13NUPGt2kTB0/99zVipjfvDm9DXcqY/lJWjTqqVtCIRJMwN1TV5vhvl3scdNn5VypG2MHe8jpNMdv66lKeoqZvnfnd6d2vIkPuPuEGvbIk5ni6vRUahdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ce7b6225aeso79797005ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596543; x=1739201343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngi1jSSppLeGeL/PLc8CBq0q4ZSScYonHmSmDfHXz98=;
        b=VKpmzUvfN1YQ/gukbEU9Bip/SogTATFJgu0bkSPGYdaQuslFCEIvWI3oc0bEHFCsSa
         Uff/K6AZisWiNAp2ThKbV8yoSo7nwa3m4jXdmNcToJB9cXt9a4a+ZTjuPd4oy4O/xo7X
         8ULT0XHGW1V0HuHBBrULfiyJV393kzp5zYOeFuxF77AW4dZ/lcCvvUOwxhHdiDSaqg3P
         SrFiQWwmZ+BVrBmuoIpnFzLUuvF1k+euq5Ep+rTkOsdsXeQruw0vQubwrmaE5riPplkf
         QdYCwocp8EyeJDn4SQ++5/0eWzcys1yVSn4if2AS8if+FOhHvdzM3KN1k3DRCpFxc/C1
         Fa6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXax0GiYJqytj8EYjceXrCkhq8PL0g+Q/bTMxZRPw4vGGWO/JTynKypWbhUlPEdx4NFTgPYO7wGS0Ob4UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN3m5MUDD1M0XKEV2JaqEVUeff+gq7aOFemP7C0iCAgxEaKKyq
	MmV6QpIscxrBIXkYypy4/BEjJu6omK3ljjWPFWaXugYo9VWf+XVrWby5c2zKZEMncu9u6U5FbZr
	g5T4dI7TfbPdVAhnEFDIhlReyqVAuAOfD0CHYT09jbLNvYqpDPOy/IuE=
X-Google-Smtp-Source: AGHT+IFxrPDUYwXm5gkH2xGy7c9DyIoq7nOzwMRMShh+emiqRdK5AaNjkNUwlabUjyB8gjj/bZnYiTUvAArfe3j66XnXl2oaUxMQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20e2:b0:3a7:5cda:2769 with SMTP id
 e9e14a558f8ab-3cffe3f7030mr210361625ab.12.1738596543295; Mon, 03 Feb 2025
 07:29:03 -0800 (PST)
Date: Mon, 03 Feb 2025 07:29:03 -0800
In-Reply-To: <20250203131206.7852-1-iulia.tanasescu@nxp.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a0e0bf.050a0220.d7c5a.0099.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] INFO: task hung in hci_cmd_sync_clear (3)
From: syzbot <syzbot+217e3f1283cafe80586e@syzkaller.appspotmail.com>
To: iulia.tanasescu@nxp.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in hci_cmd_sync_clear

INFO: task syz-executor:6466 blocked for more than 143 seconds.
      Not tainted 6.13.0-rc6-syzkaller-01070-ge3d78d54bed5 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:23008 pid:6466  tgid:6466  ppid:1      flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0xe58/0x5ad0 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6848
 schedule_timeout+0x244/0x280 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common+0x3e1/0x600 kernel/sched/completion.c:116
 __flush_work+0x7d8/0xcd0 kernel/workqueue.c:4235
 __cancel_work_sync+0x10c/0x130 kernel/workqueue.c:4355
 hci_cmd_sync_clear+0x33/0x100 net/bluetooth/hci_sync.c:655
 hci_unregister_dev+0x1b8/0x620 net/bluetooth/hci_core.c:2673
 vhci_release+0x79/0xf0 drivers/bluetooth/hci_vhci.c:664
 __fput+0x3f8/0xb60 fs/file_table.c:450
 task_work_run+0x14e/0x250 kernel/task_work.c:239
 exit_task_work include/linux/task_work.h:43 [inline]
 do_exit+0xad8/0x2d70 kernel/exit.c:938
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
 get_signal+0x24ed/0x26c0 kernel/signal.c:3017
 arch_do_signal_or_restart+0x90/0x7e0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc42d97d15c
RSP: 002b:00007ffd520b4fa0 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: fffffffffffffe00 RBX: 0000000000000003 RCX: 00007fc42d97d15c
RDX: 0000000000000028 RSI: 00007ffd520b5050 RDI: 00000000000000f9
RBP: 00007ffd520b4ffc R08: 0000000000000000 R09: 0079746972756365
R10: 00007ffd520b4960 R11: 0000000000000246 R12: 0000000000000032
R13: 000000000001c55b R14: 000000000001c55b R15: 00007ffd520b5050
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/30:
 #0: ffffffff8e1bb900 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 #0: ffffffff8e1bb900 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8e1bb900 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x7f/0x390 kernel/locking/lockdep.c:6744
3 locks held by kworker/u9:0/54:
 #0: ffff888036218948 ((wq_completion)hci4){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc90000bf7d80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff888060db4d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u8:7/2902:
3 locks held by kworker/u9:1/5131:
 #0: ffff888077522148 ((wq_completion)hci3){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc90010b9fd80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff88807bb30d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
2 locks held by getty/5587:
 #0: ffff88814d3d20a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032f32f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0xfba/0x1480 drivers/tty/n_tty.c:2211
3 locks held by kworker/u9:2/5856:
 #0: ffff888036e83948 ((wq_completion)hci0){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc90003e07d80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff888076e84d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u9:3/7933:
 #0: ffff8880346e8148 ((wq_completion)hci1){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc9000d61fd80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff88807785cd80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u9:4/9148:
 #0: ffff88807c682948 ((wq_completion)hci2){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc900030afd80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff888033618d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u9:5/10363:
 #0: ffff888063410948 ((wq_completion)hci6){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc9000327fd80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff888022b24d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u9:6/11579:
 #0: ffff888012f99148 ((wq_completion)hci7){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc9000cad7d80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff888037144d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u9:7/12796:
 #0: ffff88802c062948 ((wq_completion)hci5){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc9000340fd80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff888029ba8d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u9:8/14010:
 #0: ffff88807be51948 ((wq_completion)hci8){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc900037b7d80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff88805e9c8d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u9:9/15226:
 #0: ffff888029a71148 ((wq_completion)hci9){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc900045a7d80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff88806f090d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u9:11/17656:
 #0: ffff88805f763148 ((wq_completion)hci12){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc900042e7d80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff88805f664d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u9:12/18121:
 #0: ffff8880350cd948 ((wq_completion)hci10){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc9000cd17d80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff888072b84d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
3 locks held by kworker/u9:13/19917:
 #0: ffff88806ed4f148 ((wq_completion)hci11){+.+.}-{0:0}, at: process_one_work+0x1293/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc9000d3d7d80 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff88805f968d80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x170/0x410 net/bluetooth/hci_sync.c:331
2 locks held by syz-executor/21306:

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 30 Comm: khungtaskd Not tainted 6.13.0-rc6-syzkaller-01070-ge3d78d54bed5 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x27b/0x390 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x29c/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:234 [inline]
 watchdog+0xf14/0x1240 kernel/hung_task.c:397
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 21669 Comm: syz-executor Not tainted 6.13.0-rc6-syzkaller-01070-ge3d78d54bed5 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:hlock_class+0x58/0x130 kernel/locking/lockdep.c:240
Code: 81 e3 ff 1f 0f b7 db be 08 00 00 00 48 89 d8 48 c1 e8 06 48 8d 3c c5 c0 cc e3 96 e8 a2 f1 86 00 48 0f a3 1d 2a fb 6d 15 73 13 <48> 69 c3 c8 00 00 00 5b 48 05 e0 d0 e3 96 c3 cc cc cc cc 48 c7 c0
RSP: 0000:ffffc9000d2576c8 EFLAGS: 00000047
RAX: 0000000000000001 RBX: 0000000000000037 RCX: ffffffff8175d18e
RDX: fffffbfff2dc7999 RSI: 0000000000000008 RDI: ffffffff96e3ccc0
RBP: 0000000000000000 R08: 0000000000000000 R09: fffffbfff2dc7998
R10: ffffffff96e3ccc7 R11: 0000000000000005 R12: ffffed100ba99a6b
R13: ffff88805d4cc880 R14: 0000000000000003 R15: ffff88805d4cd428
FS:  000055559111c500(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f046be3a160 CR3: 000000007dad8000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <TASK>
 __lock_acquire+0x13a6/0x3c40 kernel/locking/lockdep.c:5222
 lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5849
 rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 rcu_read_lock_sched include/linux/rcupdate.h:941 [inline]
 pfn_valid include/linux/mmzone.h:2048 [inline]
 page_table_check_set+0x11a/0x9c0 mm/page_table_check.c:110
 __page_table_check_ptes_set+0x2d0/0x3e0 mm/page_table_check.c:225
 page_table_check_ptes_set include/linux/page_table_check.h:74 [inline]
 set_ptes include/linux/pgtable.h:288 [inline]
 set_pte_range+0x30e/0x520 mm/memory.c:5067
 filemap_map_order0_folio mm/filemap.c:3615 [inline]
 filemap_map_pages+0x57b/0x16b0 mm/filemap.c:3669
 do_fault_around mm/memory.c:5280 [inline]
 do_read_fault mm/memory.c:5313 [inline]
 do_fault mm/memory.c:5456 [inline]
 do_pte_missing+0xda6/0x3e00 mm/memory.c:3979
 handle_pte_fault mm/memory.c:5801 [inline]
 __handle_mm_fault+0x103c/0x2a40 mm/memory.c:5944
 handle_mm_fault+0x3fa/0xaa0 mm/memory.c:6112
 do_user_addr_fault+0x60d/0x13f0 arch/x86/mm/fault.c:1338
 handle_page_fault arch/x86/mm/fault.c:1481 [inline]
 exc_page_fault+0x5c/0xc0 arch/x86/mm/fault.c:1539
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0033:0x7f046be3a160
Code: 68 09 00 00 00 e9 e0 fe ff ff ff 25 42 bf 2c 00 68 00 00 00 00 e9 00 00 00 00 ff 25 3a bf 2c 00 68 00 00 00 00 e9 00 00 00 00 <ff> 25 32 bf 2c 00 68 08 00 00 00 e9 b0 fe ff ff ff 25 2a bf 2c 00
RSP: 002b:00007ffcf9d60048 EFLAGS: 00010246
RAX: 00007ffcf9d60750 RBX: 00007ffcf9d605b0 RCX: 0000000000000000
RDX: 00007ffcf9d60730 RSI: 0000000000000025 RDI: 00007f046bff2d5a
RBP: 00000000fbad8001 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f046bff2d5a
R13: 00007ffcf9d60730 R14: 0000000000000000 R15: 00007ffcf9d605b0
 </TASK>


Tested on:

commit:         e3d78d54 Bluetooth: btintel: Add DSBR support for ScP
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=167675f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7bb893b6ebe535
dashboard link: https://syzkaller.appspot.com/bug?extid=217e3f1283cafe80586e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
