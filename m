Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F361F19A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 15:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749396873; cv=none; b=qESjhur2N8nVv+mf8J+oHfLgcanNPWTd3L8lXfeq4L/pajrtZxc0QgdfDiAb0o20Wm2lXR85DlAFOqb/3qPHZFzgpU/Q3/osXHgCNuHZvkLwXE7vwJI2jpUJPnelGY95e0uA+kR/llANa1dZ2GROO6+Msjk5tkjUxf1xXeMGu28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749396873; c=relaxed/simple;
	bh=NYILPpeLDRrHjSes9ndBBvbCljywa8qHMdJNndazfbE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bm1XVI+/aGu6nyIf538H1wOCzZIsv9fuxgol56ZI7nIj8QMXIMgs7/fwnQ3Z8KqQ5IBMD8YCeduq3ewSZRbBhSOHU1Sty/pfJHSco8In+bOuu2BYPNBbvjpsijfZJQZtq8ZvGIC7ZF75EbGnWMSvlPuCDKew1Itoj2McO4WxfM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddd03db24dso17321035ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 08:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749396871; x=1750001671;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fvmjFEQJ7WHJnAKAOrPBrNRIDj3V0nCEgS6r1TxVlcQ=;
        b=N3v0AM9o8M6kGwQGFoo3GeFZHxqH+phHzmShbjMzVH3WxbPuH2XO7vUSMKNolRdiMb
         gfBzE9QJdL0KmfqKsT4c0Xz0dvb/3QLkpw+eAPAU3BGGbA2OQLDd51q+Q4+0sgt0l9tO
         3HbpIVY9spmh/1/4irJLsaGqzDPv/9vsasEOF4I8agRe0GqacNayqwYC4//n1z5wvLKV
         2reRnsZyRatiXPlX9TmsX1BhQN78Ve1nqWVg7obSQ21oGL72xS9OCSqJcPxS+j/2LzKv
         84z/+zYi1P5lRHSi4/c14PiiBoZVBtF5CAIbHq1lr0gdeYI8WuHYuY+WXQr6wSTEhw2h
         bX0A==
X-Forwarded-Encrypted: i=1; AJvYcCWvhIapUbZjbDitRDGKgM6oEVJya8K4HyAe3+Hu19OmqAHBmQhWdrtl1JHFiXhaFVaf+SyXKdhuq8UuRvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhoSmjtsbCnME4KQ1RW+BjnTkJKco+oTxhphTIcrJ0hhqvYiYP
	78yc7liYu/RmBGR5L/AmSzfoemtF+oME7YTO8Xv/4eDI2vhFEd4jFNkjQr1BaTmIbWa561ifdR5
	Te4Zy43/k2n20sivVqoyMypyPQ8sMRO2SOHg6IPoV7KMeBbNny4c6LAHJR+A=
X-Google-Smtp-Source: AGHT+IEWIOIE0zZ+cAyq4LRpR1vM71PT3MHqhoewdfgnxr0E6bzEwMXEsEBz5B4OZz5by690b7nXQam121ahRwescIo6zkm6FSF2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198e:b0:3dc:88ca:5ebe with SMTP id
 e9e14a558f8ab-3ddce3e3814mr106500545ab.4.1749396871251; Sun, 08 Jun 2025
 08:34:31 -0700 (PDT)
Date: Sun, 08 Jun 2025 08:34:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6845ad87.a70a0220.27c366.004e.GAE@google.com>
Subject: [syzbot] [mm?] [ntfs3?] possible deadlock in upgrade_mmap_lock_carefully
 (2)
From: syzbot <syzbot+a91fcdbd2698f99db8f4@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, ntfs3@lists.linux.dev, 
	shakeel.butt@linux.dev, surenb@google.com, syzkaller-bugs@googlegroups.com, 
	vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1af80d00e1e0 Merge tag 'slab-for-6.16' of git://git.kernel..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1653cc0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=82e79780b034d72f
