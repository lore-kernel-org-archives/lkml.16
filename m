Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A24863CB
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525974; cv=none; b=eojkOwuREmkJzC0N5Ka7flFx+32VHOgFYAAXL+bH6VE8g+W3jacdh1EgxowiRbVqsem/ru8g2S6ydJ7iEC/tpVSNEvIwUlVw4/Kl79upmnYkL3fUaSr10Wfcj5JN6Yr8PmjG4gcPzTwMUfgJkSqmvKJTlgRWawr1vEY6xu0dstI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525974; c=relaxed/simple;
	bh=yGQZgTTHSVx3PhFr8VKMt4lFCsY/Jmf4/Qqjo4jC7sU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BR9RUbeYnK6wKoiax7hjai7isHNhFKBvY+7H9cSxi/E01tQsc6bLe0BLWx57+ARPtEf7/rdwLYLYw6TGAUegMXR1Q0Tm6ATvcHS8LA932XCSsKdh380sKkbu8Ao/fcWpk58aBmNYqLBNB1QMyDaK6sXhKRxOuF5rbr9gs+GwYjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-86a3d964d9fso175729239f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525969; x=1749130769;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ADf1egfEArdae73a3H+BcUdsMSrewOrhnfelJZcO8w=;
        b=SSxUw7IG+qijMbBVgfPCmX3YTROQU6OQ1MxQb1jfsLKWAivKcvuyzpyPyTGxQTNs+n
         gaPNf9jve10NCQnt7qh8yi8eitE7RWMXZLNdPHXBlNGXnO3NbwbCa+CqIWTM6fDBAk28
         m/F8Mt3vFecOlh/sF4M8QNCjlsfvFxHIVIXksQyoAZZoAnlhyJNLx+bVvvwdLvYp6ep/
         3HDF/SxNh8//Y+groMyqE1zpOoVDJWA0WErZTaRy76IqLQXuup2ubeg0JKdKzjPIztXa
         5uQnak4pQaT2OERiX9mAzpCXjhLMMh9cPQw2s23eVMK16L6pKQ/GLCSuGiO+O8basAZQ
         1/sA==
X-Gm-Message-State: AOJu0YwPxpPk/qsvBqOYiQJUGdwF4Hzx4H/1i/1n3A9oLDdAoCsH0UUG
	4hCuYmelZClfsviZ+25/iGgTuZNdbvEYT8nQUQp2PK6ZxmBZfCbxsFOtxMkgzyHcqF4OuB7o6rB
	z+b4CtPpmIduhINl9mCq7WlVkBsCmjqbd2VuUm1a5AIX2Z9SIwbAR1qTvfiDxNw==
X-Google-Smtp-Source: AGHT+IFhSMpVhEhxUjV1TwvOUsxXh6I7yMPgQgjlpav2sXDD6oDkuCzgQBOJxiGdBVH2d+GutAkydgXC7k+wrCB5sD/ztBvXWINd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:c88:b0:864:a1fe:1e4a with SMTP id
 ca18e2360f4ac-86cf29fdec5mr465546739f.3.1748525969214; Thu, 29 May 2025
 06:39:29 -0700 (PDT)
Date: Thu, 29 May 2025 06:39:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68386391.a70a0220.1765ec.0189.GAE@google.com>
Subject: [syzbot] [media?] WARNING in az6007_i2c_xfer
From: syzbot <syzbot+a43c95e5c2c9ed88e966@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d0c22de9995b Merge tag 'input-for-v6.15-rc7' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=148a1170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9fd1c9848687d742
dashboard link: https://syzkaller.appspot.com/bug?extid=a43c95e5c2c9ed88e966
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0badcba87366/disk-d0c22de9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1447956c1e1e/vmlinux-d0c22de9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/55af41f29bbe/bzImage-d0c22de9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a43c95e5c2c9ed88e966@syzkaller.appspotmail.com

usb read operation failed. (-71)
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(__owner_task(owner) != get_current())
WARNING: CPU: 0 PID: 8723 at kernel/locking/mutex.c:918 __mutex_unlock_slowpath+0x22e/0x700 kernel/locking/mutex.c:918
Modules linked in:
CPU: 0 UID: 0 PID: 8723 Comm: syz.3.840 Not tainted 6.15.0-rc7-syzkaller-00152-gd0c22de9995b #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:__mutex_unlock_slowpath+0x22e/0x700 kernel/locking/mutex.c:918
Code: 0f b6 04 03 84 c0 0f 85 d1 00 00 00 83 3d 7d 74 27 04 00 75 19 90 48 c7 c7 e0 d1 6a 8b 48 c7 c6 60 d9 6a 8b e8 73 5e 2c f6 90 <0f> 0b 90 90 90 48 89 da e9 29 ff ff ff 48 89 d3 90 e8 ac b9 5d f9
RSP: 0018:ffffc90003a3f700 EFLAGS: 00010246
RAX: abeb948675ff2100 RBX: 1ffffffff1efec8a RCX: 0000000000080000
RDX: ffffc9000c84b000 RSI: 000000000000ac87 RDI: 000000000000ac88
RBP: ffffc90003a3f810 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bba984 R12: ffffc90003a3f7a0
R13: 1ffff92000747ee8 R14: 1ffffffff33020d4 R15: ffff88807c620000
FS:  00007f8f910ac6c0(0000) GS:ffff8881260c2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8f9108bd58 CR3: 0000000027662000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 az6007_i2c_xfer+0xb65/0xb90 drivers/media/usb/dvb-usb-v2/az6007.c:827
 __i2c_transfer+0x871/0x2170 drivers/i2c/i2c-core-base.c:-1
 i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:469 [inline]
 __i2c_smbus_xfer+0xfb0/0x1e50 drivers/i2c/i2c-core-smbus.c:607
 i2c_smbus_xfer+0x275/0x3c0 drivers/i2c/i2c-core-smbus.c:545
 i2cdev_ioctl_smbus+0x43d/0x6d0 drivers/i2c/i2c-dev.c:389
 i2cdev_ioctl+0x5d3/0x7f0 drivers/i2c/i2c-dev.c:478
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8f9018e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8f910ac038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f8f903b5fa0 RCX: 00007f8f9018e969
RDX: 00002000000000c0 RSI: 0000000000000720 RDI: 0000000000000006
RBP: 00007f8f90210ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f8f903b5fa0 R15: 00007f8f904dfa28
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
