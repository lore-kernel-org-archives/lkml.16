Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608DF209F38
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998204; cv=none; b=Gv/zGQgo14mbxdgKJgCAT4l5skTzGmLxcXb7DkBUqkekIFkoP1Ihq4YyjW8bZv2exp7KHtwnBrkxTRDW8tNNeWBJ1xt1t04Ng3iEoM8ocMDNhCodOyXK6APnGIlcrQAwPWhgthR5NOASjpHZcBd/BQle7AL6+Mm+Q5bhGRLBK58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998204; c=relaxed/simple;
	bh=NAtdFw5S+In8txuRxbzODEbM3YdSJwoVH+kmc/OahN8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tK99OqB2+zSGYrWELdY7eTGqD8Q+xYjcFFSLFWdhj+4Is2c1nGYAa2sXM2vLLrS+ZujcBRR6JdXfoUGGRQLiktQKdYBOvNpzuXt0eCxokjvATonFzLm6ELdi4nKke79O7HgHGRwn0AZoEf+pGCZUR3j9J/C9rQSeggHN0JtD5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d94fe1037cso44698435ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998201; x=1746603001;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ssy+nZiUtqXF9tGnkeUJNKD5UNXU28H+pzjoDIBQUwk=;
        b=OBPleWJu5ga5J3kEhibiRhZpmtfccElJwb+3vmwNvOQw1MvDS2j6B9AZZ/iwr9kmDT
         MYu3eNAbfs/fwe5LsHdrf6gKHJtWR2tlVvUkvcjcxVp5ux5QDZN8OgJ3bojBim8oxHxD
         kHrBhhEcxfJ8JoRUnPMcV3uOAio6pWaM50/GtVGmkrUszr00vlOVLJUnuUZ3GNlbQ74J
         58sgzx/zWWseCdy0nb3EtMVwqVIm7SzyxDK9i/LjQ6AP5nwU0txgELyDVmxL18M3ovy3
         7hW/ZdmbXXzNEJmslH+SKaOwEyyPzeHvEbn24gWDXmXQ3xahCqCssT8m0e/0j267sjQv
         0DPg==
X-Gm-Message-State: AOJu0YwF90DvyNCcr+KTPlA4Eq3RbiHILy4LE63Rb6IyVPkuZcVEI7Nf
	xZkBkRUpDyKU/EdSKaDyPU4vcyGGmcLjAPzWIZmDdZo3zJMxhPYJbgzR4vYJ4aeCACzecq8N5tI
	a3OaI7GAJZMTf5i1keRvk6D+VhO5H1MC33MUAt2hX3522+FJhd9J/hOQ=
X-Google-Smtp-Source: AGHT+IG6RYwwubeEnWDMYoOTa0jr0kABFIjSsVhzXn0RDh7FC9uhN/QZej5oxsitUONZbvIWhH0JCM2tifyIqxx9MExCcE9fsmck
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3785:b0:3d9:64e7:959f with SMTP id
 e9e14a558f8ab-3d968009f5dmr14147755ab.21.1745998201429; Wed, 30 Apr 2025
 00:30:01 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:30:01 -0700
In-Reply-To: <82a096ae-0be2-4f7e-842f-95cfe8df3ba5@amd.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6811d179.050a0220.39e3a1.0cea.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, shivankg@amd.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

