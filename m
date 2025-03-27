Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294079D2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743044615; cv=none; b=uj4W7sJE1qNJY5h2pA8M+csZMd+qcL4YLRg16JiOyXlttAk8gRK9UZnQdPQLJIkiW0fMYPVxr4zQaMmjov0xFiSmcSz2c2ae/zVBuwAvD8mS5TDgP0nOZ2ktcs6LnbACt3k99Ioo3FjArmK7MdfKdnkTL1lQAxgIL/OiRs5s3cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743044615; c=relaxed/simple;
	bh=XJGMFJJY4MzZcnbuWmeKSo6OvdiplxkRG/TFOKzgz8w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UAKzXDk4IOxI+m/EwIc79dbef4B+c6Typ75x6dsN/zF/Brtbp6zWDxglKjAdmZb9gcrrOu8cRYJkMjvnRjJ8qg7q162i6z7SetefG3KLiAHB3raFtcp3+xjD8Q4zeScx1rnDtWacYSXER1L4vapTHsdRzdqC1bADnJ+u7DQAR88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85e15e32366so57976739f.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 20:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743044613; x=1743649413;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BkLbVcKw2BlKBCR/plGMcvcox6XV7yfliwQ36omzTwQ=;
        b=hW/HAU7VBdwZO4WOK9Elf+sVjD5lXLc5nBkwwBb0DedfdDNhUgpMpusl83LTchQC03
         LNcsJM57HuODJYKhN6KRnqznk+rOFVsh+kL3EeIGbEkrRT/pjVuhqfLmIX1hHskus6Mq
         miUe0HpRzYExAhcds5ik24iD5/smS6mj8BPwkqTg3LLZVoWUTuvM/38odIy8RIDp4h1m
         NIuE88s+pPgEHSJsR+AIYIUlp4fCfDes+j6Ux8qQ0Nj9MhAqFJpicX8k5lqy3xN2C5Kt
         vt241N1tYttEfMTzb0wgl19UjWG2jD9skUi/v+pJqv9jwRcJuGn5lwiDrO1aqWTuS9s1
         AbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj9/zy+bvVHaaEfLdqfWOJT6KiYcJngNHSjODuySrA6e2NpbkfRVkUy1rtNJp8fqTKM4NWH7n9K+RTeBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVOgF5jL/VOOpJXieitAt9H3pQPRwvtsk4hNBkh5Cu+5gq8IXW
	cA4jLuKGExZQDIHqqRXKth0U5KE4h7GqBRDAecBd3XBPM0+9uoB+h7Zxd9X2OMXMl9i/ypERCZ4
	sNV+6HSqccHpXdp8AavzsFvbWH69+WhHsWWgrV6C5UWY7p0zs2UDmIkk=
X-Google-Smtp-Source: AGHT+IFhJMVffQwNLXxoU8HujBEdc86nSkPCIyrnSlxfNLgKC+x9BHe39htlYwOZn2kdslk2yPjKIMTHJb5O6uAxN4OaDNUg9prY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aac:b0:3d4:3eed:2755 with SMTP id
 e9e14a558f8ab-3d5ccdd5c06mr24779775ab.12.1743044612681; Wed, 26 Mar 2025
 20:03:32 -0700 (PDT)
