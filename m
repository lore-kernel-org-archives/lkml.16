Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577CD18DB34
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749491491; cv=none; b=ub0HhuOPbxG4Rsu07+yQ0TXfIYO7ZiFumrnQ9pqsscP8vV8ws0XOiwjgHllXY4/tOYAl8yqkT2zgOkYiAoDKljZhlaOjmbLldmZc9eOks/ejSMUXdbhHdEaP/Cd4xzLSVEeSj2pyUhtOg9iOTqoikNNCTJbzRNiAGwba5W5Bkg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749491491; c=relaxed/simple;
	bh=qXNvVwjN185hbGLpvAFBN+nIFW0X3lPr4MrpmAr0DAk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AutyBXJBpc1xYrGnZGW0MXpbIBD0DrPcga0b88+TVwVFc67zhqLs4DL3BsMO2XUuzEHzbmHXia4d77QKZ6uhMMSDlT1z+r6I//KfPj8HuhcPtD/hA+89JqLiU6tekAqLYs/0MsWBbiLamMG1PnomLrAp2cMeXGP8sP/F3UtCwjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ddc147611fso101358255ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749491488; x=1750096288;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzrU8pbyqjYarig2Rb+thUxACpWpnT2BiF45uldu5XY=;
        b=EkkVDPV0kJS2JN7Z2nNOYfogLGGUvluvoOkA+Rja9Y9w5BnbRg1qsgo/aq0pXDwGXw
         D7Qkd8d4YqcwfR0nUUXwPLlZdLkMK9T6Tt7Kaev7GS30HOk5ejQvuIRoZ6YQWvApVI3c
         xWGMV8i0iCCozRu8YPbhlKouhNtbJJ5j3ItG6Rfq4Q5AGPH2uDK7duEmb9sCvdlZ6Jx5
         H7OE2hF1JQ5/jPqSyvC9IQT7CZAP11p1N6rQKyQXJwHfvqR5Cm0jfbiV7UTx4a36XHOO
         qeZGmeXVzIUYh07vg2kCkNlAgTRRNTghkHdfFmiUgaTZ6+vBniT2Xm6hLkfMku1Xs6zk
         6Ulw==
X-Forwarded-Encrypted: i=1; AJvYcCVxGvdbzfIB66tRwug0M5yw82kIsyVVuh959sWdb41mLRqjCpfYVeNX9myZ81UsmbCqyNxIvG7WFBMd/dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBxTLfd+hm81qsyrgd19PR4rv8xHA+hnUwbzsxhXkXlHcgezLJ
	lxTHOi/QSf92WNgzS7jYJzFG/SxL8uEzq1wqALorHk8GijIeoEWVBrQ7oW2Oh7y+DPpFChHWpq4
	78nSp63o6cFegeItnWITTV6F7dsEcT8wxTDc0g0i79eNmXr0oTWzgxoDyQko=
X-Google-Smtp-Source: AGHT+IHwIyWwWv98v19qa/8CMkXbeIzdpgKZV2KTpiOJuMPaK5zI1ycDMVHtQzXffbO4u1e+g54kHlAXDkQzi5lDQp89g3J+FzoS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17c5:b0:3dd:cb92:f148 with SMTP id
 e9e14a558f8ab-3ddce435ca5mr168374495ab.12.1749491488343; Mon, 09 Jun 2025
 10:51:28 -0700 (PDT)
Date: Mon, 09 Jun 2025 10:51:28 -0700
In-Reply-To: <683d5a99.a00a0220.d8eae.0049.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68471f20.050a0220.33aa0e.02c5.GAE@google.com>
Subject: Re: [syzbot] [kernel?] possible deadlock in static_key_slow_inc (4)
From: syzbot <syzbot+61afb501981e58b312f8@syzkaller.appspotmail.com>
To: ardb@kernel.org, jbaron@akamai.com, jpoimboe@kernel.org, 
	linux-kernel@vger.kernel.org, peterz@infradead.org, rostedt@goodmis.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    19272b37aa4f Linux 6.16-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1682f20c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4c8362784bb7796
dashboard link: https://syzkaller.appspot.com/bug?extid=61afb501981e58b312f8
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15fb29d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10c60d70580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0ceded60de88/disk-19272b37.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/51f4990c81f8/vmlinux-19272b37.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7addf73549b9/bzImage-19272b37.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+61afb501981e58b312f8@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.16.0-rc1-syzkaller #0 Not tainted
------------------------------------------------------
syz-executor966/5834 is trying to acquire lock:
ffffffff8e2666d0 (cpu_hotplug_lock){++++}-{0:0}, at: static_key_slow_inc+0x12/0x30 kernel/jump_label.c:190

