Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44F628D8C4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034594; cv=none; b=OdUCqXgYDGRk7FgmIFkYt0RNn3X+bpT28J43x58jfESXT5rZGhriU7z3yC7gBG50NMjRqwRvTN63OYZJiQh27VTaZsx1f/ytZkpeA6yvhJ9fprZlXc9sw4aos7FZ2xr9v1+GwHqh2/nrMALNi5IF1B0hwpEvnG7UBEHEoBr0Qng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034594; c=relaxed/simple;
	bh=T+zYEIAmMmpAzN1ze+g1gfi5HhEkkGrf3dbSzfbrWjQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TiRQtbWC+aDyxFoTpfkuynjMHJGmbAJOgnBQpMNjCrmUDnf9rluwk6rItaQO8uNxuSiKNha1DIZIhu2NeTN5fv/lFA6pa44xOsnag9DXsZfaMscACL3Z6kJFXxgT4huZDgJaEJkZcOniLsk8FZABSUfXV9nJOKHDZY7RsAe2BS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddb62de753so28339635ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 03:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749034592; x=1749639392;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9H9I0I6jfZojHPAuDECm5OdoTjhXs2NEC2Che2TNBsM=;
        b=hQ9z7uoQGZJ+WK9cqXyLXpoK+APqm8fwRNYsgVIK6xBJl8IWlQyPE9QtDdRyttPmqs
         Hp9Y46VvUEoGHLlzkm6MbnPmAJyCJxOCEAK11NLc1SNr0oQaVWs5CZmtNfR5JuoJMR/d
         8LoGwNMMwrrZb5Ss3Cau7tqPa091ndlh2PgOJ9IH43XsEY5QasZ61pPEwuKfHTvarc3F
         DENRNhrmozPLR/Divcir8xxxk7YMdETYFlgC21HNjyhskW3/3OrKzcOEd72yRX9B1XtV
         G4riQHs1NA4F492YYkURbV2nG/avYs7QVXdVILD9l6MHTjFoFNCVbNBO/8Ahk10nIJYx
         Jt0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTXDSJORis5DwHHekbmsrDoTDYEt8jf6JyolxI0e97Y0tDM/H5zENbhlJCbwq5+MDBxShObARwcT+TQIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDxDPKljbL2Ty9yqyEXLPu/3TwV7/RxD/h8ploIwEQ+51T6F0U
	aB+zyDCLjWq6rdmCXltf+H8cB2sQ7oMWcCGU+nkXsfMYQwqsA86uursN0Bn+IPayUOastHyi1QX
	iJVJUoeQPftviSL6TfnAm569G5N9mSdorhOelIguevLKAddI7o9YuVNHQzsU=
X-Google-Smtp-Source: AGHT+IGkDC1m7T/sZhA1CzDZGOPEYypkra9gBAnM6ErQK7mA6H0Ft7U4WI4bzOy3kCcvFqpWL09GKkKRjYyUoWJ2p6rK4xOtursK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:378c:b0:3dc:757b:3fb3 with SMTP id
 e9e14a558f8ab-3ddbede5cb9mr25417395ab.20.1749034591917; Wed, 04 Jun 2025
 03:56:31 -0700 (PDT)
Date: Wed, 04 Jun 2025 03:56:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6840265f.a00a0220.d4325.0009.GAE@google.com>
Subject: [syzbot] [net?] general protection fault in dev_set_group
From: syzbot <syzbot+9fc858ba0312b42b577e@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b56bbaf8c9ff Merge branch 'net-airoha-fix-ipv6-hw-accelera..
git tree:       net
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11947c82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=262b2977ef00756b
dashboard link: https://syzkaller.appspot.com/bug?extid=9fc858ba0312b42b577e
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1122780c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15947c82580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dfc603506ef3/disk-b56bbaf8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/531e9b9a7cff/vmlinux-b56bbaf8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/001a9016bbc6/bzImage-b56bbaf8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9fc858ba0312b42b577e@syzkaller.appspotmail.com

