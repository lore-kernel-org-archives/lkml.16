Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B71C7E1
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749969732; cv=none; b=P5i73MjnHqThTU/LU+J0P0gFblXplks/eeAlPxUcP9PVGftItCjw1ngoXdj/wHEG0DpHCHUCGTRPOggtBna/Uv4xmDnbwPIJGP/Y84McVQE1r2bd55ckjrqKp1eq12KFQAeTw6u+Cs6RVTgR0mPNLgke8oU8mPcFu0wJbJjAPUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749969732; c=relaxed/simple;
	bh=6j2PDydny9bwPMRh5DUEuTm9b2/MqWdYObOvsrr1O0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9lOwE/60Oy2+ZEJwjhx2BzqtkBP0eIVbp2s+UJN9XHoGz3l96VhxQAeQ4ZlO3weCmrWAIbYCFDU+Xbb2tK9gz/+ZDoc9VKUBrpAnz0lC7AmLoKRQnbmG45aCcKOsZ6So2+6z49srJjTjqIT3KDaPwoXtHUU/bk93l/g1TDuru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgbD3gkb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgbD3gkb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A1AC4CEE3;
	Sun, 15 Jun 2025 06:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749969731;
	bh=6j2PDydny9bwPMRh5DUEuTm9b2/MqWdYObOvsrr1O0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgbD3gkbDMSH6vJtwBf2gyaWe/e4O0eCWVDTyms+SPZ5XjazQgJKLkVrNm7XRoF6z
	 rDnFq9m+AV9n55/nQPjU63wPS7ws/Qws4H8kuL6Wqpu3t5byeIePxmJGiTsSnLiueq
	 bpY8RwPDOA1wJ1wqHi3EYU3SDd9nnBmTCP0V4PEJV0BsLvIzulhKLQBgbJ8hsCAHxV
	 Pv5E9AqSpOVIaeEhgEPaRXOXLJVwisDtGbMpvkc/udUsosStQn7og8EIWgjghqxbhG
	 JbNukqcRvxb20QrS/6idQVegpEG4JyD/gOFsrzKq2n27dPfniCRQHKAEuHZB7j2gj5
	 ojSv1gO93RQBQ==
Date: Sun, 15 Jun 2025 09:42:07 +0300
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
Message-ID: <20250615064207.GA750234@unreal>
References: <20250610110701.GA256154@unreal>
 <a5da2e4d-c042-4d01-bfc3-f50ca674247b@amd.com>
 <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com>
 <20250611060607.GM10669@unreal>
 <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>
 <20250612074157.GO10669@unreal>
 <5a673979-e96c-4dc2-b84b-849c6c8084ae@amd.com>
 <223b16a5-8532-4f5b-b34a-c7a0448f2454@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <223b16a5-8532-4f5b-b34a-c7a0448f2454@amd.com>

On Thu, Jun 12, 2025 at 04:11:52PM +0530, K Prateek Nayak wrote:
> On 6/12/2025 3:00 PM, K Prateek Nayak wrote:
> > Ah! Since this happens so early topology isn't created yet for
> > the debug prints to hit! Is it possible to get a dmesg with
> > "ignore_loglevel" and "sched_verbose" on an older kernel that
> > did not throw this error on the same host?

This is dmesg with reverted two commits "ched/topology: Refinement to
topology_span_sane speedup" and "sched/topology: improve
topology_span_sane speed"

