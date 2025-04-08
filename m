Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F4C22D4E3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744130474; cv=none; b=uRb0he76C0iqMVaK1Pji5JwpbLYhp2XGfetlO9Vo+zoGq8m9zcEYWufz+MxnDvqKadbG5Qnf+7NztlnYuG8fUvyyo4/za6O2ktUbBu67LnhFfrSQj9rtDjAQQElYdnfiOq175hEQke1tGH9hmPSYiV0V7mGrFu22MKf/yo+str8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744130474; c=relaxed/simple;
	bh=8GTsUuR5AuQXH0AeK0Wg4LupmHkbhYOYHwFP1cF/PL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfYe+vXcu5OYBk6uXAApOgOjV0DgoI2CzvH5YnFKquf4Sfhx+TppknIsbyoxxq+XgGRd370zdfvNBhY5da+NLR+Gt7MW9/4uG5ompDts8G5Sf5PW/VWweaqTpSp4QYyQI2tolay1up10v4rtL0ML32rtGfBs1CHFGBKdDrtzb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Nv9973Nm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Nv9973Nm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso63157655e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744130470; x=1744735270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=exFWCD3ECrAXFTEQjtfYiiVI7jtVWVWSaY1VfaCOL48=;
        b=Nv9973NmfRUIQ3mUJUDAII0kxnLAz9zNCIJFTAz3dveqUItEpfziBbeRnYERabf2O/
         NRF2wCksvYvNhp0FyA86RMYi62PysfHtfLH2tb0GCE08BcJcVJwSoySOeZhkYBMqEobe
         OG9t5lZAaocRrqIHHh+Q1cv/EztVN8TGMWyiy33GbmOfapc9mLGp701hNy1QsBtoLg3Y
         jfN0+1xouUYEvt4ONyMORubzRlwBHkBqwLYsjmWyH5QrkND2aW5TRA7Dva5RxPNHHvVD
         nM5o58FGSJo9bEUrWiAENJ1JEOLh7VpVqSorlKXJgzX9JPRvEymksvUUQz6TpYl4GIPh
         Ydjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744130470; x=1744735270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exFWCD3ECrAXFTEQjtfYiiVI7jtVWVWSaY1VfaCOL48=;
        b=fDriCG3IpAXRSQupd3Z97BvGAX0+dieQurSpeFN/j6w/CsL8uYjkzJYW+9WudnLpE7
         L85GQGPsee5NEuSTr9MMBU2MKHSIJoch5SJbGYkBwQevEynCW6F+IIGC6/qTYN9TtaXh
         RQvsTZEF+bAt21kjzEroQ9j8qF0KHFosuIuY3rrzE0tniXALK4PCY9z21q4Um+hKJQmK
         UmtazDZnoxc4jRG2mQUmNYRSL2KjhpGm+6gpi88AMYGyU+yIL8i5h7pRypz8dUSJ4UCA
         CDQzkkbD1YPwjTJSlY9s9N+5WYPaI+25JYfi5p2jqgHRxezH5EZZkACddaNk17bKMgn6
         aPWA==
X-Gm-Message-State: AOJu0Yy2bEpgrXg15w21QwBc6ve6rYiWXhqn9WCjNPBrRA2FlleO7ETw
	HnheTpoq0E2iIqLkZkwyHyyorb3CafxhmVuxjN7x5B4LM62xq1OEzAefJnEdXwk=
X-Gm-Gg: ASbGncvZdoL6dWvIz/sH2bKVYWkSUFutUOHq+Hg9fJaHr3mAtPvEPT1DdT5vck9QF9H
	cXbsW/VKwV4F9WQ14f/wXrS3TyhHWhXwk7/w7i0i5O31+EwscZNv6DCH/UvcATJXy/huY97vJuz
	ZKs/BALX/ETaUGQvuUjVHlVpGgIFMbL747iyCoh03DbpOcjj6c789Bl7djDr+BGdQTbK/mv9fs5
	qeGuqLKLZ1KOE1Gl4tBGkqIa1vwyrWiNA3uyP+DC95t0s8VHj00Tnx5yQsLaVEtQIoXD5O0s5R1
	K8DLAx+NMtH2wneKpnTQleoIgcenxJoIzRnh0DN0ddK/0r8=
X-Google-Smtp-Source: AGHT+IFzbxegi+eRQHmC+2WqnvZKFoXdtGQuJMJvPuAvDsDwj0qZrHpuWnK6FVJWkjB3yVkh9JOsEA==
X-Received: by 2002:a05:600c:4688:b0:43c:fee3:2bce with SMTP id 5b1f17b1804b1-43ed0d6abc4mr147595815e9.26.1744130469584;
        Tue, 08 Apr 2025 09:41:09 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663053sm168683665e9.15.2025.04.08.09.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:41:09 -0700 (PDT)
