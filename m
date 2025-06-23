Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E017D7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750643304; cv=none; b=IZ9V0V8vexE1VaYZs3wNPsaeLpy9XafrXq6Q+socaJ6zsXc9otQF2KzOO7Bc2e8AMQdbkrRS06guT/tMWtLJ15RJs72lLv19/4VO0YbDxzA28BepvvcP5E6lThVoLUUp47jUrQveshWjjH3CgNPky02306WouQYswvmrmREmwSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750643304; c=relaxed/simple;
	bh=wHHUt8ciluibRzWPnUrsllI6YkuUJ+4xC0AB9MqOa9A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Jgh+8JeeSyajRYspBbqo57gKBQGUwBYXaQLCeYXL9fCiqDyrDPzs5fwLut/m9/Ah2R/DkMK2hw7H9GvCcY7hKO6DdmmUs35BFyQ0ckQsCBX7xNRnuEpjhiGtHkBKlrfrmkqLqBTCFqEDWXBGSJdmvs5CCCgL0NE7ShuD02CslFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3df149301fdso19642535ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 18:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750643302; x=1751248102;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ktpc/Ypn9iZYABehDX7b9Balm3PDMx3KjDt/nGTGOM=;
        b=vGwANiOH6+1RpuhWBQAxBXARUp7ym+s7Ih89ju9vv91nAJK6fxZ5Tjv/S6TNxZS3HA
         oCUG1ob4lwkK77sxpJJ4AWYNODk9wOu0lNUQ3cAl5iBicnplM8K8gUf6srM6MQuZMwiO
         jlVP2J2O0TNAOOUDF0nLm/mYboubMCGcycFrbCnatfA/98ycSQjLFsPIsyX6eAMdCxFr
         wmxakQp7KInmqSc7Nn0ogTun/59KeNrFhku4JaAGSJHUEtjJe4fD9YFU+Jzc4N7qAcZ2
         g9D8cVkJ4Bhk5uvJNl6iF+fxhpNQuLD613IeOe0ZwA8pWpIKM1H2msnpriQBvi9h5bEL
         /Q7g==
X-Forwarded-Encrypted: i=1; AJvYcCVihdJQMVwqOH3youibag+5CISFH0CGN70zXPJZMyxLPH76HnHDd2HpP79WYFvL7dx0FJ4zx/Ob8xqcxNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7AIQ3R5oW7i0nZTkj3bxhkfTcyhemcyQtkTukHkZ2SbPESLx5
	nIDo3/aaaCM+3Y5JnGcuWV9uWx2d83FU8zHibP6oXgcH1MZrN2t6n6JVdf710LB790SOkfKZyoR
	f9aU18c2VYL1zx5GYmHP8W22y9l6rDSRV0aDN+Q5cwZm84L91NTtw7vhnmKc=
X-Google-Smtp-Source: AGHT+IEsyV+QnWFNjAipj6qV0TGZ78o1pfYTu89x1fWuovPrQm3MpuTjUNSwixVcSiHQMEnN0fUDAqAV8/Bl17BAYYN7jDn777PK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3782:b0:3dc:8bb8:28bf with SMTP id
 e9e14a558f8ab-3de38c2f1ecmr129782985ab.5.1750643301782; Sun, 22 Jun 2025
 18:48:21 -0700 (PDT)
Date: Sun, 22 Jun 2025 18:48:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6858b265.a00a0220.2e5631.0001.GAE@google.com>
Subject: [syzbot] [kernel?] possible deadlock in worker_thread (2)
From: syzbot <syzbot+67ee62f1782c5d4e5d0c@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    74b4cc9b8780 Merge tag 'cgroup-for-6.16-rc2-fixes' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1008be82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4130f4d8a06c3e71
dashboard link: https://syzkaller.appspot.com/bug?extid=67ee62f1782c5d4e5d0c
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-74b4cc9b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/264068bc8f84/vmlinux-74b4cc9b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4f86c1c65991/bzImage-74b4cc9b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+67ee62f1782c5d4e5d0c@syzkaller.appspotmail.com

