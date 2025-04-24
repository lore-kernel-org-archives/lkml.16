Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0117527F74E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514927; cv=none; b=dGCqm74ipstJLK9b+WxkYeG3xPLUxd4sEQU5iL7uNHffpw6XHK2gEFZ2AdYhgov84bp+aqZ7wSqCWUdMAXY9X+qPcwAvJ/kqO3HEIaglpKw9+IN5USKiDVWOwXwED7rosFrQLnDFtszMSLIlKlDXHusp76WvD+q5nNT18BA/weg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514927; c=relaxed/simple;
	bh=ODsoURPtOCXfWXpHkZsjIm/O+UNYnmTdyHRe2hbyXWQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IMjhGl99zQ3DghAzAJFE6ZRyi0a42m2/VIqpjTxrZtLSUYGJHttLlj2DAlkSxdVDdFXaasJT/NY6toQb/wMNq8N5M9RXBroK78b0vwhTfjY9ye19CjJmWvWEhjSr4w41gNtop1IVUMdhKgJQZaqNPFrSbnzRpkJo5JtpcMLRKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d817b17661so12552745ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514925; x=1746119725;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XGZkVz8IJF+8bxXCPgMkfaEEdIjgrT6wvdGLnJWVnE=;
        b=WEB4O+v6CFHHSA1pjo8di4B1xrZIHBawr6Lgiwt4Fn3iE0awNFO8v63KKIIVL42l4r
         P8uBSAVZkHc/uZ2EY+/AMTbLQCt9TKktE6sVceUgF2kcajbBx9he6FvoFyH7qpWnyLIA
         RDbUUzO2jVgzmTtAPF0PJtAdvJZIixbDdfOLn6GKnj5eJUuWqHtwVb04x8OtTIE68u1N
         J8MLrsxj6BYklLtD6QEqOJvLLUl4PJ7BgwczrcJfqeAo8iTuo50/KVnSRvM9nVZFlFcl
         jUnWdi4IgL19CNUUm+jRuDmohY7mwfl91FRGjI9qnyad/GvSC0VXhBt5mGT6Vu+7EMqY
         SEBA==
X-Forwarded-Encrypted: i=1; AJvYcCXrphZgz6bL01KDdA+oCoWJ1YtQl6Yf8H7mXp3acVCLcPMA9RoPF82SI7TLJTxqwrAKzkLmJRYF+NKLC9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/87N/y2HvGtIchP8SIj1MShDlOfC4krkAs2GAAgpbi54A9rCV
	Tl3u6K7IoUgJ+N3IRXxbLWdlUZSB2q1PXCa7vu0YHiyQQ4Hp7kOebr5VJtcTJQGBMBzJadrU8Jo
	zW49xQygnA2lfwrtzWwQ21NPNYM7gojdP23a88K/pSg6O4KAw1wBdZgA=
X-Google-Smtp-Source: AGHT+IFlr6MPgxMuLCu+ilmcRA/lIfDHJQVCojwpG2aua/B1DzaIrdtmzwREmx3rxDgbR2kDbdzz8jOddke92Hhsl2Y/rwjh2xl3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe4:b0:3d8:20f0:4026 with SMTP id
 e9e14a558f8ab-3d938e2bc6cmr4998195ab.1.1745514924930; Thu, 24 Apr 2025
 10:15:24 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:15:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680a71ac.050a0220.317436.004e.GAE@google.com>
Subject: [syzbot] [f2fs?] INFO: task hung in f2fs_fallocate (5)
From: syzbot <syzbot+d05837bec7673c4a18fe@syzkaller.appspotmail.com>
To: chao@kernel.org, edumazet@google.com, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	sven@narfation.org, sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    119009db2674 Merge tag 'vfs-6.15-rc3.fixes.2' of git://git..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12114c70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a6bd70427e8b567f
dashboard link: https://syzkaller.appspot.com/bug?extid=d05837bec7673c4a18fe
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=168cc63f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ccfbac580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2c746991d9a8/disk-119009db.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7dc89ed0561e/vmlinux-119009db.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4412f446b5ee/bzImage-119009db.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/ba3c3860bd1a/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=128cc63f980000)

The issue was bisected to:

commit 00b35530811f2aa3d7ceec2dbada80861c7632a8
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Feb 6 14:04:22 2025 +0000

    batman-adv: adopt netdev_hold() / netdev_put()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11aa263f980000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13aa263f980000
console output: https://syzkaller.appspot.com/x/log.txt?x=15aa263f980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d05837bec7673c4a18fe@syzkaller.appspotmail.com
Fixes: 00b35530811f ("batman-adv: adopt netdev_hold() / netdev_put()")

