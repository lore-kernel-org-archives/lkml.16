Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE881A8F60;
	Mon,  2 Jun 2025 10:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748860527; cv=none; b=TQkijf55WM8zW1fQZuytFMHEQJMEQxyMJQnxoC23KoGuXgb9nrWTGO/NCF2k8fWPxfBLDtE7CHtmEtxGoMy6ObIdO1Pw+gOlFX9SyAF2YRpWP3W3W6OmYQk7tPJOmwwDOg+kP6O9nZ3K30KpyyRKijbhp6fEpUc5EM+5jmystxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748860527; c=relaxed/simple;
	bh=eyF4L3YMIpkyXxQD4nmJY4bgVUw074KhldrLYbKchr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iifqt6Q6jghETeHFpXXl/1QT7UdUSQogoHLr/y+pV6fC/zUtumfd0UUyUfUI/NTvDca68Fn0660YxA9kHjZfixGEj/Vg2vqPRY44qwjg+2fUYET+c3wGNV9HZRfwMSPKu7KlOdH46L2F/2TqPopoU5kuRcV7B1SlQqN0Y83ePTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFRsgKgD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFRsgKgD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C68C4CEEB;
	Mon,  2 Jun 2025 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748860527;
	bh=eyF4L3YMIpkyXxQD4nmJY4bgVUw074KhldrLYbKchr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFRsgKgDsVhhipp2J0qtQ6g4ZdOSoWRbgqwbY2qEKPrNTyu4BmzBNnzmXAURTGoR2
	 nRBEJlvbQseV6YNULta4Tc49L8rs2H5sFp8gH8TsEDbOGNaybl/DAnqebZqpJ8YiIa
	 7fDb2ozqDb8M1OC4/hIljhAoandfcuKXn1EEpzVoQVtH7tqlhAhssUzwUqWkKvMOxu
	 q8JJxRloMnS6WPf3C1B1BTZpy9OjG8P2t51UJXWPyr2MYGv0UUDcj0QJjUWtf6fmHH
	 wC/MhPj53FVu57jQ31N4335B082PrbiGkFiurBt80NOoVRLEeLKF8a/Y6SuL089swZ
	 1SiU1oEUY7YCw==
Date: Mon, 2 Jun 2025 11:35:22 +0100
From: Will Deacon <will@kernel.org>
To: Qu Wenruo <wqu@suse.com>, sudeep.holla@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
	rafael.j.wysocki@intel.com, jonathanh@nvidia.com,
	ulf.hansson@linaro.org
Subject: Re: Kernel crash on boot, arm64 VM
Message-ID: <20250602103521.GA1134@willie-the-truck>
References: <17fc594b-b80b-4918-8945-4aef35dc9c94@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17fc594b-b80b-4918-8945-4aef35dc9c94@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

[+Sudeep]

On Mon, Jun 02, 2025 at 10:00:38AM +0930, Qu Wenruo wrote:
> It looks like there is a regression related to the device tree/acpi parsing
> in the latest upstream kernel branch.

I've kept the crash log below, but I suspect this is due to the __free()
cleanup path in dt_idle_state_present(), introduced recently by
5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT
idle states are present").

Can you try reverting that as a quick test?

Will

--->8

> The arm64 VM crash at boot, with the following call trace:
> 
> [    0.586215] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [    0.590523] ACPI: bus type drm_connector registered
> [    0.591658] Unable to handle kernel paging request at virtual address
> fefefefefefeffba
> [    0.591662] Mem abort info:
> [    0.591662]   ESR = 0x0000000096000004
> [    0.591664]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.591665]   SET = 0, FnV = 0
> [    0.591666]   EA = 0, S1PTW = 0
> [    0.591667]   FSC = 0x04: level 0 translation fault
> [    0.591668] Data abort info:
> [    0.591669]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    0.591670]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    0.591671]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    0.591673] [fefefefefefeffba] address between user and kernel address
> ranges
> [    0.591675] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    0.782557] Freeing initrd memory: 29504K
> [    0.849513] Modules linked in:
> [    0.849987] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.15.0-custom+ #121 PREEMPT(voluntary)
> [    0.851281] Hardware name: QEMU KVM Virtual Machine, BIOS unknown
> 2/2/2022
> [    0.852223] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [    0.853160] pc : kobject_put+0x18/0xc8
> [    0.853674] lr : of_node_put+0x20/0x38
> [    0.854202] sp : ffff80008010fcd0
> [    0.854662] x29: ffff80008010fcd0 x28: 0000000000000000 x27:
> ffffd2503c550130
> [    0.855633] x26: ffffd2503c651960 x25: 0000000000000006 x24:
> ffffd2503c761fc4
> [    0.856631] x23: ffffd2503c083140 x22: 0000000000000000 x21:
> 0000000000000000
> [    0.857609] x20: 0000000000000000 x19: fefefefefefeff7e x18:
> 0000000000000000
> [    0.858603] x17: ffffd2503ca54b10 x16: 00000000c041c2e1 x15:
> 0000000000000000
> [    0.859501] x14: 0000000000000000 x13: 00000000ffffffff x12:
> 6265722d6e6f6373
> [    0.860434] x11: ffff80008010fbb0 x10: 0000000000000073 x9 :
> ffffd2503c5a671c
> [    0.861418] x8 : ffff80008010fcf8 x7 : fefefefefefefefe x6 :
> 0000000ef878d830
> [    0.862417] x5 : ffffd2503ca54b52 x4 : 0000000000000000 x3 :
> ffffd2503bff0158
> [    0.863414] x2 : 000000000000000f x1 : ffff6a2842a80000 x0 :
> fefefefefefeff7e
> [    0.864410] Call trace:
> [    0.864747]  kobject_put+0x18/0xc8 (P)
> [    0.865277]  of_node_put+0x20/0x38
> [    0.865757]  psci_idle_init+0x6c/0xe8
> [    0.866308]  do_one_initcall+0x60/0x2b0
> [    0.866871]  do_initcalls+0x100/0x148
> [    0.867388]  kernel_init_freeable+0x188/0x1e0
> [    0.868002]  kernel_init+0x28/0x158
> [    0.868485]  ret_from_fork+0x10/0x20
> [    0.868995] Code: a9be7bfd 910003fd f9000bf3 aa0003f3 (3940f000)
> [    0.869845] ---[ end trace 0000000000000000 ]---
> [    0.870568] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b
> [    0.871567] SMP: stopping secondary CPUs
> [    0.872160] Kernel Offset: 0x524fbadc0000 from 0xffff800080000000
> [    0.872990] PHYS_OFFSET: 0xffffc389c0000000
> [    0.873572] CPU features: 0x0800,000000e0,01002650,8201720b
> [    0.874359] Memory Limit: none
> [    0.874789] Rebooting in 5 seconds..
> 
> The full dmesg (aarch64_dmesg.txt) is attached for the failed boot sequence.
> 
> The VM is using edk2-aarch64 as firmware, with the attached libvirt xml
> (aarch64.xml).
> 
> Thanks,
> Qu

> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x414fd0b0]
> [    0.000000] Linux version 6.15.0-custom+ (adam@btrfs-aarch64) (gcc (GCC) 14.2.1 20250207, GNU ld (GNU Binutils) 2.44) #121 SMP PREEMPT_DYNAMIC Mon Jun  2 09:30:42 ACST 2025
> [    0.000000] KASLR enabled
> [    0.000000] efi: EFI v2.7 by EDK II
> [    0.000000] efi: SMBIOS 3.0=0x23fed0000 MEMATTR=0x23eab2018 ACPI 2.0=0x23c3e0018 RNG=0x23c3ee698 INITRD=0x23c3dfc18 MEMRESERVE=0x23c3dec18 
> [    0.000000] random: crng init done
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000000023C3E0018 000024 (v02 BOCHS )
> [    0.000000] ACPI: XSDT 0x000000023C3EFE98 000064 (v01 BOCHS  BXPC     00000001      01000013)
> [    0.000000] ACPI: FACP 0x000000023C3EFA98 000114 (v06 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x000000023C3E7518 0014A2 (v02 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x000000023C3EFC18 0001A8 (v04 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.000000] ACPI: PPTT 0x000000023C3ED898 0000C4 (v02 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.000000] ACPI: GTDT 0x000000023C3EE818 000068 (v03 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.000000] ACPI: MCFG 0x000000023C3EE918 00003C (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.000000] ACPI: SPCR 0x000000023C3EFF98 000050 (v02 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.000000] ACPI: DBG2 0x000000023C3EE418 000057 (v00 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.000000] ACPI: IORT 0x000000023C3EE718 000080 (v03 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.000000] ACPI: SPCR: console: pl011,mmio32,0x9000000,9600
> [    0.000000] ACPI: Use ACPI SPCR as default console: Yes
> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000023fffffff]
> [    0.000000] NODE_DATA(0) allocated [mem 0x23faf8c80-0x23fb0ffff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000023fffffff]
> [    0.000000]   Device   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x000000023c3effff]
> [    0.000000]   node   0: [mem 0x000000023c3f0000-0x000000023c72ffff]
> [    0.000000]   node   0: [mem 0x000000023c730000-0x000000023fbfffff]
> [    0.000000]   node   0: [mem 0x000000023fc00000-0x000000023ffdffff]
> [    0.000000]   node   0: [mem 0x000000023ffe0000-0x000000023fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000023fffffff]
> [    0.000000] cma: Reserved 64 MiB at 0x00000000e0000000
> [    0.000000] crashkernel reserved: 0x00000000c0000000 - 0x00000000e0000000 (512 MB)
> [    0.000000] psci: probing for conduit method from ACPI.
> [    0.000000] psci: PSCIv1.3 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.1
> [    0.000000] smccc: KVM: hypervisor services detected (0x00000000 0x00000000 0x00000000 0x00000003)
> [    0.000000] percpu: Embedded 3 pages/cpu s95448 r8192 d92968 u196608
> [    0.000000] Detected VIPT I-cache on CPU0
> [    0.000000] CPU features: detected: GIC system register CPU interface
> [    0.000000] CPU features: detected: Spectre-v4
> [    0.000000] CPU features: detected: Spectre-BHB
> [    0.000000] CPU features: kernel page table isolation disabled by kernel configuration
> [    0.000000] CPU features: detected: SSBS not fully self-synchronizing
> [    0.000000] alternatives: applying boot alternatives
> [    0.000000] Kernel command line: initrd=\initramfs-custom.img root=/dev/sys/root rw console=ttyAMA0 loglevel=7 watchdog_thresh=5 crashkernel=512M
> [    0.000000] printk: log buffer data + meta data: 262144 + 917504 = 1179648 bytes
> [    0.000000] Dentry cache hash table entries: 1048576 (order: 7, 8388608 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 524288 (order: 6, 4194304 bytes, linear)
> [    0.000000] software IO TLB: area num 4.
> [    0.000000] software IO TLB: mapped [mem 0x00000000bc000000-0x00000000c0000000] (64MB)
> [    0.000000] Fallback order for Node 0: 0 
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 131072
> [    0.000000] Policy zone: Normal
> [    0.000000] mem auto-init: stack:all(pattern), heap alloc:off, heap free:off
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> [    0.000000] ftrace: allocating 44030 entries in 11 pages
> [    0.000000] ftrace: allocated 11 pages with 3 groups
> [    0.000000] Dynamic Preempt: voluntary
> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=4096 to nr_cpu_ids=4.
> [    0.000000] 	Trampoline variant of Tasks RCU enabled.
> [    0.000000] 	Rude variant of Tasks RCU enabled.
> [    0.000000] 	Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
> [    0.000000] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
> [    0.000000] RCU Tasks Rude: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
> [    0.000000] RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] GICv3: 256 SPIs implemented
> [    0.000000] GICv3: 0 Extended SPIs implemented
> [    0.000000] Root IRQ handler: gic_handle_irq
> [    0.000000] GICv3: GICv3 features: 16 PPIs, DirectLPI
> [    0.000000] GICv3: GICD_CTRL.DS=1, SCR_EL3.FIQ=0
> [    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x00000000080a0000
> [    0.000000] ITS [mem 0x08080000-0x0809ffff]
> [    0.000000] ITS@0x0000000008080000: allocated 8192 Devices @100450000 (indirect, esz 8, psz 64K, shr 1)
> [    0.000000] ITS@0x0000000008080000: allocated 8192 Interrupt Collections @100460000 (flat, esz 8, psz 64K, shr 1)
> [    0.000000] GICv3: using LPI property table @0x0000000100470000
> [    0.000000] GICv3: CPU0: using allocated LPI pending table @0x0000000100490000
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (virt).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
> [    0.000000] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
> [    0.000036] arm-pv: using stolen time PV
> [    0.000215] kfence: initialized - using 33554432 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
> [    0.000331] Console: colour dummy device 80x25
> [    0.000490] ACPI: Core revision 20250404
> [    0.000878] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=24000)
> [    0.000882] pid_max: default: 32768 minimum: 301
> [    0.001301] LSM: initializing lsm=capability,selinux,bpf
> [    0.001594] SELinux:  Initializing.
> [    0.003454] LSM support for eBPF active
> [    0.003635] Mount-cache hash table entries: 16384 (order: 1, 131072 bytes, linear)
> [    0.003700] Mountpoint-cache hash table entries: 16384 (order: 1, 131072 bytes, linear)
> [    0.006310] rcu: Hierarchical SRCU implementation.
> [    0.006312] rcu: 	Max phase no-delay instances is 400.
> [    0.006476] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
> [    0.006717] Remapping and enabling EFI services.
> [    0.007128] smp: Bringing up secondary CPUs ...
> [    0.015714] Detected VIPT I-cache on CPU1
> [    0.015748] GICv3: CPU1: found redistributor 1 region 0:0x00000000080c0000
> [    0.015823] GICv3: CPU1: using allocated LPI pending table @0x00000001004a0000
> [    0.015862] CPU1: Booted secondary processor 0x0000000001 [0x414fd0b0]
> [    0.024526] Detected VIPT I-cache on CPU2
> [    0.024561] GICv3: CPU2: found redistributor 2 region 0:0x00000000080e0000
> [    0.024603] GICv3: CPU2: using allocated LPI pending table @0x00000001004b0000
> [    0.024644] CPU2: Booted secondary processor 0x0000000002 [0x414fd0b0]
> [    0.033319] Detected VIPT I-cache on CPU3
> [    0.033356] GICv3: CPU3: found redistributor 3 region 0:0x0000000008100000
> [    0.033398] GICv3: CPU3: using allocated LPI pending table @0x00000001004c0000
> [    0.033438] CPU3: Booted secondary processor 0x0000000003 [0x414fd0b0]
> [    0.033970] smp: Brought up 1 node, 4 CPUs
> [    0.033973] SMP: Total of 4 processors activated.
> [    0.033974] CPU: All CPU(s) started at EL1
> [    0.033975] CPU features: detected: 32-bit EL0 Support
> [    0.033977] CPU features: detected: Data cache clean to the PoU not required for I/D coherence
> [    0.033978] CPU features: detected: Common not Private translations
> [    0.033979] CPU features: detected: CRC32 instructions
> [    0.033980] CPU features: detected: Data cache clean to Point of Persistence
> [    0.033983] CPU features: detected: RCpc load-acquire (LDAPR)
> [    0.033984] CPU features: detected: LSE atomic instructions
> [    0.033985] CPU features: detected: Privileged Access Never
> [    0.033986] CPU features: detected: PMUv3
> [    0.033987] CPU features: detected: RAS Extension Support
> [    0.033989] CPU features: detected: Speculative Store Bypassing Safe (SSBS)
> [    0.034087] spectre-bhb mitigation disabled by compile time option
> [    0.034088] spectre-bhb mitigation disabled by compile time option
> [    0.034088] spectre-bhb mitigation disabled by compile time option
> [    0.034094] alternatives: applying system-wide alternatives
> [    0.034866] CPU features: detected: Hardware dirty bit management on CPU0-3
> [    0.035423] Memory: 7120896K/8388608K available (13440K kernel code, 2834K rwdata, 10368K rodata, 2944K init, 10172K bss, 723840K reserved, 524288K cma-reserved)
> [    0.036189] devtmpfs: initialized
> [    0.037206] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
> [    0.037226] posixtimers hash table entries: 2048 (order: -1, 32768 bytes, linear)
> [    0.037277] futex hash table entries: 1024 (65536 bytes on 1 NUMA nodes, total 64 KiB, linear).
> [    0.037385] 2G module region forced by RANDOMIZE_MODULE_REGION_FULL
> [    0.037386] 0 pages in range for non-PLT usage
> [    0.037387] 32135 pages in range for PLT usage
> [    0.037771] pinctrl core: initialized pinctrl subsystem
> [    0.037959] SMBIOS 3.0.0 present.
> [    0.037962] DMI: QEMU KVM Virtual Machine, BIOS unknown 2/2/2022
> [    0.037970] DMI: Memory slots populated: 1/1
> [    0.039707] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.041666] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
> [    0.042105] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.042526] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.042680] audit: initializing netlink subsys (disabled)
> [    0.042954] audit: type=2000 audit(0.041:1): state=initialized audit_enabled=0 res=1
> [    0.043128] thermal_sys: Registered thermal governor 'fair_share'
> [    0.043129] thermal_sys: Registered thermal governor 'step_wise'
> [    0.043131] thermal_sys: Registered thermal governor 'user_space'
> [    0.043145] cpuidle: using governor menu
> [    0.043247] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> [    0.043391] ASID allocator initialised with 65536 entries
> [    0.043404] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.043699] Serial: AMBA PL011 UART driver
> [    0.048215] HugeTLB: allocation took 0ms with hugepage_allocation_threads=1
> [    0.048217] HugeTLB: allocation took 0ms with hugepage_allocation_threads=1
> [    0.048220] HugeTLB: registered 16.0 GiB page size, pre-allocated 0 pages
> [    0.048221] HugeTLB: 0 KiB vmemmap can be freed for a 16.0 GiB page
> [    0.048223] HugeTLB: registered 512 MiB page size, pre-allocated 0 pages
> [    0.048223] HugeTLB: 0 KiB vmemmap can be freed for a 512 MiB page
> [    0.048225] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.048228] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
> [    0.051488] ACPI: Added _OSI(Module Device)
> [    0.051490] ACPI: Added _OSI(Processor Device)
> [    0.051491] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.052333] ACPI: 1 ACPI AML tables successfully acquired and loaded
> [    0.052539] ACPI: Interpreter enabled
> [    0.052540] ACPI: Using GIC for interrupt routing
> [    0.052552] ACPI: MCFG table detected, 1 entries
> [    0.054382] ACPI: CPU0 has been hot-added
> [    0.054447] ACPI: CPU1 has been hot-added
> [    0.054470] ACPI: CPU2 has been hot-added
> [    0.054492] ACPI: CPU3 has been hot-added
> [    0.054721] ARMH0011:00: ttyAMA0 at MMIO 0x9000000 (irq = 12, base_baud = 0) is a SBSA
> [    0.054749] printk: console [ttyAMA0] enabled
> [    0.195703] ACPI: PCI: Interrupt link L000 configured for IRQ 35
> [    0.195722] ACPI: PCI: Interrupt link L001 configured for IRQ 36
> [    0.195731] ACPI: PCI: Interrupt link L002 configured for IRQ 37
> [    0.195738] ACPI: PCI: Interrupt link L003 configured for IRQ 38
> [    0.195753] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.195906] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
> [    0.195983] acpi PNP0A08:00: _OSC: platform does not support [LTR DPC]
> [    0.196043] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
> [    0.196225] acpi PNP0A08:00: ECAM area [mem 0x4010000000-0x401fffffff] reserved by PNP0C02:00
> [    0.196358] acpi PNP0A08:00: ECAM at [mem 0x4010000000-0x401fffffff] for [bus 00-ff]
> [    0.196412] ACPI: Remapped I/O 0x000000003eff0000 to [io  0x0000-0xffff window]
> [    0.196501] PCI host bridge to bus 0000:00
> [    0.196517] pci_bus 0000:00: root bus resource [mem 0x10000000-0x3efeffff window]
> [    0.196520] pci_bus 0000:00: root bus resource [io  0x0000-0xffff window]
> [    0.196521] pci_bus 0000:00: root bus resource [mem 0x8000000000-0xffffffffff window]
> [    0.196523] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.196620] pci 0000:00:00.0: [1b36:0008] type 00 class 0x060000 conventional PCI endpoint
> [    0.197694] pci 0000:00:01.0: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.201882] pci 0000:00:01.0: BAR 0 [mem 0x11c4d000-0x11c4dfff]
> [    0.201900] pci 0000:00:01.0: PCI bridge to [bus 01]
> [    0.202083] pci 0000:00:01.0:   bridge window [mem 0x11a00000-0x11bfffff]
> [    0.203290] pci 0000:00:01.0:   bridge window [mem 0x8000000000-0x80000fffff 64bit pref]
> [    0.205393] pci 0000:00:01.1: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.209094] pci 0000:00:01.1: BAR 0 [mem 0x11c4c000-0x11c4cfff]
> [    0.209110] pci 0000:00:01.1: PCI bridge to [bus 02]
> [    0.210485] pci 0000:00:01.1:   bridge window [mem 0x11800000-0x119fffff]
> [    0.213029] pci 0000:00:01.2: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.215647] pci 0000:00:01.2: BAR 0 [mem 0x11c4b000-0x11c4bfff]
> [    0.215704] pci 0000:00:01.2: PCI bridge to [bus 03]
> [    0.215735] pci 0000:00:01.2:   bridge window [mem 0x11600000-0x117fffff]
> [    0.216593] pci 0000:00:01.2:   bridge window [mem 0x8000100000-0x80001fffff 64bit pref]
> [    0.217716] pci 0000:00:01.3: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.221103] pci 0000:00:01.3: BAR 0 [mem 0x11c4a000-0x11c4afff]
> [    0.221121] pci 0000:00:01.3: PCI bridge to [bus 04]
> [    0.222476] pci 0000:00:01.3:   bridge window [mem 0x11400000-0x115fffff]
> [    0.223560] pci 0000:00:01.3:   bridge window [mem 0x8000200000-0x80002fffff 64bit pref]
> [    0.224977] pci 0000:00:01.4: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.227404] pci 0000:00:01.4: BAR 0 [mem 0x11c49000-0x11c49fff]
> [    0.227422] pci 0000:00:01.4: PCI bridge to [bus 05]
> [    0.227446] pci 0000:00:01.4:   bridge window [mem 0x11200000-0x113fffff]
> [    0.228234] pci 0000:00:01.4:   bridge window [mem 0x8000300000-0x80003fffff 64bit pref]
> [    0.229529] pci 0000:00:01.5: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.232409] pci 0000:00:01.5: BAR 0 [mem 0x11c48000-0x11c48fff]
> [    0.232427] pci 0000:00:01.5: PCI bridge to [bus 06]
> [    0.233968] pci 0000:00:01.5:   bridge window [mem 0x11000000-0x111fffff]
> [    0.235022] pci 0000:00:01.5:   bridge window [mem 0x8000400000-0x80004fffff 64bit pref]
> [    0.236685] pci 0000:00:01.6: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.239415] pci 0000:00:01.6: BAR 0 [mem 0x11c47000-0x11c47fff]
> [    0.239464] pci 0000:00:01.6: PCI bridge to [bus 07]
> [    0.239558] pci 0000:00:01.6:   bridge window [mem 0x10e00000-0x10ffffff]
> [    0.240379] pci 0000:00:01.6:   bridge window [mem 0x8000500000-0x80005fffff 64bit pref]
> [    0.241554] pci 0000:00:01.7: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.243998] pci 0000:00:01.7: BAR 0 [mem 0x11c46000-0x11c46fff]
> [    0.244015] pci 0000:00:01.7: PCI bridge to [bus 08]
> [    0.244035] pci 0000:00:01.7:   bridge window [mem 0x10c00000-0x10dfffff]
> [    0.246296] pci 0000:00:01.7:   bridge window [mem 0x8000600000-0x80006fffff 64bit pref]
> [    0.247928] pci 0000:00:02.0: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.250647] pci 0000:00:02.0: BAR 0 [mem 0x11c45000-0x11c45fff]
> [    0.250666] pci 0000:00:02.0: PCI bridge to [bus 09]
> [    0.250824] pci 0000:00:02.0:   bridge window [mem 0x10a00000-0x10bfffff]
> [    0.251604] pci 0000:00:02.0:   bridge window [mem 0x8000700000-0x80007fffff 64bit pref]
> [    0.252963] pci 0000:00:02.1: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.255625] pci 0000:00:02.1: BAR 0 [mem 0x11c44000-0x11c44fff]
> [    0.255643] pci 0000:00:02.1: PCI bridge to [bus 0a]
> [    0.255663] pci 0000:00:02.1:   bridge window [mem 0x10800000-0x109fffff]
> [    0.259238] pci 0000:00:02.2: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.261652] pci 0000:00:02.2: BAR 0 [mem 0x11c43000-0x11c43fff]
> [    0.261670] pci 0000:00:02.2: PCI bridge to [bus 0b]
> [    0.261690] pci 0000:00:02.2:   bridge window [mem 0x10600000-0x107fffff]
> [    0.263896] pci 0000:00:02.3: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.266925] pci 0000:00:02.3: BAR 0 [mem 0x11c42000-0x11c42fff]
> [    0.266968] pci 0000:00:02.3: PCI bridge to [bus 0c]
> [    0.267031] pci 0000:00:02.3:   bridge window [mem 0x10400000-0x105fffff]
> [    0.270820] pci 0000:00:02.4: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.273618] pci 0000:00:02.4: BAR 0 [mem 0x11c41000-0x11c41fff]
> [    0.273639] pci 0000:00:02.4: PCI bridge to [bus 0d]
> [    0.273660] pci 0000:00:02.4:   bridge window [mem 0x10200000-0x103fffff]
> [    0.275744] pci 0000:00:02.5: [1b36:000c] type 01 class 0x060400 PCIe Root Port
> [    0.278523] pci 0000:00:02.5: BAR 0 [mem 0x11c40000-0x11c40fff]
> [    0.278546] pci 0000:00:02.5: PCI bridge to [bus 0e]
> [    0.278596] pci 0000:00:02.5:   bridge window [mem 0x10000000-0x101fffff]
> [    0.283390] pci 0000:01:00.0: [1af4:1041] type 00 class 0x020000 PCIe Endpoint
> [    0.283812] pci 0000:01:00.0: BAR 1 [mem 0x11a00000-0x11a00fff]
> [    0.283852] pci 0000:01:00.0: BAR 4 [mem 0x8000000000-0x8000003fff 64bit pref]
> [    0.283860] pci 0000:01:00.0: ROM [mem 0xfffc0000-0xffffffff pref]
> [    0.286360] pci 0000:02:00.0: [1b36:000d] type 00 class 0x0c0330 PCIe Endpoint
> [    0.286603] pci 0000:02:00.0: BAR 0 [mem 0x11800000-0x11803fff 64bit]
> [    0.288598] pci 0000:03:00.0: [1af4:1043] type 00 class 0x078000 PCIe Endpoint
> [    0.290439] pci 0000:03:00.0: BAR 1 [mem 0x11600000-0x11600fff]
> [    0.290537] pci 0000:03:00.0: BAR 4 [mem 0x8000100000-0x8000103fff 64bit pref]
> [    0.293895] pci 0000:04:00.0: [1af4:1042] type 00 class 0x010000 PCIe Endpoint
> [    0.295878] pci 0000:04:00.0: BAR 1 [mem 0x11400000-0x11400fff]
> [    0.295900] pci 0000:04:00.0: BAR 4 [mem 0x8000200000-0x8000203fff 64bit pref]
> [    0.298109] pci 0000:05:00.0: [1af4:1045] type 00 class 0x00ff00 PCIe Endpoint
> [    0.298406] pci 0000:05:00.0: BAR 4 [mem 0x8000300000-0x8000303fff 64bit pref]
> [    0.300718] pci 0000:06:00.0: [1af4:1044] type 00 class 0x00ff00 PCIe Endpoint
> [    0.302506] pci 0000:06:00.0: BAR 1 [mem 0x11000000-0x11000fff]
> [    0.302527] pci 0000:06:00.0: BAR 4 [mem 0x8000400000-0x8000403fff 64bit pref]
> [    0.305592] pci 0000:07:00.0: [1af4:1048] type 00 class 0x010000 PCIe Endpoint
> [    0.305844] pci 0000:07:00.0: BAR 1 [mem 0x10e00000-0x10e00fff]
> [    0.305863] pci 0000:07:00.0: BAR 4 [mem 0x8000500000-0x8000503fff 64bit pref]
> [    0.307917] pci 0000:08:00.0: [1af4:1042] type 00 class 0x010000 PCIe Endpoint
> [    0.308167] pci 0000:08:00.0: BAR 1 [mem 0x10c00000-0x10c00fff]
> [    0.308199] pci 0000:08:00.0: BAR 4 [mem 0x8000600000-0x8000603fff 64bit pref]
> [    0.310350] pci 0000:09:00.0: [1af4:1042] type 00 class 0x010000 PCIe Endpoint
> [    0.310665] pci 0000:09:00.0: BAR 1 [mem 0x10a00000-0x10a00fff]
> [    0.310730] pci 0000:09:00.0: BAR 4 [mem 0x8000700000-0x8000703fff 64bit pref]
> [    0.331426] pci 0000:00:01.0: bridge window [io  0x1000-0x0fff] to [bus 01] add_size 1000
> [    0.331437] pci 0000:00:01.0: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 01] add_size 100000 add_align 100000
> [    0.331441] pci 0000:00:01.0: bridge window [mem 0x00100000-0x001fffff] to [bus 01] add_size 200000 add_align 100000
> [    0.331445] pci 0000:00:01.1: bridge window [io  0x1000-0x0fff] to [bus 02] add_size 1000
> [    0.331447] pci 0000:00:01.1: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 02] add_size 200000 add_align 100000
> [    0.331449] pci 0000:00:01.1: bridge window [mem 0x00100000-0x001fffff] to [bus 02] add_size 100000 add_align 100000
> [    0.331452] pci 0000:00:01.2: bridge window [io  0x1000-0x0fff] to [bus 03] add_size 1000
> [    0.331455] pci 0000:00:01.2: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 03] add_size 100000 add_align 100000
> [    0.331457] pci 0000:00:01.2: bridge window [mem 0x00100000-0x001fffff] to [bus 03] add_size 100000 add_align 100000
> [    0.331460] pci 0000:00:01.3: bridge window [io  0x1000-0x0fff] to [bus 04] add_size 1000
> [    0.331463] pci 0000:00:01.3: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 04] add_size 100000 add_align 100000
> [    0.331465] pci 0000:00:01.3: bridge window [mem 0x00100000-0x001fffff] to [bus 04] add_size 100000 add_align 100000
> [    0.331468] pci 0000:00:01.4: bridge window [io  0x1000-0x0fff] to [bus 05] add_size 1000
> [    0.331470] pci 0000:00:01.4: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 05] add_size 100000 add_align 100000
> [    0.331472] pci 0000:00:01.4: bridge window [mem 0x00100000-0x000fffff] to [bus 05] add_size 200000 add_align 100000
> [    0.331475] pci 0000:00:01.5: bridge window [io  0x1000-0x0fff] to [bus 06] add_size 1000
> [    0.331477] pci 0000:00:01.5: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 06] add_size 100000 add_align 100000
> [    0.331479] pci 0000:00:01.5: bridge window [mem 0x00100000-0x001fffff] to [bus 06] add_size 100000 add_align 100000
> [    0.331482] pci 0000:00:01.6: bridge window [io  0x1000-0x0fff] to [bus 07] add_size 1000
> [    0.331484] pci 0000:00:01.6: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 07] add_size 100000 add_align 100000
> [    0.331487] pci 0000:00:01.6: bridge window [mem 0x00100000-0x001fffff] to [bus 07] add_size 100000 add_align 100000
> [    0.331490] pci 0000:00:01.7: bridge window [io  0x1000-0x0fff] to [bus 08] add_size 1000
> [    0.331492] pci 0000:00:01.7: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 08] add_size 100000 add_align 100000
> [    0.331494] pci 0000:00:01.7: bridge window [mem 0x00100000-0x001fffff] to [bus 08] add_size 100000 add_align 100000
> [    0.331497] pci 0000:00:02.0: bridge window [io  0x1000-0x0fff] to [bus 09] add_size 1000
> [    0.331499] pci 0000:00:02.0: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 09] add_size 100000 add_align 100000
> [    0.331501] pci 0000:00:02.0: bridge window [mem 0x00100000-0x001fffff] to [bus 09] add_size 100000 add_align 100000
> [    0.331504] pci 0000:00:02.1: bridge window [io  0x1000-0x0fff] to [bus 0a] add_size 1000
> [    0.331505] pci 0000:00:02.1: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 0a] add_size 200000 add_align 100000
> [    0.331508] pci 0000:00:02.1: bridge window [mem 0x00100000-0x000fffff] to [bus 0a] add_size 200000 add_align 100000
> [    0.331510] pci 0000:00:02.2: bridge window [io  0x1000-0x0fff] to [bus 0b] add_size 1000
> [    0.331512] pci 0000:00:02.2: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 0b] add_size 200000 add_align 100000
> [    0.331514] pci 0000:00:02.2: bridge window [mem 0x00100000-0x000fffff] to [bus 0b] add_size 200000 add_align 100000
> [    0.331516] pci 0000:00:02.3: bridge window [io  0x1000-0x0fff] to [bus 0c] add_size 1000
> [    0.331518] pci 0000:00:02.3: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 0c] add_size 200000 add_align 100000
> [    0.331520] pci 0000:00:02.3: bridge window [mem 0x00100000-0x000fffff] to [bus 0c] add_size 200000 add_align 100000
> [    0.331523] pci 0000:00:02.4: bridge window [io  0x1000-0x0fff] to [bus 0d] add_size 1000
> [    0.331525] pci 0000:00:02.4: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 0d] add_size 200000 add_align 100000
> [    0.331527] pci 0000:00:02.4: bridge window [mem 0x00100000-0x000fffff] to [bus 0d] add_size 200000 add_align 100000
> [    0.331529] pci 0000:00:02.5: bridge window [io  0x1000-0x0fff] to [bus 0e] add_size 1000
> [    0.331531] pci 0000:00:02.5: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 0e] add_size 200000 add_align 100000
> [    0.331533] pci 0000:00:02.5: bridge window [mem 0x00100000-0x000fffff] to [bus 
> ** replaying previous printk message **
> [    0.331533] pci 0000:00:02.5: bridge window [mem 0x00100000-0x000fffff] to [bus 0e] add_size 200000 add_align 100000
> [    0.331578] pci 0000:00:01.0: bridge window [mem 0x10000000-0x102fffff]: assigned
> [    0.331582] pci 0000:00:01.0: bridge window [mem 0x8000000000-0x80001fffff 64bit pref]: assigned
> [    0.331584] pci 0000:00:01.1: bridge window [mem 0x10300000-0x104fffff]: assigned
> [    0.331586] pci 0000:00:01.1: bridge window [mem 0x8000200000-0x80003fffff 64bit pref]: assigned
> [    0.331587] pci 0000:00:01.2: bridge window [mem 0x10500000-0x106fffff]: assigned
> [    0.331589] pci 0000:00:01.2: bridge window [mem 0x8000400000-0x80005fffff 64bit pref]: assigned
> [    0.331591] pci 0000:00:01.3: bridge window [mem 0x10700000-0x108fffff]: assigned
> [    0.331593] pci 0000:00:01.3: bridge window [mem 0x8000600000-0x80007fffff 64bit pref]: assigned
> [    0.331595] pci 0000:00:01.4: bridge window [mem 0x10900000-0x10afffff]: assigned
> [    0.331596] pci 0000:00:01.4: bridge window [mem 0x8000800000-0x80009fffff 64bit pref]: assigned
> [    0.331598] pci 0000:00:01.5: bridge window [mem 0x10b00000-0x10cfffff]: assigned
> [    0.331600] pci 0000:00:01.5: bridge window [mem 0x8000a00000-0x8000bfffff 64bit pref]: assigned
> [    0.331601] pci 0000:00:01.6: bridge window [mem 0x10d00000-0x10efffff]: assigned
> [    0.331603] pci 0000:00:01.6: bridge window [mem 0x8000c00000-0x8000dfffff 64bit pref]: assigned
> [    0.331605] pci 0000:00:01.7: bridge window [mem 0x10f00000-0x110fffff]: assigned
> [    0.331607] pci 0000:00:01.7: bridge window [mem 0x8000e00000-0x8000ffffff 64bit pref]: assigned
> [    0.331608] pci 0000:00:02.0: bridge window [mem 0x11100000-0x112fffff]: assigned
> [    0.331610] pci 0000:00:02.0: bridge window [mem 0x8001000000-0x80011fffff 64bit pref]: assigned
> [    0.331612] pci 0000:00:02.1: bridge window [mem 0x11300000-0x114fffff]: assigned
> [    0.331613] pci 0000:00:02.1: bridge window [mem 0x8001200000-0x80013fffff 64bit pref]: assigned
> [    0.331615] pci 0000:00:02.2: bridge window [mem 0x11500000-0x116fffff]: assigned
> [    0.331617] pci 0000:00:02.2: bridge window [mem 0x8001400000-0x80015fffff 64bit pref]: assigned
> [    0.331619] pci 0000:00:02.3: bridge window [mem 0x11700000-0x118fffff]: assigned
> [    0.331621] pci 0000:00:02.3: bridge window [mem 0x8001600000-0x80017fffff 64bit pref]: assigned
> [    0.331622] pci 0000:00:02.4: bridge window [mem 0x11900000-0x11afffff]: assigned
> [    0.331624] pci 0000:00:02.4: bridge window [mem 0x8001800000-0x80019fffff 64bit pref]: assigned
> [    0.331626] pci 0000:00:02.5: bridge window [mem 0x11b00000-0x11cfffff]: assigned
> [    0.331628] pci 0000:00:02.5: bridge window [mem 0x8001a00000-0x8001bfffff 64bit pref]: assigned
> [    0.331631] pci 0000:00:01.0: BAR 0 [mem 0x11d00000-0x11d00fff]: assigned
> [    0.332460] pci 0000:00:01.0: bridge window [io  0x1000-0x1fff]: assigned
> [    0.332466] pci 0000:00:01.1: BAR 0 [mem 0x11d01000-0x11d01fff]: assigned
> [    0.333170] pci 0000:00:01.1: bridge window [io  0x2000-0x2fff]: assigned
> [    0.333176] pci 0000:00:01.2: BAR 0 [mem 0x11d02000-0x11d02fff]: assigned
> [    0.333905] pci 0000:00:01.2: bridge window [io  0x3000-0x3fff]: assigned
> [    0.333910] pci 0000:00:01.3: BAR 0 [mem 0x11d03000-0x11d03fff]: assigned
> [    0.334573] pci 0000:00:01.3: bridge window [io  0x4000-0x4fff]: assigned
> [    0.334577] pci 0000:00:01.4: BAR 0 [mem 0x11d04000-0x11d04fff]: assigned
> [    0.335638] pci 0000:00:01.4: bridge window [io  0x5000-0x5fff]: assigned
> [    0.335642] pci 0000:00:01.5: BAR 0 [mem 0x11d05000-0x11d05fff]: assigned
> [    0.336653] pci 0000:00:01.5: bridge window [io  0x6000-0x6fff]: assigned
> [    0.336657] pci 0000:00:01.6: BAR 0 [mem 0x11d06000-0x11d06fff]: assigned
> [    0.337659] pci 0000:00:01.6: bridge window [io  0x7000-0x7fff]: assigned
> [    0.337663] pci 0000:00:01.7: BAR 0 [mem 0x11d07000-0x11d07fff]: assigned
> [    0.338691] pci 0000:00:01.7: bridge window [io  0x8000-0x8fff]: assigned
> [    0.338695] pci 0000:00:02.0: BAR 0 [mem 0x11d08000-0x11d08fff]: assigned
> [    0.339727] pci 0000:00:02.0: bridge window [io  0x9000-0x9fff]: assigned
> [    0.339731] pci 0000:00:02.1: BAR 0 [mem 0x11d09000-0x11d09fff]: assigned
> [    0.340955] pci 0000:00:02.1: bridge window [io  0xa000-0xafff]: assigned
> [    0.340959] pci 0000:00:02.2: BAR 0 [mem 0x11d0a000-0x11d0afff]: assigned
> [    0.341990] pci 0000:00:02.2: bridge window [io  0xb000-0xbfff]: assigned
> [    0.341994] pci 0000:00:02.3: BAR 0 [mem 0x11d0b000-0x11d0bfff]: assigned
> [    0.343003] pci 0000:00:02.3: bridge window [io  0xc000-0xcfff]: assigned
> [    0.343007] pci 0000:00:02.4: BAR 0 [mem 0x11d0c000-0x11d0cfff]: assigned
> [    0.344040] pci 0000:00:02.4: bridge window [io  0xd000-0xdfff]: assigned
> [    0.344045] pci 0000:00:02.5: BAR 0 [mem 0x11d0d000-0x11d0dfff]: assigned
> [    0.345028] pci 0000:00:02.5: bridge window [io  0xe000-0xefff]: assigned
> [    0.345069] pci 0000:01:00.0: ROM [mem 0x10000000-0x1003ffff pref]: assigned
> [    0.345072] pci 0000:01:00.0: BAR 4 [mem 0x8000000000-0x8000003fff 64bit pref]: assigned
> [    0.345113] pci 0000:01:00.0: BAR 1 [mem 0x10040000-0x10040fff]: assigned
> [    0.345125] pci 0000:00:01.0: PCI bridge to [bus 01]
> [    0.345131] pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
> [    0.346745] pci 0000:00:01.0:   bridge window [mem 0x10000000-0x102fffff]
> [    0.347804] pci 0000:00:01.0:   bridge window [mem 0x8000000000-0x80001fffff 64bit pref]
> [    0.350102] pci 0000:02:00.0: BAR 0 [mem 0x10300000-0x10303fff 64bit]: assigned
> [    0.350142] pci 0000:00:01.1: PCI bridge to [bus 02]
> [    0.352210] pci 0000:00:01.1:   bridge window [io  0x2000-0x2fff]
> [    0.355294] pci 0000:00:01.1:   bridge window [mem 0x10300000-0x104fffff]
> [    0.356048] pci 0000:00:01.1:   bridge window [mem 0x8000200000-0x80003fffff 64bit pref]
> [    0.357580] pci 0000:03:00.0: BAR 4 [mem 0x8000400000-0x8000403fff 64bit pref]: assigned
> [    0.359053] pci 0000:03:00.0: BAR 1 [mem 0x10500000-0x10500fff]: assigned
> [    0.359855] pci 0000:00:01.2: PCI bridge to [bus 03]
> [    0.359865] pci 0000:00:01.2:   bridge window [io  0x3000-0x3fff]
> [    0.360972] pci 0000:00:01.2:   bridge window [mem 0x10500000-0x106fffff]
> [    0.361704] pci 0000:00:01.2:   bridge window [mem 0x8000400000-0x80005fffff 64bit pref]
> [    0.363377] pci 0000:04:00.0: BAR 4 [mem 0x8000600000-0x8000603fff 64bit pref]: assigned
> [    0.364843] pci 0000:04:00.0: BAR 1 [mem 0x10700000-0x10700fff]: assigned
> [    0.365468] pci 0000:00:01.3: PCI bridge to [bus 04]
> [    0.365478] pci 0000:00:01.3:   bridge window [io  0x4000-0x4fff]
> [    0.366671] pci 0000:00:01.3:   bridge window [mem 0x10700000-0x108fffff]
> [    0.367494] pci 0000:00:01.3:   bridge window [mem 0x8000600000-0x80007fffff 64bit pref]
> [    0.369312] pci 0000:05:00.0: BAR 4 [mem 0x8000800000-0x8000803fff 64bit pref]: assigned
> [    0.369354] pci 0000:00:01.4: PCI bridge to [bus 05]
> [    0.371237] pci 0000:00:01.4:   bridge window [io  0x5000-0x5fff]
> [    0.372437] pci 0000:00:01.4:   bridge window [mem 0x10900000-0x10afffff]
> [    0.373165] pci 0000:00:01.4:   bridge window [mem 0x8000800000-0x80009fffff 64bit pref]
> [    0.374645] pci 0000:06:00.0: BAR 4 [mem 0x8000a00000-0x8000a03fff 64bit pref]: assigned
> [    0.376090] pci 0000:06:00.0: BAR 1 [mem 0x10b00000-0x10b00fff]: assigned
> [    0.376760] pci 0000:00:01.5: PCI bridge to [bus 06]
> [    0.376769] pci 0000:00:01.5:   bridge window [io  0x6000-0x6fff]
> [    0.377827] pci 0000:00:01.5:   bridge window [mem 0x10b00000-0x10cfffff]
> [    0.378569] pci 0000:00:01.5:   bridge window [mem 0x8000a00000-0x8000bfffff 64bit pref]
> [    0.380103] pci 0000:07:00.0: BAR 4 [mem 0x8000c00000-0x8000c03fff 64bit pref]: assigned
> [    0.380142] pci 0000:07:00.0: BAR 1 [mem 0x10d00000-0x10d00fff]: assigned
> [    0.381282] pci 0000:00:01.6: PCI bridge to [bus 07]
> [    0.381291] pci 0000:00:01.6:   bridge window [io  0x7000-0x7fff]
> [    0.382488] pci 0000:00:01.6:   bridge window [mem 0x10d00000-0x10efffff]
> [    0.383240] pci 0000:00:01.6:   bridge window [mem 0x8000c00000-0x8000dfffff 64bit pref]
> [    0.384724] pci 0000:08:00.0: BAR 4 [mem 0x8000e00000-0x8000e03fff 64bit pref]: assigned
> [    0.384768] pci 0000:08:00.0: BAR 1 [mem 0x10f00000-0x10f00fff]: assigned
> [    0.384781] pci 0000:00:01.7: PCI bridge to [bus 08]
> [    0.386612] pci 0000:00:01.7:   bridge window [io  0x8000-0x8fff]
> [    0.388596] pci 0000:00:01.7:   bridge window [mem 0x10f00000-0x110fffff]
> [    0.389419] pci 0000:00:01.7:   bridge window [mem 0x8000e00000-0x8000ffffff 64bit pref]
> [    0.390919] pci 0000:09:00.0: BAR 4 [mem 0x8001000000-0x8001003fff 64bit pref]: assigned
> [    0.390959] pci 0000:09:00.0: BAR 1 [mem 0x11100000-0x11100fff]: assigned
> [    0.390996] pci 0000:00:02.0: PCI bridge to [bus 09]
> [    0.391003] pci 0000:00:02.0:   bridge window [io  0x9000-0x9fff]
> [    0.392170] pci 0000:00:02.0:   bridge window [mem 0x11100000-0x112fffff]
> [    0.392929] pci 0000:00:02.0:   bridge window [mem 0x8001000000-0x80011fffff 64bit pref]
> [    0.394406] pci 0000:00:02.1: PCI bridge to [bus 0a]
> [    0.394439] pci 0000:00:02.1:   bridge window [io  0xa000-0xafff]
> [    0.395599] pci 0000:00:02.1:   bridge window [mem 0x11300000-0x114fffff]
> [    0.396341] pci 0000:00:02.1:   bridge window [mem 0x8001200000-0x80013fffff 64bit pref]
> [    0.397821] pci 0000:00:02.2: PCI bridge to [bus 0b]
> [    0.397833] pci 0000:00:02.2:   bridge window [io  0xb000-0xbfff]
> [    0.401036] pci 0000:00:02.2:   bridge window [mem 0x11500000-0x116fffff]
> [    0.402135] pci 0000:00:02.2:   bridge window [mem 0x8001400000-0x80015fffff 64bit pref]
> [    0.403681] pci 0000:00:02.3: PCI bridge to [bus 0c]
> [    0.403695] pci 0000:00:02.3:   bridge window [io  0xc000-0xcfff]
> [    0.404815] pci 0000:00:02.3:   bridge window [mem 0x11700000-0x118fffff]
> [    0.405584] pci 0000:00:02.3:   bridge window [mem 0x8001600000-0x80017fffff 64bit pref]
> [    0.407094] pci 0000:00:02.4: PCI bridge to [bus 0d]
> [    0.407107] pci 0000:00:02.4:   bridge window [io  0xd000-0xdfff]
> [    0.408232] pci 0000:00:02.4:   bridge window [mem 0x11900000-0x11afffff]
> [    0.408978] pci 0000:00:02.4:   bridge window [mem 0x8001800000-0x80019fffff 64bit pref]
> [    0.410442] pci 0000:00:02.5: PCI bridge to [bus 0e]
> [    0.410454] pci 0000:00:02.5:   bridge window [io  0xe000-0xefff]
> [    0.411653] pci 0000:00:02.5:   bridge window [mem 0x11b00000-0x11cfffff]
> [    0.412444] pci 0000:00:02.5:   bridge window [mem 0x8001a00000-0x8001bfffff 64bit pref]
> [    0.414126] pci_bus 0000:00: resource 4 [mem 0x10000000-0x3efeffff window]
> [    0.414131] pci_bus 0000:00: resource 5 [io  0x0000-0xffff window]
> [    0.414133] pci_bus 0000:00: resource 6 [mem 0x8000000000-0xffffffffff window]
> [    0.414135] pci_bus 0000:01: resource 0 [io  0x1000-0x1fff]
> [    0.414136] pci_bus 0000:01: resource 1 [mem 0x10000000-0x102fffff]
> [    0.414138] pci_bus 0000:01: resource 2 [mem 0x8000000000-0x80001fffff 64bit pref]
> [    0.414141] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
> [    0.414142] pci_bus 0000:02: resource 1 [mem 0x10300000-0x104fffff]
> [    0.414144] pci_bus 0000:02: resource 2 [mem 0x8000200000-0x80003fffff 64bit pref]
> [    0.414146] pci_bus 0000:03: resource 0 [io  0x3000-0x3fff]
> [    0.414147] pci_bus 0000:03: resource 1 [mem 0x10500000-0x106fffff]
> [    0.414149] pci_bus 0000:03: resource 2 [mem 0x8000400000-0x80005fffff 64bit pref]
> [    0.414151] pci_bus 0000:04: resource 0 [io  0x4000-0x4fff]
> [    0.414152] pci_bus 0000:04: resource 1 [mem 0x10700000-0x108fffff]
> [    0.414154] pci_bus 0000:04: resource 2 [mem 0x8000600000-0x80007fffff 64bit pref]
> [    0.414156] pci_bus 0000:05: resource 0 [io  0x5000-0x5fff]
> [    0.414157] pci_bus 0000:05: resource 1 [mem 0x10900000-0x10afffff]
> [    0.414159] pci_bus 0000:05: resource 2 [mem 0x8000800000-0x80009fffff 64bit pref]
> [    0.414161] pci_bus 0000:06: resource 0 [io  0x6000-0x6fff]
> [    0.414162] pci_bus 0000:06: resource 1 [mem 0x10b00000-0x10cfffff]
> [    0.414164] pci_bus 0000:06: resource 2 [mem 0x8000a00000-0x8000bfffff 64bit pref]
> [    0.414166] pci_bus 0000:07: resource 0 [io  0x7000-0x7fff]
> [    0.414167] pci_bus 0000:07: resource 1 [mem 0x10d00000-0x10efffff]
> [    0.414168] pci_bus 0000:07: resource 2 [mem 0x8000c00000-0x8000dfffff 64bit pref]
> [    0.414171] pci_bus 0000:08: resource 0 [io  0x8000-0x8fff]
> [    0.414172] pci_bus 0000:08: resource 1 [mem 0x10f00000-0x110fffff]
> [    0.414173] pci_bus 0000:08: resource 2 [mem 0x8000e00000-0x8000ffffff 64bit pref]
> [    0.414175] pci_bus 0000:09: resource 0 [io  0x9000-0x9fff]
> [    0.414177] pci_bus 0000:09: resource 1 [mem 0x11100000-0x112fffff]
> [    0.414178] pci_bus 0000:09: resource 2 [mem 0x8001000000-0x80011fffff 64bit pref]
> [    0.414180] pci_bus 0000:0a: resource 0 [io  0xa000-0xafff]
> [    0.414181] pci_bus 0000:0a: resource 1 [mem 0x11300000-0x114fffff]
> [    0.414183] pci_bus 0000:0a: resource 2 [mem 0x8001200000-0x80013fffff 64bit pref]
> [    0.414185] pci_bus 0000:0b: resource 0 [io  0xb000-0xbfff]
> [    0.414186] pci_bus 0000:0b: resource 1 [mem 0x11500000-0x116fffff]
> [    0.414187] pci_bus 0000:0b: resource 2 [mem 0x8001400000-0x80015fffff 64bit pref]
> [    0.414189] pci_bus 0000:0c: resource 0 [io  0xc000-0xcfff]
> [    0.414191] pci_bus 0000:0c: resource 1 [mem 0x11700000-0x118fffff]
> [    0.414192] pci_bus 0000:0c: resource 2 [mem 0x8001600000-0x80017fffff 64bit pref]
> [    0.414194] pci_bus 0000:0d: resource 0 [io  0xd000-0xdfff]
> [    0.414196] pci_bus 0000:0d: resource 1 [mem 0x11900000-0x11afffff]
> [    0.414197] pci_bus 0000:0d: resource 2 [mem 0x8001800000-0x80019fffff 64bit pref]
> [    0.414199] pci_bus 0000:0e: resource 0 [io  0xe000-0xefff]
> [    0.414200] pci_bus 0000:0e: resource 1 [mem 0x11b00000-0x11cfffff]
> [    0.414201] pci_bus 0000:0e: resource 2 [mem 0x8001a00000-0x8001bfffff 64bit pref]
> [    0.417297] iommu: Default domain type: Translated
> [    0.417301] iommu: DMA domain TLB invalidation policy: lazy mode
> [    0.419093] SCSI subsystem initialized
> [    0.419105] ACPI: bus type USB registered
> [    0.419139] usbcore: registered new interface driver usbfs
> [    0.419156] usbcore: registered new interface driver hub
> [    0.419165] usbcore: registered new device driver usb
> [    0.419218] pps_core: LinuxPPS API ver. 1 registered
> [    0.419219] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.419223] PTP clock support registered
> [    0.419244] scmi_core: SCMI protocol bus registered
> [    0.419338] efivars: Registered efivars operations
> [    0.420128] NetLabel: Initializing
> [    0.420130] NetLabel:  domain hash size = 128
> [    0.420131] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
> [    0.420160] NetLabel:  unlabeled traffic allowed by default
> [    0.420270] vgaarb: loaded
> [    0.431834] clocksource: Switched to clocksource arch_sys_counter
> [    0.435203] VFS: Disk quotas dquot_6.6.0
> [    0.435276] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
> [    0.436098] pnp: PnP ACPI init
> [    0.436313] system 00:00: [mem 0x4010000000-0x401fffffff window] could not be reserved
> [    0.436330] pnp: PnP ACPI: found 1 devices
> [    0.438327] NET: Registered PF_INET protocol family
> [    0.439003] IP idents hash table entries: 131072 (order: 4, 1048576 bytes, linear)
> [    0.456426] tcp_listen_portaddr_hash hash table entries: 4096 (order: 0, 65536 bytes, linear)
> [    0.456469] Table-perturb hash table entries: 65536 (order: 2, 262144 bytes, linear)
> [    0.456538] TCP established hash table entries: 65536 (order: 3, 524288 bytes, linear)
> [    0.456743] TCP bind hash table entries: 65536 (order: 5, 2097152 bytes, linear)
> [    0.458394] TCP: Hash tables configured (established 65536 bind 65536)
> [    0.458547] MPTCP token hash table entries: 8192 (order: 1, 196608 bytes, linear)
> [    0.458615] UDP hash table entries: 4096 (order: 2, 262144 bytes, linear)
> [    0.458743] UDP-Lite hash table entries: 4096 (order: 2, 262144 bytes, linear)
> [    0.459151] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.459178] NET: Registered PF_XDP protocol family
> [    0.460700] pci 0000:02:00.0: enabling device (0000 -> 0002)
> [    0.461692] PCI: CLS 0 bytes, default 64
> [    0.461860] Unpacking initramfs...
> [    0.464155] Initialise system trusted keyrings
> [    0.464222] Key type blacklist registered
> [    0.464858] workingset: timestamp_bits=37 max_order=17 bucket_order=0
> [    0.475072] cryptd: max_cpu_qlen set to 1000
> [    0.493746] NET: Registered PF_ALG protocol family
> [    0.493766] Key type asymmetric registered
> [    0.493772] Asymmetric key parser 'x509' registered
> [    0.493973] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
> [    0.494469] io scheduler mq-deadline registered
> [    0.494472] io scheduler kyber registered
> [    0.494547] io scheduler bfq registered
> [    0.496916] atomic64_test: passed
> [    0.497746] ACPI: \_SB_.L001: Enabled at IRQ 36
> [    0.500700] pcieport 0000:00:01.0: PME: Signaling with IRQ 50
> [    0.501430] pcieport 0000:00:01.0: AER: enabled with IRQ 50
> [    0.501584] pcieport 0000:00:01.0: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.504140] pcieport 0000:00:01.1: PME: Signaling with IRQ 51
> [    0.504936] pcieport 0000:00:01.1: AER: enabled with IRQ 51
> [    0.505049] pcieport 0000:00:01.1: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.510046] pcieport 0000:00:01.2: PME: Signaling with IRQ 52
> [    0.510380] pcieport 0000:00:01.2: AER: enabled with IRQ 52
> [    0.510441] pcieport 0000:00:01.2: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.513638] pcieport 0000:00:01.3: PME: Signaling with IRQ 53
> [    0.514220] pcieport 0000:00:01.3: AER: enabled with IRQ 53
> [    0.514287] pcieport 0000:00:01.3: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.517521] pcieport 0000:00:01.4: PME: Signaling with IRQ 54
> [    0.517878] pcieport 0000:00:01.4: AER: enabled with IRQ 54
> [    0.517948] pcieport 0000:00:01.4: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.522678] pcieport 0000:00:01.5: PME: Signaling with IRQ 55
> [    0.525158] pcieport 0000:00:01.5: AER: enabled with IRQ 55
> [    0.525254] pcieport 0000:00:01.5: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.528299] pcieport 0000:00:01.6: PME: Signaling with IRQ 56
> [    0.528821] pcieport 0000:00:01.6: AER: enabled with IRQ 56
> [    0.528901] pcieport 0000:00:01.6: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.533030] pcieport 0000:00:01.7: PME: Signaling with IRQ 57
> [    0.533630] pcieport 0000:00:01.7: AER: enabled with IRQ 57
> [    0.533700] pcieport 0000:00:01.7: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.534749] ACPI: \_SB_.L002: Enabled at IRQ 37
> [    0.536785] pcieport 0000:00:02.0: PME: Signaling with IRQ 58
> [    0.537282] pcieport 0000:00:02.0: AER: enabled with IRQ 58
> [    0.537364] pcieport 0000:00:02.0: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.547134] pcieport 0000:00:02.1: PME: Signaling with IRQ 59
> [    0.547583] pcieport 0000:00:02.1: AER: enabled with IRQ 59
> [    0.547643] pcieport 0000:00:02.1: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.550654] pcieport 0000:00:02.2: PME: Signaling with IRQ 60
> [    0.551183] pcieport 0000:00:02.2: AER: enabled with IRQ 60
> [    0.551251] pcieport 0000:00:02.2: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.555616] pcieport 0000:00:02.3: PME: Signaling with IRQ 61
> [    0.556181] pcieport 0000:00:02.3: AER: enabled with IRQ 61
> [    0.556258] pcieport 0000:00:02.3: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.559306] pcieport 0000:00:02.4: PME: Signaling with IRQ 62
> [    0.559760] pcieport 0000:00:02.4: AER: enabled with IRQ 62
> [    0.559864] pcieport 0000:00:02.4: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.562627] pcieport 0000:00:02.5: PME: Signaling with IRQ 63
> [    0.564958] pcieport 0000:00:02.5: AER: enabled with IRQ 63
> [    0.565031] pcieport 0000:00:02.5: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    0.567242] virtio-pci 0000:01:00.0: enabling device (0000 -> 0002)
> [    0.572621] virtio-pci 0000:05:00.0: enabling device (0000 -> 0002)
> [    0.575885] virtio-pci 0000:07:00.0: enabling device (0000 -> 0002)
> [    0.579820] virtio-pci 0000:08:00.0: enabling device (0000 -> 0002)
> [    0.582976] virtio-pci 0000:09:00.0: enabling device (0000 -> 0002)
> [    0.586215] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [    0.590523] ACPI: bus type drm_connector registered
> [    0.591658] Unable to handle kernel paging request at virtual address fefefefefefeffba
> [    0.591662] Mem abort info:
> [    0.591662]   ESR = 0x0000000096000004
> [    0.591664]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.591665]   SET = 0, FnV = 0
> [    0.591666]   EA = 0, S1PTW = 0
> [    0.591667]   FSC = 0x04: level 0 translation fault
> [    0.591668] Data abort info:
> [    0.591669]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    0.591670]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    0.591671]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    0.591673] [fefefefefefeffba] address between user and kernel address ranges
> [    0.591675] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    0.782557] Freeing initrd memory: 29504K
> [    0.849513] Modules linked in:
> [    0.849987] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-custom+ #121 PREEMPT(voluntary) 
> [    0.851281] Hardware name: QEMU KVM Virtual Machine, BIOS unknown 2/2/2022
> [    0.852223] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.853160] pc : kobject_put+0x18/0xc8
> [    0.853674] lr : of_node_put+0x20/0x38
> [    0.854202] sp : ffff80008010fcd0
> [    0.854662] x29: ffff80008010fcd0 x28: 0000000000000000 x27: ffffd2503c550130
> [    0.855633] x26: ffffd2503c651960 x25: 0000000000000006 x24: ffffd2503c761fc4
> [    0.856631] x23: ffffd2503c083140 x22: 0000000000000000 x21: 0000000000000000
> [    0.857609] x20: 0000000000000000 x19: fefefefefefeff7e x18: 0000000000000000
> [    0.858603] x17: ffffd2503ca54b10 x16: 00000000c041c2e1 x15: 0000000000000000
> [    0.859501] x14: 0000000000000000 x13: 00000000ffffffff x12: 6265722d6e6f6373
> [    0.860434] x11: ffff80008010fbb0 x10: 0000000000000073 x9 : ffffd2503c5a671c
> [    0.861418] x8 : ffff80008010fcf8 x7 : fefefefefefefefe x6 : 0000000ef878d830
> [    0.862417] x5 : ffffd2503ca54b52 x4 : 0000000000000000 x3 : ffffd2503bff0158
> [    0.863414] x2 : 000000000000000f x1 : ffff6a2842a80000 x0 : fefefefefefeff7e
> [    0.864410] Call trace:
> [    0.864747]  kobject_put+0x18/0xc8 (P)
> [    0.865277]  of_node_put+0x20/0x38
> [    0.865757]  psci_idle_init+0x6c/0xe8
> [    0.866308]  do_one_initcall+0x60/0x2b0
> [    0.866871]  do_initcalls+0x100/0x148
> [    0.867388]  kernel_init_freeable+0x188/0x1e0
> [    0.868002]  kernel_init+0x28/0x158
> [    0.868485]  ret_from_fork+0x10/0x20
> [    0.868995] Code: a9be7bfd 910003fd f9000bf3 aa0003f3 (3940f000) 
> [    0.869845] ---[ end trace 0000000000000000 ]---
> [    0.870568] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    0.871567] SMP: stopping secondary CPUs
> [    0.872160] Kernel Offset: 0x524fbadc0000 from 0xffff800080000000
> [    0.872990] PHYS_OFFSET: 0xffffc389c0000000
> [    0.873572] CPU features: 0x0800,000000e0,01002650,8201720b
> [    0.874359] Memory Limit: none
> [    0.874789] Rebooting in 5 seconds..

