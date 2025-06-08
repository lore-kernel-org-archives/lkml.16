Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7E8176242
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749409924; cv=none; b=YtRXPHs1v07DhShomrtDUtgORDC1Frqr1I+Ha6nGDVKxLvDu0G08XAhXVuaUGx1noHXOAvZOvHITb0JIUCssr0vH8VXpO0qN1a1Ku+h4bdcR1m+IrUx4pqfg+6ba9tTcyym6fsSC7YWktQSO/F/Xtzu78W+STcuG24xdlPcOQBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749409924; c=relaxed/simple;
	bh=QAVKjr3MPwWesZfX7D2tU5X+37NR+oYNFiegetdYAVg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tTbDaeUT1NtxBJw0K7Ap0s672MSMKWH74mhc6j/CBfT0q995JjsuiVCxG1SiVFgwxfUF6o3oj802/jkVz8gnjMcVAEXGo9UR/H2taMtwasY454DhhXI12w5U+Lng/QyrbhJlME//OH1g1PCx05VxTJCMFXTFN2lwJ6+J4oy3thc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddccc79b55so17726545ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749409922; x=1750014722;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLAIXzDD67seTQsrB2yMcaDXLR7UUA1H7MtbqkNwh08=;
        b=ceYuMJmuWJxnVULMmn/SDSs1Lp0T5iMcJtxYvRaAC1jW/2U6JV+Aj44wOdfhv60qU1
         2RLFRNVgdz6zraQ5+XkL0abx25SpM9N7+8EyytxrKTuMsaYGWJk6PnA1V9j/EXvfIC3b
         9hbrZUI1ilZNh+jREr4TMjVVPgM6UbFQmkpNbo5j1Xh72zDkJqcvCBtrTupUXfAZ7eIk
         XH6Z7FntKedulH3zOkkTYE0tegu9ncxnn930E+0YkLH7jTWezay9/vSfzSBKXAGv0pvL
         zHlwn+LbgRDHgBb536/2srF6E/0ZLynOKnIi1vhWyt/4iDcrjIFRbH+MDQihkzpatuEJ
         1KEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsXW32KdLxLPenR1txjmkGa4sociV2yh8pofqhPbSVpGVlruT5WaMBHpLKGbiJ15mn+Qr6WfvGtHByoKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDJc4RN00dX5PJE95TB6T0065TyFKEw4VUCD4Bzdq6wp9+iSi3
	MKxA17AvrcZvy7smusY+y3glLnNb8ioV5WRaPqs+XwKG6v7qh2v964ymffHX8WB6Fv1CvaflBx4
	QvOygWCJE4EdUf9ONIuYiIe6u9sdRLBEj40c3Wn9IjChqH9JD2qmIMWWlwlo=
X-Google-Smtp-Source: AGHT+IELxqjwD1DGMtFzT/wY2BBpnAg0yq67ij4OwLVCXX/ieLNoPuOYK1tBu6pcAlospoPWu7F/9T2tMPE/mSN1EFKPsiBtZwqw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4414:10b0:3dd:d6d5:62c0 with SMTP id
 e9e14a558f8ab-3ddd6d56318mr49795325ab.12.1749409922281; Sun, 08 Jun 2025
 12:12:02 -0700 (PDT)
Date: Sun, 08 Jun 2025 12:12:02 -0700
In-Reply-To: <122c9c26-db8f-4523-9e76-a0ae391bdd3c@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6845e082.050a0220.d8705.0011.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: vmalloc-out-of-bounds Read in hci_devcd_dump
From: syzbot <syzbot+ac3c79181f6aecc5120c@syzkaller.appspotmail.com>
To: ipravdin.official@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in force_devcd_write

==================================================================
BUG: KASAN: slab-use-after-free in force_devcd_write+0x312/0x340 drivers/bluetooth/hci_vhci.c:327
Read of size 8 at addr ffff88802a361800 by task syz.0.616/8016

