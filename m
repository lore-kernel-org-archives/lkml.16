Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64768243378
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739104590; cv=none; b=Yl54nwr4P/+Bz4oq435J2+iTwSALNUp7A/ws+LqEmFrOm6f507nyJSwpcGdAc79QbOBOMqSh8Oi5LDqH9vNnDLV42Plcc13QypIVID/u984WveM6s5YvvDcLeYSPdPwH3wCJvrKX4A5DY+w58u6SymKOAgWHJMgqs5NvCxTzvmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739104590; c=relaxed/simple;
	bh=PupKZt3HVb+pcD9CyBtvkySBqrAJmBYZhrl1bO5uSiw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lu/+nAvjJ0eXmCGGUUCiep437UW4hIxM8Xcu0aeeaF5vHbyNstHHnXcoJIXcpuJSARLVzBYSFe/naPUGQEIdzeGvZ0zoZRiTiR4nsYbkVZD6N0L/HCI64GjYzyuCnRjVxgcvMZwQEja9CFHKMRTPd5t6LwgduBnmy7y86DXcwaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d14a3f812fso41211675ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 04:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104587; x=1739709387;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXxkI7g0mb8T4HlSBWhlz1lU2h0ObGEtPMOGRs7rjRU=;
        b=hEbDeomZ1w/5Z64/wwMZBZjelEH7/BhunZn89k0ZBNbNz9i6WEXS2A1+f6j0RKyQuA
         cohXY2fFk9D0YiP4EbhL9vPIYMbrOgqCZT7HnGMDYNkVwUhLkLrop5fjkZR7L/qvmjxk
         O5wFzWW4PgPi6GcRwJC4nz2zGxJ7BEG2sSz3IxeE72Tlj8FCRMbLeB9P4N0GaEqikMEu
         D+6+aK2H2MYSwIwQtEwBPcdUL4/J+iriSVD1PBjozaDL1c722ymqjjdU70PuZLcQFEpQ
         hQgCrQZETRwax9+K+u3nmIq2GB7F0pVj3X+MZYli+qUvQJw04UXN/mwd8XX49I+iNVcW
         8dXg==
X-Forwarded-Encrypted: i=1; AJvYcCXy12uoR/q/xaxKl0WO4A2ye1hW/YIbEJAg3pIsu7ui1n6VGWP6c1aUWFChymUdQK+L/iFPuTPV3+PJEx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzwJ0GiHLjvk5tj5GXqZQp8+XgqV0vKegUJwqYEMCv9W/kx9BJ
	vSZ0Vdv737p+g+DP/V8k6F8Po6pD5dR/BIw+EOHLoyDVNX4eSTwLCOP9r7dEEmk1cpSUN1ZkMTy
	EPVxT2JTRDJ2ND6dVQVQEiMM/96QG7zKlsTVT8ESjATANLdBgz8Mig6A=
X-Google-Smtp-Source: AGHT+IFPYkmqAAwWcc5zY5LWWZsiaOy4ENAQOLl+/W+KRf7IBEU0poXsZf2uzFnNYLaPJ+R9dLoKZgn/pVgWz2fswGlfH7g5EjoO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda5:0:b0:3cf:b26f:ff7c with SMTP id
 e9e14a558f8ab-3d13dcfccbemr80396525ab.5.1739104587490; Sun, 09 Feb 2025
 04:36:27 -0800 (PST)
Date: Sun, 09 Feb 2025 04:36:27 -0800
In-Reply-To: <670793eb.050a0220.8109b.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a8a14b.050a0220.3d72c.003c.GAE@google.com>
Subject: Re: [syzbot] [mm?] KMSAN: uninit-value in swap_writepage
From: syzbot <syzbot+febb2473441bfb8fb380@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, chengming.zhou@linux.dev, hannes@cmpxchg.org, 
	hughd@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, syzkaller-bugs@googlegroups.com, usamaarif642@gmail.com, 
	yosryahmed@google.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    493f3f38da21 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=102582a4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f20bce78db15972a
