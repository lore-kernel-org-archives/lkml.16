Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DE126CE3E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791032; cv=none; b=uNW/8ndAOQ7+aol7hqg9+KUnSSsYMRpx/sVghYxPmI3nFCy9ZZUamp8ydvRZO/dDEohKFJgC86OEx52B+KeO09D9SDtBUxgHs9JXPM3ZJsGyGhDDltQmm5kl5ih/8yV8ij/mZGZF1OwUjvY96xuHTCcl9Y7xRV+nKZk9ZP/zLyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791032; c=relaxed/simple;
	bh=tqwaUBtB0jyHmWG30omRkPhKTXGL7saCu1SG85WrChg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=eXFj6n25kJaFuUiOgR5JnLLxS8u/NaXycp5J3JdXb5qMwTfXP21NgcixIEPxFRNyvqv0fbYWKMcuzVonwIA7nAKZ+ouDBVSKw5IvEYrJSh8uag8ZmitKKnqP07SVUNmZpUtLxXzBG5RDOItcUuzCXqLcbPbMunDbljBvwjrmidw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so173264425ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791030; x=1751395830;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7vDWBkd0x56C4G0sk8N5EHfEmRoJyCT1whFbxUS2+8=;
        b=X0dqzSf5IzwswxxZtAvrStl1pvdh1tdDQnFKvHDJKNQJxJFcHq13eB8pAkdUVlIldF
         SR8vqfwvwfrYowGgeuEABhdfqrGVjrapooKPFYI/svgBEezH6m1srgMlijW9J733g2Z9
         Lb8yjLerTCcOMpL52NEouwj7zPcvcWFFOZQ1Uzwnkz00XgG6sOSxrnwXsOsgjOxc0JUJ
         Tq2hOaY/F9wwJSU/Q3qZmxCM9kmMIpNfmngK2XQ9iXUDzsUwpL0/Vd8vm1VoqI58Vxt7
         YFMlULJd8cZk3F2sZ4BEivaF8ZSgPIwkVCn/0nkAi4RIAlrKnC8XFrBclJFbr5xpcycm
         V26Q==
X-Gm-Message-State: AOJu0YzLzcI2P3cBqtcd4PqMnuzA1jNuxTM7VIeXx077zqbbue4xWqW9
	vvGfPz3W/wNxGFLQvY9TdAbABUcZtUQ2ZHROJt8Wj+mU7hnFXeeaflBYM6iRHnArYomknoYxaeW
	Ml0SJTY4QMSzX3CAKvTILcGd8un8ud4cnituwVWL+PceMD3Yu/VeFnLuheh4FKw==
X-Google-Smtp-Source: AGHT+IFYdE5E+qZrFFPemYWnCWH684rIkoE5cvjUcNtj+3eHhdA1rpGNtgHnv4gRXKE0lZ+Bwp3/nujmJU5LYgfDCnappdm2rzjR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2688:b0:3df:32c4:30da with SMTP id
 e9e14a558f8ab-3df32c43326mr695055ab.12.1750791029966; Tue, 24 Jun 2025
 11:50:29 -0700 (PDT)
Date: Tue, 24 Jun 2025 11:50:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685af375.a00a0220.34b642.0082.GAE@google.com>
Subject: [syzbot] [mtd?] WARNING in release_mtd_partition (2)
From: syzbot <syzbot+e9c76b56dc05023b8117@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
	vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    739a6c93cc75 Merge tag 'nfsd-6.16-1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14ab0b0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6f01a06a8393850
dashboard link: https://syzkaller.appspot.com/bug?extid=e9c76b56dc05023b8117
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=115d9b0c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=155d9b0c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2af98a1750d0/disk-739a6c93.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/da52c6f34aea/vmlinux-739a6c93.xz
kernel image: https://storage.googleapis.com/syzbot-assets/33104a41d02f/bzImage-739a6c93.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e9c76b56dc05023b8117@syzkaller.appspotmail.com

RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007f551d418959
RDX: 0000000000000000 RSI: 0000000000001269 RDI: 0000000000000003
RBP: 00007ffd42a61210 R08: 00007ffd42a60f67 R09: 00007f551d495520
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f551d46bff1
R13: 00007f551d4685c6 R14: 00007f551d46f13c R15: 00007f551d46852e
 </TASK>
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5828 at drivers/mtd/mtdpart.c:37 release_mtd_partition+0x71/0x90 drivers/mtd/mtdpart.c:37
Modules linked in:
CPU: 0 UID: 0 PID: 5828 Comm: syz-executor312 Not tainted 6.16.0-rc2-syzkaller-00318-g739a6c93cc75 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:release_mtd_partition+0x71/0x90 drivers/mtd/mtdpart.c:37
Code: 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 1e 48 8b 7b 38 e8 0f a4 ac fb 48 89 df 5b 5d e9 05 a4 ac fb e8 f0 ca 51 fb 90 <0f> 0b 90 eb c2 e8 55 aa b7 fb eb db 48 89 ef e8 4b aa b7 fb eb a5
RSP: 0018:ffffc9000403f840 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88802aaaf000 RCX: ffffffff8b776890
RDX: ffff888028990000 RSI: ffffffff8669bdc0 RDI: ffff88802aaaf000
RBP: ffff88802aaaf648 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000004 R11: 0000000000000001 R12: 0000000000000000
R13: dffffc0000000000 R14: ffff888022aa6be0 R15: 0000000000000000
FS:  0000555557c483c0(0000) GS:ffff888124761000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055f5b58bb000 CR3: 0000000073c58000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 mtd_release+0xa0/0xd0 drivers/mtd/mtdcore.c:101
 device_release+0xa1/0x240 drivers/base/core.c:2568
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e7/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3800
 add_mtd_device+0xbc7/0x1720 drivers/mtd/mtdcore.c:752
 mtd_add_partition+0x30c/0x670 drivers/mtd/mtdpart.c:279
 mtdchar_blkpg_ioctl+0x20b/0x250 drivers/mtd/mtdchar.c:562
 mtdchar_ioctl+0xbc4/0x2090 drivers/mtd/mtdchar.c:1216
 mtdchar_unlocked_ioctl+0xb0/0xf0 drivers/mtd/mtdchar.c:1239
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f551d418959
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd42a611c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007f551d418959
RDX: 0000000000000000 RSI: 0000000000001269 RDI: 0000000000000003
RBP: 00007ffd42a61210 R08: 00007ffd42a60f67 R09: 00007f551d495520
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f551d46bff1
R13: 00007f551d4685c6 R14: 00007f551d46f13c R15: 00007f551d46852e
 </TASK>


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
