Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4653C2581
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 03:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746157686; cv=none; b=WLhHQeZnudDllE/HVdKPJ2X0ul+an+LxJ30qv61kxGzfpNqdU3v0LqdjyNrfpXEfuYmnQ6SO9K57P9h1CuK6FlvGtRsOOMOHYB94escGUiOR4B4U7OZ/S/6n8le1wCkg6lPchpK4zLwDBK1OtEMu2an0SaaZkPKM2SvF4wW56I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746157686; c=relaxed/simple;
	bh=m/WLK77gTm3tJN1cO+cPgYj8843yzpMFoB0zJFo4eR8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qMDxyftM42rXhiMlf79W7rOg2JaK+dBt1pyrrUI4q/6IKvPUH40kJtoP54y7K8TwHlkFvi0NhbpYB7qSXo//odGkUJWY7gKd0zuLBfLYM9eAHiELuFe6zMydV/A5DczZxKWNip3Kf40QH2qWnbTf7LDdm5XOqTCEu1Ys0+CQlN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8649be94fa1so300215539f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 20:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746157683; x=1746762483;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gTfGKt3b8vX43pnTY2FeAAeCNF6R/Y/HGekGX/4OHZA=;
        b=jMbTZa+2QBvV57qeG+2VLkCpBR0csEBND4I3EN/nUFoTQtI/0Lmh3d7YpKkCTdcYKL
         AMq34sA6/7cVqeDtizcjoJh0ys53JVRpLgZ9IiLRT4T3sC1zbLzXYL6oxt8Y+vB+F2nj
         NwHBbPTEsoDiIZdm7ly353EYsCpdRGWM8jN5N5vGIlS6/azkE7tcGzoOMZEZR5cwizX0
         8QOlGEAtupUNGa3q6DF2VEl9T9qkN54LJZ2Hha3IX2YzvfBTqdW5ZKVWpvUllFsjrVtQ
         CH95VlKzv5dMYN1RC3apQctSewzVqXr4IjQaPb3G3vuwmrvbwJG27b/FPgl3J+wksTnp
         VmIg==
X-Forwarded-Encrypted: i=1; AJvYcCVq+97bdzQqNWRfX6KKhJ7yxw8euzefi4NH3BGXq0PFwbKd+JSsMeRET3W6oSVsqUxEBiqiy0urhxj4RZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjkYhzbxzZSyIn5bh5R84DXKF2CfGjfC7TEKmwvc1sAj9NQHFZ
	Bc5uWSImqd8f5c2/uxjuyFM50mff8XtYOCDAYSV3crOropZWxyK62QAULcePMSDmC1UjMLWAAf0
	R7fYaQJEcOiQYZDmzxD/Ds6PGZcPCXec2yATTllnqYI6AgY+dk16l6EY=
X-Google-Smtp-Source: AGHT+IGUdJv2qF+EXh1O/gKPgbBju0vv7FczDFZi2y7i7GHj/U3f8NoYe8eOK/Bb7y+EO4LrwU2tevgEKDMaljsklVLqKN4r4H7h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:7218:b0:864:88f9:62f2 with SMTP id
 ca18e2360f4ac-866b441afd7mr234129339f.9.1746157683310; Thu, 01 May 2025
 20:48:03 -0700 (PDT)
Date: Thu, 01 May 2025 20:48:03 -0700
In-Reply-To: <20250502033444.4396-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68144073.050a0220.53db9.0005.GAE@google.com>
Subject: Re: [syzbot] [mm?] BUG: Bad page state in page_cache_ra_order
From: syzbot <syzbot+7b3842775c9ce6b69efc@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: Bad page state in page_cache_ra_order

