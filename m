Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3341D289829
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145688; cv=none; b=OR6dkEB+FR7+Ig4hZBwLSitsXyqhoSwIfD5M/aNgTuuAmSNBUJvIl/NXrypry96Yudcbm197FvkYXQ/3MivSuKO5os+xDtDrYZRcipN5LU6cY5LRL9pFWaviJRlFlvMUR0qY/BI9qyyC6yrbujhpyan67PZ5GVxUBLvTQC5EljQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145688; c=relaxed/simple;
	bh=vrIfBgdPSzVCtB6193rUgIP44Dtod8O7oM7+ne4bjZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPaoV5Me6+vY8NIMKNuuEOqWWwhmz7BsOt7KTVILtCXneTi4UwHgmx0aSKN0bM48KkLEg3ENfDJmGgGNSu8KIABGUt9+OlAd4U+EdglPUyoLFnsHOI8nrhHXVezEsLCyKacTVWuVyjEmswJt2kfRFAzFvupt5L8dW5HrQ3pW2JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwsD3FU9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwsD3FU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBABCC4CEEE;
	Tue, 17 Jun 2025 07:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750145687;
	bh=vrIfBgdPSzVCtB6193rUgIP44Dtod8O7oM7+ne4bjZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwsD3FU9LPqMjjdLOzh2W6G7CrZEGI+q+ZlF0kRXug1I9Y4ChRv/D+MkFlAZhdqsZ
	 g8qhvLomdTqbS6W61AVPjRajt9tq51LtfvAdPJWfg1j0PEakuUr8F9opKfX7JOOID6
	 oYiiWT/4bfXPOsaQabcM/6l+Te2qXiT5kS+KSPYWd4yIcPkpkPUqtdGWq6v64EFCqZ
	 lkUs4+aYTZJLroM92VGi0fqbAUDrW9vyGhM7VYwOvC+uZUWPJLEwnZws6N3KbrGZLV
	 jHu5bzxQ5cdzmO8rOHXwNApbmV4GHAAfbi9ZJd3RoqRdbV3KwZl6aoKnSgAdXOLIjQ
	 ts4NAmTgzRNgg==
Date: Tue, 17 Jun 2025 10:34:42 +0300
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
Message-ID: <20250617073442.GG750234@unreal>
References: <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com>
 <20250611060607.GM10669@unreal>
 <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>
 <20250612074157.GO10669@unreal>
 <5a673979-e96c-4dc2-b84b-849c6c8084ae@amd.com>
 <223b16a5-8532-4f5b-b34a-c7a0448f2454@amd.com>
 <20250615064207.GA750234@unreal>
 <aFAnwZLdGn8zrrqG@swahl-home.5wahls.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFAnwZLdGn8zrrqG@swahl-home.5wahls.com>

On Mon, Jun 16, 2025 at 09:18:41AM -0500, Steve Wahl wrote:
> On Sun, Jun 15, 2025 at 09:42:07AM +0300, Leon Romanovsky wrote:
> > On Thu, Jun 12, 2025 at 04:11:52PM +0530, K Prateek Nayak wrote:
> > > On 6/12/2025 3:00 PM, K Prateek Nayak wrote:
> > > > Ah! Since this happens so early topology isn't created yet for
> > > > the debug prints to hit! Is it possible to get a dmesg with
> > > > "ignore_loglevel" and "sched_verbose" on an older kernel that
> > > > did not throw this error on the same host?
> > 
> > This is dmesg with reverted two commits "ched/topology: Refinement to
> > topology_span_sane speedup" and "sched/topology: improve
> > topology_span_sane speed"

<...>

