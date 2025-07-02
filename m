Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B9B223DFB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751490498; cv=none; b=gdNG677xgMXXqxzLBg5nq6fJmbMIR/Nwa3C3cmLxHZ9j1yEe6/8hWp3//oyekyY4gUIPZzAHqndAiYOR2FZxy42Xv0M1OBgBFLFo3GXrFacWBpe70EqTVhbVRTBIDk0Y6L4VVl2n6Bxm2NgoKtovT0WwcIwYSS76fQwHEM961B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751490498; c=relaxed/simple;
	bh=b83RacbNG03KPTeK8UeYwhO/GSWglUyqpPb3h6i1Zyc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sE1ns0kBh7GCcufBJrKg7mTjgNmLlkyGtQxBRaZI1aJuX653MAvoLijBNkocU4CHELg3V5nBQQL6kTxJryL0yoqQ8mT+FjDu6bkhY7BW0M2wvZcbANEXmhN9ZEXfdZt9U+5uRA3TCtGaUWyZGKRl9ijlMzbwsvRdfz3WNWppd/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=n8FOj81N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="n8FOj81N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358A8C4CEE7;
	Wed,  2 Jul 2025 21:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751490497;
	bh=b83RacbNG03KPTeK8UeYwhO/GSWglUyqpPb3h6i1Zyc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n8FOj81NZYWRxHdNP2Kw7fX7VJysPCr74TKUarD0+nah9IvTTAg340+b+XJgP7Rtf
	 RdpMvs62w1/XtvYdEC86zQxafT16z184EsYY3S8Mg83F5wkrHtiYyxYBCBI8vvTfda
	 Z3szn5ysFgDQKst4Af6MeilAnnblFzmSCQEiZiiM=
Date: Wed, 2 Jul 2025 14:08:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Tim
 Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org, Jirka Hladky
 <jhladky@redhat.com>, Srikanth Aithal <Srikanth.Aithal@amd.com>, Suneeth D
 <Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-Id: <20250702140816.cea1c371bdcc92ec55a59434@linux-foundation.org>
In-Reply-To: <20250702163247.324439-1-yu.c.chen@intel.com>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Jul 2025 00:32:47 +0800 Chen Yu <yu.c.chen@intel.com> wrote:

> It was reported that after Commit ad6b26b6a0a7
> ("sched/numa: add statistics of numa balance task"),
> a NULL pointer exception[1] occurs when accessing
> p->mm. The following race condition was found to
> trigger this bug: After a swap task candidate is
> chosen during NUMA balancing, its mm_struct is
> released due to task exit. Later, when the task
> swapping is performed, p->mm is NULL, which causes
> the problem:
> 
> CPU0                                   CPU1
> :
> ...
> task_numa_migrate
>    task_numa_find_cpu
>     task_numa_compare
>       # a normal task p is chosen
>       env->best_task = p
> 
>                                         # p exit:
>                                         exit_signals(p);
>                                            p->flags |= PF_EXITING
>                                         exit_mm
>                                            p->mm = NULL;
> 
>     migrate_swap_stop
>       __migrate_swap_task((arg->src_task, arg->dst_cpu)
>        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
> 
> Fix this issue by checking if the task has the PF_EXITING
> flag set in migrate_swap_stop(). If it does, skip updating
> the memcg events. Additionally, log a warning if p->mm is
> NULL to facilitate future debugging.
>
> ...
>
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3364,7 +3364,14 @@ static void __migrate_swap_task(struct task_struct *p, int cpu)
>  {
>  	__schedstat_inc(p->stats.numa_task_swapped);
>  	count_vm_numa_event(NUMA_TASK_SWAP);
> -	count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +	/* exiting task has NULL mm */
> +	if (!(p->flags & PF_EXITING)) {
> +		WARN_ONCE(!p->mm, "swap task %d %s %x has no mm\n",
> +			  p->pid, p->comm, p->flags);
> +
> +		if (p->mm)
> +			count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +	}

I don't think we should warn on a condition which is known to occur and
which we successfully handle.  What action can anyone take upon that
warning?

Which means the change might as well become

+	/* comment goes here */
+	if (p->mm)
+		count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);

But is that a real fix?  Can the other thread call exit(), set
PF_EXITING and null its p->mm right between the above two lines?  After
the p->mm test and before the count_memcg_event_mm() call?

IOW, there needs to be some locking in place to stabilize p->mm
throughout the p->mm test and the count_memcg_event_mm() call?