BUG: Bad page state in process syz.0.16  pfn:4e001
page does not match folio
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffffffffffffffff pfn:0x4e001
ksm flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 ffffea0001380000 00000000ffffffff ffffffffffffffff
raw: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: nonzero pincount
page_owner tracks the page as allocated
page last allocated via order 9, migratetype Unmovable, gfp_mask 0x152c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL), pid 6527, tgid 6527 (syz.0.16), ts 94244842343, free_ts 59432072975
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x135c/0x3920 mm/page_alloc.c:3688
 __alloc_frozen_pages_noprof+0x263/0x23a0 mm/page_alloc.c:4970
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2301
 alloc_pages_noprof mm/mempolicy.c:2392 [inline]
 folio_alloc_noprof+0x20/0x2d0 mm/mempolicy.c:2402
 filemap_alloc_folio_noprof+0x3a1/0x470 mm/filemap.c:1007
 ractl_alloc_folio mm/readahead.c:186 [inline]
 ra_alloc_folio mm/readahead.c:441 [inline]
 page_cache_ra_order+0x4c0/0xd00 mm/readahead.c:509
 do_sync_mmap_readahead mm/filemap.c:3225 [inline]
 filemap_fault+0x1a5e/0x2740 mm/filemap.c:3403
 __do_fault+0x10a/0x490 mm/memory.c:5098
 do_shared_fault mm/memory.c:5582 [inline]
 do_fault mm/memory.c:5656 [inline]
 do_pte_missing+0x1a6/0x3fb0 mm/memory.c:4160
 handle_pte_fault mm/memory.c:5997 [inline]
 __handle_mm_fault+0x103d/0x2a40 mm/memory.c:6140
 handle_mm_fault+0x3fe/0xad0 mm/memory.c:6309
 do_user_addr_fault+0x60c/0x1370 arch/x86/mm/fault.c:1337
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x5c/0xc0 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
page last free pid 6022 tgid 6022 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0x69d/0xff0 mm/page_alloc.c:2725
 vfree+0x176/0x960 mm/vmalloc.c:3383
 kcov_put kernel/kcov.c:439 [inline]
 kcov_put kernel/kcov.c:435 [inline]
 kcov_close+0x34/0x60 kernel/kcov.c:535
 __fput+0x3ff/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xafb/0x2c30 kernel/exit.c:953
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1102
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x7d0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x260 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
Modules linked in:
CPU: 3 UID: 0 PID: 6527 Comm: syz.0.16 Not tainted 6.15.0-rc4-syzkaller-gebd297a2affa-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 bad_page+0xb3/0x1f0 mm/page_alloc.c:505
 free_tail_page_prepare+0x44f/0x5b0 mm/page_alloc.c:1000
 free_pages_prepare mm/page_alloc.c:1238 [inline]
 __free_frozen_pages+0x96a/0xff0 mm/page_alloc.c:2725
 __folio_put+0x329/0x450 mm/swap.c:112
 folio_put_refs include/linux/mm.h:1600 [inline]
 filemap_free_folio+0x132/0x170 mm/filemap.c:235
 delete_from_page_cache_batch+0x741/0x9b0 mm/filemap.c:339
 truncate_inode_pages_range+0x279/0xe30 mm/truncate.c:376
 blkdev_flush_mapping+0xe9/0x280 block/bdev.c:717
 blkdev_put_whole+0xc4/0xf0 block/bdev.c:726
 bdev_release+0x47e/0x6d0 block/bdev.c:1151
 blkdev_release+0x15/0x20 block/fops.c:660
 __fput+0x3ff/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xafb/0x2c30 kernel/exit.c:953
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1102
 __do_sys_exit_group kernel/exit.c:1113 [inline]
 __se_sys_exit_group kernel/exit.c:1111 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1111
 x64_sys_call+0x1530/0x1730 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9fe6f8e969
Code: Unable to access opcode bytes at 0x7f9fe6f8e93f.
RSP: 002b:00007ffdca8b3c98 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f9fe6f8e969
RDX: 0000000000000064 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000003 R08: 00000006ca8b3d8f R09: 00007f9fe717d260
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f9fe717d260 R14: 0000000000000003 R15: 00007ffdca8b3d50
 </TASK>
