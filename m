Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A518F10E5
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739016364; cv=none; b=UBUKa8L/+rgyC+C8Lro/q3KzyBYyzYdUj9YeuPq3FlUrPPVMOEGYmf2PWexqWFTjv4zqxnXxNTKIDhHZeD+wf0yfJ/d+nkcGzm/UpYepryzpinWLlToGy6iivoauDQOgnO2bUBJcoZyjWwIKxaI+2Bl66HuYGCOdlRZr02Bdf+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739016364; c=relaxed/simple;
	bh=0s2voHK2S9DVpSg9J0awPDDlDkZShbbUIsewPmDzcZk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eiJ0+ZMur4tN8U4+JT9wnuTAO/sjO/5Qfqye3f8WpCtxrQA4TxAKeKFT4CmCf+zcSbaMWTuDqWgvWpclB6HSeG4NDCdWINVYPSjPlJafylcdCGflRjwOVTIZ+jEwO+F6rc9LSve3xYcJSsRkWxp02fJXWoDtSOOyBC0TDPeQNqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3cfba354f79so63610685ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 04:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739016362; x=1739621162;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=welYdYUoWmu7PuINuqGZEK/+YSX3GNq0xG8N473x/N8=;
        b=kuICDtfcNX1EFl2Hn+ff4WZe5H+qDmtlED6EC82e0AYXfyDk3DTOLIDvZcOn7Yj06W
         OWrnxXR6hmAkOyfIZlyCUqRTLvO9nNWBZsdUKtGAiGJSU1a3n9EHQ8N8Da7WBzjrMHK5
         aCfAWbkW5KXr3QkH1z6WHlUh1tfGfiEFQBCWSfUOH3Kmkrj8QKLDA5d3pvOMRkACGeYo
         Qd5fl3gfMPcwjAuEcTwolxjSHFhhENqtUlg8oM+1S/5moJbZWvJEOGR6syYmICnqfge8
         xpsM1GfhAtcyBUiGdWFkyXguP4f9FsDCOrc/0nCAckHrAAzqHgsW+nmlrnACHr2cS0xr
         +ytw==
X-Forwarded-Encrypted: i=1; AJvYcCVJqzxK0cEcIQmWvU5HVnAEFLYvImuk5OsUjloYNHMFlSWRanIEMyTseqnIfDh1bl3kY8s+PvbG2qrS1wo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7bvTNZfniu/wo5sN3JEewgFv4JFmrMbHaY9eOuvHI8tvGikCi
	oIfMSeHrFky1KpbIGB2i18ldu3wyZeJdimObYZIILJjaRMR+r2KuDYDxoSbvDIRXaG1Azyz2cuu
	bpuB9jYrzVmddob2M+zS/1+mOMjjdIkTZ48omjh4DWO2xOTW+i/KOrZk=
X-Google-Smtp-Source: AGHT+IHyerFltdFeVcjLDpQi5OCozAglgk/iqAC3WJ9Cq2vO8iO72/ni18BpJYQvUTERDkmCu+7oZ2ggWqFZXXPck+S1ZKT4oQWU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3304:b0:3d0:f31:3657 with SMTP id
 e9e14a558f8ab-3d13da2284bmr62657805ab.0.1739016361809; Sat, 08 Feb 2025
 04:06:01 -0800 (PST)
Date: Sat, 08 Feb 2025 04:06:01 -0800
In-Reply-To: <20250208113525.2055-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a748a9.050a0220.3d72c.0024.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_remove_neigh (2)
From: syzbot <syzbot+8863ad36d31449b4dc17@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in nr_add_node

==================================================================
BUG: KASAN: slab-use-after-free in nr_add_node+0x2c1c/0x2e70 net/netrom/nr_route.c:249
Read of size 4 at addr ffff888035aff930 by task syz-executor312/14225

CPU: 1 UID: 0 PID: 14225 Comm: syz-executor312 Not tainted 6.14.0-rc1-syzkaller-00187-g8f6629c004b1-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 nr_add_node+0x2c1c/0x2e70 net/netrom/nr_route.c:249
 nr_rt_ioctl+0x1270/0x2c60 net/netrom/nr_route.c:655
 nr_ioctl+0x19a/0x2e0 net/netrom/af_netrom.c:1254
 sock_do_ioctl+0x116/0x280 net/socket.c:1199
 sock_ioctl+0x228/0x6c0 net/socket.c:1318
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff70bb692e9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 1f 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffeba91c178 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007ff70bb692e9
RDX: 0000200000000000 RSI: 000000000000890b RDI: 0000000000000008
RBP: 0000000000000000 R08: 00007ffeba91c1b0 R09: 00007ffeba91c1b0
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffeba91c198
R13: 00007ffeba91c1d0 R14: 00000000000000dc R15: 431bde82d7b634db
 </TASK>

