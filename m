Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0B28FFFE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792246; cv=none; b=seLySztvvtMwY2TCVG7glgiifZ0rVN1GwwjiCZNpNt52R8ZJ191w9y/FYY3jt/pKK7bCvvn+AsjMXRd2IPASQZrq/pG8dHdOcEqMKzj1AknQ6NIuaPzOO8Kur5MBmCcbxn1OfFStp4x+R8imoUE9pj5gHNmJwMQZ4Mt8zdi95Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792246; c=relaxed/simple;
	bh=/efV9M2L+uhYdTb0qWa3ANf8sYTwQt2ytq4YpZiUhEI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=g82zlzJvb+exIRG/rkgVoTIaoaqVm5Ysor7oZq/AtlBGnkPbd5LEcjjainOjdPPxScwAsKR9/LQ3ZXXGYFOg0NvHkvj2TZWAUW+rjhIX6vlhBKOJjN1miMnn1EpQERWemTw66PnatevgPhg/9rET6jlg1QVJ6rG4HZtNSGyhV5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d81bc8ec0cso34033935ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746792243; x=1747397043;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBk3vWE74iFeZ8BvSqWX1HjUr26ldi6lfLsrxpOSQ0A=;
        b=aXkl1bnocgqXXcr5u8OLqAGjyzYBt1cEyeTxtMnerr/7JWemrTrKy9+cHEdZSUMAiP
         BccGJ621Fc6NwkxwHJ0eVBb7xI//E6uoFOaj4HROQMI0+yCy6X3ldnXOen/ks3A6K+Pq
         kBogfQ8zOM3daKb0P5Q5HzCuzvsYSejPzPizom8sVTWCzSz1QdQFyzDNSA2OTwpeL2NJ
         b6Km/f39QHfl0iWbhpn6sirtwNj/KmNp6pKkWwBCB+ZkEJWuikFzJy68As1CMubpKFgm
         fOoUK3nIpwi1opyF1ZQqPE1RcRGcqSPWtZroKnxpxSLGoT8P47C6hI6x2DFMxI7gKrjZ
         ykCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdHo/Uyfsxc5J8GazuWTsPT2C3qkRMs72LfHT9RUw3Kj8t/Bvf8yLO0vllw6UqOco45aS5I/CWMzsBcMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqTWS6L3uEuuZeRvJxOQFa8owutzLntDIhXEGL8ppXxID5CwZA
	7uHyycPnCovxRI3Bkjh4HIJdMgaawL7R1fBiqBqta5baHm8DM1Nj1HzHczrwxfd2aIizOVI9mOO
	UhWn7EY7s/OQYPjO7lNvvyNPVhuVuA63fr2ILgwfyJDubQr4InI5ZDBo=
X-Google-Smtp-Source: AGHT+IFMKYMZ3YJo3IsoUizDmXM6TTx/VtLuAF1I2b4e5EzhHY+eLB+47ANBl3hSWl8koqUvFQlxzmlfoTK6pibBpMOCMGgWM80K
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:349a:b0:3d9:6cb5:3be4 with SMTP id
 e9e14a558f8ab-3da7e20d096mr44277105ab.15.1746792243296; Fri, 09 May 2025
 05:04:03 -0700 (PDT)
Date: Fri, 09 May 2025 05:04:03 -0700
In-Reply-To: <20250509103741.1822-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681def33.050a0220.a19a9.0130.GAE@google.com>
Subject: Re: [syzbot] [sound?] [usb?] WARNING: ODEBUG bug in snd_rawmidi_free
From: syzbot <syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in snd_usbmidi_error_timer

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read include/linux/instrumented.h:68 [inline]
BUG: KASAN: slab-use-after-free in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
BUG: KASAN: slab-use-after-free in snd_usbmidi_error_timer+0x15d/0x660 sound/usb/midi.c:355
Read of size 4 at addr ffff888026809110 by task kworker/1:0/24

CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted 6.15.0-rc5-syzkaller-00136-g9c69f8884904-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <IRQ>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xb4/0x290 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x29a/0x2b0 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:68 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
 snd_usbmidi_error_timer+0x15d/0x660 sound/usb/midi.c:355
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
RIP: 0010:console_flush_all+0x7f7/0xc40 kernel/printk/printk.c:3227
Code: 48 21 c3 0f 85 e9 01 00 00 e8 85 b5 1e 00 48 8b 5c 24 20 4d 85 f6 75 07 e8 76 b5 1e 00 eb 06 e8 6f b5 1e 00 fb 48 8b 44 24 28 <42> 80 3c 20 00 74 08 48 89 df e8 ea a9 80 00 48 8b 1b 48 8b 44 24
RSP: 0018:ffffc900001e6d80 EFLAGS: 00000293
RAX: 1ffffffff1cf3f7b RBX: ffffffff8e79fbd8 RCX: ffff88801c6e8000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900001e6ed0 R08: ffffffff8f7ed177 R09: 1ffffffff1efda2e
R10: dffffc0000000000 R11: fffffbfff1efda2f R12: dffffc0000000000
R13: 0000000000000001 R14: 0000000000000200 R15: ffffffff8e79fb80
 __console_flush_and_unlock kernel/printk/printk.c:3285 [inline]
 console_unlock+0xc4/0x270 kernel/printk/printk.c:3325
 vprintk_emit+0x5b7/0x7a0 kernel/printk/printk.c:2450
 dev_vprintk_emit+0x337/0x3f0 drivers/base/core.c:4917
 dev_printk_emit+0xe0/0x130 drivers/base/core.c:4928
 _dev_notice+0x10a/0x160 drivers/base/core.c:4985
 usb_parse_endpoint drivers/usb/core/config.c:421 [inline]
 usb_parse_interface drivers/usb/core/config.c:630 [inline]
 usb_parse_configuration drivers/usb/core/config.c:843 [inline]
 usb_get_configuration+0x296e/0x52c0 drivers/usb/core/config.c:992
 usb_enumerate_device drivers/usb/core/hub.c:2495 [inline]
 usb_new_device+0x146/0x16c0 drivers/usb/core/hub.c:2633
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
 </TASK>

Allocated by task 1216:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x27a/0x4f0 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 usb_alloc_urb+0x46/0x150 drivers/usb/core/urb.c:75
 snd_usbmidi_in_endpoint_create+0xb4/0xa30 sound/usb/midi.c:1348
 snd_usbmidi_create_endpoints_midiman sound/usb/midi.c:2363 [inline]
 __snd_usbmidi_create+0x21bd/0x29d0 sound/usb/midi.c:2646
 snd_usb_midi_v2_create+0x43e1/0x4650 sound/usb/midi2.c:1177
 usb_audio_probe+0xb78/0x1dc0 sound/usb/card.c:886
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

Freed by task 1216:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x193/0x440 mm/slub.c:4841
 free_urb_and_buffer sound/usb/midi.c:1309 [inline]
 snd_usbmidi_in_endpoint_delete+0xde/0x680 sound/usb/midi.c:1322
 snd_usbmidi_free sound/usb/midi.c:1530 [inline]
 snd_usbmidi_rawmidi_free+0xae/0x160 sound/usb/midi.c:1591
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
 usb_audio_probe+0x18ea/0x1dc0 sound/usb/card.c:940
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

The buggy address belongs to the object at ffff888026809100
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 16 bytes inside of
 freed 192-byte region [ffff888026809100, ffff8880268091c0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x26809
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801a0413c0 ffffea000081aec0 dead000000000004
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 7957858563, free_ts 7951162775
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
 call_usermodehelper_setup+0x8e/0x270 kernel/umh.c:362
 kobject_uevent_env+0x65c/0x8c0 lib/kobject_uevent.c:628
 netdev_queue_add_kobject net/core/net-sysfs.c:1992 [inline]
 netdev_queue_update_kobjects+0x346/0x6c0 net/core/net-sysfs.c:2035
 register_queue_kobjects net/core/net-sysfs.c:2098 [inline]
 netdev_register_kobject+0x236/0x2f0 net/core/net-sysfs.c:2340
 register_netdevice+0x126c/0x1af0 net/core/dev.c:10997
 cfg80211_register_netdevice+0x150/0x2f0 net/wireless/core.c:1490
 ieee80211_if_add+0xe60/0x1390 net/mac80211/iface.c:2228
 ieee80211_register_hw+0x3475/0x4060 net/mac80211/main.c:1604
 mac80211_hwsim_new_radio+0x2f0e/0x5340 drivers/net/wireless/virtual/mac80211_hwsim.c:5559
page last free pid 977 tgid 977 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0xb0e/0xcd0 mm/page_alloc.c:2725
 vfree+0x1a6/0x330 mm/vmalloc.c:3383
 delayed_vfree_work+0x55/0x80 mm/vmalloc.c:3303
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888026809000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888026809080: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff888026809100: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff888026809180: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888026809200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================
----------------
Code disassembly (best guess):
   0:	48 21 c3             	and    %rax,%rbx
   3:	0f 85 e9 01 00 00    	jne    0x1f2
   9:	e8 85 b5 1e 00       	call   0x1eb593
   e:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  13:	4d 85 f6             	test   %r14,%r14
  16:	75 07                	jne    0x1f
  18:	e8 76 b5 1e 00       	call   0x1eb593
  1d:	eb 06                	jmp    0x25
  1f:	e8 6f b5 1e 00       	call   0x1eb593
  24:	fb                   	sti
  25:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
* 2a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 ea a9 80 00       	call   0x80aa23
  39:	48 8b 1b             	mov    (%rbx),%rbx
  3c:	48                   	rex.W
  3d:	8b                   	.byte 0x8b
  3e:	44                   	rex.R
  3f:	24                   	.byte 0x24


Tested on:

commit:         9c69f888 Merge tag 'bcachefs-2025-05-08' of git://evil..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1301d8f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=d8f72178ab6783a7daea
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=153e2670580000