BUG: Bad page state in process syz.0.16  pfn:4e000
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4e000
head: order:0 mapcount:0 entire_mapcount:1 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000049(locked|uptodate|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000049 dead000000000100 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
head: 00fff00000000049 dead000000000100 dead000000000122 0000000000000000
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
head: 00fff00000000000 0000000000000000 00000000ffffffff 0000000000000000
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
page_owner tracks the page as allocated
page last allocated via order 9, migratetype Unmovable, gfp_mask 0x152c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL), pid 6527, tgid 6527 (syz.0.16), ts 94244842343, free_ts 59432061555
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x135c/0x3920 mm/page_alloc.c:3688
 __alloc_frozen_pages_noprof+0x263/0x23a0 mm/page_alloc.c:4970
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2301
 alloc_pages_noprof mm/mempolicy.c:2392 [inline]
 folio_alloc_noprof+0x20/0x2d0 mm/mempolicy.c:2402
 filemap_alloc_folio_noprof+0x3a1/0x470 mm/filemap.c:1007
 ractl_alloc_folio mm/readahead.c:186 [inline]
 ra_alloc_folio mm/readahead.c:441 [inline]
 page_cache_ra_order+0x4c0/0xd00 mm/readahead.c:509
 do_sync_mmap_readahead mm/filemap.c:3225 [inline]
 filemap_fault+0x1a5e/0x2740 mm/filemap.c:3403
 __do_fault+0x10a/0x490 mm/memory.c:5098
 do_shared_fault mm/memory.c:5582 [inline]
 do_fault mm/memory.c:5656 [inline]
 do_pte_missing+0x1a6/0x3fb0 mm/memory.c:4160
 handle_pte_fault mm/memory.c:5997 [inline]
 __handle_mm_fault+0x103d/0x2a40 mm/memory.c:6140
 handle_mm_fault+0x3fe/0xad0 mm/memory.c:6309
 do_user_addr_fault+0x60c/0x1370 arch/x86/mm/fault.c:1337
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x5c/0xc0 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
page last free pid 6022 tgid 6022 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0x69d/0xff0 mm/page_alloc.c:2725
 vfree+0x176/0x960 mm/vmalloc.c:3383
 kcov_put kernel/kcov.c:439 [inline]
 kcov_put kernel/kcov.c:435 [inline]
 kcov_close+0x34/0x60 kernel/kcov.c:535
 __fput+0x3ff/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xafb/0x2c30 kernel/exit.c:953
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1102
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x7d0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x260 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
Modules linked in:
CPU: 2 UID: 0 PID: 6527 Comm: syz.0.16 Tainted: G    B               6.15.0-rc4-syzkaller-gebd297a2affa-dirty #0 PREEMPT(full) 
Tainted: [B]=BAD_PAGE
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 bad_page+0xb3/0x1f0 mm/page_alloc.c:505
 free_page_is_bad_report mm/page_alloc.c:938 [inline]
 free_page_is_bad mm/page_alloc.c:948 [inline]
 free_pages_prepare mm/page_alloc.c:1254 [inline]
 __free_frozen_pages+0x76e/0xff0 mm/page_alloc.c:2725
 __folio_put+0x329/0x450 mm/swap.c:112
 folio_put_refs include/linux/mm.h:1600 [inline]
 filemap_free_folio+0x132/0x170 mm/filemap.c:235
 delete_from_page_cache_batch+0x741/0x9b0 mm/filemap.c:339
 truncate_inode_pages_range+0x279/0xe30 mm/truncate.c:376
 blkdev_flush_mapping+0xe9/0x280 block/bdev.c:717
 blkdev_put_whole+0xc4/0xf0 block/bdev.c:726
 bdev_release+0x47e/0x6d0 block/bdev.c:1151
 blkdev_release+0x15/0x20 block/fops.c:660
 __fput+0x3ff/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xafb/0x2c30 kernel/exit.c:953
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1102
 __do_sys_exit_group kernel/exit.c:1113 [inline]
 __se_sys_exit_group kernel/exit.c:1111 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1111
 x64_sys_call+0x1530/0x1730 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9fe6f8e969
Code: Unable to access opcode bytes at 0x7f9fe6f8e93f.
RSP: 002b:00007ffdca8b3c98 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f9fe6f8e969
RDX: 0000000000000064 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000003 R08: 00000006ca8b3d8f R09: 00007f9fe717d260
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f9fe717d260 R14: 0000000000000003 R15: 00007ffdca8b3d50
 </TASK>


Tested on:

commit:         ebd297a2 Merge tag 'net-6.15-rc5' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=124eb02f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ca17f2d2ba38f7a0
dashboard link: https://syzkaller.appspot.com/bug?extid=7b3842775c9ce6b69efc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13e0b774580000

