Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E518F182CD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743859050; cv=none; b=hnMovW8K2RvEnn5OHMfg1RUwQKxlY5K32fKEq7RlfPoFJvTJQdMJ/Mui1JYYj3N7x3KSrWszMI01jn/4KObgoT996bEf+BDt+E4cgHcphlfVx3HdQIl23ZxNai0rehR/T/Okz9MguKeVQrEv1BJRE3r9FfyiMxG0ki0wV4/Upsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743859050; c=relaxed/simple;
	bh=BfPeNSA7V2p5NyJodokIRVJiGG/29AvblmZjrvX7ufw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dQpqNQ4Ux2R3vGHk7v6aEoAsPE5kKvn1gZtFvnJ0+bPBDYF8KBYnmBHQDDQV41HvEknF+OFLTC3YOrDAsXDtarYmXRzx/yYQZMJqDWbTnBj5myeMrJRYAx2gwW88r6sEJmbYJA+twGMYH7cFgd5TJLB4a2JrWp2VWlVxdPBMN6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so67436565ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 06:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743859048; x=1744463848;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wq6bB4Fh3aAKVP1l0YLV7cBg60hZg+PIl33zPkvZtt8=;
        b=Ea8rCrSrkydMPhoiogLzMoHmWVOKdJWQftsTuQmLoKCgwQ77uLsoNyIXG7LK+3an0L
         DtybTps4u0HUwt2Pf3jb/+9eF+kEcDZs7QtUN453xpu1BcVmRDhruFJQGOlwNJLNOAG8
         t+BP8BpSoZ2usikWIlgI4lMrk61h74PuVAuPMRXUeTvcbhllNb9THaI3k7buJfqAPaNW
         MR6AMWf7KzbuNoXfVfDRhzwaCWvADDxe7rzkAKDCR3YOU65FY0TkFc6ZDUmqcdOChy7K
         FXzMjZ4iuMnkphU0oUxFmYDEpN6C2u55qT0DWMJeWnRgAgEpTtrlIn2zhmtx6irwutAi
         12xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWje1o8xxG4hTh2v7ahvalThYW11A5QI0mTzWSDmYX8WgWvqZuuHvgIQoTKszQGMstzTk/CwkAv3o2+4qc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpsa+v6c50Bd4URGWhVN5u2eQwghu8+ZST/ybhYXx56qG6pYLL
	2iLHnTxazw2ciuDuhRLY7hBqyGl5T0PfTfjslSkQR2mnchD0t2Kd+a3B49cUC4XJGBN4bVDgwWV
	xDYTiL/EoTSdX2XADyW/iH0Ukpr15wTUni84RxLvlZB7VcyxHowZfOoU=
X-Google-Smtp-Source: AGHT+IE/kEkriqFi/9Z9gP7VTL08EAEeFstomW3IRxCoOb1zweUOTs1LmAGn1GOqT0EXQCeunrNi4ZPMpOVbtakgWBd631UsQeGR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda7:0:b0:3d5:d71f:75b3 with SMTP id
 e9e14a558f8ab-3d6ec57f9damr31562235ab.15.1743859048043; Sat, 05 Apr 2025
 06:17:28 -0700 (PDT)
Date: Sat, 05 Apr 2025 06:17:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f12d68.050a0220.0a13.023b.GAE@google.com>
Subject: [syzbot] [kernfs?] KMSAN: uninit-value in __kernfs_remove
From: syzbot <syzbot+cc330991864da84c780a@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    08733088b566 Merge tag 'rust-fixes-6.15-merge' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13e28fb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28536ac4fd53e6d4
dashboard link: https://syzkaller.appspot.com/bug?extid=cc330991864da84c780a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/116bb82e120a/disk-08733088.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bb780f6a4805/vmlinux-08733088.xz
kernel image: https://storage.googleapis.com/syzbot-assets/520911c58caf/bzImage-08733088.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cc330991864da84c780a@syzkaller.appspotmail.com

