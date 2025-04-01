Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A6194080
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496348; cv=none; b=DojwI/OatSNIqL8k51sN/h1iHma0VCzvKEWxW5asYytn1QxloUNreOrYDuGD0/cxTeXA/6EGAQJ0h5QghthYAJg45PQSrdKYpNl8eYpka2W++GbWpBjsV7kewLqqLB738puzcbjRXytm1f75JNS7iIMsZId3ayPWx7cthCJZmdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496348; c=relaxed/simple;
	bh=KqOQ9m/Ot5w4O+9EGmMbL9Bizmui5k1mkrPFOjyqvs0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lYyr9XY9iovAiXNT6NGsuWP6ilPzYnomZ7KSF8mzuT/5xLDlViXO3UuQUNQXPuKdMwXKb/v9V7GxxiasUDVFY55GYCi4ZVHg4le3rNAAZNGtdxPGgqBdrVimeDPtMSeGO2bdUVCP96eObop3HxZvR5xqBSTuK6pPD8V1FkmKNtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85d9a52717aso470932239f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496346; x=1744101146;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVK3j3H03XBBKQ9M+1fohKel2dWO0xNzbUV/oYMskjE=;
        b=iiXv5z5QpoQeOG/6vO54yV/EC7YivMYijr3AWT2iGdkYU8c88H7uIJFmdVdN1UcCU1
         bIyP3sZzSfUK5QEFSClk+XVVVN4QeFCCvShLU9nJP0hKvCUczP2TNRQhkzCU4FeYQwQ8
         lNjENTr+goEvR1eCTrkbkZmnMx5I6xaoLqdETSI1YUQ/15tiT8WB3XWzgMTwk7ufVrlk
         SJzzEg1YvUbzwnT4ugBas5lp01udSzaNP7VLSL+dBBYg9vhIVkLe8VpiTXbM/auKuFRo
         f5k0gAVjpJhSSk46JZUjChgEwxxNvNU0merHTdQ0q9gLmWojzQ/HDaR/4LFbr9xaeRxQ
         DeOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEU6SN1Z7PWQAVS+DsaiPgU5NfnyQbsEivoyQ6D96TKgK1PXmN7GdExdBuShNCMcLzO+2b7QKxeV2s8Ts=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDz51V5SJO/NBPNZ25rVZXeyFNqx2JucoEJhpR9mVhFaiBaClY
	VKa5twLHaOSkOxF+5nTEsaoKELYZvTyaGxROGGX7FGWclOSHOHgKu/d1E+5/9aQXTYFsuYycHv1
	/EFPsOwwE/87AyFejjFQLGFTArr+1PcFxwHLL3Z70pe1Mw103l+eRJ6A=
X-Google-Smtp-Source: AGHT+IGrpvBBXapErW/BtxDFfgI7u34lpmzB/JwIllEZZcfqxutbsBcHXIkHDUV0Mj986a5EF1Cvi219FK9hotcHUk4oeAQDVdW7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:441a:20b0:3d6:cb9b:cbe9 with SMTP id
 e9e14a558f8ab-3d6cb9bce19mr10868595ab.5.1743496345816; Tue, 01 Apr 2025
 01:32:25 -0700 (PDT)
Date: Tue, 01 Apr 2025 01:32:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eba499.050a0220.297a31.0009.GAE@google.com>
Subject: [syzbot] [kernfs?] possible deadlock in kernfs_iop_getattr
From: syzbot <syzbot+4bb2305559463e8f6a2a@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    acb4f33713b9 Merge tag 'm68knommu-for-v6.15' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=141a064c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd14976ddc05593f
dashboard link: https://syzkaller.appspot.com/bug?extid=4bb2305559463e8f6a2a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0a5c59c65f84/disk-acb4f337.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3da19a126568/vmlinux-acb4f337.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b6b972905364/bzImage-acb4f337.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4bb2305559463e8f6a2a@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.14.0-syzkaller-07422-gacb4f33713b9 #0 Not tainted
------------------------------------------------------
syz.2.1091/9434 is trying to acquire lock:
ffff88801bef71e0 (&root->kernfs_iattr_rwsem){++++}-{4:4}, at: kernfs_iop_getattr+0xd3/0x490 fs/kernfs/inode.c:191