Date: Wed, 26 Mar 2025 20:03:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e4c004.050a0220.2f068f.001d.GAE@google.com>
Subject: [syzbot] [mm?] INFO: rcu detected stall in clone (7)
From: syzbot <syzbot+adf8ed0e3c4682852da1@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2df0c02dab82 x86 boot build: make git ignore stale 'tools'..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=146cd43f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=235ad3ee10cb70e
dashboard link: https://syzkaller.appspot.com/bug?extid=adf8ed0e3c4682852da1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3e8f0b5bed43/disk-2df0c02d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3511fa20cc2c/vmlinux-2df0c02d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0ea010ba8490/bzImage-2df0c02d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+adf8ed0e3c4682852da1@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	1-...!: (1 GPs behind) idle=3cb4/1/0x4000000000000000 softirq=42644/42646 fqs=134
rcu: 	(detected by 0, t=10502 jiffies, g=30361, q=199 ncpus=2)
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 5827 Comm: syz-executor Not tainted 6.14.0-syzkaller-01103-g2df0c02dab82 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:__kasan_check_byte+0xa/0x50 mm/kasan/common.c:555
Code: e9 89 fe ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 41 54 49 89 f4 55 <48> 89 fd 53 e8 0d 1f 00 00 89 c3 84 c0 74 0b 89 d8 5b 5d 41 5c c3
RSP: 0018:ffffc90000a08da0 EFLAGS: 00000002
RAX: 0000000000000001 RBX: ffff8880b8527858 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8b603266 RDI: ffff8880b8527858
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffffffff8b603266
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  000055555862d500(0000) GS:ffff888124b54000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe9983a6f98 CR3: 0000000067ad6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 kasan_check_byte include/linux/kasan.h:399 [inline]
 lock_acquire kernel/locking/lockdep.c:5840 [inline]
 lock_acquire+0xfc/0x350 kernel/locking/lockdep.c:5823
 __raw_spin_lock_irq include/linux/spinlock_api_smp.h:119 [inline]
 _raw_spin_lock_irq+0x36/0x50 kernel/locking/spinlock.c:170
 __run_hrtimer kernel/time/hrtimer.c:1805 [inline]
 __hrtimer_run_queues+0x2bc/0xad0 kernel/time/hrtimer.c:1865
 hrtimer_interrupt+0x397/0x8e0 kernel/time/hrtimer.c:1927
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1038 [inline]
 __sysvec_apic_timer_interrupt+0x108/0x3f0 arch/x86/kernel/apic/apic.c:1055
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x9f/0xc0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:__page_table_check_ptes_set+0x3c/0x3e0 mm/page_table_check.c:214
Code: 55 48 bd 00 00 00 00 00 fc ff df 53 48 89 f3 48 83 ec 70 48 c7 44 24 10 b3 8a b5 41 4c 8d 7c 24 10 48 c7 44 24 18 51 b5 b9 8d <49> c1 ef 03 48 c7 44 24 20 d0 47 2a 82 49 8d 04 2f c7 00 f1 f1 f1
RSP: 0018:ffffc9000434f6e8 EFLAGS: 00000286
RAX: 0000000000000000 RBX: ffff888036076b38 RCX: 0000000000000001
RDX: 80000000744e2007 RSI: ffff888036076b38 RDI: ffff888029c11e00
RBP: dffffc0000000000 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: ffff888029c11e00 R14: dffffc0000000000 R15: ffffc9000434f6f8
 page_table_check_ptes_set include/linux/page_table_check.h:74 [inline]
 set_ptes include/linux/pgtable.h:288 [inline]
 __copy_present_ptes mm/memory.c:967 [inline]
 copy_present_ptes mm/memory.c:1050 [inline]
 copy_pte_range mm/memory.c:1173 [inline]
 copy_pmd_range mm/memory.c:1261 [inline]
 copy_pud_range mm/memory.c:1298 [inline]
 copy_p4d_range mm/memory.c:1322 [inline]
 copy_page_range+0x20e7/0x5790 mm/memory.c:1420
 dup_mmap kernel/fork.c:748 [inline]
 dup_mm kernel/fork.c:1700 [inline]
 copy_mm kernel/fork.c:1752 [inline]
 copy_process+0x8651/0x9130 kernel/fork.c:2396
 kernel_clone+0xfc/0x960 kernel/fork.c:2811
 __do_sys_clone+0xce/0x120 kernel/fork.c:2954
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0bc05839d3
Code: 1f 84 00 00 00 00 00 64 48 8b 04 25 10 00 00 00 45 31 c0 31 d2 31 f6 bf 11 00 20 01 4c 8d 90 d0 02 00 00 b8 38 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 89 c2 85 c0 75 2c 64 48 8b 04 25 10 00 00
RSP: 002b:00007ffdff5ea518 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f0bc05839d3
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000001200011
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000001
R10: 000055555862d7d0 R11: 0000000000000246 R12: 0000000000000000
R13: 00000000000927c0 R14: 0000000000047f07 R15: 00007ffdff5ea6b0
 </TASK>
rcu: rcu_preempt kthread starved for 7591 jiffies! g30361 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:R  running task     stack:28056 pid:16    tgid:16    ppid:2      task_flags:0x208040 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5367 [inline]
 __schedule+0x1129/0x5c00 kernel/sched/core.c:6748
 __schedule_loop kernel/sched/core.c:6825 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6840
 schedule_timeout+0x123/0x280 kernel/time/sleep_timeout.c:99
 rcu_gp_fqs_loop+0x1ea/0xb00 kernel/rcu/tree.c:2046
 rcu_gp_kthread+0x270/0x380 kernel/rcu/tree.c:2248
 kthread+0x3a4/0x760 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
rcu: Stack dump where RCU GP kthread last ran:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.14.0-syzkaller-01103-g2df0c02dab82 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:native_irq_disable arch/x86/include/asm/irqflags.h:37 [inline]
RIP: 0010:arch_local_irq_disable arch/x86/include/asm/irqflags.h:92 [inline]
RIP: 0010:acpi_safe_halt+0x1a/0x20 drivers/acpi/processor_idle.c:112
Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 65 48 8b 05 50 00 3f 08 48 8b 00 a8 08 75 0c 66 90 0f 00 2d 68 fb a0 00 fb f4 <fa> c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffffff8e007d68 EFLAGS: 00000246
RAX: 0000000000004000 RBX: 0000000000000001 RCX: ffffffff8b5da2f9
RDX: 0000000000000001 RSI: ffff8881442d9000 RDI: ffff8881442d9064
RBP: ffff8881442d9064 R08: 0000000000000001 R09: ffffed10170865bd
R10: ffff8880b8432deb R11: 0000000000000000 R12: ffff88801eb0f800
R13: ffffffff8f02dae0 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888124a54000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f58d6613c9a CR3: 0000000067ad0000 CR4: 00000000003526f0
DR0: 0000000100000000 DR1: 0000000000000040 DR2: 0000000000000000
DR3: 0000000000000009 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 </IRQ>
 <TASK>
 acpi_idle_enter+0xc5/0x160 drivers/acpi/processor_idle.c:701
 cpuidle_enter_state+0xb2/0x500 drivers/cpuidle/cpuidle.c:268
 cpuidle_enter+0x4e/0xa0 drivers/cpuidle/cpuidle.c:389
 call_cpuidle kernel/sched/idle.c:155 [inline]
 cpuidle_idle_call kernel/sched/idle.c:230 [inline]
 do_idle+0x378/0x510 kernel/sched/idle.c:325
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:423
 rest_init+0x16b/0x2b0 init/main.c:743
 start_kernel+0x3e9/0x4d0 init/main.c:1099
 x86_64_start_reservations+0x18/0x30 arch/x86/kernel/head64.c:513
 x86_64_start_kernel+0xb0/0xc0 arch/x86/kernel/head64.c:494
 common_startup_64+0x13e/0x148
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
