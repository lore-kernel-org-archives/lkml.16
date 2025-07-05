Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22418269817
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751685636; cv=none; b=L7zE582+FjCLMiSjjWay5QcQtOhuzcZX7rjH+U2cl3YY9VBxrwePkGwMj4jrdXzpyYrHX7OZxNoIY8AAzKMlunTxANQ9rM0nrLj3hHCqHf5F5n7kCdxIaEPgw7kdtaJUhzjX2UNVLLjXRNnHANWjW0xwwEie9/q3ZYJg/qcPu40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751685636; c=relaxed/simple;
	bh=zZwDXQap667ELnegP7wTGLkBneiHcdIV4IyHvMHsMh0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=cJSnfC03ftp5i8vwGW7pROueZLSWPp9ED/rBZikCydTvknXW6g8q1CbrQT0XnlGwyzqW7uLtp8n6i548BPURRrVx0FHcHtuNQFcVtXwEcdokWHoFO9URRWbKA1ucBQi1cJKjL+aHilR71JSf6/60XLA5AN+qyFzFTGiUQLwYkRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3df40226ab7so32669815ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 20:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751685634; x=1752290434;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKt1RwcKjdMcd7EsDv9hpf69VqnWr85XcRCar4AQMZ8=;
        b=gM8gOHCsHtP8pcn6WDcn6XZcxgp1ZTjz9zETB9rvNgBZu3Rxtvp46NQerGDcm3GCL2
         BA19lOeoimeAd30QGOQETnClL9EqEyEt8Ehnjr63hvGk2eo9QZHzlhxIQlX6kG86MyXz
         hNWFHxz8OnyYhnJY68s2Bpic9stQl5jKIkZASUC61FzStqZzF1wEaYk42sC2MOjvdcbI
         VYfxfGxPcGMTT/lkBF+FRdqknQN08rsImbEbAWk3SZvNgmBxjWgEb4dKJjdeeg7H6CFa
         dV4RRHo8eUnzUq4W8mv+KCYgAx+PjgBUXc1rRz65zjlomNFzIwbkkNLDMttNKmqMCUci
         iv2g==
X-Forwarded-Encrypted: i=1; AJvYcCUgxg7i1AB8fBvHVzgY92Gez4kAa97RJBWNpvQ+LD77Vb/NDkYY8gZ22jc6ZzYmHTY790+5K9IKhAc8LRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgiDshoouV/zsTVCvYgHX3q4Q3AnOZdItWXjsp7u/Gkvz0Xo6x
	V9lzOn+KSlaXqHg8EqkQ+EllRNeFVwNkxvcJCQPDWem4T/4tAoJoj52n7DAfhzjJZSNU8O0Zk66
	s2s1E+uL0pQTv6/vL0dVJEI7YW9nNTtpMf5oH2ieacxvdo5M/zwro9nPYVmQ=
X-Google-Smtp-Source: AGHT+IEt0sFGRwFvBLeNL/8AZA4SWCKa/D207JDFHLCrI0TTfNhMrqrxt7NKFuB414/EOhzd8jQaf69hA6qaE3PqdmhEmS1zs97S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a85:b0:3dc:87c7:a5a6 with SMTP id
 e9e14a558f8ab-3e13ee8487dmr10058605ab.4.1751685634275; Fri, 04 Jul 2025
 20:20:34 -0700 (PDT)
Date: Fri, 04 Jul 2025 20:20:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68689a02.a00a0220.c7b3.002d.GAE@google.com>
Subject: [syzbot] [kernel?] possible deadlock in posix_clock_unregister
From: syzbot <syzbot+7cfb66a237c4a5fb22ad@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c435a4f487e8 Merge tag 'riscv-for-linus-6.16-rc5' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1563548c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9887aa986c36cc50
dashboard link: https://syzkaller.appspot.com/bug?extid=7cfb66a237c4a5fb22ad
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0f92f50c3eac/disk-c435a4f4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d15feed2dd9a/vmlinux-c435a4f4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/74b4738b6bd9/bzImage-c435a4f4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7cfb66a237c4a5fb22ad@syzkaller.appspotmail.com

ptp ptp0: delete virtual clock ptp16
======================================================
WARNING: possible circular locking dependency detected
6.16.0-rc4-syzkaller-00286-gc435a4f487e8 #0 Not tainted
------------------------------------------------------
syz.0.689/7737 is trying to acquire lock:
ffff8880356a4130 (&clk->rwsem){++++}-{4:4}, at: posix_clock_unregister+0x4d/0xd0 kernel/time/posix-clock.c:184

