Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A208156F5E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749978210; cv=none; b=VAuCqfEa4ORVEdTs5FRQ5CwOkHPMVpJDEqRlbnw7Ju5jxZmh3tOnWLdOKHOYvzx5FL+tlvxjj3pD5/0oR1+vvaCUh29BeOEZgf34saxa1HPW7FXEvg0LbzlFP14RY4ndYZ5krKyYHdlfz/dvQ2+WfNFl454BKVwxdrIxX6UDJuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749978210; c=relaxed/simple;
	bh=EEq74IJW4HuHyBAXqiVB89DLWrkUzvRFzzOI8dllAd4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nGkPwpMV77CdnxwrfTHJTTWIQf6Hy4YBsPz3c1q7VH6zZh2JXGbqw4/6c3F87DT2poabHcUZsvf29ZtH7ZqR2ZdjgpmAspZ8AU3KyTt9Jrgh+1yiL54skOXmaY5Mlasa4tj3nqN0qofAizQWKS3V45Q9xPqqZ4DHi+DB4gSPdTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddc3f14171so43491405ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 02:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749978207; x=1750583007;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iA8I/Onrt5dmmCeCbAdDZirLYpZcVQs3ysEmpdO5AkY=;
        b=bSw5BoGaU5we7YAAe1SACLvE/aaC+p8G+n1tBsKtEX+H0v90F9/BgpjaLBI8oz6/B0
         uXeI0T33APgYniMDs0tuP0lb3blXJBsndr5OziUe+ZolcT+0LwoTVMBJXoDjVCxyQdiY
         uKnHZRVOzytobjaBEVi3IrW2jSMczAz5Lwv4uY3Cm36PeIrZjTDxBzcR3KoPA+3mr1K7
         m/v0L+nwuKtbToxCJdefTM9/RLoV+J4Fq52pLFbCbzigSJPA/1FiJ9xziHVP0OR7m6dw
         v1PUq02LwuPKJ6eII/y8HrshEppWyVQ2QcdWldrLt+QmP3tvt9DhqYpmpeGZdWWp/EN6
         4DBA==
X-Forwarded-Encrypted: i=1; AJvYcCWOK5tnuOk7HgSFndvVI4H5aBdMOwVwdqNTk8doko7vzF4egrweRecugw+zm0oD0vVdMyPEr65FervH+Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxINWVhkvZ2g85SVuHcfG5ubK43QIWn4Wwi9W0LWNNyrO3nKF6F
	AfjqUtcMJCwLL/R1ILr32+j0cWWX43YSpSS9yPANwViGeCC1B/S2C9c/+693axcjYmMfa0pM83z
	RMIzVUc+CnUIH+ucmSEYnKEaOQIiWUDzVw8U7zM1Q+W6O2SyT3L9IQUohTsM=
X-Google-Smtp-Source: AGHT+IFElDoxyGEkXWDm2MobfeDp2PDKWAANzGPHdZm/957sJnSjlZjuHJziFZi8DZdko+BsGPcINm249TPq3rsMKypLWhXCXaW1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d84:b0:3d4:3ab3:daf0 with SMTP id
 e9e14a558f8ab-3de07cb6219mr59534875ab.7.1749978207510; Sun, 15 Jun 2025
 02:03:27 -0700 (PDT)
