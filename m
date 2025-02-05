Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C4020F09B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738742433; cv=none; b=h6K5tiEnLAV9ssDn/w/YbC+/75k6DvV4eTw1KHAhKO3cy5CnktC7hqquFNYkFEswESW/BCeSBE5pnwrix3/8jh38ZKJxb3fg9NKLheBRfdq2dhr3JiDv+tSzlggq3Z7rlzu2k9qI1Q84IQrfIe6O1s8bNZXnYCYqDregJZwX0fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738742433; c=relaxed/simple;
	bh=1wn5SAtkvCXWJ+J7Ur/DSaWpwheKOd1m678gZSFh0Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=comCUVjWud6FU3e1QJf9GA/g+m0n8DIEOR1N5Ujnh6PS3Aup7uqzFIiMy1yFYlifyeGWjePl3nCdbMc+F9lLxOV4zj+kb5NeU8hIecgpfNAbVV/b8ENxDY7SgE2zqwsNk1HJ6rC0/n0eXBrOgLpHODh5pxW8zdX8I/e71LW7EKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wmCbmIgp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q1pysmM+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wmCbmIgp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q1pysmM+"
Date: Wed, 5 Feb 2025 09:00:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738742430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dd9GQ0g7bdxaMY4hIQ4JmXxLKcRWiDcniYXTffxj+g0=;
	b=wmCbmIgpVgZvrOc8xD/pbrQWfuQxjM46+5Hb3cdAr7ZsDRDcR/8v3MA4cCB4T17NlaRtde
	dYvvWwRG90v7nIvWwcdjPoabQntvvQoHrVKOiTxZgqGtBGqy54KPWEuBMF/9ZacHdH7TDo
	fi77/XINyia90e4XPoU87zKR+w0cmOkJDxx1JRO530o8ep8qFQbGoffNaC597HQm/cn7El
	mD84AEkqfrcDEGv+K0WhIKTg5NJzAxDpZghf9Cg1fL+CG21r6gzARLmXTWCvT497+ymjL8
	maL9gC8AXkdxJjGwnSHIfaHb+EDgkyNbRrWoLuoKaeEGA8fHqBY/ZSCoNrwVbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738742430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dd9GQ0g7bdxaMY4hIQ4JmXxLKcRWiDcniYXTffxj+g0=;
	b=Q1pysmM+LuGLrxfcZvWs5/GLQwqa8+vqP4tZjelyTnl5gfOgJ0tWtfAt8bPtwpNYXTN43O
	APAoJw2pvNkss0CQ==
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
Subject: Re: [PATCH v8 12/15] futex: Allow to re-allocate the private local
 hash.
Message-ID: <20250205080029.rAEXY6qX@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-13-bigeasy@linutronix.de>
 <20250204110533.GV7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204110533.GV7145@noisy.programming.kicks-ass.net>

On 2025-02-04 12:05:33 [+0100], Peter Zijlstra wrote:
> > @@ -175,6 +311,14 @@ void futex_hash_put(struct futex_hash_bucket *hb)
> >   */
> >  void futex_hash_get(struct futex_hash_bucket *hb)
> >  {
> > +	struct futex_private_hash *hb_p;
> > +
> > +	if (hb->hb_slot == 0)
> > +		return;
> > +	hb_p = container_of(hb, struct futex_private_hash,
> > +			    queues[hb->hb_slot - 1]);
> > +
> > +	WARN_ON_ONCE(!rcuref_get(&hb_p->users));
> >  }
> 
> > --- a/kernel/futex/futex.h
> > +++ b/kernel/futex/futex.h
> > @@ -115,6 +115,7 @@ static inline bool should_fail_futex(bool fshared)
> >   */
> >  struct futex_hash_bucket {
> >  	atomic_t waiters;
> > +	unsigned int hb_slot;
> >  	spinlock_t lock;
> >  	struct plist_head chain;
> >  } ____cacheline_aligned_in_smp;
> 
> *groan*
> 
> Just sticking a pointer in was too complicated?

It looked simpler. But okay.

> void futex_hash_put(struct futex_hash_bucket *hb)
> {
> 	struct futex_private_hash *ph = hb->private;
> 	if (!ph)
> 		return;
> 
> 	futex_put_private_hash(ph);
> }

Sebastian
