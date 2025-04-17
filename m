Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81671DE889
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872263; cv=none; b=baiST2Epfp12/ileIsJQggqCGDLcvIZq9UkYBzS9klKDm9oFnwLmA5Qk/7cgqJ1NOJRku0RI1jfKC2h+hJw3aF/DL8DILHZyaQ7E8UXAUL8T6WwmxjEfZEuf11BsYIwbVMTX2aQGaP5J7PlEHwN2F0S+YrkPYyHvivm+G0A+kWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872263; c=relaxed/simple;
	bh=If+ezqJJzVKuOBv/yLDBPkAxZAF7Q4lO+E5PwuZ1O/I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gdAQb3D6a7BsGD1BZ9ON99fuT3txzYQMzctR/lPZFeCRxhZ5XJ3c6ZkD9Y5+3X5CXBmgo78m3iY3XBldeEAPdBMQQTVRSC72Wpvk91DB59ikFtIkfiUCZwUp6w97ZeKyg2qLcSONxgzCq86+QxjL1f7P4xQDZnfnwRWJkvVeuHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d5b38276deso8680465ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872261; x=1745477061;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=80vIA7ap+8Y3mbiZvd1Ac5OwnLScEEXHJZpjQ6o29cM=;
        b=wVlJZVwYxJajeTimkxipBoocDRckMFG2pEaccZDk1jhbtuFIaDkYSA7EJ/bsfPf05/
         YLPdl9lweOAWf2aRGbE9TNL/X2WofV08ortpUt2jzR42ensIJDzHHthI5I4qobOFGrKe
         DRDwBfjZ8dG/Kw6mj/yAlEysOZNafcqAyhyFCf2zYKKv7cKUYkEQNDShgyMi+juulhBv
         rK84jbwh5oRrNwOWiqRlpcJ3fYDBleFJKSjSwipZCeZad9O1NnWQuRL/18m+iSSHTggN
         uWeILGaWAMYtsAv0hFJFttDQrka3LnaIofBp/iqXZ3ePJiVQocc0PZTSUSnueOJotqlA
         MnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPqp8PD+KfWnE03NZCw8K9cYm0bZ43Fays4Azwp4xLkYIw1JNdsVyL0RO+jh2zNkzKGbVZdFKhY+I/N2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU4IbFF2xZRipXnT4Fcg6ovAFi49YtOrsobHcdg3U4882YGoHi
	JqzmVI27FhNj6pmp95rHTd8K+qLb0fucAvcnpX5kwgolE3MFBnpKCuf/RBtNO5+aOpBdJSTYwQ6
	UD7Dqf02K0Yu5jNKgTnA6FurmSpr4sjjYP8ajNa0slsUPenCRjAZoelI=
X-Google-Smtp-Source: AGHT+IElS9UcrUsD9qBSZfJWImK9txvdQ9mVCJUsQUEiZlsvorY3+4alHVP4YhtjNflvBEOHRMUn9vI2hHt+U+OD5oP+G/kymE+s
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16c5:b0:3d3:d067:73f8 with SMTP id
 e9e14a558f8ab-3d815b1cda5mr39072505ab.11.1744872260897; Wed, 16 Apr 2025
 23:44:20 -0700 (PDT)
Date: Wed, 16 Apr 2025 23:44:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6800a344.050a0220.5cdb3.000d.GAE@google.com>
Subject: [syzbot] [afs?] BUG: sleeping function called from invalid context in __xfs_write_fault
From: syzbot <syzbot+764108b2012ab7b1aad2@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7cdabafc0012 Merge tag 'trace-v6.15-rc1' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=103bd398580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fb8650d88e9fb80f
dashboard link: https://syzkaller.appspot.com/bug?extid=764108b2012ab7b1aad2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0f9317cc7b92/disk-7cdabafc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b9e0f7e75505/vmlinux-7cdabafc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5c11cc51cada/bzImage-7cdabafc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+764108b2012ab7b1aad2@syzkaller.appspotmail.com

BUG: sleeping function called from invalid context at ./include/linux/percpu-rwsem.h:50
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 6258, name: syz.2.54
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
4 locks held by syz.2.54/6258:
 #0: ffff88807c041b38 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x247/0x310 fs/file.c:1213
 #1: ffff88804d208148 (&type->i_mutex_dir_key#18){++++}-{4:4}, at: iterate_dir+0x4a6/0x760 fs/readdir.c:101
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: afs_dynroot_readdir+0x466/0xbe0 fs/afs/dynroot.c:351
 #3: ffff88803143dbe0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_trylock include/linux/mmap_lock.h:203 [inline]
 #3: ffff88803143dbe0 (&mm->mmap_lock){++++}-{4:4}, at: get_mmap_lock_carefully mm/memory.c:6346 [inline]
 #3: ffff88803143dbe0 (&mm->mmap_lock){++++}-{4:4}, at: lock_mm_and_find_vma+0x32/0x2f0 mm/memory.c:6406
