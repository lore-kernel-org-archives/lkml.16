Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F4E1C6BE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744317212; cv=none; b=IT5gwGy23wh/W6Il2l0DiHZ5NhZOGtcR6UC7jpQqt5V6Clk/Q3A+NnXeSUEQvQ7dseHxlQVEO5lbKfyJd0MMjeErhBP5RBwSsUaIy+rRRlmSU/7o1n+aXEYN/J8YABSB9PWLcJVUXc1g7Mw6tYBmI932chwSr5Mf/v+lUcHUdCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744317212; c=relaxed/simple;
	bh=p9D5LVyotfH+P4i+02smV1WqoOe83TtK3Nu2Lithkog=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=l3LIANzF9+VDzcFE/c5MVaWf6nlR637tbSALcROEWvwcsFTQpw58pOwcey9PzzckUcDXMFit2xU6ndEkXbRiTgMpvF0QBFQDnfvEWtLNqi/V/OqbLGrcuw2DWY919tjbs3i2acjN7RmEsnAYc1KED8lY9wtoB6lj7pshoMX5AsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d5da4fd946so26108105ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744317210; x=1744922010;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRn5/A+cHyiNQu94a3ZDaKiqG1FYzt+SDZwwlYlSt/I=;
        b=Ca8SIco+rQFKC06ssM/ddwediDNmu7tGKxdIpaIN0dmmYQok9p70Yn+vn1egDui17L
         NvLKYdvJHpKJCTMwCccLTDwDjsWgHimL6zw1PzP7/P8q3Zbtq+SOKjCRjpnsp5ydyvKO
         v/D/hPibSb/VmvcRThEQtGaIbGQ2SeBYhVjyvcalE2pUvv5z7UJE7nAh3m6WvAZL7n7k
         O4u2O2G+ge8GQ2eDd/Ztihd0oPftyRt0BjOq7d/nK7ZwrotZqn0gg5LlAQxtkElx/atP
         aLdUtEEDsTy1pQ8UMyo79nSMcxBsEDjQlWDhm8phLftOcIpmpMh9y9yiMcCLCV5seypQ
         bx9A==
X-Forwarded-Encrypted: i=1; AJvYcCWtHi+fBsAzxOf9/YzP38bO7uHwdW0CqSU/s68oF792Fr2psYn5fY1+YCtXX9f4ahx3i9Wc003fqhytFJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/0GAOEODV2l3kgooRc7r5HoEvX3ywdgt/Ux8xux5gF6P+ydKK
	jPfnauDjo1jUt0Olu6on565TeXh2wesSW7k5PsiduHZi2HSErw4IN4Tt4ncdNNYk0m2WLBp/IQq
	N2zHpF6SxrLQP2hfyzgen7B62kwa1qbzKsqoHM5t1PwNLsWn0s4Fe62o=
X-Google-Smtp-Source: AGHT+IHOV1KLw8yy/b30NZDs/IR9I/NkNrH13LzJ48c8JJXdk2aph9j3S4FTY6EftrhmvrRkiOrNA1kX68mJyeNW41cJP/eosfxc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a6c:b0:3d0:4c9c:965f with SMTP id
 e9e14a558f8ab-3d7ec2732fdmr3494205ab.20.1744317209752; Thu, 10 Apr 2025
 13:33:29 -0700 (PDT)
Date: Thu, 10 Apr 2025 13:33:29 -0700
In-Reply-To: <67eba499.050a0220.297a31.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f82b19.050a0220.355867.000f.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] possible deadlock in kernfs_iop_getattr
From: syzbot <syzbot+4bb2305559463e8f6a2a@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    2eb959eeecc6 Merge tag 'for-linus-6.15a-rc2-tag' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16fdf23f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4c918722cb7e3d7
dashboard link: https://syzkaller.appspot.com/bug?extid=4bb2305559463e8f6a2a
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1352b7e4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17499d78580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-2eb959ee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e48cee99a6e9/vmlinux-2eb959ee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6087fbb17208/bzImage-2eb959ee.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4bb2305559463e8f6a2a@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.15.0-rc1-syzkaller-00095-g2eb959eeecc6 #0 Not tainted
------------------------------------------------------
syz-executor105/5947 is trying to acquire lock:
ffff88801c68e9e0 (&root->kernfs_iattr_rwsem){++++}-{4:4}, at: kernfs_iop_getattr+0x9c/0xf0 fs/kernfs/inode.c:191

