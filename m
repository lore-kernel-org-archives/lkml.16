Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A9825B2F0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561015; cv=none; b=nJbK6in/6qCpmuOPGib9X47Qh82PBfPswkpcJJtJ9bZdfd8mFw5GYrpoWelbddd7xxdLgYtTrOsApp2r0afgk5WuBI4QYKf3S2AO5hD+jm0Y0iuWaURIXl0OICNDOWUrVfHcI+qLfzPfAs4JUtuKhPxf1Idw+UJKokkQQGUKLSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561015; c=relaxed/simple;
	bh=x5euCY0BuYnIdqomX5VSXX1GE3DgVDAaklyP1SA2irc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mK5FUfZ9VrFesKzy8PCrY0spf1z+yLaY/gZr4iSy7jVWUWAJwZtjJvjZXPiPEJZvJ59XjeH9+vhlhNfPUgn3/EcXJczoqDfBtJ3t/kcJbQE2SiRVod5iHCYXq2ysXxTGNcTJIPMfyPIVmIqe0Jq+zYP9NmXuYuAzEoVOk79GRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=os1sabQn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="os1sabQn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C93C4CEED;
	Tue, 10 Jun 2025 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749561014;
	bh=x5euCY0BuYnIdqomX5VSXX1GE3DgVDAaklyP1SA2irc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=os1sabQnOUxZLhnG4eONMkRpb1AmNHqIapqYZHRv5/qCwXz1krk9pR4FeNuY3Ebga
	 xm0/otcuNY5UXARAtObtIWKmUHelHeAK9LYJ1aK6Mx7AAOhGkWBkOk+Wb2kfvfVUPx
	 T0POji4vCnw5kUcYGP8poLcK8DZhdfgVLnuEIp/DnaWrfKkXIj/utXSeWfsXGaEaAO
	 GLcIwsfAC3G7C/uqHgmeahmZgz6TM+1prVSIRzvvotAlBsLJ9gwuQigrZnytPDHOYA
	 fhQitkakyqiU7/tRM5FuMHR3QJHQMcMS9fh07NZwYKX5XBr+wBOHMHsPcqjxkVN8ZE
	 LxAluyngTdbKw==
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5500D120006C;
	Tue, 10 Jun 2025 09:10:13 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Tue, 10 Jun 2025 09:10:13 -0400
X-ME-Sender: <xms:tS5IaNvwrKBJnIho-b4ISVCI4gI41X87C05NMzmc-3H6Ec23kZDezQ>
    <xme:tS5IaGdr4QW4NgfvMwLTLUl3nn-atpfmRtolhxK8UsB8V8RLWpq3u5vSkWOa6v1Yf
    xjY7kFL515rfX6wKgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfnvghonhcutfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrh
    hnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpedtueevfeevhfdtkedvhfeltdffjedt
    udffjeeiueegvddtteekgeejheelgeejvdenucffohhmrghinhepqhgvmhhurdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhgvohhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdeftdehfeelkeegqddvje
    ejleejjedvkedqlhgvohhnpeepkhgvrhhnvghlrdhorhhgsehlvghonhdrnhhupdhnsggp
    rhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhprhgrth
    gvvghkrdhnrgihrghksegrmhgurdgtohhmpdhrtghpthhtohepughivghtmhgrrhdrvghg
    ghgvmhgrnhhnsegrrhhmrdgtohhmpdhrtghpthhtohepshhrihhvrghtshgrsegtshgrih
    hlrdhmihhtrdgvughupdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhr
    ghdprhgtphhtthhopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhope
    hrjhgrsehhphgvrdgtohhmpdhrtghpthhtohepshhivhgrnhhitghhsehhphgvrdgtohhm
    pdhrtghpthhtohepshhtvghvvgdrfigrhhhlsehhphgvrdgtohhmpdhrtghpthhtohepph
    gvthgvrhiisehinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:tS5IaAydzVOB8BKfk8T4EX07MWR0wJX-FpsCCONTVEJ_o6yYyuXLgQ>
    <xmx:tS5IaEMSmN0YlrDR8WL_4CiJtxQZ56NIQZYNFyJbSJfoSbDBDDoUQA>
    <xmx:tS5IaN-8LyZZTq5B9iEAePuqthU_Ke56XhzpYnXV08qrCuzUvAT9zA>
    <xmx:tS5IaEVhfiaAbVUCHYu9s1VrUKzJUEB9ge-3M4TJXJm2Adur24HD5g>
    <xmx:tS5IaOf5bOMV-FkNGX1R51lXupFjn6wpPzBss-oX6lyNEC2w2mKD6hGJ>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 213C42CE0063; Tue, 10 Jun 2025 09:10:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tf5d8b37a7e664f8b
