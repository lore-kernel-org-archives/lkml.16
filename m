Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B16D1DE4E3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749055782; cv=none; b=e2grYgN+/+OV/Pf2POQLs12jPdRfl9kI4U2kYdWs7pLbwHuUyBtVywUyfg7oig5vW5SU+/kmbg30YqPlMsvqcR7mMSjjmCzBtERy01gR3T5lzwi23GfCSsOw6L8mNmj3SGg1vgS3wXogzzD339NlNFh+LtiIqDr0IhGJ9kvkH1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749055782; c=relaxed/simple;
	bh=YHu4jGF1YZkVGWIkqN8M9mNusZtcaNE6i9u1jHDIVjM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=a88Fs9M6EPhAmovWMupCHpTg/iTBlyv9y6xXEdijiEvYs1jpnC7bexVYbWitoQ7PhkC+unt0Ps+jS+8qKGyn96rSlt4CP9IIAleCQppu8tIDtW2X1LanRfXeeBAJ2ur/hCI6pG13w6ESj8TpgEZoYYb7WNsUqQLphng7QFjwlyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddc0a6d4bdso1254065ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749055779; x=1749660579;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LY0iAR1mVKVdvCWEoGg6XCJvj+K1kuwpgZIryLUf6Uo=;
        b=sExsv6Rf5rIr44QxINIDVtJxSaXdwDTpfX4VT9q1GzstVOFpuTxwD14wwNjLoQnIYF
         ONW+D8ckrYuEJMpPuo8d8H91YDn4u7ckZFSL93FWTEKUo5FLEW5f85B4JPsGWNZO30YX
         LsqWVP5ITWaubu/SFU2zo976GvD3dsXiocSgzmsWaOhqA063j387d53LliN6h24ZETI+
         7Lls9kuJkQNLxTEPY9EK1dncsPuw/QajfbgG8nHkSfmKTF7jxjAc0soWhM++9Mr8LX9L
         4mS+A3fB83nDvFre/8S4XvBx5QyanRIPST5GSm5tmUjMFbZ3EOZ3qZuml1WWcFrvm95Z
         oreg==
X-Forwarded-Encrypted: i=1; AJvYcCW0fdhauq2cMe8cXCM1Enjjh/wANN0MK6+CwsJEskgNCOzlH7zm7xwJnkGcxTNvB5TfJDQzKdBWAWTLZjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoP1fX92oglL+dsgWE/LojWjd1e5o3uSIf/iKoS6lG9d6HDuqL
	tgypZA6iqM7lhFLYCWZM9duhpfpdsT+A/ZgkF47dqQCIUgVSnrkiJvdGUHP6kw8wAoRMn3zjo49
	TwlvUPGL3QhwnQazdIfDdGJqfnDkx3jmHxvGj25ELA7K15d6Jy0Y8gr3iELY=
X-Google-Smtp-Source: AGHT+IHl7MMEDMkYIj0El3grfSetVsJPbG3tlPNbWW9btv6EsUelEiy1s4MjFIDgxQAlTmjpmRKkoOePK7YFjFhslEgFncrCRDi4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4508:10b0:3dc:8b29:30b1 with SMTP id
 e9e14a558f8ab-3ddbed5f03dmr26573375ab.14.1749055779521; Wed, 04 Jun 2025
 09:49:39 -0700 (PDT)
Date: Wed, 04 Jun 2025 09:49:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68407923.a00a0220.d8eae.008f.GAE@google.com>
Subject: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in ntfs_utf16_to_nls
From: syzbot <syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0f70f5b08a47 Merge tag 'pull-automount' of git://git.kerne..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=167abed4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=22765942f2e2ebcf
dashboard link: https://syzkaller.appspot.com/bug?extid=598057afa0f49e62bd23
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13a2200c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12831970580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4af859a809ab/disk-0f70f5b0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d3df10c6aa23/vmlinux-0f70f5b0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3a2d5f44d739/bzImage-0f70f5b0.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/d6f6d89632f0/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com

ntfs3(loop0): failed to convert "0000" to maccroatian
==================================================================
BUG: KASAN: slab-out-of-bounds in ntfs_utf16_to_nls+0x3c9/0x5a0 fs/ntfs3/dir.c:49
Read of size 2 at addr ffff88807c7f1000 by task syz-executor243/5824

CPU: 0 UID: 0 PID: 5824 Comm: syz-executor243 Not tainted 6.15.0-syzkaller-09161-g0f70f5b08a47 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 ntfs_utf16_to_nls+0x3c9/0x5a0 fs/ntfs3/dir.c:49
 ntfs_dir_emit fs/ntfs3/dir.c:307 [inline]
 ntfs_read_hdr+0x508/0xbc0 fs/ntfs3/dir.c:383
 ntfs_readdir+0xa5c/0xdd0 fs/ntfs3/dir.c:494
 iterate_dir+0x5ac/0x770 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:410 [inline]
 __se_sys_getdents64+0xe4/0x260 fs/readdir.c:396
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f34189bde59
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff44014e48 EFLAGS: 00000246 ORIG_RAX: 00000000000000d9
RAX: ffffffffffffffda RBX: 0000200000000080 RCX: 00007f34189bde59
RDX: 0000000000001000 RSI: 0000200000000f80 RDI: 0000000000000004
RBP: 00007f3418a515f0 R08: 000055556d8c34c0 R09: 000055556d8c34c0
R10: 000055556d8c34c0 R11: 0000000000000246 R12: 00007fff44014e70
R13: 00007fff44015098 R14: 431bde82d7b634db R15: 00007f3418a0703b
 </TASK>

Allocated by task 5824:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x27a/0x4f0 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 indx_read+0x27c/0xc20 fs/ntfs3/index.c:1059
 ntfs_readdir+0x9d8/0xdd0 fs/ntfs3/dir.c:489
 iterate_dir+0x5ac/0x770 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:410 [inline]
 __se_sys_getdents64+0xe4/0x260 fs/readdir.c:396
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88807c7f0000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes to the right of
 allocated 4096-byte region [ffff88807c7f0000, ffff88807c7f1000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7c7f0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a442140 dead000000000122 0000000000000000
raw: 0000000000000000 0000000080040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801a442140 dead000000000122 0000000000000000
head: 0000000000000000 0000000080040004 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0001f1fc01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5824, tgid 5824 (syz-executor243), ts 94062103587, free_ts 87837995758
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1710
 prep_new_page mm/page_alloc.c:1718 [inline]
 get_page_from_freelist+0x21d1/0x22b0 mm/page_alloc.c:3680
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4970
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_noprof+0x305/0x4f0 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 indx_read+0x27c/0xc20 fs/ntfs3/index.c:1059
 ntfs_readdir+0x9d8/0xdd0 fs/ntfs3/dir.c:489
 iterate_dir+0x5ac/0x770 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:410 [inline]
 __se_sys_getdents64+0xe4/0x260 fs/readdir.c:396
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5814 tgid 5814 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1254 [inline]
 __free_frozen_pages+0xc65/0xe50 mm/page_alloc.c:2717
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
 kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4203
 vm_area_dup+0x28/0x540 kernel/fork.c:488
 __split_vma+0x1a0/0x9b0 mm/vma.c:477
 vms_gather_munmap_vmas+0x2de/0x12b0 mm/vma.c:1315
 do_vmi_align_munmap+0x25d/0x420 mm/vma.c:1483
 __do_sys_brk mm/mmap.c:176 [inline]
 __se_sys_brk+0x74e/0xb90 mm/mmap.c:115
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88807c7f0f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88807c7f0f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff88807c7f1000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                   ^
 ffff88807c7f1080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88807c7f1100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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
