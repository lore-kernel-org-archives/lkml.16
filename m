Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9EB229B1A
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515265; cv=none; b=raybZxF0tMQ5pK1G7f9gsZmzZ44O2zY6gLnYh2g8LYWk6Tk8aPvAm6eeL4RRqQ+GT/x/H3g+9HjVvhxU6VpSBoTtqGX5NXSYH9CgJq+I9YafQxFLP3NpCbpZUiXZdklEpjWyvTLgqYTmd+hW+KnM5DOGN/lcvKAnFXSrMtr/se4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515265; c=relaxed/simple;
	bh=BD/p+q3nyb7mcMBxCQ9/1sSiRcqFvqJoK2KlslK3PGQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=d/8FmEhtbgjq+EL8BdPLwPZh3tsnSrsh89zqYgVncnNVLFGub5dxevx5YRkAmpubc/r63xneNlojkc9SlEEkAtKFrzY/VUlN6i0ctDWumMy5pbN0AW9gizEio5suzlR7kJ1tCYaxBYhLN9/n3lHV9gk8WsE36HclNjVj+qrM/QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85e7551197bso79424939f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515263; x=1749120063;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEFkLSsxbPpYjirsgZP7WbHX9Y/5W7Yk0kPNnHbIn8s=;
        b=X6x6Czhv0h7kANYdQrxTbfrW4OKyTuFrN5yGvY4jB2HsEjUc8iSjTTrB2ZnGjxuRM0
         l77WsGbgURDUFQ2oeJRrnvIqqV9KopE/Gnub/amSIuxuVRMqTbAPd1XTev7FrqFsvZ6j
         0UMzlHAK1DHfGfYflWdlDKxAlsoqkx5mRZK8Lgue2c/hZlLnPe9RPwLg7cP7PDeoMLaw
         zxtvWF23psjyDr/MMhAeYuDlt0ORa7uFqhbCRqHiWjHW6tf+nERLqE/gA6rC3TQyoqLV
         nA4cv7IuGiisfmi3WS5ydBp/WIpINRARqTzdfa7eg+kfqgVpcx8s1jAbwNHCM4tBNKHz
         SPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgIACaFc6YaxblPodFuovN3lTwjMxqKoRV2TPW9p2sihGZ+1jN235Awvz1n5+QKtBvfSO+CwC8Bo9af3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLxWmmtmo8ut6+TbjlOK54QcIyUO341TXOohdQUoij57yBjDp0
	yp7tm3p3D9iyaMjFkskGdOVhWAXgbRPMUzzm/Y/CiHVEp4HW/bW6g9puWCgIAiAwinDw+25+Td3
	1D0t2xbse3YLWKMVVj0tgzNmjf6971y7+V4bhICZNPVuONlNzmr8NkdiXe40=
X-Google-Smtp-Source: AGHT+IHyAxMwziaBp4IF7dGVc3/IKk8XYkD3i8sWYQGL+CcdB6bFPbiUelzYuBC6V+HxBKS13qkjNzHVHquYq+QhWwO3tbH6iyK9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:7215:b0:867:bf9:64d5 with SMTP id
 ca18e2360f4ac-86cf29e70d8mr430011839f.2.1748515262792; Thu, 29 May 2025
 03:41:02 -0700 (PDT)
Date: Thu, 29 May 2025 03:41:02 -0700
In-Reply-To: <20250529102503.2425-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683839be.a00a0220.52848.0004.GAE@google.com>
Subject: Re: [syzbot] [block?] possible deadlock in __del_gendisk
From: syzbot <syzbot+2e9e529ac0b319316453@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in __del_gendisk

======================================================
WARNING: possible circular locking dependency detected
6.15.0-syzkaller-g90b83efa6701-dirty #0 Not tainted
------------------------------------------------------
kworker/u4:2/31 is trying to acquire lock:
ffff888000617358 (&disk->open_mutex){+.+.}-{4:4}, at: __del_gendisk+0x129/0x9e0 block/genhd.c:706

