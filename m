Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509441B87E2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879629; cv=none; b=K2iQn9oY0tJTynOM7aXOffKDaQ++MbmKyxwQVLE0LdwCyqZSzwwjSGXYWMBlqFJAePBogUklNzv4d+SnxtP95So64rPoQgAsJMa0yiYi93/0SVouKE7pzh5QUPlXG4sswCxZSbeoNzbEtdrwKFuE3VuzebADy/jN6t0QAA9a/I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879629; c=relaxed/simple;
	bh=+aAtSay8F/hpLva4TaGt7BM4LpNdoKJOlknLijKdlto=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LNkkaSC8zeLAeUKKrxDXpayV7iRh9aXGUCE/6YcitvwYwwFBHlcCQxkZ5DzKgHbCnPgDvGeR3tlW+vc3U2MSEouQTsry+w8ZOLeHe9FohPiuiXJNyNBJ/3Gw3ZEWaLQ+7dPNP7g3csWQ1W+VLUku3E7pl8EkEu7EfSbBcCQRWQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d817cf6e72so5651035ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879626; x=1745484426;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6elf1Co+y5uicUbwOZw4K+kLsTMX1wXmczsFW31DvRo=;
        b=boLazVhm0GXh9lSi0imZtuMAUbFQxQeJ/rVNU2cwOLNHrycD1ZRvQ9weG7nsLQC2yf
         X0kUOOIcxEk0dBVfsPwtFPDHcZ0baom+EWQHgBSjMOa3dwC5DDF9V9YuJPOLRA5/J6qE
         gS//+ppvG7LDJ/CSPFaaMVHq2mZkWMD1fJchh7/kCHFStBE0afUYl3Rjm6AtyaUpm1d0
         ntc7PnMQOrLauCoaaE8ybIKFNi4jG8p4x+gdegagayntMatZsle3JWCzoOQL3XJz+Ywo
         +akxV1SBNQxtcU+KPdwJtj1gtfhenUZTTDAHlPBHttbKyd5Zc1blOnlDHxuETmSv4529
         AKYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8Rb6r6v62q8XSVxU7xtZuXHIshxJ7qjF/Mh3jseFfDSPnsBT5q+AWs6T5o399ybRSIVkWxHnRfjE5gUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK7s3v6IENsYZIiZoYblXprV7h14qcHjZfFF6DLOGxAUDEZHuz
	FJ1ITggcU1cRdPARCuUVOcYunFoEt8BkNb34+F8inH2ZOIypHxM453sosCe6pFGUJxbud6GHeMF
	2DawxHrY3QZ5/7Ezdt8+gnCoSfIqdfoVfOZd8w1NBmGF97B4/Scjefe4=
X-Google-Smtp-Source: AGHT+IFmYqQD/SJTjUnM54wVFqxJZJkYfJVm3MC9mvtyT1QW2gt+0kp7ud+/6d/EsTLOTHPLtRsFPYLJfAv5z49h8kv4Dwpbz9Dk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1949:b0:3d5:890b:d9e1 with SMTP id
 e9e14a558f8ab-3d81b661d23mr18618945ab.1.1744879626433; Thu, 17 Apr 2025
 01:47:06 -0700 (PDT)
Date: Thu, 17 Apr 2025 01:47:06 -0700
In-Reply-To: <20250417060630.197278-1-shivankg@amd.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6800c00a.050a0220.5cdb3.000f.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, apopple@nvidia.com, david@redhat.com, 
	donettom@linux.ibm.com, jane.chu@oracle.com, 
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, shaggy@kernel.org, shivankg@amd.com, 
	syzkaller-bugs@googlegroups.com, wangkefeng.wang@huawei.com, 
	willy@infradead.org, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

