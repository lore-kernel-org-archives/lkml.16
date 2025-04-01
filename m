Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F88E204599
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516246; cv=none; b=W4jKkpEILrRHllgq+ShZZP5cTPJu2+SvBdlEEUXw2MDzI6uIF6OiNkIOSzNxd1816hkiGahxnUAoM2PWjSHpmUZHVioYeL4pBLJnCPFrP9OIOKahljhLAqCH9lMHp0cJPOgnB0ATzd2nX1UbpAoTFxGuRNbYdpRsaCkbTmPFA18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516246; c=relaxed/simple;
	bh=z4nr8CnbrNUM5EFxkX6/V/DzTFELbfFzRjYR0nXfFFI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V97UwmlSxPPi+XZspHnR15T+pWZ3NfwVzPd6ehvypH89a4XLzSyBe4Qa8KPlboiu0w3vG2yUGvzmzRcq4qDvgY6mMma1lRo3qJSonUFYhhk+R4WeX74hmJz1oikbn+ZyCNAOi+q2Eu1KinGRu0e07Z2YxEdS80g13u+65UF1ijA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d43b460962so103164145ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743516243; x=1744121043;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GssAW77aLxDycK5b8HNXuQS6Lr9prUFD7O9XDkrRSSI=;
        b=KjoUX//9gvUxlR5+Xa2vy7Nx3rgoX9lBgANEh9RYJ15F+O5cKC0I+ogRnt5FjusOOZ
         xA8IVXzRD47ABszOA0LY1vsyy/U3p1HxQgLl8ZiDsgGr8Pc0jgj/FRLQ6fBU+EA6FzwO
         t+17xrafOBJ+ThD74DVnxmN5lJaBeDbZsxjqbe2UdSs1rjZQnuxuSWyr7tvSsMO6l4l3
         td1gzMz8tL3+ZkEZRTRQGz3YmmaNshrI/gP6L7BTxVQRjSfdxHnBNoDCtVDk8mCYsdYn
         PiVvI7DxxF5z8LTT0PIj3IZQ+Dw78dBgXkxWJedawubnmFY3jAO6BYUTSyICDwWbtYWB
         I+jg==
X-Forwarded-Encrypted: i=1; AJvYcCWp3GVH7hJSoypbEAM1OndTK2t/WiVN8IYRf6RGqfIZSXwtU1IqEzjzHRRj+9YwseKFCg8zvWfVy60Dn94=@vger.kernel.org
X-Gm-Message-State: AOJu0YyixMavYT2Ck4fr1yVrrYQvVKUNp1eSVVc8jSZfgzaVNodbroe5
	8kEJ90mKHZkaWWZbmo1P57tb+Pdq4iO3X4RCxuizMGcfE4HgIJx3ow8ewtj/pwQKGgksH3PmYED
	Gn0BvU86BRpVrxW5jYdS6CWbSNRAA76meis1+LqXpiomosorl+5Spv6g=
X-Google-Smtp-Source: AGHT+IHJD+INJ3xRW5ZNkV0ZXLdmlZgcQ42zzTN6ny6jw5ah4GUkGZwkdYt+iJqRQs7+x3Ot/84E1ZnFP2YUnCMaJA2UPxhKT7WX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:988:b0:3d6:cbc5:a102 with SMTP id
 e9e14a558f8ab-3d6cbc5a2ffmr18941325ab.13.1743516243444; Tue, 01 Apr 2025
 07:04:03 -0700 (PDT)
Date: Tue, 01 Apr 2025 07:04:03 -0700
In-Reply-To: <tencent_CF4FA00DCAA5918DB7127CDDC95DBF190607@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ebf253.050a0220.3a8a08.001a.GAE@google.com>
Subject: Re: [syzbot] [isdn4linux?] [nilfs?] INFO: task hung in mISDN_ioctl
From: syzbot <syzbot+5d83cecd003a369a9965@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in mISDN_ioctl

INFO: task syz.2.18:6779 blocked for more than 143 seconds.
      Not tainted 6.14.0-rc6-syzkaller-00202-ga29967be967e-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.18        state:D stack:22848 pid:6779  tgid:6776  ppid:6458   task_flags:0x400140 flags:0x00000004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5378 [inline]
 __schedule+0x18bc/0x4c40 kernel/sched/core.c:6765
 __schedule_loop kernel/sched/core.c:6842 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6857
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6914
 __mutex_lock_common kernel/locking/mutex.c:662 [inline]
 __mutex_lock+0x817/0x1010 kernel/locking/mutex.c:730
 mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f192e98d169
RSP: 002b:00007f192f7e7038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f192eba5fa0 RCX: 00007f192e98d169
RDX: 0000400000001f00 RSI: 0000000080044940 RDI: 0000000000000005
RBP: 00007f192ea0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f192eba5fa0 R15: 00007ffe22850c28
 </TASK>
