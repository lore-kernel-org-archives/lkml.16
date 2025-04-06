Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CA9190485
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743961314; cv=none; b=LEbX3ImGVC2Fsxj+0bVBd5wLxuHkZR+GTIMTP2yRMNffKNPPe2X+hQBlfcWpIODMTXt58x9GUBfCnVV5x5vWxx903b5+ZIxgp7nfNOBK9D08NXNr2CJKX2uSqGJ6HglkWX0vjFNSeF0By0Z12r/0itnwRp+5PWJUyTb3F7+7okU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743961314; c=relaxed/simple;
	bh=X/QK5fDN95QRpFJU/rBHoLH4Aat3KOxQBSSe28ONzg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUClG0bZIqAoF1KFC4nA7YwzEmHO4XgkoHvw7aWGZSmi3Owb0vV+DU/nbhsiOAI25Idt6WJA6kf6RyevOSxmd+rwCnvV0SAYHNmG20CAtURvXFslR4sniOdz9tJpMdilmL6VPOLJ2C+5OklQKlnKB10XpTdID8tJav5AR3FYlKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHACnTfP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHACnTfP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9615C4CEE3;
	Sun,  6 Apr 2025 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743961312;
	bh=X/QK5fDN95QRpFJU/rBHoLH4Aat3KOxQBSSe28ONzg4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ZHACnTfPyMK80+uQwQzuOph+iq4ZMKro/AUZhafIj7VSrGGeNO1q9RBrVCOHOLnZP
	 Crg/C6RGiE061tgsnoYmtUlOnN/l8XM6vonO6JXnW3kUmRXSYwMCO+/CsTJWJ6EI4b
	 PjG6ScRCn/iCUXmWm9SIgyCgM/dhm7xJ2P/CdgcmSQHWiV+Ch6qy6Da3OYfbUih6kA
	 Bt8yeYLAQSZBEZ1cD1hBn+q5zvt/jZXWqKJ738LpyEbv34fmebJlcrYySgJzI7duhy
	 Vz+Ex4i56eD7XO9dBSI7lMr3/447sxPGC7fgfv60fGprliZ9giYurOAhUmD6OUxDW2
	 mJI56xsdsAcAw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7480BCE0841; Sun,  6 Apr 2025 10:41:52 -0700 (PDT)
Date: Sun, 6 Apr 2025 10:41:52 -0700
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
Message-ID: <276d81e0-3867-471a-8e99-b7582378dd64@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <20250403211514.985900-8-paulmck@kernel.org>
 <CAGudoHF5H0NhCu-mCjtd1SGRc5P=8X7jmTaP9k12zZixX1-9LA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHF5H0NhCu-mCjtd1SGRc5P=8X7jmTaP9k12zZixX1-9LA@mail.gmail.com>

On Sat, Apr 05, 2025 at 11:17:00AM +0200, Mateusz Guzik wrote:
> On Thu, Apr 3, 2025 at 11:15 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > The current ratelimit implementation can suffer from false-positive
> > misses.  That is, ___ratelimit() might return zero (causing the caller
> > to invoke rate limiting, for example, by dropping printk()s) even when
> > the current burst has not yet been consumed.  This happens when one CPU
> > holds a given ratelimit structure's lock and some other CPU concurrently
> > invokes ___ratelimit().  The fact that the lock is a raw irq-disabled
> > spinlock might make low-contention trylock failure seem unlikely, but
> > vCPU preemption, NMIs, and firmware interrupts can greatly extend the
> > trylock-failure window.
> >
> > Avoiding these false-positive misses is especially important when
> > correlating console logged hardware failures with other information.
> >
> > Therefore, instead of attempting to acquire the lock on each call to
> > ___ratelimit(), construct a lockless fastpath and only acquire the lock
> > when retriggering (for the next burst) or when resynchronizing (due to
> > either a long idle period or due to ratelimiting having been disabled).
> > This reduces the number of lock-hold periods that can be extended
> > by vCPU preemption, NMIs and firmware interrupts, but also means that
> > these extensions must be of much longer durations (generally moving from
> > milliseconds to seconds) before they can result in false-positive drops.
> >
> > In addition, the lockless fastpath gets a 10-20% speedup compared to
> > the old fully locked code on my x86 laptop.  Your mileage will of course
> > vary depending on your hardware, workload, and configuration.

Thank you for digging into this!!!

> First a nit: the func returns an int with 1 or 0, perhaps one extra
> patch to make it bool can be squeezed in here?

I can do that.  Patch below.

> One of the previous patches fixes a bug on 32-bit archs.
> 
> Maybe it will sound silly, but my suggestion below hinges on it: is
> this patchset written with 32-bit kernels in mind?

