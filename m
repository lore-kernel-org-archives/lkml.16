Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD569443
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747895799; cv=none; b=RwU6DE9kdW/VgToJP9pF94kDXi/BpnAHDA2j7rM6Z5QZCD0Cq+vBlv7rs6e6d4LNX4VeB45SJdsfoB2Aogo/COMe4Ndxl+4hEYFxjDXyMb2mkxliNTKwKcpalE7t4EXETE5ZVX9mF8diTgnfFN9bR3ECFAdWgoUwSXTh0IWiBnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747895799; c=relaxed/simple;
	bh=mHhMz48zmTfbdAHT6nAUMVyJ6JP+5bV9RJ7zi8JFo80=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=O4lyGxr7Vv/D+4sH2awsxWxM3s0qDnHPFXOUPRp1G1L67HUMqXZnkejnuOrfRyFClwEi5paYxM3z96SxxUu4MrgwoZqZN8HoBbmlkzT5rdTBpwfFTNykQFJzMW3fPs5sbzUzZMXKJS0QsYIofCojA14co43icx/BGAqfdoXXElo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85e6b977ef2so1154939839f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 23:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747895797; x=1748500597;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+28ZBqCHdGJpYTfl5Txc9FnefB+Ye1SC10s5aGa14c=;
        b=lD2HpQ9/7Rrf9fKxe9ESoph5eKP6KoLhQNVh8LfrPFoNwNfV2WZDyUDS/bYjqkdw0y
         QOUcK+90Jb9yE4DgRpoTNOKAKp8+fve3pgJN21oTxJPWvIgbSub80XyReHJUAq/5TnEw
         En3sM73NSA8Cvqr3rfDmMHKWffpBRHFIstGirU1hWC44rfS2HD3a+LZwgc+3cs9WlCoJ
         5IoOj7QSxdc7QgBdsT+3IQBGScUYE+cx/MFsGGWn6ThdDkkarMccnc/n1hifSfLnVlvI
         EBl8CYlUhvc1AdBJ0p45SZTgx5rV1DXgOPdD71U6sOw/DWT0ZmKeMaEmE24q+Ko+iK6M
         C76w==
X-Forwarded-Encrypted: i=1; AJvYcCV+QgG6Mk8fQRBeqzB0YwFgMS9WfJMtIHIp9mRTdO95djyLTV571PqxZi8isWofDbKQUhkKurSPBWFroP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyZNPxCJtWsD0ILpwdM3suwGZCOF2tV7glLLnqpwejSynlUFjo
	A6ug5ZSxNAAzx263D4y964kB+nuMBfojXgRSBKZjNg+qqc6zHCaZ7AAWwHaokLAUxd+fRakxcen
	vc6iVEYuhmcL5j6Uhtc+PU5HByn9X3oRs9/qfUDzMJsrnyy4JHM5bhdez9ic=
X-Google-Smtp-Source: AGHT+IG1EtV86rdulCWLkddnrTGcVk4ivQNEdjUc2j/wGK7KNYYu99nncN87HNXKbzsbACZB7In0oWweAntOo1UPoOv8rrEh4pJ8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19cb:b0:3dc:80e6:3819 with SMTP id
 e9e14a558f8ab-3dc80e638edmr89155415ab.22.1747895796846; Wed, 21 May 2025
 23:36:36 -0700 (PDT)
Date: Wed, 21 May 2025 23:36:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682ec5f4.a00a0220.2a3337.000e.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in dtv5100_i2c_msg/usb_submit_urb
From: syzbot <syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5723cc3450bc Merge tag 'dmaengine-fix-6.15' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=176c5f68580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c3f0e807ec5d1268
dashboard link: https://syzkaller.appspot.com/bug?extid=0335df380edd9bd3ff70
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0539c6646d88/disk-5723cc34.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3e53f83634f7/vmlinux-5723cc34.xz
kernel image: https://storage.googleapis.com/syzbot-assets/23a89b974355/bzImage-5723cc34.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 3-1: BOGUS control dir, pipe 80006980 doesn't match bRequestType c0
WARNING: CPU: 0 PID: 15834 at drivers/usb/core/urb.c:413 usb_submit_urb+0x1112/0x1870 drivers/usb/core/urb.c:411
Modules linked in:
CPU: 0 UID: 0 PID: 15834 Comm: syz.3.2930 Not tainted 6.15.0-rc6-syzkaller-00346-g5723cc3450bc #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:usb_submit_urb+0x1112/0x1870 drivers/usb/core/urb.c:411
Code: 0f b6 44 05 00 84 c0 0f 85 38 06 00 00 45 0f b6 04 24 48 c7 c7 00 86 12 8c 48 8b 74 24 18 4c 89 fa 44 89 f1 e8 5f f7 6e fa 90 <0f> 0b 90 90 49 bd 00 00 00 00 00 fc ff df e9 2b f4 ff ff 89 e9 80
RSP: 0018:ffffc90004b3f610 EFLAGS: 00010246
RAX: f5838b6742b91e00 RBX: ffff88801ff35300 RCX: 0000000000080000
RDX: ffffc90010c7f000 RSI: 0000000000004945 RDI: 0000000000004946
RBP: 1ffff11003fd2d6c R08: ffff8880b8923e93 R09: 1ffff110171247d2
R10: dffffc0000000000 R11: ffffed10171247d3 R12: ffff88801fe96b60
R13: dffffc0000000000 R14: 0000000080006980 R15: ffff8881422eaa60
FS:  00007f2867dba6c0(0000) GS:ffff8881260c2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2867d99d58 CR3: 0000000067e32000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 dtv5100_i2c_msg+0x250/0x330 drivers/media/usb/dvb-usb/dtv5100.c:60
 dtv5100_i2c_xfer+0x1a4/0x3c0 drivers/media/usb/dvb-usb/dtv5100.c:86
 __i2c_transfer+0x871/0x2170 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2315
 i2c_transfer_buffer_flags+0x105/0x190 drivers/i2c/i2c-core-base.c:2343
 i2c_master_send include/linux/i2c.h:109 [inline]
 i2cdev_write+0x112/0x1b0 drivers/i2c/i2c-dev.c:183
 do_loop_readv_writev include/linux/uio.h:-1 [inline]
 vfs_writev+0x4a5/0x9a0 fs/read_write.c:1057
 do_writev+0x14d/0x2d0 fs/read_write.c:1101
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2866f8e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2867dba038 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
RAX: ffffffffffffffda RBX: 00007f28671b5fa0 RCX: 00007f2866f8e969
RDX: 0000000000000001 RSI: 00002000000012c0 RDI: 0000000000000005
RBP: 00007f2867010ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f28671b5fa0 R15: 00007f28672dfa28
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
