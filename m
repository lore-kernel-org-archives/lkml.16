Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE7B25C832
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357302; cv=none; b=ZuSnLPQCMW3+rLrLEvbBrjU+ZqVyfS8LRROiKYHg12bPBZEWTW4C53gZ2JzcVZQK24G2wHABX3mzbjeV9SnsTEtHYGCeNvH4YbinPh+7xumPomsM58yfYwXNh70Rswx+tBzzNU/VDtYyrYbTBDp9FbuBOo8mCpcQj+j3WKX7Yt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357302; c=relaxed/simple;
	bh=TOEieAQ6+BDN9UDChQtQp1yz1EcYoDIM1LqXJUIs5c0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qqATPApgQlE3rqMZ54LphotS5gGMSAKS4nWroC6WIR1I5oi7moUuegUMxk719cBetu1TPqhrilcGHyINI0OvAMztCHoGrujhvw/nsT+ysLAHs5OH19VbceZ1Vxxnm3OuZussfdnXOMr9E5FbSgVMcJWVQa9uzPGXqJJyHDt1+hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d6e10f4b85so107508185ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745357299; x=1745962099;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8YIgViX41lm5hSSWGRYMyiCZwtaF1138kJCcGLw6638=;
        b=a3zmwnwkyPx+cmyIjfreXg/R1hgNZbVd6Mt4ik8qfyZydlhu9cOx9M0p0VgIguqx2j
         nyiR2bUD1eBw6GSHpZzC7IZBxdN9s1tiEWAowYVcOxHpm6QbWuFge+Nj/G5kI/gXTZaJ
         an0gyIOGowXYDh5etRBM0mN9zWmublNyEVBGTc2zJKqI55py+J2wKWEnMxxbEOqDIOUQ
         yFySB4ppkgQdqcZh7nCnaGuqmX9yE6TS+VaI3uBuqpE1VrFE4F1ziPPqjyUlT394Qi+M
         Jnd/oR4jx9Tcd8yKm9hQZma78ZLpeAYDW3lBl2ASqc/ACnuudRHU7wFBPe6T4R39c9Br
         58fA==
X-Forwarded-Encrypted: i=1; AJvYcCVdPrX8iJwIPwZ5xbpNyJhT1I4uUvIRjy5yTtLh0hEDX5qQ/DSwSRFro76LeyI5R7eir5g+A1AI5NkCH94=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF7o/RLnvZrFWJR6YOcRVUYIDAx1EmSP86Sp5ptv8zsx/SiTI8
	Q+AEGPMwGFjpOvHkh0q+nZZwM0wmQHN8fuHER+X37iOvoswctkXAX39L8qZ9sF4B9Pqpxz1/3XI
	2R6ySMT/EAuyoIBrhkvPlrzBjehubzC+DnqPv4whvktlZy8VmxoAxqEA=
X-Google-Smtp-Source: AGHT+IF+9Wq/qdOpUFNtHkZvl/Y43s4FqJvhE2ZTuHkDYJ84EnUYRNM16+4GRyOwE4mhmXaya8qZJl9H3HUVGlRIr5MYPJFeOSQe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c24f:0:b0:3d0:19c6:c9e1 with SMTP id
 e9e14a558f8ab-3d88ee00454mr164020995ab.13.1745357299420; Tue, 22 Apr 2025
 14:28:19 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:28:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680809f3.050a0220.36a438.0003.GAE@google.com>
Subject: [syzbot] [fs?] INFO: task hung in vfs_rename (2)
From: syzbot <syzbot+321477fad98ea6dd35b7@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fc96b232f8e7 Merge tag 'pci-v6.15-fixes-2' of git://git.ke..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10c65fe4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=170d968a88ba5c06
dashboard link: https://syzkaller.appspot.com/bug?extid=321477fad98ea6dd35b7
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11075470580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13a6063f980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fd977d7e57de/disk-fc96b232.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ffa0a3b5b655/vmlinux-fc96b232.xz
kernel image: https://storage.googleapis.com/syzbot-assets/44df3bd100d2/bzImage-fc96b232.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/b166f1d5e115/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=12655204580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+321477fad98ea6dd35b7@syzkaller.appspotmail.com

