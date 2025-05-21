Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592C2137930
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835518; cv=none; b=P4COUeeEbW44HUz5KoJuouwmzUoSCrPJUz7Wsxk5pOVBpJoDHEAEKTzDwAr6gh8dkpH3mle/gJrI6NBHF46zZXnmZvJQXUDFYVEVTQP/d92eOBGaKkFjkVMv1EY84lU6fTuYKjaVXTiaCzP2dorOmOvtNaD/jEDXG8uCey7882Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835518; c=relaxed/simple;
	bh=mO9IVOnPUHtfhpYi4gvGK2KPnNYPPNEyzUYzQ6e1dyw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihBo0kXZNMWWb0H0bgwRTv2tLpu8bT1VM+defRmCuzHc9XxJFz5/mvhNqo0ZYRZyWfgto1FNyWZxWNH6EqYh7veGeT2G2uofICMUgldbmvTPMv70STrt812tF9xDDqlokwWgpIMb92v+t0Om1aVxYGSGBYzZJXNfXYucFNY6zo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A9DC4CEE4;
	Wed, 21 May 2025 13:51:56 +0000 (UTC)
Date: Wed, 21 May 2025 09:52:39 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: fengtian guo <fengtian_guo@hotmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH RT] Possible spinlock deadlock in kernel/sched/rt.c
 under high load
Message-ID: <20250521095239.0b254e36@gandalf.local.home>
In-Reply-To: <OSAPR01MB4675D865C73A00D744FC4AA7F59EA@OSAPR01MB4675.jpnprd01.prod.outlook.com>
References: <OSAPR01MB4675AD3FE11ED9C21055DE5AF59FA@OSAPR01MB4675.jpnprd01.prod.outlook.com>
	<OSAPR01MB4675D865C73A00D744FC4AA7F59EA@OSAPR01MB4675.jpnprd01.prod.outlook.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 21 May 2025 10:35:53 +0000
fengtian guo <fengtian_guo@hotmail.com> wrote:

> hardward: On arm64 with 32 cores
>=20
> First Deadlock Root Cause Analysis
> The initial deadlock occurs due to
> unprotected spinlock access between
> an IRQ work thread and a hardware interrupt on the same CPU
> Here is the critical path:
> Deadlock Sequence
> IRQ Work Thread Context (RT priority):
>=20
> irq_work =E2=86=92 rto_push_irq_work_func =E2=86=92 raw_spin_lock(&rq->lo=
ck) =E2=86=92 push_rt_task
> The rto_push_irq_work_func thread acquires rq->lock without disabling int=
errupts

rto_push_irq_work_func() must be called with interrupts disabled. If it is
not, then that's a bug in the implementation of irq_work!

>=20
> Hardware Interrupt Context (Clock timer):
> hrtimer_interrupt =E2=86=92 __hrtimer_run_queues =E2=86=92 _run_hrtimer =
=E2=86=92 hrtimer_wakeup =E2=86=92
> try_to_wake_up =E2=86=92 ttwu_queue =E2=86=92 raw_spin_lock(&rq->lock)
>=20
> The clock interrupt preempts the IRQ work thread while it holds rq->lock.
> The interrupt handler attempts to acquire the same rq->lock via ttwu_queue
> , causing a double-lock deadlock.



> Signed-off-by: Fengtian Guo <fengtian_guo@hotmail.com>
> ---
>  kernel/sched/rt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 5dc1ee8dc..52a2e7bce 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -2131,6 +2131,7 @@ void rto_push_irq_work_func(struct irq_work *work)
>                 container_of(work, struct root_domain, rto_push_work);
>         struct rq *rq;
>         int cpu;
> +       unsigned long flags;
>=20
>         rq =3D this_rq();
>=20
> @@ -2139,10 +2140,10 @@ void rto_push_irq_work_func(struct irq_work *work)
>          * When it gets updated, a check is made if a push is possible.
>          */
>         if (has_pushable_tasks(rq)) {
> -               raw_spin_lock(&rq->lock);
> +               raw_spin_lock_irqsave(&rq->lock, flags);
>                 while (push_rt_task(rq, true))
>                         ;
> -               raw_spin_unlock(&rq->lock);
> +               raw_spin_unlock_irqrestore(&rq->lock, flags);

interrupts should *NEVER* be enabled here!

>         }
>=20
>         raw_spin_lock(&rd->rto_lock);
> --

In kernel/sched/topology.c we have:

	rd->rto_push_work =3D IRQ_WORK_INIT_HARD(rto_push_irq_work_func);

That IRQ_WORK_INIT_HARD() means that this function must always be called
from hard interrupt context (or interrupts disabled). Even when PREEMPT_RT
is enabled.

If the irq_work is being called without interrupts disabled, there's a bug
somewhere else.

NACK on this patch, because its fixing a symptom of the bug and not the bug
itself.

The question is, how did this get called as a normal irq_work and not one
that was marked as "HARD"?

-- Steve
