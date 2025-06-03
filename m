Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D2622DFE8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948970; cv=none; b=rybyL6fiOqxuX+au44f0aiQDDLA2Jj85OpRyEulaY/Rg8HlKPpP21FSW2DpAQdM59CWqNLEmBS4+Yx+7OEoPgFmjW0fhP146/hD0dO6U3peAlIBRdoBBYHajfDYUwpybZ4HkodRoHe2qlp5CJENJIbbwVHky5+0SddAWhChkV30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948970; c=relaxed/simple;
	bh=7AJk0uaMxjhbGSEw1O8hovlbaal+cQYmGtNQ5JanFdI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=XKJv5c0IgAMVFk5RupXcFvzRexlimzVuqgZPgym1Ory2CVM8ZRe62uz+XcVyzOYiPTJhoH4DuLAvzoyQghzDDs7Ypsu77U1Q40rby0NR4/R5mC2sL5cwlL0uiVARUndhNDVYm54OaFosQnKNME/l+0qddQJbmy2kdfIMRE8sBAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3dd89b3a644so69298055ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748948967; x=1749553767;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8J7/1M2viPHa1zyUPQ9DGdd2Fw+RRfPsqvU0OMau/Us=;
        b=i0BuXVA5tQ5oFk3feXe+fsAHSqR/0jduOy0/bKBTK53lYgjkCSlgr4KZeNxT83qCYX
         k0srb5aUstZK0g/kLy9vhqU7ole7+peCRcFN4BNK+uLFbeBIBLcOGKSseYg5B91I8akB
         i5me2XcqczCUSFx1bOp8HfRstf8fKjuoWdevYK34XSbTVzFBwWXhFtXEDIjfTIg2DO4a
         ptS8DavSh642vj+XuNU4CrcupRdVkQylqkrR3cdVl5cnG+buURQq8eMiwKyH7ixkNKsL
         tU422QO0L8zQ2GSAGzGHajLU2wAg9LxjK43swtIeTcSgj4CJ5maT/IiT2481Ej/9NpuJ
         dv/w==
X-Forwarded-Encrypted: i=1; AJvYcCUfudefbRb15ru6LDVGdGZg1XI2g19825x8hZOdurCJaa+DwOd6FrvXri0Mlhh57RXSC7bT0Y6yRWDZlh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjccGutAXQ6+n4HOJbJwKi40u1xWJGowZ36HCXmJx/A6PxW69F
	qRqeLbhV6incI4XQLGU81hBY+wkWhTXORQky08VmF7G4Stx1FuxavKOFxiuKzy+DkyW71/rKU+/
	b57Bq2QBDYTlb8R31Nd8xdoEPVOQbdNa0ByouZSpcAlFcGDLJeeEwL7L54No=
X-Google-Smtp-Source: AGHT+IEmMad6/B7CXdhY1eKM8Ogg3XYyd8oS+a0ExqT8gARwd0Zv12FC3vRGW2Q0JrDe2Tcozch7eWhqH0A4udEWIzOJO4osr8NZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:681:b0:3dc:9d32:6373 with SMTP id
 e9e14a558f8ab-3ddb7808fc6mr14842615ab.2.1748948966912; Tue, 03 Jun 2025
 04:09:26 -0700 (PDT)
Date: Tue, 03 Jun 2025 04:09:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683ed7e6.a00a0220.d8eae.006b.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in raw_event_queue_add
From: syzbot <syzbot+1e3edf922962b5ea40a4@syzkaller.appspotmail.com>
To: andreyknvl@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    90b83efa6701 Merge tag 'bpf-next-6.16' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15f34ed4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e08eccd6d0881a82
dashboard link: https://syzkaller.appspot.com/bug?extid=1e3edf922962b5ea40a4
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-90b83efa.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f11f969da590/vmlinux-90b83efa.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a3cff7a358cf/bzImage-90b83efa.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1e3edf922962b5ea40a4@syzkaller.appspotmail.com

usb usb7-port1: attempt power cycle
==================================================================
BUG: KASAN: slab-use-after-free in raw_event_queue_add+0x1e0/0x220 drivers/usb/gadget/legacy/raw_gadget.c:81
Read of size 4 at addr ffff888064f0a978 by task kworker/0:3/5979

