Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CB1215768
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044851; cv=none; b=J/n7AKp6foyPK41qKBLZZtVbJ5g0XPgjZm+HcpzIixtOg+qmVpShhXYyjyVZPgusCbVBqsNHU/xhOlEWeF9N4taJ8Spf7kMi4bPKGNJ4ZbcNUjqk7zCm4AwNztACRQO72QTZ8/ImZAI2EV59SJHUGF3Nm/FSLt+fK49ZA5vUMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044851; c=relaxed/simple;
	bh=IqNhJB4Jxdz7ddDB4dlokfsjiKYg4XrqbMYmULaW5hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrlXDDL5d6ufARqtc/5xNJjjcxMvcRmVpepdM6aV2b0cdvB7fDVYZBvwaKWuns9A9Lr6xHqIoLyn9HB/niriPbkP/w7LiC+KxXV2Z0JzS4fM8srSn5+0VEnrVIaLkIFLacFy10nNOxpqlC4lI0cfhJKgrZuF4rK6HofTzpxm6EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwaBbWLY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwaBbWLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA38C4CEDD;
	Mon,  7 Apr 2025 16:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744044850;
	bh=IqNhJB4Jxdz7ddDB4dlokfsjiKYg4XrqbMYmULaW5hw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=CwaBbWLYQurLdrzvlkEa0pX67WUAugMPxxZHnF4hlt5UJ0uld8J8txoDFTfJwPPng
	 0dITrbcPv966x+whrxxW4FqJax/b4u9dmA3gq90ofhB/K2I61d6IrFcHXmhqUKiQNH
	 o4JB3pKxWFbP5uHI1ZvJjiDUqyb3bbvT1LuI0NszPLK/iYvWTZgg5IChV5l/0z2wlM
	 tG1lNg7RyYRHzhBJO3zP2wzEiwy38Y4XkXJqmRTE2P/+KD6xcHBbjV1ULZxAyeuZ5d
	 MpTuMckPlwOJZWDmTcpz3KnnhrqlQOX8jmVOq8KEZHmoyCjVB8m8mgcYUQSRt26rXs
	 mMWk8wqSlZYUQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7EC4ECE089F; Mon,  7 Apr 2025 09:54:10 -0700 (PDT)
Date: Mon, 7 Apr 2025 09:54:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH RFC 8/9] ratelimit: Reduce ratelimit's false-positive
 misses
Message-ID: <4a898428-127d-4c9e-bf94-91a2d9fe12e7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <20250403211514.985900-8-paulmck@kernel.org>
 <CAGudoHF5H0NhCu-mCjtd1SGRc5P=8X7jmTaP9k12zZixX1-9LA@mail.gmail.com>
 <276d81e0-3867-471a-8e99-b7582378dd64@paulmck-laptop>
 <CAGudoHFH=U4eb=t50nr55kTaamsaKHdwPeZZCtJ7JXtYYy7-KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHFH=U4eb=t50nr55kTaamsaKHdwPeZZCtJ7JXtYYy7-KQ@mail.gmail.com>

