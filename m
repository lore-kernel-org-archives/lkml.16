Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530CE239E95
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694362; cv=none; b=mOO9phGh+wlN/UW7c57/57nO2TvUvU3j3K1A7yfm99RUg3QS8B47wSqNyh2L8ymY0lIe+55tM1F2unvCnLbxqHJ0Mkl7RKmK1Vej34rhdf+nUHOUgBXxO+5ozdy3VJtaYSSAJX18TDngH5Vp7pnLq5bovmYEcHJSimj6nxwKB44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694362; c=relaxed/simple;
	bh=Y5OoOFqzBwXhZcTP5+FQKVU18wxPEnZPvWFKQRerFRk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tHSXCDS4vNQS7+XQWcci5kQKA9xRxW8K8mr8+sBn6257EiHikYp1ipuH75o75UEBuYQrAxYYkHj9mIJel0V+fA6W5IU01vBvU/vWPRFMBEn6angu2d2DmicPiP+IWHeqLsDagGaR3GurXqngkUQkU+AKvppW4OPF7NKk8OhzXfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3da741bcf90so7066635ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694359; x=1747299159;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCLNC4atFd3LqE75nIlkkiMnyAwzhYa/SNx//fNd3fc=;
        b=hoA6TXQcVN1WkE5KyL82cs3moj4xLtduBLm+5IazFWGLAzCusi7dRZrlD9Q0qEZb8+
         Im+ZYvTuDb4HMe8Ews6vO7SnWZdURyYY0FTkvQXtCTPrxGdM5lqnAMYIvJzJF+CeqX2E
         kAfsYpuYmuDyqu3nHSjJ8aDEBoJtHf/tGM8v8W05ZZlkjgUddBm5h/9gU1YX2VvQ9ixW
         UDaTx/CaJHt7isTA4l35I/QhJLcwAIoRZuiPbRifGEdevl2dMHl+u5yJtwpT+oDlPaQd
         7HUVQiGWmR6Bf4K8jBcv7mE96+Xf+Th4tMl7gFNpbDZ0v8YfE4y8LKosls8SJ9PdOW24
         /usA==
X-Forwarded-Encrypted: i=1; AJvYcCXKqM3kBBF0m+f8Unj85aPPWjEsgG34s27a61j0zPdx6ZIceyg/P67uuGT7PkqLyD5lMBY5PJ5HrPuhMJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUhoucA2d8ahrIDQ5x2hM8u3kQj9NmCqqi7Vo0lZd4Jtf9v8U9
	tuAH2ukVpmX9zeGX5zNTUW7g1+z7AeSRUoZht0QVGJZH0KXc9L33su+tZ5qpexmDGFYkQQq8W/V
	973a1KK3FgHbRLlRhiGKdv+mfnuhllz+N+LzuT1OwUywlDTIanhHCnP0=
X-Google-Smtp-Source: AGHT+IEdBijYqwvtFUTFAnBGsdYw02iX9YG/qYh3jDOPB2xOeZhHpAN5PvNSYzBNSzZEkgUB1MI+pQuCWcPjXgDZowcHeWnpciFZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c04:b0:3cf:bc71:94f5 with SMTP id
 e9e14a558f8ab-3da785a4da8mr32339985ab.22.1746694359494; Thu, 08 May 2025
 01:52:39 -0700 (PDT)
Date: Thu, 08 May 2025 01:52:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681c70d7.050a0220.a19a9.00c7.GAE@google.com>
Subject: [syzbot] [ntfs3?] possible deadlock in ntfs_unlink_inode (2)
From: syzbot <syzbot+dab475abf94f7513eb9f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2a239ffbebb5 Merge tag 'sound-6.15-rc5' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=157fe0f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a42a9d552788177b
dashboard link: https://syzkaller.appspot.com/bug?extid=dab475abf94f7513eb9f
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/39057b073d40/disk-2a239ffb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c82b778f8922/vmlinux-2a239ffb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/000bd0cd2b5e/bzImage-2a239ffb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dab475abf94f7513eb9f@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.15.0-rc4-syzkaller-00291-g2a239ffbebb5 #0 Not tainted
------------------------------------------------------
syz-executor/11002 is trying to acquire lock:
ffff88805a314318 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1105 [inline]
ffff88805a314318 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_unlink_inode+0x273/0x6a0 fs/ntfs3/inode.c:1728

