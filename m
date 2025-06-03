Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89DC22D9ED
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748949036; cv=none; b=s/aNWhBVsZkdzYWy37UEuLK29myrBA+5RZ5uCU4uyskLPOwGfD5+qSR8Qv7bT94CSrQya3KS0LE2vE0cN3M4Fj997bBXr3eYBRa/7Bm8qsmANrKp1it3nkA+QaZqvVc6+ZC/im3UjY8i3SvWwDlAeqkLWXH7i0AADP9OyWRTiOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748949036; c=relaxed/simple;
	bh=mgiMHmMVSx4YI2/cVRl4rA/QLk0mk2nOQptEL28xCKQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZiDEYYbUceZgmJeham6RXsVPlL7Cg80djeHSQ4s/eA4h1ctfpwJ4Z5Lbq8nU0f6/tJVYphinDEqnLTWONEnpGgn/mcJL3EneRAsIInHEtFNTJ1npkIIHstF8GRf6cz3SnwDGUl1WCJJpFT3bEsKpsOmYTRl5+vnadjqVOME0G9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-86463467dddso448285139f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748949034; x=1749553834;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iHSwC7m4nRzFrvsQsgTSl5en2HgnN91L34YQY/Nko8M=;
        b=otn5AT2BgnjDbr+sLhUkOXpxhFdosl7W4QRP/lAGF1qqaunOFV0Xg70+UrhwJxtZjC
         EL+tqYzDWvNqLuTWO7OJUWNryQuoT/+HC8oztqXkvnLUG2lV+/m/lNOU9VHENuu7ks84
         eognjt8YuYmviNW81saf63L43Ec30smyl3ryQCf7uhignJ/vOGXCwTDbGNjiONS6LQAT
         6EZ9KAlGFUL/l7Avi4O4USofTgQQZNqOCrbKfI/g8kkTmaO8Ops0l2TY8oOrKoydAU0+
         YjHBio0DTulDh8VYqAHTU3tG3FSTCes95W5l3ijI1DgLHocKqmg5m4pjcsBSGuFKgeep
         csJw==
X-Forwarded-Encrypted: i=1; AJvYcCV3teI3ywgQjEwknUppPkVnurF0vx7htpNTTjd+6qDWzqQbg73DmCE+BeMWIP2JylgBym0fAVNbVdbpy68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0clrRYdXZZSce2Cyb4uVdH6/zOMPgdwIbPoCDSOsG4/HRDK6
	51nhsLEgI/COVmZrVOIJtspli1WJwmou7XKuGirlIrUKRjeq/Jxy+zcuXvMIHhM13wE1PRVLk7I
	KUqChAQmbAH7UJgTlqp9Yxrhgpl08LDbS9BXXODOptVxS+I0z+TIXKHiTxZ4=
X-Google-Smtp-Source: AGHT+IG3zZSeTt3lVZ4LP+nGN0lRFlIna89aRSwhpSjMkK/9y+PWfW2cU+9TDXG+YkN65da7QOZ/dO8Zj7Lxgc4SEXpwR79q8IGg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4404:10b0:3dd:a619:b894 with SMTP id
 e9e14a558f8ab-3dda619b8b4mr83393395ab.12.1748949034132; Tue, 03 Jun 2025
 04:10:34 -0700 (PDT)
Date: Tue, 03 Jun 2025 04:10:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683ed82a.a00a0220.d8eae.006d.GAE@google.com>
Subject: [syzbot] [kernfs?] KASAN: slab-use-after-free Read in kernfs_root
From: syzbot <syzbot+ce1e5a1b4e086b43e56d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    90b83efa6701 Merge tag 'bpf-next-6.16' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14c0c970580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=262b2977ef00756b
dashboard link: https://syzkaller.appspot.com/bug?extid=ce1e5a1b4e086b43e56d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1d6f547d1801/disk-90b83efa.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/133ea45f5dd5/vmlinux-90b83efa.xz
kernel image: https://storage.googleapis.com/syzbot-assets/649e453718b7/bzImage-90b83efa.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ce1e5a1b4e086b43e56d@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in kernfs_root+0xda/0x230 fs/kernfs/kernfs-internal.h:74
Read of size 8 at addr ffff88805de64210 by task kworker/0:0/12113

