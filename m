Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211AC22B8C9
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758033; cv=none; b=RLkJYa+0E4xiKHoq30+rHENI9fKsXxCN3BEnF57DDUxycdeFK0G6JNVeei4AWh/OoUataOBirQzqHCeDKNopPgbs4kx2SE1LrudTWpQlTpx/quJHblRdnUlB4S990tKRb3YrYAmpPbpZGwlG/E54Y3SJRd502g6jQHttevGF7sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758033; c=relaxed/simple;
	bh=lucO8l802FwKrqdcj8aHHVDgdvbJGr3a0cB0qHpnqo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBrOAhBmyZzs0hDk56OtpmhlvlNa75DvxrpBJurZU3TeMc80k+CDj/yAdls4ARz/nLBAZi1pT9Bn+zD5z9RNVqMq8Ker3XcaherZqULMvX7/Bv0jMFgR27sR/fxES1Xgm2GBs34uf2u3dEd/w7LEpDMi8xzfvSS4+ZjhU2Hs4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VDN3eaal; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q6fFA0OT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VDN3eaal";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q6fFA0OT"
Date: Wed, 5 Feb 2025 13:20:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738758027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u3HIOGONIlBvzyl6VhJQxHs3vuHCM7of1/pvLspZ4bI=;
	b=VDN3eaalaKw2A6PmdW4sFEudeZ7pKXcfco0iDTbXnz4k8YJwB2d4iHyjdVmrpmbLKUSx+3
	ll3OwHEOtjIQcncyvbENhm2vDz9FiyibImIQY+zMoBEKUSYnMPU1sg9s+nrzk4q4hOYGeQ
	USCicxXlRz87vzC+zkrSesxoOPmqiOl5JmHDt1H74BRHoIJt3LdU/EZ7FELlSZloBbIdX9
	lPurkeoxh1Ad5L78rG6Vrpv4ZGSdYIs9E8SWAkdOSeCdKJdNYxRh8FZ0C+HElag0uO8ndl
	Rx3Qc70t/+B4Vfk+l7Y0DC/MvSILzIOqWG/ab4WVwJW4qXTwRCHUGoyscw30hA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738758027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u3HIOGONIlBvzyl6VhJQxHs3vuHCM7of1/pvLspZ4bI=;
	b=Q6fFA0OT+FXD4Tf6/jrvkiHHwzIJ/oBLY8lVH6heg/ShudrQOCHAJWYWTkGwLcZVxc5csN
	34y5ljPor8gELKCw==
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
Message-ID: <20250205122026.l6AQ2lf7@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250204151405.GW7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250204151405.GW7145@noisy.programming.kicks-ass.net>

On 2025-02-04 16:14:05 [+0100], Peter Zijlstra wrote:

This does not compile. Let me fix this up, a few comments=E2=80=A6

