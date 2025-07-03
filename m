Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040D128E579
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536025; cv=none; b=NAO5dgUB8rHVZpBNO02X7gJqc7RAItC4kD2Dt6T0b2ViqD+8b0n9nYBKGqMpGJomLe3Zos9TPl2DcRr9f6/SuWjz+wQa917gcs6n3+tX19csZPW84dNUYgsCJBZafVirkune2heokpaNy3EzbEyGZS/GldlpOkd3Qs0qjPEqa5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536025; c=relaxed/simple;
	bh=B+7VvFR6zUBy0urXuu4CrDoufTpJ+xCS1DanSmMDtHo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VhJUx0by+13/JqTVx8OhESU6TGSCiSwIo1a4+KVBIOOqWdtptVw0AW6Zf77hN5nPBhcbone7qObCGbBVAum40a8h7BRrPgsWambpl/LbpljqQC0orOko52wltbEPGBDd17668WLhUrut/E3bboyYMenk89tiEbRdMtDf9Ic2LFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-87326a81ceaso65832439f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536023; x=1752140823;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pij28B7ygKhGtRx7J3phxVXRw8a4m6u7dpyUB+drmc0=;
        b=FAWa11lKDLfe0lYDOwuYWjB3ndmtWDi2nm0iN+2QkrCROUC0KgK8Yn5s59YOcxkups
         ep9kDyWJGaDtSTZDvanEWFCH/12ddno5U46wf/BbuApxyi1G5j9HrtTcR4AMA+v7LeOD
         RlZL5VHIGgxkNDiGdyLIMSi0m/0kUVe10MUYIzj6Ongtv70zRmNYNdwdy3YhfTzOlK+/
         fFJ6j48kO2X+PqXXYFtUKb5uPZI88894ylx1QMQTlsefqHx9ZqaVax9iQfWMBunipyha
         YD2wmDC1FJ7x79pMxbBnK0nwQpqXV7ZEVCXokznFATuMNYCKVlE2EDGmkKNfnjoCd3hb
         GwWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXaYDmOi/lqJWRr+NfEyzrxWGjIbryteBp0IfEugo5R1O3VHn9O9xAfg7l7ZvqhqQPveCxjb8MbmEi214=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYrVzEqsqO9E26LjW31woWr+Ak3p2hOpCjRwaPISTtb29pMlDb
	9Vi/exK+dRgp2+KYFEoXstuJgknANREfEXN4EfAE19ZdkWAVfsnxQcP6IZebbFWONwBXwlTwBR4
	f0JM3UI5YXdJW2h1nZ7TkFCs+TkPkOA+34zeCmHl/A9uwql6P9e3naxdSR7Y=
X-Google-Smtp-Source: AGHT+IF13lCQIv5iWG1hcvVHmh2TYQkkXcD3punGnVAhxk071LR75C7R2PGVxpQWlLdoGSliMbMK5WvwU6qJsDxlpJ/WRKPTYY2j
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:340b:b0:85b:4310:a91c with SMTP id
 ca18e2360f4ac-876d576120cmr165094239f.1.1751536023169; Thu, 03 Jul 2025
 02:47:03 -0700 (PDT)
Date: Thu, 03 Jul 2025 02:47:03 -0700
In-Reply-To: <20250703043448.2287-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68665197.a70a0220.2b31f5.0019.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in mon_bin_event
From: syzbot <syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-out-of-bounds Read in mon_bin_event

usb 1-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor, different from the interface descriptor's value: 9
usb 1-1: New USB device found, idVendor=045e, idProduct=07da, bcdDevice= 0.00
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
microsoft 0003:045E:07DA.0001: unknown main item tag 0x0
microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
==================================================================
BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff drivers/usb/mon/mon_bin.c:252 [inline]
BUG: KASAN: slab-out-of-bounds in mon_bin_get_data drivers/usb/mon/mon_bin.c:420 [inline]
BUG: KASAN: slab-out-of-bounds in mon_bin_event+0x12ec/0x23b0 drivers/usb/mon/mon_bin.c:608
Read of size 832 at addr ffff888021ad5e81 by task kworker/1:3/5846

