Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5C2E630
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376962; cv=none; b=SBa+Bv6JNqEL59vKxVeqExyE+RR+rYbVi08+qxGScC5nuWNzKlTFooDz64G3DvZ3xjP/IZhhDCV1zFuzn38v5lXfsZXV6AyRD8H9yVNvZYAHh4wi4ZgHA7x1YDAqZfnHtptE101pXkx6twWsDvxXS4dt1UyEZ7SCfjCq7x5ERWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376962; c=relaxed/simple;
	bh=kiGJQf1QsUySTeLczyn9mh2DyID2PtPL9PGDwvMWZiA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=unb0wfA6Y2wdJELJGXGGhARsn8a6iAcBlUslLV4wRnMoT2nmWAYbA1Wfm5moGeACgbGejd3uP/qtj5X2cRFgnEgPlugy3nUnBTFUmTXqpS6kWRFnCo0dGj4Q83kwdsAOYCsPaRixDTqqYSOpHGBNYPTTZR9gLRspGAkQZVTYKRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-851a991cf8bso255342939f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744376960; x=1744981760;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CEowMupmN8dmOPdvTeu2PF4PfXyiIU0FZgd8XCp/9so=;
        b=Rk+2pcuS6wbzLTJtuXaKj0dFC/NxX0BKBGhkvrPegTKSeOqq3kSyZfxPcMyZlAP0lN
         G5/zq11XDUXiJY8yycPBEVATeQ4M4CtSDAKuXeAtPYyDvI6B2GrfpcAp6jt6STyx9Qnz
         zWucHKfJoMftNfBXDf7IB5DFM1t0DgwkP8a/CJ8c62EjsyCOLuEye3oqOSTdewgREL5A
         uJ4SVt777A+6+v3FwEuf7J7dyLz4/4LlvMTxo8+4u0/rQaCFY97bgLazjLWvNMPnd/YX
         h2HDq3nauGcCzHvuESDxIm5xt5RKZdJqJcVpUtdlvP+AQkBGoYSjfWkagljNJg5LxAuG
         UOxg==
X-Gm-Message-State: AOJu0Yyi3Pi5IYMiHuHPMht6pn1l3CdPHQuPafwgblaiFYO5pmudS+xy
	UGt19iEuzWEzYSqpt4A0OWiJ5X8PJifsFUl3V1s12gZ3wsu2oQRjym0TIRJfT8EQOL4nr+moYg/
	1x2GTNcQDyPKK5ZKsTwDkSAy/TlTna/n9OHGnyF+CfglK+DiGSB846H3y+w==
X-Google-Smtp-Source: AGHT+IFHp7JGno+WCtE3VbIAyUwbaJ+dSV8ZIVuEDMIkMKAh//JyQcKbky7snEK//hUFQD3K7SxS2VfT77cDoFg8FlMkrDQua9O+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:360a:b0:3d3:f15e:8e23 with SMTP id
 e9e14a558f8ab-3d7ec00411emr27979685ab.10.1744376960220; Fri, 11 Apr 2025
 06:09:20 -0700 (PDT)
Date: Fri, 11 Apr 2025 06:09:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f91480.050a0220.355867.0026.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: stack-out-of-bounds Write in preempt_schedule_irq
From: syzbot <syzbot+dce69a6cda0826710f0e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luto@kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a4cda136f021 Add linux-next specific files for 20250404
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1433db4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a257c454bb1afb7
dashboard link: https://syzkaller.appspot.com/bug?extid=dce69a6cda0826710f0e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/59048bc9c206/disk-a4cda136.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ad2ba7306f20/vmlinux-a4cda136.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b3bef7acbf10/bzImage-a4cda136.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dce69a6cda0826710f0e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: stack-out-of-bounds in native_save_fl arch/x86/include/asm/irqflags.h:19 [inline]
BUG: KASAN: stack-out-of-bounds in arch_local_save_flags arch/x86/include/asm/irqflags.h:109 [inline]
BUG: KASAN: stack-out-of-bounds in arch_irqs_disabled arch/x86/include/asm/irqflags.h:151 [inline]
BUG: KASAN: stack-out-of-bounds in preempt_schedule_irq+0x10d/0x1c0 kernel/sched/core.c:7091
Write of size 8 at addr ffffc90004db6380 by task syz.3.172/6997

