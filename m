Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B20155CBD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464234; cv=none; b=VQPKCZ6eFGjaOGYq+sPx3KBTrHVxd2fUZcMoAWn2G1TrniL4lB74QsWq5fxqsKjwINbD0iH/pgYkEQ2/kwJN7gKs3mlQWUf4Doa/T3gs07/2zkvPAsx2Alc7gCT1gtkw6ZW9ywPGylZQBLUf7lYHq2xUqJN2suUU4Gm2SjG4sys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464234; c=relaxed/simple;
	bh=VFdnDDVOO9lIk5Hfe4qUMw0BDCW/zc7LLYg/JCb62ZU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TVagcI5fNkgb3Ac+M66zCKVN5k/pMSq0Pf69ktAr3Hk8ifS8LrgbxUfMHgRaH9+aZLmLvknyOw0XGSx3RP4GWxHeEckQgptJRpIdTc2D8GYlftpKnignJSTAbyfivFWZ5IEmFGOppdPMubHw1Ym0xb9cBmh70jKqi2/s5v3TFAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3df2d0b7c7eso47666655ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464231; x=1752069031;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OC60JwatBaxV0uMbzLxfV8LNaQwX4JXrU2XaoWoQyuM=;
        b=sJJRiv7X9uKZI+VAr6tjWyRf5txue/QnWx4JPvoOsxKCYPQtOB95NJ9cPGodS1dBt8
         +uF8b+ZUqtuaDcQgD8q4TpNsT1bLuTd94tH9DEadltonyVIZLNNdCwRENyOE2tUPX4sn
         3BaT9bNplfOqvS+UA9DROdC5EY6osYlZCEcAT+RowFnzlwfWmLe9oYg0D2/CWJo3E0o8
         Ldu7AK24zj/CkFHSbI9ypnGk4X1kI6JwtKGzyvNKwRhMcBOj/1pN9COBy9IIkHyrNGSS
         MWCxQAKEeJuZDcMjmOeQrHTNrS4Hhc4wbU2N4FRSQPFq2CBFuborLmCycbPhqb7c7MtH
         M8gA==
X-Forwarded-Encrypted: i=1; AJvYcCUr3ALgFdNO9WjEnL2CuBt0cClevtZaiwBWBYDmVWF6VlmMxcULKE8Lm2YpcJsu49WsBvBlf6JeF8QINXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7cxNekJfSuwTFr9c3l0tjkWC8v9GKjFWJfZMu5KooT26TgZL
	dwN/SfEQGlieRFkBFcxk8yKae+YMCFyRz8A/eynoFU+MgfipeEKFD36JvGmYrV97o61IXkGDIV/
	1dpVByS9DoYLEFjta3lIhR+kaRKd5qh7xlQCF/DXXpduQvT3NjIFvNNEvg8Q=
X-Google-Smtp-Source: AGHT+IEQLSNEmbno1ghWKfh0hXjsYlAGR1mcd9DvIsH5Qp3dNlDqgOysCmEsrH47dXzv0ui7SDFRkjUj/tCGVhKLyISDiMWduyqF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4506:10b0:3e0:5942:2942 with SMTP id
 e9e14a558f8ab-3e059422bfcmr11673905ab.6.1751464231597; Wed, 02 Jul 2025
 06:50:31 -0700 (PDT)
Date: Wed, 02 Jul 2025 06:50:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68653927.a70a0220.3b7e22.245d.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-use-after-free Write in flush_tlb_func
From: syzbot <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	neeraj.upadhyay@kernel.org, paulmck@kernel.org, peterz@infradead.org, 
	riel@surriel.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
	x86@kernel.org, yury.norov@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1343433ed389 Add linux-next specific files for 20250630
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15b3e3d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c1ce97baf6bd6397
dashboard link: https://syzkaller.appspot.com/bug?extid=084b6e5bc1016723a9c4
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15716770580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c3387c64e9ec/disk-1343433e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/abf15e85d8dd/vmlinux-1343433e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/081c344403bc/bzImage-1343433e.xz

The issue was bisected to:

commit a12a498a9738db65152203467820bb15b6102bd2
Author: Yury Norov [NVIDIA] <yury.norov@gmail.com>
Date:   Mon Jun 23 00:00:08 2025 +0000

    smp: Don't wait for remote work done if not needed in smp_call_function_many_cond()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15ee348c580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17ee348c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=13ee348c580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com
