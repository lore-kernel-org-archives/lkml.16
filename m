Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032D220696
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750401874; cv=none; b=TFw47Yp/dX2ypbh6QTFUXPJg8oSQQL9UuxhYUIaE90/d5LBG1K+HRzqfrtlr5DPtpbn8ZUreGeF6nrx28QLcQt9ZJhSqfX72hHAepOBZwhfMVEq8q73E0mAQSwFKe1B9nLqilEvvtif0WHs4E8SggIodVck5sp41NEx+cbe7Ltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750401874; c=relaxed/simple;
	bh=NrlKuBMWjGmAhAQY+i2cFjR5QEjGaiLQ0rjW6NpmjnY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oTHCpDMCcVUfNAHjbHaAY879QN64gTcX94JXi0Q/tUm9lwHrRSYlnxcTmkj8RLCh0G2/GSCzh/Gd6horuYwWzyJdqRf3b0QlUJXmdXTHbM3NKA9fhOIyeuz8k45sVs1l/PIf0x741JiR5lQCPVPFXCH+OPMTAqmP4j2m9CrYfrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddd90ca184so11692625ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750401872; x=1751006672;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7kVO0N3msBAmWGMDRyGWAg4wAq++1TEknB8jPIDN7g=;
        b=gzOw8qz507HD6E6/rGFiJT6Yz/xRJiECzXR7DZEXe5VyZcngHGhnSHJazWOCXRYHp1
         8WCav+i2By21Kp14MLLlxzK9NJEmeDuQ2U/0XpH2SXXOKk9qLwoTl5Hrhw/LoTy4fJ3u
         KceUI2Po0LVXA2fhZLRK+Zh4EOH2ImGlCBGRH+oxTgW7/bgfjsmbmrEQPI14wab+HmHy
         3ZC8rQqUGVsOxJxYGV7mU1k9zpoP7dCkY4Ty9+pDnYAVaFQ4YxbnQq283TfnoL8rfXd7
         FUu1UI0E96XO/a8aW5PcClRnYSoCbMnFUsYxYaBBYI/p2BUDdPsapLpa277xVmRXJXka
         dVvg==
X-Forwarded-Encrypted: i=1; AJvYcCUO45/YVaT9M0cDmtfKk3sRsm/mXovQ/EnUugIRkPHrc9d1+QjHCjFbHfdpkt1PP9mb966nttIf2JE46xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxJydfV34BVdw4L7Qq32m6d/3EJuKu2uuc3ZKfCxWOCpzaENC9
	tZ13K/ytQK3Zgu/+cuMe1HuHNbTXDtRASUC9pgzIuX2726bCIcWs1ZaaDUY3qpr3AtxjYbqvV8P
	aYprpE867VOgXzFQSEFYNNC0Oxiz0p3uDs4ydurhTkEuHMRya8q49s61Mm5E=
X-Google-Smtp-Source: AGHT+IHYKCvDkixiXKMTqbr4Hg3Gc5Ydc5TjCY/lQ3TYf1HV/YlT8xjlNze8O+ktC7jjavEOoRXVMJCHH8wnCGOt5W70N6WDWjkL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b0b:b0:3dd:d18a:2d71 with SMTP id
 e9e14a558f8ab-3de38c15e8bmr17182145ab.2.1750401872049; Thu, 19 Jun 2025
 23:44:32 -0700 (PDT)
Date: Thu, 19 Jun 2025 23:44:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68550350.a00a0220.137b3.0032.GAE@google.com>
Subject: [syzbot] [gfs2?] kernel BUG in __gfs2_glock_put (2)
From: syzbot <syzbot+ef4ad020dc976d178975@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bc6e0ba6c9ba Add linux-next specific files for 20250613
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15cd6e82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2f7a2e4d17ed458f
dashboard link: https://syzkaller.appspot.com/bug?extid=ef4ad020dc976d178975
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2430bb0465cc/disk-bc6e0ba6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/436a39deef0a/vmlinux-bc6e0ba6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e314ca5b1eb3/bzImage-bc6e0ba6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ef4ad020dc976d178975@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: G:  s:UN n:2/925 f:a t:UN d:EX/0 a:0 v:0 r:-128 m:20 p:1
------------[ cut here ]------------
kernel BUG at fs/gfs2/glock.c:274!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 55 Comm: kworker/0:1H Not tainted 6.16.0-rc1-next-20250613-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: gfs2-glock/syz:syz glock_work_func
RIP: 0010:__gfs2_glock_put+0x384/0x3e0 fs/gfs2/glock.c:274
Code: 3f 48 89 de e8 ed 0e ff ff eb 26 e8 c6 43 cf fd e9 30 fe ff ff e8 bc 43 cf fd 31 ff 48 89 de ba 01 00 00 00 e8 9d de ff ff 90 <0f> 0b e8 a5 43 cf fd 31 f6 65 ff 0d 3c cc ac 0e 40 0f 94 c5 40 0f
RSP: 0018:ffffc9000130fa48 EFLAGS: 00010246
RAX: c5b932becee92b00 RBX: ffff8880572f5fb0 RCX: ffff88801b770000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffc9000130f307 R09: 1ffff92000261e60
R10: dffffc0000000000 R11: fffff52000261e61 R12: dffffc0000000000
R13: 1ffff1100a9dc815 R14: ffff888054ee4000 R15: ffff8880572f62a0
FS:  0000000000000000(0000) GS:ffff888125c41000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005555656fb5c8 CR3: 000000007604a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 process_one_work kernel/workqueue.c:3235 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3318
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3399
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__gfs2_glock_put+0x384/0x3e0 fs/gfs2/glock.c:274
Code: 3f 48 89 de e8 ed 0e ff ff eb 26 e8 c6 43 cf fd e9 30 fe ff ff e8 bc 43 cf fd 31 ff 48 89 de ba 01 00 00 00 e8 9d de ff ff 90 <0f> 0b e8 a5 43 cf fd 31 f6 65 ff 0d 3c cc ac 0e 40 0f 94 c5 40 0f
RSP: 0018:ffffc9000130fa48 EFLAGS: 00010246
RAX: c5b932becee92b00 RBX: ffff8880572f5fb0 RCX: ffff88801b770000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffc9000130f307 R09: 1ffff92000261e60
R10: dffffc0000000000 R11: fffff52000261e61 R12: dffffc0000000000
R13: 1ffff1100a9dc815 R14: ffff888054ee4000 R15: ffff8880572f62a0
FS:  0000000000000000(0000) GS:ffff888125c41000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005555656fb5c8 CR3: 000000007604a000 CR4: 00000000003526f0
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
