Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A648A6EB79
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226565; cv=none; b=CLBzMcQcYKedE323dpkkRYBO0qRg6gAoVfUPSqu2pkL/jL4E1SIMXCn9fX/cv+8nU9esgRbDE2LAeFG1jGzAeL7amiHmz+ReIsSerCSMgkTmhHNr3XRQOsY3XLWqRBLozjG4sgCcwpeLmheQ4W/Z9bhJNs5o+whjOty8TW8PhPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226565; c=relaxed/simple;
	bh=GI4y84H9hbLWsfatmF5ShCL3UJ/fJkdtQJF6V+CBzt4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rx+ZFagKl+gIbM8ipkj93U9GuiAskItWkSEYQLRKSX+Xd3Q+9Zx/wcL+D8qa3ooLGzkWf6JMkhj35eP+bwUw22se2RHp43B8iLQjI/m70Zxg2oCJcuJyzNja0+s+XRrBT87gbFJCNqS/3OQOM+sINUU0nTyBgx8+s8YI6c+RPIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d922570570so36327005ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 15:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226562; x=1746831362;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTc/5eoWwhySOzXr/VfoN6wUm5/QDtSyrjEC+t5feI4=;
        b=ebj0BHknEgHyZG4BDyHekNwgVA8PmDitng7EkEErUrMjg+gvVDGL+QAfObb4kzDwqo
         58qn/NlBLhUYhChiuqyjVBpPEdx+XqKM8FH1SnaE1Z11LnrhSO+crRaNxyYBUKDdn2Fs
         /YSszrY40ciOuVGCOzy30kZx/NynK8UQkvZhAHNTM+fgUHi9uqnmWv1I2ATDChatl5C0
         l/Xwr9zQ8Cjt22xpI7bRw7GynuyRM1/H3kOaUsgMEGSslS41+PpSE5aSBfc/JKLWlyK2
         vhUMMCLFQtfenHqpaDO0gXBvda+yDjw6nCrbzXRMB7xyYI+C82SMg/aq8tErtiaNGgHy
         8cCA==
X-Forwarded-Encrypted: i=1; AJvYcCVBS2GzTFi23Q2wUuyh0faWIQ8C0sG2tFGWN6qRtxN8FtMKv51MIfgVn0hzUmaC005qTFWUYrqGIJFpOmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFmPpwEiOfqKagDxHVsj9FVwwYI0uQPOB0zI4ldk0H5LjLNiwg
	MCkDv1q7ZzZ99NI+15t739Kmis5ZpR1a8OuSZIRh5E/MJeFrn9Yw+U9mEmNdeC1XnMvvfmqFhTq
	OOgFNSiovumSN7vhvhC+sL0yRMdWqK6esDvaystLfB2hwkgQq/RuaQi8=
X-Google-Smtp-Source: AGHT+IE4ZiPK/rvIxf6AKtIWfR7ynVlSqVfbfAZgaE/Ab4L+ho37+JCeJWYUy15+X0URJC4v76hRzpyqyw38u3+ASPpwspsGDa+W
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2292:b0:3d0:47cf:869c with SMTP id
 e9e14a558f8ab-3d97c253bccmr52946935ab.19.1746226562633; Fri, 02 May 2025
 15:56:02 -0700 (PDT)
Date: Fri, 02 May 2025 15:56:02 -0700
In-Reply-To: <20250502223351.1409-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68154d82.050a0220.11da1b.0003.GAE@google.com>
Subject: Re: [syzbot] [mm?] BUG: Bad page state in page_cache_ra_order
From: syzbot <syzbot+7b3842775c9ce6b69efc@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

