Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A101E5701
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745254049; cv=none; b=EfUpY6FItESN97u/y49xFoi6sNwm/G7Lmz2DbtqJ/hmi6cokaxDO3FfFmOnKeldooXIU64ANpPzh8n1rSNkOwYiRUlWP5KDmdPDBJH26LVihsJLzpo0ZJVHu7cL0yFo/ZyZQNMDHVUEr8I4ZjbQs00H4Zi0p/ZMmAk+EBtsrAc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745254049; c=relaxed/simple;
	bh=waSzMPLAQviwrKgfZQTWoUY8aIciLWqFpcE/7zo6wJY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hwmKEmi5FHYonO8/njtnKkW3go02yNW9OwJ6aIwXFp+mMLQVsscvFPXBdRXIA16NPhtLTEbrYMs0kSHLCHe3T9sj8qjzhwnSC911PGDbsIs4+/X4ibgtmsN9C2iugGCD6QdmSO0hvanOvKaoJze2kyUYZbYskpoLRAOdThnQVh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85ed07f832dso423482039f.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745254047; x=1745858847;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/Z+E4MArse6XwOaXBZnDCHXBo4tMYe14cQIf3eVRG4=;
        b=r8cnOCCql7wavHEVoQYJ/HupaMVymOMm94guHofq3lhFZJAbXJsVpSyAqWIbBcplp2
         kq1GbsrdzkBR7rG14nWUbrlZhC7TTfeUjvr92iw4GQDgMbgGkVDNbSNWwMMm1fqd1jzH
         3EvolCElkRn9DNpTt0Fea0MREwSx2vq7dG3Bek+LEvMa9r8lekME+MEdSd5pT6tjjQmn
         NyAJkS4ugWPhgE5oBzFJubMPmpYyekkH6446DOIFafoj6VluUJu1ZDQLSNmEV26N4+SH
         uXMqjf1TMmeltHzFeKY44i5zHKPc2IaJpx4K62ijNrpnIh4ddlTbXhWF89MvE/G3MJ3m
         GvaA==
X-Forwarded-Encrypted: i=1; AJvYcCU2kMivVqJXgFXyBHGh8iW5McIw6ufkj6zkhGQ3R9iVz+t+CswAZXCFkTxRpv7sKzapf5XspMgOtZLJABU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjCwIghurk1Tg2PNWtrjEvAWmw2xiDmuTw8fl1MMqR2s5EPiww
	rNRFFCnamSZBBfkhOpeFsSzgf2EVVNAI8r+q8BP9m0SH4vV0lE81zeAV0LlH+a/GaibSrFA+L1p
	8V0BmPA3Tgm+lMCcaqwUadbO9sMjqk6IsUR1lPGvJ8wga8uiKupQBkcs=
X-Google-Smtp-Source: AGHT+IFBF2vkCVLRJ05sS0//j0gW40qowXBVTCjSWhWkxInBAjleaERU+HmzC13ggq3Xfazn9kKJ6JG9M4HwBUJmCTm+5jMu9c9P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:394c:b0:85d:b054:6eb9 with SMTP id
 ca18e2360f4ac-861dbf5f998mr1335764639f.14.1745254046895; Mon, 21 Apr 2025
 09:47:26 -0700 (PDT)
Date: Mon, 21 Apr 2025 09:47:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6806769e.050a0220.297747.02f9.GAE@google.com>
Subject: [syzbot] [ntfs3?] possible deadlock in ni_set_compress
From: syzbot <syzbot+839ea12926e5df362ff1@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cfb2e2c57aef Merge tag 'mm-hotfixes-stable-2025-04-16-19-5..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13441fe4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b8b55ae4a62d79b8
dashboard link: https://syzkaller.appspot.com/bug?extid=839ea12926e5df362ff1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5590e609f231/disk-cfb2e2c5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6865703da4ca/vmlinux-cfb2e2c5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6944af88a20f/bzImage-cfb2e2c5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+839ea12926e5df362ff1@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.15.0-rc2-syzkaller-00087-gcfb2e2c57aef #0 Not tainted
------------------------------------------------------
syz.5.237/7937 is trying to acquire lock:
ffff88805e9fca70 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1105 [inline]
ffff88805e9fca70 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_set_compress+0x174/0x5a0 fs/ntfs3/frecord.c:3359

