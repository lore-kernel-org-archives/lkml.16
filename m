Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD82E62AF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714917; cv=none; b=dMWMR8/IS22f6EFaGJ3WPjfWScYeJ8PFpZX41ZXmg48/gFNZs/6YDQvjDRSEM0XZz5Ik3DrMcJOAgEITFT8ec6J19GPylHU0N6wVhh6k8Z2drDIdqcw4Z5tX1VSqUSn46AW2uZUiW7YhH3k/FBA8VNoVi8SmJ/lt36iiNUaAt1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714917; c=relaxed/simple;
	bh=1FtdMy1Rhueyewfbz8XN7kT54xjPMjuYv3eXlpH+hqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rzVq50oMngpGZ7FryaIdUKDOTp5bDGXm2R7vjcTdd1sbow40YDuiZiZfzlIdABobUoTfuxxwy7uGAVA8cCmExhafuar3OKHPKWj5JBa7Kl+1wwBy7M5BikP7ijXRkevA7A2lEiMan95I2S5E4fn4PyjeUNsUDo4ezwvo4R4swbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sl5TeAHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sl5TeAHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493BFC4AF0B;
	Thu,  3 Apr 2025 21:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743714917;
	bh=1FtdMy1Rhueyewfbz8XN7kT54xjPMjuYv3eXlpH+hqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sl5TeAHDmlIUwDvrQjdEjJRbdAAcD3gsD8afr9hunxvUf1nHqiyozI4c+KJdaiWIZ
	 wgY6tQi207PVfM3X8+t5jErKCQmZUGI+aEQfiS0j8rgNh1yWxBOLBmJD6jK6sW05/V
	 NcozV7+gLaAEneEyPJFeya1R4naDy07EAmsX1c3dhqg2YSxD8NIC18Je9t5Pq8rVO2
	 P/Nz2M5gT7znWY4nbhi/enJc52gNHDi5nT2IdWDUh2VbxHnlo2esAsuI2lEF9k2zBT
	 5Gt1n7bPT33tvOdk19vxsMQecnsNpS70hOmI2kA4unmKNnh7dt3GZ+wLjw6VH10rh/
	 BNeHXYK1kexrg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A875ECE0FFA; Thu,  3 Apr 2025 14:15:15 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: [PATCH RFC 8/9] ratelimit: Reduce ratelimit's false-positive misses
Date: Thu,  3 Apr 2025 14:15:13 -0700
Message-Id: <20250403211514.985900-8-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current ratelimit implementation can suffer from false-positive
misses.  That is, ___ratelimit() might return zero (causing the caller
to invoke rate limiting, for example, by dropping printk()s) even when
the current burst has not yet been consumed.  This happens when one CPU
holds a given ratelimit structure's lock and some other CPU concurrently
invokes ___ratelimit().  The fact that the lock is a raw irq-disabled
spinlock might make low-contention trylock failure seem unlikely, but
vCPU preemption, NMIs, and firmware interrupts can greatly extend the
trylock-failure window.

Avoiding these false-positive misses is especially important when
correlating console logged hardware failures with other information.

Therefore, instead of attempting to acquire the lock on each call to
___ratelimit(), construct a lockless fastpath and only acquire the lock
when retriggering (for the next burst) or when resynchronizing (due to
either a long idle period or due to ratelimiting having been disabled).
This reduces the number of lock-hold periods that can be extended
by vCPU preemption, NMIs and firmware interrupts, but also means that
these extensions must be of much longer durations (generally moving from
milliseconds to seconds) before they can result in false-positive drops.

In addition, the lockless fastpath gets a 10-20% speedup compared to
the old fully locked code on my x86 laptop.  Your mileage will of course
vary depending on your hardware, workload, and configuration.

[ paulmck: Apply feedback from Dan Carpenter. ]

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jon Pan-Doh <pandoh@google.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Karolina Stolarek <karolina.stolarek@oracle.com>
---
 include/linux/ratelimit.h       |   2 +-
 include/linux/ratelimit_types.h |   3 +-
 lib/ratelimit.c                 | 176 +++++++++++++++++++++++++-------
 3 files changed, 144 insertions(+), 37 deletions(-)

diff --git a/include/linux/ratelimit.h b/include/linux/ratelimit.h
index adfec24061d16..7aaad158ee373 100644
--- a/include/linux/ratelimit.h
+++ b/include/linux/ratelimit.h
@@ -44,7 +44,7 @@ static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, in
 	raw_spin_lock_irqsave(&rs->lock, flags);
 	rs->interval = interval_init;
 	rs->flags &= ~RATELIMIT_INITIALIZED;
