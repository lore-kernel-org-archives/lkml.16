Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313D01F09A5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744305937; cv=none; b=FSB3/OF6gHVCOMkD/CrDuYumpA8KPGhQgL7EYjud9Oc/RILQQuDS5jSxli8BaJTWLz5PEgbUQMg2pW7ZN31PiXtVZR818OTzKpM/6/YVa3t2g35WYaTr//O6YWh8cgoI+M2dlsJG9D9SLoGxVGzDKVMjBQOqtZNMXYH6CayeJ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744305937; c=relaxed/simple;
	bh=tLmyLWStQc1tXqAWMWEoyKk5qe3yOFsuDG+BK5A3F7A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IDQb7riltkihaKnr31FgnTcnGQ9e1qRJNp0tEf48RIWPoTNOJqc1M0zOg2k01nPc8xbS0ewxz/5h3eXFVHZXmw+zk25Kl10ev5PMEx8+VCH8qoJoOn7HM/KEN25mXvc+OOkOPcitn27kX85GERBupqR9YLZw8IIT7LjhiDDbJX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d5da4fd946so22792375ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305934; x=1744910734;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FoVgCYDUD0+uE1VYC6Sn5rqQTiN3FEiBrYJUJ1MXaZg=;
        b=NqJaK5K4oXYzdgMmwwqBJH/YbDRudT65VJQBtAW6ikdNfFUh+X66WrEmPlf797TR7+
         dXxzVbUwXJyMjhvQ3fpOjzklLtHrAFZV/tfPaeWSMwjJelaIIq40FIwPPJh8OUPqyqPp
         s4VMkAzhGxWQkdpi3C63u1jYH+ajZekOjPKpVU8b6DLEMyBAwFlXuIyAGUl+J4YoJyX8
         3ORMwtvl+EtHfuk8Kxl2Io8oMuAxx/j1m0HiBICEe5x3n/3Hve82uppc5gzVXJRyCi9F
         5/sJHmllUfe7XKynRkHscDkIbDi+LQrEjn+/tBFoe6ZaHVRnIdMfzbtiSeUMQF66Uuks
         M/Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUE2+IFvXSuFuy7H8nojNqciPOGuM2+hBwM9SYGBLxaBwAXmKi7ztBJE6+qGKUd8XjVqEte2eHa6MdrAVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGsLLt4isMK6IgUNgwHjdamTaErZu9Vr7+WX95BIc3ABaTgLdu
	l/eoUz/MlPwwfvPGdNw1W7zlKVA6IDaFMLuSvIiyv7Wik/ISqtLEQql2qSeNeHJ6hj6i67LF4rd
	6gS7fIIOj5/sUzutnmLNaUlx8dJwRjIoTqRV5BWoxEBQMHN+NUzXn/mU=
X-Google-Smtp-Source: AGHT+IHgr+FpDzW4hkFLEuJPVzDeUjF0WL9ps6DWhsmQl4JQrx/I7/WimW9x27YpejGxIFX+OdRIw33PQg1QdN7H6J5j5/e11pN0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3:b0:3d4:3fed:81f7 with SMTP id
 e9e14a558f8ab-3d7e4782225mr44049295ab.19.1744305934215; Thu, 10 Apr 2025
 10:25:34 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:25:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f7ff0e.050a0220.355867.0009.GAE@google.com>
Subject: [syzbot] [jfs?] WARNING: locking bug in release_metapage (2)
From: syzbot <syzbot+07d59279835a55269ddf@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bec7dcbc242c Merge tag 'probes-fixes-v6.14' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14245070580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eecd7902e39d7933
dashboard link: https://syzkaller.appspot.com/bug?extid=07d59279835a55269ddf
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-bec7dcbc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6dbb5378ce1a/vmlinux-bec7dcbc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f01322799bc7/bzImage-bec7dcbc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+07d59279835a55269ddf@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 32768
ERROR: (device loop0): xtSearch: XT_GETPAGE: xtree page corrupt
ERROR: (device loop0): remounting filesystem as read-only
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(!test_bit(class_idx, lock_classes_in_use))
WARNING: CPU: 0 PID: 5326 at kernel/locking/lockdep.c:5205 __lock_acquire+0xc6e/0xd80 kernel/locking/lockdep.c:5205
Modules linked in:
CPU: 0 UID: 0 PID: 5326 Comm: syz.0.0 Not tainted 6.15.0-rc1-syzkaller-00025-gbec7dcbc242c #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:__lock_acquire+0xc6e/0xd80 kernel/locking/lockdep.c:5205
Code: ff ff 90 e8 a4 67 62 03 85 c0 74 22 83 3d 5d 11 c1 0e 00 75 19 90 48 c7 c7 56 ce 4f 8e 48 c7 c6 3d de 4f 8e e8 53 79 e3 ff 90 <0f> 0b 90 90 90 45 31 ed e9 9c fe ff ff 90 0f 0b 90 e9 3f fe ff ff
RSP: 0018:ffffc9000d2e6fa0 EFLAGS: 00010046
RAX: e24de4b222594700 RBX: 0000000000000002 RCX: 0000000000100000
RDX: ffffc9000dc42000 RSI: 00000000000026e8 RDI: 00000000000026e9
RBP: 00000000ffffffff R08: ffffffff81827a12 R09: 1ffff11003f847d2
R10: dffffc0000000000 R11: ffffed1003f847d3 R12: ffff88801f72d3e0
R13: 0000000000000000 R14: ffff88801f72d3c0 R15: 0000000000000002
FS:  00007f73b3df56c0(0000) GS:ffff88808c596000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f73b86e3000 CR3: 0000000034f1c000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0xd8/0x130 kernel/locking/spinlock.c:162
 __wake_up_common_lock+0x25/0x1e0 kernel/sched/wait.c:105
 unlock_metapage fs/jfs/jfs_metapage.c:39 [inline]
 release_metapage+0x158/0xa90 fs/jfs/jfs_metapage.c:763
 xtTruncate+0x1026/0x32a0 fs/jfs/jfs_xtree.c:-1
 jfs_truncate_nolock+0x364/0x420 fs/jfs/inode.c:373
 jfs_truncate fs/jfs/inode.c:412 [inline]
 jfs_write_failed+0x11a/0x190 fs/jfs/inode.c:289
 jfs_write_begin+0x64/0x70 fs/jfs/inode.c:301
 generic_perform_write+0x329/0xa10 mm/filemap.c:4102
 generic_file_write_iter+0x10e/0x5e0 mm/filemap.c:4245
 aio_write+0x56d/0x7d0 fs/aio.c:1633
 __io_submit_one fs/aio.c:-1 [inline]
 io_submit_one+0x8a9/0x18b0 fs/aio.c:2052
 __do_sys_io_submit fs/aio.c:2111 [inline]
 __se_sys_io_submit+0x17a/0x2e0 fs/aio.c:2081
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f73b798d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f73b3df5038 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
RAX: ffffffffffffffda RBX: 00007f73b7ba5fa0 RCX: 00007f73b798d169
RDX: 0000200000000540 RSI: 0000000000000001 RDI: 00007f73b86e3000
RBP: 00007f73b7a0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f73b7ba5fa0 R15: 00007fff52080d38
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
