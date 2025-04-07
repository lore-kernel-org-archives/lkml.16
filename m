Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3970191
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 00:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743984474; cv=none; b=D5pKNnvTvWVCzEJexXucEtPscres/REQcEewJx1lYv3XvZyMrPykVUogHcPdIbiH+bR+qEVHN638q5VsYqIjOZDZMzktYGOzPIaEProsEv50uynbO470BjovJmT59/oytovKYCnUhjXKdaKJWInMQRELkd31jjfWhY/TrWcgTIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743984474; c=relaxed/simple;
	bh=xSLbhtqT9jWsODyv/HtzXfPET67fr4XVb0hYkeLY//g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UR7odiOx0Y09aXhWdt0VUtj5HKWI1VY5/NFiJheHvFYaNnK6IhlJznc6uQLQ+mCfQc/X++9YHth6GMUFh0SEgivwH8/4lntumjyYrCURddD7tQ5fXQhY9pcqpf3nlndYA5wSMIZj7l8FZNEafB31x8Drn/uOj1fW3OByNotWung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1g8M+RN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1g8M+RN"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso7223598a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743984471; x=1744589271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/SS26Kqy8ljIl0w5DW1FHiwgX3UcillFs8vuEaBkTM=;
        b=c1g8M+RNemoc9tsTVAlChBv0gigYSOmGitXp1LmEjikV0d3cITiuGav6sIpHPZIslW
         n3mosVk6ye+0lpHsAlcv9GWE358FpSbr+BqigzHUQaIfQ+2DHCe7IPgRcTX8wuLZWkpI
         5RVEguuJ6U1G6al52yx0hf2iBUGRx/sBJC7DIvJ28vjcM+e7zDrN9hZ9Ibya5yJzrSgp
         yBWXnWAoMx6ZY5UrL6pYGCkwVmclzGu1mk4LejL3zsAAlF2XfXvWxBAfoRX14q4/BXK+
         PgvffPTeX9RRqRVXSgQAydcH4haIKHX3uGMhWYth2CgiZ4d+2FMRGnFvU//RZDIXcrJk
         Tmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743984471; x=1744589271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/SS26Kqy8ljIl0w5DW1FHiwgX3UcillFs8vuEaBkTM=;
        b=owwPdFDVffeaf0ZtOM2o2p0trSBnfEK6mrW7vi6vuyuVpVUtXmliksLO2NUmRv+YCL
         NNc21bhku+VkvyxaHoilRHoA1ugKNfyxneenCXZuSChezF7CZcfO4uk4hfFWuvfFpjMC
         v7EsH10P1OHBD7Wn39e9QvjisdPV8SOmUN4S+8QAPdHm56r8pwJBbHb5bra4dLTmDuDM
         hRX5WyOd36gHOc+mkgSy4unTH4Drhf6oNhU/Pe7m+wM1acFaddYxS8ytHnsQEsJCNuuX
         Hq8qNQmc4dSdzWPipQQNQaL750tejfQJ9MJlEG4NqlFOw+JKVECbWVOlcN8O3M29sKGH
         9n0w==
X-Gm-Message-State: AOJu0YxfydSsMT64i9dsyEfUZ8qdyYftF9Osud/VHcgST1i7rV2qYr3V
	4X7r6hyEFCqFLI1EksXmvUKq3GYDahaxn/6RK0yD8cdv0P2YV3O64owkOe74tPcYiN2bYEOFevv
	DNcSrlAwmSB0W/28siqLg61GAVUM=
X-Gm-Gg: ASbGncsxzbGaVbCQaBxl4qthZSuKbNJcdNufqFA8WNAGbBclHD+LihiCileTOq4aS4D
	V8nAE0F+P665xUxMwzLwLYI3RnYuxSQ2XbK8E/wx+AvDGXNf3UJ5SxmQJk8YsZQyzgzho7QSqMt
	OpzjlLPtspxuYemkMuSiW4xLBqeg==
