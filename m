Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E7A198851
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745530772; cv=none; b=gJTJkryFsT0JNlht+mSlz1tomqNKYp5M8AAQM51SSx8g9YF7FALxAldYz8hKPjOIOOGC6L1rR0rgQLK2GZ/xxjHfq0/1ws+v5OA0fmZ/vw98uK1Kq1hIKajO6x2TfsvWrbUT6q9fBMnDUjUwL61TfJ2dg+HRls+2+0y1OGny1ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745530772; c=relaxed/simple;
	bh=m84XFI5ahx+zdhUnz7Fvx0Zb/akDO66SZJnjEKHKtlc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=f8ca2bCc2S1gHtCGDuYI1AilwCEeprDu0BClc61V8pCqPSvT0j6jzQ+ksk1SzpUjaNAwTyTFeSlQvBXcDZWhho9bT3mZ4DiR9KzRl8cG59D4/VAAI7ek+DKEqUs52LrumWmF/lrpZ6q+wOfEz4wStu+cf625XGIcN9UuTJCiMm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d81a0224e7so27824065ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745530770; x=1746135570;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EoLt4L2Lh+E78pnZI5/QVG/Hv6Xj+VU0gZ1HcGcf6zE=;
        b=fCUt/aOTuEu4Q2vQQwQLeZPTz1uueZIUpNEFCD2ph2BKZgxP1x5EClP5dkeEfLo/FE
         iJEmTaXzRI1PlkfAJp+GgkTwYthFb5Ipk1Vxjk42rHdKUM8t1o4DIXsn9UdTF/EmZsEh
         BP2Wc7KcZ/NYVoPpUQSF+0VnhQ3Qm/FgpKRA9wgNTQXTooOG9FkCqR7TUK3USBZ7Pz6x
         PNaEjTPJmLLv+kaV1x125UnvDL8pm4cCw/FLJOQ5ejqfI8ypYa8prBlTjq3OAANpg+7V
         HVzjhcFmIaOmMdkdCB9f0SVRftEK8I9vItoSXw0N8kiiSoiYi3XByoHRxf5EkFQUVEE1
         6nAg==
X-Forwarded-Encrypted: i=1; AJvYcCUz0p7Ai/HsFmcO5xq2iuHOp1BIIStoyynnHJslLd9KAHLnfXRDHXGpXGXcib31S+o6TRmOfxI7Ag5nBPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YztFYt1AHMWbj0qqAKUFeDVrs9YtUugJ9W41Ah6CE/gvMw+nnTI
	faQ8TUcAKUhJsm3sTB5Ir7D0CcTPTizpA++Zbr+ZtFoKZMozSUgrViO4oJLt9KzgvSmZjrli9WI
	wOy7rdDCuFQ9WOvmjMl1E8cjC7dB0BYyvn+ONnLmA/kbtijgCbpRe0yg=
X-Google-Smtp-Source: AGHT+IEmvT11EBM6Y/+FWfNRQ6IwzgL8vQDtfM6htUu+qg+C6Iq6arQgOgcEXjHUNI+WflMF2W8umjh6zuHT/9JfTpXnp40AS7S6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1686:b0:3d8:1a1e:8bf8 with SMTP id
 e9e14a558f8ab-3d938f1c9ecmr16752905ab.20.1745530770329; Thu, 24 Apr 2025
 14:39:30 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:39:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680aaf92.050a0220.317436.0050.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in gl861_ctrl_msg/usb_submit_urb
From: syzbot <syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6fea5fabd332 Merge tag 'mm-hotfixes-stable-2025-04-19-21-2..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15240ccc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=68d9f79fc685cd4
dashboard link: https://syzkaller.appspot.com/bug?extid=721071c10f3c7e4e5dcb
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1669cc70580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10489ccc580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/796861732b0e/disk-6fea5fab.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/00255924cbaa/vmlinux-6fea5fab.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9a955adbead1/bzImage-6fea5fab.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 2-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: CPU: 0 PID: 5845 at drivers/usb/core/urb.c:413 usb_submit_urb+0x11dd/0x18c0 drivers/usb/core/urb.c:411
Modules linked in:
CPU: 0 UID: 0 PID: 5845 Comm: syz-executor566 Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:usb_submit_urb+0x11dd/0x18c0 drivers/usb/core/urb.c:411
Code: 48 8b 4c 24 08 0f b6 04 01 84 c0 0f 85 52 05 00 00 45 0f b6 07 48 c7 c7 a0 59 f2 8c 4c 89 f6 48 89 da 89 e9 e8 64 c2 f1 f9 90 <0f> 0b 90 90 e9 c7 f3 ff ff 89 e9 80 e1 07 80 c1 03 38 c1 0f 8c 53
RSP: 0018:ffffc900040df748 EFLAGS: 00010246
RAX: a1ba001046e4b900 RBX: ffff88801e2f6cc0 RCX: ffff888027a31e00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000080000280 R08: ffffffff818218d2 R09: 1ffff9200081be84
R10: dffffc0000000000 R11: fffff5200081be85 R12: ffff8881453e30b0
R13: ffff88801e6c1b00 R14: ffffffff8cf2c440 R15: ffff8880206cf7c0
FS:  000055558e0e4380(0000) GS:ffff888124f9a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000558df9b18050 CR3: 00000000326be000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usb_start_wait_urb+0x11a/0x530 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x2b3/0x4c0 drivers/usb/core/message.c:154
 gl861_ctrl_msg+0x332/0x6f0 drivers/media/usb/dvb-usb-v2/gl861.c:58
 gl861_i2c_master_xfer+0x3b4/0x650 drivers/media/usb/dvb-usb-v2/gl861.c:144
 __i2c_transfer+0x859/0x2250 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x2c2/0x430 drivers/i2c/i2c-core-base.c:2315
 i2cdev_ioctl_rdwr+0x488/0x780 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x78a/0xa20 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f83d3039529
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffa9feff58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f83d3039529
RDX: 0000200000002580 RSI: 0000000000000707 RDI: 0000000000000004
RBP: 00000000000f4240 R08: 00232d6332692f76 R09: 00000000000000a0
R10: 000000000000000f R11: 0000000000000246 R12: 0000000000000001
R13: 00007fffa9ff0178 R14: 00007fffa9feff80 R15: 00007fffa9feff70
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