dashboard link: https://syzkaller.appspot.com/bug?extid=febb2473441bfb8fb380
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142f5b18580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7b55c1bb607a/disk-493f3f38.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/dc5eaf46c59e/vmlinux-493f3f38.xz
kernel image: https://storage.googleapis.com/syzbot-assets/314f12332ac4/bzImage-493f3f38.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/07ee34a1a626/mount_2.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=141291b0580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+febb2473441bfb8fb380@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in is_folio_zero_filled mm/page_io.c:188 [inline]
BUG: KMSAN: uninit-value in swap_writepage+0x547/0x1950 mm/page_io.c:266
 is_folio_zero_filled mm/page_io.c:188 [inline]
 swap_writepage+0x547/0x1950 mm/page_io.c:266
 shmem_writepage+0x2360/0x25a0 mm/shmem.c:1647
 pageout mm/vmscan.c:696 [inline]
 shrink_folio_list+0x5dd2/0x8220 mm/vmscan.c:1402
 evict_folios+0x94ed/0xb9c0 mm/vmscan.c:4660
 try_to_shrink_lruvec+0xc58/0x1080 mm/vmscan.c:4821
 lru_gen_shrink_lruvec mm/vmscan.c:4970 [inline]
 shrink_lruvec+0x49a/0x47c0 mm/vmscan.c:5715
 shrink_node_memcgs mm/vmscan.c:5951 [inline]
 shrink_node+0x105e/0x51c0 mm/vmscan.c:5992
 shrink_zones mm/vmscan.c:6237 [inline]
 do_try_to_free_pages+0x820/0x2550 mm/vmscan.c:6299
 try_to_free_mem_cgroup_pages+0x3fa/0xa60 mm/vmscan.c:6631
 try_charge_memcg+0x71a/0x1780 mm/memcontrol.c:2255
 obj_cgroup_charge_pages+0x2cb/0x640 mm/memcontrol.c:2636
 __memcg_kmem_charge_page+0x151/0x520 mm/memcontrol.c:2663
 __alloc_frozen_pages_noprof+0x93d/0xe00 mm/page_alloc.c:4756
 alloc_pages_mpol+0x4cd/0x890 mm/mempolicy.c:2270
 alloc_frozen_pages_noprof mm/mempolicy.c:2341 [inline]
 alloc_pages_noprof+0x1b5/0x250 mm/mempolicy.c:2361
 io_mem_alloc_compound io_uring/memmap.c:29 [inline]
 io_region_allocate_pages+0x168/0x8b0 io_uring/memmap.c:167
 io_create_region+0x6eb/0x810 io_uring/memmap.c:223
 io_allocate_scq_urings+0x3a2/0xa50 io_uring/io_uring.c:3479
 io_uring_create+0xabc/0x1440 io_uring/io_uring.c:3701
 io_uring_setup io_uring/io_uring.c:3791 [inline]
 __do_sys_io_uring_setup io_uring/io_uring.c:3818 [inline]
 __se_sys_io_uring_setup+0x476/0x4d0 io_uring/io_uring.c:3812
 __x64_sys_io_uring_setup+0x6c/0xa0 io_uring/io_uring.c:3812
 x64_sys_call+0x2e82/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:426
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 memcpy_from_iter lib/iov_iter.c:73 [inline]
 iterate_bvec include/linux/iov_iter.h:123 [inline]
 iterate_and_advance2 include/linux/iov_iter.h:304 [inline]
 iterate_and_advance include/linux/iov_iter.h:328 [inline]
 __copy_from_iter lib/iov_iter.c:249 [inline]
 copy_page_from_iter_atomic+0x1299/0x30c0 lib/iov_iter.c:483
 copy_folio_from_iter_atomic include/linux/uio.h:210 [inline]
 generic_perform_write+0x8d1/0x1080 mm/filemap.c:4201
 shmem_file_write_iter+0x2ba/0x2f0 mm/shmem.c:3454
 do_iter_readv_writev+0x93a/0xbc0
 vfs_iter_write+0x44d/0xd60 fs/read_write.c:974
 lo_write_bvec drivers/block/loop.c:245 [inline]
 lo_write_simple drivers/block/loop.c:266 [inline]
 do_req_filebacked drivers/block/loop.c:520 [inline]
 loop_handle_cmd drivers/block/loop.c:1929 [inline]
 loop_process_work+0x15fb/0x3760 drivers/block/loop.c:1964
 loop_workfn+0x48/0x60 drivers/block/loop.c:1988
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xae0/0x1c40 kernel/workqueue.c:3317
 worker_thread+0xea7/0x14f0 kernel/workqueue.c:3398
 kthread+0x6b9/0xef0 kernel/kthread.c:464
 ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Uninit was created at:
 __alloc_frozen_pages_noprof+0x9a7/0xe00 mm/page_alloc.c:4762
 __alloc_pages_noprof mm/page_alloc.c:4773 [inline]
 alloc_pages_bulk_noprof+0x1227/0x1a60 mm/page_alloc.c:4693
 btrfs_alloc_page_array fs/btrfs/extent_io.c:632 [inline]
 alloc_eb_folio_array+0x199/0x750 fs/btrfs/extent_io.c:656
 alloc_extent_buffer+0x76a/0x36f0 fs/btrfs/extent_io.c:3092
 btrfs_find_create_tree_block+0x46/0x60 fs/btrfs/disk-io.c:614
 btrfs_init_new_buffer fs/btrfs/extent-tree.c:5017 [inline]
 btrfs_alloc_tree_block+0x415/0x1990 fs/btrfs/extent-tree.c:5130
 btrfs_alloc_log_tree_node fs/btrfs/disk-io.c:950 [inline]
 btrfs_add_log_tree+0x1b7/0x7a0 fs/btrfs/disk-io.c:998
 start_log_trans fs/btrfs/tree-log.c:227 [inline]
 btrfs_log_inode_parent+0xa87/0x1c30 fs/btrfs/tree-log.c:7097
 btrfs_log_dentry_safe+0x9a/0x100 fs/btrfs/tree-log.c:7202
 btrfs_sync_file+0x1676/0x2180 fs/btrfs/file.c:1649
 vfs_fsync_range+0x1f9/0x260 fs/sync.c:187
 generic_write_sync include/linux/fs.h:2970 [inline]
 btrfs_do_write_iter+0xabe/0xcb0 fs/btrfs/file.c:1386
 btrfs_file_write_iter+0x38/0x50 fs/btrfs/file.c:1396
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write+0xb34/0x1540 fs/read_write.c:679
 ksys_write+0x240/0x4b0 fs/read_write.c:731
 __do_sys_write fs/read_write.c:742 [inline]
 __se_sys_write fs/read_write.c:739 [inline]
 __x64_sys_write+0x93/0xe0 fs/read_write.c:739
 x64_sys_call+0x3161/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 0 UID: 0 PID: 6322 Comm: syz.0.26 Not tainted 6.14.0-rc1-syzkaller-00224-g493f3f38da21 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
=====================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
