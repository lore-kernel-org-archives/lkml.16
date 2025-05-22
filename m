Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB528A1D5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914876; cv=none; b=Xty1UwzfRyI0Dk2iB1j7MmnlHdJKKa2KwruGBYDbBhtUl7SEs/uqIzl8mT5Jb4uGdNFlXs8VW5T/xljnkLGDFyUyL5YySNmCTPeIVw1Kp5BoSvTW41k6Y7CAY90p344/50MPXPYhI0OVhnShAhfC4iNjsLL81iLDezhx8S91Rbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914876; c=relaxed/simple;
	bh=5gAmb49IIazbAEJoONsRShX8sNRCkUD2M0GcRQSzMZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsJXs2VI1V7F8kpbTzIMAWw/BHrULDxBjRCqNkyKtnt4kANjjixX5O+GgjEWs90+JCMUgmlO9PBHwI85R5uZcsNjQKaznrKEjm+QgyRCZJ4BLIXAXjIwXWKZF9+VBkSKTTI2FYPX+ME3Neg7KQHleXrS6QUrOwiIw0mJwTSlMyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SluC6gll; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SluC6gll"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OaRRngOHy0kK33o+oMOgjYeJSVoBzhiok336J8dzm6g=; b=SluC6glli74tHAo/ZVm/SJwlJL
	WUQ4HmVN9bmduxda/C5kgVMWxl5Tl2sb8epFML8cDASr7cJ8oSwrX/Owfd/9ePUKe8BDMKSoOdzYX
	uV9vzVLfVE0p9E+aaUp70XXLEgqD0bJZhZuwOkK84jGuCW8TNtb64kGMepmpA1mPVxelxTIgYPiUN
	2dmJ88BDj0qUNpBsBe3aLADRvyvhRdEQFb2nWasFX+5Of5FPeiGbY4xCs80HBvOyBb+zxvpvLYcS8
	amQkMGlw7s0j+2p4INKtxyVCGZx9siKGVVv9XDy4Cb0yjs6DZFNFB5muL4+2Y60CKGmrIoN1/XtU5
	/fGM+Ebw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uI4V9-000000011hz-3prp;
	Thu, 22 May 2025 11:54:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1AEB93002E5; Thu, 22 May 2025 13:54:19 +0200 (CEST)
Date: Thu, 22 May 2025 13:54:18 +0200
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
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
Message-ID: <20250522115418.GI24938@noisy.programming.kicks-ass.net>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <20250522104843.GG39944@noisy.programming.kicks-ass.net>
 <20250522114012.GA672414@bytedance>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522114012.GA672414@bytedance>

On Thu, May 22, 2025 at 07:44:55PM +0800, Aaron Lu wrote:
> On Thu, May 22, 2025 at 12:48:43PM +0200, Peter Zijlstra wrote:
> > On Tue, May 20, 2025 at 06:41:05PM +0800, Aaron Lu wrote:
> > 
> > >  static void throttle_cfs_rq_work(struct callback_head *work)
> > >  {
> > > +	struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
> > > +	struct sched_entity *se;
> > > +	struct cfs_rq *cfs_rq;
> > > +	struct rq *rq;
> > > +
> > > +	WARN_ON_ONCE(p != current);
> > > +	p->sched_throttle_work.next = &p->sched_throttle_work;
> > > +
> > > +	/*
> > > +	 * If task is exiting, then there won't be a return to userspace, so we
> > > +	 * don't have to bother with any of this.
> > > +	 */
> > > +	if ((p->flags & PF_EXITING))
> > > +		return;
> > > +
> > > +	scoped_guard(task_rq_lock, p) {
> > > +		se = &p->se;
> > > +		cfs_rq = cfs_rq_of(se);
> > > +
> > > +		/* Raced, forget */
> > > +		if (p->sched_class != &fair_sched_class)
> > > +			return;
> > > +
> > > +		/*
> > > +		 * If not in limbo, then either replenish has happened or this
> > > +		 * task got migrated out of the throttled cfs_rq, move along.
> > > +		 */
> > > +		if (!cfs_rq->throttle_count)
> > > +			return;
> > > +		rq = scope.rq;
> > > +		update_rq_clock(rq);
> > > +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> > > +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > > +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> > > +		resched_curr(rq);
> > > +	}
> > > +
> > > +	cond_resched_tasks_rcu_qs();
> > >  }
> > 
> > What's that cond_resched thing about? The general plan is to make
> > cond_resched go away.
> 
> Got it.
> 
> The purpose is to let throttled task schedule and also mark a task rcu
> quiescent state. Without this cond_resched_tasks_rcu_qs(), this task
> will be scheduled by cond_resched() in task_work_run() and since that is
> a preempt schedule, it didn't mark a task rcu quiescent state.
> 
> Any suggestion here? Perhaps a plain schedule()? Thanks.

I am confused, this is task_work_run(), that is ran from
exit_to_user_mode_loop(), which contains a schedule().