ed.
[    1.681174][    T0] 	Tracing variant of Tasks RCU enabled.
[    1.681902][    T0] rcu: RCU calculated value of scheduler-enlistment de=
lay is 10 jiffies.
[    1.683059][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr=
_cpu_ids=3D2
[    1.684680][    T0] Running RCU synchronous self tests
[    1.685620][    T0] RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_=
cb_adjust=3D1 rcu_task_cpu_ids=3D2.
[    1.686925][    T0] RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu=
_task_cb_adjust=3D1 rcu_task_cpu_ids=3D2.
[    1.823163][    T0] NR_IRQS: 4352, nr_irqs: 440, preallocated irqs: 16
[    1.825139][    T0] rcu: srcu_init: Setting srcu_struct sizes based on c=
ontention.
[    1.826579][    T0] kfence: initialized - using 2097152 bytes for 255 ob=
jects at 0xffff88823be00000-0xffff88823c000000
[    1.829232][    T0] Console: colour VGA+ 80x25
[    1.829978][    T0] printk: legacy console [ttyS0] enabled
[    1.829978][    T0] printk: legacy console [ttyS0] enabled
[    1.831736][    T0] printk: legacy bootconsole [earlyser0] disabled
[    1.831736][    T0] printk: legacy bootconsole [earlyser0] disabled
[    1.833514][    T0] Lock dependency validator: Copyright (c) 2006 Red Ha=
t, Inc., Ingo Molnar
[    1.834681][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    1.835518][    T0] ... MAX_LOCK_DEPTH:          48
[    1.836336][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    1.837124][    T0] ... CLASSHASH_SIZE:          4096
[    1.838035][    T0] ... MAX_LOCKDEP_ENTRIES:     1048576
[    1.838801][    T0] ... MAX_LOCKDEP_CHAINS:      1048576
[    1.839561][    T0] ... CHAINHASH_SIZE:          524288
[    1.840423][    T0]  memory used by lock dependency info: 106625 kB
[    1.841405][    T0]  memory used for stack traces: 8320 kB
[    1.842304][    T0]  per task-struct memory footprint: 1920 bytes
[    1.843565][    T0] mempolicy: Enabling automatic NUMA balancing. Config=
ure with numa_balancing=3D or the kernel.numa_balancing sysctl
[    1.845316][    T0] ACPI: Core revision 20241212
[    1.846971][    T0] APIC: Switch to symmetric I/O mode setup
[    1.848285][    T0] x2apic enabled
[    1.852223][    T0] APIC: Switched APIC routing to: physical x2apic
[    1.859089][    T0] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D0 apic2=3D-1=
 pin2=3D-1
[    1.860641][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x1fb6f3811e0, max_idle_ns: 440795202126 ns
[    1.862247][    T0] Calibrating delay loop (skipped) preset value.. 4400=
.40 BogoMIPS (lpj=3D22002040)
[    1.864112][    T0] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    1.865179][    T0] Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB=
 4
[    1.866500][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    1.872389][    T0] Spectre V2 : Spectre BHI mitigation: SW BHB clearing=
 on syscall and VM exit
[    1.874070][    T0] Spectre V2 : Mitigation: IBRS
[    1.875161][    T0] Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on=
 context switch and VMEXIT
[    1.876856][    T0] RETBleed: Mitigation: IBRS
[    1.878026][    T0] Spectre V2 : mitigation: Enabling conditional Indire=
ct Branch Prediction Barrier
[    1.879710][    T0] Spectre V2 : User space: Mitigation: STIBP via prctl
[    1.882307][    T0] Speculative Store Bypass: Mitigation: Speculative St=
ore Bypass disabled via prctl
[    1.883734][    T0] MDS: Mitigation: Clear CPU buffers
[    1.884454][    T0] TAA: Mitigation: Clear CPU buffers
[    1.885363][    T0] MMIO Stale Data: Vulnerable: Clear CPU buffers attem=
pted, no microcode
[    1.886952][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floati=
ng point registers'
[    1.888547][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE regist=
ers'
[    1.889823][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX regist=
ers'
[    1.890929][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  2=
56
[    1.892240][    T0] x86/fpu: Enabled xstate features 0x7, context size i=
s 832 bytes, using 'standard' format.
[    2.193671][    T0] Freeing SMP alternatives memory: 132K
[    2.194604][    T0] pid_max: default: 32768 minimum: 301
[    2.196277][    T0] LSM: initializing lsm=3Dlockdown,capability,landlock=
,yama,safesetid,tomoyo,apparmor,bpf,ima,evm
[    2.198299][    T0] landlock: Up and running.
[    2.198925][    T0] Yama: becoming mindful.
[    2.199858][    T0] TOMOYO Linux initialized
[    2.201374][    T0] AppArmor: AppArmor initialized
[    2.203589][    T0] LSM support for eBPF active
[    2.210200][    T0] Dentry cache hash table entries: 1048576 (order: 11,=
 8388608 bytes, vmalloc hugepage)
[    2.214840][    T0] Inode-cache hash table entries: 524288 (order: 10, 4=
194304 bytes, vmalloc hugepage)
[    2.216675][    T0] Mount-cache hash table entries: 16384 (order: 5, 131=
072 bytes, vmalloc)
[    2.218347][    T0] Mountpoint-cache hash table entries: 16384 (order: 5=
, 131072 bytes, vmalloc)
[    2.224475][    T0] Running RCU synchronous self tests
[    2.225441][    T0] Running RCU synchronous self tests
[    2.347377][    T1] smpboot: CPU0: Intel(R) Xeon(R) CPU @ 2.20GHz (famil=
y: 0x6, model: 0x4f, stepping: 0x0)
[    2.351817][    T9] ------------[ cut here ]------------
[    2.352232][    T9] WARNING: CPU: 0 PID: 9 at arch/x86/mm/tlb.c:919 swit=
ch_mm_irqs_off+0x640/0x7c0
[    2.352232][    T9] Modules linked in:
[    2.352232][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6=
.15.0-rc4-next-20250428-syzkaller-dirty #0 PREEMPT(full)=20
[    2.352232][    T9] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 04/19/2025
[    2.352232][    T9] Workqueue: events once_deferred
[    2.352232][    T9] RIP: 0010:switch_mm_irqs_off+0x640/0x7c0
[    2.352232][    T9] Code: 84 f4 fa ff ff 90 0f 0b 90 e9 eb fa ff ff 90 0=
f 0b 90 e9 84 fe ff ff 90 0f 0b 90 e9 18 fc ff ff 90 0f 0b 90 e9 cb fb ff f=
f 90 <0f> 0b 90 e9 df fb ff ff 89 c8 90 0f 0b 90 e9 3f fd ff ff 90 0f 0b
[    2.352232][    T9] RSP: 0000:ffffc900000e7720 EFLAGS: 00010056
[    2.352232][    T9] RAX: 0000000000000001 RBX: ffff88801a070940 RCX: fff=
fffff8173b01d
[    2.352232][    T9] RDX: 0000000000000000 RSI: 0000000000000008 RDI: fff=
f88801a070940
[    2.352232][    T9] RBP: ffffc900000e77f0 R08: ffff88801a070947 R09: 1ff=
ff1100340e128
[    2.352232][    T9] R10: dffffc0000000000 R11: ffffed100340e129 R12: 1ff=
ff110037d70ab
[    2.352232][    T9] R13: ffffffff8e0467c0 R14: ffff88801beb8000 R15: 000=
0000000000000
[    2.352232][    T9] FS:  0000000000000000(0000) GS:ffff8881260a1000(0000=
) knlGS:0000000000000000
[    2.352232][    T9] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.352232][    T9] CR2: ffff88823ffff000 CR3: 000000001a078000 CR4: 000=
00000003506f0
[    2.352232][    T9] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    2.352232][    T9] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    2.352232][    T9] Call Trace:
[    2.352232][    T9]  <TASK>
[    2.352232][    T9]  ? __pfx_switch_mm_irqs_off+0x10/0x10
[    2.352232][    T9]  ? __text_poke+0x5a4/0x980
[    2.352232][    T9]  ? kasan_check_range+0x29a/0x2b0
[    2.352232][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
[    2.352232][    T9]  unuse_temporary_mm+0x9d/0x100
[    2.352232][    T9]  __text_poke+0x634/0x980
[    2.352232][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
[    2.352232][    T9]  ? __pfx_text_poke_memcpy+0x10/0x10
[    2.352232][    T9]  ? __pfx___text_poke+0x10/0x10
[    2.352232][    T9]  ? rcu_is_watching+0x15/0xb0
[    2.352232][    T9]  ? trace_contention_end+0x39/0x120
[    2.352232][    T9]  smp_text_poke_batch_finish+0x38c/0x1100
[    2.352232][    T9]  ? __pfx___mutex_lock+0x10/0x10
[    2.352232][    T9]  ? __pfx_smp_text_poke_batch_finish+0x10/0x10
[    2.352232][    T9]  ? arch_jump_label_transform_queue+0x97/0x110
[    2.352232][    T9]  ? __jump_label_update+0x37e/0x3a0
[    2.352232][    T9]  arch_jump_label_transform_apply+0x1c/0x30
[    2.352232][    T9]  static_key_disable_cpuslocked+0xc5/0x1b0
[    2.352232][    T9]  static_key_disable+0x1a/0x20
[    2.352232][    T9]  once_deferred+0x6f/0xb0
[    2.352232][    T9]  ? process_scheduled_works+0x9ef/0x17b0
[    2.352232][    T9]  process_scheduled_works+0xade/0x17b0
[    2.352232][    T9]  ? __pfx_process_scheduled_works+0x10/0x10
[    2.352232][    T9]  worker_thread+0x8a0/0xda0
[    2.352232][    T9]  kthread+0x70e/0x8a0
[    2.352232][    T9]  ? __pfx_worker_thread+0x10/0x10
[    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
[    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
[    2.352232][    T9]  ? _raw_spin_unlock_irq+0x23/0x50
[    2.352232][    T9]  ? lockdep_hardirqs_on+0x9c/0x150
[    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
[    2.352232][    T9]  ret_from_fork+0x4b/0x80
[    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
[    2.352232][    T9]  ret_from_fork_asm+0x1a/0x30
[    2.352232][    T9]  </TASK>
[    2.352232][    T9] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    2.352232][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6=
.15.0-rc4-next-20250428-syzkaller-dirty #0 PREEMPT(full)=20
[    2.352232][    T9] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 04/19/2025
[    2.352232][    T9] Workqueue: events once_deferred
[    2.352232][    T9] Call Trace:
[    2.352232][    T9]  <TASK>
[    2.352232][    T9]  dump_stack_lvl+0x99/0x250
[    2.352232][    T9]  ? __asan_memcpy+0x40/0x70
[    2.352232][    T9]  ? __pfx_dump_stack_lvl+0x10/0x10
[    2.352232][    T9]  ? __pfx__printk+0x10/0x10
[    2.352232][    T9]  panic+0x2db/0x790
[    2.352232][    T9]  ? __pfx_panic+0x10/0x10
[    2.352232][    T9]  ? show_trace_log_lvl+0x4fb/0x550
[    2.352232][    T9]  ? ret_from_fork_asm+0x1a/0x30
[    2.352232][    T9]  __warn+0x31b/0x4b0
[    2.352232][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
[    2.352232][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
[    2.352232][    T9]  report_bug+0x2be/0x4f0
[    2.352232][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
[    2.352232][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
[    2.352232][    T9]  ? switch_mm_irqs_off+0x642/0x7c0
[    2.352232][    T9]  handle_bug+0x84/0x160
[    2.352232][    T9]  exc_invalid_op+0x1a/0x50
[    2.352232][    T9]  asm_exc_invalid_op+0x1a/0x20
[    2.352232][    T9] RIP: 0010:switch_mm_irqs_off+0x640/0x7c0
[    2.352232][    T9] Code: 84 f4 fa ff ff 90 0f 0b 90 e9 eb fa ff ff 90 0=
f 0b 90 e9 84 fe ff ff 90 0f 0b 90 e9 18 fc ff ff 90 0f 0b 90 e9 cb fb ff f=
f 90 <0f> 0b 90 e9 df fb ff ff 89 c8 90 0f 0b 90 e9 3f fd ff ff 90 0f 0b
[    2.352232][    T9] RSP: 0000:ffffc900000e7720 EFLAGS: 00010056
[    2.352232][    T9] RAX: 0000000000000001 RBX: ffff88801a070940 RCX: fff=
fffff8173b01d
[    2.352232][    T9] RDX: 0000000000000000 RSI: 0000000000000008 RDI: fff=
f88801a070940
[    2.352232][    T9] RBP: ffffc900000e77f0 R08: ffff88801a070947 R09: 1ff=
ff1100340e128
[    2.352232][    T9] R10: dffffc0000000000 R11: ffffed100340e129 R12: 1ff=
ff110037d70ab
[    2.352232][    T9] R13: ffffffff8e0467c0 R14: ffff88801beb8000 R15: 000=
0000000000000
[    2.352232][    T9]  ? switch_mm_irqs_off+0x21d/0x7c0
[    2.352232][    T9]  ? __pfx_switch_mm_irqs_off+0x10/0x10
[    2.352232][    T9]  ? __text_poke+0x5a4/0x980
[    2.352232][    T9]  ? kasan_check_range+0x29a/0x2b0
[    2.352232][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
[    2.352232][    T9]  unuse_temporary_mm+0x9d/0x100
[    2.352232][    T9]  __text_poke+0x634/0x980
[    2.352232][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
[    2.352232][    T9]  ? __pfx_text_poke_memcpy+0x10/0x10
[    2.352232][    T9]  ? __pfx___text_poke+0x10/0x10
[    2.352232][    T9]  ? rcu_is_watching+0x15/0xb0
[    2.352232][    T9]  ? trace_contention_end+0x39/0x120
[    2.352232][    T9]  smp_text_poke_batch_finish+0x38c/0x1100
[    2.352232][    T9]  ? __pfx___mutex_lock+0x10/0x10
[    2.352232][    T9]  ? __pfx_smp_text_poke_batch_finish+0x10/0x10
[    2.352232][    T9]  ? arch_jump_label_transform_queue+0x97/0x110
[    2.352232][    T9]  ? __jump_label_update+0x37e/0x3a0
[    2.352232][    T9]  arch_jump_label_transform_apply+0x1c/0x30
[    2.352232][    T9]  static_key_disable_cpuslocked+0xc5/0x1b0
[    2.352232][    T9]  static_key_disable+0x1a/0x20
[    2.352232][    T9]  once_deferred+0x6f/0xb0
[    2.352232][    T9]  ? process_scheduled_works+0x9ef/0x17b0
[    2.352232][    T9]  process_scheduled_works+0xade/0x17b0
[    2.352232][    T9]  ? __pfx_process_scheduled_works+0x10/0x10
[    2.352232][    T9]  worker_thread+0x8a0/0xda0
[    2.352232][    T9]  kthread+0x70e/0x8a0
[    2.352232][    T9]  ? __pfx_worker_thread+0x10/0x10
[    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
[    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
[    2.352232][    T9]  ? _raw_spin_unlock_irq+0x23/0x50
[    2.352232][    T9]  ? lockdep_hardirqs_on+0x9c/0x150
[    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
[    2.352232][    T9]  ret_from_fork+0x4b/0x80
[    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
[    2.352232][    T9]  ret_from_fork_asm+0x1a/0x30
[    2.352232][    T9]  </TASK>
[    2.352232][    T9] Rebooting in 86400 seconds..


syzkaller build log:
go env (err=3D<nil>)
GO111MODULE=3D'auto'
GOARCH=3D'amd64'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFLAGS=3D''
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.=
1-go1.23.7.linux-amd64'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0=
.0.1-go1.23.7.linux-amd64/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.23.7'
GODEBUG=3D''
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GCCGO=3D'gccgo'
GOAMD64=3D'v1'
AR=3D'ar'
CC=3D'gcc'
CXX=3D'g++'
CGO_ENABLED=3D'1'
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build1284445660=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at 0bd6db4180
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sy=
s/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D0bd6db418098e2d98a2edf948b41410d3d9f9e70 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250411-130225'" -o ./b=
in/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"0bd6db418098e2d98a2edf948b41410d3d=
9f9e70\"
/usr/bin/ld: /tmp/ccP81Mp7.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D11a9f368580000


Tested on:

commit:         33035b66 Add linux-next specific files for 20250428
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5748169cc3be99b=
c
dashboard link: https://syzkaller.appspot.com/bug?extid=3D8bb6fd945af4e0ad9=
299
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-=
1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1292d7745800=
00

