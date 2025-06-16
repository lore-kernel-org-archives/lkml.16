Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C111E501C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072412; cv=none; b=ZkPuO8FJnkIL5Vjl9PXCuv1TfYKi2qZKXFluuoRyp6R1Y8DEcuhwBeMNTYLpNcwmL/yakfy2qKNjmMtd/vFGTXonPnSvW8ORpNS7eCHAvbJ9R+HWRVF6UkE9Uecs4XJkNapruaDUSXjdHkyGB5iq7kwNkLQqoFpkol5rMsqIEcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072412; c=relaxed/simple;
	bh=qzzpG1yhlTFXLicE/nzP1mHOmttFLdrgk1WXTZk3Vzw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bnBIbrRHAKURlekQz0pqxRTbTV7WIySU6pevmz3N8ne7hQKOL/3umjz3rO7cDE239tol/q7ADPZWsjRDtSa3+87/eMm5VW66F+LKk4y04nD2crxaXZcYnuhMTZtg5O0mKEWRGRxI3KT+ac9pQpvj5wn930f0cEQZR97itl7H/+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddc147611fso95779495ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072409; x=1750677209;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZUkox9EnM49K7dAigRfdnYSXpxO3giUILTtq/fBLuA=;
        b=Un/oYdIW9QhOKV4Z8lynBFTN8Ps6ftv0mTCuz5sV+EA/yLXOSKJHC588lVEZobk7+s
         nj82Os76hmdfNiA75S+8R3OFzXU6VJde6J7w4qcm/7azrj4pAX4kmEUETN09yE1PZcxr
         sJs4WPj5sSbzjZMvSNkAOpAgKICXH7sEPkoMu60nqXxcMXaoc1rmz8devt7HSfOR96TA
         6+NFQGthHnMwJHXv1Jwj2lHUWlwQEi823WgR+FitYcKVRFPoIDmIXmRoWAgkBi+BldiQ
         FuDivI/HIjgAzMZ3xtW6oLU74ZvGFZf/B6Nifg4SZ2VSA3wApos9QO01HwiaEqbJsWzE
         nNvQ==
X-Gm-Message-State: AOJu0YwgIZK8xzB6SzGsSYoW7rbiD8BRdgx0WXhQpFN24bFZU06gOCvn
	2gKPWMZ/6c2Xtw8W6PriSYYjzfGmjVh+nw95tQuNIDiN3sduFaIUC7O+UoGTlG9Yz1C5X2OzEkJ
	tHW5K5D3UlswRJ0JR5YQlyZ5T/Gq86TYjY+IgsLBxn03+tc2x8wo/OjkVhycRnA==
X-Google-Smtp-Source: AGHT+IGCE0zBM/W0w4ZAf+75g9V7Xxd7PM3nFPHwyJgIpRE5vauYkmCpcQs7+SsdMHAF65o0EX2IlbuqvO4rtZWq9LggXBpJ+NzO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198d:b0:3dc:7fa4:804 with SMTP id
 e9e14a558f8ab-3de07ced6acmr95367675ab.16.1750072409701; Mon, 16 Jun 2025
 04:13:29 -0700 (PDT)