tes for 255 objects at 0xffff88823be00000-0xffff88823c000000
[    1.925837][    T0] Console: colour VGA+ 80x25
[    1.926854][    T0] printk: legacy console [ttyS0] enabled
[    1.926854][    T0] printk: legacy console [ttyS0] enabled
[    1.928807][    T0] printk: legacy bootconsole [earlyser0] disabled
[    1.928807][    T0] printk: legacy bootconsole [earlyser0] disabled
[    1.931060][    T0] Lock dependency validator: Copyright (c) 2006 Red Ha=
t, Inc., Ingo Molnar
[    1.932421][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    1.933470][    T0] ... MAX_LOCK_DEPTH:          48
[    1.934392][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    1.935279][    T0] ... CLASSHASH_SIZE:          4096
[    1.936068][    T0] ... MAX_LOCKDEP_ENTRIES:     1048576
[    1.937188][    T0] ... MAX_LOCKDEP_CHAINS:      1048576
[    1.938022][    T0] ... CHAINHASH_SIZE:          524288
[    1.938854][    T0]  memory used by lock dependency info: 106625 kB
[    1.940170][    T0]  memory used for stack traces: 8320 kB
[    1.941640][    T0]  per task-struct memory footprint: 1920 bytes
[    1.942814][    T0] mempolicy: Enabling automatic NUMA balancing. Config=
ure with numa_balancing=3D or the kernel.numa_balancing sysctl
[    1.945209][    T0] ACPI: Core revision 20241212
[    1.946927][    T0] APIC: Switch to symmetric I/O mode setup
[    1.948578][    T0] x2apic enabled
[    1.953337][    T0] APIC: Switched APIC routing to: physical x2apic
[    1.960868][    T0] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D0 apic2=3D-1=
 pin2=3D-1
[    1.963220][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x1fb6f76ef03, max_idle_ns: 440795255960 ns
[    1.965573][    T0] Calibrating delay loop (skipped) preset value.. 4400=
.41 BogoMIPS (lpj=3D22002080)
[    1.976248][    T0] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    1.977543][    T0] Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB=
 4
[    1.978831][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    1.981126][    T0] Spectre V2 : Spectre BHI mitigation: SW BHB clearing=
 on syscall and VM exit
[    1.983233][    T0] Spectre V2 : Mitigation: IBRS
[    1.983963][    T0] Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on=
 context switch and VMEXIT
