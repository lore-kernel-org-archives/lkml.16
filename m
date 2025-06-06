Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA0289343
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749228953; cv=none; b=JBIZGdHX5/dHZF5VVRy7rvCfiS6BCHVblS44Kz2OuOt6Z7Ug/W3xL8dOkqqIYAfh7fxzB0KEPxFqQt41vhE65WZ69lz+i+5xuQjWmVIwWVoB6ndOufF1DyIfktPDZAW14So8APlO62RUMiaO37+6y/03OMDDKE1XSnL/du31IeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749228953; c=relaxed/simple;
	bh=utVji0gh0cITT6qLu7hQz3Zn+LIjyS0bbK0p5HBtEX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9cxbZqv4V+rPOe5ZkJiOVWUONaUTOvw8S7RDKZbxI6ExBtfo4rHYynDciwQUyy/FB6oysbkNl07wNVQIHBXeY4WSk+VlOJ3AXDAJngIMfHk4rFVNeuJBzCR+xTbgeP0TiHomNrDsc+aMLiLrvCidAwv7IZ5hcv7zbQI6p2593U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbIdut3U; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbIdut3U"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad69e4f2100so392414866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749228949; x=1749833749; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1HB33mTZ6Uyhbs2rVVA5QvTekUj8jcM1rft0PUvWrpc=;
        b=kbIdut3UCirGNc88MrUyYeg+0vRQT5uIxM+jpx1C2B2Mco04VPhpweNVUqCVq3h58L
         XE0rNVWhh97F5JtOzB37xx2tMLswxS1KnLfY/zXVZflutZtRPJFHs7VtMVCUlTaofez9
         qrwJ1U6QhO5ECZrXrBvI8lL2HwGzsidqYAQldysi65CQkWyqWlUPXhjw9SVawkVxHJ7+
         OC4Uu28TPK15fN0s1UsIh/FyfuMBvkmMZiY2obvOVOkczxsmuINiQSqy72YmUbBjp31G
         Co4Jqof0XVU3ZN7uSUZKJIYICQYJ1z2TgM2A1DkXgEL3Bt1hlVqXrgmKqQ6uXJu1sDuv
         owLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749228949; x=1749833749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HB33mTZ6Uyhbs2rVVA5QvTekUj8jcM1rft0PUvWrpc=;
        b=OzAvHAGpdF10TA5uSjLJ+PXLeBqgIrP3z5UsX6prQr9+gEw5mmyq6/NW5cX+GjyWYm
         9hscbYM3XW+bORrl0qopF/R1TPRLg8nxQi40QzeOSftILLDOl9KGLBdYqFeliRyLrN/A
         NWCT1xgWkStuW3caYbQ/fddfPl2YT8xcfHaGEdUNq3R+NiVQzyHFLAutdlzKHYtV4lR7
         UevGev+E6nW3hqELM/q5nD5Zz5rTo+OeLrdTO+NkpTiolFmu2PKl8iEsGCPE/3qzQ79L
         csAVx6KCVPZWWeHUd5hMoygosmHw2iQngrtaEo8QyACGJKT2BZGQyT3svF6NM94N4HSq
         jHvA==
X-Forwarded-Encrypted: i=1; AJvYcCXGAOk/OfTC7WTo/qYWpOPb9/Db6jju/4Hr2v40guUQJS0OHm4dJaNaHrQIERyl6d6pgg5WHuuA8jLPFSA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa+NkH2ITgJ71lYajy00LwcU5zVLhwvOcFe9xWkFEea0fkKxYk
	EjqkU1cFk48jYqpyi9AJdgMSJqYHwnXvwyGXas1UBmggHQkECIYYBhSceFeQZKTHSjxqNoNUdF9
	RejwzMrtjrnPU5TL3fjtQF3TSiRD0mJ8h4sy7oXEULg==
X-Gm-Gg: ASbGnctg5APFAPpNTe0mhObPdGZvd88OHB2XM72TvmA4Q4pGR0UlI/+dGxUQSfe5mou
	OTxIhXqCdH00BTOXZiA125I1qAq15fjP5k0f2+zebgPTdlj33SUXkADIZEdye02RjKwdVHmat5h
	agsSpoFCRDw1Rvp4U6+oZr4nuy34OKOwCjoWcMiY4ExxohGHZYHvG79SSQ6Y3NbdmhjPIlUpi7s
	wpJxFEHSoU=
X-Google-Smtp-Source: AGHT+IFHwPRqiSryPxM3bjTeEXWOPBxqHiddylVRC+mRJ/Sxer4f/km91+qaXRp/rF06w9ianzEchM0fhBXQAkGyry4=
X-Received: by 2002:a17:906:3c58:b0:ade:32fa:7394 with SMTP id
 a640c23a62f3a-ade32fa7ad5mr113294466b.35.1749228949422; Fri, 06 Jun 2025
 09:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520094538.086709102@infradead.org> <20250520101727.984171377@infradead.org>
 <CAKfTPtDOQVEMRWaK9xEVqSDKcvUfai4CUck6G=oOdaeRBhZQUw@mail.gmail.com> <20250606153800.GB39944@noisy.programming.kicks-ass.net>
