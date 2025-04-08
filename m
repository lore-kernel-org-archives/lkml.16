Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40682550DB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744148432; cv=none; b=bAfgLkc2GRX80DXvA/YEbxmYr8xTh84v1iT5tMITEIqVaOAIGDD9Vo4p1omB1K5ZpdOtkKhx4EWKJpQfkr/FQFw5W5k4gmLV8Kv7j+l2G13z5lErqZWpnVa7IFxMF3FqWYqDQvRIz4J42zD+vY+WtX5lUJtAdiBYHR/r0N2NMCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744148432; c=relaxed/simple;
	bh=0Fu2Jby4IZi3f5YFORTDkehXA9IedVEL6Ecbc+Pr6cw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MBkzbKucfAY5Ljv/ile6kvfGOyVfmZq2QB8gtnPBsM5AaSD6bpyroiuL1pKpssm0qyZ1I3hZw2hn0SiFzZQ85Qc4fKcnxyZJMZZOW3xwoXPtDm43RHN+TSvLsYp7hmx2viNEf6/YDisRX1OQZ+32gJGXDNxTaBY7tjjRlRHV1o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d43541a706so60961785ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 14:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744148430; x=1744753230;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aG6mXlXpyxc14RmTlGpoycr6Zv8mM/crazzDdicDGG8=;
        b=QzrEIhRZz5lzgS/4pM6LOXo+Svq0R7olm0r7Zrf8cSJeba/OHnB6bjQ9Kx8iOyOVAm
         wFeFWakb4fHvkSlENn0vsHofZbY8ch3Tt0JQY/I4p3JCa4eetXYjVKp9+Y+J3iwt5HN0
         dCObjsmYS7Uy72ePsCNKJRqp72UD21v2hkO/AA3LLxwXqzciz1Y3dGe1jrijawxwzHmJ
         KdGQMNpI9jTX5JPa8wkt3LtcMNNIt1/7CQeJHHrrCjdBa6ai1cxo+lOD21Dr/qXNpIq3
         7koJLx2qjEaOAhvXoMDt+4dU3X4FjwbtDqNBcpMjTY5xB8BUlHLJOvyaetgkwQfONhAJ
         MlYA==
X-Forwarded-Encrypted: i=1; AJvYcCUkmR7ueJs6kIp/8UUKvwhWfZeGKkub7mov4hfjypo6ttPSL884DxnxfvAvTi4h6Q+mKtcNOZ7M6Ng+xWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkC82dgKsCKV6xxi1GbwUKonbbv6AR+3XY5K0LBRfYt/UADHT
	vxcKehfVyDX6QgO3rrz+xvCpzYpzVuAnepCJHN2xSLcmjBweoP6ZFM0pR155rHawNgq/cvSybDt
	K5jAwqDYzGS7s5uNiqijZXIed7aNJilwycdr+G6l2Bg9QO/cKN5MrE/E=
X-Google-Smtp-Source: AGHT+IHD9LAcPC3LEF/tGMUuGkQYrgbQILB4qAgmVrRZN7HmVaXNsax6qpqhnf6CeymqTo+nAmXUAO7KnDQgGyQlsclAw4nligEg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b07:b0:3d5:8922:77a0 with SMTP id
 e9e14a558f8ab-3d77c2a8cd3mr7095015ab.18.1744148429834; Tue, 08 Apr 2025
 14:40:29 -0700 (PDT)
Date: Tue, 08 Apr 2025 14:40:29 -0700
In-Reply-To: <67f4d325.050a0220.396535.0558.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f597cd.050a0220.258fea.0003.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING in __linkwatch_sync_dev
From: syzbot <syzbot+48c14f61594bdfadb086@syzkaller.appspotmail.com>
To: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jv@jvosburgh.net, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, sdf@fomichev.me, 
	stfomichev@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    7702d0130dc0 Add linux-next specific files for 20250408
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=138fa7e4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91edf513888f57d7
dashboard link: https://syzkaller.appspot.com/bug?extid=48c14f61594bdfadb086
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11520398580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b1323f980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0603dd3556b9/disk-7702d013.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d384baaee881/vmlinux-7702d013.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1ac172735b6c/bzImage-7702d013.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+48c14f61594bdfadb086@syzkaller.appspotmail.com

------------[ cut here ]------------
RTNL: assertion failed at ./include/net/netdev_lock.h (56)
WARNING: CPU: 1 PID: 12 at ./include/net/netdev_lock.h:56 netdev_ops_assert_locked include/net/netdev_lock.h:56 [inline]
WARNING: CPU: 1 PID: 12 at ./include/net/netdev_lock.h:56 __linkwatch_sync_dev+0x30d/0x360 net/core/link_watch.c:279
Modules linked in:
CPU: 1 UID: 0 PID: 12 Comm: kworker/u8:0 Not tainted 6.15.0-rc1-next-20250408-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: bond0 bond_mii_monitor
RIP: 0010:netdev_ops_assert_locked include/net/netdev_lock.h:56 [inline]
RIP: 0010:__linkwatch_sync_dev+0x30d/0x360 net/core/link_watch.c:279
Code: 7c fe ff ff e8 f4 63 cc f7 c6 05 83 28 53 06 01 90 48 c7 c7 60 5c 51 8d 48 c7 c6 8a 9b 67 8e ba 38 00 00 00 e8 04 6b 8b f7 90 <0f> 0b 90 90 e9 4d fe ff ff 89 d9 80 e1 07 38 c1 0f 8c 19 fd ff ff
RSP: 0018:ffffc90000117710 EFLAGS: 00010246
RAX: 6875daac7c816500 RBX: 0000000000000000 RCX: ffff88801c685a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff81824ed2 R09: fffffbfff1d7a700
R10: dffffc0000000000 R11: fffffbfff1d7a700 R12: 0000000000000000
R13: dffffc0000000000 R14: ffff888034096008 R15: ffff888034096000
FS:  0000000000000000(0000) GS:ffff888125089000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa9d1a29440 CR3: 0000000075fc0000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ethtool_op_get_link+0x15/0x60 net/ethtool/ioctl.c:63
 bond_check_dev_link+0x1fb/0x4b0 drivers/net/bonding/bond_main.c:864
 bond_miimon_inspect drivers/net/bonding/bond_main.c:2734 [inline]
 bond_mii_monitor+0x49d/0x3170 drivers/net/bonding/bond_main.c:2956
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
 worker_thread+0x870/0xd50 kernel/workqueue.c:3400
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
