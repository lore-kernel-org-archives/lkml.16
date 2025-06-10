Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEF912CDAE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571687; cv=none; b=dPC0qhYY3gyFT3HzNI2Qe6O5yfBzUyzjn09+XQRIuEkMispkYGBKRT6v7YZmKjvO0jCTOhopv9KTR0DfvNOUGI8zGjk30K7Tjtuu2xxNqONcBrErsM7hLKcHPh4N7NMhOFY8BHJ1HZ46Y7WvrN8x+YFy5hBPxLwhm+HpUtddSOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571687; c=relaxed/simple;
	bh=+zhwJJ9FdWL4/QCGNEb60Q5UhXjxkv80Id90K0Oqhs8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fp0nJ6rxOv7d/eDDV1e/eFG+C1SBTFsyrU8hEP4rkwoc9m4xOmvhFFLzyf+t1fLdsVzmnfcvggv1vhmuAtyiMxVBXzrCPTAYXXpEAQwhiHPQzXmJ0MrQyvwsRYmHnuhQPJ5ZV6OnbY0Prws9pECwiMbr2eGbcwcKCy3fL8EOAgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd01c6f9bso40940295ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571684; x=1750176484;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/m6ZY0KVLRGLOlyr0nZ5BNEJnDq2r1k8LmzdatenJ8=;
        b=MsJyt6ol1j03zTTjppmBJ6Q7iI53c4HdAUxq+Ca1NPdgbu2Q3LTJ2eeasPri+WIw7c
         EXHsYKRkOinfJSdzH8FcMJIqHvKLHWiqJzrFC670/TPlldHPAVBxw2uvFzQmP9f3Iso2
         KODpRIZWQiFH/qBTIcaHAqQdIDlHLGwyFYVZ3T69KOkP782nlUmnlztpKBWEGvHhWAvs
         LN/h4aNantz5jgsylXJ2x9YF4YphPBdb6+qw0MEj4Cu7gIFQFYaWY1sv6UsxrSaV/5rh
         X5RpABLOickMtTLZeX1uAB8OD5OUyOjMsj7u0uCNMbATr4gKV3M9CEmT+tXK2703Z7AA
         53GA==
X-Forwarded-Encrypted: i=1; AJvYcCVNVI2EJNGfkAjm285IUvGByv72xWYvbn0cXxlKX+O9y1ueYjiZuFB3K8yXEpOxkbPEiTclAgfalj3C4CY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxJ7jJO9UGkP2PXdK0f+zsQT5sn5aseEEQZUJ6sV0l6R64N24b
	+xJ4kCQBcgv5296K5Fd2WekK+x7KJtrqAQmk9uWvzPjbYMH94k+NwjI31ZVd4z5SaQPzlbev7lD
	2cGR4I7iUCIUyB+6V3k0VUkIoCH+9TOmYKaEe5tQn9DFgAzyVGnhk+lweC2Y=
X-Google-Smtp-Source: AGHT+IGHM2NsfMd/xBuMAeVpZ5pzqG4HbxRtvaVEg+gM1unbVp+Mtx5s/n+hiTuHBurvTxQacl8rs11wGiHN6qg3bGcUhTBX4u0k
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1688:b0:3dd:e6b2:1078 with SMTP id
 e9e14a558f8ab-3ddec8a1f15mr46880385ab.6.1749571684452; Tue, 10 Jun 2025
 09:08:04 -0700 (PDT)
Date: Tue, 10 Jun 2025 09:08:04 -0700
In-Reply-To: <20250610154730.1113-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68485864.050a0220.33aa0e.035d.GAE@google.com>
Subject: Re: [syzbot] [kernel?] INFO: task hung in futex_hash_allocate
From: syzbot <syzbot+d6156c54e546fe8502c0@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in futex_hash_allocate

INFO: task syz.0.81:6865 blocked for more than 143 seconds.
      Not tainted 6.16.0-rc1-syzkaller-gf09079bd04a9-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.81        state:D stack:29288 pid:6865  tgid:6864  ppid:6537   task_flags:0x400040 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5396 [inline]
 __schedule+0x116a/0x5de0 kernel/sched/core.c:6785
 __schedule_loop kernel/sched/core.c:6863 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6878
 futex_hash_allocate+0xd16/0xf10 kernel/futex/core.c:1619
 futex_hash_prctl+0x1f4/0x650 kernel/futex/core.c:1759
 __do_sys_prctl+0x171f/0x24c0 kernel/sys.c:2825
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f06a038e929
RSP: 002b:00007f06a12b6038 EFLAGS: 00000246 ORIG_RAX: 000000000000009d
RAX: ffffffffffffffda RBX: 00007f06a05b5fa0 RCX: 00007f06a038e929
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 000000000000004e
RBP: 00007f06a0410b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f06a05b5fa0 R15: 00007ffc811c5c98
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/u8:1/13:
1 lock held by rcu_preempt/16:
 #0: ffff8880b853bdd8 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x29/0x130 kernel/sched/core.c:606
1 lock held by khungtaskd/31:
 #0: ffffffff8e3c46c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8e3c46c0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8e3c46c0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x36/0x1c0 kernel/locking/lockdep.c:6770
2 locks held by kworker/u8:8/3529:
1 lock held by klogd/5195:
2 locks held by getty/5596:
 #0: ffff8880361ca0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000332b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x41b/0x14f0 drivers/tty/n_tty.c:2222

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.16.0-rc1-syzkaller-gf09079bd04a9-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x27b/0x390 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x29c/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:307 [inline]
 watchdog+0xf70/0x12c0 kernel/hung_task.c:470
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 36 Comm: kworker/u8:2 Not tainted 6.16.0-rc1-syzkaller-gf09079bd04a9-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: bat_events batadv_nc_worker
RIP: 0010:__lock_release kernel/locking/lockdep.c:5567 [inline]
RIP: 0010:lock_release+0x10b/0x2f0 kernel/locking/lockdep.c:5892
Code: 8d ff ff 48 85 c0 0f 84 47 01 00 00 8b 50 24 85 d2 0f 85 ae 01 00 00 66 83 78 22 1f 76 0c 66 83 68 22 20 66 83 78 22 1f 77 3c <8b> 54 24 0c 41 89 96 e8 0a 00 00 48 8b 00 49 89 86 e0 0a 00 00 41
RSP: 0018:ffffc90000ac7ae0 EFLAGS: 00000093
RAX: ffff888143ad2940 RBX: ffffffff8e3c46c0 RCX: ffffc90000ac7aec
RDX: 0000000000000000 RSI: ffffffff8e3c46c0 RDI: ffff888143ad2940
RBP: 00000000000000df R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffffffff8b492035
R13: 0000000000000206 R14: ffff888143ad1e00 R15: 0000000000000003
FS:  0000000000000000(0000) GS:ffff888124a62000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4c3ce51f98 CR3: 000000007572e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 rcu_lock_release include/linux/rcupdate.h:341 [inline]
 rcu_read_unlock include/linux/rcupdate.h:871 [inline]
 batadv_nc_purge_orig_hash net/batman-adv/network-coding.c:412 [inline]
 batadv_nc_worker+0x89a/0x1030 net/batman-adv/network-coding.c:719
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         f09079bd Merge tag 'powerpc-6.16-2' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15cb4d70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4c8362784bb7796
dashboard link: https://syzkaller.appspot.com/bug?extid=d6156c54e546fe8502c0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12534d70580000