CPU: 1 UID: 0 PID: 6258 Comm: syz.2.54 Not tainted 6.15.0-rc1-syzkaller-00325-g7cdabafc0012 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 __might_resched+0x558/0x6c0 kernel/sched/core.c:8818
 percpu_down_read include/linux/percpu-rwsem.h:50 [inline]
 __sb_start_write include/linux/fs.h:1783 [inline]
 sb_start_pagefault include/linux/fs.h:1948 [inline]
 __xfs_write_fault+0x1cd/0x8f0 fs/xfs/xfs_file.c:1718
 xfs_write_fault+0x1a1/0x640 fs/xfs/xfs_file.c:1777
 do_page_mkwrite+0x159/0x340 mm/memory.c:3287
 wp_page_shared mm/memory.c:3688 [inline]
 do_wp_page+0x2bbc/0x5e00 mm/memory.c:3907
 handle_pte_fault+0xfaf/0x61c0 mm/memory.c:6013
 __handle_mm_fault mm/memory.c:6140 [inline]
 handle_mm_fault+0x1030/0x1aa0 mm/memory.c:6309
 do_user_addr_fault arch/x86/mm/fault.c:1388 [inline]
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x2bb/0x920 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:filldir+0x2c4/0x6a0 fs/readdir.c:292
Code: 87 55 02 00 00 0f 01 cb 0f ae e8 48 8b 44 24 30 49 89 46 08 48 8b 4c 24 10 48 8b 44 24 60 48 89 01 48 8b 44 24 18 8b 6c 24 3c <66> 89 41 10 48 98 40 88 6c 01 ff 48 89 44 24 30 4d 63 f5 42 c6 44
RSP: 0018:ffffc90003d8fbe0 EFLAGS: 00050283
RAX: 0000000000000018 RBX: 0000200000002008 RCX: 0000200000001ff0
RDX: 0000000000000000 RSI: 0000200000001fd8 RDI: 0000200000002008
RBP: 0000000000000004 R08: ffffffff82429e7d R09: 1ffff11005dcf780
R10: dffffc0000000000 R11: ffffed1005dcf781 R12: ffff8881432bfb41
R13: 0000000000000003 R14: 0000200000001fd8 R15: 00007ffffffff000
 dir_emit include/linux/fs.h:3861 [inline]
 afs_dynroot_readdir_cells fs/afs/dynroot.c:310 [inline]
 afs_dynroot_readdir+0x814/0xbe0 fs/afs/dynroot.c:352
 iterate_dir+0x5a9/0x760 fs/readdir.c:108
 __do_sys_getdents fs/readdir.c:322 [inline]
 __se_sys_getdents+0x1ff/0x4e0 fs/readdir.c:308
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f74f7f8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f74f8d45038 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007f74f81a6080 RCX: 00007f74f7f8d169
RDX: 00000000000000b8 RSI: 0000200000001fc0 RDI: 000000000000000e
RBP: 00007f74f800e990 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f74f81a6080 R15: 00007fff9d606378
 </TASK>

=============================
[ BUG: Invalid wait context ]
6.15.0-rc1-syzkaller-00325-g7cdabafc0012 #0 Tainted: G        W          
-----------------------------
syz.2.54/6258 is trying to lock:
ffff88807b5f2f98 (&xfs_nondir_ilock_class
){++++}-{4:4}, at: xfs_fs_dirty_inode+0x19d/0x260 fs/xfs/xfs_super.c:714
other info that might help us debug this:
context-{5:5}
6 locks held by syz.2.54/6258:
 #0: ffff88807c041b38 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x247/0x310 fs/file.c:1213
 #1: ffff88804d208148 (&type->i_mutex_dir_key#18){++++}-{4:4}, at: iterate_dir+0x4a6/0x760 fs/readdir.c:101
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: afs_dynroot_readdir+0x466/0xbe0 fs/afs/dynroot.c:351
 #3: ffff88803143dbe0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_trylock include/linux/mmap_lock.h:203 [inline]
 #3: ffff88803143dbe0 (&mm->mmap_lock){++++}-{4:4}, at: get_mmap_lock_carefully mm/memory.c:6346 [inline]
 #3: ffff88803143dbe0 (&mm->mmap_lock){++++}-{4:4}, at: lock_mm_and_find_vma+0x32/0x2f0 mm/memory.c:6406
 #4: ffff88807f006518 (sb_pagefaults#2){.+.+}-{0:0}, at: xfs_write_fault+0x1a1/0x640 fs/xfs/xfs_file.c:1777
 #5: ffff88807f006610 (sb_internal#2){.+.+}-{0:0}, at: xfs_fs_dirty_inode+0x15a/0x260 fs/xfs/xfs_super.c:712