but task is already holding lock:
ffff888025d1a9c8 (&q->rq_qos_mutex){+.+.}-{4:4}, at: wbt_init+0x393/0x540 block/blk-wbt.c:923

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&q->rq_qos_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:747
       wbt_init+0x393/0x540 block/blk-wbt.c:923
       queue_wb_lat_store+0x354/0x3d0 block/blk-sysfs.c:603
       queue_attr_store+0x279/0x320 block/blk-sysfs.c:805
       sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x351/0x510 fs/kernfs/file.c:334
       new_sync_write fs/read_write.c:593 [inline]
       vfs_write+0x6c4/0x1150 fs/read_write.c:686
       ksys_write+0x12a/0x250 fs/read_write.c:738
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&q->q_usage_counter(io)#18){++++}-{0:0}:
       blk_alloc_queue+0x619/0x760 block/blk-core.c:461
       blk_mq_alloc_queue+0x175/0x290 block/blk-mq.c:4396
       __blk_mq_alloc_disk+0x29/0x120 block/blk-mq.c:4443
       loop_add+0x49e/0xb70 drivers/block/loop.c:2014
       loop_init+0x164/0x270 drivers/block/loop.c:2249
       do_one_initcall+0x120/0x6e0 init/main.c:1273
       do_initcall_level init/main.c:1335 [inline]
       do_initcalls init/main.c:1351 [inline]
       do_basic_setup init/main.c:1370 [inline]
       kernel_init_freeable+0x5c2/0x900 init/main.c:1583
       kernel_init+0x1c/0x2b0 init/main.c:1473
       ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #1 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4045 [inline]
       fs_reclaim_acquire+0x102/0x150 mm/page_alloc.c:4059
       might_alloc include/linux/sched/mm.h:318 [inline]
       slab_pre_alloc_hook mm/slub.c:4099 [inline]
       slab_alloc_node mm/slub.c:4177 [inline]
       __kmalloc_cache_node_noprof+0x53/0x420 mm/slub.c:4367
       kmalloc_node_noprof include/linux/slab.h:928 [inline]
       alloc_worker kernel/workqueue.c:2647 [inline]
       create_worker+0x10f/0x7e0 kernel/workqueue.c:2790
       workqueue_prepare_cpu+0xb5/0x160 kernel/workqueue.c:6650
       cpuhp_invoke_callback+0x3d5/0xa10 kernel/cpu.c:194
       __cpuhp_invoke_callback_range+0x101/0x210 kernel/cpu.c:967
       cpuhp_invoke_callback_range kernel/cpu.c:991 [inline]
       cpuhp_up_callbacks kernel/cpu.c:1022 [inline]
       _cpu_up+0x3f5/0x930 kernel/cpu.c:1687
       cpu_up+0x1dc/0x240 kernel/cpu.c:1719
       cpuhp_bringup_mask+0xd8/0x210 kernel/cpu.c:1785
       cpuhp_bringup_cpus_parallel kernel/cpu.c:1875 [inline]
       bringup_nonboot_cpus+0x176/0x1c0 kernel/cpu.c:1889
       smp_init+0x34/0x160 kernel/smp.c:1010
       kernel_init_freeable+0x3a8/0x900 init/main.c:1575
       kernel_init+0x1c/0x2b0 init/main.c:1473
       ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (cpu_hotplug_lock){++++}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain kernel/locking/lockdep.c:3911 [inline]
       __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5240
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5828
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read include/linux/percpu-rwsem.h:77 [inline]
       cpus_read_lock+0x42/0x160 kernel/cpu.c:490
       static_key_slow_inc+0x12/0x30 kernel/jump_label.c:190
       rq_qos_add+0x2f8/0x4b0 block/blk-rq-qos.c:349
       wbt_init+0x3a9/0x540 block/blk-wbt.c:924
       queue_wb_lat_store+0x354/0x3d0 block/blk-sysfs.c:603
       queue_attr_store+0x279/0x320 block/blk-sysfs.c:805
       sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x351/0x510 fs/kernfs/file.c:334
       new_sync_write fs/read_write.c:593 [inline]
       vfs_write+0x6c4/0x1150 fs/read_write.c:686
       ksys_write+0x12a/0x250 fs/read_write.c:738
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  cpu_hotplug_lock --> &q->q_usage_counter(io)#18 --> &q->rq_qos_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&q->rq_qos_mutex);
                               lock(&q->q_usage_counter(io)#18);
                               lock(&q->rq_qos_mutex);
  rlock(cpu_hotplug_lock);

 *** DEADLOCK ***

6 locks held by syz-executor966/5834:
 #0: ffff888036170428 (sb_writers#7){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:738
 #1: ffff8880350a8c88 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x28f/0x510 fs/kernfs/file.c:325
 #2: ffff888141331008 (kn->active#50){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x2b2/0x510 fs/kernfs/file.c:326
 #3: ffff888025d1a7c8 (&q->q_usage_counter(io)#18){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x15/0x20 block/blk-mq.c:205
 #4: ffff888025d1a800 (&q->q_usage_counter(queue)#20){+.+.}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x15/0x20 block/blk-mq.c:205
 #5: ffff888025d1a9c8 (&q->rq_qos_mutex){+.+.}-{4:4}, at: wbt_init+0x393/0x540 block/blk-wbt.c:923

stack backtrace:
CPU: 0 UID: 0 PID: 5834 Comm: syz-executor966 Not tainted 6.16.0-rc1-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x275/0x350 kernel/locking/lockdep.c:2046
 check_noncircular+0x14c/0x170 kernel/locking/lockdep.c:2178
 check_prev_add kernel/locking/lockdep.c:3168 [inline]
 check_prevs_add kernel/locking/lockdep.c:3287 [inline]
 validate_chain kernel/locking/lockdep.c:3911 [inline]
 __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5240
 lock_acquire kernel/locking/lockdep.c:5871 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5828
 percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
 percpu_down_read include/linux/percpu-rwsem.h:77 [inline]
 cpus_read_lock+0x42/0x160 kernel/cpu.c:490
 static_key_slow_inc+0x12/0x30 kernel/jump_label.c:190
 rq_qos_add+0x2f8/0x4b0 block/blk-rq-qos.c:349
 wbt_init+0x3a9/0x540 block/blk-wbt.c:924
 queue_wb_lat_store+0x354/0x3d0 block/blk-sysfs.c:603
 queue_attr_store+0x279/0x320 block/blk-sysfs.c:805
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x351/0x510 fs/kernfs/file.c:334
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x6c4/0x1150 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd083326329
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd743f1218 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007ffd743f13


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