068818][    T0] ACPI: RSDP 0x00000000000F5190 000014 (v00 BOCHS )
[    0.072899][    T0] ACPI: RSDT 0x000000007FFE2925 000048 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.078676][    T0] ACPI: FACP 0x000000007FFE1B2C 0000F4 (v03 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.084482][    T0] ACPI: DSDT 0x000000007FFDF040 002AEC (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.090663][    T0] ACPI: FACS 0x000000007FFDF000 000040
[    0.094100][    T0] ACPI: APIC 0x000000007FFE1C20 0000B0 (v03 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.099885][    T0] ACPI: HPET 0x000000007FFE1CD0 000038 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.105824][    T0] ACPI: SRAT 0x000000007FFE1D08 000178 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.111602][    T0] ACPI: MCFG 0x000000007FFE1E80 00003C (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.117336][    T0] ACPI: DMAR 0x000000007FFE1EBC 0000C0 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.123170][    T0] ACPI: SSDT 0x000000007FFE1F7C 0008A1 (v01 BOCHS  NVD=
IMM   00000001 BXPC 00000001)
[    0.128948][    T0] ACPI: NFIT 0x000000007FFE281D 0000E0 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.134762][    T0] ACPI: WAET 0x000000007FFE28FD 000028 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.140519][    T0] ACPI: Reserving FACP table memory at [mem 0x7ffe1b2c=
-0x7ffe1c1f]
[    0.145407][    T0] ACPI: Reserving DSDT table memory at [mem 0x7ffdf040=
-0x7ffe1b2b]
[    0.150272][    T0] ACPI: Reserving FACS table memory at [mem 0x7ffdf000=
-0x7ffdf03f]
[    0.155103][    T0] ACPI: Reserving APIC table memory at [mem 0x7ffe1c20=
-0x7ffe1ccf]
[    0.159951][    T0] ACPI: Reserving HPET table memory at [mem 0x7ffe1cd0=
-0x7ffe1d07]
[    0.164803][    T0] ACPI: Reserving SRAT table memory at [mem 0x7ffe1d08=
-0x7ffe1e7f]
[    0.169688][    T0] ACPI: Reserving MCFG table memory at [mem 0x7ffe1e80=
-0x7ffe1ebb]
[    0.174515][    T0] ACPI: Reserving DMAR table memory at [mem 0x7ffe1ebc=
-0x7ffe1f7b]
[    0.179372][    T0] ACPI: Reserving SSDT table memory at [mem 0x7ffe1f7c=
-0x7ffe281c]
[    0.184230][    T0] ACPI: Reserving NFIT table memory at [mem 0x7ffe281d=
-0x7ffe28fc]
[    0.189069][    T0] ACPI: Reserving WAET table memory at [mem 0x7ffe28fd=
-0x7ffe2924]
[    0.194370][    T0] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0x0009ffff]
[    0.198626][    T0] ACPI: SRAT: Node 0 PXM 0 [mem 0x00100000-0x7fffffff]
[    0.202892][    T0] ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x17ffffff=
f]
[    0.207289][    T0] ACPI: SRAT: Node 0 PXM 0 [mem 0x180000000-0x183fffff=
f] non-volatile
[    0.212410][    T0] ACPI: SRAT: Node 0 PXM 0 [mem 0x180000000-0x57ffffff=
f] hotplug
[    0.217205][    T0] NUMA: Node 0 [mem 0x00001000-0x0009ffff] + [mem 0x00=
100000-0x7fffffff] -> [mem 0x00001000-0x7fffffff]
[    0.224074][    T0] NUMA: Node 0 [mem 0x00001000-0x7fffffff] + [mem 0x10=
0000000-0x17fffffff] -> [mem 0x00001000-0x17fffffff]
[    0.231124][    T0] Faking node 0 at [mem 0x0000000000001000-0x00000000f=
fffffff] (4095MB)
[    0.236269][    T0] Faking node 1 at [mem 0x0000000100000000-0x000000017=
fffffff] (2048MB)
[    0.241797][    T0] NODE_DATA(0) allocated [mem 0x7ffd7400-0x7ffdcfff]
[    0.245886][    T0] NODE_DATA(1) allocated [mem 0x17fff7400-0x17fffcfff]
[    0.266117][    T0] Zone ranges:
[    0.268234][    T0]   DMA      [mem 0x0000000000001000-0x0000000000fffff=
f]
[    0.272595][    T0]   DMA32    [mem 0x0000000001000000-0x00000000fffffff=
f]
[    0.276920][    T0]   Normal   [mem 0x0000000100000000-0x000000017ffffff=
f]
[    0.281265][    T0]   Device   empty
[    0.283523][    T0] Movable zone start for each node
[    0.286649][    T0] Early memory node ranges
[    0.289362][    T0]   node   0: [mem 0x0000000000001000-0x000000000009ef=
ff]
[    0.293795][    T0]   node   0: [mem 0x0000000000100000-0x000000007ffdcf=
ff]
[    0.298212][    T0]   node   1: [mem 0x0000000100000000-0x000000017fffff=
ff]
[    0.302637][    T0] Initmem setup node 0 [mem 0x0000000000001000-0x00000=
0007ffdcfff]
[    0.307549][    T0] Initmem setup node 1 [mem 0x0000000100000000-0x00000=
0017fffffff]
[    0.312485][    T0] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.316851][    T0] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.372092][    T0] On node 1, zone Normal: 35 pages in unavailable rang=
es
[    0.537077][    T0] kasan: KernelAddressSanitizer initialized
[    0.548737][    T0] ACPI: PM-Timer IO Port: 0x608
[    0.552729][    T0] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
[    0.558491][    T0] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000=
, GSI 0-23
[    0.564712][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl =
dfl)
[    0.570522][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high=
 level)
