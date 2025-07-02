Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D112BCF51
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467536; cv=none; b=dS7cmoR9J9/THZ3Ngt6dIjVMz8i1MwuKH+A/QLgc7scoVBoBOnSMBygRx8SuXfxSUxGdHzkLpYaii/i5BHsdlgtvbMNRwNSQlvf4rVFthswvxvUxAqbV43imPiStR5zfBiSrc+nyOQPC5b/c/y9YSLroTJChkxCRMEoPM191rhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467536; c=relaxed/simple;
	bh=KnRsXxuS3PYx608n/NKuWFSSfCm14iJU6Ylj55wt3Vo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bRY90HhTLP1Kub7zEXN4pSmfahc9Dc6L8uf0/fAEVnVeIiXgSWpbWit8e5EX0mmZNiRehaRDYBDOUlwkaWXwgoaA8hCgrRwahFQzeE9q4503VRsJ875bjITqbIfxD8VHi+627QYCUv0A8EDUGgK9zDRL733c34BZebQXN8rcRok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddc5137992so49902895ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467534; x=1752072334;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b+oqTp2Og2HX7h9r3Aolir1SZcv+7UJxoxCfvKCxR/E=;
        b=RbsTzsAzahRb9tiTjNz4XdwU8XT47leEZNcMN0WiWbMC5dqzJ3uucoikZC4IG5vY8n
         sLqN+nwpwSYJXYqFW0m7heBdNPhSpL2ZtDrUmflOdSUQ/+P0/i3c4X0SapuhJUBVl1ZV
         8jBqghzpFEvsNR7m+zmZW21lxwxBYZdKwGUReh71vTTzeJaXE5/L2x1H5Hias2y2Avsj
         GKyOlsMIzEDW8Z79y5hxExa3IbSIYMAmPp85OvO4tTTsRRamZpZ4WSd8dlwoXtW9lTdC
         HDrB3xxsVIET5KpK/W6gHM3SYTnW/C1Z7Adq9/FO6dVJlvzviylVkmx2YSpwHbXa5hNr
         /M7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgwR3XLPGzBItcVl9Vo7WHJeIkidrfYd6SwkbAVbAejLheEEHLIYqEqzVm+uttomoPEG/EJ1z/vv5+j4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzTFzXKC/MQS8T7tzx/1viVoLklk584u5hsle9+v6/uI2fhoY
	v7/mG6+qrNOUgWtCfXyhU0iTsdZx+BSF5ZdzkphDHzQtgIaRRXCMqO4TLOofg/Qr2BNeTY0b3gW
	W9GBh3yY1DGNZG04imsae6QbL2hk1PkciJ0SpDSqErht+JWyb01DEsfwwvaM=
X-Google-Smtp-Source: AGHT+IHjo7npVajFLK0WbnSNk9OjJnXgU9PyligF9JndywkNnLdbAESqQAfdNu8AIxGYTLz2dFiruIVNje7kxyXCi8thiNCg+D06
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18c5:b0:3df:3222:278e with SMTP id
 e9e14a558f8ab-3e054934f08mr41009735ab.1.1751467533742; Wed, 02 Jul 2025
 07:45:33 -0700 (PDT)
Date: Wed, 02 Jul 2025 07:45:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6865460d.a00a0220.270cb1.0001.GAE@google.com>
Subject: [syzbot] [kernel?] general protection fault in __cpa_flush_tlb
From: syzbot <syzbot+169412e85b1803dfda81@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1343433ed389 Add linux-next specific files for 20250630
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10aa93d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c1ce97baf6bd6397
dashboard link: https://syzkaller.appspot.com/bug?extid=169412e85b1803dfda81
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10ed648c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c3387c64e9ec/disk-1343433e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/abf15e85d8dd/vmlinux-1343433e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/081c344403bc/bzImage-1343433e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+169412e85b1803dfda81@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: out-of-bounds in __cpa_flush_tlb+0x46/0x270 arch/x86/mm/pat/set_memory.c:407
Read of size 8 at addr ffffc90003397920 by task syz-executor/5960

CPU: 0 UID: 0 PID: 5960 Comm: syz-executor Not tainted 6.16.0-rc4-next-20250630-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <IRQ>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 __cpa_flush_tlb+0x46/0x270 arch/x86/mm/pat/set_memory.c:407
 csd_do_func kernel/smp.c:134 [inline]
 __flush_smp_call_function_queue+0x370/0xaa0 kernel/smp.c:540
 __sysvec_call_function_single+0xa8/0x3d0 arch/x86/kernel/smp.c:271
 instr_sysvec_call_function_single arch/x86/kernel/smp.c:266 [inline]
 sysvec_call_function_single+0x9e/0xc0 arch/x86/kernel/smp.c:266
 </IRQ>
 <TASK>
 asm_sysvec_call_function_single+0x1a/0x20 arch/x86/include/asm/idtentry.h:709
