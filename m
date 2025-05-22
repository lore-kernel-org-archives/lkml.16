Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C63234
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944151; cv=none; b=TJYWG5AiSh3vS+ZD3nXvEVCh4JJADkdcHEwiPIQiqJGGklcfO92AW5tPcBs7yMxrqJw9UFsdpnASXsR1/8bEBGWIbYQ97mvmefQibMkv+SqoaHgre4xcaruXPW5LhTVahy3YhM7DCcC5bzexI3aR2MgupF8YvLuJ8EY0dJ1xupU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944151; c=relaxed/simple;
	bh=ZbLz0aigG2CqWlzRsBAceLbkWdDfukRzYBfZELcVX4E=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=EqtL9vc5dUVLZEUJoSyLIzTIV3tMuex+MJcV5qlXcaUAjHvb/r7baZhMsR9+6M1jH+RHVAd3E/RnDe8Dvw5C/iUZp3F2PbGVY1c1mXJtwOFbSqjyJSVjzJtlWivod5RFEvTyKmJEQatjuLHjHKxZlvZd1C8D/S8dRgGJ+qHV5Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-86195b64df7so1273321639f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944149; x=1748548949;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sANU+i1yHQJ8eLkUe/wuKN/p4nzPeX9SqeYtXD4DOf8=;
        b=Eftz5EUX0BZ0f3Ods4Rvr5oIJfozkLPwWmi/9+5i8yXxWjwtG0aP0yvRRlcDinDtDS
         rZU2vY1A1IdBJ3QR1+NzziKLMxOW7+3+bWQwGrC6s3h73AFIpu9ZtwGyapP2fYZ/qIY9
         ldT5bnioZzN7tskRlbYWw77zUvX0mOR38RfLTdN0VxjPtqlHp1dkm9qX3+RktSSifc0E
         c4xQiolpOAEJc3EbwkUrhodfNsPY3JNhfFzuQ/VovNAd58dsnWqjhE4SQJGy8cWOJtRA
         WYEMv2o6OlEwTDUJHtNaQ/d7X/12ZrOJa0XeDz5A+iu6tqjR70CLzMZpZcnmJLuerMpM
         oHrA==
X-Forwarded-Encrypted: i=1; AJvYcCX2x1KBmdX2Jt0gxEr5qNeLUCqrYlkny1LMiuDWZbHdleDNFgZL5aBC+CCAj7A53ZHIOx7eZi7AGqtbrps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZslKJAO1mVOevdyh91B+vtlL0sZNAJV2vyXyW9/LyEd4yKYhj
	JzJWFvazjsGTqp1H5n47hCj5Y1WUD8ZOuLuJJJxOPC3IjV4ZAZCokP5SCrDLS5202FQtdkIIYGD
	qhPvO5x6J62llo0PtEaUB3mVcjy4TM1zpw317LJ/gc1INNyQCp1IciD33VAM=
X-Google-Smtp-Source: AGHT+IH33bLlzy1+UNZG5udf0fx8+zOBiW1lSbuHHfa2hoADVo9cTA3wpIX3nm4W1KOjIxcEJ+nLic7IHwG1aaTZYcd1sMlUyMna
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4189:b0:864:4ab4:adf1 with SMTP id
 ca18e2360f4ac-86caf12c204mr46314739f.13.1747944149212; Thu, 22 May 2025
 13:02:29 -0700 (PDT)
Date: Thu, 22 May 2025 13:02:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f82d5.a70a0220.1765ec.0143.GAE@google.com>
Subject: [syzbot] [net?] BUG: unable to handle kernel NULL pointer dereference
 in vcc_sendmsg
From: syzbot <syzbot+e34e5e6b5eddb0014def@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5723cc3450bc Merge tag 'dmaengine-fix-6.15' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13b6df68580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c3f0e807ec5d1268
dashboard link: https://syzkaller.appspot.com/bug?extid=e34e5e6b5eddb0014def
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-5723cc34.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f3e578ec2139/vmlinux-5723cc34.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8576c2d15d72/bzImage-5723cc34.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e34e5e6b5eddb0014def@syzkaller.appspotmail.com

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 0 P4D 0 
Oops: Oops: 0010 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5324 Comm: syz.0.0 Not tainted 6.15.0-rc6-syzkaller-00346-g5723cc3450bc #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc9000d3cf778 EFLAGS: 00010246
RAX: 1ffffffff1910dd1 RBX: 00000000000000c0 RCX: dffffc0000000000
RDX: ffffc9000dc82000 RSI: ffff88803e4c4640 RDI: ffff888052cd0000
RBP: ffffc9000d3cf8d0 R08: ffff888052c9143f R09: 1ffff1100a592287
R10: dffffc0000000000 R11: 0000000000000000 R12: 1ffff92001a79f00
R13: ffff888052cd0000 R14: ffff88803e4c4640 R15: ffffffff8c886e88
FS:  00007fbc762566c0(0000) GS:ffff88808d6c2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000041f1b000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vcc_sendmsg+0xa10/0xc50 net/atm/common.c:644
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x219/0x270 net/socket.c:727
 ____sys_sendmsg+0x52d/0x830 net/socket.c:2566
 ___sys_sendmsg+0x21f/0x2a0 net/socket.c:2620
 __sys_sendmmsg+0x227/0x430 net/socket.c:2709
 __do_sys_sendmmsg net/socket.c:2736 [inline]
 __se_sys_sendmmsg net/socket.c:2733 [inline]
 __x64_sys_sendmmsg+0xa0/0xc0 net/socket.c:2733
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbc7538e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbc76256038 EFLAGS: 00000246 ORIG_RAX: 0000000000000133
RAX: ffffffffffffffda RBX: 00007fbc755b5fa0 RCX: 00007fbc7538e969
RDX: 0000000000000001 RSI: 0000200000001f40 RDI: 0000000000000004
RBP: 00007fbc75410ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000004008801 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fbc755b5fa0 R15: 00007fffd7d24cf8
 </TASK>
Modules linked in:
CR2: 0000000000000000
---[ end trace 0000000000000000 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc9000d3cf778 EFLAGS: 00010246
RAX: 1ffffffff1910dd1 RBX: 00000000000000c0 RCX: dffffc0000000000
RDX: ffffc9000dc82000 RSI: ffff88803e4c4640 RDI: ffff888052cd0000
RBP: ffffc9000d3cf8d0 R08: ffff888052c9143f R09: 1ffff1100a592287
R10: dffffc0000000000 R11: 0000000000000000 R12: 1ffff92001a79f00
R13: ffff888052cd0000 R14: ffff88803e4c4640 R15: ffffffff8c886e88
FS:  00007fbc762566c0(0000) GS:ffff88808d6c2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000041f1b000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
