Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AE33B1A4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738827622; cv=none; b=OTLqpO6HDElSN22dyOswPGj6bEhsZj1T8t0thRvwK9P53WfcLkLM1wnr1y8d7Cse2Rskdj702l+MuYTw6VYI5kg1R+lOtmv3/LIpjG3MKCThW5qPXEParxYNuH1kH5kC83OqI5VnLRIBR2pWOQi3HJVBmabz60GCRN+xfAl30hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738827622; c=relaxed/simple;
	bh=xxsAEzSdDYTLOOBJ1Z7nj5DDWBClshhX/xz8IhkitzY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=owhKER+JJY/AqYZ8SCcrKk+bShwkl/7E2woa+yHOeMd/Rlr3q71+iIaw/k+gERq8AaxSTqW2cksGN/goFXU8Or3ayxVQfEFjL3Ld15w4jaTUjli3D1NhBXns5mjEbw/GjMvuJjGhD3mfJl3CThmDabSyBrjHCu964E+2MCEKpAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d04d797364so4071585ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738827620; x=1739432420;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2ExmAbSI83+xsbiSaRQbUe2LXDyG5IoM7SY2DhB/t0=;
        b=BkKwaJRxryuHxt0PX0U1xLeotDyqeCFJfJVXrCYT9i10qehcuR1l1xo3pw5IPrEs1q
         T5gfQ913KF/H5MUA9EbWpIHC4YlRIcGekRMUmN2IkutBMRBjNJHVapK/O1Fr7j/l+8Ve
         OcG5/kfkEnk6z/DMUoAhimTKbPZMdz4GF1JswHy3G9P4+XL1R1xUi5CW4L4pF+KGofMk
         YxWmAPsLd3vNHSICptOtw8kC36XR6McombhZbYw0ItDpgk7oPWnRAqgaIi49YQJM4qPT
         V/yGFH4erk/31mC8KOATGnR1ucxokWFiZkgiw4RHBg7fJbR7ataVUWxYcD4AFp3t9Hnc
         4oQw==
X-Forwarded-Encrypted: i=1; AJvYcCVh3ZXDf2WtZWpmBKSe4mMtcolxkasCu/6+Xvu/V+PCPljtvnda3i1Zbw9dustTACO3P5rv2x6hDD2MS0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKh9wlZjflEc9vOzo65rZ1Oo8kG+t+0fETQ3SQvA7K8Aj0gAXy
	xqQCfx/624yZZLzHltKWZgWBvF9AI7fc23AUSoPf9g9BeDvopaHwL5Iba4zwgFsEBy8rZSF4/fi
	xwubj6Drsk3dEJjxzx6yqI6OI45SqdLynwzttS0PSbolU7xegWTwhZ8M=
X-Google-Smtp-Source: AGHT+IFUTOzlzXY43VReAiihfub6YyvCIfTeVMje9bsy88O8F7RsSj21UsLGyvuXlE6KCT76gri2c9ZDGMdnTvtLi4wALSY0GzIO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18cc:b0:3d0:27f5:1b6c with SMTP id
 e9e14a558f8ab-3d04f917e79mr49795225ab.14.1738827619954; Wed, 05 Feb 2025
 23:40:19 -0800 (PST)
Date: Wed, 05 Feb 2025 23:40:19 -0800
In-Reply-To: <677a6e7a.050a0220.380ff0.0011.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a46763.050a0220.19061f.05f8.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: out-of-bounds Read in __wait_on_bit
From: syzbot <syzbot+339240205a3fd334f686@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    92514ef226f5 Merge tag 'for-6.14-rc1-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1029adf8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1909f2f0d8e641ce
dashboard link: https://syzkaller.appspot.com/bug?extid=339240205a3fd334f686
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1429adf8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=169381b0580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-92514ef2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c4d8b91f8769/vmlinux-92514ef2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c24ec4365966/bzImage-92514ef2.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/2ad88ddc4451/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+339240205a3fd334f686@syzkaller.appspotmail.com

