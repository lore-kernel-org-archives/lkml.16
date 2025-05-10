Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B6A12E7E
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 17:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746897091; cv=none; b=ORzo/P3YtHx71POG6Ao/2LxwFcz/w6wL4Wa5YBqjsak/9eGa22AW8I81MYUSuutNXTq4ptJzRBHO2jZmJZUlosEOWo9DGVL1R+Fi+61ilEV+R3uAFtVqVEB7ELPnELj9I6Op0Z+riY1wU9iM663zUSG96115LeI4KkisTfUoSo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746897091; c=relaxed/simple;
	bh=COE0bwExTnDR7aj8AZSHx9soREfc9qSKBBxV2LTKqlg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ovYS7/z+/zIxhy7877nBS4utL85NQzFN3g5AyREZ7XMYKffQRrNJB69qle8/GhxMxE3CSVQWH4OadTEeX/sJfFHtUlxw+qFm4Im4igRJ9riXHWAi0OUm31NY9HOYYvHoTAIIFSW5yD8BiWm0wiN5CdOceJiVtloKy2ZjlPAadws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-85e7f5129d5so254168139f.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 10:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746897089; x=1747501889;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COwvpBWd3FCZbEAuZoOB9J5V6BAFQM6+VCXcOo5OATw=;
        b=ZBxO/oP/Tn6SyGPj3sZZ/Jhwf1CQA+ZvRSTg8x3zdDXM6W/7eYNU02QfN3YSkZqwDK
         epaAkmlOsX1z5RrMVcKL7w9qzm6aAdCMTRNoD/qwd3hCyQwKiw2P7dXNO1PZdpuKGrao
         nqJf5I1fOO6+5ZgDW8Ee3dMkLhSEPUsf1jE/sknBPbFoiEK4cgBgLUK789BECsQEEf25
         UDuCMGLHVF+MxPYpRdi2L8P1Zt/uywXKUVBK7pR91TvwDVDYpP6+uAJ51AoKpLB6SbDN
         M71vwkXpdSx/s5liU2eqJNe/qQuCwodsevvS0ntyzwnQ6dBfZdhLaNHEZnGiMI4zjBfP
         cKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqbMG5te3+Wb2a+JVWb5MXYBuqMIxZTgzr0UYhb4LNQ1+wdDYhXB5q4ykg/zGUB0yIBuA1eZGwxGoTGKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMTbQUIu0X32qA7nwoIAEcuqjr95BdiELa/0y4jQ7F9cz4wmS
	k/8Kcm9OALgQ5XZ2edjkBh3WVZSrg3MTWUihu7m5y63EqsL9Tey1VA3/NOEYnF+5IqAHw3yIr+/
	yAqNFeEWmEtnqs2DmbOJKHoGX5ZeWZx6R48PETMQqMk0IWEXdnuakeUo=
X-Google-Smtp-Source: AGHT+IGnao0VuKcsQfYsUeMVDVbg9cPK4xiTiMstQgacxJ1cghfBb6r9jiHpVyeOm/5EnbObLJ9VKZLQNLf+K8qYfKy0GDkYj02v
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:168c:b0:3cf:bac5:d90c with SMTP id
 e9e14a558f8ab-3da7e20dde8mr101161715ab.18.1746897089276; Sat, 10 May 2025
 10:11:29 -0700 (PDT)
Date: Sat, 10 May 2025 10:11:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681f88c1.050a0220.f2294.0014.GAE@google.com>
Subject: [syzbot] [hfs?] WARNING in mark_buffer_dirty (7)
From: syzbot <syzbot+2327bccb02eef9291c1c@syzkaller.appspotmail.com>
To: frank.li@vivo.com, glaubitz@physik.fu-berlin.de, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	slava@dubeyko.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0d8d44db295c Merge tag 'for-6.15-rc5-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1513e8f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=2327bccb02eef9291c1c
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103904d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1313e8f4580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-0d8d44db.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/560a4d87ba79/vmlinux-0d8d44db.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2767d37c74f0/bzImage-0d8d44db.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/237a200bd337/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2327bccb02eef9291c1c@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 5313 at fs/buffer.c:1186 mark_buffer_dirty+0x2a9/0x410 fs/buffer.c:1186
Modules linked in:
CPU: 0 UID: 0 PID: 5313 Comm: syz-executor161 Not tainted 6.15.0-rc5-syzkaller-00032-g0d8d44db295c #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:mark_buffer_dirty+0x2a9/0x410 fs/buffer.c:1186
Code: 4c 89 f7 e8 79 0d de ff 49 8b 3e be 20 00 00 00 5b 41 5c 41 5e 41 5f 5d e9 c4 34 fc ff e8 cf 18 7c ff eb 8c e8 c8 18 7c ff 90 <0f> 0b 90 e9 95 fd ff ff e8 ba 18 7c ff 90 0f 0b 90 e9 bf fd ff ff
RSP: 0018:ffffc9000d26fce0 EFLAGS: 00010293
RAX: ffffffff8243b788 RBX: ffff888047493ae0 RCX: ffff88801f494880
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
RBP: 1ffff11003bf1001 R08: ffff888047493ae7 R09: 1ffff11008e9275c
R10: dffffc0000000000 R11: ffffed1008e9275d R12: 0000000000000000
R13: dffffc0000000000 R14: ffffffff829851d0 R15: ffff88801df88780
FS:  00005555720f8480(0000) GS:ffff88808d6cb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffedcb1fd28 CR3: 00000000432ad000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 hfs_put_super+0x49/0x60 fs/hfs/super.c:51
 generic_shutdown_super+0x132/0x2c0 fs/super.c:642
 kill_block_super+0x44/0x90 fs/super.c:1710
 deactivate_locked_super+0xb9/0x130 fs/super.c:473
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1435
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 resume_user_mode_work+0x5e/0x80 include/linux/resume_user_mode.h:50
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x9a/0x120 kernel/entry/common.c:218
 do_syscall_64+0x103/0x210 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0854de79f7
Code: 07 00 48 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffedcb1ed38 EFLAGS: 00000202 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f0854de79f7
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffedcb1edf0
RBP: 00007ffedcb1edf0 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000202 R12: 00007ffedcb1fe60
R13: 00005555720f97c0 R14: 431bde82d7b634db R15: 00007ffedcb1fe80
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
