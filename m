Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389CF28C86E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945705; cv=none; b=vGAdWQ7vUFvxygCIv/DXUyiGVB8Ah8ugYpbHT7gHZARUG6OChQ2u2HAdpCPTt+JIqsmAORIPt+/HMMW/GUJ5sS/cPiGMOzyXCOGnBmNHpZGu0wcat3HSz8quD+riL0P1KxzO7yDCYeI1M3p9X7ZbmyxVKLTzYeEWSBmkxsYaqWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945705; c=relaxed/simple;
	bh=87VkdDYIT+p2yyW+Lvwy4yRbEV9b7aBVpyj41wG28ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFagHBuCRSBbPcYq1QMw3cswD+5S2LnJeYbXiftDceUcbbSRmH5c72E/bqoyc4vWj4c7bOnLpykJgNuWbeAju3QvmaWD7hayNOU5Dnym5RJqMj622O3OnXXG7sUcVyFLtgHyzeEt3fN5LulBD1iaVzWbaXBd8QWDsroWKkzFrrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sROY5InF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LBDw4E0T; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sROY5InF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LBDw4E0T"
Date: Thu, 26 Jun 2025 15:48:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750945702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSL35RmnDpLnCbJ2BzZx+qcD5Cpk7iwSGpe9IZK2Cwk=;
	b=sROY5InF0R6jYmf1uOT+acTm2/3SWyjb9YplOfHmWGb0Y0n6JUBXGR8nY2k6xqj1FrNDhz
	1E372tse+GA27Z1EiSkjGyQHbj+1xfiBL71FqBmOgOjv3eO0bLrnomqW1ZWb5bM289s6zS
	DtuWMgUgAYLaJr+q8vnfqd0j5DJezxPGjs7nyhrFb+E/BtgrqGQnZZaCI+7bff771L2zXW
	sWJA3MMDXmuPB/C2U3VQXIUuItzMNoGU37n5UKk7NleDbnFLY7j0GCJJDSuzFPSum+fPyk
	Xz/89DBRlsobOLnI/3wIKf9NsnPpH99kTv7m9N7Ut7aiKhwyjN3w3xNeVkxgvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750945702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSL35RmnDpLnCbJ2BzZx+qcD5Cpk7iwSGpe9IZK2Cwk=;
	b=LBDw4E0T669OeDBrnJFh8f0InlggpIyRDauOiB1zQlRL3VRoFGZDU+yVwhyGpIqgSo8ysW
	/hBdZLsyTTgmpVBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250626134820.ybEtTXSN@linutronix.de>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250624190118.GB1490279@noisy.programming.kicks-ass.net>

On 2025-06-24 21:01:18 [+0200], Peter Zijlstra wrote:
> How about something like this (very lightly tested)...
>=20
> the TL;DR is that it turns all those refcounts into per-cpu ops when
> there is no hash replacement pending (eg. the normal case), and only
> folds the lot into an atomic when we really care about it.

so we have per-CPU counter and on resize we wait one RCU grace period to
ensure everybody observed current fph, switch to atomics and wait one
grace period to ensure everyone is using atomics. Last step is to align
the atomic counter with the per-CPU counters and once the counter
reaches 0 perform the swap.

This looks fine :) Due to the RCU grace period, the swap takes longer
than before. I guess that is why you said earlier with to use srcu. For
things like "hackbench -T" you end up creating a new hash on every
thread creation which is not applied because RCU takes a while.
This could be optimized later by checking if the hash in futex_phash_new
matches the requested size.

> There's some sharp corners still.. but it boots and survives the
> (slightly modified) selftest.

The refcount does not pop up in perf so that is good.

> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -243,14 +247,18 @@ static bool __futex_pivot_hash(struct mm_struct *mm,
>  	fph =3D rcu_dereference_protected(mm->futex_phash,
>  					lockdep_is_held(&mm->futex_hash_lock));
>  	if (fph) {
> -		if (!rcuref_is_dead(&fph->users)) {
> +		if (!futex_ref_is_dead(fph)) {
>  			mm->futex_phash_new =3D new;
>  			return false;
>  		}
> =20
>  		futex_rehash_private(fph, new);
>  	}
> -	rcu_assign_pointer(mm->futex_phash, new);
> +	new->state =3D FR_PERCPU;
> +	scoped_guard (rcu) {

We do space or we don't? It looks like sched/ does while the remaining
bits of the kernel mostly don't. I don't care but we could (later)
adjust it for futex towards one direction.

> +		mm->futex_batches =3D get_state_synchronize_rcu();
> +		rcu_assign_pointer(mm->futex_phash, new);
> +	}
>  	kvfree_rcu(fph, rcu);
>  	return true;
>  }
=E2=80=A6
> +static void futex_ref_drop(struct futex_private_hash *fph)
=E2=80=A6
> +	call_rcu_hurry(&mm->futex_rcu, futex_ref_rcu);

Do you think it would improve with srcu or it is not worth it?

> +}
> +
> +static bool futex_ref_get(struct futex_private_hash *fph)
> +{
> +	struct mm_struct *mm =3D fph->mm;
> +
> +	guard(preempt)();
> +
> +	if (smp_load_acquire(&fph->state) =3D=3D FR_PERCPU) {
> +		this_cpu_inc(*mm->futex_ref);
> +		return true;
> +	}
> +
> +	return atomic_long_inc_not_zero(&mm->futex_atomic);
> +}
> +
> +static bool futex_ref_put(struct futex_private_hash *fph)
> +{
> +	struct mm_struct *mm =3D fph->mm;
> +
> +	guard(preempt)();
> +
> +	if (smp_load_acquire(&fph->state) =3D=3D FR_PERCPU) {
> +		this_cpu_dec(*mm->futex_ref);
> +		return false;
> +	}
> +
> +	return atomic_long_dec_and_test(&mm->futex_atomic);
> +}
> +
> +static bool futex_ref_is_dead(struct futex_private_hash *fph)
> +{
> +	struct mm_struct *mm =3D fph->mm;
> +
> +	guard(preempt)();
> +
> +	if (smp_load_acquire(&fph->state) =3D=3D FR_PERCPU)
> +		return false;
> +
> +	return atomic_long_read(&mm->futex_atomic) =3D=3D 0;
> +}

Why preempt_disable()? Is it just an optimized version of
rcu_read_lock()? I don't understand why. You don't even go for
__this_cpu_inc() so I a bit puzzled.

Sebastian
