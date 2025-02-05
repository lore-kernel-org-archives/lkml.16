Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BE21DC99C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774326; cv=none; b=HI4lcCbXGCcCFK24v4a+wjLzasHZ1uMlY+h3N4WMaMqStAnpn6evXfUbdHicntm2rx66Mm7rloORVb/OWEWGRqRyNPjDmuruPvUAFTJ6Yf/ojUtb1hJMlrP65jwS5+pWOHRUUtvok30TbYuVXP6VH5DIWV+D2SKHPgA0dYwym3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774326; c=relaxed/simple;
	bh=tZoJwRJ2KjkWu3PdSZeU5lb/3mj+u/Vb38NEkFbGITo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ei3IL/WYtNmo59C1KzsBpaJRxKsYAKZDiEbcru5dV4tXCm0ydwEnEDwKgsgWKK+/3xxblhuDSHeuXIXB/1/jlHUS4Ra0QlOqyR0/532MYJvuRQWxqoFgBrHvst/0UNsInyLKUbWHasEOzWUvgTLiliXs1EWDxlyxtIzWanTQcvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y2/4TmNI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sO/nJPt8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y2/4TmNI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sO/nJPt8"
Date: Wed, 5 Feb 2025 17:52:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738774321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVg9Z3E6PzM03ev7o49Z9kFIBEPLfIivy8HlxgMrIlM=;
	b=y2/4TmNIBmZtIja8SFycBcMTVA03SU8W7g5lYnsBSO1eCCdzDd2974qZucEAkNNaqossR6
	86s+9BUave0ypi/hOMbWjOD+hthffwLbMbUU4Bfab7iMJTtpYhc0+wjnp2XgR0Dbp2Qko8
	tCFXwNDdicFNv6ZQVoStrkUkLlOSuZbCEGvxxofUPtoGvm3lQ+iYggb3MoSB59l6vRfUm7
	bfIGEl62wJ9AbnLWwvOFXD2a0TDMZ4YApFlybu9Sm2rH9p/cipflYx1f5+uxp9l7sFS+Mw
	OQOxgd7hEsk9ynkXlQu0e5f5RZ5twiuNunN3foga8LDauRNR6w72T+2GzB+hPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738774321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVg9Z3E6PzM03ev7o49Z9kFIBEPLfIivy8HlxgMrIlM=;
	b=sO/nJPt8ERgCHi1L4DM0+aTV/namxcM3DmCL4RTeJqtngUh9Vc8+ebs0uvBm+7p211qYBQ
	E8Xocn98gfjqcSAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 00/15] futex: Add support task local hash maps.
Message-ID: <20250205165200.v9iduJ1S@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250204151405.GW7145@noisy.programming.kicks-ass.net>
 <20250205122026.l6AQ2lf7@linutronix.de>
 <20250205125250.GD7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250205125250.GD7145@noisy.programming.kicks-ass.net>

On 2025-02-05 13:52:50 [+0100], Peter Zijlstra wrote:
> On Wed, Feb 05, 2025 at 01:20:26PM +0100, Sebastian Andrzej Siewior wrote:
> > On 2025-02-04 16:14:05 [+0100], Peter Zijlstra wrote:
> >=20
> > This does not compile. Let me fix this up, a few comments=E2=80=A6
>=20
> Moo, clangd didn't complain :/ But yeah, I didn't actually compile this,
> only had neovim running clangd.

don't worry. I assumed that it is a sketch :) Let me add that one to the
list of things to try=E2=80=A6