netlink: 'syz-executor579': attribute type 1 has an invalid length.
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000055: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x00000000000002a8-0x00000000000002af]
CPU: 1 UID: 0 PID: 5834 Comm: syz-executor579 Not tainted 6.15.0-syzkaller-07817-gb56bbaf8c9ff #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:netdev_need_ops_lock include/net/netdev_lock.h:33 [inline]
RIP: 0010:netdev_lock_ops include/net/netdev_lock.h:41 [inline]
RIP: 0010:dev_set_group+0xc0/0x230 net/core/dev_api.c:82
Code: 03 43 80 3c 2f 00 74 08 48 89 df e8 4a 40 d4 f8 41 bd a8 02 00 00 4c 03 2b 4c 89 e8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 ef e8 22 40 d4 f8 31 c0 49 83 7d 00 00 0f
RSP: 0018:ffffc9000417ee60 EFLAGS: 00010206
RAX: 0000000000000055 RBX: ffff8880227e4008 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000055690764 RDI: ffff8880227e4000
RBP: ffff8880227e4000 R08: 0000000000400dc0 R09: 00000000ffffffff
R10: dffffc0000000000 R11: fffffbfff1f41637 R12: 0000000000000000
R13: 00000000000002a8 R14: 1ffff110044fc998 R15: 1ffff110044fc801
FS:  000055556089f380(0000) GS:ffff888125d66000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563942114448 CR3: 000000007d85a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 rtnl_create_link+0x748/0xd10 net/core/rtnetlink.c:3674
 rtnl_newlink_create+0x25c/0xb00 net/core/rtnetlink.c:3813
 __rtnl_newlink net/core/rtnetlink.c:3940 [inline]
 rtnl_newlink+0x16d6/0x1c70 net/core/rtnetlink.c:4055
 rtnetlink_rcv_msg+0x7cf/0xb70 net/core/rtnetlink.c:6944
 netlink_rcv_skb+0x208/0x470 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x75b/0x8d0 net/netlink/af_netlink.c:1339
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
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa5080a6369
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd3dfbc8b8 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00007ffd3dfbca88 RCX: 00007fa5080a6369
RDX: 0000000000000000 RSI: 0000200000000280 RDI: 0000000000000003
RBP: 00007fa508119610 R08: 0000000000000000 R09: 00007ffd3dfbca88
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffd3dfbca78 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:netdev_need_ops_lock include/net/netdev_lock.h:33 [inline]
RIP: 0010:netdev_lock_ops include/net/netdev_lock.h:41 [inline]
RIP: 0010:dev_set_group+0xc0/0x230 net/core/dev_api.c:82
Code: 03 43 80 3c 2f 00 74 08 48 89 df e8 4a 40 d4 f8 41 bd a8 02 00 00 4c 03 2b 4c 89 e8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 ef e8 22 40 d4 f8 31 c0 49 83 7d 00 00 0f
RSP: 0018:ffffc9000417ee60 EFLAGS: 00010206
RAX: 0000000000000055 RBX: ffff8880227e4008 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000055690764 RDI: ffff8880227e4000
RBP: ffff8880227e4000 R08: 0000000000400dc0 R09: 00000000ffffffff
R10: dffffc0000000000 R11: fffffbfff1f41637 R12: 0000000000000000
R13: 00000000000002a8 R14: 1ffff110044fc998 R15: 1ffff110044fc801
FS:  000055556089f380(0000) GS:ffff888125c66000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000045ad50 CR3: 000000007d85a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	03 43 80             	add    -0x80(%rbx),%eax
   3:	3c 2f                	cmp    $0x2f,%al
   5:	00 74 08 48          	add    %dh,0x48(%rax,%rcx,1)
   9:	89 df                	mov    %ebx,%edi
   b:	e8 4a 40 d4 f8       	call   0xf8d4405a
  10:	41 bd a8 02 00 00    	mov    $0x2a8,%r13d
  16:	4c 03 2b             	add    (%rbx),%r13
  19:	4c 89 e8             	mov    %r13,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 ef             	mov    %r13,%rdi
  33:	e8 22 40 d4 f8       	call   0xf8d4405a
  38:	31 c0                	xor    %eax,%eax
  3a:	49 83 7d 00 00       	cmpq   $0x0,0x0(%r13)
  3f:	0f                   	.byte 0xf


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
