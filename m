Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4402F3E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997567; cv=none; b=u7D7uE37IcP2gHHiR75YCXMS4JFuyvB7isMDfVkdp3zzzacNhWDryFyrccNUgG7MUT5ZBdCJDLd/JMOlgJkcFLbkP9YrbdVhuxDB5GMiad7qGbRZUQ20D5CxQ6o2WoxS4MvgMDXbbRiNiVTATYuTV3dB6MLgKXqdRahe71zBRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997567; c=relaxed/simple;
	bh=f5BlxR9wBw2h2vR59F6mzFvs/sivfufffWwQlk2+iK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmknAICLSR04chcVhgrTmV/9pEChpSQ8yAGOETJhyPfYOSUEBAPyI6ivQJKcxaKUWhxksreIw1SqZcj2K8S89OdF43Ves/AlYd5PDmeps8y6mYnVjypKNKWxiVFh6ZaloENJDsoIT1AZoShDmkB+b0TQIR+lOUwyE4S9yDp9uE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Umgan0wy; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Umgan0wy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DfmDuuNEnX6j6GnweS6tLf57qKsRUaBkTAkp14jbMlI=; b=Umgan0wyXJ0eCX7JOiY9CSNwLg
	iJYcW7AewywSTzWJPf8mJ6veEZp/51BrVJWVoGTzv4yNcByqx+kzF1YkIew7JV2SHDYCnDzbV33Wi
	Jyz2KBXxl2w00h0JkAWdT4GwokEf9Vvo1J/a3H6tEtHwcjL7k46ZzktjwUx3oLuIuEU7KOWo5mLLh
	w9gfyFlRd0/tdTUtAsUoT73Nw40do4OBVP4E4JXu88AfnwhXsVCNIqo7i196MrQgrxCIilVmpch02
	OfieppB8fnFCqj0tSQ4WU4t5mfe3+cROPPiYRp4ZJ3vxf0YDTmKYTwWNuUyfY13o44UKM3+rcMuYM
	VyC5aCsw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ0l-00000007TtK-2X5x;
	Fri, 23 May 2025 10:52:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BFE9C300583; Fri, 23 May 2025 12:52:22 +0200 (CEST)
Date: Fri, 23 May 2025 12:52:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Paul McKenney <paulmck@kernel.org>
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
Message-ID: <20250523105222.GJ24938@noisy.programming.kicks-ass.net>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <20250522104843.GG39944@noisy.programming.kicks-ass.net>
 <20250522114012.GA672414@bytedance>
 <20250522115418.GI24938@noisy.programming.kicks-ass.net>
 <20250522123750.GB672414@bytedance>
 <20250523095350.GA1215853@bytedance>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523095350.GA1215853@bytedance>

On Fri, May 23, 2025 at 05:53:50PM +0800, Aaron Lu wrote:
> On Thu, May 22, 2025 at 08:40:02PM +0800, Aaron Lu wrote:
> > On Thu, May 22, 2025 at 01:54:18PM +0200, Peter Zijlstra wrote:
> > > On Thu, May 22, 2025 at 07:44:55PM +0800, Aaron Lu wrote:
> > > > On Thu, May 22, 2025 at 12:48:43PM +0200, Peter Zijlstra wrote:
> > > > > On Tue, May 20, 2025 at 06:41:05PM +0800, Aaron Lu wrote:
> > > > > 
> > > > > >  static void throttle_cfs_rq_work(struct callback_head *work)
> > > > > >  {
> > > > > > +	struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
> > > > > > +	struct sched_entity *se;
> > > > > > +	struct cfs_rq *cfs_rq;
> > > > > > +	struct rq *rq;
> > > > > > +
> > > > > > +	WARN_ON_ONCE(p != current);
> > > > > > +	p->sched_throttle_work.next = &p->sched_throttle_work;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * If task is exiting, then there won't be a return to userspace, so we
> > > > > > +	 * don't have to bother with any of this.
> > > > > > +	 */
> > > > > > +	if ((p->flags & PF_EXITING))
> > > > > > +		return;
> > > > > > +
> > > > > > +	scoped_guard(task_rq_lock, p) {
> > > > > > +		se = &p->se;
> > > > > > +		cfs_rq = cfs_rq_of(se);
> > > > > > +
> > > > > > +		/* Raced, forget */
> > > > > > +		if (p->sched_class != &fair_sched_class)
> > > > > > +			return;
> > > > > > +
> > > > > > +		/*
> > > > > > +		 * If not in limbo, then either replenish has happened or this
> > > > > > +		 * task got migrated out of the throttled cfs_rq, move along.
> > > > > > +		 */
> > > > > > +		if (!cfs_rq->throttle_count)
> > > > > > +			return;
> > > > > > +		rq = scope.rq;
> > > > > > +		update_rq_clock(rq);
> > > > > > +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> > > > > > +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > > > > > +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> > > > > > +		resched_curr(rq);
> > > > > > +	}
> > > > > > +
> > > > > > +	cond_resched_tasks_rcu_qs();
> > > > > >  }
> > > > > 
> > > > > What's that cond_resched thing about? The general plan is to make
> > > > > cond_resched go away.
> > > > 
> > > > Got it.
> > > > 
> > > > The purpose is to let throttled task schedule and also mark a task rcu
> > > > quiescent state. Without this cond_resched_tasks_rcu_qs(), this task
> > > > will be scheduled by cond_resched() in task_work_run() and since that is
> > > > a preempt schedule, it didn't mark a task rcu quiescent state.
> > > > 
> > > > Any suggestion here? Perhaps a plain schedule()? Thanks.
> > > 
> > > I am confused, this is task_work_run(), that is ran from
> > > exit_to_user_mode_loop(), which contains a schedule().
> >
> 
> I should probably have added that the schedule() call contained in
> exit_to_user_mode_loop() is early in that loop, where the to-be-throttled
> task doesn't have need_resched bit set yet.

No, but if it does get set, it will get picked up at:

	ti_work = read_thread_flags();

and since TIF_NEED_RESCHED is part of EXIT_TO_USER_MODE_WORK, we'll get
another cycle, and do the schedule() thing.

> > There is a cond_resched() in task_work_run() loop:
> > 
> > 		do {
> > 			next = work->next;
> > 			work->func(work);
> > 			work = next;
> > 			cond_resched();
> > 		} while (work);

That cond_resched() is equally going away.

> > And when this throttle work returns with need_resched bit set,
> > cond_resched() will cause a schedule but that didn't mark a task
> > quiescent state...
> 
> Another approach I can think of is to add a test of task_is_throttled()
> in rcu_tasks_is_holdout(). I remembered when I tried this before, I can
> hit the following path:

So this really is about task_rcu needing something? Let me go look at
task-rcu.

So AFAICT, exit_to_user_mode_loop() will do schedule(), which will call
__schedule(SM_NONE), which then will have preempt = false and call:
rcu_note_context_switch(false) which in turn will do:
rcu_task_rq(current, false).

This should be sufficient, no?