INFO: task syz-executor362:5849 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc2-syzkaller-00278-gfc96b232f8e7 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor362 state:D stack:24280 pid:5849  tgid:5849  ppid:5848   task_flags:0x400140 flags:0x00004006
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
 vfs_rename+0x6b9/0xf10 fs/namei.c:5051
 do_renameat2+0xc8d/0x1290 fs/namei.c:5235
 __do_sys_renameat2 fs/namei.c:5269 [inline]
 __se_sys_renameat2 fs/namei.c:5266 [inline]
 __x64_sys_renameat2+0xce/0xe0 fs/namei.c:5266
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc3678ce519
RSP: 002b:00007ffc519cacb8 EFLAGS: 00000246 ORIG_RAX: 000000000000013c
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fc3678ce519
RDX: 0000000000000004 RSI: 0000200000000240 RDI: 0000000000000004
RBP: 0000000000000000 R08: 0000000000000000 R09: 00007ffc519cacf0
R10: 00002000000001c0 R11: 0000000000000246 R12: 00007ffc519cacf0
R13: 00007ffc519caf78 R14: 431bde82d7b634db R15: 00007fc36791703b
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x30/0x180 kernel/locking/lockdep.c:6764
2 locks held by getty/5587:
 #0: ffff8880366f20a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900036d62f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x5bb/0x1700 drivers/tty/n_tty.c:2222
6 locks held by syz-executor362/5849:
 #0: ffff88807f054420 (sb_writers#8){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88807f054730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3234 [inline]
 #1: ffff88807f054730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5d6/0x1290 fs/namei.c:5181
 #2: ffff88807b3e8910 (&sb->s_type->i_mutex_key#14/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff88807b3e8910 (&sb->s_type->i_mutex_key#14/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3210
 #3: ffff88807b2b8910 (&sb->s_type->i_mutex_key#14/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff88807b2b8910 (&sb->s_type->i_mutex_key#14/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3211
 #4: ffff88807b2b82a0 (&sb->s_type->i_mutex_key#14/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff88807b2b82a0 (&sb->s_type->i_mutex_key#14/2){+.+.}-{4:4}, at: vfs_rename+0x63f/0xf10 fs/namei.c:5049
 #5: ffff88807b2b8910 (&sb->s_type->i_mutex_key#14){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff88807b2b8910 (&sb->s_type->i_mutex_key#14){++++}-{4:4}, at: vfs_rename+0x6b9/0xf10 fs/namei.c:5051

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-rc2-syzkaller-00278-gfc96b232f8e7 #0 PREEMPT(full) 
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
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc2-syzkaller-00278-gfc96b232f8e7 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:pv_native_safe_halt+0x13/0x20 arch/x86/kernel/paravirt.c:81
Code: cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 73 5f 20 00 f3 0f 1e fa fb f4 <c3> cc cc cc cc cc cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffffff8ea07d60 EFLAGS: 000002c2
RAX: 5fa1c341e9d1cd00 RBX: ffffffff8197267e RCX: ffffffff8c27d93c
RDX: 0000000000000001 RSI: ffffffff8e6356dd RDI: ffffffff8ca0e2e0
RBP: ffffffff8ea07eb8 R08: ffff8880b8632b5b R09: 1ffff110170c656b
R10: dffffc0000000000 R11: ffffed10170c656c R12: 1ffffffff1d40fc6
R13: 1ffffffff1d52cb0 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124fcf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005597c9480600 CR3: 000000000eb38000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x13/0x20 arch/x86/kernel/process.c:748
 default_idle_call+0x74/0xb0 kernel/sched/idle.c:117
 cpuidle_idle_call kernel/sched/idle.c:185 [inline]
 do_idle+0x22e/0x5d0 kernel/sched/idle.c:325
 cpu_startup_entry+0x42/0x60 kernel/sched/idle.c:423
 rest_init+0x2dc/0x300 init/main.c:743
 start_kernel+0x484/0x510 init/main.c:1099
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
