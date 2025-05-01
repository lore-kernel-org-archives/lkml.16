Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76391DB54C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746116606; cv=none; b=B2OnDVhfwiANY4fytsSQxBPG3/V4Z2aXE+IvGh6usg8z4BJ8ypmzKud+6wufLeUB+GV2u6opnccOdmvaUlRMoGnrjP9pciJH40yJGpWTR0ioljRQld2rtPX7h7gbfK+o0qdbp8LgUDXuXid55UFTvZQCzEzvmVUevIDfCOHeRg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746116606; c=relaxed/simple;
	bh=0XAbFXAcaSLV6gf3TlAXd9ukQpBYX3PFkwO4ZrzrlnI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=EveN5I4RrWlxxzrESRoP2BlwQz+Lfnq64H8JLzXFxSe0878pLmld5ty2TZ9Cv79esYr58IuqbQenH1DV82XdP49ISJ/a2Wz92HsTxeaSpQNKbmfRruAiw8GVJVCi5IJRIpR9Zr3TwyyuDtBofFvI8RQp06+q0Rml2l/ZfMlr2mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so14361485ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 09:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746116604; x=1746721404;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J7qNqjWpMltAIcqHu/zmcifvX+DXh1vbNZgi9eZ3k5E=;
        b=jawdP38CMixPAGpTpXnV0r3AEtGI+jC5ArpjMZzgcPuSRW4y+zMgkNz4vu94HTdje4
         cWbWN/8QTzD4o9z2TIfSszz/MXEOzeB/CS3xWBUpQ2sF6yvVUclayGol4G7rtpH+palI
         qHpf4i0lmIgGd1SCE7IFQbM5MMuriCHTlc9cwjI40tSJ4tUb39DlIFS3SiHoJi3TV4KE
         K7AzbZ+it2U+DWOVsyKmYZdm15iLNSngGUEIkNdLDucUHqOF5xokyOJ5MNE5BG8Lf2Ki
         DyJO96UrhNLvr8LpXVsA6LmzLPI/w4YLToVXWLG4VkKmNuuc494SneFdOmnYKKOdq303
         K0nw==
X-Forwarded-Encrypted: i=1; AJvYcCVQrUGZgCz4v3YZRvo1gMVxaOgtIZP9/qHTrUtImykEXPQW8CzqJBgjtxWB4Ra/5Y3FOeDSaAGhbmU8cBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvuKNZuwPtAyddI/+iAJkQNN9nywx/3OzxbOOzIcfNWF5fDbbq
	pO0b5WXPBPCrOVsy5qXluNLtJLg30SWLlW32X0Y7mjZPJnMflsXRzNOXiLyznWxGQJp5m6xyQ9b
	/CqRS3WhEXK0mRTSuwES4F7mIA1PFiK1n3LXjzMnxJUV84dhUb1lyu9w=
X-Google-Smtp-Source: AGHT+IFjkHP6cIIL2hekPK3HrN0Papxq9C0+G28KfT54dKiTjd4WJds+hTcDBK8HdtPSAHoDybRtfUUaaVCEgKc8+WKEeb3pooYE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c24e:0:b0:3d8:1f87:9433 with SMTP id
 e9e14a558f8ab-3d9701fbd11mr35920465ab.11.1746116603922; Thu, 01 May 2025
 09:23:23 -0700 (PDT)
Date: Thu, 01 May 2025 09:23:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68139ffb.050a0220.3a872c.0015.GAE@google.com>
Subject: [syzbot] [mm?] BUG: Bad page state in page_cache_ra_order
From: syzbot <syzbot+7b3842775c9ce6b69efc@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5bc1018675ec Merge tag 'pci-v6.15-fixes-3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=175930d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9f5bd2a76d9d0b4e
dashboard link: https://syzkaller.appspot.com/bug?extid=7b3842775c9ce6b69efc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b72374580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12781270580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-5bc10186.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/db0c2eeb9aae/vmlinux-5bc10186.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7bef337ab40d/bzImage-5bc10186.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7b3842775c9ce6b69efc@syzkaller.appspotmail.com

BUG: Bad page state in process syz-executor356  pfn:35e01
page does not match folio
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffffffffffffffff pfn:0x35e01
ksm flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 ffffea0000d78000 00000000ffffffff ffffffffffffffff
raw: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: nonzero pincount
page_owner tracks the page as allocated
page last allocated via order 9, migratetype Unmovable, gfp_mask 0x152c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL), pid 5919, tgid 5919 (syz-executor356), ts 42998011464, free_ts 0
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
page_owner free stack trace missing
Modules linked in:
CPU: 3 UID: 0 PID: 5919 Comm: syz-executor356 Not tainted 6.15.0-rc3-syzkaller-00342-g5bc1018675ec #0 PREEMPT(full) 
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
 kill_bdev block/bdev.c:91 [inline]
 blkdev_flush_mapping+0xfb/0x290 block/bdev.c:712
 blkdev_put_whole+0xc4/0xf0 block/bdev.c:719
 bdev_release+0x47e/0x6d0 block/bdev.c:1144
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
RIP: 0033:0x7fe721146d09
Code: Unable to access opcode bytes at 0x7fe721146cdf.
RSP: 002b:00007fff045c05b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fe721146d09
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
RBP: 00007fe7211c12b0 R08: ffffffffffffffb8 R09: 0000000000000006
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fe7211c12b0
R13: 0000000000000000 R14: 00007fe7211c1d00 R15: 00007fe721117f60
 </TASK>
BUG: Bad page state in process syz-executor356  pfn:35e00
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x35e00
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
page last allocated via order 9, migratetype Unmovable, gfp_mask 0x152c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL), pid 5919, tgid 5919 (syz-executor356), ts 42998011464, free_ts 0
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
page_owner free stack trace missing
Modules linked in:
CPU: 2 UID: 0 PID: 5919 Comm: syz-executor356 Tainted: G    B               6.15.0-rc3-syzkaller-00342-g5bc1018675ec #0 PREEMPT(full) 
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
 kill_bdev block/bdev.c:91 [inline]
 blkdev_flush_mapping+0xfb/0x290 block/bdev.c:712
 blkdev_put_whole+0xc4/0xf0 block/bdev.c:719
 bdev_release+0x47e/0x6d0 block/bdev.c:1144
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
RIP: 0033:0x7fe721146d09
Code: Unable to access opcode bytes at 0x7fe721146cdf.
RSP: 002b:00007fff045c05b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fe721146d09
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
RBP: 00007fe7211c12b0 R08: ffffffffffffffb8 R09: 0000000000000006
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fe7211c12b0
R13: 0000000000000000 R14: 00007fe7211c1d00 R15: 00007fe721117f60
 </TASK>


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
