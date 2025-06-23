Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614BA299931
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703249; cv=none; b=Y30efpX5/fo0hGDPufw86ycp1o6BKMMKpXbgWYhqk2a+idQJacdenpaaCdj7q//Kcio+MzOAt5fs7XWlgU2ieL5R/ZMGH/2kqdH5vZvwt6LzQnQXLlEqv0d/aaCwxdU5Xo2SR9zLoVVlKgzACrrHTMEKyu9gUF0lY5lqnCq5HXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703249; c=relaxed/simple;
	bh=4edUrc6qj99xWuzuwN1VwlyQdhDoEGZvrEyrOYhoHGQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=t5hc3ildLJUigYgLRhFMhTjLy3t6MKwfdNwitQhWxn4EvXBDnAHNQQZ0Y0JHtvJkujpen8XpY5rHD57mm5PsF5Fbnjvh4tA0qu23fd1+szHArLU32sh+Jc6LyO1gE4YyUAQUaWjIS4n9ZTBj+gYir8nylYccWqsWSlCUZBC8NuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddc9e145daso79705135ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750703246; x=1751308046;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFuxZfBXS1W/p4hmcX09EldnynNYPwsXWVEbKIYJIYs=;
        b=UrT0gy22bwtyoguq/NdXoBUG2i6m0dPV8dCvOhhjv4W9HAfWALKRugPQy4NGEyz5bP
         YrpwZXn2rIQ2fEJZUyYiAteMtrQfGxEAacAAL/hls6xIASvGBlbJsohKj+XQKGa57Mlx
         gsRIZIuOkmHAm7NWF2oWok2CdEhz/AivBzdJUD+7/foZd13iJJThUPkCrD/qalTx6IUd
         +aYGtdWo1MMkCypPLTDHFkqILwXvrNiqaWJJq16Ci7CKSYM3QE2idADMVyJe95s91e8v
         ixGatI92NOVE+yJFLzzx3+2va5Uoac1AzazJb2q/fJ8A6Tq6VqtlvGffwBcPGit1A+yf
         bAHA==
X-Forwarded-Encrypted: i=1; AJvYcCXTTB8Dg3NaDYC1SRc2il8/kKH+wSwMN94i39QsZbnxOmZVkYDc4vfaZlASKCuRwZxvBqiexdC3s+PSw/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHydzVcBRtnq75FhFCrEtUJ3OP24bKIyvXRJbA3J00/vPtZ5H
	pT9khgAg99garACUisFQRBWtUMsKKpetIkHoXUswiE3uj/mWX+++POq1TK8eVojFgPaRRHj1GpD
	Bx1+MpL/r4Q92ExDps5L9MoiBulK28JKRcMcNPysli2JgetO+yH9IGpVgaBE=
X-Google-Smtp-Source: AGHT+IF8TmfvY0yn6gjtD7MdlFzyGVcqTsTNmd4GRTmmNfK0sPzKfnAB++UrIStaVMz6oMhiLKj1CvnZvc6LC3gU9SseSkm3nygj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2412:b0:3db:6fb2:4b95 with SMTP id
 e9e14a558f8ab-3de38cca745mr152848795ab.18.1750703246519; Mon, 23 Jun 2025
 11:27:26 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:27:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68599c8e.a00a0220.34b642.000f.GAE@google.com>
Subject: [syzbot] [fs?] general protection fault in pidfs_free_pid
From: syzbot <syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5d4809e25903 Add linux-next specific files for 20250620
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=150ef30c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58afc4b78b52b7e3
dashboard link: https://syzkaller.appspot.com/bug?extid=25317a459958aec47bfa
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10a5330c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c9f6bc580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/16492bf6b788/disk-5d4809e2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7be284ded1de/vmlinux-5d4809e2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/467d717f0d9c/bzImage-5d4809e2.xz

The issue was bisected to:

commit fb0b3e2b2d7f213cb4fde623706f9ed6d748a373
Author: Christian Brauner <brauner@kernel.org>
Date:   Wed Jun 18 20:53:46 2025 +0000

    pidfs: support xattrs on pidfds

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15a1b370580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17a1b370580000
console output: https://syzkaller.appspot.com/x/log.txt?x=13a1b370580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com
Fixes: fb0b3e2b2d7f ("pidfs: support xattrs on pidfds")

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.16.0-rc2-next-20250620-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:pidfs_free_pid+0xaf/0x140 fs/pidfs.c:162
Code: f0 ff ff 73 e4 43 80 3c 3c 00 74 08 4c 89 f7 e8 67 19 de ff 49 83 3e 00 0f 85 84 00 00 00 e8 78 ee 79 ff 48 89 d8 48 c1 e8 03 <42> 80 3c 38 00 74 08 48 89 df e8 42 19 de ff 4c 8b 33 4d 85 f6 74
RSP: 0018:ffffc90000a08b90 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff88801ceada00
RDX: 0000000000000100 RSI: 0000000000000001 RDI: ffff8880745f4370
RBP: 0000000000000001 R08: ffff8880745f4303 R09: 1ffff1100e8be860
R10: dffffc0000000000 R11: ffffed100e8be861 R12: 1ffff1100e8be86d
R13: ffffffff81a8bfb4 R14: ffff8880745f4368 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125d26000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffcc2d1bf28 CR3: 00000000745f2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 put_pid+0x9c/0x130 kernel/pid.c:103
 rcu_do_batch kernel/rcu/tree.c:2582 [inline]
 rcu_core+0xca5/0x1710 kernel/rcu/tree.c:2838
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:pv_native_safe_halt+0x13/0x20 arch/x86/kernel/paravirt.c:82
Code: 43 dd 02 00 cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 83 d5 1a 00 f3 0f 1e fa fb f4 <e9> 18 dd 02 00 cc cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90000197de0 EFLAGS: 000002c6
RAX: 5ef6bd65ac57ee00 RBX: ffffffff81975fd8 RCX: 5ef6bd65ac57ee00
RDX: 0000000000000001 RSI: ffffffff8d991d22 RDI: ffffffff8be320a0
RBP: ffffc90000197f20 R08: ffff8880b8732f1b R09: 1ffff110170e65e3
R10: dffffc0000000000 R11: ffffed10170e65e4 R12: ffffffff8fa193f0
R13: 0000000000000001 R14: 0000000000000001 R15: 1ffff110039d5b40
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x13/0x20 arch/x86/kernel/process.c:749
 default_idle_call+0x74/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:190 [inline]
 do_idle+0x1e8/0x510 kernel/sched/idle.c:330
 cpu_startup_entry+0x44/0x60 kernel/sched/idle.c:428
 start_secondary+0x101/0x110 arch/x86/kernel/smpboot.c:315
 common_startup_64+0x13e/0x147
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:pidfs_free_pid+0xaf/0x140 fs/pidfs.c:162
Code: f0 ff ff 73 e4 43 80 3c 3c 00 74 08 4c 89 f7 e8 67 19 de ff 49 83 3e 00 0f 85 84 00 00 00 e8 78 ee 79 ff 48 89 d8 48 c1 e8 03 <42> 80 3c 38 00 74 08 48 89 df e8 42 19 de ff 4c 8b 33 4d 85 f6 74
RSP: 0018:ffffc90000a08b90 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff88801ceada00
RDX: 0000000000000100 RSI: 0000000000000001 RDI: ffff8880745f4370
RBP: 0000000000000001 R08: ffff8880745f4303 R09: 1ffff1100e8be860
R10: dffffc0000000000 R11: ffffed100e8be861 R12: 1ffff1100e8be86d
R13: ffffffff81a8bfb4 R14: ffff8880745f4368 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125d26000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffcc2d1bf28 CR3: 00000000745f2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	f0 ff                	lock (bad)
   2:	ff 73 e4             	push   -0x1c(%rbx)
   5:	43 80 3c 3c 00       	cmpb   $0x0,(%r12,%r15,1)
   a:	74 08                	je     0x14
   c:	4c 89 f7             	mov    %r14,%rdi
   f:	e8 67 19 de ff       	call   0xffde197b
  14:	49 83 3e 00          	cmpq   $0x0,(%r14)
  18:	0f 85 84 00 00 00    	jne    0xa2
  1e:	e8 78 ee 79 ff       	call   0xff79ee9b
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 42 19 de ff       	call   0xffde197b
  39:	4c 8b 33             	mov    (%rbx),%r14
  3c:	4d 85 f6             	test   %r14,%r14
  3f:	74                   	.byte 0x74


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
