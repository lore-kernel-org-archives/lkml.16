Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A731523496B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795236; cv=none; b=KHl+CdHDH+KIgHpl53oBCFbcGbkRLfIHOou7ZPGVaLYuq4EkL4Z+vU5VgD4bB0LLu3JAfBbxQOVCOBVOFI7zzWfLUreqSG3/Mt5PX0FB5ThLMGx411jvcEifvRmbrVlgv1sL2PqraRoam0BHy4lsa7edoefOaYtbXtWuJjtaMN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795236; c=relaxed/simple;
	bh=w53eZt4eLaKMr/u0fPzOR+BbyDTcXXat1MK462TsFxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzQP9S1ewKoPmIIjtCLi5rZQ1xJQ15awdNRQFuDOKfeVmDnAvffdJkvw5LFER5JU1+WRGtwW7vUuA8qDXPv3OCmfGF3G3nclgd6a3cAgQ3tUoCNHQQn3P4CGWhkj+I4jgK6Um6Qln23MnixXdDkWu/2rdRvvrIboZTPHgrmgz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m/LUmJaY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RjfQ0LRi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m/LUmJaY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RjfQ0LRi"
Date: Wed, 16 Apr 2025 11:20:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744795232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5jDJFooUU/Y7DCLCUbzzuH4SCMRSP0YrZmfKGBrUWE=;
	b=m/LUmJaYha1W4yxHoFexHdQFtyczGsnOyXjsHsSeS/bhkuaSAnu6PDouXAVG1aClO6VkO2
	HWEsQVH2JwIFLayImfhxVCwqFCXwYZR5zS67Zw74snkQ3Hozb8Ke028UX/TWwOrOj736YU
	cQV2A4YY4ziFpB9jze1qjgdn3Xc8StgBtpiOlY1irPo8ukipboC2zxkBFXRQ1ulB1TBf1Z
	FjO1DwN02Fh+CU4OyC8BN+nD+beUN1cWQf1ixLeZu/9DFmXfjXlQe08o4I0zN1ORyRIw2/
	lkaGdI/bBTwu27qHEHemvL3Hr61Ymr8MgOEWfZUx54INW1dnDBUi2w34HCgOyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744795232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5jDJFooUU/Y7DCLCUbzzuH4SCMRSP0YrZmfKGBrUWE=;
	b=RjfQ0LRioZvsAETr3ZRq7G6s4PAzmr4ArjBCxkZaHuGGxKshxgIdOPcidQWhkkyHHFumfh
	jawRNbR4/VXy+LCA==
From: Nam Cao <namcao@linutronix.de>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tomas Glozar <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>
Subject: Re: [RFC PATCH 6/9] sched: Treat try_to_block_task with pending
 signal as wakeup
Message-ID: <20250416092027.yShf-ReN@linutronix.de>
References: <20250404084512.98552-11-gmonaco@redhat.com>
 <20250404084512.98552-17-gmonaco@redhat.com>
 <20250413150540.3ZW7XJVs@linutronix.de>
 <fb998d03b4ecc51834bf4383a71932ca877900cd.camel@redhat.com>
 <20250415110455.0Qj-4EN2@linutronix.de>
 <4e4b9c63-1b86-4d96-bcf3-0cdee8ba7c9e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e4b9c63-1b86-4d96-bcf3-0cdee8ba7c9e@redhat.com>

On Fri, Apr 04, 2025 at 10:45:19AM +0200, Gabriele Monaco wrote:
> If a task sets itself to interruptible and schedules, the __schedule
> function checks whether there's a pending signal and, if that's the
> case, updates the state of the task to runnable instead of dequeuing.
> By looking at the tracepoints, we see the task enters the scheduler
> while sleepable but exits as runnable. From a modelling perspective,
> this is equivalent to a wakeup and the tracepoints should reflect that.
> 
> Add the waking/wakeup tracepoints in the try_to_block_task function and
> set the prev_state used by the sched_switch tracepoint to TASK_RUNNING
> if the task had a pending signal and was not blocked.
> 
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>  kernel/sched/core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f2f79236d5811..48cb32abce01a 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6584,7 +6584,12 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
>  	int flags = DEQUEUE_NOCLOCK;
>  
>  	if (signal_pending_state(task_state, p)) {
> -		WRITE_ONCE(p->__state, TASK_RUNNING);
> +		/*
> +		 * From a modelling perspective, this is equivalent to a wakeup
> +		 * before dequeuing the task: trace accordingly.
> +		 */
> +		trace_sched_waking(p);
> +		ttwu_do_wakeup(p);
>  		return false;
>  	}
>  
> @@ -6721,7 +6726,9 @@ static void __sched notrace __schedule(int sched_mode)
>  			goto picked;
>  		}
>  	} else if (!preempt && prev_state) {
> -		try_to_block_task(rq, prev, prev_state);
> +		/* Task was not blocked due to a signal and is again runnable */
> +		if (!try_to_block_task(rq, prev, prev_state))
> +			prev_state = TASK_RUNNING;
>  		switch_count = &prev->nvcsw;
>  	}

I couldn't reproduce the problem that this patch is solving. But staring at
the srs monitor, I made an educated guess that this is to accomodate the
transition "sleepable x wakeup -> running"?

But for this transition, no real wakeup happens, just the task's state is
changed to "sleepable" then back to "running", right? Sleep hasn't actually
happened yet?

If that is the case, would the patch below also solves it? It would turn
the transition into "sleepable x set_runnable -> running", which I think
describe it more accurately.

Best regards,
Nam

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9a14d792a681..e39b4aadeba2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6592,6 +6592,7 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
 	int flags = DEQUEUE_NOCLOCK;
 
 	if (signal_pending_state(task_state, p)) {
+		trace_sched_set_state_tp(p, TASK_RUNNING);
 		WRITE_ONCE(p->__state, TASK_RUNNING);
 		return false;
 	}
