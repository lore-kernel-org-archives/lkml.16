Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB0222ACEE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948914; cv=none; b=LvIL7OPZIlgiu6vdjiHwlD5SKqnED44qNjCTDqIHq0YWLvGm0XQ2B948Rm7i1Eaitb5PTM0CEbn0bxO+zmf8NcfIf/T/sld8uY93rLz+opykSrb9sLIrT1DHzj/nij3Ab3PE246tlPZMmmUXTuUUo69VpMcgkjGJd+7opSaxSzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948914; c=relaxed/simple;
	bh=BuFaDS/2E1LaweNALWRRZY6YMYS/S+fhmXh29lkfGOc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=eqICriNobv6SOafpVN8FiaIu8XP0L2sTGDZWEuCGq6pV03O664InSVlgH3VqJ/lPKuFUvx13iw+Dx1NcVlUpGYjOuVSnz+oUBgi1lW0yL3tm2E5fEIPUgskRf/tVMynWFzaiWFs3ieXEX2snuXkCljT7gjEwvUMq74bpen4GiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3dca1268a57so67805665ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748948911; x=1749553711;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WHhhqjGoR7KVFRwBUfR0py6jn0oPiMGcd4Tjp7uL2Dg=;
        b=Dm9z6dqwd/IZ1biPfXFyWWI729GwnArT9vIRV/6Nyfp+iPUj17noHxUpxVGY2wL6ur
         HVc6z4PKT9t8WZnmu48AiQRUPof6q6q2jBAN5DMiGyvd4JKjtQZ0P55DD6E9hQVeBbri
         YTJMD0a9tlAvYUZMmAdQDs3r05Vf/EP1s4aoIliGRqvjVn+sL/LLQTwGAORZAfMXFkqS
         IK9DUXP1qtChG7SMbyre8NFVufTSoqapcV0tuaWziOWsBAKTQyfhDYgnwNREb6hv0Btc
         58g+sJ4AHxbSOXKoGzEQflCiS2L+Ls3DM3G4vB8zahznTX1KhyFlZ0d1zG00cjIcErt6
         5fBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+VR9HUsWry548hzx0zvoQEWcOALqCMjalz5VD12iwWosphfG12ZZ0QnEOKo8YIlOLSXOTtqPpPs0F14o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbZPRFKoqzFEjSfQJUpBBQc2YxYTI/OCvYrMO94X5qI67AXa8
	1Fp8+6E5NgzpC6mb0acDKE9fhLWRhaYMeQ6TtBPU8oLlZggQqgz9EM8Bzj0gQ/TlI4i/ChMH/4k
	jBEShsI72uA8ybTtvRIhpEibGVR+wLqf0Ua4ggg2sksTrYhfK8lcpsUeSm/g=
X-Google-Smtp-Source: AGHT+IHPtMaMl/0U8Xkkm8LvslN+8kdgJbte74qf8KKpXwz/El7yFMzoU3daDxyh/a/U7SimFRZKWFHXnWBBRwRyIKwoteqJz81Q
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154e:b0:3dd:75fe:9d68 with SMTP id
 e9e14a558f8ab-3dd9cc02bf8mr156394115ab.17.1748948911314; Tue, 03 Jun 2025
 04:08:31 -0700 (PDT)
Date: Tue, 03 Jun 2025 04:08:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683ed7af.a00a0220.d8eae.0067.GAE@google.com>
Subject: [syzbot] [mm?] KASAN: slab-use-after-free Read in __list_lru_walk_one (2)
From: syzbot <syzbot+c26e7bdde337ffbeeb69@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fefff2755f2a Add linux-next specific files for 20250527
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15d803f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e449b391d09dc5d5
dashboard link: https://syzkaller.appspot.com/bug?extid=c26e7bdde337ffbeeb69
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a4fd794012d6/disk-fefff275.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ff56ed852fb3/vmlinux-fefff275.xz
kernel image: https://storage.googleapis.com/syzbot-assets/07ab2d3e3930/bzImage-fefff275.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c26e7bdde337ffbeeb69@syzkaller.appspotmail.com

UDF-fs: error (device loop0): udf_read_tagged: tag version 0x0000 != 0x0002 || 0x0003, block 0
UDF-fs: error (device loop0): udf_read_tagged: read failed, block=512, location=512
UDF-fs: warning (device loop0): udf_fill_super: No partition found (1)
==================================================================
BUG: KASAN: slab-use-after-free in __list_lru_walk_one+0xfb/0x420 mm/list_lru.c:289
Read of size 8 at addr ffff88805506f078 by task syz.0.108/6383

CPU: 1 UID: 0 PID: 6383 Comm: syz.0.108 Not tainted 6.15.0-next-20250527-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 __list_lru_walk_one+0xfb/0x420 mm/list_lru.c:289
 list_lru_walk_one+0x3c/0x50 mm/list_lru.c:337
 list_lru_shrink_walk include/linux/list_lru.h:262 [inline]
 gfs2_qd_shrink_scan+0x155/0x330 fs/gfs2/quota.c:182
 do_shrink_slab+0x6ef/0x1110 mm/shrinker.c:437
 shrink_slab+0xd74/0x10d0 mm/shrinker.c:664
 drop_slab_node mm/vmscan.c:442 [inline]
 drop_slab+0x14e/0x290 mm/vmscan.c:460
 drop_caches_sysctl_handler+0xc7/0x170 fs/drop_caches.c:68
 proc_sys_call_handler+0x50c/0x7c0 fs/proc/proc_sysctl.c:601
 do_iter_readv_writev+0x515/0x6e0 fs/read_write.c:-1
 vfs_writev+0x31a/0x960 fs/read_write.c:1057
 do_writev+0x14d/0x2d0 fs/read_write.c:1103
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fab5258e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fab5343a038 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
RAX: ffffffffffffffda RBX: 00007fab527b5fa0 RCX: 00007fab5258e969
RDX: 0000000000000001 RSI: 00002000000000c0 RDI: 000000000000000a
RBP: 00007fab52610ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fab527b5fa0 R15: 00007ffd0f2fc9b8
 </TASK>

