Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF9221DA8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774604; cv=none; b=EGWGzkt7v6WQgonqMva65iAxlAFGUrjJ4yeZIB+ufJfR22VXjY0a/wjDqSs5DrRY++5JNmA6P4AHb9CAyq/3Qzmk+dnYoLwW0QodGxWbjB+b6oAX5OOKah1iGKooz1qShoZ4a/bNdMS6hlWxugIDXP6hKLCXFYYIG988jjQKDeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774604; c=relaxed/simple;
	bh=OAfHmVm59IFOJmo5LF0ssl1dwrYC60r0IKaeAaE8a3s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T0NZKLoKeU/NN6F9sfPjkqJt/maQ7QcBLXuEqdHs3elREgGCD4nXqwQX8qZ3IgG4bQ/PrQ2wOD1X3iKsqjyFz5jvWWEDKuH30p56TO/dpTRJO0fpkii7wRyO1hthMmFhxBi81FWo55VCskQTZeA9dAXG7RyvUPx3rgCTIzDfkgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d6e10f4b85so31617155ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746774601; x=1747379401;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7Jyrl2DhegABMNNYKVUZ2gER7tBVtS8E5qOoKctsyU=;
        b=mDhGRAioY4eFvQPHevPqxGLC3fTb2WFnAayk22NfwMl/CTHiIr+WW6zWuWsJA+n3T1
         ROM1ZmBeO8JdpdV047e20J00f+KvtOZVu/wRbSQj2i/39LXU5Wu8V7UkNsYKjCCwpJRu
         XMQYca01uSaXvxY6HX1p+YxmeyRSnaxcheHxjkG812wmynIX76tuQNj5IWAfFAY+ERlY
         HfFNdOF1/YT2mhMkzq/494se7nAYCkz6PPs3PW77bBcKjTN1lIDePUnNh54ChFr1VIRV
         Qsc5mOIZ+/6prE9FTbKFCLXXpqeQ8rXFt9MuR//IHsPOvcdMpepQgQLXLvQdGT03jS4L
         39yw==
X-Forwarded-Encrypted: i=1; AJvYcCWI1RvOau0wA4Fd7gtMW1Cux0yrfw3+P/APZKHou4povvHjTtD1Lm4wkgIBNi10EolJS/MEEZfJ5x4QAzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBSmHWPooz/1UHoUGlbAUHYJdQKB8ml1d0gRxFphuvg51gAZvJ
	az7c7kHsFkZAW/K7vU8DCj0BY2yQsJCLcHvb8iyIrsI35No8gZZ9RRMRPP+Iup2icwgP+KK6xRX
	WVCSVEDkPmip0/8zdvYb6MC7EIRBdO554WguSeBeWltU2SBqdVmcgDas=
X-Google-Smtp-Source: AGHT+IEKEDuhYcdxbPFHi/Hmc+d2xaGD0/AAFow2RfJTQWxyR+RiVRvBp2SV6Q2NM9A0MhPkDISxlYCrRDDOUUGxccPAcLOGZ1ny
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3185:b0:3d9:3a09:415e with SMTP id
 e9e14a558f8ab-3da7e211974mr32841575ab.19.1746774601746; Fri, 09 May 2025
 00:10:01 -0700 (PDT)
Date: Fri, 09 May 2025 00:10:01 -0700
In-Reply-To: <20250508214743.1795-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681daa49.050a0220.a19a9.0128.GAE@google.com>
Subject: Re: [syzbot] [sound?] [usb?] WARNING: ODEBUG bug in snd_rawmidi_free
From: syzbot <syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in snd_usbmidi_error_timer

==================================================================
BUG: KASAN: slab-use-after-free in snd_usbmidi_error_timer+0x602/0x660 sound/usb/midi.c:352
Read of size 1 at addr ffff888033ed9543 by task udevd/5201

