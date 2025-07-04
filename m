Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C51BD9D0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751640364; cv=none; b=tiDdhWV4gK2tBjyXM9eUii2HfbSYbekp1Ov+1eC+44X+4oDdiSYeskRJrTLHqaxFaGTmOzre++vfnyCovpQG5g+7zT2b4qq7TerUJ3/dIzoB7nfOSrSwBH8KFLloawUvA8Z8uCPvA0X17i1N89tWGH+csPq8psXeBAgpWwaac9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751640364; c=relaxed/simple;
	bh=UAA7tV4bTRaBZINXIEaUwASiT6Luujt1nWDHJBMg31g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cLNndXEfFSUvc4U6sHKjAbB6ci58YHMr6ZAx0phAJb/eisSVAvb01WJ55BCobwFCXZkAfk+PwSPWuP8jVxdt2lmHdkI0lAlh7SAvLEmRlhAXlBLUmrcSRTnJZopyDep3anelUPOnauB9Aksrfkweex24n+Yyugrwt8ygehyOiN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd97c04f4so15563295ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751640362; x=1752245162;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDiV3CpoOxR7bXQwCKdZ0OczeX6tRWWZM8IbsaE8uIk=;
        b=T7yMQkgFsKUWVesgLSe7Z3W6yDNO3oHBaTfRiGVDdNv+XgtPP4buuk3wsOpzBv8k58
         zTRpaJ2dndLQLledH+1x/RNOCTL5fu+zxHIHlzRH3qVpVfxc2FZUXVnudHSm7toup0DV
         NJu4xur7BZZT7pERUHhxAD8UAgb5qx2t+fTZqc3HGiPZzMwohLPehoVMsOGoCct3T1s0
         UgkE8RdHV6w8qXiqAponMxCYRFkksjEKEybquE2kV8hHpa2FMFznDWJvdjafqfqgLqvv
         vGu8oGyy0m9nfID8M2pElACP50D88ulrNZL4cw5RSXvk/E1/LWCG6r9Ygy55aoTwr+ZA
         KuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUOzn+aDmEWTag3gOm4asqUhAv6YQgALrRD2i020rCIWGRqAgPTbQxadrV7/caOl6GCBK2hI0gT5gyjko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1RULxYp8mb8ZLjZGA/7LuhsS5VCowFK3mWR1mPolH3hebCm+G
	677oKBNQADbm9PoX7h1iDVn+Gsc4iSwRrs2mrGF8/GBwsP6gv3PotsLzJIWheaKDjmDUSFFSl2r
	0rNQrgJi4cuQnnTwmW7uWkvlD5idwMIWRiQFfzY8qy5pTSqBHdM7Z30mfGeU=
X-Google-Smtp-Source: AGHT+IGSDij3Br5ThFDf1aIo9WSJdxvu+TiKnQDNEBlFBHuZzK4MJk0X3eNC+IzgqwKgg+u5BiP8O/oWumFfA5iLllMajAVLZmvT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:330c:b0:3dd:d189:6511 with SMTP id
 e9e14a558f8ab-3e13561cc81mr34276865ab.21.1751640362173; Fri, 04 Jul 2025
 07:46:02 -0700 (PDT)
Date: Fri, 04 Jul 2025 07:46:02 -0700
In-Reply-To: <20250704142954.2464-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6867e92a.a70a0220.29cf51.001e.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in force_devcd_write
From: syzbot <syzbot+bc71245e56f06e3127b7@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in force_devcd_write

==================================================================
BUG: KASAN: slab-use-after-free in force_devcd_write+0x3ab/0x3d0 drivers/bluetooth/hci_vhci.c:357
Read of size 8 at addr ffff88807ab4c800 by task syz.0.616/8054

CPU: 1 UID: 0 PID: 8054 Comm: syz.0.616 Not tainted 6.16.0-rc4-syzkaller-g4c06e63b9203-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xcd/0x680 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 force_devcd_write+0x3ab/0x3d0 drivers/bluetooth/hci_vhci.c:357
 full_proxy_write+0x13c/0x200 fs/debugfs/file.c:398
 vfs_write+0x29d/0x1150 fs/read_write.c:684
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6d5398e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6d547a1038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f6d53bb5fa0 RCX: 00007f6d5398e929
RDX: 000000000000000e RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007f6d53a10b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f6d53bb5fa0 R15: 00007ffd8bc9db28
 </TASK>