Allocated by task 6347:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4148 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4204
 qd_alloc+0x50/0x250 fs/gfs2/quota.c:234
 gfs2_quota_init+0x777/0x1230 fs/gfs2/quota.c:1448
 gfs2_make_fs_rw+0x181/0x2b0 fs/gfs2/super.c:149
 gfs2_fill_super+0x19e5/0x2010 fs/gfs2/ops_fstype.c:1275
 get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1679
 gfs2_get_tree+0x51/0x1e0 fs/gfs2/ops_fstype.c:1333
 vfs_get_tree+0x8f/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3856
 do_mount fs/namespace.c:4193 [inline]
 __do_sys_mount fs/namespace.c:4404 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4381
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 23:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kmem_cache_free+0x18f/0x400 mm/slub.c:4745
 gfs2_qd_dealloc+0x70/0xe0 fs/gfs2/quota.c:111
 rcu_do_batch kernel/rcu/tree.c:2576 [inline]
 rcu_core+0xca5/0x1710 kernel/rcu/tree.c:2832
 handle_softirqs+0x283/0x870 kernel/softirq.c:579
 run_ksoftirqd+0x9b/0x100 kernel/softirq.c:968
 smpboot_thread_fn+0x542/0xa60 kernel/smpboot.c:164
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:548
 __call_rcu_common kernel/rcu/tree.c:3090 [inline]
 call_rcu+0x142/0x990 kernel/rcu/tree.c:3210
 gfs2_quota_sync+0x3c4/0x460 fs/gfs2/quota.c:1361
 gfs2_sync_fs+0x4c/0xb0 fs/gfs2/super.c:660
 sync_filesystem+0xeb/0x230 fs/sync.c:56
 generic_shutdown_super+0x6f/0x2c0 fs/super.c:622
 kill_block_super+0x44/0x90 fs/super.c:1753
 deactivate_locked_super+0xbc/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88805506f000
 which belongs to the cache gfs2_quotad of size 272
The buggy address is located 120 bytes inside of
 freed 272-byte region [ffff88805506f000, ffff88805506f110)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x5506f
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff8881405a5000 dead000000000122 0000000000000000
raw: 0000000000000000 00000000800c000c 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Reclaimable, gfp_mask 0x52c50(GFP_NOFS|__GFP_RECLAIMABLE|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 6144, tgid 6143 (syz.4.51), ts 119363112918, free_ts 99782786731
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4959
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2451 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2619
 new_slab mm/slub.c:2673 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3859
 __slab_alloc mm/slub.c:3949 [inline]
 __slab_alloc_node mm/slub.c:4024 [inline]
 slab_alloc_node mm/slub.c:4185 [inline]
 kmem_cache_alloc_noprof+0x283/0x3c0 mm/slub.c:4204
 qd_alloc+0x50/0x250 fs/gfs2/quota.c:234
 gfs2_quota_init+0x777/0x1230 fs/gfs2/quota.c:1448
 gfs2_make_fs_rw+0x181/0x2b0 fs/gfs2/super.c:149
 gfs2_fill_super+0x19e5/0x2010 fs/gfs2/ops_fstype.c:1275
 get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1679
 gfs2_get_tree+0x51/0x1e0 fs/gfs2/ops_fstype.c:1333
 vfs_get_tree+0x8f/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3856
 do_mount fs/namespace.c:4193 [inline]
 __do_sys_mount fs/namespace.c:4404 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4381
page last free pid 5928 tgid 5927 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
 __folio_put+0x21b/0x2c0 mm/swap.c:112
 update_and_free_hugetlb_folio+0x169/0x280 mm/hugetlb.c:1708
 free_huge_folio+0xd72/0x1100 mm/hugetlb.c:-1
 folios_put_refs+0x410/0x640 mm/swap.c:973
 folio_batch_release include/linux/pagevec.h:101 [inline]
 remove_inode_hugepages+0xee3/0x1100 fs/hugetlbfs/inode.c:602
 hugetlbfs_evict_inode+0xbf/0x230 fs/hugetlbfs/inode.c:617
 evict+0x504/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 dput+0x19f/0x2b0 fs/dcache.c:911
 __fput+0x68e/0xa70 fs/file_table.c:475
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x6ad/0x22e0 kernel/exit.c:955
 do_group_exit+0x21c/0x2d0 kernel/exit.c:1104
 get_signal+0x1286/0x1340 kernel/signal.c:3034
 arch_do_signal_or_restart+0x9a/0x750 arch/x86/kernel/signal.c:337

Memory state around the buggy address:
 ffff88805506ef00: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
 ffff88805506ef80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88805506f000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff88805506f080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88805506f100: fb fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
