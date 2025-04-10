Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607FE26B97A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280049; cv=none; b=MMXJKS/FiwUzcMbMvHUzZRw8fm4x4Nn26Na+QPJ5pvvTnhJ9IoUsivj9VQFQ8meQ6gefZ5D78bwxFl+i4tlqa87PHuY7Sch0gcsow/LVqqo1j7Ug31vtU1QJ+uGtvfzfi8rgXhIlQ0ijHduxJCHJNY2Sw9S0PCjSrTjCD3lnfaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280049; c=relaxed/simple;
	bh=A9LLUL6IfQcihKeBnG7LchoBgfPsoxXFC4cvr8MG03A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLcJNh2W81kLhOKmTfIIHmACASjdvoeU0avhWMMPovDbl6z1s5gewggyq6NAEHQxORkPO4t7MHInEFKkohUjT3C6E4RjbC7H1OD56xPADImmqSwvg+l16ZCNwxgnOX73r5JhFd0vcI/ypN+TAjldJxp8JojcEbhx1P4UmJ7U49c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dSGQaHeV; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dSGQaHeV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mzZvAUthDjFifECAgc1qW3nhrU34hR/8JWpAQ5lxSLM=; b=dSGQaHeVdurFBEALlx8ji9kkW3
	ciotLRvfsmvqEZJzWVv6KQGipa2JuDy+9679yLrJ5CJ94Hnz0fyBhamHSKeXXUfpNqobMGk1L2A2h
	D3TfY1QPiewO5MlnENVP9gK4yfoNpFz7rNSJk8KUd0FtWbbTYxKLaAUdybkoVcSwMSPRvqGdecFz7
	OsjiPW5u2Q7GXMzDtvkTR5cG0DAtr8xkFTMYYATmA2/ZrH891yEs2srljkqXSdhF3/Euym6yXJWAU
	lmBRxtyP9M6vFH9sOvU9KtxkdMlPBMXihAFrPOx0QNLsJQ0D/0w6dRL7gYJ5502BElPCEPLfSh5cV
	KMIIL4/g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2ov5-00000008nIq-0dZW;
	Thu, 10 Apr 2025 10:14:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7B1B93003C4; Thu, 10 Apr 2025 12:14:02 +0200 (CEST)
Date: Thu, 10 Apr 2025 12:14:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: Re: [RFC PATCH 4/5] sched/fair: Rework inter-NUMA newidle balancing
Message-ID: <20250410101402.GC30687@noisy.programming.kicks-ass.net>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-5-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409111539.23791-5-kprateek.nayak@amd.com>

On Wed, Apr 09, 2025 at 11:15:38AM +0000, K Prateek Nayak wrote:
> +static inline int sched_newidle_pull_overloaded(struct sched_domain *sd,
> +						struct rq *this_rq,
> +						int *continue_balancing)
> +{
> +	struct cpumask *cpus = this_cpu_cpumask_var_ptr(load_balance_mask);
> +	int cpu, this_cpu = cpu_of(this_rq);
> +	struct sched_domain *sd_parent;
> +	struct lb_env env = {
> +		.dst_cpu	= this_cpu,
> +		.dst_rq		= this_rq,
> +		.idle		= CPU_NEWLY_IDLE,
> +	};
> +
> +
> +	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
> +
> +next_domain:
> +	env.sd = sd;
> +	/* Allow migrating cache_hot tasks too. */
> +	sd->nr_balance_failed = sd->cache_nice_tries + 1;
> +
> +	for_each_cpu_wrap(cpu, cpus, this_cpu) {
> +		struct sched_domain_shared *sd_share;
> +		struct cpumask *overloaded_mask;
> +		struct sched_domain *cpu_llc;
> +		int overloaded_cpu;
> +
> +		cpu_llc = rcu_dereference(per_cpu(sd_llc, cpu));
> +		if (!cpu_llc)
> +			break;
> +
> +		sd_share = cpu_llc->shared;
> +		if (!sd_share)
> +			break;
> +
> +		overloaded_mask = sd_share->overloaded_mask;
> +		if (!overloaded_mask)
> +			break;
> +
> +		for_each_cpu_wrap(overloaded_cpu, overloaded_mask, this_cpu + 1) {
> +			struct rq *overloaded_rq = cpu_rq(overloaded_cpu);
> +			struct task_struct *p = NULL;
> +
> +			if (sched_newidle_continue_balance(this_rq)) {
> +				*continue_balancing = 0;
> +				return 0;
> +			}
> +
> +			/* Quick peek to find if pushable tasks exist. */
> +			if (!has_pushable_tasks(overloaded_rq))
> +				continue;
> +
> +			scoped_guard (rq_lock, overloaded_rq) {
> +				update_rq_clock(overloaded_rq);
> +
> +				if (!has_pushable_tasks(overloaded_rq))
> +					break;

You can skip the clock update if there aren't any tasks to grab.

> +
> +				env.src_cpu = overloaded_cpu;
> +				env.src_rq = overloaded_rq;
> +
> +				p = detach_one_task(&env);

Yep, detach_one_task() uses can_migrate_task() which checks
task_on_cpu(), so that's all good :-)

> +			}
> +
> +			if (!p)
> +				continue;
> +
> +			attach_one_task(this_rq, p);
> +			return 1;
> +		}
> +
> +		cpumask_andnot(cpus, cpus, sched_domain_span(cpu_llc));
> +	}
