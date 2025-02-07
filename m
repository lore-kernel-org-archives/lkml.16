Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D715199C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738911724; cv=none; b=OxLWSsZzDDpW4h+pOGlxkqYbqXn4nduUkRJYLHDTNYnlYqrmT0TT3crzvwu0o2DJAmhVGqqUb4e6MxnNGku5GbMHU6IQuNA4rtf7PyKG8K9uaduUgjGR8Wy7+Ywk2bFV/jW2ONeEd8+6NpD2O4x2s1AONk3hncQaTT63Pywu2YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738911724; c=relaxed/simple;
	bh=b0vdX2KN0EYXCdgrJ196qYdEHJjd1yUdJl221ht6yrA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PKtFbWf5rrykIRF/pVhyN/TM3cHGp8cwVnbgEQmpVS/vY73skvT9g/aAM9FN/5UU2AE/AvBvnhZX8Kb1IUtqvQSsSa6ZSe6Bn29AKzF4alyKL0oYrlCuPJLFovNr7s62X49fhSNam6xCYhZmGXrTie9zD42iGF+V49C6oRPtvL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-851fda72550so377915939f.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738911722; x=1739516522;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bqoRZVbR1ZE7EGOFnLgV8npncB1ACyAqTeoSp/egMUU=;
        b=aZwqoLxXUXWeH8ri5udjXFnCH3Y2CMSkPd7+X/IZ5rzLVPKEMAOtVi9QFveRLoD2Tz
         0NpEMw8/leT6bF1lRiMmrzzWFMoUubnsORN6Oo4M9UV6+hqoVXOB7EehRjVKFDf2VkjU
         6TyKdxvmN8dx/+AEum256FCU0F8+lHrYbbqT88KVzw3Nu40lYdBdvw+vYqPcWxJVyTWo
         1ZD8+dwyNV+P0fd56kkSSiSLMO8lfVbtj5g3Thdwqy9D8zgTynxOFLe3VAxOnJKMjizh
         lsXV+Gqwt/1v/pl2zQ70DZCrk62gStH7fjonYcaOCIcTydyPZ5H740+oAdM0vgoPKluD
         WFsw==
X-Gm-Message-State: AOJu0Yxg45kCLIDHMLsi48myd4mCWOCXbL6HcF6QWtlJ9oMMm0NMykBW
	4KkL4tPhYhIxWCvkBgu0yEk+5LJ1hHLNBxxpya9FaYILpcmKyjL7QjDD+s/knN3zzrGebq4Vy2y
	PobscLg9o0XLoVoOU7Z/o3PnTGgZCnHP6MBvcZ07Y5K8KK4VW4oM5JG8=
X-Google-Smtp-Source: AGHT+IGOIU2Hb0b7SxRBvlfqcgbuAXRJAuFrjV27acuPh4cIAt8pB8nCkBUwUL689u9fB1K7/903Xplri6oofPPKkahaCRHr3t1J
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a69:b0:3d0:2477:83ec with SMTP id
 e9e14a558f8ab-3d13dfa8591mr14464415ab.14.1738911722108; Thu, 06 Feb 2025
 23:02:02 -0800 (PST)
Date: Thu, 06 Feb 2025 23:02:02 -0800
In-Reply-To: <20250207063721.244699-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5afea.050a0220.2b1e6.0014.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in hci_chan_del (2)
From: syzbot <syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in l2cap_sock_shutdown

======================================================
WARNING: possible circular locking dependency detected
6.14.0-rc1-next-20250207-syzkaller-02219-ged58d103e6da-dirty #0 Not tainted
------------------------------------------------------
syz.0.16/6578 is trying to acquire lock:
ffff888012844078 (&hdev->lock){+.+.}-{4:4}, at: l2cap_sock_shutdown+0xa41/0x10c0 net/bluetooth/l2cap_sock.c:1363

