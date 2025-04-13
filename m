Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342972D052
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744556756; cv=none; b=i36/s9VPgarG2ew6W0MPGSEOTjkgZ0Tvzqbvm+d63S7KvxC9YOfdBDyFVBhHbex2T7DpQEeAPXrrqdDzN4VPgKWlsH8g9PNk91oIVq38CvtHXb4j4SAig2FTwLJHTJfhjY6esNnoSAM+zqTL36sGkzxXD7/QdcoZe7afvsVhglU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744556756; c=relaxed/simple;
	bh=wh+2AVUkXsj1x0AjpoRQ/T9Fm+RZCQ1mI0V9pIyWM30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXfb+sjTMGWFXwP0ZNRjbjF4B/hn7ZL3Az0PaUaYmKqhXEZomo2PuQi50X+xbfISfsUillAXoJje9KUwoQ7WFKX+6eiUrrTJ/8qqbmIwZQg9IV+TaWyNVkb61K3/Tzs/RHZR+RZvgRUx27FLm1S3gi8JQP/C1XCwUVl0s2xzNhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V8uDCgty; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oY0wF5gd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V8uDCgty";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oY0wF5gd"
Date: Sun, 13 Apr 2025 17:05:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744556746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jv50ZCVz1GnW72SCCXXhpMw7sdaqRH3PIBwsNn5sMQ4=;
	b=V8uDCgty1q9ap2LN46+1Umc72knzzRD0JP4mhEZczaRXXBdoHwtn5cAeYKr5zTp1icDlQV
	t1/KegE4mGDg3LkNwHJ+lXPpCD8zkxDPK0cPerLh/TvmYWL8lCndvYUPbVYcO0irz76KVp
	KwL+BvvJYw7RIUwp1m4SLTHKSLR3G7/PxnL+GspcSQeZ0gWiKGU1qTkJSuB9jQavmZkwa4
	ChSeb4/lNvzJyrjV16AwHe22uf4ZzSq528wieslGk6lZuVikGxrULUYoSxYuZvoPyf4Ih1
	yz0dpvrGKCumQaZCvEcFcNyYwDvNf3r4opZe9vOoC5v9dlQo7aMw+S8IHHVrFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744556746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jv50ZCVz1GnW72SCCXXhpMw7sdaqRH3PIBwsNn5sMQ4=;
	b=oY0wF5gdE1JMtd59uTpXNB2Pm1FshTBDRla4ZOpXHwd2qeYQtTMJfrxur1+xuJrB99HEGK
	XEaQhDuRL5+wBtBg==
From: Nam Cao <namcao@linutronix.de>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tomas Glozar <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>
Subject: Re: [RFC PATCH 6/9] sched: Treat try_to_block_task with pending
 signal as wakeup
Message-ID: <20250413150540.3ZW7XJVs@linutronix.de>
References: <20250404084512.98552-11-gmonaco@redhat.com>
 <20250404084512.98552-17-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404084512.98552-17-gmonaco@redhat.com>

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

I don't think we should put trace_sched_waking() here. trace_sched_waking()
"is guaranteed to be called from the waking context", and this is not the
waking context.

There is already a trace_sched_waking() in signal_wake_up_state(). This is
duplicating that, in the wrong context.

ttwu_do_wakeup() alone should be sufficient?

Best regards,
Nam