CPU: 1 UID: 0 PID: 6997 Comm: syz.3.172 Not tainted 6.14.0-next-20250404-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0x16e/0x5b0 mm/kasan/report.c:521
 kasan_report+0x143/0x180 mm/kasan/report.c:634
 native_save_fl arch/x86/include/asm/irqflags.h:19 [inline]
 arch_local_save_flags arch/x86/include/asm/irqflags.h:109 [inline]
 arch_irqs_disabled arch/x86/include/asm/irqflags.h:151 [inline]
 preempt_schedule_irq+0x10d/0x1c0 kernel/sched/core.c:7091
 irqentry_exit+0x5e/0x90 kernel/entry/common.c:354
 asm_sysvec_reschedule_ipi+0x1a/0x20 arch/x86/include/asm/idtentry.h:707
RIP: 0010:xas_load+0xd/0x5c0 lib/xarray.c:238
Code: 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 55 41 57 41 56 41 55 41 54 <53> 48 83 ec 48 49 89 fc 48 bd 00 00 00 00 00 fc ff df e8 cc a1 94
RSP: 0018:ffffc90004db64d0 EFLAGS: 00000287
RAX: ffffffff81fedbf2 RBX: ffffc90004db6580 RCX: 0000000000080000
RDX: ffffc9000d5ae000 RSI: 0000000000001020 RDI: ffffc90004db6580
RBP: ffffc90004db6630 R08: ffffffff81fedbd6 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
R13: ffffc90004db6580 R14: 1ffff920009b6cac R15: ffffffff81fedba5
 filemap_get_read_batch+0x242/0x960 mm/filemap.c:2361
 filemap_get_pages+0x60c/0x1fc0 mm/filemap.c:2593
 filemap_read+0x466/0x1260 mm/filemap.c:2701
 __kernel_read+0x532/0xa10 fs/read_write.c:528
 integrity_kernel_read+0xb2/0x100 security/integrity/iint.c:28
 ima_calc_file_hash_tfm security/integrity/ima/ima_crypto.c:480 [inline]
 ima_calc_file_shash security/integrity/ima/ima_crypto.c:511 [inline]
 ima_calc_file_hash+0xb22/0x1c10 security/integrity/ima/ima_crypto.c:568
 ima_collect_measurement+0x52b/0xb20 security/integrity/ima/ima_api.c:293
 process_measurement+0x13a3/0x1fe0 security/integrity/ima/ima_main.c:383
 ima_file_check+0xdb/0x130 security/integrity/ima/ima_main.c:611
 security_file_post_open+0xb9/0x280 security/security.c:3130
 do_open fs/namei.c:3847 [inline]
 path_openat+0x2cf7/0x35d0 fs/namei.c:4004
 do_filp_open+0x284/0x4e0 fs/namei.c:4031
 do_sys_openat2+0x12b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x249/0x2a0 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbf8ad8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbf88bd5038 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fbf8afa6080 RCX: 00007fbf8ad8d169
RDX: 0000000000000042 RSI: 0000200000000040 RDI: ffffffffffffff9c
RBP: 00007fbf8ae0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fbf8afa6080 R15: 00007ffe61db2558
 </TASK>

The buggy address belongs to stack of task syz.3.172/6997
 and is located at offset 32 in frame:
 preempt_schedule_irq+0x0/0x1c0 arch/x86/include/asm/bitops.h:-1

This frame has 2 objects:
 [32, 40) 'flags.i.i.i'
 [64, 72) 'flags.i.i'

