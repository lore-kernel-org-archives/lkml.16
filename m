Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FFF86358
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 04:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738645103; cv=none; b=R+pHOHE0zgSAcDZZMJKW5F1Dzh5AhLs7S8Rvs8YVaXN0IdtpRyU/EAhVNLeMRemelEtQKZ8QzRno0muAdm+TXbmk9FjLojFScjJVWVYC845H959E5qG8xen+3/VLQbClhJkYJUDPLZKUErBQSq5ZTFpdKLGxXCWxNYIlbN9UKVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738645103; c=relaxed/simple;
	bh=G1EgxgX+1PfFR5EJpl4hO73q8tCS6ZL7rhmMQsG20Kc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ORNH+eeXQtWH9URc6R26CHtM7O1Y/bZvnGia26Kz1RglZt+/sBd1ZjjjWOUP7lOTdSP8EWxpx94WdHDks5eX44u+XPbaxpQSwpla4TIEzcXi2l+VbdpAibCeeZmiodo+tFs+AbO9Zt7+c2ZDVYY0mEGiWP8J/jREsIGJmsTewvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ce51b2fcc6so83090345ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 20:58:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738645101; x=1739249901;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=On4R0ZV9u038S94jycGnQwl7wQWHdHDWNgRaWI1twuY=;
        b=BWRbh78X7axldpOMYV9u66cqoWFS8mld3XLdmSNEzJFV+fPS+TNHmbEXTvNlMpgomH
         eYgnoxCPbKiWLj1w26PHRyDPUkYt6SjUQjYJ4TiZLnSf/Wzb+UFanayNa5x2PFWkVMYu
         Ke77UaP9ifRo4iMYZN86e9R8eZTMATjqbmWUwt43qn6EQKJcSXt6JoOQzOWODPrydpFs
         buQJls/WzEy84ZL06NWQYev/kma+tYv1VmszWlmkwlC0t2UYwaeKHomG9n5jJsshjne+
         eRwflt4qW4BuUTp4iJGYIYEjnHEK3eYIPHF+MWsZ+gzHJAapB9Z/1sy0u6YeKgUS8pfk
         4Y4A==
X-Forwarded-Encrypted: i=1; AJvYcCUsIpDjD54xkEwaZ/X7q2Njgaik7X6atcoRo1Yx0awXU32bh1mGDkFNJeIXiWBc0S31ooxKt83xxVInUV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeQZ0CsymKg6FaBoXFw3xdjCLgSH5e41CRRgsQybEL7zvzNHoz
	PhMN3GZo9zy55s+OkrDl9RSNZ+qkQ/1D5qGnWe5MJFsxx6TyXRH6FwOpV5zwLmHcLldDXp5JF0I
	F4ptt+Zp9WqKcJ7YOsZNHgJxr4cN+i+gZCzKGKjIFxmRnNvM7kXyyzrQ=
X-Google-Smtp-Source: AGHT+IGawzDBe6wlupi2kkUwqwRQPNA9xSDyOiADB+VMF3aywfeu7fIl0UZrBgqmcPLbDlFVvGZtt09SPa/+PVMc2gJFR2cf+D2s
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc2:b0:3ce:78ab:dcd1 with SMTP id
 e9e14a558f8ab-3cffe4a7bf1mr216246095ab.19.1738645101174; Mon, 03 Feb 2025
 20:58:21 -0800 (PST)
Date: Mon, 03 Feb 2025 20:58:21 -0800
In-Reply-To: <67453555.050a0220.21d33d.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a19e6d.050a0220.d7c5a.00ae.GAE@google.com>
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in folio_evictable (3)
From: syzbot <syzbot+4c7590f1cee06597e43a@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, eadavis@qq.com, hdanton@sina.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    0de63bb7d919 Merge tag 'pull-fix' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14c39d18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1909f2f0d8e641ce
dashboard link: https://syzkaller.appspot.com/bug?extid=4c7590f1cee06597e43a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1640eeb0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13aa23df980000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-0de63bb7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1142009a30a7/vmlinux-0de63bb7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5d9e46a8998d/bzImage-0de63bb7.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/07d8a470b3fc/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4c7590f1cee06597e43a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read include/linux/instrumented.h:68 [inline]
BUG: KASAN: slab-use-after-free in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: slab-use-after-free in mapping_unevictable include/linux/pagemap.h:269 [inline]
BUG: KASAN: slab-use-after-free in folio_evictable+0xe3/0x250 mm/internal.h:437
Read of size 8 at addr ffff888054e45e30 by task kswapd0/79

