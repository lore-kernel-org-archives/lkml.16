Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA70F4315F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744483585; cv=none; b=k4udNkV7VSCl6sySB7VxW5AHM/YZ+0JipQUklDoI+CWJ4zgVmyj+cliZzOgEhPM0lWucR2bhRz7xtFLdbduA83VaXM5zXhFPxi7eJJ74dhudM/xQWzMAj41yQBeI1MqPHxjUe4YEYqyhyGQzdNe9nGKT/i7YvdOzCEp2aWY/CLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744483585; c=relaxed/simple;
	bh=PZ6XtsB2IIx9AuTDdACoZ42EyCPrWsWT81ePmFEkeUI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BuxjYtc28OW9esQiMXWMNXj+GwCA7ddOOfYU2YufQV4zByMCfUaSEi/QBIycOZRhrDTXsEHQXGiXgHMF2xZj3HiUp1XyMlGp0kNcBX3DKpWzR1iiavhdXsCUJ1/GZ4aoXOGfTxoZh/GjTBQcTG4nsUlVevoI57s82Gs/jz0qwFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d458e61faaso30751545ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 11:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744483583; x=1745088383;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EYawUqUPJUUXDdCuKwIAwUSr7/5CkWMi7P8VIfyhQA=;
        b=mn5V+KAYXVQs+vZ4GEJm2UAjAKEv4soDBB6BckymPWvoFIzLrUrPDb4FSxt+f6YfS5
         dRNOgsgd3GTcMZMSlMYaZqj8CP81NnJTlZGZkC62S7dvn47h+DJT7JhycM5egyyK7Dde
         UqdMBF03icRUiHQybLayDXjaCvsX2d7q74S2rrXXZlx3s89W0HHS2hcqhQzA2wnXu43b
         hv6Z2dYyxD9Iei5sRuD1lLOIjCJwF0CWl/JVXTj8bM9C+U7ITzE+Fub/XFnyWZXGRTKe
         vnToWyhqnNfS6reWrAEEG83xYbFVlmhz38W/5azlGUiJCoMOkJG+BDPPo8xs2GZN92Xe
         BKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzHG/ha4PovgethphUAwbUZEBBHBWITrzr9O5UuRIyNe/JJ+aJcOwkDZg9kcip2XQZJH4dRw81hCNLQNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTU1QbpZJdHYTYv3LuZeBlE0SUbjefs32n/FWBKNSqG4id3SE
	qC65pkc22zWOQxiRjHQWni8QpdQEOzO3R+aep0N+mK9CrBXK5NyFDTPPLPNWgtJ3N9MlOD6iALJ
	We1Da9oomXnssREfdQm2lTAMJ53w39HKTy6w1sD9aImoiJsPgAhoKVZ8=
X-Google-Smtp-Source: AGHT+IGj2kWjTA9dT5MRnTtQizBJQUcBlnOuNIjkETdqfNUs0tZVkkgK84qLomZ16SUmc7uNe3Z+Smr3moDA/AP4b71M8bzAXpxf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1708:b0:3d3:fa69:6755 with SMTP id
 e9e14a558f8ab-3d7ebf5fa25mr63683985ab.5.1744483582800; Sat, 12 Apr 2025
 11:46:22 -0700 (PDT)
Date: Sat, 12 Apr 2025 11:46:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fab4fe.050a0220.2c5fcf.0011.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in do_wp_page
From: syzbot <syzbot+5e8feb543ca8e12e0ede@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0af2f6be1b42 Linux 6.15-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1766323f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f175b153b655dbb3
dashboard link: https://syzkaller.appspot.com/bug?extid=5e8feb543ca8e12e0ede
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f1d71d1bf77d/disk-0af2f6be.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7f1638f065da/vmlinux-0af2f6be.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9b3e49834705/bzImage-0af2f6be.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5e8feb543ca8e12e0ede@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 7165 at mm/memory.c:3738 __wp_can_reuse_large_anon_folio mm/memory.c:3738 [inline]
WARNING: CPU: 0 PID: 7165 at mm/memory.c:3738 wp_can_reuse_anon_folio mm/memory.c:3788 [inline]
WARNING: CPU: 0 PID: 7165 at mm/memory.c:3738 do_wp_page+0x4c62/0x59f0 mm/memory.c:3918
Modules linked in:
CPU: 0 UID: 0 PID: 7165 Comm: syz.3.280 Not tainted 6.15.0-rc1-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:__wp_can_reuse_large_anon_folio mm/memory.c:3738 [inline]
RIP: 0010:wp_can_reuse_anon_folio mm/memory.c:3788 [inline]
RIP: 0010:do_wp_page+0x4c62/0x59f0 mm/memory.c:3918
Code: 48 89 ef e8 50 c3 ea ff e9 62 b8 ff ff e8 c6 e0 b4 ff 48 c7 c6 20 43 9b 8b 4c 89 e7 e8 f7 a0 fc ff 90 0f 0b e8 af e0 b4 ff 90 <0f> 0b 90 e9 df ed ff ff e8 a1 e0 b4 ff 48 c7 c6 60 46 9b 8b 48 89
RSP: 0018:ffffc900039f77e0 EFLAGS: 00010287
RAX: 0000000000041ec0 RBX: ffffc900039f7a00 RCX: ffffc9000d0c6000
RDX: 0000000000080000 RSI: ffffffff82065c61 RDI: 0000000000000005
RBP: ffffea0001320000 R08: 0000000000000005 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000000 R12: ffff888012935dc0
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
FS:  00007f57215806c0(0000) GS:ffff8881249b9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000020000001e000 CR3: 000000006cd88000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 handle_pte_fault mm/memory.c:6013 [inline]
 __handle_mm_fault+0x1ada/0x2a40 mm/memory.c:6140
 handle_mm_fault+0x3fe/0xad0 mm/memory.c:6309
 faultin_page mm/gup.c:1193 [inline]
 __get_user_pages+0x771/0x36f0 mm/gup.c:1491
 populate_vma_page_range+0x278/0x3a0 mm/gup.c:1929
 __mm_populate+0x1d8/0x380 mm/gup.c:2032
 do_mlock+0x448/0x810 mm/mlock.c:655
 __do_sys_mlock mm/mlock.c:663 [inline]
 __se_sys_mlock mm/mlock.c:661 [inline]
 __x64_sys_mlock+0x59/0x80 mm/mlock.c:661
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f572078d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5721580038 EFLAGS: 00000246 ORIG_RAX: 0000000000000095
RAX: ffffffffffffffda RBX: 00007f57209a5fa0 RCX: 00007f572078d169
RDX: 0000000000000000 RSI: 0000000000800000 RDI: 0000200000000000
RBP: 00007f572080e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f57209a5fa0 R15: 00007fffd504a2f8
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