INFO: task syz.0.16:6793 blocked for more than 143 seconds.
      Not tainted 6.14.0-rc6-syzkaller-00202-ga29967be967e-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.16        state:D stack:23008 pid:6793  tgid:6792  ppid:6450   task_flags:0x400140 flags:0x00000004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5378 [inline]
 __schedule+0x18bc/0x4c40 kernel/sched/core.c:6765
 __schedule_loop kernel/sched/core.c:6842 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6857
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6914
 __mutex_lock_common kernel/locking/mutex.c:662 [inline]
 __mutex_lock+0x817/0x1010 kernel/locking/mutex.c:730
 mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbc5f38d169
RSP: 002b:00007fbc5e5fe038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fbc5f5a5fa0 RCX: 00007fbc5f38d169
RDX: 0000400000001f00 RSI: 0000000080044940 RDI: 0000000000000005
RBP: 00007fbc5f40e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fbc5f5a5fa0 R15: 00007ffc6882ec98
 </TASK>
INFO: task syz.4.20:6802 blocked for more than 144 seconds.
      Not tainted 6.14.0-rc6-syzkaller-00202-ga29967be967e-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.20        state:D stack:20592 pid:6802  tgid:6800  ppid:6465   task_flags:0x400140 flags:0x00000004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5378 [inline]
 __schedule+0x18bc/0x4c40 kernel/sched/core.c:6765
 __schedule_loop kernel/sched/core.c:6842 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6857
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6914
 __mutex_lock_common kernel/locking/mutex.c:662 [inline]
 __mutex_lock+0x817/0x1010 kernel/locking/mutex.c:730
 mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f358ef8d169
RSP: 002b:00007f358fdaf038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f358f1a5fa0 RCX: 00007f358ef8d169
RDX: 0000400000001f00 RSI: 0000000080044940 RDI: 0000000000000005
RBP: 00007f358f00e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f358f1a5fa0 R15: 00007ffd52b36ed8
 </TASK>
INFO: task syz.3.19:6811 blocked for more than 144 seconds.
      Not tainted 6.14.0-rc6-syzkaller-00202-ga29967be967e-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.19        state:D stack:22848 pid:6811  tgid:6810  ppid:6467   task_flags:0x400140 flags:0x00000004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5378 [inline]
 __schedule+0x18bc/0x4c40 kernel/sched/core.c:6765
 __schedule_loop kernel/sched/core.c:6842 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6857
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6914
 __mutex_lock_common kernel/locking/mutex.c:662 [inline]
 __mutex_lock+0x817/0x1010 kernel/locking/mutex.c:730
 mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f01c9f8d169
RSP: 002b:00007f01c91fe038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f01ca1a5fa0 RCX: 00007f01c9f8d169
RDX: 0000400000001f00 RSI: 0000000080044940 RDI: 0000000000000005
RBP: 00007f01ca00e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f01ca1a5fa0 R15: 00007ffe266db8c8
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8eb393e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 #0: ffffffff8eb393e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8eb393e0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x55/0x2a0 kernel/locking/lockdep.c:6746
3 locks held by kworker/u8:2/36:
 #0: ffff888030a72948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff888030a72948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_scheduled_works+0x98b/0x18e0 kernel/workqueue.c:3319
 #1: ffffc90000ac7c60 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90000ac7c60 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9c6/0x18e0 kernel/workqueue.c:3319
 #2: ffff8880b863e7d8 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:598
2 locks held by kworker/u8:6/1157:
2 locks held by getty/5577:
 #0: ffff88814d40f0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000330b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x616/0x1770 drivers/tty/n_tty.c:2211
3 locks held by kworker/0:3/5931:
 #0: ffff88801b080d48 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801b080d48 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x98b/0x18e0 kernel/workqueue.c:3319
 #1: ffffc90003887c60 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90003887c60 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_scheduled_works+0x9c6/0x18e0 kernel/workqueue.c:3319
 #2: ffff88802a029240 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x314/0x3f00 drivers/net/netdevsim/fib.c:1490
3 locks held by kworker/0:4/5932:
 #0: ffff88801b080d48 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801b080d48 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x98b/0x18e0 kernel/workqueue.c:3319
 #1: ffffc90003877c60 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90003877c60 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_scheduled_works+0x9c6/0x18e0 kernel/workqueue.c:3319
 #2: ffff888050ffb240 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x314/0x3f00 drivers/net/netdevsim/fib.c:1490
