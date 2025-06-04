Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2611A42C4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 20:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067693; cv=none; b=JsmuvlMp6EQveqdHzRHUqwPX2Ksr9dPq/Mcn8+nqXpJ5NxN+urwPNqOpO7sjMedbEhEGZvgBWjAnIc3MV6NlMw9egY2kPxNI/pCHI2HDT5RhBol3JbflYJwoFbC0ZJ5ElhDiQOWJ5oldmMfvbELJdonM/4vIMce42/WMlKkUDuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067693; c=relaxed/simple;
	bh=rPLkg40C2876sO8ZNF8kBgzPo/yntorrDO25Fyad8vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTYF+FW/PWXizrJVdasFexRiDAQEM50D9jdQ6oaq26/N+FYSgZRGZKhyHWVgWYLLW8b/m+PpSK4b8i5++F1ibv+nNwsGtlJVSTSjUeI3VAdSvpLck6Gqzq2G+YW+YW7gn7tXU3IIE11BpKfD1gbjC0CFB+G2y9z2ciPr65mkqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eOX+Y9uY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QbNtSpua; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eOX+Y9uY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QbNtSpua"
Date: Wed, 4 Jun 2025 22:08:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749067689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJS2JSKxRn2lcygSVB+S9SJi/+0Jb7bqFRFBhCAFLn8=;
	b=eOX+Y9uY7eiqNDY+mXchKLjX6f/ajOGm6nIsc5dMEFn4DHCgm0NGdZ7peXF2tZBBCoYnuE
	/P3FWgXL2Ac8Xaka+JTW9DNhBT+qNQDQBZmGL5P0TBY954GwZ7fA1neI6Skr1my4aA3YrM
	BXQ825uU9j06utoKR3UajSP58AfOZYe6ORW9vQXqD8Q8u/qr3CYKmrc7S6Vw5d4xf0/zxo
	M/goRUJ+mOKLMlZ9bK3EiCxdEJCdXIQiTZw19c1MFEByEGBCDeB3wLyyruFE2wkrhAVjSq
	eebYcEFX2xWiaQKO8jMFnEbmopf81HITQknLt114cImolg9r7mGe6xUoxaaM0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749067689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJS2JSKxRn2lcygSVB+S9SJi/+0Jb7bqFRFBhCAFLn8=;
	b=QbNtSpuagaM07NcXmJ6CkOe8MB9Hkq+ElQWJjzQ+PS+OXBw2ulYrolSyAKQS487xqNoJSq
	JifbKje3XqA5bKBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Chris Mason <clm@meta.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250604200808.hqaWJdCo@linutronix.de>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>

On 2025-06-04 11:48:05 [-0400], Chris Mason wrote:
> > --- a/kernel/futex/core.c
> > +++ b/kernel/futex/core.c
> > @@ -1687,7 +1687,7 @@ int futex_hash_allocate_default(void)
> >  	scoped_guard(rcu) {
> >  		threads =3D min_t(unsigned int,
> >  				get_nr_threads(current),
> > -				num_online_cpus());
> > +				num_online_cpus() * 2);
> > =20
> >  		fph =3D rcu_dereference(current->mm->futex_phash);
> >  		if (fph) {
> >=20
> > which would increase it to 2048 as Chris asks for.
>=20
> I haven't followed these changes, so asking some extra questions.  This
> would bump to num_online_cpus() * 2, which probably isn't 2048 right?

Assuming you have 256 CPUs and -m 4 -t 256 creates 4 * 256 =3D 1024 then
threads =3D 512 gets computed (=3D min(1024, 256 * 2)). Later we do 512 * 4
(roundup_pow_of_two(4 * threads)). This makes 2048 hash buckets.

> We've got large systems that are basically dedicated to single
> workloads, and those will probably miss the larger global hash table,
> regressing like schbench did.  Then we have large systems spread over
> multiple big workloads that will love the private tables.
>=20
> In either case, I think growing the hash table as a multiple of thread
> count instead of cpu count will probably better reflect the crazy things
> multi-threaded applications do?  At any rate, I don't think we want
> applications to need prctl to get back to the performance they had on
> older kernels.

This is only an issue if all you CPUs spend their time in the kernel
using the hash buckets at the same time.
This was the case in every benchmark I've seen so far. Your thing might
be closer to an actual workload.

> For people that want to avoid that memory overhead, I'm assuming they
> want the CONFIG_FUTEX_PRIVATE_HASH off, so the Kconfig help text should
> make that more clear.
>=20
> > Then there the possibility of=20
=E2=80=A6
> > 256 cores, 2xNUMA:
> > | average rps: 1 701 947.02 Futex HBs: 0 immutable: 1
> > | average rps:   785 446.07 Futex HBs: 1024 immutable: 0
> > | average rps: 1 586 755.62 Futex HBs: 1024 immutable: 1> | average
> rps:   736 769.77 Futex HBs: 2048 immutable: 0
> > | average rps: 1 555 182.52 Futex HBs: 2048 immutable: 1
>=20
>=20
> How long are these runs?  That's a huge benefit from being immutable
> (1.5M vs 736K?) but the hash table churn should be confined to early in
> the schbench run right?

I think 30 secs or so. I used your command line. The 256 core box showed
a higher improvement than the 144 one. I attached a patch against
schbench in the previous mail, I did then
	./schbench -L -m 4 -M auto -t 256 -n 0 -r 60 -s 0 -H 1024 -I

=E2=80=A6
> This schbench hunk is just testing the performance impact of different
> bucket sizes, but hopefully we don't need it long term unless we want to
> play with even bigger hash tables?

If you do "-H 0" then you should get the "old" behaviour. However the hash
bucket are spread now over the NUMA nodes:

| dmesg |grep -i futex
| [    0.501736] futex hash table entries: 32768 (2097152 bytes on 2 NUMA n=
odes, total 4096 KiB, linear).

Now there are 32768 hash buckets on both NUMA nodes. Depending on the
hash it computes, it uses the data structures on NUMA node 1 or 2. The
old code allocated 65536 hash buckets via vmalloc().

The bigger hash table isn't always the answer. Yes, you could play
around figure out what works best for you. The problem is that the hash
is based on the mm and the (user) memory address. So on each run you
will get a different hash and therefore different collisions.
If you end up having many hash collisions and then block on the same
lock then yes, larger hash table will be the cure. If you have many
threads doing the futex syscall simultaneously then making the hash
immutable avoids two atomic ops on the same memory address.
This would be my favorite.

Now that I think about it, it might be possible to move the atomic ops
the hash bucket itself. Then it wouldn't bounce the cache line so much.
Making the hash immutable is simpler.
=20
> -chris

Sebastian
