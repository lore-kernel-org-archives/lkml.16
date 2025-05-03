Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2BF1BC3C
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 03:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746242167; cv=none; b=Lo+EPx2xCQzmgqJuyu5JvcsA3fQtLWagjGMurEYAgPCd35Cc5G3HQjECMMgTJIdXeqcembDgPHkc/xQnenDA2i8m+ZHu65iQBG9pB9wa1AfNeR5FkTP3g/ELwViLrJ9m3IFcB2+80AlRTHORD6Dk+uJBlWcHKB14B3ZCKm4TKQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746242167; c=relaxed/simple;
	bh=KLXAP3lRkV93G38N/axjkXKohuskKb2Z1SZ/3w8fooI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DZ6hQXVXGkVxQsgVyQ+A9xd7huTggS72rPUh8hJkWKbg7roEzQEFwnN2YbqFuYBR/WQbyKC82AySvIa6PQr8RPbC1If+hcvRClwr8g5ZoO1zZNhahVvfmYxI0H4BiffnXEww88r4420KVyGyilbaXKIwnNVNYoAj3DF+fVqz800=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d81a0224e7so48082295ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 20:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746242164; x=1746846964;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QY3X5CAxrDpQ5BgmaystwZBiRMIlyABQtL3yqWxVU4U=;
        b=cKRaFfL6O7XRs/mZyfWU1p9/YtYOJWazirb/ewNz5AcyCPdInC6WAmcCW/UOaUFg3J
         ZI2RuBv6hcXXVeo/EoJP6VyM26s4YmP5EmgEnhUWsdsYsKaPft6mWI3SWEmQWbK09NQo
         qMLNdjOg5nLadkqYDW/xDI4mHPPOi/W3F1+6zX0FbtlmxnsudN+ieEdmrXjtfRTAw4mk
         og2GlFj0pJkMkAQWRF9F1yGTbtgWft+//bF6aDmBuYRhI/Ps55lQwfb8LH4y/6FFNKTu
         7j48tkQQVI+xR+XJJxtyRtbZVEkQ4iwTvJKC4kTdQPJ0gNzIINM0oGsVKsaKa0MuCD8T
         pq2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7++k0s7H4Q1vvtdKGF8PXkZ6wmFiIr8/8vxUeZ74pS+XCQL9hCQWlivVHXKGQWTeai3tSPjc/cTpGP/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsnaZy8qb3JKBv4dqHjLgoKypzvEIRh04O3BiwCFYDecIkjwbR
	xJtvdxIQBFPSmH4TF6mmywQGQTpriZc4EyINH3PZnVtglyAsO5sYrQGj4kUtBAQNoDYg+4zU1mk
	bgpsqKYAWzYYkab7K/XcAuW/wJS5XbgtmrvJUGXUg/eDSzKIRnGYMqeQ=
X-Google-Smtp-Source: AGHT+IEAUymzJOnG5dfezksOWiD0is4KpKXSLk/e8QMOLNLEyxQ94CQ2uYwubxsxt2QPZq6jo+mLSRjNnPZ0E52NyAWq2EjG3YVu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16ca:b0:3d6:d145:2ffb with SMTP id
 e9e14a558f8ab-3d97c2579fbmr62488385ab.21.1746242164102; Fri, 02 May 2025
 20:16:04 -0700 (PDT)
Date: Fri, 02 May 2025 20:16:04 -0700
In-Reply-To: <20250503025426.1473-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68158a74.050a0220.11da1b.0007.GAE@google.com>
Subject: Re: [syzbot] [mm?] BUG: Bad page state in page_cache_ra_order
From: syzbot <syzbot+7b3842775c9ce6b69efc@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

