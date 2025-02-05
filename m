Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE04014F9E7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764729; cv=none; b=KakT1O8lG7XC9ScprRLDCoJL4MaY8XXQ3xrku/suSVfVmEBUJ1XZ/FrD7EUKf+VJQLyxOh6zHE+i0XsIYPbd6lP0ztTAeBhC0MqC3UqBCqhaBC597wDkbo5szzxyOGvLeYV6/PsthULQuW6DNJ+TmXC7DvMrjkcNNBbk/XJEBhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764729; c=relaxed/simple;
	bh=krF338LwfsEwcZH0RzURpzj2hh9NFexKRATwd1YZc8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e56uTf9q8iHT2+kQot0G53nlM/N8kGyUxB+YG+9XEzzLE33cDYtGqIyjtt6aLtV7yLaDwLz3ouOS0iskX1ed7W2WGEUaowUNCG69U+iWMO/jNHJcZLk1lkaL/AFp1fnjda5vsJPt7LrVW9+viOcNa9YTj+liY9zEqgmaRYbe9pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KfnLf82u; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KfnLf82u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TYghS0qIqno1jfI3WER84xrcZmBX0ltrUu5f5oD5k8k=; b=KfnLf82uKaM3nYLYRSJqCHOee9
	wEQIfK4j/qa68fIx9lRdA8kHypbvMYlPpxQlMzDWbMgMK0kqNaL6hYzTc3w8JG/4/wHsJiVro06k0
	rydWzbKfbza1fJbJsrsqCDmTUMSTbqUNUzUB3fE8BbIcUpAZNc9taX8xpl+6HxP+aD5ofeMZ9KvXJ
	upSG3ZzWdtd7j7GWS21BD9O7WnQbmRM0QaUBFcFockb+D5isf6X8znHeE/bnUkrKIClJTu7jJhJ3w
	K577C4jdIUKur2HUNMledLJJAUdwaF5kq735zMYdgG7uizMKxCTpaYnZ6oVUhcTmwqzMf+lMEr10B
	71cFLj+A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg8I-0000000Gevd-1a9Q;
	Wed, 05 Feb 2025 14:12:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A48BC3002F0; Wed,  5 Feb 2025 13:52:50 +0100 (CET)
Date: Wed, 5 Feb 2025 13:52:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 00/15] futex: Add support task local hash maps.
Message-ID: <20250205125250.GD7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250204151405.GW7145@noisy.programming.kicks-ass.net>
 <20250205122026.l6AQ2lf7@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205122026.l6AQ2lf7@linutronix.de>

On Wed, Feb 05, 2025 at 01:20:26PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-02-04 16:14:05 [+0100], Peter Zijlstra wrote:
> 
> This does not compile. Let me fix this up, a few comments…

Moo, clangd didn't complain :/ But yeah, I didn't actually compile this,
only had neovim running clangd.

