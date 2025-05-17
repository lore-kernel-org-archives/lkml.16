Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A376026
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 08:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747470096; cv=none; b=i9vyyWs7XMddNHO3C5hPRyR4ZnF/yvvjSyjXiSbKOgArHdqtX/xdSwoQmdbhcjfDHoYV1Svnl4Pm/2qqU+f+PaL4NSTocTrBCLyleBV6prVbKxXNPi0xcFGDNXf5E26+wmyz1c+hQJPKIb9Da0huBgqK3sZPYXUlJbyiYUTc60E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747470096; c=relaxed/simple;
	bh=+eJOMi2986xu8JmQvhdKwd9obQMnPObUbqcTOmSXGOQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=c+WvhXed731UDHq53c5hdDHMsak9dT7WMGyPrFdjKoUyP2iEIBBQJRe3czk+QdZfbSXkmxVmAzvpSD+2Lmgk99DoSC2SvFAsEtHMZx68YY5/aDs+43iJMkPVOOTTOaRfvc9Lwc3Uty3S3U98WgM4Yz4St33piKTLJxHaAEULdjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-862dda418a6so440257639f.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747470094; x=1748074894;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuE/K/3Gf56V3Ou0pS8Dc3oVSR2NNvXK2VubFy8qppk=;
        b=JrA9ST+jhTNg8Jzdd6vtrunGK/cdQmZDNIsEp46ZNh4FbscMXSuR1WrTONQ8gLjFlx
         QQEbiVtrI52CyTp4NHNxllWuugNpyqTrghDfPUKSR+4xqQt5EBL6SxEegcnABU8csdB1
         09TTdaf0NKW531J9RXprAaz7cOijGTwvrYFr2xln4g+SLmdBU0ZFxXGlroAfifC0dgRf
         V0lBmAW8SspEWrBVWv4vd0x81DjUpD4P3z3P0z/1RjwrTd0ftSu081VscBS6ZAGzB6bd
         ebeErMud78GsyftJd5cWErXnzrzHAJoknZdtNVnmJJXILodwSWtmuU13sWriH5ENNFAy
         bVQg==
X-Forwarded-Encrypted: i=1; AJvYcCUFuP0OquU774jlnGZwRj6wrmhqs3GKlskgQ939xN7ZlY15iHBfjyO5k9dDklowsyjsd9lEIl9VkSNp9mI=@vger.kernel.org
X-Gm-Message-State: AOJu0YweZdgo1Ebq6ikVXCZUnsLfSt9n3Yu5IEliHRaTOzPlNtC4PTQO
	YJA7dulVHP+Fx96gGwaE6OUHlAXuMNKn6NBIndF92yLgN3MtrWF5D0oe5ONbp8B6jvt5A+5miaD
	SQvSO2c/Nnyey6nneHX19RUlfgMwgYJjOEJTHvl72kwGpkTAIawxV21TAPKc=
X-Google-Smtp-Source: AGHT+IF43ydOpiImfAR9TBnTncl0cn+Wr9Smbdc8GCN2U7/WC+KZNR7d5xoNg19tLeOZm3LLQBKa5ILRNjbf9jZBgzXLlAfiwdtJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3683:b0:86a:1faf:84c with SMTP id
 ca18e2360f4ac-86a24bb412bmr829334239f.2.1747470093891; Sat, 17 May 2025
 01:21:33 -0700 (PDT)
Date: Sat, 17 May 2025 01:21:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6828470d.a70a0220.38f255.000c.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in folio_large_mapcount
From: syzbot <syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, david@redhat.com, dev.jain@arm.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	npache@redhat.com, ryan.roberts@arm.com, syzkaller-bugs@googlegroups.com, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    627277ba7c23 Merge tag 'arm64_cbpf_mitigation_2025_05_08' ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1150f670580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5929ac65be9baf3c
dashboard link: https://syzkaller.appspot.com/bug?extid=2b99589e33edbe9475ca
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0a42ae72fe0e/disk-627277ba.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0be88297bb66/vmlinux-627277ba.xz
kernel image: https://storage.googleapis.com/syzbot-assets/31808a4b1210/bzImage-627277ba.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 38 at ./include/linux/mm.h:1335 folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335
Modules linked in:
CPU: 1 UID: 0 PID: 38 Comm: khugepaged Not tainted 6.15.0-rc6-syzkaller-00025-g627277ba7c23 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335
Code: 04 38 84 c0 75 29 8b 03 ff c0 5b 41 5e 41 5f e9 96 d2 2b 09 cc e8 d0 cb 99 ff 48 89 df 48 c7 c6 20 de 77 8b e8 a1 dc de ff 90 <0f> 0b 90 eb b6 89 d9 80 e1 07 80 c1 03 38 c1 7c cb 48 89 df e8 87
RSP: 0018:ffffc90000af77e0 EFLAGS: 00010246
RAX: e1fcb38c0ff8ce00 RBX: ffffea00014c8000 RCX: e1fcb38c0ff8ce00
RDX: 0000000000000001 RSI: ffffffff8d9226df RDI: ffff88801e2fbc00
RBP: ffffc90000af7b50 R08: ffff8880b8923e93 R09: 1ffff110171247d2
R10: dffffc0000000000 R11: ffffed10171247d3 R12: 1ffffd4000299000
R13: dffffc0000000000 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8881261fb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe58f12dc0 CR3: 0000000030e04000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 folio_mapcount include/linux/mm.h:1369 [inline]
 is_refcount_suitable+0x350/0x430 mm/khugepaged.c:553
 hpage_collapse_scan_file+0x6d4/0x4200 mm/khugepaged.c:2323
 khugepaged_scan_mm_slot mm/khugepaged.c:2447 [inline]
 khugepaged_do_scan mm/khugepaged.c:2548 [inline]
 khugepaged+0xa2a/0x1690 mm/khugepaged.c:2604
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
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