Allocated by task 6589:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 vhci_open+0x4c/0x430 drivers/bluetooth/hci_vhci.c:650
 misc_open+0x35a/0x420 drivers/char/misc.c:161
 chrdev_open+0x231/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x744/0x1c10 fs/open.c:964
 vfs_open+0x82/0x3f0 fs/open.c:1094
 do_open fs/namei.c:3896 [inline]
 path_openat+0x1de4/0x2cb0 fs/namei.c:4055
 do_filp_open+0x20b/0x470 fs/namei.c:4082
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1437
 do_sys_open fs/open.c:1452 [inline]
 __do_sys_openat fs/open.c:1468 [inline]
 __se_sys_openat fs/open.c:1463 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1463
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6589:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0x2b4/0x4d0 mm/slub.c:4842
 vhci_release+0xcd/0x110 drivers/bluetooth/hci_vhci.c:688
 __fput+0x402/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x86c/0x2bd0 kernel/exit.c:964
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1105
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x790 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x84/0x110 kernel/entry/common.c:111
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x3f6/0x490 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88807ab4c800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 0 bytes inside of
 freed 1024-byte region [ffff88807ab4c800, ffff88807ab4cc00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7ab48
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b841dc0 0000000000000000 0000000000000001
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b841dc0 0000000000000000 0000000000000001
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0001ead201 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 2954, tgid 2954 (kworker/u8:8), ts 94650347230, free_ts 94499980362
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
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 ieee802_11_parse_elems_full+0x1d7/0x3780 net/mac80211/parse.c:1013
 ieee802_11_parse_elems_crc net/mac80211/ieee80211_i.h:2414 [inline]
 ieee802_11_parse_elems net/mac80211/ieee80211_i.h:2421 [inline]
 ieee80211_inform_bss+0x10b/0x1140 net/mac80211/scan.c:79
 rdev_inform_bss net/wireless/rdev-ops.h:418 [inline]
 cfg80211_inform_single_bss_data+0x8ea/0x1df0 net/wireless/scan.c:2367
 cfg80211_inform_bss_data+0x224/0x3bc0 net/wireless/scan.c:3222
 cfg80211_inform_bss_frame_data+0x26f/0x750 net/wireless/scan.c:3313
 ieee80211_bss_info_update+0x310/0xab0 net/mac80211/scan.c:226
 ieee80211_rx_bss_info net/mac80211/ibss.c:1094 [inline]
 ieee80211_rx_mgmt_probe_beacon net/mac80211/ibss.c:1573 [inline]
 ieee80211_ibss_rx_queued_mgmt+0x1905/0x2fd0 net/mac80211/ibss.c:1600
 ieee80211_iface_process_skb net/mac80211/iface.c:1668 [inline]
 ieee80211_iface_work+0xbf4/0x1020 net/mac80211/iface.c:1722
page last free pid 2938 tgid 2938 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0x7fe/0x1180 mm/page_alloc.c:2706
 discard_slab mm/slub.c:2717 [inline]
 __put_partials+0x16d/0x1c0 mm/slub.c:3186
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4d/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4148 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 kmem_cache_alloc_node_noprof+0x1d5/0x3b0 mm/slub.c:4249
 __alloc_skb+0x2b2/0x380 net/core/skbuff.c:660
 alloc_skb include/linux/skbuff.h:1336 [inline]
 nlmsg_new include/net/netlink.h:1041 [inline]
 br_vlan_notify+0x15b/0x8c0 net/bridge/br_vlan.c:1933
 br_vlan_bridge_event+0x343/0x5c0 net/bridge/br_vlan.c:1772
 br_device_event+0x3d8/0xa00 net/bridge/br.c:40
 notifier_call_chain+0xbc/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2230
 call_netdevice_notifiers_extack net/core/dev.c:2268 [inline]
 call_netdevice_notifiers net/core/dev.c:2282 [inline]
 unregister_netdevice_many_notify+0xf9d/0x2700 net/core/dev.c:12077
 ops_exit_rtnl_list net/core/net_namespace.c:188 [inline]
 ops_undo_list+0x8fc/0xab0 net/core/net_namespace.c:249
 cleanup_net+0x408/0x890 net/core/net_namespace.c:686
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238

Memory state around the buggy address:
 ffff88807ab4c700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88807ab4c780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88807ab4c800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff88807ab4c880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807ab4c900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         4c06e63b Merge tag 'for-6.16-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15708f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9887aa986c36cc50
dashboard link: https://syzkaller.appspot.com/bug?extid=bc71245e56f06e3127b7
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=119473d4580000