> > > diff --git a/io_uring/futex.c b/io_uring/futex.c
> > > index 3159a2b7eeca..18cd5ccde36d 100644
> > > --- a/io_uring/futex.c
> > > +++ b/io_uring/futex.c
> > > @@ -332,13 +331,13 @@ int io_futex_wait(struct io_kiocb *req, unsigne=
d int issue_flags)
> > >  	ifd->q.wake =3D io_futex_wake_fn;
> > >  	ifd->req =3D req;
> > > =20
> > > +	// XXX task->state is messed up
> > >  	ret =3D futex_wait_setup(iof->uaddr, iof->futex_val, iof->futex_fla=
gs,
> > > -			       &ifd->q, &hb);
> > > +			       &ifd->q, NULL);
> > >  	if (!ret) {
> > >  		hlist_add_head(&req->hash_node, &ctx->futex_list);
> > >  		io_ring_submit_unlock(ctx, issue_flags);
> > > =20
> > > -		futex_queue(&ifd->q, hb);
> > >  		return IOU_ISSUE_SKIP_COMPLETE;
> >=20
> > This looks interesting. This is called from
> > req->io_task_work.func =3D io_req_task_submit
> > | io_req_task_submit()
> > | -> io_issue_sqe()
> > |    -> def->issue() <- io_futex_wait
> >=20
> > and
> > io_fallback_req_func() iterates over a list and invokes
> > req->io_task_work.func. This seems to be also invoked from
> > io_sq_thread() (via io_sq_tw() -> io_handle_tw_list()).
> >=20
> > If this (wait and wake) is only used within kernel threads then it is
> > fine. If the waker and/ or waiter are in user context then we are in
> > trouble because one will use the private hash of the process and the
> > other won't because it is a kernel thread. So the messer-up task->state
> > is the least of problems.
>=20
> Right, so the io-uring stuff is tricky, I think this more or less does
> what it used to though. I 'simply' moved the futex_queue() into
> futex_wait_setup().

This is correct. The changed task's state may or may not be relevant.

> IIRC the io-uring threads share the process-mm but will never hit
> userspace.

One function had a kworker prototype. There are also the PF_IO_WORKER. I
need clarify with io_uring ppl how this works=E2=80=A6

> > > @@ -451,20 +442,22 @@ int futex_wait_multiple_setup(struct futex_vect=
or *vs, int count, int *woken)
> > >  		struct futex_q *q =3D &vs[i].q;
> > >  		u32 val =3D vs[i].w.val;
> > > =20
> > > -		hb =3D futex_q_lock(q);
> > > -		ret =3D futex_get_value_locked(&uval, uaddr);
> > > +		if (1) {
> > > +			CLASS(hb_q_lock, hb)(q);
> > > +			ret =3D futex_get_value_locked(&uval, uaddr);
> >=20
> > This confused me at the beginning because I expected hb_q_lock having
> > the lock part in the constructor and also the matching unlock in the
> > deconstructor. But no, this is not the case.
>=20
> Agreed, that *is* rather ugly. The sane way to fix that might be to
> untangle futex_q_lock() from futex_hash(). And instead do:
>=20
> 			CLASS(hb, hb)(&q->key);
> 			futex_q_lock(q, hb);
>=20
> Or somesuch. That might be a nice cleanup either way.

If you know, you know.
We could do the lock manually in the first iteration and then try to
hide it later on. The error path always drops it early. We could unlock
manually there and tell the compiler that it is done.

> > So the beauty of it is that you enforce a ref drop on hb once it gets
> > out of scope. So you can't use it by chance once the ref is dropped.
>=20
> Right.
>=20
> > But this does not help in futex_lock_pi() where you have the drop the
> > reference before __rt_mutex_start_proxy_lock() (or at least before
> > rt_mutex_wait_proxy_lock()) but still have it you go for the no_block
> > shortcut. At which point even the lock is still owned.
> >=20
> > While it makes the other cases nicer, the futex_lock_pi() function was
> > the only one where I was thinking about setting hb to NULL to avoid
> > accidental usage later on.
>=20
> OK, so yeah, I got completely lost in futex_lock_pi(), and I couldn't
> figure out what you did there. Let me try and untangle that again.

The hash bucket reference should be dropped if the task is going to
sleep. The try-lock path there has a fast-forward to the end.

Based on memory the unlock PI (and requeue PI) is also a bit odd because
I need to grab an extra reference in the corner case. That is, to avoid
a resize because I need a stable ::lock_ptr and task is no longer
enqueued. So the ::lock_ptr will point to a stale hash bucket.

Sebastian
