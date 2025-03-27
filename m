Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DC319E819
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092804; cv=none; b=hwuodlx1dWYckX6+DZrAAwGHVeAdMBI3TblupoyC+0WgRsBZORDctin4A+f8lSfn2Ti/9DBa5+wPTtCCxeRn+d6iqaiesyrJoJRZiyzI+yhDKxf+ALDzI5U4Sz/JDHSQongsPcIkhHBMqY1kV0O2Q9LltZrJvQgmulkh63bq7r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092804; c=relaxed/simple;
	bh=PYH2VFZ/sFJvtMVqUjaCoDco+iKXLEtORibUTHume6Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uKsQPtv0UAODZsLkk9+Us1Ik9KjfdYNqoRv16fhJQ0QU27+25jJlQ4Jm7a3zmpck6nFiNKrhuhvGgaWPzdFKcMKxu25lMOdoT6WH8GqnukmqENwMDCBIrY6yzxb2TYg/9LSDEt0VCngIPFVTIu14jAIulGRNhDIaFrRe+5RGJbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d43541a706so11619255ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092802; x=1743697602;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjMQEb+3X/62RuI7hvSW4qIVAnvT+B4IO8xldzXdJzw=;
        b=u+tQ6095VvsZllEe7zjmdN8C5NJURMZXdvJUZjYlyG9i/OkCi2UjDOzclJEDhxCNAC
         gyHv+j0WTFlVU36waRFKCmcvCiNixglG9URcbNkO5Yz99R1XHfbzZZa/ARJAiPjLHppg
         jPJiY5nBUWV+ZkhuD8/PXBpdWwVQocjGt5/Q6/Y3X9uvakZzY9Z+x7EkaHX7dUVSUsH9
         JZULM3q0XO1iZS9kba8oKzIt8K9t9yPPcRpueFX/JVm6EqCHHf24SkSYs9Xzkx83VBgK
         z9UqFS46kNpp3rQ8d1J/U1fZz7x9iYGmhz3TaxE1qfPzhH6EwXlnY/g7jwhxdlD9uUur
         P/5w==
X-Forwarded-Encrypted: i=1; AJvYcCUWSsCQLsxtycpWCpNKkFfm1VpnbkdpM5MHj/ij1Zn4RXlnnNiENSMY3llIFP8GDjFiXjmkt6OwfY8458g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpmNLGw9efBOwO7EmzuUBFgf5+KYZA6qsZn1/mtqtQoJ2I0kuk
	fbD3scDifL4LkLkIRysmq2Ppimemjb+LlLYEIU/O7AfYxQpW3u9xSvQFwu5d1Lr1iK4JpOvdSC8
	kW7RYryZ7LQ+sZ+AC0aXbD07a8GOWckH1Jypj9c8/YRNcr0tO02dDbYw=
X-Google-Smtp-Source: AGHT+IF60HQVnd2sW36pcTDM6rtnEH2PhWPxgt/j4cwKNdoKqxsmxkBcwjlX/4ANiYek1VvJsMasXuNH4+YdmgtTEsKZ8ZXRlMqM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2585:b0:3d2:6768:c4fa with SMTP id
 e9e14a558f8ab-3d5cce244afmr53801075ab.21.1743092801706; Thu, 27 Mar 2025
 09:26:41 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:26:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e57c41.050a0220.2f068f.0034.GAE@google.com>
Subject: [syzbot] [afs?] BUG: sleeping function called from invalid context in __alloc_frozen_pages_noprof
From: syzbot <syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2df0c02dab82 x86 boot build: make git ignore stale 'tools'..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15bcc198580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5f1762820c18874b
dashboard link: https://syzkaller.appspot.com/bug?extid=3b6c5c6a1d0119b687a1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=114ffc4c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1580a804580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7fe089500003/disk-2df0c02d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d8df5abbd7c5/vmlinux-2df0c02d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/09d23e93d3a8/bzImage-2df0c02d.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/70d29040b480/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=1180a804580000)

The issue was bisected to:

commit 1d0b929fc070b4115403a0a6206a0c6a62dd61f5
Author: David Howells <dhowells@redhat.com>
Date:   Mon Feb 24 09:52:58 2025 +0000

    afs: Change dynroot to create contents on demand

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1207ade4580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1107ade4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1607ade4580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com
Fixes: 1d0b929fc070 ("afs: Change dynroot to create contents on demand")

