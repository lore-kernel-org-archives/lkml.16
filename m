Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAE1953BB
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746307293; cv=none; b=N2tfsIiEwQAz+Pal7k5A7dD27mgeHfJS2brvzZR0PC3RvmkN6LDZtqvSLRtNyo2MnGvdo97a1VMAjolXxDpiyYpqUlDh/nEdvxoRnFjsghYPkYE8br8WjL5KIZ453fQ5PQxv7uUs5lJfTUMAxisHx+I6OX0X8t2yG6QaYpKZA5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746307293; c=relaxed/simple;
	bh=g6wIeMwtbfhf3H/rUnGNKX4+QGI2bIX8shfw81sBHls=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=swEUw7JZn/S85EKOjyh/iXgZIfQWQbtFKjh1S3bOH62hw+ylZQZTnq6XmYOi1bwhMphepJZ1dFK2qlFkXdGsxmGTxBVj0LdKNAk0+h0T44i6AbvWE3KJYnJoScKM2hCTzD6zew1yAlfXd2zjrgup+1pSqa0l5thqYHWhpRQW2dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-85ed07f832dso308032239f.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 14:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746307290; x=1746912090;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PkU/NCIfKJpQYuAiufWM4neNK5AulJjnUnPFc7igR7E=;
        b=LSMvO9wuaVI8IPB+gxVkdhhYT3rG2+ouYNf1ciU9GdNCdKAx1nFT0arYXC+Hef+uCK
         defKbvvAsLVfIT4ozz9lyv6NnxdjbeX9TOGzfbVza1TElO8Mj7GnzdkY7Z+r1+baVc7n
         EAYi8y724l/21eaGAnwkeLjKXePx17uQ/Jfc5o5WS1kgjgdK6Sqeh8OHrbnVHuC/HFkE
         LNU2wG76p5Xrml7zv1IXpWs/AKePbpaygZGqfkamJysZDNOoW8YVrX/CiAbegh8/KAF8
         I/psiRxKsKEq/kSK37a991UbYTMZrw/V1wVzeQK97g6dlEo0ZQf6v25I3/TyBL0WAVmT
         k5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCU4AN31NOLtq4rhTMk2ewp8mY5mJQJu7uUTgIcldId1UkzP2c72qSXbzeTR3zU9mb+RHo5j4uYe7wNdFjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDp3awrdL+iNCEm84l427XgX8vCUoV/3mgL+J9yn9fq2lxPqkP
	WIbxlLgkix3JaK2PJ42TFXbLc+aYjQ8K8vr/MNTsuYLHzKITE8nB2B3c9tiADlnahmBMhNGVawq
	yVOF9YB0bDcFQTcDGxyJMgskyypYPfZ4Zx49n5PtZ169UkghHz35ztpc=
X-Google-Smtp-Source: AGHT+IFd8gDhK07AL8AgBLK/KW/pZMplfeivYfXo2dpRv3FMj/yr50P1K/X5UvISIVaUjO1pP9WeYV2Wn6FcWBdefP8gS4XuG4YB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b2b:b0:3d3:fbae:3978 with SMTP id
 e9e14a558f8ab-3da56921b33mr34036985ab.9.1746307290514; Sat, 03 May 2025
 14:21:30 -0700 (PDT)
Date: Sat, 03 May 2025 14:21:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681688da.050a0220.11da1b.001c.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in dvb_usb_i2c_exit
From: syzbot <syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ca91b9500108 Merge tag 'v6.15-rc4-ksmbd-server-fixes' of g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=130c88d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ca17f2d2ba38f7a0
dashboard link: https://syzkaller.appspot.com/bug?extid=0dcc341ee61fc9e4032f
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16dc5368580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13def270580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d6e8d6537504/disk-ca91b950.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0de81a10c06a/vmlinux-ca91b950.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0e828bb2de22/bzImage-ca91b950.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com