The buggy address belongs to the virtual mapping at
 [ffffc90004db0000, ffffc90004db9000) created by:
 copy_process+0x5dc/0x3d10 kernel/fork.c:2259

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x36 pfn:0x51784
memcg:ffff88802f1c8e02
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 0000000000000000 dead000000000122 0000000000000000
raw: 0000000000000036 0000000000000000 00000001ffffffff ffff88802f1c8e02
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(GFP_KERNEL|__GFP_HIGHMEM|__GFP_ZERO|__GFP_NOWARN), pid 6870, tgid 6870 (dhcpcd-run-hook), ts 184650699844, free_ts 184571613308
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x356d/0x3700 mm/page_alloc.c:3655
 __alloc_frozen_pages_noprof+0x211/0x5b0 mm/page_alloc.c:4937
 alloc_pages_mpol+0x339/0x690 mm/mempolicy.c:2302
 alloc_frozen_pages_noprof mm/mempolicy.c:2373 [inline]
 alloc_pages_noprof+0x121/0x190 mm/mempolicy.c:2393
 vm_area_alloc_pages mm/vmalloc.c:3591 [inline]
 __vmalloc_area_node mm/vmalloc.c:3669 [inline]
 __vmalloc_node_range_noprof+0x9cb/0x1390 mm/vmalloc.c:3844
 __vmalloc_node_noprof+0x80/0xa0 mm/vmalloc.c:3907
 alloc_thread_stack_node kernel/fork.c:314 [inline]
 dup_task_struct+0x3f7/0x870 kernel/fork.c:1136
 copy_process+0x5dc/0x3d10 kernel/fork.c:2259
 kernel_clone+0x242/0x930 kernel/fork.c:2844
 __do_sys_clone kernel/fork.c:2987 [inline]
 __se_sys_clone kernel/fork.c:2971 [inline]
 __x64_sys_clone+0x268/0x2e0 kernel/fork.c:2971
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 6790 tgid 6789 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 free_unref_folios+0xe0e/0x17f0 mm/page_alloc.c:2739
 folios_put_refs+0x70a/0x800 mm/swap.c:992
 folio_batch_release include/linux/pagevec.h:101 [inline]
 truncate_inode_pages_range+0x462/0x10e0 mm/truncate.c:379
 kill_bdev block/bdev.c:91 [inline]
 blkdev_flush_mapping+0x108/0x270 block/bdev.c:674
 blkdev_put_whole block/bdev.c:681 [inline]
 bdev_release+0x460/0x700 block/bdev.c:1106
 blkdev_release+0x15/0x20 block/fops.c:660
 __fput+0x3e9/0x9f0 fs/file_table.c:465
 task_work_run+0x251/0x310 kernel/task_work.c:227
 get_signal+0x15db/0x1730 kernel/signal.c:2807
 arch_do_signal_or_restart+0x98/0x840 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xce/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffffc90004db6280: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90004db6300: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
>ffffc90004db6380: 00 f2 f2 f2 00 f3 f3 f3 00 00 00 00 00 00 00 00
                      ^
 ffffc90004db6400: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90004db6480: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================
----------------
Code disassembly (best guess):
   0:	2e 0f 1f 84 00 00 00 	cs nopl 0x0(%rax,%rax,1)
   7:	00 00
   9:	0f 1f 40 00          	nopl   0x0(%rax)
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
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	f3 0f 1e fa          	endbr64
  21:	55                   	push   %rbp
  22:	41 57                	push   %r15
  24:	41 56                	push   %r14
  26:	41 55                	push   %r13
  28:	41 54                	push   %r12
* 2a:	53                   	push   %rbx <-- trapping instruction
  2b:	48 83 ec 48          	sub    $0x48,%rsp
  2f:	49 89 fc             	mov    %rdi,%r12
  32:	48 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbp
  39:	fc ff df
  3c:	e8                   	.byte 0xe8
  3d:	cc                   	int3
  3e:	a1                   	.byte 0xa1
  3f:	94                   	xchg   %eax,%esp


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
