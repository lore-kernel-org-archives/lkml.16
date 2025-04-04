Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6121EB9F3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772051; cv=none; b=XHxz0F+U7XvcHUeds4+tnVRldQ9ZmxxwxJBNy+39EN5jeGS8bR8mBfg7rSadUvTUL/4W42ikaWFH+t5BtsU49D2G1lhboHsQWWbZFHzKAf/NEHoH8tjH7hFHJumzW2/7c9r1dxbEIouXC95oRfm9iIm/mFPIBX1g96/DOjpW0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772051; c=relaxed/simple;
	bh=b460eaMumXzkg/SNmcj5g/lTtxf6atouOuWCUnjaMYw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hrrJZPWWJ0V+MO7UMgcgrYXHwh7alGxN2EXdRgsHmLx/ZQS5QfXq++IDVJ+DRwM5Ihe3trfdRroTcdE0sJ0K6kRuZoV7G0/ZeAn0HeMp46I4H3yCS5hTHro7K1fAV/2c9dPuXU/4JMroQTzG/bAbjGYNWE1JKvnYXA2uWHogXZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d443811ed2so33158545ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 06:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743772048; x=1744376848;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1fvMCY2JUJRG87qPby/oGePzuL1QA+lz/AMwwbDcE0=;
        b=KP1Xh9Lza+uGWYYLzU+vi37TP85cvNmd3e793O49F8L9uOJg8Q9s8Oyq0+5qlzB9Cc
         5YOjh2CF0ovUIXI6iz+oAkPMgSTExPj5J5Sex/uBXXitMQrpg0grlMw8/yxy0HHsr0OL
         h+Kh6T3XcUXrhGJ2faQ0WltICUMOeml8gcU/Et0zrEIEP1E+mjRRyyQXWd+dcQlLb0wn
         dKP9CAWnEwvEY6ELGRV81JbTuPK6LAKU5FAo8aSuSrJKHrOKJC49XTCAAEysNntr9hix
         HoaBjEy32r0/9RoS8lVyHZgkksYTlWC8i0k6Xip3MqM2copZFemmHsScvG35gIn89CBb
         7dGw==
X-Forwarded-Encrypted: i=1; AJvYcCXGJ1qeMedGv6JXeh5/rkXmndLl5RWVSd4DZhs1tnLY99e+MyuqSUM4O9gflHzGo2pFWZ+UxxzX59n1z5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz93gIkyDhVbikbZ95VpdqANtBmcn9MZdcKRdhEbxq/4agcWzNF
	lTHUvfycdIUzyyKAsFOa6B5Q4NQVDa1DCqE5lF8wD0W9VNiYZuNXJlH/HrnOzu7vYlVnTBwUS25
	cHqxKecGEJR+ECawDgOJvQT4cArd7xwga4LNOc98f0Ik3O2RbWLNzblw=
X-Google-Smtp-Source: AGHT+IGHrGv4gMDgf/BkqiwxQXwKZW9su5+LUh5CNYr3E8KbZRXr+gwIqFcuZmZ7O73uMjUrZtYhg9eGQAsB3jaGj9W6RrtaaIej
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2505:b0:3d4:3fed:81f7 with SMTP id
 e9e14a558f8ab-3d6e3f8a346mr36349305ab.19.1743772048294; Fri, 04 Apr 2025
 06:07:28 -0700 (PDT)
Date: Fri, 04 Apr 2025 06:07:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67efd990.050a0220.2dd465.0212.GAE@google.com>
Subject: [syzbot] [f2fs?] kernel BUG in f2fs_truncate_hole
From: syzbot <syzbot+9ee4dac2dd49f4cbdefc@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4e82c87058f4 Merge tag 'rust-6.15' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11502404580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f8721be6a767792
dashboard link: https://syzkaller.appspot.com/bug?extid=9ee4dac2dd49f4cbdefc
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-4e82c870.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ccdcf680a51b/vmlinux-4e82c870.xz
kernel image: https://storage.googleapis.com/syzbot-assets/90fe1b8516ea/bzImage-4e82c870.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9ee4dac2dd49f4cbdefc@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 131072
=======================================================
WARNING: The mand mount option has been deprecated and
         and is ignored by this kernel. Remove the mand
         option from the mount to silence this warning.
=======================================================
F2FS-fs (loop0): Invalid segment/section count (31, 24 x 150994945)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): Try to recover 1th superblock, ret: 0
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
------------[ cut here ]------------
kernel BUG at fs/f2fs/file.c:1207!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5327 Comm: syz.0.0 Not tainted 6.14.0-syzkaller-10892-g4e82c87058f4 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:f2fs_truncate_hole+0x511/0x520 fs/f2fs/file.c:1207
Code: 00 65 49 8b 07 48 3b 84 24 e0 00 00 00 75 1d 89 d8 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc e8 00 1b 99 fd 90 <0f> 0b e8 68 3c 03 08 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc9000d4076c0 EFLAGS: 00010283
RAX: ffffffff842a6210 RBX: 0000000000000000 RCX: 0000000000100000
RDX: ffffc9000e52a000 RSI: 00000000000034f7 RDI: 00000000000034f8
RBP: ffffc9000d4077f0 R08: ffffffff842a607d R09: 1ffff110088e93ee
R10: dffffc0000000000 R11: ffffed10088e93ef R12: 0000000000100000
R13: dffffc0000000000 R14: 00000000000006c0 R15: ffffc9000d407740
FS:  00007f8796bba6c0(0000) GS:ffff88808c5b1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f9428395ed8 CR3: 0000000033d36000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_punch_hole+0x250/0x2a0 fs/f2fs/file.c:1266
 f2fs_fallocate+0x588/0xa10 fs/f2fs/file.c:1967
 vfs_fallocate+0x627/0x7a0 fs/open.c:338
 file_ioctl fs/ioctl.c:-1 [inline]
 do_vfs_ioctl+0x2057/0x2750 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8795d8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8796bba038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f8795fa5fa0 RCX: 00007f8795d8d169
RDX: 0000200000000480 RSI: 0000000040305829 RDI: 0000000000000007
RBP: 00007f8795e0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f8795fa5fa0 R15: 00007ffe1a19b818
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_truncate_hole+0x511/0x520 fs/f2fs/file.c:1207
Code: 00 65 49 8b 07 48 3b 84 24 e0 00 00 00 75 1d 89 d8 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc e8 00 1b 99 fd 90 <0f> 0b e8 68 3c 03 08 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc9000d4076c0 EFLAGS: 00010283
RAX: ffffffff842a6210 RBX: 0000000000000000 RCX: 0000000000100000
RDX: ffffc9000e52a000 RSI: 00000000000034f7 RDI: 00000000000034f8
RBP: ffffc9000d4077f0 R08: ffffffff842a607d R09: 1ffff110088e93ee
R10: dffffc0000000000 R11: ffffed10088e93ef R12: 0000000000100000
R13: dffffc0000000000 R14: 00000000000006c0 R15: ffffc9000d407740
FS:  00007f8796bba6c0(0000) GS:ffff88808c5b1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005648f9c017f8 CR3: 0000000033d36000 CR4: 0000000000352ef0
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
