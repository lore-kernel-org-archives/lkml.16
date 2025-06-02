Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758D2C3273
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748851356; cv=none; b=YOfdJlXETe0jELJ3mEEYjktkp5mgoouR79HJGR6Uhs1FIjA8lyRvoRE5rr/sX+28UVoiDLZVL0fEgtuPEPa4XUalV4c7zAt6/aEjg+ewqq/DzZF5WWCupraNrW/S8d4hv/v5wk0qd9oWx4NT9m2NjpH8T5tU8DptnuyVkVyRnn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748851356; c=relaxed/simple;
	bh=/Q2GcgICTZt4UM86ZulCm2gs+XmnHUGh9nDh3kkroiQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=c2i4iH06idhEk3VR166ybg3M8jjvZu2E2n2B2Qs5wYREtg33r0xwd2YOWClt7zGAkxnmz8SEtgt1gMbJmHyAtLlz6IwPkv/cCDycRiPby0ZoC4rZfELff4MbnbOF8zYfBpyFAQuWC+TR+ONd3MHtMZwqpCKRnTXEfHmZfRophB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddaf7f2fcdso6340115ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 01:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748851353; x=1749456153;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1a41bhObSW8DfIAJJhyUECg63Tx5+3UL5VjwE/wvibs=;
        b=Dcqv1KmqKLNpXHurLvvrafXQmRisf8Fr5ZmOmuhyZHFKL+onxHxhzrUX0BKBcRkBXM
         rWOl9vF9e6BZphb4GYbWXbzgREyNVZHdBu3XMlvjf3cNsjYPXxjVMwpDiZLx3Gsti8AT
         EN8fveQoNdrgFka8Y1IdhEs+/AAdsK9bS2PgSuSUss5HOPq6JqoVSSqWfoKKFyG2CHf+
         AxzUo7T8jOG40VeIAx9+DCcKdtiV4e22pl5iEsiqGewSiKt9R66BPab6Z5A96yzV0HYx
         AvmjLxSZTF7hi8zDTEmWMf3AtSdubGD6PcSr33e+EN0yAZZy53RA9p6GViOAiwb2za+F
         DAjw==
X-Forwarded-Encrypted: i=1; AJvYcCVnJCA5yK7sQLiydlcV/1K6EhZdgGW7lMwIRaBuRxFKfvmqujwB09H82ox/60vB+eBgzoh0QKXx4Gsw+bw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+ExHGP2iy1P4+wcTlNtnZJwpkg2DKBA2huQ30uQmh29Iy00i
	j7cTrQeUkYdGU22X2n1EiqcYFI5CydB702jBfp+kAS72FHjeqQNunUtzbF3p4aB7yguSZ3guifY
	4U7TUQkjYqFMx+zx3ZtA3wQ+wDT4cxZgTYgZ6gNihJW6fqANcxrMRQMQUIe8=
X-Google-Smtp-Source: AGHT+IH3Cs550hqiMqdN2QTUAes63e/0oK5It6NYHXEJjJTj51BBML3ni6aypl4b9410qhPlvtIjWkn93Ehn2kSR/Uo8v1Pi2U5L
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:180f:b0:3d4:3ab3:daf0 with SMTP id
 e9e14a558f8ab-3dda3342b54mr69746165ab.7.1748851353314; Mon, 02 Jun 2025
 01:02:33 -0700 (PDT)
Date: Mon, 02 Jun 2025 01:02:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683d5a99.a00a0220.d8eae.0049.GAE@google.com>
Subject: [syzbot] [kernel?] possible deadlock in static_key_slow_inc (4)
From: syzbot <syzbot+61afb501981e58b312f8@syzkaller.appspotmail.com>
To: ardb@kernel.org, jbaron@akamai.com, jpoimboe@kernel.org, 
	linux-kernel@vger.kernel.org, peterz@infradead.org, rostedt@goodmis.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8477ab143069 Merge tag 'iommu-updates-v6.16' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1159ded4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aef027c1375c20d4
dashboard link: https://syzkaller.appspot.com/bug?extid=61afb501981e58b312f8
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7619fad220f8/disk-8477ab14.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a15197608733/vmlinux-8477ab14.xz
kernel image: https://storage.googleapis.com/syzbot-assets/774dfebf37cb/bzImage-8477ab14.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+61afb501981e58b312f8@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.15.0-syzkaller-09113-g8477ab143069 #0 Not tainted
------------------------------------------------------
syz.2.31/6060 is trying to acquire lock:
ffffffff8e264e70 (cpu_hotplug_lock){++++}-{0:0}, at: static_key_slow_inc+0x12/0x30 kernel/jump_label.c:190

