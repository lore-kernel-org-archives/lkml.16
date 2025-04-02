Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8587E1FC3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743552023; cv=none; b=oURhC3xP9P1c2LwUpkXizKYvmABMGbUcNoKaxjB4oceHiLafVb9wjWz8mUf4EoFwkiY+oBo88Njbyk6eQvh0hEWO9P1ykMy3uX1lc+f8NFpJPgiOVPg8QwKxKhz3CUVE7f6A1RoZazIxbKbjufkeYtxY3ogTG+riPKmV1vRNHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743552023; c=relaxed/simple;
	bh=TDBxjMbF0Wv3pIZT4JptjBiJF2mVypKMtW/0cBwzVH0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lLOBMkFoeAZaouGXPi1VTaC/WF7aOOeQ9Sm5neEHfK/Ralsyhkyv5kpDjl4NdEiuHGa80kggKzXUplodrw+80Q0wvEB/Dqa06iPACuOsyCFVNQ22kC7pnpfHR8+C+azJ+cx4ThoRlBvOk3/GlkS5kuwZZMeEZwWcVQT7TDUyOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d5b3819ff9so57232215ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 17:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743552020; x=1744156820;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GsM3Ilm2N3CBIYDrmEbMx4uh1PJkyy+Bbjo8v8OIzH8=;
        b=Pkzwdxqy+9YS/+jZgiR3WELIDgsWd4A6vnv6qoHfl+DUfRyeuJtUPzxXWgRBOPDuSq
         5IeMU96VJdsMeyPu3XW0PHmyozOuSi7l8ATckf6mcub6rUxxhA0ln4reN4u83zBOjjH0
         nJvPkNVq5gjCaG0LCPrnT7nbP4dIFyj6kw4nNeu7AysuDZYPPe0S3TOB7KtUM6Uc+N4J
         ozy70js4qxo+hqEl5Ha6H0pYelw6feN24NCnXp1eCTHA+jH7sJNAdgxjUASy1cEe2Skb
         JMCukyZtoPpr7T1yyOXNgGPUBSN3XZRIQavqeNIv3VvH/Tp5BwaaY8DYDDH+Q+tb2IYw
         hdTg==
X-Forwarded-Encrypted: i=1; AJvYcCVcBWZ/shz0E++cS3cl039BYWmguLGtyUkMw3TVeWqLISqLZc3ZWij2dweSGqARNabKM39RPz5hlnV27No=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd89ioYYs4zqG9ud2VqbvZ3ycADaSck1salSNlSoEFHcZ7+H0l
	Hb4XjGSoDbUAepTuUlbt1y+pQkW3jS0B4QWiBgQP4C+cLqn2+ySYfkk6umSMbLU22D9NPxcbydG
	TJeY3QI9wi6sG2bmwcXWPIFcsIM0kES74a+nowgoJ5Z8vsLYz9ELz5fk=
X-Google-Smtp-Source: AGHT+IHeZKlpXHH1suOWjsbDsdSn84HHpn0TaUzLiOwfkGj943XDNLMffuhXk6TJOAS1x1S/0YTZ4f3JLmdC8mvSh96YQiSAILA6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:746:b0:3d3:f27a:9101 with SMTP id
 e9e14a558f8ab-3d5e08e9ec2mr181422665ab.1.1743552020538; Tue, 01 Apr 2025
 17:00:20 -0700 (PDT)
Date: Tue, 01 Apr 2025 17:00:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ec7e14.050a0220.31979b.0031.GAE@google.com>
Subject: [syzbot] [f2fs?] kernel BUG in f2fs_write_end_io
From: syzbot <syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4e82c87058f4 Merge tag 'rust-6.15' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17007198580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4253e469c0d32ef6
dashboard link: https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5e6f1c2744e3/disk-4e82c870.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5c1a60744d62/vmlinux-4e82c870.xz
kernel image: https://storage.googleapis.com/syzbot-assets/228bbd75bd12/bzImage-4e82c870.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/data.c:358!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 23 Comm: ksoftirqd/1 Not tainted 6.14.0-syzkaller-10892-g4e82c87058f4 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:f2fs_write_end_io+0x77a/0x790 fs/f2fs/data.c:357
Code: e8 8b 01 f2 fd e9 a2 fa ff ff 89 d9 80 e1 07 38 c1 0f 8c fe fa ff ff 48 89 df e8 11 01 f2 fd e9 f1 fa ff ff e8 87 92 8b fd 90 <0f> 0b e8 8f d4 ed 07 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
RSP: 0018:ffffc900001d79c0 EFLAGS: 00010246
RAX: ffffffff8437d9e9 RBX: 0000000000000000 RCX: ffff88801da85a00
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 000000000000000a
RBP: ffffc900001d7ac8 R08: ffffffff8437d696 R09: 1ffffd400012b785
R10: dffffc0000000000 R11: fffff9400012b786 R12: 0000000000000001
R13: dffffc0000000000 R14: 000000000000000a R15: ffffea000095bc00
FS:  0000000000000000(0000) GS:ffff8881250e5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd1b21f9438 CR3: 000000007b684000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 blk_update_request+0x5e5/0x1160 block/blk-mq.c:983
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1145
 blk_complete_reqs block/blk-mq.c:1220 [inline]
 blk_done_softirq+0x100/0x150 block/blk-mq.c:1225
 handle_softirqs+0x2d6/0x9b0 kernel/softirq.c:579
 run_ksoftirqd+0xcf/0x130 kernel/softirq.c:968
 smpboot_thread_fn+0x576/0xaa0 kernel/smpboot.c:164
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_write_end_io+0x77a/0x790 fs/f2fs/data.c:357
Code: e8 8b 01 f2 fd e9 a2 fa ff ff 89 d9 80 e1 07 38 c1 0f 8c fe fa ff ff 48 89 df e8 11 01 f2 fd e9 f1 fa ff ff e8 87 92 8b fd 90 <0f> 0b e8 8f d4 ed 07 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
RSP: 0018:ffffc900001d79c0 EFLAGS: 00010246
RAX: ffffffff8437d9e9 RBX: 0000000000000000 RCX: ffff88801da85a00
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 000000000000000a
RBP: ffffc900001d7ac8 R08: ffffffff8437d696 R09: 1ffffd400012b785
R10: dffffc0000000000 R11: fffff9400012b786 R12: 0000000000000001
R13: dffffc0000000000 R14: 000000000000000a R15: ffffea000095bc00
FS:  0000000000000000(0000) GS:ffff8881250e5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd1b21f9438 CR3: 000000007b684000 CR4: 00000000003526f0
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
