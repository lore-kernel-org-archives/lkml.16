Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80142C324F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748888584; cv=none; b=gFRiOZ9Z2nEudsxG4egbpw9fsLts20u3c9djQWQBOqqwhFawB3Dea/TGRNtROnwdXNdqwoeDHegE3SbcbjzbkwIgUmtxSYhAi82X/WqT333ram5yt6ptAv2jv+Ke+ZvkQzKEs+njXzmXUA3fc86TPP7PCJ0agujKJxOwWQ3svYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748888584; c=relaxed/simple;
	bh=SkR42VDx2Oy80BQJXmYk3c4VR1efkcht6Jf1+Jj8/jA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KKqG2PbCgNTVriHUbupejDptgK/59kQyKXt31r5QyqUnqRok9l5bxwaj7mRLZD62q0zMMSzf1PQMOV68lCMPUAuYWKhofWT9aG6DrGOCARL9e7pzoP5oGSnx/HebYZElfkLcLaXWwmlvtZwSw7wrGcUV9FgYvOhuQxPuxMkLTsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3dda4148039so35578655ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748888582; x=1749493382;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8a1j4nUpgHbZez4/dz7WcDR7zyX2DRy99D/9giKR994=;
        b=No9SffA7VK2w8C4mD/q4mGc0LwxUvcBWPEu4Z4c7M2quOdM2xPRf5A+AFrC/OkuGE6
         VjT2wMMKtS7CMFbCpOirpCYllAQcN9vd/wv/e7i4CcaX4FMPbOrEY1nlJmVg6omO1bKi
         pbqPnSuJjDMVrfdquVCqBx+a796v4Alu1jD2gWwfadeaw86+HYEZ522k283mtZzPqtKB
         mA69c2UPDh18T8uLbrmywSt/q8MJlvAVT0gy8cf2ZUNK/K5/dvJUsx3dy7Dz7F60ysew
         ct3Zm+6rYTcYY9rmA30CNp8BheJx3zjaEl4bmIoA80AL3mi7kChZXPvh6v5sTYHyf/MR
         uDoQ==
X-Gm-Message-State: AOJu0Yz0GrRXSuFoDACUu2PmPu1ggdp1R+GavmPw6N9ywyEn5v1x4R9P
	PSfCHAY7i2LSCUY9NNGLI8of6KQoAtQ240mHTKOx8O8FfPrC0+boI+VQmWv8ayUFK3dPc7ky5jC
	HcN4lPi1X0ijfDDs1PrZUjFyKVsKqJhMCBjmXoA30AaL6a3/GMuXuNp5IreI=
X-Google-Smtp-Source: AGHT+IFClhG1MCPE8k+gdayp03dJmcIzXu1R42iaGg8kaQv1Kk+/7pu+ULx0cjCC2cBPDyaVRfzYft3TtYrn6fip84cRUx0JTnt0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b43:b0:3dc:875e:ed7e with SMTP id
 e9e14a558f8ab-3dd9cacc9f8mr152830915ab.12.1748888581971; Mon, 02 Jun 2025
 11:23:01 -0700 (PDT)
Date: Mon, 02 Jun 2025 11:23:01 -0700
In-Reply-To: <CABBYNZLftvChUK9dnrKdMscHHguTxjf-EZLf_=r-_QsDokH11A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683dec05.a00a0220.d8eae.0057.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 mgmt_remove_adv_monitor_complete (3)
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in mgmt_remove_adv_monitor_complete

Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > 4
Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > 2
==================================================================
BUG: KASAN: slab-use-after-free in mgmt_remove_adv_monitor_complete+0xe5/0x5a0 net/bluetooth/mgmt.c:5399
Read of size 8 at addr ffff8880115a3aa0 by task kworker/u5:4/5846

CPU: 0 UID: 0 PID: 5846 Comm: kworker/u5:4 Not tainted 6.15.0-syzkaller-gcd2e103d57e5-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: hci0 hci_cmd_sync_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 mgmt_remove_adv_monitor_complete+0xe5/0x5a0 net/bluetooth/mgmt.c:5399
 hci_cmd_sync_work+0x261/0x3a0 net/bluetooth/hci_sync.c:334
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 13316:
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
 remove_adv_monitor+0x103/0x1b0 net/bluetooth/mgmt.c:5447
 hci_mgmt_cmd+0x9c9/0xef0 net/bluetooth/hci_sock.c:1719
 hci_sock_sendmsg+0x6ca/0xef0 net/bluetooth/hci_sock.c:1839
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x219/0x270 net/socket.c:727
 sock_write_iter+0x258/0x330 net/socket.c:1131
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x54b/0xa90 fs/read_write.c:686
 ksys_write+0x145/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 13322:
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
 mgmt_index_removed+0x112/0x2f0 net/bluetooth/mgmt.c:9359
 hci_sock_bind+0xbe9/0x1000 net/bluetooth/hci_sock.c:1314
 __sys_bind_socket net/socket.c:1810 [inline]
 __sys_bind+0x2c6/0x3e0 net/socket.c:1841
 __do_sys_bind net/socket.c:1846 [inline]
 __se_sys_bind net/socket.c:1844 [inline]
 __x64_sys_bind+0x7a/0x90 net/socket.c:1844
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880115a3a80
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 32 bytes inside of
 freed 96-byte region [ffff8880115a3a80, ffff8880115a3ae0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x115a3
ksm flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801a441280 ffffea0000681b00 dead000000000003
raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x252800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_THISNODE), pid 5851, tgid 5851 (syz-executor), ts 158761816277, free_ts 158220175343
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3669
 __alloc_pages_slowpath+0x2fe/0xce0 mm/page_alloc.c:4490
 __alloc_frozen_pages_noprof+0x319/0x370 mm/page_alloc.c:4972
 alloc_slab_page mm/slub.c:2452 [inline]
 allocate_slab+0x65/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __kmalloc_cache_node_noprof+0x29a/0x3d0 mm/slub.c:4366
 kmalloc_node_noprof include/linux/slab.h:928 [inline]
 alloc_node_nr_active kernel/workqueue.c:4874 [inline]
 __alloc_workqueue+0x6a4/0x1b70 kernel/workqueue.c:5728
 alloc_workqueue+0xd4/0x210 kernel/workqueue.c:5788
 ieee80211_register_hw+0x2c5f/0x4120 net/mac80211/main.c:1491
 mac80211_hwsim_new_radio+0x2f0e/0x5340 drivers/net/wireless/virtual/mac80211_hwsim.c:5565
 hwsim_new_radio_nl+0xea4/0x1b10 drivers/net/wireless/virtual/mac80211_hwsim.c:6249
 genl_family_rcv_msg_doit+0x215/0x300 net/netlink/genetlink.c:1115
 genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
 genl_rcv_msg+0x60e/0x790 net/netlink/genetlink.c:1210
 netlink_rcv_skb+0x205/0x470 net/netlink/af_netlink.c:2534
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
page last free pid 5977 tgid 5977 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
 vfree+0x25a/0x400 mm/vmalloc.c:3426
 delayed_vfree_work+0x55/0x80 mm/vmalloc.c:3345
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff8880115a3980: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
 ffff8880115a3a00: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
>ffff8880115a3a80: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                               ^
 ffff8880115a3b00: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
 ffff8880115a3b80: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         cd2e103d Merge tag 'hardening-v6.16-rc1-fix1-take2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1032ac82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6acfdd5e5c8ef3d0
dashboard link: https://syzkaller.appspot.com/bug?extid=feb0dc579bbe30a13190
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1182ac82580000

