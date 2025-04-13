Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E48EC4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 18:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744567404; cv=none; b=oWjkO/TMei5MmAU1+wZRoLhCp8hrT3lIzIDAorqbmEDKARiwltcLZlgGJartCyuuPprCcMG2gMrLpMjR54yxaNexPzqV6A1607R5L4S1s1bnqAJ+cOF6S4OHTAczfUEsuOO3jUpIbpofSQ9I/NcNvcD5EspK+EMbyNos+1LxWnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744567404; c=relaxed/simple;
	bh=OfSDk6mWhpD6+qUrcH8Xoao0Y8AIl+PC4epIFhuss5I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dpAGH0cnN6K73E38GWtk6WeYn2Ih4cDIE51452GZ+c12Eisxvu1DwMNqIrwBgkO0E+iMYzaUebRD/1QQlK1a3hkb/1Ifs8xOiAAL/UHv8VLufUP8OxM9z2hp1CqO5UZ9Pd5V7aFyRVcy7mzbFctRdOgfLqMI4qe5w08yW3ArKi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d5d6c997d2so35911375ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 11:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744567401; x=1745172201;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMGJ5i2NVxg0JeP0YSRdcHnoLonwkfP9vdvDNLn4THM=;
        b=gRdu0SwPVQzLoeC/ce7oCKL/zA/RIdBkkuA9dOdvBRJwSkx2IWwIFX98+r49+AfXEK
         7+nvxiBBF0i2n33Oa4Owzt4o2SinCwzRJoLbjExDzKaHcyr0gbFC4S7LECUkbUxzbFqG
         asW0Iw21yzkc3g8Mrn0ir/YAcO2g5w0J57qpp1vRRIaeXFF7i/khpOLr5VO/5lY4Om6O
         jf+dc8NtlmZfP5cEgdqxMgpdZUzrRnQGW2C0fcJNTM+J2/Y6PwC00WaOIFMtrXzt3NIf
         m5wPxu2cOyek0plJQ3x2qhlt8TGqiTGzIBCVM9U7WVi5+RMkk+sPKVfbKpf+30bK4ahv
         mwDw==
X-Forwarded-Encrypted: i=1; AJvYcCUq1TxD7rJxPVLvikenrIU5CklKn6Lkc23V3UGRAkMP/sWe8QMQo95jF49Pc1IMIE9tdOS5UJlNRiNDaOc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Ouo7fC+ui4D/t8s4raXwFeeD0VxIHptcAZy53a5Klf5l0FH6
	MOuRDMltB4boaVn532G5MJdQMhoK80VX9x7+hUG3DLN3QjCeDqsRhHur6XyV8UEt7+DQAFWUFE9
	x0/d1DkAWFdL4ofw/zM6/2T+lhfOxjDeJwvEFJgtNFwlJS6yxBbOy/uE=
X-Google-Smtp-Source: AGHT+IGqTty64ciSbgiZYwPKFc47h/nfQff6sQt809FnQA3MCrhG5Vv4t9nh6URRm2Smrb1cZvsEFwMqKcbSsJaiErlQfObhG7kS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b07:b0:3d1:a34b:4d01 with SMTP id
 e9e14a558f8ab-3d7ec202344mr100008435ab.8.1744567401349; Sun, 13 Apr 2025
 11:03:21 -0700 (PDT)
Date: Sun, 13 Apr 2025 11:03:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fbfc69.050a0220.2970f9.0330.GAE@google.com>
Subject: [syzbot] [kernfs?] possible deadlock in kernfs_fop_readdir
From: syzbot <syzbot+8fd10d8928ed1f715290@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a24588245776 Merge tag 'linux_kselftest-kunit-6.15-rc2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1133d7e4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fb8650d88e9fb80f
dashboard link: https://syzkaller.appspot.com/bug?extid=8fd10d8928ed1f715290
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0069877a1c74/disk-a2458824.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fac7768b7055/vmlinux-a2458824.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c2a8b46a4db5/bzImage-a2458824.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8fd10d8928ed1f715290@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.15.0-rc1-syzkaller-00060-ga24588245776 #0 Not tainted
------------------------------------------------------
syz.1.191/7483 is trying to acquire lock:
ffff88806a269fe0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:193

