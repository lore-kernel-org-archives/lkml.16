Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2090021B9E4
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260219; cv=none; b=MIEsn0kQwTg0TG7P6UrRTbIdlkglQPX+NmcjdOTA85X7F/0VYiu3KAk9TVP0smBmtZAwRD3PfUYTyNC7hhfM5IV9T52hphLmyrb0ykiHfRFEq4yl2ZSPmKZHyZPys7nrYIfgmbs2RbBF+vvwuDdbWZaILZYqwaam4q0LfIVB3vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260219; c=relaxed/simple;
	bh=A0oaWcsAPkrvwW9eW4o0MM/aGw8xQzdRll93L22fyfM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Mu2+H3nCe5ah9zOsf5F4kTz30a38GnNLUH6eW018sSkEfAN+PSxD0y47oeZeLmr4mAAs62A8f1kjI5Qkve/vXO/w3mcPEi0wqgFyhyyZaf9bOgfakD1A25NwU/sXZPL47ZurgaWxeLBmkXJbwb6jFwPm75jzO0mw/CG3kWXvLTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d8eda6c48cso14756965ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747260216; x=1747865016;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cx2y+3mjc9IdN8AJuQFPKHomXwILiBV/vr0LJxelw1c=;
        b=vgttk1EampR0/zqpz5mpJVdiOESZ7M2gNhd4Vilt43V+xWaWk09mcDFjxpCciarbxN
         PR/fZUsTNKYzW4TUyvEEG8r7puIzSrcipdetRtjoj0eWFLSaYqVEbf+CK4OoEAglIeBl
         VWjPv3ayHEaFcHstjdFY702ljVX1c0G/mqpX8T1VYRZvPsaXrFev0i5L5qM+ZpY/edV0
         viTfsdgAW9dvOJ98PMrsZm/3QWEfNpKbs6D4Ywu+M9QzHTW2NXOMexHL3qs8HtQLyQZ3
         A3ixu6swoCbF2+IRd8oFW7RLRvl4vh/+1sx+VwhKpcOf48VEUxIE+2Tw5Zg1/VkOeYwY
         J1vw==
X-Forwarded-Encrypted: i=1; AJvYcCVTPb2rX5UH+LTqiw+4m8GlRqkw4qY1FPHrzHwq8IQMt4XRBzMs3j836OwRIgqCy917qBSd8EBKgte8EYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjD8D6Gq2R1sCuM7Dt8HWBgjC2kaU57j9Fl2kt1QzuTc5arCk6
	Y/YXIdUZ77/jByAY2XkXvyBkmOphx0aW0ArJuqhcQOrQkXPUAfasTqfkyoddDZC0RDK9FgKSEeW
	vkpE/C7uHgVlxOIkjx+PKb392LE1sLZMJy2YextEYuSMnm5uFPvIvtMMxSOo=
X-Google-Smtp-Source: AGHT+IE/k0ShvZemNRAgLHFWCLLI6L0La+2uMmITvV7fAuOR4/ASXjnSVFmCtBek+gyzfWk7NWV04J9D6Yr0sOOdL7e2u9WnKKrr
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a6e:b0:3d4:346e:8d49 with SMTP id
 e9e14a558f8ab-3db778fd61amr17003345ab.9.1747260216082; Wed, 14 May 2025
 15:03:36 -0700 (PDT)
Date: Wed, 14 May 2025 15:03:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68251338.a00a0220.104b28.0015.GAE@google.com>
Subject: [syzbot] [mm?] INFO: rcu detected stall in vms_gather_munmap_vmas
From: syzbot <syzbot+701fc0fcde2b68c4bf59@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    82f2b0b97b36 Linux 6.15-rc6
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=129f4cd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=714342dbe6af3a03
dashboard link: https://syzkaller.appspot.com/bug?extid=701fc0fcde2b68c4bf59
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7a2b57ba9ad2/disk-82f2b0b9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2dabda38719c/vmlinux-82f2b0b9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5e734acfa53b/bzImage-82f2b0b9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+701fc0fcde2b68c4bf59@syzkaller.appspotmail.com

bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P5179/1:b..l P7230/1:b..l
rcu: 	(detected by 0, t=10503 jiffies, g=21217, q=525 ncpus=2)
task:sed             state:R  running task     stack:24280 pid:7230  tgid:7230  ppid:7226   task_flags:0x400000 flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
 preempt_schedule_irq+0xb5/0x150 kernel/sched/core.c:7090
 irqentry_exit+0x6f/0x90 kernel/entry/common.c:354
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_acquire+0x175/0x360 kernel/locking/lockdep.c:5870
Code: 00 00 00 00 9c 8f 44 24 30 f7 44 24 30 00 02 00 00 0f 85 cd 00 00 00 f7 44 24 08 00 02 00 00 74 01 fb 65 48 8b 05 6b 32 d4 10 <48> 3b 44 24 58 0f 85 f2 00 00 00 48 83 c4 60 5b 41 5c 41 5d 41 5e
RSP: 0018:ffffc90003656f70 EFLAGS: 00000206
RAX: 983870c225f6e200 RBX: 0000000000000000 RCX: 983870c225f6e200
RDX: 0000000000000000 RSI: ffffffff8d9219f6 RDI: ffffffff8bc0ffa0
RBP: ffffffff822a7ffa R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff822a7ffa R12: 0000000000000002
R13: ffffffff8df3d860 R14: 0000000000000000 R15: 0000000000000246
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:841 [inline]
 __page_table_check_zero+0xd7/0x510 mm/page_table_check.c:138
 page_table_check_free include/linux/page_table_check.h:41 [inline]
 free_pages_prepare mm/page_alloc.c:1263 [inline]
 __free_frozen_pages+0xb19/0xcd0 mm/page_alloc.c:2725
 discard_slab mm/slub.c:2716 [inline]
 __put_partials+0x161/0x1c0 mm/slub.c:3185
 put_cpu_partial+0x17c/0x250 mm/slub.c:3260
 __slab_free+0x2f7/0x400 mm/slub.c:4512
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9a/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4147 [inline]
 slab_alloc_node mm/slub.c:4196 [inline]
 kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4203
 mt_alloc_one lib/maple_tree.c:176 [inline]
 mas_alloc_nodes+0x2e9/0x8e0 lib/maple_tree.c:1249
 mas_node_count_gfp lib/maple_tree.c:1331 [inline]
 mas_preallocate+0x542/0x8b0 lib/maple_tree.c:5501
 vma_iter_prealloc mm/vma.h:409 [inline]
 __split_vma+0x315/0x9b0 mm/vma.c:490
 vms_gather_munmap_vmas+0x4ab/0x12b0 mm/vma.c:1336
 __mmap_prepare mm/vma.c:2303 [inline]
 __mmap_region mm/vma.c:2506 [inline]
 mmap_region+0x5f5/0x1e50 mm/vma.c:2597
 do_mmap+0xc68/0x1100 mm/mmap.c:561
 vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
 ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f60fe10d242
RSP: 002b:00007fff93f23708 EFLAGS: 00000206 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 00007f60fdde1000 RCX: 00007f60fe10d242
RDX: 0000000000000003 RSI: 0000000000002000 RDI: 00007f60fdde1000
RBP: 0000000000000812 R08: 0000000000000003 R09: 0000000000006000
R10: 0000000000000812 R11: 0000000000000206 R12: 00007fff93f237c8
R13: 00007f60fdde40c0 R14: 00007fff93f23b40 R15: 00000ffff27e46e4
 </TASK>
task:klogd           state:R  running task     stack:24280 pid:5179  tgid:5179  ppid:1      task_flags:0x400100 flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
 preempt_schedule_irq+0xb5/0x150 kernel/sched/core.c:7090
 irqentry_exit+0x6f/0x90 kernel/entry/common.c:354
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_acquire+0x175/0x360 kernel/locking/lockdep.c:5870
Code: 00 00 00 00 9c 8f 44 24 30 f7 44 24 30 00 02 00 00 0f 85 cd 00 00 00 f7 44 24 08 00 02 00 00 74 01 fb 65 48 8b 05 6b 32 d4 10 <48> 3b 44 24 58 0f 85 f2 00 00 00 48 83 c4 60 5b 41 5c 41 5d 41 5e
RSP: 0018:ffffc90002ed7198 EFLAGS: 00000206
RAX: 59b6fbc4dbd42200 RBX: 0000000000000000 RCX: 59b6fbc4dbd42200
RDX: 0000000000000000 RSI: ffffffff8d9219f6 RDI: ffffffff8bc0ffa0
RBP: ffffffff8171a9f5 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff8171a9f5 R12: 0000000000000002
R13: ffffffff8df3d860 R14: 0000000000000000 R15: 0000000000000246
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:841 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1155 [inline]
 unwind_next_frame+0xc2/0x2390 arch/x86/kernel/unwind_orc.c:479
 arch_stack_walk+0x11c/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 save_stack+0xf7/0x1f0 mm/page_owner.c:156
 __reset_page_owner+0x71/0x1f0 mm/page_owner.c:308
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0xb05/0xcd0 mm/page_alloc.c:2725
 discard_slab mm/slub.c:2716 [inline]
 __put_partials+0x161/0x1c0 mm/slub.c:3185
 put_cpu_partial+0x17c/0x250 mm/slub.c:3260
 __slab_free+0x2f7/0x400 mm/slub.c:4512
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9a/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4147 [inline]
 slab_alloc_node mm/slub.c:4196 [inline]
 kmem_cache_alloc_node_noprof+0x1bb/0x3c0 mm/slub.c:4248
 __alloc_skb+0x112/0x2d0 net/core/skbuff.c:658
 alloc_skb include/linux/skbuff.h:1340 [inline]
 alloc_skb_with_frags+0xca/0x890 net/core/skbuff.c:6639
 sock_alloc_send_pskb+0x857/0x990 net/core/sock.c:2954
 unix_dgram_sendmsg+0x5c2/0x17c0 net/unix/af_unix.c:2007
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x219/0x270 net/socket.c:727
 __sys_sendto+0x3bd/0x520 net/socket.c:2180
 __do_sys_sendto net/socket.c:2187 [inline]
 __se_sys_sendto net/socket.c:2183 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2183
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f56ee8c6407
RSP: 002b:00007ffd8756dbe0 EFLAGS: 00000202 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 00007f56ee776c80 RCX: 00007f56ee8c6407
RDX: 00000000000000a0 RSI: 00007ffd8756dd20 RDI: 0000000000000003
RBP: 00007ffd8756e150 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000004000 R11: 0000000000000202 R12: 00007ffd8756e168
R13: 00007ffd8756dd20 R14: 0000000000000085 R15: 00007ffd8756dd20
 </TASK>
net_ratelimit: 18139 callbacks suppressed
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:1b, vlan:0)


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
