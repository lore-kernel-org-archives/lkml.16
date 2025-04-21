Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395B41E7C06
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745199694; cv=none; b=tALNFD4pE7ieCYxwQ9pLrnh0/B6F7bBil4vNijvNijFXIUzqdGP/oFlJpwcVWrQAPV+NG8Q9ki9GBIUMjQCODggTwQ1cOQ/Wp7qDBiA/CVXMd9WAhTNiGTmS11IxAW6Dm7mny+PGKcofg5mPKgSdvvGU+ZveQzkaWxHoN3QTCnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745199694; c=relaxed/simple;
	bh=eJp2ux+Tyna1SBybX627Y8ip+PkzCtp4TUiHtxOyWkk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gJoAEBwZk3oZcmuZ4MaIpGOb2yFFh2AhSsGcjmAKpiu43f/+r7fMrp/u8TRItdAz+YlicJFktMvUaKT2oLqL9D5agm0fv27nesKis+gI2qtSx/3n2dtse3aPkIi37rbYBLAO1XDRpLrVL+JzxK+h34MLUg9EIo/82Lwp9bRqLxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d81bc8ec0cso64459555ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 18:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745199692; x=1745804492;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGCsgQ3fW7dHGeFFquVgDVA1vLF2BCW4j6jk4y1U+wc=;
        b=UnJpIek1XI14bU52E6GlCrTz7bGfb1vhtU7QSGwHTFoCteSDor6utr8nirgpymd1kQ
         i2g8OrCcMxAygntxWxYi9KM28NbXrzyIAIEAMvLK6qr0pqOycx9y9BT0NvPybAf9sWkn
         VRBdlIlwjk1tAk40mgtwYq/H6MWN6sDV4qxsPnU0rCD3XcnMI0sKqo0bvN+eUgoG6zy2
         6DaH17HQA6xZ5qG/hJzBFBG+o0mF/Kfka3yueEvbRZ8DmAlJQ/rJOvb+GMLNTP8PFTGc
         L/K9YdxrDPm/WWi64Y3vP6hk6k8r4DjRKnOfSjvLi/g5VnqLMvIEel5FQQDervxzbR18
         JNew==
X-Gm-Message-State: AOJu0Ywe2AcDIo8xTMKvWoA0xYQQyCe65uWyYlg40wSXHo/VkR+GP87f
	qqtNLcsm+ji23Y1fF3I03R8oSvoWt1Ddd57UIvzAWkTpY8v8cyqXF6so3CskOriVeLdXPSQiRv/
	zFSQKCm6yecrOKeiFUM3QRlIAHbRBC+2ILz1FUt9VYc8m60uLxUnFQa0p8Q==
X-Google-Smtp-Source: AGHT+IGvHrk83jWvIUFoetYe4x+0PcitbWDVOFG9zbYToNnXsnXB9WD0JdCmDmRFGXsq/wMzBoh6Nyq+5C82RrLyq8dAh5CD38+N
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c24f:0:b0:3d0:19c6:c9e1 with SMTP id
 e9e14a558f8ab-3d88ee00454mr89867685ab.13.1745199692247; Sun, 20 Apr 2025
 18:41:32 -0700 (PDT)
Date: Sun, 20 Apr 2025 18:41:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6805a24c.050a0220.4e547.000b.GAE@google.com>
Subject: [syzbot] [media?] BUG: corrupted list in az6007_i2c_xfer
From: syzbot <syzbot+0192952caa411a3be209@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ac71fabf1567 gcc-15: work around sequence-point warning
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10b4cc70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a7c679f880028f0
dashboard link: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16fedb98580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10edf4cc580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d368be8878a6/disk-ac71fabf.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cc783efdaf4c/vmlinux-ac71fabf.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d04c29c82c67/bzImage-ac71fabf.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com

usb read operation failed. (-71)
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in drivers/media/usb/dvb-usb-v2/az6007.c:821:30
index 4096 is out of range for type 'unsigned char [4096]'
CPU: 1 UID: 0 PID: 5832 Comm: syz-executor328 Not tainted 6.15.0-rc2-syzkaller-00493-gac71fabf1567 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x11c/0x160 lib/ubsan.c:453
 az6007_i2c_xfer+0x549/0xc30 drivers/media/usb/dvb-usb-v2/az6007.c:821
 __i2c_transfer+0x6b3/0x2190 drivers/i2c/i2c-core-base.c:2259
 i2c_transfer drivers/i2c/i2c-core-base.c:2315 [inline]
 i2c_transfer+0x1da/0x380 drivers/i2c/i2c-core-base.c:2291
 i2c_transfer_buffer_flags+0x10c/0x190 drivers/i2c/i2c-core-base.c:2343
 i2c_master_recv include/linux/i2c.h:79 [inline]
 i2cdev_read+0x111/0x280 drivers/i2c/i2c-dev.c:155
 do_loop_readv_writev fs/read_write.c:845 [inline]
 do_loop_readv_writev fs/read_write.c:833 [inline]
 vfs_readv+0x6bc/0x8a0 fs/read_write.c:1018
 do_preadv+0x1af/0x270 fs/read_write.c:1130
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4d458f3929
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe002f51e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00007ffe002f5230 RCX: 00007f4d458f3929
RDX: 0000000000000001 RSI: 00002000000025c0 RDI: 0000000000000004
RBP: 0000000000000000 R08: 000000000000007e R09: 00007ffe002f5230
R10: 0000000000000002 R11: 0000000000000246 R12: 00000000000f4240
R13: 00007ffe002f54b8 R14: 00007ffe002f521c R15: 00007ffe002f5220
 </TASK>
---[ end trace ]---


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
