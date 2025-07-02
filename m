Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4692D46B1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751478096; cv=none; b=PXTIGo+hMopmxX2D3mnpQEmWbnNY/Lo80nhDLaIVTvddYBChgHDnKlnSbbnjg9YjhKtmJMWp2LG3Ij++5QO5FZysjAMi53ewcpVxXemzBMsiv5ZoWkTuk4tCjGbyuR60ridnYGrXY2WBXm5gm59aa6nwRKUYTW+AWAwt0QB2isU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751478096; c=relaxed/simple;
	bh=k2hXWWBUInE/X3KUM9hCnoEYw20iSW7B44f1ZY4i5/E=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GsgDOg4VdRN1KSEJ9payV0DwwawkSpEi0zpu7xeCVYQdodLQZUTjv4Vd1e6JpYwoTkZ2rJqbMZ5w1M2EvtNwn8WT+76ffDdHhOSoF50YndvBj4V0aV9A7/aLubrGRvdafpHNOj8ewQFgAHwTO7e/KMv10wO/pBM/jSX2jWHIh/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3df2cc5104bso77918065ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751478093; x=1752082893;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBSPzhdH3wEfOn7N4dpzQCCYfN1eHNCMULLRrjRIgjg=;
        b=KSM+1nT7fTGEJkcXdKE+FozsCk/qbl03W/xyX6wDye7PiyeuI1j1+85CtMeeXOscN4
         Priy2vArFlkQWEBLpZbeZSoxGjTIZR0bdOWOC3yA2+B/56v1m05WnHqPcf00fCYJixCc
         7lifXNjJ/AHLZoa3sY3lWw9xs1a3oAhhhYhc8pnkBvG6X5T0y6muAFaH+kajDTE9p7S1
         vKdG8NBdiwIrH6lYTChkUuOqFRB1ye4M6AzyvUfokTMDN2er+bAMJzG78+L32HkE6NGs
         B2YX3qTzJ7U0s2ZR4TXFCQq7BQweVYzA9IvTq5YeAUIJLQjqQ10lqSa4yrlVAeCwRITi
         gWZg==
X-Forwarded-Encrypted: i=1; AJvYcCWLmxgidnlt00SHnwqrX019QhCasHjXaQ7zQAjvrMRuzhmlls9gshHe3R8u84+2DXfAAjZBsZuCSG7n1lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLH39chcB6VdCgdwOqV/aRhV4TdfBvnKkuiKUYJwHcSk3Iofs1
	7VYm6XyQ5gXv/Efm5actWrsWjDqrsIMnPQGrPvkgu8Z3HTcfpXfvk1mwXK2qI7qlkVJ/pz/lXqG
	WdCTC+nSxLQvbrrFGNA1E7rgo01Sd0X/qKMAxCjGydErRc85VfUDu4FHWm9k=
X-Google-Smtp-Source: AGHT+IG9qfWx+mO2skrdHILIdxNHe2YmS67iX533ok1MrJTgeiu9knx1RbwQcsUIO5BQIb1S0J6cP6Ue0Z1Ecg0rza905tzPaLWR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1606:b0:3dc:8b2c:4bc7 with SMTP id
 e9e14a558f8ab-3e05c2ad437mr7169745ab.1.1751478093001; Wed, 02 Jul 2025
 10:41:33 -0700 (PDT)
Date: Wed, 02 Jul 2025 10:41:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68656f4c.a70a0220.2b31f5.0000.GAE@google.com>
Subject: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
From: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
To: Dai.Ngo@oracle.com, anna@kernel.org, chuck.lever@oracle.com, 
	davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jlayton@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, neil@brown.name, netdev@vger.kernel.org, 
	okorniev@redhat.com, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	tom@talpey.com, trondmy@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    50c8770a42fa Add linux-next specific files for 20250702
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=162e7982580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=70c16e4e191115d4
dashboard link: https://syzkaller.appspot.com/bug?extid=169de184e9defe7fe709
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1247d770580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ffe48c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3d4ef6bedc5b/disk-50c8770a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/15b7565dc0ef/vmlinux-50c8770a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3b397342a62b/bzImage-50c8770a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
6.16.0-rc4-next-20250702-syzkaller #0 Not tainted
--------------------------------------------
syz-executor309/5837 is trying to acquire lock:
ffff88807f5bc8c8 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:869 [inline]
ffff88807f5bc8c8 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}, at: rpc_close_pipes+0x10a/0x730 net/sunrpc/rpc_pipe.c:178

but task is already holding lock:
ffff88807f5b91c8 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:869 [inline]
ffff88807f5b91c8 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}, at: __simple_recursive_removal+0x190/0x510 fs/libfs.c:627

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&sb->s_type->i_mutex_key#15);
  lock(&sb->s_type->i_mutex_key#15);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

4 locks held by syz-executor309/5837:
 #0: ffff888033ee40e0 (&type->s_umount_key#42){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
 #0: ffff888033ee40e0 (&type->s_umount_key#42){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
 #0: ffff888033ee40e0 (&type->s_umount_key#42){+.+.}-{4:4}, at: deactivate_super+0xa9/0xe0 fs/super.c:506
 #1: ffff8881446f60a0 (&sn->pipefs_sb_lock){+.+.}-{4:4}, at: rpc_kill_sb+0x77/0x190 net/sunrpc/rpc_pipe.c:1196
 #2: ffffffff8f8e2df0 ((rpc_pipefs_notifier_list).rwsem){++++}-{4:4}, at: blocking_notifier_call_chain+0x54/0x90 kernel/notifier.c:379
 #3: ffff88807f5b91c8 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:869 [inline]
 #3: ffff88807f5b91c8 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}, at: __simple_recursive_removal+0x190/0x510 fs/libfs.c:627

stack backtrace:
CPU: 0 UID: 0 PID: 5837 Comm: syz-executor309 Not tainted 6.16.0-rc4-next-20250702-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_deadlock_bug+0x28b/0x2a0 kernel/locking/lockdep.c:3044
 check_deadlock kernel/locking/lockdep.c:3096 [inline]
 validate_chain+0x1a3f/0x2140 kernel/locking/lockdep.c:3898
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
 down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
 inode_lock include/linux/fs.h:869 [inline]
 rpc_close_pipes+0x10a/0x730 net/sunrpc/rpc_pipe.c:178
 __simple_recursive_removal+0x208/0x510 fs/libfs.c:631
 rpc_unlink+0x56/0x80 net/sunrpc/rpc_pipe.c:696
 rpc_pipefs_event+0xc0/0x170 fs/nfs/blocklayout/rpc_pipefs.c:179
 notifier_call_chain+0x1b3/0x3e0 kernel/notifier.c:85
 blocking_notifier_call_chain+0x6a/0x90 kernel/notifier.c:380
 rpc_kill_sb+0xd0/0x190 net/sunrpc/rpc_pipe.c:1204
 deactivate_locked_super+0xb9/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 ptrace_notify+0x281/0x2c0 kernel/signal.c:2520
 ptrace_report_syscall include/linux/ptrace.h:415 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
 syscall_exit_work+0xc6/0x1d0 kernel/entry/syscall-common.c:111
 syscall_exit_to_user_mode_work include/linux/entry-common.h:173 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2ad/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8f7dbc82e9
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe287838a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffec RBX: 0000200000000000 RCX: 00007f8f7dbc82e9


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