-	rs->printed = 0;
+	atomic_set(&rs->rs_n_left, rs->burst);
 	ratelimit_state_reset_miss(rs);
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
 }
diff --git a/include/linux/ratelimit_types.h b/include/linux/ratelimit_types.h
index ef6711b6b229f..2f38345ffc1a5 100644
--- a/include/linux/ratelimit_types.h
+++ b/include/linux/ratelimit_types.h
@@ -18,7 +18,7 @@ struct ratelimit_state {
 
 	int		interval;
 	int		burst;
-	int		printed;
+	atomic_t	rs_n_left;
 	atomic_t	missed;
 	unsigned int	flags;
 	unsigned long	begin;
@@ -28,6 +28,7 @@ struct ratelimit_state {
 		.lock		= __RAW_SPIN_LOCK_UNLOCKED(name.lock),		  \
 		.interval	= interval_init,				  \
 		.burst		= burst_init,					  \
+		.rs_n_left	= ATOMIC_INIT(burst_init),			  \
 		.flags		= flags_init,					  \
 	}
 
diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index bd6e3b429e333..03704c6f8899e 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -26,55 +26,161 @@
  */
 int ___ratelimit(struct ratelimit_state *rs, const char *func)
 {
-	/* Paired with WRITE_ONCE() in .proc_handler().
-	 * Changing two values seperately could be inconsistent
-	 * and some message could be lost.  (See: net_ratelimit_state).
-	 */
-	int interval = READ_ONCE(rs->interval);
+	unsigned long begin;
 	int burst = READ_ONCE(rs->burst);
+	int delta = 0;
 	unsigned long flags;
-	int ret;
-
-	if (!interval)
-		return 1;
+	bool gotlock = false;
+	bool initialized;
+	int interval = READ_ONCE(rs->interval);
+	unsigned long j;
+	int n_left;
 
 	/*
-	 * If we contend on this state's lock then almost
-	 * by definition we are too busy to print a message,
-	 * in addition to the one that will be printed by
-	 * the entity that is holding the lock already:
+	 * If the burst or interval settings mark this ratelimit_state
+	 * structure as disabled, then clear the RATELIMIT_INITIALIZED bit
+	 * in ->flags to force resetting of the ratelimiting interval when
+	 * this ratelimit_state structure is next re-enabled.
 	 */
-	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
-		ratelimit_state_inc_miss(rs);
-		return 0;
+	if (burst <= 0 || interval <= 0) {
+		if ((READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) &&
+		    raw_spin_trylock_irqsave(&rs->lock, flags)) {
+			if (READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED)
+				smp_store_release(&rs->flags, rs->flags & ~RATELIMIT_INITIALIZED);
+			raw_spin_unlock_irqrestore(&rs->lock, flags);
+		}
+		return true;
 	}
 
-	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
-		rs->begin = jiffies;
-		rs->flags |= RATELIMIT_INITIALIZED;
+	/*
+	 * If this structure has just now been ratelimited, but not yet
+	 * reset for the next rate-limiting interval, take an early and
+	 * low-cost exit.
+	 */
+	if (atomic_read_acquire(&rs->rs_n_left) <= 0) /* Pair with release. */
+		goto limited;
+
+	/*
+	 * If this structure is marked as initialized and has been
+	 * recently used, pick up its ->begin field.  Otherwise, pick up
+	 * the current time and attempt to re-initialized the structure.
+	 */
+	j = jiffies;
+	initialized = smp_load_acquire(&rs->flags) & RATELIMIT_INITIALIZED; /* Pair with release. */
+	if (initialized) {
+		begin = READ_ONCE(rs->begin);
+	} else {
+		/*
+		 * Uninitialized or long idle, so reset ->begin and
+		 * mark initialized.  If we fail to acquire the lock,
+		 * let the lock holder do the work.
+		 */
+		begin = j;
+		if (raw_spin_trylock_irqsave(&rs->lock, flags)) {
+			if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED)) {
+				begin = jiffies;
+				j = begin;
+				WRITE_ONCE(rs->begin, begin);
+				smp_store_release(&rs->flags, /* Pair with acquire. */
+						  rs->flags | RATELIMIT_INITIALIZED);
+				initialized = true;
+			}
+			raw_spin_unlock_irqrestore(&rs->lock, flags);
+		}
 	}
 
