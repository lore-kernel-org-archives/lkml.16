Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF2C259C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744260185; cv=none; b=peoGbkr+eGJY9Rjlwr14OgnslBc9a4yEDrqD0BTZ5ZPn9aNkPmjFv3bRyC6sQJx6qw1lOATerNbKbLK8vBUUVA1Vm7Dulq8I2RKERf7Jamu+jEw+z9tkKBJztHmeGRrKRNA70mUvrdDlqzLQCm3Sf6BWQAwa9ooSU4D2+LxT7XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744260185; c=relaxed/simple;
	bh=5qDB1A741tq9yxqMEjEi0qotVMcBlK/2Usuf2TUm0EA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P8alro77IiCFme12Boo5PkzEnksUZPXTCDrsjfFvRvfDwt8iXW3zSScrCXmbjKIft+rAtue/YvW/WxtMQrGoCy5V88xSPw4TrbxJxsHbDnzagNuxhDrX+lFu9tk1gDdpYpE4Cy7R0LQGuWAE6fkUchEEx45a4Wn+4st6DMhXdIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b41b906b3so51066039f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 21:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744260182; x=1744864982;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swpjCqrL7HCuu/zXnUsI0yjwOLKo5bRSvMQrIRCr1VM=;
        b=p5VNFH1w54leQjoe25f67m1icn6gPy7pY0Atd/G4EA3SsRcqqM+0tbeJjGx/J9Jctq
         U0fP81zcLgTHyQPUHOr/uAGy4lll7qg9Ckb00s8+gmWsLRLFZiQ9xdmX3vtGNQfaOwA0
         WpUK/xpws31OPmdKjBphDM1hmZnFt08+97fK3HEZ89On3v/Fqzl7U7FaAqzpUh3Pgo0b
         +zy2oxP5/ThFUNpMyeHNMpy9kxNbPu0/ImPE+RDPailLC4KQWEH0P2EEUX0YEoOZv4pk
         UxL5mZPE6ivri45WEeaJUPNqlfcUfiAtA3jqAX74wbHuDTunrUUh5ANXulPDQeSLPXpm
         ZLOg==
X-Gm-Message-State: AOJu0Yzq+wBbz8GCs/Y5YnYTJZ6jhOBjL8Oo/C3nOdS2WTbuK7wihfuK
	qKfPhGsQVuukGEZSyErojRrKRq7wUZjVY8d1bdcH30dGSy7SMRNxz5XzX23WHtKORBgDqfoIHJP
	B+4NfyTsVerr+gLoB0bcclHLx1C82IgOUhuVDDBjQBbnHNQCtJHJBLdk=
X-Google-Smtp-Source: AGHT+IFszUOL1h2bZ9QIQrcm0A6sPHp+j+f2RlY1aHpo/y3Kzv1TSFEDX0WKo75sRVQmrITckyVOV7m1ooNBLc9F8RexD91DAe1u
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3f05:b0:3d2:bac3:b45f with SMTP id
 e9e14a558f8ab-3d7e46e20b9mr18570025ab.4.1744260182307; Wed, 09 Apr 2025
 21:43:02 -0700 (PDT)
Date: Wed, 09 Apr 2025 21:43:02 -0700
In-Reply-To: <20250410005712.2532007-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f74c56.050a0220.25d1c8.000e.GAE@google.com>
Subject: Re: [syzbot] [acpi?] KASAN: slab-use-after-free Read in software_node_notify_remove
From: syzbot <syzbot+2ff22910687ee0dfd48e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in software_node_notify_remove

RBP: 00007f4f5e989090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 0000000000000000 R14: 00007f4f5dda5fa0 R15: 00007fffe901ed38
 </TASK>
iommufd_mock iommufd_mock0: Adding to iommu group 0
==================================================================
BUG: KASAN: slab-use-after-free in software_node_notify_remove+0x1bc/0x1c0 drivers/base/swnode.c:1108
Read of size 1 at addr ffff888071ba7108 by task syz.0.18/6145

CPU: 1 UID: 0 PID: 6145 Comm: syz.0.18 Not tainted 6.15.0-rc1-syzkaller-g3b07108ada81-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0x16e/0x5b0 mm/kasan/report.c:521
 kasan_report+0x143/0x180 mm/kasan/report.c:634
 software_node_notify_remove+0x1bc/0x1c0 drivers/base/swnode.c:1108
 device_platform_notify_remove drivers/base/core.c:2388 [inline]
 device_del+0x5d6/0xa10 drivers/base/core.c:3859
 device_unregister+0x20/0xc0 drivers/base/core.c:3897
 mock_dev_destroy drivers/iommu/iommufd/selftest.c:960 [inline]
 iommufd_test_mock_domain drivers/iommu/iommufd/selftest.c:1022 [inline]
 iommufd_test+0x3715/0x56a0 drivers/iommu/iommufd/selftest.c:1866
 iommufd_fops_ioctl+0x4fc/0x610 drivers/iommu/iommufd/main.c:419
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4f5db8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4f5e989038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f4f5dda5fa0 RCX: 00007f4f5db8d169
RDX: 0000200000000200 RSI: 0000000000003ba0 RDI: 0000000000000003
RBP: 00007f4f5e989090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 0000000000000000 R14: 00007f4f5dda5fa0 R15: 00007fffe901ed38
 </TASK>

