Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F7238C20
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749584454; cv=none; b=WfD5ShBJ3V8EBCOt/2bAJu9ZOTVe10ZR7Hi/aI6O0Jza5XrwKeoGnMDQzR2HWvAG9sc4GubXib9Phtcr7kzhUjlpSVkL025PZjSKgh3fn3mTruGOtWQv2nm/4Qyx7Q9EpNTK03irtxtE7R2D3wEpN1tOh1gA7eN8FqZb2zGNjD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749584454; c=relaxed/simple;
	bh=9C0D/6QRcWQq0q/rOdVAyuKcrm1O9TWL5UujIegAdrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNQ7X5075rU7eiwLKAnH1hu+Fj/Xwdq0EXiSKrnkds+tzO5rCOe6lRcL+vXQTPCLNMPhUmhLC0ZfkodwHTsqv+5vN9TpbGL8Gk+L/bdfsLWVpXUxI5VNPHl49n2wYSk/xv5AOeczDbo7Qgkqdpct9jp0Meo3AVVOqMjiDGvNPUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=VovHta0r; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="VovHta0r"
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AJWh0r027529;
	Tue, 10 Jun 2025 19:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=RURBq0Z+pxxqRQXtLDdKCptSHS
	lWwFv54uDbdGBDZGs=; b=VovHta0rhnCB5piOscQpJlr2+xN133aHfZpWZ42git
	jlgdAYXBUpi+LuxDWtajtOaYpN1rXjF4Tl2eSrkjbv9ycx/bxV+sfNoxFxj6AKBu
	Rv1BMUbJvfyAMt5hbQfv4KCF6Md6X3zmD0DOLgu9HXAGUZCT4pP2vFeRgiQgo3GJ
	eBLNi76wQACSLlyznTuFA6jhAGmpB29NA1dE6neSigyd/ylIaZRpsvz+1mqxRaCM
	zuQelzgTdykWXikQZSb+RmBlE92NRLrcXgtJdU/MW0FG4IavWpZ6bdLlSq8s/fZk
	kRSAW+0iTXhkXtvOFch8e+lfNMeo8dxuMOXQhLbssUWA==
