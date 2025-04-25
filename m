Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0B119D8A7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564043; cv=none; b=u3gJz7+4JAz6vegbRTlFfBEHiTJWNeAfHXgy1AYKJ95b4/jsFwBgn+Ag550YWrpXOmzJorC77fckeHnWUVhIWnyG8GTDf7Yb9gLuALObgEnmre9rS2PFjSYBG0lJ+u39S4ve5g4uKVDlOXznd2q7w7GOseIkW4fcRImfeIpFa0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564043; c=relaxed/simple;
	bh=A7F+bUaDCpZZtwbzx+Rf2FANzGpqQoRIdqyLQ/BuvMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wz5v1PbUg533f4JEPsQskkKgw1NTxXX4Qoo2dzZCgSTUpd/9G/9Qr0jf736CVX2GCUI2F2+a17cj9zYrtEi5q9iTlj+bcVKKnsiqlhRlL38J4sAwdVsa5w6jbLTm2/c76PdV/Jp6hHByf7ZU3Bb4xNMONjzwUSPPjy+Aj1srlxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gPrJpwLL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v89ucTiW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gPrJpwLL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v89ucTiW"
Date: Fri, 25 Apr 2025 08:53:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745564038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xADRX49qF/n5OZc1ioCAoVyNNuwxws7maaLzOhPr0Vk=;
	b=gPrJpwLL9rp712eK4xyfWBOiyMh1+bIbm+OapAMnQZyUC16AEPxn+GPq1nkB2WWETxJrtD
	cHp+6/YFZQfTGVCnXxkwX3Ei2Tayz3voAgp3TDCDvJjJwxayMwZGBLGFTgNY9kmDSDNKY+
	HnXui+V8ZfBpuMh3GDmYX2jModP/lzSx2j14NOnDt1R7IvHLa1XKeDhqJBigloKx0iIYEG
	Pm+p3jQSB7slhREdiLwdToNP+8Wpq6yZ+UOYyEVBIrJ1bwfGuJ1RpgaOp4CwvRtUHK+uCR
	fR2PfAK/XH9oCiigmL4rUL2vUWGjq5V0froI5DCTToL52TemUNH6lGIEof1S7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745564038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xADRX49qF/n5OZc1ioCAoVyNNuwxws7maaLzOhPr0Vk=;
	b=v89ucTiWiWAF+nnRw6XhKAqFkUed1N41lTmPJ9avmXVki20fsnCAeNEppgZojeCWa6x4lo
	f4qOhc6TAvKrtxDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH V2 1/3] Sched: Scheduler time slice extension
Message-ID: <20250425065357.eiwSSvff@linutronix.de>
References: <20250418193410.2010058-1-prakash.sangappa@oracle.com>
 <20250418193410.2010058-2-prakash.sangappa@oracle.com>
 <20250424141345.7F42GFmZ@linutronix.de>
 <DE11FCAF-4686-44AC-82AD-F0672FE450E1@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DE11FCAF-4686-44AC-82AD-F0672FE450E1@oracle.com>