Allocated by task 14217:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 nr_add_node+0xf86/0x2e70 net/netrom/nr_route.c:147
 nr_rt_ioctl+0x1270/0x2c60 net/netrom/nr_route.c:655
 nr_ioctl+0x19a/0x2e0 net/netrom/af_netrom.c:1254
 sock_do_ioctl+0x116/0x280 net/socket.c:1199
 sock_ioctl+0x228/0x6c0 net/socket.c:1318
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 14225:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x2c4/0x4d0 mm/slub.c:4757
 nr_neigh_put include/net/netrom.h:143 [inline]
 nr_neigh_put include/net/netrom.h:137 [inline]
 nr_add_node+0x25db/0x2e70 net/netrom/nr_route.c:247
 nr_rt_ioctl+0x1270/0x2c60 net/netrom/nr_route.c:655
 nr_ioctl+0x19a/0x2e0 net/netrom/af_netrom.c:1254
 sock_do_ioctl+0x116/0x280 net/socket.c:1199
 sock_ioctl+0x228/0x6c0 net/socket.c:1318
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888035aff900
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 48 bytes inside of
 freed 64-byte region [ffff888035aff900, ffff888035aff940)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888035affe00 pfn:0x35aff
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801b0418c0 ffffea0001f012d0 ffffea0000d58750
raw: ffff888035affe00 000000000020001f 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 32431, tgid 32431 (syz-executor), ts 397708526704, free_ts 397708295464
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x221/0x2470 mm/page_alloc.c:4739
 alloc_pages_mpol+0x1fc/0x540 mm/mempolicy.c:2270
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2587 [inline]
 new_slab+0x23d/0x330 mm/slub.c:2640
 ___slab_alloc+0xc5d/0x1720 mm/slub.c:3826
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3916
 __slab_alloc_node mm/slub.c:3991 [inline]
 slab_alloc_node mm/slub.c:4152 [inline]
 __kmalloc_cache_noprof+0xfa/0x410 mm/slub.c:4320
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 netlbl_secattr_alloc_noprof include/net/netlabel.h:385 [inline]
 selinux_netlbl_sock_genattr+0xe8/0x4f0 security/selinux/netlabel.c:78
 selinux_netlbl_socket_post_create+0xb0/0x1b0 security/selinux/netlabel.c:404
 selinux_socket_post_create+0x2fa/0x7f0 security/selinux/hooks.c:4686
 security_socket_post_create+0x247/0x260 security/security.c:4577
 __sock_create+0x738/0x8d0 net/socket.c:1571
 sock_create net/socket.c:1606 [inline]
 __sys_socket_create net/socket.c:1643 [inline]
 __sys_socket+0x14f/0x260 net/socket.c:1690
 __do_sys_socket net/socket.c:1704 [inline]
 __se_sys_socket net/socket.c:1702 [inline]
 __x64_sys_socket+0x72/0xb0 net/socket.c:1702
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
page last free pid 32431 tgid 32431 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_frozen_pages+0x6db/0xfb0 mm/page_alloc.c:2660
 vfree+0x174/0x950 mm/vmalloc.c:3383
 copy_entries_to_user net/ipv4/netfilter/arp_tables.c:713 [inline]
 get_entries net/ipv4/netfilter/arp_tables.c:867 [inline]
 do_arpt_get_ctl+0x846/0x9a0 net/ipv4/netfilter/arp_tables.c:1461
 nf_getsockopt+0x79/0xe0 net/netfilter/nf_sockopt.c:116
 ip_getsockopt+0x18e/0x1e0 net/ipv4/ip_sockglue.c:1777
 tcp_getsockopt+0x9e/0x100 net/ipv4/tcp.c:4671
 do_sock_getsockopt+0x3fe/0x800 net/socket.c:2364
 __sys_getsockopt+0x12f/0x260 net/socket.c:2393
 __do_sys_getsockopt net/socket.c:2400 [inline]
 __se_sys_getsockopt net/socket.c:2397 [inline]
 __x64_sys_getsockopt+0xbd/0x160 net/socket.c:2397
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888035aff800: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888035aff880: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff888035aff900: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                     ^
 ffff888035aff980: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
 ffff888035affa00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         8f6629c0 kbuild: Move -Wenum-enum-conversion to W=2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1699cb18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a7ddf49cf33ba213
dashboard link: https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1309cb18580000