INFO: task kworker/0:3:5829 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc4-syzkaller-00021-gca91b9500108 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:3     state:D stack:22760 pid:5829  tgid:5829  ppid:2      task_flags:0x4208060 flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_timeout+0x257/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common+0x2fc/0x4e0 kernel/sched/completion.c:116
 i2c_del_adapter+0x546/0x6f0 drivers/i2c/i2c-core-base.c:1812
 dvb_usb_i2c_exit+0x9f/0xf0 drivers/media/usb/dvb-usb/dvb-usb-i2c.c:46
 dvb_usb_exit drivers/media/usb/dvb-usb/dvb-usb-init.c:144 [inline]
 dvb_usb_device_exit+0x334/0x580 drivers/media/usb/dvb-usb/dvb-usb-init.c:338
 cxusb_probe+0x1c9/0x7d0 drivers/media/usb/dvb-usb/cxusb.c:1664
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_new_device+0xd07/0x1a20 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2eb7/0x4fa0 drivers/usb/core/hub.c:5913
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task syz-executor329:5845 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc4-syzkaller-00021-gca91b9500108 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor329 state:D stack:28168 pid:5845  tgid:5845  ppid:5817   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 __mutex_lock_common kernel/locking/mutex.c:678 [inline]
 __mutex_lock+0x6c7/0xb90 kernel/locking/mutex.c:746
 device_lock include/linux/device.h:922 [inline]
 usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
 chrdev_open+0x231/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x741/0x1c10 fs/open.c:956
 vfs_open+0x82/0x3f0 fs/open.c:1086
 do_open fs/namei.c:3880 [inline]
 path_openat+0x1e5e/0x2d40 fs/namei.c:4039
 do_filp_open+0x20b/0x470 fs/namei.c:4066
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcdf4207851
RSP: 002b:00007ffe7889bab0 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fcdf4207851
RDX: 0000000000000002 RSI: 00007ffe7889bb50 RDI: 00000000ffffff9c
RBP: 00007ffe7889bb50 R08: 000000000000000f R09: 00232d6332692f76
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe7889bf80
R13: 00007ffe7889bfa0 R14: 0000000000010006 R15: 00007ffe7889bf7c
 </TASK>
INFO: task syz-executor329:5847 blocked for more than 144 seconds.
      Not tainted 6.15.0-rc4-syzkaller-00021-gca91b9500108 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor329 state:D stack:28792 pid:5847  tgid:5847  ppid:5820   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 __mutex_lock_common kernel/locking/mutex.c:678 [inline]
 __mutex_lock+0x6c7/0xb90 kernel/locking/mutex.c:746
 device_lock include/linux/device.h:922 [inline]
 usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
 chrdev_open+0x231/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x741/0x1c10 fs/open.c:956
 vfs_open+0x82/0x3f0 fs/open.c:1086
 do_open fs/namei.c:3880 [inline]
 path_openat+0x1e5e/0x2d40 fs/namei.c:4039
 do_filp_open+0x20b/0x470 fs/namei.c:4066
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcdf4207851
RSP: 002b:00007ffe7889bab0 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fcdf4207851
RDX: 0000000000000002 RSI: 00007ffe7889bb50 RDI: 00000000ffffff9c
RBP: 00007ffe7889bb50 R08: 000000000000000f R09: 00232d6332692f76
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe7889bf80
R13: 00007ffe7889bfa0 R14: 0000000000010005 R15: 00007ffe7889bf7c
 </TASK>
INFO: task syz-executor329:5848 blocked for more than 144 seconds.
      Not tainted 6.15.0-rc4-syzkaller-00021-gca91b9500108 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor329 state:D stack:28184 pid:5848  tgid:5848  ppid:5814   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 __mutex_lock_common kernel/locking/mutex.c:678 [inline]
 __mutex_lock+0x6c7/0xb90 kernel/locking/mutex.c:746
 device_lock include/linux/device.h:922 [inline]
 usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
 chrdev_open+0x231/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x741/0x1c10 fs/open.c:956
 vfs_open+0x82/0x3f0 fs/open.c:1086
 do_open fs/namei.c:3880 [inline]
 path_openat+0x1e5e/0x2d40 fs/namei.c:4039
 do_filp_open+0x20b/0x470 fs/namei.c:4066
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcdf4207851
RSP: 002b:00007ffe7889bab0 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fcdf4207851
RDX: 0000000000000002 RSI: 00007ffe7889bb50 RDI: 00000000ffffff9c
RBP: 00007ffe7889bb50 R08: 000000000000000f R09: 00232d6332692f76
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe7889bf80
R13: 00007ffe7889bfa0 R14: 000000000000ffeb R15: 00007ffe7889bf7c
 </TASK>
INFO: task syz-executor329:5850 blocked for more than 144 seconds.
      Not tainted 6.15.0-rc4-syzkaller-00021-gca91b9500108 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor329 state:D stack:27560 pid:5850  tgid:5850  ppid:5813   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 __mutex_lock_common kernel/locking/mutex.c:678 [inline]
 __mutex_lock+0x6c7/0xb90 kernel/locking/mutex.c:746
 device_lock include/linux/device.h:922 [inline]
 usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
 chrdev_open+0x231/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x741/0x1c10 fs/open.c:956
 vfs_open+0x82/0x3f0 fs/open.c:1086
 do_open fs/namei.c:3880 [inline]
 path_openat+0x1e5e/0x2d40 fs/namei.c:4039
 do_filp_open+0x20b/0x470 fs/namei.c:4066
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcdf4207851
RSP: 002b:00007ffe7889bab0 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fcdf4207851
RDX: 0000000000000002 RSI: 00007ffe7889bb50 RDI: 00000000ffffff9c
RBP: 00007ffe7889bb50 R08: 000000000000000f R09: 00232d6332692f76
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe7889bf80
R13: 00007ffe7889bfa0 R14: 000000000000ffeb R15: 00007ffe7889bf7c
 </TASK>
