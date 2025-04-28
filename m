Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75696269818
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832212; cv=none; b=IUr9a3lki//FmA/G0+hUkkZm1CgP/focQeMEoWo+Y5Zc4r7IXcr/F41+EmWu7FJBPp//1dhbycLdkGj9I8eRsQgwSSNPz0SyX2eqfTJHSXhMCmwpbwcTELZRxXnNKPcZtykSC7mJzpyLQKiPV3XX6DdxwhdszXXIhXJZYD9J8DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832212; c=relaxed/simple;
	bh=qx4cZ3MyRafzz7QyBb9GOB+G2iRltA/bRhWemY/lhLA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FUrfYNh6aNV6bcZTQz0XRcldB+iuW/+LUSU6PesZdiZ2cw7DWXW0oLWK7ZZ6wl5zJrRvgkQafai70errAnuqJyhAVytnDihrpk53LGKY+nIxfCRlnFAvD0wVixpObjc4vj7eGhOIfOQyC+gfPXqiwrIU6NbDpoNZ/7IRVjgOKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-86195b64df7so860272139f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745832209; x=1746437009;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXmzoazBPYJoD/QgzgJaUQB+yLfSei24k3GMLFskb00=;
        b=rQL9dRDBtcCmCE5furyF9LaTo08fX5CYXkRJ/zrZl4Z0BmlwZUItij6iG5aK1TA/q6
         iKmJAn9kJc/ZzSZ4jav5jphHMny9/P774q26+5KhcxZsFB4ru1bjxtoQ7BcooaUFRKiF
         l7EQ+yekKpAkyA50Zdk9QKfI45LGVeHsYdfbTt493BDrrFk+PbYuki84Oi/cGwTA5VQp
         Koz2eAtLlSNq3eIm32OnfNzYNGQWJg4VgWUjylC0SpPGV5655yIFEHKyaSAN52Dg7tN0
         ESl7O5LVgwICO7DA8GlxFxg9fZmeq0bElWuHSnfNYXuMlUTrK3Ny7hzNSu6Qjy90Oooh
         aBVg==
X-Forwarded-Encrypted: i=1; AJvYcCU0fkH/PPvVJz713dhdD6+CTdoVrJySfgmEE2I6Pz9m5AIjfoUOVQWr8XI9MbXWH8WVeoF3CC1yGMMWinY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV9rZE2ZQCxZw473p6S13rsfsL5SoyC9LpqAQqJdplGuH9UgyY
	OCgCjDFDxH3/d7fwG3NJ89P5UyHOXPKw8tDQtSjLf6RhyKfaFtBsp4CHHvLuEBMEK1EhiDdC5ZR
	JHP0T65FgwujKuvrpm+EwbYlzNHm3xdiz9MxWmPSmxE0y3m5kLLu+ST4=
X-Google-Smtp-Source: AGHT+IFRzh6wi3YIHDSAmC2xMS4xUO40ZSGL0McfBAaS89ep2Yk8ZxV5avXjFc8m+GFdGyBRyhH4cQfDF7/ljYit11jET8i8PrEO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:26ca:b0:861:628f:2d2b with SMTP id
 ca18e2360f4ac-8645cc7bcdbmr1108091539f.1.1745832209533; Mon, 28 Apr 2025
 02:23:29 -0700 (PDT)
Date: Mon, 28 Apr 2025 02:23:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680f4911.050a0220.2b69d1.0324.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-use-after-free Read in usb_put_dev
From: syzbot <syzbot+32ae88113bd624c518d8@syzkaller.appspotmail.com>
To: dakr@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bc3372351d0c Merge tag 'for-6.15-rc3-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15c8e574580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
dashboard link: https://syzkaller.appspot.com/bug?extid=32ae88113bd624c518d8
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d1e89d70587d/disk-bc337235.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/423033b00699/vmlinux-bc337235.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6a1ce597dad9/bzImage-bc337235.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+32ae88113bd624c518d8@syzkaller.appspotmail.com

