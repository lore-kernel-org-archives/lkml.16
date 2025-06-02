Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116C029B0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748891165; cv=none; b=OIeliU6f0WtMr9EZD9aKmFIca+IXYS7yWWxXxA9XSybK6kORv66cjJoDPtSAokp250DPZsubsTg6CTPIo3YHVp+m0TKqsfd4+QuJrCa0WnIPqDcQdawHq55LJkexgw9fC7O3BqtFBaSndiPm9/D8go0h5gUOFVr3NXHv0y8zQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748891165; c=relaxed/simple;
	bh=C8nJtJ1WNDjg64zp3WYGZmY4afSmLjJwyP4vUsJDVpo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tYOZahyAuxRmYF+h89ui6C9/dSStxgK3IV/MvMhlRqiY/W52D5NZSOM7L67bLTgzw86DKrsDwLEoY2EACaNyZVl/SwitHf9m1dwVibF7zNy34RSVVIRUEl8ahEiC2A1ESJNCE9s1KANymT6+efjEF6+8993mTlurdgYF+bAQElA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dc8b60169eso50471805ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748891163; x=1749495963;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+GE5y9MRWwCOaWxywySOHsnY3cTZ/ifKds69aWrfR8=;
        b=oJVS+EuBEFYNg7qIcQ4YSu1vOhJuUOHQcb5R7PLAYw4aLrai1uvHi+EzZwSXgsmrmT
         DzEyEbcjkdVFk7J1fVfRGHuCLQnzUQiBkPKFERX3zFk+8epG7KuOZucUvh+DQWAqrtBW
         V1tdxqv2tukQxtUAIcV5glYWclvOS0R2z9szNY1eGi9qIDsNmudjsD6zJxy9IIA7K3EX
         HbJh4pl2EG6W2mXRPlJzajAQI9I3VH/yzcgcRKdCbFDqYdb9ShIpie0u5/tQ0/RwmOoh
         hCmdJmqdpTbiL2yor7TvW7VJPzL+pjz0BK6O2P1lwbaKcK7RWWTrylckn/SGzYOpvo2a
         ioBA==
X-Gm-Message-State: AOJu0YzYvaPBy2P1vKsq4hRDQY7sfux8LhEnqx+NsF21cKHgMMRc+9cA
	t3/qfB+CZ/YPohDUmg3I+SCyKbKW/We0nfxEQNupgViCLeDrFI1hzx+0DEB4a99itm8CyzCrTVU
	azhAJw0iiHwRasukBPwDdpcLcqNbyu0gHhvVJKzXhOqNhARmtwASgDADVHBc=
X-Google-Smtp-Source: AGHT+IGbfpUfe2OHXaGFAz8yPE15usCkXyOv1a7P8m+580j5mqkkAfNMT26fjZFdlJtxLvE45nG2UdUc8Upu4PaOWMB2Gi9E6f8L
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16cf:b0:3dc:9b89:6a3b with SMTP id
 e9e14a558f8ab-3ddb6854e4fmr8855035ab.8.1748891163152; Mon, 02 Jun 2025
 12:06:03 -0700 (PDT)
Date: Mon, 02 Jun 2025 12:06:03 -0700
In-Reply-To: <CABBYNZ+kXi5iRrJN3UuK2ddQW49jHUwRQToEZ2fphEJRiVA4jQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683df61b.a00a0220.d8eae.0059.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in mgmt_pending_remove
From: syzbot <syzbot+cc0cc52e7f43dc9e6df1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in mgmt_remove_adv_monitor_complete

==================================================================
BUG: KASAN: slab-use-after-free in mgmt_remove_adv_monitor_complete+0xe5/0x5a0 net/bluetooth/mgmt.c:5400
Read of size 8 at addr ffff88802ddaa820 by task kworker/u9:1/5159