but task is already holding lock:
ffff88801bef5148 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_fop_readdir+0x274/0x870 fs/kernfs/dir.c:1890

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #5 (&root->kernfs_rwsem){++++}-{4:4}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       down_write+0x9c/0x220 kernel/locking/rwsem.c:1577
       kernfs_add_one+0x41/0x530 fs/kernfs/dir.c:791
       kernfs_create_dir_ns+0xd9/0x120 fs/kernfs/dir.c:1091
       sysfs_create_dir_ns+0x1a2/0x3f0 fs/sysfs/dir.c:59
       create_dir lib/kobject.c:73 [inline]
       kobject_add_internal+0x435/0x8d0 lib/kobject.c:240
       kobject_add_varg lib/kobject.c:374 [inline]
       kobject_init_and_add+0x126/0x190 lib/kobject.c:457
       btrfs_sysfs_add_qgroups+0x117/0x2f0 fs/btrfs/sysfs.c:2616
       btrfs_quota_enable+0x287/0x21a0 fs/btrfs/qgroup.c:1030
       btrfs_ioctl_quota_ctl+0x144/0x1c0 fs/btrfs/ioctl.c:3676
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #4 (&fs_info->qgroup_ioctl_lock){+.+.}-{4:4}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       __mutex_lock_common kernel/locking/mutex.c:601 [inline]
       __mutex_lock+0x1a5/0x10c0 kernel/locking/mutex.c:746
       btrfs_quota_enable+0x2cb/0x21a0 fs/btrfs/qgroup.c:1059
       btrfs_ioctl_quota_ctl+0x144/0x1c0 fs/btrfs/ioctl.c:3676
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #3 (btrfs_trans_num_extwriters){++++}-{0:0}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       join_transaction+0x1aa/0xe60 fs/btrfs/transaction.c:321
       start_transaction+0x770/0x16b0 fs/btrfs/transaction.c:705
       btrfs_rebuild_free_space_tree+0xb4/0x500 fs/btrfs/free-space-tree.c:1317
       btrfs_start_pre_rw_mount+0xef1/0x1310 fs/btrfs/disk-io.c:3074
       open_ctree+0x246c/0x2990 fs/btrfs/disk-io.c:3614
       btrfs_fill_super fs/btrfs/super.c:972 [inline]
       btrfs_get_tree_super fs/btrfs/super.c:1898 [inline]
       btrfs_get_tree+0x131c/0x19e0 fs/btrfs/super.c:2093
       vfs_get_tree+0x90/0x2b0 fs/super.c:1759
       fc_mount+0x1b/0xb0 fs/namespace.c:1293
       btrfs_get_tree_subvol fs/btrfs/super.c:2051 [inline]
       btrfs_get_tree+0x68a/0x19e0 fs/btrfs/super.c:2094
       vfs_get_tree+0x90/0x2b0 fs/super.c:1759
       do_new_mount+0x2cf/0xb70 fs/namespace.c:3879
       do_mount fs/namespace.c:4219 [inline]
       __do_sys_mount fs/namespace.c:4430 [inline]
       __se_sys_mount+0x38c/0x400 fs/namespace.c:4407
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (btrfs_trans_num_writers){++++}-{0:0}:
       reacquire_held_locks+0x12a/0x1e0 kernel/locking/lockdep.c:5383
       __lock_release kernel/locking/lockdep.c:5572 [inline]
       lock_release+0x27a/0x3e0 kernel/locking/lockdep.c:5887
       percpu_up_read include/linux/percpu-rwsem.h:100 [inline]
       __sb_end_write include/linux/fs.h:1778 [inline]
       sb_end_intwrite+0x26/0x1c0 include/linux/fs.h:1895
       __btrfs_end_transaction+0x251/0x630 fs/btrfs/transaction.c:1075
       btrfs_dirty_inode+0x151/0x1a0 fs/btrfs/inode.c:6140
       inode_update_time fs/inode.c:2076 [inline]
       __file_update_time fs/inode.c:2305 [inline]
       file_update_time+0x314/0x450 fs/inode.c:2335
       btrfs_page_mkwrite+0x666/0x16e0 fs/btrfs/file.c:1814
       do_page_mkwrite+0x159/0x340 mm/memory.c:3287
       do_shared_fault mm/memory.c:5594 [inline]
       do_fault mm/memory.c:5656 [inline]
       do_pte_missing mm/memory.c:4160 [inline]
       handle_pte_fault+0x10c6/0x61c0 mm/memory.c:5997
       __handle_mm_fault mm/memory.c:6140 [inline]
       handle_mm_fault+0x1030/0x1aa0 mm/memory.c:6309
       do_user_addr_fault arch/x86/mm/fault.c:1388 [inline]
       handle_page_fault arch/x86/mm/fault.c:1480 [inline]
       exc_page_fault+0x2bb/0x920 arch/x86/mm/fault.c:1538
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623