-	if (time_is_before_jiffies(rs->begin + interval)) {
-		int m = ratelimit_state_reset_miss(rs);
+	/*
+	 * If this structure is still in the interval in which has
+	 * already hit the rate limit, take an early and low-cost exit.
+	 */
+	if (initialized && time_before(begin - 2 * interval, j) && time_before(j, begin))
+		goto limited;
 
-		if (m) {
-			if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
-				printk_deferred(KERN_WARNING
-						"%s: %d callbacks suppressed\n", func, m);
-			}
+	/*
+	 * Register another request, and take an early (but not low-cost)
+	 * exit if rate-limiting just nowcame into effect.
+	 */
+	n_left = atomic_dec_return(&rs->rs_n_left);
+	if (n_left < 0)
+		goto limited; /* Just now started ratelimiting. */
+	if (n_left > 0) {
+		/*
+		 * Otherwise, there is not yet any rate limiting for the
+		 * current interval, and furthermore there is at least one
+		 * last count remaining.  But check to see if initialization
+		 * is required or if we have run off the end of the interval
+		 * without rate limiting having been imposed.  Either way,
+		 * we eventually return @true to tell our caller to go ahead.
+		 */
+		if (initialized &&
+		    time_before(begin - interval, j) && time_before(j, begin + interval))
+			return true;  /* Nothing special to do. */
+		if (!raw_spin_trylock_irqsave(&rs->lock, flags))
+			return true; /* Let lock holder do special work. */
+		interval = READ_ONCE(rs->interval);
+		begin = rs->begin;
+		initialized = smp_load_acquire(&rs->flags) & RATELIMIT_INITIALIZED;
+		if (interval <= 0 ||
+		    (initialized &&
+		     time_before(begin - interval, j) && time_before(j, begin + interval))) {
+			/*
+			 * Someone else beat us to the special work,
+			 * so release the lock and return.
+			 */
+			raw_spin_unlock_irqrestore(&rs->lock, flags);
+			return true;
 		}
-		rs->begin   = jiffies;
-		rs->printed = 0;
+
+		/* We have the lock and will do initialization. */
+		gotlock = true;
+		delta = -1;
 	}
-	if (burst && burst > rs->printed) {
-		rs->printed++;
-		ret = 1;
-	} else {
-		ratelimit_state_inc_miss(rs);
-		ret = 0;
+	if (!gotlock) {
+		/*
+		 * We get here if we got the last count (n_left == 0),
+		 * so that rate limiting is in effect for the next caller.
+		 * We will return @true to tell our caller to go ahead,
+		 * but first we acquire the lock and set things up for
+		 * the next rate-limiting interval.
+		 */
+		raw_spin_lock_irqsave(&rs->lock, flags);
+		interval = READ_ONCE(rs->interval);
+		j = jiffies;
+		begin = rs->begin;
+		initialized = smp_load_acquire(&rs->flags) & RATELIMIT_INITIALIZED;
+	}
+	burst = READ_ONCE(rs->burst);
+	if (interval <= 0 || !initialized ||
+	    time_after(j, begin + interval) || time_after(begin - interval, j))
+		begin = j; /* Long delay, reset interval. */
+	else
+		begin += interval; /* Next interval. */
+
+	/*
+	 * If an acquire sees the value stored by either of these two
+	 * store-release operations, it will also see the value from
+	 * following store to ->begin, or from some later store.  But not
+	 * from any earlier now-obsolete earlier store to ->begin.
+	 */
+	WRITE_ONCE(rs->begin, begin);
+	atomic_set_release(&rs->rs_n_left, burst + delta); /* Pair with acquire.*/
+	smp_store_release(&rs->flags, rs->flags | RATELIMIT_INITIALIZED); /* ^^^ */
+
+	/* Print suppressed callback count if requested. */
+	if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
+		delta = ratelimit_state_reset_miss(rs);
+		if (delta)
+			printk_deferred(KERN_WARNING "%s: %d callbacks suppressed\n", func, delta);
 	}
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
+	return true;
 
-	return ret;
+limited:
+	/*
+	 * Count the number of rate-limited requests and tell the caller
+	 * that this is a no-go.
+	 */
+	ratelimit_state_inc_miss(rs);
+	return false;
 }
 EXPORT_SYMBOL(___ratelimit);
-- 
2.40.1

