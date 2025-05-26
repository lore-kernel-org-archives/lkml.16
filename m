Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5A21ACEDA
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256764; cv=none; b=VyeqfTxWmwPGZhMXgIFjRPKOwo798sjo1+jgghhS9InnsN9nULpQJ2xMs3ndq5t6z/fZ9AH6d4IuZfwD8w9X3tIOpKCGd8hhrjjG84kS9yXOLaoEJ1iendXQG8yaGHmTHeVk9G4LqlcdZNesP0/jif2ATXzFMRb+HkzKZolH1+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256764; c=relaxed/simple;
	bh=NQnKI2yextOnjBsVorYIWwR++RtV/eSg+elJEbQfS9c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Okw1nFRbW/0Ij46DJZ81tbLX3D/CThjQFf8CGIOzpSzwKvtgYCFDSr01SAhNZ1Lt+++iMjaD+OBdN896K3TSKC7jo3xbP+8pKsSDc7T046DOKo7P1idHd5Vn6d+unQtXIvgP9hHrFRxCC+YVINGxhVfzpXX4oBmDIX34OCj0Cq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-86a50b5f5bdso172712739f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256760; x=1748861560;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/K01l6WzTrKgqeRl2lvGmtaJusSHo0BDMcZkxAuj+e4=;
        b=E/QXMlzu7IuAtZ5TxqBTERlrjmivlJ+iALQF/V56OcI7wxtE5wzkeYmQvxHkcbT4gP
         OYDsy8VfW+shLAaNufXVZQvJosLPtcMtmmO9QwgiLr/czXiWn1RRil83avNvOOXacIO2
         p3lGZlVDwVZ7CSfFHJ5dgOKDnlAy7ndcPVPMURIqITaxViXeMsULBeQgzkhBuwkbDAc2
         OKiiFMFBEfLCl/22CqqrfxxQFr3/1sYuZlKgSt/nVAR/LFW/0TU7LgaLeCEKvHcsukzd
         tMdxZR/vmnh3oSbMnb6AxfbmbMM6gC8ehl8JfDurjB5MMNH4EGT9tdu7EsCB6rYOpeg7
         Dmnw==
X-Gm-Message-State: AOJu0YwnVs+KcQiK14XHp02qyiBSgeaQKWF6gyfOs5/7AQ6l+Z8EWPzL
	OPrfz689BdgGEVqSva65rFGq3UPy600LjVvetyoxMTjhJJIYgUW+qyJ4v8uIkVZtSM6iANholCW
	IPeFHv1CSaYjzrJ4M5GITPRZJdFmk/vJFQ7gOGQfxjZXKM62Y80dgO1Q0/13t/A==
X-Google-Smtp-Source: AGHT+IH/EP8qJCn64XXDPw9sSbyV4vtRnGntX2VjGcGTkbUN/LMMsR8inK7uHhRyIPRsa70LYbhucPDd1TB9EVbzz+HfpWVcWgNi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4087:b0:864:4911:f463 with SMTP id
 ca18e2360f4ac-86cbb88dd49mr969398639f.10.1748256760637; Mon, 26 May 2025
 03:52:40 -0700 (PDT)
Date: Mon, 26 May 2025 03:52:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683447f8.a70a0220.29d4a0.0803.GAE@google.com>
Subject: [syzbot] [kernel?] possible deadlock in start_poll_synchronize_rcu_expedited
From: syzbot <syzbot+cbc79a37b5fa23efd23b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    176e917e010c Add linux-next specific files for 20250523
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1265e8e8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=cbc79a37b5fa23efd23b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5f7692c642fa/disk-176e917e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/057a442d42d0/vmlinux-176e917e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8f8ebdb4dd96/bzImage-176e917e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cbc79a37b5fa23efd23b@syzkaller.appspotmail.com

ODEBUG: object ffffc9000554fb90 is on stack ffffc90005548000, but NOT annotated.
======================================================
WARNING: possible circular locking dependency detected
6.15.0-rc7-next-20250523-syzkaller #0 Not tainted
------------------------------------------------------
bch-copygc/loop/6043 is trying to acquire lock:
ffffffff8e133280 (console_owner){....}-{0:0}, at: console_trylock_spinning kernel/printk/printk.c:2048 [inline]
ffffffff8e133280 (console_owner){....}-{0:0}, at: vprintk_emit+0x444/0x7a0 kernel/printk/printk.c:2449

