Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7012F1C5D78
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738331665; cv=none; b=j25rZ31jUDFpMEbYWgfUAq5FbVtlM3s80t8vUrqm01ZJ3FGTHIrO5WiDfmxmGBYfQ1ETa8T6amOhpRaKnT/BGObZKHDnxE8VWTw0BqeJeW3eiKcbvqUPYufj/z18y1oXITYa+r3H74JKEY7alrjk5Hh3c0irWy0FPlDPebwiHWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738331665; c=relaxed/simple;
	bh=LpM1ratmDrpG7tvebM7y8MHbPCtiP2RE8bl86whe/6o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=blYvYGVBgHt3yElfUAT1o4xgK+Ac5SmicokynBVMzTQuak+XE7UYecVhY+bkhUnHQmC3J3R6/2lxN7vmAf5u18Yq2h3us+V4b4OmeOCh7261jsdj7KiBJGJ/R6IF1AKrYECu2WHp1/EgdAO5OtgIzCjU4yQVf0STO7n6mx4b/hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3cf6ceaccdbso14804565ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 05:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738331662; x=1738936462;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNAmo4ihhSxy8pLUbp5UzEpnOMNglctNA6lT+shWmDM=;
        b=wCwvbx+IOqudPaEVouyOvGNUkZktUwwTGmj3v1fkiEBCvTwymgEBf1XsY8fi76hWKT
         0rORYXasVMXqQvN3YbGy4L93oEI135nyOpTw+aPOPOPoeW4jrZcqowGpARADbYPMuBD2
         o6ckF51AxBZkTtaaY8cXo6E/tJTsOKWe6P1iOAsszZjHh7RExvRhuMWtiNtz5enj49oz
         P3Z9CmzcbsQ+mhPceWGaIhM3HYyivRBV7E4lX55og3rPXM1ueUw1QpY2zHUhSVKUnrwP
         5XFlI0JFz41KvI752iD6lsenMNXjKahGqq6WZdqlfaFpWqY79RTSy02E7ulhy9QafOUx
         BoAA==
X-Gm-Message-State: AOJu0Yzl2BK6hn5J6O6HQclE5IbpJEtklpQ9lyN5mEwzR7NAQGvb7qnt
	ItBhMVnQ8T5ap4nsymkYIR3vs2kg2DWhCf44hn5FxpC2FlfT7FWXDrSR/qTq08of2/Ci1RjZ6zI
	xZYGzDTD3bojO+y1GlvDjbeOTU6tyzprtqOgtxX1xA/822Tft3myajp7R8A==
X-Google-Smtp-Source: AGHT+IED8ogy78oTUggSAqvhG9GyRfoJE0Y9exge1EETL/shmGrMmp90MM/453diegBzRUwKIFp2Ikf8NU1osuasyBaj8kXXGt2J
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e7:b0:3cf:bb11:a3a7 with SMTP id
 e9e14a558f8ab-3cffe406b35mr88083435ab.17.1738331662366; Fri, 31 Jan 2025
 05:54:22 -0800 (PST)
Date: Fri, 31 Jan 2025 05:54:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679cd60e.050a0220.d7c5a.0045.GAE@google.com>
Subject: [syzbot] [mtd?] WARNING in release_mtd_partition
From: syzbot <syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
	vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2a9f04bde07a Merge tag 'rtc-6.14' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11fe5ddf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=98d83cc1742b7377
dashboard link: https://syzkaller.appspot.com/bug?extid=074732af3fc6c528f8a0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14590b24580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15fe5ddf980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/89ef40be688f/disk-2a9f04bd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7471856a382f/vmlinux-2a9f04bd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d694ab107faf/bzImage-2a9f04bd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com

RDX: 0000000000000008 RSI: 0000000000001269 RDI: 0000000000000003
RBP: 0000000000000001 R08: 00007fff4fe6dbf7 R09: 0000000000000007
R10: 0000000000000001 R11: 0000000000000246 R12: 00007f0fdafc421c
R13: 00007f0fdafc4184 R14: 00007f0fdafc4077 R15: 00007f0fdafef570
 </TASK>
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5826 at drivers/mtd/mtdpart.c:37 release_mtd_partition+0x71/0x90 drivers/mtd/mtdpart.c:37
Modules linked in:
CPU: 0 UID: 0 PID: 5826 Comm: syz-executor397 Not tainted 6.13.0-syzkaller-09734-g2a9f04bde07a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:release_mtd_partition+0x71/0x90 drivers/mtd/mtdpart.c:37
Code: 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 1e 48 8b 7b 38 e8 ef 84 cd fb 48 89 df 5b 5d e9 e5 84 cd fb e8 70 4a 75 fb 90 <0f> 0b 90 eb c2 e8 a5 29 d8 fb eb db 48 89 ef e8 9b 29 d8 fb eb a5
RSP: 0018:ffffc90003e1f828 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88802c1d1000 RCX: ffffffff8b417995
RDX: ffff8880310c3c00 RSI: ffffffff86439150 RDI: ffff88802c1d1000
RBP: ffff88802c1d1648 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000004 R11: ffffffff81000130 R12: 0000000000000000
R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  000055558b9cd480(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000008 CR3: 0000000034aca000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 mtd_release+0xa0/0xd0 drivers/mtd/mtdcore.c:101
 device_release+0xa1/0x240 drivers/base/core.c:2567
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e4/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3773
 add_mtd_device+0xbb3/0x1700 drivers/mtd/mtdcore.c:750
 mtd_add_partition+0x300/0x650 drivers/mtd/mtdpart.c:279
 mtdchar_blkpg_ioctl+0x20d/0x250 drivers/mtd/mtdchar.c:562
 mtdchar_ioctl+0xbbe/0x2050 drivers/mtd/mtdchar.c:1216
 mtdchar_unlocked_ioctl+0xb0/0xf0 drivers/mtd/mtdchar.c:1239
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0fdaf83199
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff4fe6de58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fff4fe6de70 RCX: 00007f0fdaf83199
RDX: 0000000000000008 RSI: 0000000000001269 RDI: 0000000000000003
RBP: 0000000000000001 R08: 00007fff4fe6dbf7 R09: 0000000000000007
R10: 0000000000000001 R11: 0000000000000246 R12: 00007f0fdafc421c
R13: 00007f0fdafc4184 R14: 00007f0fdafc4077 R15: 00007f0fdafef570
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
