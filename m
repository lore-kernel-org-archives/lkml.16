Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE592E370A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 10:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751712089; cv=none; b=NeB2QBVumjPYj+ITuLANZ9uSHlHwMJ4aungeMpIrRQjMi1NvbCXBuDhldBRiAF32uEJ1LKHUjgOj253EojTMqvNCUlAWecSxTyGycvkO4NRoM7NHIVyOh8cklKijOMxXxLLwO2KIyQXg+WbCECo2PNXK0QwLBubD7A032LfH2oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751712089; c=relaxed/simple;
	bh=/RhLLYvxKHFF5OPVoWBEwo1mq7KJuLOqFmQVhdxNXHE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qpqXIWXHvDDQF18tWp1D0PoGA8dId3OsYhcNNqsAdYH3jwn+GkT1GVN1PpgL2Nl3uJRyQM3PumvfMX7myHXELhObEXLWBbjsrCauNd5oE3GBftNcH/AHAPNUNUtgQkzWYVW48zW8AoZz/w8jGRwbZuS1c84ayPa+UeydqqysxSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so21862065ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 03:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751712086; x=1752316886;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqZ9MHD+QnaKr3b/fxeNCGHPwUWHdFsmYLRPk18oRHc=;
        b=MK552QeMWszSwgVfl6hQaP1KSp1Wq3bnZQHR2XJ3UGE7bCw5ts/99LKFGbdG2Mksex
         UC+3Y2A7X60fs13qicRzR6yT4xq0tAKHeVuT6o8iIF+cTycVz5EMP77APf3dFACjM5xb
         kObOSqXjD5k5FtTjSXZuMr2LwRlY/VptbX4eQMhJ9xohZy49F7hAutcR7Q2clfH3eGub
         uOcC56KIEWv6i5POJTj1UyQKDoBfsF5Srf4UyTmynk/e7TPWervJ/4x13LU096b5QL/c
         lXTFNj79/c2bB4hOW/ZN+HGAWRG66b8eb5e9INkorZMK+TIuEZztcwrEZQJC5vgQlo6X
         KvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1HqAj2T5sT3pPWoCOH6tID0lLgN4KiwrednwKRRk0IUeETNyhy2f0byXIlKBYuRWDXq8e0LdmKPmnbg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNPo0Cv0p0Nhr0h2E1rSZ+8peUFUSZRIxmnFGk5EhpdWCXU21
	mfGKowW7bbd6YikS0jJOvij+wOKXNSrs/RSw1nNZ0LHMsFeKDyjn4FbpaZeKnIfN21nau09hMcD
	JXKHsAjWkTFnHHMRJ/0skU4+OHTWjULE5HxwPd0Kr96PohmLkkgvGoPixXMU=
X-Google-Smtp-Source: AGHT+IFurqs7edK4Q98/CSTOloFi5ealOG89S1d5X6HpNnZ+3YscuFGqP5nBRIX2t3W4SVupSS+HP7iK/F0BmaU4lhw/l5Vz57DY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda6:0:b0:3dd:c4ed:39c0 with SMTP id
 e9e14a558f8ab-3e13ee8b79cmr17886035ab.1.1751712086694; Sat, 05 Jul 2025
 03:41:26 -0700 (PDT)
Date: Sat, 05 Jul 2025 03:41:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68690156.a00a0220.c7b3.0036.GAE@google.com>
Subject: [syzbot] [kernel?] general protection fault in pcl818_ai_cancel
From: syzbot <syzbot+fce5d9d5bd067d6fbe9b@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    26ffb3d6f02c Add linux-next specific files for 20250704
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1304cf70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c567bd5a036e49d
dashboard link: https://syzkaller.appspot.com/bug?extid=fce5d9d5bd067d6fbe9b
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11022c8c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1704cf70580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8d8ce9c14ce8/disk-26ffb3d6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4c33279b98ff/vmlinux-26ffb3d6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3c38b307a04c/bzImage-26ffb3d6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fce5d9d5bd067d6fbe9b@syzkaller.appspotmail.com

