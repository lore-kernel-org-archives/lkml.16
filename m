Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1D626156B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749132788; cv=none; b=lfpVh76nsV4woG6EVmgkKLa/hUONmtsCqiD1hXgyM8bAtPGwLc0fnp1bFu8FMTKpH3epu/g4NDHf2ofMjYM2WV7e5hVOMxQoMMsDlawkPWIu8QLeEArlzAWkbT5+Su7ExEeoq4vVzRBBcvROGSwr9Y1NeFTRTAV+9OCthI8gJd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749132788; c=relaxed/simple;
	bh=umSL5beEUobeZGxzkBdiVbovvnKj7LQIpwGmCZgcxEE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P4gVjfRc7tvJnREVNGqoKNxNZoFFnnnW7pvXpGNxUjWEAPtymUVK/A+gGtSQB2L1N95GHmOS2E4+4zO9IkintV6F1st9U2SpjRMAcDgQrUN6MUgqsXCIh7UHpW23nNM8hiYxkyL5bvgNb3efG9ulnkbsFhjNAcsSaWBek8ifP78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc4908c4dso16776855ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 07:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749132785; x=1749737585;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YW0P8XbUGYocEpxJlVM+/uRIsSaN1nclHTkqn2m8Gg=;
        b=VP9JeJarnnPqUqnD76Rqhg+EeC9dV03qKk4Nz419s5Nz/vV6wJIok0DMt2exg5FucD
         yY+IvGUClomxQxk1mV/cXI94Psx0bNvLZxuwz/P2PTwoKFbTI6d6H0TGD1p2PBsscNXC
         Rw0lRCNOYk+AscoswNXDlX8x8+y/3yH9AfLryoMzNob/kHtMDSFqtgsXkusf5v9ggEJx
         CRi7Q7QQhgwn7U/GFFRnzPozRRPUfJnrOWdY5rqrJKcRL5Um38lRemz/gj69jFUDPrDs
         fcvwcyV/4Y3yvpj1Xd4Sa+eEmOeUc03a2UUj02HnHfX/x4X7Kg2R6lh17TP++L6gHc3b
         e5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCkwJA6KLUThnPfCp0fAA1aTdaMYk53PxLs+qO/FTXbC8P4InV186tdj0rvvsEwnZ/gNM+ImqgBXhvL5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ9cOLu+ebMZw/Wr987+91AZPK85Nfr6fjL2pz7YGaQvtWgUeD
	Sk4LhCJtCBkmcEjynf9uQIObTkhPwnmCUpS9VecrgMpNkCCwbR64gQvxhCAWPsxP8/kEzMgieM8
	opa+HDmQ2ls83PnZdItrBEZjx9NPTMdVpuU/1NTwDTWZPcRCH5NWVDi2ssjc=
X-Google-Smtp-Source: AGHT+IGKZYs/Gw8/RLLsEhgGcVbl8fczGXpCxOuE47LrLxHgzkgsAIwbmSeTXEEmSmy7aC3oJIxn4Ably3ELB11fwFqe4tprfb/x
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2188:b0:3dd:a4f0:8339 with SMTP id
 e9e14a558f8ab-3ddbed0ef1cmr79162445ab.8.1749132783370; Thu, 05 Jun 2025
 07:13:03 -0700 (PDT)
Date: Thu, 05 Jun 2025 07:13:03 -0700
In-Reply-To: <tencent_5E9E6E1BDB4B9B1B062565BA47BB9A336A08@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6841a5ef.a00a0220.d4325.001c.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in ntfs_utf16_to_nls
From: syzbot <syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering=
 an issue:
KASAN: slab-out-of-bounds Read in ntfs_utf16_to_nls

nl: 254, name: file0aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa, ntfs_dir_emit
keysize: 76, name len: 255, nls: ffffffff8e445280, fn: f, ntfs_dir_emit
ntfs3(loop0): failed to convert "0000" to maccroatian
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-out-of-bounds in ntfs_utf16_to_nls+0x3c9/0x5a0 fs/ntfs3/di=
r.c:49
Read of size 2 at addr ffff888033905000 by task syz.0.16/6595