stack backtrace:
CPU: 1 UID: 0 PID: 6258 Comm: syz.2.54 Tainted: G        W           6.15.0-rc1-syzkaller-00325-g7cdabafc0012 #0 PREEMPT(full) 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_lock_invalid_wait_context kernel/locking/lockdep.c:4831 [inline]
 check_wait_context kernel/locking/lockdep.c:4903 [inline]
 __lock_acquire+0xc30/0xd80 kernel/locking/lockdep.c:5185
 lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
 down_write_nested+0xa2/0x220 kernel/locking/rwsem.c:1693
 xfs_fs_dirty_inode+0x19d/0x260 fs/xfs/xfs_super.c:714
 __mark_inode_dirty+0x2ee/0xe90 fs/fs-writeback.c:2527
 generic_update_time+0xad/0xc0 fs/inode.c:2064
 xfs_vn_update_time+0x2a7/0x600 fs/xfs/xfs_iops.c:1136
 inode_update_time fs/inode.c:2076 [inline]
 __file_update_time fs/inode.c:2305 [inline]
 file_update_time+0x314/0x450 fs/inode.c:2335
 __xfs_write_fault+0x2ff/0x8f0 fs/xfs/xfs_file.c:1719
 xfs_write_fault+0x1a1/0x640 fs/xfs/xfs_file.c:1777
 do_page_mkwrite+0x159/0x340 mm/memory.c:3287
 wp_page_shared mm/memory.c:3688 [inline]
 do_wp_page+0x2bbc/0x5e00 mm/memory.c:3907
 handle_pte_fault+0xfaf/0x61c0 mm/memory.c:6013
 __handle_mm_fault mm/memory.c:6140 [inline]
 handle_mm_fault+0x1030/0x1aa0 mm/memory.c:6309
 do_user_addr_fault arch/x86/mm/fault.c:1388 [inline]
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x2bb/0x920 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:filldir+0x2c4/0x6a0 fs/readdir.c:292
Code: 87 55 02 00 00 0f 01 cb 0f ae e8 48 8b 44 24 30 49 89 46 08 48 8b 4c 24 10 48 8b 44 24 60 48 89 01 48 8b 44 24 18 8b 6c 24 3c <66> 89 41 10 48 98 40 88 6c 01 ff 48 89 44 24 30 4d 63 f5 42 c6 44
RSP: 0018:ffffc90003d8fbe0 EFLAGS: 00050283
RAX: 0000000000000018 RBX: 0000200000002008 RCX: 0000200000001ff0
RDX: 0000000000000000 RSI: 0000200000001fd8 RDI: 0000200000002008
RBP: 0000000000000004 R08: ffffffff82429e7d R09: 1ffff11005dcf780
R10: dffffc0000000000 R11: ffffed1005dcf781 R12: ffff8881432bfb41
R13: 0000000000000003 R14: 0000200000001fd8 R15: 00007ffffffff000
 dir_emit include/linux/fs.h:3861 [inline]
 afs_dynroot_readdir_cells fs/afs/dynroot.c:310 [inline]
 afs_dynroot_readdir+0x814/0xbe0 fs/afs/dynroot.c:352
 iterate_dir+0x5a9/0x760 fs/readdir.c:108
 __do_sys_getdents fs/readdir.c:322 [inline]
 __se_sys_getdents+0x1ff/0x4e0 fs/readdir.c:308
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f74f7f8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f74f8d45038 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007f74f81a6080 RCX: 00007f74f7f8d169
RDX: 00000000000000b8 RSI: 0000200000001fc0 RDI: 000000000000000e
RBP: 00007f74f800e990 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f74f81a6080 R15: 00007fff9d606378
 </TASK>
----------------
Code disassembly (best guess):
   0:	87 55 02             	xchg   %edx,0x2(%rbp)
   3:	00 00                	add    %al,(%rax)
   5:	0f 01 cb             	stac
   8:	0f ae e8             	lfence
   b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  10:	49 89 46 08          	mov    %rax,0x8(%r14)
  14:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  19:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  1e:	48 89 01             	mov    %rax,(%rcx)
  21:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  26:	8b 6c 24 3c          	mov    0x3c(%rsp),%ebp
* 2a:	66 89 41 10          	mov    %ax,0x10(%rcx) <-- trapping instruction
  2e:	48 98                	cltq
  30:	40 88 6c 01 ff       	mov    %bpl,-0x1(%rcx,%rax,1)
  35:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  3a:	4d 63 f5             	movslq %r13d,%r14
  3d:	42                   	rex.X
  3e:	c6                   	.byte 0xc6
  3f:	44                   	rex.R


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
