Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C481F03D4
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748687670; cv=none; b=jOZDen7/b8Qj//F3zXv8vn17hQ/uHKqwAUy0LcZ7ns6xczVYWVzFkQ2BwihpeC01ElbtEiS8sL3TEw6CydrLIAXm+ZXWRFBIoZP9uQv0ML7T9CSMyOAU2EsGKcD7SPGlrXLRzBKj81/hSdUni/IeN+BvlfOA6f0bGzFCF41hUBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748687670; c=relaxed/simple;
	bh=p0GdD0P3oQXFyar99uyzcGnXSt+hLeX3pIWiTOrbnoY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SusGjj8YWZ5HvXR7Pg0il78P/Rk/BmayicFtP825NcnXL2X0dnovo4f6zhSPGi1Ruua19PdSeLNiLM81z+WfVrgaUEdFPoZcRV5TpEoBCK8YqtDDDsQxKhZnMGmtMrs6LfsIScs+UxXB13hpxE/UeVggBIMzHd/pQq5uLoYHcY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3dca2d01b84so54434515ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 03:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748687667; x=1749292467;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fyaBfq3PuzUJlB4yVspAzmeiDgrDTp/E2EWcEzMPoCQ=;
        b=ZSYgRQG/xnn3pE/muSK3QKcgq1yHL3r901rJn6u/ecOo7puyAswcyHtVkppXv4abiv
         ULAE9H/OHjxtRP9uMD9OMP9BEhSvvQ8AnNCunnMcG6R57FchHBswqpnX0cbCMKwo5W6U
         PGYBf+7dZab1ujfX1XsWJcfNn6wzCOaEy1pTMsTJiAbPYEmYtnWbkWkiQ8JOu09x5fFm
         ufLBWXbRD2xgbUzRozNrU6DLqCGwvY0BIJEQJvwK4Q2+k87q8civubKA6U6uBENfVjiH
         NDtj4j4JQwI8sKgJQHhWVoyO8H5II2QdrVJohqHPaqV5uy6ORnMPuEPkDzmOa5hl22+f
         N80g==
X-Gm-Message-State: AOJu0YzxU+hEnIPhsFtvsSSmS+zDHLFFNGTWZ07hBok7diPtp1l/g5ec
	JcxQhQyEMfo7pq25LAl0iELS/YRhaEjrXy+gHuP8RC4R4+frYD4C06NnwR0TLCEvscyglwPgLQp
	LztHklDlDTSP6zLZXzfudt3LJMyC29Jo2tBCfh8rXxeaWkia5ITAweHePWgxdEw==
X-Google-Smtp-Source: AGHT+IGCOeynr8b3IxV6E3XtxIF4GQvWNyUuo2GyhpfRpF21HVdFj3o/5Lcql7Vj6SVz0SzF/0/MNfsnYMNUwa4sMDaFUBbGTAVC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1569:b0:3d9:39f3:f250 with SMTP id
 e9e14a558f8ab-3dd99bf85b3mr76811025ab.3.1748687667426; Sat, 31 May 2025
 03:34:27 -0700 (PDT)
Date: Sat, 31 May 2025 03:34:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683adb33.a70a0220.1a6ae.000b.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING: bad unlock balance in copy_process
From: syzbot <syzbot+80cb3cc5c14fad191a10@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    785cdec46e92 Merge tag 'x86-core-2025-05-25' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=132bbdf4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=628e87e3a98ec1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=80cb3cc5c14fad191a10
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-785cdec4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/259338148f62/vmlinux-785cdec4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/436abe9bf6f7/bzImage-785cdec4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+80cb3cc5c14fad191a10@syzkaller.appspotmail.com

=====================================
WARNING: bad unlock balance detected!
6.15.0-syzkaller-01958-g785cdec46e92 #0 Not tainted
-------------------------------------
syz.1.441/7809 is trying to release lock (&sighand->siglock) at:
[<ffffffff817a389e>] spin_unlock include/linux/spinlock.h:391 [inline]
[<ffffffff817a389e>] copy_process+0x5d6e/0x9170 kernel/fork.c:2686
but there are no more locks to release!

other info that might help us debug this:
1 lock held by syz.1.441/7809:
 #0: ffffffff8e41c350 (cgroup_threadgroup_rwsem){++++}-{0:0}, at: copy_process+0x3de8/0x9170 kernel/fork.c:2528