Received: from p1lg14881.it.hpe.com ([16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 476mg245ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 19:40:00 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 66354805E58;
	Tue, 10 Jun 2025 19:39:59 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTPS id 60F558089A9;
	Tue, 10 Jun 2025 19:39:56 +0000 (UTC)
Date: Tue, 10 Jun 2025 14:39:54 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Steve Wahl <steve.wahl@hpe.com>,
        Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        linux-kernel@vger.kernel.org, Vishal Chourasia <vishalc@linux.ibm.com>,
        samir <samir@linux.ibm.com>, Naman Jain <namjain@linux.microsoft.com>,
        Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
        srivatsa@csail.mit.edu, Michael Kelley <mhklinux@outlook.com>,
        Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
Message-ID: <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com>
References: <20250304160844.75373-1-steve.wahl@hpe.com>
 <20250304160844.75373-2-steve.wahl@hpe.com>
 <20250610110701.GA256154@unreal>
 <a5da2e4d-c042-4d01-bfc3-f50ca674247b@amd.com>
 <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE2MSBTYWx0ZWRfX3vteU1jRyGfQ gndwJzlaolTWArr4K3joxL0IjacqJ2R9w7nxMfFtC4Qk+/6oowgiKeF3SZIV6cJkcQ0PL4e7GHX KX8tNrinhcNR2K6wras8z73HxOXGcRI3eAqcPyh2mkZ1HDWwOCixTN8CuMLBnJiDQcTT8VFuEYB
 D9Ma73qA2K1vQF8pf9rnstO5SFSaX29Tkqep0vgzsnwWnc9kGDaGnYaiJakkdZgzGppuIZ/NJqW 8yRDYrsqvm0TUlG+/uvhiL00AcAQs9eE06zZVtrPjqJ39LtF3vwYDYjPZypf1fPSWTrDxn6ofNj oJizgJSDJBXQb/he9r3RmHIJa/YQ/JRLF1JYDnrH9zi4fOM2PcVQ6WO+RHLDEiZyE4jzhOmJC9s Vn5qUHZN
X-Proofpoint-GUID: fuEN-Ow4Z-a6WZgBs0e2oK9NH2LBhedp
X-Proofpoint-ORIG-GUID: fuEN-Ow4Z-a6WZgBs0e2oK9NH2LBhedp
X-Authority-Analysis: v=2.4 cv=Q//S452a c=1 sm=1 tr=0 ts=68488a10 cx=c_pps a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=ID6ng7r3AAAA:8 a=traQDdwCSsObnxRDnxAA:9 a=CjuIK1q_8ugA:10
 a=AkheI1RvQwOzcTXhi5f4:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100161

On Tue, Jun 10, 2025 at 04:09:52PM +0300, Leon Romanovsky wrote:
> 
> 
> On Tue, Jun 10, 2025, at 15:36, Leon Romanovsky wrote:
> > On Tue, Jun 10, 2025 at 05:03:14PM +0530, K Prateek Nayak wrote:
> >> Hello Leon,
> >> 
> >> On 6/10/2025 4:37 PM, Leon Romanovsky wrote:
> >> 
> >> [..snip..]
> >> 
> >> > > +	if (WARN_ON(!topology_span_sane(cpu_map)))
> >> > > +		goto error;
> >> > 
> >> > Hi,
> >> > 
> >> > This WARN_ON() generate the following splat in our regression over VMs.>
> >> > [    0.408379] ------------[ cut here ]------------
> >> >   [    0.409097] WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2486 build_sched_domains+0xe67/0x13a0
> >> >   [    0.410797] Modules linked in:
> >> >   [    0.411453] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 #1 NONE
> >> >   [    0.413353] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
> >> >   [    0.415440] RIP: 0010:build_sched_domains+0xe67/0x13a0
> >> >   [    0.416458] Code: ff ff 8b 6c 24 08 48 8b 44 24 68 65 48 2b 05 60 24 d0 01 0f 85 03 05 00 00 48 83 c4 70 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b e9 65 fe ff ff 48 c7 c7 28 fb 08 82 4c 89 44 24 28 c6 05 e4
> >> >   [    0.417662] RSP: 0000:ffff8881002efe30 EFLAGS: 00010202
> >> >   [    0.418686] RAX: 00000000ffffff01 RBX: 0000000000000002 RCX: 00000000ffffff01
> >> >   [    0.419982] RDX: 00000000fffffff6 RSI: 0000000000000300 RDI: ffff888100047168
> >> >   [    0.421166] RBP: 0000000000000000 R08: ffff888100047168 R09: 0000000000000000
> >> >   [    0.422514] R10: ffffffff830dee80 R11: 0000000000000000 R12: ffff888100047168
> >> >   [    0.423820] R13: 0000000000000002 R14: ffff888100193480 R15: ffff888380030f40
> >> >   [    0.425164] FS:  0000000000000000(0000) GS:ffff8881b9b76000(0000) knlGS:0000000000000000
> >> >   [    0.426751] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> >   [    0.427832] CR2: ffff88843ffff000 CR3: 000000000282c001 CR4: 0000000000370eb0
> >> >   [    0.428818] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> >> >   [    0.430131] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> >> >   [    0.431429] Call Trace:
> >> >   [    0.431983]  <TASK>
> >> >   [    0.432500]  sched_init_smp+0x32/0xa0
> >> >   [    0.433069]  ? stop_machine+0x2c/0x40
> >> >   [    0.433821]  kernel_init_freeable+0xf5/0x260
> >> >   [    0.434682]  ? rest_init+0xc0/0xc0
> >> >   [    0.435399]  kernel_init+0x16/0x120
> >> >   [    0.436140]  ret_from_fork+0x5e/0xd0
> >> >   [    0.436817]  ? rest_init+0xc0/0xc0
> >> >   [    0.437526]  ret_from_fork_asm+0x11/0x20
> >> >   [    0.438335]  </TASK>
> >> >   [    0.438841] ---[ end trace 0000000000000000 ]---
> >> 
> >> Would it be possible for you to boot the guest with "sched_verbose" in
> >> kernel cmdline and attach the full dmesg? Thanks in advance.
> >
> > I'll try, but can't promise due to how this kernel is been running in
> > our systems.
> 
> 
> 
> [    0.032233] [mem 0xc0000000-0xfed1bfff] available for PCI devices
> [    0.032237] Booting paravirtualized kernel on KVM
> [    0.032238] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
> [    0.036921] setup_percpu: NR_CPUS:512 nr_cpumask_bits:10 nr_cpu_ids:10 nr_node_ids:5
> [    0.038074] percpu: Embedded 53 pages/cpu s177240 r8192 d31656 u1048576
> [    0.038108] Kernel command line: BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 root=UUID=49650207-5673-41e8-9f3b-5572de97a271 ro selinux=0 kasan_multi_shot net.ifnames=0 biosdevname=0 console=tty0 console=ttyS1,115200 audit=0 systemd.unified_cgroup_hierarchy=0 sched_verbose
> [    0.038222] Unknown kernel command line parameters "kasan_multi_shot BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 selinux=0 biosdevname=0 audit=0", will be passed to user space.
> [    0.038235] random: crng init done
> [    0.038235] printk: log_buf_len individual max cpu contribution: 4096 bytes
> [    0.038236] printk: log_buf_len total cpu_extra contributions: 36864 bytes
> [    0.038237] printk: log_buf_len min size: 65536 bytes
> [    0.038330] printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
> [    0.038331] printk: early log buf free: 56792(86%)
> [    0.038452] software IO TLB: area num 16.
> [    0.049552] Fallback order for Node 0: 0 4 3 2 1
>  [    0.049556] Fallback order for Node 1: 1 4 3 2 0
>  [    0.049559] Fallback order for Node 2: 2 4 3 0 1
>  [    0.049561] Fallback order for Node 3: 3 4 1 0 2
>  [    0.049563] Fallback order for Node 4: 4 0 1 2 3
>  [    0.049569] Built 5 zonelists, mobility grouping on.  Total pages: 3932026
> [    0.049570] Policy zone: Normal
> [    0.049571] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.073214] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=10, Nodes=5
> [    0.082959] ftrace: allocating 46168 entries in 182 pages
> [    0.082961] ftrace: allocated 182 pages with 5 groups
> [    0.083102] rcu: Hierarchical RCU implementation.
> [    0.083102] rcu:        RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=10.
> [    0.083104] Rude variant of Tasks RCU enabled.
> [    0.083104] Tracing variant of Tasks RCU enabled.
> [    0.083105] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.083106] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=10
> [    0.083115] RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=10.
> [    0.083117] RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=10.
> [    0.089643] NR_IRQS: 33024, nr_irqs: 504, preallocated irqs: 16
> [    0.089831] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    0.100835] Console: colour VGA+ 80x25
> [    0.100838] printk: legacy console [tty0] enabled
> [    0.132452] printk: legacy console [ttyS1] enabled
> [    0.221725] ACPI: Core revision 20250404
> [    0.222382] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
> [    0.223635] APIC: Switch to symmetric I/O mode setup
> [    0.224298] kvm-guest: APIC: send_IPI_mask() replaced with kvm_send_ipi_mask()
> [    0.225262] kvm-guest: APIC: send_IPI_mask_allbutself() replaced with kvm_send_ipi_mask_allbutself()
> [    0.226436] kvm-guest: setup PV IPIs
> [    0.227740] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
> [    0.228537] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2563bd843df, max_idle_ns: 440795257314 ns
> [    0.229871] Calibrating delay loop (skipped) preset value.. 5187.80 BogoMIPS (lpj=10375616)
> [    0.231044] x86/cpu: User Mode Instruction Prevention (UMIP) activated
> [    0.234092] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.234805] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.235598] Speculative Store Bypass: Vulnerable
> [    0.236229] GDS: Unknown: Dependent on hypervisor status
> [    0.236955] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> [    0.237871] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.238713] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.239535] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
> [    0.240439] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
> [    0.241219] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
> [    0.242085] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
> [    0.242927] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
> [    0.243794] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.244595] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
> [    0.245401] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
> [    0.246078] x86/fpu: xstate_offset[5]:  960, xstate_sizes[5]:   64
> [    0.249871] x86/fpu: xstate_offset[6]: 1024, xstate_sizes[6]:  512
> [    0.250683] x86/fpu: xstate_offset[7]: 1536, xstate_sizes[7]: 1024
> [    0.251500] x86/fpu: Enabled xstate features 0xff, context size is 2560 bytes, using 'compacted' format.
> [    0.253380] Freeing SMP alternatives memory: 48K
> [    0.253876] pid_max: default: 32768 minimum: 301
> [    0.254516] LSM: initializing lsm=capability
> [    0.255115] stackdepot: allocating hash table of 1048576 entries via kvcalloc
> [    0.262981] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, vmalloc hugepage)
> [    0.265481] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, vmalloc hugepage)
> [    0.266233] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, vmalloc)
> [    0.267255] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, vmalloc)
> [    0.268594] smpboot: CPU0: Intel(R) Xeon(R) Gold 6240 CPU @ 2.60GHz (family: 0x6, model: 0x55, stepping: 0x7)
> [    0.269870] Performance Events: Skylake events, full-width counters, Intel PMU driver.
> [    0.269870] ... version:                2
> [    0.269870] ... bit width:              48
> [    0.269870] ... generic registers:      4
> [    0.269873] ... value mask:             0000ffffffffffff
> [    0.270548] ... max period:             00007fffffffffff
> [    0.271220] ... fixed-purpose events:   3
> [    0.271763] ... event mask:             000000070000000f
> [    0.272574] signal: max sigframe size: 3216
> [    0.273155] rcu: Hierarchical SRCU implementation.
> [    0.273773] rcu:        Max phase no-delay instances is 1000.
> [    0.274097] Timer migration: 2 hierarchy levels; 8 children per group; 1 crossnode level
> [    0.275329] smp: Bringing up secondary CPUs ...
> [    0.276031] smpboot: x86: Booting SMP configuration:
> [    0.276689] .... node  #0, CPUs:        #1
> [    0.277528] .... node  #1, CPUs:    #2  #3
> [    0.278084] .... node  #2, CPUs:    #4  #5
> [    0.279023] .... node  #3, CPUs:    #6  #7
> [    0.279946] .... node  #4, CPUs:    #8  #9
> [    0.313886] smp: Brought up 5 nodes, 10 CPUs
> [    0.315058] smpboot: Total of 10 processors activated (51878.08 BogoMIPS)
> [    0.316713] ------------[ cut here ]------------
> [    0.316713] WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2486 build_sched_domains+0xe67/0x13a0
> [    0.318187] Modules linked in:
> [    0.318619] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 #1 NONE
>  [    0.319928] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
> [    0.321286] RIP: 0010:build_sched_domains+0xe67/0x13a0
> [    0.321873] Code: ff ff 8b 6c 24 08 48 8b 44 24 68 65 48 2b 05 60 24 d0 01 0f 85 03 05 00 00 48 83 c4 70 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b e9 65 fe ff ff 48 c7 c7 28 fb 08 82 4c 89 44 24 28 c6 05 e4
> [    0.324099] RSP: 0000:ffff8881002efe30 EFLAGS: 00010202
> [    0.324779] RAX: 00000000ffffff01 RBX: 0000000000000002 RCX: 00000000ffffff01
> [    0.325659] RDX: 00000000fffffff6 RSI: 0000000000000300 RDI: ffff888100047168
> [    0.326109] RBP: 0000000000000000 R08: ffff888100047168 R09: 0000000000000000
> [    0.326989] R10: ffffffff830dee80 R11: 0000000000000000 R12: ffff888100047168
> [    0.327868] R13: 0000000000000002 R14: ffff888100193480 R15: ffff888380030f40
> [    0.328743] FS:  0000000000000000(0000) GS:ffff8881b9b76000(0000) knlGS:0000000000000000
> [    0.329772] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.330069] CR2: ffff88843ffff000 CR3: 000000000282c001 CR4: 0000000000370eb0
> [    0.330973] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [    0.331858] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [    0.332740] Call Trace:
> [    0.333111]  <TASK>
> [    0.333453]  sched_init_smp+0x32/0xa0
> [    0.333877]  ? stop_machine+0x2c/0x40
> [    0.334382]  kernel_init_freeable+0xf5/0x260
> [    0.334954]  ? rest_init+0xc0/0xc0
> [    0.335423]  kernel_init+0x16/0x120
> [    0.335907]  ret_from_fork+0x5e/0xd0
> [    0.336396]  ? rest_init+0xc0/0xc0
> [    0.336866]  ret_from_fork_asm+0x11/0x20
> [    0.337409]  </TASK>
> [    0.337755] ---[ end trace 0000000000000000 ]---
> [    0.338089] Memory: 15307024K/15728104K available (14320K kernel code, 2394K rwdata, 9212K rodata, 1668K init, 1272K bss, 371220K reserved, 0K cma-reserved)
> [    0.340215] devtmpfs: initialized
> [    0.341149] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.342235] posixtimers hash table entries: 8192 (order: 5, 131072 bytes, vmalloc)
> [    0.343256] futex hash table entries: 512 (32768 bytes on 5 NUMA nodes, total 160 KiB, linear).
> [    0.346367] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.347279] thermal_sys: Registered thermal governor 'step_wise'
> [    0.347288] cpuidle: using governor ladder
> [    0.348603] cpuidle: using governor menu
> [    0.349254] PCI: ECAM [mem 0xb0000000-0xbfffffff] (base 0xb0000000) for domain 0000 [bus 00-ff]
> [    0.350190] PCI: ECAM [mem 0xb0000000-0xbfffffff] reserved as E820 entry
> [    0.351025] PCI: Using configuration type 1 for base access
> [    0.351822] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
> [    0.381999] HugeTLB: allocation took 0ms with hugepage_allocation_threads=2
> [    0.393902] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.394769] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
> [    0.402159] ACPI: Added _OSI(Module Device)
> [    0.402744] ACPI: Added _OSI(Processor Device)
> [    0.403326] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.404648] ACPI: 1 ACPI AML tables successfully acquired and loaded
> [    0.405807] ACPI: Interpreter enabled
> 
> Thanks

I don't think that's the full dmesg output, maybe a console capture
with reduced levels?  I'm not finding the output of sched_domain_debug() and
sched_domain_debug_one() here.

Thanks,

Steve Wahl

> >
> > Thanks
> >
> >> 
> >> -- 
> >> Thanks and Regards,
> >> Prateek
> >> 
> >> > 
> >> > Thanks
> >> > 
> >> > > +
> >> > >   	/* Build the groups for the domains */
> >> > >   	for_each_cpu(i, cpu_map) {
> >> > >   		for (sd = *per_cpu_ptr(d.sd, i); sd; sd = sd->parent) {
> >> > > -- 
> >> > > 2.26.2
> >> > > 
> >>

-- 
Steve Wahl, Hewlett Packard Enterprise