> <domain type='kvm' id='1'>
>   <name>btrfs-aarch64</name>
>   <uuid>7142a714-06dc-47ef-b675-4d4bb9f723b0</uuid>
>   <metadata>
>     <libosinfo:libosinfo xmlns:libosinfo="http://libosinfo.org/xmlns/libvirt/domain/1.0">
>       <libosinfo:os id="http://archlinux.org/archlinux/rolling"/>
>     </libosinfo:libosinfo>
>   </metadata>
>   <memory unit='KiB'>8388608</memory>
>   <currentMemory unit='KiB'>8388608</currentMemory>
>   <vcpu placement='static' cpuset='4-7'>4</vcpu>
>   <resource>
>     <partition>/machine</partition>
>   </resource>
>   <os firmware='efi'>
>     <type arch='aarch64' machine='virt-8.2'>hvm</type>
>     <firmware>
>       <feature enabled='no' name='enrolled-keys'/>
>       <feature enabled='no' name='secure-boot'/>
>     </firmware>
>     <loader readonly='yes' type='pflash' format='raw'>/usr/share/edk2/aarch64/QEMU_CODE.fd</loader>
>     <nvram template='/usr/share/edk2/aarch64/QEMU_VARS.fd' templateFormat='raw' format='raw'>/var/lib/libvirt/qemu/nvram/btrfs-aarch64_VARS.fd</nvram>
>   </os>
>   <features>
>     <acpi/>
>     <gic version='3'/>
>   </features>
>   <cpu mode='host-passthrough' check='none'/>
>   <clock offset='utc'/>
>   <on_poweroff>destroy</on_poweroff>
>   <on_reboot>restart</on_reboot>
>   <on_crash>destroy</on_crash>
>   <devices>
>     <emulator>/usr/bin/qemu-system-aarch64</emulator>
>     <disk type='file' device='disk'>
>       <driver name='qemu' type='raw' cache='unsafe'/>
>       <source file='/home/libvirt/test.img' index='3'/>
>       <backingStore/>
>       <target dev='vdb' bus='virtio'/>
>       <alias name='virtio-disk1'/>
>       <address type='pci' domain='0x0000' bus='0x08' slot='0x00' function='0x0'/>
>     </disk>
>     <disk type='file' device='disk'>
>       <driver name='qemu' type='raw' cache='unsafe'/>
>       <source file='/home/libvirt/zbc.img' index='2'/>
>       <backingStore/>
>       <target dev='vdc' bus='virtio'/>
>       <alias name='virtio-disk2'/>
>       <address type='pci' domain='0x0000' bus='0x09' slot='0x00' function='0x0'/>
>     </disk>
>     <disk type='file' device='disk'>
>       <driver name='qemu' type='raw'/>
>       <source file='/home/libvirt/btrfs.raw' index='1'/>
>       <backingStore/>
>       <target dev='vdd' bus='virtio'/>
>       <boot order='1'/>
>       <alias name='virtio-disk3'/>
>       <address type='pci' domain='0x0000' bus='0x04' slot='0x00' function='0x0'/>
>     </disk>
>     <controller type='usb' index='0' model='qemu-xhci' ports='15'>
>       <alias name='usb'/>
>       <address type='pci' domain='0x0000' bus='0x02' slot='0x00' function='0x0'/>
>     </controller>
>     <controller type='pci' index='0' model='pcie-root'>
>       <alias name='pcie.0'/>
>     </controller>
>     <controller type='pci' index='1' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='1' port='0x8'/>
>       <alias name='pci.1'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x0' multifunction='on'/>
>     </controller>
>     <controller type='pci' index='2' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='2' port='0x9'/>
>       <alias name='pci.2'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x1'/>
>     </controller>
>     <controller type='pci' index='3' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='3' port='0xa'/>
>       <alias name='pci.3'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x2'/>
>     </controller>
>     <controller type='pci' index='4' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='4' port='0xb'/>
>       <alias name='pci.4'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x3'/>
>     </controller>
>     <controller type='pci' index='5' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='5' port='0xc'/>
>       <alias name='pci.5'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x4'/>
>     </controller>
>     <controller type='pci' index='6' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='6' port='0xd'/>
>       <alias name='pci.6'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x5'/>
>     </controller>
>     <controller type='pci' index='7' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='7' port='0xe'/>
>       <alias name='pci.7'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x6'/>
>     </controller>
>     <controller type='pci' index='8' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='8' port='0xf'/>
>       <alias name='pci.8'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x7'/>
>     </controller>
>     <controller type='pci' index='9' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='9' port='0x10'/>
>       <alias name='pci.9'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x0' multifunction='on'/>
>     </controller>
>     <controller type='pci' index='10' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='10' port='0x11'/>
>       <alias name='pci.10'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x1'/>
>     </controller>
>     <controller type='pci' index='11' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='11' port='0x12'/>
>       <alias name='pci.11'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x2'/>
>     </controller>
>     <controller type='pci' index='12' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='12' port='0x13'/>
>       <alias name='pci.12'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x3'/>
>     </controller>
>     <controller type='pci' index='13' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='13' port='0x14'/>
>       <alias name='pci.13'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x4'/>
>     </controller>
>     <controller type='pci' index='14' model='pcie-root-port'>
>       <model name='pcie-root-port'/>
>       <target chassis='14' port='0x15'/>
>       <alias name='pci.14'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x5'/>
>     </controller>
>     <controller type='virtio-serial' index='0'>
>       <alias name='virtio-serial0'/>
>       <address type='pci' domain='0x0000' bus='0x03' slot='0x00' function='0x0'/>
>     </controller>
>     <controller type='scsi' index='0' model='virtio-scsi'>
>       <alias name='scsi0'/>
>       <address type='pci' domain='0x0000' bus='0x07' slot='0x00' function='0x0'/>
>     </controller>
>     <interface type='bridge'>
>       <mac address='52:54:00:78:fc:3f'/>
>       <source bridge='br0'/>
>       <target dev='vnet0'/>
>       <model type='virtio'/>
>       <alias name='net0'/>
>       <address type='pci' domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
>     </interface>
>     <serial type='pty'>
>       <source path='/dev/pts/0'/>
>       <target type='system-serial' port='0'>
>         <model name='pl011'/>
>       </target>
>       <alias name='serial0'/>
>     </serial>
>     <console type='pty' tty='/dev/pts/0'>
>       <source path='/dev/pts/0'/>
>       <target type='serial' port='0'/>
>       <alias name='serial0'/>
>     </console>
>     <channel type='unix'>
>       <source mode='bind' path='/run/libvirt/qemu/channel/1-btrfs-aarch64/org.qemu.guest_agent.0'/>
>       <target type='virtio' name='org.qemu.guest_agent.0' state='disconnected'/>
>       <alias name='channel0'/>
>       <address type='virtio-serial' controller='0' bus='0' port='1'/>
>     </channel>
>     <audio id='1' type='none'/>
>     <memballoon model='virtio'>
>       <alias name='balloon0'/>
>       <address type='pci' domain='0x0000' bus='0x05' slot='0x00' function='0x0'/>
>     </memballoon>
>     <rng model='virtio'>
>       <backend model='random'>/dev/urandom</backend>
>       <alias name='rng0'/>
>       <address type='pci' domain='0x0000' bus='0x06' slot='0x00' function='0x0'/>
>     </rng>
>   </devices>
>   <seclabel type='dynamic' model='dac' relabel='yes'>
>     <label>+970:+970</label>
>     <imagelabel>+970:+970</imagelabel>
>   </seclabel>
> </domain>
> 