Date: Tue, 10 Jun 2025 16:09:52 +0300
From: "Leon Romanovsky" <leon@kernel.org>
To: "K Prateek Nayak" <kprateek.nayak@amd.com>
Cc: "Steve Wahl" <steve.wahl@hpe.com>, "Ingo Molnar" <mingo@redhat.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Juri Lelli" <juri.lelli@redhat.com>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Dietmar Eggemann" <dietmar.eggemann@arm.com>,
 "Steven Rostedt" <rostedt@goodmis.org>, "Ben Segall" <bsegall@google.com>,
 "Mel Gorman" <mgorman@suse.de>, "Valentin Schneider" <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org, "Vishal Chourasia" <vishalc@linux.ibm.com>,
 samir <samir@linux.ibm.com>, "Naman Jain" <namjain@linux.microsoft.com>,
 "Saurabh Singh Sengar" <ssengar@linux.microsoft.com>, srivatsa@csail.mit.edu,
 "Michael Kelley" <mhklinux@outlook.com>, "Russ Anderson" <rja@hpe.com>,
 "Dimitri Sivanich" <sivanich@hpe.com>
Message-Id: <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
In-Reply-To: <20250610123618.GB10669@unreal>
References: <20250304160844.75373-1-steve.wahl@hpe.com>
 <20250304160844.75373-2-steve.wahl@hpe.com> <20250610110701.GA256154@unreal>
 <a5da2e4d-c042-4d01-bfc3-f50ca674247b@amd.com>
 <20250610123618.GB10669@unreal>
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Tue, Jun 10, 2025, at 15:36, Leon Romanovsky wrote:
> On Tue, Jun 10, 2025 at 05:03:14PM +0530, K Prateek Nayak wrote:
>> Hello Leon,
>> 
>> On 6/10/2025 4:37 PM, Leon Romanovsky wrote:
>> 
>> [..snip..]
>> 
>> > > +	if (WARN_ON(!topology_span_sane(cpu_map)))
>> > > +		goto error;
>> > 
>> > Hi,
>> > 
>> > This WARN_ON() generate the following splat in our regression over VMs.>
>> > [    0.408379] ------------[ cut here ]------------
>> >   [    0.409097] WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2486 build_sched_domains+0xe67/0x13a0
>> >   [    0.410797] Modules linked in:
>> >   [    0.411453] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 #1 NONE
>> >   [    0.413353] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
>> >   [    0.415440] RIP: 0010:build_sched_domains+0xe67/0x13a0
>> >   [    0.416458] Code: ff ff 8b 6c 24 08 48 8b 44 24 68 65 48 2b 05 60 24 d0 01 0f 85 03 05 00 00 48 83 c4 70 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b e9 65 fe ff ff 48 c7 c7 28 fb 08 82 4c 89 44 24 28 c6 05 e4
>> >   [    0.417662] RSP: 0000:ffff8881002efe30 EFLAGS: 00010202
>> >   [    0.418686] RAX: 00000000ffffff01 RBX: 0000000000000002 RCX: 00000000ffffff01
>> >   [    0.419982] RDX: 00000000fffffff6 RSI: 0000000000000300 RDI: ffff888100047168
>> >   [    0.421166] RBP: 0000000000000000 R08: ffff888100047168 R09: 0000000000000000
>> >   [    0.422514] R10: ffffffff830dee80 R11: 0000000000000000 R12: ffff888100047168
>> >   [    0.423820] R13: 0000000000000002 R14: ffff888100193480 R15: ffff888380030f40
>> >   [    0.425164] FS:  0000000000000000(0000) GS:ffff8881b9b76000(0000) knlGS:0000000000000000
>> >   [    0.426751] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> >   [    0.427832] CR2: ffff88843ffff000 CR3: 000000000282c001 CR4: 0000000000370eb0
>> >   [    0.428818] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> >   [    0.430131] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> >   [    0.431429] Call Trace:
>> >   [    0.431983]  <TASK>
>> >   [    0.432500]  sched_init_smp+0x32/0xa0
>> >   [    0.433069]  ? stop_machine+0x2c/0x40
>> >   [    0.433821]  kernel_init_freeable+0xf5/0x260
>> >   [    0.434682]  ? rest_init+0xc0/0xc0
>> >   [    0.435399]  kernel_init+0x16/0x120
>> >   [    0.436140]  ret_from_fork+0x5e/0xd0
>> >   [    0.436817]  ? rest_init+0xc0/0xc0
>> >   [    0.437526]  ret_from_fork_asm+0x11/0x20
>> >   [    0.438335]  </TASK>
>> >   [    0.438841] ---[ end trace 0000000000000000 ]---
>> 
>> Would it be possible for you to boot the guest with "sched_verbose" in
>> kernel cmdline and attach the full dmesg? Thanks in advance.
>
> I'll try, but can't promise due to how this kernel is been running in
> our systems.



