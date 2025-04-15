Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292FC1F3BBC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712678; cv=none; b=YW8JI1nqbo6SSA+r85ZGV5i3aNuTFNGVA6D8vPfJ1vczsqa5RzAISgJNdDhbjofLGVlq6R5Xn5roAXmrVi1Bzou1p6pgywYTdTwREySeXnTl/7/8Js/v8yX6XFGw7AshJTqxVU/xbLdY7BX2zaXgw94Jtribyy/wzD+8Eun2BcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712678; c=relaxed/simple;
	bh=aFB47feLb3W1W0v9clBOvfDcd3CCkmv0mWnJBjw3nsw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=g07UcEX/rCKhZvhWDznKhhGjF5XJghCgoZiNjvgMNfQhxdKwehueZFnQOTEbyIRi6J+5J02ietb8NaBAnOWB8inzdCbLKt26SoKlHYemnPxD0/MqyUt7QX5YIQnJ2arh7biIRpvyyAX1jtnjf84NdNAjQ7zaUhzfTuXfRbVBKYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85b3a6c37e2so564701939f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712675; x=1745317475;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nEAJXcSVgYoVJrAUMYgbcLnYfAjCyemfiUEQW36kf8Q=;
        b=Bhegi4wNX4smmPw8+hHCTDymcr0DRsz3CjRp8++H0zxZLOfg70l0z/Eq8+aWmcTUEU
         SlncPhQf4886yprwMyJepsOJgGbcystNEuJEH/JvyQTYWKQy7VQRrS9MG+Ps4nS9uhiO
         P48WihB2r+tQRLtWGfYMUPVRpa04E2TovVf7c+gXBWtRHl8y85ck1yo9EGfDnDBXl7sh
         qLhsIlE6HrMZmO5nml3q9Txp4K0R5Ye0mw9mV+Op/GbQ5peJYyXo26F+d0J8rzSCwEwx
         Ey67Y0Jtu/vns9Q8OeEWt+GT3SFU3EA9QZIkad1AI28zkmUDwjFTXv/nZwNjkcWDUaV7
         H5HA==
X-Forwarded-Encrypted: i=1; AJvYcCXhUsoWDZmXGSy5gzemlt7LWQMKST5RAWzCRCnSSIHolffPZK450eJGcRuTAg+7qilyyNeQaaknvI8oR/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69n/ryjG1Ic/TUqZ5zlErQN69pvQqiKWXfUtc4afP4RIadnyb
	+IQZGh2EPAHm7ZNaM9GLXqowwXtCk8o58H3PyXuCEvwgZT+6wUXZLiBM0mRd3s3PPCWsE8PQKsj
	Zsb5tHh9qmr9bebZXkWnIWs+1Z/U1YZWrySuHTItFgEthUJvMb0NiVug=
X-Google-Smtp-Source: AGHT+IFi39T1fI392OrPqhTIovzyDrWhiuNdo3/me25Zj8SyUuvFMARedLxtEUhcrP7YbDJRlkj6/w0cu9tt5sIfHG6ZxYqSb4wL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c245:0:b0:3d5:be65:34ac with SMTP id
 e9e14a558f8ab-3d7ec1dd513mr144649405ab.2.1744712675132; Tue, 15 Apr 2025
 03:24:35 -0700 (PDT)
Date: Tue, 15 Apr 2025 03:24:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fe33e3.050a0220.3483fc.004e.GAE@google.com>
Subject: [syzbot] [afs?] KASAN: slab-use-after-free Read in idr_get_free
From: syzbot <syzbot+9197b322744974667353@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    29e7bf01ed80 Add linux-next specific files for 20250410
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13090f4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a554d15459e77547
dashboard link: https://syzkaller.appspot.com/bug?extid=9197b322744974667353
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bb76302efd6b/disk-29e7bf01.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7da3c6b9e532/vmlinux-29e7bf01.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4909c61270ed/bzImage-29e7bf01.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9197b322744974667353@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in set_iter_tags lib/radix-tree.c:1123 [inline]
BUG: KASAN: slab-use-after-free in idr_get_free+0x959/0xac0 lib/radix-tree.c:1543
Read of size 8 at addr ffff888148c9cfe8 by task syz.2.19/5993

CPU: 0 UID: 0 PID: 5993 Comm: syz.2.19 Not tainted 6.15.0-rc1-next-20250410-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0x16e/0x5b0 mm/kasan/report.c:521
 kasan_report+0x143/0x180 mm/kasan/report.c:634
 set_iter_tags lib/radix-tree.c:1123 [inline]
 idr_get_free+0x959/0xac0 lib/radix-tree.c:1543
 idr_alloc_u32+0x197/0x330 lib/idr.c:46
 idr_alloc_cyclic+0x108/0x310 lib/idr.c:125
 afs_alloc_cell fs/afs/cell.c:202 [inline]
 afs_lookup_cell+0xfad/0x18b0 fs/afs/cell.c:264
 afs_parse_source fs/afs/super.c:292 [inline]
 afs_parse_param+0x6f4/0x970 fs/afs/super.c:330
 vfs_parse_fs_param+0x1a5/0x420 fs/fs_context.c:146
 vfs_parse_fs_string+0x170/0x230 fs/fs_context.c:188
 do_new_mount+0x26c/0xb70 fs/namespace.c:3873
 do_mount fs/namespace.c:4219 [inline]
 __do_sys_mount fs/namespace.c:4430 [inline]
 __se_sys_mount+0x38c/0x400 fs/namespace.c:4407
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff4a198d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff4a2759038 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ff4a1ba6240 RCX: 00007ff4a198d169
RDX: 00002000000000c0 RSI: 0000200000000080 RDI: 0000200000000040
RBP: 00007ff4a1a0e990 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007ff4a1ba6240 R15: 00007ffda7d56bf8
 </TASK>

