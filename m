Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494BB4C98
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746262745; cv=none; b=KXuFlbDtjLevNDozGQ//Z6nTiIjqfeLvjZcKFQrV+NjqZl1VPHXDJksyJWcb2iLdOn8PKMgK8iPdKFA3OsqvemJ2cFH8XQ+zg4BZReNP/Hswn8yWq7ncHBD1Enbfb+cqPhuE7iGEhAXBPVgmkFJHnrtHniwuAIoSGh0UTdB0YEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746262745; c=relaxed/simple;
	bh=6X6/NqptdIHfofKdm8/0tRzPziI6ycn5YLJ6a0MSTuU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ucq5ej1bEKaabTjyfanRo4p3u1YozgzN+WHm63iotA5O+bTeDcXV34UoPZLymjO9QYdCRLAJZ/udfOSY2+NSvqLoEP7sckWygcxiGhILGw0zVW0kYuelKNtD0AaIUHIdDppHOuMia2zDGsb/xPS2UzogdshUImVReDbfVImZcRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d8eda6c48cso40385185ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 01:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746262742; x=1746867542;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug5WYctcL/n4028OqQk2RWxJdzTF0z3QkQ7iEOcokj8=;
        b=ZdfookbqD6x2VyW5SwCs5KUV0np/wvNbi6dQHTVWH8s8mGQWQps3F3e+2vc1GP2vgd
         O38GVtUEtcUAO/0HiP08JaaVh/PcwzmJIlD5N3VvuY4XLdB2/Dt6tzFlYZsSi6NeYWeJ
         SCFYaRegFJnfxB9+qcbnv3le16pTZTCL6tyMCuNo26RsfOchDCZOR2RMSJUjbBJRyPU1
         n3UQTTQ07OqMaNCLL/Qa8R5cR0/YzlfNUmS8XqMPrpxApxbBEPoHfH7g5idvtehs8RwC
         32VF5ir5rnSoqqPEjCpbJ/AslGiB8IibMYP8gN7nZBMUkDj9ewtv7SFwhtv7PITIHdhQ
         Dngg==
X-Forwarded-Encrypted: i=1; AJvYcCWhpdne83/dJA70gAt0atZ3xaFX0Mo/pF4ESviI7gjNNoRg6nEcm9qH8LVMNHmvQ+DaZbfE7iJZyx27wcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YymknG88yCx6aD4RtA0ufUrQHlKjfma5tVYb6tgnbXRk3Iywjbz
	b9MMpsGujstWH4VF82xAP7rnWfufbU1IQOaGwl9EL/x9J/bLNExsQMzo+29WulayoQ0XO8XpWrH
	8T4uCBB2hX7A8rjPnGtJB3VFQxsfv05QM2I49lh8A/qmLZec18a16u+8=
X-Google-Smtp-Source: AGHT+IHUnLMxicB+79G/MMUbSfO9RPtpMo5hogWe7WRrwNQ74fHLOwAgy1e/108sVvRM3tAPFhdiAvVL9hHm8AFY+Ur/vFxE/JR9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ee:b0:3d9:6e2d:c7fd with SMTP id
 e9e14a558f8ab-3d97ad891c5mr70298965ab.2.1746262742392; Sat, 03 May 2025
 01:59:02 -0700 (PDT)
Date: Sat, 03 May 2025 01:59:02 -0700
In-Reply-To: <20250503084527.1518-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6815dad6.a70a0220.254cdc.0017.GAE@google.com>
Subject: Re: [syzbot] [mm?] BUG: Bad page state in page_cache_ra_order
From: syzbot <syzbot+7b3842775c9ce6b69efc@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: Bad page state in prep_new_page

BUG: Bad page state in process syz.0.16  pfn:40601
page does not match folio
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffffffffffffffff pfn:0x40601
ksm flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 ffffea0001018000 00000000ffffffff ffffffffffffffff
raw: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: nonzero pincount
page_owner tracks the page as allocated
page last allocated via order 9, migratetype Unmovable, gfp_mask 0x152c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL), pid 6525, tgid 6525 (syz.0.16), ts 94203508565, free_ts 89349943790
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1718
 prep_new_page+0xa0/0xe0 mm/page_alloc.c:1730
 get_page_from_freelist+0x135b/0x3800 mm/page_alloc.c:3692
 __alloc_frozen_pages_noprof+0x263/0x23a0 mm/page_alloc.c:4974
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
page last free pid 6394 tgid 6394 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0x69d/0xff0 mm/page_alloc.c:2729
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
CPU: 1 UID: 0 PID: 6526 Comm: syz.0.16 Not tainted 6.15.0-rc4-syzkaller-g95d3481af6dc-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 bad_page+0xb3/0x1f0 mm/page_alloc.c:505
 free_tail_page_prepare+0x44f/0x5b0 mm/page_alloc.c:1000
 free_pages_prepare mm/page_alloc.c:1238 [inline]
 __free_frozen_pages+0x96a/0xff0 mm/page_alloc.c:2729
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
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x7d0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x260 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa3d358e969
Code: Unable to access opcode bytes at 0x7fa3d358e93f.
RSP: 002b:00007fa3d446b0e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 00007fa3d37b5fa8 RCX: 00007fa3d358e969
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007fa3d37b5fa8
RBP: 00007fa3d37b5fa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fa3d37b5fac
R13: 0000000000000000 R14: 00007ffd90b4bb40 R15: 00007ffd90b4bc28
 </TASK>
BUG: Bad page state in process syz.0.16  pfn:40600
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x40600
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
page last allocated via order 9, migratetype Unmovable, gfp_mask 0x152c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL), pid 6525, tgid 6525 (syz.0.16), ts 94203508565, free_ts 89349938505
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1718
 prep_new_page+0xa0/0xe0 mm/page_alloc.c:1730
 get_page_from_freelist+0x135b/0x3800 mm/page_alloc.c:3692
 __alloc_frozen_pages_noprof+0x263/0x23a0 mm/page_alloc.c:4974
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
page last free pid 6394 tgid 6394 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0x69d/0xff0 mm/page_alloc.c:2729
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
CPU: 0 UID: 0 PID: 6526 Comm: syz.0.16 Tainted: G    B               6.15.0-rc4-syzkaller-g95d3481af6dc-dirty #0 PREEMPT(full) 
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
 __free_frozen_pages+0x76e/0xff0 mm/page_alloc.c:2729
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
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x7d0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x260 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa3d358e969
Code: Unable to access opcode bytes at 0x7fa3d358e93f.
RSP: 002b:00007fa3d446b0e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 00007fa3d37b5fa8 RCX: 00007fa3d358e969
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007fa3d37b5fa8
RBP: 00007fa3d37b5fa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fa3d37b5fac
R13: 0000000000000000 R14: 00007ffd90b4bb40 R15: 00007ffd90b4bc28
 </TASK>


Tested on:

commit:         95d3481a Merge tag 'spi-fix-v6.15-rc4' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=155a98d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ca17f2d2ba38f7a0
dashboard link: https://syzkaller.appspot.com/bug?extid=7b3842775c9ce6b69efc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=176a98d4580000

