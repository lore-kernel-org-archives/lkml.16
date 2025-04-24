Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC721A2381
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504031; cv=none; b=WDT9jKZkAy4/PilYpEnNV5/f9EXuC3hEJ5XUQxc4zH3OabK1glprDPR9omiaL2/Kde/umKKG18vyg6MNPsI/mc0aL8Q3e/pHRN8JipsEFl8TaOYUPS8OKvhDWQU2X4ImmIaTiPUdcVhJlu4jITZJEn9khUmuLlfQ3Fqr2Cq8v3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504031; c=relaxed/simple;
	bh=ifNI9Cfo5bSo5fyDavBe4IJFPenS1e9zbuy46r5kBZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hx2NaPRPAe/mHSgEjBEqmGrkaZ1uIhITgw5SBHkSELz3VfbuOaoIKG5x1gcYCBQRQf0u5OxwVT4IpGfkuRQe4gfBT/9XUkX9mutojmxqGGDpJxxQzYGwO7LIRwezzAw70wrMJSPKQ/mH1xiOkV2IhF0RriWGecT9RAc2IKVzLDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N25sIQkX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cnOltzaj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N25sIQkX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cnOltzaj"
Date: Thu, 24 Apr 2025 16:13:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745504027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mq4VQELIstHhJWEjzocoB6XO3CVV8K87f1hbgXOjMYo=;
	b=N25sIQkXBfxhn1v5NbdURpaLkj4HmXVn6mzPanUrFxHiNTymD4sIHvfoGHyJQuP+MhxA8n
	HfNUYwlKUfVnldaAJO+gwyaJHB9ZrepqP5lflWjSOni/amn5eIXHxEAuKFKbHQm72UMmeb
	mghC1yp/Tvm2NhbUb8YcK1Tw6P9ZqRCzPeiG3CMaJokOPVKMhJH+4N1x5Qh1YwN7EirGuZ
	yCQQlAZmkyuUe/vUp2iTVLtxj79RnB8gC+13W0necYZ9NNSb3NkTw4wNcRiK4cs40ymAJU
	68zharaJFRK0cMws6YbX8gdPQEZJgbCSr5PdJXDyIwIdE1WIzWD8rHUuKH3R1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745504027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mq4VQELIstHhJWEjzocoB6XO3CVV8K87f1hbgXOjMYo=;
	b=cnOltzajA2b5hDzb+U8SuYrYcJPwL3Tp1IVfbDQCWf6fFtrPtm6q/bxdFWFWTkT0RROZCt
	CbUst9aH8EhqJVDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de
Subject: Re: [PATCH V2 1/3] Sched: Scheduler time slice extension
Message-ID: <20250424141345.7F42GFmZ@linutronix.de>
References: <20250418193410.2010058-1-prakash.sangappa@oracle.com>
 <20250418193410.2010058-2-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250418193410.2010058-2-prakash.sangappa@oracle.com>

On 2025-04-18 19:34:08 [+0000], Prakash Sangappa wrote:
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
=E2=80=A6
> @@ -930,6 +931,9 @@ struct task_struct {
>  	struct plist_node		pushable_tasks;
>  	struct rb_node			pushable_dl_tasks;
>  #endif
> +#ifdef CONFIG_RSEQ
> +	unsigned			rseq_sched_delay:1;
> +#endif

There should be somewhere a bitfield already which you could use without
the ifdef. Then you could use IS_ENABLED() if you want to save some code
if RSEQ is not enabled.

> =20
>  	struct mm_struct		*mm;
>  	struct mm_struct		*active_mm;
> --- a/include/uapi/linux/rseq.h
> +++ b/include/uapi/linux/rseq.h
=E2=80=A6
> @@ -128,6 +131,8 @@ struct rseq {
>  	 * - RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE
>  	 *     Inhibit instruction sequence block restart on migration for
>  	 *     this thread.
> +	 * - RSEQ_CS_DELAY_RESCHED
> +	 *     Try delay resched...

Delay resched up to $time for $kind-of-stats under $conditions.

>  	 */
>  	__u32 flags;
> =20
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index 6b7ff1bc1b9b..944027d14198 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
=E2=80=A6
> @@ -99,8 +100,12 @@ __always_inline unsigned long exit_to_user_mode_loop(=
struct pt_regs *regs,
> =20
>  		local_irq_enable_exit_to_user(ti_work);
> =20
> -		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
> -			schedule();
> +		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {

couldn't we restrict this to _TIF_NEED_RESCHED_LAZY? That way we would
still schedule immediately for any SCHED_FIFO/RR/DL tasks and do this
delay only for everything else such as SCHED_OTHER/=E2=80=A6

> +		       if (irq && rseq_delay_resched())
> +			       clear_tsk_need_resched(current);
> +		       else
> +			       schedule();
> +		}
> =20
>  		if (ti_work & _TIF_UPROBE)
>  			uprobe_notify_resume(regs);
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 165c90ba64ea..cee50e139723 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -823,6 +823,7 @@ void update_rq_clock(struct rq *rq)
> =20
>  static void hrtick_clear(struct rq *rq)
>  {
> +	rseq_delay_resched_tick();

This is called from __schedule(). If you set the need-resched flag here,
it gets removed shortly after. Do I miss something?

>  	if (hrtimer_active(&rq->hrtick_timer))
>  		hrtimer_cancel(&rq->hrtick_timer);
>  }

Sebastian
