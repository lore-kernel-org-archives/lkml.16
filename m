Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EB02EACEA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948603; cv=none; b=mIpCn1KV+y7oIEYJwOmJK9u5K+pxeMJQJTqYB8ZLXQjaql1bUSVQIIb/vIcq8rJv/wzH/RrUrdIKZhwce7GwWyo3OKIElw99yWRYCFWEENhSXy162zbr8Bd3pjn/Er0B/SrdyrIYspFJb2M6bZdm9L0cAT5+TPG9sVGj/iqr+/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948603; c=relaxed/simple;
	bh=aMD8ejGS9TnkYaYfnO22Nuuy+7Q4oIeatP+nDuxoBNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvaqOyzwXn8ZyB6DlkxK0lr95Q0ifRUCWfbNqe6eOpBMdyUEz5Lx6D2kmKYM/10sXt7Ox9kA6rhRtgAqqBFA7swLhzjZnOp4jBGOUqYFWBz9EY8DhY4zUIW6se/TJBwvxOZmmlxK8fDa9zh9lU16LVGY7t3SVaaF+PNK6V95iY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=N+hMQ9/C; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N+hMQ9/C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fxYLjCCQcc7O0ItEvuCh6htbWSTZkrxQ7OIK65TTmQE=; b=N+hMQ9/C+enaKkYTLeFM02xVN9
	5koexwG4+Lm/q+dq8oFbQm9DfQLfX5YqEIIYvim1mQEhE/VtTqpBwNPkBv3Oj+qR76T+VExqxWa2u
	M2WIaZo/F1o+/7mgQl+zvpLRin0PVqWzE0/00ftQ0aOWLQW4GsTNx84NQ3ytHo503iS50T3o58RNJ
	SvO7LM3L8T5je36Uxag1cyL3uuzvvrTMXSurwPRQpOh4EAF2vzKzGPJHI5HLQV0Whu5NpJg4F57kd
	xwfy2ncKX3NNX0gbx6ztzvTL06220ywj2HzxfpwerQvnbaLz122ozz5fG4mdPGepAKzjnsgUsE8Mc
	jQCLe9vg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUniR-000000066xV-1CTW;
	Thu, 26 Jun 2025 14:36:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5DD6530BDA9; Thu, 26 Jun 2025 16:36:38 +0200 (CEST)
Date: Thu, 26 Jun 2025 16:36:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250626143638.GM1613200@noisy.programming.kicks-ass.net>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
 <20250626134820.ybEtTXSN@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626134820.ybEtTXSN@linutronix.de>

On Thu, Jun 26, 2025 at 03:48:20PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-24 21:01:18 [+0200], Peter Zijlstra wrote:
> > How about something like this (very lightly tested)...
> > 
> > the TL;DR is that it turns all those refcounts into per-cpu ops when
> > there is no hash replacement pending (eg. the normal case), and only
> > folds the lot into an atomic when we really care about it.
> 
> so we have per-CPU counter and on resize we wait one RCU grace period to
> ensure everybody observed current fph, switch to atomics and wait one
> grace period to ensure everyone is using atomics. Last step is to align
> the atomic counter with the per-CPU counters and once the counter
> reaches 0 perform the swap.
> 
> This looks fine :) Due to the RCU grace period, the swap takes longer
> than before. 

Yes, but given this is supposed to be 'rare', I didn't think that was a
problem.

> I guess that is why you said earlier with to use srcu. For
> things like "hackbench -T" you end up creating a new hash on every
> thread creation which is not applied because RCU takes a while.
> This could be optimized later by checking if the hash in futex_phash_new
> matches the requested size.

So the main benefit of using SRCU (I have half a patch and a head-ache
to show for it) is that you don't need the per-mm-per-cpu memory
storage. The down-side is that you share the 'refcount' between all mm's
so it gets to be even slower.

The 'problem' is that reasoning about stuff comes even harder. But the
main idea is to replace mm->futex_phash with a 'tombstone' value to
force __futex_hash() into taking the slow-path and hitting
mm->futex_hash_lock.

