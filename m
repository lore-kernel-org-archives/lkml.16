Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF5E23BF9E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017032; cv=none; b=pWmYwgDCxa1EQgjyyyWaU+u/fs0znmfuXuW87OF8E9vMcSV8O+dTtJSKKg6Oxf9TFytkaKoS8wBrskFunckGUjytWG4LVGoKUPHbiyXxbrBJtTY84tqLOThnd28zYmGx0GSS+1KQZJQBsOJN8fhtCtXqzvvcKvnnUht9GF4roGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017032; c=relaxed/simple;
	bh=Vqhnsdgyw/STBZl9rFBTzagmkZ+ds/jt/eYzlfmnpew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJt2AunFimImI3AfS8UhFVQQAdmHao7hWT8XvPr5Kw5x0t1L8nVMoAlq8cWSbGCA/Tbs28rLxzckklkh96xeJti0B/g/PRK/NZTrhHQBreJB997TESGHs6gjOX0Utxov73rgPWvBAhEnwCPho6Yzdo4v3EVq4ZxmKT4c7fAN96Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b++a9hni; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b++a9hni"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X5oil7mFmz7rWqPq0OxlqBT4sZV4Ykxse3cu/o3/GrI=; b=b++a9hniLXynnx/Wn/YkeMjj8n
	IOzTcU5Tw7PuPzatrQeZHF1j5PeLgsf9zB0N/AzRj4exzTLokOlysT/aMNKxEbbJPbzneNvTI/Htm
	xIs3Ec+BzZ7hyzCUNBHFKzeinj+Ynrz5nkTeGf65sO2/iOuLBWjaSfjw2JMceh14jmFf9yWCRW8tA
	gnSHxjlNdvJwbKcW3gvzK4pksBiVxkYDAOqiQkZr2274Foioh+tDyE+E3CkgJIIahTrVRNH3bDWa3
	clZXmSVCg8YaEFPehrGw9+wrI96kYKfgMpm1ksD4jezddqTz/6R+COAeWo7fheOKWzAkcbDdKYyp8
	IYq1+5EQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA6mq-0000000Dmap-3aRn;
	Wed, 30 Apr 2025 12:43:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0D5C1300642; Wed, 30 Apr 2025 14:43:40 +0200 (CEST)
Date: Wed, 30 Apr 2025 14:43:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com,
	peter-yc.chang@mediatek.com
Subject: Re: [PATCH v3] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
Message-ID: <20250430124339.GM4439@noisy.programming.kicks-ass.net>
References: <20250429150736.3778580-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429150736.3778580-1-jstultz@google.com>

On Tue, Apr 29, 2025 at 08:07:26AM -0700, John Stultz wrote:
> It was reported that in 6.12, smpboot_create_threads() was
> taking much longer then in 6.6.
> 
> I narrowed down the call path to:
>  smpboot_create_threads()
>  -> kthread_create_on_cpu()
>     -> kthread_bind()
>        -> __kthread_bind_mask()
>           ->wait_task_inactive()
> 
> Where in wait_task_inactive() we were regularly hitting the
> queued case, which sets a 1 tick timeout, which when called
> multiple times in a row, accumulates quickly into a long
> delay.
> 
> I noticed disabling the DELAY_DEQUEUE sched feature recovered
> the performance, and it seems the newly create tasks are usually
> sched_delayed and left on the runqueue.
> 
> So in wait_task_inactive() when we see the task
> p->se.sched_delayed, manually dequeue the sched_delayed task
> with DEQUEUE_DELAYED, so we don't have to constantly wait a
> tick.

---

(that is, I'll trim the Changelog a this point, seeing how the rest is
'discussion')

> This seems to work, but I've only lightly tested it, so I'd love
> close review and feedback in case I've missed something in
> wait_task_inactive(), or if there is a simpler alternative
> approach.

There might be. I suspect:

	queued = task_on_rq_queued() && !p->se.sched_delayed;

might just work, but that is indeed pushing things quite far. That gets
us into the position of changing ->cpus_allowed while still enqueued,
and while it all might just work out, it is fairly tricky and not worth
the mental pain.

> NOTE: Peter did highlight[1] his general distaste for the
> kthread_bind() through wait_task_inactive() functions, which
> suggests a deeper rework might be better, but I'm not familiar
> enough with all its users to have a sense of how that might be
> done, and this fix seems to address the problem and be more
> easily backported to 6.12-stable, so I wanted to submit it
> again, as a potentially more short-term solution.

Right, so my distaste is with wait_task_inactive() for basically random
waiting for the condition to become true. The neater solution would be a
completion of sorts, but then we need the dequeue path to do a wakeup
and urgh.

So yeah, this is what we have.

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c81cf642dba05..b986cd2fb19b7 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2283,6 +2283,12 @@ unsigned long wait_task_inactive(struct task_struct *p, unsigned int match_state
>  		 * just go back and repeat.
>  		 */
>  		rq = task_rq_lock(p, &rf);
> +		/*
> +		 * If task is sched_delayed, force dequeue it, to avoid always
> +		 * hitting the tick timeout in the queued case
> +		 */
> +		if (p->se.sched_delayed)
> +			dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
>  		trace_sched_wait_task(p);
>  		running = task_on_cpu(rq, p);
>  		queued = task_on_rq_queued(p);

Lets just do this. I'll to stick it in queue/sched/core.