netdevsim netdevsim3 eth3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
=====================================================
BUG: KMSAN: uninit-value in __rb_change_child include/linux/rbtree_augmented.h:-1 [inline]
BUG: KMSAN: uninit-value in __rb_erase_augmented include/linux/rbtree_augmented.h:242 [inline]
BUG: KMSAN: uninit-value in rb_erase+0x597/0x23b0 lib/rbtree.c:443
 __rb_change_child include/linux/rbtree_augmented.h:-1 [inline]
 __rb_erase_augmented include/linux/rbtree_augmented.h:242 [inline]
 rb_erase+0x597/0x23b0 lib/rbtree.c:443
 kernfs_unlink_sibling fs/kernfs/dir.c:419 [inline]
 __kernfs_remove+0xbd5/0xfd0 fs/kernfs/dir.c:1493
 kernfs_remove+0xa5/0xf0 fs/kernfs/dir.c:1529
 sysfs_remove_dir+0x102/0x170 fs/sysfs/dir.c:101
 __kobject_del+0x13e/0x4b0 lib/kobject.c:604
 kobject_del lib/kobject.c:627 [inline]
 kset_unregister+0x4d/0x90 lib/kobject.c:890
 remove_queue_kobjects net/core/net-sysfs.c:2156 [inline]
 netdev_unregister_kobject+0x527/0x570 net/core/net-sysfs.c:2304
 unregister_netdevice_many_notify+0x3a00/0x4600 net/core/dev.c:12009
 unregister_netdevice_many net/core/dev.c:12037 [inline]
 unregister_netdevice_queue+0x598/0x5f0 net/core/dev.c:11889
 unregister_netdevice include/linux/netdevice.h:3374 [inline]
 nsim_destroy+0x147/0x720 drivers/net/netdevsim/netdev.c:1051
 __nsim_dev_port_del+0x1e9/0x320 drivers/net/netdevsim/dev.c:1428
 nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1440 [inline]
 nsim_dev_reload_destroy+0x464/0x7b0 drivers/net/netdevsim/dev.c:1661
 nsim_drv_remove+0x93/0x310 drivers/net/netdevsim/dev.c:1676
 nsim_bus_remove+0x1e/0x30 drivers/net/netdevsim/bus.c:398
 device_remove drivers/base/dd.c:567 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x58a/0x990 drivers/base/dd.c:1296
 device_release_driver+0x22/0x30 drivers/base/dd.c:1319
 bus_remove_device+0x71b/0x760 drivers/base/bus.c:579
 device_del+0x7ee/0xd40 drivers/base/core.c:3855
 device_unregister+0x1e/0x40 drivers/base/core.c:3896
 nsim_bus_dev_del drivers/net/netdevsim/bus.c:462 [inline]
 del_device_store+0x421/0x640 drivers/net/netdevsim/bus.c:226
 bus_attr_store+0x92/0xf0 drivers/base/bus.c:172
 sysfs_kf_write+0x19a/0x250 fs/sysfs/file.c:139
 kernfs_fop_write_iter+0x525/0x910 fs/kernfs/file.c:334
 new_sync_write fs/read_write.c:591 [inline]
 vfs_write+0xb34/0x1540 fs/read_write.c:684
 ksys_write+0x240/0x4b0 fs/read_write.c:736
 __do_sys_write fs/read_write.c:747 [inline]
 __se_sys_write fs/read_write.c:744 [inline]
 __x64_sys_write+0x93/0xe0 fs/read_write.c:744
 x64_sys_call+0x34de/0x3c80 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable tmp created at:
 number+0x8f/0x1e70 lib/vsprintf.c:455
 vsnprintf+0x91b/0x1a10 lib/vsprintf.c:2811

CPU: 1 UID: 0 PID: 8025 Comm: syz-executor Not tainted 6.14.0-syzkaller-11270-g08733088b566 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
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
