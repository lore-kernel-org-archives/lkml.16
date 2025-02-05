Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC31FE47E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777523; cv=none; b=upCRwLyJbxMa9VLqIdIwBJT5/PeoxrXAY0V9S66YgyKLfNU9YSH/83bo3qtlUzdq2GTXniidkdUKghVbM7azYPy/0UW6Yk2c+6c86jcSEJDXyu6a+aRGwZ3FUzQ0eGfDvPznUQgzJL+HmnlAQjkg4U3UANVP4hc7FvZ8uU+shGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777523; c=relaxed/simple;
	bh=gL4LXF9VFQXhLXhb/vrxBE6UySefhulAejfeDcqGY2c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=D8C58IaqulFoWHbwqcqNpV+HgCoEHvViPiRyP6hBsLalqmHynjS5Ut6e8Bgr34FfVSxpk4PoVTDZzGKq539ID1+WOXOo4wdjlz845EJKVs7gBFVFYXXYbnAltIIZqIpSoUHsFqsKrFTlDl1F1bICi6tm6fhpAI6zgPRVzSU1Vjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3cf64584097so55610435ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 09:45:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738777520; x=1739382320;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5smbJSwJERq4joTHPYAMco2mTvy4fwofy+INC/21hOo=;
        b=JtRJ7t8YMAXGJIGcL2G6VzlIZBEU4YWCW9xtjKWIs1tTES0yFmOYSYdA/OW1voJuIQ
         TTR0PVFLayfW/HCvJRhzhl/BeDpR+cbmlitm4i0/8Y2+i76baO3NBitYiip9cHv8NEDp
         RiV6m3MAqN2yy2wE8BSpEAHdiD0RdA0qtxItm7sh2UlrzviN3DOXzI55MYuaEPmecBeG
         zuEL88Gp+PuQTmg9qq7lyMIlsN9euAm1hHoSqwtn4KhL65an8MOFY6+uqTmNnD5QJcOC
         t0SJy5e2zG/d3/sbXSvroo7i2LlC3NB/7jTF8PQg56qoZK9BHgzmhAZiee5xq5yM4wKR
         Sl4g==
X-Forwarded-Encrypted: i=1; AJvYcCWtYEejhE7UcL7gsVP+LXCgoXaW7nWOHpfnHWEnPsVtwsvjgbuAWE8bdqfku+PRxFat+0Leeh2YeVWsoSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3iOrkzlqqgSH1y4o5LZ5Yda/5i0RgdewuQhUpgu7jhSfX2sBp
	Nr5AJwGI6mt3Uedqs7ld2f2wVIvM/ucLnngvsN5os33NLESVOMXUbIwj+m4p5/WVP6ITX3MRs+K
	lB5wOv++LHp6zRu5u0O2+HDwomW9oaLTHrDkPCeSCQDRK1SNeOmNnNSI=
X-Google-Smtp-Source: AGHT+IHWLng/mR5c7YKGHDrit5aM8DZtijcslTH/NINKLbdMkIQ+xsttFFIGtWXSHsVGxatfsEcm6NT+UuG/iJODfYPPnYoTUFss
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1524:b0:3cf:b3ab:584d with SMTP id
 e9e14a558f8ab-3d04f485c3amr32262235ab.13.1738777520709; Wed, 05 Feb 2025
 09:45:20 -0800 (PST)
Date: Wed, 05 Feb 2025 09:45:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a3a3b0.050a0220.19061f.05e8.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in usbhid_raw_request
From: syzbot <syzbot+90ac8355c8ac84b1b464@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    72deda0abee6 Merge tag 'soundwire-6.14-rc1' of git://git.k..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1300fddf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c011d19ff7f1a12
dashboard link: https://syzkaller.appspot.com/bug?extid=90ac8355c8ac84b1b464
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13b555f8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1666cb24580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/82546410e501/disk-72deda0a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/24a56810b3df/vmlinux-72deda0a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9bb4e9366966/bzImage-72deda0a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+90ac8355c8ac84b1b464@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in usb_control_msg+0x434/0x4b0 drivers/usb/core/message.c:157
Read of size 4 at addr ffff88812223c67c by task kworker/0:3/2954