X-Google-Smtp-Source: AGHT+IHcXndvEkoU7KQ5ppK3Sbf1myOMR28+dVxSzHwMaCrO4RQdHty3cD254sALRVfEZm050YOp1llteGNTHXNEdTU=
X-Received: by 2002:a05:6402:3592:b0:5e7:8501:8c86 with SMTP id
 4fb4d7f45d1cf-5f0b3e490a7mr9224825a12.22.1743984470772; Sun, 06 Apr 2025
 17:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <20250403211514.985900-8-paulmck@kernel.org> <CAGudoHF5H0NhCu-mCjtd1SGRc5P=8X7jmTaP9k12zZixX1-9LA@mail.gmail.com>
 <276d81e0-3867-471a-8e99-b7582378dd64@paulmck-laptop>
In-Reply-To: <276d81e0-3867-471a-8e99-b7582378dd64@paulmck-laptop>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 7 Apr 2025 02:07:38 +0200
X-Gm-Features: ATxdqUGU55mO6Y3iq5YKO74o-5Q0_2tFB5WIvBJKyfCAdnBpExlglMEUN9ym6zw
Message-ID: <CAGudoHFH=U4eb=t50nr55kTaamsaKHdwPeZZCtJ7JXtYYy7-KQ@mail.gmail.com>
Subject: Re: [PATCH RFC 8/9] ratelimit: Reduce ratelimit's false-positive misses
To: paulmck@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Andrew Morton <akpm@linux-foundation.org>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jon Pan-Doh <pandoh@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Karolina Stolarek <karolina.stolarek@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 7:41=E2=80=AFPM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> On Sat, Apr 05, 2025 at 11:17:00AM +0200, Mateusz Guzik wrote:
> > On Thu, Apr 3, 2025 at 11:15=E2=80=AFPM Paul E. McKenney <paulmck@kerne=
l.org> wrote:
> > >
> > > The current ratelimit implementation can suffer from false-positive
> > > misses.  That is, ___ratelimit() might return zero (causing the calle=
r
> > > to invoke rate limiting, for example, by dropping printk()s) even whe=
n
> > > the current burst has not yet been consumed.  This happens when one C=
PU
> > > holds a given ratelimit structure's lock and some other CPU concurren=
tly
> > > invokes ___ratelimit().  The fact that the lock is a raw irq-disabled
> > > spinlock might make low-contention trylock failure seem unlikely, but
> > > vCPU preemption, NMIs, and firmware interrupts can greatly extend the
> > > trylock-failure window.
> > >
> > > Avoiding these false-positive misses is especially important when
> > > correlating console logged hardware failures with other information.
> > >
> > > Therefore, instead of attempting to acquire the lock on each call to
> > > ___ratelimit(), construct a lockless fastpath and only acquire the lo=
ck
> > > when retriggering (for the next burst) or when resynchronizing (due t=
o
> > > either a long idle period or due to ratelimiting having been disabled=
).
> > > This reduces the number of lock-hold periods that can be extended
> > > by vCPU preemption, NMIs and firmware interrupts, but also means that
> > > these extensions must be of much longer durations (generally moving f=
rom
> > > milliseconds to seconds) before they can result in false-positive dro=
ps.
> > >
> > > In addition, the lockless fastpath gets a 10-20% speedup compared to
> > > the old fully locked code on my x86 laptop.  Your mileage will of cou=
rse
> > > vary depending on your hardware, workload, and configuration.
>
> Thank you for digging into this!!!
>
> > First a nit: the func returns an int with 1 or 0, perhaps one extra
> > patch to make it bool can be squeezed in here?
>
> I can do that.  Patch below.
>

thanks