Date: Tue, 8 Apr 2025 18:41:07 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH RFC 8/9] ratelimit: Reduce ratelimit's false-positive
 misses
Message-ID: <Z_VRo63o2UsVoxLG@pathway.suse.cz>
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <20250403211514.985900-8-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403211514.985900-8-paulmck@kernel.org>

On Thu 2025-04-03 14:15:13, Paul E. McKenney wrote:
> The current ratelimit implementation can suffer from false-positive
> misses.  That is, ___ratelimit() might return zero (causing the caller
> to invoke rate limiting, for example, by dropping printk()s) even when
> the current burst has not yet been consumed.  This happens when one CPU
> holds a given ratelimit structure's lock and some other CPU concurrently
> invokes ___ratelimit().  The fact that the lock is a raw irq-disabled
> spinlock might make low-contention trylock failure seem unlikely, but
> vCPU preemption, NMIs, and firmware interrupts can greatly extend the
> trylock-failure window.
> 
> Avoiding these false-positive misses is especially important when
> correlating console logged hardware failures with other information.
> 
> Therefore, instead of attempting to acquire the lock on each call to
> ___ratelimit(), construct a lockless fastpath and only acquire the lock
> when retriggering (for the next burst) or when resynchronizing (due to
> either a long idle period or due to ratelimiting having been disabled).
> This reduces the number of lock-hold periods that can be extended
> by vCPU preemption, NMIs and firmware interrupts, but also means that
> these extensions must be of much longer durations (generally moving from
> milliseconds to seconds) before they can result in false-positive drops.
> 
> In addition, the lockless fastpath gets a 10-20% speedup compared to
> the old fully locked code on my x86 laptop.  Your mileage will of course
> vary depending on your hardware, workload, and configuration.
> 
> [ paulmck: Apply feedback from Dan Carpenter. ]
> 
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index bd6e3b429e333..03704c6f8899e 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -26,55 +26,161 @@
>   */
>  int ___ratelimit(struct ratelimit_state *rs, const char *func)
>  {
> -	/* Paired with WRITE_ONCE() in .proc_handler().
> -	 * Changing two values seperately could be inconsistent
> -	 * and some message could be lost.  (See: net_ratelimit_state).
> -	 */
> -	int interval = READ_ONCE(rs->interval);
> +	unsigned long begin;
>  	int burst = READ_ONCE(rs->burst);
> +	int delta = 0;
>  	unsigned long flags;
> -	int ret;
> -
> -	if (!interval)
> -		return 1;
> +	bool gotlock = false;
> +	bool initialized;
> +	int interval = READ_ONCE(rs->interval);
> +	unsigned long j;
> +	int n_left;
>  
>  	/*
> -	 * If we contend on this state's lock then almost
> -	 * by definition we are too busy to print a message,
> -	 * in addition to the one that will be printed by
> -	 * the entity that is holding the lock already:
> +	 * If the burst or interval settings mark this ratelimit_state
> +	 * structure as disabled, then clear the RATELIMIT_INITIALIZED bit
> +	 * in ->flags to force resetting of the ratelimiting interval when
> +	 * this ratelimit_state structure is next re-enabled.
>  	 */
> -	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
> -		ratelimit_state_inc_miss(rs);
> -		return 0;
> +	if (burst <= 0 || interval <= 0) {
> +		if ((READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) &&
> +		    raw_spin_trylock_irqsave(&rs->lock, flags)) {
> +			if (READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED)
> +				smp_store_release(&rs->flags, rs->flags & ~RATELIMIT_INITIALIZED);
> +			raw_spin_unlock_irqrestore(&rs->lock, flags);
> +		}
> +		return true;
>  	}
>  
> -	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
> -		rs->begin = jiffies;
> -		rs->flags |= RATELIMIT_INITIALIZED;
> +	/*
> +	 * If this structure has just now been ratelimited, but not yet
> +	 * reset for the next rate-limiting interval, take an early and
> +	 * low-cost exit.
> +	 */
> +	if (atomic_read_acquire(&rs->rs_n_left) <= 0) /* Pair with release. */
> +		goto limited;
> +
> +	/*
> +	 * If this structure is marked as initialized and has been
> +	 * recently used, pick up its ->begin field.  Otherwise, pick up
> +	 * the current time and attempt to re-initialized the structure.
> +	 */
> +	j = jiffies;
> +	initialized = smp_load_acquire(&rs->flags) & RATELIMIT_INITIALIZED; /* Pair with release. */
> +	if (initialized) {
> +		begin = READ_ONCE(rs->begin);
> +	} else {
> +		/*
> +		 * Uninitialized or long idle, so reset ->begin and
> +		 * mark initialized.  If we fail to acquire the lock,
> +		 * let the lock holder do the work.
> +		 */
> +		begin = j;
> +		if (raw_spin_trylock_irqsave(&rs->lock, flags)) {
> +			if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED)) {
> +				begin = jiffies;
> +				j = begin;
> +				WRITE_ONCE(rs->begin, begin);
> +				smp_store_release(&rs->flags, /* Pair with acquire. */
> +						  rs->flags | RATELIMIT_INITIALIZED);
> +				initialized = true;
> +			}
> +			raw_spin_unlock_irqrestore(&rs->lock, flags);
> +		}
>  	}
>  
> -	if (time_is_before_jiffies(rs->begin + interval)) {
> -		int m = ratelimit_state_reset_miss(rs);
> +	/*
> +	 * If this structure is still in the interval in which has
> +	 * already hit the rate limit, take an early and low-cost exit.
> +	 */
> +	if (initialized && time_before(begin - 2 * interval, j) && time_before(j, begin))

How do we know that the previous interval was ratelimited, please?
I have to admit that I still do not fully get the new logic ;-)

