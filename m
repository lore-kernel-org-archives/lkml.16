Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A3C101EE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750388668; cv=none; b=f6sONXwZdHtQV0OqMmlhpK2MUnWNrw2DjoN+mRFqtoHBOXcnIZG7AL6udozqXh95pGQjdK+RAMuvE+6ibGJKcRLHifBQVM/+gayVu9oPyfQ1z38jSXHGtKyLmFrC+7U2Dd76vcMU2Q0aqEaizV7f2CU0v8lxZNjjRwHcHIANAEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750388668; c=relaxed/simple;
	bh=VMNJHOUG2mv6ydAixpnR8WSFS54WiEIaJZICTn6LhoA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=E38RkPqsmXjlqUf5lysD5CYHBlmL15tift8wEabYvl2i9e1MgNDPGAt7NOQVesWsbrYmCDXb9qDBo61ntNq4KW1JnS4qKFk3EY7uGOq34J2ZwIm/jh4qIT/rQC+oruPst7HlAq/XhNDtuHM204XcdNFovTzGjtvFixLb+GnMOAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddcc14b794so8639585ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750388666; x=1750993466;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGMTxdQ6cfnwXI0nK8qaXneVbaNONzdfvAkERpjAdz4=;
        b=Ug/HaYmoTxGXbbtJwwn+oUV4JDgZyxgmJeJg+piy8uac5hOf9Iayf6iZ6+l/mFSbzq
         Fe51sdHWkNKPqmATJgizBXkemc1Kd2RyiE5aA2rtnCRvDyVb63yUDEkBpFwY0tRvTiNf
         LYBqIjdAski8aCU83byYBukaNSqcS6Cih0w4JrPNY4/H3YIPCSslHf28E6gT8yczQ+qY
         wjYKK3QEBISqRgb0+/NJgLVUFELzNlpYbLyDeGgVfBfAZ9qYjyT6fe2AzY/UIJSxyfGR
         LC6RQzKclOPe8exzsQzRpJ8qNN3lfk0su8TidrH7PvHQX01RVX6ImQ8prIVRvJxlzuGx
         BHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg3fUA07X+J2aq/QwnJMozcIp8cRkqR/2AYpdxcfdMAO64MR3UQOzRZc4JZQ71UOhlnioWCsC4+h++EYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI1dmoLMvPYzowg3YS8W3xgu95Xfm5ihKp+zzcRYgE/WASvJA8
	YEsLOFo5SgvJaQXw0AThfyWU7o7EFyfw51oK1MtjxQKhVCxleRdWLmC/X5CN8oroapbLME0Q+lP
	7RHwUadEUjiXtg3RC6gn6e6e76n7rJqpjIhxUVuGr5bfJ602sng2437VsUJ0=
X-Google-Smtp-Source: AGHT+IH1W+a8ekFqQ2D9tBLxcVcBOo+VcQ4gcMAddGVYjssy/9q5Nxi5nk116dXt+232A0CbVrao2E5sm529VPw4WRwuWLRWVtEP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fec:b0:3dc:87c7:a5a8 with SMTP id
 e9e14a558f8ab-3de38c1bf73mr14006835ab.2.1750388665825; Thu, 19 Jun 2025
 20:04:25 -0700 (PDT)
Date: Thu, 19 Jun 2025 20:04:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6854cfb9.a00a0220.137b3.0028.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in dib0700_ctrl_rd/usb_submit_urb
From: syzbot <syzbot+0cd0fb4cf3f4722d6663@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9afe652958c3 Merge tag 'x86_urgent_for_6.16-rc3' of git://..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=154c2370580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5f3f62311f35cdd9
dashboard link: https://syzkaller.appspot.com/bug?extid=0cd0fb4cf3f4722d6663
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a3b50c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12a3b50c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ad9d856c993f/disk-9afe6529.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f58228c24de9/vmlinux-9afe6529.xz
kernel image: https://storage.googleapis.com/syzbot-assets/809c5234f87e/bzImage-9afe6529.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0cd0fb4cf3f4722d6663@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: CPU: 1 PID: 5836 at drivers/usb/core/urb.c:411 usb_submit_urb+0x13c3/0x1790 drivers/usb/core/urb.c:411
Modules linked in:
CPU: 1 UID: 0 PID: 5836 Comm: syz-executor308 Not tainted 6.16.0-rc2-syzkaller-00024-g9afe652958c3 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:usb_submit_urb+0x13c3/0x1790 drivers/usb/core/urb.c:411
Code: e8 b2 12 89 fa 4c 89 ef e8 ba b7 d5 fe 44 8b 44 24 28 44 89 f9 48 8b 54 24 38 48 89 c6 48 c7 c7 40 06 73 8c e8 fe d7 47 fa 90 <0f> 0b 90 90 e9 84 ef ff ff e8 7f 12 89 fa 0f b6 2d d9 8d 5d 09 31
RSP: 0018:ffffc90003eff980 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff888020ef6800 RCX: ffffffff817ae248
RDX: ffff888012e9bc00 RSI: ffffffff817ae255 RDI: 0000000000000001
RBP: ffff888140fef058 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffff88803498ce80
R13: ffff888140fef0b0 R14: 0000000000000001 R15: 0000000080000280
FS:  0000555558039380(0000) GS:ffff88812485a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000002580 CR3: 0000000073ffa000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 usb_start_wait_urb+0x104/0x4b0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x326/0x4a0 drivers/usb/core/message.c:154
 dib0700_ctrl_rd+0x1b2/0x350 drivers/media/usb/dvb-usb/dib0700_core.c:95
 dib0700_i2c_xfer_legacy drivers/media/usb/dvb-usb/dib0700_core.c:315 [inline]
 dib0700_i2c_xfer+0xa9a/0xe40 drivers/media/usb/dvb-usb/dib0700_core.c:361
 __i2c_transfer+0x6b6/0x2190 drivers/i2c/i2c-core-base.c:2258
 i2c_transfer drivers/i2c/i2c-core-base.c:2314 [inline]
 i2c_transfer+0x1da/0x380 drivers/i2c/i2c-core-base.c:2290
 i2cdev_ioctl_rdwr+0x373/0x710 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x5ff/0x820 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa17e8248f9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd59dafc98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fa17e8248f9
RDX: 0000200000002580 RSI: 0000000000000707 RDI: 0000000000000004
RBP: 00007fa17e8975f0 R08: 00232d6332692f76 R09: 0000000000000006
R10: 000000000000001f R11: 0000000000000246 R12: 0000000000000001
R13: 431bde82d7b634db R14: 0000000000000001 R15: 0000000000000001
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
