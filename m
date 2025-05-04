Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043C18A6AD
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746350792; cv=none; b=o/Njt6k2Le9HbWzAuN6+GIu2iHfcQYLoGHbuazIb9MglWBXu7sf4e0qXNLppyhiVbGfpzzh45ReL1Cbr90MUf/vHOW+xrGB6K0/CF8x3aDz0Qay0pyRx4j4J4Rn+ztYM6bUUis+4l9SiNxl2TtdHzT3QGMtyOw5lCNSyHV24pOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746350792; c=relaxed/simple;
	bh=4PFX5NuaicT/IaUG2oX++UheisrMo5dMKj7ntdk5evE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IcHw8kk++Nw5oou+aVJqM6o1PDa2Gpqed8qAVMvpfaM0h9diAjJH14egwUEO++VWgK0ezcntw1P5avfe9PJX5gSTXNqgIvDEiIJ6QeLo5AN5NhOTpZDdbx0y24lEYiKPulmDXj/LG755OqYFVaz1kOcJ4ME5lDT3V7FjE6l59bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d81a0224e7so65923345ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 02:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746350789; x=1746955589;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEbOKgn8qwVmd2AwEnfgT5m8cq4Y4VZJckHgpMBwWEY=;
        b=CglWChvdsPCQcWodRkwScZvQF9ERxsHSm18e1XddvRel2a252YjlhUySmOVyGFLbxy
         BIzn/kFxPHbXw3JZsumOb3+K8NMQ5IkQyXB2hV/CqGHBzzq+f3j+8F8uj3FgjM45kyD6
         rSKXZY4gczWtpNMF7awPA0n1Ee2SmCMxfpOZYziZDHF2LpEttbRR57deNMwgM3wbmwfI
         CofhyYjYby9jNUpT9ZoXIkJ0qWX8du7GpdIBCJhV0LmUjxJvR9BBf3HEZZSgU0AyqAJu
         ba8GAKQeFNd8vSodIIRgCxXK+6e5vkzVW4WKrsNosmcSmy+usJ0buUcLmeVBgDjF0OZm
         r9ow==
X-Forwarded-Encrypted: i=1; AJvYcCUBIYbbyPO65RGYXwrUjJEtLjqB+BmHSZQSSsV08+QqPCU7ueLvseWd7sLcqiPx8cpv9RAnw2rshrW6NAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSP8RbuvMBuKh7mtdaDEe5xGwO4y4VO0EPIvfOXIy4jK5z96k
	fYisIu5O9xxL4zt5PKFuiNmE4GNgnasr1npIa8YHgc9DCoaTpKTrWMKEXy4k402y2dfPw/nM+o5
	R8pXAFUFzA1Bt52lt3qWzPgTHG9hqrl/9Fak8IGrpkdzGSD7NoNBs0w0=
X-Google-Smtp-Source: AGHT+IHnsxctzrr6C1F7eYC75qmBciPckx05zod7oc0aow4FsJFeYplVt3aoAP8Bf0oeNrVr5RqYba1FeqSLRnXM919FPhVD2opy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1569:b0:3d8:20f0:4006 with SMTP id
 e9e14a558f8ab-3da5b2383b7mr33606825ab.4.1746350789260; Sun, 04 May 2025
 02:26:29 -0700 (PDT)
Date: Sun, 04 May 2025 02:26:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681732c5.050a0220.11da1b.002d.GAE@google.com>
Subject: [syzbot] [net?] BUG: sleeping function called from invalid context in pcpu_alloc_noprof
From: syzbot <syzbot+bcc12d6799364500fbec@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    836b313a14a3 ipv4: Honor "ignore_routes_with_linkdown" sys..
git tree:       net-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11841a70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=734b5f968169d82b
dashboard link: https://syzkaller.appspot.com/bug?extid=bcc12d6799364500fbec
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147be0f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127be0f4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8a23ff59cf08/disk-836b313a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/261168771da2/vmlinux-836b313a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5451cd746973/bzImage-836b313a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bcc12d6799364500fbec@syzkaller.appspotmail.com

