Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7AF2CA9
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751732551; cv=none; b=H3JRt8p9tAjrkT5A6aZWBh6CIWp+jGxeJpWw/XfyvAwzivfzIcfD2dlSMWPmTOiwxJSOIvsnYneDFzS+CF03x3knZeVC2IXu6w3KVi34GwWo5Rn9/CW8ORzk2QXpMZlAK6WXAohvT8n48o97NtuRbmTOyr/2u66Xy/lNda/V8oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751732551; c=relaxed/simple;
	bh=TBaeYJghPRtZM210AFyRotEdnlAPmhG1RYCRSzdrTSI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gEG79TolptRKw2ow0FkeU/6HojdNOQ42fK83X8I/G7nJZ/a0fhWBcRLUpkFxoSpZPAjc5TuzWOM5XjoA8B1NXmWua68fr2BosgLGX0Pt87/E/WZhB6Yus3pVA0v2Hm4/bjNQlrRzZJnLC4VC+QK6dMmX7nvPGJts9ga4jm2VNP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddbfe1fc8fso50745795ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751732549; x=1752337349;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TaSrsgy587/dWpvmV91Fh1n3eLDmBjtt6jIOaPibHns=;
        b=NoPQWYbcY9gN+PvUVphOk5C5G3Rt8Z1pprOwXHPgcpcsdy/mCR+LTBs7uktatun0WA
         ArHTjgHOvV/irhttSrjW+QFHqLcviCABObtoTl+oD6twS5aMdAJIuJu2ZiCenNrnOES3
         5/4tTM264YyZSn2g2DqtIwd7Ree8Hh26UuG3WBOVITT+zNekw0h1OiA0lV9n2ltTjYGV
         ZO2Sqc3fbcZq68OfknLhH/hqp2ujf563bx5EM1n2/f+LLr+dwinQF1VVn7lA2g2Oioy0
         tpfoik54SGByiC7JC0fhJQO8qsy1HBo1Y3jpOOYGgHSm+ToRteWEIkC/u1Q3DcPZgjSv
         TbWg==
X-Forwarded-Encrypted: i=1; AJvYcCX+/Y+9OOVzd8rh2z4SJuK2vqz5VgXexFTllx9v824eYRXKh0kMP0y9VEStxA3csi/KkW10yC0cl3+k3AA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhiYU2ONXncv4TeBYOcq3Derdvr2ZNqtJcgwD6ODuefSOtTlTD
	HBFT0rYh4cHb9/vwiNtbIEXuxRy+2BIC7KZsiLWifHUCDgSIitjg8F9kgBA8GUCDLY1/dMRmHFp
	ZqPwu6SyLtTCP6CXLStNpxDmVoQZTCmxit//pybcwuTtJ+PFC8KkLIE/vLJI=
X-Google-Smtp-Source: AGHT+IHXZDxlv6ve5JbC/c0nhJ2fWSDI648KJyOpBSRki8eFaqaOjhGIWDqSrsV2AitJyqIHlFNzznI8Ok0y/Bv1WefoLo/2wqAl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b47:b0:3df:3464:ab86 with SMTP id
 e9e14a558f8ab-3e13ee94da1mr24017735ab.9.1751732548747; Sat, 05 Jul 2025
 09:22:28 -0700 (PDT)
Date: Sat, 05 Jul 2025 09:22:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68695144.a00a0220.c7b3.0045.GAE@google.com>
Subject: [syzbot] [usb?] KMSAN: kernel-usb-infoleak-after-free in usb_start_wait_urb
From: syzbot <syzbot+27fe438b6370f95de4a5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    66701750d556 Merge tag 'io_uring-6.16-20250630' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=134693d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d5c61bcebaf295a
dashboard link: https://syzkaller.appspot.com/bug?extid=27fe438b6370f95de4a5
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e203ce735cca/disk-66701750.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e4f6e611c287/vmlinux-66701750.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1b9c4100ce6f/bzImage-66701750.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+27fe438b6370f95de4a5@syzkaller.appspotmail.com

usb 7-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 7-1: config 0 descriptor??
microsoft 0003:045E:07DA.003F: unknown main item tag 0x0
microsoft 0003:045E:07DA.003F: ignoring exceeding usage max
=====================================================
BUG: KMSAN: kernel-usb-infoleak-after-free in usb_submit_urb+0x5a1/0x2630 drivers/usb/core/urb.c:430
 usb_submit_urb+0x5a1/0x2630 drivers/usb/core/urb.c:430
 usb_start_wait_urb+0xc2/0x320 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x27c/0x5b0 drivers/usb/core/message.c:154
 usbhid_raw_request+0x4ab/0x690 drivers/hid/usbhid/hid-core.c:-1
 __hid_request+0x2bd/0x500 drivers/hid/hid-core.c:1989
 hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
 hidinput_connect+0x3bf5/0x5cc0 drivers/hid/hid-input.c:2327
 hid_connect+0x6b4/0x3440 drivers/hid/hid-core.c:2239
 hid_hw_start+0xfc/0x1e0 drivers/hid/hid-core.c:2354
 ms_probe+0x2e5/0x890 drivers/hid/hid-microsoft.c:391
 __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
 hid_device_probe+0x536/0xab0 drivers/hid/hid-core.c:2761
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d1/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e3/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
 hid_add_device+0x5ed/0x7b0 drivers/hid/hid-core.c:2907
 usbhid_probe+0x1fec/0x2660 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0xd01/0x1310 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d1/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e3/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
 usb_set_configuration+0x3493/0x3b70 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xfc/0x290 drivers/usb/core/generic.c:250
 usb_probe_device+0x38d/0x690 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d1/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e3/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
 usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5535 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
 port_event drivers/usb/core/hub.c:5835 [inline]
 hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5917
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb8e/0x1d80 kernel/workqueue.c:3321
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 slab_free_hook mm/slub.c:2307 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0x252/0xec0 mm/slub.c:4842
 kfree_const+0x42/0x50 mm/util.c:45
 kobject_cleanup lib/kobject.c:695 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x344/0x3b0 lib/kobject.c:737
 netdev_queue_update_kobjects+0x9b5/0xbf0 net/core/net-sysfs.c:2052
 remove_queue_kobjects net/core/net-sysfs.c:2149 [inline]
 netdev_unregister_kobject+0x176/0x530 net/core/net-sysfs.c:2304
 unregister_netdevice_many_notify+0x3cfb/0x4950 net/core/dev.c:12112
 unregister_netdevice_many+0x22/0x30 net/core/dev.c:12140
 ops_exit_rtnl_list net/core/net_namespace.c:188 [inline]
 ops_undo_list+0x5d8/0xb80 net/core/net_namespace.c:249
 cleanup_net+0xb8f/0x14b0 net/core/net_namespace.c:686
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb8e/0x1d80 kernel/workqueue.c:3321
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Bytes 36-38 of 65535 are uninitialized
Memory access of size 65535 starts at ffff88808e6d5791

CPU: 1 UID: 0 PID: 17692 Comm: kworker/1:4 Not tainted 6.16.0-rc4-syzkaller-00013-g66701750d556 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