Yes, that bug fix is reflected in the lockless-fastpath patch.  It no
longer treats ->begin==0 as special.  The reason that this is 32-bit
specific is that at 1000HZ, a 32-bit counter wraps every 50 days or so,
which is well within the range of possible uptimes.  Wrapping for 64-bit
counter takes way longer.

> If not, I wonder if the 32-bit stuff can stay with the locked variant
> and the 64-bit can get a lockless fast path which issues 8-byte
> cmpxchg on the event count + (to be introduced) sequence counter.
> 
> I think that would be significantly easier to reason about as it would
> guarantee no changes are made if someone is reconfiguring the struct,
> while providing the same win from single-threaded standpoint.
> 
> I think you know what you mean, but just in case here is a pseudocode
> draft of the fast path:
> 
> #define RATELIMIT_NEED_INIT BIT(31)
> #define RATELIMIT_IN_FLUX BIT(0)
> 
> struct ratelimit_state_change {
>         int             events_left;
>         unsigned int    seq;
> };
> 
> struct ratelimit_state {
>         raw_spinlock_t  lock;
> 
>         int             interval;
>         int             burst;
>         int             missed;
>         struct ratelimit_state_change rsc;
>         unsigned long   begin;
> };
> 
> seq = READ_ONCE(rs->rsc.seq);
> smp_rmb();
> if (seq & (RATELIMIT_NEED_INIT | RATELIMIT_IN_FLUX))
>         goto bad;
> begin = READ_ONCE(rs->begin);
> burst = READ_ONCE(rs->burst);
> interval = READ_ONCE(rs->interval);
> events_left = READ_ONCE(rs->rsc.events_left;
> smp_rmb();
> /* checks if we can cmpxchg go here */
> ....
> /* now the work */
> struct ratelimit_state_change new = {
>         .events_left = events_left - 1;
>         .seq = seq;
> }
> if (try_cmpxchg64_relaxed(&rs->rsc, ......)) {
>         return true; /* succeeded */
> }
> /* ... retry based on what we got, most likely only ->events_left has changed */
> 
> On the stock kernel the struct is 32 bytes. I'm combining flags and
> the new seq field to avoid growing it.
> 
> This does cut down on available seq size, but it should be plenty as
> is. This also means the slowpath will have to be careful to not
> blindly ++ it to not walk into flags, but I think that's easier to
> handle that races. ;)

In theory, something sort of like this that used a 16-byte cmpxchg
and packed the ->begin, ->rs_n_left, and ->flags fields together could
simplify this quite a bit.  But not every system has a 16-byte cmpxchg
on the on hand and packing into 8 bytes (let alone a 32-bit system's 4
bytes) would require painful tradeoffs.  But in practice...

> That said this is merely a suggestion, I'm not going to push for it.
> 
> I recognize this swaps atomic_dec into an cmpxchg loop which in
> principle will have worse throughput in face of multiple CPUs messing
> with it. However, the fast path in both your and my variant issues
> loads prior to the atomic op which already do most of the damage, so I
> don't think this bit matters that much.

...as you say, the full-load throughput of cmpxchg() is lacking compared
to that of atomic_dec_return().  And large systems might have serious
___ratelimit() call rates.  Worse yet, the forward-progress properties
of cmpxchg() are lacking compared to those of atomic_dec_return(), so I
am not at all sold on this packing approach, even for systems providing
16-byte cmpxchg operations.

Yes, if a given ratelimit_state structure is mostly throttling, the
load-only fastpath is there, but the quadratic overload behavior of
cmpxchg() would apply during the non-throttling phases.

Never say never, of course, but we would need to see real issues
with the atomic_dec_return() approach before it would make sense
to take on the packing approach.

						Thanx, Paul

> -- 
> Mateusz Guzik <mjguzik gmail.com>

------------------------------------------------------------------------

diff --git a/include/linux/ratelimit_types.h b/include/linux/ratelimit_types.h
index 2f38345ffc1a5..633f154a1e2eb 100644
--- a/include/linux/ratelimit_types.h
+++ b/include/linux/ratelimit_types.h
@@ -43,7 +43,7 @@ struct ratelimit_state {
 	struct ratelimit_state name =					\
 		RATELIMIT_STATE_INIT(name, interval_init, burst_init)	\
 
-extern int ___ratelimit(struct ratelimit_state *rs, const char *func);
+extern bool ___ratelimit(struct ratelimit_state *rs, const char *func);
 #define __ratelimit(state) ___ratelimit(state, __func__)
 
 #endif /* _LINUX_RATELIMIT_TYPES_H */
diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 03704c6f8899e..a1d69c0cdcb39 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -24,7 +24,7 @@
  * 0 means callbacks will be suppressed.
  * 1 means go ahead and do it.
  */
-int ___ratelimit(struct ratelimit_state *rs, const char *func)
+bool ___ratelimit(struct ratelimit_state *rs, const char *func)
 {
 	unsigned long begin;
 	int burst = READ_ONCE(rs->burst);