but task is already holding lock:
ffff88814373a000 (&q->rq_qos_mutex){+.+.}-{4:4}, at: wbt_init+0x393/0x540 block/blk-wbt.c:923

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&q->rq_qos_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:601 [inline]
       __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:746
       wbt_init+0x393/0x540 block/blk-wbt.c:923
       queue_wb_lat_store+0x354/0x3d0 block/blk-sysfs.c:603
       queue_attr_store+0x279/0x320 block/blk-sysfs.c:805
       sysfs_kf_write+0xef/0x150 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x351/0x510 fs/kernfs/file.c:334
       new_sync_write fs/read_write.c:593 [inline]
       vfs_write+0x6c4/0x1150 fs/read_write.c:686
       ksys_write+0x12a/0x250 fs/read_write.c:738
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&q->q_usage_counter(io)#30){++++}-{0:0}:
       blk_alloc_queue+0x619/0x760 block/blk-core.c:461
       blk_mq_alloc_queue+0x175/0x290 block/blk-mq.c:4396
       __blk_mq_alloc_disk+0x29/0x120 block/blk-mq.c:4443
       loop_add+0x49c/0xb70 drivers/block/loop.c:2010
       loop_init+0x164/0x270 drivers/block/loop.c:2245
       do_one_initcall+0x120/0x6e0 init/main.c:1257
       do_initcall_level init/main.c:1319 [inline]
       do_initcalls init/main.c:1335 [inline]
       do_basic_setup init/main.c:1354 [inline]
       kernel_init_freeable+0x5c2/0x900 init/main.c:1567
       kernel_init+0x1c/0x2b0 init/main.c:1457
       ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #1 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4056 [inline]
       fs_reclaim_acquire+0x102/0x150 mm/page_alloc.c:4070
       might_alloc include/linux/sched/mm.h:318 [inline]
       slab_pre_alloc_hook mm/slub.c:4098 [inline]
       slab_alloc_node mm/slub.c:4176 [inline]
       __kmalloc_cache_node_noprof+0x53/0x420 mm/slub.c:4366
       kmalloc_node_noprof include/linux/slab.h:928 [inline]
       alloc_worker kernel/workqueue.c:2647 [inline]
       create_worker+0x10f/0x7e0 kernel/workqueue.c:2790
       workqueue_prepare_cpu+0xb5/0x160 kernel/workqueue.c:6650
       cpuhp_invoke_callback+0x3d2/0xa10 kernel/cpu.c:194
       __cpuhp_invoke_callback_range+0x101/0x210 kernel/cpu.c:967
       cpuhp_invoke_callback_range kernel/cpu.c:991 [inline]
       cpuhp_up_callbacks kernel/cpu.c:1022 [inline]
       _cpu_up+0x3f5/0x930 kernel/cpu.c:1687
       cpu_up+0x1dc/0x240 kernel/cpu.c:1719
       cpuhp_bringup_mask+0xd8/0x210 kernel/cpu.c:1785
       cpuhp_bringup_cpus_parallel kernel/cpu.c:1875 [inline]
       bringup_nonboot_cpus+0x176/0x1c0 kernel/cpu.c:1889
       smp_init+0x34/0x160 kernel/smp.c:1010
       kernel_init_freeable+0x3a8/0x900 init/main.c:1559
       kernel_init+0x1c/0x2b0 init/main.c:1457
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
       sysfs_kf_write+0xef/0x150 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x351/0x510 fs/kernfs/file.c:334
       new_sync_write fs/read_write.c:593 [inline]
       vfs_write+0x6c4/0x1150 fs/read_write.c:686
       ksys_write+0x12a/0x250 fs/read_write.c:738
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  cpu_hotplug_lock --> &q->q_usage_counter(io)#30 --> &q->rq_qos_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&q->rq_qos_mutex);
                               lock(&q->q_usage_counter(io)#30);
                               lock(&q->rq_qos_mutex);
  rlock(cpu_hotplug_lock);

 *** DEADLOCK ***

7 locks held by syz.2.31/6060:
 #0: ffff888031afe478 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2a2/0x370 fs/file.c:1213
 #1: ffff888035c5c428 (sb_writers#7){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:738
 #2: ffff88804d0fc488 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x28f/0x510 fs/kernfs/file.c:325
 #3: ffff888143755968 (kn->active#68){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x2b2/0x510 fs/kernfs/file.c:326
 #4: ffff888143739e00 (&q->q_usage_counter(io)#30){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x15/0x20 block/blk-mq.c:205
 #5: ffff888143739e38 (&q->q_usage_counter(queue)#20){+.+.}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x15/0x20 block/blk-mq.c:205
 #6: ffff88814373a000 (&q->rq_qos_mutex){+.+.}-{4:4}, at: wbt_init+0x393/0x540 block/blk-wbt.c:923

stack backtrace:
CPU: 0 UID: 0 PID: 6060 Comm: syz.2.31 Not tainted 6.15.0-syzkaller-09113-g8477ab143069 #0 PREEMPT(full) 
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
 sysfs_kf_write+0xef/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x351/0x510 fs/kernfs/file.c:334
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x6c4/0x1150 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fae7898e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fae798d7038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fae78bb5fa0 RCX: 00007fae7898e969
RDX: 00000000000005c8 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007fae78a10ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fae78bb5fa0 R15: 00007ffdbd64d078
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
