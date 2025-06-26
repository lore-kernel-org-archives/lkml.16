Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07DE23B619
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750921267; cv=none; b=qWv44aEg/Xf7Sj0XARbnRcRDzBx9oNAEtun4q5GfBF7KIK67iprPOAyJVJ3owNqRLSDeMdIuO0iC0iSgaqpK84WJGF8feyBaybi7d5ET1jqKrmgUvGRlsce02YaoSnMzdgR5B0sPaWbc5KcIJcv/MtzKGI1sEGSGuZbEkIcBaxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750921267; c=relaxed/simple;
	bh=lnb9fjSsi3ho/YIzcfjvlnB2jLRzQdkIe98Py2GodWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aT/KT8JbSr3cekkcA3WwLk3NW+BFjYOCGX7+HDlpz6gvpJijDQWJyFKkGaXNIieox/eN+Iovq4ZF7vbS5iqqhFbwJ38FQRz5BKbyMYSh5BrFJ6vJh0Gr9GZimZXqJwepbAa5EFuvgyOO0lXQsRDn9ff5L4TD1EUQccULPZnA+Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Oh+j5cSY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Oh+j5cSY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ksBgVlBwt2p4ljlEqS2TPHZ19wTZZxgaS58UfADih4w=; b=Oh+j5cSYWItZZszTHfVf+O1XN5
	akKnSxA4BrX/KDhbckB7dMjR7eHb9w5CYQRoB+Nl658PSIIYALYBL5qvsM+7Vx05qicHD36iHf48j
	eLQJqm98XxUa1tBi0/1VzE0m0peMsDYYATUVzckAcdFSOJ1m+fe5e4ydwA97nUG57gXXhOgRwX/xD
	sdMA9OESXo3Wh6E9bgdkgGzQf/nZBpeJSJEBS+LUREtKQVJd7FlpZ/PI/b2WCq3llIsa2+0c1OS+o
	dc1zTTWza5RhgrrxFZKh3BVfFRHU+AcW97TBUwcfwxO0mL1yHN7xce1G2D2RM70GomeL/dhrPF58g
	b8R94wKg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUgbS-0000000B7vu-1xRo;
	Thu, 26 Jun 2025 07:00:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2B967302EEA; Thu, 26 Jun 2025 09:00:57 +0200 (CEST)
Date: Thu, 26 Jun 2025 09:00:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Mason <clm@fb.com>
Cc: vincent.guittot@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when
 newidle balance fails
Message-ID: <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
References: <20250624204942.715206-1-clm@fb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624204942.715206-1-clm@fb.com>

On Tue, Jun 24, 2025 at 01:48:08PM -0700, Chris Mason wrote:
> schbench (https://github.com/masoncl/schbench.git) is showing a
> regression from previous production kernels that bisected down to:
> 
> sched/fair: Remove sysctl_sched_migration_cost condition (c5b0a7eefc)
> 
> The schbench command line was:
> 
> schbench -L -m 4 -M auto -t 256 -n 0 -r 0 -s 0
> 
> This creates 4 message threads pinned to CPUs 0-3, and 256x4 worker
> threads spread across the rest of the CPUs.  Neither the worker threads
> or the message threads do any work, they just wake each other up and go
> back to sleep as soon as possible.
> 
> The end result is the first 4 CPUs are pegged waking up those 1024
> workers, and the rest of the CPUs are constantly banging in and out of
> idle.  If I take a v6.9 Linus kernel and revert that one commit,
> performance goes from 3.4M RPS to 5.4M RPS.
> 
> schedstat shows there are ~100x  more new idle balance operations, and
> profiling shows the worker threads are spending ~20% of their CPU time
> on new idle balance.  schedstats also shows that almost all of these new
> idle balance attemps are failing to find busy groups.
> 
> The fix used here is to crank up the cost of the balance whenever it
> fails to find a busy group or busy queue.
> 
> Signed-off-by: Chris Mason <clm@fb.com>
> ---
>  kernel/sched/fair.c | 52 ++++++++++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 24 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7a14da5396fb2..0c4701564ce01 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -11744,6 +11744,32 @@ static void update_lb_imbalance_stat(struct lb_env *env, struct sched_domain *sd
>  	}
>  }
>  
> +static inline bool update_newidle_cost(struct sched_domain *sd, u64 cost)
> +{
> +	if (cost > sd->max_newidle_lb_cost) {
> +		/*
> +		 * Track max cost of a domain to make sure to not delay the
> +		 * next wakeup on the CPU.   Add a bit to the min so we don't
> +		 * have to worry about <= vs <, and to handle the sysctl set at
> +		 * zero.
> +		 */
> +		sd->max_newidle_lb_cost = min(cost, sysctl_sched_migration_cost + 200);
> +		sd->last_decay_max_lb_cost = jiffies;
> +	} else if (time_after(jiffies, sd->last_decay_max_lb_cost + HZ)) {
> +		/*
> +		 * Decay the newidle max times by ~1% per second to ensure that
> +		 * it is not outdated and the current max cost is actually
> +		 * shorter.
> +		 */
> +		sd->max_newidle_lb_cost = (sd->max_newidle_lb_cost * 253) / 256;
> +		sd->last_decay_max_lb_cost = jiffies;
> +
> +		return true;
> +	}
> +
> +	return false;
> +}
> +

For the non-RFC version, please split this into a code move and a code
change -- I had to stare waaay to long to spot the difference (if we
keep this code movement at all).

>  /*
>   * Check this_cpu to ensure it is balanced within domain. Attempt to move
>   * tasks if there is an imbalance.
> @@ -11782,12 +11808,14 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>  
>  	group = sched_balance_find_src_group(&env);
>  	if (!group) {
> +		update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
>  		schedstat_inc(sd->lb_nobusyg[idle]);
>  		goto out_balanced;
>  	}
>  
>  	busiest = sched_balance_find_src_rq(&env, group);
>  	if (!busiest) {
> +		update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
>  		schedstat_inc(sd->lb_nobusyq[idle]);
>  		goto out_balanced;
>  	}

So sched_balance_rq() is used for pretty much all load-balancing, not
just newidle.

Either make this conditional like:

	if (idle == CPU_NEWLY_IDLE)
		update_newidle_cost(...);

or do it all the callsite, where we find !pulled_task (ie failure).

Specifically, we already do update_newidle_cost() there, perhaps inflate
the cost there instead?

	if (!pulled_tasks)
		domain_cost += sysctl_sched_migration_cost;

or whatever.