[    0.032233] [mem 0xc0000000-0xfed1bfff] available for PCI devices
[    0.032237] Booting paravirtualized kernel on KVM
[    0.032238] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.036921] setup_percpu: NR_CPUS:512 nr_cpumask_bits:10 nr_cpu_ids:10 nr_node_ids:5
[    0.038074] percpu: Embedded 53 pages/cpu s177240 r8192 d31656 u1048576
[    0.038108] Kernel command line: BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 root=UUID=49650207-5673-41e8-9f3b-5572de97a271 ro selinux=0 kasan_multi_shot net.ifnames=0 biosdevname=0 console=tty0 console=ttyS1,115200 audit=0 systemd.unified_cgroup_hierarchy=0 sched_verbose
[    0.038222] Unknown kernel command line parameters "kasan_multi_shot BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 selinux=0 biosdevname=0 audit=0", will be passed to user space.
[    0.038235] random: crng init done
[    0.038235] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.038236] printk: log_buf_len total cpu_extra contributions: 36864 bytes
[    0.038237] printk: log_buf_len min size: 65536 bytes
[    0.038330] printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
[    0.038331] printk: early log buf free: 56792(86%)
[    0.038452] software IO TLB: area num 16.
[    0.049552] Fallback order for Node 0: 0 4 3 2 1
 [    0.049556] Fallback order for Node 1: 1 4 3 2 0
 [    0.049559] Fallback order for Node 2: 2 4 3 0 1
 [    0.049561] Fallback order for Node 3: 3 4 1 0 2
 [    0.049563] Fallback order for Node 4: 4 0 1 2 3
 [    0.049569] Built 5 zonelists, mobility grouping on.  Total pages: 3932026