overlayfs: upper fs does not support RENAME_WHITEOUT.
==================================================================
BUG: KASAN: out-of-bounds in __wait_on_bit+0xdf/0x2f0 kernel/sched/wait_bit.c:50
Read of size 8 at addr ffffc9000d86d940 by task syz-executor369/5428

CPU: 0 UID: 0 PID: 5428 Comm: syz-executor369 Not tainted 6.14.0-rc1-syzkaller-00034-g92514ef226f5 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:489
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 __wait_on_bit+0xdf/0x2f0 kernel/sched/wait_bit.c:50
 out_of_line_wait_on_bit+0x1d5/0x260 kernel/sched/wait_bit.c:64
 wait_on_bit_io include/linux/wait_bit.h:105 [inline]
 __wait_on_buffer fs/buffer.c:123 [inline]
 wait_on_buffer include/linux/buffer_head.h:414 [inline]
 __sync_dirty_buffer+0x2f7/0x390 fs/buffer.c:2858
 ntfs_write_bh+0x5f7/0x7c0 fs/ntfs3/fsntfs.c:1485
 mi_write+0x9b/0x1e0 fs/ntfs3/record.c:402
 indx_update_dup+0x69a/0x860 fs/ntfs3/index.c:2697
 ni_update_parent+0xa18/0xdd0 fs/ntfs3/frecord.c:3230
 ni_write_inode+0xe61/0x1100 fs/ntfs3/frecord.c:3321
 write_inode fs/fs-writeback.c:1525 [inline]
 __writeback_single_inode+0x708/0x10d0 fs/fs-writeback.c:1745
 writeback_single_inode+0x1f3/0x660 fs/fs-writeback.c:1801
 sync_inode_metadata+0xc4/0x120 fs/fs-writeback.c:2871
 __generic_file_fsync+0x134/0x1a0 fs/libfs.c:1536
 generic_file_fsync+0x70/0xf0 fs/libfs.c:1566
 ovl_sync_file+0x3a/0x50 fs/overlayfs/copy_up.c:254
 ovl_copy_up_metadata+0xac1/0xef0 fs/overlayfs/copy_up.c:724
 ovl_copy_up_workdir fs/overlayfs/copy_up.c:816 [inline]
 ovl_do_copy_up fs/overlayfs/copy_up.c:1001 [inline]
 ovl_copy_up_one fs/overlayfs/copy_up.c:1202 [inline]
 ovl_copy_up_flags+0x244a/0x47c0 fs/overlayfs/copy_up.c:1257
 ovl_open+0x139/0x310 fs/overlayfs/file.c:211
 do_dentry_open+0xdec/0x1960 fs/open.c:955
 vfs_open+0x3b/0x370 fs/open.c:1085
 dentry_open+0x61/0xa0 fs/open.c:1108
 ima_calc_file_hash+0x16b/0x1b30 security/integrity/ima/ima_crypto.c:553
 ima_collect_measurement+0x520/0xb10 security/integrity/ima/ima_api.c:293
 process_measurement+0x1351/0x1fb0 security/integrity/ima/ima_main.c:372
 ima_file_check+0xd9/0x120 security/integrity/ima/ima_main.c:600
 security_file_post_open+0xb9/0x280 security/security.c:3130
 do_open fs/namei.c:3832 [inline]
 path_openat+0x2cca/0x3590 fs/namei.c:3989
 do_filp_open+0x27f/0x4e0 fs/namei.c:4016
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1427
 do_sys_open fs/open.c:1442 [inline]
 __do_sys_openat fs/open.c:1458 [inline]
 __se_sys_openat fs/open.c:1453 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1453
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0002351fb9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 01 1a 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffb15b1078 EFLAGS: 00000206 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f0002351fb9
RDX: 0000000000000083 RSI: 0000200000000000 RDI: 00000000ffffff9c
RBP: 0031656c69662f2e R08: 00007fffb15b10b0 R09: 00007fffb15b10b0
R10: 0000000000000000 R11: 0000000000000206 R12: 00007fffb15b109c
R13: 0000000000000004 R14: 431bde82d7b634db R15: 00007fffb15b10d0
 </TASK>

