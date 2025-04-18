Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA242528EA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971546; cv=none; b=V2BJVnIy16igNRVLtbBFAwCfzNhoArKD7t4Xp5pnm2WdCosLQNZdYPw1vwxOT++qAMSJoX13fvLH6jOFMPsBRvg3DjCSKkep9W2yZClJ97ViWLYlvIYMEqA3r3eUOg4C7hTbpQZMaIB+KG0iQkJJpsyHHxtk6P8rmDdA5vPd74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971546; c=relaxed/simple;
	bh=95SfZOeYAeBnbtPj+ch2OlRTzEjL07zzmSFe0I3ojWY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OUDAIVeVjDN+63s+AIpTFKgP2gBW6xwiLeJxm/p1lxYX3mK2cBkfs5lYaGTzal/NGLG2+G1IE+A2MTps0hTJbbOcVZ9Kw8rSmC22ihi6xdMQMMn0P9TRjzXMZJpaPMMXS33Emj4c7YQxFusRemhvnNyhRQ8wtRQhHviUmJDta40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d44dc8a9b4so17956135ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971543; x=1745576343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGvdcpQTR+H9ML+IgvScLBjHWYqaU7DIkR0hwufUa/Y=;
        b=Dxcdr/FN6i+jV1CUGMdKMTMzABFW42ufb4jDTIroegjpU3vGGD4IwQSDHtkvVcARWC
         2ytRc9cwELkwjQusxOpV+WWO6SeIodGPrnsX3p1e1weRGIaV8kQvK4fHDopSB2P1GQed
         Ynn1suWXFu9pCURsGw4PN8KWEzyPLOrzcp61FFlVz5UYJgEHGtuad9sJsmyHx2AkhK9G
         rIgjzBQ2wLirEyMbErdvbSpkCh0w8qhYUiq8YXkKUNYXXKJVrzb8VDV32nv5Fhkx4cwB
         bDwVEwUwQ41tld60yVVKcZCvR7coRIP3subs8prA4NEAr8OQGVaXp/q+PkoBfQ/DIOk0
         6OZQ==
X-Gm-Message-State: AOJu0YwkZuHbt1EVYszdmqxHg/jErgSGZkVS1WshzauFjxelZ5RCQz4Q
	lX7/sBRypF1Ay6KEFAjOKdFoJ6m5kyaaOUY1mcuEB70ucr4mzS3RV1PXi7uW893acnY/Dl9Mz8z
	puyKklsT0vN2OxxMT5+nz6C0qyBHvUuvTHZrxcDqb6ZUxd98gBdc47eE=
X-Google-Smtp-Source: AGHT+IE9+6p8L1mqljpbtdwLxsCJw3my16mbcphwfS44q8D33yrZHM2qOuWbPxn9sS3qCOIwSHgNgIfHgqtOaR7rITIDJv5yZGSM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1987:b0:3cf:c7d3:e4b with SMTP id
 e9e14a558f8ab-3d894286fa1mr22023255ab.21.1744971543744; Fri, 18 Apr 2025
 03:19:03 -0700 (PDT)
Date: Fri, 18 Apr 2025 03:19:03 -0700
In-Reply-To: <20250418094635.237960-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68022717.050a0220.243d89.001a.GAE@google.com>
Subject: Re: [syzbot] [jfs?] [bcachefs?] KASAN: null-ptr-deref Read in
 drop_buffers (3)
From: syzbot <syzbot+de1498ff3a934ac5e8b4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
kernel BUG in z3fold_page_migrate

 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xabe/0x18e0 kernel/workqueue.c:3319
 worker_thread+0x870/0xd30 kernel/workqueue.c:3400
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
------------[ cut here ]------------
kernel BUG at mm/z3fold.c:1293!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 30 Comm: kcompactd1 Not tainted 6.14.0-rc6-syzkaller-00253-gcb82ca153949-dirty #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:z3fold_page_migrate+0xc22/0x1170 mm/z3fold.c:1293
Code: ff 48 89 ef 48 c7 c6 a0 3e 38 8c e8 f8 1a d8 ff 90 0f 0b e8 60 85 8d ff 48 8b 7c 24 10 48 c7 c6 00 3f 38 8c e8 df 1a d8 ff 90 <0f> 0b 48 85 db 0f 85 83 00 00 00 0f 1f 44 00 00 e8 39 85 8d ff e9
RSP: 0018:ffffc90000516eb8 EFLAGS: 00010246
RAX: 760a2d6b4e715d00 RBX: 0000000000000000 RCX: 0000000000000001
RDX: dffffc0000000000 RSI: ffffffff8c2ab220 RDI: 0000000000000001
RBP: ffffea00014d6180 R08: ffffffff903cfd77 R09: 1ffffffff2079fae
R10: dffffc0000000000 R11: fffffbfff2079faf R12: dffffc0000000000
R13: ffffffff8c383d08 R14: 04fff00000010001 R15: 1ffffd400029ac30
FS:  0000000000000000(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000c00018b600 CR3: 0000000053580000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 move_to_new_folio+0x9a5/0xc20 mm/migrate.c:1071
 migrate_folio_move mm/migrate.c:1360 [inline]
 migrate_folios_move mm/migrate.c:1712 [inline]
 migrate_pages_batch+0x1e84/0x30b0 mm/migrate.c:1959
 migrate_pages_sync mm/migrate.c:2016 [inline]
 migrate_pages+0x2701/0x3680 mm/migrate.c:2098
 compact_zone+0x33d5/0x4ae0 mm/compaction.c:2663
 kcompactd_do_work mm/compaction.c:3111 [inline]
 kcompactd+0x9a5/0x1540 mm/compaction.c:3205
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:z3fold_page_migrate+0xc22/0x1170 mm/z3fold.c:1293
Code: ff 48 89 ef 48 c7 c6 a0 3e 38 8c e8 f8 1a d8 ff 90 0f 0b e8 60 85 8d ff 48 8b 7c 24 10 48 c7 c6 00 3f 38 8c e8 df 1a d8 ff 90 <0f> 0b 48 85 db 0f 85 83 00 00 00 0f 1f 44 00 00 e8 39 85 8d ff e9
RSP: 0018:ffffc90000516eb8 EFLAGS: 00010246
RAX: 760a2d6b4e715d00 RBX: 0000000000000000 RCX: 0000000000000001
RDX: dffffc0000000000 RSI: ffffffff8c2ab220 RDI: 0000000000000001
RBP: ffffea00014d6180 R08: ffffffff903cfd77 R09: 1ffffffff2079fae
R10: dffffc0000000000 R11: fffffbfff2079faf R12: dffffc0000000000
R13: ffffffff8c383d08 R14: 04fff00000010001 R15: 1ffffd400029ac30
FS:  0000000000000000(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd22cd0bfd8 CR3: 00000000534f0000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         cb82ca15 Merge tag 'usb-6.14-rc7' of git://git.kernel...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=108a24cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=522f1f3e5f61442b
dashboard link: https://syzkaller.appspot.com/bug?extid=de1498ff3a934ac5e8b4
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17949fe4580000