[    0.049570] Policy zone: Normal
[    0.049571] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.073214] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=10, Nodes=5
[    0.082959] ftrace: allocating 46168 entries in 182 pages
[    0.082961] ftrace: allocated 182 pages with 5 groups
[    0.083102] rcu: Hierarchical RCU implementation.
[    0.083102] rcu:        RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=10.
[    0.083104] Rude variant of Tasks RCU enabled.
[    0.083104] Tracing variant of Tasks RCU enabled.
[    0.083105] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.083106] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=10
[    0.083115] RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=10.
[    0.083117] RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=10.
[    0.089643] NR_IRQS: 33024, nr_irqs: 504, preallocated irqs: 16
[    0.089831] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.100835] Console: colour VGA+ 80x25
[    0.100838] printk: legacy console [tty0] enabled
[    0.132452] printk: legacy console [ttyS1] enabled
[    0.221725] ACPI: Core revision 20250404
[    0.222382] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
[    0.223635] APIC: Switch to symmetric I/O mode setup
[    0.224298] kvm-guest: APIC: send_IPI_mask() replaced with kvm_send_ipi_mask()
[    0.225262] kvm-guest: APIC: send_IPI_mask_allbutself() replaced with kvm_send_ipi_mask_allbutself()
[    0.226436] kvm-guest: setup PV IPIs
[    0.227740] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.228537] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2563bd843df, max_idle_ns: 440795257314 ns
[    0.229871] Calibrating delay loop (skipped) preset value.. 5187.80 BogoMIPS (lpj=10375616)
[    0.231044] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.234092] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.234805] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.235598] Speculative Store Bypass: Vulnerable
[    0.236229] GDS: Unknown: Dependent on hypervisor status
[    0.236955] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.237871] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.238713] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.239535] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.240439] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.241219] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.242085] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.242927] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.243794] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.244595] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.245401] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.246078] x86/fpu: xstate_offset[5]:  960, xstate_sizes[5]:   64
[    0.249871] x86/fpu: xstate_offset[6]: 1024, xstate_sizes[6]:  512
[    0.250683] x86/fpu: xstate_offset[7]: 1536, xstate_sizes[7]: 1024
[    0.251500] x86/fpu: Enabled xstate features 0xff, context size is 2560 bytes, using 'compacted' format.
[    0.253380] Freeing SMP alternatives memory: 48K
[    0.253876] pid_max: default: 32768 minimum: 301
[    0.254516] LSM: initializing lsm=capability
[    0.255115] stackdepot: allocating hash table of 1048576 entries via kvcalloc
[    0.262981] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, vmalloc hugepage)
[    0.265481] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, vmalloc hugepage)
[    0.266233] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, vmalloc)
[    0.267255] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, vmalloc)
[    0.268594] smpboot: CPU0: Intel(R) Xeon(R) Gold 6240 CPU @ 2.60GHz (family: 0x6, model: 0x55, stepping: 0x7)
[    0.269870] Performance Events: Skylake events, full-width counters, Intel PMU driver.
[    0.269870] ... version:                2
[    0.269870] ... bit width:              48
[    0.269870] ... generic registers:      4
[    0.269873] ... value mask:             0000ffffffffffff
[    0.270548] ... max period:             00007fffffffffff
[    0.271220] ... fixed-purpose events:   3
[    0.271763] ... event mask:             000000070000000f
[    0.272574] signal: max sigframe size: 3216
[    0.273155] rcu: Hierarchical SRCU implementation.
[    0.273773] rcu:        Max phase no-delay instances is 1000.
[    0.274097] Timer migration: 2 hierarchy levels; 8 children per group; 1 crossnode level
[    0.275329] smp: Bringing up secondary CPUs ...
[    0.276031] smpboot: x86: Booting SMP configuration:
[    0.276689] .... node  #0, CPUs:        #1
[    0.277528] .... node  #1, CPUs:    #2  #3
[    0.278084] .... node  #2, CPUs:    #4  #5
[    0.279023] .... node  #3, CPUs:    #6  #7
[    0.279946] .... node  #4, CPUs:    #8  #9
[    0.313886] smp: Brought up 5 nodes, 10 CPUs
[    0.315058] smpboot: Total of 10 processors activated (51878.08 BogoMIPS)
[    0.316713] ------------[ cut here ]------------
[    0.316713] WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2486 build_sched_domains+0xe67/0x13a0
[    0.318187] Modules linked in:
[    0.318619] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 #1 NONE
 [    0.319928] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
