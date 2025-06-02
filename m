Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7C19CC1C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748904816; cv=none; b=ZU2oF5aADjjp12Kx2sRtJNdhDv/EFwgeNNL2tN7nBiqpVLY3lEJmiqb8ZQlIU19bDx7+V8/hbK89MkTYeceRdW57pzreE/gNQBKrMMGg6I8sjsC+BsOmVsiFWT43+FU36UnqLh2JzZTqcY7ZrenvWvpFjfWbgCvTxJZkRUPh/jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748904816; c=relaxed/simple;
	bh=PEJ3NZ/aqj5uNUieXGvZv/sDbEZjhqfLZR4i3mESdeU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=P73/JgU8UMOTENhEtVN4oph4dsRLT60ZoyOKfo4Dgk3p3i7XqygkyljoGJPlN/tHK2cV+D69WagyZ/jCa6C5P2TvuPpP5bHzfOe8LKgTjysU5OSWEhbSKvTsQH8wQiZpffsn8enA+eg6sdH3fjrLT2LfsFRqUx6oOoBYGfjkhEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3dd81f9ce43so53870035ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748904814; x=1749509614;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0P8CtH7DN52un8cx+9bTJnUvdBlcWBKsDNwQ3CQyZ24=;
        b=LFjEbWzIG5EcZ1TfdKOMCKZOnGO73seL5NxYpk7EranwrTcOiFU7syCMeczE1Uwhq1
         fUJRURkqiW5w1Dx+HbQkbm8aPNDqvnEPr0Utd2azqylSjnHhZjX60OuOIXKiJUZbwf+q
         j1ASqQuzJN6z61xmIKoy5AKkOLXYqFBLaeKB0E09dGK0MlyP3kOQ/PqB6wIoaR5J7m79
         9ZnrxYgaiMkwgnLjjfU8Nm3AzGFIxW1YYEqGy42UU+yKpHb4LNBoQ/gvKNDq7cXzj9t0
         PBOrCMTe13TCarQLn+MhhrO/LSSrypNhYv+JPGna7PpjlbvgoGqRNj//8ObCsEwRw+Tz
         y+lg==
X-Forwarded-Encrypted: i=1; AJvYcCU6bLfrRgSr1nAbN20ncbrrxuepj+pOgrBXbazuCN5zBlQ05GVrnYmj9mFPTkSfSBW5xyHIzBTRvVsWibI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTHNU9J85M6iIRHq7XlXL3hkjFmz2NqraM9O/E4p8wQe200DNW
	p4E1iZtRv7Ia+No7WA8NTtMi42wNuRZ6VEic8T61nCGot8xRk7AuxE3xD7edvmuUJZ0QgyUag4z
	DeAaP5IaxJ0Tvt9mrabSSgxla7OQ+iibRD0BoCODLJf3Pu4SgfFmELcWjvqc=
X-Google-Smtp-Source: AGHT+IElIJ4rSrLqt/xbRuyJj91nm9FjHtYkzaX1JyYdV8TylwJGLI4FunXbI7VWkg6Yd6iy4uxL5BgtslfGX/Ddq6e9BVzBTrvO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a25:b0:3d8:1d7c:e197 with SMTP id
 e9e14a558f8ab-3dd99be48a7mr174051315ab.7.1748904813742; Mon, 02 Jun 2025
 15:53:33 -0700 (PDT)
Date: Mon, 02 Jun 2025 15:53:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683e2b6d.a00a0220.d8eae.005b.GAE@google.com>
Subject: [syzbot] [gfs2?] kernel BUG in do_qc
From: syzbot <syzbot+bad65435361712796381@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e0797d3b91de Merge tag 'fs_for_v6.16-rc1' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15906482580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d8dc7eba91909b25
dashboard link: https://syzkaller.appspot.com/bug?extid=bad65435361712796381
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9c217b1391c8/disk-e0797d3b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/610d0945fbb8/vmlinux-e0797d3b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/873bcc0b4e15/bzImage-e0797d3b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bad65435361712796381@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: fatal assertion failed
------------[ cut here ]------------
kernel BUG at fs/gfs2/quota.c:320!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 1 UID: 0 PID: 15470 Comm: syz.7.1727 Not tainted 6.15.0-syzkaller-08297-ge0797d3b91de #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:__qd_hold fs/gfs2/quota.c:320 [inline]
RIP: 0010:do_qc+0x5c1/0x5e0 fs/gfs2/quota.c:705
Code: 00 00 00 00 00 fc ff df 48 8b 0c 24 80 3c 01 00 74 0a 48 8b 7c 24 10 e8 ed ac 2d fe 48 8b 44 24 10 48 8b 38 e8 00 9a 34 fd 90 <0f> 0b e8 38 8f ca fd 48 8b 7c 24 10 e8 ee 99 34 fd 90 0f 0b 66 66
RSP: 0018:ffffc90004897870 EFLAGS: 00010246
RAX: 000000000000002c RBX: 1ffff1100fcd880e RCX: 6b8263604adfeb00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffffffffffffff R08: ffffc90004897547 R09: 1ffff92000912ea8
R10: dffffc0000000000 R11: fffff52000912ea9 R12: ffff88807e6c4000
R13: ffff88807e6c4070 R14: ffff88807e6c4090 R15: 0000000000000000
FS:  00005555633cd500(0000) GS:ffff888125d64000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1ec997ed38 CR3: 000000005be83000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 gfs2_quota_change+0x394/0x800 fs/gfs2/quota.c:1304
 gfs2_free_di+0x2db/0x3f0 fs/gfs2/rgrp.c:2592
 gfs2_dinode_dealloc+0x30d/0x3e0 fs/gfs2/inode.c:497
 evict_unlinked_inode fs/gfs2/super.c:1332 [inline]
 gfs2_evict_inode+0xe0b/0x1000 fs/gfs2/super.c:1429
 evict+0x504/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 dput+0x19f/0x2b0 fs/dcache.c:911
 __fput+0x68e/0xa70 fs/file_table.c:473
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff80c58e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdc7ba0008 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 000000000015531b RCX: 00007ff80c58e969
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007ff80c7b7ba0 R08: 0000000000000001 R09: 0000000dc7ba02ff
R10: 00007ff80c400000 R11: 0000000000000246 R12: 00007ff80c7b5fac
R13: 00007ff80c7b5fa0 R14: ffffffffffffffff R15: 00007ffdc7ba0120
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__qd_hold fs/gfs2/quota.c:320 [inline]
RIP: 0010:do_qc+0x5c1/0x5e0 fs/gfs2/quota.c:705
Code: 00 00 00 00 00 fc ff df 48 8b 0c 24 80 3c 01 00 74 0a 48 8b 7c 24 10 e8 ed ac 2d fe 48 8b 44 24 10 48 8b 38 e8 00 9a 34 fd 90 <0f> 0b e8 38 8f ca fd 48 8b 7c 24 10 e8 ee 99 34 fd 90 0f 0b 66 66
RSP: 0018:ffffc90004897870 EFLAGS: 00010246
RAX: 000000000000002c RBX: 1ffff1100fcd880e RCX: 6b8263604adfeb00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffffffffffffff R08: ffffc90004897547 R09: 1ffff92000912ea8
R10: dffffc0000000000 R11: fffff52000912ea9 R12: ffff88807e6c4000
R13: ffff88807e6c4070 R14: ffff88807e6c4090 R15: 0000000000000000
FS:  00005555633cd500(0000) GS:ffff888125d64000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1ec997ed38 CR3: 000000005be83000 CR4: 0000000000350ef0


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
