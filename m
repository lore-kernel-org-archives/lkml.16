Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEC6276048
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224292; cv=none; b=hOsgV0W0qmifleVFtgPOYFyL0Q4jhE7pkv2VH2aEEjPqziiFbNJ96eR8dVlf8izYqqmb50iFSisJgYSLbru3+WhnCylXD3fdFQ3b/z2PINELJcOtGikaKKGvNLceyMWJlfGY8pKf98Hmz7Dq+jcDr7DuFFVuzYRDQfi3N06o2w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224292; c=relaxed/simple;
	bh=4X95mHJDWKTAMJlKQG04hYb66R2l9Muxa2mv604C5rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSitwiGF08D/nWhIwd2ZYRw40jo+WYM4QxkeZULgszkQ//MFMg+YZGqiSViZOsb9YndfVY4daS6i7iBqYW3NKKZCgXut2oHi5F5BcXQSFS1nha6/DWHwAsRa1Cfve6l48bKGnLvvBVIoL9/OmvvPdC3RReSl0/5EiCJG8Zx6Mas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uLFwioCG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uLFwioCG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HePKWS3kmkS0czonpDaymeqsS5lCZ/0cwc3/yYKH/bc=; b=uLFwioCG2Nseyx2tnrhGq8Nxi1
	Sfz/sC+K3CvFwxAEiypJIlw9KdR/UVYpNPtdQ6hyPlfj7SFuPK3nHWJHmRzBGE43yqR52BmRuWFPj
	KmGGv6oiYGTZyNweWUKyJPy0Ch/EPWDuhR39M62USa0zBg/SSBz6Hk6aAVC5OiEh98kVnlZwpbNqB
	F++TlKA1LIqZVdXzCBgFjNOOSga1c911dJlrf9cHvE4dGpFR+Vf10DCBR4V4E492AHUHJ99WvL1HZ
	Hhs5Dw6B47QqgzeR5A/g9kCTfit5i0VZmUoYfsIgzMQTEGCPVYXFK9GmPzaGfX+B+qkMCEEjBDebJ
	MOrLOgkA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZ8r-00000005SHl-2YjK;
	Fri, 06 Jun 2025 15:38:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CC52C3005AF; Fri,  6 Jun 2025 17:38:00 +0200 (CEST)
Date: Fri, 6 Jun 2025 17:38:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
Message-ID: <20250606153800.GB39944@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <20250520101727.984171377@infradead.org>
 <CAKfTPtDOQVEMRWaK9xEVqSDKcvUfai4CUck6G=oOdaeRBhZQUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtDOQVEMRWaK9xEVqSDKcvUfai4CUck6G=oOdaeRBhZQUw@mail.gmail.com>

On Fri, Jun 06, 2025 at 05:03:36PM +0200, Vincent Guittot wrote:
> On Tue, 20 May 2025 at 12:18, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > One of the things lost with introduction of DELAY_DEQUEUE is the
> > ability of TTWU to move those tasks around on wakeup, since they're
> > on_rq, and as such, need to be woken in-place.
> 
> I was thinking that you would call select_task_rq() somewhere in the
> wake up path of delayed entity to get a chance to migrate it which was
> one reason for the perf regression (and which would have also been
> useful for EAS case) but IIUC, the task is still enqueued on the same
> CPU but the target cpu will do the enqueue itself instead on the local
> CPU. Or am I missing something ?

Correct. I tried to add that migration into the mix, but then things get
tricky real fast.

Just getting rid of the remote rq lock also helped; these dispatch
threads just need to get on with waking up tasks, any delay hurts.

> >
> > Doing the in-place thing adds quite a bit of cross-cpu latency, add a
> > little something that gets remote CPUs to do their own in-place
> > wakeups, significantly reducing the rq->lock contention.
> >
> > Reported-by: Chris Mason <clm@meta.com>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  kernel/sched/core.c     |   74 ++++++++++++++++++++++++++++++++++++++++++------
> >  kernel/sched/fair.c     |    5 ++-
> >  kernel/sched/features.h |    1
> >  kernel/sched/sched.h    |    1
> >  4 files changed, 72 insertions(+), 9 deletions(-)
> >
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -3784,6 +3784,8 @@ static int __ttwu_runnable(struct rq *rq
> >         return 1;
> >  }
> >
> > +static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags);
> > +
> >  /*
> >   * Consider @p being inside a wait loop:
> >   *
> > @@ -3811,6 +3813,33 @@ static int __ttwu_runnable(struct rq *rq
> >   */
> >  static int ttwu_runnable(struct task_struct *p, int wake_flags)
> >  {
> > +#ifdef CONFIG_SMP
> > +       if (sched_feat(TTWU_QUEUE_DELAYED) && READ_ONCE(p->se.sched_delayed)) {
> > +               /*
> > +                * Similar to try_to_block_task():
> > +                *
> > +                * __schedule()                         ttwu()
> > +                *   prev_state = prev->state             if (p->sched_delayed)
> > +                *   if (prev_state)                         smp_acquire__after_ctrl_dep()
> > +                *     try_to_block_task()                   p->state = TASK_WAKING
> > +                *       ... set_delayed()
> > +                *         RELEASE p->sched_delayed = 1
> > +                *
> > +                * __schedule() and ttwu() have matching control dependencies.
> > +                *
> > +                * Notably, once we observe sched_delayed we know the task has
> > +                * passed try_to_block_task() and p->state is ours to modify.
> > +                *
> > +                * TASK_WAKING controls ttwu() concurrency.
> > +                */
> > +               smp_acquire__after_ctrl_dep();
> > +               WRITE_ONCE(p->__state, TASK_WAKING);
> > +
> > +               if (ttwu_queue_wakelist(p, task_cpu(p), wake_flags | WF_DELAYED))
> > +                       return 1;
> > +       }
> > +#endif
> > +
> >         CLASS(__task_rq_lock, guard)(p);
> >         return __ttwu_runnable(guard.rq, p, wake_flags);
> >  }
> > @@ -3830,12 +3859,41 @@ void sched_ttwu_pending(void *arg)
> >         update_rq_clock(rq);
> >
> >         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> > +               struct rq *p_rq = task_rq(p);
> > +               int ret;
> > +
> > +               /*
> > +                * This is the ttwu_runnable() case. Notably it is possible for
> > +                * on-rq entities to get migrated -- even sched_delayed ones.
> 
> I haven't found where the sched_delayed task could migrate on another cpu.

Doesn't happen often, but it can happen. Nothing really stops it from
happening. Eg weight based balancing can do it. As can numa balancing
and affinity changes.
