Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79B72222D9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744978104; cv=none; b=VK123Ig6rI1OROvuIFMJeoKug95rpHMd3SV0rBUO3ofGR18abbij3G00zBExgfDwFlMAlVEe6LLaLScQd+UjoJoyejC1H9UJZqFEFyOhoQczI/YRary4Ow3mgWqFOokIh02zirYA2x6G3j/ZMX7EaOvSdyOxvJtM4Y+/3SpQGXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744978104; c=relaxed/simple;
	bh=8pK6dbXeXw9Tyu/wII90qV0dGtq0tr/qLdp/d2oTNzs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jXWhpe5D4N36pXlpcCVfQGKg38iadlqDvSSmxf4JFt8gmWYeP4ANlIJbL3vNgfEMnS9TNRQDJ5OHrxurdrAvYT12osTb5lcBK2VRGtCPZTpW7Hvh8SEDXRyLaRBmnNrV+g3IphyYIPOHz8HvkDkCIlz8h5ipWs+107+niVJgVF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d8fd3625d3so913675ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744978102; x=1745582902;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AzUzRjao+FxUJfZ6bBzW7/hvxHgDfmg7AtciXtp40m4=;
        b=YicP4jLwZR4alVwX+wxRZPDYxNdpbtNXsa/bmYr8zVAh8z4raVajvT62gHS3KELYmx
         KNlvTk9y63R7c4XBwwgEJ/whcnb73S2yLlwfLpSzYRvvmdTDW6JpwcYbIuoXtWqgjEo7
         hKZx/5y9WI7gSMOUqjQnt5vwq5liVZbE7vhJP0YAz7CQOotD7CGjQJXxGqW+3NT+Q9N6
         fGNRPXy7EF4/clg+8jIbGB5AgJ0kxnIh6Tu+b+w2Oy+McFn4MTNMe35WRBjZrwVqLew5
         VDA1A2NSxxngCI0mSm5srLUkFC6xUMPEU9IorExorLYKr0xvviUXCoJIFHewprL0vN+2
         /e/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzC/EK+ri8QAbUpa+N1NOw9mCaLZkuWddkKqm7tJGrPPSUTp8+EU98w75Ovfy3Hd5gyOYSdrAhLobvWRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/k3sT+CTwgKkY2iplia/FVe9yt1lyCjmibCq0gFEADynVkRwD
	ORFDMAz8L4zDcDftDAXacgiC96PmbuyDCxPklWWyFHrChcxzdZY/Tifsw50SySV/xY03W+R0bfq
	yW64TxuOcboosn+u8Rn+OFGzKzBv7fQaA5mNmGHL8XJyezQWL8xjHGYk=
X-Google-Smtp-Source: AGHT+IFbx+v9AvwPwRG5r5l+UCCFypKNmbwwiW7Eh1a/sww4AnAEeR62RC4ucUFADbLKcyRLJ484OCRw0cFo6BNGLwlLEXWwJ+D8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1569:b0:3cf:bac5:d90c with SMTP id
 e9e14a558f8ab-3d89417d9bemr23198105ab.18.1744978101966; Fri, 18 Apr 2025
 05:08:21 -0700 (PDT)
