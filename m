Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66952185BE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102892; cv=none; b=UEpiD3bNcaBIdQ0gGqD1Ff2OAYgxvhzHAjHK2+6yn7xXO0avkVovbs29p8whPGSsklShphGiNZ9HZi/TDRZGiopqHqTye1CDFsUFz193hQJYvi+Fd66tEF++PE/AWcSEbKBgVZuYXRn5yx9IgrIOvqnoSHOXvLI913kGyysJ/HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102892; c=relaxed/simple;
	bh=TtveIpyVKtJXDQ5NUCCwXTlmpH5d6SPP1T79MlYjV5Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=r2z3VXfw9TcCqAhygFml0XxYh1OqO3lkSrgxphDG6R0KFg3UFpDzsaVcLQuW1YiEwrNErai4IOqa47W1y60nw4xpAXpL2CzdkZAJn/uGBNOBZEu/fewZhdDFciCtjTHmUryqn6/kP7/TOReum67Hxmww8A2gLgIY87JUklmUzIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d6e10e3644so52337655ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102889; x=1744707689;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JqahVfL1D4hQZnCbFn4bzuL/NlQvgonuR425q/tkWmY=;
        b=TNP9IHFv8/z5RCSKdq9bJrtrZr0RodJCUgGOfbYXAmH9ye9G+Tqlu34QFMsfIlsJ8F
         Y9aT29Rfm3huEUQpKgxftNhiZ003YKFt5A4pr/QABVYdAuBqcTtZLtYE4WkZOUSNl1x5
         SDsD4CckXEO3Y34IJ0IMLo+eYCVNj+V71zwDzUW/wnVU9Aqk0/KXnCudeyblI0eJaRPh
         yBmaHsrVRJKq+0wpLLgX8owi2KPsF9zqd+oX0x0yHB/u1uYQFqAPc+4EfZOH57/iPiaN
         zxd13Umqo78Z5siz1chErACo7CZbwt6WMEoybonoM2LRuqsH8gLYohbZ94xLPjNGRopj
         TU4w==
X-Forwarded-Encrypted: i=1; AJvYcCW2wy9bGyPt3CHF4bbqRE+B02xrc6i3Z+D1KXmF0E0ZiMI2sw4xvXd2CUFB+XRpLl+Xzw42U6sbrW8+gm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSaJgtd8n+9PXmj00zoXyG4B9KFqtly7w/HG9ifDK/53FtVfd0
	ggdPHQ15+SDpizrljp+/BCNj2t7boWmbaAanm2qm+XtomCltaDtRxdTtewrvadzMzyt0YioYr+U
	0l9+x0Z1xmv4wiR4+ljYuIHbIMO3qOr615pvlHZlWOmisqEbmyXFpJlk=
X-Google-Smtp-Source: AGHT+IH9FFO9muBSUIc4qM3wZK4YuGtw2McDDKU5+LnoNYpccMWvEZySpMYMG0QTbv3kzNH1VzIF4x2piauS4JO4HIaibujS2Nsv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1808:b0:3d4:337f:121c with SMTP id
 e9e14a558f8ab-3d6e3f0533fmr150479385ab.10.1744102889694; Tue, 08 Apr 2025
 02:01:29 -0700 (PDT)
Date: Tue, 08 Apr 2025 02:01:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f4e5e9.050a0220.396535.055b.GAE@google.com>
Subject: [syzbot] [mm?] BUG: unable to handle kernel paging request in
 clear_page_erms (7)