CPU: 1 UID: 0 PID: 5846 Comm: kworker/1:3 Not tainted 6.16.0-rc4-next-20250702-syzkaller-06656-g50c8770a42fa-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:189
 __asan_memcpy+0x29/0x70 mm/kasan/shadow.c:105
 mon_copy_to_buff drivers/usb/mon/mon_bin.c:252 [inline]
 mon_bin_get_data drivers/usb/mon/mon_bin.c:420 [inline]
 mon_bin_event+0x12ec/0x23b0 drivers/usb/mon/mon_bin.c:608
 mon_bus_submit drivers/usb/mon/mon_main.c:89 [inline]
 mon_submit+0x193/0x210 drivers/usb/mon/mon_main.c:100
 usbmon_urb_submit include/linux/usb/hcd.h:724 [inline]
 usb_hcd_submit_urb+0x11d/0x1aa0 drivers/usb/core/hcd.c:1518
 usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 usbhid_raw_request+0x3cd/0x4e0 drivers/hid/usbhid/hid-core.c:-1
 __hid_request+0x1c1/0x370 drivers/hid/hid-core.c:1989
 hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
 hidinput_connect+0x218a/0x3030 drivers/hid/hid-input.c:2327
 hid_connect+0x499/0x19a0 drivers/hid/hid-core.c:2239
 hid_hw_start+0xa8/0x120 drivers/hid/hid-core.c:2357
 ms_probe+0x180/0x430 drivers/hid/hid-microsoft.c:391
 __hid_device_probe drivers/hid/hid-core.c:2727 [inline]
 hid_device_probe+0x39d/0x710 drivers/hid/hid-core.c:2764
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 hid_add_device+0x398/0x540 drivers/hid/hid-core.c:2910
 usbhid_probe+0xe13/0x12a0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x637/0xbf0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c1/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 usb_new_device+0xa39/0x16f0 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5866 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5948
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5846:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4365 [inline]
 __kmalloc_noprof+0x27a/0x4f0 mm/slub.c:4377
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 hid_alloc_report_buf drivers/hid/hid-core.c:1890 [inline]
 __hid_request+0x94/0x370 drivers/hid/hid-core.c:1980
 hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
 hidinput_connect+0x218a/0x3030 drivers/hid/hid-input.c:2327
 hid_connect+0x499/0x19a0 drivers/hid/hid-core.c:2239
 hid_hw_start+0xa8/0x120 drivers/hid/hid-core.c:2357
 ms_probe+0x180/0x430 drivers/hid/hid-microsoft.c:391
 __hid_device_probe drivers/hid/hid-core.c:2727 [inline]
 hid_device_probe+0x39d/0x710 drivers/hid/hid-core.c:2764
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 hid_add_device+0x398/0x540 drivers/hid/hid-core.c:2910
 usbhid_probe+0xe13/0x12a0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x637/0xbf0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c1/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 usb_new_device+0xa39/0x16f0 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5866 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5948
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888021ad5e80
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 1 bytes inside of
 allocated 7-byte region [ffff888021ad5e80, ffff888021ad5e87)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x21ad5
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801a841500 dead000000000100 dead000000000122
raw: 0000000000000000 0000000080800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 3280583634, free_ts 3148007746
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1848
 prep_new_page mm/page_alloc.c:1856 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3855
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5145
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2487 [inline]
 allocate_slab+0x8a/0x370 mm/slub.c:2655
 new_slab mm/slub.c:2709 [inline]
 ___slab_alloc+0xbeb/0x1410 mm/slub.c:3891
 __slab_alloc mm/slub.c:3981 [inline]
 __slab_alloc_node mm/slub.c:4056 [inline]
 slab_alloc_node mm/slub.c:4217 [inline]
 __do_kmalloc_node mm/slub.c:4364 [inline]
 __kmalloc_noprof+0x305/0x4f0 mm/slub.c:4377
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 acpi_ns_internalize_name+0x2c2/0x3a0 drivers/acpi/acpica/nsutils.c:331
 acpi_ns_get_node_unlocked drivers/acpi/acpica/nsutils.c:666 [inline]
 acpi_ns_get_node+0x1a3/0x350 drivers/acpi/acpica/nsutils.c:726
 acpi_get_handle+0x181/0x2a0 drivers/acpi/acpica/nsxfname.c:98
 acpi_has_method+0x86/0xd0 drivers/acpi/utils.c:672
 acpi_show_attr drivers/acpi/device_sysfs.c:548 [inline]
 acpi_attr_is_visible+0x19d/0x4f0 drivers/acpi/device_sysfs.c:588
 create_files fs/sysfs/group.c:65 [inline]
 internal_create_group+0x5d7/0x1110 fs/sysfs/group.c:183
 internal_create_groups fs/sysfs/group.c:223 [inline]
 sysfs_create_groups+0x59/0x120 fs/sysfs/group.c:249
 device_add_groups drivers/base/core.c:2838 [inline]
 device_add_attrs+0x1c4/0x5a0 drivers/base/core.c:2913
 device_add+0x496/0xb50 drivers/base/core.c:3645
page last free pid 43 tgid 43 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1392 [inline]
 __free_frozen_pages+0xb80/0xd80 mm/page_alloc.c:2892
 discard_slab mm/slub.c:2753 [inline]
 __put_partials+0x156/0x1a0 mm/slub.c:3218
 put_partials mm/slub.c:3237 [inline]
 flush_cpu_slab+0x2b7/0x450 mm/slub.c:3372
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888021ad5d80: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
 ffff888021ad5e00: 00 fc fc fc 02 fc fc fc 00 fc fc fc fa fc fc fc
>ffff888021ad5e80: 07 fc fc fc 00 fc fc fc 00 fc fc fc 05 fc fc fc
                   ^
 ffff888021ad5f00: fa fc fc fc 05 fc fc fc fa fc fc fc 05 fc fc fc
 ffff888021ad5f80: 00 fc fc fc fa fc fc fc 00 fc fc fc 00 fc fc fc
==================================================================


Tested on:

commit:         50c8770a Add linux-next specific files for 20250702
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17507770580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76d012e863976d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=86b6d7c8bcc66747c505
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15210c8c580000