dashboard link: https://syzkaller.appspot.com/bug?extid=a91fcdbd2698f99db8f4
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1667f40c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1222e570580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2108968c2c62/disk-1af80d00.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fd3b30e8c62a/vmlinux-1af80d00.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a8aa2c824e68/bzImage-1af80d00.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/ecf486535ea3/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a91fcdbd2698f99db8f4@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.15.0-syzkaller-11802-g1af80d00e1e0 #0 Not tainted
------------------------------------------------------
syz-executor165/5834 is trying to acquire lock:
ffff88803293c0e0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
ffff88803293c0e0 (&mm->mmap_lock){++++}-{4:4}, at: upgrade_mmap_lock_carefully+0xba/0x1c0 mm/mmap_lock.c:221

but task is already holding lock:
ffff88807816e310 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_trylock include/linux/fs.h:897 [inline]
ffff88807816e310 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: ntfs_file_write_iter+0x78/0x820 fs/ntfs3/file.c:1160

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
       inode_lock include/linux/fs.h:867 [inline]
       ntfs_file_mmap+0x525/0x730 fs/ntfs3/file.c:313
       call_mmap include/linux/fs.h:2282 [inline]
       mmap_file mm/internal.h:167 [inline]
       __mmap_new_file_vma mm/vma.c:2398 [inline]
       __mmap_new_vma mm/vma.c:2460 [inline]
       __mmap_region mm/vma.c:2615 [inline]
       mmap_region+0x1221/0x1f30 mm/vma.c:2685
       do_mmap+0xc45/0x10d0 mm/mmap.c:561
       vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
       ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&mm->mmap_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
       __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       down_write_killable+0xa7/0x230 kernel/locking/rwsem.c:1588
       mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
       upgrade_mmap_lock_carefully+0xba/0x1c0 mm/mmap_lock.c:221
       lock_mm_and_find_vma+0x10a/0x300 mm/mmap_lock.c:274
       do_user_addr_fault+0x331/0x1390 arch/x86/mm/fault.c:1359
       handle_page_fault arch/x86/mm/fault.c:1476 [inline]
       exc_page_fault+0x76/0xf0 arch/x86/mm/fault.c:1532
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
       fault_in_readable+0x8e/0x130 mm/gup.c:-1
       fault_in_iov_iter_readable+0x1b4/0x2f0 lib/iov_iter.c:94
       generic_perform_write+0x7cc/0x910 mm/filemap.c:4161
       ntfs_file_write_iter+0x71c/0x820 fs/ntfs3/file.c:1197
       new_sync_write fs/read_write.c:593 [inline]
       vfs_write+0x548/0xa90 fs/read_write.c:686
       ksys_pwrite64 fs/read_write.c:793 [inline]
       __do_sys_pwrite64 fs/read_write.c:801 [inline]
       __se_sys_pwrite64 fs/read_write.c:798 [inline]
       __x64_sys_pwrite64+0x193/0x220 fs/read_write.c:798
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sb->s_type->i_mutex_key#14);
                               lock(&mm->mmap_lock);
                               lock(&sb->s_type->i_mutex_key#14);
  lock(&mm->mmap_lock);

 *** DEADLOCK ***

2 locks held by syz-executor165/5834:
 #0: ffff888034c60428 (sb_writers#8){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3092 [inline]
 #0: ffff888034c60428 (sb_writers#8){.+.+}-{0:0}, at: vfs_write+0x211/0xa90 fs/read_write.c:682
 #1: ffff88807816e310 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_trylock include/linux/fs.h:897 [inline]
 #1: ffff88807816e310 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: ntfs_file_write_iter+0x78/0x820 fs/ntfs3/file.c:1160

stack backtrace:
CPU: 0 UID: 0 PID: 5834 Comm: syz-executor165 Not tainted 6.15.0-syzkaller-11802-g1af80d00e1e0 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2046
 check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2178
 check_prev_add kernel/locking/lockdep.c:3168 [inline]
 check_prevs_add kernel/locking/lockdep.c:3287 [inline]
 validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
 down_write_killable+0xa7/0x230 kernel/locking/rwsem.c:1588
 mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
 upgrade_mmap_lock_carefully+0xba/0x1c0 mm/mmap_lock.c:221
 lock_mm_and_find_vma+0x10a/0x300 mm/mmap_lock.c:274
 do_user_addr_fault+0x331/0x1390 arch/x86/mm/fault.c:1359
 handle_page_fault arch/x86/mm/fault.c:1476 [inline]
 exc_page_fault+0x76/0xf0 arch/x86/mm/fault.c:1532
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:fault_in_readable+0x8e/0x130 mm/gup.c:2227
Code: a9 00 00 00 0f 01 cb 0f ae e8 4d 85 f6 40 0f 95 c5 4c 89 ff 4c 89 f6 e8 40 e5 b9 ff 4d 39 f7 0f 97 c0 40 84 c5 74 43 4d 89 f5 <41> 8a 45 00 88 44 24 07 49 81 e5 00 f0 ff ff 4d 8d a5 00 10 00 00
RSP: 0018:ffffc900044efa88 EFLAGS: 00050202
RAX: ffffffff82066801 RBX: 0000000000000140 RCX: ffff88802bed5a00
RDX: 0000000000000000 RSI: 0000200000002000 RDI: 0000200000002140
RBP: dffffc0000000001 R08: ffff88802bed5a00 R09: 0000000000000002
R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffffffff000
R13: 0000200000002000 R14: 0000200000002000 R15: 0000200000002140
 fault_in_iov_iter_readable+0x1b4/0x2f0 lib/iov_iter.c:94
 generic_perform_write+0x7cc/0x910 mm/filemap.c:4161
 ntfs_file_write_iter+0x71c/0x820 fs/ntfs3/file.c:1197
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x548/0xa90 fs/read_write.c:686
 ksys_pwrite64 fs/read_write.c:793 [inline]
 __do_sys_pwrite64 fs/read_write.c:801 [inline]
 __se_sys_pwrite64 fs/read_write.c:798 [inline]
 __x64_sys_pwrite64+0x193/0x220 fs/read_write.c:798
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7effea34b459
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffba5c42c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000012
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007effea34b459
RDX: 000000000000fdef RSI: 0000200000000140 RDI: 0000000000000006
RBP: 0000000000000000 R08: 0000000000000000 R09: 00007fffba5c4300
R10: 000000000000fecc R11: 0000000000000246 R12: 00007fffba5c4300
R13: 00007fffba5c4588 R14: 431bde82d7b634db R15: 00007effea39403b
 </TASK>
----------------
Code disassembly (best guess):
   0:	a9 00 00 00 0f       	test   $0xf000000,%eax
   5:	01 cb                	add    %ecx,%ebx
   7:	0f ae e8             	lfence
   a:	4d 85 f6             	test   %r14,%r14
   d:	40 0f 95 c5          	setne  %bpl
  11:	4c 89 ff             	mov    %r15,%rdi
  14:	4c 89 f6             	mov    %r14,%rsi
  17:	e8 40 e5 b9 ff       	call   0xffb9e55c
  1c:	4d 39 f7             	cmp    %r14,%r15
  1f:	0f 97 c0             	seta   %al
  22:	40 84 c5             	test   %al,%bpl
  25:	74 43                	je     0x6a
  27:	4d 89 f5             	mov    %r14,%r13
* 2a:	41 8a 45 00          	mov    0x0(%r13),%al <-- trapping instruction
  2e:	88 44 24 07          	mov    %al,0x7(%rsp)
  32:	49 81 e5 00 f0 ff ff 	and    $0xfffffffffffff000,%r13
  39:	4d 8d a5 00 10 00 00 	lea    0x1000(%r13),%r12


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
