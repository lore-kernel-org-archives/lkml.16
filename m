Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F70930E844
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750401874; cv=none; b=bBpJlnqpb8cwdHP/eubSL0c936tn/neTlzlrjEHI37e/q9nQnWlFyLFtfqAqOdOOxvnATFtcVpaTT9xt1ExFCXSj43pZ1kMx1DR1ZOGmVhv+KpuTPaHG1aaGCtKTwIvoiDX5erjAnnqK1dapAZhN6Bhg2NxBWDaxST4xfwGN4S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750401874; c=relaxed/simple;
	bh=IuX9OnDxBBz+1ciBAfgS400d2kqyO8qmn7NuWFcFdbg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=a7a/v+E/rJuy5776yMHxYzEOmOvEPiXr2/KB7hrjtHNIaThJR7KeoIM1fOCMSCfyEO0oQiSaOvT+zDeGUGWLExDHtJ1bTqkmVhwfVcgoEt4w528+4Uyg7+Wsn4qBOPQxRoyehBLEKag52zgEE4dad3dmoJlfEeZpDTDOaWva/ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso34923765ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750401872; x=1751006672;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VX2/R52FYOkHga9vNBJvaX0GIO+x3fVYtCAGM+iJSbs=;
        b=u7t8KfWBSusj2VQw4ZQGBrluXL5i+wvNIXP7ydzW8IP6UMVmbhgKwZacQBCgj/x6xe
         71Lz7I0dyomtREvQxhPq2P81X2SNssZeDYJOLuVAN6LAz3vGGa4St3vQWHq9yw0Geqso
         7VIHQOfm4MuQf6ADdgOY9sbXZmK+pWIcwyI28xKpC0QnXU5XeRahvnr4TVdd6s9jwzmn
         m7VB4qIWPmgsnN2dZVnGA1a1U021GrHY+Ae7JAs46IB4SsGjQIKrd2Ptj2+mwQXXP+ES
         Eprdr3h00+hutD5cVPzVvVeyjkMIfAYxbgUTsEXrPTjuYC6ZBg3MkftrNjpYv1dyFYJu
         6bHw==
X-Forwarded-Encrypted: i=1; AJvYcCVgxYSVnDuv1jh2gf4l6l5A8gaOdT9OTmdZTrHCTkoHaYPSxBuIGuJh71hRskzwvuwaWpOryqGnoYSVs2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0s+FAbOLhBgyvRaBgIkQi8qjUXYcpE5CWX4NQWe5Ll4aH21T
	l0Er13yvhe4N3B/N8GGjrJ/BFDm38zo54DstHpCCvFj/bkcQyLJCRNVKQF0JbLSx7rmyQlinzsy
	oP1EYpk2SY1oT5uQMJ4CtInx3JHIFvmRSYw8u1PONfSghE2toz9U8zaU6T5U=
X-Google-Smtp-Source: AGHT+IHXwHnnfJfwpwRytdGUwatqpl7k332n3p4RMUa2UzFV0EAKGBzX8Ej43937mLdX9XpiZLu+4SSSXTVB9jCgmTdtPCJkK2yf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3c86:b0:3dd:f530:e57 with SMTP id
 e9e14a558f8ab-3de38c1ba18mr20806225ab.3.1750401871782; Thu, 19 Jun 2025
 23:44:31 -0700 (PDT)
Date: Thu, 19 Jun 2025 23:44:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6855034f.a00a0220.137b3.0031.GAE@google.com>
Subject: [syzbot] [block?] possible deadlock in bdev_release
From: syzbot <syzbot+2bcecf3c38cb3e8fdc8d@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    306e57988197 Merge patch "riscv: defconfig: run savedefcon..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12cc0182580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=618b9468db3872f5
dashboard link: https://syzkaller.appspot.com/bug?extid=2bcecf3c38cb3e8fdc8d
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-306e5798.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5fee9bbe87f3/vmlinux-306e5798.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e959580bb405/Image-306e5798.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2bcecf3c38cb3e8fdc8d@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.16.0-rc1-syzkaller-g306e57988197 #0 Not tainted
------------------------------------------------------
syz.1.344/5839 is trying to acquire lock:
ffffaf8019912a30 (&nbd->config_lock){+.+.}-{4:4}, at: refcount_dec_and_mutex_lock+0x60/0xd8 lib/refcount.c:118

