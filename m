Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2791BF58
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749193605; cv=none; b=j+ger24p63cozTuGmmM3SF5Vv8LClrL/rKqexALPgfA0lkBfaHUifEHmlx30a16ILv2aiqu7XzZxZLCn9XLVbTj34JMtOcsqgmv6AzvAJrVPKTYNEfj/KFXn7QzjciGm//WuD6NzAF/yuMXSk6ivzjOcc/Cq1MymmwAhqq2A+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749193605; c=relaxed/simple;
	bh=8NCNDOFKVX4l5yQGOXyPhRGYHAm0YXygur2y+QsQT+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brjOv0iE9BvWQtYOvnDtSVwa3oiuFbJhbDtBYaVeMkFfaYyTyipWJZV9wQyJPem/ySZI1tHUCjsszcSH7l11Pr0aaSAuc/x1shz/aw9mew47vzCO/ajvTwq71ZkUcNs77aCRatmuw8yWlfHcs+a2OjdMhkgK18Iv9IDMKB+RHC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zFqwksVc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vgjPFlC5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zFqwksVc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vgjPFlC5"
Date: Fri, 6 Jun 2025 09:06:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749193599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CvmhLghGljnZK4lbrm7YCzxGbGhVL5rk2OVbZ5M8Mz8=;
	b=zFqwksVc5XiAenpC280DSds5VU1hH8itGRnTApN09TT59dYO+MIlcYP/eeFP3bvx6+XFTH
	qubv/6zWq3sAOEHtcFac9HK4XqU6OoUMO6QRsC6R1jBHiM7YVXY5WEl58nrWE142E4LBzY
	JbTcRt+nyDgn2nBxOCUhe9zgwOL9wNGkR0jOV5o2YVmAr4O3D4GqtfKGTY0nwmyioq1P/y
	wbyilk/z7JIrgcMYtnzV4F1CX9x6CsmsH9CDES8lKnFvp8x77S0xT2ze4m6aa6JsTNYPlS
	XD4w40duMDgMp9SwTsKfwT9swfd04OpreQukP2mXcKJAaYECkmpuADwtjUaBXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749193599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CvmhLghGljnZK4lbrm7YCzxGbGhVL5rk2OVbZ5M8Mz8=;
	b=vgjPFlC50CRMDthTsmUR5/tlTDddl9N+ai19d6fKpZyhx/X5dPkFjQsrCBFOUMN7nuzfZG
	DcjfPP9J/sOhE6Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Chris Mason <clm@meta.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250606070638.2Wk45AMk@linutronix.de>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>

On 2025-06-05 20:55:27 [-0400], Chris Mason wrote:
> >> We've got large systems that are basically dedicated to single
> >> workloads, and those will probably miss the larger global hash table,
> >> regressing like schbench did.  Then we have large systems spread over
> >> multiple big workloads that will love the private tables.
> >>
> >> In either case, I think growing the hash table as a multiple of thread
> >> count instead of cpu count will probably better reflect the crazy thin=
gs
> >> multi-threaded applications do?  At any rate, I don't think we want
> >> applications to need prctl to get back to the performance they had on
> >> older kernels.
> >=20
> > This is only an issue if all you CPUs spend their time in the kernel
> > using the hash buckets at the same time.
> > This was the case in every benchmark I've seen so far. Your thing might
> > be closer to an actual workload.
> >=20
>=20
> I didn't spend a ton of time looking at the perf profiles of the slower
> kernel, was the bottleneck in the hash chain length or in contention for
> the buckets?

Every futex operation does a rcuref_get() (which is an atomic inc) on
the private hash. This is before anything else happens. If you have two
threads, on two CPUs, which simultaneously do a futex() operation then
both do this rcuref_get(). That atomic inc ensures that the cacheline
bounces from one CPU to the other. On the exit of the syscall there is a
matching rcuref_put().