CPU: 1 UID: 0 PID: 5201 Comm: udevd Not tainted 6.15.0-rc5-syzkaller-00136-g9c69f8884904-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
Call Trace:
 <IRQ>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xb4/0x290 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 snd_usbmidi_error_timer+0x602/0x660 sound/usb/midi.c:352
 call_timer_fn+0x17b/0x5f0 kernel/time/timer.c:1789
 expire_timers kernel/time/timer.c:1840 [inline]
 __run_timers kernel/time/timer.c:2414 [inline]
 __run_timer_base+0x61a/0x860 kernel/time/timer.c:2426
 run_timer_base kernel/time/timer.c:2435 [inline]
 run_timer_softirq+0xb7/0x180 kernel/time/timer.c:2445
 handle_softirqs+0x283/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:__preempt_count_add arch/x86/include/asm/preempt.h:80 [inline]
RIP: 0010:rcu_is_watching+0x9/0xb0 kernel/rcu/tree.c:735
Code: 46 03 eb cc 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 41 57 41 56 53 <65> ff 05 a0 48 ce 10 e8 fb 29 af 09 89 c3 83 f8 08 73 65 49 bf 00
RSP: 0018:ffffc90003daf828 EFLAGS: 00000297
RAX: 0000000000000001 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff8e054920
RBP: ffffffff8214c37d R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff821706c4 R12: 0000000000000000
R13: ffffffff8e054920 R14: 0000000000000000 R15: 0000000000000001
 trace_lock_acquire include/trace/events/lock.h:24 [inline]
 lock_acquire+0x5f/0x360 kernel/locking/lockdep.c:5829
 fs_reclaim_acquire+0x99/0x100 mm/page_alloc.c:4081
 might_alloc include/linux/sched/mm.h:318 [inline]
 slab_pre_alloc_hook mm/slub.c:4098 [inline]
 slab_alloc_node mm/slub.c:4176 [inline]
 kmem_cache_alloc_noprof+0x44/0x3c0 mm/slub.c:4203
 alloc_empty_file+0x55/0x1d0 fs/file_table.c:234
 path_openat+0x107/0x3830 fs/namei.c:4025
 do_filp_open+0x1fa/0x410 fs/namei.c:4066
 do_sys_openat2+0x121/0x1c0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7efc39515c3a
Code: 41 89 f2 48 89 54 24 e0 41 83 e2 40 75 2a 89 f0 f7 d0 a9 00 00 41 00 74 1f 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 <48> 3d 00 f0 ff ff 77 2e c3 0f 1f 44 00 00 48 8d 44 24 08 c7 44 24
RSP: 002b:00007fff30d743b8 EFLAGS: 00000206 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 000055eedcc30190 RCX: 00007efc39515c3a
RDX: 0000000000090800 RSI: 000055eedca4f770 RDI: 00000000ffffff9c
RBP: 000055eedca4f770 R08: 0000000000000000 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000206 R12: 000055eedca3f780
R13: 00000000000000fd R14: 000055eed6dd3be0 R15: 00007fff30d746c0
 </TASK>