CPU: 0 UID: 0 PID: 79 Comm: kswapd0 Not tainted 6.14.0-rc1-syzkaller-00020-g0de63bb7d919 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:489
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:68 [inline]
 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 mapping_unevictable include/linux/pagemap.h:269 [inline]
 folio_evictable+0xe3/0x250 mm/internal.h:437
 sort_folio mm/vmscan.c:4398 [inline]
 scan_folios mm/vmscan.c:4524 [inline]
 isolate_folios mm/vmscan.c:4619 [inline]
 evict_folios+0x1a99/0x56a0 mm/vmscan.c:4648
 try_to_shrink_lruvec+0x713/0x9b0 mm/vmscan.c:4821
 shrink_one+0x3b9/0x850 mm/vmscan.c:4866
 shrink_many mm/vmscan.c:4929 [inline]
 lru_gen_shrink_node mm/vmscan.c:5007 [inline]
 shrink_node+0x37c5/0x3e50 mm/vmscan.c:5978
 kswapd_shrink_node mm/vmscan.c:6807 [inline]
 balance_pgdat mm/vmscan.c:6999 [inline]
 kswapd+0x20f3/0x3b10 mm/vmscan.c:7264
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 5481:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x66/0x80 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4115 [inline]
 slab_alloc_node mm/slub.c:4164 [inline]
 kmem_cache_alloc_noprof+0x1d9/0x380 mm/slub.c:4171
 gfs2_glock_get+0x309/0x1010 fs/gfs2/glock.c:1178
 gfs2_inode_lookup+0x2a3/0xc90 fs/gfs2/inode.c:135
 gfs2_dir_search+0x229/0x2f0 fs/gfs2/dir.c:1667
 gfs2_lookupi+0x461/0x5e0 fs/gfs2/inode.c:340
 gfs2_jindex_hold fs/gfs2/ops_fstype.c:587 [inline]
 init_journal+0x5fa/0x2410 fs/gfs2/ops_fstype.c:729
 init_inodes+0xdc/0x320 fs/gfs2/ops_fstype.c:864
 gfs2_fill_super+0x1bd1/0x24d0 fs/gfs2/ops_fstype.c:1249
 get_tree_bdev_flags+0x48c/0x5c0 fs/super.c:1636
 gfs2_get_tree+0x54/0x220 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x90/0x2b0 fs/super.c:1814
 do_new_mount+0x2be/0xb40 fs/namespace.c:3560
 do_mount fs/namespace.c:3900 [inline]
 __do_sys_mount fs/namespace.c:4111 [inline]
 __se_sys_mount+0x2d6/0x3c0 fs/namespace.c:4088
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 16:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kmem_cache_free+0x195/0x410 mm/slub.c:4711
 rcu_do_batch kernel/rcu/tree.c:2546 [inline]
 rcu_core+0xaaa/0x17a0 kernel/rcu/tree.c:2802
 handle_softirqs+0x2d4/0x9b0 kernel/softirq.c:561
 run_ksoftirqd+0xca/0x130 kernel/softirq.c:950
 smpboot_thread_fn+0x544/0xa30 kernel/smpboot.c:164
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Last potentially related work creation:
 kasan_save_stack+0x3f/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xaa/0xc0 mm/kasan/generic.c:548
 __call_rcu_common kernel/rcu/tree.c:3065 [inline]
 call_rcu+0x168/0xac0 kernel/rcu/tree.c:3172
 __gfs2_glock_free+0xda0/0xef0 fs/gfs2/glock.c:172
 gfs2_glock_free+0x3c/0xb0 fs/gfs2/glock.c:178
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Second to last potentially related work creation:
 kasan_save_stack+0x3f/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xaa/0xc0 mm/kasan/generic.c:548
 insert_work+0x3e/0x330 kernel/workqueue.c:2183
 __queue_work+0xc8b/0xf50 kernel/workqueue.c:2339
 queue_delayed_work_on+0x1ca/0x390 kernel/workqueue.c:2559
 queue_delayed_work include/linux/workqueue.h:677 [inline]
 gfs2_glock_queue_work fs/gfs2/glock.c:250 [inline]
 do_xmote+0xaf8/0x1250 fs/gfs2/glock.c:832
 glock_work_func+0x343/0x5c0 fs/gfs2/glock.c:1090
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff888054e45a68
 which belongs to the cache gfs2_glock(aspace) of size 1224
The buggy address is located 968 bytes inside of
 freed 1224-byte region [ffff888054e45a68, ffff888054e45f30)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x54e44
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x4fff00000000040(head|node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000040 ffff88801f75e3c0 dead000000000122 0000000000000000
raw: 0000000000000000 00000000800c000c 00000000f5000000 0000000000000000
head: 04fff00000000040 ffff88801f75e3c0 dead000000000122 0000000000000000
head: 0000000000000000 00000000800c000c 00000000f5000000 0000000000000000
head: 04fff00000000002 ffffea0001539101 ffffffffffffffff 0000000000000000
head: 0000000000000004 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5429, tgid 5429 (syz-executor294), ts 123398815759, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0x365c/0x37a0 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x292/0x710 mm/page_alloc.c:4739
 alloc_pages_mpol+0x311/0x660 mm/mempolicy.c:2270
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab+0x8f/0x3a0 mm/slub.c:2587
 new_slab mm/slub.c:2640 [inline]
 ___slab_alloc+0xc27/0x14a0 mm/slub.c:3826
 __slab_alloc+0x58/0xa0 mm/slub.c:3916
 __slab_alloc_node mm/slub.c:3991 [inline]
 slab_alloc_node mm/slub.c:4152 [inline]
 kmem_cache_alloc_noprof+0x268/0x380 mm/slub.c:4171
 gfs2_glock_get+0x309/0x1010 fs/gfs2/glock.c:1178
 gfs2_inode_lookup+0x2a3/0xc90 fs/gfs2/inode.c:135
 gfs2_lookup_root fs/gfs2/ops_fstype.c:440 [inline]
 init_sb+0xa2a/0x1270 fs/gfs2/ops_fstype.c:507
 gfs2_fill_super+0x19b3/0x24d0 fs/gfs2/ops_fstype.c:1216
 get_tree_bdev_flags+0x48c/0x5c0 fs/super.c:1636
 gfs2_get_tree+0x54/0x220 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x90/0x2b0 fs/super.c:1814
 do_new_mount+0x2be/0xb40 fs/namespace.c:3560
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888054e45d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888054e45d80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888054e45e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff888054e45e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888054e45f00: fb fb fb fb fb fb fc fc fc fc fc fc fc fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