> diff --git a/io_uring/futex.c b/io_uring/futex.c
> index 3159a2b7eeca..18cd5ccde36d 100644
> --- a/io_uring/futex.c
> +++ b/io_uring/futex.c
> @@ -332,13 +331,13 @@ int io_futex_wait(struct io_kiocb *req, unsigned in=
t issue_flags)
>  	ifd->q.wake =3D io_futex_wake_fn;
>  	ifd->req =3D req;
> =20
> +	// XXX task->state is messed up
>  	ret =3D futex_wait_setup(iof->uaddr, iof->futex_val, iof->futex_flags,
> -			       &ifd->q, &hb);
> +			       &ifd->q, NULL);
>  	if (!ret) {
>  		hlist_add_head(&req->hash_node, &ctx->futex_list);
>  		io_ring_submit_unlock(ctx, issue_flags);
> =20
> -		futex_queue(&ifd->q, hb);
>  		return IOU_ISSUE_SKIP_COMPLETE;

This looks interesting. This is called from
req->io_task_work.func =3D io_req_task_submit
| io_req_task_submit()
| -> io_issue_sqe()
|    -> def->issue() <- io_futex_wait

and
io_fallback_req_func() iterates over a list and invokes
req->io_task_work.func. This seems to be also invoked from
io_sq_thread() (via io_sq_tw() -> io_handle_tw_list()).

If this (wait and wake) is only used within kernel threads then it is
fine. If the waker and/ or waiter are in user context then we are in
trouble because one will use the private hash of the process and the
other won't because it is a kernel thread. So the messer-up task->state
is the least of problems.

>  	}
=E2=80=A6
> --- a/kernel/futex/waitwake.c
> +++ b/kernel/futex/waitwake.c
> @@ -266,67 +264,69 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int =
flags, u32 __user *uaddr2,
>  	if (unlikely(ret !=3D 0))
>  		return ret;
> =20
> -	hb1 =3D futex_hash(&key1);
> -	hb2 =3D futex_hash(&key2);
> -
>  retry_private:
> -	double_lock_hb(hb1, hb2);
> -	op_ret =3D futex_atomic_op_inuser(op, uaddr2);
> -	if (unlikely(op_ret < 0)) {
> -		double_unlock_hb(hb1, hb2);
> -
> -		if (!IS_ENABLED(CONFIG_MMU) ||
> -		    unlikely(op_ret !=3D -EFAULT && op_ret !=3D -EAGAIN)) {
> -			/*
> -			 * we don't get EFAULT from MMU faults if we don't have
> -			 * an MMU, but we might get them from range checking
> -			 */
> -			ret =3D op_ret;
> -			return ret;
> -		}
> -
> -		if (op_ret =3D=3D -EFAULT) {
> -			ret =3D fault_in_user_writeable(uaddr2);
> -			if (ret)
> +	if (1) {
> +		CLASS(hb, hb1)(&key1);
> +		CLASS(hb, hb2)(&key2);

I don't know if hiding these things makes it better because this will do
futex_hash_put() if it gets out of scope. This means we still hold the
reference while in fault_in_user_writeable() and cond_resched(). Is this
on purpose?
I guess it does not matter much. The resize will be delayed until the
task gets back and releases the reference. This will make progress. So
it is okay.

> +		double_lock_hb(hb1, hb2);
> +		op_ret =3D futex_atomic_op_inuser(op, uaddr2);
> +		if (unlikely(op_ret < 0)) {
> +			double_unlock_hb(hb1, hb2);
> +
> +			if (!IS_ENABLED(CONFIG_MMU) ||
> +			    unlikely(op_ret !=3D -EFAULT && op_ret !=3D -EAGAIN)) {
> +				/*
> +				 * we don't get EFAULT from MMU faults if we don't have
> +				 * an MMU, but we might get them from range checking
> +				 */
> +				ret =3D op_ret;
>  				return ret;
=E2=80=A6
> @@ -451,20 +442,22 @@ int futex_wait_multiple_setup(struct futex_vector *=
vs, int count, int *woken)
>  		struct futex_q *q =3D &vs[i].q;
>  		u32 val =3D vs[i].w.val;
> =20
> -		hb =3D futex_q_lock(q);
> -		ret =3D futex_get_value_locked(&uval, uaddr);
> +		if (1) {
> +			CLASS(hb_q_lock, hb)(q);
> +			ret =3D futex_get_value_locked(&uval, uaddr);

This confused me at the beginning because I expected hb_q_lock having
the lock part in the constructor and also the matching unlock in the
deconstructor. But no, this is not the case.

> +
> @@ -618,26 +611,42 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, un=
signed int flags,
=E2=80=A6
> =20
> +		if (uval !=3D val) {
> +			futex_q_unlock(hb);
> +			return -EWOULDBLOCK;
> +		}
> +
> +		if (key2 && !futex_match(&q->key, key2)) {

There should be no !

> +			futex_q_unlock(hb);
> +			return -EINVAL;
> +		}
> =20
> -	if (uval !=3D val) {
> -		futex_q_unlock(*hb);
> -		ret =3D -EWOULDBLOCK;
> +		/*
> +		 * The task state is guaranteed to be set before another task can
> +		 * wake it. set_current_state() is implemented using smp_store_mb() and
> +		 * futex_queue() calls spin_unlock() upon completion, both serializing
> +		 * access to the hash list and forcing another memory barrier.
> +		 */
> +		set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
> +		futex_queue(q, hb);
>  	}
> =20
>  	return ret;

So the beauty of it is that you enforce a ref drop on hb once it gets
out of scope. So you can't use it by chance once the ref is dropped.

But this does not help in futex_lock_pi() where you have the drop the
reference before __rt_mutex_start_proxy_lock() (or at least before
rt_mutex_wait_proxy_lock()) but still have it you go for the no_block
shortcut. At which point even the lock is still owned.

While it makes the other cases nicer, the futex_lock_pi() function was
the only one where I was thinking about setting hb to NULL to avoid
accidental usage later on.

Sebastian
