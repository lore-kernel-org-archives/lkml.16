Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D717213252
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714122; cv=none; b=BFBBHQTZ9zLjcO4qWbo4nA5iYQ91wYmd8ybzZpGqzgbUh8ixK6CYPIx3eAoc8C+aym4rQEOSZn8o2boeAGDGdftlfAjXxMKrpBy7ITg5+yDqw42TgunOa5+jfwbUlN1F06xWeyxy5tslmJZi10Au8EZavx256VvCM7hS0o96/AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714122; c=relaxed/simple;
	bh=tj1Qo8TLPXU9kvMrUYBKLHFobGqwkIj6Yo3lsD6wCkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW+Doy19JPQuerUYHkcFK8sUh7kg5XC+W3QrhbJLaX9/hfd6bizej0XKDTnmVtO56VKPvfyMcfV57ZY1vZ89iw8tH39xSYYccVIoadl96BNVjb1vQp7Pr/zVE8ME0QMuGjD1vu+fJKGKm3GCeOmKhiTSaqC/EGfScXp/z0j+6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAzy1iPh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAzy1iPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9C3C4CEEA;
	Thu, 12 Jun 2025 07:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749714121;
	bh=tj1Qo8TLPXU9kvMrUYBKLHFobGqwkIj6Yo3lsD6wCkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAzy1iPhW/qilELZbM/ShoF62nq3NY0TI4L2oOx2nq+5eGozBHH7ox6rdoTwNs0xn
	 gOXTP9iZFhiBLVDYgoZhL1M/RW9vFUnoBtLpzQeHWbVZi4EoOGjH8RPkzQcC9J/LbZ
	 bBbXQvhN0o0Ofk/P19EeG+JgS/DQtMEdkI0v9DBCLpXSM7H80Uopx8OQhmBWTIQMU1
	 DGZvBFcinVCkCTGGku5j8EboHbSdouVkv5/AnhMNz5qVuQuCv1fe3Zi6+Iz0JCEC2R
	 5FIlMel1hhoNpHOCYnAbLLUXFvgQw4s+gjC+O0epWkIWyuweUsmUgg8qVVCW9Pal0G
	 IV3Xw6o3LuFWQ==
Date: Thu, 12 Jun 2025 10:41:57 +0300
From: Leon Romanovsky <leon@kernel.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Steve Wahl <steve.wahl@hpe.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	Vishal Chourasia <vishalc@linux.ibm.com>,
	samir <samir@linux.ibm.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
	srivatsa@csail.mit.edu, Michael Kelley <mhklinux@outlook.com>,
	Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
Message-ID: <20250612074157.GO10669@unreal>
References: <20250304160844.75373-1-steve.wahl@hpe.com>
 <20250304160844.75373-2-steve.wahl@hpe.com>
 <20250610110701.GA256154@unreal>
 <a5da2e4d-c042-4d01-bfc3-f50ca674247b@amd.com>
 <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com>
 <20250611060607.GM10669@unreal>
 <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>