> +		goto limited;
>  
> -		if (m) {
> -			if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
> -				printk_deferred(KERN_WARNING
> -						"%s: %d callbacks suppressed\n", func, m);
> -			}
> +	/*
> +	 * Register another request, and take an early (but not low-cost)
> +	 * exit if rate-limiting just nowcame into effect.
> +	 */
> +	n_left = atomic_dec_return(&rs->rs_n_left);
> +	if (n_left < 0)
> +		goto limited; /* Just now started ratelimiting. */
> +	if (n_left > 0) {
> +		/*
> +		 * Otherwise, there is not yet any rate limiting for the
> +		 * current interval, and furthermore there is at least one
> +		 * last count remaining.  But check to see if initialization
> +		 * is required or if we have run off the end of the interval
> +		 * without rate limiting having been imposed.  Either way,
> +		 * we eventually return @true to tell our caller to go ahead.
> +		 */
> +		if (initialized &&
> +		    time_before(begin - interval, j) && time_before(j, begin + interval))
> +			return true;  /* Nothing special to do. */
> +		if (!raw_spin_trylock_irqsave(&rs->lock, flags))
> +			return true; /* Let lock holder do special work. */
> +		interval = READ_ONCE(rs->interval);
> +		begin = rs->begin;
> +		initialized = smp_load_acquire(&rs->flags) & RATELIMIT_INITIALIZED;
> +		if (interval <= 0 ||
> +		    (initialized &&
> +		     time_before(begin - interval, j) && time_before(j, begin + interval))) {
> +			/*
> +			 * Someone else beat us to the special work,
> +			 * so release the lock and return.
> +			 */

I am confused by the comment. IMHO, we are here when we do not need
to reset the interval. It happens either when the interval is
infinite (interval < 0) or when we are still in the currrent interval
and more calls are allowed (n_left > 0).

> +			raw_spin_unlock_irqrestore(&rs->lock, flags);
> +			return true;
>  		}
> -		rs->begin   = jiffies;
> -		rs->printed = 0;
> +
> +		/* We have the lock and will do initialization. */
> +		gotlock = true;
> +		delta = -1;
>  	}
> -	if (burst && burst > rs->printed) {
> -		rs->printed++;
> -		ret = 1;
> -	} else {
> -		ratelimit_state_inc_miss(rs);
> -		ret = 0;
> +	if (!gotlock) {
> +		/*
> +		 * We get here if we got the last count (n_left == 0),
> +		 * so that rate limiting is in effect for the next caller.
> +		 * We will return @true to tell our caller to go ahead,
> +		 * but first we acquire the lock and set things up for
> +		 * the next rate-limiting interval.
> +		 */
> +		raw_spin_lock_irqsave(&rs->lock, flags);

I do not have a good feeling about this. It could cause a deadlock
in panic() when other CPUs are stopped or in NMI. And the ratelimit
used to be "safe" in this context.

Honestly, the new code is a bit hard to follow for me. The original
logic was more strightforward. I wonder if we could reduce the problem
"just" by checking the remaining allowed count.

I mean to introduce the atomic rs_n_left and check it when
it is not possible to take the lock. But keep most of
the current logic. Something like:

From 1df6d1a79645dd5c0ad7cef7c94b802de202057e Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Tue, 8 Apr 2025 16:00:22 +0200
Subject: [PATCH 1/2] ratelimit: Reduce ratelimit's false-positive
 (alternative)

---
 include/linux/ratelimit.h       |  2 +-
 include/linux/ratelimit_types.h |  2 +-
 lib/ratelimit.c                 | 51 ++++++++++++++++++++++++---------
 3 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/include/linux/ratelimit.h b/include/linux/ratelimit.h
index adfec24061d1..7aaad158ee37 100644
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
index ef6711b6b229..b19c4354540a 100644
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
diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index bd6e3b429e33..90c9fe57eb42 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -39,12 +39,22 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		return 1;
 
 	/*
-	 * If we contend on this state's lock then almost
-	 * by definition we are too busy to print a message,
-	 * in addition to the one that will be printed by
-	 * the entity that is holding the lock already:
+	 * If we contend on this state's lock then just check if
+	 * the current burst is used or not. It might cause
+	 * false positive when we are past the interval and
+	 * the current lock owner is just about to reset it.
 	 */
 	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
+		unsigned int rs_flags = READ_ONCE(rs->flags);
+
+		if (rs_flags & RATELIMIT_INITIALIZED && burst) {
+			int n_left;
+
+			n_left = atomic_dec_return(&rs->rs_n_left);
+			if (n_left >= 0)
+				return 1;
+		}
+
 		ratelimit_state_inc_miss(rs);
 		return 0;
 	}
@@ -52,27 +62,42 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
 		rs->begin = jiffies;
 		rs->flags |= RATELIMIT_INITIALIZED;
+		atomic_set(&rs->rs_n_left, rs->burst);
 	}
 
 	if (time_is_before_jiffies(rs->begin + interval)) {
-		int m = ratelimit_state_reset_miss(rs);
+		int m;
 
+		/*
+		 * Reset rs_n_left ASAP to reduce false positives
+		 * in parallel calls, see above.
+		 */
+		atomic_set(&rs->rs_n_left, rs->burst);
+		rs->begin = jiffies;
+
+		m = ratelimit_state_reset_miss(rs);
 		if (m) {
 			if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
 				printk_deferred(KERN_WARNING
 						"%s: %d callbacks suppressed\n", func, m);
 			}
 		}