CPU: 0 UID: 0 PID: 8016 Comm: syz.0.616 Not tainted 6.15.0-syzkaller-13804-g939f15e640f1-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xcd/0x680 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 force_devcd_write+0x312/0x340 drivers/bluetooth/hci_vhci.c:327
 full_proxy_write+0x13f/0x200 fs/debugfs/file.c:398
 vfs_write+0x29d/0x1150 fs/read_write.c:684
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f669c18e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f669d03c038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f669c3b5fa0 RCX: 00007f669c18e969
RDX: 000000000000000e RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007f669c210ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f669c3b5fa0 R15: 00007ffcf3655198
 </TASK>

Allocated by task 6529:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 vhci_open+0x4c/0x430 drivers/bluetooth/hci_vhci.c:635
 misc_open+0x35d/0x420 drivers/char/misc.c:161
 chrdev_open+0x231/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x744/0x1c10 fs/open.c:964
 vfs_open+0x82/0x3f0 fs/open.c:1094
 do_open fs/namei.c:3887 [inline]
 path_openat+0x1de4/0x2cb0 fs/namei.c:4046
 do_filp_open+0x20b/0x470 fs/namei.c:4073
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1437
 do_sys_open fs/open.c:1452 [inline]
 __do_sys_openat fs/open.c:1468 [inline]
 __se_sys_openat fs/open.c:1463 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1463
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6529:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0x2b4/0x4d0 mm/slub.c:4842
 vhci_release+0xbb/0xf0 drivers/bluetooth/hci_vhci.c:671
 __fput+0x402/0xb70 fs/file_table.c:465
 task_work_run+0x150/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x864/0x2bd0 kernel/exit.c:955
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1104
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x790 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x84/0x110 kernel/entry/common.c:111
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x3f6/0x490 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802a361800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 0 bytes inside of
 freed 1024-byte region [ffff88802a361800, ffff88802a361c00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2a360
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b441dc0 ffffea00017efa00 dead000000000002
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b441dc0 ffffea00017efa00 dead000000000002
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0000a8d801 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 79, tgid 79 (kworker/u8:4), ts 139345437556, free_ts 139048889741
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
 cfg80211_inform_single_bss_data+0x8e7/0x1df0 net/wireless/scan.c:2367
 cfg80211_inform_bss_data+0x224/0x3bc0 net/wireless/scan.c:3222
 cfg80211_inform_bss_frame_data+0x26f/0x750 net/wireless/scan.c:3313
 ieee80211_bss_info_update+0x310/0xab0 net/mac80211/scan.c:226
 ieee80211_rx_bss_info net/mac80211/ibss.c:1094 [inline]
 ieee80211_rx_mgmt_probe_beacon net/mac80211/ibss.c:1573 [inline]
 ieee80211_ibss_rx_queued_mgmt+0x1905/0x2fd0 net/mac80211/ibss.c:1600
 ieee80211_iface_process_skb net/mac80211/iface.c:1668 [inline]
 ieee80211_iface_work+0xbf4/0x1020 net/mac80211/iface.c:1722
page last free pid 3553 tgid 3553 stack trace:
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
 mpls_netconf_notify_devconf+0x4a/0x110 net/mpls/af_mpls.c:1189
 mpls_dev_sysctl_unregister net/mpls/af_mpls.c:1432 [inline]
 mpls_dev_notify+0x726/0xa20 net/mpls/af_mpls.c:1641
 notifier_call_chain+0xbc/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2230
 call_netdevice_notifiers_extack net/core/dev.c:2268 [inline]
 call_netdevice_notifiers net/core/dev.c:2282 [inline]
 unregister_netdevice_many_notify+0xf9d/0x2700 net/core/dev.c:12077
 ops_exit_rtnl_list net/core/net_namespace.c:188 [inline]
 ops_undo_list+0x8fc/0xab0 net/core/net_namespace.c:249
 cleanup_net+0x408/0x890 net/core/net_namespace.c:686
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402

Memory state around the buggy address:
 ffff88802a361700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802a361780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88802a361800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff88802a361880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802a361900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         939f15e6 Merge tag 'turbostat-2025.06.08' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15687570580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6678e7c8a50af095
dashboard link: https://syzkaller.appspot.com/bug?extid=ac3c79181f6aecc5120c
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=172349d4580000

