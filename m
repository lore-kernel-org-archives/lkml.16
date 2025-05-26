Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1D71FFC46
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262032; cv=none; b=IBkwXGT7b6y6Q7RkBejfScw+Wray7RXwwyIvIgJlC2y0jduA3RPWAAgVeNBbw2nKQOVyVH7VPrwAUoxQKpaTWzqIehLJEP2YgUzKreVi7afM7f64BMu44sa3MpP8Y/0j0x5YiIXqLEBP+FZUel+roYyiybq4J1jMY/YRwr9aMk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262032; c=relaxed/simple;
	bh=+9yG5BlZ9YFVGSIO+Pw1Ycx2JiyJdwAWFm1wdqwExFA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=aR+tz5ClIxD9bYmbkBfJb3IcgXEtuCPPlmqXZB4TXO6BUVE1/u3WYJOLVecOHgxlxk6nHZ3/LV/4b2LTgwe6J6U7t9HjuBB+8Vto1JRlLO0FnMpmdfKWgO49uaKeQ1roKjbGjuJo/ej0DH2zrAg0fe3E/GZgN9uOvZoPxAwIdqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-86176e300fdso198887839f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262030; x=1748866830;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ZFRirMrvovkvR0p68pHt3VbOxANt86tu4o2mfiacfc=;
        b=kzAmezfCgWJ2wVIrYHLstiizK5Z3hf4wmR2zPbjOEqdvPCvWn2U8hKPrsnnh5cSmzg
         JWrYElruF80j98GNz3G2/f8Za0L1WuszD+gzz3ZOMpQYG+39UFTQaD97NCVvOgLOVBZW
         eOZawnqWAtQCF/NL7BUc/CTJRiJuZ5Q2jbIOlbM5DTGDURlUwCD03grnWJaCXA/IMWgp
         GBDVNVzz740z2nzLvYanU9+hzcjvSIB1sY+6hluaKzxgSSsouqA6DaZItCGQA+il8Z3C
         rTL5Ow47BPEdIyR3xlzVSW4dZ3u4Z3retX/ELFpW3WkRruYQUhFUVQOzOsu4aTGJR762
         Oq8A==
X-Forwarded-Encrypted: i=1; AJvYcCWLrCCccEdaPM9BZ0o337OuAniyHdXhDn3s2pwHiJ5SUXBpXtwf+TV1RKjYfB8PHIvtfhdgUwD8E2k4hf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+AyIR26Nxw4FyAVbpZ513PZ7yDpmVq+FxGfChyRc0b/2Dc1U
	LTU04PBteQXfVhD8O1sABTyIZICPqTcDh4DVbe6kz1PbPATJxlNfxcTroupDpi7mtT6kZaoR/CJ
	3mCuLdqIkA0zP/0y/1EZtYxi1yjKlbRkj7/TGaGNJAQAObFKcsHamiWcY6ww=
X-Google-Smtp-Source: AGHT+IE53qGmkRTlRpiqAjt7FN6tu0ny6mUmqw9514wvPqae75aJ2FctWgsScppsWX2JZL7Y2P8NxAsVTp01ZwlvJD9gotM4d12I
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4011:b0:862:fe54:df4e with SMTP id
 ca18e2360f4ac-86cbb7fc4ffmr861566839f.7.1748262029990; Mon, 26 May 2025
 05:20:29 -0700 (PDT)
Date: Mon, 26 May 2025 05:20:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68345c8d.a70a0220.253bc2.0097.GAE@google.com>
Subject: [syzbot] [f2fs?] KASAN: slab-out-of-bounds Read in build_sit_entries
From: syzbot <syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    176e917e010c Add linux-next specific files for 20250523
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=148c2170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=1fa48dc6faf1ff972d7d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=128bead4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=100288e8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5f7692c642fa/disk-176e917e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/057a442d42d0/vmlinux-176e917e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8f8ebdb4dd96/bzImage-176e917e.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/81e56747f56a/mount_2.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=138f59f4580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 262144
==================================================================
BUG: KASAN: slab-out-of-bounds in sanity_check_valid_blocks fs/f2fs/segment.h:385 [inline]
BUG: KASAN: slab-out-of-bounds in build_sit_entries+0x1b0c/0x1f80 fs/f2fs/segment.c:5060
Read of size 4 at addr ffff888024798a20 by task syz-executor138/5840