> > diff --git a/io_uring/futex.c b/io_uring/futex.c
> > index 3159a2b7eeca..18cd5ccde36d 100644
> > --- a/io_uring/futex.c
> > +++ b/io_uring/futex.c
> > @@ -332,13 +331,13 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
> >  	ifd->q.wake = io_futex_wake_fn;
> >  	ifd->req = req;
> >  
> > +	// XXX task->state is messed up
> >  	ret = futex_wait_setup(iof->uaddr, iof->futex_val, iof->futex_flags,
> > -			       &ifd->q, &hb);
> > +			       &ifd->q, NULL);
> >  	if (!ret) {
> >  		hlist_add_head(&req->hash_node, &ctx->futex_list);
> >  		io_ring_submit_unlock(ctx, issue_flags);
> >  
> > -		futex_queue(&ifd->q, hb);
> >  		return IOU_ISSUE_SKIP_COMPLETE;
> 
> This looks interesting. This is called from
> req->io_task_work.func = io_req_task_submit
> | io_req_task_submit()
> | -> io_issue_sqe()
> |    -> def->issue() <- io_futex_wait
> 
> and
> io_fallback_req_func() iterates over a list and invokes
> req->io_task_work.func. This seems to be also invoked from
> io_sq_thread() (via io_sq_tw() -> io_handle_tw_list()).
> 
> If this (wait and wake) is only used within kernel threads then it is
> fine. If the waker and/ or waiter are in user context then we are in
> trouble because one will use the private hash of the process and the
> other won't because it is a kernel thread. So the messer-up task->state
> is the least of problems.

Right, so the io-uring stuff is tricky, I think this more or less does
what it used to though. I 'simply' moved the futex_queue() into
futex_wait_setup().

IIRC the io-uring threads share the process-mm but will never hit
userspace.

> >  	}
> …
> > --- a/kernel/futex/waitwake.c
> > +++ b/kernel/futex/waitwake.c
> > @@ -266,67 +264,69 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flags, u32 __user *uaddr2,
> >  	if (unlikely(ret != 0))
> >  		return ret;
> >  
> > -	hb1 = futex_hash(&key1);
> > -	hb2 = futex_hash(&key2);
> > -
> >  retry_private:
> > -	double_lock_hb(hb1, hb2);
> > -	op_ret = futex_atomic_op_inuser(op, uaddr2);
> > -	if (unlikely(op_ret < 0)) {
> > -		double_unlock_hb(hb1, hb2);
> > -
> > -		if (!IS_ENABLED(CONFIG_MMU) ||
> > -		    unlikely(op_ret != -EFAULT && op_ret != -EAGAIN)) {
> > -			/*
> > -			 * we don't get EFAULT from MMU faults if we don't have
> > -			 * an MMU, but we might get them from range checking
> > -			 */
> > -			ret = op_ret;
> > -			return ret;
> > -		}
> > -
> > -		if (op_ret == -EFAULT) {
> > -			ret = fault_in_user_writeable(uaddr2);
> > -			if (ret)
> > +	if (1) {
> > +		CLASS(hb, hb1)(&key1);
> > +		CLASS(hb, hb2)(&key2);
> 
> I don't know if hiding these things makes it better because this will do
> futex_hash_put() if it gets out of scope. This means we still hold the
> reference while in fault_in_user_writeable() and cond_resched(). Is this
> on purpose?

Sorta, I found it very hard to figure out what your patches did exactly,
and..

> I guess it does not matter much. The resize will be delayed until the
> task gets back and releases the reference. This will make progress. So
> it is okay.

this.

> > +		double_lock_hb(hb1, hb2);
> > +		op_ret = futex_atomic_op_inuser(op, uaddr2);
> > +		if (unlikely(op_ret < 0)) {
> > +			double_unlock_hb(hb1, hb2);
> > +
> > +			if (!IS_ENABLED(CONFIG_MMU) ||
> > +			    unlikely(op_ret != -EFAULT && op_ret != -EAGAIN)) {
> > +				/*
> > +				 * we don't get EFAULT from MMU faults if we don't have
> > +				 * an MMU, but we might get them from range checking
> > +				 */
> > +				ret = op_ret;
> >  				return ret;
> …
> > @@ -451,20 +442,22 @@ int futex_wait_multiple_setup(struct futex_vector *vs, int count, int *woken)
> >  		struct futex_q *q = &vs[i].q;
> >  		u32 val = vs[i].w.val;
> >  
> > -		hb = futex_q_lock(q);
> > -		ret = futex_get_value_locked(&uval, uaddr);
> > +		if (1) {
> > +			CLASS(hb_q_lock, hb)(q);
> > +			ret = futex_get_value_locked(&uval, uaddr);
> 
> This confused me at the beginning because I expected hb_q_lock having
> the lock part in the constructor and also the matching unlock in the
> deconstructor. But no, this is not the case.

Agreed, that *is* rather ugly. The sane way to fix that might be to
untangle futex_q_lock() from futex_hash(). And instead do:

			CLASS(hb, hb)(&q->key);
			futex_q_lock(q, hb);

Or somesuch. That might be a nice cleanup either way.

> > @@ -618,26 +611,42 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
> …
> >  
> > +		if (uval != val) {
> > +			futex_q_unlock(hb);
> > +			return -EWOULDBLOCK;
> > +		}
> > +
> > +		if (key2 && !futex_match(&q->key, key2)) {
> 
> There should be no !

Duh..

> > +			futex_q_unlock(hb);
> > +			return -EINVAL;
> > +		}
> >  
> > -	if (uval != val) {
> > -		futex_q_unlock(*hb);
> > -		ret = -EWOULDBLOCK;
> > +		/*
> > +		 * The task state is guaranteed to be set before another task can
> > +		 * wake it. set_current_state() is implemented using smp_store_mb() and
> > +		 * futex_queue() calls spin_unlock() upon completion, both serializing
> > +		 * access to the hash list and forcing another memory barrier.
> > +		 */
> > +		set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
> > +		futex_queue(q, hb);
> >  	}
> >  
> >  	return ret;
> 
> So the beauty of it is that you enforce a ref drop on hb once it gets
> out of scope. So you can't use it by chance once the ref is dropped.

Right.

> But this does not help in futex_lock_pi() where you have the drop the
> reference before __rt_mutex_start_proxy_lock() (or at least before
> rt_mutex_wait_proxy_lock()) but still have it you go for the no_block
> shortcut. At which point even the lock is still owned.
> 
> While it makes the other cases nicer, the futex_lock_pi() function was
> the only one where I was thinking about setting hb to NULL to avoid
> accidental usage later on.

OK, so yeah, I got completely lost in futex_lock_pi(), and I couldn't
figure out what you did there. Let me try and untangle that again.