but task is already holding lock:
ffff88805e9fcea8 (mapping.invalidate_lock#12){++++}-{4:4}, at: filemap_invalidate_lock include/linux/fs.h:912 [inline]
ffff88805e9fcea8 (mapping.invalidate_lock#12){++++}-{4:4}, at: ntfs_fileattr_set+0x2a9/0x4a0 fs/ntfs3/file.c:108

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (mapping.invalidate_lock#12){++++}-{4:4}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       down_read+0xb3/0xa50 kernel/locking/rwsem.c:1524
       filemap_invalidate_lock_shared include/linux/fs.h:922 [inline]
       filemap_fault+0x66b/0x13d0 mm/filemap.c:3391
       __do_fault+0x135/0x390 mm/memory.c:5098
       do_read_fault mm/memory.c:5518 [inline]
       do_fault mm/memory.c:5652 [inline]
       do_pte_missing mm/memory.c:4160 [inline]
       handle_pte_fault+0x3f0c/0x61c0 mm/memory.c:5997
       __handle_mm_fault mm/memory.c:6140 [inline]
       handle_mm_fault+0x1030/0x1aa0 mm/memory.c:6309
       do_user_addr_fault arch/x86/mm/fault.c:1388 [inline]
       handle_page_fault arch/x86/mm/fault.c:1480 [inline]
       exc_page_fault+0x2bb/0x920 arch/x86/mm/fault.c:1538
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
       do_strncpy_from_user lib/strncpy_from_user.c:-1 [inline]
       strncpy_from_user+0xb8/0x280 lib/strncpy_from_user.c:130
       getname_flags+0xf1/0x530 fs/namei.c:157
       getname include/linux/fs.h:2852 [inline]
       do_sys_openat2+0xbf/0x1d0 fs/open.c:1423
       do_sys_open fs/open.c:1444 [inline]
       __do_sys_open fs/open.c:1452 [inline]
       __se_sys_open fs/open.c:1448 [inline]
       __x64_sys_open+0x226/0x280 fs/open.c:1448
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&mm->mmap_lock){++++}-{4:4}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       __might_fault+0xc6/0x120 mm/memory.c:7151
       _inline_copy_to_user include/linux/uaccess.h:192 [inline]
       _copy_to_user+0x2c/0xb0 lib/usercopy.c:26
       copy_to_user include/linux/uaccess.h:225 [inline]
       fiemap_fill_next_extent+0x237/0x420 fs/ioctl.c:145
       ni_fiemap+0xa42/0x12a0 fs/ntfs3/frecord.c:2007
       ntfs_fiemap+0x134/0x180 fs/ntfs3/file.c:1380
       ioctl_fiemap fs/ioctl.c:220 [inline]
       do_vfs_ioctl+0x1975/0x2750 fs/ioctl.c:840
       __do_sys_ioctl fs/ioctl.c:904 [inline]
       __se_sys_ioctl+0x80/0x160 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&ni->ni_lock#3/5){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3166 [inline]
       check_prevs_add kernel/locking/lockdep.c:3285 [inline]
       validate_chain+0xa69/0x24e0 kernel/locking/lockdep.c:3909
       __lock_acquire+0xad5/0xd80 kernel/locking/lockdep.c:5235
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       __mutex_lock_common kernel/locking/mutex.c:601 [inline]
       __mutex_lock+0x1a5/0x10c0 kernel/locking/mutex.c:746
       ni_lock fs/ntfs3/ntfs_fs.h:1105 [inline]
       ni_set_compress+0x174/0x5a0 fs/ntfs3/frecord.c:3359
       ntfs_fileattr_set+0x2ef/0x4a0 fs/ntfs3/file.c:114
       vfs_fileattr_set+0x901/0xd50 fs/ioctl.c:696
       ioctl_setflags fs/ioctl.c:728 [inline]
       do_vfs_ioctl+0x180c/0x2750 fs/ioctl.c:869
       __do_sys_ioctl fs/ioctl.c:904 [inline]
       __se_sys_ioctl+0x80/0x160 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &ni->ni_lock#3/5 --> &mm->mmap_lock --> mapping.invalidate_lock#12

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(mapping.invalidate_lock#12);
                               lock(&mm->mmap_lock);
                               lock(mapping.invalidate_lock#12);
  lock(&ni->ni_lock#3/5);

 *** DEADLOCK ***

3 locks held by syz.5.237/7937:
 #0: ffff88807cdac420 (sb_writers#25){.+.+}-{0:0}, at: mnt_want_write_file+0x5e/0x200 fs/namespace.c:600
 #1: ffff88805e9fcd08 (&sb->s_type->i_mutex_key#31){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #1: ffff88805e9fcd08 (&sb->s_type->i_mutex_key#31){+.+.}-{4:4}, at: vfs_fileattr_set+0x13b/0xd50 fs/ioctl.c:681
 #2: ffff88805e9fcea8 (mapping.invalidate_lock#12){++++}-{4:4}, at: filemap_invalidate_lock include/linux/fs.h:912 [inline]
 #2: ffff88805e9fcea8 (mapping.invalidate_lock#12){++++}-{4:4}, at: ntfs_fileattr_set+0x2a9/0x4a0 fs/ntfs3/file.c:108

stack backtrace:
CPU: 0 UID: 0 PID: 7937 Comm: syz.5.237 Not tainted 6.15.0-rc2-syzkaller-00087-gcfb2e2c57aef #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_circular_bug+0x2e1/0x300 kernel/locking/lockdep.c:2079
 check_noncircular+0x142/0x160 kernel/locking/lockdep.c:2211
 check_prev_add kernel/locking/lockdep.c:3166 [inline]
 check_prevs_add kernel/locking/lockdep.c:3285 [inline]
 validate_chain+0xa69/0x24e0 kernel/locking/lockdep.c:3909
 __lock_acquire+0xad5/0xd80 kernel/locking/lockdep.c:5235
 lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
 __mutex_lock_common kernel/locking/mutex.c:601 [inline]
 __mutex_lock+0x1a5/0x10c0 kernel/locking/mutex.c:746
 ni_lock fs/ntfs3/ntfs_fs.h:1105 [inline]
 ni_set_compress+0x174/0x5a0 fs/ntfs3/frecord.c:3359
 ntfs_fileattr_set+0x2ef/0x4a0 fs/ntfs3/file.c:114
 vfs_fileattr_set+0x901/0xd50 fs/ioctl.c:696
 ioctl_setflags fs/ioctl.c:728 [inline]
 do_vfs_ioctl+0x180c/0x2750 fs/ioctl.c:869
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5dca38e169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5dcb1ed038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f5dca5b5fa0 RCX: 00007f5dca38e169
RDX: 00002000000006c0 RSI: 0000000040086602 RDI: 0000000000000004
RBP: 00007f5dca410a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f5dca5b5fa0 R15: 00007ffcd4490398
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
