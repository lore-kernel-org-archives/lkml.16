Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4661BEF8C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751478148; cv=none; b=mx4IuAWBgNxUAiurzYOZyuY5epuxR3yTrBbA7sP+k7qMz0o+BHA5Y0HljSON98A933r/0xdhp+mvgDSu6vqM5ErOnCZc4L6fmEgQ+3AIiEkkCFZac17eOYY+z2fPxvmODsIPCuktjOI7T8wwugA+JbE813bhEUzvlSzbhzXnjDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751478148; c=relaxed/simple;
	bh=p239bNEYjkvf0SvvJ/8cXo96NaG/LNmWpj/idAj+I5M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gTg+ZfGcFUMoY53NLsc93AG0yLGTHSG7l+0HzvW+taTkG4sLmw0yBEyU1DgJo4lyKWUHsQFR0SCkyfItvsTxLI5wSFe12JaT84FY8m964x55Ngm81lTFcV2yz2nU6Vvecmwhq/hx9CUL3KqdUDvWtcBd/oPTNEOiP7pXmqIW9gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddce213201so1582615ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751478146; x=1752082946;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QvieUBsvj8t312izyUq93rQ3cC1lPuuzv5oosf8KdiU=;
        b=cMFRdPdRK8/DdA0BSv7e1ZYSwVHPP+K4SHMuufcS1F7AplAgwonQTl5I30Jdxe8N6d
         mNd68WNLLmx8UQuFNb0QbOB//5bSwQOdoyp3QEVjm4+N0KKWdJUyOD0hZGI8VPVnfowt
         mN2d/R231+oc4rPlHE86Vv/TeEgHwJyZvR6kU8h2QQLRPXYx0UhEFxl4J9aj8/cA5wDQ
         v6yK1cZfKb9UVdLRNIVSShiJQDFfwfpf7+ENg9fMHXJccOt4p9demxTMaE5ur0F0f9F6
         nNSbBHdMZz6pCf+ef32rm11Z7Zn1n+FrFJy4I7sXAq7sy5o+8+NM/lB3GEDIt2YFFQuR
         AhwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVp8+PksgTWmdeAhTj94FxBvpgOkp/D4eTWI+wrPu2Tl46I4MzKgnH4gr9TfNym9FZm7xF/mpES8YbSeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUexHCEDppIoj1Oq5NCc0n0Z3KiAgAypeOhVG5tFsLGjeBtULM
	+LfYGrMWpX+jjgMdhL65zQBpoykacPh1bxQ9pSzvshPApQ0UHEWAu2aGrg8cMdCDxlWuElk67Eq
	Mv/DVn+QdePWpP2sAAaW3L6e5fhfvSg4SF2xsNPZGO/ymhMTinJbN/8F8vos=
X-Google-Smtp-Source: AGHT+IHSQDHfYVWt/xbLxOkkYK9v/v/RVEuoUi/2v1EJrEmuKKbAlRUogIfU6u4txzfFqZBoUSv6DFpvLMbJu1ZWxp7cjQjt1NWd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3cf:b0:3de:12ce:d832 with SMTP id
 e9e14a558f8ab-3e05c36f2c0mr7143495ab.10.1751478145834; Wed, 02 Jul 2025
 10:42:25 -0700 (PDT)
Date: Wed, 02 Jul 2025 10:42:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68656f81.a70a0220.5d25f.0447.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in mon_bin_event
From: syzbot <syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1343433ed389 Add linux-next specific files for 20250630
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1370d770580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=66357ac5b0466f16
dashboard link: https://syzkaller.appspot.com/bug?extid=86b6d7c8bcc66747c505
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=129b2ebc580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1770d770580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b005e1db0f8c/disk-1343433e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cb3aa8bfd514/vmlinux-1343433e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e01227599a09/bzImage-1343433e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com

usb 1-1: config 0 descriptor??
microsoft 0003:045E:07DA.0001: unknown main item tag 0x0
microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
==================================================================
BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff drivers/usb/mon/mon_bin.c:252 [inline]
BUG: KASAN: slab-out-of-bounds in mon_bin_get_data drivers/usb/mon/mon_bin.c:420 [inline]
BUG: KASAN: slab-out-of-bounds in mon_bin_event+0x1211/0x2250 drivers/usb/mon/mon_bin.c:606
Read of size 832 at addr ffff88802888f1e1 by task kworker/0:2/979

CPU: 0 UID: 0 PID: 979 Comm: kworker/0:2 Not tainted 6.16.0-rc4-next-20250630-syzkaller #0 PREEMPT(full) 
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
 mon_bin_event+0x1211/0x2250 drivers/usb/mon/mon_bin.c:606
 mon_bus_submit drivers/usb/mon/mon_main.c:89 [inline]
 mon_submit+0x196/0x210 drivers/usb/mon/mon_main.c:100
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
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 hid_add_device+0x398/0x540 drivers/hid/hid-core.c:2910
 usbhid_probe+0xe13/0x12a0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x634/0xbf0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 usb_new_device+0xa39/0x16f0 drivers/usb/core/hub.c:2699
 hub_port_connect drivers/usb/core/hub.c:5571 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5711 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 979:
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
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 hid_add_device+0x398/0x540 drivers/hid/hid-core.c:2910
 usbhid_probe+0xe13/0x12a0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x634/0xbf0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3691
 usb_new_device+0xa39/0x16f0 drivers/usb/core/hub.c:2699
 hub_port_connect drivers/usb/core/hub.c:5571 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5711 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88802888f1e0
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 1 bytes inside of
 allocated 7-byte region [ffff88802888f1e0, ffff88802888f1e7)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2888f
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801a841500 dead000000000100 dead000000000122
raw: 0000000000000000 0000000080800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52c00(GFP_NOIO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 15217600491, free_ts 13475963319
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
 __kmalloc_cache_noprof+0x296/0x3d0 mm/slub.c:4391
 kmalloc_noprof include/linux/slab.h:905 [inline]
 usb_control_msg+0x73/0x3e0 drivers/usb/core/message.c:144
 usb_get_descriptor+0xb1/0x3e0 drivers/usb/core/message.c:794
 usb_get_configuration+0x2bc/0x52c0 drivers/usb/core/config.c:946
 usb_enumerate_device drivers/usb/core/hub.c:2531 [inline]
 usb_new_device+0x146/0x16f0 drivers/usb/core/hub.c:2669
 register_root_hub+0x275/0x590 drivers/usb/core/hcd.c:994
 usb_add_hcd+0xba1/0x1050 drivers/usb/core/hcd.c:2976
 vhci_hcd_probe+0x1c1/0x380 drivers/usb/usbip/vhci_hcd.c:1377
 platform_probe+0x145/0x1d0 drivers/base/platform.c:1404
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9a0 drivers/base/dd.c:657
page last free pid 10 tgid 10 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1392 [inline]
 __free_frozen_pages+0xb80/0xd80 mm/page_alloc.c:2892
 vfree+0x25a/0x400 mm/vmalloc.c:3434
 delayed_vfree_work+0x55/0x80 mm/vmalloc.c:3353
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff88802888f080: 00 fc fc fc fa fc fc fc 06 fc fc fc 06 fc fc fc
 ffff88802888f100: 06 fc fc fc fa fc fc fc 00 fc fc fc 06 fc fc fc
>ffff88802888f180: 06 fc fc fc 07 fc fc fc 06 fc fc fc 07 fc fc fc
                                                       ^
 ffff88802888f200: fa fc fc fc 00 fc fc fc fa fc fc fc 00 fc fc fc
 ffff88802888f280: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
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