CPU: 0 UID: 0 PID: 12113 Comm: kworker/0:0 Not tainted 6.15.0-syzkaller-07774-g90b83efa6701 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events request_firmware_work_func
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 kernfs_root+0xda/0x230 fs/kernfs/kernfs-internal.h:74
 kernfs_next_descendant_post fs/kernfs/dir.c:1371 [inline]
 kernfs_activate fs/kernfs/dir.c:1426 [inline]
 kernfs_add_one+0x2f5/0x520 fs/kernfs/dir.c:834
 kernfs_create_link+0x161/0x200 fs/kernfs/symlink.c:48
 sysfs_do_create_link_sd+0x83/0x110 fs/sysfs/symlink.c:44
 device_add_class_symlinks+0x133/0x240 drivers/base/core.c:3444
 device_add+0x475/0xb50 drivers/base/core.c:3643
 fw_load_sysfs_fallback drivers/base/firmware_loader/fallback.c:86 [inline]
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:162 [inline]
 firmware_fallback_sysfs+0x2e4/0x9b0 drivers/base/firmware_loader/fallback.c:238
 _request_firmware+0xf83/0x15b0 drivers/base/firmware_loader/main.c:941
 request_firmware_work_func+0xaf/0x1c0 drivers/base/firmware_loader/main.c:1194
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 12113:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4147 [inline]
 slab_alloc_node mm/slub.c:4196 [inline]
 kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4203
 __kernfs_new_node+0xd7/0x7f0 fs/kernfs/dir.c:637
 kernfs_new_node+0x102/0x210 fs/kernfs/dir.c:713
 kernfs_create_link+0xa7/0x200 fs/kernfs/symlink.c:39
 sysfs_do_create_link_sd+0x83/0x110 fs/sysfs/symlink.c:44
 device_add_class_symlinks+0x133/0x240 drivers/base/core.c:3444
 device_add+0x475/0xb50 drivers/base/core.c:3643
 fw_load_sysfs_fallback drivers/base/firmware_loader/fallback.c:86 [inline]
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:162 [inline]
 firmware_fallback_sysfs+0x2e4/0x9b0 drivers/base/firmware_loader/fallback.c:238
 _request_firmware+0xf83/0x15b0 drivers/base/firmware_loader/main.c:941
 request_firmware_work_func+0xaf/0x1c0 drivers/base/firmware_loader/main.c:1194
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 15:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free mm/slub.c:4642 [inline]
 kmem_cache_free+0x18f/0x400 mm/slub.c:4744
 rcu_do_batch kernel/rcu/tree.c:2576 [inline]
 rcu_core+0xca8/0x1710 kernel/rcu/tree.c:2832
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 run_ksoftirqd+0x9b/0x100 kernel/softirq.c:968
 smpboot_thread_fn+0x53f/0xa60 kernel/smpboot.c:164
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:548
 __call_rcu_common kernel/rcu/tree.c:3090 [inline]
 call_rcu+0x142/0x990 kernel/rcu/tree.c:3210
 kernfs_put+0x186/0x450 fs/kernfs/dir.c:591
 __kernfs_remove+0x3f6/0x570 fs/kernfs/dir.c:1528
 kernfs_remove+0x38/0x60 fs/kernfs/dir.c:1548
 __kobject_del+0xe1/0x300 lib/kobject.c:604
 kobject_del+0x45/0x60 lib/kobject.c:627
 device_del+0x75f/0x8e0 drivers/base/core.c:3901
 usb_disconnect+0x5d9/0x910 drivers/usb/core/hub.c:2344
 hub_port_connect drivers/usb/core/hub.c:5371 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x1cdb/0x4a00 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88805de641e0
 which belongs to the cache kernfs_node_cache of size 176
The buggy address is located 48 bytes inside of
 freed 176-byte region [ffff88805de641e0, ffff88805de64290)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x5de64
anon flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801ba95dc0 ffffea000174f5c0 dead000000000005
raw: 0000000000000000 0000000000110011 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 2151, tgid 2151 (kworker/1:2), ts 423541252674, free_ts 422989661618
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1710
 prep_new_page mm/page_alloc.c:1718 [inline]
 get_page_from_freelist+0x21e0/0x22c0 mm/page_alloc.c:3680
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4970
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 kmem_cache_alloc_noprof+0x283/0x3c0 mm/slub.c:4203
 __kernfs_new_node+0xd7/0x7f0 fs/kernfs/dir.c:637
 kernfs_new_node+0x102/0x210 fs/kernfs/dir.c:713
 __kernfs_create_file+0x4b/0x2e0 fs/kernfs/file.c:1038
 sysfs_add_file_mode_ns+0x238/0x300 fs/sysfs/file.c:319
 create_files fs/sysfs/group.c:76 [inline]
 internal_create_group+0x66d/0x1110 fs/sysfs/group.c:183
 internal_create_groups fs/sysfs/group.c:223 [inline]
 sysfs_create_groups+0x59/0x120 fs/sysfs/group.c:249
 device_add_groups drivers/base/core.c:2839 [inline]
 device_add_attrs+0x1c4/0x5a0 drivers/base/core.c:2914
 device_add+0x496/0xb50 drivers/base/core.c:3646
 usb_create_ep_devs+0x12c/0x230 drivers/usb/core/endpoint.c:170
page last free pid 9826 tgid 9824 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1254 [inline]
 __free_frozen_pages+0xc6e/0xe50 mm/page_alloc.c:2717
 pagetable_free include/linux/mm.h:3019 [inline]
 pagetable_dtor_free include/linux/mm.h:3117 [inline]
 __tlb_remove_table+0x2d2/0x3b0 include/asm-generic/tlb.h:215
 __tlb_remove_table_free mm/mmu_gather.c:227 [inline]
 tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:290
 rcu_do_batch kernel/rcu/tree.c:2576 [inline]
 rcu_core+0xca8/0x1710 kernel/rcu/tree.c:2832
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1050
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

Memory state around the buggy address:
 ffff88805de64100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88805de64180: 00 00 00 00 fc fc fc fc fc fc fc fc fa fb fb fb
>ffff88805de64200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff88805de64280: fb fb fc fc fc fc fc fc fc fc 00 00 00 00 00 00
 ffff88805de64300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


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
