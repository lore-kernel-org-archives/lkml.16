Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465CD205502
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 19:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742814; cv=none; b=fxTsP8Kr3N0sWPbjuuM7NHsFHact5aO3Wpg9pJrZxscf8O+/qHaTO0AOeVvgCL5RJZnTC+P89LwlzUoBoBnvJ8hQ0IrVecDzlKEy3WBMCMQEKO1cCOa/09mNo1IXzPZ1QbO593H7riTFS8ztGk2tcFU1kJ0DA5MY8oHO3vLYK1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742814; c=relaxed/simple;
	bh=sDs2FuQR9SAv9gueHnsljeOfKV0PFqXvuF6Js+kKAdM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=H7it00bi7aSyLPVgS4oVZQdiC/AFErTDKd/XypR6FjDjLgSZuV7uaSZEq+EGC0wS1nNfsDooqqdKLk7eUi36DlLpqRI1H+KviSDFt+LPOxmivTg/rvSQ0jMIIoIvb70izlDUg0xgqo00Jij3EHkBI9wZeEh3pEDI9mSqkzzS+4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-876afa8b530so160343039f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 12:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742812; x=1752347612;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqRYkQJ4Gex/FmdSFSJ1VKHDBVaZ3K23NAVJRsP4Dqo=;
        b=wWykRfP8US+rjbyn5eqqibniJfE9SxFkA40JTCmXRmsbUtuccrIRDhrzE4br4DXAlb
         F7HhjHdDdlqRt1KscsXyg4j8BVGbyBmTomCQPUk8XxMdYPi6eEMPugKjk+WoT3OuojCf
         yRI3iL/pcjAkGEmnBm3B31VG89Or3/EmVHJ20qPN4v5A5aJaj725tkw8S727fxLt3w7+
         DMdzAzJO+42BgS7pkdQ6+ak/RSo919SStglShtMQud1Rsjslj2WPtHyUlhRmaLPHXMtE
         6MmkD93Xp1o0fX/xgd4nfs4AJfNss/7fdqzkg6y8fr4Mg5Z2ZzsQwj54V3dOGG4KbdHO
         ohjA==
X-Forwarded-Encrypted: i=1; AJvYcCU0XHwXXb0G9rIV8qTPKAU22iVzICEWu7viKZPeCq1yjhN2xsonLYyt0Ra15gMGE2PSskEc88yF0Ca8wZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxujLzm9kR7VUNUZoWYrmphQRzWCFqPqPDEy4VGeZoBG0ao3CVZ
	WIe4l0faEI+to0tqpAs7/2aVDawODWUfA7FMJ/yoRaTPe35zCcEYdRjSeCVYNIPWkVAMTu7BU+a
	lOkGaPJPsplPTDh2Mve5oZvZy9ZoW0+A7AIY6FSDck+DgdwPrxwkpum7CZqM=
X-Google-Smtp-Source: AGHT+IE0GC55HxVfVfXZFZohjYGAnYJaxyWhKQlnKKthOT+fNFSIVWa/wK6D1/HezOQuA4M5jUQFIBUbrdXY5+SIXnCJg1WMTwY9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2307:b0:3dd:d995:30ec with SMTP id
 e9e14a558f8ab-3e13eefe279mr26598985ab.12.1751742812434; Sat, 05 Jul 2025
 12:13:32 -0700 (PDT)
Date: Sat, 05 Jul 2025 12:13:32 -0700
In-Reply-To: <68695144.a00a0220.c7b3.0045.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6869795c.a00a0220.c7b3.0048.GAE@google.com>
Subject: Re: [syzbot] [usb?] KMSAN: kernel-usb-infoleak-after-free in usb_start_wait_urb
From: syzbot <syzbot+27fe438b6370f95de4a5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a79a588fc176 Merge tag 'pm-6.16-rc5' of git://git.kernel.o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16942f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa9af7332485152e
dashboard link: https://syzkaller.appspot.com/bug?extid=27fe438b6370f95de4a5
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11132582580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10709c8c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b7cf1187020f/disk-a79a588f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/47e08d61ef4b/vmlinux-a79a588f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/75d3bcd3c8e0/bzImage-a79a588f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+27fe438b6370f95de4a5@syzkaller.appspotmail.com

microsoft 0003:045E:07DA.0001: unknown main item tag 0x0
microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
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
 usb_probe_interface+0xd04/0x1310 drivers/usb/core/driver.c:396
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
 usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
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
 usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5866 [inline]
 hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5948
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb8e/0x1d80 kernel/workqueue.c:3321
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 free_pages_prepare mm/page_alloc.c:1173 [inline]
 __free_frozen_pages+0x179/0x1560 mm/page_alloc.c:2706
 free_frozen_pages+0x21/0x30 mm/page_alloc.c:2744
 __folio_put+0x435/0x460 mm/swap.c:112
 folio_put include/linux/mm.h:1356 [inline]
 put_page include/linux/mm.h:1425 [inline]
 anon_pipe_put_page+0x32e/0x620 fs/pipe.c:139
 anon_pipe_buf_release+0x39/0x50 fs/pipe.c:147
 pipe_buf_release include/linux/pipe_fs_i.h:282 [inline]
 pipe_update_tail fs/pipe.c:242 [inline]
 anon_pipe_read+0xaef/0x1e80 fs/pipe.c:361
 new_sync_read fs/read_write.c:491 [inline]
 vfs_read+0x857/0xf00 fs/read_write.c:572
 ksys_read fs/read_write.c:715 [inline]
 __do_sys_read fs/read_write.c:724 [inline]
 __se_sys_read fs/read_write.c:722 [inline]
 __x64_sys_read+0x1fb/0x4d0 fs/read_write.c:722
 x64_sys_call+0x39db/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:1
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Bytes 2727-6822 of 65535 are uninitialized
Memory access of size 65535 starts at ffff88811b772559

CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.0-rc4-syzkaller-00308-ga79a588fc176 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
=====================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