CPU: 0 UID: 0 PID: 2954 Comm: kworker/0:3 Not tainted 6.13.0-syzkaller-09485-g72deda0abee6 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: events corsair_void_status_work_handler
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 usb_control_msg+0x434/0x4b0 drivers/usb/core/message.c:157
 usbhid_set_raw_report drivers/hid/usbhid/hid-core.c:927 [inline]
 usbhid_raw_request+0x233/0x700 drivers/hid/usbhid/hid-core.c:1295
 __hid_hw_raw_request drivers/hid/hid-core.c:2457 [inline]
 hid_hw_raw_request+0x10a/0x150 drivers/hid/hid-core.c:2479
 corsair_void_request_status+0xc3/0x130 drivers/hid/hid-corsair-void.c:493
 corsair_void_status_work_handler+0x3f/0xb0 drivers/hid/hid-corsair-void.c:512
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 2954:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 usb_alloc_dev+0x55/0xdc0 drivers/usb/core/usb.c:650
 hub_port_connect drivers/usb/core/hub.c:5426 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x28f9/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 2968:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x294/0x480 mm/slub.c:4757
 device_release+0xa1/0x240 drivers/base/core.c:2567
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e4/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3773
 hub_port_connect drivers/usb/core/hub.c:5363 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff88812223c000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 1660 bytes inside of
 freed 2048-byte region [ffff88812223c000, ffff88812223c800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x122238
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff888100042000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0200000000000040 ffff888100042000 dead000000000122 0000000000000000
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0200000000000003 ffffea0004888e01 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 2832, tgid 2832 (klogd), ts 48966197880, free_ts 32895863855
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0xe76/0x2b90 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x21c/0x2290 mm/page_alloc.c:4739
 alloc_pages_mpol+0xe7/0x410 mm/mempolicy.c:2270
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2587 [inline]
 new_slab+0x23d/0x330 mm/slub.c:2640
 ___slab_alloc+0xc41/0x1670 mm/slub.c:3826
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3916
 __slab_alloc_node mm/slub.c:3991 [inline]
 slab_alloc_node mm/slub.c:4152 [inline]
 __kmalloc_cache_noprof+0x217/0x3e0 mm/slub.c:4320
 kmalloc_noprof include/linux/slab.h:901 [inline]
 syslog_print+0xf9/0x5d0 kernel/printk/printk.c:1607
 do_syslog+0x3e1/0x6c0 kernel/printk/printk.c:1785
 __do_sys_syslog kernel/printk/printk.c:1877 [inline]
 __se_sys_syslog kernel/printk/printk.c:1875 [inline]
 __x64_sys_syslog+0x74/0xb0 kernel/printk/printk.c:1875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 2926 tgid 2926 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_frozen_pages+0x653/0xde0 mm/page_alloc.c:2660
 __folio_put+0x1e8/0x2d0 mm/swap.c:112
 folio_put include/linux/mm.h:1489 [inline]
 put_page include/linux/mm.h:1561 [inline]
 skb_page_unref include/linux/skbuff_ref.h:43 [inline]
 __skb_frag_unref include/linux/skbuff_ref.h:56 [inline]
 skb_release_data+0x5d6/0x910 net/core/skbuff.c:1119
 skb_release_all net/core/skbuff.c:1190 [inline]
 __napi_kfree_skb net/core/skbuff.c:1480 [inline]
 kfree_skb_napi_cache net/core/skbuff.c:7115 [inline]
 skb_attempt_defer_free+0x1b9/0x630 net/core/skbuff.c:7137
 tcp_eat_recv_skb net/ipv4/tcp.c:1527 [inline]
 tcp_recvmsg_locked+0x11da/0x2730 net/ipv4/tcp.c:2806
 tcp_recvmsg+0x12e/0x680 net/ipv4/tcp.c:2852
 inet_recvmsg+0x12b/0x6a0 net/ipv4/af_inet.c:883
 sock_recvmsg_nosec net/socket.c:1018 [inline]
 sock_recvmsg+0x1b2/0x250 net/socket.c:1040
 sock_read_iter+0x2bb/0x3b0 net/socket.c:1110
 new_sync_read fs/read_write.c:484 [inline]
 vfs_read+0xa53/0xbf0 fs/read_write.c:565
 ksys_read+0x207/0x250 fs/read_write.c:708
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88812223c500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88812223c580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88812223c600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff88812223c680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88812223c700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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