usb 34-1: SetAddress Request (3) to port 0
==================================================================
BUG: KASAN: slab-use-after-free in kobject_put+0x4ed/0x5a0 lib/kobject.c:733
Read of size 1 at addr ffff8880277330ec by task kworker/1:1/81

CPU: 1 UID: 0 PID: 81 Comm: kworker/1:1 Not tainted 6.15.0-rc3-syzkaller-00019-gbc3372351d0c #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 kobject_put+0x4ed/0x5a0 lib/kobject.c:733
 put_device+0x1f/0x30 drivers/base/core.c:3774
 usb_put_dev+0x23/0x30 drivers/usb/core/usb.c:780
 vhci_urb_enqueue+0x9b0/0xe00 drivers/usb/usbip/vhci_hcd.c:768
 usb_hcd_submit_urb+0x258/0x1c60 drivers/usb/core/hcd.c:1533
 usb_submit_urb+0x87c/0x1730 drivers/usb/core/urb.c:581
 usb_start_wait_urb+0x104/0x4b0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x326/0x4a0 drivers/usb/core/message.c:154
 hub_set_address drivers/usb/core/hub.c:4734 [inline]
 hub_port_init+0x1d3f/0x3a70 drivers/usb/core/hub.c:5039
 hub_port_connect drivers/usb/core/hub.c:5460 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2c67/0x4fa0 drivers/usb/core/hub.c:5913
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 81:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 usb_alloc_dev+0x55/0xde0 drivers/usb/core/usb.c:650
 hub_port_connect drivers/usb/core/hub.c:5434 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2953/0x4fa0 drivers/usb/core/hub.c:5913
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 7101:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2398 [inline]
 slab_free mm/slub.c:4656 [inline]
 kfree+0x2b6/0x4d0 mm/slub.c:4855
 device_release+0xa1/0x240 drivers/base/core.c:2568
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e4/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3774
 usb_put_dev+0x23/0x30 drivers/usb/core/usb.c:780
 vhci_device_reset+0xd9/0x230 drivers/usb/usbip/vhci_hcd.c:1082
 event_handler+0x29b/0x540 drivers/usb/usbip/usbip_event.c:85
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888027733000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 236 bytes inside of
 freed 2048-byte region [ffff888027733000, ffff888027733800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x27730
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b442000 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b442000 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea00009dcc01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 7454763374, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x135c/0x3920 mm/page_alloc.c:3688
 __alloc_frozen_pages_noprof+0x263/0x23a0 mm/page_alloc.c:4970
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2468 [inline]
 allocate_slab mm/slub.c:2632 [inline]
 new_slab+0x244/0x340 mm/slub.c:2686
 ___slab_alloc+0xd9c/0x1940 mm/slub.c:3872
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3962
 __slab_alloc_node mm/slub.c:4037 [inline]
 slab_alloc_node mm/slub.c:4198 [inline]
 __kmalloc_cache_noprof+0xfb/0x3e0 mm/slub.c:4367
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 nvmem_register+0xae/0x2240 drivers/nvmem/core.c:936
 mtd_nvmem_add+0x1ab/0x2f0 drivers/mtd/mtdcore.c:566
 add_mtd_device+0x9b9/0x1720 drivers/mtd/mtdcore.c:757
 mtd_device_parse_register+0x7c2/0xb10 drivers/mtd/mtdcore.c:1083
 mtdram_init_device+0x298/0x350 drivers/mtd/devices/mtdram.c:146
 init_mtdram+0xba/0x1b0 drivers/mtd/devices/mtdram.c:171
 do_one_initcall+0x120/0x6e0 init/main.c:1257
 do_initcall_level init/main.c:1319 [inline]
 do_initcalls init/main.c:1335 [inline]
 do_basic_setup init/main.c:1354 [inline]
 kernel_init_freeable+0x5c2/0x900 init/main.c:1567
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888027732f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888027733000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888027733080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff888027733100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888027733180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