but task is already holding lock:
ffff88805a3125b8 (&ni->ni_lock/6){+.+.}-{4:4}, at: ni_lock_dir fs/ntfs3/ntfs_fs.h:1110 [inline]
ffff88805a3125b8 (&ni->ni_lock/6){+.+.}-{4:4}, at: ntfs_rmdir+0xb6/0xf0 fs/ntfs3/namei.c:222

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&ni->ni_lock/6){+.+.}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
       __mutex_lock_common kernel/locking/mutex.c:601 [inline]
       __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:746
       ni_lock_dir fs/ntfs3/ntfs_fs.h:1110 [inline]
       ntfs_unlink+0xb6/0xf0 fs/ntfs3/namei.c:177
       vfs_unlink+0x391/0x650 fs/namei.c:4579
       do_unlinkat+0x350/0x560 fs/namei.c:4643
       __do_sys_unlinkat fs/namei.c:4684 [inline]
       __se_sys_unlinkat fs/namei.c:4677 [inline]
       __x64_sys_unlinkat+0xd3/0xf0 fs/namei.c:4677
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&sb->s_type->i_mutex_key#26){+.+.}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
       down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
       inode_lock include/linux/fs.h:867 [inline]
       ntfs_file_mmap+0x525/0x730 fs/ntfs3/file.c:397
       call_mmap include/linux/fs.h:2243 [inline]
       mmap_file mm/internal.h:167 [inline]
       __mmap_new_file_vma mm/vma.c:2353 [inline]
       __mmap_new_vma mm/vma.c:2417 [inline]
       __mmap_region mm/vma.c:2519 [inline]
       mmap_region+0x103b/0x1e50 mm/vma.c:2597
       do_mmap+0xc68/0x1100 mm/mmap.c:561
       vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
       ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&mm->mmap_lock){++++}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
       __might_fault+0xcc/0x130 mm/memory.c:7151
       _inline_copy_to_user include/linux/uaccess.h:192 [inline]
       _copy_to_user+0x2c/0xb0 lib/usercopy.c:26
       copy_to_user include/linux/uaccess.h:225 [inline]
       fiemap_fill_next_extent+0x1c0/0x390 fs/ioctl.c:145
       ni_fiemap+0x89c/0xbf0 fs/ntfs3/frecord.c:2007
       ntfs_fiemap+0xda/0x130 fs/ntfs3/file.c:1380
       ioctl_fiemap fs/ioctl.c:220 [inline]
       do_vfs_ioctl+0x1638/0x1eb0 fs/ioctl.c:840
       __do_sys_ioctl fs/ioctl.c:904 [inline]
       __se_sys_ioctl+0x82/0x170 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&ni->ni_lock#3/5){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3166 [inline]
       check_prevs_add kernel/locking/lockdep.c:3285 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3909
       __lock_acquire+0xaac/0xd20 kernel/locking/lockdep.c:5235
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
       __mutex_lock_common kernel/locking/mutex.c:601 [inline]
       __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:746
       ni_lock fs/ntfs3/ntfs_fs.h:1105 [inline]
       ntfs_unlink_inode+0x273/0x6a0 fs/ntfs3/inode.c:1728
       ntfs_rmdir+0xc1/0xf0 fs/ntfs3/namei.c:224
       vfs_rmdir+0x3b7/0x520 fs/namei.c:4454
       do_rmdir+0x2ac/0x630 fs/namei.c:4509
       __do_sys_unlinkat fs/namei.c:4683 [inline]
       __se_sys_unlinkat fs/namei.c:4677 [inline]
       __x64_sys_unlinkat+0xc2/0xf0 fs/namei.c:4677
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &ni->ni_lock#3/5 --> &sb->s_type->i_mutex_key#26 --> &ni->ni_lock/6

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ni->ni_lock/6);
                               lock(&sb->s_type->i_mutex_key#26);
                               lock(&ni->ni_lock/6);
  lock(&ni->ni_lock#3/5);

 *** DEADLOCK ***

4 locks held by syz-executor/11002:
 #0: ffff88803057a420 (sb_writers#18){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:556
 #1: ffff88805a312850 (&type->i_mutex_dir_key#10/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #1: ffff88805a312850 (&type->i_mutex_dir_key#10/1){+.+.}-{4:4}, at: do_rmdir+0x1b2/0x630 fs/namei.c:4501
 #2: ffff88805a3145b0 (&type->i_mutex_dir_key#10){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #2: ffff88805a3145b0 (&type->i_mutex_dir_key#10){++++}-{4:4}, at: vfs_rmdir+0xf7/0x520 fs/namei.c:4443
 #3: ffff88805a3125b8 (&ni->ni_lock/6){+.+.}-{4:4}, at: ni_lock_dir fs/ntfs3/ntfs_fs.h:1110 [inline]
 #3: ffff88805a3125b8 (&ni->ni_lock/6){+.+.}-{4:4}, at: ntfs_rmdir+0xb6/0xf0 fs/ntfs3/namei.c:222

stack backtrace:
CPU: 1 UID: 0 PID: 11002 Comm: syz-executor Not tainted 6.15.0-rc4-syzkaller-00291-g2a239ffbebb5 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2079
 check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2211
 check_prev_add kernel/locking/lockdep.c:3166 [inline]
 check_prevs_add kernel/locking/lockdep.c:3285 [inline]
 validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3909
 __lock_acquire+0xaac/0xd20 kernel/locking/lockdep.c:5235
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
 __mutex_lock_common kernel/locking/mutex.c:601 [inline]
 __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:746
 ni_lock fs/ntfs3/ntfs_fs.h:1105 [inline]
 ntfs_unlink_inode+0x273/0x6a0 fs/ntfs3/inode.c:1728
 ntfs_rmdir+0xc1/0xf0 fs/ntfs3/namei.c:224
 vfs_rmdir+0x3b7/0x520 fs/namei.c:4454
 do_rmdir+0x2ac/0x630 fs/namei.c:4509
 __do_sys_unlinkat fs/namei.c:4683 [inline]
 __se_sys_unlinkat fs/namei.c:4677 [inline]
 __x64_sys_unlinkat+0xc2/0xf0 fs/namei.c:4677
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f21ac98df47
Code: 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 07 01 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffff76a6458 EFLAGS: 00000207 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 0000000000000065 RCX: 00007f21ac98df47
RDX: 0000000000000200 RSI: 00007ffff76a7600 RDI: 00000000ffffff9c
RBP: 00007f21aca1089d R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000100 R11: 0000000000000207 R12: 00007ffff76a7600
R13: 00007f21aca1089d R14: 000000000006bff7 R15: 00007ffff76a97c0
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