[    0.321286] RIP: 0010:build_sched_domains+0xe67/0x13a0
[    0.321873] Code: ff ff 8b 6c 24 08 48 8b 44 24 68 65 48 2b 05 60 24 d0 01 0f 85 03 05 00 00 48 83 c4 70 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b e9 65 fe ff ff 48 c7 c7 28 fb 08 82 4c 89 44 24 28 c6 05 e4
[    0.324099] RSP: 0000:ffff8881002efe30 EFLAGS: 00010202
[    0.324779] RAX: 00000000ffffff01 RBX: 0000000000000002 RCX: 00000000ffffff01
[    0.325659] RDX: 00000000fffffff6 RSI: 0000000000000300 RDI: ffff888100047168
[    0.326109] RBP: 0000000000000000 R08: ffff888100047168 R09: 0000000000000000
[    0.326989] R10: ffffffff830dee80 R11: 0000000000000000 R12: ffff888100047168
[    0.327868] R13: 0000000000000002 R14: ffff888100193480 R15: ffff888380030f40
[    0.328743] FS:  0000000000000000(0000) GS:ffff8881b9b76000(0000) knlGS:0000000000000000
[    0.329772] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.330069] CR2: ffff88843ffff000 CR3: 000000000282c001 CR4: 0000000000370eb0
[    0.330973] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    0.331858] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    0.332740] Call Trace:
[    0.333111]  <TASK>
[    0.333453]  sched_init_smp+0x32/0xa0
[    0.333877]  ? stop_machine+0x2c/0x40
[    0.334382]  kernel_init_freeable+0xf5/0x260
[    0.334954]  ? rest_init+0xc0/0xc0
[    0.335423]  kernel_init+0x16/0x120
[    0.335907]  ret_from_fork+0x5e/0xd0
[    0.336396]  ? rest_init+0xc0/0xc0
[    0.336866]  ret_from_fork_asm+0x11/0x20
[    0.337409]  </TASK>
[    0.337755] ---[ end trace 0000000000000000 ]---
[    0.338089] Memory: 15307024K/15728104K available (14320K kernel code, 2394K rwdata, 9212K rodata, 1668K init, 1272K bss, 371220K reserved, 0K cma-reserved)
[    0.340215] devtmpfs: initialized
[    0.341149] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.342235] posixtimers hash table entries: 8192 (order: 5, 131072 bytes, vmalloc)
[    0.343256] futex hash table entries: 512 (32768 bytes on 5 NUMA nodes, total 160 KiB, linear).
[    0.346367] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.347279] thermal_sys: Registered thermal governor 'step_wise'
[    0.347288] cpuidle: using governor ladder
[    0.348603] cpuidle: using governor menu
[    0.349254] PCI: ECAM [mem 0xb0000000-0xbfffffff] (base 0xb0000000) for domain 0000 [bus 00-ff]
[    0.350190] PCI: ECAM [mem 0xb0000000-0xbfffffff] reserved as E820 entry
[    0.351025] PCI: Using configuration type 1 for base access
[    0.351822] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.381999] HugeTLB: allocation took 0ms with hugepage_allocation_threads=2
[    0.393902] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.394769] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.402159] ACPI: Added _OSI(Module Device)
[    0.402744] ACPI: Added _OSI(Processor Device)
[    0.403326] ACPI: Added _OSI(Processor Aggregator Device)
[    0.404648] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.405807] ACPI: Interpreter enabled

Thanks

>
> Thanks
>
>> 
>> -- 
>> Thanks and Regards,
>> Prateek
>> 
>> > 
>> > Thanks
>> > 
>> > > +
>> > >   	/* Build the groups for the domains */
>> > >   	for_each_cpu(i, cpu_map) {
>> > >   		for (sd = *per_cpu_ptr(d.sd, i); sd; sd = sd->parent) {
>> > > -- 
>> > > 2.26.2
>> > > 
>>