The buggy address belongs to stack of task syz-executor369/5428
 and is located at offset 32 in frame:
 out_of_line_wait_on_bit+0x0/0x260

This frame has 1 object:
 [32, 96) 'wq_entry'

The buggy address belongs to the virtual mapping at
 [ffffc9000d868000, ffffc9000d871000) created by:
 copy_process+0x5d1/0x3d50 kernel/fork.c:2233

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888000000000 pfn:0x49fa7
flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
raw: 04fff00000000000 0000000000000000 dead000000000122 0000000000000000
raw: ffff888000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(GFP_KERNEL|__GFP_HIGHMEM|__GFP_NOWARN|__GFP_ZERO), pid 5311, tgid 5311 (syz-executor369), ts 75259377764, free_ts 75170649321
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0x365c/0x37a0 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x292/0x710 mm/page_alloc.c:4739
 alloc_pages_mpol+0x311/0x660 mm/mempolicy.c:2270
 alloc_frozen_pages_noprof mm/mempolicy.c:2341 [inline]
 alloc_pages_noprof+0x121/0x190 mm/mempolicy.c:2361
 vm_area_alloc_pages mm/vmalloc.c:3591 [inline]
 __vmalloc_area_node mm/vmalloc.c:3669 [inline]
 __vmalloc_node_range_noprof+0x9c6/0x1380 mm/vmalloc.c:3846
 alloc_thread_stack_node kernel/fork.c:314 [inline]
 dup_task_struct+0x444/0x8c0 kernel/fork.c:1127
 copy_process+0x5d1/0x3d50 kernel/fork.c:2233
 kernel_clone+0x226/0x8e0 kernel/fork.c:2815
 __do_sys_clone kernel/fork.c:2958 [inline]
 __se_sys_clone kernel/fork.c:2942 [inline]
 __x64_sys_clone+0x258/0x2a0 kernel/fork.c:2942
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5313 tgid 5313 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_frozen_pages+0xe0d/0x10e0 mm/page_alloc.c:2660
 pagetable_free include/linux/mm.h:2917 [inline]
 pagetable_dtor_free include/linux/mm.h:3015 [inline]
 __tlb_remove_table+0x33c/0x420 include/asm-generic/tlb.h:216
 __tlb_remove_table_free mm/mmu_gather.c:227 [inline]
 tlb_remove_table_rcu+0x76/0xf0 mm/mmu_gather.c:282
 rcu_do_batch kernel/rcu/tree.c:2546 [inline]
 rcu_core+0xaaa/0x17a0 kernel/rcu/tree.c:2802
 handle_softirqs+0x2d4/0x9b0 kernel/softirq.c:561
 do_softirq+0x11b/0x1e0 kernel/softirq.c:462
 __local_bh_enable_ip+0x1bb/0x200 kernel/softirq.c:389
 spin_unlock_bh include/linux/spinlock.h:396 [inline]
 wg_packet_send_staged_packets+0x313/0x18c0 drivers/net/wireguard/send.c:352
 wg_open+0x2a3/0x420 drivers/net/wireguard/device.c:55
 __dev_open+0x2d3/0x4a0 net/core/dev.c:1604
 __dev_change_flags+0x1e2/0x6f0 net/core/dev.c:9172
 dev_change_flags+0x8b/0x1a0 net/core/dev.c:9244
 do_setlink+0xc90/0x4210 net/core/rtnetlink.c:3118
 rtnl_changelink net/core/rtnetlink.c:3732 [inline]
 __rtnl_newlink net/core/rtnetlink.c:3884 [inline]
 rtnl_newlink+0x1bb6/0x2210 net/core/rtnetlink.c:4021
 rtnetlink_rcv_msg+0x791/0xcf0 net/core/rtnetlink.c:6911
 netlink_rcv_skb+0x1e3/0x430 net/netlink/af_netlink.c:2543

Memory state around the buggy address:
 ffffc9000d86d800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000d86d880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc9000d86d900: 00 00 00 00 f1 f1 f1 f1 00 00 00 00 00 00 00 00
                                              ^
 ffffc9000d86d980: f3 f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000d86da00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
