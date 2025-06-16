Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287AE1F099A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750104451; cv=none; b=JlbQODNIVZ8BcH2/3Gt/SbyXGiceQ0wxFkTWWdOicvJNR+X8NH1V632D3oI6gj7a/Ch5hWBgey20miSMLCJEp8F2Fo+R6lbJky+5n85lvGPBfCSSUZA6+TveewzIWqcYGJySEDmEjCzPX3d/VKOLgZk20L2gjYXVc1RqfxVY0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750104451; c=relaxed/simple;
	bh=w4FT1H1otWuU41iKAyXE3aenXED+yXXKzBlMm2dXHmc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fL6OyTS7PVwFbIf2PUnH2jVGineTQQ7MOpdc2nbYfNRso8FdREuUT6Uuo9xvxSyPjX0i4B38u7QsFLuKDlE481d6qcpMtK2faTp5Dc7LVSI95/YwRqMJuy5Rset7f5m17p8ZsLxsothoDq9ELalDTMpiH0l1rbRuXBvmTN9t4q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-86cf89ff625so516638039f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750104449; x=1750709249;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNrbzhDii0vU3vAETOQo/q36S4p52Ssz6LYa7lqmDek=;
        b=mT0x/OR22ANaSYTCR1mFNkSaXfKY9KM7HZTVTrcQpcXbi0j2oy84gWVGHKXQDBIUDf
         qw/+sGg+OZ7wJeshGsFTBw3pL6GEIK1gnRFRpZgsw2PLqD6TZcyQks9GUoYKPo9HvRAk
         KC3PU8JRApmbmc/c7qi5N75mB3wyqS3g0JlMScaM7Mxgcapy8M60pU19+qchQoVRHd6E
         t70U1yfAtD2tVG4BM9M9gydQy4ahRAfdWTxESQo8ieo9OIBjp7sm4Y7ibCSdBquvYb1L
         Pt6FxNwhr2PYGCrnjgzqTBn7Gvx7nbq43X/up0j/MlRFxBP56yZ4BHHD2ZfSrc2Ex22y
         GalQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDCaol7s7ENMMW9BQGoY85vUufQnhWmFAKBViBw1UXhxWCQUZT95MkU3b0lqF2Obvt8lpv77bvy1HRFok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkx2qd9nOhLfy7X51lykc+e86PH1FHZp5Ri8D/7i+nwybEQZN4
	Rx6wXJ2QAY6ECjhLEpSHXsAKPGG1ecGs+ZhReh4x3TR2eu2UCuo+Ic3ovFmzllz3g3MRue5K6ps
	MZDw+jkA7UCg4TPhxPntGTN1qpEFK3TfkpZAAq0bkAnd9w9tU4YFaMLdnMAg=
X-Google-Smtp-Source: AGHT+IF5ouNXG7IFJ8+gsVFgWhpwLyG5QVowKlfwZxWd8n7iGsa9J4BAoGGhM2HVK+UyWGzoJ62qf/3osFgrQtjulmLHv66DM0Tx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe7:b0:3dd:88da:e804 with SMTP id
 e9e14a558f8ab-3de07d1bb31mr130508655ab.18.1750104449255; Mon, 16 Jun 2025
 13:07:29 -0700 (PDT)
Date: Mon, 16 Jun 2025 13:07:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68507981.a70a0220.395abc.01ef.GAE@google.com>
Subject: [syzbot] [net?] WARNING: suspicious RCU usage in mpls_getroute
From: syzbot <syzbot+8a583bdd1a5cc0b0e068@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5cdb2c77c4c3 Merge tag 'net-6.15-rc8' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1066f9f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=87b7b87abbf1a67f
dashboard link: https://syzkaller.appspot.com/bug?extid=8a583bdd1a5cc0b0e068
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ebc28a81a453/disk-5cdb2c77.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/331d1e5750f7/vmlinux-5cdb2c77.xz
kernel image: https://storage.googleapis.com/syzbot-assets/896acae01c9c/bzImage-5cdb2c77.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8a583bdd1a5cc0b0e068@syzkaller.appspotmail.com