-		rs->begin   = jiffies;
-		rs->printed = 0;
 	}
-	if (burst && burst > rs->printed) {
-		rs->printed++;
-		ret = 1;
-	} else {
-		ratelimit_state_inc_miss(rs);
-		ret = 0;
+	if (burst) {
+		int n_left;
+
+		/* The burst might have been taken by a parallel call. */
+		n_left = atomic_dec_return(&rs->rs_n_left);
+		if (n_left >= 0) {
+			ret = 1;
+			goto unlock_ret;
+		}
 	}
+
+	ratelimit_state_inc_miss(rs);
+	ret = 0;
+
+unlock_ret:
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
 
 	return ret;
-- 
2.49.0

It is still racy. But I think that all versions were somehow racy.

BTW: The new selftest fails with it. There seems to be two kind of
     problems:

1. Timing. The test seems to be a bit sensitive on timing.
   It helped me to do not go that close to the "interval":

diff --git a/lib/test_ratelimit.c b/lib/test_ratelimit.c
index 3d6db9be6be2..539aa968e858 100644
--- a/lib/test_ratelimit.c
+++ b/lib/test_ratelimit.c
@@ -24,19 +24,19 @@ static void test_ratelimit_smoke(struct kunit *test)
 	test_ratelimited(test, true);
 	test_ratelimited(test, false);
 
-	schedule_timeout_idle(TESTRL_INTERVAL - 20);
+	schedule_timeout_idle(TESTRL_INTERVAL - 40);
 	test_ratelimited(test, false);
 
-	schedule_timeout_idle(30);
+	schedule_timeout_idle(50);
 	test_ratelimited(test, true);
 
 	schedule_timeout_idle(2 * TESTRL_INTERVAL);
 	test_ratelimited(test, true);
 	test_ratelimited(test, true);
 
-	schedule_timeout_idle(TESTRL_INTERVAL - 20);
+	schedule_timeout_idle(TESTRL_INTERVAL - 40);
 	test_ratelimited(test, true);
-	schedule_timeout_idle(30);
+	schedule_timeout_idle(50);
 	test_ratelimited(test, true);
 	test_ratelimited(test, true);
 	test_ratelimited(test, true);


2. It still failed on burst = 0 test:

	// Test disabling.
	testrl.burst = 0;
	test_ratelimited(test, true);

   I haven't tried the selftest with the original code. But it looks
   to me like it always returned "false" here as well. But I agree
   that it would make more sense to return "true" here.

Best Regards,
Petr
