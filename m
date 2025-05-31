Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41652904
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748670517; cv=none; b=J7kwG2Ax8p/r+Jbx9VGkWK8F7OgTomGChju70qN3YJB9Zn2GUr/OLcB9nKuyFr+x+twIO+A3sH1KeEQbBeag0wei3zA29oggeebyBGGTX71UyTOeb4Yt/+YFVHuXanYtRZ7gnrF1KqY6mQrtpISIZIEd7Vut9sYef6KlMKHz72c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748670517; c=relaxed/simple;
	bh=lPyTQkYCintK+J/uHjlxwzbx+0FWTy4lsQWJlcRGBuQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=vAxIGcDtavdKDJ/CzUvojPBXeyTKJhSQtj5FqF21PeJfZj839r57tKurwy73gATX8bdT8g4JNxhmwR5SQ8uY3mWwgqI7ClCbX4qDSKtCu12UQ0NLA72FIizZLobRUd04iZVp7LjJAYEcalXza2jl3SFJGQoL/lOh3QnxtOFXmoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3dda50c4072so304965ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748670515; x=1749275315;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5GrkFjbGOWGQqoj7uUO3SwZOTj7cvaxpo8Z4b8MpnbU=;
        b=DOn6tz00GSKRCdZr/XGHLrn9MU2CpMSUMmRgRzQSje1Q2bh6Uaky2KUUDsmdM/OxDK
         ipa/4yEfy6f71d3e7j2HRy+fpQN+893DZdiGY2Kn/dhZ3BJsEIvp7yFdinvF3rx+Ujvk
         MNHG15D5xPrFXVfKqgebAOcgzS2MuzWOSFNikosvpKCSUuI44ByN5yUWUiGZe7vUT6ev
         ISI4ljvRXyELZo3jNiI3Mpn2rIkbGPtruNyHQR1et97yunwkxCKsuKdSxjLMdRXBOZWH
         XU6Yjf6r3z2I261ETqV3wMs4Vc4ymgW3qYpcA+KVeGpvXvSWZLKJIhqol9igNXe/a2Vk
         Y90Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMpMKDCZrFM6DGNz4yRjgbnb3EY7QrUqLwbXE71NWjdktKpcteIPsERfi5T06ZNjvfbZnyO8Tcqo2iC3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAtXxVcQOoHuEvL3EmqqZhiZhX9ua6gbNMl1SK1v/W5bvwCL72
	KTxFpCDgVaL3ots3lqh3VwN31WXa+66A03hHrnLaiOqRpMG6qtWI88yXWQ4Vak6Ul+bcLG8+JnN
	h7LNGbiBmcf1FwCRNi5fpOEuBOFuOZ1U6RhE+fjgeiUvNPZsMmp5c1JjPvCE=
X-Google-Smtp-Source: AGHT+IHWo0fWF3e7kUQSh6ICUPO92zZf0OxbadAmi7SPmh+xcWsnLlZzFNOXHuZJvDZe1qkAeqntHhLSQ+yjtcGEsFbZ3RbOafPc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a07:b0:3d3:fdcc:8fb8 with SMTP id
 e9e14a558f8ab-3dd9cacc8femr40732475ab.10.1748670515058; Fri, 30 May 2025
 22:48:35 -0700 (PDT)
Date: Fri, 30 May 2025 22:48:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683a9833.a70a0220.1a6ae.000a.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in dvb_usbv2_probe
From: syzbot <syzbot+f3f24bbe63f3f6db9f44@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0ff41df1cb26 Linux 6.15
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11da7882580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=571e39fe0fe37177
dashboard link: https://syzkaller.appspot.com/bug?extid=f3f24bbe63f3f6db9f44
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1792bdf4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15da7882580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5b209251a36a/disk-0ff41df1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b131e0608f41/vmlinux-0ff41df1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9c56b87a1388/bzImage-0ff41df1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f3f24bbe63f3f6db9f44@syzkaller.appspotmail.com

INFO: task kworker/1:0:24 blocked for more than 143 seconds.
      Not tainted 6.15.0-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:0     state:D stack:21448 pid:24    tgid:24    ppid:2      task_flags:0x4208060 flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6860
 schedule_timeout+0x9a/0x270 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common kernel/sched/completion.c:116 [inline]
 wait_for_common kernel/sched/completion.c:127 [inline]
 wait_for_completion+0x2bf/0x5d0 kernel/sched/completion.c:148
 i2c_del_adapter+0x581/0x6e0 drivers/i2c/i2c-core-base.c:1812
 dvb_usbv2_probe+0x4ae/0x41a0 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:993
 usb_probe_interface+0x641/0xbc0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c1/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_new_device+0xa39/0x16c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
5 locks held by kworker/1:0/24:
 #0: ffff888021282148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff888021282148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
 #1: ffffc900001e7c60 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc900001e7c60 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
 #2: ffff88802805d198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #2: ffff88802805d198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a00 drivers/usb/core/hub.c:5859
 #3: ffff8880279db198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #3: ffff8880279db198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1004
 #4: ffff8880279de160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #4: ffff8880279de160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1004
1 lock held by khungtaskd/31:
 #0: ffffffff8df3dee0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8df3dee0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8df3dee0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6764
2 locks held by getty/5582:
 #0: ffff88814c8770a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000333b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
4 locks held by udevd/5836:
 #0: ffff888033995e80 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xb7/0xe10 fs/seq_file.c:182
 #1: ffff888032071c88 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x55/0x3c0 fs/kernfs/file.c:154
 #2: ffff888033fb41e8 (kn->active#26){.+.+}-{0:0}, at: kernfs_seq_start+0x75/0x3c0 fs/kernfs/file.c:155
 #3: ffff8880279db198 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:927 [inline]
 #3: ffff8880279db198 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:274 [inline]
 watchdog+0xfee/0x1030 kernel/hung_task.c:437
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:pv_native_safe_halt+0x13/0x20 arch/x86/kernel/paravirt.c:81
Code: 43 d4 02 00 cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 63 7f 18 00 f3 0f 1e fa fb f4 <e9> 18 d4 02 00 cc cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffffff8dc07d80 EFLAGS: 000002c6
RAX: 22e8c235b9a2e600 RBX: ffffffff81977028 RCX: 22e8c235b9a2e600
RDX: 0000000000000001 RSI: ffffffff8d73aab2 RDI: ffffffff8bc12240
RBP: ffffffff8dc07ec0 R08: ffff8880b8832b5b R09: 1ffff1101710656b
R10: dffffc0000000000 R11: ffffed101710656c R12: ffffffff8f7e0b70
R13: 0000000000000000 R14: 0000000000000000 R15: 1ffffffff1b92a48
FS:  0000000000000000(0000) GS:ffff8881260f6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005650a6dfa660 CR3: 000000000dd38000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x13/0x20 arch/x86/kernel/process.c:748
 default_idle_call+0x74/0xb0 kernel/sched/idle.c:117
 cpuidle_idle_call kernel/sched/idle.c:185 [inline]
 do_idle+0x1e8/0x510 kernel/sched/idle.c:325
 cpu_startup_entry+0x44/0x60 kernel/sched/idle.c:423
 rest_init+0x2de/0x300 init/main.c:743
 start_kernel+0x470/0x4f0 init/main.c:1099
 x86_64_start_reservations+0x2a/0x30 arch/x86/kernel/head64.c:513
 x86_64_start_kernel+0x66/0x70 arch/x86/kernel/head64.c:494
 common_startup_64+0x13e/0x147
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