Fixes: a12a498a9738 ("smp: Don't wait for remote work done if not needed in smp_call_function_many_cond()")

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_write include/linux/instrumented.h:82 [inline]
BUG: KASAN: slab-use-after-free in clear_bit include/asm-generic/bitops/instrumented-atomic.h:41 [inline]
BUG: KASAN: slab-use-after-free in cpumask_clear_cpu include/linux/cpumask.h:628 [inline]
BUG: KASAN: slab-use-after-free in flush_tlb_func+0x23d/0x6c0 arch/x86/mm/tlb.c:1132
Write of size 8 at addr ffff88805f1dca80 by task kworker/1:1/43

CPU: 1 UID: 0 PID: 43 Comm: kworker/1:1 Not tainted 6.16.0-rc4-next-20250630-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <IRQ>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:189
 instrument_atomic_write include/linux/instrumented.h:82 [inline]
 clear_bit include/asm-generic/bitops/instrumented-atomic.h:41 [inline]
 cpumask_clear_cpu include/linux/cpumask.h:628 [inline]
 flush_tlb_func+0x23d/0x6c0 arch/x86/mm/tlb.c:1132
 csd_do_func kernel/smp.c:134 [inline]
 __flush_smp_call_function_queue+0x370/0xaa0 kernel/smp.c:540
 __sysvec_call_function_single+0xa8/0x3d0 arch/x86/kernel/smp.c:271
 instr_sysvec_call_function_single arch/x86/kernel/smp.c:266 [inline]
 sysvec_call_function_single+0x9e/0xc0 arch/x86/kernel/smp.c:266
 </IRQ>
 <TASK>
 asm_sysvec_call_function_single+0x1a/0x20 arch/x86/include/asm/idtentry.h:709
RIP: 0010:console_flush_all+0x7f7/0xc40 kernel/printk/printk.c:3227
Code: 48 21 c3 0f 85 e9 01 00 00 e8 65 2d 1f 00 48 8b 5c 24 20 4d 85 f6 75 07 e8 56 2d 1f 00 eb 06 e8 4f 2d 1f 00 fb 48 8b 44 24 28 <42> 80 3c 20 00 74 08 48 89 df e8 3a 41 83 00 48 8b 1b 48 8b 44 24
RSP: 0018:ffffc90000b36fc0 EFLAGS: 00000293
RAX: 1ffffffff1d36a63 RBX: ffffffff8e9b5318 RCX: ffff88801faa9e00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90000b37110 R08: ffffffff8fa17437 R09: 1ffffffff1f42e86
R10: dffffc0000000000 R11: fffffbfff1f42e87 R12: dffffc0000000000
R13: 0000000000000001 R14: 0000000000000200 R15: ffffffff8e9b52c0
 __console_flush_and_unlock kernel/printk/printk.c:3285 [inline]
 console_unlock+0xc4/0x270 kernel/printk/printk.c:3325
 vprintk_emit+0x5b7/0x7a0 kernel/printk/printk.c:2450
 dev_vprintk_emit+0x337/0x3f0 drivers/base/core.c:4916
 dev_printk_emit+0xe0/0x130 drivers/base/core.c:4927
 _dev_info+0x10a/0x160 drivers/base/core.c:4985
 announce_device+0x117/0x2c0 drivers/usb/core/hub.c:2417
 usb_new_device+0x4ef/0x16f0 drivers/usb/core/hub.c:2680
 hub_port_connect drivers/usb/core/hub.c:5571 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5711 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5962:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4180 [inline]
 slab_alloc_node mm/slub.c:4229 [inline]
 kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4236
 dup_mm kernel/fork.c:1466 [inline]
 copy_mm+0xdb/0x4b0 kernel/fork.c:1528
 copy_process+0x1706/0x3c00 kernel/fork.c:2168
 kernel_clone+0x21e/0x870 kernel/fork.c:2598
 __do_sys_clone kernel/fork.c:2741 [inline]
 __se_sys_clone kernel/fork.c:2725 [inline]
 __x64_sys_clone+0x18b/0x1e0 kernel/fork.c:2725
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 8084:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2417 [inline]
 slab_free mm/slub.c:4680 [inline]
 kmem_cache_free+0x18f/0x400 mm/slub.c:4782
 exit_mm+0x1da/0x2c0 kernel/exit.c:581
 do_exit+0x648/0x2300 kernel/exit.c:947
 do_group_exit+0x21c/0x2d0 kernel/exit.c:1100
 __do_sys_exit_group kernel/exit.c:1111 [inline]
 __se_sys_exit_group kernel/exit.c:1109 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1109
 x64_sys_call+0x21ba/0x21c0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88805f1dc080
 which belongs to the cache mm_struct of size 2584
