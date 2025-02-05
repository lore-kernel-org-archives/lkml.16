Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B069212D69
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738742051; cv=none; b=mMrMSAnHoVnu2fKs4rqx3r/vJlk7by34sZ6YVeAmDK2Ntc9ok0xBmET2kRbslE6OzJnfnDd0iSMCgFkDOXhdYGW+1P9UOA4DEnvsmGzSCu5S44JYW5zBcFexpH0Z9HL2VUWXQQouX3N4ZT/cdo00NJHpOJYTE0kVvsNr3qOiYZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738742051; c=relaxed/simple;
	bh=5G/f1neav7YtSx2nn4bRTYPG9Mhh7PFGMCBG3e6sf7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHRKjxuE3em9F7JXRB46adLx2/dR1MM7PP+F0NZSI/zGYI+iqnU0PKcn12KQzlaRiZywvbJw4gPzc9gqlMia5F7yT5cIttwE57R44aZH9M6t3qV4e/cdSWXTJf97ae6zy837H9mfCdiDV3AznwCtmxJLWvmrB5oq9d4k4DO8MHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UZFm4hBY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3vaKYFvh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UZFm4hBY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3vaKYFvh"
Date: Wed, 5 Feb 2025 08:54:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738742047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=14OVeDNSnDNU/cwCZuHLIW2EuFagqvnysx+s38zj/uQ=;
	b=UZFm4hBYk8FLmf8kdonxUKGchj34wTj+QPq3HgmyYH6t+ilRB/41TcP+ST/fWKsjHFQAcc
	7Pq+o/Mimak7Gfp1/1gIkxQVexwzCxg+NqQu4pbaLbpo5hEez2S5iWmpEJqli5NrnTXwWB
	m3SKO9z26IH+lIJp+megIprxDJUxoM2pKoPEcQq7MUYNmMDpmu/iqYgUBXMeAALrTcGXHf
	CVcTpJvhUX3/yL4cYRh+p+O1XzyOv7siugPC+ehwvPxdQgMS8o9c2Ho5fVemZbutcYuqJj
	QvMAZtDa186NCRgxy56TpSxBNhqvkrF2ar4SMWAseTqqVb/m9wIasMXy0huz2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738742047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=14OVeDNSnDNU/cwCZuHLIW2EuFagqvnysx+s38zj/uQ=;
	b=3vaKYFvhKUznBwOd4ud+3+3Coxdbi1vcGAakLKWQh3NjAexzKmJ237mrWWRIiOidW9UWND
	fRIrgbkdDZkxmzDQ==
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
Subject: Re: [PATCH v8 08/15] futex: Prepare for reference counting of the
 process private hash end of operation.
Message-ID: <20250205075405.7bX5uyf3@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-9-bigeasy@linutronix.de>
 <20250204094922.GS7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204094922.GS7145@noisy.programming.kicks-ass.net>

On 2025-02-04 10:49:22 [+0100], Peter Zijlstra wrote:
> On Mon, Feb 03, 2025 at 02:59:28PM +0100, Sebastian Andrzej Siewior wrote:
> 
> > @@ -555,11 +558,12 @@ struct futex_hash_bucket *futex_q_lock(struct futex_q *q)
> >  	return hb;
> >  }
> >  
> > -void futex_q_unlock(struct futex_hash_bucket *hb)
> > +void futex_q_unlock_put(struct futex_hash_bucket *hb)
> >  	__releases(&hb->lock)
> >  {
> >  	futex_hb_waiters_dec(hb);
> >  	spin_unlock(&hb->lock);
> > +	futex_hash_put(hb);
> >  }
> 
> Here you don't

unlock + put.

> > @@ -288,23 +289,29 @@ extern void __futex_unqueue(struct futex_q *q);
> >  extern void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb);
> >  extern int futex_unqueue(struct futex_q *q);
> >  
> > +static inline void futex_hb_unlock_put(struct futex_hash_bucket *hb)
> > +{
> > +	spin_unlock(&hb->lock);
> > +	futex_hash_put(hb);
> > +}
> > +
> >  /**
> > - * futex_queue() - Enqueue the futex_q on the futex_hash_bucket
> > + * futex_queue_put() - Enqueue the futex_q on the futex_hash_bucket
> >   * @q:	The futex_q to enqueue
> >   * @hb:	The destination hash bucket
> >   *
> > - * The hb->lock must be held by the caller, and is released here. A call to
> > - * futex_queue() is typically paired with exactly one call to futex_unqueue().  The
> > - * exceptions involve the PI related operations, which may use futex_unqueue_pi()
> > - * or nothing if the unqueue is done as part of the wake process and the unqueue
> > - * state is implicit in the state of woken task (see futex_wait_requeue_pi() for
> > - * an example).
> > + * The hb->lock must be held by the caller, and is released here and the reference
> > + * on the hb is dropped. A call to futex_queue_put() is typically paired with
> > + * exactly one call to futex_unqueue(). The exceptions involve the PI related
> > + * operations, which may use futex_unqueue_pi() or nothing if the unqueue is
> > + * done as part of the wake process and the unqueue state is implicit in the
> > + * state of woken task (see futex_wait_requeue_pi() for an example).
> >   */
> > -static inline void futex_queue(struct futex_q *q, struct futex_hash_bucket *hb)
> > +static inline void futex_queue_put(struct futex_q *q, struct futex_hash_bucket *hb)
> >  	__releases(&hb->lock)
> >  {
> >  	__futex_queue(q, hb);
> > -	spin_unlock(&hb->lock);
> > +	futex_hb_unlock_put(hb);
> >  }
> 
> And here you do.

unlock + put. What do I don't do?

> > @@ -380,11 +387,13 @@ double_lock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
> >  }
> >  
> >  static inline void
> > -double_unlock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
> > +double_unlock_hb_put(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
> >  {
> >  	spin_unlock(&hb1->lock);
> >  	if (hb1 != hb2)
> >  		spin_unlock(&hb2->lock);
> > +	futex_hash_put(hb1);
> > +	futex_hash_put(hb2);
> >  }
> >  
> 
> This seems horribly inconsistent and makes my head hurt. Where are the
> matching gets for double_lock_hb() ?

There are in futex_hash().

Sebastian