From: syzbot <syzbot+148b19e89d0c0937f1a2@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=159c194c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6fe3b5e6a2cb1cc2
dashboard link: https://syzkaller.appspot.com/bug?extid=148b19e89d0c0937f1a2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4d55df4f9a03/disk-a2cc6ff5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f61727d82019/vmlinux-a2cc6ff5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/de41cfb8b562/bzImage-a2cc6ff5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+148b19e89d0c0937f1a2@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffff88805fa41000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 1ae01067 P4D 1ae01067 PUD 5fa40063 PMD 2a687063 PTE 800fffffa05be020
Oops: Oops: 0002 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5843 Comm: syz-executor Not tainted 6.14.0-syzkaller-12966-ga2cc6ff5ec8f #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:clear_page_erms+0xb/0x20 arch/x86/lib/clear_page_64.S:52
Code: 48 8d 7f 40 75 d9 90 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa b9 00 10 00 00 31 c0 <f3> aa c3 cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 90
RSP: 0018:ffffc90003f4ec78 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000001000
RDX: ffff88805fa41000 RSI: 0000000000000001 RDI: ffff88805fa41000
RBP: ffffea00017e9040 R08: ffffffff905fcf77 R09: 0000000000000000
R10: ffffed100bf48200 R11: fffffbfff20bf9ef R12: 0000000000000000
R13: 0000000000000001 R14: 0000000000000001 R15: ffffea00017e9040
FS:  0000000000000000(0000) GS:ffff888124f99000(0063) knlGS:0000000056aa3440
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: ffff88805fa41000 CR3: 0000000066642000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 clear_page arch/x86/include/asm/page_64.h:54 [inline]
 clear_highpage_kasan_tagged include/linux/highmem.h:248 [inline]
 kernel_init_pages mm/page_alloc.c:1093 [inline]
 post_alloc_hook+0xf5/0x240 mm/page_alloc.c:1715
 prep_new_page mm/page_alloc.c:1725 [inline]
 get_page_from_freelist+0x352b/0x36c0 mm/page_alloc.c:3652
 __alloc_frozen_pages_noprof+0x211/0x5b0 mm/page_alloc.c:4934
 alloc_pages_mpol+0x339/0x690 mm/mempolicy.c:2301
 alloc_frozen_pages_noprof mm/mempolicy.c:2372 [inline]
 alloc_pages_noprof+0x121/0x190 mm/mempolicy.c:2392
 pagetable_alloc_noprof include/linux/mm.h:2985 [inline]
 __pte_alloc_one_noprof include/asm-generic/pgalloc.h:70 [inline]
 pte_alloc_one+0x1e/0x160 arch/x86/mm/pgtable.c:17
 __pte_alloc+0x7b/0x240 mm/memory.c:430
 copy_pte_range+0x607b/0x6680 mm/memory.c:1100
 copy_pmd_range mm/memory.c:1255 [inline]
 copy_pud_range mm/memory.c:1292 [inline]
 copy_p4d_range mm/memory.c:1316 [inline]
 copy_page_range+0xe57/0x13a0 mm/memory.c:1410
 dup_mmap kernel/fork.c:726 [inline]
 dup_mm kernel/fork.c:1734 [inline]
 copy_mm+0x130d/0x22c0 kernel/fork.c:1786
 copy_process+0x17de/0x3d10 kernel/fork.c:2429
 kernel_clone+0x242/0x930 kernel/fork.c:2844
 __do_compat_sys_ia32_clone arch/x86/kernel/sys_ia32.c:254 [inline]
 __se_compat_sys_ia32_clone arch/x86/kernel/sys_ia32.c:240 [inline]
 __ia32_compat_sys_ia32_clone+0x266/0x2e0 arch/x86/kernel/sys_ia32.c:240
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xb4/0x110 arch/x86/entry/syscall_32.c:306
 do_fast_syscall_32+0x34/0x80 arch/x86/entry/syscall_32.c:331
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf73ed579
Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f753fcbc EFLAGS: 00000206 ORIG_RAX: 0000000000000078
RAX: ffffffffffffffda RBX: 0000000001200011 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000056aa34a8
RBP: 00000000f73dcff4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
CR2: ffff88805fa41000
---[ end trace 0000000000000000 ]---
RIP: 0010:clear_page_erms+0xb/0x20 arch/x86/lib/clear_page_64.S:52
Code: 48 8d 7f 40 75 d9 90 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa b9 00 10 00 00 31 c0 <f3> aa c3 cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 90
RSP: 0018:ffffc90003f4ec78 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000001000
RDX: ffff88805fa41000 RSI: 0000000000000001 RDI: ffff88805fa41000
RBP: ffffea00017e9040 R08: ffffffff905fcf77 R09: 0000000000000000
R10: ffffed100bf48200 R11: fffffbfff20bf9ef R12: 0000000000000000
R13: 0000000000000001 R14: 0000000000000001 R15: ffffea00017e9040
FS:  0000000000000000(0000) GS:ffff888124f99000(0063) knlGS:0000000056aa3440
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: ffff88805fa41000 CR3: 0000000066642000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	48 8d 7f 40          	lea    0x40(%rdi),%rdi
   4:	75 d9                	jne    0xffffffdf
   6:	90                   	nop
   7:	c3                   	ret
   8:	cc                   	int3
   9:	cc                   	int3
   a:	cc                   	int3
   b:	cc                   	int3
   c:	0f 1f 00             	nopl   (%rax)
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
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	f3 0f 1e fa          	endbr64
  23:	b9 00 10 00 00       	mov    $0x1000,%ecx
  28:	31 c0                	xor    %eax,%eax
* 2a:	f3 aa                	rep stos %al,%es:(%rdi) <-- trapping instruction
  2c:	c3                   	ret
  2d:	cc                   	int3
  2e:	cc                   	int3
  2f:	cc                   	int3
  30:	cc                   	int3
  31:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  38:	00 00 00
  3b:	0f 1f 40 00          	nopl   0x0(%rax)
  3f:	90                   	nop


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