[    0.576498][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high=
 level)
[    0.582531][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 hi=
gh level)
[    0.588710][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 hi=
gh level)
[    0.594796][    T0] ACPI: Using ACPI (MADT) for SMP configuration inform=
ation
[    0.600603][    T0] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.605220][    T0] TSC deadline timer available
[    0.608936][    T0] CPU topo: Max. logical packages:   2
[    0.613282][    T0] CPU topo: Max. logical dies:       2
[    0.617554][    T0] CPU topo: Max. dies per package:   1
[    0.621924][    T0] CPU topo: Max. threads per core:   2
[    0.626307][    T0] CPU topo: Num. cores per package:     2
[    0.630942][    T0] CPU topo: Num. threads per package:   4
[    0.635434][    T0] CPU topo: Allowing 4 present CPUs plus 4 hotplug CPU=
s
[    0.641189][    T0] kvm-guest: APIC: eoi() replaced with kvm_guest_apic_=
eoi_write()
[    0.647680][    T0] kvm-guest: KVM setup pv remote TLB flush
[    0.652398][    T0] kvm-guest: setup PV sched yield
[    0.656549][    T0] PM: hibernation: Registered nosave memory: [mem 0x00=
000000-0x00000fff]
[    0.663361][    T0] PM: hibernation: Registered nosave memory: [mem 0x00=
09f000-0x000fffff]
[    0.670164][    T0] PM: hibernation: Registered nosave memory: [mem 0x7f=
fdd000-0xffffffff]
[    0.677174][    T0] [mem 0xc0000000-0xfed1bfff] available for PCI device=
s
[    0.682102][    T0] Booting paravirtualized kernel on KVM
[    0.685781][    T0] clocksource: refined-jiffies: mask: 0xffffffff max_c=
ycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.747592][    T0] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids=
:8 nr_node_ids:2
[    0.755074][    T0] percpu: Embedded 69 pages/cpu s245512 r8192 d28920 u=
1048576
[    0.760109][    T0] kvm-guest: PV spinlocks enabled
[    0.763196][    T0] PV qspinlock hash table entries: 256 (order: 0, 4096=
 bytes, linear)
[    0.768644][    T0] Kernel command line: earlyprintk=3Dserial net.ifname=
s=3D0 sysctl.kernel.hung_task_all_cpu_backtrace=3D1 ima_policy=3Dtcb nf-con=
ntrack-ftp.ports=3D20000 nf-conntrack-tftp.ports=3D20000 nf-conntrack-sip.p=
orts=3D20000 nf-conntrack-irc.ports=3D20000 nf-conntrack-sane.ports=3D20000=
 binder.debug_mask=3D0 rcupdate.rcu_expedited=3D1 rcupdate.rcu_cpu_stall_cp=