IPv6: NLM_F_CREATE should be specified when creating new route
BUG: sleeping function called from invalid context at kernel/locking/mutex.c:578
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 5829, name: syz-executor427
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
1 lock held by syz-executor427/5829:
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: ip6_route_add+0x4d/0x2f0 net/ipv6/route.c:3913
CPU: 0 UID: 0 PID: 5829 Comm: syz-executor427 Not tainted 6.15.0-rc4-syzkaller-00746-g836b313a14a3 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 __might_resched+0x495/0x610 kernel/sched/core.c:8818
 __mutex_lock_common kernel/locking/mutex.c:578 [inline]
 __mutex_lock+0x106/0xe80 kernel/locking/mutex.c:746
 pcpu_alloc_noprof+0x284/0x16b0 mm/percpu.c:1782
 dst_cache_init+0x37/0xc0 net/core/dst_cache.c:145
 ip_tun_build_state+0x193/0x6b0 net/ipv4/ip_tunnel_core.c:687
 lwtunnel_build_state+0x381/0x4c0 net/core/lwtunnel.c:137
 fib_nh_common_init+0x129/0x460 net/ipv4/fib_semantics.c:635
 fib6_nh_init+0x15e4/0x2030 net/ipv6/route.c:3669
 ip6_route_info_create_nh+0x139/0x870 net/ipv6/route.c:3866
 ip6_route_add+0xf6/0x2f0 net/ipv6/route.c:3915
 inet6_rtm_newroute+0x284/0x1c50 net/ipv6/route.c:5732
 rtnetlink_rcv_msg+0x7cc/0xb70 net/core/rtnetlink.c:6955
 netlink_rcv_skb+0x219/0x490 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x758/0x8d0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x219/0x270 net/socket.c:727
 ____sys_sendmsg+0x505/0x830 net/socket.c:2566
 ___sys_sendmsg+0x21f/0x2a0 net/socket.c:2620
 __sys_sendmsg net/socket.c:2652 [inline]
 __do_sys_sendmsg net/socket.c:2657 [inline]
 __se_sys_sendmsg net/socket.c:2655 [inline]
 __x64_sys_sendmsg+0x19b/0x260 net/socket.c:2655
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe9b33468d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcf70e3268 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00007fe9b33944ad RCX: 00007fe9b33468d9
RDX: 000000001000c840 RSI: 00002000000000c0 RDI: 0000000000000004
RBP: 00007fe9b339447d R08: 0000000000000000 R09: 0000555500000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fe9b33943e5
R13: 0000000000000001 R14: 00007ffcf70e32b0 R15: 0000000000000003
 </TASK>

=============================
[ BUG: Invalid wait context ]
6.15.0-rc4-syzkaller-00746-g836b313a14a3 #0 Tainted: G        W          
-----------------------------
syz-executor427/5829 is trying to lock:
ffffffff8e021688 (pcpu_alloc_mutex){+.+.}-{4:4}, at: pcpu_alloc_noprof+0x284/0x16b0 mm/percpu.c:1782
other info that might help us debug this:
context-{5:5}
1 lock held by syz-executor427/5829:
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8df3b860 (rcu_read_lock){....}-{1:3}, at: ip6_route_add+0x4d/0x2f0 net/ipv6/route.c:3913
stack backtrace:
CPU: 0 UID: 0 PID: 5829 Comm: syz-executor427 Tainted: G        W           6.15.0-rc4-syzkaller-00746-g836b313a14a3 #0 PREEMPT(full) 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_lock_invalid_wait_context kernel/locking/lockdep.c:4831 [inline]
 check_wait_context kernel/locking/lockdep.c:4903 [inline]
 __lock_acquire+0xbcf/0xd20 kernel/locking/lockdep.c:5185
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
 __mutex_lock_common kernel/locking/mutex.c:601 [inline]
 __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:746
 pcpu_alloc_noprof+0x284/0x16b0 mm/percpu.c:1782
 dst_cache_init+0x37/0xc0 net/core/dst_cache.c:145
 ip_tun_build_state+0x193/0x6b0 net/ipv4/ip_tunnel_core.c:687
 lwtunnel_build_state+0x381/0x4c0 net/core/lwtunnel.c:137
 fib_nh_common_init+0x129/0x460 net/ipv4/fib_semantics.c:635
 fib6_nh_init+0x15e4/0x2030 net/ipv6/route.c:3669
 ip6_route_info_create_nh+0x139/0x870 net/ipv6/route.c:3866
 ip6_route_add+0xf6/0x2f0 net/ipv6/route.c:3915
 inet6_rtm_newroute+0x284/0x1c50 net/ipv6/route.c:5732
 rtnetlink_rcv_msg+0x7cc/0xb70 net/core/rtnetlink.c:6955
 netlink_rcv_skb+0x219/0x490 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x758/0x8d0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x219/0x270 net/socket.c:727
 ____sys_sendmsg+0x505/0x830 net/socket.c:2566
 ___sys_sendmsg+0x21f/0x2a0 net/socket.c:2620
 __sys_sendmsg net/socket.c:2652 [inline]
 __do_sys_sendmsg net/socket.c:2657 [inline]
 __se_sys_sendmsg net/socket.c:2655 [inline]
 __x64_sys_sendmsg+0x19b/0x260 net/socket.c:2655
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe9b33468d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcf70e3268 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00007fe9b33944ad RCX: 00007fe9b33468d9
RDX: 000000001000c840 RSI: 00002000000000c0 RDI: 0000000000000004
RBP: 00007fe9b339447d R08: 0000000000000000 R09: 0


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