The buggy address is located 2560 bytes inside of
 freed 2584-byte region [ffff88805f1dc080, ffff88805f1dca98)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88805f1dcb40 pfn:0x5f1d8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff88805f612801
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a44bb40 0000000000000000 dead000000000001
raw: ffff88805f1dcb40 00000000000b0009 00000000f5000000 ffff88805f612801
head: 00fff00000000040 ffff88801a44bb40 0000000000000000 dead000000000001
head: ffff88805f1dcb40 00000000000b0009 00000000f5000000 ffff88805f612801
head: 00fff00000000003 ffffea00017c7601 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5719, tgid 5719 (dhcpcd-run-hook), ts 61767719991, free_ts 61767008311
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1848
 prep_new_page mm/page_alloc.c:1856 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3855
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5145
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2487 [inline]
 allocate_slab+0x8a/0x370 mm/slub.c:2655
 new_slab mm/slub.c:2709 [inline]
 ___slab_alloc+0xbeb/0x1410 mm/slub.c:3891
 __slab_alloc mm/slub.c:3981 [inline]
 __slab_alloc_node mm/slub.c:4056 [inline]
 slab_alloc_node mm/slub.c:4217 [inline]
 kmem_cache_alloc_noprof+0x283/0x3c0 mm/slub.c:4236
 dup_mm kernel/fork.c:1466 [inline]
 copy_mm+0xdb/0x4b0 kernel/fork.c:1528
 copy_process+0x1706/0x3c00 kernel/fork.c:2168
 kernel_clone+0x21e/0x870 kernel/fork.c:2598
 __do_sys_clone kernel/fork.c:2741 [inline]
 __se_sys_clone kernel/fork.c:2725 [inline]
 __x64_sys_clone+0x18b/0x1e0 kernel/fork.c:2725
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5719 tgid 5719 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1392 [inline]
 __free_frozen_pages+0xb80/0xd80 mm/page_alloc.c:2892
 __folio_put+0x21b/0x2c0 mm/swap.c:112
 put_netmem net/core/skbuff.c:7372 [inline]
 skb_page_unref include/linux/skbuff_ref.h:43 [inline]
 __skb_frag_unref include/linux/skbuff_ref.h:56 [inline]
 skb_release_data+0x49a/0x7c0 net/core/skbuff.c:1081
 skb_release_all net/core/skbuff.c:1152 [inline]
 napi_consume_skb+0x158/0x1e0 net/core/skbuff.c:1480
 skb_defer_free_flush net/core/dev.c:6632 [inline]
 net_rx_action+0x51b/0xe30 net/core/dev.c:7625
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 common_interrupt+0xbb/0xe0 arch/x86/kernel/irq.c:285
 asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:693

Memory state around the buggy address:
 ffff88805f1dc980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88805f1dca00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88805f1dca80: fb fb fb fc fc fc fc fc fc fc fc fc fc fc fc fc
                   ^
 ffff88805f1dcb00: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
 ffff88805f1dcb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
----------------
Code disassembly (best guess):
   0:	48 21 c3             	and    %rax,%rbx
   3:	0f 85 e9 01 00 00    	jne    0x1f2
   9:	e8 65 2d 1f 00       	call   0x1f2d73
   e:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  13:	4d 85 f6             	test   %r14,%r14
  16:	75 07                	jne    0x1f
  18:	e8 56 2d 1f 00       	call   0x1f2d73
  1d:	eb 06                	jmp    0x25
  1f:	e8 4f 2d 1f 00       	call   0x1f2d73
  24:	fb                   	sti
  25:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
* 2a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 3a 41 83 00       	call   0x834173
  39:	48 8b 1b             	mov    (%rbx),%rbx
  3c:	48                   	rex.W
  3d:	8b                   	.byte 0x8b
  3e:	44                   	rex.R
  3f:	24                   	.byte 0x24


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
