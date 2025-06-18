Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874CA274FC2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251393; cv=none; b=UPgNV2od07MtDvfcJT4DLlRD7httP7f42vLGJ1YRl4okt+CNuLNknFt6LFtx1sHtzop+wEOHC959SuUmOD0g7e3ELRMD6VDqrfwea/mbY0l0svs3AhDL9aTGDUzla6BZtOoy6PTh9Xs5BL53oPErO4vWEhOdOYAI6LKlDeMF/lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251393; c=relaxed/simple;
	bh=vsZlVMPDHJEYBLzq+vc5tdWK+Sh+xIRbpB7LJVWwQQk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=g+MaL6svuOGnnPeyK12dc+vke2vjeFPSzS63Ho2IsVkMzQ0H/cqDOx+/M4KDF5mSZAdxAfsgsVGQPFuK/sGyU8CjutT10dF7OFBjVkeClF+BPU5rm2mvBZzamQRm1oJrFH++DifILVTI6XCvdBktKMO7vjngyVTNKfiyqZZJP2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddccc79b55so47758975ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251391; x=1750856191;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H/0Sg4q8lvuTw5Df2gusQ/ikE58oc87m9xvuN8y1bCw=;
        b=rIEj1LqZktu9o6osI1ZPYIouLJNEXs8gUcwb8GMLZA+37uzMY1shdG5JWgWbYT/B17
         JAQy5r684pFlCRPG9MrM4v9tKhiq7OfIYTigh7pPUVwC7v25CyndG2KeSD8tHSHG9TcK
         mp+DueNHD5Fm1L8NunA8uz59xlW04njlBmnHtMzKl62OLdfijLb7SpxMX6n8fDD4M/Xc
         TSAujBorKvuxCw/kzd67FrvqLjS4uUfVIszFEPsq8/igfybvQmyIrLruSZ8MAITTIVAB
         5lIvSdJmdMFUoOx0jYbAnjK1gusQC0/TAUa+SCsSCcf+wUG3p4rO8pdva8c/eUkF9eoH
         pgzg==
X-Gm-Message-State: AOJu0YxXHCqVH0ei2aPJgQbxyPSDpmyqnFxs/1Ir/iylG3n+Q2XVaF3+
	pezXDSE7t+eDS3Vna1Ln6RZwzRe3K3MPyp2xuWZV0uNij1izPsBEyoqIB+DvkapycO/fGofahNh
	KBBIaLrfWLipm+4egxnb0HUb87n+97O04qhY1izxcErEloKg8vbTs3LiomHB/cA==
X-Google-Smtp-Source: AGHT+IGXQBVuFucsP9xkZepT9fvWxo1RbWlgXKPDz/5etQlp4temXcTIhqGTfm2M/3ffHbeSGlZKLs6Ai6WNXNon3o6mxffuAoSU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a44:b0:3dc:7df8:c830 with SMTP id
 e9e14a558f8ab-3de07c55a19mr199296725ab.7.1750251390730; Wed, 18 Jun 2025
 05:56:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 05:56:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6852b77e.a70a0220.79d0a.0215.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING: refcount bug in delayed_put_task_struct
From: syzbot <syzbot+fb194529d2cbbf9f1467@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4663747812d1 Merge tag 'platform-drivers-x86-v6.16-2' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11d5de82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6f01a06a8393850
dashboard link: https://syzkaller.appspot.com/bug?extid=fb194529d2cbbf9f1467
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1627d5d4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ef27ce1c74bb/disk-46637478.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2962783b1956/vmlinux-46637478.xz
kernel image: https://storage.googleapis.com/syzbot-assets/faa841f27097/bzImage-46637478.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fb194529d2cbbf9f1467@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: CPU: 1 PID: 6673 at lib/refcount.c:28 refcount_warn_saturate+0x14a/0x210 lib/refcount.c:28
Modules linked in:
CPU: 1 UID: 0 PID: 6673 Comm: kworker/u8:12 Not tainted 6.16.0-rc2-syzkaller-00045-g4663747812d1 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events_unbound nsim_dev_trap_report_work
RIP: 0010:refcount_warn_saturate+0x14a/0x210 lib/refcount.c:28
Code: ff 89 de e8 a8 e3 e2 fc 84 db 0f 85 66 ff ff ff e8 bb e8 e2 fc c6 05 a9 f1 b7 0b 01 90 48 c7 c7 a0 0f 15 8c e8 67 00 a2 fc 90 <0f> 0b 90 90 e9 43 ff ff ff e8 98 e8 e2 fc 0f b6 1d 84 f1 b7 0b 31
RSP: 0018:ffffc90000a08dd8 EFLAGS: 00010286

RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff817aa1a8
RDX: ffff88802e90da00 RSI: ffffffff817aa1b5 RDI: 0000000000000001
RBP: ffff88805ae68028 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 000000000008e038 R12: ffff88805ae68000
R13: ffff88805ae68028 R14: ffffc90000a08e90 R15: 0000000000000004
FS:  0000000000000000(0000) GS:ffff888124861000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8ed0a91f98 CR3: 0000000077b4c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 __refcount_sub_and_test include/linux/refcount.h:400 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 put_task_struct include/linux/sched/task.h:134 [inline]
 delayed_put_task_struct+0x239/0x2e0 kernel/exit.c:230
 rcu_do_batch kernel/rcu/tree.c:2576 [inline]
 rcu_core+0x799/0x14e0 kernel/rcu/tree.c:2832
 handle_softirqs+0x216/0x8e0 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0x109/0x170 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa4/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:kasan_quarantine_put+0x97/0x240 mm/kasan/quarantine.c:237
Code: 00 00 00 00 00 48 03 5a 10 48 89 5a 10 48 81 fb 00 00 10 00 0f 87 94 00 00 00 4d 85 ed 75 79 9c 58 f6 c4 02 0f 85 6d 01 00 00 <5b> b8 01 00 00 00 5d 41 5c 41 5d 41 5e e9 47 b4 5d 09 e8 82 db a1
RSP: 0018:ffffc9000b4c7ac0 EFLAGS: 00000246
RAX: 0000000000000006 RBX: 000000000009b258 RCX: 0000000000000006
RDX: 0000000000000000 RSI: ffffffff8de13aed RDI: ffffffff8c1563e0
RBP: ffff8880362b4640 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff90a83057 R11: 0000000000002c00 R12: ffff88801fea08c0
R13: 0000000000000200 R14: ffffea0000d8ad00 R15: 0000000000000000
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kmem_cache_free+0x2d1/0x4d0 mm/slub.c:4745
 kfree_skbmem+0x1a4/0x1f0 net/core/skbuff.c:1110
 __kfree_skb net/core/skbuff.c:1167 [inline]
 consume_skb net/core/skbuff.c:1398 [inline]
 consume_skb+0xcc/0x100 net/core/skbuff.c:1392
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:821 [inline]
 nsim_dev_trap_report_work+0x8bd/0xcf0 drivers/net/netdevsim/dev.c:851
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d7/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	00 00                	add    %al,(%rax)
   4:	00 48 03             	add    %cl,0x3(%rax)
   7:	5a                   	pop    %rdx
   8:	10 48 89             	adc    %cl,-0x77(%rax)
   b:	5a                   	pop    %rdx
   c:	10 48 81             	adc    %cl,-0x7f(%rax)
   f:	fb                   	sti
  10:	00 00                	add    %al,(%rax)
  12:	10 00                	adc    %al,(%rax)
  14:	0f 87 94 00 00 00    	ja     0xae
  1a:	4d 85 ed             	test   %r13,%r13
  1d:	75 79                	jne    0x98
  1f:	9c                   	pushf
  20:	58                   	pop    %rax
  21:	f6 c4 02             	test   $0x2,%ah
  24:	0f 85 6d 01 00 00    	jne    0x197
* 2a:	5b                   	pop    %rbx <-- trapping instruction
  2b:	b8 01 00 00 00       	mov    $0x1,%eax
  30:	5d                   	pop    %rbp
  31:	41 5c                	pop    %r12
  33:	41 5d                	pop    %r13
  35:	41 5e                	pop    %r14
  37:	e9 47 b4 5d 09       	jmp    0x95db483
  3c:	e8                   	.byte 0xe8
  3d:	82                   	(bad)
  3e:	db                   	.byte 0xdb
  3f:	a1                   	.byte 0xa1


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