block nbd12: Receive control failed (result -32)
======================================================
WARNING: possible circular locking dependency detected
6.16.0-rc2-syzkaller-00071-g74b4cc9b8780 #0 Not tainted
------------------------------------------------------
kworker/u33:1/5298 is trying to acquire lock:
ffff888027fc7a30 (&nbd->config_lock){+.+.}-{4:4}, at: refcount_dec_and_mutex_lock+0x51/0xc0 lib/refcount.c:118

but task is already holding lock:
ffffc900270dfd10 ((work_completion)(&args->work)){+.+.}-{0:0}, at: process_one_work+0x929/0x1b70 kernel/workqueue.c:3214

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 ((work_completion)(&args->work)){+.+.}-{0:0}:
       process_one_work+0x932/0x1b70 kernel/workqueue.c:3214
       process_scheduled_works kernel/workqueue.c:3321 [inline]
       worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
       kthread+0x3c2/0x780 kernel/kthread.c:464
       ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #1 ((wq_completion)nbd4-recv){+.+.}-{0:0}:
       touch_wq_lockdep_map+0xad/0x1c0 kernel/workqueue.c:3909
       __flush_workqueue+0x128/0x1230 kernel/workqueue.c:3951
       nbd_disconnect_and_put+0x9b/0x1c0 drivers/block/nbd.c:2242
       nbd_genl_disconnect+0x396/0x570 drivers/block/nbd.c:2281
       genl_family_rcv_msg_doit+0x206/0x2f0 net/netlink/genetlink.c:1115
       genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
       genl_rcv_msg+0x55c/0x800 net/netlink/genetlink.c:1210
       netlink_rcv_skb+0x155/0x420 net/netlink/af_netlink.c:2534
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
       netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
       netlink_unicast+0x53d/0x7f0 net/netlink/af_netlink.c:1339
       netlink_sendmsg+0x8d1/0xdd0 net/netlink/af_netlink.c:1883
       sock_sendmsg_nosec net/socket.c:712 [inline]
       __sock_sendmsg net/socket.c:727 [inline]
       ____sys_sendmsg+0xa95/0xc70 net/socket.c:2566
       ___sys_sendmsg+0x134/0x1d0 net/socket.c:2620
       __sys_sendmsg+0x16d/0x220 net/socket.c:2652
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&nbd->config_lock){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain kernel/locking/lockdep.c:3911 [inline]
       __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5240
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5828
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:747
       refcount_dec_and_mutex_lock+0x51/0xc0 lib/refcount.c:118
       nbd_config_put+0x31/0x750 drivers/block/nbd.c:1423
       recv_work+0x681/0xa80 drivers/block/nbd.c:1021
       process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
       process_scheduled_works kernel/workqueue.c:3321 [inline]
       worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
       kthread+0x3c2/0x780 kernel/kthread.c:464
       ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

Chain exists of:
  &nbd->config_lock --> (wq_completion)nbd4-recv --> (work_completion)(&args->work)

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock((work_completion)(&args->work));
                               lock((wq_completion)nbd4-recv);
                               lock((work_completion)(&args->work));
  lock(&nbd->config_lock);

 *** DEADLOCK ***

2 locks held by kworker/u33:1/5298:
 #0: ffff8880280bb148 ((wq_completion)nbd12-recv){+.+.}-{0:0}, at: process_one_work+0x12a2/0x1b70 kernel/workqueue.c:3213
 #1: ffffc900270dfd10 ((work_completion)(&args->work)){+.+.}-{0:0}, at: process_one_work+0x929/0x1b70 kernel/workqueue.c:3214

stack backtrace:
CPU: 2 UID: 0 PID: 5298 Comm: kworker/u33:1 Not tainted 6.16.0-rc2-syzkaller-00071-g74b4cc9b8780 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: nbd12-recv recv_work
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
 __mutex_lock_common kernel/locking/mutex.c:602 [inline]
 __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:747
 refcount_dec_and_mutex_lock+0x51/0xc0 lib/refcount.c:118
 nbd_config_put+0x31/0x750 drivers/block/nbd.c:1423
 recv_work+0x681/0xa80 drivers/block/nbd.c:1021
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
block nbd12: shutting down sockets
==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-use-after-free in atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
BUG: KASAN: slab-use-after-free in recv_work+0x694/0xa80 drivers/block/nbd.c:1022
Write of size 4 at addr ffff8880549ba078 by task kworker/u33:1/5298

CPU: 0 UID: 0 PID: 5298 Comm: kworker/u33:1 Not tainted 6.16.0-rc2-syzkaller-00071-g74b4cc9b8780 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: nbd12-recv recv_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xcd/0x680 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x100/0x1b0 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
 recv_work+0x694/0xa80 drivers/block/nbd.c:1022
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 10333:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 nbd_alloc_and_init_config+0x97/0x2a0 drivers/block/nbd.c:1659
 nbd_genl_connect+0x490/0x1c20 drivers/block/nbd.c:2121
 genl_family_rcv_msg_doit+0x206/0x2f0 net/netlink/genetlink.c:1115
 genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
 genl_rcv_msg+0x55c/0x800 net/netlink/genetlink.c:1210
 netlink_rcv_skb+0x155/0x420 net/netlink/af_netlink.c:2534
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x53d/0x7f0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x8d1/0xdd0 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg net/socket.c:727 [inline]
 ____sys_sendmsg+0xa95/0xc70 net/socket.c:2566
 ___sys_sendmsg+0x134/0x1d0 net/socket.c:2620
 __sys_sendmsg+0x16d/0x220 net/socket.c:2652
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5298:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0x2b4/0x4d0 mm/slub.c:4842
 nbd_config_put+0x3c1/0x750 drivers/block/nbd.c:1449
 recv_work+0x681/0xa80 drivers/block/nbd.c:1021
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880549ba000
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 120 bytes inside of
 freed 256-byte region [ffff8880549ba000, ffff8880549ba100)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x549ba
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b842b40 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b842b40 0000000000000000 dead000000000001
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffea0001526e81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 8542, tgid 8542 (syz-executor), ts 169523608298, free_ts 169387762780
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x1321/0x3890 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x261/0x23f0 mm/page_alloc.c:4959
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2451 [inline]
 allocate_slab mm/slub.c:2619 [inline]
 new_slab+0x23b/0x330 mm/slub.c:2673
 ___slab_alloc+0xd9c/0x1940 mm/slub.c:3859
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3949
 __slab_alloc_node mm/slub.c:4024 [inline]
 slab_alloc_node mm/slub.c:4185 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x2f2/0x510 mm/slub.c:4340
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kmalloc_array_noprof include/linux/slab.h:948 [inline]
 security_inode_init_security+0x13f/0x390 security/security.c:1829
 shmem_symlink+0x135/0x9f0 mm/shmem.c:4098
 vfs_symlink fs/namei.c:4739 [inline]
 vfs_symlink+0x403/0x680 fs/namei.c:4723
 do_symlinkat+0x261/0x310 fs/namei.c:4765
 __do_sys_symlinkat fs/namei.c:4781 [inline]
 __se_sys_symlinkat fs/namei.c:4778 [inline]
 __x64_sys_symlinkat+0x93/0xc0 fs/namei.c:4778
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 8529 tgid 8529 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0x7fe/0x1180 mm/page_alloc.c:2706
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4d/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4148 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 kmem_cache_alloc_noprof+0x1cb/0x3b0 mm/slub.c:4204
 getname_flags.part.0+0x4c/0x550 fs/namei.c:146
 getname_flags include/linux/audit.h:322 [inline]
 getname include/linux/fs.h:2907 [inline]
 __do_sys_unlink fs/namei.c:4705 [inline]
 __se_sys_unlink fs/namei.c:4703 [inline]
 __x64_sys_unlink+0xb0/0x110 fs/namei.c:4703
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880549b9f00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8880549b9f80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff8880549ba000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff8880549ba080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880549ba100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


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