but task is already holding lock:
ffff88803f055188 (&set->update_nr_hwq_lock){++++}-{4:4}, at: del_gendisk+0xe0/0x160 block/genhd.c:818

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&set->update_nr_hwq_lock){++++}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
       blk_mq_update_nr_hw_queues+0x3b/0x14c0 block/blk-mq.c:5041
       nbd_start_device+0x16c/0xac0 drivers/block/nbd.c:1476
       nbd_genl_connect+0x1250/0x1930 drivers/block/nbd.c:2203
       genl_family_rcv_msg_doit+0x215/0x300 net/netlink/genetlink.c:1115
       genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
       genl_rcv_msg+0x60e/0x790 net/netlink/genetlink.c:1210
       netlink_rcv_skb+0x208/0x470 net/netlink/af_netlink.c:2534
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
       netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
       netlink_unicast+0x75b/0x8d0 net/netlink/af_netlink.c:1339
       netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1883
       sock_sendmsg_nosec net/socket.c:712 [inline]
       __sock_sendmsg+0x21c/0x270 net/socket.c:727
       ____sys_sendmsg+0x505/0x830 net/socket.c:2566
       ___sys_sendmsg+0x21f/0x2a0 net/socket.c:2620
       __sys_sendmsg net/socket.c:2652 [inline]
       __do_sys_sendmsg net/socket.c:2657 [inline]
       __se_sys_sendmsg net/socket.c:2655 [inline]
       __x64_sys_sendmsg+0x19b/0x260 net/socket.c:2655
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&nbd->config_lock){+.+.}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __mutex_lock_common kernel/locking/mutex.c:601 [inline]
       __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:746
       nbd_open+0x2c3/0x5f0 drivers/block/nbd.c:1704
       blkdev_get_whole+0x98/0x510 block/bdev.c:730
       bdev_open+0x31e/0xd30 block/bdev.c:957
       blkdev_open+0x3a8/0x510 block/fops.c:676
       do_dentry_open+0xdf0/0x1970 fs/open.c:964
       vfs_open+0x3b/0x340 fs/open.c:1094
       do_open fs/namei.c:3887 [inline]
       path_openat+0x2ee5/0x3830 fs/namei.c:4046
       do_filp_open+0x1fa/0x410 fs/namei.c:4073
       do_sys_openat2+0x121/0x1c0 fs/open.c:1437
       do_sys_open fs/open.c:1452 [inline]
       __do_sys_openat fs/open.c:1468 [inline]
       __se_sys_openat fs/open.c:1463 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1463
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&disk->open_mutex){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
       __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __mutex_lock_common kernel/locking/mutex.c:601 [inline]
       __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:746
       __del_gendisk+0x129/0x9e0 block/genhd.c:706
       del_gendisk+0xe8/0x160 block/genhd.c:819
       nbd_dev_remove drivers/block/nbd.c:268 [inline]
       nbd_dev_remove_work+0x47/0xe0 drivers/block/nbd.c:284
       process_one_work kernel/workqueue.c:3238 [inline]
       process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
       worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
       kthread+0x70e/0x8a0 kernel/kthread.c:464
       ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

Chain exists of:
  &disk->open_mutex --> &nbd->config_lock --> &set->update_nr_hwq_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(&set->update_nr_hwq_lock);
                               lock(&nbd->config_lock);
                               lock(&set->update_nr_hwq_lock);
  lock(&disk->open_mutex);

 *** DEADLOCK ***

3 locks held by kworker/u4:2/31:
 #0: ffff88801f97e148 ((wq_completion)nbd-del){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801f97e148 ((wq_completion)nbd-del){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3321
 #1: ffffc90000527bc0 ((work_completion)(&nbd->remove_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90000527bc0 ((work_completion)(&nbd->remove_work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3321
 #2: ffff88803f055188 (&set->update_nr_hwq_lock){++++}-{4:4}, at: del_gendisk+0xe0/0x160 block/genhd.c:818

stack backtrace:
CPU: 0 UID: 0 PID: 31 Comm: kworker/u4:2 Not tainted 6.15.0-syzkaller-g90b83efa6701-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: nbd-del nbd_dev_remove_work
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
 __mutex_lock_common kernel/locking/mutex.c:601 [inline]
 __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:746
 __del_gendisk+0x129/0x9e0 block/genhd.c:706
 del_gendisk+0xe8/0x160 block/genhd.c:819
 nbd_dev_remove drivers/block/nbd.c:268 [inline]
 nbd_dev_remove_work+0x47/0xe0 drivers/block/nbd.c:284
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         90b83efa Merge tag 'bpf-next-6.16' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16892482580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=262b2977ef00756b
dashboard link: https://syzkaller.appspot.com/bug?extid=2e9e529ac0b319316453
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1345dbf4580000

