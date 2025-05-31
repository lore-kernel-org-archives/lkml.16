Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C02E23A9AE
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748704172; cv=none; b=LnSDXuIjOebxsTuIhqJSjeSikOl4Q3pdUhx2R9YVZfljMPppj14sOT9YeZO2wJDSCOsajuki7Rt0ax0BoX+LgvIud4GlCUsJZCMY97FUkIfBVPxDb0rtGIV+SeFKkZq3fJki6NfYSam5sjd7/a7BO9UemQZEytWuobjACweTidA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748704172; c=relaxed/simple;
	bh=93CTDjAEeete/R0+aItsc4Xp81vKNUARVLfomt68FpE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sxneRMX/PXyldTJC230t6vgNr52ocZTKZoL3HvpdMht+cpDAuaCtLvHrefyznLYQdFtbtZKHGPQU+LwVCMCOarpEwGAJufwiD8k4Mlq67mc4eIgOFjLb31Ef8ovw5i+TurrslA/jxtBLkZj4NzyYg2YC8O9+XuBvjofHQrrZ1/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3da644c8ffeso37636035ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 08:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748704169; x=1749308969;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WE8P8A1gyjt3ODkAsUD5vrdPdzj1YbuWYd41n4eMzfE=;
        b=d+i50H35j9vS+SC4FqeMqVqg3nFP8h+UnUypWNaNf1TwNOv+qlvR7RJBwIjGaILi3U
         zWqBPUHeUVCGbCcAIdiO0NDHgjAOBSeTEDEAxDT7Vaqqw8jIIOQ/Kb+Xgdz657mpkCN1
         reuqkmZIg3Oa2jZWXtJ7AJo1nklNB1BRw2gcWwWEgt1LE9sz9A9IFqMaqajRictQLPNQ
         kWYY8iCmEBEgjhirPg7/FqI0omP78jXTUdi/GUWnTcIaGoxbP5vcyJMZK2GrEs0DpNRB
         gnzMTEKRejGcnd9ByLcai9pxVtersRX4WtD8Ogyz+z/3lR58qAHtaXoaCSJ1+HGnOb4l
         UhBA==
X-Forwarded-Encrypted: i=1; AJvYcCXZVryPdkXDdJKkseWTvod5ApWxy4Nxg140w6Bw798b1wVTxqWlvdajM+yXfEKNgEjaBSRvaLzTycUgXys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/5TbPrMA02UpQyVf+Pp7E62qH5zWbrKZz778+f+DNvwchBSHS
	c56jkYsJ4r8OczB/b2ZMnH+Flm+DrgnqxjMvqpRD88E2pw4uU04nk1XYiq99JWlS5vFDPuSP31v
	AWd2vkyVh/Xt/Aw4GlYyH0sTOaXS/pEDXpprU3WWGg+mmL6MXVSp0VAgbNto=
X-Google-Smtp-Source: AGHT+IEd4aWdUvLJ1nbpNE26CWMzem3tFRHP4TBrQsPrEiC3oXuUjUoGfMZUsrttt+HTz5aHYPZyIAlRB+xgYKhDWGpU697gfhT0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fef:b0:3dd:792d:ce42 with SMTP id
 e9e14a558f8ab-3dd9c738eb3mr60576285ab.0.1748704169599; Sat, 31 May 2025
 08:09:29 -0700 (PDT)
Date: Sat, 31 May 2025 08:09:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683b1ba9.a00a0220.d8eae.0019.GAE@google.com>
Subject: [syzbot] [bcachefs?] WARNING in lookup_object_or_alloc
From: syzbot <syzbot+88e6a26b68fb670364e1@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    015a99fa7665 Merge tag 'nolibc-20250526-for-6.16-1' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16fcedf4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=231a962e5fdb804b
dashboard link: https://syzkaller.appspot.com/bug?extid=88e6a26b68fb670364e1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f68bd0ec2940/disk-015a99fa.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8c78735943b8/vmlinux-015a99fa.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7d9332085f01/bzImage-015a99fa.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+88e6a26b68fb670364e1@syzkaller.appspotmail.com

ODEBUG: object ffffc9000d537a98 is on stack ffffc9000d530000, but NOT annotated.
------------[ cut here ]------------
WARNING: CPU: 1 PID: 16496 at lib/debugobjects.c:655 debug_object_is_on_stack lib/debugobjects.c:655 [inline]
WARNING: CPU: 1 PID: 16496 at lib/debugobjects.c:655 lookup_object_or_alloc.part.0+0x2b1/0x590 lib/debugobjects.c:688
Modules linked in:
CPU: 1 UID: 0 PID: 16496 Comm: bch-copygc/loop Not tainted 6.15.0-syzkaller-02443-g015a99fa7665 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:debug_object_is_on_stack lib/debugobjects.c:655 [inline]
RIP: 0010:lookup_object_or_alloc.part.0+0x2b1/0x590 lib/debugobjects.c:688
Code: 0e 48 8d 7d 20 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 58 02 00 00 48 8b 55 20 4c 89 e6 48 c7 c7 c0 07 f5 8b e8 60 ff bf fc 90 <0f> 0b 90 48 83 c4 18 48 89 d8 5b 5d 41 5c 41 5d 41 5e 41 5f e9 b1
RSP: 0018:ffffc9000d5377b0 EFLAGS: 00010086
RAX: 0000000000000050 RBX: ffff8880347347a8 RCX: ffffffff819a71b9
RDX: 0000000000000000 RSI: ffffffff819af046 RDI: 0000000000000005
RBP: ffff88801f7e3c00 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000001 R11: 0000000000002be0 R12: ffffc9000d537a98
R13: ffff88801f7e3c00 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888124aaa000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fdb0980f000 CR3: 0000000030dfd000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 lookup_object_or_alloc lib/debugobjects.c:665 [inline]
 __debug_object_init+0x2a9/0x3d0 lib/debugobjects.c:743
 __init_work+0x4c/0x60 kernel/workqueue.c:677
 rhashtable_init_noprof+0x49f/0x7e0 lib/rhashtable.c:1085
 bch2_copygc_thread+0xf6/0xdd0 fs/bcachefs/movinggc.c:355
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d7/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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
