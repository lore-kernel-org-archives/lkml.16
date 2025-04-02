Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FADA33DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 04:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743566482; cv=none; b=GTkfGo7g4G5XhY0m4ebavQNH2hXfYbRaMudmwWGy5hJws/BpvKQnoa8D4z5S+hhKwKUuxHEW4wRvMwil3qQrTOPu/YwwG0nJxRJ906urIfnTYrTbC815D5fVSIXoZx69sylwKWo3CNVb1CqsWdqiCOQEie59JbOz8UczXDaP6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743566482; c=relaxed/simple;
	bh=+SlSZSbWPshA0O2QwLGJDKizvotl4Tu99BPBkV1OA+I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GwAqeSZVd9oX9V/+sA0tSVSHDaM1qwlWT6wA/4fWPuRsiGkewb0mTv+D/4/P0FMU3+Vi1YP+7avY8DnMb+E1VPv6MghpquvWQadOp9JZw/pECFhr2Xncbb2Mbow6RcXDCQUXXVUacY+qKu7oA8pWQmUrux3mDbGlKuiT/Pyhc7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85b5878a66cso1240611939f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 21:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743566480; x=1744171280;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBGRGo9P/D0Zf9y3J6uSoJsL1ycztv86eqTrGWjDJCE=;
        b=Y/58oYTbeofvXwESGCdeKwBlHY9tBMA1PrDhWC+TuMvuH2vDWRKXt0nMmLO5am39eS
         mR01Cls/tQgrB7eChN3t6rd95goYrefi+VRkAU/SC7pJy/zt0xxo98yCTEmytMYo08Xy
         0lwq3IPo/WOycBtaYlBYHGRn0DrnAZSbVw3a/+iSO6o+jyjLwA8koQBOSMntzeOTEU0O
         keSoNfzS9sGlA/rVwImw31TsPKgPV4vQZQf7nN2SCtHtFdCxk5lYHYY+uJCu1aKexR6B
         xwp1tinFTot/cMmEjF0NQXEqZRZ0t4ViXARl8qKNnLTtCN4ys67wMm07U5jKdgKHVwqr
         OlSg==
X-Forwarded-Encrypted: i=1; AJvYcCWPMPLUFfaOxQ0tuOrLe8igWlMHsmpIDCf7OgBB85LeY3SUQ2N6jHGcTM/BGULQqOiv6epjvB9Jc1SJ/l4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw16jgmF02lua1bvF0zh2UTaluPOH+yUm8xKT74LkeUGhcHNupo
	BSp3Q8EuxEerqxSGyusEgtkxmRY1v3W8IXHYqTeW6/1uLcgc5Fy749m6YIhrJOdzhtQKsmcIoSB
	mRxzyGrmAtQ+NAfTxwWJCBSNNEK05EdDRmsPLrKjgKjdojQ85GCdONwU=
X-Google-Smtp-Source: AGHT+IGgHWiGTY8D8L68GL1x4BimquiiUy8nvuuyGDcoj1nKyRA/sppjcrHaLmZ+CZ8Xul1Vp7NqiDqydfnriDadpSkH5hzHvY1g
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3101:b0:3d3:d4f0:271d with SMTP id
 e9e14a558f8ab-3d6d54ce9b9mr11941595ab.12.1743566480394; Tue, 01 Apr 2025
 21:01:20 -0700 (PDT)