but task is already holding lock:
ffffaf8019fae358 (&disk->open_mutex){+.+.}-{4:4}, at: bdev_release+0x12c/0x600 block/bdev.c:1128

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&disk->open_mutex){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x1ac/0x448 kernel/locking/lockdep.c:5828
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x166/0x1292 kernel/locking/mutex.c:747
       mutex_lock_nested+0x14/0x1c kernel/locking/mutex.c:799
       __del_gendisk+0x132/0xac6 block/genhd.c:706
       del_gendisk+0xf6/0x19a block/genhd.c:819
       nbd_dev_remove+0x3c/0xf2 drivers/block/nbd.c:268
       nbd_dev_remove_work+0x1c/0x26 drivers/block/nbd.c:284
       process_one_work+0x96a/0x1f32 kernel/workqueue.c:3238
       process_scheduled_works kernel/workqueue.c:3321 [inline]
       worker_thread+0x5ce/0xde8 kernel/workqueue.c:3402
       kthread+0x39c/0x7d4 kernel/kthread.c:464
       ret_from_fork_kernel+0x2a/0xbb2 arch/riscv/kernel/process.c:214
       ret_from_fork_kernel_asm+0x16/0x18 arch/riscv/kernel/entry.S:327

-> #1 (&set->update_nr_hwq_lock){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x1ac/0x448 kernel/locking/lockdep.c:5828
       down_write+0x9c/0x19a kernel/locking/rwsem.c:1577
       blk_mq_update_nr_hw_queues+0x3e/0xb86 block/blk-mq.c:5041
       nbd_start_device+0x140/0xb2c drivers/block/nbd.c:1476
       nbd_genl_connect+0xae0/0x1b24 drivers/block/nbd.c:2201
       genl_family_rcv_msg_doit+0x206/0x2e6 net/netlink/genetlink.c:1115
       genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
       genl_rcv_msg+0x514/0x78e net/netlink/genetlink.c:1210
       netlink_rcv_skb+0x206/0x3be net/netlink/af_netlink.c:2534
       genl_rcv+0x36/0x4c net/netlink/genetlink.c:1219
       netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
       netlink_unicast+0x4f0/0x82c net/netlink/af_netlink.c:1339
       netlink_sendmsg+0x85e/0xdd6 net/netlink/af_netlink.c:1883
       sock_sendmsg_nosec net/socket.c:712 [inline]
       __sock_sendmsg+0xcc/0x160 net/socket.c:727
       ____sys_sendmsg+0x63e/0x79c net/socket.c:2566
       ___sys_sendmsg+0x144/0x1e6 net/socket.c:2620
       __sys_sendmsg+0x188/0x246 net/socket.c:2652
       __do_sys_sendmsg net/socket.c:2657 [inline]
       __se_sys_sendmsg net/socket.c:2655 [inline]
       __riscv_sys_sendmsg+0x70/0xa2 net/socket.c:2655
       syscall_handler+0x94/0x118 arch/riscv/include/asm/syscall.h:112
       do_trap_ecall_u+0x396/0x530 arch/riscv/kernel/traps.c:341
       handle_exception+0x146/0x152 arch/riscv/kernel/entry.S:197

-> #0 (&nbd->config_lock){+.+.}-{4:4}:
       check_noncircular+0x132/0x146 kernel/locking/lockdep.c:2178
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain kernel/locking/lockdep.c:3911 [inline]
       __lock_acquire+0x12b2/0x24ea kernel/locking/lockdep.c:5240
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x1ac/0x448 kernel/locking/lockdep.c:5828
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x166/0x1292 kernel/locking/mutex.c:747
       mutex_lock_nested+0x14/0x1c kernel/locking/mutex.c:799
       refcount_dec_and_mutex_lock+0x60/0xd8 lib/refcount.c:118
       nbd_config_put+0x3a/0x610 drivers/block/nbd.c:1423
       nbd_release+0x94/0x15c drivers/block/nbd.c:1735
       blkdev_put_whole+0xac/0xee block/bdev.c:721
       bdev_release+0x3fe/0x600 block/bdev.c:1144
       blkdev_release+0x1a/0x26 block/fops.c:684
       __fput+0x382/0xa8c fs/file_table.c:465
       ____fput+0x1c/0x26 fs/file_table.c:493
       task_work_run+0x16a/0x25e kernel/task_work.c:227
       resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
       exit_to_user_mode_loop+0x118/0x134 kernel/entry/common.c:114
       exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
       syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
       syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
       do_trap_ecall_u+0x3f0/0x530 arch/riscv/kernel/traps.c:355
       handle_exception+0x146/0x152 arch/riscv/kernel/entry.S:197

other info that might help us debug this:

Chain exists of:
  &nbd->config_lock --> &set->update_nr_hwq_lock --> &disk->open_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&disk->open_mutex);
                               lock(&set->update_nr_hwq_lock);
                               lock(&disk->open_mutex);
  lock(&nbd->config_lock);

 *** DEADLOCK ***