Allocated by task 6145:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x9d/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x236/0x370 mm/slub.c:4362
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 swnode_register+0x5a/0x540 drivers/base/swnode.c:790
 fwnode_create_software_node+0x199/0x1f0 drivers/base/swnode.c:949
 device_create_managed_software_node+0xd5/0x1f0 drivers/base/swnode.c:1060
 mock_dev_create drivers/iommu/iommufd/selftest.c:942 [inline]
 iommufd_test_mock_domain drivers/iommu/iommufd/selftest.c:989 [inline]
 iommufd_test+0x3335/0x56a0 drivers/iommu/iommufd/selftest.c:1866
 iommufd_fops_ioctl+0x4fc/0x610 drivers/iommu/iommufd/main.c:419
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6145:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2389 [inline]
 slab_free mm/slub.c:4646 [inline]
 kfree+0x198/0x430 mm/slub.c:4845
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x22f/0x480 lib/kobject.c:737
 software_node_notify_remove+0x159/0x1c0 drivers/base/swnode.c:1106
 device_platform_notify_remove drivers/base/core.c:2388 [inline]
 device_del+0x5d6/0xa10 drivers/base/core.c:3859
 device_unregister+0x20/0xc0 drivers/base/core.c:3897
 mock_dev_destroy drivers/iommu/iommufd/selftest.c:960 [inline]
 iommufd_test_mock_domain drivers/iommu/iommufd/selftest.c:1022 [inline]
 iommufd_test+0x3715/0x56a0 drivers/iommu/iommufd/selftest.c:1866
 iommufd_fops_ioctl+0x4fc/0x610 drivers/iommu/iommufd/main.c:419
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888071ba7000
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 264 bytes inside of
 freed 512-byte region [ffff888071ba7000, ffff888071ba7200)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x71ba4
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b041c80 dead000000000100 dead000000000122
raw: 0000000000000000 0000000080100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b041c80 dead000000000100 dead000000000122
head: 0000000000000000 0000000080100010 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffea0001c6e901 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5885, tgid 5885 (syz-executor), ts 87258936943, free_ts 87221957323
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1717
 prep_new_page mm/page_alloc.c:1725 [inline]
 get_page_from_freelist+0x352b/0x36c0 mm/page_alloc.c:3652
 __alloc_frozen_pages_noprof+0x211/0x5b0 mm/page_alloc.c:4934
 alloc_pages_mpol+0x339/0x690 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2459 [inline]
 allocate_slab+0x8f/0x3a0 mm/slub.c:2623
 new_slab mm/slub.c:2676 [inline]
 ___slab_alloc+0xc3b/0x1500 mm/slub.c:3862
 __slab_alloc+0x58/0xa0 mm/slub.c:3952
 __slab_alloc_node mm/slub.c:4027 [inline]
 slab_alloc_node mm/slub.c:4188 [inline]
 __kmalloc_cache_noprof+0x26a/0x370 mm/slub.c:4357
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 mca_alloc net/ipv6/mcast.c:884 [inline]
 __ipv6_dev_mc_inc+0x431/0xac0 net/ipv6/mcast.c:975
 ipv6_add_dev+0xe7a/0x1430 net/ipv6/addrconf.c:473
 addrconf_notify+0x6a7/0x1020 net/ipv6/addrconf.c:3650
 notifier_call_chain+0x1a5/0x3f0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2221 [inline]
 call_netdevice_notifiers net/core/dev.c:2235 [inline]
 register_netdevice+0x16c0/0x1b80 net/core/dev.c:11054
 veth_newlink+0x4c3/0xb80 drivers/net/veth.c:1818
 rtnl_newlink_create+0x39b/0xcb0 net/core/rtnetlink.c:3833
 __rtnl_newlink net/core/rtnetlink.c:3950 [inline]
 rtnl_newlink+0x18b0/0x1fe0 net/core/rtnetlink.c:4065
page last free pid 5885 tgid 5885 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0xde8/0x10a0 mm/page_alloc.c:2680
 discard_slab mm/slub.c:2720 [inline]
 __put_partials+0x160/0x1c0 mm/slub.c:3189
 put_cpu_partial+0x17e/0x250 mm/slub.c:3264
 __slab_free+0x294/0x390 mm/slub.c:4516
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9a/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x14f/0x170 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x23/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4151 [inline]
 slab_alloc_node mm/slub.c:4200 [inline]
 __kmalloc_cache_noprof+0x1c8/0x370 mm/slub.c:4357
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 ref_tracker_alloc+0x159/0x4c0 lib/ref_tracker.c:203
 __netdev_tracker_alloc include/linux/netdevice.h:4331 [inline]
 netdev_hold include/linux/netdevice.h:4360 [inline]
 netdev_queue_add_kobject net/core/net-sysfs.c:1973 [inline]
 netdev_queue_update_kobjects+0x1df/0x740 net/core/net-sysfs.c:2035
 register_queue_kobjects net/core/net-sysfs.c:2098 [inline]
 netdev_register_kobject+0x234/0x2f0 net/core/net-sysfs.c:2340
 register_netdevice+0x12b0/0x1b80 net/core/dev.c:11016
 veth_newlink+0x4c3/0xb80 drivers/net/veth.c:1818
 rtnl_newlink_create+0x39b/0xcb0 net/core/rtnetlink.c:3833
 __rtnl_newlink net/core/rtnetlink.c:3950 [inline]
 rtnl_newlink+0x18b0/0x1fe0 net/core/rtnetlink.c:4065
 rtnetlink_rcv_msg+0x80f/0xd70 net/core/rtnetlink.c:6955

Memory state around the buggy address:
 ffff888071ba7000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888071ba7080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888071ba7100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff888071ba7180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888071ba7200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         3b07108a Merge tag 'linux_kselftest-fixes-6.15-rc2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17ae723f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eecd7902e39d7933
dashboard link: https://syzkaller.appspot.com/bug?extid=2ff22910687ee0dfd48e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=113e074c580000

