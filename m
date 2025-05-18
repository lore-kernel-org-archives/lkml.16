Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE7E8615A
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 05:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747544886; cv=none; b=BZO8wSBLanVA8BcmgmaA5wbRrvQ1grSo6QSb5CC2XzmzK2x8QQntgh9sp17R/llUbtfuwVz82G+CLW3d7zw5wkWkjl8gMrGN6hxPt1iYDZTr54ayIX3Ge8d8dIgYR4h/Q8LlOfwakAXpyFXZEGY16Md/E5e+zXENwvEaepOECnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747544886; c=relaxed/simple;
	bh=kwars0xay0yPideCWN8YGg6vU5K6aC7zej8cLj+uAmk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ehhpQqCfb3llSbF4H4+X5nmT3NqooIwpKMXtgG7NIWIXfC/W0lXSkB8Hhu85Pt6W3IOPPpZTSdEwUX45dyNO6025ctUVAKfqCIJbhrWNAsOevg7ude7HjQkHxVkjYiXwS+cusVybFRbybkS3fth0y8qR6y8GDuIkctQ5w54dW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85e7551197bso344124939f.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 22:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747544883; x=1748149683;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEHhdXcAyIOgpCm9+odQaCTA3QYTQCdrddPTzg+jeXw=;
        b=A9oYog8moGeG5Mh54XQjlBqBk3VP4h6f9+DZNZ5CA4QRFl8grur16f+WQ5Huqpi56+
         xQkSc/l1mA8QrLJk/6yHPNCIaWBc67GbKcDB2mLUi+ogQGtbkbe2Ln2ZzagBQk7iCX6L
         JwZlUtWP/6E+2798uT1kXwK5LqJCjFz2p8JXh+Bt4qDsicZEGk+q5lOC/9X2KhPqYFtf
         C1zHYjl2sdbr5wZB/vfNbvup7PNWqy3YEguUETeDSxmnKKvVsfWwPGG3V0L9IZg7I2M2
         8y42TlwXN6mAvdzMVQyUvd5YM/S+t388jw8wT9hh83j7JfZHJTCUExeXjdnnbjgoghZ3
         TRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWbzIKalaE7oCrLNJgpuIwZnozQIRTvMmYmRd+z7ciX2qZWN1MizNKdKgy31mpRn8cME/hcPiMcYLgcS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGSXvP26w4UHVclOUJOlW8PVaV2M7TYq/UjUTwMxyv7WQrpGKU
	Ur7nYbGHcqjKPkWeYNQHzv4vJkXQAe91TEIlelJ5muupDwbvhtbAvYTjaOU9l3ZMHg+MbegyVRy
	iA9bnlpWlTlnhsHVjJIbH9RbAZlohalClfE7ClZ9RWQJK8TtzAT7VlJRhxX8=
X-Google-Smtp-Source: AGHT+IHgqz8UweQtCzXLF7pxwlKhbVqdXGLT/1FutmByh0I4xDEmQ5Iea4dWXK417LuopcvKffYtc61Res23dNNkKynCjkhFJShD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3899:b0:867:8d3:9864 with SMTP id
 ca18e2360f4ac-86a237cb6bfmr1235020339f.4.1747544883692; Sat, 17 May 2025
 22:08:03 -0700 (PDT)
Date: Sat, 17 May 2025 22:08:03 -0700
In-Reply-To: <20250518044606.2113-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68296b33.a00a0220.268166.007e.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 mgmt_remove_adv_monitor_complete (3)
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in mgmt_remove_adv_monitor_complete

==================================================================
BUG: KASAN: slab-use-after-free in mgmt_remove_adv_monitor_complete+0xe5/0x540 net/bluetooth/mgmt.c:5405
Read of size 8 at addr ffff888043826318 by task kworker/u5:2/5365

