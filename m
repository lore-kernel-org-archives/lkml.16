Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CF028D8C9
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 23:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820665; cv=none; b=TJhkB30weYjtuyRszUz04oqRV+GYgOf81XvzUrStBGb/RhZXDUefE55PX8wi6KHE3pRLUOrXnhEllehxWX0DEjKhdCX/qobZgwEPTf30WX0wQ0uO80FtBdU+cnVRzNscRqocYLv/27Qo+d7nvkz+ZrTqVDEicdUuB5LDKaAKcAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820665; c=relaxed/simple;
	bh=KKFnwsUkXK3cO3gnt+y7AHgqFQanNG0Da/tJNjZLCos=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W5MtOwwqHo/kMwfQva5qTLACNhSJhB5v087MxpsyEYm2T0p/EozHrI2O7eilZD/8myZuvYaQPgYbnp/UedwIBwBOvKs/0V0YrG/v8soPLMtmG0DC90U5UDqrhu27dpQZBBu/CFngpDn5eKMBx0xW7DVvRSe9oj8YH+qmbu7O6i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86f4e2434b6so80294139f.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 16:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748820662; x=1749425462;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRwjphiC8lg73poxL4TeTlQKXOjKsMAQ7W0Cv5rLC+8=;
        b=gQLWaSMoaiQrWP5T4SX8a2dFNqV4F6+sQI6hZNMdx4kafIiRyGjO5FeS5tcmMinOwQ
         ZzaO/gEnnTK9Au4b2vvXATLjckX/EyxlgRGEnWmcoccuRHfmIv6i5GInjM+RA1aKzChG
         5Lh/Ee+z8FFaAKvJxkebzuQCI0oZqN6GaKaI8IDtYBxzsTv6m+rYH/SZq+esqsUvyfob
         tkhgGeySLcnDXTwVvnzz/TyhUryZGwvwceRfbBXhgfkpsx4TTykkhkI4LUraPaxqmfs5
         WNRxGpsHi0Tk0A4OYFaxbPYO3snKqt2VecB8fZaKIa+BpmSKJhjriydIsNLXR7g/k6vI
         Zn2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQgdJ9Gk70RJ3XrCp3s2nD38m/cGDzos3xXWnJZSIck6eO0RhZgprl/KGUSy4KkLhjMUYaGvJMjtfDn6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YweX+iB86YG3GQ6mLFVd9FmH5yNabP801XygczBAqZfCcr0x1aG
	fWh7IZADtaWSC5uGx5rV3EqHisUH5845sAJh5DSH7WnxQpKhLlP7MNEOeXmMoXqZl3X5jGQVV40
	Www958HdvQ04a/yPg/nAiczh50Irnd5X9+aEltIaJpDv50CuKP1n9IOSXlkU=
X-Google-Smtp-Source: AGHT+IEMqlopUGtHPZUc44mFIF8A4WE1RvQcn5RCpAmTYNFlLjQ42IYJwvw4kuQsuoNnv+QruDDZ0pcLR9k8AyUbFRBod4e2sEKT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3810:b0:3dc:90fc:282d with SMTP id
 e9e14a558f8ab-3dd9cbd3f78mr88607875ab.16.1748820662577; Sun, 01 Jun 2025
 16:31:02 -0700 (PDT)
Date: Sun, 01 Jun 2025 16:31:02 -0700
In-Reply-To: <20250601231608.2638-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683ce2b6.a00a0220.d8eae.0038.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-out-of-bounds Read in __futex_pivot_hash
From: syzbot <syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-out-of-bounds Read in __futex_pivot_hash

==================================================================
BUG: KASAN: slab-out-of-bounds in __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
BUG: KASAN: slab-out-of-bounds in _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
Read of size 1 at addr ffff888052d074e0 by task syz.0.16/6505

CPU: 1 UID: 0 PID: 6505 Comm: syz.0.16 Not tainted 6.15.0-syzkaller-gcd2e103d57e5-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xcd/0x680 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 __kasan_check_byte+0x36/0x50 mm/kasan/common.c:557
 kasan_check_byte include/linux/kasan.h:399 [inline]
 lock_acquire kernel/locking/lockdep.c:5845 [inline]
 lock_acquire+0xfc/0x350 kernel/locking/lockdep.c:5828
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:351 [inline]
 futex_rehash_private kernel/futex/core.c:213 [inline]
 __futex_pivot_hash+0x225/0x6d0 kernel/futex/core.c:252
 futex_hash_allocate+0xad1/0xf00 kernel/futex/core.c:1664
 futex_hash_prctl+0x1f4/0x650 kernel/futex/core.c:1759
 __do_sys_prctl+0x171f/0x24c0 kernel/sys.c:2825
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7e8738e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7e882e3038 EFLAGS: 00000246 ORIG_RAX: 000000000000009d
RAX: ffffffffffffffda RBX: 00007f7e875b5fa0 RCX: 00007f7e8738e969
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 000000000000004e
RBP: 00007f7e87410ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f7e875b5fa0 R15: 00007fff0b994368
 </TASK>