> > One of the previous patches fixes a bug on 32-bit archs.
> >
> > Maybe it will sound silly, but my suggestion below hinges on it: is
> > this patchset written with 32-bit kernels in mind?
>
> Yes, that bug fix is reflected in the lockless-fastpath patch.  It no
> longer treats ->begin=3D=3D0 as special.  The reason that this is 32-bit
> specific is that at 1000HZ, a 32-bit counter wraps every 50 days or so,
> which is well within the range of possible uptimes.  Wrapping for 64-bit
> counter takes way longer.
>
> > If not, I wonder if the 32-bit stuff can stay with the locked variant
> > and the 64-bit can get a lockless fast path which issues 8-byte
> > cmpxchg on the event count + (to be introduced) sequence counter.
> >
> > I think that would be significantly easier to reason about as it would
> > guarantee no changes are made if someone is reconfiguring the struct,
> > while providing the same win from single-threaded standpoint.
> >
> > I think you know what you mean, but just in case here is a pseudocode
> > draft of the fast path:
> >
> > #define RATELIMIT_NEED_INIT BIT(31)
> > #define RATELIMIT_IN_FLUX BIT(0)
> >
> > struct ratelimit_state_change {
> >         int             events_left;
> >         unsigned int    seq;
> > };
> >
> > struct ratelimit_state {
> >         raw_spinlock_t  lock;
> >
> >         int             interval;
> >         int             burst;
> >         int             missed;
> >         struct ratelimit_state_change rsc;
> >         unsigned long   begin;
> > };
> >
> > seq =3D READ_ONCE(rs->rsc.seq);
> > smp_rmb();
> > if (seq & (RATELIMIT_NEED_INIT | RATELIMIT_IN_FLUX))
> >         goto bad;
> > begin =3D READ_ONCE(rs->begin);
> > burst =3D READ_ONCE(rs->burst);
> > interval =3D READ_ONCE(rs->interval);
> > events_left =3D READ_ONCE(rs->rsc.events_left;
> > smp_rmb();
> > /* checks if we can cmpxchg go here */
> > ....
> > /* now the work */
> > struct ratelimit_state_change new =3D {
> >         .events_left =3D events_left - 1;
> >         .seq =3D seq;
> > }
> > if (try_cmpxchg64_relaxed(&rs->rsc, ......)) {
> >         return true; /* succeeded */
> > }
> > /* ... retry based on what we got, most likely only ->events_left has c=
hanged */
> >
> > On the stock kernel the struct is 32 bytes. I'm combining flags and
> > the new seq field to avoid growing it.
> >
> > This does cut down on available seq size, but it should be plenty as
> > is. This also means the slowpath will have to be careful to not
> > blindly ++ it to not walk into flags, but I think that's easier to
> > handle that races. ;)
>
> In theory, something sort of like this that used a 16-byte cmpxchg
> and packed the ->begin, ->rs_n_left, and ->flags fields together could
> simplify this quite a bit.  But not every system has a 16-byte cmpxchg
> on the on hand and packing into 8 bytes (let alone a 32-bit system's 4
> bytes) would require painful tradeoffs.  But in practice...
>

well cmpxchg16b has atrocious performance and I would not recommend ;)

> > That said this is merely a suggestion, I'm not going to push for it.
> >
> > I recognize this swaps atomic_dec into an cmpxchg loop which in
> > principle will have worse throughput in face of multiple CPUs messing
> > with it. However, the fast path in both your and my variant issues
> > loads prior to the atomic op which already do most of the damage, so I
> > don't think this bit matters that much.
>
> ...as you say, the full-load throughput of cmpxchg() is lacking compared
> to that of atomic_dec_return().  And large systems might have serious
> ___ratelimit() call rates.  Worse yet, the forward-progress properties
> of cmpxchg() are lacking compared to those of atomic_dec_return(), so I
> am not at all sold on this packing approach, even for systems providing
> 16-byte cmpxchg operations.
>

Well in my proposal this is 8-byte cmpxchg, not 16 with the sequence
counter validating the rest of the state has not changed.

> Yes, if a given ratelimit_state structure is mostly throttling, the
> load-only fastpath is there, but the quadratic overload behavior of
> cmpxchg() would apply during the non-throttling phases.
>

It is indeed non-ideal, but if you really need good perf here, then I
would argue literally just one instance of the counter is already bad.

> Never say never, of course, but we would need to see real issues
> with the atomic_dec_return() approach before it would make sense
> to take on the packing approach.
>

I claim my proposal is simpler to reason about as you get an invariant
nobody changes the event count from under you and they always operate
on a fully populated state.

All that said, this was a suggestion on the side which requires work
to implement.

On the other hand your variant is already written and I'm by no means
trying to block it. I am not in position to ACK it either and afaics
ratelimit is virtually unmaintained anyway. I guess it's your call
what to do with it.