On 2025-04-25 01:19:07 [+0000], Prakash Sangappa wrote:
> > On Apr 24, 2025, at 7:13=E2=80=AFAM, Sebastian Andrzej Siewior <bigeasy=
@linutronix.de> wrote:
> >=20
> > On 2025-04-18 19:34:08 [+0000], Prakash Sangappa wrote:
> >> --- a/include/linux/sched.h
> >> +++ b/include/linux/sched.h
> > =E2=80=A6
> >> @@ -930,6 +931,9 @@ struct task_struct {
> >> struct plist_node pushable_tasks;
> >> struct rb_node pushable_dl_tasks;
> >> #endif
> >> +#ifdef CONFIG_RSEQ
> >> + unsigned rseq_sched_delay:1;
> >> +#endif
> >=20
> > There should be somewhere a bitfield already which you could use without
> > the ifdef. Then you could use IS_ENABLED() if you want to save some code
> > if RSEQ is not enabled.
>=20
> I suppose we could.=20
> Patch 1 is pretty much what PeterZ posted, hope he will comment on it.

If it is "pretty much what PeterZ posted" why did he not receive any
credit for it?

> Could it be moved below here, call it sched_time_delay, or some variant o=
f this name?

I don't mind the name. The point is to add to an existing group instead
of starting a new u32 bit field.

> struct task_struct {
> ..
> #ifdef CONFIG_TASK_DELAY_ACCT
>         /* delay due to memory thrashing */
>         unsigned                        in_thrashing:1;
> #endif
>         unsigned                        sched_time_delay:1;
> ..
> }
>=20
> This field will be for scheduler time extension use only. Mainly updated =
in the context of the current thread.=20
> Do we even need to use IS_ENABLED(CONFIG_RSEQ) to access?

Well, if you want to avoid the code in the !CONFIG_RSEQ then yes.

> >> struct mm_struct *mm;
> >> struct mm_struct *active_mm;
> >> --- a/include/uapi/linux/rseq.h
> >> +++ b/include/uapi/linux/rseq.h
> > =E2=80=A6
> >> @@ -128,6 +131,8 @@ struct rseq {
> >> * - RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE
> >> *     Inhibit instruction sequence block restart on migration for
> >> *     this thread.
> >> + * - RSEQ_CS_DELAY_RESCHED
> >> + *     Try delay resched...
> >=20
> > Delay resched up to $time for $kind-of-stats under $conditions.
>=20
> Will add some comment like
>  =E2=80=9CDelay resched for upto 50us.  Checked when thread is about to b=
e preempted"
>=20
> With the tunable added in the subsequent patch, will change =E2=80=9850us=
' it to the tunable name.

A proper descritption of the flag would nice. The current state is that
I can derive move from the constant than from the comment.

> >> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> >> index 6b7ff1bc1b9b..944027d14198 100644
> >> --- a/kernel/entry/common.c
> >> +++ b/kernel/entry/common.c
> > =E2=80=A6
> >> @@ -99,8 +100,12 @@ __always_inline unsigned long exit_to_user_mode_lo=
op(struct pt_regs *regs,
> >>=20
> >> local_irq_enable_exit_to_user(ti_work);
> >>=20
> >> - if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
> >> - schedule();
> >> + if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
> >=20
> > couldn't we restrict this to _TIF_NEED_RESCHED_LAZY? That way we would
> > still schedule immediately for any SCHED_FIFO/RR/DL tasks and do this
> > delay only for everything else such as SCHED_OTHER/=E2=80=A6
>=20
>=20
> Wasn=E2=80=99t this the entire discussion about whether to limit it to SC=
HE_OTHER or not?
> Will defer it to Peter.

Oh. But this still deserves a trace point for this manoeuvre. A trace
would show you a wakeup, the need-resched bit will be shown and then it
will vanish later and people might wonder where did it go.

> >=20
> >> +       if (irq && rseq_delay_resched())
> >> +       clear_tsk_need_resched(current);
> >> +       else
> >> +       schedule();
> >> + }
> >>=20
> >> if (ti_work & _TIF_UPROBE)
> >> uprobe_notify_resume(regs);
> >> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >> index 165c90ba64ea..cee50e139723 100644
> >> --- a/kernel/sched/core.c
> >> +++ b/kernel/sched/core.c
> >> @@ -823,6 +823,7 @@ void update_rq_clock(struct rq *rq)
> >>=20
> >> static void hrtick_clear(struct rq *rq)
> >> {
> >> + rseq_delay_resched_tick();
> >=20
> > This is called from __schedule(). If you set the need-resched flag here,
> > it gets removed shortly after. Do I miss something?
>=20
> hrtick_clear() is also called when the cpu is being removed in sched_cpu_=
dying().
> We need to set resched there?

Do we? My understanding is that the NEED_RESCHED flag gets removed once
and then RSEQ_CS_DELAY_RESCHED gets set. RSEQ_CS_DELAY_RESCHED in turn
gets cleared in the scheduler once task leaves the CPU. Once the task
left the CPU then there is no need to set the bit. The sched_cpu_dying()
is the HP thread so if that one is on the CPU then the user task is
gone.

How does this delay thingy work with HZ=3D100 vs HZ=3D1000? Like what is the
most you could get in extra time? I could imagine that if a second task
gets on the runqueue and you skip the wake up but the runtime is used up
then the HZ tick should set NEED_RESCHED again and the following HZ tick
should force the schedule point.

> Thanks for your comments.
> -Prakash.

Sebastian