RIP: 0010:finish_task_switch+0x26b/0x950 kernel/sched/core.c:5181
Code: 0f 84 3c 01 00 00 48 85 db 0f 85 63 01 00 00 e9 27 05 00 00 4c 8b 75 d0 4c 89 e7 e8 2f db e0 09 e8 3a 0e 36 00 fb 4c 8b 65 c0 <49> 8d bc 24 18 16 00 00 48 89 f8 48 c1 e8 03 42 0f b6 04 28 84 c0
RSP: 0018:ffffc9000453f5f8 EFLAGS: 00000282
RAX: 312751dada94af00 RBX: 0000000000000000 RCX: 312751dada94af00
RDX: 0000000000000000 RSI: ffffffff8d992cd0 RDI: ffffffff8be31d00
RBP: ffffc9000453f650 R08: ffffffff8fa17437 R09: 1ffffffff1f42e86
R10: dffffc0000000000 R11: fffffbfff1f42e87 R12: ffff888021ed9e00
R13: dffffc0000000000 R14: ffff888023f2da00 R15: ffff8880b863ab18
 context_switch kernel/sched/core.c:5316 [inline]
 __schedule+0x16fd/0x4d00 kernel/sched/core.c:6696
 preempt_schedule_common+0x83/0xd0 kernel/sched/core.c:6876
 preempt_schedule+0xae/0xc0 kernel/sched/core.c:6900
 preempt_schedule_thunk+0x16/0x30 arch/x86/entry/thunk.S:12
 idr_preload_end+0x126/0x200 include/linux/idr.h:191
 alloc_pid+0x35c/0xab0 kernel/pid.c:241
 copy_process+0x198e/0x3c00 kernel/fork.c:2184
 kernel_clone+0x21e/0x870 kernel/fork.c:2598
 __do_sys_clone kernel/fork.c:2741 [inline]
 __se_sys_clone kernel/fork.c:2725 [inline]
 __x64_sys_clone+0x18b/0x1e0 kernel/fork.c:2725
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd22b785193
Code: 1f 84 00 00 00 00 00 64 48 8b 04 25 10 00 00 00 45 31 c0 31 d2 31 f6 bf 11 00 20 01 4c 8d 90 d0 02 00 00 b8 38 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 89 c2 85 c0 75 2c 64 48 8b 04 25 10 00 00
RSP: 002b:00007fff68c51808 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fd22b785193
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000001200011
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000001
R10: 00005555595c77d0 R11: 0000000000000246 R12: 0000000000000000
R13: 00000000000927c0 R14: 00000000000295d0 R15: 00007fff68c519a0
 </TASK>

The buggy address belongs to the virtual mapping at
 [ffffc90003390000, ffffc90003399000) created by:
 copy_process+0x54b/0x3c00 kernel/fork.c:1998

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x4 pfn:0x76b10
memcg:ffff88807849f502
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 0000000000000000 dead000000000122 0000000000000000
raw: 0000000000000004 0000000000000000 00000001ffffffff ffff88807849f502
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(GFP_KERNEL|__GFP_HIGHMEM|__GFP_ZERO|__GFP_NOWARN), pid 10519, tgid 10519 (syz.1.2188), ts 169318727845, free_ts 167753086937
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1848
 prep_new_page mm/page_alloc.c:1856 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3855
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5145
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_frozen_pages_noprof mm/mempolicy.c:2490 [inline]
 alloc_pages_noprof+0xa9/0x190 mm/mempolicy.c:2510
 vm_area_alloc_pages mm/vmalloc.c:3642 [inline]
 __vmalloc_area_node mm/vmalloc.c:3720 [inline]
 __vmalloc_node_range_noprof+0x97d/0x12f0 mm/vmalloc.c:3893
 __vmalloc_node_noprof+0xc2/0x110 mm/vmalloc.c:3956
 alloc_thread_stack_node kernel/fork.c:310 [inline]
 dup_task_struct+0x3e7/0x860 kernel/fork.c:876
 copy_process+0x54b/0x3c00 kernel/fork.c:1998
 kernel_clone+0x21e/0x870 kernel/fork.c:2598
 __do_sys_clone3 kernel/fork.c:2902 [inline]
 __se_sys_clone3+0x256/0x2d0 kernel/fork.c:2881
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 49 tgid 49 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1392 [inline]
 __free_frozen_pages+0xb80/0xd80 mm/page_alloc.c:2892
 pagetable_free include/linux/mm.h:2896 [inline]
 pagetable_dtor_free include/linux/mm.h:2994 [inline]
 __tlb_remove_table+0x2d2/0x3b0 include/asm-generic/tlb.h:220
 __tlb_remove_table_free mm/mmu_gather.c:227 [inline]
 tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:290
 rcu_do_batch kernel/rcu/tree.c:2582 [inline]
 rcu_core+0xca8/0x1710 kernel/rcu/tree.c:2838
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 do_softirq+0xec/0x180 kernel/softirq.c:480
 __local_bh_enable_ip+0x17d/0x1c0 kernel/softirq.c:407
 spin_unlock_bh include/linux/spinlock.h:396 [inline]
 batadv_nc_purge_paths+0x318/0x3b0 net/batman-adv/network-coding.c:471
 batadv_nc_worker+0x369/0x610 net/batman-adv/network-coding.c:722
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffffc90003397800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90003397880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90003397900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
                                  ^
 ffffc90003397980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90003397a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================
----------------
Code disassembly (best guess):
   0:	0f 84 3c 01 00 00    	je     0x142
   6:	48 85 db             	test   %rbx,%rbx
   9:	0f 85 63 01 00 00    	jne    0x172
   f:	e9 27 05 00 00       	jmp    0x53b
  14:	4c 8b 75 d0          	mov    -0x30(%rbp),%r14
  18:	4c 89 e7             	mov    %r12,%rdi
  1b:	e8 2f db e0 09       	call   0x9e0db4f
  20:	e8 3a 0e 36 00       	call   0x360e5f
  25:	fb                   	sti
  26:	4c 8b 65 c0          	mov    -0x40(%rbp),%r12
* 2a:	49 8d bc 24 18 16 00 	lea    0x1618(%r12),%rdi <-- trapping instruction
  31:	00
  32:	48 89 f8             	mov    %rdi,%rax
  35:	48 c1 e8 03          	shr    $0x3,%rax
  39:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
  3e:	84 c0                	test   %al,%al


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
