Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F77BE545
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750520664; cv=none; b=e7ty5/0CnRXlEt2fl4EnWJYnpF52bDquwV7GfYV29/H0A8WMTRxLrWA8tMqmMgWaaOvT2ZTJg8xifZV8XJ46ZPjpr2zejl+bkuj1o9UWC7nGMmqlfiYIDtc0d9aZWxG1spYsLBd6cCbM+ndY0kg/9K2B+rK9jK0I18WbvIj8rtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750520664; c=relaxed/simple;
	bh=7f7amSMuVqhnt1E7Yynp2wql3yl9a1bwxxi+tQFLazo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ut/rtwKP0+FTWHsSTEmpeOyjBl0pJ83XlH2RhjqrsWzkNuIVNnhIcL2N1lz4pxGtS4tZEaFtkvPFojGszr1/xW2jUsfRfpamGBGQojRiCp8yp5O0TPqtW4V+aiu8VWX75GmJjJL7VgyzQiNfl2r0KxJBgI6SD5nNuLGqvT/P510=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddcb80387dso22089885ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750520661; x=1751125461;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m974jTPBLyvTsEP3vtFsrxB17Zgl/ZsCY0f0QXJptmo=;
        b=WcbVmljbaqK/Q6LwSZLN6aupTSFoBTLlP1jZWJz8fb6JnNJs/ADctjqNlpGPauT3uB
         S1KfU56ikfY1vYvOy1RltKqbI2dEaLootBsOmm8l6KWWA+sRLuBiEhHujEcwdx76Rk+v
         mD5Z2ZS0JMsfHqVKSrDY1Hfe0dvIa3Q5fSbAyuvMXs58VjwCWSsx1TE8HTnZ+dPwWbnh
         kPKlFtdOYqcYprR3eDyfPjOuYKP8VcWcu2HDk9lOSnx2qj1muAgOX56XHPniFvMdgDwG
         fCZkXs0+UYhKqkEfhg3z5A8XN4dZNSzfY8ZqdjKc61Hj9SOcRK63tK5kWtVPzETjO1SW
         NCgw==
X-Forwarded-Encrypted: i=1; AJvYcCXBraLdtw31fyvgvL5+ZFFfqUzZo1Sla0gYcq2AMMQHFh6Kfd+/MW5IfGL1FXeI9cp0OrDZMVVWamFkfCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGPhbPx1ESm/DCDiwwS6ECUdLyUSiowcbQn17XE1xqWX8RHh25
	mQapbEpSTDkJkti5GMa7jQl3pd+/1UV44eTjl5W4fMBeJ75w6u5FAnN7d/D5C63/Zg6kVeViaGI
	syiP0IMNfNXlHNOvEg2VFDiqwt94KY3LSCl7VkxQehc+y1YehggQK2jdZgHQ=
X-Google-Smtp-Source: AGHT+IHwyNpkzILG4TLDEfcttKctS3gu2nXueqeVy3zSwIrOQDqY2onr/pX9M5nFRaev+NCWYF5JIDiT3B6K2QQ1b7UQNy/dSn5p
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19cc:b0:3dd:b540:b795 with SMTP id
 e9e14a558f8ab-3de3954f063mr70603995ab.3.1750520661604; Sat, 21 Jun 2025
 08:44:21 -0700 (PDT)