CPU: 0 UID: 0 PID: 5365 Comm: kworker/u5:2 Not tainted 6.15.0-rc6-syzkaller-00346-g5723cc3450bc-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: hci0 hci_cmd_sync_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xb4/0x290 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 mgmt_remove_adv_monitor_complete+0xe5/0x540 net/bluetooth/mgmt.c:5405
 hci_cmd_sync_work+0x261/0x3a0 net/bluetooth/hci_sync.c:334
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 9194:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4358
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 mgmt_pending_new+0x65/0x240 net/bluetooth/mgmt_util.c:252
 mgmt_pending_add+0x34/0x120 net/bluetooth/mgmt_util.c:279
 remove_adv_monitor+0x103/0x1b0 net/bluetooth/mgmt.c:5453
 hci_mgmt_cmd+0x9c6/0xef0 net/bluetooth/hci_sock.c:1714
 hci_sock_sendmsg+0x6ca/0xee0 net/bluetooth/hci_sock.c:1834
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x219/0x270 net/socket.c:727
 sock_write_iter+0x258/0x330 net/socket.c:1131
 new_sync_write fs/read_write.c:591 [inline]
 vfs_write+0x548/0xa90 fs/read_write.c:684
 ksys_write+0x145/0x250 fs/read_write.c:736
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 9198:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x193/0x440 mm/slub.c:4841
 mgmt_pending_foreach+0xc9/0x120 net/bluetooth/mgmt_util.c:242
 mgmt_index_removed+0x10d/0x2f0 net/bluetooth/mgmt.c:9365
 hci_sock_bind+0xbf7/0x1010 net/bluetooth/hci_sock.c:1308
 __sys_bind_socket net/socket.c:1810 [inline]
 __sys_bind+0x2c3/0x3e0 net/socket.c:1841
 __do_sys_bind net/socket.c:1846 [inline]
 __se_sys_bind net/socket.c:1844 [inline]
 __x64_sys_bind+0x7a/0x90 net/socket.c:1844
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888043826300
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 24 bytes inside of
 freed 96-byte region [ffff888043826300, ffff888043826360)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x43826
flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000000 ffff88801a041280 ffffea0000447dc0 dead000000000002
raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 4015, tgid 4015 (kworker/u4:10), ts 162423232319, free_ts 162406246108
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1d8/0x230 mm/page_alloc.c:1714
 prep_new_page mm/page_alloc.c:1722 [inline]
 get_page_from_freelist+0x21ce/0x22b0 mm/page_alloc.c:3684
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4966
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __kmalloc_cache_noprof+0x296/0x3d0 mm/slub.c:4353
 kmalloc_noprof include/linux/slab.h:905 [inline]
 dst_cow_metrics_generic+0x56/0x1c0 net/core/dst.c:193
 dst_metrics_write_ptr include/net/dst.h:133 [inline]
 dst_metric_set include/net/dst.h:194 [inline]
 icmp6_dst_alloc+0x261/0x420 net/ipv6/route.c:3328
 ndisc_send_skb+0x41f/0x1400 net/ipv6/ndisc.c:493
 addrconf_dad_completed+0x7ae/0xd60 net/ipv6/addrconf.c:4364
 addrconf_dad_work+0xc36/0x14b0 net/ipv6/addrconf.c:-1
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
page last free pid 5850 tgid 5850 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1258 [inline]
 __free_frozen_pages+0xb0e/0xcd0 mm/page_alloc.c:2721
 rcu_do_batch kernel/rcu/tree.c:2568 [inline]
 rcu_core+0xca8/0x1710 kernel/rcu/tree.c:2824
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1049
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

Memory state around the buggy address:
 ffff888043826200: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
 ffff888043826280: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
>ffff888043826300: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                            ^
 ffff888043826380: 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc
 ffff888043826400: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
==================================================================


Tested on:

commit:         5723cc34 Merge tag 'dmaengine-fix-6.15' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17df62d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c3f0e807ec5d1268
dashboard link: https://syzkaller.appspot.com/bug?extid=feb0dc579bbe30a13190
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=114f62d4580000