PC     00000001 BXPC 00000001)
[    0.088060][    T0] ACPI: FACP 0x000000007FFE1B2C 0000F4 (v03 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.094133][    T0] ACPI: DSDT 0x000000007FFDF040 002AEC (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.099978][    T0] ACPI: FACS 0x000000007FFDF000 000040
[    0.103348][    T0] ACPI: APIC 0x000000007FFE1C20 0000B0 (v03 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.109833][    T0] ACPI: HPET 0x000000007FFE1CD0 000038 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.116038][    T0] ACPI: SRAT 0x000000007FFE1D08 000178 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.121813][    T0] ACPI: MCFG 0x000000007FFE1E80 00003C (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.127622][    T0] ACPI: DMAR 0x000000007FFE1EBC 0000C0 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.134260][    T0] ACPI: SSDT 0x000000007FFE1F7C 0008A1 (v01 BOCHS  NVD=
IMM   00000001 BXPC 00000001)
[    0.140094][    T0] ACPI: NFIT 0x000000007FFE281D 0000E0 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.145921][    T0] ACPI: WAET 0x000000007FFE28FD 000028 (v01 BOCHS  BXP=
C     00000001 BXPC 00000001)
[    0.151741][    T0] ACPI: Reserving FACP table memory at [mem 0x7ffe1b2c=
-0x7ffe1c1f]
[    0.157216][    T0] ACPI: Reserving DSDT table memory at [mem 0x7ffdf040=
-0x7ffe1b2b]
[    0.162909][    T0] ACPI: Reserving FACS table memory at [mem 0x7ffdf000=
-0x7ffdf03f]
[    0.168552][    T0] ACPI: Reserving APIC table memory at [mem 0x7ffe1c20=
-0x7ffe1ccf]
[    0.174438][    T0] ACPI: Reserving HPET table memory at [mem 0x7ffe1cd0=
-0x7ffe1d07]
[    0.181196][    T0] ACPI: Reserving SRAT table memory at [mem 0x7ffe1d08=
-0x7ffe1e7f]
[    0.193129][    T0] ACPI: Reserving MCFG table memory at [mem 0x7ffe1e80=
-0x7ffe1ebb]
[    0.198373][    T0] ACPI: Reserving DMAR table memory at [mem 0x7ffe1ebc=
-0x7ffe1f7b]
[    0.203686][    T0] ACPI: Reserving SSDT table memory at [mem 0x7ffe1f7c=
-0x7ffe281c]
[    0.208931][    T0] ACPI: Reserving NFIT table memory at [mem 0x7ffe281d=
-0x7ffe28fc]
[    0.214571][    T0] ACPI: Reserving WAET table memory at [mem 0x7ffe28fd=
-0x7ffe2924]
[    0.219893][    T0] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0x0009ffff]
[    0.224126][    T0] ACPI: SRAT: Node 0 PXM 0 [mem 0x00100000-0x7fffffff]
[    0.228351][    T0] ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x17ffffff=
f]
[    0.232651][    T0] ACPI: SRAT: Node 0 PXM 0 [mem 0x180000000-0x183fffff=
f] non-volatile
[    0.237745][    T0] ACPI: SRAT: Node 0 PXM 0 [mem 0x180000000-0x57ffffff=
f] hotplug
[    0.242562][    T0] NUMA: Node 0 [mem 0x00001000-0x0009ffff] + [mem 0x00=
100000-0x7fffffff] -> [mem 0x00001000-0x7fffffff]
[    0.249692][    T0] NUMA: Node 0 [mem 0x00001000-0x7fffffff] + [mem 0x10=
0000000-0x17fffffff] -> [mem 0x00001000-0x17fffffff]
[    0.256916][    T0] Faking node 0 at [mem 0x0000000000001000-0x00000000f=
fffffff] (4095MB)
[    0.262089][    T0] Faking node 1 at [mem 0x0000000100000000-0x000000017=
fffffff] (2048MB)
[    0.267856][    T0] NODE_DATA(0) allocated [mem 0x7ffd7400-0x7ffdcfff]
[    0.272272][    T0] NODE_DATA(1) allocated [mem 0x17fff7400-0x17fffcfff]
[    0.295403][    T0] Zone ranges:
[    0.298021][    T0]   DMA      [mem 0x0000000000001000-0x0000000000fffff=
f]
[    0.302746][    T0]   DMA32    [mem 0x0000000001000000-0x00000000fffffff=
f]
[    0.307235][    T0]   Normal   [mem 0x0000000100000000-0x000000017ffffff=
f]
[    0.311961][    T0]   Device   empty
[    0.314812][    T0] Movable zone start for each node
[    0.318751][    T0] Early memory node ranges
[    0.322138][    T0]   node   0: [mem 0x0000000000001000-0x000000000009ef=
ff]
[    0.327414][    T0]   node   0: [mem 0x0000000000100000-0x000000007ffdcf=
ff]
[    0.331845][    T0]   node   1: [mem 0x0000000100000000-0x000000017fffff=
ff]
[    0.336284][    T0] Initmem setup node 0 [mem 0x0000000000001000-0x00000=
0007ffdcfff]
[    0.341199][    T0] Initmem setup node 1 [mem 0x0000000100000000-0x00000=
0017fffffff]
[    0.346646][    T0] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.351958][    T0] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.420925][    T0] On node 1, zone Normal: 35 pages in unavailable rang=
es
[    0.583331][    T0] kasan: KernelAddressSanitizer initialized
[    0.592132][    T0] ACPI: PM-Timer IO Port: 0x608
[    0.595160][    T0] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
[    0.599524][    T0] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000=
, GSI 0-23
[    0.604294][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl =
dfl)
[    0.609296][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high=
 level)
[    0.613935][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high=
 level)
