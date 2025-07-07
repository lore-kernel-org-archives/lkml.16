Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312662877D4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888428; cv=none; b=u6PIwee8rsIaq52blIPLf7+wwPK6LLAtAfQLZz+Nx/yYkQEzPk3weKi9d86LdKFEHHQkftsygtEQB0OH6fOcr6qav/zjdZl+fMwKLn+riiVWhoHJBnTM0xSFs1MYgCQjjb7MgbLk9wOmdsVM93BJhA22lXwlfGrcpJYfxpoYixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888428; c=relaxed/simple;
	bh=idwr+HzZ3j1lbCILV2az0UxxCvI1mBazJerAH8T9kvQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LoTdzidxnC+SgMPjyrxsDbFOHPRgQuExkNWPXLk0p2CE3dcQH6JYKk5HM1BykVQYhXBft6wZ8oQU3pqio0/VpcvA2peSkAvnqmTdJfdk1HBtVwd+mvmIYF/yRVt2CoJ/u4ddbL8BJ1EuSc7yJ7DeMzJvmwVu47SxGoRIuShnCPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3df4d2a8b5eso29696285ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 04:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888425; x=1752493225;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/ATQwYuI2IRVQHijpZHdpUXlZjbZtTlnyQfbopTOqM=;
        b=Fr+/3Ub0d7zMXKXqFQMz/+nHnWX+sQOL9t5NUQ1dlkFi3aKZTIX3GepMOSDY/D18DK
         u3C4+1H+a4uVayWTEDtD3h/467yi1F5+M1UwyP3O4w9kp7NPn1eVwKgIv+V/QBhOV3Um
         jIBBRgMlyigpZGVNMToPV3uj6bE1lTyZzoTajpBynygNCnEVAlTdxYdJYEkuO0IU3sPx
         /1siDOq9KQXDS3Lr9fC6VJPyNbBu7ALjX2+0v7BwT3XwWXZb2Gfj68yQPjBkHZEUZUgi
         s22L2TPA1QWHYSJwSs0u1LfUt/YFnTuz8nscax053FKbuquSSEEDDuTwkvGJHNGAx3h6
         aKLg==
X-Forwarded-Encrypted: i=1; AJvYcCXTs+tbEAsEe7YdCvPME/F5nazAxhouiLhLxlvpxikj5bH9PhdOwlnL/Qpq08OLuN+G8cKmYS/X9NTb6as=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLOqs2AJCWkTZZ+UDDu5jHq1lq3DIhExPrgjFmF5d/ghTV1o78
	bzLbb7G/JPczk59lALrdyohC+MaUliZxqKNJLFMjUS8ysoET0e85oaXcpeR0u9kwGpZHAC8tbAi
	NIq7giZXFAikCUEzFIw/w1zI/NGAIh1Bz0c7UDSMnJVH2AYLOESPgA70EVp4=
X-Google-Smtp-Source: AGHT+IEJTawIgOmT5vnDNYxGMIIYmzXvMcmSp8NA50/+iG9Hmw24A9L3lGDiTpYEDpTDrPkpIaUhgTBX3vhHY5EAxw6+pKE2TAx4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:378b:b0:3df:49b4:8cd6 with SMTP id
 e9e14a558f8ab-3e136f11795mr115103435ab.7.1751888425312; Mon, 07 Jul 2025
 04:40:25 -0700 (PDT)
Date: Mon, 07 Jul 2025 04:40:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686bb229.a00a0220.c7b3.0081.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in mon_copy_to_buff
From: syzbot <syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b4911fb0b060 Merge tag 'mmc-v6.16-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1681f982580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b0724e6945b4773
dashboard link: https://syzkaller.appspot.com/bug?extid=8258d5439c49d4c35f43
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4347c5e481b1/disk-b4911fb0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/94e212cacf21/vmlinux-b4911fb0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8e0269b32eb1/bzImage-b4911fb0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com

microsoft 0003:045E:07DA.000D: unknown main item tag 0x0
microsoft 0003:045E:07DA.000D: unknown main item tag 0x0
microsoft 0003:045E:07DA.000D: unknown main item tag 0x0
microsoft 0003:045E:07DA.000D: unknown main item tag 0x0
microsoft 0003:045E:07DA.000D: unknown main item tag 0x0
microsoft 0003:045E:07DA.000D: unknown main item tag 0x0
==================================================================
BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff+0xc2/0x170 drivers/usb/mon/mon_bin.c:252
Read of size 4032 at addr ffff8880330e0801 by task kworker/0:6/5887