CPU: 1 UID: 0 PID: 6595 Comm: syz.0.16 Not tainted 6.15.0-syzkaller-12141-g=
ec7714e49479-dirty #0 PREEMPT(full)=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 ntfs_utf16_to_nls+0x3c9/0x5a0 fs/ntfs3/dir.c:49
 ntfs_dir_emit fs/ntfs3/dir.c:310 [inline]
 ntfs_read_hdr+0x6b5/0xca0 fs/ntfs3/dir.c:387
 ntfs_readdir+0xa5c/0xdd0 fs/ntfs3/dir.c:498
 iterate_dir+0x5ac/0x770 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:410 [inline]
 __se_sys_getdents64+0xe4/0x260 fs/readdir.c:396
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f414938e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f414a2cd038 EFLAGS: 00000246 ORIG_RAX: 00000000000000d9
RAX: ffffffffffffffda RBX: 00007f41495b5fa0 RCX: 00007f414938e969
RDX: 0000000000001000 RSI: 0000200000000f80 RDI: 0000000000000004
RBP: 00007f4149410ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f41495b5fa0 R15: 00007fffafbf4148
 </TASK>

Allocated by task 6595:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4328 [inline]
 __kmalloc_noprof+0x27a/0x4f0 mm/slub.c:4340
 kmalloc_noprof include/linux/slab.h:909 [inline]
 indx_read+0x27c/0xc20 fs/ntfs3/index.c:1059
 ntfs_readdir+0x9d8/0xdd0 fs/ntfs3/dir.c:493
 iterate_dir+0x5ac/0x770 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:410 [inline]
 __se_sys_getdents64+0xe4/0x260 fs/readdir.c:396
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888033904000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes to the right of
 allocated 4096-byte region [ffff888033904000, ffff888033905000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x33900
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=3D0|zone=3D1|lastcpupid=3D0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a442140 dead000000000122 0000000000000000
raw: 0000000000000000 0000000080040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801a442140 dead000000000122 0000000000000000
head: 0000000000000000 0000000080040004 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0000ce4001 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__=
GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 6595, t=
gid 6594 (syz.0.16), ts 131229531839, free_ts 131158758528
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x21d5/0x22b0 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4959
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2451 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2619
 new_slab mm/slub.c:2673 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3859
 __slab_alloc mm/slub.c:3949 [inline]
 __slab_alloc_node mm/slub.c:4024 [inline]
 slab_alloc_node mm/slub.c:4185 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x305/0x4f0 mm/slub.c:4340
 kmalloc_noprof include/linux/slab.h:909 [inline]
 indx_read+0x27c/0xc20 fs/ntfs3/index.c:1059
 indx_find+0x4bb/0xba0 fs/ntfs3/index.c:1179
 indx_insert_entry+0x4f1/0x720 fs/ntfs3/index.c:1963
 ntfs_create_inode+0x2317/0x3340 fs/ntfs3/inode.c:1620
 ntfs_mknod+0x3b/0x50 fs/ntfs3/namei.c:120
 vfs_mknod+0x37f/0x3c0 fs/namei.c:4235
 do_mknodat+0x385/0x4d0 fs/namei.c:-1
 __do_sys_mknod fs/namei.c:4318 [inline]
 __se_sys_mknod fs/namei.c:4316 [inline]
 __x64_sys_mknod+0x8c/0xa0 fs/namei.c:4316
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
page last free pid 6275 tgid 6275 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc65/0xe60 mm/page_alloc.c:2706
 discard_slab mm/slub.c:2717 [inline]
 __put_partials+0x161/0x1c0 mm/slub.c:3186
 put_cpu_partial+0x17c/0x250 mm/slub.c:3261
 __slab_free+0x2f7/0x400 mm/slub.c:4513
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4148 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4204
 anon_vma_chain_alloc mm/rmap.c:142 [inline]
 __anon_vma_prepare+0xcb/0x4a0 mm/rmap.c:195
 __vmf_anon_prepare mm/memory.c:3523 [inline]
 vmf_anon_prepare mm/internal.h:410 [inline]
 do_anonymous_page mm/memory.c:5087 [inline]
 do_pte_missing mm/memory.c:4249 [inline]
 handle_pte_fault mm/memory.c:6089 [inline]
 __handle_mm_fault+0x4d02/0x5620 mm/memory.c:6232
 handle_mm_fault+0x2d5/0x7f0 mm/memory.c:6401
 do_user_addr_fault+0x764/0x1390 arch/x86/mm/fault.c:1387
 handle_page_fault arch/x86/mm/fault.c:1476 [inline]
 exc_page_fault+0x76/0xf0 arch/x86/mm/fault.c:1532
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623

Memory state around the buggy address:
 ffff888033904f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888033904f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888033905000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                   ^
 ffff888033905080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888033905100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


Tested on:

commit:         ec7714e4 Merge tag 'rust-6.16' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=3D136f31d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D26abb92f9ef9d1d=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3D598057afa0f49e62b=
d23
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-=
1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1411e5705800=
00