Date: Sun, 15 Jun 2025 02:03:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684e8c5f.a00a0220.c6bd7.0012.GAE@google.com>
Subject: [syzbot] [kernfs?] possible deadlock in do_page_mkwrite (3)
From: syzbot <syzbot+47c7d1a51f51d13f5723@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    aef17cb3d3c4 Revert "mm/damon/Kconfig: enable CONFIG_DAMON..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=134d860c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=47c7d1a51f51d13f5723
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/024adef3dfaa/disk-aef17cb3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3d3db279441c/vmlinux-aef17cb3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/97c1b8499471/bzImage-aef17cb3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+47c7d1a51f51d13f5723@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.16.0-rc1-syzkaller-00004-gaef17cb3d3c4 #0 Not tainted
------------------------------------------------------
syz.0.516/10641 is trying to acquire lock:
ffff888027744520 (sb_pagefaults#2){.+.+}-{0:0}, at: do_page_mkwrite+0x14a/0x310 mm/memory.c:3378

but task is already holding lock:
ffff88801b2fd188 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_fop_readdir+0x264/0x870 fs/kernfs/dir.c:1893

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (&root->kernfs_rwsem){++++}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
       kernfs_add_one+0x41/0x520 fs/kernfs/dir.c:791
       kernfs_create_dir_ns+0xde/0x130 fs/kernfs/dir.c:1093
       sysfs_create_dir_ns+0x123/0x280 fs/sysfs/dir.c:59
       create_dir lib/kobject.c:73 [inline]
       kobject_add_internal+0x59f/0xb40 lib/kobject.c:240
       kobject_add_varg lib/kobject.c:374 [inline]
       kobject_init_and_add+0x125/0x190 lib/kobject.c:457
       btrfs_sysfs_add_qgroups+0x111/0x2b0 fs/btrfs/sysfs.c:2635
       btrfs_quota_enable+0x278/0x1d50 fs/btrfs/qgroup.c:1030
       btrfs_ioctl_quota_ctl+0x183/0x1c0 fs/btrfs/ioctl.c:3673
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #3 (&fs_info->qgroup_ioctl_lock){+.+.}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:747
       btrfs_quota_enable+0x2be/0x1d50 fs/btrfs/qgroup.c:1059
       btrfs_ioctl_quota_ctl+0x183/0x1c0 fs/btrfs/ioctl.c:3673
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (btrfs_trans_num_extwriters){++++}-{0:0}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       join_transaction+0x1a4/0xd70 fs/btrfs/transaction.c:321
       start_transaction+0x6b6/0x1620 fs/btrfs/transaction.c:705
       btrfs_rebuild_free_space_tree+0xb1/0x4e0 fs/btrfs/free-space-tree.c:1333
       btrfs_start_pre_rw_mount+0xd76/0x1180 fs/btrfs/disk-io.c:3077
       open_ctree+0x2078/0x2800 fs/btrfs/disk-io.c:3617
       btrfs_fill_super+0x19d/0x2e0 fs/btrfs/super.c:968
       btrfs_get_tree_super fs/btrfs/super.c:1893 [inline]
       btrfs_get_tree+0x107c/0x1630 fs/btrfs/super.c:2088
       vfs_get_tree+0x92/0x2b0 fs/super.c:1802
       fc_mount+0x1c/0xb0 fs/namespace.c:1290
       btrfs_get_tree_subvol fs/btrfs/super.c:2046 [inline]
       btrfs_get_tree+0x67d/0x1630 fs/btrfs/super.c:2089
       vfs_get_tree+0x92/0x2b0 fs/super.c:1802
       do_new_mount+0x24a/0xa40 fs/namespace.c:3885
       do_mount fs/namespace.c:4222 [inline]
       __do_sys_mount fs/namespace.c:4433 [inline]
       __se_sys_mount+0x317/0x410 fs/namespace.c:4410
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (btrfs_trans_num_writers){++++}-{0:0}:
       reacquire_held_locks+0x127/0x1d0 kernel/locking/lockdep.c:5388
       __lock_release kernel/locking/lockdep.c:5577 [inline]
       lock_release+0x1b4/0x3e0 kernel/locking/lockdep.c:5892
       percpu_up_read include/linux/percpu-rwsem.h:112 [inline]
       __sb_end_write include/linux/fs.h:1788 [inline]
       sb_end_intwrite+0x26/0x1c0 include/linux/fs.h:1905
       __btrfs_end_transaction+0x248/0x640 fs/btrfs/transaction.c:1076
       btrfs_dirty_inode+0x14c/0x190 fs/btrfs/inode.c:6239
       inode_update_time fs/inode.c:2076 [inline]
       __file_update_time fs/inode.c:2305 [inline]
       file_update_time+0x347/0x490 fs/inode.c:2335
       btrfs_page_mkwrite+0x572/0x18b0 fs/btrfs/file.c:1870
       do_page_mkwrite+0x14a/0x310 mm/memory.c:3378
       do_shared_fault mm/memory.c:5686 [inline]
       do_fault mm/memory.c:5748 [inline]
       do_pte_missing mm/memory.c:4251 [inline]
       handle_pte_fault mm/memory.c:6089 [inline]
       __handle_mm_fault+0x1a60/0x5620 mm/memory.c:6232
       handle_mm_fault+0x2d5/0x7f0 mm/memory.c:6401
       do_user_addr_fault+0x764/0x1390 arch/x86/mm/fault.c:1387
       handle_page_fault arch/x86/mm/fault.c:1476 [inline]
       exc_page_fault+0x76/0xf0 arch/x86/mm/fault.c:1532
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623

-> #0 (sb_pagefaults#2){.+.+}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
       __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
       __sb_start_write include/linux/fs.h:1793 [inline]
       sb_start_pagefault include/linux/fs.h:1958 [inline]
       btrfs_page_mkwrite+0x308/0x18b0 fs/btrfs/file.c:1852
       do_page_mkwrite+0x14a/0x310 mm/memory.c:3378
       wp_page_shared mm/memory.c:3779 [inline]
       do_wp_page+0x268d/0x5800 mm/memory.c:3998
       handle_pte_fault mm/memory.c:6105 [inline]
       __handle_mm_fault+0x1144/0x5620 mm/memory.c:6232
       handle_mm_fault+0x2d5/0x7f0 mm/memory.c:6401
       do_user_addr_fault+0x764/0x1390 arch/x86/mm/fault.c:1387
       handle_page_fault arch/x86/mm/fault.c:1476 [inline]
       exc_page_fault+0x76/0xf0 arch/x86/mm/fault.c:1532
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
       filldir64+0x2b2/0x690 fs/readdir.c:-1
       dir_emit include/linux/fs.h:3915 [inline]
       kernfs_fop_readdir+0x537/0x870 fs/kernfs/dir.c:1910
       iterate_dir+0x5af/0x770 fs/readdir.c:108
       __do_sys_getdents64 fs/readdir.c:410 [inline]
       __se_sys_getdents64+0xe4/0x260 fs/readdir.c:396
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  sb_pagefaults#2 --> &fs_info->qgroup_ioctl_lock --> &root->kernfs_rwsem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(&root->kernfs_rwsem);
                               lock(&fs_info->qgroup_ioctl_lock);
                               lock(&root->kernfs_rwsem);
  rlock(sb_pagefaults#2);

 *** DEADLOCK ***

4 locks held by syz.0.516/10641:
 #0: ffff8880318837b8 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x247/0x320 fs/file.c:1213
 #1: ffff88805bb8cb58 (&type->i_mutex_dir_key#6){++++}-{4:4}, at: iterate_dir+0x49f/0x770 fs/readdir.c:101
 #2: ffff88801b2fd188 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_fop_readdir+0x264/0x870 fs/kernfs/dir.c:1893
 #3: ffff88801a473660 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_trylock include/linux/mmap_lock.h:431 [inline]
 #3: ffff88801a473660 (&mm->mmap_lock){++++}-{4:4}, at: get_mmap_lock_carefully mm/mmap_lock.c:188 [inline]
 #3: ffff88801a473660 (&mm->mmap_lock){++++}-{4:4}, at: lock_mm_and_find_vma+0x32/0x300 mm/mmap_lock.c:248

stack backtrace:
CPU: 0 UID: 0 PID: 10641 Comm: syz.0.516 Not tainted 6.16.0-rc1-syzkaller-00004-gaef17cb3d3c4 #0 PREEMPT(full) 
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
 percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
 percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
 __sb_start_write include/linux/fs.h:1793 [inline]
 sb_start_pagefault include/linux/fs.h:1958 [inline]
 btrfs_page_mkwrite+0x308/0x18b0 fs/btrfs/file.c:1852
 do_page_mkwrite+0x14a/0x310 mm/memory.c:3378
 wp_page_shared mm/memory.c:3779 [inline]
 do_wp_page+0x268d/0x5800 mm/memory.c:3998
 handle_pte_fault mm/memory.c:6105 [inline]
 __handle_mm_fault+0x1144/0x5620 mm/memory.c:6232
 handle_mm_fault+0x2d5/0x7f0 mm/memory.c:6401
 do_user_addr_fault+0x764/0x1390 arch/x86/mm/fault.c:1387
 handle_page_fault arch/x86/mm/fault.c:1476 [inline]
 exc_page_fault+0x76/0xf0 arch/x86/mm/fault.c:1532
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:filldir64+0x2b2/0x690 fs/readdir.c:378
Code: e7 0f 82 5b 02 00 00 49 39 ef 0f 87 52 02 00 00 0f 01 cb 0f ae e8 48 8b 44 24 50 49 89 44 24 08 48 8b 4c 24 08 48 8b 44 24 58 <48> 89 01 48 8b 04 24 8b 54 24 14 49 bc 00 00 00 00 00 fc ff df 66
RSP: 0000:ffffc90005267c50 EFLAGS: 00050283
RAX: 000000000000008b RBX: ffffc90005267e38 RCX: 0000200000004000
RDX: 0000000000000002 RSI: 0000200000003fd8 RDI: 0000200000004020
RBP: 00007ffffffff000 R08: ffff88802c1a1e07 R09: 1ffff110058343c0
R10: dffffc0000000000 R11: ffffed10058343c1 R12: 0000200000003fd8
R13: ffff8880270adbe0 R14: 000000000000000b R15: 0000200000004020
 dir_emit include/linux/fs.h:3915 [inline]
 kernfs_fop_readdir+0x537/0x870 fs/kernfs/dir.c:1910
 iterate_dir+0x5af/0x770 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:410 [inline]
 __se_sys_getdents64+0xe4/0x260 fs/readdir.c:396
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5163b8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f51649b8038 EFLAGS: 00000246 ORIG_RAX: 00000000000000d9
RAX: ffffffffffffffda RBX: 00007f5163db6080 RCX: 00007f5163b8e929
RDX: 0000000000001010 RSI: 0000200000003fc0 RDI: 0000000000000003
RBP: 00007f5163c10b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f5163db6080 R15: 00007ffe6998fd08
 </TASK>
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	0f 82 5b 02 00 00    	jb     0x261
   6:	49 39 ef             	cmp    %rbp,%r15
   9:	0f 87 52 02 00 00    	ja     0x261
   f:	0f 01 cb             	stac
  12:	0f ae e8             	lfence
  15:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  1a:	49 89 44 24 08       	mov    %rax,0x8(%r12)
  1f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  24:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
* 29:	48 89 01             	mov    %rax,(%rcx) <-- trapping instruction
  2c:	48 8b 04 24          	mov    (%rsp),%rax
  30:	8b 54 24 14          	mov    0x14(%rsp),%edx
  34:	49 bc 00 00 00 00 00 	movabs $0xdffffc0000000000,%r12
  3b:	fc ff df
  3e:	66                   	data16


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
