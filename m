Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69178360
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638089; cv=none; b=het/9vHmz9L0dqgW4oYndk8nIiPfpS96Kk1Uu6RzvxvQWlm3LNk2Gp4xIQFDz+bjwOv3zXs9fnkQxJonB9U6UyMz/ZflnrY742+2Y1DjP1IlhK2PIPUNsqbPDJQqPBwenWe06IDpStmi9qDVI36+rEth1b54CyxbFvmVb859uOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638089; c=relaxed/simple;
	bh=PuB52qP+1GqxT8U8Vk5d0GcCzSVHf+3rhoLTQ30Y+gE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pca2SgLBPRK1poioRurqHzdk66tkaJ7IwR5yd5GPDTEJS7/RrlfLdOEYocL6GBd1qwQt2Wi+wI6tGI0yN3T3RLYt1CGZrjQ4WfQViJAy6DZ5OJVypdm3YN4GRM7kDR+S9Mtgzj3YlxRAm5vB3SQJicE7OFgCaEXkWtpIdUs6kPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df2d0b7c7eso10964145ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638086; x=1752242886;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7+ExhPm/usgqLQ30sQUciHeWn2WgXeocUN8IjrbyUc=;
        b=CDy7RK7mv6Pgh6IPQOh1B/xhTmN34AMWYjARelPM3so/2Dq+TkkxaGkgUlwqzL3M3+
         AAjHzMJpbTK+K8EABLE2LfrLTodRHIIU7h6UnkApzTe4ouTpItStkB92rKsPunwB/1rz
         xpKg7249Lr02SZUHSUW8P1QXl0Psmoeqf3poh3MpS9x0GQFxj8Oani9rziPW9/hQHU+0
         iQUhAUM/6uHGLhBQC6PKA2p9L09KP23GTNOeaKNNVJnmZmnEHYI4SMBGsjFOwfPQU4+9
         uYavgbsb+X2TfCfeGTR+VfHqHyq1yyDDaYnb7EP4zgbUni33PKXslUxuLnYL1BXkMQQN
         N/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXECl//JsARF1bju6BEh6KQT8nlWPN32YFV2LKtZe813i3E8Ba+XMcAtqa+784Kfjk89ta5BQmMEC9IOUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+pf63HBmM3MF1uw8oRUlRf/KPx5n8hw+V/V77NNClpx8GutHo
	c6kcsj9ckyFmpzBi4UgjWPQRyerSTTE6biCsCodALk9dgYNnwvCwnPd/WZNJe8a//Vno+VN3Scy
	4h6EDw1N3M/OIhydY4z0Erdm2WPQffBJzEeY+KlAExVOZNw2Omnhscz3MP2s=
X-Google-Smtp-Source: AGHT+IFeNcVT+GPRqrNsVzjvJvkaS6rKPtd1+wxyX5ADq52gvPBRL5OAMva2gYmfXAMy44HKGzP0Q5lKYBqj5EYv/w6hsTJspEoh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:310d:b0:3d9:65b6:d4db with SMTP id
 e9e14a558f8ab-3e136fda126mr22274805ab.12.1751638086416; Fri, 04 Jul 2025
 07:08:06 -0700 (PDT)
Date: Fri, 04 Jul 2025 07:08:06 -0700
In-Reply-To: <20250704135143.2415-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6867e046.a70a0220.29cf51.001d.GAE@google.com>
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
Read of size 8 at addr ffff88807b7c2000 by task syz.0.616/8009

CPU: 1 UID: 0 PID: 8009 Comm: syz.0.616 Not tainted 6.16.0-rc4-syzkaller-g4c06e63b9203-dirty #0 PREEMPT(full) 
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
RIP: 0033:0x7f3d27b8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f3d28949038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f3d27db5fa0 RCX: 00007f3d27b8e929
RDX: 000000000000000e RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007f3d27c10b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f3d27db5fa0 R15: 00007ffd515bb5e8
 </TASK>

Allocated by task 6459:
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

Freed by task 6459:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0x2b4/0x4d0 mm/slub.c:4842
 vhci_release+0xcd/0x110 drivers/bluetooth/hci_vhci.c:687
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

The buggy address belongs to the object at ffff88807b7c2000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 0 bytes inside of
 freed 1024-byte region [ffff88807b7c2000, ffff88807b7c2400)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7b7c0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b841dc0 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b841dc0 0000000000000000 dead000000000001
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0001edf001 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 57, tgid 57 (kworker/u8:4), ts 136316981402, free_ts 132545952720
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
 neigh_alloc net/core/neighbour.c:473 [inline]
 ___neigh_create+0x14e6/0x28c0 net/core/neighbour.c:607
 ip6_finish_output2+0x1299/0x2020 net/ipv6/ip6_output.c:132
 __ip6_finish_output net/ipv6/ip6_output.c:215 [inline]
 ip6_finish_output+0x3f9/0x1360 net/ipv6/ip6_output.c:226
 NF_HOOK_COND include/linux/netfilter.h:306 [inline]
 ip6_output+0x1f9/0x540 net/ipv6/ip6_output.c:247
 dst_output include/net/dst.h:459 [inline]
 NF_HOOK include/linux/netfilter.h:317 [inline]
 ndisc_send_skb+0xa91/0x1e40 net/ipv6/ndisc.c:513
 ndisc_send_rs+0x129/0x670 net/ipv6/ndisc.c:723
 addrconf_dad_completed+0x49d/0x10d0 net/ipv6/addrconf.c:4364
 addrconf_dad_work+0x84d/0x14e0 net/ipv6/addrconf.c:4272
page last free pid 6349 tgid 6349 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0x7fe/0x1180 mm/page_alloc.c:2706
 vfree+0x1fd/0xb50 mm/vmalloc.c:3426
 kcov_put kernel/kcov.c:439 [inline]
 kcov_put kernel/kcov.c:435 [inline]
 kcov_close+0x34/0x60 kernel/kcov.c:535
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

Memory state around the buggy address:
 ffff88807b7c1f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88807b7c1f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88807b7c2000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff88807b7c2080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807b7c2100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         4c06e63b Merge tag 'for-6.16-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10786c8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9887aa986c36cc50
dashboard link: https://syzkaller.appspot.com/bug?extid=bc71245e56f06e3127b7
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=108473d4580000