but task is already holding lock:
ffff888079163518 (&chan->lock/1){+.+.}-{4:4}, at: l2cap_chan_lock include/net/bluetooth/l2cap.h:827 [inline]
ffff888079163518 (&chan->lock/1){+.+.}-{4:4}, at: l2cap_sock_shutdown+0x9c9/0x10c0 net/bluetooth/l2cap_sock.c:1360

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&chan->lock/1){+.+.}-{4:4}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19c/0x1010 kernel/locking/mutex.c:730
       l2cap_chan_connect+0x7e7/0xeb0 net/bluetooth/l2cap_core.c:7084
       l2cap_sock_connect+0x5c9/0x800 net/bluetooth/l2cap_sock.c:256
       __sys_connect_file net/socket.c:2045 [inline]
       __sys_connect+0x288/0x2d0 net/socket.c:2064
       __do_sys_connect net/socket.c:2070 [inline]
       __se_sys_connect net/socket.c:2067 [inline]
       __x64_sys_connect+0x7a/0x90 net/socket.c:2067
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&conn->chan_lock){+.+.}-{4:4}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19c/0x1010 kernel/locking/mutex.c:730
       l2cap_conn_ready net/bluetooth/l2cap_core.c:1627 [inline]
       l2cap_connect_cfm+0x5b4/0x1090 net/bluetooth/l2cap_core.c:7288
       hci_connect_cfm include/net/bluetooth/hci_core.h:2051 [inline]
       hci_remote_features_evt+0x68e/0xac0 net/bluetooth/hci_event.c:3726
       hci_event_func net/bluetooth/hci_event.c:7473 [inline]
       hci_event_packet+0xac2/0x1540 net/bluetooth/hci_event.c:7525
       hci_rx_work+0x3f3/0xdb0 net/bluetooth/hci_core.c:4015
       process_one_work kernel/workqueue.c:3236 [inline]
       process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
       worker_thread+0x870/0xd30 kernel/workqueue.c:3398
       kthread+0x7a9/0x920 kernel/kthread.c:464
       ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #0 (&hdev->lock){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3163 [inline]
       check_prevs_add kernel/locking/lockdep.c:3282 [inline]
       validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3906
       __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5228
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19c/0x1010 kernel/locking/mutex.c:730
       l2cap_sock_shutdown+0xa41/0x10c0 net/bluetooth/l2cap_sock.c:1363
       l2cap_sock_release+0x79/0x1d0 net/bluetooth/l2cap_sock.c:1419
       __sock_release net/socket.c:647 [inline]
       sock_close+0xbc/0x240 net/socket.c:1398
       __fput+0x3e9/0x9f0 fs/file_table.c:464
       task_work_run+0x24f/0x310 kernel/task_work.c:227
       get_signal+0x15f7/0x1750 kernel/signal.c:2809
       arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:337
       exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
       exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
       __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
       syscall_exit_to_user_mode+0xce/0x340 kernel/entry/common.c:218
       do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &hdev->lock --> &conn->chan_lock --> &chan->lock/1

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&chan->lock/1);
                               lock(&conn->chan_lock);
                               lock(&chan->lock/1);
  lock(&hdev->lock);

 *** DEADLOCK ***

2 locks held by syz.0.16/6578:
 #0: ffff888079a38e08 (&sb->s_type->i_mutex_key#10){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:877 [inline]
 #0: ffff888079a38e08 (&sb->s_type->i_mutex_key#10){+.+.}-{4:4}, at: __sock_release net/socket.c:646 [inline]
 #0: ffff888079a38e08 (&sb->s_type->i_mutex_key#10){+.+.}-{4:4}, at: sock_close+0x90/0x240 net/socket.c:1398
 #1: ffff888079163518 (&chan->lock/1){+.+.}-{4:4}, at: l2cap_chan_lock include/net/bluetooth/l2cap.h:827 [inline]
 #1: ffff888079163518 (&chan->lock/1){+.+.}-{4:4}, at: l2cap_sock_shutdown+0x9c9/0x10c0 net/bluetooth/l2cap_sock.c:1360

stack backtrace:
CPU: 0 UID: 0 PID: 6578 Comm: syz.0.16 Not tainted 6.14.0-rc1-next-20250207-syzkaller-02219-ged58d103e6da-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_circular_bug+0x13a/0x1b0 kernel/locking/lockdep.c:2076
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2208
 check_prev_add kernel/locking/lockdep.c:3163 [inline]
 check_prevs_add kernel/locking/lockdep.c:3282 [inline]
 validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3906
 __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5228
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
 __mutex_lock_common kernel/locking/mutex.c:585 [inline]
 __mutex_lock+0x19c/0x1010 kernel/locking/mutex.c:730
 l2cap_sock_shutdown+0xa41/0x10c0 net/bluetooth/l2cap_sock.c:1363
 l2cap_sock_release+0x79/0x1d0 net/bluetooth/l2cap_sock.c:1419
 __sock_release net/socket.c:647 [inline]
 sock_close+0xbc/0x240 net/socket.c:1398
 __fput+0x3e9/0x9f0 fs/file_table.c:464
 task_work_run+0x24f/0x310 kernel/task_work.c:227
 get_signal+0x15f7/0x1750 kernel/signal.c:2809
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xce/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f32d118cda9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f32d1fa9038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: fffffffffffffffc RBX: 00007f32d13a5fa0 RCX: 00007f32d118cda9
RDX: 000000000000000e RSI: 0000000020000100 RDI: 0000000000000004
RBP: 00007f32d120e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f32d13a5fa0 R15: 00007ffc760ea6e8
 </TASK>


Tested on:

commit:         ed58d103 Add linux-next specific files for 20250207
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11db0b18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=244a34ec1429746
dashboard link: https://syzkaller.appspot.com/bug?extid=10bd8fe6741eedd2be2e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13381df8580000

