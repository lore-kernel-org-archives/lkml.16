Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264274A35
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745767024; cv=none; b=TsVmIk+7ZLfv5hmenLIxKJKYXCQXbud+qEroXrwJqej4R9YYcOl7L35z7lPt7JOC9TC01bTppwYb9kUlVXf1guBpVkIMENJB00tSfraIktefTgmqyxx8K7b66XyLJ0d9Q4rnsUXgZ3k1cFiM8xJw30Ps2rYfypAzxkkCAy0KlqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745767024; c=relaxed/simple;
	bh=ePpE7z/9DgUZP6tJLjhksKQ3iGzTeU6M4qVbhu45sME=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=i0mN61Q0pkuAuqu71sdAn1oDBhPPdseBsIAeujE8JAboCCXiuV7AvhJOfmWBTomLF+VWeaxwoqIStQvsdCTvunBsB1LZ0VUZ9qOd3qRr8joYz5EBFiVVPyQHQWy9UCmKGhOE2YXQP0n+1pYNq1EfX4DAocTQCRFb4GHu0Quvyhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86186c58c41so395764239f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745767022; x=1746371822;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WK3YNHbOmU5/IJR0IQYo1hH+cNryIJsH9yzzoPTOCQg=;
        b=WZOmYy0f/5TllV5sVTTWuNo0u14gbntrKjTzwrPvzEzQ4spogT1qi4ofb2G6+qe9p5
         emuLfWAowwOstlEBr3URuVGnrxgZjmbNA+QNWM59SHSxCRut+YDH8KA5b/C/qx/8GA8j
         bkeQDEx3mrNOPbsmZU2AuTsyYuawbnIEAJsaOZ0FQE3KpsG89igzqXFQ4E4XGv5tPrsD
         sDz3A0rDO1JI2qHjQh43mTJhhxeRKLZMO3pbnE2blxDwKjdvBSfz8DUtB3lJVxlwyLT4
         iueYN/sG/N96aj6OzY1GFzsYaj/nlRO6Pxx+5m/goleNiZm1BhI8+w3seYSPajTd42Hi
         atQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxA+09fGNgt7zA1p+3tiuBTD5lEt4GgoeuVp7L1zF2gFZ5idG0Ca0FQPFvT8g/cem8GeHb1BY0OfX2nUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPi9IpRr5c9x8rjHPVcveIbpj+BVfqiuhRHoqm9qDh0YlrF9be
	s7u11c4BqG6dnvppR6fg2WEkKKXrLo13bKHrSIHB4+4tCgMz4Iwn7SbKTR7zV4vVmXA6+tqYuyh
	6wTeaKws0IB1KV/6AwtoQlYU8um+S2Cd5WFTEOaj2v1hsqvDjHVoG9mE=
X-Google-Smtp-Source: AGHT+IFp6ddZP1dI1MR3GrHmMVCPxu64UKhAtRrdfOpxhbWO4n/w8tXWaj8/HYZ/Xa+1ASIlI2QQMYPjc40N9Ky0j+0/2dVdphhh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:642a:b0:85b:476e:ede2 with SMTP id
 ca18e2360f4ac-86467fd50femr564329839f.13.1745767022228; Sun, 27 Apr 2025
 08:17:02 -0700 (PDT)
Date: Sun, 27 Apr 2025 08:17:02 -0700
In-Reply-To: <20250427150435.83816-1-duttaditya18@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680e4a6e.a70a0220.23e4d2.0026.GAE@google.com>
Subject: Re: [v6.1] UBSAN: array-index-out-of-bounds in xtInsert
From: syzbot <syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com>
To: duttaditya18@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-lts-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
kernel BUG in jfs_evict_inode

------------[ cut here ]------------
kernel BUG at fs/jfs/inode.c:169!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 4893 Comm: syz-executor Not tainted 6.1.135-syzkaller-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:jfs_evict_inode+0x42d/0x430 fs/jfs/inode.c:169
Code: ea fe e9 e0 fd ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c 17 fe ff ff 4c 89 f7 e8 cd 86 ea fe e9 0a fe ff ff e8 a3 18 99 fe <0f> 0b 90 41 57 41 56 41 54 53 48 89 fb 49 bc 00 00 00 00 00 fc ff
RSP: 0018:ffffc90003297ac0 EFLAGS: 00010293
RAX: ffffffff82e7aafd RBX: ffff888069b5bbb0 RCX: ffff88807c185940
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888069b5bbb0
RBP: 0000000000000001 R08: dffffc0000000000 R09: fffffbfff2116e6c
R10: fffffbfff2116e6c R11: 1ffffffff2116e6b R12: dffffc0000000000
R13: dffffc0000000000 R14: ffff888069b5b838 R15: ffff888069b5bd80
FS:  000055557828c500(0000) GS:ffff8880b8f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe798659440 CR3: 0000000029455000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 evict+0x485/0x870 fs/inode.c:705
 dispose_list fs/inode.c:738 [inline]
 evict_inodes+0x604/0x690 fs/inode.c:792
 generic_shutdown_super+0x93/0x340 fs/super.c:480
 kill_block_super+0x7c/0xe0 fs/super.c:1470
 deactivate_locked_super+0x93/0xf0 fs/super.c:332
 cleanup_mnt+0x463/0x4f0 fs/namespace.c:1186
 task_work_run+0x1ca/0x250 kernel/task_work.c:203
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop+0xe6/0x110 kernel/entry/common.c:177
 exit_to_user_mode_prepare+0xb1/0x140 kernel/entry/common.c:210
 __syscall_exit_to_user_mode_work kernel/entry/common.c:292 [inline]
 syscall_exit_to_user_mode+0x16/0x40 kernel/entry/common.c:303
 do_syscall_64+0x58/0xa0 arch/x86/entry/common.c:87
 entry_SYSCALL_64_after_hwframe+0x68/0xd2
RIP: 0033:0x7f3f5d18e497
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffcbdc0ca48 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007f3f5d20e08c RCX: 00007f3f5d18e497
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffcbdc0cb00
RBP: 00007ffcbdc0cb00 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffcbdc0db90
R13: 00007f3f5d20e08c R14: 000000000002057a R15: 00007ffcbdc0dbd0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jfs_evict_inode+0x42d/0x430 fs/jfs/inode.c:169
Code: ea fe e9 e0 fd ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c 17 fe ff ff 4c 89 f7 e8 cd 86 ea fe e9 0a fe ff ff e8 a3 18 99 fe <0f> 0b 90 41 57 41 56 41 54 53 48 89 fb 49 bc 00 00 00 00 00 fc ff
RSP: 0018:ffffc90003297ac0 EFLAGS: 00010293
RAX: ffffffff82e7aafd RBX: ffff888069b5bbb0 RCX: ffff88807c185940
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888069b5bbb0
RBP: 0000000000000001 R08: dffffc0000000000 R09: fffffbfff2116e6c
R10: fffffbfff2116e6c R11: 1ffffffff2116e6b R12: dffffc0000000000
R13: dffffc0000000000 R14: ffff888069b5b838 R15: ffff888069b5bd80
FS:  000055557828c500(0000) GS:ffff8880b8f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6ce8dcd5e8 CR3: 0000000029455000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         535ec20c Linux 6.1.135
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-6.1.y
console output: https://syzkaller.appspot.com/x/log.txt?x=17c5e270580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f8907c20e9d898d8
dashboard link: https://syzkaller.appspot.com/bug?extid=6b1d79dad6cc6b3eef41
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1231a368580000

