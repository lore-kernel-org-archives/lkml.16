Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1835F225787
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553626; cv=none; b=eJN2sfsOrScV1IK6Eu71r3bUlfEpR1KM5xlGzH2maH7cKyOAhwdpFL48G0e6Jhw5MIQuXgfZ/dBrqA+AYdctEihf3V+IrUC9gEk1lnXNgKfYnNEp3q9yA01TZ19XNdcSq2eGDniT37xY3Eglkg+BKlQrPTzTLHZArO7onRY/RgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553626; c=relaxed/simple;
	bh=srmDn9VFoMctUlXQhentuHHyaj/REMYdPtIOugjwKwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WX8ofFVJ35eUFSROYZzwQcHPq3rSfuvOyJeEL8F/rDSM1g6ZmXj5N4Dut+NvwOQBKc9v/RC3GdhuF2COUgvIhOwPPojapjl3eUHzdq+NIc47oIaGFc2bXh339sSPeSKN5qNvbSIF4fT1EobdXSNiX7IIl3zNySS3hjU84/9muD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgoS7Pe/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgoS7Pe/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357EDC4CEED;
	Tue, 10 Jun 2025 11:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749553625;
	bh=srmDn9VFoMctUlXQhentuHHyaj/REMYdPtIOugjwKwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgoS7Pe/BGS23I7WuF5K8EF+7ancQIYflrZ/JpTSBd/ER+jlEw18QwBYWIz+Ako8O
	 fGG5Hqfsfg9yl5Zoqu/J9LO4mRQeQoEbixEUvnDco+JpPrjVROWK6lIA4ubRM45Nxs
	 HOXDy0iygVeuNpla9l+SsglrWfjQ8k/9UYAyVfN70KZQRaYQBg35q2Yz/qgylpfG6n
	 0MmrSJibIJoETW/eiP3YTtUTeyE8ZFamW2J1iJh7Ap/UAGGZZbowsxKGeAveEJR+Ex
	 lmLmxLM/z+f5gyfrPE7lNjNaXh8R4HJpLt/qEhtq2BghINt47GVYvQ4aTvoVDef0vD
	 IE5E79mCWPDuw==
Date: Tue, 10 Jun 2025 14:07:01 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Steve Wahl <steve.wahl@hpe.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Vishal Chourasia <vishalc@linux.ibm.com>,
	samir <samir@linux.ibm.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
	srivatsa@csail.mit.edu, Michael Kelley <mhklinux@outlook.com>,
	Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
Message-ID: <20250610110701.GA256154@unreal>
References: <20250304160844.75373-1-steve.wahl@hpe.com>
 <20250304160844.75373-2-steve.wahl@hpe.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304160844.75373-2-steve.wahl@hpe.com>

On Tue, Mar 04, 2025 at 10:08:43AM -0600, Steve Wahl wrote:
> Use a different approach to topology_span_sane(), that checks for the
> same constraint of no partial overlaps for any two CPU sets for
> non-NUMA topology levels, but does so in a way that is O(N) rather
> than O(N^2).
> 
> Instead of comparing with all other masks to detect collisions, keep
> one mask that includes all CPUs seen so far and detect collisions with
> a single cpumask_intersects test.
> 
> If the current mask has no collisions with previously seen masks, it
> should be a new mask, which can be uniquely identified by the lowest
> bit set in this mask.  Keep a pointer to this mask for future
> reference (in an array indexed by the lowest bit set), and add the
> CPUs in this mask to the list of those seen.
> 
> If the current mask does collide with previously seen masks, it should
> be exactly equal to a mask seen before, looked up in the same array
> indexed by the lowest bit set in the mask, a single comparison.
> 
> Move the topology_span_sane() check out of the existing topology level
> loop, let it use its own loop so that the array allocation can be done
> only once, shared across levels.
> 
> On a system with 1920 processors (16 sockets, 60 cores, 2 threads),
> the average time to take one processor offline is reduced from 2.18
> seconds to 1.01 seconds.  (Off-lining 959 of 1920 processors took
> 34m49.765s without this change, 16m10.038s with this change in place.)
> 
> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
> ---

<...>

>  
> +	if (WARN_ON(!topology_span_sane(cpu_map)))
> +		goto error;

Hi, 

This WARN_ON() generate the following splat in our regression over VMs.

 [    0.408379] ------------[ cut here ]------------
 [    0.409097] WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2486 build_sched_domains+0xe67/0x13a0
 [    0.410797] Modules linked in:
 [    0.411453] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 #1 NONE 
 [    0.413353] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
 [    0.415440] RIP: 0010:build_sched_domains+0xe67/0x13a0
 [    0.416458] Code: ff ff 8b 6c 24 08 48 8b 44 24 68 65 48 2b 05 60 24 d0 01 0f 85 03 05 00 00 48 83 c4 70 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b e9 65 fe ff ff 48 c7 c7 28 fb 08 82 4c 89 44 24 28 c6 05 e4
 [    0.417662] RSP: 0000:ffff8881002efe30 EFLAGS: 00010202
 [    0.418686] RAX: 00000000ffffff01 RBX: 0000000000000002 RCX: 00000000ffffff01
 [    0.419982] RDX: 00000000fffffff6 RSI: 0000000000000300 RDI: ffff888100047168
 [    0.421166] RBP: 0000000000000000 R08: ffff888100047168 R09: 0000000000000000
 [    0.422514] R10: ffffffff830dee80 R11: 0000000000000000 R12: ffff888100047168
 [    0.423820] R13: 0000000000000002 R14: ffff888100193480 R15: ffff888380030f40
 [    0.425164] FS:  0000000000000000(0000) GS:ffff8881b9b76000(0000) knlGS:0000000000000000
 [    0.426751] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 [    0.427832] CR2: ffff88843ffff000 CR3: 000000000282c001 CR4: 0000000000370eb0
 [    0.428818] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 [    0.430131] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
 [    0.431429] Call Trace:
 [    0.431983]  <TASK>
 [    0.432500]  sched_init_smp+0x32/0xa0
 [    0.433069]  ? stop_machine+0x2c/0x40
 [    0.433821]  kernel_init_freeable+0xf5/0x260
 [    0.434682]  ? rest_init+0xc0/0xc0
 [    0.435399]  kernel_init+0x16/0x120
 [    0.436140]  ret_from_fork+0x5e/0xd0
 [    0.436817]  ? rest_init+0xc0/0xc0
 [    0.437526]  ret_from_fork_asm+0x11/0x20
 [    0.438335]  </TASK>
 [    0.438841] ---[ end trace 0000000000000000 ]---

Thanks

> +
>  	/* Build the groups for the domains */
>  	for_each_cpu(i, cpu_map) {
>  		for (sd = *per_cpu_ptr(d.sd, i); sd; sd = sd->parent) {
> -- 
> 2.26.2
> 
