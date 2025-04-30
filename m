Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCD67FBA2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001385; cv=none; b=B943nygTyiRv/Z4a+CqGL7MM5Lw7UvJSkT07RzhkhhOBZ8doxdUFeKfe/crtt7iQX0ey3WaH+iFwUg+mflM8upybh6StIr+KMNP6e+sObuOmpu78GqTQPbr9+kCsyOlxOyQCCGX5wwmwYRsRlWFYCvS6dVjZRPsQysIwjNnuo+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001385; c=relaxed/simple;
	bh=D4ipuvvTRnFq1fZD1T1gS73LjmvfI5QzMQgEX+krm+4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JPkAGfMQjCN2M0EZ9Fn1iFC1cY3Ws1VP7wJKgTbprElf/ZW1/mz7MvqGNXDssMhNCCrqETnQuZx5lXs10YS9919hpP31QxEJR4rll5O1yUAbh8EgEoz9cIcr0NmthGo5jYd8f4ef78bcSgWTVvam6C4BLkDylv2uB+eqfRa7TSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85e318dc464so1185487939f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001383; x=1746606183;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9+404P17FS2NoajVpnxSy4AafY+D5a7uV4H/ST5N+o=;
        b=kFXE4dKU1MiBhoyyn9DUHrEkPj3Qx+D2lkJ3zbWKMkAz72Nucx11ba5EI/ln0ddqgF
         OfbNUWfQvZSJp12ODUG9WJmiaj9JMfWhyrHQv51CY+xGLqukq/sIe/SOt2l5/zfEhPzN
         AlbcCO0uAmYANWakkaE2WiPrurPckC/vWK5f2UCD5Z+QxjpYbwqwiDRlPJbTcDFU5E8x
         7Pk+V4VJZ76reomua5Njj6SkrzOL+0ccdtS1XcNN6pjkN9tWnRC5/TEMFplOaHk0pHJ1
         4rQKY8fc2M7QBaWoQ5VCUhegMWSF8B07T0iLfYsFhUcQNEeGFBABsW9ZKclQ5sW6Z9H2
         uZHw==
X-Gm-Message-State: AOJu0Yz1z55b3Ojfmecjaa/IjdltunCPdShaIqZCi5fyNqsux+PpA1Hs
	7GUJbAyHkFrZTNyeJds/PEhevtGhLj/+1/hSzy7HBkkHk2/xulArHDcIX5lZ+vNyL5a7iUNk1F+
	f7ihfIqSdtA+bDQwWs3fuPtp5fK9hXUVXdDfkrGkdbCG5GoQl4fOlq0Y=
X-Google-Smtp-Source: AGHT+IE3xeheXt+/vDlCtGDDnBPyimTQwjec+sMkl7+fMaCiBQHvtqQ3v4Wc1ptBq56FvvSR9ThGQ63vdlcB0tKSW3kl8XxzlghP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:c87:b0:864:64e9:7f75 with SMTP id
 ca18e2360f4ac-86495eedc9fmr279886239f.11.1746001382838; Wed, 30 Apr 2025
 01:23:02 -0700 (PDT)
Date: Wed, 30 Apr 2025 01:23:02 -0700
In-Reply-To: <78798afb-8b11-4229-bd8a-6b441d967a57@amd.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6811dde6.050a0220.39e3a1.0cf3.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, shivankg@amd.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

	Tracing variant of Tasks RCU enabled.
