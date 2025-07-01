Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412DA25EFBD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359362; cv=none; b=Eerm0cIG6VmhjtTstj8f+3bK6DXKcFYOkshNo12JKErYgBCy2SarNer0qpQd8IXVqyymJod+laG45bKjfMZ0bHV/tmJmPTw+pWCb1DqRlg6+tbTxAYCB/n/kkSeKNLPqoX3mRNEFZ3BmfReTwtKjnGpEzsl0pg2M7I2wEIeqnK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359362; c=relaxed/simple;
	bh=RJw9RoVeiI+Hqtpmcr6H53vCTTqqMXgI1jCjfstzny8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NtDVovDT6ENBdoRqV/kYDYCmyTMy26G7tkJBK7lvStOArcB34xzBCbkssJQT8HOLnehUCu3NvpvenK2rN7RXPaggObDhNjvgTukGF90ouxqdQhDL0x1ER2UEsHFfBjTpGPuIbYzJiteiOB6umx5xsZszxcVJ4WKnKejzGYsyde8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S26DYWSW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mkg1br/Z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S26DYWSW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mkg1br/Z"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751359357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RVTlIj7NvgzvOsBTytix5R7Rn6og7e5lfwZT/BalhQU=;
	b=S26DYWSWg9jo6HIs4UK68iwJxjsX8nwlx70bKU4BM1DZcjSkbeiQydJHurgN93tgtOJKmL
	J/g3PC+6Kx598/v4Ud3W5BLvN+h5QXVnpvx1bkwhuCOVCHfCm/8Z3NYS2ZdUNP8kagS2b6
	gerN8nd8WyAozNG9iOlxM2pl6v7pk3QWGZNyy7wgvH5I/xBwvyhIUW+huToahyaZxJjUIg
	uTgh84RuzR3pUx3Z2QDZY3aLiPWM+16I3xrJbMvOdzCDxzukOkaiKMvlECCeTgJQMxoeK+
	OrtBCskhGpLVPpDzbIbTXIbLzfNT4BouXB0vGmhsO7eQ2e6fu8BRfck9Y2MyFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751359357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RVTlIj7NvgzvOsBTytix5R7Rn6og7e5lfwZT/BalhQU=;
	b=mkg1br/ZwOKTYlZv2VRDMouF2nqnsv1FkonggtqS07JI3Xq7abgKY8NB642OUzILe/hmrk
	opW55piNbpBDKnDA==
To: Prakash Sangappa <prakash.sangappa@oracle.com>,
 linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, bigeasy@linutronix.de,
 kprateek.nayak@amd.com, vineethr@linux.ibm.com
Subject: Re: [PATCH V6 1/7] Sched: Scheduler time slice extension
In-Reply-To: <20250701003749.50525-2-prakash.sangappa@oracle.com>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-2-prakash.sangappa@oracle.com>
Date: Tue, 01 Jul 2025 10:42:36 +0200
Message-ID: <87cyakmhdv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 01 2025 at 00:37, Prakash Sangappa wrote:

The subsystem prefix for the scheduler is 'sched:' It's not that hard to
figure out.

>  unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
> -				     unsigned long ti_work);
> +				     unsigned long ti_work,
> +				     bool irq);

No need for a new line
  
>  /**
>   * exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
> @@ -316,7 +317,8 @@ unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
>   *    EXIT_TO_USER_MODE_WORK are set
>   * 4) check that interrupts are still disabled
>   */
> -static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
> +static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs,
> +						bool irq)

Ditto. 100 characters line width, please use it. And if you need a line
break, please align the second lines arguments properly. This is
documented:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html