but task is already holding lock:
ffff8881070c75a8 (&q->q_usage_counter(io)#26){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x15/0x20 block/blk-mq.c:215

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&q->q_usage_counter(io)#26){++++}-{0:0}:
       blk_alloc_queue+0x619/0x760 block/blk-core.c:461
       blk_mq_alloc_queue+0x179/0x290 block/blk-mq.c:4348
       __blk_mq_alloc_disk+0x29/0x120 block/blk-mq.c:4395
       loop_add+0x496/0xb70 drivers/block/loop.c:2067
       loop_init+0x164/0x270 drivers/block/loop.c:2302
       do_one_initcall+0x120/0x6e0 init/main.c:1257
       do_initcall_level init/main.c:1319 [inline]
       do_initcalls init/main.c:1335 [inline]
       do_basic_setup init/main.c:1354 [inline]
       kernel_init_freeable+0x5c2/0x900 init/main.c:1567
       kernel_init+0x1c/0x2b0 init/main.c:1457
       ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4028 [inline]
       fs_reclaim_acquire+0x102/0x150 mm/page_alloc.c:4042
       might_alloc include/linux/sched/mm.h:318 [inline]
       slab_pre_alloc_hook mm/slub.c:4102 [inline]
       slab_alloc_node mm/slub.c:4180 [inline]
       kmem_cache_alloc_noprof+0x53/0x3b0 mm/slub.c:4207
       __kernfs_iattrs+0xbc/0x3f0 fs/kernfs/inode.c:37
       kernfs_iattrs fs/kernfs/inode.c:60 [inline]
       __kernfs_setattr+0x4d/0x3c0 fs/kernfs/inode.c:73
       kernfs_iop_setattr+0xda/0x120 fs/kernfs/inode.c:127
       notify_change+0x6a6/0x1230 fs/attr.c:552
       do_truncate+0x15b/0x220 fs/open.c:65
       handle_truncate fs/namei.c:3466 [inline]
       do_open fs/namei.c:3849 [inline]
       path_openat+0x2761/0x2d40 fs/namei.c:4004
       do_filp_open+0x20b/0x470 fs/namei.c:4031
       do_sys_openat2+0x11b/0x1d0 fs/open.c:1429
       do_sys_open fs/open.c:1444 [inline]
       __do_sys_openat fs/open.c:1460 [inline]
       __se_sys_openat fs/open.c:1455 [inline]
       __x64_sys_openat+0x174/0x210 fs/open.c:1455
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (iattr_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:601 [inline]
       __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:746
       __kernfs_iattrs+0x2b/0x3f0 fs/kernfs/inode.c:32
       kernfs_iattrs fs/kernfs/inode.c:60 [inline]
       __kernfs_setattr+0x4d/0x3c0 fs/kernfs/inode.c:73
       kernfs_iop_setattr+0xda/0x120 fs/kernfs/inode.c:127
       notify_change+0x6a6/0x1230 fs/attr.c:552
       do_truncate+0x15b/0x220 fs/open.c:65
       handle_truncate fs/namei.c:3466 [inline]
       do_open fs/namei.c:3849 [inline]
       path_openat+0x2761/0x2d40 fs/namei.c:4004
       do_filp_open+0x20b/0x470 fs/namei.c:4031
       do_sys_openat2+0x11b/0x1d0 fs/open.c:1429
       do_sys_open fs/open.c:1444 [inline]
       __do_sys_openat fs/open.c:1460 [inline]
       __se_sys_openat fs/open.c:1455 [inline]
       __x64_sys_openat+0x174/0x210 fs/open.c:1455
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&root->kernfs_iattr_rwsem){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3166 [inline]
       check_prevs_add kernel/locking/lockdep.c:3285 [inline]
       validate_chain kernel/locking/lockdep.c:3909 [inline]
       __lock_acquire+0x1173/0x1ba0 kernel/locking/lockdep.c:5235
       lock_acquire kernel/locking/lockdep.c:5866 [inline]
       lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5823
       down_read+0x9b/0x480 kernel/locking/rwsem.c:1524
       kernfs_iop_getattr+0x9c/0xf0 fs/kernfs/inode.c:191
       vfs_getattr_nosec+0x29a/0x3a0 fs/stat.c:208
       vfs_getattr+0x4a/0x60 fs/stat.c:246
       loop_query_min_dio_size.isra.0+0x120/0x260 drivers/block/loop.c:529
       loop_assign_backing_file drivers/block/loop.c:582 [inline]
       loop_change_fd drivers/block/loop.c:645 [inline]
       lo_ioctl+0x1ce0/0x26d0 drivers/block/loop.c:1569
       blkdev_ioctl+0x274/0x6d0 block/ioctl.c:698
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl fs/ioctl.c:892 [inline]
       __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &root->kernfs_iattr_rwsem --> fs_reclaim --> &q->q_usage_counter(io)#26

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&q->q_usage_counter(io)#26);
                               lock(fs_reclaim);
                               lock(&q->q_usage_counter(io)#26);
  rlock(&root->kernfs_iattr_rwsem);

 *** DEADLOCK ***

3 locks held by syz-executor105/5947:
 #0: ffff8880259ff368 (&lo->lo_mutex){+.+.}-{4:4}, at: loop_global_lock_killable drivers/block/loop.c:118 [inline]
 #0: ffff8880259ff368 (&lo->lo_mutex){+.+.}-{4:4}, at: loop_change_fd drivers/block/loop.c:610 [inline]
 #0: ffff8880259ff368 (&lo->lo_mutex){+.+.}-{4:4}, at: lo_ioctl+0x2a9/0x26d0 drivers/block/loop.c:1569
 #1: ffff8881070c75a8 (&q->q_usage_counter(io)#26){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x15/0x20 block/blk-mq.c:215
 #2: ffff8881070c75e0 (&q->q_usage_counter(queue)#20){+.+.}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x15/0x20 block/blk-mq.c:215

stack backtrace:
CPU: 2 UID: 0 PID: 5947 Comm: syz-executor105 Not tainted 6.15.0-rc1-syzkaller-00095-g2eb959eeecc6 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x275/0x350 kernel/locking/lockdep.c:2079
 check_noncircular+0x14c/0x170 kernel/locking/lockdep.c:2211
 check_prev_add kernel/locking/lockdep.c:3166 [inline]
 check_prevs_add kernel/locking/lockdep.c:3285 [inline]
 validate_chain kernel/locking/lockdep.c:3909 [inline]
 __lock_acquire+0x1173/0x1ba0 kernel/locking/lockdep.c:5235
 lock_acquire kernel/locking/lockdep.c:5866 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5823
 down_read+0x9b/0x480 kernel/locking/rwsem.c:1524
 kernfs_iop_getattr+0x9c/0xf0 fs/kernfs/inode.c:191
 vfs_getattr_nosec+0x29a/0x3a0 fs/stat.c:208
 vfs_getattr+0x4a/0x60 fs/stat.c:246
 loop_query_min_dio_size.isra.0+0x120/0x260 drivers/block/loop.c:529
 loop_assign_backing_file drivers/block/loop.c:582 [inline]
 loop_change_fd drivers/block/loop.c:645 [inline]
 lo_ioctl+0x1ce0/0x26d0 drivers/block/loop.c:1569
 blkdev_ioctl+0x274/0x6d0 block/ioctl.c:698
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f787e0f8e29
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd0efe9d88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f787e0f8e29
RDX: 0000000000000005 RSI: 0000000000004c06 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f787e142036
R13: 00007ffd0efe9dc0 R14: 00007ffd0efe9e00 R15: 0000000000000000
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