Date: Tue, 01 Apr 2025 21:01:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ecb690.050a0220.31979b.0036.GAE@google.com>
Subject: [syzbot] [net?] possible deadlock in dev_close
From: syzbot <syzbot+9f46f55b69eb4f3e054b@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0c86b42439b6 Merge tag 'drm-next-2025-03-28' of https://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1353c678580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=500ed53123ea6589
dashboard link: https://syzkaller.appspot.com/bug?extid=9f46f55b69eb4f3e054b
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-0c86b424.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3e78f55971a9/vmlinux-0c86b424.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3f8acc0407dd/bzImage-0c86b424.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9f46f55b69eb4f3e054b@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 1024
netlink: 36 bytes leftover after parsing attributes in process `syz.0.0'.
netlink: 'syz.0.0': attribute type 10 has an invalid length.
bond0: (slave netdevsim0): Enslaving as an active interface with an up link
bond0: (slave netdevsim0): Releasing backup interface
============================================
WARNING: possible recursive locking detected
6.14.0-syzkaller-09352-g0c86b42439b6 #0 Not tainted
--------------------------------------------
syz.0.0/5321 is trying to acquire lock:
ffff888042eccd28 (&dev->lock){+.+.}-{4:4}, at: netdev_lock include/linux/netdevice.h:2751 [inline]
ffff888042eccd28 (&dev->lock){+.+.}-{4:4}, at: netdev_lock_ops include/net/netdev_lock.h:42 [inline]
ffff888042eccd28 (&dev->lock){+.+.}-{4:4}, at: dev_close+0x121/0x280 net/core/dev_api.c:224

but task is already holding lock:
ffff888042eccd28 (&dev->lock){+.+.}-{4:4}, at: netdev_lock include/linux/netdevice.h:2751 [inline]
ffff888042eccd28 (&dev->lock){+.+.}-{4:4}, at: netdev_lock_ops include/net/netdev_lock.h:42 [inline]
ffff888042eccd28 (&dev->lock){+.+.}-{4:4}, at: do_setlink+0x209/0x4370 net/core/rtnetlink.c:3025

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&dev->lock);
  lock(&dev->lock);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

2 locks held by syz.0.0/5321:
 #0: ffffffff900e5f48 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #0: ffffffff900e5f48 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:341 [inline]
 #0: ffffffff900e5f48 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0xd68/0x1fe0 net/core/rtnetlink.c:4061
 #1: ffff888042eccd28 (&dev->lock){+.+.}-{4:4}, at: netdev_lock include/linux/netdevice.h:2751 [inline]
 #1: ffff888042eccd28 (&dev->lock){+.+.}-{4:4}, at: netdev_lock_ops include/net/netdev_lock.h:42 [inline]
 #1: ffff888042eccd28 (&dev->lock){+.+.}-{4:4}, at: do_setlink+0x209/0x4370 net/core/rtnetlink.c:3025

stack backtrace:
CPU: 0 UID: 0 PID: 5321 Comm: syz.0.0 Not tainted 6.14.0-syzkaller-09352-g0c86b42439b6 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_deadlock_bug+0x2be/0x2d0 kernel/locking/lockdep.c:3042
 check_deadlock kernel/locking/lockdep.c:3094 [inline]
 validate_chain+0x928/0x24e0 kernel/locking/lockdep.c:3896
 __lock_acquire+0xad5/0xd80 kernel/locking/lockdep.c:5235
 lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
 __mutex_lock_common kernel/locking/mutex.c:587 [inline]
 __mutex_lock+0x1a5/0x10c0 kernel/locking/mutex.c:732
 netdev_lock include/linux/netdevice.h:2751 [inline]
 netdev_lock_ops include/net/netdev_lock.h:42 [inline]
 dev_close+0x121/0x280 net/core/dev_api.c:224
 __bond_release_one+0xcaf/0x1220 drivers/net/bonding/bond_main.c:2629
 bond_slave_netdev_event drivers/net/bonding/bond_main.c:4028 [inline]
 bond_netdev_event+0x557/0xfb0 drivers/net/bonding/bond_main.c:4146
 notifier_call_chain+0x1a5/0x3f0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2218 [inline]
 call_netdevice_notifiers net/core/dev.c:2232 [inline]
 netif_change_net_namespace+0xa30/0x1c20 net/core/dev.c:12163
 do_setlink+0x3aa/0x4370 net/core/rtnetlink.c:3042
 rtnl_changelink net/core/rtnetlink.c:3766 [inline]
 __rtnl_newlink net/core/rtnetlink.c:3925 [inline]
 rtnl_newlink+0x17e2/0x1fe0 net/core/rtnetlink.c:4062
 rtnetlink_rcv_msg+0x80f/0xd70 net/core/rtnetlink.c:6952
 netlink_rcv_skb+0x208/0x480 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x7f8/0x9a0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x8e8/0xce0 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x221/0x270 net/socket.c:727
 ____sys_sendmsg+0x53c/0x870 net/socket.c:2566
 ___sys_sendmsg net/socket.c:2620 [inline]
 __sys_sendmsg+0x271/0x360 net/socket.c:2652
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb17b38d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb17c2be038 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00007fb17b5a5fa0 RCX: 00007fb17b38d169
RDX: 0000000000000000 RSI: 0000200000000340 RDI: 0000000000000008
RBP: 00007fb17b40e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fb17b5a5fa0 R15: 00007fff2d1aa5d8
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