INFO: task syz-executor529:5852 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc2-syzkaller-00471-g119009db2674 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor529 state:D stack:27024 pid:5852  tgid:5847  ppid:5846   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x1b33/0x51f0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x163/0x360 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 rwsem_down_write_slowpath+0xedd/0x1420 kernel/locking/rwsem.c:1176
 __down_write_common kernel/locking/rwsem.c:1304 [inline]
 __down_write kernel/locking/rwsem.c:1313 [inline]
 down_write+0x1da/0x220 kernel/locking/rwsem.c:1578
 inode_lock include/linux/fs.h:867 [inline]
 f2fs_fallocate+0x26d/0xa10 fs/f2fs/file.c:1940
 vfs_fallocate+0x627/0x7a0 fs/open.c:338
 file_ioctl fs/ioctl.c:-1 [inline]
 do_vfs_ioctl+0x2057/0x2750 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f55dfb43589
RSP: 002b:00007f55dfad7218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f55dfbcf618 RCX: 00007f55dfb43589
RDX: 0000200000000000 RSI: 0000000040305828 RDI: 0000000000000004
RBP: 00007f55dfbcf610 R08: 00007ffec02c2d87 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f55dfb9c6f0
R13: 0000200000000140 R14: 0000200000000020 R15: 0000200000000000
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x30/0x180 kernel/locking/lockdep.c:6764
1 lock held by syslogd/5183:
2 locks held by getty/5583:
 #0: ffff88814d6370a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900036cb2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x5bb/0x1700 drivers/tty/n_tty.c:2222
5 locks held by syz-executor529/5849:
2 locks held by syz-executor529/5852:
 #0: ffff888036082420 (sb_writers#8){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3041 [inline]
 #0: ffff888036082420 (sb_writers#8){.+.+}-{0:0}, at: vfs_fallocate+0x5a1/0x7a0 fs/open.c:337
 #1: ffff888079270a38 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #1: ffff888079270a38 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: f2fs_fallocate+0x26d/0xa10 fs/f2fs/file.c:1940

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-rc2-syzkaller-00471-g119009db2674 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x4ab/0x4e0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x198/0x320 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:274 [inline]
 watchdog+0x1058/0x10a0 kernel/hung_task.c:437
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 5849 Comm: syz-executor529 Not tainted 6.15.0-rc2-syzkaller-00471-g119009db2674 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:check_preemption_disabled+0x6a/0x120 lib/smp_processor_id.c:19
Code: 00 00 00 89 d8 48 83 c4 10 5b 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 48 c7 04 24 00 00 00 00 9c 8f 04 24 f7 04 24 00 02 00 00 <74> c7 49 89 f6 49 89 ff 65 4c 8b 2c 25 08 10 65 93 41 f6 45 2f 04
RSP: 0018:ffffc90003f5f2d8 EFLAGS: 00000046
RAX: 0000000080000000 RBX: 0000000000000000 RCX: ffff888030afbc00
RDX: 0000000000000000 RSI: ffffffff8e4c7ff1 RDI: ffffffff8ca0e180
RBP: ffffffff93651020 R08: ffff88807c6bc34f R09: 1ffff1100f8d7869
R10: dffffc0000000000 R11: ffffed100f8d786a R12: ffffffff93651020
R13: 0000000000000246 R14: 00000000ffffffff R15: ffffffff8ed3df80
FS:  00007f55dfaf86c0(0000) GS:ffff888124fcf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff2eb77468 CR3: 0000000027afe000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lockdep_recursion_finish kernel/locking/lockdep.c:472 [inline]
 lock_is_held_type+0x112/0x1a0 kernel/locking/lockdep.c:5939
 lock_is_held include/linux/lockdep.h:249 [inline]
 __might_resched+0xa8/0x6c0 kernel/sched/core.c:8780
 down_read+0x90/0xa50 kernel/locking/rwsem.c:1523
 f2fs_down_read fs/f2fs/f2fs.h:2197 [inline]
 f2fs_allocate_new_section fs/f2fs/segment.c:3293 [inline]
 f2fs_allocate_pinning_section+0xac/0x4e0 fs/f2fs/segment.c:3309
 f2fs_expand_inode_data+0x6ed/0xde0 fs/f2fs/file.c:1865
 f2fs_fallocate+0x537/0xa10 fs/f2fs/file.c:1975
 vfs_fallocate+0x627/0x7a0 fs/open.c:338
 file_ioctl fs/ioctl.c:-1 [inline]
 do_vfs_ioctl+0x2057/0x2750 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f55dfb43589
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 81 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f55dfaf8218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f55dfbcf608 RCX: 00007f55dfb43589
RDX: 0000200000000140 RSI: 0000000040305828 RDI: 0000000000000005
RBP: 00007f55dfbcf600 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f55dfb9c6f0
R13: 0000200000000140 R14: 0000200000000020 R15: 0000200000000000
 </TASK>
INFO: NMI handler (nmi_cpu_backtrace_handler) took too long to run: 1.186 msecs


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