[    0.618570][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 hi=
gh level)
[    0.623323][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 hi=
gh level)
[    0.628210][    T0] ACPI: Using ACPI (MADT) for SMP configuration inform=
ation
[    0.632741][    T0] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.636460][    T0] TSC deadline timer available
[    0.639404][    T0] CPU topo: Max. logical packages:   2
[    0.642770][    T0] CPU topo: Max. logical dies:       2
[    0.646150][    T0] CPU topo: Max. dies per package:   1
[    0.649519][    T0] CPU topo: Max. threads per core:   2
[    0.652908][    T0] CPU topo: Num. cores per package:     2
[    0.656439][    T0] CPU topo: Num. threads per package:   4
[    0.659955][    T0] CPU topo: Allowing 4 present CPUs plus 4 hotplug CPU=
s
[    0.664357][    T0] kvm-guest: APIC: eoi() replaced with kvm_guest_apic_=
eoi_write()
[    0.669294][    T0] kvm-guest: KVM setup pv remote TLB flush
[    0.672863][    T0] kvm-guest: setup PV sched yield
[    0.676026][    T0] PM: hibernation: Registered nosave memory: [mem 0x00=
000000-0x00000fff]
[    0.681205][    T0] PM: hibernation: Registered nosave memory: [mem 0x00=
09f000-0x000fffff]
[    0.686442][    T0] PM: hibernation: Registered nosave memory: [mem 0x7f=
fdd000-0xffffffff]
[    0.691621][    T0] [mem 0xc0000000-0xfed1bfff] available for PCI device=
s
[    0.695923][    T0] Booting paravirtualized kernel on KVM
[    0.699327][    T0] clocksource: refined-jiffies: mask: 0xffffffff max_c=
ycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.758588][    T0] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids=
:8 nr_node_ids:2
[    0.766332][    T0] percpu: Embedded 69 pages/cpu s245512 r8192 d28920 u=
1048576
[    0.771194][    T0] kvm-guest: PV spinlocks enabled
[    0.774214][    T0] PV qspinlock hash table entries: 256 (order: 0, 4096=
 bytes, linear)
[    0.779181][    T0] Kernel command line: earlyprintk=3Dserial net.ifname=
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
[    0.783256][    T0] Unknown kernel command line parameters "spec_store_b=
ypass_disable=3Dprctl nbds_max=3D32", will be passed to user space.
[    0.847916][    T0] random: crng init done
[    0.850560][    T0] printk: log buffer data + meta data: 262144 + 917504=
 =3D 1179648 bytes
[    0.856441][    T0] software IO TLB: area num 8.
[    0.885594][    T0] Fallback order for Node 0: 0 1=20
[    0.885614][    T0] Fallback order for Node 1: 1 0=20
[    0.885628][    T0] Built 2 zonelists, mobility grouping on.  Total page=
s: 1048443
[    0.895824][    T0] Policy zone: Normal
[    0.898721][    T0] mem auto-init: stack:all(zero), heap alloc:on, heap =
free:off
[    0.903109][    T0] stackdepot: allocating hash table via alloc_large_sy=
stem_hash
[    0.907530][    T0] stackdepot hash table entries: 1048576 (order: 12, 1=
6777216 bytes, linear)
[    1.175223][    T0] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPU=
s=3D8, Nodes=3D2
[    1.183811][    T0] page: refcount:1 mapcount:0 mapping:0000000000000000=
 index:0x27f pfn:0x1ba7f
