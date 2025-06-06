Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C2328688A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749208170; cv=none; b=FPqjGmvc4olTu30rUeoD10pafO+bPplH4ucuxjeM6XI2KtLG32vUvFVp/ur4HFzIqIjm3QN3mOhedgg9WEzZe9yNS0VsL0+kxtTmU/53eoTS4guLa5gnLggR9M8IgOjcz4sahQaXELi13aYqNZV3w1tZ8DcOS9BigdUNAp9djmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749208170; c=relaxed/simple;
	bh=p/bkGarg4KXztCMnjwy96xAusB9tDMq2/7J7YaUFGEE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fFY9lGWZLZrnv1iqixyDLTfsImIrngBnFXowGTI1duTwp4ngc3SPW+DEMguDFmqIrptdy2z/Ovm3DoqLkj2LjVqVqaiNclcG4sL1DYNqnTi1kospuaLbQD3UMf3ZQMwVRGxX1IDiCKCwMSVk4o7dxQl5YC3nNF+YcWaiG5288OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddc147611fso40726575ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749208168; x=1749812968;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iw0ZO3KmiZE4nTPMikItfY4XJlMSOikx5Gd9PeZeqRs=;
        b=roVh5t4rLjlIhYd9ZCFNxEU+APPjcwIymM7HwCqNeVzgHxoLKD1Q57yc1b8uLOL0YF
         1ZI+EP3HfM+ZU+kvWEoAyc4Pp44LPwHmMvyalXR6o9h6FxFtu0DD5/pcLYQcOTjaXTLE
         Pd9TUf6aPeGEk0HloSeChrEec45y9Q1XSLHibQ9cr1GEPQc6Vg7/5eJpx1cFNJ1t7VwJ
         9RcvLAqRYqiB8KUX4yGNd9j9pgWvcwfQ8aE/+4HWPYMP1nAfqws/OymJTK+Kl5EpGGN0
         B992ng2OY4GzgxdiHwRv9hAnZv8EGVOxmdD3EHyAjNeyQ27+chKT0ohnJBUh6SNWp4DR
         MIPw==
X-Forwarded-Encrypted: i=1; AJvYcCX7JYyJVtLVTPvXDwvssQu+yCkNzlAvPSrXRH2WtoqTkrAoDN1U1HqoAuTDdJVt+MFeI2ykcTwMsBrcU4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBE1Dq30D+h3Ij1Y2wOqNjy5NqRzPZUxuQ5v4YYC/NjQ0D25OT
	XCizldqUgJRTMOMgYxY/Jze+JbuH116Fi3KAR5dNoC50lLZgvxXWS6rhWQDbyG9z/IZj+4K9IQn
	FDbMZBMq0dw5GoF8rUqZSAuHnVKMqPvJKcuCxIeYuKCNKAcAWJK3AcMgQPYU=
X-Google-Smtp-Source: AGHT+IGXGbV+tKbHXfAk9NQ4CZ9jPqMUgDVrsFfSHpSN5QMsDRnOHS375bSle+lbQ1fYQ5J69vMvdF6Tyk013J2dWzShKKSACMlI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd84:0:b0:3dc:8a5f:7cd1 with SMTP id
 e9e14a558f8ab-3ddce407fd6mr34713295ab.3.1749208167899; Fri, 06 Jun 2025
 04:09:27 -0700 (PDT)
Date: Fri, 06 Jun 2025 04:09:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6842cc67.a00a0220.29ac89.003b.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in vma_modify
From: syzbot <syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	brad.spengler@opensrcsec.com, jannh@google.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, pfalcato@suse.de, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cd2e103d57e5 Merge tag 'hardening-v6.16-rc1-fix1-take2' of..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=107c7970580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6acfdd5e5c8ef3d0
dashboard link: https://syzkaller.appspot.com/bug?extid=d16409ea9ecc16ed261a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d3f00c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13c781d4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4f3c020d1cfe/disk-cd2e103d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f67c698d4603/vmlinux-cd2e103d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4a3974b951f8/bzImage-cd2e103d.xz

The issue was bisected to:

commit 47b16d0462a460000b8f05dfb1292377ac48f3ca
Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date:   Sat Feb 22 16:19:52 2025 +0000

    mm: abort vma_modify() on merge out of memory failure

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15b5580c580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17b5580c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=13b5580c580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com
Fixes: 47b16d0462a4 ("mm: abort vma_modify() on merge out of memory failure")

    7f83ee71a000-7f83ee71ffff: ffff8880117713c0
    7f83ee720000-7fff07f51fff: 0000000000000000
    7fff07f52000-7fff07f72fff: ffff88801182e500
    7fff07f73000-ffffffffffffffff: 0000000000000000
------------[ cut here ]------------
WARNING: CPU: 1 PID: 5825 at mm/vma.c:808 vma_merge_existing_range mm/vma.c:808 [inline]
WARNING: CPU: 1 PID: 5825 at mm/vma.c:808 vma_modify+0x1540/0x1970 mm/vma.c:1604
Modules linked in:
CPU: 1 UID: 0 PID: 5825 Comm: syz-executor396 Not tainted 6.15.0-syzkaller-10820-gcd2e103d57e5 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:vma_merge_existing_range mm/vma.c:808 [inline]
RIP: 0010:vma_modify+0x1540/0x1970 mm/vma.c:1604
Code: 0b 90 e9 9a ed ff ff e8 4e 56 ab ff 90 0f 0b 90 e9 a3 ec ff ff e8 40 56 ab ff 4c 89 f7 48 c7 c6 20 8c 96 8b e8 f1 05 f3 ff 90 <0f> 0b 90 e9 4c ed ff ff e8 23 56 ab ff e9 4f ee ff ff e8 19 56 ab
RSP: 0018:ffffc90003797b38 EFLAGS: 00010286
RAX: ffffffff8b5d28cd RBX: ffff8880246ea780 RCX: ffff88802c93bc00
RDX: 0000000000000000 RSI: ffffffffffffffff RDI: ffffffffffffffff
RBP: 0000200000000000 R08: ffffc900037976a7 R09: 1ffff920006f2ed4
R10: dffffc0000000000 R11: fffff520006f2ed5 R12: 0000200000000000
R13: ffffc90003797c60 R14: ffffc90003797c40 R15: 1ffff920006f2f8c
FS:  0000555582b74380(0000) GS:ffff888125d5f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c124e6b168 CR3: 000000007547b000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 vma_modify_flags+0x1e8/0x230 mm/vma.c:1645
 mlock_fixup+0x22a/0x360 mm/mlock.c:483
 apply_mlockall_flags+0x2f0/0x3c0 mm/mlock.c:736
 __ia32_sys_munlockall+0x10a/0x220 mm/mlock.c:782
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f83ee6a76a9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 a1 1a 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff07f72138 EFLAGS: 00000246 ORIG_RAX: 0000000000000098
RAX: ffffffffffffffda RBX: 00007fff07f72150 RCX: 00007f83ee6a76a9
RDX: 00007f83ee6a68e0 RSI: 00007fff07f72150 RDI: 00007fff07f72150
RBP: 0000000000000001 R08: 00007fff07f71ed7 R09: 00000000000000a0
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000001
R13: 431bde82d7b634db R14: 0000000000000001 R15: 0000000000000001
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