In-Reply-To: <20250606153800.GB39944@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 6 Jun 2025 18:55:37 +0200
X-Gm-Features: AX0GCFu44L1pYU_1hc1fZsMIo6UCMJ-D6eVSUJtfs0Sa7xjJLRaSzjULbeTyYUA
Message-ID: <CAKfTPtDhC3nCcWcWSz08nadZDJ0OtbgZ0r3Usjcu6AagGqYcRA@mail.gmail.com>
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	clm@meta.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 17:38, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Jun 06, 2025 at 05:03:36PM +0200, Vincent Guittot wrote:
> > On Tue, 20 May 2025 at 12:18, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > One of the things lost with introduction of DELAY_DEQUEUE is the
> > > ability of TTWU to move those tasks around on wakeup, since they're
> > > on_rq, and as such, need to be woken in-place.
> >
> > I was thinking that you would call select_task_rq() somewhere in the
> > wake up path of delayed entity to get a chance to migrate it which was
> > one reason for the perf regression (and which would have also been
> > useful for EAS case) but IIUC, the task is still enqueued on the same
> > CPU but the target cpu will do the enqueue itself instead on the local
> > CPU. Or am I missing something ?
>
> Correct. I tried to add that migration into the mix, but then things get
> tricky real fast.

Yeah, I can imagine

>
> Just getting rid of the remote rq lock also helped; these dispatch
> threads just need to get on with waking up tasks, any delay hurts.
>
> > >
> > > Doing the in-place thing adds quite a bit of cross-cpu latency, add a
> > > little something that gets remote CPUs to do their own in-place
> > > wakeups, significantly reducing the rq->lock contention.
> > >
> > > Reported-by: Chris Mason <clm@meta.com>
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > ---
> > >  kernel/sched/core.c     |   74 ++++++++++++++++++++++++++++++++++++++++++------
> > >  kernel/sched/fair.c     |    5 ++-
> > >  kernel/sched/features.h |    1
> > >  kernel/sched/sched.h    |    1
> > >  4 files changed, 72 insertions(+), 9 deletions(-)
> > >
> > > --- a/kernel/sched/core.c
> > > +++ b/kernel/sched/core.c
> > > @@ -3784,6 +3784,8 @@ static int __ttwu_runnable(struct rq *rq
> > >         return 1;
> > >  }
> > >
> > > +static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags);
> > > +
> > >  /*
> > >   * Consider @p being inside a wait loop:
> > >   *
> > > @@ -3811,6 +3813,33 @@ static int __ttwu_runnable(struct rq *rq
> > >   */
> > >  static int ttwu_runnable(struct task_struct *p, int wake_flags)
> > >  {
> > > +#ifdef CONFIG_SMP
> > > +       if (sched_feat(TTWU_QUEUE_DELAYED) && READ_ONCE(p->se.sched_delayed)) {
> > > +               /*
> > > +                * Similar to try_to_block_task():
> > > +                *
> > > +                * __schedule()                         ttwu()
> > > +                *   prev_state = prev->state             if (p->sched_delayed)
> > > +                *   if (prev_state)                         smp_acquire__after_ctrl_dep()
> > > +                *     try_to_block_task()                   p->state = TASK_WAKING
> > > +                *       ... set_delayed()
> > > +                *         RELEASE p->sched_delayed = 1
> > > +                *
> > > +                * __schedule() and ttwu() have matching control dependencies.
> > > +                *
> > > +                * Notably, once we observe sched_delayed we know the task has
> > > +                * passed try_to_block_task() and p->state is ours to modify.
> > > +                *
> > > +                * TASK_WAKING controls ttwu() concurrency.
> > > +                */
> > > +               smp_acquire__after_ctrl_dep();
> > > +               WRITE_ONCE(p->__state, TASK_WAKING);
> > > +
> > > +               if (ttwu_queue_wakelist(p, task_cpu(p), wake_flags | WF_DELAYED))
> > > +                       return 1;
> > > +       }
> > > +#endif
> > > +
> > >         CLASS(__task_rq_lock, guard)(p);
> > >         return __ttwu_runnable(guard.rq, p, wake_flags);
> > >  }
> > > @@ -3830,12 +3859,41 @@ void sched_ttwu_pending(void *arg)
> > >         update_rq_clock(rq);
> > >
> > >         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> > > +               struct rq *p_rq = task_rq(p);
> > > +               int ret;
> > > +
> > > +               /*
> > > +                * This is the ttwu_runnable() case. Notably it is possible for
> > > +                * on-rq entities to get migrated -- even sched_delayed ones.
> >
> > I haven't found where the sched_delayed task could migrate on another cpu.
>
> Doesn't happen often, but it can happen. Nothing really stops it from
> happening. Eg weight based balancing can do it. As can numa balancing
> and affinity changes.

Yes, I agree that delayed tasks can migrate because of load balancing
but not at wake up.
