Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D026772D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743709470; cv=none; b=MotRq52yY0mI9vIpAPD+WIc8CDB6HiNfQ9qJs0x7jL6MgG2DiCiIMTUL3ZLnB+0HziOz9tY8ONgiQQrF2MBhZNIMg0FO4RRrl4NZJhfUOCFbHXh2rHjwjOJuwZLEO3wAOZiBHEqyuwdi0BUA8YQjsQ6EfrZJs20INX98/Xw3ERQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743709470; c=relaxed/simple;
	bh=oAJNq4ixnI6wq3O9QBBBBPyVm3bfW1sftVHmA+S1+94=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LGppbyqi4YbjChr/Jeu0Y0yCKtyuARhZ6sA3zAVDIHcTfQX78DJOBZYOGN3bf0av9ERB2NrpS8ld1K7Tj3oGiukPODhkDRybiFetRXP6DRXZ7bBfZE8kP5gqlp9kjnF9bK/injI31pL1pqTaSVzLltcV7xwEBlIbyHKWOzdFAPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d6e10f8747so6871125ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743709468; x=1744314268;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16pq9avE19JYNZbKuDka1XQLssxYzgOUqbHA13DSuk8=;
        b=b+4whYFqwrQiErXLOKP8bAdWkhXS1PisSwO+icERN2V5YBXD/Z5wz0DcAnQHZ4q3K0
         hjNbff4X8k/6fDfB6WOa6vGAPnI+/GriGxozFKl6uIcgQ1u1z7ltP70JdTiYgyYPDjem
         zDPAsCBh6ssSfRtKLVIQPEvp1UpeUswDY6Mxyykc2O7/CmXsjr1XxhG3hOElDrcxsmA1
         08nUs7IzwjAInIgbvG6pC4Iw0RR95i7LstSbLzOb7TRDSh56lDXGHM8TLCyj7qreuqA0
         kPxyAaIWdg2OZelJh2PPG5ZkYY0YcPvi1f8egfCVqsFI1BBIL3p28ZRbettv7QL9Rt78
         C0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe74dro6TBPC9PrRp0anY3IsN1jjf/lQx6FGDsjjVYcQ2NdwCfWej2etKWVYKViiaPq8aEnS+t4akZ6Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMrA7vWrher2eYDUlfGQR3J7Dgdak1bZ/0/2N9YJxlmpRq5LXA
	juqVYN+iWoNxAksUgzcXn6in2/ILr0E+rnsz8fuxLNHup1Q9GtI4f5AD6dYyhcUGnsjTh2eO37Y
	dWT2MREdAEu5Ptirt1MV4JNW6DfFNDy3PXXVq0H2w5kZMml1PWe637RQ=
X-Google-Smtp-Source: AGHT+IF1RSPdj2P+nDv/VuQMWMo800eh2cURzB2rzGkplkST6j4M/AvHDXMd22mr4Z2aPGeZCWVweGeutsmb6GdpbkAb6fEV+uqD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4401:20b0:3d3:dcb8:1bf1 with SMTP id
 e9e14a558f8ab-3d6e52c5290mr599885ab.3.1743709468146; Thu, 03 Apr 2025
 12:44:28 -0700 (PDT)
Date: Thu, 03 Apr 2025 12:44:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eee51c.050a0220.9040b.0240.GAE@google.com>
Subject: [syzbot] [isofs?] KASAN: slab-out-of-bounds Read in isofs_fh_to_parent
From: syzbot <syzbot+4d7cd7dd0ce1aa8d5c65@syzkaller.appspotmail.com>
To: jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a2392f333575 drm/panthor: Clean up FW version information ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=16de47b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8cceedf2e27e877d
dashboard link: https://syzkaller.appspot.com/bug?extid=4d7cd7dd0ce1aa8d5c65
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15a1ec3f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17f623e4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7df8ceab3279/disk-a2392f33.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/42c5af403371/vmlinux-a2392f33.xz
kernel image: https://storage.googleapis.com/syzbot-assets/73599b849e20/Image-a2392f33.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/191f689db82e/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4d7cd7dd0ce1aa8d5c65@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 164
==================================================================
BUG: KASAN: slab-out-of-bounds in isofs_fh_to_parent+0x1b8/0x210 fs/isofs/export.c:183
Read of size 4 at addr ffff0000cc030d94 by task syz-executor215/6466

CPU: 1 UID: 0 PID: 6466 Comm: syz-executor215 Not tainted 6.14.0-rc7-syzkaller-ga2392f333575 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0x198/0x550 mm/kasan/report.c:521
 kasan_report+0xd8/0x138 mm/kasan/report.c:634
 __asan_report_load4_noabort+0x20/0x2c mm/kasan/report_generic.c:380
 isofs_fh_to_parent+0x1b8/0x210 fs/isofs/export.c:183
 exportfs_decode_fh_raw+0x2dc/0x608 fs/exportfs/expfs.c:523
 do_handle_to_path+0xa0/0x198 fs/fhandle.c:257
 handle_to_path fs/fhandle.c:385 [inline]
 do_handle_open+0x8cc/0xb8c fs/fhandle.c:403
 __do_sys_open_by_handle_at fs/fhandle.c:443 [inline]
 __se_sys_open_by_handle_at fs/fhandle.c:434 [inline]
 __arm64_sys_open_by_handle_at+0x80/0x94 fs/fhandle.c:434
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

Allocated by task 6466:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:68
 kasan_save_alloc_info+0x40/0x50 mm/kasan/generic.c:562
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xac/0xc4 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4294 [inline]
 __kmalloc_noprof+0x32c/0x54c mm/slub.c:4306
 kmalloc_noprof include/linux/slab.h:905 [inline]
 handle_to_path fs/fhandle.c:357 [inline]
 do_handle_open+0x5a4/0xb8c fs/fhandle.c:403
 __do_sys_open_by_handle_at fs/fhandle.c:443 [inline]
 __se_sys_open_by_handle_at fs/fhandle.c:434 [inline]
 __arm64_sys_open_by_handle_at+0x80/0x94 fs/fhandle.c:434
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

The buggy address belongs to the object at ffff0000cc030d80
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 0 bytes to the right of
 allocated 20-byte region [ffff0000cc030d80, ffff0000cc030d94)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10c030
anon flags: 0x5ffc00000000000(node=0|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 05ffc00000000000 ffff0000c0001780 0000000000000000 dead000000000001
raw: 0000000000000000 0000000080400040 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff0000cc030c80: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
 ffff0000cc030d00: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>ffff0000cc030d80: 00 00 04 fc fc fc fc fc fa fb fb fb fc fc fc fc
                         ^
 ffff0000cc030e00: 00 00 00 fc fc fc fc fc fa fb fb fb fc fc fc fc
 ffff0000cc030e80: 00 00 00 fc fc fc fc fc 00 00 00 fc fc fc fc fc
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