Allocated by task 5997:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x66/0x80 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4151 [inline]
 slab_alloc_node mm/slub.c:4200 [inline]
 kmem_cache_alloc_noprof+0x1e1/0x390 mm/slub.c:4207
 radix_tree_node_alloc+0x8b/0x3c0 lib/radix-tree.c:276
 idr_get_free+0x296/0xac0 lib/radix-tree.c:1506
 idr_alloc_u32+0x197/0x330 lib/idr.c:46
 idr_alloc_cyclic+0x108/0x310 lib/idr.c:125
 afs_alloc_cell fs/afs/cell.c:202 [inline]
 afs_lookup_cell+0xfad/0x18b0 fs/afs/cell.c:264
 afs_parse_source fs/afs/super.c:292 [inline]
 afs_parse_param+0x6f4/0x970 fs/afs/super.c:330
 vfs_parse_fs_param+0x1a5/0x420 fs/fs_context.c:146
 vfs_parse_fs_string+0x170/0x230 fs/fs_context.c:188
 do_new_mount+0x26c/0xb70 fs/namespace.c:3873
 do_mount fs/namespace.c:4219 [inline]
 __do_sys_mount fs/namespace.c:4430 [inline]
 __se_sys_mount+0x38c/0x400 fs/namespace.c:4407
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6003:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2389 [inline]
 slab_free mm/slub.c:4646 [inline]
 kmem_cache_free+0x197/0x410 mm/slub.c:4748
 rcu_do_batch kernel/rcu/tree.c:2568 [inline]
 rcu_core+0xaac/0x17a0 kernel/rcu/tree.c:2824
 handle_softirqs+0x2d6/0x9b0 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xfb/0x220 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1049
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

Last potentially related work creation:
 kasan_save_stack+0x3f/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xbf/0xd0 mm/kasan/generic.c:548
 __call_rcu_common kernel/rcu/tree.c:3082 [inline]
 call_rcu+0x172/0xad0 kernel/rcu/tree.c:3202
 radix_tree_node_free lib/radix-tree.c:310 [inline]
 delete_node+0x1b2/0x780 lib/radix-tree.c:573
 radix_tree_delete_item+0x2e6/0x3f0 lib/radix-tree.c:1430
 afs_cell_destroy+0x175/0x2c0 fs/afs/cell.c:522
 rcu_do_batch kernel/rcu/tree.c:2568 [inline]
 rcu_core+0xaac/0x17a0 kernel/rcu/tree.c:2824
 handle_softirqs+0x2d6/0x9b0 kernel/softirq.c:579
 run_ksoftirqd+0xcf/0x130 kernel/softirq.c:968
 smpboot_thread_fn+0x576/0xaa0 kernel/smpboot.c:164
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888148c9cdc0
 which belongs to the cache radix_tree_node of size 576
The buggy address is located 552 bytes inside of
 freed 576-byte region [ffff888148c9cdc0, ffff888148c9d000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x148c9c
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff88814d1de401
ksm flags: 0x57ff00000000040(head|node=1|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 057ff00000000040 ffff88801b04bdc0 ffffea0005231f00 dead000000000003
raw: 0000000000000000 0000000000170017 00000000f5000000 ffff88814d1de401
head: 057ff00000000040 ffff88801b04bdc0 ffffea0005231f00 dead000000000003
head: 0000000000000000 0000000000170017 00000000f5000000 ffff88814d1de401
head: 057ff00000000002 ffffea0005232701 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Reclaimable, gfp_mask 0x52830(GFP_ATOMIC|__GFP_RECLAIMABLE|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 8730373092, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x349b/0x3630 mm/page_alloc.c:3703
 __alloc_frozen_pages_noprof+0x211/0x5b0 mm/page_alloc.c:4985
 alloc_pages_mpol+0x339/0x690 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2459 [inline]
 allocate_slab+0x8f/0x3a0 mm/slub.c:2623
 new_slab mm/slub.c:2676 [inline]
 ___slab_alloc+0xc3b/0x1500 mm/slub.c:3862
 __slab_alloc+0x58/0xa0 mm/slub.c:3952
 __slab_alloc_node mm/slub.c:4027 [inline]
 slab_alloc_node mm/slub.c:4188 [inline]
 kmem_cache_alloc_noprof+0x270/0x390 mm/slub.c:4207
 radix_tree_node_alloc+0x19a/0x3c0 lib/radix-tree.c:253
 idr_get_free+0x296/0xac0 lib/radix-tree.c:1506
 idr_alloc_u32+0x197/0x330 lib/idr.c:46
 idr_alloc_cyclic+0x108/0x310 lib/idr.c:125
 __kernfs_new_node+0x12a/0x890 fs/kernfs/dir.c:643
 kernfs_new_node+0x114/0x220 fs/kernfs/dir.c:713
 kernfs_create_dir_ns+0x43/0x120 fs/kernfs/dir.c:1081
 internal_create_group+0x528/0x1320 fs/sysfs/group.c:170
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888148c9ce80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888148c9cf00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888148c9cf80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff888148c9d000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888148c9d080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
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
