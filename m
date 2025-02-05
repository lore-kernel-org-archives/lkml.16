Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC022144A4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738742736; cv=none; b=jqD1rR31889CeBOEIMgjVpiQ7w3Hjjd9bUgB1Yxobs70Iv13dbilJO0Sw4dlRF8G468/eUI34W+VHcoR85S/Sf5zJjsTzTyRT7S0lVxrMfu15/UeaN3LflSfwIpd9xBlHDhlBlyT+iYTc5eWnVpIYEhY60V9mIBDuY6mZKe4HDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738742736; c=relaxed/simple;
	bh=vd0eyJSADvwMSJwuQHSfm0MzDz8dRMYx8SSWl5r8mcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNFeUKMHOPFt8kKzxUH49+MCwVFh27IlBw7YP2IOgzv3F8bfxeXhfQ2Q3LvFCunUuHaGQtjn20iPHw9cb4Tf4FqaN/NLyvUhxN9Cxsbd02+0IUqUmB9tJ4ZMERXCpAJLU/lq0rq3Hnts4vaNFtJ25SFQvxrhJna0DuZeCCA7iL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ew+FQmR/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yXNzHUan; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ew+FQmR/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yXNzHUan"
Date: Wed, 5 Feb 2025 09:05:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738742733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IFzY33tsqsldgg76odDLBkBfG9c7GzRSiUtsTfTvB7U=;
	b=Ew+FQmR/AIGU0TgaL/zGzOzhnzaRBCQdDx4RFwTQd2xJNzPHZ9+/gJLGnnrMc3zWl+8yGl
	P//bM+PXGl3uWUY3tVpHnllm8WFH+1z3y75KjsgoeqjYQoU7QIFLREtagsE6EJ497bCHXX
	bW86XqyGGLzfNfaQn27d225ytmEasV+aQ4wbLzL+9NEy1GhtAWu09mfGX2M+WE2n/ebuab
	ARZDcYRpoyDwJUHuKQ1oD96eL+i/dGsd8oZcWL51pwV0K4lyqOi+HEyiy+g+eq1kbN9uCG
	qewdqiS1AlUq9X9ta3KFBKYeMmcTJFTNwPWroUyhIshBHG7vJt49l/vMG25WLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738742733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IFzY33tsqsldgg76odDLBkBfG9c7GzRSiUtsTfTvB7U=;
	b=yXNzHUanajpuX6p2FCChi7rSr5P/1HMzb18BK3lnGWI6qM2MmMZLfSJuLrzQT0aaqCk6AA
	hIkeUpVFehfFlfDA==
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
Subject: Re: [PATCH v8 13/15] futex: Resize local futex hash table based on
 number of threads.
Message-ID: <20250205080531.9cCHabrf@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-14-bigeasy@linutronix.de>
 <20250204102146.GT7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204102146.GT7145@noisy.programming.kicks-ass.net>

On 2025-02-04 11:21:46 [+0100], Peter Zijlstra wrote:
> On Mon, Feb 03, 2025 at 02:59:33PM +0100, Sebastian Andrzej Siewior wrote:
> > Automatically size the local hash based on the number of threads. The
> > logic tries to allocate between 16 and futex_hashsize (the default for
> > the system wide hash bucket) and uses 4 * number-of-threads.
> > On CONFIG_BASE_SMALL configs the suggested size is always 2.
> 
> > +	scoped_guard(rcu) {
> > +		threads = get_nr_threads(current);
> 
> How about something like:
> 
> 		threads = min(get_nr_threads(), num_online_cpus())
> 
> ?
makes sense.

> > +		hb_p = rcu_dereference(current->mm->futex_phash);
> > +		if (hb_p)
> > +			current_buckets = hb_p->hash_mask + 1;
> > +	}
> > +
> > +	if (IS_ENABLED(CONFIG_BASE_SMALL)) {
> > +		buckets = 2;
> > +
> 
> Or... you just disable the local thing entirely for BASE_SMALL and have
> it fall back to the global hash.

Okay, why not.

> > +	} else {
> > +		/*
> > +		 * The default allocation will remain within
> > +		 *   16 <= threads * 4 <= global hash size
> > +		 */
> > +		buckets = roundup_pow_of_two(4 * threads);
> > +		buckets = max(buckets, 16);
> > +		buckets = min(buckets, futex_hashsize);
> > +	}
> > +	if (current_buckets >= buckets)
> > +		return 0;
> > +
> > +	return futex_hash_allocate(buckets);
> >  }
> >  
> >  static int futex_hash_get_slots(void)

Sebastian
