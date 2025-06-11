Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D01C25B319
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632595; cv=none; b=JC3jRigFhCznJmNhf9uFZ4p0pJcfLoeROyi5z7yeJkBbzy48nLpxaPnov8EZS3WQUXUiVWjFsXocxagGzW5VveVwvnW0LxRjTfP7JedgjMuthktroaWq8L6xw1xGnxdgTZUAbTeXVvSogF9t85TA41hNJfirv9Vfey76SDfeEIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632595; c=relaxed/simple;
	bh=iX7+x0FfYBe/DR7QSE/EJvIDPjmONBKn0kchmFehL1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsWqYTqk7rPPPrbW06X5evXfHAMBj0w0Sg8U+USd2eOikB0uHbn4B3PyIy4YmUobVtNrVZUhwWrDyt5eesymhNQgNbYnGRzbvufm9n7HRlN5BCck+nEBOAV0v+m4cYiO01WUjJGvcYvlIBX2iEwffNa5wt/moKt0SX+8f3KeRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QnUtiAVM; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QnUtiAVM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mZUcP0OTAjcT1+yhcSQ1vFlO/y47GdQzSSSFfID+Mtg=; b=QnUtiAVMg6dRSEOpgxI+aI4dmF
	I8OPrNk5+i+jqdYCkwLB9xpXKf5KnNS7B3octSLMRTglosjS76jhZKNKmIU+ITbGmVBHjMnAxszXa
	ADYwAnG2lBZ3JIn1DREC1eoMnPilYH8lBFweBk59wYbDtWNQVIH1P9ws0Wa+EZMkcKi67+xxAua5Q
	rO2kWV5NSG+gGYYzGzGw4tEleIXX81BJqjA8zFDQ7baNTGMtgZ/ldXwAbglQwojjDi394JnBuLQ83
	pz1HEipWYjXITs2lhvoLtILmEBze5EzscwNAVk0djzuKLMTyg/p5eN08HFYpizJxb3m2xNC5EolZl
	KZXirOuA==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHMS-00000002DUw-2sWd;
	Wed, 11 Jun 2025 09:03:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9D81B3021EF; Wed, 11 Jun 2025 11:03:06 +0200 (CEST)
Date: Wed, 11 Jun 2025 11:03:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleinxer <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v2] sched: Remove a preempt-disable section in
 rt_mutex_setprio()
Message-ID: <20250611090306.GA2273038@noisy.programming.kicks-ass.net>
References: <20250610144700.uBK6RS95@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610144700.uBK6RS95@linutronix.de>

On Tue, Jun 10, 2025 at 04:47:00PM +0200, Sebastian Andrzej Siewior wrote:
> rt_mutex_setprio() has only one caller: rt_mutex_adjust_prio(). It
> expects that task_struct::pi_lock and rt_mutex_base::wait_lock are held.
> Both locks are raw_spinlock_t and are acquired with disabled interrupts.
> 
> Nevertheless rt_mutex_setprio() disables preemption while invoking
> __balance_callbacks() and raw_spin_rq_unlock(). Even if one of the
> balance callbacks unlocks the rq then it must not enable interrupts
> because rt_mutex_base::wait_lock is still locked.
> Therefore interrupts should remain disabled and disabling preemption is
> not needed.
> 
> Commit 4c9a4bc89a9cc ("sched: Allow balance callbacks for check_class_changed()")
> adds a preempt-disable section to rt_mutex_setprio() and
> __sched_setscheduler(). In __sched_setscheduler() the preemption is
> disabled before rq is unlocked and interrupts enabled but I don't see
> why it makes a difference in rt_mutex_setprio().
> 
> Remove the preempt_disable() section from rt_mutex_setprio().
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> 
> v1…v2: https://lore.kernel.org/all/20250513142954.ZM5QSQNc@linutronix.de/
>   - Repost without RFC
> 
>  kernel/sched/core.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index dce50fa57471d..362d8ab888748 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7292,14 +7292,10 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
>  
>  	check_class_changed(rq, p, prev_class, oldprio);
>  out_unlock:
> -	/* Avoid rq from going away on us: */
> -	preempt_disable();

Perhaps add:

	/* IRQs are still disabled */

or something to that effect such that it is obvious from reading the
code that dropping the lock will not enable preemption?

>  
>  	rq_unpin_lock(rq, &rf);
>  	__balance_callbacks(rq);
>  	raw_spin_rq_unlock(rq);
> -
> -	preempt_enable();
>  }
>  #endif
>  
> -- 
> 2.49.0
> 