utime=3D1 no_hash_pointers page_owner=3Don sysctl.vm.nr_hugepages=3D4 sysct=
l.vm.nr_overcommit_hugepages=3D4 secretmem.enable=3D1 sysctl.max_rcu_stall_=
to_panic=3D1 msr.allow_writes=3Doff coredump_filter=3D0xffff root=3D/dev/sd=
a console=3DttyS0 vsyscall=3Dnative numa=3Dfake=3D2 kvm-intel.nested=3D1 sp=
ec_store_bypass_disable=3Dprctl nopcid vivid.n_devs=3D64 vivid.multiplanar=
=3D1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,=
1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2 netrom.nr_ndevs=3D3=
2 rose.rose_ndevs=3D32 smp.csd_lock_timeout=3D100000 watchdog_thresh=3D55 w=
orkqueue.watchdog_thresh=3D140 sysctl.net.core.netdev_unregister_timeout_se=
cs=3D140 dummy_hcd.num=3D32 max_loop=3D32 nbds_max=3D32 panic_on_warn
[    0.773120][    T0] Unknown kernel command line parameters "spec_store_b=
ypass_disable=3Dprctl nbds_max=3D32", will be passed to user space.
[    0.841187][    T0] random: crng init done
[    0.843925][    T0] printk: log buffer data + meta data: 262144 + 917504=
 =3D 1179648 bytes