INFO: task syz-executor329:5851 blocked for more than 145 seconds.
      Not tainted 6.15.0-rc4-syzkaller-00021-gca91b9500108 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor329 state:D stack:27560 pid:5851  tgid:5851  ppid:5819   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 __mutex_lock_common kernel/locking/mutex.c:678 [inline]
 __mutex_lock+0x6c7/0xb90 kernel/locking/mutex.c:746
 device_lock include/linux/device.h:922 [inline]
 usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
 chrdev_open+0x231/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x741/0x1c10 fs/open.c:956
 vfs_open+0x82/0x3f0 fs/open.c:1086
 do_open fs/namei.c:3880 [inline]
 path_openat+0x1e5e/0x2d40 fs/namei.c:4039
 do_filp_open+0x20b/0x470 fs/namei.c:4066
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcdf4207851
RSP: 002b:00007ffe7889bab0 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fcdf4207851
RDX: 0000000000000002 RSI: 00007ffe7889bb50 RDI: 00000000ffffff9c
RBP: 00007ffe7889bb50 R08: 000000000000000f R09: 00232d6332692f76
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe7889bf80
R13: 00007ffe7889bfa0 R14: 000000000001054d R15: 00007ffe7889bf7c
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8e3bf5c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8e3bf5c0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8e3bf5c0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x36/0x1c0 kernel/locking/lockdep.c:6764
2 locks held by getty/5579:
 #0: ffff8880326d60a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc90002ffe2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x41b/0x14f0 drivers/tty/n_tty.c:2222
5 locks held by kworker/0:3/5829:
 #0: ffff88801f284948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x12a2/0x1b70 kernel/workqueue.c:3213
 #1: ffffc9000412fd18 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x929/0x1b70 kernel/workqueue.c:3214
 #2: ffff888145310198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #2: ffff888145310198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1c0/0x4fa0 drivers/usb/core/hub.c:5859
 #3: ffff88807f727198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #3: ffff88807f727198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4b0 drivers/base/dd.c:1004
 #4: ffff88807ccea160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #4: ffff88807ccea160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4b0 drivers/base/dd.c:1004
4 locks held by udevd/5834:
 #0: ffff88802e1f38b8 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xe1/0x12c0 fs/seq_file.c:182
 #1: ffff88802c20a088 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x4d/0x240 fs/kernfs/file.c:154
 #2: ffff88802f69a4b8 (kn->active#18){.+.+}-{0:0}, at: kernfs_seq_start+0x71/0x240 fs/kernfs/file.c:155
 #3: ffff88807f727198 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:927 [inline]
 #3: ffff88807f727198 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
1 lock held by syz-executor329/5845:
 #0: ffff888145310198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #0: ffff888145310198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
1 lock held by syz-executor329/5847:
 #0: ffff888145310198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #0: ffff888145310198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
1 lock held by syz-executor329/5848:
 #0: ffff888145310198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #0: ffff888145310198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
1 lock held by syz-executor329/5850:
 #0: ffff888145310198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #0: ffff888145310198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
1 lock held by syz-executor329/5851:
 #0: ffff888145310198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:922 [inline]
 #0: ffff888145310198 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x8b0 drivers/usb/core/devio.c:1054
2 locks held by dhcpcd/5861:
 #0: ffff888012f64408 (&sb->s_type->i_mutex_key#11){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #0: ffff888012f64408 (&sb->s_type->i_mutex_key#11){+.+.}-{4:4}, at: __sock_release+0x86/0x270 net/socket.c:646
 #1: ffffffff8e3caaf8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock+0x280/0x3c0 kernel/rcu/tree_exp.h:304
2 locks held by dhcpcd/5862:
 #0: ffff888012f62c08 (&sb->s_type->i_mutex_key#11){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #0: ffff888012f62c08 (&sb->s_type->i_mutex_key#11){+.+.}-{4:4}, at: __sock_release+0x86/0x270 net/socket.c:646
 #1: ffffffff8e3caaf8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock+0x1a3/0x3c0 kernel/rcu/tree_exp.h:336

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-rc4-syzkaller-00021-gca91b9500108 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
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
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc4-syzkaller-00021-gca91b9500108 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:81
Code: 95 62 02 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 73 aa 1d 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffffff8e007e10 EFLAGS: 000002c6
RAX: 00000000000e2f7d RBX: 0000000000000000 RCX: ffffffff8b6c4419
RDX: 0000000000000000 RSI: ffffffff8dbdf8c1 RDI: ffffffff8bf47e20
RBP: fffffbfff1c12ee8 R08: 0000000000000001 R09: ffffed10170865bd
R10: ffff8880b8432deb R11: 0000000000000000 R12: 0000000000000000
R13: ffffffff8e097740 R14: ffffffff9084f110 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881249e4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055b05125c680 CR3: 000000000e180000 CR4: 00000000003526f0
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