netlink: 334 bytes leftover after parsing attributes in process `syz.2.4451'.
=============================
WARNING: suspicious RCU usage
6.15.0-rc7-syzkaller-00082-g5cdb2c77c4c3 #0 Not tainted
-----------------------------
net/mpls/af_mpls.c:84 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
1 lock held by syz.2.4451/17730:
 #0: ffffffff9012a3e8 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #0: ffffffff9012a3e8 (rtnl_mutex){+.+.}-{4:4}, at: rtnetlink_rcv_msg+0x371/0xe90 net/core/rtnetlink.c:6961

stack backtrace:
CPU: 1 UID: 0 PID: 17730 Comm: syz.2.4451 Not tainted 6.15.0-rc7-syzkaller-00082-g5cdb2c77c4c3 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 lockdep_rcu_suspicious+0x166/0x260 kernel/locking/lockdep.c:6865
 mpls_route_input_rcu+0x1d4/0x200 net/mpls/af_mpls.c:84
 mpls_getroute+0x621/0x1ea0 net/mpls/af_mpls.c:2381
 rtnetlink_rcv_msg+0x3c9/0xe90 net/core/rtnetlink.c:6964
 netlink_rcv_skb+0x16d/0x440 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x53a/0x7f0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x8d1/0xdd0 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg net/socket.c:727 [inline]
 ____sys_sendmsg+0xa98/0xc70 net/socket.c:2566
 ___sys_sendmsg+0x134/0x1d0 net/socket.c:2620
 __sys_sendmmsg+0x200/0x420 net/socket.c:2709
 __do_sys_sendmmsg net/socket.c:2736 [inline]
 __se_sys_sendmmsg net/socket.c:2733 [inline]
 __x64_sys_sendmmsg+0x9c/0x100 net/socket.c:2733
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0a2818e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0a28f52038 EFLAGS: 00000246 ORIG_RAX: 0000000000000133
RAX: ffffffffffffffda RBX: 00007f0a283b5fa0 RCX: 00007f0a2818e969
RDX: 0000000000000003 RSI: 0000200000000080 RDI: 0000000000000003
RBP: 00007f0a28210ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f0a283b5fa0 R15: 00007ffce5e9f268
 </TASK>

=============================
WARNING: suspicious RCU usage
6.15.0-rc7-syzkaller-00082-g5cdb2c77c4c3 #0 Not tainted
-----------------------------
net/mpls/af_mpls.c:85 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
1 lock held by syz.2.4451/17730:
 #0: ffffffff9012a3e8 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #0: ffffffff9012a3e8 (rtnl_mutex){+.+.}-{4:4}, at: rtnetlink_rcv_msg+0x371/0xe90 net/core/rtnetlink.c:6961

stack backtrace:
CPU: 1 UID: 0 PID: 17730 Comm: syz.2.4451 Not tainted 6.15.0-rc7-syzkaller-00082-g5cdb2c77c4c3 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 lockdep_rcu_suspicious+0x166/0x260 kernel/locking/lockdep.c:6865
 mpls_route_input_rcu+0x153/0x200 net/mpls/af_mpls.c:85
 mpls_getroute+0x621/0x1ea0 net/mpls/af_mpls.c:2381
 rtnetlink_rcv_msg+0x3c9/0xe90 net/core/rtnetlink.c:6964
 netlink_rcv_skb+0x16d/0x440 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x53a/0x7f0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x8d1/0xdd0 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg net/socket.c:727 [inline]
 ____sys_sendmsg+0xa98/0xc70 net/socket.c:2566
 ___sys_sendmsg+0x134/0x1d0 net/socket.c:2620
 __sys_sendmmsg+0x200/0x420 net/socket.c:2709
 __do_sys_sendmmsg net/socket.c:2736 [inline]
 __se_sys_sendmmsg net/socket.c:2733 [inline]
 __x64_sys_sendmmsg+0x9c/0x100 net/socket.c:2733
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0a2818e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0a28f52038 EFLAGS: 00000246 ORIG_RAX: 0000000000000133
RAX: ffffffffffffffda RBX: 00007f0a283b5fa0 RCX: 00007f0a2818e969
RDX: 0000000000000003 RSI: 0000200000000080 RDI: 0000000000000003
RBP: 00007f0a28210ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f0a283b5fa0 R15: 00007ffce5e9f268
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