but task is already holding lock:
ffff88814bd10868 (&ptp->n_vclocks_mux){+.+.}-{4:4}, at: n_vclocks_store+0xf1/0x6d0 drivers/ptp/ptp_sysfs.c:215

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&ptp->n_vclocks_mux){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:747
       ptp_vclock_in_use drivers/ptp/ptp_private.h:113 [inline]
       ptp_vclock_in_use drivers/ptp/ptp_private.h:99 [inline]
       ptp_clock_freerun drivers/ptp/ptp_private.h:130 [inline]
       ptp_clock_freerun drivers/ptp/ptp_private.h:125 [inline]
       ptp_clock_adjtime+0x527/0x760 drivers/ptp/ptp_clock.c:125
       pc_clock_adjtime+0x118/0x1e0 kernel/time/posix-clock.c:239
       do_clock_adjtime kernel/time/posix-timers.c:1162 [inline]
       __do_sys_clock_adjtime+0x175/0x290 kernel/time/posix-timers.c:1174
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&clk->rwsem){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain kernel/locking/lockdep.c:3911 [inline]
       __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5240
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5828
       down_write+0x92/0x200 kernel/locking/rwsem.c:1577
       posix_clock_unregister+0x4d/0xd0 kernel/time/posix-clock.c:184
       ptp_clock_unregister+0x14f/0x250 drivers/ptp/ptp_clock.c:432
       ptp_vclock_unregister+0x11a/0x160 drivers/ptp/ptp_vclock.c:228
       unregister_vclock+0x108/0x1a0 drivers/ptp/ptp_sysfs.c:177
       device_for_each_child_reverse+0x133/0x1a0 drivers/base/core.c:4051
       n_vclocks_store+0x4b6/0x6d0 drivers/ptp/ptp_sysfs.c:241
       dev_attr_store+0x55/0x80 drivers/base/core.c:2440
       sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x354/0x510 fs/kernfs/file.c:334
       new_sync_write fs/read_write.c:593 [inline]
       vfs_write+0x6c7/0x1150 fs/read_write.c:686
       ksys_write+0x12a/0x250 fs/read_write.c:738
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ptp->n_vclocks_mux);
                               lock(&clk->rwsem);
                               lock(&ptp->n_vclocks_mux);
  lock(&clk->rwsem);

 *** DEADLOCK ***

5 locks held by syz.0.689/7737:
 #0: ffff88803578b7b8 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2a2/0x370 fs/file.c:1217
 #1: ffff88803704c428 (sb_writers#7){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:738
 #2: ffff888033abf488 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x28f/0x510 fs/kernfs/file.c:325
 #3: ffff88814bf00d28 (kn->active#60){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x2b2/0x510 fs/kernfs/file.c:326
 #4: ffff88814bd10868 (&ptp->n_vclocks_mux){+.+.}-{4:4}, at: n_vclocks_store+0xf1/0x6d0 drivers/ptp/ptp_sysfs.c:215

stack backtrace:
CPU: 1 UID: 0 PID: 7737 Comm: syz.0.689 Not tainted 6.16.0-rc4-syzkaller-00286-gc435a4f487e8 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x275/0x350 kernel/locking/lockdep.c:2046
 check_noncircular+0x14c/0x170 kernel/locking/lockdep.c:2178
 check_prev_add kernel/locking/lockdep.c:3168 [inline]
 check_prevs_add kernel/locking/lockdep.c:3287 [inline]
 validate_chain kernel/locking/lockdep.c:3911 [inline]
 __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5240
 lock_acquire kernel/locking/lockdep.c:5871 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5828
 down_write+0x92/0x200 kernel/locking/rwsem.c:1577
 posix_clock_unregister+0x4d/0xd0 kernel/time/posix-clock.c:184
 ptp_clock_unregister+0x14f/0x250 drivers/ptp/ptp_clock.c:432
 ptp_vclock_unregister+0x11a/0x160 drivers/ptp/ptp_vclock.c:228
 unregister_vclock+0x108/0x1a0 drivers/ptp/ptp_sysfs.c:177
 device_for_each_child_reverse+0x133/0x1a0 drivers/base/core.c:4051
 n_vclocks_store+0x4b6/0x6d0 drivers/ptp/ptp_sysfs.c:241
 dev_attr_store+0x55/0x80 drivers/base/core.c:2440
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x354/0x510 fs/kernfs/file.c:334
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x6c7/0x1150 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2aab98e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2aa97f6038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f2aabbb5fa0 RCX: 00007f2aab98e929
RDX: 000000000000fdef RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007f2aaba10b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f2aabbb5fa0 R15: 00007ffc2d8b7958
 </TASK>
ptp ptp0: delete virtual clock ptp15
ptp ptp0: delete virtual clock ptp14
ptp ptp0: delete virtual clock ptp13
ptp ptp0: delete virtual clock ptp12
ptp ptp0: delete virtual clock ptp11
ptp ptp0: delete virtual clock ptp10
ptp ptp0: delete virtual clock ptp9
ptp ptp0: delete virtual clock ptp8
ptp ptp0: delete virtual clock ptp7
ptp ptp0: delete virtual clock ptp6
ptp ptp0: delete virtual clock ptp5
ptp ptp0: delete virtual clock ptp4
ptp ptp0: guarantee physical clock free running


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