-> #1 (sb_pagefaults#3){.+.+}-{0:0}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       percpu_down_read include/linux/percpu-rwsem.h:52 [inline]
       __sb_start_write include/linux/fs.h:1783 [inline]
       sb_start_pagefault include/linux/fs.h:1948 [inline]
       btrfs_page_mkwrite+0x3ea/0x16e0 fs/btrfs/file.c:1798
       do_page_mkwrite+0x159/0x340 mm/memory.c:3287
       do_shared_fault mm/memory.c:5594 [inline]
       do_fault mm/memory.c:5656 [inline]
       do_pte_missing mm/memory.c:4160 [inline]
       handle_pte_fault+0x10c6/0x61c0 mm/memory.c:5997
       __handle_mm_fault mm/memory.c:6140 [inline]
       handle_mm_fault+0x1030/0x1aa0 mm/memory.c:6309
       do_user_addr_fault arch/x86/mm/fault.c:1388 [inline]
       handle_page_fault arch/x86/mm/fault.c:1480 [inline]
       exc_page_fault+0x2bb/0x920 arch/x86/mm/fault.c:1538
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623

-> #0 (&mm->mmap_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3166 [inline]
       check_prevs_add kernel/locking/lockdep.c:3285 [inline]
       validate_chain+0xa69/0x24e0 kernel/locking/lockdep.c:3909
       __lock_acquire+0xad5/0xd80 kernel/locking/lockdep.c:5235
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       down_read_killable+0xcb/0xcb0 kernel/locking/rwsem.c:1547
       mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:193
       get_mmap_lock_carefully mm/memory.c:6355 [inline]
       lock_mm_and_find_vma+0x29c/0x2f0 mm/memory.c:6406
       do_user_addr_fault arch/x86/mm/fault.c:1360 [inline]
       handle_page_fault arch/x86/mm/fault.c:1480 [inline]
       exc_page_fault+0x1c1/0x920 arch/x86/mm/fault.c:1538
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
       filldir64+0x2bb/0x690 fs/readdir.c:-1
       dir_emit include/linux/fs.h:3861 [inline]
       kernfs_fop_readdir+0x545/0x870 fs/kernfs/dir.c:1907
       iterate_dir+0x5a9/0x760 fs/readdir.c:108
       __do_sys_getdents64 fs/readdir.c:403 [inline]
       __se_sys_getdents64+0x1e4/0x4c0 fs/readdir.c:389
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &mm->mmap_lock --> &fs_info->qgroup_ioctl_lock --> &root->kernfs_rwsem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(&root->kernfs_rwsem);
                               lock(&fs_info->qgroup_ioctl_lock);
                               lock(&root->kernfs_rwsem);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