BUG: sleeping function called from invalid context at ./include/linux/sched/mm.h:321
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 5828, name: syz-executor995
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
4 locks held by syz-executor995/5828:
 #0: ffff8880332ef0b8 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x247/0x310 fs/file.c:1213
 #1: ffff888053d08148 (&type->i_mutex_dir_key#7){.+.+}-{4:4}, at: iterate_dir+0x4a6/0x760 fs/readdir.c:101
 #2: ffffffff8eb3a760 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #2: ffffffff8eb3a760 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #2: ffffffff8eb3a760 (rcu_read_lock){....}-{1:3}, at: afs_dynroot_readdir+0x466/0xbe0 fs/afs/dynroot.c:351
 #3: ffff88806d7fed20 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_trylock include/linux/mmap_lock.h:209 [inline]
 #3: ffff88806d7fed20 (&mm->mmap_lock){++++}-{4:4}, at: get_mmap_lock_carefully mm/memory.c:6237 [inline]
 #3: ffff88806d7fed20 (&mm->mmap_lock){++++}-{4:4}, at: lock_mm_and_find_vma+0x32/0x2f0 mm/memory.c:6297
CPU: 1 UID: 0 PID: 5828 Comm: syz-executor995 Not tainted 6.14.0-syzkaller-01103-g2df0c02dab82 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 __might_resched+0x558/0x6c0 kernel/sched/core.c:8798
 might_alloc include/linux/sched/mm.h:321 [inline]
 prepare_alloc_pages+0x1cc/0x5c0 mm/page_alloc.c:4513
 __alloc_frozen_pages_noprof+0x181/0x7b0 mm/page_alloc.c:4729
 alloc_pages_mpol+0x339/0x690 mm/mempolicy.c:2301
 folio_alloc_mpol_noprof mm/mempolicy.c:2320 [inline]
 vma_alloc_folio_noprof+0x12d/0x260 mm/mempolicy.c:2355
 folio_prealloc+0x2e/0x170
 alloc_anon_folio mm/memory.c:4834 [inline]
 do_anonymous_page mm/memory.c:4891 [inline]
 do_pte_missing mm/memory.c:4057 [inline]
 handle_pte_fault mm/memory.c:5888 [inline]
 __handle_mm_fault+0x32e8/0x6ef0 mm/memory.c:6031
 handle_mm_fault+0x2c1/0x7e0 mm/memory.c:6200
 do_user_addr_fault arch/x86/mm/fault.c:1388 [inline]
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x2bb/0x8b0 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:filldir+0x2c4/0x6a0 fs/readdir.c:292
Code: 87 55 02 00 00 0f 01 cb 0f ae e8 48 8b 44 24 30 49 89 46 08 48 8b 4c 24 10 48 8b 44 24 60 48 89 01 48 8b 44 24 18 8b 6c 24 3c <66> 89 41 10 48 98 40 88 6c 01 ff 48 89 44 24 30 4d 63 f5 42 c6 44
RSP: 0018:ffffc90003a37be0 EFLAGS: 00050283
RAX: 0000000000000020 RBX: 0000200000002010 RCX: 0000200000001ff0
RDX: 0000000000000000 RSI: 0000200000001fd8 RDI: 0000200000002010
RBP: 0000000000000004 R08: ffffffff8240768d R09: 1ffff1100a7fa780
R10: dffffc0000000000 R11: ffffed100a7fa781 R12: ffff888029500e41
R13: 0000000000000005 R14: 0000200000001fd8 R15: 00007ffffffff000
 dir_emit include/linux/fs.h:3853 [inline]
 afs_dynroot_readdir_cells fs/afs/dynroot.c:310 [inline]
 afs_dynroot_readdir+0x814/0xbe0 fs/afs/dynroot.c:352
 iterate_dir+0x5a9/0x760 fs/readdir.c:108
 __do_sys_getdents fs/readdir.c:322 [inline]
 __se_sys_getdents+0x1ff/0x4e0 fs/readdir.c:308
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3db8a3a419
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff5882c0e8 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 65726f6e67693d72 RCX: 00007f3db8a3a419
RDX: 00000000000000b8 RSI: 0000200000001fc0 RDI: 0000000000000004
RBP: 00007fff5882c0f8 R08: 6c616b7a79732f2e R09: 6c616b7a79732f2e
R10: 6c616b7a79732f2e R11: 0000000000000246 R12: 0000000000000000
R13: 00007fff5882c358 R14: 000000
----------------
Code disassembly (best guess):
   0:	87 55 02             	xchg   %edx,0x2(%rbp)
   3:	00 00                	add    %al,(%rax)
   5:	0f 01 cb             	stac
   8:	0f ae e8             	lfence
   b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  10:	49 89 46 08          	mov    %rax,0x8(%r14)
  14:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  19:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  1e:	48 89 01             	mov    %rax,(%rcx)
  21:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  26:	8b 6c 24 3c          	mov    0x3c(%rsp),%ebp
* 2a:	66 89 41 10          	mov    %ax,0x10(%rcx) <-- trapping instruction
  2e:	48 98                	cltq
  30:	40 88 6c 01 ff       	mov    %bpl,-0x1(%rcx,%rax,1)
  35:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  3a:	4d 63 f5             	movslq %r13d,%r14
  3d:	42                   	rex.X
  3e:	c6                   	.byte 0xc6
  3f:	44                   	rex.R


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