[    0.034409] TSC deadline timer available
[    0.034413] CPU topo: Max. logical packages:  10
[    0.034414] CPU topo: Max. logical dies:      10
[    0.034414] CPU topo: Max. dies per package:   1
[    0.034418] CPU topo: Max. threads per core:   1
[    0.034418] CPU topo: Num. cores per package:     1
[    0.034419] CPU topo: Num. threads per package:   1
[    0.034419] CPU topo: Allowing 10 present CPUs plus 0 hotplug CPUs
[    0.034433] kvm-guest: APIC: eoi() replaced with kvm_guest_apic_eoi_write()
[    0.034441] kvm-guest: KVM setup pv remote TLB flush
[    0.034444] kvm-guest: setup PV sched yield
[    0.034458] [mem 0xc0000000-0xfed1bfff] available for PCI devices
[    0.034462] Booting paravirtualized kernel on KVM
[    0.034463] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.039358] setup_percpu: NR_CPUS:512 nr_cpumask_bits:10 nr_cpu_ids:10 nr_node_ids:5
[    0.040564] percpu: Embedded 53 pages/cpu s177240 r8192 d31656 u1048576
[    0.040569] pcpu-alloc: s177240 r8192 d31656 u1048576 alloc=1*2097152
[    0.040571] pcpu-alloc: [0] 00 01 [1] 02 03 [2] 04 05 [3] 06 07
[    0.040576] pcpu-alloc: [4] 08 09
[    0.040596] Kernel command line: BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_10_14_45 root=UUID=49650207-5673-41e8-9f3b-5572de97a271 ro selinux=0 kasan_multi_shot net.ifnames=0 biosdevname=0 console=tty0 console=ttyS1,115200 audit=0 systemd.unified_cgroup_hierarchy=0 sched_verbose ignore_loglevel
[    0.040729] Unknown kernel command line parameters "kasan_multi_shot BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_10_14_45 selinux=0 biosdevname=0 audit=0", will be passed to user space.
[    0.040741] random: crng init done
[    0.040742] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.040743] printk: log_buf_len total cpu_extra contributions: 36864 bytes
[    0.040743] printk: log_buf_len min size: 65536 bytes
[    0.040844] printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
[    0.040845] printk: early log buf free: 56704(86%)
[    0.040976] software IO TLB: area num 16.
[    0.052732] Fallback order for Node 0: 0 4 3 2 1
[    0.052736] Fallback order for Node 1: 1 4 3 2 0
[    0.052739] Fallback order for Node 2: 2 4 3 0 1
[    0.052741] Fallback order for Node 3: 3 4 1 0 2
[    0.052744] Fallback order for Node 4: 4 0 1 2 3
[    0.052749] Built 5 zonelists, mobility grouping on.  Total pages: 3932026
[    0.052750] Policy zone: Normal
[    0.052751] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.078003] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=10, Nodes=5
[    0.088263] ftrace: allocating 46166 entries in 182 pages
[    0.088265] ftrace: allocated 182 pages with 5 groups
[    0.088409] rcu: Hierarchical RCU implementation.
[    0.088409] rcu:        RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=10.
[    0.088411] Rude variant of Tasks RCU enabled.
[    0.088411] Tracing variant of Tasks RCU enabled.
[    0.088412] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.088413] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=10
[    0.088422] RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=10.
[    0.088424] RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=10.
[    0.095295] NR_IRQS: 33024, nr_irqs: 504, preallocated irqs: 16
[    0.095483] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.110676] Console: colour VGA+ 80x25
[    0.110679] printk: legacy console [tty0] enabled
[    0.160222] printk: legacy console [ttyS1] enabled
[    0.289596] ACPI: Core revision 20250404
[    0.290499] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
[    0.292323] APIC: Switch to symmetric I/O mode setup
[    0.293258] kvm-guest: APIC: send_IPI_mask() replaced with kvm_send_ipi_mask()
[    0.294633] kvm-guest: APIC: send_IPI_mask_allbutself() replaced with kvm_send_ipi_mask_allbutself()
[    0.296279] kvm-guest: setup PV IPIs
[    0.298170] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.299291] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x21134f58f0d, max_idle_ns: 440795217993 ns
[    0.301176] Calibrating delay loop (skipped) preset value.. 4589.21 BogoMIPS (lpj=9178432)
[    0.302763] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.303945] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.305458] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.306528] Speculative Store Bypass: Vulnerable
[    0.307389] GDS: Unknown: Dependent on hypervisor status
[    0.308387] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.309599] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.310740] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.313177] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.314406] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.315447] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.316572] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.317494] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.318748] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.319841] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.321493] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.322579] x86/fpu: xstate_offset[5]:  960, xstate_sizes[5]:   64
[    0.323691] x86/fpu: xstate_offset[6]: 1024, xstate_sizes[6]:  512
[    0.324820] x86/fpu: xstate_offset[7]: 1536, xstate_sizes[7]: 1024
[    0.325489] x86/fpu: Enabled xstate features 0xff, context size is 2560 bytes, using 'compacted' format.
[    0.327966] Freeing SMP alternatives memory: 48K
[    0.329452] pid_max: default: 32768 minimum: 301
[    0.330372] LSM: initializing lsm=capability
[    0.331218] stackdepot: allocating hash table of 1048576 entries via kvcalloc
[    0.339580] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, vmalloc hugepage)
[    0.342571] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, vmalloc hugepage)
[    0.345701] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, vmalloc)
[    0.347131] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, vmalloc)
[    0.348912] smpboot: CPU0: Intel(R) Xeon(R) Gold 6140 CPU @ 2.30GHz (family: 0x6, model: 0x55, stepping: 0x4)
[    0.349176] Performance Events: Skylake events, full-width counters, Intel PMU driver.
[    0.349176] ... version:                2
[    0.349179] ... bit width:              48
[    0.349954] ... generic registers:      4
[    0.350715] ... value mask:             0000ffffffffffff
[    0.351674] ... max period:             00007fffffffffff
[    0.352650] ... fixed-purpose events:   3
[    0.353178] ... event mask:             000000070000000f
[    0.354281] signal: max sigframe size: 3216
[    0.355106] rcu: Hierarchical SRCU implementation.
[    0.356006] rcu:        Max phase no-delay instances is 1000.
[    0.357014] Timer migration: 2 hierarchy levels; 8 children per group; 1 crossnode level
[    0.357826] smp: Bringing up secondary CPUs ...
[    0.358794] smpboot: x86: Booting SMP configuration:
[    0.359726] .... node  #0, CPUs:        #1
[    0.360869] .... node  #1, CPUs:    #2  #3
[    0.361475] .... node  #2, CPUs:    #4  #5
[    0.362677] .... node  #3, CPUs:    #6  #7
[    0.363879] .... node  #4, CPUs:    #8  #9
[    0.397193] smp: Brought up 5 nodes, 10 CPUs
[    0.398864] smpboot: Total of 10 processors activated (45892.16 BogoMIPS)
[    0.400864] CPU0 attaching sched-domain(s):
[    0.401441]  domain-0: span=0-1 level=PKG
[    0.402243]   groups: 0:{ span=0 }, 1:{ span=1 }
[    0.403145]   domain-1: span=0-1,8-9 level=NUMA
[    0.404026]    groups: 0:{ span=0-1 cap=2048 }, 8:{ span=8-9 cap=2048 }
[    0.405178]    domain-2: span=0-1,6-9 level=NUMA
[    0.406077]     groups: 0:{ span=0-1,8-9 mask=0-1 cap=4096 }, 6:{ span=6-9 mask=6-7 cap=4096 }
[    0.407704]     domain-3: span=0-1,4-9 level=NUMA
[    0.408609]      groups: 0:{ span=0-1,6-9 mask=0-1 cap=6144 }, 4:{ span=4-9 mask=4-5 cap=6144 }
[    0.409640]      domain-4: span=0-9 level=NUMA
[    0.410466]       groups: 0:{ span=0-1,4-9 mask=0-1 cap=8192 }, 2:{ span=2-9 mask=2-3 cap=8192 }
[    0.412025] CPU1 attaching sched-domain(s):
[    0.412831]  domain-0: span=0-1 level=PKG
[    0.413429]   groups: 1:{ span=1 }, 0:{ span=0 }
[    0.414289]   domain-1: span=0-1,8-9 level=NUMA
[    0.415138]    groups: 0:{ span=0-1 cap=2048 }, 8:{ span=8-9 cap=2048 }
[    0.416310]    domain-2: span=0-1,6-9 level=NUMA
[    0.417166]     groups: 0:{ span=0-1,8-9 mask=0-1 cap=4096 }, 6:{ span=6-9 mask=6-7 cap=4096 }
[    0.417636]     domain-3: span=0-1,4-9 level=NUMA
[    0.418511]      groups: 0:{ span=0-1,6-9 mask=0-1 cap=6144 }, 4:{ span=4-9 mask=4-5 cap=6144 }
[    0.420089]      domain-4: span=0-9 level=NUMA
[    0.420937]       groups: 0:{ span=0-1,4-9 mask=0-1 cap=8192 }, 2:{ span=2-9 mask=2-3 cap=8192 }
[    0.421649] CPU2 attaching sched-domain(s):
[    0.422470]  domain-0: span=2-3 level=PKG
[    0.423253]   groups: 2:{ span=2 }, 3:{ span=3 }
[    0.424138]   domain-1: span=2-3,8-9 level=NUMA
[    0.425012]    groups: 2:{ span=2-3 cap=2048 }, 8:{ span=8-9 cap=2048 }
[    0.425523]    domain-2: span=2-3,6-9 level=NUMA
[    0.426401]     groups: 2:{ span=2-3,8-9 mask=2-3 cap=4096 }, 6:{ span=6-9 mask=6-7 cap=4096 }
[    0.427994]     domain-3: span=2-9 level=NUMA
[    0.428839]      groups: 2:{ span=2-3,6-9 mask=2-3 cap=6144 }, 4:{ span=4-9 mask=4-5 cap=6144 }
[    0.429632]      domain-4: span=0-9 level=NUMA
[    0.430486]       groups: 2:{ span=2-9 mask=2-3 cap=8192 }, 0:{ span=0-1,4-9 mask=0-1 cap=8192 }
[    0.432109] CPU3 attaching sched-domain(s):
[    0.432930]  domain-0: span=2-3 level=PKG
[    0.433431]   groups: 3:{ span=3 }, 2:{ span=2 }
[    0.434303]   domain-1: span=2-3,8-9 level=NUMA
[    0.435174]    groups: 2:{ span=2-3 cap=2048 }, 8:{ span=8-9 cap=2048 }
[    0.436375]    domain-2: span=2-3,6-9 level=NUMA
[    0.437178]     groups: 2:{ span=2-3,8-9 mask=2-3 cap=4096 }, 6:{ span=6-9 mask=6-7 cap=4096 }
[    0.438756]     domain-3: span=2-9 level=NUMA
[    0.439580]      groups: 2:{ span=2-3,6-9 mask=2-3 cap=6144 }, 4:{ span=4-9 mask=4-5 cap=6144 }
[    0.441178]      domain-4: span=0-9 level=NUMA
[    0.442012]       groups: 2:{ span=2-9 mask=2-3 cap=8192 }, 0:{ span=0-1,4-9 mask=0-1 cap=8192 }
[    0.443577] CPU4 attaching sched-domain(s):
[    0.444371]  domain-0: span=4-5 level=PKG
[    0.445133]   groups: 4:{ span=4 }, 5:{ span=5 }
[    0.445445]   domain-1: span=4-5,8-9 level=NUMA
[    0.446288]    groups: 4:{ span=4-5 cap=2048 }, 8:{ span=8-9 cap=2048 }
[    0.447448]    domain-2: span=4-9 level=NUMA
[    0.448264]     groups: 4:{ span=4-5,8-9 mask=4-5 cap=4096 }, 6:{ span=6-9 mask=6-7 cap=4096 }
[    0.449629]     domain-3: span=0-9 level=NUMA
[    0.450456]      groups: 4:{ span=4-9 mask=4-5 cap=6144 }, 0:{ span=0-1,6-9 mask=0-1 cap=6144 }, 2:{ span=2-3,6-9 mask=2-3 cap=6144 }
[    0.452542] CPU5 attaching sched-domain(s):
[    0.453179]  domain-0: span=4-5 level=PKG
[    0.453971]   groups: 5:{ span=5 }, 4:{ span=4 }
[    0.454858]   domain-1: span=4-5,8-9 level=NUMA
[    0.455741]    groups: 4:{ span=4-5 cap=2048 }, 8:{ span=8-9 cap=2048 }
[    0.456899]    domain-2: span=4-9 level=NUMA
[    0.457446]     groups: 4:{ span=4-5,8-9 mask=4-5 cap=4096 }, 6:{ span=6-9 mask=6-7 cap=4096 }
[    0.458994]     domain-3: span=0-9 level=NUMA
[    0.459815]      groups: 4:{ span=4-9 mask=4-5 cap=6144 }, 0:{ span=0-1,6-9 mask=0-1 cap=6144 }, 2:{ span=2-3,6-9 mask=2-3 cap=6144 }
[    0.461734] CPU6 attaching sched-domain(s):
[    0.462527]  domain-0: span=6-7 level=PKG
[    0.463297]   groups: 6:{ span=6 }, 7:{ span=7 }
[    0.464154]   domain-1: span=6-9 level=NUMA
[    0.464936]    groups: 6:{ span=6-7 cap=2048 }, 8:{ span=8-9 cap=2048 }
[    0.465503]    domain-2: span=0-9 level=NUMA
[    0.466311]     groups: 6:{ span=6-9 mask=6-7 cap=4096 }, 0:{ span=0-1,8-9 mask=0-1 cap=4096 }, 2:{ span=2-3,8-9 mask=2-3 cap=4096 }, 4:{ span=4-5,8-9 mask=4-5 cap=4096 }
[    0.469027] CPU7 attaching sched-domain(s):
[    0.469432]  domain-0: span=6-7 level=PKG
[    0.470238]   groups: 7:{ span=7 }, 6:{ span=6 }
[    0.471127]   domain-1: span=6-9 level=NUMA
[    0.471940]    groups: 6:{ span=6-7 cap=2048 }, 8:{ span=8-9 cap=2048 }
[    0.473158]    domain-2: span=0-9 level=NUMA
[    0.473442]     groups: 6:{ span=6-9 mask=6-7 cap=4096 }, 0:{ span=0-1,8-9 mask=0-1 cap=4096 }, 2:{ span=2-3,8-9 mask=2-3 cap=4096 }, 4:{ span=4-5,8-9 mask=4-5 cap=4096 }
[    0.476610] CPU8 attaching sched-domain(s):
[    0.477179]  domain-0: span=8-9 level=PKG
[    0.477957]   groups: 8:{ span=8 }, 9:{ span=9 }
[    0.478841]   domain-1: span=0-9 level=NUMA
[    0.479661]    groups: 8:{ span=8-9 cap=2048 }, 0:{ span=0-1 cap=2048 }, 2:{ span=2-3 cap=2048 }, 4:{ span=4-5 cap=2048 }, 6:{ span=6-7 cap=2048 }
[    0.481764] CPU9 attaching sched-domain(s):
[    0.482570]  domain-0: span=8-9 level=PKG
[    0.483360]   groups: 9:{ span=9 }, 8:{ span=8 }
[    0.484245]   domain-1: span=0-9 level=NUMA
[    0.485065]    groups: 8:{ span=8-9 cap=2048 }, 0:{ span=0-1 cap=2048 }, 2:{ span=2-3 cap=2048 }, 4:{ span=4-5 cap=2048 }, 6:{ span=6-7 cap=2048 }
[    0.485780] root domain span: 0-9
[    0.486507] Memory: 15306544K/15728104K available (14320K kernel code, 2394K rwdata, 9212K rodata, 1668K init, 1272K bss, 371220K reserved, 0K cma-reserved)
[    0.489652] devtmpfs: initialized