comedi comedi0: pcl818: I/O port conflict (0x4,16)
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000005: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
CPU: 0 UID: 0 PID: 5848 Comm: syz-executor349 Not tainted 6.16.0-rc4-next-20250704-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:pcl818_ai_cancel+0x69/0x3f0 drivers/comedi/drivers/pcl818.c:762
Code: 8b 1b 48 89 d8 48 c1 e8 03 42 80 3c 28 00 74 08 48 89 df e8 79 ca 34 f9 48 8b 03 48 89 04 24 49 83 c4 28 4c 89 e0 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 e7 e8 58 ca 34 f9 4d 8b 24 24 48 83 c3
RSP: 0018:ffffc90003ee79f0 EFLAGS: 00010206
RAX: 0000000000000005 RBX: ffff88802854df00 RCX: ffff888033bd3c00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88802f550000
RBP: 0000000000000001 R08: ffff88802f55012f R09: 1ffff11005eaa025
R10: dffffc0000000000 R11: ffffffff88efad60 R12: 0000000000000028
R13: dffffc0000000000 R14: ffff88802f550000 R15: dffffc0000000000
FS:  000055558ba6b380(0000) GS:ffff8881257af000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000558c02111000 CR3: 0000000072048000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 pcl818_detach+0x66/0xd0 drivers/comedi/drivers/pcl818.c:1115
 comedi_device_detach+0x134/0x720 drivers/comedi/drivers.c:207
 comedi_device_attach+0x568/0x670 drivers/comedi/drivers.c:1000
 do_devconfig_ioctl drivers/comedi/comedi_fops.c:855 [inline]
 comedi_unlocked_ioctl+0x686/0xf40 drivers/comedi/comedi_fops.c:2136
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f05c37a33e9
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd45c1fac8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffd45c1fc98 RCX: 00007f05c37a33e9
RDX: 0000200000000080 RSI: 0000000040946400 RDI: 0000000000000003
RBP: 00007f05c3816610 R08: 0000000000000000 R09: 00007ffd45c1fc98
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffd45c1fc88 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:pcl818_ai_cancel+0x69/0x3f0 drivers/comedi/drivers/pcl818.c:762
Code: 8b 1b 48 89 d8 48 c1 e8 03 42 80 3c 28 00 74 08 48 89 df e8 79 ca 34 f9 48 8b 03 48 89 04 24 49 83 c4 28 4c 89 e0 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 e7 e8 58 ca 34 f9 4d 8b 24 24 48 83 c3
RSP: 0018:ffffc90003ee79f0 EFLAGS: 00010206
RAX: 0000000000000005 RBX: ffff88802854df00 RCX: ffff888033bd3c00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88802f550000
RBP: 0000000000000001 R08: ffff88802f55012f R09: 1ffff11005eaa025
R10: dffffc0000000000 R11: ffffffff88efad60 R12: 0000000000000028
R13: dffffc0000000000 R14: ffff88802f550000 R15: dffffc0000000000
FS:  000055558ba6b380(0000) GS:ffff8881258af000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000005fdeb8 CR3: 0000000072048000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	8b 1b                	mov    (%rbx),%ebx
   2:	48 89 d8             	mov    %rbx,%rax
   5:	48 c1 e8 03          	shr    $0x3,%rax
   9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
   e:	74 08                	je     0x18
  10:	48 89 df             	mov    %rbx,%rdi
  13:	e8 79 ca 34 f9       	call   0xf934ca91
  18:	48 8b 03             	mov    (%rbx),%rax
  1b:	48 89 04 24          	mov    %rax,(%rsp)
  1f:	49 83 c4 28          	add    $0x28,%r12
  23:	4c 89 e0             	mov    %r12,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 e7             	mov    %r12,%rdi
  34:	e8 58 ca 34 f9       	call   0xf934ca91
  39:	4d 8b 24 24          	mov    (%r12),%r12
  3d:	48                   	rex.W
  3e:	83                   	.byte 0x83
  3f:	c3                   	ret


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
