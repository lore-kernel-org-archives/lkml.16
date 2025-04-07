Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DE322F155
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027829; cv=none; b=NA+t5zfGKVgCMe9l85oRJ0snr3MuA6aroFley4nJ81htjy2DjrkL73BwctL0FG+gCvzDTYqi2yVBfKw7Exm1j4Lqz3fzeNc08z8ApFW0yIlm8awOwKVX58lODJsp9LG5KfU3I66WrnfTgFKBxJYRJ2+4QwTZ5BeXw23cFWMdsKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027829; c=relaxed/simple;
	bh=o2PUEl1xK7F+0BpHbTouPhn+jOyVOVeoIMgDvtPcvfM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uZ/N+MiRR25uO4HNTFpkrRqNxMjJsmGKOJFh+i6Tj8iXcp87fSt4SeDQso5tYby74SegywujYnSrOdSKmAu5N11DplDEXTOaX2KjLFuYlcDuft7/HMEAm2nJZR00WLSCzFVggPGauqeSUTiqGp7ln7VRD7pLtJbe0v2B0MSBdCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d451ad5b2dso52484465ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 05:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027826; x=1744632626;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ek3zenkEspUnPBFxUqi4hppRRFoyjsM8PYzyIlaXi+M=;
        b=RzRkTEORr4rtFlS0yu5AtGJo6oELs+a/JufZjnYFifYVRx/AyXHTmwO8VmU6lXroga
         3ZhZrmiqv7jsYZgAZ9aFFU9/tg1HE2lqf3YAPAAfCa/XgbcDfpgF0p2zS+0CEpAUUYpq
         PWUCa01uWQhwWobucfKCEKIjzCYllYAX8sqnYs66eZIky9fz4AiRcXXJDvHoRg+55/HA
         yKQq7tlocrQNFzGc4na1S+pgZIy5YqhhxHb0KRryjE+uLBPTxgoZHxxsCwSc9rVAEO3C
         gcI/m7aeDINdVmKlso9V+8dnM5QXLjoCOjNHudfEiyahACH+TpSJiqSjiUgWNepchani
         TZUA==
X-Forwarded-Encrypted: i=1; AJvYcCWnYEY6/Zro7FAHuEpAlBRFeXqcZgC1HzRGFc0vKq0ZeuCtZnhSjPyUHh8V9n1rcLA9FzqU0EIt4wYGPu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxTx6YE3+7HbeMq+UFtNl5fsZx8b/2xVY7ysBLRXsjUEkmM4MO
	uEM0ShsThxmVXL7ddNr9iRCftIvv1ppgXM3PSHpitrtSOIaaj6pPKCewXaOJ78memLOSJmFa8/3
	EgHtUBeM9+yQfglpqODCyWqXx9v64FjByIBWZUiKhp8RiCdRR2giCwew=
X-Google-Smtp-Source: AGHT+IFYM5ksmjv1b4OvqMewkWsrKU9taPe63uEt219GP6/ajJ6mPw1jBDvuYCsKtLpSchTvjyEO2E9mY5CGHO+mOYX6kJJccGw4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e90:b0:3d3:f72c:8fd8 with SMTP id
 e9e14a558f8ab-3d6e3fea50fmr107239995ab.6.1744027826656; Mon, 07 Apr 2025
 05:10:26 -0700 (PDT)