[    1.188953][    T0] head: order:10 mapcount:0 entire_mapcount:0 nr_pages=
_mapped:0 pincount:0
[    1.193897][    T0] flags: 0xfff00000000040(head|node=3D0|zone=3D1|lastc=
pupid=3D0x7ff)
[    1.198196][    T0] raw: 00fff00000000000 ffffea00006e0001 ffffea00006e9=
fc8 dead000000000400
[    1.203084][    T0] raw: 0000000000000000 0000000000000000 00000000fffff=
fff 0000000000000000
[    1.207986][    T0] head: 00fff00000000040 0000000000000000 dead00000000=
0122 0000000000000000
[    1.212924][    T0] head: 0000000000000000 0000000000000000 00000001ffff=
ffff 0000000000000000
[    1.217877][    T0] head: 00fff0000000000a ffffea00006e0001 00000000ffff=
ffff 00000000ffffffff
[    1.222839][    T0] head: ffffffffffffffff 0000000000000000 00000000ffff=
ffff 0000000000000400
[    1.227784][    T0] page dumped because: VM_BUG_ON_PAGE(PageTail(page))
[    1.231726][    T0] ------------[ cut here ]------------
[    1.234861][    T0] kernel BUG at mm/internal.h:492!
[    1.237753][    T0] Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
[    1.241379][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.=
0-rc4-syzkaller-gb6a218ff8b88-dirty #0 PREEMPT(undef)=20
[    1.248001][    T0] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
[    1.254202][    T0] RIP: 0010:make_alloc_exact+0xf0/0x310
[    1.257331][    T0] Code: 38 00 0f 85 f1 01 00 00 48 8b 45 08 a8 01 75 0=
a 66 90 48 89 e8 48 39 c5 74 1e 48 c7 c6 c0 ea 9b 8b 48 89 ef e8 91 02 f1 f=
f 90 <0f> 0b f7 c5 ff 0f 00 00 0f 84 50 01 00 00 4c 8d 75 34 be 04 00 00
[    1.268638][    T0] RSP: 0000:ffffffff8e007da8 EFLAGS: 00010093
[    1.272081][    T0] RAX: 0000000000000000 RBX: ffffea00006ea000 RCX: fff=
fffff819a90e9
[    1.276605][    T0] RDX: ffffffff8e097740 RSI: ffffffff8212f74f RDI: 000=
0000000000005
[    1.281134][    T0] RBP: ffffea00006e9fc0 R08: 0000000000000005 R09: 000=
0000000000000
[    1.285654][    T0] R10: 0000000000000001 R11: 0000000000000001 R12: fff=
fea00006e0000
[    1.290222][    T0] R13: ffff88801b800000 R14: 0000000000280000 R15: dff=
ffc0000000000
[    1.294752][    T0] FS:  0000000000000000(0000) GS:ffff8880d69e2000(0000=
) knlGS:0000000000000000
[    1.299867][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.303616][    T0] CR2: ffff88817ffff000 CR3: 000000000e180000 CR4: 000=
00000000000b0
[    1.308197][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    1.312735][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    1.317277][    T0] Call Trace:
[    1.319101][    T0]  <TASK>
[    1.320721][    T0]  alloc_pages_exact_nid_noprof+0x1e1/0x310
[    1.324241][    T0]  ? __pfx_alloc_pages_exact_nid_noprof+0x10/0x10
[    1.327904][    T0]  ? lock_acquire+0x179/0x350
[    1.330558][    T0]  ? find_held_lock+0x2b/0x80
[    1.333246][    T0]  init_section_page_ext+0x114/0x1e0
[    1.336418][    T0]  page_ext_init+0x5c0/0xab0
[    1.339059][    T0]  mm_core_init+0x13c/0x220
[    1.341615][    T0]  start_kernel+0x197/0x4d0
[    1.344190][    T0]  x86_64_start_reservations+0x18/0x30
[    1.347296][    T0]  x86_64_start_kernel+0xb0/0xc0
[    1.350108][    T0]  common_startup_64+0x13e/0x148
[    1.352938][    T0]  </TASK>
[    1.354656][    T0] Modules linked in:
[    1.356875][    T0] ---[ end trace 0000000000000000 ]---
[    1.360018][    T0] RIP: 0010:make_alloc_exact+0xf0/0x310
[    1.363231][    T0] Code: 38 00 0f 85 f1 01 00 00 48 8b 45 08 a8 01 75 0=
a 66 90 48 89 e8 48 39 c5 74 1e 48 c7 c6 c0 ea 9b 8b 48 89 ef e8 91 02 f1 f=
f 90 <0f> 0b f7 c5 ff 0f 00 00 0f 84 50 01 00 00 4c 8d 75 34 be 04 00 00
[    1.374672][    T0] RSP: 0000:ffffffff8e007da8 EFLAGS: 00010093
[    1.378196][    T0] RAX: 0000000000000000 RBX: ffffea00006ea000 RCX: fff=
fffff819a90e9
[    1.382805][    T0] RDX: ffffffff8e097740 RSI: ffffffff8212f74f RDI: 000=
0000000000005
[    1.387418][    T0] RBP: ffffea00006e9fc0 R08: 0000000000000005 R09: 000=
0000000000000
[    1.392036][    T0] R10: 0000000000000001 R11: 0000000000000001 R12: fff=
fea00006e0000
[    1.396666][    T0] R13: ffff88801b800000 R14: 0000000000280000 R15: dff=
ffc0000000000
[    1.401324][    T0] FS:  0000000000000000(0000) GS:ffff8880d69e2000(0000=
) knlGS:0000000000000000
[    1.406529][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.410368][    T0] CR2: ffff88817ffff000 CR3: 000000000e180000 CR4: 000=
00000000000b0
[    1.415019][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    1.419639][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    1.424249][    T0] Kernel panic - not syncing: Fatal exception
[    1.428011][    T0] Rebooting in 86400 seconds..


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
 -ffile-prefix-map=3D/tmp/go-build1084914610=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/ccxskk81.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D164318d4580000


Tested on:

commit:         b6a218ff Merge tag 'pm-6.15-rc5' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dca17f2d2ba38f7a=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3D7b3842775c9ce6b69=
efc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D149df7745800=
00