but task is already holding lock:
ffffffff99d022c8 (&obj_hash[i].lock){-.-.}-{2:2}, at: __debug_object_init+0x85/0x3c0 lib/debugobjects.c:741

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (&obj_hash[i].lock){-.-.}-{2:2}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
       _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
       debug_object_activate+0xbb/0x420 lib/debugobjects.c:818
       debug_work_activate kernel/workqueue.c:664 [inline]
       insert_work+0x35/0x330 kernel/workqueue.c:2180
       __queue_work+0xcfc/0xfe0 kernel/workqueue.c:2341
       queue_work_on+0x181/0x270 kernel/workqueue.c:2392
       queue_work include/linux/workqueue.h:662 [inline]
       start_poll_synchronize_rcu_expedited+0xfc/0x140 kernel/rcu/tree_exp.h:1075
       rcu_init+0x108/0x160 kernel/rcu/tree.c:4854
       start_kernel+0x1fb/0x500 init/main.c:991
       x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:307
       x86_64_start_kernel+0x143/0x1c0 arch/x86/kernel/head64.c:288
       common_startup_64+0x13e/0x147

-> #3 (&pool->lock){-.-.}-{2:2}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
       _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
       __queue_work+0x7b0/0xfe0 kernel/workqueue.c:-1
       queue_work_on+0x181/0x270 kernel/workqueue.c:2392
       queue_work include/linux/workqueue.h:662 [inline]
       rpm_suspend+0xe54/0x1720 drivers/base/power/runtime.c:673
       __pm_runtime_idle+0x12f/0x1a0 drivers/base/power/runtime.c:1112
       pm_runtime_put include/linux/pm_runtime.h:470 [inline]
       __device_attach+0x342/0x400 drivers/base/dd.c:1047
       bus_probe_device+0x185/0x260 drivers/base/bus.c:537
       device_add+0x7b6/0xb50 drivers/base/core.c:3692
       serial_base_port_add+0x2f2/0x430 drivers/tty/serial/serial_base_bus.c:179
       serial_core_port_device_add drivers/tty/serial/serial_core.c:3341 [inline]
       serial_core_register_port+0x367/0x2700 drivers/tty/serial/serial_core.c:3380
       serial8250_register_8250_port+0x16db/0x2050 drivers/tty/serial/8250/8250_core.c:822
       serial_pnp_probe+0x527/0x790 drivers/tty/serial/8250/8250_pnp.c:480
       pnp_device_probe+0x30b/0x4c0 drivers/pnp/driver.c:111
       call_driver_probe drivers/base/dd.c:-1 [inline]
       really_probe+0x26d/0x9a0 drivers/base/dd.c:657
       __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
       driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
       __driver_attach+0x452/0x700 drivers/base/dd.c:1215
       bus_for_each_dev+0x233/0x2b0 drivers/base/bus.c:370
       bus_add_driver+0x345/0x640 drivers/base/bus.c:678
       driver_register+0x23a/0x320 drivers/base/driver.c:249
       serial8250_init+0xc2/0x1c0 drivers/tty/serial/8250/8250_platform.c:315
       do_one_initcall+0x233/0x820 init/main.c:1273
       do_initcall_level+0x137/0x1f0 init/main.c:1335
       do_initcalls+0x69/0xd0 init/main.c:1351
       kernel_init_freeable+0x3d9/0x570 init/main.c:1583
       kernel_init+0x1d/0x1d0 init/main.c:1473
       ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 (&dev->power.lock){-.-.}-{3:3}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
       _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
       __pm_runtime_resume+0x10f/0x180 drivers/base/power/runtime.c:1179
       pm_runtime_get include/linux/pm_runtime.h:418 [inline]
       __uart_start+0x171/0x440 drivers/tty/serial/serial_core.c:149
       uart_write+0xdc/0x130 drivers/tty/serial/serial_core.c:636
       process_output_block drivers/tty/n_tty.c:561 [inline]
       n_tty_write+0xd35/0x11d0 drivers/tty/n_tty.c:2377
       iterate_tty_write drivers/tty/tty_io.c:1006 [inline]
       file_tty_write+0x4fe/0x990 drivers/tty/tty_io.c:1081
       new_sync_write fs/read_write.c:593 [inline]
       vfs_write+0x548/0xa90 fs/read_write.c:686
       ksys_write+0x145/0x250 fs/read_write.c:738
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&port_lock_key){-.-.}-{3:3}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
       _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
       uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
       serial8250_console_write+0x17e/0x1ba0 drivers/tty/serial/8250/8250_port.c:3415
       console_emit_next_record kernel/printk/printk.c:3138 [inline]
       console_flush_all+0x728/0xc40 kernel/printk/printk.c:3226
       __console_flush_and_unlock kernel/printk/printk.c:3285 [inline]
       console_unlock+0xc4/0x270 kernel/printk/printk.c:3325
       vprintk_emit+0x5b7/0x7a0 kernel/printk/printk.c:2450
       _printk+0xcf/0x120 kernel/printk/printk.c:2475
       register_console+0xa8b/0xf90 kernel/printk/printk.c:4125
       univ8250_console_init+0x52/0x90 drivers/tty/serial/8250/8250_core.c:513
       console_init+0x1a1/0x670 kernel/printk/printk.c:4323
       start_kernel+0x2cc/0x500 init/main.c:1035
       x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:307
       x86_64_start_kernel+0x143/0x1c0 arch/x86/kernel/head64.c:288
       common_startup_64+0x13e/0x147

