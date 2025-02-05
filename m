Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A422E41C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752665; cv=none; b=g2nPieZS9fO494e7BlxFBzl9uuhOUmjiTw6xLQoqkVEXAmj5vz4QfRdc1sYYXZSXPkcJwWqYiSBXNq27LDKWcyDFLknNA4MU3dv+/zdy13/BJQyEJ7SoSRi22i4bXXG6x95zJVl4fWRV48Wt+Q2KmY4EhbH6PNM0JUMBu5hjATM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752665; c=relaxed/simple;
	bh=NGLKtdvwLOxZUBp1PSkKYgtnhU+ApU8IKHKyyokFpjI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qrYKBS2QncvbO6U8jKouecX7YfbZQZCur4k+etx7VGZDi8WEDcw++hJKB8z4fgvb3EALLRb+bLGSLlLbZjUgBRTCE4vBeyEMoeLnswEfA1eEsgTfYYgkLlHA7OccU0sMOsS5jAJp+izqN2oJN+pGqc2jec6ayUOBfYrJ+eLfzpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3cdd61a97easo46861395ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738752663; x=1739357463;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2d0MBoouwV5rEivSF5Trt7BkANqzsCSLCP2BMH1Mw8=;
        b=XYGwvQj4h+Y4JSTkkEtWAwxabpDL1Cb5KPjQO44Gn2f3++cf/AOv/62JSX1OW8JtVE
         bc+yS6rFkqNabezHFaAXOfi44sZ/0vv/8nlZfAVkaSb9eZK7/HL44BVCUIgCYaU2gA2j
         puFgJHGUxLWjTrd+pgSaGzowbXZfM7Y7VLI7e9LB7G3gfdGkWlvFd9LidprcdwItUddn
         lBqggP1inJPfFrXScvENt30k0GFnY3fR4TLx/sF8xt1sbZLTTXOG+SIZ0iZZsDZD2aOz
         +PSajkNen/mSxeI/QxuVWOu5eJ5zIlQ27xuPhoaMr/pl4sZ2uyywHlD0ggs0ouiVPRlI
         q9FA==
X-Forwarded-Encrypted: i=1; AJvYcCUMZFlpKRzVHW4zH2+wWoeT2dJ7Uj2PB1tEKGrjjwL5E119xZddppOsKIPFD136lnNu3nKP5cuLD4rTILw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfmPkOVhxqJ94QKWBcfeZibTFPF9Ul9zc883Z/93MDPPnafYx8
	UBCpoKDhjan5/wW0Gb93CnozX5d75ia9kL7agqnHcw27mUvRtKsiJLsihGrxQYK7YvrNTHwwPeZ
	S6kpDwsLfLm6uFYA0cWNSgzMq43dcKBAmTOk14JrLM9R0iDmRjJ8eHPI=
X-Google-Smtp-Source: AGHT+IGIDypvnUTU3cDxW8tKqW9BroaqjS28R1zVlWEDB0jvMY09OY9qMmm53oUAZNNgYTpelFYtlrSjtQXdrAPV7izMJFi2SCTN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3309:b0:3cf:fc11:90ca with SMTP id
 e9e14a558f8ab-3d04f42561emr21369245ab.6.1738752662946; Wed, 05 Feb 2025
 02:51:02 -0800 (PST)
Date: Wed, 05 Feb 2025 02:51:02 -0800
In-Reply-To: <20250205103421.1895-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a34296.050a0220.50516.0026.GAE@google.com>
Subject: Re: [syzbot] [mm?] [bcachefs?] UBSAN: shift-out-of-bounds in shmem_add_to_page_cache
From: syzbot <syzbot+07392c132f11b1758ac3@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: unable to handle kernel NULL pointer dereference in rcu_core

 slab radix_tree_node start ffff8880445ce000 pointer offset 24 size 576
BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 43300067 P4D 43300067 PUD 4f195067 PMD 0 
Oops: Oops: 0010 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 6415 Comm: syz.4.91 Not tainted 6.14.0-rc1-syzkaller-g5c8c229261f1-dirty #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc90000007bd8 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 1ffff110088b9c04 RCX: 9d652f5789475c00
RDX: 0000000000000100 RSI: 0000000000000000 RDI: ffff8880445ce018
RBP: ffffc90000007e10 R08: ffffffff819f146c R09: 1ffff11003f8519a
R10: dffffc0000000000 R11: 0000000000000000 R12: ffffffff81a6d507
R13: ffff8880445ce020 R14: 0000000000000000 R15: ffff8880445ce018
FS:  00007f876c1686c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000051892000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 rcu_do_batch kernel/rcu/tree.c:2546 [inline]
 rcu_core+0xaaa/0x17a0 kernel/rcu/tree.c:2802
 handle_softirqs+0x2d4/0x9b0 kernel/softirq.c:561
 __do_softirq kernel/softirq.c:595 [inline]
 invoke_softirq kernel/softirq.c:435 [inline]
 __irq_exit_rcu+0xf7/0x220 kernel/softirq.c:662
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:678
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_acquire+0x264/0x550 kernel/locking/lockdep.c:5855
Code: 2b 00 74 08 4c 89 f7 e8 fa 3b 8b 00 f6 44 24 61 02 0f 85 85 01 00 00 41 f7 c7 00 02 00 00 74 01 fb 48 c7 44 24 40 0e 36 e0 45 <4b> c7 44 25 00 00 00 00 00 43 c7 44 25 09 00 00 00 00 43 c7 44 25
RSP: 0018:ffffc90002b0f080 EFLAGS: 00000206
RAX: 0000000000000001 RBX: 1ffff92000561e1c RCX: ffff88800076af28
RDX: dffffc0000000000 RSI: ffffffff8c0ab8e0 RDI: ffffffff8c608a00
RBP: ffffc90002b0f1d8 R08: ffffffff942f9847 R09: 1ffffffff285f308
R10: dffffc0000000000 R11: fffffbfff285f309 R12: 1ffff92000561e18
R13: dffffc0000000000 R14: ffffc90002b0f0e0 R15: 0000000000000246
 rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 page_ext_get+0x3d/0x2a0 mm/page_ext.c:525
 __set_page_owner+0x9e/0x800 mm/page_owner.c:322
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0x365c/0x37a0 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x292/0x710 mm/page_alloc.c:4739
 alloc_pages_mpol+0x311/0x660 mm/mempolicy.c:2270
 folio_alloc_mpol_noprof+0x36/0x70 mm/mempolicy.c:2289
 shmem_alloc_folio mm/shmem.c:1863 [inline]
 shmem_alloc_and_add_folio+0x4a0/0x1090 mm/shmem.c:1902
 shmem_get_folio_gfp+0x621/0x1840 mm/shmem.c:2522
 shmem_get_folio mm/shmem.c:2628 [inline]
 shmem_write_begin+0x165/0x350 mm/shmem.c:3278
 generic_perform_write+0x346/0x990 mm/filemap.c:4189
 shmem_file_write_iter+0xf9/0x120 mm/shmem.c:3454
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write+0xacf/0xd10 fs/read_write.c:679
 ksys_write+0x18f/0x2b0 fs/read_write.c:731
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f876b38b85f
Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 f9 92 02 00 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 48 89 44 24 08 e8 4c 93 02 00 48
RSP: 002b:00007f876c167df0 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000001000000 RCX: 00007f876b38b85f
RDX: 0000000001000000 RSI: 00007f8762000000 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000005939
R10: 0000000020005b42 R11: 0000000000000293 R12: 0000000000000003
R13: 00007f876c167ef0 R14: 00007f876c167eb0 R15: 00007f8762000000
 </TASK>
Modules linked in:
CR2: 0000000000000000
---[ end trace 0000000000000000 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc90000007bd8 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 1ffff110088b9c04 RCX: 9d652f5789475c00
RDX: 0000000000000100 RSI: 0000000000000000 RDI: ffff8880445ce018
RBP: ffffc90000007e10 R08: ffffffff819f146c R09: 1ffff11003f8519a
R10: dffffc0000000000 R11: 0000000000000000 R12: ffffffff81a6d507
R13: ffff8880445ce020 R14: 0000000000000000 R15: ffff8880445ce018
FS:  00007f876c1686c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000051892000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	2b 00                	sub    (%rax),%eax
   2:	74 08                	je     0xc
   4:	4c 89 f7             	mov    %r14,%rdi
   7:	e8 fa 3b 8b 00       	call   0x8b3c06
   c:	f6 44 24 61 02       	testb  $0x2,0x61(%rsp)
  11:	0f 85 85 01 00 00    	jne    0x19c
  17:	41 f7 c7 00 02 00 00 	test   $0x200,%r15d
  1e:	74 01                	je     0x21
  20:	fb                   	sti
  21:	48 c7 44 24 40 0e 36 	movq   $0x45e0360e,0x40(%rsp)
  28:	e0 45
* 2a:	4b c7 44 25 00 00 00 	movq   $0x0,0x0(%r13,%r12,1) <-- trapping instruction
  31:	00 00
  33:	43 c7 44 25 09 00 00 	movl   $0x0,0x9(%r13,%r12,1)
  3a:	00 00
  3c:	43                   	rex.XB
  3d:	c7                   	.byte 0xc7
  3e:	44                   	rex.R
  3f:	25                   	.byte 0x25


Tested on:

commit:         5c8c2292 Merge tag 'kthreads-fixes-2025-02-04' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14e893df980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4119253b6ce043db
dashboard link: https://syzkaller.appspot.com/bug?extid=07392c132f11b1758ac3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14dc3eb0580000

