Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610AF212B0A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748590661; cv=none; b=YsX4FcV6TpN/4vbFN+tvxQ5koqAsAk7ZdUxrhjabFvAxrjooKuQj+r1ElPwW/DvPcxTafjms22reU2bWenfeP4m0vH0QBAMKXwv+2W5pfvrrjMpZt7Q82DlXCW6qkq2EgXCdk5T0o89GaeF1bmPxG++2x9AierO/8WLdJiPuycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748590661; c=relaxed/simple;
	bh=VTbnLoX8bnSkiC3+uXNATu81ToQdEODLWycV3m0Viow=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LA7Lq1W2l9V68i6j/jHbex40V1LcHGnn2st3LKuwE2+tNinGcI3xoEQqSMNaHQFZXx/qaVhvqo1DrxBN6HRrCuJi4uBgL5nmn8zNle9CDTlHJUh/GqyAfVdpwPce4l4K+pskEfeCVDknfoPqjsBIOWhMYXrtbWZopGtLYOqG/pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3dc6e2441caso32270805ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748590658; x=1749195458;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ef/NGmTirwqT7bQaeLD8gmZGTHMq/VBwoCEvrvMgfbo=;
        b=i1Z87Dyod9HGyv6DT1aHZjJXZsdumkl81sFjmyOxGR2S3Qxu2vNiaFYoinNuz1gKZC
         Wey/kCLoJxdz3pXEgvVxvsYpzfTtTuiMfbuJfx1krAGxlTM4hhFCLD4fvXpAnBdgrloQ
         gcsNBpVcIyuizXuBPCxbX2p02JFBqFJtSFyw3Owq1dx34ums7zpPWbjQvSnVJ7I7l0FR
         UtyT+9T4GPFPFGXRJaGYOnQ2BHQUqqTar7h3CACdavyb0jBHjo0tZh/RHvgHFSMaj0IM
         7a7Q67U/atEQIKfTeNScgastA7TAkh2DU/T2+J0Te3UszMuNwfVxy5ElhuSQlPKVddG2
         g/uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhG9iMOKMD5ITxAs5im52YvSpKyKlT2ch654dd4uDkz5f+chLeYoaf4e6NWfAqH5XjvJRZvZlRQFKFDtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1X0lf4ZxHHjl9JvqKGQ0T5W6VxDq2uTsSgJ1Jcq9H/ciCy5XL
	EdvVNJCCIPlmLW9qbGlmvXMwkkxTt/UcTciq+Fs8cwgW+XqHvc76lox15fwMro+oh7bsNxyRc2u
	rWfc6TvWtM9OZbMVUd5ZLBWTaTK4bEjPBRsaq2SFk4mk1w0X1Z5W0X4mHrto=
X-Google-Smtp-Source: AGHT+IHGHmoFJZ4n2Uga8C+l/XfizE2QyKOZK0br/b7xW86lrGZieL7EeNFuChiXE+tBDkDLcSYfoqEDS9onDchWIus+xrEYYR2q
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:174c:b0:3dc:7660:9ed9 with SMTP id
 e9e14a558f8ab-3dd9c7135ebmr8700745ab.0.1748590658471; Fri, 30 May 2025
 00:37:38 -0700 (PDT)