1 lock held by syz.1.344/5839:
 #0: ffffaf8019fae358 (&disk->open_mutex){+.+.}-{4:4}, at: bdev_release+0x12c/0x600 block/bdev.c:1128

stack backtrace:
CPU: 0 UID: 0 PID: 5839 Comm: syz.1.344 Not tainted 6.16.0-rc1-syzkaller-g306e57988197 #0 PREEMPT 
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffff80078bbe>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:132
[<ffffffff8000327a>] show_stack+0x30/0x3c arch/riscv/kernel/stacktrace.c:138
[<ffffffff8006103e>] __dump_stack lib/dump_stack.c:94 [inline]
[<ffffffff8006103e>] dump_stack_lvl+0x12e/0x1a6 lib/dump_stack.c:120
[<ffffffff800610d2>] dump_stack+0x1c/0x24 lib/dump_stack.c:129
[<ffffffff802ce116>] print_circular_bug+0x254/0x29a kernel/locking/lockdep.c:2046
[<ffffffff802ce28e>] check_noncircular+0x132/0x146 kernel/locking/lockdep.c:2178
[<ffffffff802d1468>] check_prev_add kernel/locking/lockdep.c:3168 [inline]
[<ffffffff802d1468>] check_prevs_add kernel/locking/lockdep.c:3287 [inline]
[<ffffffff802d1468>] validate_chain kernel/locking/lockdep.c:3911 [inline]
[<ffffffff802d1468>] __lock_acquire+0x12b2/0x24ea kernel/locking/lockdep.c:5240
[<ffffffff802d32de>] lock_acquire kernel/locking/lockdep.c:5871 [inline]
[<ffffffff802d32de>] lock_acquire+0x1ac/0x448 kernel/locking/lockdep.c:5828
[<ffffffff8630e424>] __mutex_lock_common kernel/locking/mutex.c:602 [inline]
[<ffffffff8630e424>] __mutex_lock+0x166/0x1292 kernel/locking/mutex.c:747
[<ffffffff8630f564>] mutex_lock_nested+0x14/0x1c kernel/locking/mutex.c:799
[<ffffffff8173119c>] refcount_dec_and_mutex_lock+0x60/0xd8 lib/refcount.c:118
[<ffffffff82c30b40>] nbd_config_put+0x3a/0x610 drivers/block/nbd.c:1423
[<ffffffff82c31336>] nbd_release+0x94/0x15c drivers/block/nbd.c:1735
[<ffffffff815304f6>] blkdev_put_whole+0xac/0xee block/bdev.c:721
[<ffffffff81534274>] bdev_release+0x3fe/0x600 block/bdev.c:1144
[<ffffffff81535462>] blkdev_release+0x1a/0x26 block/fops.c:684
[<ffffffff80bfbe7a>] __fput+0x382/0xa8c fs/file_table.c:465
[<ffffffff80bfc632>] ____fput+0x1c/0x26 fs/file_table.c:493
[<ffffffff801d7c16>] task_work_run+0x16a/0x25e kernel/task_work.c:227
[<ffffffff803b556e>] resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
[<ffffffff803b556e>] exit_to_user_mode_loop+0x118/0x134 kernel/entry/common.c:114
[<ffffffff862fcc8c>] exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
[<ffffffff862fcc8c>] syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
[<ffffffff862fcc8c>] syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
[<ffffffff862fcc8c>] do_trap_ecall_u+0x3f0/0x530 arch/riscv/kernel/traps.c:355
[<ffffffff863250ca>] handle_exception+0x146/0x152 arch/riscv/kernel/entry.S:197


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