Date: Mon, 07 Apr 2025 05:10:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3c0b2.050a0220.396535.0547.GAE@google.com>
Subject: [syzbot] [f2fs?] kernel BUG in dec_valid_block_count
From: syzbot <syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a1b5bd45d4ee Merge tag 'usb-6.15-rc1' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=174ffc3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6fe3b5e6a2cb1cc2
dashboard link: https://syzkaller.appspot.com/bug?extid=8b376a77b2f364097fbe
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=148427cf980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17c9f7b0580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-a1b5bd45.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8b14e02f603d/vmlinux-a1b5bd45.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cc06cac05b38/bzImage-a1b5bd45.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/697f78a4edc0/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=10ffca74580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/f2fs.h:2521!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5312 Comm: syz-executor407 Not tainted 6.14.0-syzkaller-12886-ga1b5bd45d4ee #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:dec_valid_block_count+0x3b2/0x3c0 fs/f2fs/f2fs.h:2521
Code: 8a 01 fe e9 80 fd ff ff e8 db 64 97 fd 48 c7 c7 60 6e 31 8f 4c 89 e6 48 89 da e8 39 aa 14 01 e9 73 fe ff ff e8 bf 64 97 fd 90 <0f> 0b 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000d39f078 EFLAGS: 00010293
RAX: ffffffff842bf2c1 RBX: 00000000fffffcda RCX: ffff88801f41a440
RDX: 0000000000000000 RSI: 00000000000003fa RDI: 00000000000000d4
RBP: 1ffff110082999f4 R08: ffffffff842bef72 R09: fffff52001a73e00
R10: dffffc0000000000 R11: fffff52001a73e00 R12: ffff8880414ccfa4
R13: dffffc0000000000 R14: ffff8880414cc000 R15: 00000000000003fa
FS:  00007f5c4fc216c0(0000) GS:ffff88808c599000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5c4fc00d58 CR3: 0000000043b00000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_truncate_data_blocks_range+0xc8c/0x11a0 fs/f2fs/file.c:695
 truncate_dnode+0x417/0x740 fs/f2fs/node.c:973
 truncate_nodes+0x3ec/0xf50 fs/f2fs/node.c:1014
 f2fs_truncate_inode_blocks+0x8e3/0x1370 fs/f2fs/node.c:1197
 f2fs_do_truncate_blocks+0x840/0x12b0 fs/f2fs/file.c:810
 f2fs_truncate_blocks+0x10d/0x300 fs/f2fs/file.c:838
 f2fs_truncate+0x417/0x720 fs/f2fs/file.c:888
 f2fs_setattr+0xc4f/0x12f0 fs/f2fs/file.c:1112
 notify_change+0xbca/0xe90 fs/attr.c:552
 do_truncate+0x222/0x310 fs/open.c:65
 handle_truncate fs/namei.c:3466 [inline]
 do_open fs/namei.c:3849 [inline]
 path_openat+0x2e4f/0x35d0 fs/namei.c:4004
 do_filp_open+0x284/0x4e0 fs/namei.c:4031
 do_sys_openat2+0x12b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_creat fs/open.c:1522 [inline]
 __se_sys_creat fs/open.c:1516 [inline]
 __x64_sys_creat+0x124/0x170 fs/open.c:1516
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5c4fc6c839
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 81 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5c4fc21218 EFLAGS: 00000246 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 00007f5c4fcf8608 RCX: 00007f5c4fc6c839
RDX: 00007f5c4fc6c839 RSI: 0000000000000009 RDI: 0000200000000080
RBP: 00007f5c4fcf8600 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f5c4fcc58f4
R13: 0000200000000100 R14: 0031656c69662f2e R15: 0000200000000080
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dec_valid_block_count+0x3b2/0x3c0 fs/f2fs/f2fs.h:2521
Code: 8a 01 fe e9 80 fd ff ff e8 db 64 97 fd 48 c7 c7 60 6e 31 8f 4c 89 e6 48 89 da e8 39 aa 14 01 e9 73 fe ff ff e8 bf 64 97 fd 90 <0f> 0b 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000d39f078 EFLAGS: 00010293
RAX: ffffffff842bf2c1 RBX: 00000000fffffcda RCX: ffff88801f41a440
RDX: 0000000000000000 RSI: 00000000000003fa RDI: 00000000000000d4
RBP: 1ffff110082999f4 R08: ffffffff842bef72 R09: fffff52001a73e00
R10: dffffc0000000000 R11: fffff52001a73e00 R12: ffff8880414ccfa4
R13: dffffc0000000000 R14: ffff8880414cc000 R15: 00000000000003fa
FS:  00007f5c4fc216c0(0000) GS:ffff88808c599000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5c4fc00d58 CR3: 0000000043b00000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
