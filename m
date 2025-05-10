Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3738D223DE2
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746874828; cv=none; b=Nlcsh9DR3fFtCMcBomL8XkgQzKGtsyt3VTjaZzs9W7SD1CmnQRMdSPZ8i8ni+TogWhtSXH/8wvdMRXm9myclxVjtkNSYMaNHRUpa6fXkGtoccPwr2Z0uVuOTE1W0opmPFICGRUAA7CuCSQMOzIkCYFHUD1qsGBPqrlJufYQFRbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746874828; c=relaxed/simple;
	bh=pXsl0jxifGZtwSvbaZNBoTIPsoR2HbMX7cQ25fwdh58=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tyQ0PprhGrbKXiQ5unWPufOdV3RjzBhm8OhcC3sm9lOFImTSCzeXWfpFUNDTzjbHnzPxfR+s86KtzwMzxDPzARnihEFb3ynVsB3V+JPI1KD2RDUFHKTyLUoV9Rww7y3JDAm2pWXqiZbM+pPlXGrMr0bdagQBbsj1KsdB4s5vMVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3da76423b9cso36827275ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 04:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746874825; x=1747479625;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aq+tEvR2BX2GebmvQp4oKnTx8XxElrOxtRuDyDfClMg=;
        b=oKM/ZeaGRejpNcGzlPaIYL1PvhAXhepBBLaVsaBCeLKttmflZPSR0RSfsjrYfI81zY
         lRKloqkKv3pN431tGLUX2vJrSfMdcEUcikh6OsAY7qh5hvN+RIqvs3hLBtJ2k4TBvVk4
         CyzmVLteWoKz5ap6X1aMl63aKnEXpt+ilQnN1XcXP2ja0odpmsgDfAbynd259TU6UTtu
         V52rnL9/iEq6QLmHfu7722jpOwmmaJUgrfLwMt1vPNUtV3WNy3mE6LWowoJVHakB8IIg
         2VM7si5S7iKTcDC2e0TFeXGsVrdTE04kbRhKqbbT8jtlJPormCbKdxsEaEw+XVZdwXMi
         /gEw==
X-Forwarded-Encrypted: i=1; AJvYcCWYKV0VCQ8lLB+ZKy/Xzuzg8uf2BNB5Rt32rJ7zKsRJiAoesGihsOWe56oUvTiXYyC0lc+Bat+v2CFGP6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv5ntx3C/3kyGZBVAJFRLvYuXZGbeAwK5Cs/Q/7dA+ZnX3SCUa
	otZbZZkbBeGjwknxBo9X+WQHME4yBFssH4naqzjZFlbdxoYZBFwXFqeLg7OFY0nKRXTu0BgMvoz
	c5ZHAkP79cvBwX57flx966UzTUW7X+3U3Lf7aLPb5HEiK71jeOxWEQEc=
X-Google-Smtp-Source: AGHT+IHeCXvwxGNn4cP9NeGk6LJV0a63u/0yHIUmGn1aoxB5Z4QtlTYTGnIVgQln3lh39ezlXGtJRwNWZh0b8EvkIIC+rVWpeCGE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1689:b0:3d0:4b3d:75ba with SMTP id
 e9e14a558f8ab-3da7e1e1b24mr78918425ab.4.1746874825238; Sat, 10 May 2025
 04:00:25 -0700 (PDT)
Date: Sat, 10 May 2025 04:00:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681f31c9.050a0220.f2294.0007.GAE@google.com>
Subject: [syzbot] [usb?] KMSAN: uninit-value in usbnet_probe (3)
From: syzbot <syzbot+3b6b9ff7b80430020c7b@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, oneukum@suse.com, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    02ddfb981de8 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=128254d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=3b6b9ff7b80430020c7b
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=168254d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16811768580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5ca57f5a3f77/disk-02ddfb98.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3f23cbc11e68/vmlinux-02ddfb98.xz
kernel image: https://storage.googleapis.com/syzbot-assets/73e63afac354/bzImage-02ddfb98.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3b6b9ff7b80430020c7b@syzkaller.appspotmail.com