Then you do call_srcu() to wait one SRCU period, this has everybody
stalled, and guarantees the fph you had is now unused so we can rehash.
Then replace the tombstone with the new hash and start over.

It's just that stuff like futex_hash_get() gets somewhat tricky, you
have to ensure the SRCU periods overlap.

Anyway, that approach should be feasible as well, just not sure of the
trade-offs.

> > There's some sharp corners still.. but it boots and survives the
> > (slightly modified) selftest.
> 
> The refcount does not pop up in perf so that is good.

\o/

> > --- a/kernel/futex/core.c
> > +++ b/kernel/futex/core.c
> > @@ -243,14 +247,18 @@ static bool __futex_pivot_hash(struct mm_struct *mm,
> >  	fph = rcu_dereference_protected(mm->futex_phash,
> >  					lockdep_is_held(&mm->futex_hash_lock));
> >  	if (fph) {
> > -		if (!rcuref_is_dead(&fph->users)) {
> > +		if (!futex_ref_is_dead(fph)) {
> >  			mm->futex_phash_new = new;
> >  			return false;
> >  		}
> >  
> >  		futex_rehash_private(fph, new);
> >  	}
> > -	rcu_assign_pointer(mm->futex_phash, new);
> > +	new->state = FR_PERCPU;
> > +	scoped_guard (rcu) {
> 
> We do space or we don't? It looks like sched/ does while the remaining
> bits of the kernel mostly don't. I don't care but we could (later)
> adjust it for futex towards one direction.

Oh, scoped_guard is for and we write for loops with a space on. Perhaps
its because I wrote it all and know this. But yeah, meh :-)

> > +		mm->futex_batches = get_state_synchronize_rcu();
> > +		rcu_assign_pointer(mm->futex_phash, new);
> > +	}
> >  	kvfree_rcu(fph, rcu);
> >  	return true;
> >  }
> …
> > +static void futex_ref_drop(struct futex_private_hash *fph)
> …
> > +	call_rcu_hurry(&mm->futex_rcu, futex_ref_rcu);
> 
> Do you think it would improve with srcu or it is not worth it?

Per the above, I'm not sure about the trade-offs. I think the SRCU
approach can be made to work -- I just got me head in a twist.

> > +}
> > +
> > +static bool futex_ref_get(struct futex_private_hash *fph)
> > +{
> > +	struct mm_struct *mm = fph->mm;
> > +
> > +	guard(preempt)();
> > +
> > +	if (smp_load_acquire(&fph->state) == FR_PERCPU) {
> > +		this_cpu_inc(*mm->futex_ref);
> > +		return true;
> > +	}
> > +
> > +	return atomic_long_inc_not_zero(&mm->futex_atomic);
> > +}
> > +
> > +static bool futex_ref_put(struct futex_private_hash *fph)
> > +{
> > +	struct mm_struct *mm = fph->mm;
> > +
> > +	guard(preempt)();
> > +
> > +	if (smp_load_acquire(&fph->state) == FR_PERCPU) {
> > +		this_cpu_dec(*mm->futex_ref);
> > +		return false;
> > +	}
> > +
> > +	return atomic_long_dec_and_test(&mm->futex_atomic);
> > +}
> > +
> > +static bool futex_ref_is_dead(struct futex_private_hash *fph)
> > +{
> > +	struct mm_struct *mm = fph->mm;
> > +
> > +	guard(preempt)();
> > +
> > +	if (smp_load_acquire(&fph->state) == FR_PERCPU)
> > +		return false;
> > +
> > +	return atomic_long_read(&mm->futex_atomic) == 0;
> > +}
> 
> Why preempt_disable()? Is it just an optimized version of
> rcu_read_lock()? I don't understand why. You don't even go for
> __this_cpu_inc() so I a bit puzzled.

The code morphed a lot over the two days it took to write this. But
yeah, preempt or rcu doesn't really matter here.

I didn't yet think about __this_cpu, its not really relevant on x86. If
you want to make that relaxation you have to consider IRQ and SoftIRQ
handling though. Given we have this_cpu_inc() in the RCU callback, which
is ran from SoftIRQ context, this might not be safe.

