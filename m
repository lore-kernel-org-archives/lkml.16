Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE0A239E78
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750307490; cv=none; b=s/wv8fQKsa6b3hda5ISmvumapIdKkujAUkSvhwxkg285miTzBvjd4hY1fgKebSGCR/H5Y4uoTPNjiCmHXhjYZlGAEkSgcHcwW4cSjzjQ8URiYzNtURaN2rzOIFPIfOkdwiebZQ1ILL7bVeocbQuGjJf9Cwf6JdqZAVA7w7Fhwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750307490; c=relaxed/simple;
	bh=iPpX4j1+Jz5DTAshw6VH3W2oXOkWFkKJOqBF1ApgRkg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=k9T0at5jwv4r8J9y1pim7lMd0QPFGGPC821Q60Zl90NAISgK5Gb0X3BZQqh6ny84dU4hl7i5SOuRhpj3TmR7PG0mglVcEztCXX3cFnPJrC85gGOxDQL715xzCp8VChX02hIVCkUCs/wLCGVQTSEEsqDt9d9WOqfecQQGOREgfDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-86d0aa2dc99so29728639f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750307488; x=1750912288;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPq6FhPN1iGDsD0JC69QL6MoXv2OGqXAWE5gQfQGreE=;
        b=lP9eqpQWg8F70DLQYF6LQFPD106VJh1VstMfJ1siwtqh51sHYAt8EqnTr7fw7SVFor
         0L5RgCosUoulZCAQmTT33VVVdz1tPmjEOx+Cb2VKt3uUP2LrFbTgkWF0Q4dNmoe3O3H/
         3GqLd32LYTjZ4QQn1al9PnTgQc1DuFrjWjDCzXtBJiWQmIJRefNFPmu5pGEx0aYzw+r+
         LCaQij1cVueeNB/y7JuWKq7SRACCwDfq4ASltNcvGE6CAASnJ+1FjVStYwzuNBNXHJvh
         JCnDvwVpCGXRVzVQBAh3iDlkRsSxCZCl86K+pHMvEfB35i4Fwf6zYotAtx5/MCqDyupR
         oYOw==
X-Forwarded-Encrypted: i=1; AJvYcCX/dJfnlShogiV3B2ltwin7GlVNdTn4w1xofHIOfMiBOrEXtmCG5nP8WWczgB4pPEm1176XH+7865Yd8Gs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/wupQVMVrSuQt+hMV+/BrI189W6ITez4fKeVifJbgyRqUOY7l
	XSnNGWmj2vdYSDvDIH+fs1DASPsVoYVxXxbpUwOBjjGaBoq6MkhahP562xUFM2YpuSWLjAuy6SW
	3cq8cqgrNXCjCS7qHP6J70CiW8lVaflgrm/sv4h6OdfF5N3T9p/6cddDNhQ0=
X-Google-Smtp-Source: AGHT+IGTSsSGgfUlqTy7OWQhN/YdLRQ6W8rhYxLT5BK+XCua0kV8MgnS09d42gPE9kiTfh4f2TDFzzSg97lx45d9ME4MJY0DYAuj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b2b:b0:3dc:90fc:282d with SMTP id
 e9e14a558f8ab-3de07d5f547mr218445445ab.16.1750307488179; Wed, 18 Jun 2025
 21:31:28 -0700 (PDT)
Date: Wed, 18 Jun 2025 21:31:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685392a0.050a0220.216029.0168.GAE@google.com>
Subject: [syzbot] [hwmon?] KMSAN: uninit-value in get_temp_cnct
From: syzbot <syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com>
To: jdelvare@suse.com, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@roeck-us.net, mail@mariuszachmann.de, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4774cfe3543a Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10e3f10c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61539536677af51c
dashboard link: https://syzkaller.appspot.com/bug?extid=3bbbade4e1a7ab45ca3b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0cb38ba04f99/disk-4774cfe3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ff376a7ba200/vmlinux-4774cfe3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/570051315dbf/bzImage-4774cfe3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com

usb 7-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 7-1: config 0 descriptor??
corsair-cpro 0003:1B1C:0C10.0017: hidraw0: USB HID v4.06 Device [HID 1b1c:0c10] on usb-dummy_hcd.6-1/input0
=====================================================
BUG: KMSAN: uninit-value in get_temp_cnct+0x1f3/0x3b0 drivers/hwmon/corsair-cpro.c:497
 get_temp_cnct+0x1f3/0x3b0 drivers/hwmon/corsair-cpro.c:497
 ccp_probe+0x458/0x790 drivers/hwmon/corsair-cpro.c:622
 __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
 hid_device_probe+0x539/0xab0 drivers/hid/hid-core.c:2761
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
 hid_add_device+0x5ed/0x7b0 drivers/hid/hid-core.c:2907
 usbhid_probe+0x1fec/0x2660 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0xd04/0x1310 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
 usb_set_configuration+0x3493/0x3b70 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xfc/0x290 drivers/usb/core/generic.c:250
 usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
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
 process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was stored to memory at:
 get_temp_cnct+0x1ec/0x3b0 drivers/hwmon/corsair-cpro.c:496
 ccp_probe+0x458/0x790 drivers/hwmon/corsair-cpro.c:622
 __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
 hid_device_probe+0x539/0xab0 drivers/hid/hid-core.c:2761
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
 hid_add_device+0x5ed/0x7b0 drivers/hid/hid-core.c:2907
 usbhid_probe+0x1fec/0x2660 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0xd04/0x1310 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
 usb_set_configuration+0x3493/0x3b70 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xfc/0x290 drivers/usb/core/generic.c:250
 usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
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
 process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4154 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_node_track_caller_noprof+0x96d/0x12f0 mm/slub.c:4347
 alloc_dr drivers/base/devres.c:119 [inline]
 devm_kmalloc+0xd7/0x2f0 drivers/base/devres.c:864
 ccp_probe+0x114/0x790 drivers/hwmon/corsair-cpro.c:596
 __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
 hid_device_probe+0x539/0xab0 drivers/hid/hid-core.c:2761
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
 hid_add_device+0x5ed/0x7b0 drivers/hid/hid-core.c:2907
 usbhid_probe+0x1fec/0x2660 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0xd04/0x1310 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
 usb_set_configuration+0x3493/0x3b70 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xfc/0x290 drivers/usb/core/generic.c:250
 usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
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
 process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

CPU: 0 UID: 0 PID: 5855 Comm: kworker/0:3 Not tainted 6.16.0-rc1-syzkaller-00203-g4774cfe3543a #0 PREEMPT(undef) 
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