> >> For people that want to avoid that memory overhead, I'm assuming they
> >> want the CONFIG_FUTEX_PRIVATE_HASH off, so the Kconfig help text should
> >> make that more clear.
> >>
> >>> Then there the possibility of=20
> > =E2=80=A6
> >>> 256 cores, 2xNUMA:
> >>> | average rps: 1 701 947.02 Futex HBs: 0 immutable: 1
> >>> | average rps:   785 446.07 Futex HBs: 1024 immutable: 0
> >>> | average rps: 1 586 755.62 Futex HBs: 1024 immutable: 1> | average
> >> rps:   736 769.77 Futex HBs: 2048 immutable: 0
> >>> | average rps: 1 555 182.52 Futex HBs: 2048 immutable: 1
> >>
> >>
> >> How long are these runs?  That's a huge benefit from being immutable
> >> (1.5M vs 736K?) but the hash table churn should be confined to early in
> >> the schbench run right?
> >=20
> > I think 30 secs or so. I used your command line.=20
>=20
> Ah ok, my command line is 60 seconds.  It feels like something is
> strange for the immutable flag to make it that much faster?  schbench
> starts all the threads up front, so it should hit steady state pretty
> quickly.  More on NUMA below, but I'll benchmark with the immutable flag
> on the turin box in the morning to see if it is the extra atomics.

That immutable flag makes this rcuref_get()/ put() go away. The price is
that you can't change the size of the private hash anymore. So if your
workload works best with a hash size of X and you don't intend to change
it during the runtime of the program, set the immutable flag.

> > The 256 core box showed
> > a higher improvement than the 144 one. I attached a patch against
> > schbench in the previous mail, I did then
> > 	./schbench -L -m 4 -M auto -t 256 -n 0 -r 60 -s 0 -H 1024 -I
> >=20
> > =E2=80=A6
> >> This schbench hunk is just testing the performance impact of different
> >> bucket sizes, but hopefully we don't need it long term unless we want =
to
> >> play with even bigger hash tables?
> >=20
> > If you do "-H 0" then you should get the "old" behaviour. However the h=
ash
> > bucket are spread now over the NUMA nodes:
> >=20
> > | dmesg |grep -i futex
> > | [    0.501736] futex hash table entries: 32768 (2097152 bytes on 2 NU=
MA nodes, total 4096 KiB, linear).
> >=20
> > Now there are 32768 hash buckets on both NUMA nodes. Depending on the
> > hash it computes, it uses the data structures on NUMA node 1 or 2. The
> > old code allocated 65536 hash buckets via vmalloc().
>=20
> So I wanted to mention this earlier and forgot, but schbench obviously
> isn't numa aware at all.  This combination of command line options
> basically just has the 4 message threads waking up the 256 worker
> threads (per message thread) after scribbling a timestamp into shared
> memory.  From a schbench pov at least, we'll get much more stable
> numbers by sticking to a single socket.  <makes numa placement hand
> gestures>

Earlier the global hash was somehow spread via vmalloc(). Now it is
spread slightly different. If you request the private hash, then it is
allocated on the current node. Unless you move from one node the other,
this should be good.

> > The bigger hash table isn't always the answer. Yes, you could play
> > around figure out what works best for you. The problem is that the hash
> > is based on the mm and the (user) memory address. So on each run you
> > will get a different hash and therefore different collisions.
> > If you end up having many hash collisions and then block on the same
> > lock then yes, larger hash table will be the cure. If you have many
> > threads doing the futex syscall simultaneously then making the hash
> > immutable avoids two atomic ops on the same memory address.
> > This would be my favorite.
> >=20
> > Now that I think about it, it might be possible to move the atomic ops
> > the hash bucket itself. Then it wouldn't bounce the cache line so much.
> > Making the hash immutable is simpler.
>=20
> Going back to your diff, if we have a process growing the total number
> of threads, can we set FH_IMMUTABLE too early?  As the number of threads
> increases, eventually we'll pick the 2x num_cpus, but that'll take a whil=
e?

If you refer to the schbench diff, then set it early. Once the prctl()
to set the size of the private hash, there will be no resize by the
kernel.

If you refer to the kernel diff where set the FH_IMMUTABLE flag, then it
is set once the upper limit is reached (that was the plan in case I did
the logic wrong). Which means at that point it won't increase any
further because of the CPU limit. The only way how you can reach it too
early is if you offline CPUs.

> I do see what you mean about immutable being simpler though, I'll get
> some numbers on those atomics.

I have another idea to add a refcount to the hb slot itself. I hope that
it won't be that expensive if a atomic inc/dec occurs on different
memory locations. But then maybe freeze it if the upper limit is
reached. But that might help if we don't reach the upper limit.

> -chris

Sebastian