Date: Sat, 21 Jun 2025 08:44:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6856d355.a00a0220.137b3.007d.GAE@google.com>
Subject: [syzbot] [mm?] INFO: rcu detected stall in exit_to_user_mode_loop
From: syzbot <syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    52da431bf03b Merge tag 'libnvdimm-fixes-6.16-rc3' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15caf50c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a237c32900fc479
dashboard link: https://syzkaller.appspot.com/bug?extid=2642f347f7309b4880dc
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/97afcc470d39/disk-52da431b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/dc0ebacae4ba/vmlinux-52da431b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/85dd67feecea/bzImage-52da431b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	1-...!: (0 ticks this GP) idle=1c34/1/0x4000000000000000 softirq=161556/161556 fqs=0
rcu: 	(detected by 0, t=10506 jiffies, g=161353, q=257 ncpus=2)
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 3068 Comm: syz.2.12969 Not tainted 6.16.0-rc2-syzkaller-00047-g52da431bf03b #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:bytes_is_nonzero mm/kasan/generic.c:89 [inline]
RIP: 0010:memory_is_nonzero mm/kasan/generic.c:104 [inline]
RIP: 0010:memory_is_poisoned_n mm/kasan/generic.c:129 [inline]
RIP: 0010:memory_is_poisoned mm/kasan/generic.c:161 [inline]
RIP: 0010:check_region_inline mm/kasan/generic.c:180 [inline]
RIP: 0010:kasan_check_range+0xa5/0x2c0 mm/kasan/generic.c:189
Code: 34 19 4d 89 f4 4d 29 dc 49 83 fc 10 7f 29 4d 85 e4 0f 84 41 01 00 00 4c 89 cb 48 f7 d3 4c 01 fb 41 80 3b 00 0f 85 de 01 00 00 <49> ff c3 48 ff c3 75 ee e9 21 01 00 00 44 89 dd 83 e5 07 0f 84 b5
RSP: 0018:ffffc90000a08b70 EFLAGS: 00000046
RAX: 0000000000000001 RBX: ffffffffffffffff RCX: ffffffff819ed95d
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffffff99d17f20
RBP: ffffc90000a08c78 R08: ffffffff99d17f23 R09: 1ffffffff33a2fe4
R10: dffffc0000000000 R11: fffffbfff33a2fe4 R12: 0000000000000001
R13: ffff88805f06d5e8 R14: fffffbfff33a2fe5 R15: 1ffffffff33a2fe4
FS:  0000000000000000(0000) GS:ffff888125d85000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6119f32f98 CR3: 000000000df38000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 instrument_atomic_read include/linux/instrumented.h:68 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
 queued_spin_is_locked include/asm-generic/qspinlock.h:57 [inline]
 debug_spin_unlock kernel/locking/spinlock_debug.c:101 [inline]
 do_raw_spin_unlock+0x4d/0x240 kernel/locking/spinlock_debug.c:141
 __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:150 [inline]
 _raw_spin_unlock_irqrestore+0x78/0x110 kernel/locking/spinlock.c:194
 debug_object_activate+0x2e2/0x420 lib/debugobjects.c:836
 debug_hrtimer_activate kernel/time/hrtimer.c:445 [inline]
 debug_activate kernel/time/hrtimer.c:484 [inline]
 enqueue_hrtimer+0x30/0x3a0 kernel/time/hrtimer.c:1088
 __run_hrtimer kernel/time/hrtimer.c:1778 [inline]
 __hrtimer_run_queues+0x656/0xc60 kernel/time/hrtimer.c:1825
 hrtimer_interrupt+0x45b/0xaa0 kernel/time/hrtimer.c:1887
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1039 [inline]
 __sysvec_apic_timer_interrupt+0x10b/0x410 arch/x86/kernel/apic/apic.c:1056
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa1/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_is_held_type+0x137/0x190 kernel/locking/lockdep.c:5948
Code: 01 75 44 48 c7 04 24 00 00 00 00 9c 8f 04 24 f7 04 24 00 02 00 00 75 4c 41 f7 c4 00 02 00 00 74 01 fb 65 48 8b 05 89 73 3a 07 <48> 3b 44 24 08 75 43 89 d8 48 83 c4 10 5b 41 5c 41 5d 41 5e 41 5f
RSP: 0018:ffffc900047272d0 EFLAGS: 00000206
RAX: fafe2bb1bb0f2700 RBX: 0000000000000001 RCX: fafe2bb1bb0f2700
RDX: 0000000000000000 RSI: ffffffff8db5a486 RDI: ffffffff8be1b800
RBP: 00000000ffffffff R08: 0000000000000000 R09: ffffffff822cc8f7
R10: dffffc0000000000 R11: fffff940002e65a9 R12: 0000000000000246
R13: ffff888030045a00 R14: ffffffff8e13eda0 R15: 0000000000000001
 lookup_page_ext mm/page_ext.c:254 [inline]
 page_ext_lookup+0xe7/0x180 mm/page_ext.c:520
 page_ext_iter_begin include/linux/page_ext.h:132 [inline]
 page_table_check_clear+0x278/0x700 mm/page_table_check.c:78
 ptep_get_and_clear_full arch/x86/include/asm/jump_label.h:-1 [inline]
 get_and_clear_full_ptes include/linux/pgtable.h:714 [inline]
 zap_present_folio_ptes mm/memory.c:1505 [inline]
 zap_present_ptes mm/memory.c:1590 [inline]
 do_zap_pte_range mm/memory.c:1691 [inline]
 zap_pte_range mm/memory.c:1735 [inline]
 zap_pmd_range mm/memory.c:1827 [inline]
 zap_pud_range mm/memory.c:1856 [inline]
 zap_p4d_range mm/memory.c:1877 [inline]
 unmap_page_range+0x3249/0x41c0 mm/memory.c:1898
 unmap_single_vma mm/memory.c:1941 [inline]
 unmap_vmas+0x399/0x580 mm/memory.c:1985
 exit_mmap+0x248/0xb50 mm/mmap.c:1284
 __mmput+0x118/0x420 kernel/fork.c:1121
 exit_mm+0x1da/0x2c0 kernel/exit.c:581
 do_exit+0x640/0x22e0 kernel/exit.c:943
 do_group_exit+0x21c/0x2d0 kernel/exit.c:1104
 get_signal+0x125e/0x1310 kernel/signal.c:3034
 arch_do_signal_or_restart+0x9a/0x750 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:111
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f611918e929
Code: Unable to access opcode bytes at 0x7f611918e8ff.
RSP: 002b:00007f6119f330e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 00007f61193b5fa8 RCX: 00007f611918e929
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007f61193b5fa8
RBP: 00007f61193b5fa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f61193b5fac
R13: 0000000000000000 R14: 00007fff0affa0b0 R15: 00007fff0affa198
 </TASK>
rcu: rcu_preempt kthread timer wakeup didn't happen for 10505 jiffies! g161353 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
rcu: 	Possible timer handling issue on cpu=1 timer-softirq=69309
rcu: rcu_preempt kthread starved for 10506 jiffies! g161353 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=1
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:I stack:26888 pid:16    tgid:16    ppid:2      task_flags:0x208040 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5396 [inline]
 __schedule+0x16a2/0x4cb0 kernel/sched/core.c:6785
 __schedule_loop kernel/sched/core.c:6863 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6878
 schedule_timeout+0x12b/0x270 kernel/time/sleep_timeout.c:99
 rcu_gp_fqs_loop+0x301/0x1540 kernel/rcu/tree.c:2054
 rcu_gp_kthread+0x99/0x390 kernel/rcu/tree.c:2256
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