1 lock held by syz.1.17/6732:
1 lock held by syz.2.18/6779:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.0.16/6793:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.4.20/6802:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.3.19/6811:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.5.21/6885:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.6.22/6948:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.7.23/6954:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.9.25/6957:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.8.24/6960:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.1.26/6979:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.2.27/7029:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.0.28/7049:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.3.29/7058:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.4.30/7061:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.5.31/7074:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.6.32/7107:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.7.33/7156:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.8.34/7167:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.9.35/7178:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.1.36/7186:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.2.37/7198:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.0.38/7220:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.3.39/7249:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.4.40/7285:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.5.41/7301:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.6.42/7316:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.7.43/7338:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.8.44/7360:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz.9.45/7392:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
1 lock held by syz-executor/7397:
 #0: ffffffff8fec3b48 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:129 [inline]
 #0: ffffffff8fec3b48 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x47e/0x1bc0 net/ipv4/devinet.c:987
1 lock held by syz.1.46/7405:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226
3 locks held by syz-executor/7416:
 #0: ffffffff8f664c80 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 #0: ffffffff8f664c80 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8f664c80 (&ops->srcu#2){.+.+}-{0:0}, at: rtnl_link_ops_get+0x22/0x250 net/core/rtnetlink.c:564
 #1: ffffffff8fec3b48 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:79 [inline]
 #1: ffffffff8fec3b48 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:335 [inline]
 #1: ffffffff8fec3b48 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0xc55/0x1d30 net/core/rtnetlink.c:4021
 #2: ffffffff8eb3e8b8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:302 [inline]
 #2: ffffffff8eb3e8b8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x381/0x820 kernel/rcu/tree_exp.h:996
1 lock held by syz.2.47/7430:
 #0: ffffffff8fbf9fe8 (mISDN_mutex){+.+.}-{4:4}, at: mISDN_ioctl+0x96/0x840 drivers/isdn/mISDN/timerdev.c:226

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.14.0-rc6-syzkaller-00202-ga29967be967e-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
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
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 6732 Comm: syz.1.17 Not tainted 6.14.0-rc6-syzkaller-00202-ga29967be967e-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:pte_same arch/x86/include/asm/pgtable.h:999 [inline]
RIP: 0010:handle_pte_fault mm/memory.c:5917 [inline]
RIP: 0010:__handle_mm_fault+0x15ca/0x70f0 mm/memory.c:6050
Code: 40 01 00 00 48 89 f8 48 c1 e8 03 42 80 3c 28 00 74 05 e8 59 98 18 00 48 89 9c 24 40 01 00 00 48 89 df 4c 89 e6 e8 06 db b3 ff <4c> 39 e3 0f 85 76 48 00 00 48 8b 44 24 78 42 0f b6 04 28 84 c0 0f
RSP: 0018:ffffc900037e7880 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 80000000760d4825 RCX: ffff88802e7b0000
RDX: dffffc0000000000 RSI: 80000000760d4825 RDI: 80000000760d4825
RBP: ffffc900037e7cd0 R08: ffffffff820e06ca R09: fffff520006fcf00
R10: dffffc0000000000 R11: fffff520006fcf00 R12: 80000000760d4825
R13: dffffc0000000000 R14: ffffc900037e7c40 R15: ffffc900037e7be0
FS:  00007fca175306c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000400000001f00 CR3: 0000000032fb8000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <TASK>
 handle_mm_fault+0x2c1/0x7e0 mm/memory.c:6219
 do_user_addr_fault arch/x86/mm/fault.c:1388 [inline]
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x2b9/0x8b0 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:mISDN_ioctl+0x6b4/0x840 drivers/isdn/mISDN/timerdev.c:246
Code: ed f8 85 ed 78 34 48 bb 00 f0 ff ff ff 7f 00 00 48 89 df 4c 89 e6 e8 6b 07 ed f8 4c 39 e3 0f 82 82 00 00 00 0f 01 cb 0f ae e8 <41> 89 2c 24 e8 f3 04 ed f8 0f 01 ca 31 db eb 08 e8 e7 04 ed f8 48
RSP: 0018:ffffc900037e7e70 EFLAGS: 00050206
RAX: 0000000000000000 RBX: 00007ffffffff000 RCX: ffff88802e7b0000
RDX: ffff88802e7b0000 RSI: 0000400000001f00 RDI: 00007ffffffff000
RBP: 0000000000000000 R08: ffffffff88d4da65 R09: 1ffffffff28a2d2a
R10: dffffc0000000000 R11: fffffbfff28a2d2b R12: 0000400000001f00
R13: ffff888024cf3428 R14: dffffc0000000000 R15: 0000000000000000
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fca1678d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fca17530038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fca169a5fa0 RCX: 00007fca1678d169
RDX: 0000400000001f00 RSI: 0000000080044940 RDI: 0000000000000005
RBP: 00007fca1680e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fca169a5fa0 R15: 00007ffdfe8c1d78
 </TASK>


Tested on:

commit:         a29967be Merge tag 'v6.14-rc6-smb3-client-fixes' of gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12a59c3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=67fb5d057adc2bbe
dashboard link: https://syzkaller.appspot.com/bug?extid=5d83cecd003a369a9965
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15f57bcf980000

