Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94D52E06EF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251393; cv=none; b=KlEgM04uYnU6z+HlSxw0DZun4uSpBPyalQdJIdWCasgz/1Uf2IUma5Mh880LFuANhNQFYWFKkml2gs4iQFgsbR6ew0+Edwz5cPn1wq5HHQzK8vTA5gnRboVpst+cfaDk17G5nG+vmqfaYc6CpZNVDUjx6Us9KFeEd9/ntDq+9Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251393; c=relaxed/simple;
	bh=utZGXz+CRzbLh3+/bbGoddZgrPh2dAWQJwXKJn/0Ja4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hsJ/pbaB4LSKTuX0zAOyFUCi/0yBt7qp2HRvjalyc5DJOrMXTbhV3MoAwQplluCBKaha4vQwBXfTkSoIT+bId3htsixVM64deSOn1GXlUbPl0ipUo19k8N/9CT8YTN6YFmWSHy3617iudFVFlJUiqT43M8tQU9QVGQzV1eLlVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddb4dcebfaso164863375ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251391; x=1750856191;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6WTwDnIgmKfZvMfMw20dGe0gV/z8jV3vrrVqMeVAUY=;
        b=VPDV76QYm+ANT84RHsn9iAjraaiS5W/LgfYfUI8L+TQM2kMSFjCYNpTHitdWMmwxJQ
         zk0bGSlV6QX2rXVaBcZKg8DoE5yWp2q5nIkddu9j54Wt1BOILM01lTllqrUnLjZBA2sx
         tRny5WUOH92qGT/2dNB5u5Ye/rJFEDmiPfK+391pZeV1mX2GT4gV1qsvOejY/YWo7kEb
         ijN1pyxod9D+z4bdG0uvcUNm9exIlWO2GrXIOWLiqOjbd3l1RRbNAMBzgTAq1Yd/iG9Q
         OUoFe80yRRrGPwffD9KKDNyG25i+B7feSSTPjMkCuCAWCn0J++p2x0PzRzP8iPvtU12m
         kIBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrnJx/6gS7Ld+E/016QMpGOSauqohVNpKJk5Uwt161Ox6d2LvB1BlBezWhESGb6B/eRLmASs/hPmsOTjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9GcDVGGOpL6jD+yiATSk/dF0GQqKVCtE1p/N65AkgvdsX7OJf
	oi1vy9USQVuAahuqaoAknewe/C+moWlMICfbY+XtGxThB/Um+fJabvd6PAXai4tuSRyIK57z/re
	4CW20ZBCcUI5PZkxSUELryGorQzepLwROb/GZSb2AOi5LFD5ITPc+MbUx5QY=
X-Google-Smtp-Source: AGHT+IHynHVv0EBbcxR/OcMYkwiO7D6iGIl4k02gZNBF4cwL7TPZs2TxT0BbcuumIEJRD0T0LfiXllFwvrzMmGIC1tPDwG5sAGNU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d9c:b0:3dc:8b29:309d with SMTP id
 e9e14a558f8ab-3de07c2728bmr191719985ab.1.1750251390961; Wed, 18 Jun 2025
 05:56:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 05:56:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6852b77e.a70a0220.79d0a.0216.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in __put_task_struct (5)
From: syzbot <syzbot+ca15a081ac6b8357d82c@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, bsegall@google.com, 
	david@redhat.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kees@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lorenzo.stoakes@oracle.com, mgorman@suse.de, mhocko@suse.com, 
	mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org, rppt@kernel.org, 
	surenb@google.com, syzkaller-bugs@googlegroups.com, vbabka@suse.cz, 
	vincent.guittot@linaro.org, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4663747812d1 Merge tag 'platform-drivers-x86-v6.16-2' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1626f90c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6f01a06a8393850
dashboard link: https://syzkaller.appspot.com/bug?extid=ca15a081ac6b8357d82c
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c9d5d4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ef27ce1c74bb/disk-46637478.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2962783b1956/vmlinux-46637478.xz
kernel image: https://storage.googleapis.com/syzbot-assets/faa841f27097/bzImage-46637478.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ca15a081ac6b8357d82c@syzkaller.appspotmail.com

RBP: 00007ff5f3810b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007ff5f39b5fa0 R15: 00007ffd192cb478
 </TASK>
------------[ cut here ]------------
WARNING: CPU: 1 PID: 6071 at kernel/fork.c:731 __put_task_struct+0x340/0x530 kernel/fork.c:731
Modules linked in:

CPU: 1 UID: 0 PID: 6071 Comm: syz.2.22 Not tainted 6.16.0-rc2-syzkaller-00045-g4663747812d1 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:__put_task_struct+0x340/0x530 kernel/fork.c:731
Code: f6 ac 41 00 be 03 00 00 00 4c 89 e7 e8 f9 c2 5e 03 e9 ed fe ff ff e8 df ac 41 00 90 0f 0b 90 e9 6d fd ff ff e8 d1 ac 41 00 90 <0f> 0b 90 e9 0b fd ff ff e8 c3 ac 41 00 90 0f 0b 90 e9 67 fd ff ff
RSP: 0018:ffffc90002fd7c50 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888026d18000 RCX: ffffffff8179d88b
RDX: ffff888032081e00 RSI: ffffffff8179db7f RDI: 0000000000000005
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffff888026d18000
R13: 1ffff920005faf96 R14: ffff888026d18028 R15: 0000000000000000
FS:  00007ff5f452f6c0(0000) GS:ffff888124861000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff5f3725b20 CR3: 0000000073166000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 put_task_struct include/linux/sched/task.h:145 [inline]
 put_task_struct include/linux/sched/task.h:132 [inline]
 io_sq_offload_create+0xe4b/0x1330 io_uring/sqpoll.c:517
 io_uring_create io_uring/io_uring.c:3747 [inline]
 io_uring_setup+0x1493/0x2080 io_uring/io_uring.c:3830
 __do_sys_io_uring_setup io_uring/io_uring.c:3864 [inline]
 __se_sys_io_uring_setup io_uring/io_uring.c:3855 [inline]
 __x64_sys_io_uring_setup+0xc2/0x170 io_uring/io_uring.c:3855
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff5f378e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff5f452f038 EFLAGS: 00000246 ORIG_RAX: 00000000000001a9
RAX: ffffffffffffffda RBX: 00007ff5f39b5fa0 RCX: 00007ff5f378e929
RDX: 0000000000000000 RSI: 0000200000000080 RDI: 0000000000000059
RBP: 00007ff5f3810b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007ff5f39b5fa0 R15: 00007ffd192cb478
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
