Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDFF2BEC3D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027078; cv=none; b=VgibHJXT2WW0RYnBNYSJJ/YUSfqXkjmLZe02la8UgzxFXWguvx572cZi7GGDMqjwhTXtbgPpPAcZpxGNR9EO07rrV78kizvCvT6yGM8LERnGcoCNI6Zuy6BX2/cbHmz+FuO2m/Fve3HDbihC/qeXAN1jWSxwXbT6bepgh0zlWVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027078; c=relaxed/simple;
	bh=9CZX/gN6H0dvDI9xwZAIRvjrV1biAXY3injNtbTMfgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dorkkjbj9nBmaW91NaBcSx0AVV9b51/y7vzf7rV4k38Y8+DPtkxs9r9PoCrvbJm5svDAjMtkG98itEfoSD6BwWH2AFK8IuQna8/l769oHCRzwYjpYLOFxMU9oaCd/tvjo0YeB+Xq7fc2wC/DiiRMc4TFSqLBfkyJDEXIweckQeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3aNliHoU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5wgppqQL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3aNliHoU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5wgppqQL"
Date: Fri, 27 Jun 2025 14:24:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751027075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mpbYOTc9s2yyrANH4b1uxDXixl3Ah8BpykO6BbfmOW0=;
	b=3aNliHoUMJXLWhSc3FDwnwhMc6CxR5QsVoUvhFxrwQiAP0FbPCTHT3iTemwbF1WCohDXvL
	mCHWJuHQaXAIRW0aWqZMwIjJuGB8TL0vSYlSI3/Kfmw4jFyUfQAS7h68X50We0Z+Unhvcp
	EyMUr4q7TnTRcClQbh3vjCL4WGEU9N3S2FaersyhZv32i62qYEA+7x9DmjKdwWVKvogR2c
	tOoD/AnzxFGMwG4OQjkBk2xJUzyt/0svgWNLnTGbJN1Pst/M76H0tNJbGLo918AMhgMeQK
	jhAj9JIxvXn3z99kAmtZu4FuaQe186UztDjTH5xrZKYHt7ODaOlAmLe1odfL3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751027075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mpbYOTc9s2yyrANH4b1uxDXixl3Ah8BpykO6BbfmOW0=;
	b=5wgppqQLzDVcc/JUGzV81iv6ZYf9MWEiosFJXXbtKNLNU82Kjjlpd4lOYNlBiKmJu2SJ4f
	lvfLLdDdsaOR2VDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250627122434.LtaTjk_B@linutronix.de>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
 <20250626134820.ybEtTXSN@linutronix.de>
 <20250626143638.GM1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626143638.GM1613200@noisy.programming.kicks-ass.net>

On 2025-06-26 16:36:38 [+0200], Peter Zijlstra wrote:
> > I guess that is why you said earlier with to use srcu. For
> > things like "hackbench -T" you end up creating a new hash on every
> > thread creation which is not applied because RCU takes a while.
> > This could be optimized later by checking if the hash in futex_phash_new
> > matches the requested size.
> 
> So the main benefit of using SRCU (I have half a patch and a head-ache
> to show for it) is that you don't need the per-mm-per-cpu memory
> storage. The down-side is that you share the 'refcount' between all mm's
> so it gets to be even slower.

I see. So it is not just s/rcu/srcu/ for the hopefully quicker grace
period since it does not affect whole system. It a different algorithm.

> The 'problem' is that reasoning about stuff comes even harder. But the
> main idea is to replace mm->futex_phash with a 'tombstone' value to
> force __futex_hash() into taking the slow-path and hitting
> mm->futex_hash_lock.
> 
> Then you do call_srcu() to wait one SRCU period, this has everybody
> stalled, and guarantees the fph you had is now unused so we can rehash.
> Then replace the tombstone with the new hash and start over.
> 
> It's just that stuff like futex_hash_get() gets somewhat tricky, you
> have to ensure the SRCU periods overlap.
> 
> Anyway, that approach should be feasible as well, just not sure of the
> trade-offs.

The current looks reasonable enough and it survived yesterday's testing.

> > Why preempt_disable()? Is it just an optimized version of
> > rcu_read_lock()? I don't understand why. You don't even go for
> > __this_cpu_inc() so I a bit puzzled.
> 
> The code morphed a lot over the two days it took to write this. But
> yeah, preempt or rcu doesn't really matter here.
> 
> I didn't yet think about __this_cpu, its not really relevant on x86. If
> you want to make that relaxation you have to consider IRQ and SoftIRQ
> handling though. Given we have this_cpu_inc() in the RCU callback, which
> is ran from SoftIRQ context, this might not be safe.

Nah, I am all for a simple cguard(rcu) here.

Sebastian
