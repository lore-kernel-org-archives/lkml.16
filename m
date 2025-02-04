Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD54143C5D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738662570; cv=none; b=qLQx2/WRvm3lDfylehPmYNRwr+GZ5SI1s1hMWKrtBsveW7XLqx+oKvCJy3RFo1RRl0RnDLW0uIdvTSHVBIIXDN3fXbmslMWw/JztWETnWiVQ8vXMSpOv3ob2h5xnCiOTQScZKRSkageH2ew6bvGD51sNDZuFuY2+4N0igTaM7fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738662570; c=relaxed/simple;
	bh=xf+b20hBKBD3X1D2s4oZvn2AvY6WgFi0/MgTCjD6A1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ds7KgszRqcC1eZSQwnne6crJAHBNIZ6h+gQbbXQ9fPo0zcrz3P52NrkuVLS67zImw1rebD5IHahS7FjKnLTghckdCL/VTVxOfKCygCf/sZzCyQk0R2a66IYhkrdgky4DTtYsj0xGItnrWShzwMrghsEq7VjWRPj44jjOPPpDsF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h/tZxtCO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h/tZxtCO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GmbUKWkL39aTTx8pNl8hva18Ww/CYiBJpH8AAzZSodQ=; b=h/tZxtCOU5CBo/ns+/z3UXN3bH
	xu9EEAffGlXl8ZlO17uB9G25gRcol+Cfh6G4H1iC84O9Tqe+h4+iaXibb8lTZ1+QGZidqZdDCOVzG
	d7OAhUBJtbBs+gC2r285DVVsoATUkuWzg39wTvaUIjmh7iXCh7KhRCIMPK62XymFzJK6YWQLJbzN+
	i2njpOyqf/VQQFSi5/2cdXkGtV7K5ifaNAmSbUcVUl8G4t/D7aco9+5fLlAdBLrctjjW/ry0HGvWx
	zq/C3A5rr3p+tVxEkDPqZRUf1ng32W3yKOo2SJsL+lS2H/Ag24OsbM1ti6GCkpopxBQmssIBOVlxS
	hzR8nMmA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFYZ-00000002VZk-451B;
	Tue, 04 Feb 2025 09:49:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F089B300599; Tue,  4 Feb 2025 10:49:22 +0100 (CET)
Date: Tue, 4 Feb 2025 10:49:22 +0100
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
Subject: Re: [PATCH v8 08/15] futex: Prepare for reference counting of the
 process private hash end of operation.
Message-ID: <20250204094922.GS7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-9-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203135935.440018-9-bigeasy@linutronix.de>

On Mon, Feb 03, 2025 at 02:59:28PM +0100, Sebastian Andrzej Siewior wrote:

> @@ -555,11 +558,12 @@ struct futex_hash_bucket *futex_q_lock(struct futex_q *q)
>  	return hb;
>  }
>  
> -void futex_q_unlock(struct futex_hash_bucket *hb)
> +void futex_q_unlock_put(struct futex_hash_bucket *hb)
>  	__releases(&hb->lock)
>  {
>  	futex_hb_waiters_dec(hb);
>  	spin_unlock(&hb->lock);
> +	futex_hash_put(hb);
>  }

Here you don't

> @@ -288,23 +289,29 @@ extern void __futex_unqueue(struct futex_q *q);
>  extern void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb);
>  extern int futex_unqueue(struct futex_q *q);
>  
> +static inline void futex_hb_unlock_put(struct futex_hash_bucket *hb)
> +{
> +	spin_unlock(&hb->lock);
> +	futex_hash_put(hb);
> +}
> +
>  /**
> - * futex_queue() - Enqueue the futex_q on the futex_hash_bucket
> + * futex_queue_put() - Enqueue the futex_q on the futex_hash_bucket
>   * @q:	The futex_q to enqueue
>   * @hb:	The destination hash bucket
>   *
> - * The hb->lock must be held by the caller, and is released here. A call to
> - * futex_queue() is typically paired with exactly one call to futex_unqueue().  The
> - * exceptions involve the PI related operations, which may use futex_unqueue_pi()
> - * or nothing if the unqueue is done as part of the wake process and the unqueue
> - * state is implicit in the state of woken task (see futex_wait_requeue_pi() for
> - * an example).
> + * The hb->lock must be held by the caller, and is released here and the reference
> + * on the hb is dropped. A call to futex_queue_put() is typically paired with
> + * exactly one call to futex_unqueue(). The exceptions involve the PI related
> + * operations, which may use futex_unqueue_pi() or nothing if the unqueue is
> + * done as part of the wake process and the unqueue state is implicit in the
> + * state of woken task (see futex_wait_requeue_pi() for an example).
>   */
> -static inline void futex_queue(struct futex_q *q, struct futex_hash_bucket *hb)
> +static inline void futex_queue_put(struct futex_q *q, struct futex_hash_bucket *hb)
>  	__releases(&hb->lock)
>  {
>  	__futex_queue(q, hb);
> -	spin_unlock(&hb->lock);
> +	futex_hb_unlock_put(hb);
>  }

And here you do.


> @@ -380,11 +387,13 @@ double_lock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
>  }
>  
>  static inline void
> -double_unlock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
> +double_unlock_hb_put(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
>  {
>  	spin_unlock(&hb1->lock);
>  	if (hb1 != hb2)
>  		spin_unlock(&hb2->lock);
> +	futex_hash_put(hb1);
> +	futex_hash_put(hb2);
>  }
>  

This seems horribly inconsistent and makes my head hurt. Where are the
matching gets for double_lock_hb() ?
