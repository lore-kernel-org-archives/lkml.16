Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AAA253350
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346125; cv=none; b=MwAkhKgrO1unidPaC6Jz6IBsOPFcRV+6ZQmwsgZep5ng0cU9V65ZkTBsX+2xsbSaPaArjFyVhOO99OnzsL3wZnqt0YtTRPWCdFSuuOg4CU9zxEzOQJGMFoC0ijGirHTe8EkIVJ2QEF4ERJr9vwb8fxLh/m98nmbZv1hofrCGWgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346125; c=relaxed/simple;
	bh=9nRL265B5MO/sKcagw/DxpI7o+kerMTNwxI2AamJ1ls=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ua22jSd9KN8bzEZEAna4QLdPOSAnwzfg7MHrQFnq+dFwcg9rnHMX+JXtLoh6KFMBKw79grgLzRXsZqENVpdaXoczFTyJ16xfqbbwxBG4f4ARjVRcSVivCywiPY2qtznmHiQK+psUqYKXhKvdXXwBiQgMktlXrAOWdPT6mS6ADIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85dcaf42b61so618637739f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748346123; x=1748950923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ykmBg9S8w4Biu6msKSUlC0yua99wElNsL3lrFEPPVs=;
        b=WTcRQPIu/g1Ns46Ty2MQxbL1uFdH3X+4pdvV5gQ42fRp5ldwrkaAGiO+c7uStHyPyH
         NvnwFChcByMyUKXob2ItHxdDaCd7goHpqJ1Du9CN4SeI8ZOpsSE1mn1hGOUyzPJb6JAb
         A7x/YVbzmAFUqz+TD4w8ABMJi3MT+dgAvXsMaO5vD+V+4qXuCsISIRl7IZkucW5JTXY1
         E0f6CKTiTsgTvuniGkJmcPO/W14pU8va4+fzDInTEAUEk7l39E7iFqG6SdON90Tqo+rV
         h4ii2bg2uzv5gR/qh9wgPs2G4T4KlwqVJHTXpmXAFULpH/49b3dgPuuIUZj2O1fR5GsQ
         2oyg==
X-Forwarded-Encrypted: i=1; AJvYcCV7nl2I/ziVOgHrpZM7zTnkxmRs0o+OqKppfL6ntvtfPWrEdSFRbQ6191CVCJL4+GSuL9Sruyx5etJ/660=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuKJHVoJP9XDWf371kb/Z/94uKCEHItVB2QPo+HPgqecbURKvK
	K677hQunPFQ7e3f2x1NlVv1WGnPRyg+xLl/dl45VzmrmBwYZslr4S34VVKxebziZJHh3WH2KISS
	HflBRJ0xrM3jnBLuNSMwA85DEJz5yvJIIV17nBDaTxy/vtu+0o9i1bP9klGE=
X-Google-Smtp-Source: AGHT+IHiMEXHUsBCtqOETsblbvnspeBVmdyGlXk6fjhq2EiVsRKLof9BESSPdnMkkv6FioY0s/Cvn3zrzwczMtZPfi+d0nNRtB30
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3a02:b0:85c:96a5:dc2c with SMTP id
 ca18e2360f4ac-86cbb8bee7emr1327095039f.14.1748346123092; Tue, 27 May 2025
 04:42:03 -0700 (PDT)
Date: Tue, 27 May 2025 04:42:03 -0700
In-Reply-To: <20250527112459.2370-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6835a50b.a70a0220.253bc2.00af.GAE@google.com>
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
6.15.0-syzkaller-g914873bc7df9-dirty #0 Not tainted
------------------------------------------------------
kworker/u4:1/13 is trying to acquire lock:
ffff888059e20358 (&disk->open_mutex){+.+.}-{4:4}, at: __del_gendisk+0x129/0x9e0 block/genhd.c:706

but task is already holding lock:
ffff888053877188 (&set->update_nr_hwq_lock){++++}-{4:4}, at: del_gendisk+0xe0/0x160 block/genhd.c:818

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&set->update_nr_hwq_lock){++++}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
       blk_mq_update_nr_hw_queues+0x3b/0x14c0 block/blk-mq.c:5041
       nbd_start_device+0x16c/0xac0 drivers/block/nbd.c:1476
       nbd_genl_connect+0x1250/0x1930 drivers/block/nbd.c:2201
       genl_family_rcv_msg_doit+0x212/0x300 net/netlink/genetlink.c:1115
       genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
       genl_rcv_msg+0x60e/0x790 net/netlink/genetlink.c:1210
       netlink_rcv_skb+0x21c/0x490 net/netlink/af_netlink.c:2534
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
       netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
       netlink_unicast+0x758/0x8d0 net/netlink/af_netlink.c:1339
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
       do_syscall_64+0xf6/0x220 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&nbd->config_lock){+.+.}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __mutex_lock_common kernel/locking/mutex.c:601 [inline]
       __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:746
       nbd_open+0x2b7/0x5d0 drivers/block/nbd.c:1703
       blkdev_get_whole+0x98/0x510 block/bdev.c:730
       bdev_open+0x31e/0xd30 block/bdev.c:957
       blkdev_open+0x3a8/0x510 block/fops.c:676
       do_dentry_open+0xdf3/0x1970 fs/open.c:964
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
       do_syscall_64+0xf6/0x220 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (nbd_index_mutex){+.+.}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __mutex_lock_common kernel/locking/mutex.c:601 [inline]
       __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:746
       nbd_open+0x7b/0x5d0 drivers/block/nbd.c:1690
       blkdev_get_whole+0x98/0x510 block/bdev.c:730
       bdev_open+0x31e/0xd30 block/bdev.c:957
       blkdev_open+0x3a8/0x510 block/fops.c:676
       do_dentry_open+0xdf3/0x1970 fs/open.c:964
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
       do_syscall_64+0xf6/0x220 arch/x86/entry/syscall_64.c:94
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
       process_scheduled_works+0xade/0x17a0 kernel/workqueue.c:3319
       worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
       kthread+0x70e/0x8a0 kernel/kthread.c:464
       ret_from_fork+0x4e/0x80 arch/x86/kernel/process.c:148
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

3 locks held by kworker/u4:1/13:
 #0: ffff888000b13148 ((wq_completion)nbd-del){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff888000b13148 ((wq_completion)nbd-del){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
 #1: ffffc900001f7c60 ((work_completion)(&nbd->remove_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc900001f7c60 ((work_completion)(&nbd->remove_work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
 #2: ffff888053877188 (&set->update_nr_hwq_lock){++++}-{4:4}, at: del_gendisk+0xe0/0x160 block/genhd.c:818

stack backtrace:
CPU: 0 UID: 0 PID: 13 Comm: kworker/u4:1 Not tainted 6.15.0-syzkaller-g914873bc7df9-dirty #0 PREEMPT(full) 
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
 process_scheduled_works+0xade/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4e/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
wlan0: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
wlan0: Creating new IBSS network, BSSID 50:50:50:50:50:50
wlan1: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50


Tested on:

commit:         914873bc Merge tag 'x86-build-2025-05-25' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=141fbdf4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eeb82b5d1d67d535
dashboard link: https://syzkaller.appspot.com/bug?extid=2e9e529ac0b319316453
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13f7bdf4580000