CPU: 0 UID: 0 PID: 5840 Comm: syz-executor138 Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 sanity_check_valid_blocks fs/f2fs/segment.h:385 [inline]
 build_sit_entries+0x1b0c/0x1f80 fs/f2fs/segment.c:5060
 f2fs_build_segment_manager+0x3112/0x49f0 fs/f2fs/segment.c:5707
 f2fs_fill_super+0x45bc/0x6c80 fs/f2fs/super.c:4754
 mount_bdev+0x211/0x2c0 fs/super.c:1736
 legacy_get_tree+0xfd/0x1a0 fs/fs_context.c:666
 vfs_get_tree+0x92/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff3b36f7e6a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 5e 04 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc20c3a528 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffc20c3a540 RCX: 00007ff3b36f7e6a
RDX: 0000200000020440 RSI: 0000200000020480 RDI: 00007ffc20c3a540
RBP: 0000200000020480 R08: 00007ffc20c3a580 R09: 0000000000020419
R10: 0000000000000000 R11: 0000000000000286 R12: 0000200000020440
R13: 00007ffc20c3a580 R14: 0000000000000003 R15: 0000000000000000
 </TASK>

Allocated by task 5840:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kvmalloc_node_noprof+0x30d/0x5f0 mm/slub.c:5014
 f2fs_kvmalloc fs/f2fs/f2fs.h:3527 [inline]
 f2fs_kvzalloc fs/f2fs/f2fs.h:3533 [inline]
 build_sit_info fs/f2fs/segment.c:4779 [inline]
 f2fs_build_segment_manager+0x1485/0x49f0 fs/f2fs/segment.c:5696
 f2fs_fill_super+0x45bc/0x6c80 fs/f2fs/super.c:4754
 mount_bdev+0x211/0x2c0 fs/super.c:1736
 legacy_get_tree+0xfd/0x1a0 fs/fs_context.c:666
 vfs_get_tree+0x92/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888024798000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes to the right of
 allocated 2592-byte region [ffff888024798000, ffff888024798a20)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x24798
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a442140 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801a442140 dead000000000122 0000000000000000
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea000091e601 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5840, tgid 5840 (syz-executor138), ts 92190833917, free_ts 90155481941
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4959
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kvmalloc_node_noprof+0x429/0x5f0 mm/slub.c:5014
 f2fs_kvmalloc fs/f2fs/f2fs.h:3527 [inline]
 f2fs_kvzalloc fs/f2fs/f2fs.h:3533 [inline]
 build_sit_info fs/f2fs/segment.c:4779 [inline]
 f2fs_build_segment_manager+0x1485/0x49f0 fs/f2fs/segment.c:5696
 f2fs_fill_super+0x45bc/0x6c80 fs/f2fs/super.c:4754
 mount_bdev+0x211/0x2c0 fs/super.c:1736
 legacy_get_tree+0xfd/0x1a0 fs/fs_context.c:666
 vfs_get_tree+0x92/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5833 tgid 5833 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
 discard_slab mm/slub.c:2716 [inline]
 __put_partials+0x161/0x1c0 mm/slub.c:3185
 put_cpu_partial+0x17c/0x250 mm/slub.c:3260
 __slab_free+0x2f7/0x400 mm/slub.c:4512
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4147 [inline]
 slab_alloc_node mm/slub.c:4196 [inline]
 kmem_cache_alloc_node_noprof+0x1bb/0x3c0 mm/slub.c:4248
 __alloc_skb+0x112/0x2d0 net/core/skbuff.c:660
 alloc_skb_fclone include/linux/skbuff.h:1386 [inline]
 tcp_stream_alloc_skb+0x3d/0x340 net/ipv4/tcp.c:894
 tcp_sendmsg_locked+0x115c/0x5550 net/ipv4/tcp.c:1204
 tcp_sendmsg+0x2f/0x50 net/ipv4/tcp.c:1400
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x19c/0x270 net/socket.c:727
 sock_write_iter+0x258/0x330 net/socket.c:1131
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x548/0xa90 fs/read_write.c:686
 ksys_write+0x145/0x250 fs/read_write.c:738

Memory state around the buggy address:
 ffff888024798900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888024798980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888024798a00: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
                               ^
 ffff888024798a80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888024798b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