Date: Mon, 16 Jun 2025 04:13:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684ffc59.a00a0220.279073.0037.GAE@google.com>
Subject: [syzbot] [sound?] kernel BUG in filemap_fault (2)
From: syzbot <syzbot+263f159eb37a1c4c67a4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    488ef3560196 KEYS: Invert FINAL_PUT bit
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1503a10c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=263f159eb37a1c4c67a4
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/10b92ce8eca6/disk-488ef356.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4d4223a305b2/vmlinux-488ef356.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b4a8f82f3ac9/bzImage-488ef356.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+263f159eb37a1c4c67a4@syzkaller.appspotmail.com

 lookup_one_qstr_excl fs/namei.c:1711 [inline]
 do_renameat2+0x470/0xc50 fs/namei.c:5234
 __do_sys_rename fs/namei.c:5324 [inline]
 __se_sys_rename fs/namei.c:5322 [inline]
 __x64_sys_rename+0x82/0x90 fs/namei.c:5322
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
------------[ cut here ]------------
kernel BUG at mm/filemap.c:3442!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 7049 Comm: syz.2.293 Not tainted 6.16.0-rc1-syzkaller-00005-g488ef3560196 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:filemap_fault+0x117d/0x1200 mm/filemap.c:3442
Code: 38 c1 0f 8c 8e fc ff ff 4c 89 e7 e8 ad 64 29 00 e9 81 fc ff ff e8 23 18 c8 ff 48 89 df 48 c7 c6 20 30 94 8b e8 c4 a7 0d 00 90 <0f> 0b e8 0c 18 c8 ff 48 8b 3c 24 48 c7 c6 a0 36 94 8b e8 ac a7 0d
RSP: 0018:ffffc90004b073c0 EFLAGS: 00010246
RAX: f04d382b8d45cd00 RBX: ffffea0001dae580 RCX: f04d382b8d45cd00
RDX: 0000000000000000 RSI: ffffffff8db594ef RDI: ffff888027438000
RBP: ffffc90004b074f8 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bfa9ec R12: dffffc0000000000
R13: 1ffffd40003b5cb1 R14: ffffea0001dae598 R15: ffffea0001dae588
FS:  00007f5736abb6c0(0000) GS:ffff888125c86000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00002000000069e2 CR3: 0000000028984000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __do_fault+0x135/0x390 mm/memory.c:5189
 do_read_fault mm/memory.c:5610 [inline]
 do_fault mm/memory.c:5744 [inline]
 do_pte_missing mm/memory.c:4251 [inline]
 handle_pte_fault mm/memory.c:6089 [inline]
 __handle_mm_fault+0x37ed/0x5620 mm/memory.c:6232
 handle_mm_fault+0x2d5/0x7f0 mm/memory.c:6401
 do_user_addr_fault+0x764/0x1390 arch/x86/mm/fault.c:1387
 handle_page_fault arch/x86/mm/fault.c:1476 [inline]
 exc_page_fault+0x76/0xf0 arch/x86/mm/fault.c:1532
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:rep_movs_alternative+0xf/0x90 arch/x86/lib/copy_user_64.S:46
Code: c4 10 c3 cc cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 48 83 f9 40 73 44 83 f9 08 73 25 85 c9 74 0f <8a> 06 88 07 48 ff c7 48 ff c6 48 ff c9 75 f1 e9 fd f6 03 00 66 2e
RSP: 0018:ffffc90004b07978 EFLAGS: 00050202
RAX: 00007ffffffff001 RBX: 0000000000000001 RCX: 0000000000000001
RDX: 0000000000000001 RSI: 00002000000069e2 RDI: ffff8880297ba722
RBP: 00000000000088de R08: ffff8880297ba722 R09: 1ffff110052f74e4
R10: dffffc0000000000 R11: ffffed10052f74e5 R12: 0000000000000000
R13: 0000000000000001 R14: ffff8880297ba722 R15: 00002000000069e2
 copy_user_generic arch/x86/include/asm/uaccess_64.h:126 [inline]
 raw_copy_from_user arch/x86/include/asm/uaccess_64.h:141 [inline]
 _inline_copy_from_user include/linux/uaccess.h:178 [inline]
 _copy_from_user+0x7a/0xb0 lib/usercopy.c:18
 copy_from_user include/linux/uaccess.h:212 [inline]
 snd_rawmidi_kernel_write1+0x3ab/0x650 sound/core/rawmidi.c:1560
 snd_rawmidi_write+0x5ad/0xbd0 sound/core/rawmidi.c:1629
 do_loop_readv_writev fs/read_write.c:850 [inline]
 vfs_writev+0x4b3/0x960 fs/read_write.c:1059
 do_writev+0x14d/0x2d0 fs/read_write.c:1103
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5735b8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5736abb038 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
RAX: ffffffffffffffda RBX: 00007f5735db5fa0 RCX: 00007f5735b8e929
RDX: 0000000000000002 RSI: 0000200000000840 RDI: 000000000000000a
RBP: 00007f5735c10b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f5735db5fa0 R15: 00007ffe2d0cdd08
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:filemap_fault+0x117d/0x1200 mm/filemap.c:3442
Code: 38 c1 0f 8c 8e fc ff ff 4c 89 e7 e8 ad 64 29 00 e9 81 fc ff ff e8 23 18 c8 ff 48 89 df 48 c7 c6 20 30 94 8b e8 c4 a7 0d 00 90 <0f> 0b e8 0c 18 c8 ff 48 8b 3c 24 48 c7 c6 a0 36 94 8b e8 ac a7 0d
RSP: 0018:ffffc90004b073c0 EFLAGS: 00010246
RAX: f04d382b8d45cd00 RBX: ffffea0001dae580 RCX: f04d382b8d45cd00
RDX: 0000000000000000 RSI: ffffffff8db594ef RDI: ffff888027438000
RBP: ffffc90004b074f8 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bfa9ec R12: dffffc0000000000
R13: 1ffffd40003b5cb1 R14: ffffea0001dae598 R15: ffffea0001dae588
FS:  00007f5736abb6c0(0000) GS:ffff888125c86000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00002000000069e2 CR3: 0000000028984000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	10 c3                	adc    %al,%bl
   2:	cc                   	int3
   3:	cc                   	int3
   4:	cc                   	int3
   5:	cc                   	int3
   6:	cc                   	int3
   7:	cc                   	int3
   8:	cc                   	int3
   9:	cc                   	int3
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	48 83 f9 40          	cmp    $0x40,%rcx
  1e:	73 44                	jae    0x64
  20:	83 f9 08             	cmp    $0x8,%ecx
  23:	73 25                	jae    0x4a
  25:	85 c9                	test   %ecx,%ecx
  27:	74 0f                	je     0x38
* 29:	8a 06                	mov    (%rsi),%al <-- trapping instruction
  2b:	88 07                	mov    %al,(%rdi)
  2d:	48 ff c7             	inc    %rdi
  30:	48 ff c6             	inc    %rsi
  33:	48 ff c9             	dec    %rcx
  36:	75 f1                	jne    0x29
  38:	e9 fd f6 03 00       	jmp    0x3f73a
  3d:	66                   	data16
  3e:	2e                   	cs


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