On Wed, Jun 11, 2025 at 12:26:53PM +0530, K Prateek Nayak wrote:
> Hello Leon,
> 
> On 6/11/2025 11:36 AM, Leon Romanovsky wrote:
> > > I don't think that's the full dmesg output, maybe a console capture
> > > with reduced levels?  I'm not finding the output of sched_domain_debug() and
> > > sched_domain_debug_one() here.
> > It is not reduced, but standard debug level log, where KERN_DEBUG prints
> > aren't printed.
> > 
> > I don't know why sched_verbose is implemented how it is implemented,
> > but all these KERN_DEBUG prints in sched_domain_debug_one() are not controlled
> > through sched_verbose.
> 
> Sorry for this oversight! Would it be possible to get the logs with
> "ignore_loglevel" added to the kernel cmdline? Please and thank you.

 [    0.000000] Linux version 6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 (svc-nbu-sw-nic@kernel-build-19019-747zt-3xglw-0bkcj) (gcc (GCC) 14.2.1 20240912 (Red Hat 14.2.1-3), GNU ld version 2.41-38.fc40) #1 SMP Mon Jun  9 11:49:32 UTC 2025
 [    0.000000] Command line: BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 root=UUID=49650207-5673-41e8-9f3b-5572de97a271 ro selinux=0 kasan_multi_shot net.ifnames=0 biosdevname=0 console=tty0 console=ttyS1,115200 audit=0 systemd.unified_cgroup_hierarchy=0 sched_verbose ignore_loglevel
 [    0.000000] BIOS-provided physical RAM map:
 [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
 [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
 [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
 [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
 [    0.000000] BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
 [    0.000000] BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
 [    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
 [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
 [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
 [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000043fffffff] usable
 [    0.000000] printk: debug: ignoring loglevel setting.
 [    0.000000] NX (Execute Disable) protection: active
 [    0.000000] APIC: Static calls initialized
 [    0.000000] SMBIOS 2.8 present.
 [    0.000000] DMI: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
 [    0.000000] DMI: Memory slots populated: 1/1
 [    0.000000] Hypervisor detected: KVM
 [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
 [    0.000000] kvm-clock: using sched offset of 68382447374 cycles
 [    0.000002] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
 [    0.000008] tsc: Detected 2593.904 MHz processor
 [    0.000797] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
 [    0.000799] e820: remove [mem 0x000a0000-0x000fffff] usable
 [    0.000802] last_pfn = 0x440000 max_arch_pfn = 0x400000000
 [    0.000830] MTRR map: 4 entries (3 fixed + 1 variable; max 19), built from 8 variable MTRRs
 [    0.000834] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
 [    0.000869] last_pfn = 0x7ffdc max_arch_pfn = 0x400000000
 [    0.000878] Using GB pages for direct mapping
 [    0.001019] RAMDISK: [mem 0x3572a000-0x36b8cfff]
 [    0.001023] ACPI: Early table checksum verification disabled
 [    0.001036] ACPI: RSDP 0x00000000000F59B0 000014 (v00 BOCHS )
 [    0.001040] ACPI: RSDT 0x000000007FFE22A8 00003C (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
 [    0.001050] ACPI: FACP 0x000000007FFE1E53 0000F4 (v03 BOCHS  BXPCFACP 00000001 BXPC 00000001)
 [    0.001056] ACPI: DSDT 0x000000007FFDFC40 002213 (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
 [    0.001059] ACPI: FACS 0x000000007FFDFC00 000040
 [    0.001062] ACPI: APIC 0x000000007FFE1F47 0000C0 (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
 [    0.001065] ACPI: HPET 0x000000007FFE2007 000038 (v01 BOCHS  BXPCHPET 00000001 BXPC 00000001)
 [    0.001068] ACPI: SRAT 0x000000007FFE203F 0001E8 (v01 BOCHS  BXPCSRAT 00000001 BXPC 00000001)
 [    0.001071] ACPI: SLIT 0x000000007FFE2227 000045 (v01 BOCHS  BXPCSLIT 00000001 BXPC 00000001)
 [    0.001074] ACPI: MCFG 0x000000007FFE226C 00003C (v01 BOCHS  BXPCMCFG 00000001 BXPC 00000001)
 [    0.001076] ACPI: Reserving FACP table memory at [mem 0x7ffe1e53-0x7ffe1f46]
 [    0.001078] ACPI: Reserving DSDT table memory at [mem 0x7ffdfc40-0x7ffe1e52]
 [    0.001079] ACPI: Reserving FACS table memory at [mem 0x7ffdfc00-0x7ffdfc3f]
 [    0.001079] ACPI: Reserving APIC table memory at [mem 0x7ffe1f47-0x7ffe2006]
 [    0.001080] ACPI: Reserving HPET table memory at [mem 0x7ffe2007-0x7ffe203e]
 [    0.001080] ACPI: Reserving SRAT table memory at [mem 0x7ffe203f-0x7ffe2226]
 [    0.001081] ACPI: Reserving SLIT table memory at [mem 0x7ffe2227-0x7ffe226b]
 [    0.001082] ACPI: Reserving MCFG table memory at [mem 0x7ffe226c-0x7ffe22a7]
 [    0.001132] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0x0009ffff]
 [    0.001134] ACPI: SRAT: Node 0 PXM 0 [mem 0x00100000-0x7fffffff]
 [    0.001135] ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x13fffffff]
 [    0.001136] ACPI: SRAT: Node 1 PXM 1 [mem 0x140000000-0x1ffffffff]
 [    0.001137] ACPI: SRAT: Node 2 PXM 2 [mem 0x200000000-0x2bfffffff]
 [    0.001138] ACPI: SRAT: Node 3 PXM 3 [mem 0x2c0000000-0x37fffffff]
 [    0.001138] ACPI: SRAT: Node 4 PXM 4 [mem 0x380000000-0x43fffffff]
 [    0.001141] NUMA: Initialized distance table, cnt=5
 [    0.001143] NUMA: Node 0 [mem 0x00001000-0x0009ffff] + [mem 0x00100000-0x7fffffff] -> [mem 0x00001000-0x7fffffff]
 [    0.001145] NUMA: Node 0 [mem 0x00001000-0x7fffffff] + [mem 0x100000000-0x13fffffff] -> [mem 0x00001000-0x13fffffff]
 [    0.001150] NODE_DATA(0) allocated [mem 0x13fffc800-0x13fffffff]
 [    0.001156] NODE_DATA(1) allocated [mem 0x1ffffc800-0x1ffffffff]
 [    0.001161] NODE_DATA(2) allocated [mem 0x2bfffc800-0x2bfffffff]
 [    0.001165] NODE_DATA(3) allocated [mem 0x37fffc800-0x37fffffff]
 [    0.001170] NODE_DATA(4) allocated [mem 0x43fff9800-0x43fffcfff]
 [    0.001204] Zone ranges:
 [    0.001205]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
 [    0.001206]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
 [    0.001208]   Normal   [mem 0x0000000100000000-0x000000043fffffff]
 [    0.001209] Movable zone start for each node
 [    0.001209] Early memory node ranges
 [    0.001210]   node   0: [mem 0x0000000000001000-0x000000000009efff]
 [    0.001212]   node   0: [mem 0x0000000000100000-0x000000007ffdbfff]
 [    0.001213]   node   0: [mem 0x0000000100000000-0x000000013fffffff]
 [    0.001214]   node   1: [mem 0x0000000140000000-0x00000001ffffffff]
 [    0.001215]   node   2: [mem 0x0000000200000000-0x00000002bfffffff]
 [    0.001216]   node   3: [mem 0x00000002c0000000-0x000000037fffffff]
 [    0.001217]   node   4: [mem 0x0000000380000000-0x000000043fffffff]
 [    0.001218] Initmem setup node 0 [mem 0x0000000000001000-0x000000013fffffff]
 [    0.001220] Initmem setup node 1 [mem 0x0000000140000000-0x00000001ffffffff]
 [    0.001221] Initmem setup node 2 [mem 0x0000000200000000-0x00000002bfffffff]
 [    0.001222] Initmem setup node 3 [mem 0x00000002c0000000-0x000000037fffffff]
 [    0.001223] Initmem setup node 4 [mem 0x0000000380000000-0x000000043fffffff]
 [    0.001227] On node 0, zone DMA: 1 pages in unavailable ranges
 [    0.001263] On node 0, zone DMA: 97 pages in unavailable ranges
 [    0.007283] On node 0, zone Normal: 36 pages in unavailable ranges
 [    0.032111] ACPI: PM-Timer IO Port: 0x608
 [    0.032126] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
 [    0.032160] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
 [    0.032164] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
 [    0.032166] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
 [    0.032167] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
 [    0.032173] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
 [    0.032174] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
 [    0.032179] ACPI: Using ACPI (MADT) for SMP configuration information
 [    0.032180] ACPI: HPET id: 0x8086a201 base: 0xfed00000
 [    0.032184] TSC deadline timer available
 [    0.032188] CPU topo: Max. logical packages:  10
 [    0.032189] CPU topo: Max. logical dies:      10
 [    0.032189] CPU topo: Max. dies per package:   1
 [    0.032194] CPU topo: Max. threads per core:   1
 [    0.032194] CPU topo: Num. cores per package:     1
 [    0.032195] CPU topo: Num. threads per package:   1
 [    0.032195] CPU topo: Allowing 10 present CPUs plus 0 hotplug CPUs
 [    0.032209] kvm-guest: APIC: eoi() replaced with kvm_guest_apic_eoi_write()
 [    0.032217] kvm-guest: KVM setup pv remote TLB flush
 [    0.032219] kvm-guest: setup PV sched yield
 [    0.032234] [mem 0xc0000000-0xfed1bfff] available for PCI devices
 [    0.032237] Booting paravirtualized kernel on KVM
 [    0.032238] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
 [    0.036873] setup_percpu: NR_CPUS:512 nr_cpumask_bits:10 nr_cpu_ids:10 nr_node_ids:5
 [    0.038028] percpu: Embedded 53 pages/cpu s177240 r8192 d31656 u1048576
 [    0.038033] pcpu-alloc: s177240 r8192 d31656 u1048576 alloc=1*2097152
 [    0.038035] pcpu-alloc: [0] 00 01 [1] 02 03 [2] 04 05 [3] 06 07 
 [    0.038040] pcpu-alloc: [4] 08 09 
 [    0.038062] Kernel command line: BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 root=UUID=49650207-5673-41e8-9f3b-5572de97a271 ro selinux=0 kasan_multi_shot net.ifnames=0 biosdevname=0 console=tty0 console=ttyS1,115200 audit=0 systemd.unified_cgroup_hierarchy=0 sched_verbose ignore_loglevel
 [    0.038186] Unknown kernel command line parameters "kasan_multi_shot BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 selinux=0 biosdevname=0 audit=0", will be passed to user space.
 [    0.038199] random: crng init done
 [    0.038200] printk: log_buf_len individual max cpu contribution: 4096 bytes
 [    0.038201] printk: log_buf_len total cpu_extra contributions: 36864 bytes
 [    0.038201] printk: log_buf_len min size: 65536 bytes
 [    0.038295] printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
 [    0.038296] printk: early log buf free: 56704(86%)
 [    0.038437] software IO TLB: area num 16.
 [    0.049582] Fallback order for Node 0: 0 4 3 2 1 
 [    0.049586] Fallback order for Node 1: 1 4 3 2 0 
 [    0.049588] Fallback order for Node 2: 2 4 3 0 1 
 [    0.049591] Fallback order for Node 3: 3 4 1 0 2 
 [    0.049593] Fallback order for Node 4: 4 0 1 2 3 
 [    0.049598] Built 5 zonelists, mobility grouping on.  Total pages: 3932026
 [    0.049599] Policy zone: Normal
 [    0.049601] mem auto-init: stack:off, heap alloc:off, heap free:off
 [    0.073185] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=10, Nodes=5
 [    0.082951] ftrace: allocating 46168 entries in 182 pages
 [    0.082953] ftrace: allocated 182 pages with 5 groups
 [    0.083097] rcu: Hierarchical RCU implementation.
 [    0.083098] rcu: 	RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=10.
 [    0.083099] 	Rude variant of Tasks RCU enabled.
 [    0.083100] 	Tracing variant of Tasks RCU enabled.
 [    0.083100] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
 [    0.083101] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=10
 [    0.083110] RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=10.
 [    0.083112] RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=10.
 [    0.089648] NR_IRQS: 33024, nr_irqs: 504, preallocated irqs: 16
 [    0.089836] rcu: srcu_init: Setting srcu_struct sizes based on contention.
 [    0.100697] Console: colour VGA+ 80x25
 [    0.100700] printk: legacy console [tty0] enabled
 [    0.132430] printk: legacy console [ttyS1] enabled
 [    0.229785] ACPI: Core revision 20250404
 [    0.230478] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
 [    0.231809] APIC: Switch to symmetric I/O mode setup
 [    0.232506] kvm-guest: APIC: send_IPI_mask() replaced with kvm_send_ipi_mask()
 [    0.233506] kvm-guest: APIC: send_IPI_mask_allbutself() replaced with kvm_send_ipi_mask_allbutself()
 [    0.234730] kvm-guest: setup PV IPIs
 [    0.236077] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
 [    0.236911] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2563bd843df, max_idle_ns: 440795257314 ns
 [    0.238295] Calibrating delay loop (skipped) preset value.. 5187.80 BogoMIPS (lpj=10375616)
 [    0.242677] x86/cpu: User Mode Instruction Prevention (UMIP) activated
 [    0.243537] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
 [    0.244273] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
 [    0.245073] Speculative Store Bypass: Vulnerable
 [    0.245714] GDS: Unknown: Dependent on hypervisor status
 [    0.246511] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
 [    0.247580] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
 [    0.248414] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
 [    0.250296] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
 [    0.251201] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
 [    0.251970] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
 [    0.254507] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
 [    0.255330] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
 [    0.256198] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
 [    0.257000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
 [    0.257814] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
 [    0.258503] x86/fpu: xstate_offset[5]:  960, xstate_sizes[5]:   64
 [    0.259316] x86/fpu: xstate_offset[6]: 1024, xstate_sizes[6]:  512
 [    0.260115] x86/fpu: xstate_offset[7]: 1536, xstate_sizes[7]: 1024
 [    0.260921] x86/fpu: Enabled xstate features 0xff, context size is 2560 bytes, using 'compacted' format.
 [    0.262998] Freeing SMP alternatives memory: 48K
 [    0.263638] pid_max: default: 32768 minimum: 301
 [    0.264305] LSM: initializing lsm=capability
 [    0.264928] stackdepot: allocating hash table of 1048576 entries via kvcalloc
 [    0.272932] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, vmalloc hugepage)
 [    0.275571] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, vmalloc hugepage)
 [    0.276757] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, vmalloc)
 [    0.277798] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, vmalloc)
 [    0.278910] smpboot: CPU0: Intel(R) Xeon(R) Gold 6240 CPU @ 2.60GHz (family: 0x6, model: 0x55, stepping: 0x7)
 [    0.280313] Performance Events: Skylake events, full-width counters, Intel PMU driver.
 [    0.281375] ... version:                2
 [    0.281946] ... bit width:              48
 [    0.282295] ... generic registers:      4
 [    0.282463] ... value mask:             0000ffffffffffff
 [    0.283187] ... max period:             00007fffffffffff
 [    0.283911] ... fixed-purpose events:   3
 [    0.284485] ... event mask:             000000070000000f
 [    0.285356] signal: max sigframe size: 3216
 [    0.285969] rcu: Hierarchical SRCU implementation.
 [    0.286476] rcu: 	Max phase no-delay instances is 1000.
 [    0.287216] Timer migration: 2 hierarchy levels; 8 children per group; 1 crossnode level
 [    0.288498] smp: Bringing up secondary CPUs ...
 [    0.289225] smpboot: x86: Booting SMP configuration:
 [    0.289900] .... node  #0, CPUs:        #1
 [    0.290511] .... node  #1, CPUs:    #2  #3
 [    0.291559] .... node  #2, CPUs:    #4  #5
 [    0.292557] .... node  #3, CPUs:    #6  #7
 [    0.293593] .... node  #4, CPUs:    #8  #9
 [    0.326310] smp: Brought up 5 nodes, 10 CPUs
 [    0.327532] smpboot: Total of 10 processors activated (51878.08 BogoMIPS)
 [    0.329252] ------------[ cut here ]------------
 [    0.329252] WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2486 build_sched_domains+0xe67/0x13a0
 [    0.330608] Modules linked in:
 [    0.331050] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 #1 NONE 
 [    0.332386] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
 [    0.333767] RIP: 0010:build_sched_domains+0xe67/0x13a0
 [    0.334298] Code: ff ff 8b 6c 24 08 48 8b 44 24 68 65 48 2b 05 60 24 d0 01 0f 85 03 05 00 00 48 83 c4 70 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b e9 65 fe ff ff 48 c7 c7 28 fb 08 82 4c 89 44 24 28 c6 05 e4
 [    0.336635] RSP: 0000:ffff8881002efe30 EFLAGS: 00010202
 [    0.337326] RAX: 00000000ffffff01 RBX: 0000000000000002 RCX: 00000000ffffff01
 [    0.338234] RDX: 00000000fffffff6 RSI: 0000000000000300 RDI: ffff888100047168
 [    0.338523] RBP: 0000000000000000 R08: ffff888100047168 R09: 0000000000000000
 [    0.339425] R10: ffffffff830dee80 R11: 0000000000000000 R12: ffff888100047168
 [    0.340323] R13: 0000000000000002 R14: ffff888100193480 R15: ffff888380030f40
 [    0.341221] FS:  0000000000000000(0000) GS:ffff8881b9b76000(0000) knlGS:0000000000000000
 [    0.342298] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 [    0.343096] CR2: ffff88843ffff000 CR3: 000000000282c001 CR4: 0000000000370eb0
 [    0.344042] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 [    0.344927] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
 [    0.345811] Call Trace:
 [    0.346191]  <TASK>
 [    0.346429]  sched_init_smp+0x32/0xa0
 [    0.346944]  ? stop_machine+0x2c/0x40
 [    0.347460]  kernel_init_freeable+0xf5/0x260
 [    0.348031]  ? rest_init+0xc0/0xc0
 [    0.348513]  kernel_init+0x16/0x120
 [    0.349008]  ret_from_fork+0x5e/0xd0
 [    0.349510]  ? rest_init+0xc0/0xc0
 [    0.349998]  ret_from_fork_asm+0x11/0x20
 [    0.350464]  </TASK>
 [    0.350812] ---[ end trace 0000000000000000 ]---

> 
> Even the qemu cmdline for the guest can help! We can try reproducing
> it at our end then. Thank you for all the help.

It is custom QEMU with limited access to hypervisor. This crash is
inside VM.

Thanks

> 
> -- 
> Thanks and Regards,
> Prateek
> 
