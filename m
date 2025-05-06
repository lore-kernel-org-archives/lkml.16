Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EF8275842
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540402; cv=none; b=rrhf/scvhH9JwyWcZs6m68oW0d2iaFUWRhw0uTrC5deRDq6l4wfgWrSrj4iK3jCwREBhsW+q9Znex8nh4ikmjX4UIk5+E7LYcYAm/lw0SQDTitCoG81RKR0o9nO6XSG6rLb5Mg78w+qxzfa0jZHVvZwxYO2a5ks4xpLOMo25AuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540402; c=relaxed/simple;
	bh=bv0HVRCix0niu2IxUzJdkDMcsBHYP7kgZZ1LxLAv67w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bZ187h8KUsJ44MWmjVG0B+DjMCLo9BYQRd+S8NDrYhru1E48L3lDUQ+lLgETm7EXd6sSo/tI8J4LYUakRmksfJGZM5F1xd/oY3C8WSfGwAXwhsx39sjOL8CoopyXHLC2H/BGwtTYtK5adORtTXMTYnbVbYVzpBSfiSTaykks/3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d8a9b1c84eso73009245ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540400; x=1747145200;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Szl6w1gWdmmSf2FjvrqVayNusKTVuHe3uUlO8IkO8EA=;
        b=d1lEzniIbkXJEN4AWUSFYpRD8dW3YFDMNHitpoa8BgTuU0ee3QotdETZiUtpyMsLVm
         oQsWW51RpZenlTSXDLK0Vn/jIjPHunLFp5tg00Mo0K20C0UucHXtKcyEetjcz4aLoYmA
         aIOtnBrpXed/KRuQOybI57C6lgl70ZAB4dNnGEeUwMWCKQmhO2W68RD5HnEoIiv5+5gG
         Nxjtj8DWOJZ4U4XTExweaknuliybJ7Fa+GbkSRQA4cKVxMKeHdBKnTCha6ZY3osJ/3h3
         EaDL3Amyj+Kjd6eiZFNcmnXZXQfyHCIIfAqBQzJEAa8Rhle9XrDSffldaYbg9ma1WeZH
         +sIA==
X-Forwarded-Encrypted: i=1; AJvYcCXdWkHA9jit0cbQZTgZUbxyicivFnX8UmwHIzVhqgOzd4R7dmeBo56ewIb53OYrtypICm9fwigatP/k8h0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+mZ0UMJxJVq95d6jg/2DqlKgk4DJfbGQWUwRZEJTzSq7pQ3T
	q3dKZcHqxxIiEInPe1uxZ2fnoeSd9+T/Rfa3G/3/l2F0KQB1YryAfeH/VoBkV1HDkfZCO2HnsiU
	jWFFA23IPI8nx/DVtJcONrFaEEcRz4kA6W7WPP3olAtyIb6ib6XyW990=
X-Google-Smtp-Source: AGHT+IGspIrZv6C+Lbf+tFwTXKQYE44l8MuohkH0H68fEeVMBrlmKRrEQpEU7BNp5fyidqWtolP7xt7Voo8KcPyR87fAs1xX58Y1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2283:b0:3d8:20f0:4026 with SMTP id
 e9e14a558f8ab-3da5b23c4bbmr110510875ab.1.1746540399979; Tue, 06 May 2025
 07:06:39 -0700 (PDT)
Date: Tue, 06 May 2025 07:06:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681a176f.050a0220.a19a9.000c.GAE@google.com>
Subject: [syzbot] [net?] INFO: task hung in inet6_rtm_newaddr (2)
From: syzbot <syzbot+101224300649c3eb8af4@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    01f95500a162 Merge tag 'uml-for-linux-6.15-rc6' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13c0b0f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=101224300649c3eb8af4
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1223bb68580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-01f95500.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/db1628150472/vmlinux-01f95500.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ecd327744f2e/bzImage-01f95500.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+101224300649c3eb8af4@syzkaller.appspotmail.com

INFO: task syz-executor:5435 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc5-syzkaller-00022-g01f95500a162 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:22056 pid:5435  tgid:5435  ppid:1      task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x16e2/0x4cd0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 __mutex_lock_common kernel/locking/mutex.c:678 [inline]
 __mutex_lock+0x724/0xe80 kernel/locking/mutex.c:746
 rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 inet6_rtm_newaddr+0x5b7/0xd20 net/ipv6/addrconf.c:5028
 rtnetlink_rcv_msg+0x7cc/0xb70 net/core/rtnetlink.c:6955
 netlink_rcv_skb+0x219/0x490 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x758/0x8d0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x219/0x270 net/socket.c:727
 __sys_sendto+0x3bd/0x520 net/socket.c:2180
 __do_sys_sendto net/socket.c:2187 [inline]
 __se_sys_sendto net/socket.c:2183 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2183
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff7979907fc
RSP: 002b:00007ffd90db52d0 EFLAGS: 00000293 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 00007ff7986e4620 RCX: 00007ff7979907fc
RDX: 0000000000000040 RSI: 00007ff7986e4670 RDI: 0000000000000003
RBP: 0000000000000000 R08: 00007ffd90db5324 R09: 000000000000000c
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000003
R13: 0000000000000000 R14: 00007ff7986e4670 R15: 0000000000000000
 </TASK>
INFO: task syz-executor:5442 blocked for more than 152 seconds.
      Not tainted 6.15.0-rc5-syzkaller-00022-g01f95500a162 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:21848 pid:5442  tgid:5442  ppid:1      task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x16e2/0x4cd0 kernel/sched/core.c:6767


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