[    1.985668][    T0] RETBleed: Mitigation: IBRS
[    1.986468][    T0] Spectre V2 : mitigation: Enabling conditional Indire=
ct Branch Prediction Barrier
[    1.987833][    T0] Spectre V2 : User space: Mitigation: STIBP via prctl
[    1.989023][    T0] Speculative Store Bypass: Mitigation: Speculative St=
ore Bypass disabled via prctl
[    1.990381][    T0] MDS: Mitigation: Clear CPU buffers
[    1.991105][    T0] TAA: Mitigation: Clear CPU buffers
[    1.992276][    T0] MMIO Stale Data: Vulnerable: Clear CPU buffers attem=
pted, no microcode
[    1.993752][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floati=
ng point registers'
[    1.994963][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE regist=
ers'
[    1.995572][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX regist=
ers'
[    1.996652][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  2=
56
[    1.997837][    T0] x86/fpu: Enabled xstate features 0x7, context size i=
s 832 bytes, using 'standard' format.
[    2.295143][    T0] Freeing SMP alternatives memory: 132K
[    2.295587][    T0] pid_max: default: 32768 minimum: 301
[    2.297541][    T0] LSM: initializing lsm=3Dlockdown,capability,landlock=
,yama,safesetid,tomoyo,apparmor,bpf,ima,evm
[    2.300386][    T0] landlock: Up and running.
[    2.301189][    T0] Yama: becoming mindful.
[    2.302225][    T0] TOMOYO Linux initialized
[    2.303858][    T0] AppArmor: AppArmor initialized
[    2.307123][    T0] LSM support for eBPF active
[    2.314189][    T0] Dentry cache hash table entries: 1048576 (order: 11,=
 8388608 bytes, vmalloc hugepage)
[    2.318576][    T0] Inode-cache hash table entries: 524288 (order: 10, 4=
194304 bytes, vmalloc hugepage)
[    2.320554][    T0] Mount-cache hash table entries: 16384 (order: 5, 131=
072 bytes, vmalloc)
[    2.322439][    T0] Mountpoint-cache hash table entries: 16384 (order: 5=
, 131072 bytes, vmalloc)
[    2.330329][    T0] Running RCU synchronous self tests
[    2.331252][    T0] Running RCU synchronous self tests
[    2.453357][    T1] smpboot: CPU0: Intel(R) Xeon(R) CPU @ 2.20GHz (famil=
y: 0x6, model: 0x4f, stepping: 0x0)
[    2.455556][    T9] ------------[ cut here ]------------
[    2.455556][    T9] WARNING: CPU: 0 PID: 9 at arch/x86/mm/tlb.c:919 swit=
ch_mm_irqs_off+0x686/0x810
[    2.455556][    T9] Modules linked in:
[    2.455556][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6=
.15.0-rc2-next-20250416-syzkaller-04531-g07246f14ea38 #0 PREEMPT(full)=20
[    2.455556][    T9] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 02/12/2025
[    2.455556][    T9] Workqueue: events once_deferred
[    2.455556][    T9] RIP: 0010:switch_mm_irqs_off+0x686/0x810
[    2.455556][    T9] Code: 90 41 f7 c5 00 08 00 00 0f 84 ee fa ff ff 90 0=
f 0b 90 e9 e5 fa ff ff 90 0f 0b 90 e9 76 fe ff ff 90 0f 0b 90 e9 cc fb ff f=
f 90 <0f> 0b 90 4d 39 f4 0f 85 eb fb ff ff e9 31 fc ff ff 90 0f 0b 90 e9
[    2.455556][    T9] RSP: 0000:ffffc900000e7680 EFLAGS: 00010056
[    2.455556][    T9] RAX: 0000000000000001 RBX: 0000000000000000 RCX: fff=
fffff816ffd4d
[    2.455556][    T9] RDX: 0000000000000000 RSI: 0000000000000008 RDI: fff=
f88801b070940
[    2.455556][    T9] RBP: ffffc900000e7750 R08: ffff88801b070947 R09: 1ff=
ff1100360e128
[    2.455556][    T9] R10: dffffc0000000000 R11: ffffed100360e129 R12: fff=
fffff8ee492c0
[    2.455556][    T9] R13: ffff88801b070940 R14: ffffffff8ee492c0 R15: 000=
0000000000000
[    2.455556][    T9] FS:  0000000000000000(0000) GS:ffff888124f9c000(0000=
) knlGS:0000000000000000
[    2.455556][    T9] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.455556][    T9] CR2: ffff88823ffff000 CR3: 000000001b078000 CR4: 000=
00000003506f0
[    2.455556][    T9] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    2.455556][    T9] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    2.455556][    T9] Call Trace:
[    2.455556][    T9]  <TASK>
[    2.455556][    T9]  ? __pfx_switch_mm_irqs_off+0x10/0x10
[    2.455556][    T9]  ? __text_poke+0x6bb/0xb40
[    2.455556][    T9]  ? kasan_check_range+0x28f/0x2a0
[    2.455556][    T9]  ? serial8250_isa_init_ports+0x6b/0x110
[    2.455556][    T9]  unuse_temporary_mm+0x9f/0x100
[    2.455556][    T9]  __text_poke+0x7b6/0xb40
[    2.455556][    T9]  ? serial8250_isa_init_ports+0x6b/0x110
[    2.455556][    T9]  ? __pfx_text_poke_memcpy+0x10/0x10
[    2.455556][    T9]  ? __pfx___text_poke+0x10/0x10
[    2.455556][    T9]  ? __pfx___mutex_trylock_common+0x10/0x10
[    2.455556][    T9]  ? __pfx___might_resched+0x10/0x10
[    2.455556][    T9]  ? rcu_is_watching+0x15/0xb0
[    2.455556][    T9]  smp_text_poke_batch_finish+0x3e7/0x12c0
[    2.455556][    T9]  ? arch_jump_label_transform_apply+0x17/0x30
[    2.455556][    T9]  ? __pfx___mutex_lock+0x10/0x10
[    2.455556][    T9]  ? __pfx_smp_text_poke_batch_finish+0x10/0x10
[    2.455556][    T9]  ? arch_jump_label_transform_queue+0x9b/0x100
[    2.455556][    T9]  ? __jump_label_update+0x387/0x3b0
[    2.455556][    T9]  arch_jump_label_transform_apply+0x1c/0x30
[    2.455556][    T9]  static_key_disable_cpuslocked+0xd2/0x1c0
[    2.455556][    T9]  static_key_disable+0x1a/0x20
[    2.455556][    T9]  once_deferred+0x70/0xb0
[    2.455556][    T9]  ? process_scheduled_works+0x9cb/0x18e0
[    2.455556][    T9]  process_scheduled_works+0xac3/0x18e0
[    2.455556][    T9]  ? __pfx_process_scheduled_works+0x10/0x10
[    2.455556][    T9]  ? assign_work+0x367/0x3d0
[    2.455556][    T9]  worker_thread+0x870/0xd50
[    2.455556][    T9]  ? __kthread_parkme+0x1a8/0x200
[    2.455556][    T9]  ? __pfx_worker_thread+0x10/0x10
[    2.455556][    T9]  kthread+0x7b7/0x940
[    2.455556][    T9]  ? __pfx_worker_thread+0x10/0x10
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ? _raw_spin_unlock_irq+0x23/0x50
[    2.455556][    T9]  ? lockdep_hardirqs_on+0x9d/0x150
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ret_from_fork+0x4b/0x80
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ret_from_fork_asm+0x1a/0x30
[    2.455556][    T9]  </TASK>
[    2.455556][    T9] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    2.455556][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6=
.15.0-rc2-next-20250416-syzkaller-04531-g07246f14ea38 #0 PREEMPT(full)=20
[    2.455556][    T9] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 02/12/2025
[    2.455556][    T9] Workqueue: events once_deferred
[    2.455556][    T9] Call Trace:
[    2.455556][    T9]  <TASK>
[    2.455556][    T9]  dump_stack_lvl+0x241/0x360
[    2.455556][    T9]  ? __pfx_dump_stack_lvl+0x10/0x10
[    2.455556][    T9]  ? __pfx__printk+0x10/0x10
[    2.455556][    T9]  ? vscnprintf+0x5d/0x90
[    2.455556][    T9]  panic+0x349/0x880
[    2.455556][    T9]  ? __warn+0x174/0x4d0
[    2.455556][    T9]  ? __pfx_panic+0x10/0x10
[    2.455556][    T9]  ? ret_from_fork_asm+0x1a/0x30
[    2.455556][    T9]  __warn+0x344/0x4d0
[    2.455556][    T9]  ? switch_mm_irqs_off+0x686/0x810
[    2.455556][    T9]  report_bug+0x2b3/0x500
[    2.455556][    T9]  ? switch_mm_irqs_off+0x686/0x810
[    2.455556][    T9]  ? switch_mm_irqs_off+0x686/0x810
[    2.455556][    T9]  ? switch_mm_irqs_off+0x688/0x810
[    2.455556][    T9]  handle_bug+0x89/0x170
[    2.455556][    T9]  exc_invalid_op+0x1a/0x50
[    2.455556][    T9]  asm_exc_invalid_op+0x1a/0x20
[    2.455556][    T9] RIP: 0010:switch_mm_irqs_off+0x686/0x810
[    2.455556][    T9] Code: 90 41 f7 c5 00 08 00 00 0f 84 ee fa ff ff 90 0=
f 0b 90 e9 e5 fa ff ff 90 0f 0b 90 e9 76 fe ff ff 90 0f 0b 90 e9 cc fb ff f=
f 90 <0f> 0b 90 4d 39 f4 0f 85 eb fb ff ff e9 31 fc ff ff 90 0f 0b 90 e9
[    2.455556][    T9] RSP: 0000:ffffc900000e7680 EFLAGS: 00010056
[    2.455556][    T9] RAX: 0000000000000001 RBX: 0000000000000000 RCX: fff=
fffff816ffd4d
[    2.455556][    T9] RDX: 0000000000000000 RSI: 0000000000000008 RDI: fff=
f88801b070940
[    2.455556][    T9] RBP: ffffc900000e7750 R08: ffff88801b070947 R09: 1ff=
ff1100360e128
[    2.455556][    T9] R10: dffffc0000000000 R11: ffffed100360e129 R12: fff=
fffff8ee492c0
[    2.455556][    T9] R13: ffff88801b070940 R14: ffffffff8ee492c0 R15: 000=
0000000000000
[    2.455556][    T9]  ? switch_mm_irqs_off+0x26d/0x810
[    2.455556][    T9]  ? __pfx_switch_mm_irqs_off+0x10/0x10
[    2.455556][    T9]  ? __text_poke+0x6bb/0xb40
[    2.455556][    T9]  ? kasan_check_range+0x28f/0x2a0
[    2.455556][    T9]  ? serial8250_isa_init_ports+0x6b/0x110
[    2.455556][    T9]  unuse_temporary_mm+0x9f/0x100
[    2.455556][    T9]  __text_poke+0x7b6/0xb40
[    2.455556][    T9]  ? serial8250_isa_init_ports+0x6b/0x110
[    2.455556][    T9]  ? __pfx_text_poke_memcpy+0x10/0x10
[    2.455556][    T9]  ? __pfx___text_poke+0x10/0x10
[    2.455556][    T9]  ? __pfx___mutex_trylock_common+0x10/0x10
[    2.455556][    T9]  ? __pfx___might_resched+0x10/0x10
[    2.455556][    T9]  ? rcu_is_watching+0x15/0xb0
[    2.455556][    T9]  smp_text_poke_batch_finish+0x3e7/0x12c0
[    2.455556][    T9]  ? arch_jump_label_transform_apply+0x17/0x30
[    2.455556][    T9]  ? __pfx___mutex_lock+0x10/0x10
[    2.455556][    T9]  ? __pfx_smp_text_poke_batch_finish+0x10/0x10
[    2.455556][    T9]  ? arch_jump_label_transform_queue+0x9b/0x100
[    2.455556][    T9]  ? __jump_label_update+0x387/0x3b0
[    2.455556][    T9]  arch_jump_label_transform_apply+0x1c/0x30
[    2.455556][    T9]  static_key_disable_cpuslocked+0xd2/0x1c0
[    2.455556][    T9]  static_key_disable+0x1a/0x20
[    2.455556][    T9]  once_deferred+0x70/0xb0
[    2.455556][    T9]  ? process_scheduled_works+0x9cb/0x18e0
[    2.455556][    T9]  process_scheduled_works+0xac3/0x18e0
[    2.455556][    T9]  ? __pfx_process_scheduled_works+0x10/0x10
[    2.455556][    T9]  ? assign_work+0x367/0x3d0
[    2.455556][    T9]  worker_thread+0x870/0xd50
[    2.455556][    T9]  ? __kthread_parkme+0x1a8/0x200
[    2.455556][    T9]  ? __pfx_worker_thread+0x10/0x10
[    2.455556][    T9]  kthread+0x7b7/0x940
[    2.455556][    T9]  ? __pfx_worker_thread+0x10/0x10
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ? _raw_spin_unlock_irq+0x23/0x50
[    2.455556][    T9]  ? lockdep_hardirqs_on+0x9d/0x150
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ret_from_fork+0x4b/0x80
[    2.455556][    T9]  ? __pfx_kthread+0x10/0x10
[    2.455556][    T9]  ret_from_fork_asm+0x1a/0x30
[    2.455556][    T9]  </TASK>
[    2.455556][    T9] Rebooting in 86400 seconds..


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
GOMODCACHE=3D'/syzkaller/jobs/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/syzkaller/jobs/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.1-=
go1.23.7.linux-amd64'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/syzkaller/jobs/linux/gopath/pkg/mod/golang.org/toolchain@v0.0=
.1-go1.23.7.linux-amd64/pkg/tool/linux_amd64'
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
GOMOD=3D'/syzkaller/jobs/linux/gopath/src/github.com/google/syzkaller/go.mo=
d'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build1450323150=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/ccXxW6Eo.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D14fe3a3f980000


Tested on:

commit:         07246f14 jfs: implement migrate_folio for jfs_metapage..
git tree:       https://github.com/AMDESE/linux-mm.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D361d80851af850e=
d
dashboard link: https://syzkaller.appspot.com/bug?extid=3D8bb6fd945af4e0ad9=
299
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40

Note: no patches were applied.
