Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4265B20F088
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833732; cv=none; b=EWR54gmMjjV0nLmE/q4GkBxQPCmlU5r1OUVtU5GgogSPn30ePKUB8U1x/f2WptE6msRnUJ/VbJE5ca0OrCX+VSzRSH9I55vNBgVYHnYAImbcexy1i/1s30ZtwO7IILyjRTJLgn26j49q3wyJjFUypuaV29fiWZu3F7XEW+eNTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833732; c=relaxed/simple;
	bh=EyA7K/UJkv0KDItC2B+aTPhx+w2ReP8awivRPgdNn4Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JUZBiCh7ZOQ4RRajjBCGBeEO8I+TOQAKzUEtcYfZrP80Z0PrZopKyBQ0xBe9bh34TaRPnHSgZyEsUfeULHp2xW4ikILi+/uyeaKQNgozQ7VyIy9QdGcVS5oVsqv3Chqywkz/xNsPkbFfvLephyjBxHch6lVGxIwpCPDmAmVLOoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ddce94383bso13343625ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749833730; x=1750438530;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfFfu5lbJJMNTBMo7YWpaTR16Ke8kLxIXpcVDPuOtVo=;
        b=nvcjBCHP5a+/zTzEgfmmTYbAt+My7hHdpAXT3eRgtFvtTM/YhD/p2Ijco/u+WO2ofc
         4G6X4f6VKRhx84vcHx8UQ5MyknVBHSwZdhkjrcy6tFRIG3DGNv5B59KVf//btOXWVtQ8
         xuESqsYKE/5SQs/O4zwgIqOprg6QKgZ+EhtkideRbYpFZRDYOooz6C0DsjYf1qRNQypH
         BHlvwQ08dJMAXFWjLrr6aJEfVFfG+RPECKXMvpV51uir4XRUN8HGwRgMPLSCxT2UcWcT
         XagSmZv0E6NBWNFlEMk7g0PcyXYiyz714PAUvSSvGrnGhpx/s5bqYQWkmyMRqFrDsEjQ
         jCyA==
X-Forwarded-Encrypted: i=1; AJvYcCUWFeK1AnDsGMpylhqzK2AIYjSq3d9YEpYrONmUI/W0/DJvLSyj/la1H03AP6osySY26wCQ10s/IQH5L94=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywee3jR/q4LR9W8s9v+FmNLJalB2zl3f0CTNVyeshDxdonJJ3AM
	uXN9AHs3b6ibiFgwofKgTyKOaawS5kNlNGlcN+UWkZy8URafb/qCUJ/HvQYC9e8F7ofpmvQKTFa
	W//9LAkTk0Dh6Ieu9X+Bx1D46TMOzgn1bTqwMOfQsGer8pKs1I3cDLuQg988=
X-Google-Smtp-Source: AGHT+IEPMNwQDBTk1kc1fwMXUQgBYdRHPXV1DL9UpCJJcu5v76uYq/XUmitmH3dNOQryCTN/hiFNDS9pCbq6wrF1xuBsFWyZfmuL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca4a:0:b0:3dd:b726:cc52 with SMTP id
 e9e14a558f8ab-3de07cdb48amr4834205ab.5.1749833730348; Fri, 13 Jun 2025
 09:55:30 -0700 (PDT)
Date: Fri, 13 Jun 2025 09:55:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684c5802.a00a0220.279073.0016.GAE@google.com>
Subject: [syzbot] [cgroups?] WARNING in css_rstat_exit
From: syzbot <syzbot+8d052e8b99e40bc625ed@syzkaller.appspotmail.com>
To: cgroups@vger.kernel.org, hannes@cmpxchg.org, linux-kernel@vger.kernel.org, 
	mkoutny@suse.com, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    27605c8c0f69 Merge tag 'net-6.16-rc2' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=103b1e0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89df02a4e09cb64d
dashboard link: https://syzkaller.appspot.com/bug?extid=8d052e8b99e40bc625ed
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/79ab1e186123/disk-27605c8c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d37bf85b966d/vmlinux-27605c8c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/eed2865abf8f/bzImage-27605c8c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8d052e8b99e40bc625ed@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 5887 at kernel/cgroup/rstat.c:497 css_rstat_exit+0x368/0x470 kernel/cgroup/rstat.c:497
Modules linked in:
CPU: 0 UID: 0 PID: 5887 Comm: kworker/0:5 Not tainted 6.16.0-rc1-syzkaller-00101-g27605c8c0f69 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: cgroup_destroy css_free_rwork_fn
RIP: 0010:css_rstat_exit+0x368/0x470 kernel/cgroup/rstat.c:497
Code: 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 0e 01 00 00 49 c7 85 70 05 00 00 00 00 00 00 e9 00 ff ff ff e8 c9 07 07 00 90 <0f> 0b 90 e9 3e ff ff ff e8 bb 07 07 00 90 0f 0b 90 e9 30 ff ff ff
RSP: 0000:ffffc9000b6afbc0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888057c7a800 RCX: ffff888124754000
RDX: ffff8880308b8000 RSI: ffffffff81b514e7 RDI: ffffffff8df26da0
RBP: ffff888057c7a808 R08: 0000000000000005 R09: 0000000000000007
R10: 0000000000000000 R11: 0000000000000001 R12: ffff888057c7a820
R13: 0000000000000000 R14: 0000000000000003 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124754000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b31b10ff8 CR3: 0000000079092000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 css_free_rwork_fn+0x80/0x12e0 kernel/cgroup/cgroup.c:5449
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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
