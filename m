Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EFF3BBF0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751685636; cv=none; b=nfVqNrpCOYivWgpNGyXHaSoAuvSssDk/b0AaR6WI4Nzgx+yI0LkN66J6a2ThKkcIyKHtQf0+usrQEolEOKw0kjeIZdbJ0nh2r9341oTIWwwv/9tASCLvH88oWYmMyA07RucpkW5b9GMTyeU5QsN42JrhtXs+kbPo/1R1slDQ48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751685636; c=relaxed/simple;
	bh=CRQH1IyMz6ahEngxss2MpuakmH5sdxcDBWb+dAf1Xcg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZGdJNEQNzTcTrWD++DaAkGLfeJTLMnlaK7mLQ/SlnvZ9XIrQ6odRaHnOOQnXKO3dNXlYXAwjNlqFTHob+ghpTFeunlpNyiGyxtBYOkT+RNpclk9SXEQYCm6pGUvebSlypNNqBrv1qGXfSjKe+O88aX/m04VrYvBk5GTlRbxcfEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-8760733a107so136187039f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 20:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751685634; x=1752290434;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VoFRaj++AKwnWdJ5HOmIe9Mz7Gq3Yw3PkhoxSS2pG8=;
        b=jNu/eeUsboqxRAQ2ARx77P1+ZYa9KLHDp+YN7W/GB7ubSXCPjKCEkXTU1y/H3KfeD4
         uePd0K2CC4KpuMI31ZVlX3N4qo9Vo9C4JcE9hqEYqtPIqtZK0vaoY2FxKcnrbsXUiHAq
         0HeYZtsXYmxn5Fw+AVeA22Y2eZPwcHi7AVRKr5WPColytIIgOnRmjNAebTZFek1Zw0uN
         XLTD/h8mpfiXVVsDyZ/Pkzflc1O0khwF0PaYhBmSWjU/pA8iuFxbPzxcQ+ktJOwKpJfN
         JNrBzEhTHjQJpHvxEDr07K5HcaW+aLbITnejJtqnJOa0+am+GYFqDDs3CFy4SxgISgEe
         zzyA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Z+T5mRmPEoCT1R4sn15yXWnGah6AT6JMbZfhclwFDcJAwRAHrhNRUjxFqYdrCLfkF2ZHN6xTif+Lklo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkR30aXZPcDcfIqZqvfbjxfAGUs91UQ/ODLQmtHkGqce+d6Cvl
	0qvim6NUUhnRFC9LDvPHh+Vp+uiMcJw10uzJVTvhsk5BZFwr5RRXlNogUwkGdLwotOxTwYq/06S
	Wb5OSF5PCfmPoNluq37gijbCpb+WU81sTVrmiUBP7VtTGtFcf61DEBjWRMJg=
X-Google-Smtp-Source: AGHT+IFF8j/HHW8/8LkD95PaYBUrfKFScw55dIhBkot0qBwCmOs6qGdBWcFM6evhE6Vt9AMI6G+MLw6r/I7iM/2U9aTTDeiSecMu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a0f:b0:3dc:7fa4:834 with SMTP id
 e9e14a558f8ab-3e13ef0fee3mr9726355ab.15.1751685634030; Fri, 04 Jul 2025
 20:20:34 -0700 (PDT)
Date: Fri, 04 Jul 2025 20:20:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68689a02.a00a0220.c7b3.002c.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in driver_unregister (2)
From: syzbot <syzbot+6616bba359cec7a1def1@syzkaller.appspotmail.com>
To: dakr@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c435a4f487e8 Merge tag 'riscv-for-linus-6.16-rc5' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=138f8f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba6cef8f153bfeb
dashboard link: https://syzkaller.appspot.com/bug?extid=6616bba359cec7a1def1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b8febc580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=118f6c8c580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-c435a4f4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/691cd7284e87/vmlinux-c435a4f4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e61b1a511aab/bzImage-c435a4f4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6616bba359cec7a1def1@syzkaller.appspotmail.com

Unexpected driver unregister!
WARNING: CPU: 1 PID: 6119 at drivers/base/driver.c:273 driver_unregister drivers/base/driver.c:273 [inline]
WARNING: CPU: 1 PID: 6119 at drivers/base/driver.c:273 driver_unregister+0x90/0xb0 drivers/base/driver.c:270
Modules linked in:
CPU: 1 UID: 0 PID: 6119 Comm: syz.0.16 Not tainted 6.16.0-rc4-syzkaller-00286-gc435a4f487e8 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:driver_unregister drivers/base/driver.c:273 [inline]
RIP: 0010:driver_unregister+0x90/0xb0 drivers/base/driver.c:270
Code: 48 89 ef e8 12 8f 55 fc 48 89 df e8 7a 93 ff ff 5b 5d e9 63 cf ae fb e8 5e cf ae fb 90 48 c7 c7 80 ef 41 8c e8 91 8f 6d fb 90 <0f> 0b 90 90 5b 5d e9 45 cf ae fb e8 40 ab 15 fc eb 94 e8 39 ab 15
RSP: 0018:ffffc900049d79d8 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffffffff90173840 RCX: ffffffff817ae278
RDX: ffff888029d50000 RSI: ffffffff817ae285 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000002
R13: dffffc0000000000 R14: 0000000000000000 R15: ffff888107f6b800
FS:  000055555b4fa500(0000) GS:ffff8880d6815000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2e55ffff CR3: 000000002b847000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 comedi_device_detach+0x13d/0x9e0 drivers/comedi/drivers.c:207
 comedi_device_attach+0x43d/0x900 drivers/comedi/drivers.c:1000
 do_devconfig_ioctl+0x1a7/0x580 drivers/comedi/comedi_fops.c:855
 comedi_unlocked_ioctl+0x15bb/0x2e90 drivers/comedi/comedi_fops.c:2136
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f587658e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff8eccbf98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f58767b5fa0 RCX: 00007f587658e929
RDX: 0000200000000080 RSI: 0000000040946400 RDI: 0000000000000003
RBP: 00007f5876610b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f58767b5fa0 R14: 00007f58767b5fa0 R15: 0000000000000003
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