[    1.756197][    T0] rcu: RCU calculated value of scheduler-enlistment de=
lay is 10 jiffies.
[    1.757347][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr=
_cpu_ids=3D2
[    1.758601][    T0] Running RCU synchronous self tests
[    1.759703][    T0] RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_=
cb_adjust=3D1 rcu_task_cpu_ids=3D2.
[    1.761088][    T0] RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu=
_task_cb_adjust=3D1 rcu_task_cpu_ids=3D2.
[    1.898957][    T0] NR_IRQS: 4352, nr_irqs: 440, preallocated irqs: 16
[    1.901185][    T0] rcu: srcu_init: Setting srcu_struct sizes based on c=
ontention.
[    1.902806][    T0] kfence: initialized - using 2097152 bytes for 255 ob=
jects at 0xffff88823be00000-0xffff88823c000000
[    1.905828][    T0] Console: colour VGA+ 80x25
[    1.906677][    T0] printk: legacy console [ttyS0] enabled
[    1.906677][    T0] printk: legacy console [ttyS0] enabled
[    1.908615][    T0] printk: legacy bootconsole [earlyser0] disabled
[    1.908615][    T0] printk: legacy bootconsole [earlyser0] disabled
[    1.910441][    T0] Lock dependency validator: Copyright (c) 2006 Red Ha=
t, Inc., Ingo Molnar
[    1.911593][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    1.912289][    T0] ... MAX_LOCK_DEPTH:          48
[    1.913471][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    1.914174][    T0] ... CLASSHASH_SIZE:          4096
[    1.914891][    T0] ... MAX_LOCKDEP_ENTRIES:     1048576
[    1.915648][    T0] ... MAX_LOCKDEP_CHAINS:      1048576
[    1.916465][    T0] ... CHAINHASH_SIZE:          524288
[    1.917206][    T0]  memory used by lock dependency info: 106625 kB
[    1.918060][    T0]  memory used for stack traces: 8320 kB
[    1.919051][    T0]  per task-struct memory footprint: 1920 bytes
[    1.920079][    T0] mempolicy: Enabling automatic NUMA balancing. Config=
ure with numa_balancing=3D or the kernel.numa_balancing sysctl
[    1.921730][    T0] ACPI: Core revision 20241212
[    1.923482][    T0] APIC: Switch to symmetric I/O mode setup
[    1.924904][    T0] x2apic enabled
[    1.929239][    T0] APIC: Switched APIC routing to: physical x2apic
[    1.936346][    T0] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D0 apic2=3D-1=
 pin2=3D-1
[    1.937802][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x1fb702bab20, max_idle_ns: 440795313305 ns
[    1.939405][    T0] Calibrating delay loop (skipped) preset value.. 4400=
.44 BogoMIPS (lpj=3D22002200)
[    1.941337][    T0] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    1.942346][    T0] Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB=
 4
[    1.949489][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    1.951078][    T0] Spectre V2 : Spectre BHI mitigation: SW BHB clearing=
 on syscall and VM exit
[    1.952604][    T0] Spectre V2 : Mitigation: IBRS
[    1.953272][    T0] Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on=
 context switch and VMEXIT
[    1.954494][    T0] RETBleed: Mitigation: IBRS
[    1.955293][    T0] Spectre V2 : mitigation: Enabling conditional Indire=
ct Branch Prediction Barrier
[    1.956658][    T0] Spectre V2 : User space: Mitigation: STIBP via prctl
[    1.957718][    T0] Speculative Store Bypass: Mitigation: Speculative St=
ore Bypass disabled via prctl
[    1.959430][    T0] MDS: Mitigation: Clear CPU buffers
[    1.960142][    T0] TAA: Mitigation: Clear CPU buffers
[    1.960948][    T0] MMIO Stale Data: Vulnerable: Clear CPU buffers attem=
pted, no microcode
[    1.962237][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floati=
ng point registers'
[    1.963444][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE regist=
ers'
[    1.964804][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX regist=
ers'
[    1.965948][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  2=
56
[    1.966996][    T0] x86/fpu: Enabled xstate features 0x7, context size i=
s 832 bytes, using 'standard' format.
[    2.270147][    T0] Freeing SMP alternatives memory: 132K
[    2.271177][    T0] pid_max: default: 32768 minimum: 301
[    2.272608][    T0] LSM: initializing lsm=3Dlockdown,capability,landlock=
,yama,safesetid,tomoyo,apparmor,bpf,ima,evm
[    2.274518][    T0] landlock: Up and running.
[    2.275138][    T0] Yama: becoming mindful.
[    2.276037][    T0] TOMOYO Linux initialized
[    2.277498][    T0] AppArmor: AppArmor initialized
[    2.279855][    T0] LSM support for eBPF active
[    2.286597][    T0] Dentry cache hash table entries: 1048576 (order: 11,=
 8388608 bytes, vmalloc hugepage)
[    2.291139][    T0] Inode-cache hash table entries: 524288 (order: 10, 4=
194304 bytes, vmalloc hugepage)
[    2.293046][    T0] Mount-cache hash table entries: 16384 (order: 5, 131=
072 bytes, vmalloc)
[    2.294572][    T0] Mountpoint-cache hash table entries: 16384 (order: 5=
, 131072 bytes, vmalloc)
[    2.301308][    T0] Running RCU synchronous self tests
[    2.302327][    T0] Running RCU synchronous self tests
[    2.424383][    T1] smpboot: CPU0: Intel(R) Xeon(R) CPU @ 2.20GHz (famil=
y: 0x6, model: 0x4f, stepping: 0x0)
[    2.428981][    T9] ------------[ cut here ]------------
[    2.429388][    T9] WARNING: CPU: 0 PID: 9 at arch/x86/mm/tlb.c:919 swit=
ch_mm_irqs_off+0x640/0x7c0
[    2.429388][    T9] Modules linked in:
[    2.429388][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6=
.15.0-rc4-next-20250428-syzkaller-00003-g5d98b45ab9df #0 PREEMPT(full)=20
[    2.429388][    T9] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 04/19/2025
[    2.429388][    T9] Workqueue: events once_deferred
[    2.429388][    T9] RIP: 0010:switch_mm_irqs_off+0x640/0x7c0
[    2.429388][    T9] Code: 84 f4 fa ff ff 90 0f 0b 90 e9 eb fa ff ff 90 0=
f 0b 90 e9 84 fe ff ff 90 0f 0b 90 e9 18 fc ff ff 90 0f 0b 90 e9 cb fb ff f=
f 90 <0f> 0b 90 e9 df fb ff ff 89 c8 90 0f 0b 90 e9 3f fd ff ff 90 0f 0b
[    2.429388][    T9] RSP: 0000:ffffc900000e7720 EFLAGS: 00010056
[    2.429388][    T9] RAX: 0000000000000001 RBX: ffff88801a070940 RCX: fff=
fffff8173b01d
[    2.429388][    T9] RDX: 0000000000000000 RSI: 0000000000000008 RDI: fff=
f88801a070940
[    2.429388][    T9] RBP: ffffc900000e77f0 R08: ffff88801a070947 R09: 1ff=
ff1100340e128
[    2.429388][    T9] R10: dffffc0000000000 R11: ffffed100340e129 R12: 1ff=
ff110037d70ab
[    2.429388][    T9] R13: ffffffff8e0467c0 R14: ffff88801beb8000 R15: 000=
0000000000000
[    2.429388][    T9] FS:  0000000000000000(0000) GS:ffff8881260a1000(0000=
) knlGS:0000000000000000
[    2.429388][    T9] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.429388][    T9] CR2: ffff88823ffff000 CR3: 000000001a078000 CR4: 000=
00000003506f0
[    2.429388][    T9] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    2.429388][    T9] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    2.429388][    T9] Call Trace:
[    2.429388][    T9]  <TASK>
[    2.429388][    T9]  ? __pfx_switch_mm_irqs_off+0x10/0x10
[    2.429388][    T9]  ? __text_poke+0x5a4/0x980
[    2.429388][    T9]  ? kasan_check_range+0x29a/0x2b0
[    2.429388][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
[    2.429388][    T9]  unuse_temporary_mm+0x9d/0x100
[    2.429388][    T9]  __text_poke+0x634/0x980
[    2.429388][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
[    2.429388][    T9]  ? __pfx_text_poke_memcpy+0x10/0x10
[    2.429388][    T9]  ? __pfx___text_poke+0x10/0x10
[    2.429388][    T9]  ? rcu_is_watching+0x15/0xb0
[    2.429388][    T9]  ? trace_contention_end+0x39/0x120
[    2.429388][    T9]  smp_text_poke_batch_finish+0x38c/0x1100
[    2.429388][    T9]  ? __pfx___mutex_lock+0x10/0x10
[    2.429388][    T9]  ? __pfx_smp_text_poke_batch_finish+0x10/0x10
[    2.429388][    T9]  ? arch_jump_label_transform_queue+0x97/0x110
[    2.429388][    T9]  ? __jump_label_update+0x37e/0x3a0
[    2.429388][    T9]  arch_jump_label_transform_apply+0x1c/0x30
[    2.429388][    T9]  static_key_disable_cpuslocked+0xc5/0x1b0
[    2.429388][    T9]  static_key_disable+0x1a/0x20
[    2.429388][    T9]  once_deferred+0x6f/0xb0
[    2.429388][    T9]  ? process_scheduled_works+0x9ef/0x17b0
[    2.429388][    T9]  process_scheduled_works+0xade/0x17b0
[    2.429388][    T9]  ? __pfx_process_scheduled_works+0x10/0x10
[    2.429388][    T9]  worker_thread+0x8a0/0xda0
[    2.429388][    T9]  kthread+0x70e/0x8a0
[    2.429388][    T9]  ? __pfx_worker_thread+0x10/0x10
[    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
[    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
[    2.429388][    T9]  ? _raw_spin_unlock_irq+0x23/0x50
[    2.429388][    T9]  ? lockdep_hardirqs_on+0x9c/0x150
[    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
[    2.429388][    T9]  ret_from_fork+0x4b/0x80
[    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
[    2.429388][    T9]  ret_from_fork_asm+0x1a/0x30
[    2.429388][    T9]  </TASK>
[    2.429388][    T9] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    2.429388][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6=
.15.0-rc4-next-20250428-syzkaller-00003-g5d98b45ab9df #0 PREEMPT(full)=20
[    2.429388][    T9] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 04/19/2025
[    2.429388][    T9] Workqueue: events once_deferred
[    2.429388][    T9] Call Trace:
[    2.429388][    T9]  <TASK>
[    2.429388][    T9]  dump_stack_lvl+0x99/0x250
[    2.429388][    T9]  ? __asan_memcpy+0x40/0x70
[    2.429388][    T9]  ? __pfx_dump_stack_lvl+0x10/0x10
[    2.429388][    T9]  ? __pfx__printk+0x10/0x10
[    2.429388][    T9]  panic+0x2db/0x790
[    2.429388][    T9]  ? __pfx_panic+0x10/0x10
[    2.429388][    T9]  ? show_trace_log_lvl+0x4fb/0x550
[    2.429388][    T9]  ? ret_from_fork_asm+0x1a/0x30
[    2.429388][    T9]  __warn+0x31b/0x4b0
[    2.429388][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
[    2.429388][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
[    2.429388][    T9]  report_bug+0x2be/0x4f0
[    2.429388][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
[    2.429388][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
[    2.429388][    T9]  ? switch_mm_irqs_off+0x642/0x7c0
[    2.429388][    T9]  handle_bug+0x84/0x160
[    2.429388][    T9]  exc_invalid_op+0x1a/0x50
[    2.429388][    T9]  asm_exc_invalid_op+0x1a/0x20
[    2.429388][    T9] RIP: 0010:switch_mm_irqs_off+0x640/0x7c0
[    2.429388][    T9] Code: 84 f4 fa ff ff 90 0f 0b 90 e9 eb fa ff ff 90 0=
f 0b 90 e9 84 fe ff ff 90 0f 0b 90 e9 18 fc ff ff 90 0f 0b 90 e9 cb fb ff f=
f 90 <0f> 0b 90 e9 df fb ff ff 89 c8 90 0f 0b 90 e9 3f fd ff ff 90 0f 0b
[    2.429388][    T9] RSP: 0000:ffffc900000e7720 EFLAGS: 00010056
[    2.429388][    T9] RAX: 0000000000000001 RBX: ffff88801a070940 RCX: fff=
fffff8173b01d
[    2.429388][    T9] RDX: 0000000000000000 RSI: 0000000000000008 RDI: fff=
f88801a070940
[    2.429388][    T9] RBP: ffffc900000e77f0 R08: ffff88801a070947 R09: 1ff=
ff1100340e128
[    2.429388][    T9] R10: dffffc0000000000 R11: ffffed100340e129 R12: 1ff=
ff110037d70ab
[    2.429388][    T9] R13: ffffffff8e0467c0 R14: ffff88801beb8000 R15: 000=
0000000000000
[    2.429388][    T9]  ? switch_mm_irqs_off+0x21d/0x7c0
[    2.429388][    T9]  ? __pfx_switch_mm_irqs_off+0x10/0x10
[    2.429388][    T9]  ? __text_poke+0x5a4/0x980
[    2.429388][    T9]  ? kasan_check_range+0x29a/0x2b0
[    2.429388][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
[    2.429388][    T9]  unuse_temporary_mm+0x9d/0x100
[    2.429388][    T9]  __text_poke+0x634/0x980
[    2.429388][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
[    2.429388][    T9]  ? __pfx_text_poke_memcpy+0x10/0x10
[    2.429388][    T9]  ? __pfx___text_poke+0x10/0x10
[    2.429388][    T9]  ? rcu_is_watching+0x15/0xb0
[    2.429388][    T9]  ? trace_contention_end+0x39/0x120
[    2.429388][    T9]  smp_text_poke_batch_finish+0x38c/0x1100
[    2.429388][    T9]  ? __pfx___mutex_lock+0x10/0x10
[    2.429388][    T9]  ? __pfx_smp_text_poke_batch_finish+0x10/0x10
[    2.429388][    T9]  ? arch_jump_label_transform_queue+0x97/0x110
[    2.429388][    T9]  ? __jump_label_update+0x37e/0x3a0
[    2.429388][    T9]  arch_jump_label_transform_apply+0x1c/0x30
[    2.429388][    T9]  static_key_disable_cpuslocked+0xc5/0x1b0
[    2.429388][    T9]  static_key_disable+0x1a/0x20
[    2.429388][    T9]  once_deferred+0x6f/0xb0
[    2.429388][    T9]  ? process_scheduled_works+0x9ef/0x17b0
[    2.429388][    T9]  process_scheduled_works+0xade/0x17b0
[    2.429388][    T9]  ? __pfx_process_scheduled_works+0x10/0x10
[    2.429388][    T9]  worker_thread+0x8a0/0xda0
[    2.429388][    T9]  kthread+0x70e/0x8a0
[    2.429388][    T9]  ? __pfx_worker_thread+0x10/0x10
[    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
[    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
[    2.429388][    T9]  ? _raw_spin_unlock_irq+0x23/0x50
[    2.429388][    T9]  ? lockdep_hardirqs_on+0x9c/0x150
[    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
[    2.429388][    T9]  ret_from_fork+0x4b/0x80
[    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
[    2.429388][    T9]  ret_from_fork_asm+0x1a/0x30
[    2.429388][    T9]  </TASK>
[    2.429388][    T9] Rebooting in 86400 seconds..


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
 -ffile-prefix-map=3D/tmp/go-build1460608260=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/ccRsxVxg.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D11c3d774580000


Tested on:

commit:         5d98b45a Revert "x86/efi: Make efi_enter/leave_mm() us..
git tree:       https://github.com/shivankgarg98/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5748169cc3be99b=
c
dashboard link: https://syzkaller.appspot.com/bug?extid=3D8bb6fd945af4e0ad9=
299
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-=
1~exp1~20250402004600.97), Debian LLD 20.1.2

Note: no patches were applied.