Allocated by task 6506:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kvmalloc_node_noprof+0x279/0x620 mm/slub.c:5012
 futex_hash_allocate+0x49d/0xf00 kernel/futex/core.c:1603
 futex_hash_prctl+0x1f4/0x650 kernel/futex/core.c:1759
 __do_sys_prctl+0x171f/0x24c0 kernel/sys.c:2825
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888052d07480
 which belongs to the cache kmalloc-cg-64 of size 64
The buggy address is located 32 bytes to the right of
 allocated 64-byte region [ffff888052d07480, ffff888052d074c0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888052d07800 pfn:0x52d07
memcg:ffff888029437c01
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801b849a40 dead000000000122 0000000000000000
raw: ffff888052d07800 000000008020001e 00000000f5000000 ffff888029437c01
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 6405, tgid 6405 (syz-executor), ts 88336803313, free_ts 88336042403
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x1321/0x3890 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x261/0x23f0 mm/page_alloc.c:4959
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab mm/slub.c:2618 [inline]
 new_slab+0x23b/0x330 mm/slub.c:2672
 ___slab_alloc+0xd9c/0x1940 mm/slub.c:3858
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3948
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kvmalloc_node_noprof+0x3af/0x620 mm/slub.c:5012
 allocate_hook_entries_size net/netfilter/core.c:58 [inline]
 nf_hook_entries_grow+0x22b/0x860 net/netfilter/core.c:137
 __nf_register_net_hook+0x1cd/0x730 net/netfilter/core.c:432
 nf_register_net_hook+0x109/0x160 net/netfilter/core.c:575
 nf_register_net_hooks+0x5d/0xd0 net/netfilter/core.c:591
 arpt_register_table+0x29b/0x410 net/ipv4/netfilter/arp_tables.c:1561
 arptable_filter_table_init+0x40/0x60 net/ipv4/netfilter/arptable_filter.c:39
 xt_find_table_lock+0x2e1/0x520 net/netfilter/x_tables.c:1260
 xt_request_find_table_lock+0x28/0xf0 net/netfilter/x_tables.c:1285
page last free pid 6405 tgid 6405 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0x7fe/0x1180 mm/page_alloc.c:2706
 ___free_pages_bulk mm/kasan/shadow.c:332 [inline]
 __kasan_populate_vmalloc mm/kasan/shadow.c:375 [inline]
 kasan_populate_vmalloc+0x18c/0x1f0 mm/kasan/shadow.c:417
 alloc_vmap_area+0x959/0x29c0 mm/vmalloc.c:2084
 __get_vm_area_node+0x1ca/0x330 mm/vmalloc.c:3179
 __vmalloc_node_range_noprof+0x271/0x14b0 mm/vmalloc.c:3845
 __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:3948
 ebt_register_table+0x243/0xfc0 net/bridge/netfilter/ebtables.c:1211
 find_inlist_lock_noload net/bridge/netfilter/ebtables.c:343 [inline]
 find_inlist_lock.constprop.0+0x1d0/0x730 net/bridge/netfilter/ebtables.c:370
 find_table_lock net/bridge/netfilter/ebtables.c:379 [inline]
 do_ebt_get_ctl+0x225/0x7c0 net/bridge/netfilter/ebtables.c:2468
 nf_getsockopt+0x7c/0xe0 net/netfilter/nf_sockopt.c:116
 ip_getsockopt+0x18c/0x1e0 net/ipv4/ip_sockglue.c:1777
 tcp_getsockopt+0x9e/0x100 net/ipv4/tcp.c:4760
 do_sock_getsockopt+0x3fc/0x800 net/socket.c:2357
 __sys_getsockopt+0x12f/0x260 net/socket.c:2386
 __do_sys_getsockopt net/socket.c:2393 [inline]
 __se_sys_getsockopt net/socket.c:2390 [inline]
 __x64_sys_getsockopt+0xbd/0x160 net/socket.c:2390
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94

Memory state around the buggy address:
 ffff888052d07380: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888052d07400: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff888052d07480: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
                                                       ^
 ffff888052d07500: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
 ffff888052d07580: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         cd2e103d Merge tag 'hardening-v6.16-rc1-fix1-take2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=168ccc82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4df26174733e11f3
dashboard link: https://syzkaller.appspot.com/bug?extid=0a5079ee014f4b907817
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1172a80c580000