Allocated by task 47:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4358
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 snd_usbmidi_in_endpoint_create+0x7e/0xa30 sound/usb/midi.c:1342
 snd_usbmidi_create_endpoints_midiman sound/usb/midi.c:2362 [inline]
 __snd_usbmidi_create+0x21bd/0x29d0 sound/usb/midi.c:2645
 snd_usb_midi_v2_create+0x43e1/0x4650 sound/usb/midi2.c:1177
 usb_audio_probe+0xb78/0x1e20 sound/usb/card.c:886
 usb_probe_interface+0x641/0xbc0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c1/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_new_device+0xa39/0x16c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 47:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x193/0x440 mm/slub.c:4841
 snd_usbmidi_free sound/usb/midi.c:1530 [inline]
 snd_usbmidi_rawmidi_free+0xae/0x150 sound/usb/midi.c:1590
 snd_rawmidi_free+0x3bc/0x410 sound/core/rawmidi.c:1934
 snd_rawmidi_dev_free+0x38/0x50 sound/core/rawmidi.c:1945
 __snd_device_free+0x1d2/0x2e0 sound/core/device.c:76
 snd_device_free_all+0xcf/0x180 sound/core/device.c:233
 snd_card_do_free sound/core/init.c:587 [inline]
 release_card_device+0x75/0x1b0 sound/core/init.c:153
 device_release+0x99/0x1c0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x228/0x480 lib/kobject.c:737
 snd_card_free_when_closed sound/core/init.c:618 [inline]
 snd_card_free+0x110/0x190 sound/core/init.c:650
 usb_audio_probe+0x1949/0x1e20 sound/usb/card.c:944
 usb_probe_interface+0x641/0xbc0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c1/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_new_device+0xa39/0x16c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888033ed9400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 323 bytes inside of
 freed 512-byte region [ffff888033ed9400, ffff888033ed9600)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x33ed8
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a041c80 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801a041c80 0000000000000000 dead000000000001
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffea0000cfb601 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 3563, tgid 3563 (kworker/u8:8), ts 81305274736, free_ts 81130187591
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1d8/0x230 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x21ce/0x22b0 mm/page_alloc.c:3688
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4970
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __kmalloc_cache_noprof+0x296/0x3d0 mm/slub.c:4353
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 mca_alloc net/ipv6/mcast.c:884 [inline]
 __ipv6_dev_mc_inc+0x420/0xaf0 net/ipv6/mcast.c:975
 addrconf_join_solict net/ipv6/addrconf.c:2242 [inline]
 addrconf_dad_begin net/ipv6/addrconf.c:4103 [inline]
 addrconf_dad_work+0x3d0/0x14b0 net/ipv6/addrconf.c:4231
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 5931 tgid 5931 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0xb0e/0xcd0 mm/page_alloc.c:2725
 __slab_free+0x326/0x400 mm/slub.c:4553
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9a/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4147 [inline]
 slab_alloc_node mm/slub.c:4196 [inline]
 kmem_cache_alloc_node_noprof+0x1bb/0x3c0 mm/slub.c:4248
 __alloc_skb+0x112/0x2d0 net/core/skbuff.c:658
 alloc_skb include/linux/skbuff.h:1340 [inline]
 nlmsg_new include/net/netlink.h:1019 [inline]
 rtmsg_ifa+0xf8/0x1f0 net/ipv4/devinet.c:2015
 __inet_insert_ifa+0x9ff/0xbf0 net/ipv4/devinet.c:566
 inet_rtm_newaddr+0xf3a/0x18b0 net/ipv4/devinet.c:1002
 rtnetlink_rcv_msg+0x7cc/0xb70 net/core/rtnetlink.c:6955
 netlink_rcv_skb+0x219/0x490 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x758/0x8d0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x219/0x270 net/socket.c:727
 __sys_sendto+0x3bd/0x520 net/socket.c:2180

Memory state around the buggy address:
 ffff888033ed9400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888033ed9480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888033ed9500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                           ^
 ffff888033ed9580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888033ed9600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================
----------------
Code disassembly (best guess):
   0:	46 03 eb             	rex.RX add %ebx,%r13d
   3:	cc                   	int3
   4:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   b:	84 00 00 00 00 00
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
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop
  20:	90                   	nop
  21:	f3 0f 1e fa          	endbr64
  25:	41 57                	push   %r15
  27:	41 56                	push   %r14
  29:	53                   	push   %rbx
* 2a:	65 ff 05 a0 48 ce 10 	incl   %gs:0x10ce48a0(%rip)        # 0x10ce48d1 <-- trapping instruction
  31:	e8 fb 29 af 09       	call   0x9af2a31
  36:	89 c3                	mov    %eax,%ebx
  38:	83 f8 08             	cmp    $0x8,%eax
  3b:	73 65                	jae    0xa2
  3d:	49                   	rex.WB
  3e:	bf                   	.byte 0xbf


Tested on:

commit:         9c69f888 Merge tag 'bcachefs-2025-05-08' of git://evil..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14da4768580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=d8f72178ab6783a7daea
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1759d4f4580000