stack backtrace:
CPU: 0 UID: 0 PID: 7809 Comm: syz.1.441 Not tainted 6.15.0-syzkaller-01958-g785cdec46e92 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_unlock_imbalance_bug kernel/locking/lockdep.c:5301 [inline]
 print_unlock_imbalance_bug+0x11b/0x130 kernel/locking/lockdep.c:5275
 __lock_release kernel/locking/lockdep.c:5540 [inline]
 lock_release+0x242/0x2f0 kernel/locking/lockdep.c:5892
 __raw_spin_unlock include/linux/spinlock_api_smp.h:141 [inline]
 _raw_spin_unlock+0x16/0x50 kernel/locking/spinlock.c:186
 spin_unlock include/linux/spinlock.h:391 [inline]
 copy_process+0x5d6e/0x9170 kernel/fork.c:2686
 kernel_clone+0xfc/0x960 kernel/fork.c:2859
 __do_sys_clone3+0x212/0x290 kernel/fork.c:3163
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6443fc31c9
Code: bf 08 00 48 8d 3d dc bf 08 00 e8 e2 28 f6 ff 66 90 b8 ea ff ff ff 48 85 ff 74 2c 48 85 d2 74 27 49 89 c8 b8 b3 01 00 00 0f 05 <48> 85 c0 7c 18 74 01 c3 31 ed 48 83 e4 f0 4c 89 c7 ff d2 48 89 c7
RSP: 002b:00007ffeb834dbb8 EFLAGS: 00000202 ORIG_RAX: 00000000000001b3
RAX: ffffffffffffffda RBX: 00007f6443f455b0 RCX: 00007f6443fc31c9
RDX: 00007f6443f455b0 RSI: 0000000000000058 RDI: 00007ffeb834dc00
RBP: 00007f6444dee6c0 R08: 00007f6444dee6c0 R09: 00007ffeb834dce7
R10: 0000000000000008 R11: 0000000000000202 R12: ffffffffffffffa8
R13: 000000000000000b R14: 00007ffeb834dc00 R15: 00007ffeb834dce8
 </TASK>
------------[ cut here ]------------
pvqspinlock: lock 0xffff8880245e8940 has corrupted value 0x0!
WARNING: CPU: 0 PID: 7809 at kernel/locking/qspinlock_paravirt.h:504 __pv_queued_spin_unlock_slowpath+0x237/0x330 kernel/locking/qspinlock_paravirt.h:504
Modules linked in:
CPU: 0 UID: 0 PID: 7809 Comm: syz.1.441 Not tainted 6.15.0-syzkaller-01958-g785cdec46e92 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:__pv_queued_spin_unlock_slowpath+0x237/0x330 kernel/locking/qspinlock_paravirt.h:504
Code: 03 0f b6 14 02 4c 89 e8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 67 41 8b 55 00 4c 89 ee 48 c7 c7 a0 79 8d 8b e8 ba e4 02 f6 90 <0f> 0b 90 90 e9 64 ff ff ff 90 0f 0b 48 89 df 4c 89 04 24 e8 31 e6
RSP: 0018:ffffc900034478d8 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff8880245e8940 RCX: ffffffff817a98c8
RDX: ffff8880247b0000 RSI: ffffffff817a98d5 RDI: 0000000000000001
RBP: ffff8880245e8948 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 6c6e697073717670 R12: ffff8880245e8950
R13: ffff8880245e8940 R14: 00000000fffffff4 R15: ffffc90003447d60
FS:  000055557a112500(0000) GS:ffff8880d69a6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c2dcf78 CR3: 000000003467f000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __raw_callee_save___pv_queued_spin_unlock_slowpath+0x15/0x30
 .slowpath+0x9/0x18
 pv_queued_spin_unlock arch/x86/include/asm/paravirt.h:562 [inline]
 queued_spin_unlock arch/x86/include/asm/qspinlock.h:57 [inline]
 do_raw_spin_unlock+0x172/0x230 kernel/locking/spinlock_debug.c:142
 __raw_spin_unlock include/linux/spinlock_api_smp.h:142 [inline]
 _raw_spin_unlock+0x1e/0x50 kernel/locking/spinlock.c:186
 spin_unlock include/linux/spinlock.h:391 [inline]
 copy_process+0x5d6e/0x9170 kernel/fork.c:2686
 kernel_clone+0xfc/0x960 kernel/fork.c:2859
 __do_sys_clone3+0x212/0x290 kernel/fork.c:3163
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6443fc31c9
Code: bf 08 00 48 8d 3d dc bf 08 00 e8 e2 28 f6 ff 66 90 b8 ea ff ff ff 48 85 ff 74 2c 48 85 d2 74 27 49 89 c8 b8 b3 01 00 00 0f 05 <48> 85 c0 7c 18 74 01 c3 31 ed 48 83 e4 f0 4c 89 c7 ff d2 48 89 c7
RSP: 002b:00007ffeb834dbb8 EFLAGS: 00000202 ORIG_RAX: 00000000000001b3
RAX: ffffffffffffffda RBX: 00007f6443f455b0 RCX: 00007f6443fc31c9
RDX: 00007f6443f455b0 RSI: 0000000000000058 RDI: 00007ffeb834dc00
RBP: 00007f6444dee6c0 R08: 00007f6444dee6c0 R09: 00007ffeb834dce7
R10: 0000000000000008 R11: 0000000000000202 R12: ffffffffffffffa8
R13: 000000000000000b R14: 00007ffeb834dc00 R15: 00007ffeb834dce8
 </TASK>


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