but task is already holding lock:
ffff888025395868 (&q->q_usage_counter(io)#19){++++}-{0:0}, at: blk_mq_freeze_queue include/linux/blk-mq.h:928 [inline]
ffff888025395868 (&q->q_usage_counter(io)#19){++++}-{0:0}, at: loop_change_fd drivers/block/loop.c:643 [inline]
ffff888025395868 (&q->q_usage_counter(io)#19){++++}-{0:0}, at: lo_ioctl+0x203b/0x2850 drivers/block/loop.c:1569

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&q->q_usage_counter(io)#19){++++}-{0:0}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       blk_alloc_queue+0x542/0x620 block/blk-core.c:461
       blk_mq_alloc_queue block/blk-mq.c:4349 [inline]
       __blk_mq_alloc_disk+0x162/0x380 block/blk-mq.c:4396
       loop_add+0x445/0xaf0 drivers/block/loop.c:2067
       loop_init+0x168/0x220 drivers/block/loop.c:2302
       do_one_initcall+0x24a/0x940 init/main.c:1257
       do_initcall_level+0x157/0x210 init/main.c:1319
       do_initcalls+0x71/0xd0 init/main.c:1335
       kernel_init_freeable+0x432/0x5d0 init/main.c:1567
       kernel_init+0x1d/0x2b0 init/main.c:1457
       ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       __fs_reclaim_acquire mm/page_alloc.c:3853 [inline]
       fs_reclaim_acquire+0x88/0x130 mm/page_alloc.c:3867
       might_alloc include/linux/sched/mm.h:318 [inline]
       slab_pre_alloc_hook mm/slub.c:4089 [inline]
       slab_alloc_node mm/slub.c:4167 [inline]
       kmem_cache_alloc_noprof+0x49/0x390 mm/slub.c:4194
       __kernfs_iattrs+0x94/0x280 fs/kernfs/inode.c:37
       kernfs_iattrs fs/kernfs/inode.c:60 [inline]
       __kernfs_setattr fs/kernfs/inode.c:73 [inline]
       kernfs_iop_setattr+0x125/0x410 fs/kernfs/inode.c:127
       notify_change+0xbca/0xe90 fs/attr.c:552
       do_truncate+0x222/0x310 fs/open.c:65
       handle_truncate fs/namei.c:3466 [inline]
       do_open fs/namei.c:3849 [inline]
       path_openat+0x2e4f/0x35d0 fs/namei.c:4004
       do_filp_open+0x284/0x4e0 fs/namei.c:4031
       do_sys_openat2+0x12b/0x1d0 fs/open.c:1429
       do_sys_open fs/open.c:1444 [inline]
       __do_sys_openat fs/open.c:1460 [inline]
       __se_sys_openat fs/open.c:1455 [inline]
       __x64_sys_openat+0x249/0x2a0 fs/open.c:1455
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (iattr_mutex){+.+.}-{4:4}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       __mutex_lock_common kernel/locking/mutex.c:587 [inline]
       __mutex_lock+0x1a5/0x10c0 kernel/locking/mutex.c:732
       __kernfs_iattrs+0x2b/0x280 fs/kernfs/inode.c:32
       kernfs_iattrs fs/kernfs/inode.c:60 [inline]
       __kernfs_setattr fs/kernfs/inode.c:73 [inline]
       kernfs_iop_setattr+0x125/0x410 fs/kernfs/inode.c:127
       notify_change+0xbca/0xe90 fs/attr.c:552
       do_truncate+0x222/0x310 fs/open.c:65
       handle_truncate fs/namei.c:3466 [inline]
       do_open fs/namei.c:3849 [inline]
       path_openat+0x2e4f/0x35d0 fs/namei.c:4004
       do_filp_open+0x284/0x4e0 fs/namei.c:4031
       do_sys_openat2+0x12b/0x1d0 fs/open.c:1429
       do_sys_open fs/open.c:1444 [inline]
       __do_sys_openat fs/open.c:1460 [inline]
       __se_sys_openat fs/open.c:1455 [inline]
       __x64_sys_openat+0x249/0x2a0 fs/open.c:1455
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&root->kernfs_iattr_rwsem){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3166 [inline]
       check_prevs_add kernel/locking/lockdep.c:3285 [inline]
       validate_chain+0xa69/0x24e0 kernel/locking/lockdep.c:3909
       __lock_acquire+0xad5/0xd80 kernel/locking/lockdep.c:5235
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       down_read+0xb3/0xa50 kernel/locking/rwsem.c:1524
       kernfs_iop_getattr+0xd3/0x490 fs/kernfs/inode.c:191
       loop_query_min_dio_size drivers/block/loop.c:529 [inline]
       loop_assign_backing_file+0x276/0x500 drivers/block/loop.c:582
       loop_change_fd drivers/block/loop.c:645 [inline]
       lo_ioctl+0x20a9/0x2850 drivers/block/loop.c:1569
       blkdev_ioctl+0x5df/0x710 block/ioctl.c:698
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &root->kernfs_iattr_rwsem --> fs_reclaim --> &q->q_usage_counter(io)#19

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&q->q_usage_counter(io)#19);
                               lock(fs_reclaim);
                               lock(&q->q_usage_counter(io)#19);
  rlock(&root->kernfs_iattr_rwsem);

 *** DEADLOCK ***

3 locks held by syz.2.1091/9434:
 #0: ffff8880253ac368 (&lo->lo_mutex){+.+.}-{4:4}, at: loop_global_lock_killable drivers/block/loop.c:118 [inline]
 #0: ffff8880253ac368 (&lo->lo_mutex){+.+.}-{4:4}, at: loop_change_fd drivers/block/loop.c:610 [inline]
 #0: ffff8880253ac368 (&lo->lo_mutex){+.+.}-{4:4}, at: lo_ioctl+0x135f/0x2850 drivers/block/loop.c:1569
 #1: ffff888025395868 (&q->q_usage_counter(io)#19){++++}-{0:0}, at: blk_mq_freeze_queue include/linux/blk-mq.h:928 [inline]
 #1: ffff888025395868 (&q->q_usage_counter(io)#19){++++}-{0:0}, at: loop_change_fd drivers/block/loop.c:643 [inline]
 #1: ffff888025395868 (&q->q_usage_counter(io)#19){++++}-{0:0}, at: lo_ioctl+0x203b/0x2850 drivers/block/loop.c:1569
 #2: ffff8880253958a0 (&q->q_usage_counter(queue)#20){+.+.}-{0:0}, at: blk_mq_freeze_queue include/linux/blk-mq.h:928 [inline]
 #2: ffff8880253958a0 (&q->q_usage_counter(queue)#20){+.+.}-{0:0}, at: loop_change_fd drivers/block/loop.c:643 [inline]
 #2: ffff8880253958a0 (&q->q_usage_counter(queue)#20){+.+.}-{0:0}, at: lo_ioctl+0x203b/0x2850 drivers/block/loop.c:1569

stack backtrace:
CPU: 0 UID: 0 PID: 9434 Comm: syz.2.1091 Not tainted 6.14.0-syzkaller-07422-gacb4f33713b9 #0 PREEMPT(full) 
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
 down_read+0xb3/0xa50 kernel/locking/rwsem.c:1524
 kernfs_iop_getattr+0xd3/0x490 fs/kernfs/inode.c:191
 loop_query_min_dio_size drivers/block/loop.c:529 [inline]
 loop_assign_backing_file+0x276/0x500 drivers/block/loop.c:582
 loop_change_fd drivers/block/loop.c:645 [inline]
 lo_ioctl+0x20a9/0x2850 drivers/block/loop.c:1569
 blkdev_ioctl+0x5df/0x710 block/ioctl.c:698
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f110418d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1101fd5038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f11043a6080 RCX: 00007f110418d169
RDX: 0000000000000005 RSI: 0000000000004c06 RDI: 0000000000000004
RBP: 00007f110420e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f11043a6080 R15: 00007f11044cfa28
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