On Mon, Apr 07, 2025 at 02:07:38AM +0200, Mateusz Guzik wrote:
> On Sun, Apr 6, 2025 at 7:41 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Sat, Apr 05, 2025 at 11:17:00AM +0200, Mateusz Guzik wrote:
> > > On Thu, Apr 3, 2025 at 11:15 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > >
> > > > The current ratelimit implementation can suffer from false-positive
> > > > misses.  That is, ___ratelimit() might return zero (causing the caller
> > > > to invoke rate limiting, for example, by dropping printk()s) even when
> > > > the current burst has not yet been consumed.  This happens when one CPU
> > > > holds a given ratelimit structure's lock and some other CPU concurrently
> > > > invokes ___ratelimit().  The fact that the lock is a raw irq-disabled
> > > > spinlock might make low-contention trylock failure seem unlikely, but
> > > > vCPU preemption, NMIs, and firmware interrupts can greatly extend the
> > > > trylock-failure window.
> > > >
> > > > Avoiding these false-positive misses is especially important when
> > > > correlating console logged hardware failures with other information.
> > > >
> > > > Therefore, instead of attempting to acquire the lock on each call to
> > > > ___ratelimit(), construct a lockless fastpath and only acquire the lock
> > > > when retriggering (for the next burst) or when resynchronizing (due to
> > > > either a long idle period or due to ratelimiting having been disabled).
> > > > This reduces the number of lock-hold periods that can be extended
> > > > by vCPU preemption, NMIs and firmware interrupts, but also means that
> > > > these extensions must be of much longer durations (generally moving from
> > > > milliseconds to seconds) before they can result in false-positive drops.
> > > >
> > > > In addition, the lockless fastpath gets a 10-20% speedup compared to
> > > > the old fully locked code on my x86 laptop.  Your mileage will of course
> > > > vary depending on your hardware, workload, and configuration.
> >
> > Thank you for digging into this!!!
> >
> > > First a nit: the func returns an int with 1 or 0, perhaps one extra
> > > patch to make it bool can be squeezed in here?
> >
> > I can do that.  Patch below.
> >
> 
> thanks
> 
> > > One of the previous patches fixes a bug on 32-bit archs.
> > >
> > > Maybe it will sound silly, but my suggestion below hinges on it: is
> > > this patchset written with 32-bit kernels in mind?
> >
> > Yes, that bug fix is reflected in the lockless-fastpath patch.  It no
> > longer treats ->begin==0 as special.  The reason that this is 32-bit
> > specific is that at 1000HZ, a 32-bit counter wraps every 50 days or so,
> > which is well within the range of possible uptimes.  Wrapping for 64-bit
> > counter takes way longer.
> >
> > > If not, I wonder if the 32-bit stuff can stay with the locked variant
> > > and the 64-bit can get a lockless fast path which issues 8-byte
> > > cmpxchg on the event count + (to be introduced) sequence counter.
> > >
> > > I think that would be significantly easier to reason about as it would
> > > guarantee no changes are made if someone is reconfiguring the struct,
> > > while providing the same win from single-threaded standpoint.
> > >
> > > I think you know what you mean, but just in case here is a pseudocode
> > > draft of the fast path:
> > >
> > > #define RATELIMIT_NEED_INIT BIT(31)
> > > #define RATELIMIT_IN_FLUX BIT(0)
> > >
> > > struct ratelimit_state_change {
> > >         int             events_left;
> > >         unsigned int    seq;
> > > };
> > >
> > > struct ratelimit_state {
> > >         raw_spinlock_t  lock;
> > >
> > >         int             interval;
> > >         int             burst;
> > >         int             missed;
> > >         struct ratelimit_state_change rsc;
> > >         unsigned long   begin;
> > > };
> > >
> > > seq = READ_ONCE(rs->rsc.seq);
> > > smp_rmb();
> > > if (seq & (RATELIMIT_NEED_INIT | RATELIMIT_IN_FLUX))
> > >         goto bad;
> > > begin = READ_ONCE(rs->begin);
> > > burst = READ_ONCE(rs->burst);
> > > interval = READ_ONCE(rs->interval);
> > > events_left = READ_ONCE(rs->rsc.events_left;
> > > smp_rmb();
> > > /* checks if we can cmpxchg go here */
> > > ....
> > > /* now the work */
> > > struct ratelimit_state_change new = {
> > >         .events_left = events_left - 1;
> > >         .seq = seq;
> > > }
> > > if (try_cmpxchg64_relaxed(&rs->rsc, ......)) {
> > >         return true; /* succeeded */
> > > }
> > > /* ... retry based on what we got, most likely only ->events_left has changed */
> > >
> > > On the stock kernel the struct is 32 bytes. I'm combining flags and
> > > the new seq field to avoid growing it.
> > >
> > > This does cut down on available seq size, but it should be plenty as
> > > is. This also means the slowpath will have to be careful to not
> > > blindly ++ it to not walk into flags, but I think that's easier to
> > > handle that races. ;)
> >
> > In theory, something sort of like this that used a 16-byte cmpxchg
> > and packed the ->begin, ->rs_n_left, and ->flags fields together could
> > simplify this quite a bit.  But not every system has a 16-byte cmpxchg
> > on the on hand and packing into 8 bytes (let alone a 32-bit system's 4
> > bytes) would require painful tradeoffs.  But in practice...
> 
> well cmpxchg16b has atrocious performance and I would not recommend ;)

Atrocious even compared to a spinlock round trip?

> > > That said this is merely a suggestion, I'm not going to push for it.
> > >
> > > I recognize this swaps atomic_dec into an cmpxchg loop which in
> > > principle will have worse throughput in face of multiple CPUs messing
> > > with it. However, the fast path in both your and my variant issues
> > > loads prior to the atomic op which already do most of the damage, so I
> > > don't think this bit matters that much.
> >
> > ...as you say, the full-load throughput of cmpxchg() is lacking compared
> > to that of atomic_dec_return().  And large systems might have serious
> > ___ratelimit() call rates.  Worse yet, the forward-progress properties
> > of cmpxchg() are lacking compared to those of atomic_dec_return(), so I
> > am not at all sold on this packing approach, even for systems providing
> > 16-byte cmpxchg operations.
> 
> Well in my proposal this is 8-byte cmpxchg, not 16 with the sequence
> counter validating the rest of the state has not changed.

Let me make sure that I understand what you are proposing.

Is the idea is to identify the kthread that will reset for the next
interval?  Or to avoid a race where a kthread tests ->rs_n_left before
such a reset, but does its atomic_dec_return() after that same reset?

Or am I missing your point completely?  ;-)

> > Yes, if a given ratelimit_state structure is mostly throttling, the
> > load-only fastpath is there, but the quadratic overload behavior of
> > cmpxchg() would apply during the non-throttling phases.
> 
> It is indeed non-ideal, but if you really need good perf here, then I
> would argue literally just one instance of the counter is already bad.

I do not believe that we need great performance, but it would be good to
avoid quadratic overhead on systems with hundreds (let alone thousands)
of CPUs.

> > Never say never, of course, but we would need to see real issues
> > with the atomic_dec_return() approach before it would make sense
> > to take on the packing approach.
> 
> I claim my proposal is simpler to reason about as you get an invariant
> nobody changes the event count from under you and they always operate
> on a fully populated state.

Me, I was being satified with the throttling being exact in the long
term and being almost always exact on a per-interval basis.  ;-)

> All that said, this was a suggestion on the side which requires work
> to implement.
> 
> On the other hand your variant is already written and I'm by no means
> trying to block it. I am not in position to ACK it either and afaics
> ratelimit is virtually unmaintained anyway. I guess it's your call
> what to do with it.

Again, thank you for looking this over!

You have given me several ideas for improvement, including your cmpxchg()
approach to guarantee exact per-interval throttling (if that was your
intent), my cmpxchg16b() to go completely lockless with that same
guarantee, and a combination of atomic_dec_return() and cmpxchg16b() to
go completely lockless with linear (instead of quadratic) cmpxchg16b()
performance and long-term exact throttling.

Can't argue with that!  ;-)

							Thanx, Paul
