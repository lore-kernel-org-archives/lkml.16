Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B1171C9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750127490; cv=none; b=cZGmALm+Smre/YwyDlYZwUBHWCeE40g4I3QH2cOncLkVlUf0035S8NyqsSxRsH3HbWMmbMTnP1qYelTCpYENCryrYkjeO7StTSDYaaLjAQZpQ9cGgzC7Y7Fmsic/PEioFerU9uQHDOP1sDiDbnbyptxghIhXXuhjbbvP4FembN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750127490; c=relaxed/simple;
	bh=p6kZzIdIozkt+BENNu5+VbNYxKxtJ1a2ToKv0G4dh2Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HKXUxKmD/1Qn2iO0OzrCVADdHl5k/eoSp8zTWahCsSVkKDXylQdXEZFqfPilMr2qfWTL0rQOwyEpxM5rr1x40brpSRJkK7+h+x+/VjiCYCoKrU4K/Wnd0SHRJ1JckvKvZ+J+TLE5vZNXSOESItuJAW0Hrwf9g4pCxn0DNNw8XIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddc65f95b8so110461325ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750127487; x=1750732287;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iICH6rGkCd0NMk5QLBV914Vt0rPaUBnhf5fohNbLyBA=;
        b=NyaUP+OxvMZNp8TUwEUC0+kPVocFqQU4tEx0PrJp1W6Hn7uBNHw7wmsm0wEdUJ2wLB
         3rnETFGq7FZTvfEo0ihCww/C2TJHWzDK349gyqV5BNjqAGhqqtZ0K8qRgWP2pdvwOYVl
         YHgosc4AejHAQ+jnEdVbQwsE3F43JfBvt3YUt0k1OsCRU0PTOpumHq9fHSuPZrkiJuAs
         07idwV8IfCJbGxmETZ+plM5H/oYSxmZZ8hj02oXfRG37m02RVflcA20vhAhX5dsfIf13
         s6/5LQjF6v7lS+Y0Qi0I83YH4DbysrVx0OwmLEHhYmZjTcT5AvJ66jHMXJhvQHrhnwi/
         RsUA==
X-Forwarded-Encrypted: i=1; AJvYcCUwqBq14rp0tUjOCg8KMzyg6B7KVJhaU7QUibZf0Yweny1OcBrYhaEdmXWkq/DorjQhnPjVBBzaaE/OXY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtUCKKevbu2/3R0RzMIyvHOuNlC5mlyc1Y+GkWNKWNoFkfKSlb
	O/Aae1KqhU2To22qs7GaycA3epBaXifwfQLG0+lkqjwHnarQNa/daVIHaNyB4CvQi+4PsfSPgIq
	dBZbVPT73sLUOF9E93F9uq3yeZri3ONp5gJ4bYdqbkNw1cgK01Lc6W2b0FKY=
X-Google-Smtp-Source: AGHT+IF5zYMUboyj8eAxrp3c74PsEWNVpNs0IZe3ofWVWAHz/ZMN4tQC557mWqcpG9ZeTG+I0683iCBzQU8eQ1aoQu7LmuB2bMkc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2143:b0:3dd:d178:9315 with SMTP id
 e9e14a558f8ab-3de07c414d8mr130321735ab.8.1750127487587; Mon, 16 Jun 2025
 19:31:27 -0700 (PDT)
Date: Mon, 16 Jun 2025 19:31:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6850d37f.a70a0220.395abc.01f9.GAE@google.com>
Subject: [syzbot] [jfs?] WARNING: fs/jfs/jfs_dmap.c:LINE at dbAdjTree, CPU: jfsCommit/NUM
From: syzbot <syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    050f8ad7b58d Add linux-next specific files for 20250616
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11e0190c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2efc7740224b93a
dashboard link: https://syzkaller.appspot.com/bug?extid=077d9ebda84f426a6a1e
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17aa1e82580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15e0190c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/49faa18d2f53/disk-050f8ad7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7c6f9cd7fe5d/vmlinux-050f8ad7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/84a08d6403ee/bzImage-050f8ad7.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/65c809c20ad8/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=178095d4580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: fs/jfs/jfs_dmap.c:2867 at dbAdjTree+0x454/0x4e0 fs/jfs/jfs_dmap.c:2867, CPU#0: jfsCommit/113
Modules linked in:
CPU: 0 UID: 0 PID: 113 Comm: jfsCommit Not tainted 6.16.0-rc2-next-20250616-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:dbAdjTree+0x454/0x4e0 fs/jfs/jfs_dmap.c:2867
Code: 5a ff ff ff e8 dd ed 81 fe eb 05 e8 d6 ed 81 fe 48 83 c4 28 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc cc e8 bd ed 81 fe 90 <0f> 0b 90 eb e1 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c e1 fb ff ff
RSP: 0018:ffffc90002de7988 EFLAGS: 00010293
RAX: ffffffff833e7c73 RBX: ffff88807806f010 RCX: ffff88801eb2bc00
RDX: 0000000000000000 RSI: 0000000000000155 RDI: 0000000000020056
RBP: 0000000000020056 R08: ffffea0001e01bc7 R09: 1ffffd40003c0378
R10: dffffc0000000000 R11: fffff940003c0379 R12: ffff88807806f018
R13: dffffc0000000000 R14: 0000000000000004 R15: 0000000000000155
FS:  0000000000000000(0000) GS:ffff888125c40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005555944916f8 CR3: 00000000736f2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dbJoin+0x238/0x300 fs/jfs/jfs_dmap.c:2835
 dbFreeBits+0x4e1/0xdb0 fs/jfs/jfs_dmap.c:2332
 dbFreeDmap fs/jfs/jfs_dmap.c:2081 [inline]
 dbFree+0x336/0x650 fs/jfs/jfs_dmap.c:398
 txFreeMap+0x7ff/0xde0 fs/jfs/jfs_txnmgr.c:2534
 txUpdateMap+0x308/0x9c0 fs/jfs/jfs_txnmgr.c:-1
 txLazyCommit fs/jfs/jfs_txnmgr.c:2664 [inline]
 jfs_lazycommit+0x43f/0xa90 fs/jfs/jfs_txnmgr.c:2733
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
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