Date: Fri, 30 May 2025 00:37:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68396042.a00a0220.d8eae.0004.GAE@google.com>
Subject: [syzbot] [kernel?] INFO: rcu detected stall in vm_area_alloc (6)
From: syzbot <syzbot+2ddfdc64a6b68a324ae2@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0f8c0258bf04 Merge tag 'mm-hotfixes-stable-2025-05-25-00-5..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12e45170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9b0280e4afd1c529
dashboard link: https://syzkaller.appspot.com/bug?extid=2ddfdc64a6b68a324ae2
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16e45170580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/77489c857e31/disk-0f8c0258.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3adcdd5d62b9/vmlinux-0f8c0258.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c93fd6a6b796/bzImage-0f8c0258.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2ddfdc64a6b68a324ae2@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	0-...!: (1 GPs behind) idle=51a4/1/0x4000000000000000 softirq=18198/18202 fqs=0
rcu: 	(detected by 1, t=10502 jiffies, g=9149, q=175 ncpus=2)
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 6052 Comm: modprobe Not tainted 6.15.0-rc7-syzkaller-00175-g0f8c0258bf04 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:pv_queued_spin_unlock arch/x86/include/asm/paravirt.h:577 [inline]
RIP: 0010:queued_spin_unlock arch/x86/include/asm/qspinlock.h:57 [inline]
RIP: 0010:do_raw_spin_unlock+0x152/0x230 kernel/locking/spinlock_debug.c:142
Code: 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 95 00 00 00 48 c7 c0 50 20 22 8e c7 43 08 ff ff ff ff 48 ba 00 00 00 00 00 fc ff df <48> c1 e8 03 80 3c 10 00 0f 85 ba 00 00 00 48 83 3d 78 ab 89 0c 00
RSP: 0018:ffffc90000007d18 EFLAGS: 00000046
RAX: ffffffff8e222050 RBX: ffffffff9adbe550 RCX: ffffffff819873c3
RDX: dffffc0000000000 RSI: 0000000000000004 RDI: ffffffff9adbe550
RBP: ffffffff9adbe558 R08: 0000000000000000 R09: fffffbfff35b7caa
R10: ffffffff9adbe553 R11: 0000000000000000 R12: ffffffff9adbe560
R13: dffffc0000000000 R14: ffff88802ae6b340 R15: 1ffff92000000fac
FS:  0000000000000000(0000) GS:ffff8881249da000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe27243ff8 CR3: 000000005cd34000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:150 [inline]
 _raw_spin_unlock_irqrestore+0x22/0x80 kernel/locking/spinlock.c:194
 debug_object_deactivate+0x1ec/0x3a0 lib/debugobjects.c:888
 debug_hrtimer_deactivate kernel/time/hrtimer.c:450 [inline]
 debug_deactivate kernel/time/hrtimer.c:490 [inline]
 __run_hrtimer kernel/time/hrtimer.c:1729 [inline]
 __hrtimer_run_queues+0x46f/0xad0 kernel/time/hrtimer.c:1825
 hrtimer_interrupt+0x397/0x8e0 kernel/time/hrtimer.c:1887
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1038 [inline]
 __sysvec_apic_timer_interrupt+0x108/0x3f0 arch/x86/kernel/apic/apic.c:1055
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x9f/0xc0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_acquire+0x62/0x350 kernel/locking/lockdep.c:5870
Code: 39 0c 12 83 f8 07 0f 87 bc 02 00 00 89 c0 48 0f a3 05 52 0a ed 0e 0f 82 74 02 00 00 8b 35 ea 39 ed 0e 85 f6 0f 85 8d 00 00 00 <48> 8b 44 24 30 65 48 2b 05 29 39 0c 12 0f 85 c7 02 00 00 48 83 c4
RSP: 0018:ffffc90003fdf3c0 EFLAGS: 00000206
RAX: 0000000000000046 RBX: ffffffff8e3bfc00 RCX: 00000000ad97940f
RDX: 0000000000000000 RSI: ffffffff8dbbf273 RDI: ffffffff8bf4a520
RBP: 0000000000000002 R08: 461794d577a429a7 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:841 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1155 [inline]
 unwind_next_frame+0xd1/0x20a0 arch/x86/kernel/unwind_orc.c:479
 arch_stack_walk+0x94/0x100 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x89/0x90 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4147 [inline]
 slab_alloc_node mm/slub.c:4196 [inline]
 kmem_cache_alloc_noprof+0x1cb/0x3b0 mm/slub.c:4203
 vm_area_alloc+0x1f/0x160 kernel/fork.c:441
 __mmap_new_vma mm/vma.c:2403 [inline]
 __mmap_region+0xfd0/0x27c0 mm/vma.c:2520
 mmap_region+0x1ab/0x3f0 mm/vma.c:2598
 do_mmap+0xd8e/0x11b0 mm/mmap.c:561
 vm_mmap_pgoff+0x281/0x450 mm/util.c:579
 ksys_mmap_pgoff+0x32c/0x5c0 mm/mmap.c:607
 __do_sys_mmap arch/x86/kernel/sys_x86_64.c:89 [inline]
 __se_sys_mmap arch/x86/kernel/sys_x86_64.c:82 [inline]
 __x64_sys_mmap+0x125/0x190 arch/x86/kernel/sys_x86_64.c:82
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa439aa5242
Code: 08 00 04 00 00 eb e2 90 41 f7 c1 ff 0f 00 00 75 27 55 89 cd 53 48 89 fb 48 85 ff 74 33 41 89 ea 48 89 df b8 09 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 5e 5b 5d c3 0f 1f 00 c7 05 46 40 01 00 16 00
RSP: 002b:00007ffe27243898 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fa439aa5242
RDX: 0000000000000001 RSI: 00000000000c1918 RDI: 0000000000000000
RBP: 0000000000000802 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000802 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fa439a790c0 R14: 00007ffe27243ca0 R15: 00000fffc4e48716
 </TASK>