[    0.850451][    T0] software IO TLB: area num 8.
[    0.877944][    T0] Fallback order for Node 0: 0 1=20
[    0.877964][    T0] Fallback order for Node 1: 1 0=20
[    0.877978][    T0] Built 2 zonelists, mobility grouping on.  Total page=
s: 1048443
[    0.890242][    T0] Policy zone: Normal
[    0.893142][    T0] mem auto-init: stack:all(zero), heap alloc:on, heap =
free:off
[    0.897550][    T0] stackdepot: allocating hash table via alloc_large_sy=
stem_hash
[    0.902260][    T0] stackdepot hash table entries: 1048576 (order: 12, 1=
6777216 bytes, linear)
[    1.214633][    T0] ------------[ cut here ]------------
[    1.217852][    T0] kernel BUG at mm/page_alloc.c:4996!
[    1.220930][    T0] Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
[    1.224574][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.=
0-rc4-syzkaller-gb6a218ff8b88-dirty #0 PREEMPT(undef)=20
[    1.231268][    T0] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
[    1.237627][    T0] RIP: 0010:__alloc_frozen_pages_noprof+0x1404/0x2520
[    1.242184][    T0] Code: 0f 8f 21 f2 ff ff 8b 84 24 84 00 00 00 65 8b 1=
5 42 c7 8f 11 83 c8 60 81 e2 00 01 ff 00 41 0f 45 c5 41 89 c5 e9 fe f1 ff f=
f 90 <0f> 0b 65 4c 8b 25 0a c7 8f 11 48 b8 00 00 00 00 00 fc ff df 49 8d
[    1.253449][    T0] RSP: 0000:ffffffff8e0079f8 EFLAGS: 00010086
[    1.256874][    T0] RAX: 00000000dead0000 RBX: ffffea00006d1040 RCX: fff=
fffff821407e6
[    1.261855][    T0] RDX: 0000000000000000 RSI: 0000000000000004 RDI: fff=
fea00006d109c
[    1.266392][    T0] RBP: ffffea00006d109c R08: 0000000000000000 R09: fff=
ff940000da213
[    1.270965][    T0] R10: ffffea00006d109f R11: dffffc0000000000 R12: 1ff=
ffffff1c00f54
[    1.276225][    T0] R13: 0000000000000015 R14: ffffea00006d1040 R15: 000=
0000000252000
[    1.281956][    T0] FS:  0000000000000000(0000) GS:ffff8880d69e2000(0000=
) knlGS:0000000000000000
[    1.288351][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.293167][    T0] CR2: ffff88817ffff000 CR3: 000000000e180000 CR4: 000=
00000000000b0
[    1.298931][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    1.304731][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    1.310543][    T0] Call Trace:
[    1.312870][    T0]  <TASK>
[    1.314588][    T0]  ? unwind_next_frame+0x3fe/0x20a0
[    1.317597][    T0]  ? common_startup_64+0x13e/0x148
[    1.320519][    T0]  ? __pfx_stack_trace_consume_entry+0x10/0x10
[    1.324051][    T0]  ? __pfx___alloc_frozen_pages_noprof+0x10/0x10
[    1.327730][    T0]  ? __lock_acquire+0xaa4/0x1ba0
[    1.330584][    T0]  ? stack_trace_save+0x8e/0xc0
[    1.333356][    T0]  ? __pfx_stack_trace_save+0x10/0x10
[    1.336385][    T0]  new_slab+0x94/0x340
[    1.338711][    T0]  ___slab_alloc+0xd9c/0x1940
[    1.341338][    T0]  ? do_kmem_cache_create+0x1b3/0x730
[    1.344384][    T0]  ? new_slab+0x2d1/0x340
[    1.346813][    T0]  ? do_kmem_cache_create+0x1b3/0x730
[    1.349994][    T0]  ? __slab_alloc.constprop.0+0x56/0xb0
[    1.353155][    T0]  __slab_alloc.constprop.0+0x56/0xb0
[    1.356234][    T0]  kmem_cache_alloc_node_noprof+0xf5/0x3b0
[    1.359629][    T0]  ? do_kmem_cache_create+0x1b3/0x730
[    1.362867][    T0]  do_kmem_cache_create+0x1b3/0x730
[    1.365861][    T0]  create_boot_cache+0xba/0x140
[    1.369050][    T0]  new_kmalloc_cache+0x104/0x260
[    1.371932][    T0]  create_kmalloc_caches+0x31/0x50
[    1.374850][    T0]  kmem_cache_init+0x118/0x180
[    1.377572][    T0]  mm_core_init+0x123/0x220
[    1.380169][    T0]  start_kernel+0x197/0x4d0
[    1.382673][    T0]  x86_64_start_reservations+0x18/0x30
[    1.385804][    T0]  x86_64_start_kernel+0xb0/0xc0
[    1.388641][    T0]  common_startup_64+0x13e/0x148
[    1.391477][    T0]  </TASK>
[    1.393164][    T0] Modules linked in:
[    1.395366][    T0] ---[ end trace 0000000000000000 ]---
[    1.398754][    T0] RIP: 0010:__alloc_frozen_pages_noprof+0x1404/0x2520
[    1.403234][    T0] Code: 0f 8f 21 f2 ff ff 8b 84 24 84 00 00 00 65 8b 1=
5 42 c7 8f 11 83 c8 60 81 e2 00 01 ff 00 41 0f 45 c5 41 89 c5 e9 fe f1 ff f=
f 90 <0f> 0b 65 4c 8b 25 0a c7 8f 11 48 b8 00 00 00 00 00 fc ff df 49 8d
[    1.414886][    T0] RSP: 0000:ffffffff8e0079f8 EFLAGS: 00010086
[    1.418676][    T0] RAX: 00000000dead0000 RBX: ffffea00006d1040 RCX: fff=
fffff821407e6
[    1.423528][    T0] RDX: 0000000000000000 RSI: 0000000000000004 RDI: fff=
fea00006d109c
[    1.428395][    T0] RBP: ffffea00006d109c R08: 0000000000000000 R09: fff=
ff940000da213
[    1.434348][    T0] R10: ffffea00006d109f R11: dffffc0000000000 R12: 1ff=
ffffff1c00f54
[    1.439111][    T0] R13: 0000000000000015 R14: ffffea00006d1040 R15: 000=
0000000252000
[    1.443746][    T0] FS:  0000000000000000(0000) GS:ffff8880d69e2000(0000=
) knlGS:0000000000000000
[    1.449598][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.453405][    T0] CR2: ffff88817ffff000 CR3: 000000000e180000 CR4: 000=
00000000000b0
[    1.458118][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    1.462997][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    1.467716][    T0] Kernel panic - not syncing: Fatal exception
[    1.472707][    T0] Rebooting in 86400 seconds..


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
 -ffile-prefix-map=3D/tmp/go-build1408207977=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at c6b4fb399
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
/syzkaller/prog.GitRevision=3Dc6b4fb399236b655a39701fd51c33522caa06811 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250425-123509'" -o ./b=
in/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"c6b4fb399236b655a39701fd51c33522ca=
a06811\"
/usr/bin/ld: /tmp/ccx3kK0j.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D12cb1774580000


Tested on:

commit:         b6a218ff Merge tag 'pm-6.15-rc5' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dca17f2d2ba38f7a=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3D7b3842775c9ce6b69=
efc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1738f7745800=
00

