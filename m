Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9221128A1FB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751061028; cv=none; b=VEgZvF9F3uYfGwoRJju+ORMBKpnaEJYOrih3z8JIWr6y0+zeV+c47DuvRfJTt0ItHXU+Ow7/rTDXB5gOOn2GOBosYDXItU+TirYNsZ803Zt54ZB9vqoUYIXnixkAE/QyMeDdVjjF2SsGkArUQ8iyXBJjoeAOy/nTjtPnrkbsyz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751061028; c=relaxed/simple;
	bh=HXY5Xzsekxsa1oMdUhv7gl89OqpHhsqcmSiOi8CC/Lk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=k7+QckZogJ6uhaI8/rVVu/09xC6pZTo08y/flOthK89DU1edHmOGJ3mm22pFiLgkluBe5OimaUCKTaSmLy0YAL1VNGQlgJ8uVvHH20gyzv44GCL0DFPEZ3DHJ4HckRnnjbJdRtdvKrw8EW/KCLqjVlHPsyy7eL6rOZ+cOlhiiTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3df40bd8fa3so47426155ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751061026; x=1751665826;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gGCcuJSaJeBWYm92i00rPfJzEbUQempGpJ3LX4Y4SHE=;
        b=mwT4dcSGvWnnJahmKpeiG6WM0655IbyTyGcV3gHRVSJLjHph8debV3JrWC+HayuSbY
         iM5gzXfBof21XUpIQTkAw6Ag9Uh+5Hn8hl/aPR2du/uIQodwzQvWfKvaN86svqOW3UHT
         rs7Zet2folBjNXx40mscmGVKrDlhWyM/4QCYer2jfLbU3LHiiCTMKw1i8tRjK58Q3LgU
         WDgHI42/2CL9hs0KqljlkKtGamnLIZYzUYMSldJn1ntwnd0YYXsumXn/FZwD3C2hdiEj
         LPpxxl7zRY/dx6UVCuZ/3+v86IoAx+MPJOgmzCB73y5MiSYjPsmmovPOdT3/lI62uDdW
         OqDw==
X-Forwarded-Encrypted: i=1; AJvYcCXAhtO47lq9AMe+/2UHB2+lGOJeDho2vT5a4+0bSQwkKJp8DJGbJu0ArTBKbPz0uwrofniuW+FNsVzwHvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHDEvQXV5OV+CYydv4gBpMTAyv71qmfUdWF1G5RmTaofz4p5Zp
	IFW0F2cvUoIkPGoAWWyRHEXfKnZOEGdSGT40sAj2eFuodPV0d0dUFKkaE5ZU6/1QVBA4tWxuFXQ
	LBLQWPDt5NYo4TtOniVFSkWJviQDwcL+EtGwk3SRsgJpBHs/t9QndAAnmwus=
X-Google-Smtp-Source: AGHT+IFio69s+ceqkFcikC1WaINJUU+gmoKCnYuXCKGVSSSYB4t7fGGBnzxddEOTVHLPNVhKduoy/ic0MhUXvIoaug6/n7umotO0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17c7:b0:3dd:f743:d182 with SMTP id
 e9e14a558f8ab-3df4ab450bbmr61718645ab.5.1751061025798; Fri, 27 Jun 2025
 14:50:25 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:50:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685f1221.a00a0220.274b5f.0002.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in flush_delayed_work
From: syzbot <syzbot+6f433bde86418d3f4fec@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2aeda9592360 Add linux-next specific files for 20250627
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1331908c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9e7e53eaffada5f7
dashboard link: https://syzkaller.appspot.com/bug?extid=6f433bde86418d3f4fec
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1484e08c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=141c43d4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/341223d6a48c/disk-2aeda959.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5668296f18f2/vmlinux-2aeda959.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c11200402e5c/bzImage-2aeda959.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6f433bde86418d3f4fec@syzkaller.appspotmail.com

hub 1-1:0.0: config failed, can't read hub descriptor (err -22)
------------[ cut here ]------------
WARNING: kernel/workqueue.c:4208 at __flush_work+0xabc/0xbc0 kernel/workqueue.c:4208, CPU#0: kworker/0:1/10
Modules linked in:
CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.16.0-rc3-next-20250627-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:__flush_work+0xabc/0xbc0 kernel/workqueue.c:4208
Code: 01 00 00 75 53 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d e9 46 3c ee 09 cc e8 40 40 35 00 90 0f 0b 90 eb a5 e8 35 40 35 00 90 <0f> 0b 90 31 c0 48 8b 5c 24 18 eb 95 e8 23 40 35 00 e9 92 fc ff ff
RSP: 0018:ffffc900000f6940 EFLAGS: 00010293
RAX: ffffffff818ae22b RBX: 1ffff11028a69254 RCX: ffff88801d291e00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888145349288
RBP: ffffc900000f6b10 R08: ffffffff8fc2ac37 R09: 1ffffffff1f85586
R10: dffffc0000000000 R11: fffffbfff1f85587 R12: 0000000000000000
R13: ffff8881453492a0 R14: dffffc0000000000 R15: ffff888145349288
FS:  0000000000000000(0000) GS:ffff8881259e6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f303b58af5e CR3: 00000000331c4000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 flush_work kernel/workqueue.c:4268 [inline]
 flush_delayed_work+0x13e/0x190 kernel/workqueue.c:4290
 hub_quiesce+0x1f0/0x330 drivers/usb/core/hub.c:1421
 hub_disconnect+0xc8/0x470 drivers/usb/core/hub.c:1821
 hub_probe+0x132f/0x36e0 drivers/usb/core/hub.c:2016
 usb_probe_interface+0x634/0xbf0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 usb_new_device+0xa39/0x16f0 drivers/usb/core/hub.c:2699
 hub_port_connect drivers/usb/core/hub.c:5571 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5711 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
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