rcu: rcu_preempt kthread starved for 10502 jiffies! g9149 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=1
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:R  running task     stack:28664 pid:16    tgid:16    ppid:2      task_flags:0x208040 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_timeout+0x123/0x290 kernel/time/sleep_timeout.c:99
 rcu_gp_fqs_loop+0x1ea/0xb00 kernel/rcu/tree.c:2046
 rcu_gp_kthread+0x270/0x380 kernel/rcu/tree.c:2248
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
rcu: Stack dump where RCU GP kthread last ran:
CPU: 1 UID: 0 PID: 65 Comm: kworker/u8:4 Not tainted 6.15.0-rc7-syzkaller-00175-g0f8c0258bf04 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events_unbound toggle_allocation_gate
RIP: 0010:csd_lock_wait kernel/smp.c:340 [inline]
RIP: 0010:smp_call_function_many_cond+0x4a5/0x1290 kernel/smp.c:885
Code: 89 ee e8 de 12 0c 00 85 ed 74 48 48 8b 44 24 20 49 89 c4 83 e0 07 49 c1 ec 03 48 89 c5 4d 01 f4 83 c5 03 e8 7d 17 0c 00 f3 90 <41> 0f b6 04 24 40 38 c5 7c 08 84 c0 0f 85 de 0b 00 00 8b 43 08 31
RSP: 0018:ffffc90001567938 EFLAGS: 00000293
RAX: 0000000000000000 RBX: ffff8880b8441720 RCX: ffffffff81af2e99
RDX: ffff88801db90000 RSI: ffffffff81af2e73 RDI: 0000000000000005
RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffffed10170882e5
R13: 0000000000000001 R14: dffffc0000000000 R15: ffff8880b853b040
FS:  0000000000000000(0000) GS:ffff888124ada000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5422dddd58 CR3: 000000000e180000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 on_each_cpu_cond_mask+0x40/0x90 kernel/smp.c:1052
 on_each_cpu include/linux/smp.h:71 [inline]
 text_poke_sync arch/x86/kernel/alternative.c:2757 [inline]
 text_poke_bp_batch+0x566/0x760 arch/x86/kernel/alternative.c:3050
 text_poke_flush arch/x86/kernel/alternative.c:3158 [inline]
 text_poke_flush arch/x86/kernel/alternative.c:3155 [inline]
 text_poke_finish+0x30/0x40 arch/x86/kernel/alternative.c:3165
 arch_jump_label_transform_apply+0x1c/0x30 arch/x86/kernel/jump_label.c:146
 jump_label_update+0x376/0x550 kernel/jump_label.c:919
 static_key_enable_cpuslocked+0x1b7/0x270 kernel/jump_label.c:210
 static_key_enable+0x1a/0x20 kernel/jump_label.c:223
 toggle_allocation_gate mm/kfence/core.c:850 [inline]
 toggle_allocation_gate+0xfa/0x280 mm/kfence/core.c:842
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
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