> > > 
> > > One better would be running with the following diff on top of v6.16-rc1
> > > is possible:
> > 
> > We are working to get this one too.

 [    0.435961] smp: Bringing up secondary CPUs ...
 [    0.437573] smpboot: x86: Booting SMP configuration:
 [    0.438611] .... node  #0, CPUs:        #1
 [    0.440449] .... node  #1, CPUs:    #2  #3
 [    0.442906] .... node  #2, CPUs:    #4  #5
 [    0.445298] .... node  #3, CPUs:    #6  #7
 [    0.447715] .... node  #4, CPUs:    #8  #9
 [    0.481482] smp: Brought up 5 nodes, 10 CPUs
 [    0.483160] smpboot: Total of 10 processors activated (45892.16 BogoMIPS)
 [    0.486872] tl(SMT) CPU(0) ID(0) CPU_TL_SPAN(0) ID_TL_SPAN(0)
 [    0.488029] tl(SMT) CPU(1) ID(1) CPU_TL_SPAN(1) ID_TL_SPAN(1)
 [    0.489151] tl(SMT) CPU(2) ID(2) CPU_TL_SPAN(2) ID_TL_SPAN(2)
 [    0.489761] tl(SMT) CPU(3) ID(3) CPU_TL_SPAN(3) ID_TL_SPAN(3)
 [    0.490876] tl(SMT) CPU(4) ID(4) CPU_TL_SPAN(4) ID_TL_SPAN(4)
 [    0.491996] tl(SMT) CPU(5) ID(5) CPU_TL_SPAN(5) ID_TL_SPAN(5)
 [    0.493115] tl(SMT) CPU(6) ID(6) CPU_TL_SPAN(6) ID_TL_SPAN(6)
 [    0.493754] tl(SMT) CPU(7) ID(7) CPU_TL_SPAN(7) ID_TL_SPAN(7)
 [    0.494875] tl(SMT) CPU(8) ID(8) CPU_TL_SPAN(8) ID_TL_SPAN(8)
 [    0.496008] tl(SMT) CPU(9) ID(9) CPU_TL_SPAN(9) ID_TL_SPAN(9)
 [    0.497129] tl(PKG) CPU(0) ID(0) CPU_TL_SPAN(0-1) ID_TL_SPAN(0-1)
 [    0.497763] tl(PKG) CPU(1) ID(0) CPU_TL_SPAN(0-1) ID_TL_SPAN(0-1)
 [    0.498954] tl(PKG) CPU(2) ID(2) CPU_TL_SPAN(2-3) ID_TL_SPAN(2-3)
 [    0.500167] tl(PKG) CPU(3) ID(2) CPU_TL_SPAN(2-3) ID_TL_SPAN(2-3)
 [    0.501371] tl(PKG) CPU(4) ID(4) CPU_TL_SPAN(4-5) ID_TL_SPAN(4-5)
 [    0.501792] tl(PKG) CPU(5) ID(4) CPU_TL_SPAN(4-5) ID_TL_SPAN(4-5)
 [    0.503001] tl(PKG) CPU(6) ID(6) CPU_TL_SPAN(6-7) ID_TL_SPAN(6-7)
 [    0.504202] tl(PKG) CPU(7) ID(6) CPU_TL_SPAN(6-7) ID_TL_SPAN(6-7)
 [    0.505419] tl(PKG) CPU(8) ID(8) CPU_TL_SPAN(8-9) ID_TL_SPAN(8-9)
 [    0.506637] tl(PKG) CPU(9) ID(8) CPU_TL_SPAN(8-9) ID_TL_SPAN(8-9)
 [    0.507843] tl(NODE) CPU(0) ID(0) CPU_TL_SPAN(0-1,8-9) ID_TL_SPAN(0-1,8-9)
 [    0.509199] tl(NODE) CPU(1) ID(0) CPU_TL_SPAN(0-1,8-9) ID_TL_SPAN(0-1,8-9)
 [    0.509792] tl(NODE) CPU(2) ID(2) CPU_TL_SPAN(2-3,8-9) ID_TL_SPAN(2-3,8-9)
 [    0.511143] Failed tl: NODE
 [    0.511789] Failed for CPU: 2
 [    0.512466] ID CPU at tl: 2
 [    0.513115] Failed CPU span at tl: 2-3,8-9
 [    0.513701] ID CPU span: 2-3,8-9
 [    0.514419] ID CPUs seen: 0
 [    0.515055] CPUs covered: 0-1,8-9
 [    0.515802] ------------[ cut here ]------------
 [    0.516753] WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2499 build_sched_domains.cold+0x96/0x23a
 [    0.517937] Modules linked in:
 [    0.518630] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1master_70c6e66 #1 NONE
 [    0.520353] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
 [    0.522008] RIP: 0010:build_sched_domains.cold+0x96/0x23a
 [    0.523102] Code: c2 80 33 91 83 48 c7 c7 0d 6e 68 82 e8 76 1f 00 00 8b 35 80 1d f8 01 48 c7 c2 c0 33 91 83 48 c7 c7 24 6e 68 82 e8 5d 1f 00 00 <0f> 0b bd f4 ff ff ff e9 fe 08 28 00 be 40 00 00 00 bf 0f 00 00 00
 [    0.526338] RSP: 0000:ffff88810096be18 EFLAGS: 00010246
 [    0.527408] RAX: 0000000000000015 RBX: 0000000000000002 RCX: ffff88843ffd26a8
 [    0.528804] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000001
 [    0.529808] RBP: ffff888100062150 R08: 0000000000000000 R09: 0000000000000000
 [    0.531211] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000002
 [    0.532607] R13: 0000000000000002 R14: 0000000000000002 R15: ffff88838000b480
 [    0.533813] FS:  0000000000000000(0000) GS:ffff8881b9358000(0000) knlGS:0000000000000000
 [    0.535478] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 [    0.536639] CR2: ffff88843ffff000 CR3: 0000000002e5d001 CR4: 0000000000370eb0
 [    0.537802] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 [    0.539203] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
 [    0.540564] Call Trace:
 [    0.541138]  <TASK>
 [    0.541647]  sched_init_smp+0x32/0xa0
 [    0.542434]  kernel_init_freeable+0x169/0x330
 [    0.543329]  ? rest_init+0x1b0/0x1b0
 [    0.544092]  kernel_init+0x17/0x140
 [    0.544830]  ret_from_fork+0x140/0x1b0
 [    0.545419]  ? rest_init+0x1b0/0x1b0
 [    0.546185]  ret_from_fork_asm+0x11/0x20
 [    0.547041]  </TASK>
 [    0.547586] irq event stamp: 8887
 [    0.548321] hardirqs last  enabled at (8897): [<ffffffff814b3b9a>] __up_console_sem+0x5a/0x70
 [    0.549918] hardirqs last disabled at (8908): [<ffffffff814b3b7f>] __up_console_sem+0x3f/0x70
 [    0.551593] softirqs last  enabled at (8292): [<ffffffff814363b2>] irq_exit_rcu+0x82/0xe0
 [    0.553208] softirqs last disabled at (8285): [<ffffffff814363b2>] irq_exit_rcu+0x82/0xe0
 [    0.553909] ---[ end trace 0000000000000000 ]---

