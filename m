Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CA323959B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888731; cv=none; b=ST4gl+BdWzeTKAcQ9w1OznCNKuvyHYn98KIlz5NqdCvKPeTZVstUw0Hh1YliUrUcRD4xvLgBPbD7E5iTUUbuALt12DIKsoD95csprRPVISPleiuj+wfKQqpc80W87vKQ7JM5LNBJJ5nt+W/+iv/KlEOBX0lnX9aQOLX3CdZYn6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888731; c=relaxed/simple;
	bh=QP4WJhLzhiPmueTxbzmrg0FhGQy8DBMRnIoWrTDMJ0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzkqPe+81P1MSxcatEYt9PpzjMyRLSf052yNwqkVyxIBsxQ1g0b6pef5UVzZbR5Cq+pxu2g3zCKuBxbuNAODz9v1FjCgzN6MENobNl2yY/mRDOKuzgnh8eHunLRUvMbhdgiKtbOzQnQOyEwY+jMYSqjbcJFCHYU8r/l7BRs4Sfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OvPvRw8u; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OvPvRw8u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/23N940ohMw0VBNQcTEvKfr8hQpkaVBTR/ywBfH/25I=; b=OvPvRw8uwg0qWV1CLUE2iVsU/n
	TkqRKu2F4MjPShhKFip3riLQMi9nNr8Zxnna3HCVcV+vOOR83y3YhY9dZ6Ie2JmmXNM/YWwNuXtj2
	ZrQj8lUcmCUVK9qW0HuDHygot3TfbIPQktDV14HYj2IgWsJ6wMnv/1hLuEjXizpz3PbuJXEm5fdwV
	Ah4ZoLbFFsu6JVZoC5VD4qrbukVYr455sgsI07hmfxe4vuqZkZZxPblccTgY5kWmwQdnWEvnXTiXg
	cOgSSGOD3kTobXyQH4s1T5i5yqFlSQqKLvRO++tNmM8jVw3bTKeU18a05Jf6EqHaNTh2gHBcw8B4j
	Mesb8gQg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5NGU-0000000AGHW-0X1Y;
	Thu, 17 Apr 2025 11:18:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AD874300619; Thu, 17 Apr 2025 13:18:41 +0200 (CEST)
Date: Thu, 17 Apr 2025 13:18:41 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Subject: Re: [PATCH v16 5/7] sched: Add an initial sketch of the
 find_proxy_task() function
Message-ID: <20250417111841.GL38216@noisy.programming.kicks-ass.net>
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-6-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412060258.3844594-6-jstultz@google.com>

On Fri, Apr 11, 2025 at 11:02:39PM -0700, John Stultz wrote:
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +static inline struct task_struct *proxy_resched_idle(struct rq *rq)
> +{
> +	put_prev_set_next_task(rq, rq->donor, rq->idle);
> +	rq_set_donor(rq, rq->idle);
> +	set_tsk_need_resched(rq->idle);
> +	return rq->idle;
> +}
> +
> +static bool __proxy_deactivate(struct rq *rq, struct task_struct *donor)
> +{
> +	unsigned long state = READ_ONCE(donor->__state);
> +
> +	/* Don't deactivate if the state has been changed to TASK_RUNNING */
> +	if (state == TASK_RUNNING)
> +		return false;
> +	/*
> +	 * Because we got donor from pick_next_task, it is *crucial*

pick_next_task()

> +	 * that we call proxy_resched_idle before we deactivate it.

proxy_resched_idle()

> +	 * As once we deactivate donor, donor->on_rq is set to zero,
> +	 * which allows ttwu to immediately try to wake the task on

ttwu()

> +	 * another rq. So we cannot use *any* references to donor
> +	 * after that point. So things like cfs_rq->curr or rq->donor
> +	 * need to be changed from next *before* we deactivate.
> +	 */
> +	proxy_resched_idle(rq);
> +	return try_to_block_task(rq, donor, state, true);
> +}
> +
> +static struct task_struct *proxy_deactivate(struct rq *rq, struct task_struct *donor)
> +{
> +	if (!__proxy_deactivate(rq, donor)) {
> +		/*
> +		 * XXX: For now, if deactivation failed, set donor
> +		 * as unblocked, as we aren't doing proxy-migrations
> +		 * yet (more logic will be needed then).
> +		 */
> +		donor->blocked_on = NULL;
> +	}
> +	return NULL;
> +}
> +
> +/*
> + * Initial simple sketch that just deactivates the blocked task
> + * chosen by pick_next_task() so we can then pick something that
> + * isn't blocked.
> + */
> +static struct task_struct *
> +find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
> +{
> +	struct task_struct *p = donor;
> +	struct mutex *mutex;
> +
> +	mutex = p->blocked_on;
> +	/* Something changed in the chain, so pick again */
> +	if (!mutex)
> +		return NULL;
> +	/*
> +	 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
> +	 * and ensure @owner sticks around.
> +	 */
> +	guard(raw_spinlock)(&mutex->wait_lock);
> +
> +	/* Check again that p is blocked with blocked_lock held */
> +	if (!task_is_blocked(p) || mutex != __get_task_blocked_on(p)) {
> +		/*
> +		 * Something changed in the blocked_on chain and
> +		 * we don't know if only at this level. So, let's
> +		 * just bail out completely and let __schedule

__schedule()

> +		 * figure things out (pick_again loop).
> +		 */
> +		return NULL; /* do pick_next_task again */

pick_next_task()

> +	}
> +	return proxy_deactivate(rq, donor);

I was expecting a for() loop here, this only follows blocked_on once,
right?

> +}
