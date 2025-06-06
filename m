Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A065778F2F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749226713; cv=none; b=Zy0B92HF0XTDvTv76G/fIi17vwZCnZ8uJUNhi7rRaSktK5U5tBJpB6fUFyCPgFeDUykZr4ENZTvYa6DFojbeYGQDV0YKv7lYeHKg0CQ4fhCcrg/ApEbdBs9PmrCuCCWLm3WZQJnm86gWoRqlEno8cCrK4pbXcTsinjQthlN78Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749226713; c=relaxed/simple;
	bh=NNLzJ+PAgzMkCRPjs969McDPkBUd5D8rkcuMPGyC2+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLUa45kvfvG5JDFe88RIQ8dvEBIEjgCdtmjNivK0D4+QzMAvwezMEplU1cGU/k0FpzuO2wW6S24EkMhNubbsgClY+6DR1+PgYQCPEtFF6dQJfGwMuuUXVJitu2j/kPa+PCAWkR/1b9QS0xOCq4MJgPrR0noSQz2u4Qc59C4AQy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JRFIrEW1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JRFIrEW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749226710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8qAyPxag6dIVRowyQgYi5Fq3KS0p/re+LlLSWy5HXCw=;
	b=JRFIrEW1UJ9/gaSOL14QRRvys6xeOC8+0qHPK/5IbYtYVRF7l7IS1P3J2HryQ8KD2bhZnT
	1GPpcnz+dEGU3Uy0Bijq4JYnvfOfIFEX3VtMmJSISmCo8hDpFEXkNy+BJipMX+gAY0XO7E
	eD3GFWq85InRCdf8nHtJAq1NoRmGg7o=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-ee_a-SlhNXGRgANhOQfgDw-1; Fri,
 06 Jun 2025 12:18:27 -0400
X-MC-Unique: ee_a-SlhNXGRgANhOQfgDw-1
X-Mimecast-MFC-AGG-ID: ee_a-SlhNXGRgANhOQfgDw_1749226705
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AAB731956089;
	Fri,  6 Jun 2025 16:18:25 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.64.168])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E59B418003FD;
	Fri,  6 Jun 2025 16:18:22 +0000 (UTC)
Date: Fri, 6 Jun 2025 12:18:20 -0400
From: Phil Auld <pauld@redhat.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
	juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
Message-ID: <20250606161820.GA224542@pauld.westford.csb>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


Hi Peter,

On Fri, Jun 06, 2025 at 05:03:36PM +0200 Vincent Guittot wrote:
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

Yeah, this one still bites us.  We ran these patches on our perf
tests (with out twiddling any FEATs) and it was basically a wash.

The fs regression we saw due to always waking up on the same cpu
was still present as expected based on this patch I suppose.

Thanks,
Phil

> 
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
> 
> > +                */
> > +               if (unlikely(p_rq != rq)) {
> > +                       rq_unlock(rq, &rf);
> > +                       p_rq = __task_rq_lock(p, &rf);
> > +               }
> > +
> > +               ret = __ttwu_runnable(p_rq, p, WF_TTWU);
> > +
> > +               if (unlikely(p_rq != rq)) {
> > +                       if (!ret)
> > +                               set_task_cpu(p, cpu_of(rq));
> > +
> > +                       __task_rq_unlock(p_rq, &rf);
> > +                       rq_lock(rq, &rf);
> > +                       update_rq_clock(rq);
> > +               }
> > +
> > +               if (ret) {
> > +                       // XXX ttwu_stat()
> > +                       continue;
> > +               }
> > +
> > +               /*
> > +                * This is the 'normal' case where the task is blocked.
> > +                */
> > +
> >                 if (WARN_ON_ONCE(p->on_cpu))
> >                         smp_cond_load_acquire(&p->on_cpu, !VAL);
> >
> > -               if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
> > -                       set_task_cpu(p, cpu_of(rq));
> > -
> >                 ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
> >         }
> >
> > @@ -3974,7 +4032,7 @@ static inline bool ttwu_queue_cond(struc
> >
> >  static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
> >  {
> > -       bool def = sched_feat(TTWU_QUEUE_DEFAULT);
> > +       bool def = sched_feat(TTWU_QUEUE_DEFAULT) || (wake_flags & WF_DELAYED);
> >
> >         if (!ttwu_queue_cond(p, cpu, def))
> >                 return false;
> > @@ -4269,8 +4327,8 @@ int try_to_wake_up(struct task_struct *p
> >                  * __schedule().  See the comment for smp_mb__after_spinlock().
> >                  *
> >                  * Form a control-dep-acquire with p->on_rq == 0 above, to ensure
> > -                * schedule()'s deactivate_task() has 'happened' and p will no longer
> > -                * care about it's own p->state. See the comment in __schedule().
> > +                * schedule()'s try_to_block_task() has 'happened' and p will no longer
> > +                * care about it's own p->state. See the comment in try_to_block_task().
> >                  */
> >                 smp_acquire__after_ctrl_dep();
> >
> > @@ -6712,8 +6770,8 @@ static void __sched notrace __schedule(i
> >         preempt = sched_mode == SM_PREEMPT;
> >
> >         /*
> > -        * We must load prev->state once (task_struct::state is volatile), such
> > -        * that we form a control dependency vs deactivate_task() below.
> > +        * We must load prev->state once, such that we form a control
> > +        * dependency vs try_to_block_task() below.
> >          */
> >         prev_state = READ_ONCE(prev->__state);
> >         if (sched_mode == SM_IDLE) {
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -5395,7 +5395,10 @@ static __always_inline void return_cfs_r
> >
> >  static void set_delayed(struct sched_entity *se)
> >  {
> > -       se->sched_delayed = 1;
> > +       /*
> > +        * See TTWU_QUEUE_DELAYED in ttwu_runnable().
> > +        */
> > +       smp_store_release(&se->sched_delayed, 1);
> >
> >         /*
> >          * Delayed se of cfs_rq have no tasks queued on them.
> > --- a/kernel/sched/features.h
> > +++ b/kernel/sched/features.h
> > @@ -82,6 +82,7 @@ SCHED_FEAT(TTWU_QUEUE, false)
> >  SCHED_FEAT(TTWU_QUEUE, true)
> >  #endif
> >  SCHED_FEAT(TTWU_QUEUE_ON_CPU, true)
> > +SCHED_FEAT(TTWU_QUEUE_DELAYED, false)
> 
> I'm not sure that the feature will be tested as people mainly test
> default config
> 
> >  SCHED_FEAT(TTWU_QUEUE_DEFAULT, false)
> >
> >  /*
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -2313,6 +2313,7 @@ static inline int task_on_rq_migrating(s
> >  #define WF_RQ_SELECTED         0x80 /* ->select_task_rq() was called */
> >
> >  #define WF_ON_CPU              0x0100
> > +#define WF_DELAYED             0x0200
> >
> >  #ifdef CONFIG_SMP
> >  static_assert(WF_EXEC == SD_BALANCE_EXEC);
> >
> >
> 

-- 