-> #0 (console_owner){....}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
       __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       console_trylock_spinning kernel/printk/printk.c:2048 [inline]
       vprintk_emit+0x460/0x7a0 kernel/printk/printk.c:2449
       _printk+0xcf/0x120 kernel/printk/printk.c:2475
       debug_object_is_on_stack lib/debugobjects.c:-1 [inline]
       lookup_object_or_alloc lib/debugobjects.c:688 [inline]
       __debug_object_init+0x2c8/0x3c0 lib/debugobjects.c:743
       rhashtable_init_noprof+0x7c0/0xbb0 lib/rhashtable.c:1085
       bch2_copygc_thread+0x116/0xdc0 fs/bcachefs/movinggc.c:355
       kthread+0x711/0x8a0 kernel/kthread.c:464
       ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

Chain exists of:
  console_owner --> &pool->lock --> &obj_hash[i].lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&obj_hash[i].lock);
                               lock(&pool->lock);
                               lock(&obj_hash[i].lock);
  lock(console_owner);

 *** DEADLOCK ***

1 lock held by bch-copygc/loop/6043:
 #0: ffffffff99d022c8 (&obj_hash[i].lock){-.-.}-{2:2}, at: __debug_object_init+0x85/0x3c0 lib/debugobjects.c:741

stack backtrace:
CPU: 1 UID: 0 PID: 6043 Comm: bch-copygc/loop Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full) 
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
 console_trylock_spinning kernel/printk/printk.c:2048 [inline]
 vprintk_emit+0x460/0x7a0 kernel/printk/printk.c:2449
 _printk+0xcf/0x120 kernel/printk/printk.c:2475
 debug_object_is_on_stack lib/debugobjects.c:-1 [inline]
 lookup_object_or_alloc lib/debugobjects.c:688 [inline]
 __debug_object_init+0x2c8/0x3c0 lib/debugobjects.c:743
 rhashtable_init_noprof+0x7c0/0xbb0 lib/rhashtable.c:1085
 bch2_copygc_thread+0x116/0xdc0 fs/bcachefs/movinggc.c:355
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
------------[ cut here ]------------
WARNING: CPU: 1 PID: 6043 at lib/debugobjects.c:655 debug_object_is_on_stack lib/debugobjects.c:655 [inline]
WARNING: CPU: 1 PID: 6043 at lib/debugobjects.c:655 lookup_object_or_alloc lib/debugobjects.c:688 [inline]
WARNING: CPU: 1 PID: 6043 at lib/debugobjects.c:655 __debug_object_init+0x2c9/0x3c0 lib/debugobjects.c:743
Modules linked in:
CPU: 1 UID: 0 PID: 6043 Comm: bch-copygc/loop Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:debug_object_is_on_stack lib/debugobjects.c:655 [inline]
RIP: 0010:lookup_object_or_alloc lib/debugobjects.c:688 [inline]
RIP: 0010:__debug_object_init+0x2c9/0x3c0 lib/debugobjects.c:743
Code: cc cc cc 41 ff c7 44 89 3d a4 18 14 15 48 c7 c1 80 9b e2 8b 48 c7 c7 e0 9b e2 8b 84 c0 48 0f 45 f9 48 89 de e8 48 2b 61 fc 90 <0f> 0b 90 e9 c0 fe ff ff e8 3a 1c 00 00 8b 05 1c 9c c6 09 3b 05 1a
RSP: 0018:ffffc9000554f6e0 EFLAGS: 00010046
RAX: 0000000000000050 RBX: ffffc9000554fb90 RCX: 81ab982152e8f200
RDX: 0000000000000000 RSI: 0000000080000001 RDI: 0000000000000000
RBP: ffff8880253d3c20 R08: ffff8880b8724293 R09: 1ffff110170e4852
R10: dffffc0000000000 R11: ffffed10170e4853 R12: 0000000000000040
R13: ffff88807ced52a0 R14: dffffc0000000000 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff888125d56000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555557c36608 CR3: 0000000032868000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 rhashtable_init_noprof+0x7c0/0xbb0 lib/rhashtable.c:1085
 bch2_copygc_thread+0x116/0xdc0 fs/bcachefs/movinggc.c:355
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
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