CPU: 0 UID: 0 PID: 5887 Comm: kworker/0:6 Not tainted 6.16.0-rc4-syzkaller-00049-gb4911fb0b060 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xcd/0x680 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x100/0x1b0 mm/kasan/generic.c:189
 __asan_memcpy+0x23/0x60 mm/kasan/shadow.c:105
 mon_copy_to_buff+0xc2/0x170 drivers/usb/mon/mon_bin.c:252
 mon_bin_get_data drivers/usb/mon/mon_bin.c:420 [inline]
 mon_bin_event+0x1071/0x2050 drivers/usb/mon/mon_bin.c:606
 mon_bus_submit+0xcf/0x140 drivers/usb/mon/mon_main.c:89
 usbmon_urb_submit include/linux/usb/hcd.h:724 [inline]
 usb_hcd_submit_urb+0x12d/0x1c60 drivers/usb/core/hcd.c:1518
 usb_submit_urb+0x87c/0x1790 drivers/usb/core/urb.c:581
 usb_start_wait_urb+0x104/0x4b0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x326/0x4a0 drivers/usb/core/message.c:154
 usbhid_set_raw_report drivers/hid/usbhid/hid-core.c:928 [inline]
 usbhid_raw_request+0x58f/0x700 drivers/hid/usbhid/hid-core.c:1299
 __hid_request+0x299/0x3c0 drivers/hid/hid-core.c:1989
 hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
 hidinput_connect+0x1ada/0x2bd0 drivers/hid/hid-input.c:2327
 hid_connect+0x13f3/0x1a60 drivers/hid/hid-core.c:2239
 hid_hw_start drivers/hid/hid-core.c:2354 [inline]
 hid_hw_start+0xaa/0x140 drivers/hid/hid-core.c:2345
 ms_probe+0x195/0x500 drivers/hid/hid-microsoft.c:391
 __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
 hid_device_probe+0x363/0x720 drivers/hid/hid-core.c:2761
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x241/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 hid_add_device+0x373/0xa60 drivers/hid/hid-core.c:2907
 usbhid_probe+0xd38/0x13f0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x241/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x241/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_new_device+0xd07/0x1a20 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5535 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
 port_event drivers/usb/core/hub.c:5835 [inline]
 hub_event+0x2eb7/0x4fa0 drivers/usb/core/hub.c:5917
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5887:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4328 [inline]
 __kmalloc_noprof+0x223/0x510 mm/slub.c:4340
 __hid_request+0x2c/0x3c0 drivers/hid/hid-core.c:1980
 hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
 hidinput_connect+0x1ada/0x2bd0 drivers/hid/hid-input.c:2327
 hid_connect+0x13f3/0x1a60 drivers/hid/hid-core.c:2239
 hid_hw_start drivers/hid/hid-core.c:2354 [inline]
 hid_hw_start+0xaa/0x140 drivers/hid/hid-core.c:2345
 ms_probe+0x195/0x500 drivers/hid/hid-microsoft.c:391
 __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
 hid_device_probe+0x363/0x720 drivers/hid/hid-core.c:2761
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x241/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 hid_add_device+0x373/0xa60 drivers/hid/hid-core.c:2907
 usbhid_probe+0xd38/0x13f0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x241/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x241/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_new_device+0xd07/0x1a20 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5535 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
 port_event drivers/usb/core/hub.c:5835 [inline]
 hub_event+0x2eb7/0x4fa0 drivers/usb/core/hub.c:5917
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880330e0800
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 1 bytes inside of
 allocated 7-byte region [ffff8880330e0800, ffff8880330e0807)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x330e0
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801b841500 ffffea000085b700 dead000000000002
raw: 0000000000000000 0000000080800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 1, tgid 1 (init), ts 15743776341, free_ts 15035826353
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x1321/0x3890 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x261/0x23f0 mm/page_alloc.c:4959
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2451 [inline]
 allocate_slab mm/slub.c:2619 [inline]
 new_slab+0x23b/0x330 mm/slub.c:2673
 ___slab_alloc+0xd9c/0x1940 mm/slub.c:3859
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3949
 __slab_alloc_node mm/slub.c:4024 [inline]
 slab_alloc_node mm/slub.c:4185 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x2f2/0x510 mm/slub.c:4340
 kmalloc_noprof include/linux/slab.h:909 [inline]
 str_read+0x58/0x220 security/selinux/ss/policydb.c:1104
 genfs_read+0x688/0xe20 security/selinux/ss/policydb.c:2194
 policydb_read+0x28de/0x3220 security/selinux/ss/policydb.c:2707
 security_load_policy+0x15c/0x12c0 security/selinux/ss/services.c:2305
 sel_write_load+0x332/0x1bd0 security/selinux/selinuxfs.c:603
 vfs_write+0x29d/0x1150 fs/read_write.c:684
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
page last free pid 1 tgid 1 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0x7fe/0x1180 mm/page_alloc.c:2706
 kasan_depopulate_vmalloc_pte+0x5f/0x80 mm/kasan/shadow.c:472
 apply_to_pte_range mm/memory.c:3032 [inline]
 apply_to_pmd_range mm/memory.c:3076 [inline]
 apply_to_pud_range mm/memory.c:3112 [inline]
 apply_to_p4d_range mm/memory.c:3148 [inline]
 __apply_to_page_range+0xa92/0x1350 mm/memory.c:3184
 kasan_release_vmalloc+0xd1/0xe0 mm/kasan/shadow.c:593
 kasan_release_vmalloc_node mm/vmalloc.c:2241 [inline]
 purge_vmap_node+0x1c4/0xa30 mm/vmalloc.c:2258
 __purge_vmap_area_lazy+0xa06/0xc60 mm/vmalloc.c:2348
 _vm_unmap_aliases+0x43b/0x670 mm/vmalloc.c:2943
 change_page_attr_set_clr+0x252/0x4a0 arch/x86/mm/pat/set_memory.c:2088
 change_page_attr_set arch/x86/mm/pat/set_memory.c:2129 [inline]
 set_memory_nx+0xb5/0x110 arch/x86/mm/pat/set_memory.c:2318
 free_init_pages+0x79/0xd0 arch/x86/mm/init.c:933
 free_kernel_image_pages+0x24/0x50 arch/x86/mm/init.c:952
 kernel_init+0x30/0x2b0 init/main.c:1483
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff8880330e0700: 00 fc fc fc 04 fc fc fc 06 fc fc fc 06 fc fc fc
 ffff8880330e0780: 05 fc fc fc 05 fc fc fc 05 fc fc fc 00 fc fc fc
>ffff8880330e0800: 07 fc fc fc fa fc fc fc 05 fc fc fc fa fc fc fc
                   ^
 ffff8880330e0880: 06 fc fc fc 05 fc fc fc 05 fc fc fc fa fc fc fc
 ffff8880330e0900: fa fc fc fc fa fc fc fc fa fc fc fc 05 fc fc fc
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