aqc111 1-1:1.105 (unnamed net_device) (uninitialized): Failed to read(0x1) reg index 0x0001: -71
aqc111 1-1:1.105 (unnamed net_device) (uninitialized): Failed to read(0x1) reg index 0x0001: -71
aqc111 1-1:1.105 (unnamed net_device) (uninitialized): Failed to read(0x1) reg index 0x0001: -71
=====================================================
BUG: KMSAN: uninit-value in is_valid_ether_addr include/linux/etherdevice.h:208 [inline]
BUG: KMSAN: uninit-value in usbnet_probe+0x2e57/0x4390 drivers/net/usb/usbnet.c:1830
 is_valid_ether_addr include/linux/etherdevice.h:208 [inline]
 usbnet_probe+0x2e57/0x4390 drivers/net/usb/usbnet.c:1830
 usb_probe_interface+0xd01/0x1310 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d1/0xd90 drivers/base/dd.c:658
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:800
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:830
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:958
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1030
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1079
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3666
 usb_set_configuration+0x3493/0x3b70 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xfc/0x290 drivers/usb/core/generic.c:250
 usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d1/0xd90 drivers/base/dd.c:658
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:800
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:830
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:958
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1030
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1079
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3666
 usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb97/0x1d90 kernel/workqueue.c:3319
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3400
 kthread+0xd59/0xf00 kernel/kthread.c:464
 ret_from_fork+0x6e/0x90 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was stored to memory at:
 dev_addr_mod+0xb0/0x550 net/core/dev_addr_lists.c:582
 __dev_addr_set include/linux/netdevice.h:4874 [inline]
 eth_hw_addr_set include/linux/etherdevice.h:325 [inline]
 aqc111_bind+0x35f/0x1150 drivers/net/usb/aqc111.c:717
 usbnet_probe+0xbe6/0x4390 drivers/net/usb/usbnet.c:1772
 usb_probe_interface+0xd01/0x1310 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d1/0xd90 drivers/base/dd.c:658
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:800
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:830
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:958
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1030
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1079
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3666
 usb_set_configuration+0x3493/0x3b70 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xfc/0x290 drivers/usb/core/generic.c:250
 usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d1/0xd90 drivers/base/dd.c:658
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:800
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:830
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:958
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1030
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1079
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3666
 usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb97/0x1d90 kernel/workqueue.c:3319
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3400
 kthread+0xd59/0xf00 kernel/kthread.c:464
 ret_from_fork+0x6e/0x90 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was stored to memory at:
 ether_addr_copy include/linux/etherdevice.h:305 [inline]
 aqc111_read_perm_mac drivers/net/usb/aqc111.c:663 [inline]
 aqc111_bind+0x794/0x1150 drivers/net/usb/aqc111.c:713
 usbnet_probe+0xbe6/0x4390 drivers/net/usb/usbnet.c:1772
 usb_probe_interface+0xd01/0x1310 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d1/0xd90 drivers/base/dd.c:658
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:800
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:830
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:958
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1030
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1079
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3666
 usb_set_configuration+0x3493/0x3b70 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xfc/0x290 drivers/usb/core/generic.c:250
 usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d1/0xd90 drivers/base/dd.c:658
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:800
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:830
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:958
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1030
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1079
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3666
 usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb97/0x1d90 kernel/workqueue.c:3319
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3400
 kthread+0xd59/0xf00 kernel/kthread.c:464
 ret_from_fork+0x6e/0x90 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Local variable buf.i created at:
 aqc111_read_perm_mac drivers/net/usb/aqc111.c:656 [inline]
 aqc111_bind+0x221/0x1150 drivers/net/usb/aqc111.c:713
 usbnet_probe+0xbe6/0x4390 drivers/net/usb/usbnet.c:1772

CPU: 0 UID: 0 PID: 1877 Comm: kworker/0:2 Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
Workqueue: usb_hub_wq hub_event
=====================================================


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