CPU: 0 UID: 0 PID: 5159 Comm: kworker/u9:1 Not tainted 6.15.0-syzkaller-07803-g3382a1ed7f77-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: hci0 hci_cmd_sync_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 mgmt_remove_adv_monitor_complete+0xe5/0x5a0 net/bluetooth/mgmt.c:5400
 hci_cmd_sync_work+0x261/0x3a0 net/bluetooth/hci_sync.c:334
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xa52/0x16b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 7763:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4358
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 mgmt_pending_new+0x65/0x1e0 net/bluetooth/mgmt_util.c:269
 mgmt_pending_add+0x35/0x140 net/bluetooth/mgmt_util.c:296
 remove_adv_monitor+0x103/0x1b0 net/bluetooth/mgmt.c:5448
 hci_mgmt_cmd+0xc45/0x1240 net/bluetooth/hci_sock.c:1719
 hci_sock_sendmsg+0x6d7/0xef0 net/bluetooth/hci_sock.c:1839
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x21c/0x270 net/socket.c:727
 sock_write_iter+0x258/0x330 net/socket.c:1131
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x54b/0xa90 fs/read_write.c:686
 ksys_write+0x145/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 7760:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x18e/0x440 mm/slub.c:4841
 mgmt_pending_free net/bluetooth/mgmt_util.c:311 [inline]
 mgmt_pending_foreach+0x30d/0x380 net/bluetooth/mgmt_util.c:257
 mgmt_index_removed+0x112/0x2f0 net/bluetooth/mgmt.c:9360
 hci_sock_bind+0xb3c/0xf10 net/bluetooth/hci_sock.c:1314
 __sys_bind_socket net/socket.c:1810 [inline]
 __sys_bind+0x2e3/0x3e0 net/socket.c:1841
 __do_sys_bind net/socket.c:1846 [inline]
 __se_sys_bind net/socket.c:1844 [inline]
 __x64_sys_bind+0x7a/0x90 net/socket.c:1844
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802ddaa800
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 32 bytes inside of
 freed 96-byte region [ffff88802ddaa800, ffff88802ddaa860)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2ddaa
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801a441280 ffffea0000c40e80 dead000000000002
raw: 0000000000000000 0000000080200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 13, tgid 13 (kworker/u8:1), ts 91611553234, free_ts 91142595267
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
 __kmalloc_cache_noprof+0x296/0x3d0 mm/slub.c:4353
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 nsim_fib_event_schedule_work drivers/net/netdevsim/fib.c:990 [inline]
 nsim_fib_event_nb+0x187/0x1080 drivers/net/netdevsim/fib.c:1043
 notifier_call_chain+0x1b6/0x3e0 kernel/notifier.c:85
 atomic_notifier_call_chain+0xda/0x180 kernel/notifier.c:223
 call_fib_notifiers+0x31/0x60 net/core/fib_notifier.c:35
 call_fib6_entry_notifiers net/ipv6/ip6_fib.c:409 [inline]
 fib6_add_rt2node+0x15fb/0x33a0 net/ipv6/ip6_fib.c:1252
 fib6_add+0x8da/0x18a0 net/ipv6/ip6_fib.c:1535
 __ip6_ins_rt net/ipv6/route.c:1351 [inline]
 ip6_ins_rt+0xc8/0x120 net/ipv6/route.c:1361
 __ipv6_ifa_notify+0x4ce/0xdd0 net/ipv6/addrconf.c:6286
 ipv6_ifa_notify net/ipv6/addrconf.c:6325 [inline]
 addrconf_dad_completed+0x180/0xd60 net/ipv6/addrconf.c:4324
page last free pid 10 tgid 10 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1254 [inline]
 __free_frozen_pages+0xc6e/0xe50 mm/page_alloc.c:2717
 vfree+0x1a6/0x330 mm/vmalloc.c:3416
 delayed_vfree_work+0x55/0x80 mm/vmalloc.c:3336
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xa52/0x16b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff88802ddaa700: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
 ffff88802ddaa780: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
>ffff88802ddaa800: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                               ^
 ffff88802ddaa880: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
 ffff88802ddaa900: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
==================================================================


Tested on:

commit:         3382a1ed net: fix udp gso skb_segment after pull from ..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=10faac82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ad994328fa4534e
dashboard link: https://syzkaller.appspot.com/bug?extid=cc0cc52e7f43dc9e6df1
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16b37970580000