3 locks held by syz.1.191/7483:
 #0: ffff88804c9ff7b8 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x247/0x310 fs/file.c:1213
 #1: ffff888050392988 (&type->i_mutex_dir_key#6){++++}-{4:4}, at: iterate_dir+0x4a6/0x760 fs/readdir.c:101
 #2: ffff88801bef5148 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_fop_readdir+0x274/0x870 fs/kernfs/dir.c:1890

stack backtrace:
CPU: 1 UID: 0 PID: 7483 Comm: syz.1.191 Not tainted 6.15.0-rc1-syzkaller-00060-ga24588245776 #0 PREEMPT(full) 
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
 down_read_killable+0xcb/0xcb0 kernel/locking/rwsem.c:1547
 mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:193
 get_mmap_lock_carefully mm/memory.c:6355 [inline]
 lock_mm_and_find_vma+0x29c/0x2f0 mm/memory.c:6406
 do_user_addr_fault arch/x86/mm/fault.c:1360 [inline]
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x1c1/0x920 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:filldir64+0x2bb/0x690 fs/readdir.c:374
Code: e8 48 8b 44 24 58 49 89 46 08 48 8b 4c 24 18 48 8b 44 24 50 48 89 01 48 8b 44 24 20 8b 54 24 34 66 89 41 10 88 51 12 4d 63 f7 <42> c6 44 31 13 00 48 8d 69 13 bf 07 00 00 00 44 89 fe e8 6e b4 80
RSP: 0018:ffffc90004bafc38 EFLAGS: 00050283
RAX: 0000000000000030 RBX: 0000200000003008 RCX: 0000200000002fd8
RDX: 0000000000000008 RSI: 0000200000002fb8 RDI: 0000200000003008
RBP: 00007ffffffff000 R08: ffffffff8242a42a R09: 1ffff1100b26cb40
R10: dffffc0000000000 R11: ffffed100b26cb41 R12: ffff88802912bac0
R13: ffffc90004bafe50 R14: 0000000000000016 R15: 0000000000000016
 dir_emit include/linux/fs.h:3861 [inline]
 kernfs_fop_readdir+0x545/0x870 fs/kernfs/dir.c:1907
 iterate_dir+0x5a9/0x760 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:403 [inline]
 __se_sys_getdents64+0x1e4/0x4c0 fs/readdir.c:389
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f63a2d8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f63a3b38038 EFLAGS: 00000246 ORIG_RAX: 00000000000000d9
RAX: ffffffffffffffda RBX: 00007f63a2fa6080 RCX: 00007f63a2d8d169
RDX: 0000000000001002 RSI: 0000200000002f40 RDI: 0000000000000004
RBP: 00007f63a2e0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f63a2fa6080 R15: 00007fff8a00fe88
 </TASK>
----------------
Code disassembly (best guess):
   0:	e8 48 8b 44 24       	call   0x24448b4d
   5:	58                   	pop    %rax
   6:	49 89 46 08          	mov    %rax,0x8(%r14)
   a:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   f:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  14:	48 89 01             	mov    %rax,(%rcx)
  17:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  1c:	8b 54 24 34          	mov    0x34(%rsp),%edx
  20:	66 89 41 10          	mov    %ax,0x10(%rcx)
  24:	88 51 12             	mov    %dl,0x12(%rcx)
  27:	4d 63 f7             	movslq %r15d,%r14
* 2a:	42 c6 44 31 13 00    	movb   $0x0,0x13(%rcx,%r14,1) <-- trapping instruction
  30:	48 8d 69 13          	lea    0x13(%rcx),%rbp
  34:	bf 07 00 00 00       	mov    $0x7,%edi
  39:	44 89 fe             	mov    %r15d,%esi
  3c:	e8                   	.byte 0xe8
  3d:	6e                   	outsb  %ds:(%rsi),(%dx)
  3e:	b4 80                	mov    $0x80,%ah


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