> 
> One better would be running with the following diff on top of v6.16-rc1
> is possible:

We are working to get this one too.

Thanks

> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 9026d325d0fd..811c8d0f5b9a 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -2398,7 +2398,7 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
>  {
>  	struct sched_domain_topology_level *tl;
>  	struct cpumask *covered, *id_seen;
> -	int cpu;
> +	int cpu, id;
>  	lockdep_assert_held(&sched_domains_mutex);
>  	covered = sched_domains_tmpmask;
> @@ -2421,19 +2421,21 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
>  		 */
>  		for_each_cpu(cpu, cpu_map) {
>  			const struct cpumask *tl_cpu_mask = tl->mask(cpu);
> -			int id;
>  			/* lowest bit set in this mask is used as a unique id */
>  			id = cpumask_first(tl_cpu_mask);
> +			pr_warn("tl(%s) CPU(%d) ID(%d) CPU_TL_SPAN(%*pbl) ID_TL_SPAN(%*pbl)\n",
> +				tl->name, cpu, id, cpumask_pr_args(tl->mask(cpu)), cpumask_pr_args(tl->mask(id)));
> +
>  			if (cpumask_test_cpu(id, id_seen)) {
>  				/* First CPU has already been seen, ensure identical spans */
>  				if (!cpumask_equal(tl->mask(id), tl_cpu_mask))
> -					return false;
> +					goto fail;
>  			} else {
>  				/* First CPU hasn't been seen before, ensure it's a completely new span */
>  				if (cpumask_intersects(tl_cpu_mask, covered))
> -					return false;
> +					goto fail;
>  				cpumask_or(covered, covered, tl_cpu_mask);
>  				cpumask_set_cpu(id, id_seen);
> @@ -2441,6 +2443,16 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
>  		}
>  	}
>  	return true;
> +
> +fail:
> +	pr_warn("Failed tl: %s\n", tl->name);
> +	pr_warn("Failed for CPU: %d\n", cpu);
> +	pr_warn("ID CPU at tl: %d\n", id);
> +	pr_warn("Failed CPU span at tl: %*pbl\n", cpumask_pr_args(tl->mask(cpu)));
> +	pr_warn("ID CPU span: %*pbl\n", cpumask_pr_args(tl->mask(id)));
> +	pr_warn("ID CPUs seen: %*pbl\n", cpumask_pr_args(id_seen));
> +	pr_warn("CPUs covered: %*pbl\n", cpumask_pr_args(covered));
> +	return false;
>  }
>  /*
> --
> 
> In my case, it logs the following (no failures  seen yet):
> 
>     tl(SMT) CPU(0) ID(0) CPU_TL_SPAN(0) ID_TL_SPAN(0)
>     tl(SMT) CPU(1) ID(1) CPU_TL_SPAN(1) ID_TL_SPAN(1)
>     tl(SMT) CPU(2) ID(2) CPU_TL_SPAN(2) ID_TL_SPAN(2)
>     tl(SMT) CPU(3) ID(3) CPU_TL_SPAN(3) ID_TL_SPAN(3)
>     tl(SMT) CPU(4) ID(4) CPU_TL_SPAN(4) ID_TL_SPAN(4)
>     tl(SMT) CPU(5) ID(5) CPU_TL_SPAN(5) ID_TL_SPAN(5)
>     tl(SMT) CPU(6) ID(6) CPU_TL_SPAN(6) ID_TL_SPAN(6)
>     tl(SMT) CPU(7) ID(7) CPU_TL_SPAN(7) ID_TL_SPAN(7)
>     tl(SMT) CPU(8) ID(8) CPU_TL_SPAN(8) ID_TL_SPAN(8)
>     tl(SMT) CPU(9) ID(9) CPU_TL_SPAN(9) ID_TL_SPAN(9)
>     tl(CLS) CPU(0) ID(0) CPU_TL_SPAN(0) ID_TL_SPAN(0)
>     tl(CLS) CPU(1) ID(1) CPU_TL_SPAN(1) ID_TL_SPAN(1)
>     tl(CLS) CPU(2) ID(2) CPU_TL_SPAN(2) ID_TL_SPAN(2)
>     tl(CLS) CPU(3) ID(3) CPU_TL_SPAN(3) ID_TL_SPAN(3)
>     tl(CLS) CPU(4) ID(4) CPU_TL_SPAN(4) ID_TL_SPAN(4)
>     tl(CLS) CPU(5) ID(5) CPU_TL_SPAN(5) ID_TL_SPAN(5)
>     tl(CLS) CPU(6) ID(6) CPU_TL_SPAN(6) ID_TL_SPAN(6)
>     tl(CLS) CPU(7) ID(7) CPU_TL_SPAN(7) ID_TL_SPAN(7)
>     tl(CLS) CPU(8) ID(8) CPU_TL_SPAN(8) ID_TL_SPAN(8)
>     tl(CLS) CPU(9) ID(9) CPU_TL_SPAN(9) ID_TL_SPAN(9)
>     tl(MC) CPU(0) ID(0) CPU_TL_SPAN(0) ID_TL_SPAN(0)
>     tl(MC) CPU(1) ID(1) CPU_TL_SPAN(1) ID_TL_SPAN(1)
>     tl(MC) CPU(2) ID(2) CPU_TL_SPAN(2) ID_TL_SPAN(2)
>     tl(MC) CPU(3) ID(3) CPU_TL_SPAN(3) ID_TL_SPAN(3)
>     tl(MC) CPU(4) ID(4) CPU_TL_SPAN(4) ID_TL_SPAN(4)
>     tl(MC) CPU(5) ID(5) CPU_TL_SPAN(5) ID_TL_SPAN(5)
>     tl(MC) CPU(6) ID(6) CPU_TL_SPAN(6) ID_TL_SPAN(6)
>     tl(MC) CPU(7) ID(7) CPU_TL_SPAN(7) ID_TL_SPAN(7)
>     tl(MC) CPU(8) ID(8) CPU_TL_SPAN(8) ID_TL_SPAN(8)
>     tl(MC) CPU(9) ID(9) CPU_TL_SPAN(9) ID_TL_SPAN(9)
>     tl(PKG) CPU(0) ID(0) CPU_TL_SPAN(0-1) ID_TL_SPAN(0-1)
>     tl(PKG) CPU(1) ID(0) CPU_TL_SPAN(0-1) ID_TL_SPAN(0-1)
>     tl(PKG) CPU(2) ID(2) CPU_TL_SPAN(2-3) ID_TL_SPAN(2-3)
>     tl(PKG) CPU(3) ID(2) CPU_TL_SPAN(2-3) ID_TL_SPAN(2-3)
>     tl(PKG) CPU(4) ID(4) CPU_TL_SPAN(4-5) ID_TL_SPAN(4-5)
>     tl(PKG) CPU(5) ID(4) CPU_TL_SPAN(4-5) ID_TL_SPAN(4-5)
>     tl(PKG) CPU(6) ID(6) CPU_TL_SPAN(6-7) ID_TL_SPAN(6-7)
>     tl(PKG) CPU(7) ID(6) CPU_TL_SPAN(6-7) ID_TL_SPAN(6-7)
>     tl(PKG) CPU(8) ID(8) CPU_TL_SPAN(8-9) ID_TL_SPAN(8-9)
>     tl(PKG) CPU(9) ID(8) CPU_TL_SPAN(8-9) ID_TL_SPAN(8-9)
>     tl(NODE) CPU(0) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
>     tl(NODE) CPU(1) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
>     tl(NODE) CPU(2) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
>     tl(NODE) CPU(3) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
>     tl(NODE) CPU(4) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
>     tl(NODE) CPU(5) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
>     tl(NODE) CPU(6) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
>     tl(NODE) CPU(7) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
>     tl(NODE) CPU(8) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
>     tl(NODE) CPU(9) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
> 
> -- 
> Thanks and Regards,
> Prateek
> 