CPU: 0 UID: 0 PID: 5979 Comm: kworker/0:3 Not tainted 6.15.0-syzkaller-07774-g90b83efa6701 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xcd/0x680 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 raw_event_queue_add+0x1e0/0x220 drivers/usb/gadget/legacy/raw_gadget.c:81
 raw_queue_event drivers/usb/gadget/legacy/raw_gadget.c:239 [inline]
 gadget_disconnect+0x5a/0x130 drivers/usb/gadget/legacy/raw_gadget.c:387
 set_link_state+0x8e8/0xf70 drivers/usb/gadget/udc/dummy_hcd.c:471
 dummy_hub_control+0x1620/0x1f00 drivers/usb/gadget/udc/dummy_hcd.c:2147
 rh_call_control drivers/usb/core/hcd.c:656 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:821 [inline]
 usb_hcd_submit_urb+0xc3c/0x1c60 drivers/usb/core/hcd.c:1529
 usb_submit_urb+0x87c/0x1730 drivers/usb/core/urb.c:581
 usb_start_wait_urb+0x104/0x4b0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x326/0x4a0 drivers/usb/core/message.c:154
 usb_clear_port_feature drivers/usb/core/hub.c:454 [inline]
 usb_hub_set_port_power+0x128/0x190 drivers/usb/core/hub.c:892
 hub_port_connect drivers/usb/core/hub.c:5571 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x3a68/0x4fa0 drivers/usb/core/hub.c:5913
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 12010:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 dev_new drivers/usb/gadget/legacy/raw_gadget.c:192 [inline]
 raw_open+0x8b/0x500 drivers/usb/gadget/legacy/raw_gadget.c:434
 misc_open+0x35a/0x420 drivers/char/misc.c:179
 chrdev_open+0x234/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x741/0x1c10 fs/open.c:964
 vfs_open+0x82/0x3f0 fs/open.c:1094
 do_open fs/namei.c:3887 [inline]
 path_openat+0x1de4/0x2cb0 fs/namei.c:4046
 do_filp_open+0x20b/0x470 fs/namei.c:4073
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1437
 do_sys_open fs/open.c:1452 [inline]
 __do_sys_openat fs/open.c:1468 [inline]
 __se_sys_openat fs/open.c:1463 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1463
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 12010:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x2b4/0x4d0 mm/slub.c:4841
 kref_put include/linux/kref.h:65 [inline]
 raw_release+0x168/0x2b0 drivers/usb/gadget/legacy/raw_gadget.c:473
 __fput+0x3ff/0xb70 fs/file_table.c:465
 task_work_run+0x150/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xae2/0x2c70 kernel/exit.c:959
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1108
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x7d0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x84/0x110 kernel/entry/common.c:111
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x3f6/0x4c0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888064f0a000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 2424 bytes inside of
 freed 4096-byte region [ffff888064f0a000, ffff888064f0b000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x64f08
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b443040 ffffea000149da00 dead000000000002
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b443040 ffffea000149da00 dead000000000002
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea000193c201 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5951, tgid 5951 (udevd), ts 82327432149, free_ts 82174938248
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1710
 prep_new_page mm/page_alloc.c:1718 [inline]
 get_page_from_freelist+0x135c/0x3950 mm/page_alloc.c:3680
 __alloc_frozen_pages_noprof+0x261/0x23f0 mm/page_alloc.c:4970
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab mm/slub.c:2618 [inline]
 new_slab+0x23b/0x330 mm/slub.c:2672
 ___slab_alloc+0xd9c/0x1940 mm/slub.c:3858
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3948
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_noprof+0x2f2/0x510 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 tomoyo_realpath_from_path+0xc2/0x6e0 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x274/0x460 security/tomoyo/file.c:822
 security_inode_getattr+0x116/0x290 security/security.c:2377
 vfs_getattr fs/stat.c:259 [inline]
 vfs_statx_path fs/stat.c:299 [inline]
 vfs_statx+0x121/0x3e0 fs/stat.c:356
 vfs_fstatat+0x7b/0xf0 fs/stat.c:375
 __do_sys_newfstatat+0x97/0x120 fs/stat.c:542
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5939 tgid 5939 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1254 [inline]
 __free_frozen_pages+0x7fe/0x1180 mm/page_alloc.c:2717
 discard_slab mm/slub.c:2716 [inline]
 __put_partials+0x16d/0x1c0 mm/slub.c:3185
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4d/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4147 [inline]
 slab_alloc_node mm/slub.c:4196 [inline]
 kmem_cache_alloc_noprof+0x1cb/0x3b0 mm/slub.c:4203
 alloc_empty_file+0x55/0x1e0 fs/file_table.c:234
 alloc_file fs/file_table.c:351 [inline]
 alloc_file_pseudo+0x13a/0x230 fs/file_table.c:380
 sock_alloc_file+0x50/0x210 net/socket.c:470
 sock_map_fd net/socket.c:500 [inline]
 __sys_socket+0x1c0/0x260 net/socket.c:1692
 __do_sys_socket net/socket.c:1697 [inline]
 __se_sys_socket net/socket.c:1695 [inline]
 __x64_sys_socket+0x72/0xb0 net/socket.c:1695
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888064f0a800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888064f0a880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888064f0a900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff888064f0a980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888064f0aa00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
