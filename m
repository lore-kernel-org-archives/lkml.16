Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9456FC5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464960; cv=none; b=PTr9u9cE9+iH2nlz8bs6QIGAFBFluN6nU33o4zHPnS/ho2HFoRNmgzOz1KEfmR91alC74WvpMcJJfOAL59pM5Ab7YrEACtZhBkbwjB2sjI3/M7iAg64RiFAjFeuQ81DtKXMuc4fpyQqH10PiVSNYgqeUMBtlkBhuL28pulWRQVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464960; c=relaxed/simple;
	bh=/xnQFIqYyIL9Yz85movHuQxtuMf6MHqxcoRtaZvgxNU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=q24DMDAllU8iZg3muMCGc0cqUFRMlt+OOvtjWPWGRP43c3nU32YCURU3GrdE1T96DaiUSUIYDM9dvlHtoWRw0kCGkSgPnPeV7YK0li7w7JG4wdigUSbTQ086dzFp05Mkq2QTEnCU9P5HZroukb+LGG9KCrzEyYDtgGfTUB3IVi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-87632a0275dso546419839f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464958; x=1752069758;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dByylAG2c51x5gFXBJ6JiboT2jB5E3W7QnW5fgQ6Oiw=;
        b=OsYZOcUM1LjvXFfv7Z2kytE8DOSaza3rp97gV6nmh8b37VIaW+6Wb7hFNFR3uiDiLN
         6kx1+Jn8QiYdBXTQPyw2N0Cxv244BEI/pt+a9HjzyE78T3YzlbRaWYw8pEU/RBADTWhC
         M56Zly4bXChNK6eU00lzsgWY6ZsS2w1ZPL6UWXiKA32mYdiL4ICwm0dKgBNpRR+NvS8v
         tIOMzXSDfHwfb8xZr0pXlT24aDqKDzyt1+f4OtP+0/x/5UIdjj5lj5IHwjFbhOliaFAO
         kCFd+Pr496F8Ib6fGPKWVvoHIJ0vvrmZ5+uHPfF96ghYqFati9C/r3SgByNcqU6dgTs0
         R9mw==
X-Forwarded-Encrypted: i=1; AJvYcCWjfiA36xET/pe3YK6gGP58TACFK5LyaY2ibIUknWy54c58qcyln0Gs5Qs7Mew6wOVEZ9eteAQB2BZBaSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfTkF0NFiW7Sgk0tgGrMOKtW8aXE+PDGZcm5S4qfCuyVryL0Cu
	knNz/7sd6WKvWyUlE+byHaWp749vfQq1Ys9yLlgRRuI0CyokMuAR85MXzlAO0CFB8k/pLY1/Kvj
	SWE0QKhXmyztmyE7bGHTAOZAEiLA5qU7HzJz+pJzpFuc8nGMIOoAJZO2MYZA=
X-Google-Smtp-Source: AGHT+IF4x4Or/xkfZx7+M2g2bxTm2Ngcdv5e6gScnz+K6XgI5teTfxfLyoi8M7MaKmbsiwTQXKRuH36XYi+0I3m7jN8PapKeG5n2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5d:88c2:0:b0:861:c238:bf03 with SMTP id
 ca18e2360f4ac-876c6a292ddmr287486139f.8.1751464957903; Wed, 02 Jul 2025
 07:02:37 -0700 (PDT)
Date: Wed, 02 Jul 2025 07:02:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68653bfd.a00a0220.270cb1.0000.GAE@google.com>
Subject: [syzbot] [usb?] KMSAN: kernel-usb-infoleak in usbhid_raw_request
From: syzbot <syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    66701750d556 Merge tag 'io_uring-6.16-20250630' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=169d648c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d5c61bcebaf295a
dashboard link: https://syzkaller.appspot.com/bug?extid=fbe9fff1374eefadffb9
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c23f36e934f7/disk-66701750.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fb02dd3f3235/vmlinux-66701750.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0a0df8bd2838/bzImage-66701750.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com

usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 4-1: config 0 descriptor??
microsoft 0003:045E:07DA.0003: unknown main item tag 0x0
microsoft 0003:045E:07DA.0003: ignoring exceeding usage max
=====================================================
BUG: KMSAN: kernel-usb-infoleak in usb_submit_urb+0x5a1/0x2630 drivers/usb/core/urb.c:430
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
 slab_post_alloc_hook mm/slub.c:4154 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_node_track_caller_noprof+0x96d/0x12f0 mm/slub.c:4347
 __kmemdup_nul mm/util.c:63 [inline]
 kstrdup+0x8a/0x2a0 mm/util.c:83
 kstrdup_const+0x5e/0x90 mm/util.c:103
 __kernfs_new_node+0x6e/0xa70 fs/kernfs/dir.c:633
 kernfs_new_node+0x1f0/0x370 fs/kernfs/dir.c:713
 kernfs_create_dir_ns+0x9a/0x2b0 fs/kernfs/dir.c:1083
 sysfs_create_dir_ns+0x19c/0x540 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0xeed/0x1840 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_init_and_add+0x371/0x4e0 lib/kobject.c:457
 rx_queue_add_kobject net/core/net-sysfs.c:1239 [inline]
 net_rx_queue_update_kobjects+0x314/0xd40 net/core/net-sysfs.c:1301
 register_queue_kobjects net/core/net-sysfs.c:2093 [inline]
 netdev_register_kobject+0x2bc/0x4f0 net/core/net-sysfs.c:2340
 register_netdevice+0x1b41/0x25d0 net/core/dev.c:11105
 veth_newlink+0x88f/0x1630 drivers/net/veth.c:1855
 rtnl_newlink_create+0x41c/0x1250 net/core/rtnetlink.c:3823
 __rtnl_newlink net/core/rtnetlink.c:3940 [inline]
 rtnl_newlink+0x2f13/0x3a90 net/core/rtnetlink.c:4055
 rtnetlink_rcv_msg+0x106c/0x14b0 net/core/rtnetlink.c:6944
 netlink_rcv_skb+0x54d/0x680 net/netlink/af_netlink.c:2534
 rtnetlink_rcv+0x35/0x40 net/core/rtnetlink.c:6971
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0xed8/0x1290 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x10b3/0x1250 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x333/0x3d0 net/socket.c:727
 __sys_sendto+0x593/0x720 net/socket.c:2180
 __do_sys_sendto net/socket.c:2187 [inline]
 __se_sys_sendto net/socket.c:2183 [inline]
 __x64_sys_sendto+0x130/0x200 net/socket.c:2183
 x64_sys_call+0x3c0b/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:45
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Bytes 20-22 of 65535 are uninitialized
Memory access of size 65535 starts at ffff88804b9e3399

CPU: 1 UID: 0 PID: 42 Comm: kworker/1:1 Not tainted 6.16.0-rc4-syzkaller-00013-g66701750d556 #0 PREEMPT(undef) 
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