Date: Fri, 18 Apr 2025 05:08:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680240b5.050a0220.297747.0007.GAE@google.com>
Subject: [syzbot] [rdma?] INFO: trying to register non-static key in rxe_qp_do_cleanup
From: syzbot <syzbot+4edb496c3cad6e953a31@syzkaller.appspotmail.com>
To: jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	zyjzyj2000@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8ffd015db85f Linux 6.15-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16bc20cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=51ecb841db3b3687
dashboard link: https://syzkaller.appspot.com/bug?extid=4edb496c3cad6e953a31
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7aa92e6fb2e5/disk-8ffd015d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1458d069253c/vmlinux-8ffd015d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fe6dd8111695/bzImage-8ffd015d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4edb496c3cad6e953a31@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 UID: 0 PID: 1151 Comm: kworker/u8:8 Not tainted 6.15.0-rc2-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: rdma_cm cma_work_handler
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 assign_lock_key kernel/locking/lockdep.c:986 [inline]
 register_lock_class+0x4a3/0x4c0 kernel/locking/lockdep.c:1300
 __lock_acquire+0x99/0x1ba0 kernel/locking/lockdep.c:5110
 lock_acquire kernel/locking/lockdep.c:5866 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5823
 __timer_delete_sync+0x152/0x1b0 kernel/time/timer.c:1644
 rxe_qp_do_cleanup+0x5c3/0x7e0 drivers/infiniband/sw/rxe/rxe_qp.c:815
 execute_in_process_context+0x3a/0x160 kernel/workqueue.c:4596
 __rxe_cleanup+0x267/0x3c0 drivers/infiniband/sw/rxe/rxe_pool.c:232
 rxe_create_qp+0x3f7/0x5f0 drivers/infiniband/sw/rxe/rxe_verbs.c:604
 create_qp+0x62d/0xa80 drivers/infiniband/core/verbs.c:1250
 ib_create_qp_kernel+0x9f/0x310 drivers/infiniband/core/verbs.c:1361
 ib_create_qp include/rdma/ib_verbs.h:3803 [inline]
 rdma_create_qp+0x10c/0x340 drivers/infiniband/core/cma.c:1144
 rds_ib_setup_qp+0xc86/0x19a0 net/rds/ib_cm.c:600
 rds_ib_cm_initiate_connect+0x1e8/0x3d0 net/rds/ib_cm.c:944
 rds_rdma_cm_event_handler_cmn+0x61f/0x8c0 net/rds/rdma_transport.c:109
 cma_cm_event_handler+0x94/0x300 drivers/infiniband/core/cma.c:2184
 cma_work_handler+0x15b/0x230 drivers/infiniband/core/cma.c:3042
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
------------[ cut here ]------------
ODEBUG: assert_init not available (active state 0) object: ffff8880541d8a58 object type: timer_list hint: 0x0
WARNING: CPU: 1 PID: 1151 at lib/debugobjects.c:612 debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
Modules linked in:
CPU: 1 UID: 0 PID: 1151 Comm: kworker/u8:8 Not tainted 6.15.0-rc2-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: rdma_cm cma_work_handler
RIP: 0010:debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
Code: fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 54 41 56 48 8b 14 dd e0 73 f4 8b 4c 89 e6 48 c7 c7 60 68 f4 8b e8 1f db a5 fc 90 <0f> 0b 90 90 58 83 05 76 9b b1 0b 01 48 83 c4 18 5b 5d 41 5c 41 5d
RSP: 0018:ffffc90003eb73e8 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000005 RCX: ffffffff817acff8
RDX: ffff888027be8000 RSI: ffffffff817ad005 RDI: 0000000000000001
RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffffffff8bf46f40
R13: ffffffff8b8fc880 R14: 0000000000000000 R15: ffffc90003eb74a8
FS:  0000000000000000(0000) GS:ffff888124ab2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c32628d CR3: 000000000e182000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 debug_object_assert_init+0x1ec/0x2f0 lib/debugobjects.c:1020
 debug_timer_assert_init kernel/time/timer.c:845 [inline]
 debug_assert_init kernel/time/timer.c:890 [inline]
 __try_to_del_timer_sync+0x7f/0x170 kernel/time/timer.c:1499
 __timer_delete_sync+0xf4/0x1b0 kernel/time/timer.c:1662
 rxe_qp_do_cleanup+0x5c3/0x7e0 drivers/infiniband/sw/rxe/rxe_qp.c:815
 execute_in_process_context+0x3a/0x160 kernel/workqueue.c:4596
 __rxe_cleanup+0x267/0x3c0 drivers/infiniband/sw/rxe/rxe_pool.c:232
 rxe_create_qp+0x3f7/0x5f0 drivers/infiniband/sw/rxe/rxe_verbs.c:604
 create_qp+0x62d/0xa80 drivers/infiniband/core/verbs.c:1250
 ib_create_qp_kernel+0x9f/0x310 drivers/infiniband/core/verbs.c:1361
 ib_create_qp include/rdma/ib_verbs.h:3803 [inline]
 rdma_create_qp+0x10c/0x340 drivers/infiniband/core/cma.c:1144
 rds_ib_setup_qp+0xc86/0x19a0 net/rds/ib_cm.c:600
 rds_ib_cm_initiate_connect+0x1e8/0x3d0 net/rds/ib_cm.c:944
 rds_rdma_cm_event_handler_cmn+0x61f/0x8c0 net/rds/rdma_transport.c:109
 cma_cm_event_handler+0x94/0x300 drivers/infiniband/core/cma.c:2184
 cma_work_handler+0x15b/0x230 drivers/infiniband/core/cma.c:3042
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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
