Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F9728A72E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547230; cv=none; b=bwSdkWj1RDnQXIknpJgRtuzJ6Xvx8/zzTUDQGuFcNKOYm5AV6EUBV8USoKn7SfJEoq9v2+ectdpvZ9h0ioZ8Xw7/YDS5gje7mi6rCUNOrYwygQrjZIRvW9dlMmAxF6/uUg08lxIGTbXu1lSdR++5crMMGnHIBHsd/1cluj3vVWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547230; c=relaxed/simple;
	bh=RdMmxqqxbXTSf/PoIvMhdXDapxnYBHSrXaRuUfyvszA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RvOKEoPJlGm6TJvm4+VpEv+isGzayGGE99lldeHqsQgdqOPcJAlxMDpDmo/IcQPCUDWI4gCXpq5Agce0tKtd7/513l8EwZfn/WQxNjPZ8EELp7pWU67lgGWhW3cyY73qz7+68DzI0AMLwI03CWlG6NioiyXL/JKInUjf/AX6ahI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-86cf89ff625so456289139f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547228; x=1750152028;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUHMNav7UcR6weM8HjAaPubPqi522KpOlcqO78Q49FU=;
        b=U/fSXk+laNNHPF9L9FWX8i06mTnFvN7i2JfhSXu+h5qNS0i8ppksl9GfLaJCgV1ZOC
         7uXKEgGGtAjkLeKj30CSQvqrH+/I3mZBsoUjhd0x4LZ5k6oFQph+HDMbIrQ2UhuiVfsV
         JdK1ldk3BEVQvSJUKPk+ubnLl59TVedzg5tbd5MMw7c23h1xKJrryrwBT/UU15H0ouYh
         PrhAY3q4QPaHBe4KWJsxHLSWYLKkEM7BR6SyM1APhdNA/B285cnhoIUJSYp7YWooNUA4
         2Fx01I7f0y65Oaid5eNSR896U5zSqud172vHF3qLLk/ZlYE7VWpZhPWy/Sxw3XM728IA
         sHgw==
X-Forwarded-Encrypted: i=1; AJvYcCXi0kbwSh0m4NqC9gDSM8SETj/2ChulgYJz0WKkYp0YWCnO3GYU2O1b98j7n3LieRglfJu6c9nbRTggde0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt52+S2gLPH6ivUp1u/sbQuOM2SwaT1wL4zCtQG0GgSoQ198cp
	M4it9G2dnY+HE1JofnLO5zwRbM14iDa0aIUXVUgTKtdyR7lWEUr0YVvsNM47zFcFOaSonMrVQ/n
	Fi20JsRrKx+x9r5ThOrpU2erNscOIvohBWt/xxRRWBGjf+tW5cnkpUwQVlHo=
X-Google-Smtp-Source: AGHT+IFvN3v6E/zlfXGZSEPyUwGsUrUAZc+nLh6AvXhfuko06Cl+sN/fzK8WsX1Kco8G12X2Sq6dF5pLMMR1QXAs4HAS3q8htZxL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16ce:b0:3d5:893a:93ea with SMTP id
 e9e14a558f8ab-3ddce40c9c5mr143129545ab.13.1749547227712; Tue, 10 Jun 2025
 02:20:27 -0700 (PDT)
Date: Tue, 10 Jun 2025 02:20:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6847f8db.050a0220.daf97.0b04.GAE@google.com>
Subject: [syzbot] [kernel?] INFO: task hung in futex_hash_allocate
From: syzbot <syzbot+d6156c54e546fe8502c0@syzkaller.appspotmail.com>
To: andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8630c59e9936 Merge tag 'kbuild-v6.16' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16a28a0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6678e7c8a50af095
dashboard link: https://syzkaller.appspot.com/bug?extid=d6156c54e546fe8502c0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1154b20c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=123349d4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0cf3c417fa1a/disk-8630c59e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1dfe2ab6b15e/vmlinux-8630c59e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cbed08235a67/bzImage-8630c59e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d6156c54e546fe8502c0@syzkaller.appspotmail.com

INFO: task syz-executor341:6067 blocked for more than 143 seconds.
      Not tainted 6.15.0-syzkaller-13743-g8630c59e9936 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor341 state:D stack:29616 pid:6067  tgid:6065  ppid:5854   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5396 [inline]
 __schedule+0x116a/0x5de0 kernel/sched/core.c:6785
 __schedule_loop kernel/sched/core.c:6863 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6878
 futex_hash_allocate+0xd0a/0xf00 kernel/futex/core.c:1619
 futex_hash_prctl+0x1f4/0x650 kernel/futex/core.c:1757
 __do_sys_prctl+0x171f/0x24c0 kernel/sys.c:2825
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f42706752a9
RSP: 002b:00007f427060d238 EFLAGS: 00000246 ORIG_RAX: 000000000000009d
RAX: ffffffffffffffda RBX: 00007f42706ff318 RCX: 00007f42706752a9
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 000000000000004e
RBP: 00007f42706ff310 R08: 0000000000000000 R09: 00007f427060d6c0
R10: 0000000000000001 R11: 0000000000000246 R12: 00007f42706ff31c
R13: 0000000000000000 R14: 00007ffdd85d0a10 R15: 00007ffdd85d0af8
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8e3c4b40 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8e3c4b40 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8e3c4b40 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x36/0x1c0 kernel/locking/lockdep.c:6770
2 locks held by getty/5597:
 #0: ffff888035e720a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000332b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x41b/0x14f0 drivers/tty/n_tty.c:2222

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-syzkaller-13743-g8630c59e9936 #0 PREEMPT(full) 
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
 ret_from_fork+0x5d7/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-syzkaller-13743-g8630c59e9936 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:82
Code: 0b 56 02 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d b3 1e 0e 00 fb f4 <e9> 0c fb 02 00 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffffff8e007e08 EFLAGS: 000002c6
RAX: 00000000000e2ce9 RBX: 0000000000000000 RCX: ffffffff8b7bec69
RDX: 0000000000000000 RSI: ffffffff8dc134a5 RDI: ffffffff8bf55a20
RBP: fffffbfff1c12ef0 R08: 0000000000000001 R09: ffffed1017086645
R10: ffff8880b843322b R11: 0000000000000001 R12: 0000000000000000
R13: ffffffff8e097780 R14: ffffffff90883650 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888124962000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055cacddef660 CR3: 000000000e182000 CR4: 00000000003526f0
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