>  {
>  	unsigned long ti_work;
>  
> @@ -327,7 +329,10 @@ static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
>  
>  	ti_work = read_thread_flags();
>  	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
> -		ti_work = exit_to_user_mode_loop(regs, ti_work);
> +		ti_work = exit_to_user_mode_loop(regs, ti_work, irq);
> +
> +	if (irq)
> +		rseq_delay_resched_fini();

This is an unconditional function call for every interrupt return and
it's even done when the whole thing is known to be non-functional at
compile time:

> +void rseq_delay_resched_fini(void)
> +{
> +#ifdef CONFIG_SCHED_HRTICK
  ....
> +#endif
> +}

Seriously?

>  	arch_exit_to_user_mode_prepare(regs, ti_work);
>  
> @@ -396,6 +401,10 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>  
>  	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
>  
> +	/* reschedule if sched delay was granted */

Sentences start with an upper case letter and please use full words and
not arbitrary abbreviations. This is neither twatter nor SMS.

> +	if (IS_ENABLED(CONFIG_RSEQ) && current->sched_time_delay)
> +		set_tsk_need_resched(current);
> +
>  	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
>  		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
>  			local_irq_enable();
> @@ -411,7 +420,7 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>  	if (unlikely(work & SYSCALL_WORK_EXIT))
>  		syscall_exit_work(regs, work);
>  	local_irq_disable_exit_to_user();
> -	exit_to_user_mode_prepare(regs);
> +	exit_to_user_mode_prepare(regs, false);
>  }
>  
>  /**
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 5bcf44ae6c79..9b4670d85131 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -338,6 +338,7 @@ extern int __must_check io_schedule_prepare(void);
>  extern void io_schedule_finish(int token);
>  extern long io_schedule_timeout(long timeout);
>  extern void io_schedule(void);
> +extern void hrtick_local_start(u64 delay);
>  
>  /* wrapper function to trace from this header file */
>  DECLARE_TRACEPOINT(sched_set_state_tp);
> @@ -1263,6 +1264,7 @@ struct task_struct {
>  	int				softirq_context;
>  	int				irq_config;
>  #endif
> +	unsigned			sched_time_delay:1;

Find an arbitrary place by rolling a dice and stick it in, right?

There is already a section with bit fields in this struct. So it's more
than bloody obvious to stick it there instead of creating a hole in the
middle of task struct.

>  #ifdef CONFIG_PREEMPT_RT
>  	int				softirq_disable_cnt;
>  #endif
> @@ -2245,6 +2247,20 @@ static inline bool owner_on_cpu(struct task_struct *owner)
>  unsigned long sched_cpu_util(int cpu);
>  #endif /* CONFIG_SMP */
>  
> +#ifdef CONFIG_RSEQ
> +

Remove these newlines please. They have zero value.

> +extern bool rseq_delay_resched(void);
> +extern void rseq_delay_resched_fini(void);
> +extern void rseq_delay_resched_tick(void);
> +
> +#else

> @@ -98,8 +99,12 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
>  
>  		local_irq_enable_exit_to_user(ti_work);
>  
> -		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
> -			schedule();
> +		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
> +		       if (irq && rseq_delay_resched())

unlikely() and again this results in an unconditional function call for
every interrupt when CONFIG_RSEQ is enabled. A pointless exercise for
the majority of use cases.

What's worse is that it breaks the LAZY semantics. I explained this to
you before and this thing needs to be tied on the LAZY bit otherwise a
SCHED_OTHER task can prevent a real-time task from running, which is
fundamentally wrong.

So this wants to be:

	if (likely(!irq || !rseq_delay_resched(ti_work))
        	schedule();

and

static inline bool rseq_delay_resched(unsigned long ti_work)
{
        // Set when all Kconfig conditions are met
        if (!IS_ENABLED(CONFIG_RSEQ_RESCHED_DELAY))
        	return false;

        // Only NEED_RESCHED_LAZY can be delayed
	if (ti_work & _TIF_NEED_RESCHED)
        	return false;

        // NONE indicates that current::rseq == NULL
        // PROBE indicates that current::rseq::flags needs to be
        // evaluated.
        // REQUESTED indicates that there was a successful request
        // already.
        if (likely(current->rseq_delay_resched != RSEQ_RESCHED_DELAY_PROBE))
        	return false;

        return __rseq_delay_resched();
}

or something like that.

> +bool rseq_delay_resched(void)
> +{
> +	struct task_struct *t = current;
> +	u32 flags;
> +
> +	if (!IS_ENABLED(CONFIG_SCHED_HRTICK))
> +		return false;
> +
> +	if (!t->rseq)
> +		return false;
> +
> +	if (t->sched_time_delay)
> +		return false;

Then all of the above conditions go away.

> +	if (copy_from_user_nofault(&flags, &t->rseq->flags, sizeof(flags)))
> +		return false;
> +
> +	if (!(flags & RSEQ_CS_FLAG_DELAY_RESCHED))
> +		return false;
> +
> +	flags &= ~RSEQ_CS_FLAG_DELAY_RESCHED;
> +	if (copy_to_user_nofault(&t->rseq->flags, &flags, sizeof(flags)))
> +		return false;
> +
> +	t->sched_time_delay = 1;

and this becomes:

       	t->rseq_delay_resched = RSEQ_RESCHED_DELAY_REQUESTED;

> +	return true;
> +}
> +
> +void rseq_delay_resched_fini(void)

What's does _fini() mean here? Absolutely nothing. This wants to be a
self explaining function name and see below

> +{
> +#ifdef CONFIG_SCHED_HRTICK

You really are fond of pointless function calls. Obviously performance
is not really a concern in your work.

> +	extern void hrtick_local_start(u64 delay);

header files with prototypes exist for a reason....

> +	struct task_struct *t = current;
> +	/*
> +	 * IRQs off, guaranteed to return to userspace, start timer on this CPU
> +	 * to limit the resched-overdraft.
> +	 *
> +	 * If your critical section is longer than 30 us you get to keep the
> +	 * pieces.
> +	 */
> +	if (t->sched_time_delay)
> +		hrtick_local_start(30 * NSEC_PER_USEC);
> +#endif

This whole thing can be condensed into:

static inline void rseq_delay_resched_arm_timer(void)
{
	if (!IS_ENABLED(CONFIG_RSEQ_RESCHED_DELAY))
        	return;
        if (unlikely(current->rseq_delay_resched != RSEQ_RESCHED_DELAY_REQUESTED))
        	hrtick_local_start(...);
}

> +}
> +
> +void rseq_delay_resched_tick(void)
> +{
> +#ifdef CONFIG_SCHED_HRTICK
> +	struct task_struct *t = current;
> +
> +	if (t->sched_time_delay)
> +		set_tsk_need_resched(t);
> +#endif

Oh well.....

> +}
> +
>  #ifdef CONFIG_DEBUG_RSEQ
>  
>  /*
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 4ad7cf3cfdca..c1b64879115f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -845,6 +845,8 @@ static enum hrtimer_restart hrtick(struct hrtimer *timer)
>  
>  	WARN_ON_ONCE(cpu_of(rq) != smp_processor_id());
>  
> +	rseq_delay_resched_tick();
> +
>  	rq_lock(rq, &rf);
>  	update_rq_clock(rq);
>  	rq->donor->sched_class->task_tick(rq, rq->curr, 1);
> @@ -918,6 +920,16 @@ void hrtick_start(struct rq *rq, u64 delay)
>  
>  #endif /* CONFIG_SMP */
>  
> +void hrtick_local_start(u64 delay)

How is this supposed to compile cleanly without a prototype?

Thanks,

        tglx
