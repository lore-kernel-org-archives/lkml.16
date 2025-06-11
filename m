Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5155AEEA8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621973; cv=none; b=Bc9LOeXaaxcXOCFr8rMEpP2CTBBKrUb6L40/Qj8i18VaAH5YunBw9r/N9Aw40SkldrYDq20DpnxgE7YI27O4BeP4V9yl3p87Fn6w9mB++7fjow1r4VnbwTLEuxP16xm0HGOZtzE/ymrYh5cIbZD3w8n1nT6tT5RqJTUg0Ye6hes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621973; c=relaxed/simple;
	bh=HfwNEhg1gc9tswMtIbxoYWByWEOI/wYjO9dPwchD2y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAx4XLhtGsTAZ0bkuHoozivDzsJIDTaHO9DqnXpujkSGmOuaNv0r7Ug7TVsorCCtTifXE8z+9fFcYxc5n8YBFvX7uDBumIU5+cxBm6XUK6fqTM4if2IqTlzn7eR4xX+JPHt4H0c2mYSktCxLcgZY74CgahH+ufx9S8WKIgExKdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9dIaPBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9dIaPBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCDFC4CEEE;
	Wed, 11 Jun 2025 06:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749621972;
	bh=HfwNEhg1gc9tswMtIbxoYWByWEOI/wYjO9dPwchD2y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9dIaPBx044woqRWAZfhrHCMgUt5X2chaTPvCCu0aJDFIibF+KclvR/GVlDJl+tjs
	 FIPLgQi7MDN0GCnhHqkoY2tKs+TsS7FX4Tx5aX+mutujvy2qKfXITsgQpV8cU+OsCN
	 CeGorDlZuT9+zCeAYNIan61SelqKdkuhtifAlVXxHiGDgXeUNV7qToORqlf9/9wND6
	 HW6FyCj67gTegKoJzAdN6KrdjOIRrtG1PsC+L0jnpBulSZspLahUrSwZQyk+Zn/0gg
	 li3nCZHfBfdxHtS4xlu7qSfniK4y+Wi3hQBZ9QWOxLQDrT8MngTG+Jy75XKiTGOi7m
	 ngW0Z648pd3fQ==
Date: Wed, 11 Jun 2025 09:06:07 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Steve Wahl <steve.wahl@hpe.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Ingo Molnar <mingo@redhat.com>,
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
Message-ID: <20250611060607.GM10669@unreal>
References: <20250304160844.75373-1-steve.wahl@hpe.com>
 <20250304160844.75373-2-steve.wahl@hpe.com>
 <20250610110701.GA256154@unreal>
 <a5da2e4d-c042-4d01-bfc3-f50ca674247b@amd.com>
 <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com>

On Tue, Jun 10, 2025 at 02:39:54PM -0500, Steve Wahl wrote:
> On Tue, Jun 10, 2025 at 04:09:52PM +0300, Leon Romanovsky wrote:
> > 
> > 
> > On Tue, Jun 10, 2025, at 15:36, Leon Romanovsky wrote:
> > > On Tue, Jun 10, 2025 at 05:03:14PM +0530, K Prateek Nayak wrote:
> > >> Hello Leon,
> > >> 
> > >> On 6/10/2025 4:37 PM, Leon Romanovsky wrote:
> > >> 
> > >> [..snip..]
> > >> 
> > >> > > +	if (WARN_ON(!topology_span_sane(cpu_map)))
> > >> > > +		goto error;
> > >> > 
> > >> > Hi,

<...>

> > [    0.032233] [mem 0xc0000000-0xfed1bfff] available for PCI devices
> > [    0.032237] Booting paravirtualized kernel on KVM
> > [    0.032238] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
> > [    0.036921] setup_percpu: NR_CPUS:512 nr_cpumask_bits:10 nr_cpu_ids:10 nr_node_ids:5
> > [    0.038074] percpu: Embedded 53 pages/cpu s177240 r8192 d31656 u1048576
> > [    0.038108] Kernel command line: BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 root=UUID=49650207-5673-41e8-9f3b-5572de97a271 ro selinux=0 kasan_multi_shot net.ifnames=0 biosdevname=0 console=tty0 console=ttyS1,115200 audit=0 systemd.unified_cgroup_hierarchy=0 sched_verbose
> > [    0.038222] Unknown kernel command line parameters "kasan_multi_shot BOOT_IMAGE=(hd0,msdos1)/boot/vmlinuz-6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 selinux=0 biosdevname=0 audit=0", will be passed to user space.

<...>

> 
> I don't think that's the full dmesg output, maybe a console capture
> with reduced levels?  I'm not finding the output of sched_domain_debug() and
> sched_domain_debug_one() here.

It is not reduced, but standard debug level log, where KERN_DEBUG prints
aren't printed.

I don't know why sched_verbose is implemented how it is implemented,
but all these KERN_DEBUG prints in sched_domain_debug_one() are not controlled
through sched_verbose.

Thanks

> 
> Thanks,
> 
> Steve Wahl
> 
> > >
> > > Thanks
> > >
> > >> 
> > >> -- 
> > >> Thanks and Regards,
> > >> Prateek
> > >> 
> > >> > 
> > >> > Thanks
> > >> > 
> > >> > > +
> > >> > >   	/* Build the groups for the domains */
> > >> > >   	for_each_cpu(i, cpu_map) {
> > >> > >   		for (sd = *per_cpu_ptr(d.sd, i); sd; sd = sd->parent) {
> > >> > > -- 
> > >> > > 2.26.2
> > >> > > 
> > >>
> 
> -- 
> Steve Wahl, Hewlett Packard Enterprise
