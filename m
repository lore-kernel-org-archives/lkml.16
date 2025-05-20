Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FB11EA7FF
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751894; cv=none; b=hUHuY32omymyeaHS2WarfjRlDFgCVIHDQIzt/GQNM+kGUVVeCaKdwf7EUT5t1gxnLR9LeHp2rLRj2COxHzCYIzeo2rmWJSubN60VNkk6T+wcQilwsY95uBtzYEI5r0Yo3WxlfyAEmBPkGgWNgXWiyIkTbcJFHR5tWZZ+h49LfC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751894; c=relaxed/simple;
	bh=lu2UlZRkKIYYnWKefY5o1Xyt41Qq573lVm13ImzoMx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2+Aq7pOUum3Yo8B9H1rXLGwranuB9D0htHZ+iTLxtUsMpQJRao5QdNc+ya8BjRmCbSeq4f3rlEJQeak3L5lyapeagalrcffNo0qcZRYrtCJEW0o0UZmywjUNHJ5CD8mdB/QygbOHqGkG3CylvoXc6fyZof3tRW6vaHGMWjLKyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 260621516;
	Tue, 20 May 2025 07:37:58 -0700 (PDT)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AEA43F6A8;
	Tue, 20 May 2025 07:38:10 -0700 (PDT)
Message-ID: <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
Date: Tue, 20 May 2025 16:38:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: scheduler performance regression since v6.11
To: Peter Zijlstra <peterz@infradead.org>, Chris Mason <clm@meta.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 vschneid@redhat.com, Juri Lelli <juri.lelli@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250516101822.GC16434@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2025 12:18, Peter Zijlstra wrote:
> On Mon, May 12, 2025 at 06:35:24PM -0400, Chris Mason wrote:
> 
> Right, so I can reproduce on Thomas' SKL and maybe see some of it on my
> SPR.
> 
> I've managed to discover a whole bunch of ways that ttwu() can explode
> again :-) But as you surmised, your workload *LOVES* TTWU_QUEUE, and
> DELAYED_DEQUEUE takes some of that away, because those delayed things
> remain on-rq and ttwu() can't deal with that other than by doing the
> wakeup in-line and that's exactly the thing this workload hates most.
> 
> (I'll keep poking at ttwu() to see if I can get a combination of
> TTWU_QUEUE and DELAYED_DEQUEUE that does not explode in 'fun' ways)
> 
> However, I've found that flipping the default in ttwu_queue_cond() seems
> to make up for quite a bit -- for your workload.
> 
> (basically, all the work we can get away from those pinned message CPUs
> is a win)
> 
> Also, meanwhile you discovered that the other part of your performance
> woes were due to dl_server, specifically, disabling that gave you back a
> healthy chunk of your performance.
> 
> The problem is indeed that we toggle the dl_server on every nr_running
> from 0 and to 0 transition, and your workload has a shit-ton of those,
> so every time we get the overhead of starting and stopping this thing.
> 
> In hindsight, that's a fairly stupid setup, and the below patch changes
> this to keep the dl_server around until it's not seen fair activity for
> a whole period. This appears to fully recover this dip.
> 
> Trouble seems to be that dl_server_update() always gets tickled by
> random garbage, so in the end the dl_server never stops... oh well.
> 
> Juri, could you have a look at this, perhaps I messed up something
> trivial -- its been like that this week :/

On the same VM I use as a SUT for the 'hammerdb-mysqld' tests:

https://lkml.kernel.org/r/d6692902-837a-4f30-913b-763f01a5a7ea@arm.com

I can't spot any v6.11 related changes (dl_server or TTWU_QUEUE) but a
PSI related one for v6.12 results in a ~8% schbench regression.

VM (m7gd.16xlarge, 16 logical CPUs) on Graviton3:

schbench -L -m 4 -M auto -t 128 -n 0 -r 60

3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race

With CONFIG_PSI enabled we call cpu_clock(cpu) now multiple times (up to
4 times per task switch in my setup) in:

__schedule() -> psi_sched_switch() -> psi_task_switch() ->
psi_group_change().

There seems to be another/other v6.12 related patch(es) later which
cause(s) another 4% regression I yet have to discover.

[...]
