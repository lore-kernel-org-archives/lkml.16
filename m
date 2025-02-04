Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC78328399
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682059; cv=none; b=Ua2f8OHb4hUWWgmZPDA0mv5J4ROVZCz+9EqbADDjpKNARrhbRITAwuOQgnMWsktu6yKZSVp9vCiXkY/MG8XEbEY2+SuvxncEvrkHASet2rlWss+y27U4AXqleUp0EBUtHs40OW6Z9vbAv2HCO4hgbI+sVJURGQz59vBsQcdIJTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682059; c=relaxed/simple;
	bh=WSdB+yyDMXFnzGfqh0flLpd3+teeTFwURsO2gq0/BAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbFXRNKE+IYiXhi7T+LTe4PB3IJ48qyP7j4yYob4NkQ/gc96nSVC6hrznqt+elEAvluZ9UALYPPo52O+NFzSnxDufXxzzpQo/8Sv/ZsZyclRvwserjwb58Rwx3FfoPKfgSwwpcT3mGrjUcfKM5Us2Nw7y90n0TBiSTUkilevfRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BlzS/NMn; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BlzS/NMn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IJGKxygle/cbBWhpnLXSRyDRLfG64Z668yWwFdPWdb8=; b=BlzS/NMn9UQiJc4C4Es4YUNpZg
	Iklon4eeLHNhesDXfkTPRvmBnXAVcKk43U/HalXi3ztfujaYUa3IAjGWQjpsGLGswAXvh56yj1rxd
	y9B0I9347+3/52cqB5s13/BMsy7dpKieILTbYXTXC7fMglfjfEiYsmr7JtfLQrAzDP5lSAs4Q59AB
	GNbNH7hRAaCI1qDCK+ZXkh6ECtpwX7C1MexuDkx4+0NTOlbdpk7rEjOllqRoMF0Xd8X2QrpWyeLHk
	Nq2019JNrM+fuPrIiWQ4nVFgCuYh3lFKil4E9xnLsuh1dik1mxLeGFBIHOR4KgBUibHFyuX/Ph7jZ
	3KzGtCQA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKco-0000000GL0P-3cBk;
	Tue, 04 Feb 2025 15:14:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C2CCF3002F0; Tue,  4 Feb 2025 16:14:05 +0100 (CET)
Date: Tue, 4 Feb 2025 16:14:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 00/15] futex: Add support task local hash maps.
Message-ID: <20250204151405.GW7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>

On Mon, Feb 03, 2025 at 02:59:20PM +0100, Sebastian Andrzej Siewior wrote:
>   futex: Decrease the waiter count before the unlock operation.
>   futex: Prepare for reference counting of the process private hash end
>     of operation.
>   futex: Re-evaluate the hash bucket after dropping the lock
>   futex: Introduce futex_get_locked_hb().

I must admit to not being a fan of these patches. I find them very hard
to review.

In part because while you go stick _put() on various things, there is no
corresponding _get(), things like futex_hash() become an implicit get
-- this took a while to figure out.

I tried tying the whole get/put to the hb variable itself, using the
cleanup stuff. The patch is pretty massive because fairly large chunks
of code got re-indented, but perhaps the final result is clearer, not
sure.

---
 io_uring/futex.c        |   5 +-
 kernel/futex/core.c     |  10 +-
 kernel/futex/futex.h    |  22 ++-
 kernel/futex/pi.c       | 280 +++++++++++++++----------------
 kernel/futex/requeue.c  | 427 ++++++++++++++++++++++++------------------------
 kernel/futex/waitwake.c | 184 +++++++++++----------
 6 files changed, 468 insertions(+), 460 deletions(-)

diff --git a/io_uring/futex.c b/io_uring/futex.c
index 3159a2b7eeca..18cd5ccde36d 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -311,7 +311,6 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 	struct io_futex *iof = io_kiocb_to_cmd(req, struct io_futex);
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_futex_data *ifd = NULL;
-	struct futex_hash_bucket *hb;
 	int ret;
 
 	if (!iof->futex_mask) {
@@ -332,13 +331,13 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 	ifd->q.wake = io_futex_wake_fn;
 	ifd->req = req;
 
+	// XXX task->state is messed up
 	ret = futex_wait_setup(iof->uaddr, iof->futex_val, iof->futex_flags,
-			       &ifd->q, &hb);
+			       &ifd->q, NULL);
 	if (!ret) {
 		hlist_add_head(&req->hash_node, &ctx->futex_list);
 		io_ring_submit_unlock(ctx, issue_flags);
 
-		futex_queue(&ifd->q, hb);
 		return IOU_ISSUE_SKIP_COMPLETE;
 	}
 
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index ebdd76b4ecbb..4b2fcaa60d5b 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -505,9 +505,7 @@ void __futex_unqueue(struct futex_q *q)
 struct futex_hash_bucket *futex_q_lock(struct futex_q *q)
 	__acquires(&hb->lock)
 {
-	struct futex_hash_bucket *hb;
-
-	hb = futex_hash(&q->key);
+	CLASS(hb, hb)(&q->key);
 
 	/*
 	 * Increment the counter before taking the lock so that
@@ -522,7 +520,7 @@ struct futex_hash_bucket *futex_q_lock(struct futex_q *q)
 	q->lock_ptr = &hb->lock;
 
 	spin_lock(&hb->lock);
-	return hb;
+	return no_free_ptr(hb);
 }
 
 void futex_q_unlock(struct futex_hash_bucket *hb)
@@ -948,7 +946,6 @@ static void exit_pi_state_list(struct task_struct *curr)
 {
 	struct list_head *next, *head = &curr->pi_state_list;
 	struct futex_pi_state *pi_state;
-	struct futex_hash_bucket *hb;
 	union futex_key key = FUTEX_KEY_INIT;
 
 	/*
@@ -961,7 +958,8 @@ static void exit_pi_state_list(struct task_struct *curr)
 		next = head->next;
 		pi_state = list_entry(next, struct futex_pi_state, list);
 		key = pi_state->key;
-		hb = futex_hash(&key);
+
+		CLASS(hb, hb)(&key);
 
 		/*
 		 * We can race against put_pi_state() removing itself from the
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 99b32e728c4a..cd40f71987b3 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -7,6 +7,7 @@
 #include <linux/sched/wake_q.h>
 #include <linux/compat.h>
 #include <linux/uaccess.h>
+#include <linux/cleanup.h>
 
 #ifdef CONFIG_PREEMPT_RT
 #include <linux/rcuwait.h>
@@ -119,6 +120,19 @@ struct futex_hash_bucket {
 	struct plist_head chain;
 } ____cacheline_aligned_in_smp;
 
+struct futex_q;
+
+extern struct futex_hash_bucket *futex_hash(union futex_key *key);
+extern struct futex_hash_bucket *futex_q_lock(struct futex_q *q);
+extern void futex_hash_put(struct futex_hash_bucket *hb);
+
+DEFINE_CLASS(hb, struct futex_hash_bucket *,
+	     if (_T) futex_hash_put(_T),
+	     futex_hash(key), union futex_key *key);
+
+EXTEND_CLASS(hb, _q_lock,
+	     futex_q_lock(q), struct futex_q *q);
+
 /*
  * Priority Inheritance state:
  */
@@ -201,8 +215,6 @@ extern struct hrtimer_sleeper *
 futex_setup_timer(ktime_t *time, struct hrtimer_sleeper *timeout,
 		  int flags, u64 range_ns);
 
-extern struct futex_hash_bucket *futex_hash(union futex_key *key);
-
 /**
  * futex_match - Check whether two futex keys are equal
  * @key1:	Pointer to key1
@@ -219,9 +231,8 @@ static inline int futex_match(union futex_key *key1, union futex_key *key2)
 }
 
 extern int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
-			    struct futex_q *q, struct futex_hash_bucket **hb);
-extern void futex_wait_queue(struct futex_hash_bucket *hb, struct futex_q *q,
-				   struct hrtimer_sleeper *timeout);
+			    struct futex_q *q, union futex_key *key2);
+extern void futex_wait(struct futex_q *q, struct hrtimer_sleeper *timeout);
 extern bool __futex_wake_mark(struct futex_q *q);
 extern void futex_wake_mark(struct wake_q_head *wake_q, struct futex_q *q);
 
@@ -349,7 +360,6 @@ static inline int futex_hb_waiters_pending(struct futex_hash_bucket *hb)
 #endif
 }
 
-extern struct futex_hash_bucket *futex_q_lock(struct futex_q *q);
 extern void futex_q_unlock(struct futex_hash_bucket *hb);
 
 
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index daea650b16f5..ccc3c5ed21c1 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -920,7 +920,6 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags, ktime_t *time, int tryl
 	struct hrtimer_sleeper timeout, *to;
 	struct task_struct *exiting = NULL;
 	struct rt_mutex_waiter rt_waiter;
-	struct futex_hash_bucket *hb;
 	struct futex_q q = futex_q_init;
 	DEFINE_WAKE_Q(wake_q);
 	int res, ret;
@@ -939,151 +938,166 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags, ktime_t *time, int tryl
 		goto out;
 
 retry_private:
-	hb = futex_q_lock(&q);
+	if (1) {
+		CLASS(hb_q_lock, hb)(&q);
 
-	ret = futex_lock_pi_atomic(uaddr, hb, &q.key, &q.pi_state, current,
-				   &exiting, 0);
-	if (unlikely(ret)) {
-		/*
-		 * Atomic work succeeded and we got the lock,
-		 * or failed. Either way, we do _not_ block.
-		 */
-		switch (ret) {
-		case 1:
-			/* We got the lock. */
-			ret = 0;
-			goto out_unlock_put_key;
-		case -EFAULT:
-			goto uaddr_faulted;
-		case -EBUSY:
-		case -EAGAIN:
-			/*
-			 * Two reasons for this:
-			 * - EBUSY: Task is exiting and we just wait for the
-			 *   exit to complete.
-			 * - EAGAIN: The user space value changed.
-			 */
-			futex_q_unlock(hb);
+		ret = futex_lock_pi_atomic(uaddr, hb, &q.key, &q.pi_state, current,
+					   &exiting, 0);
+		if (unlikely(ret)) {
 			/*
-			 * Handle the case where the owner is in the middle of
-			 * exiting. Wait for the exit to complete otherwise
-			 * this task might loop forever, aka. live lock.
+			 * Atomic work succeeded and we got the lock,
+			 * or failed. Either way, we do _not_ block.
 			 */
-			wait_for_owner_exiting(ret, exiting);
-			cond_resched();
-			goto retry;
-		default:
-			goto out_unlock_put_key;
+			switch (ret) {
+			case 1:
+				/* We got the lock. */
+				ret = 0;
+				goto out_unlock_put_key;
+			case -EFAULT:
+				goto uaddr_faulted;
+			case -EBUSY:
+			case -EAGAIN:
+				/*
+				 * Two reasons for this:
+				 * - EBUSY: Task is exiting and we just wait for the
+				 *   exit to complete.
+				 * - EAGAIN: The user space value changed.
+				 */
+				futex_q_unlock(hb);
+				/*
+				 * Handle the case where the owner is in the middle of
+				 * exiting. Wait for the exit to complete otherwise
+				 * this task might loop forever, aka. live lock.
+				 */
+				wait_for_owner_exiting(ret, exiting);
+				cond_resched();
+				goto retry;
+			default:
+				goto out_unlock_put_key;
+			}
 		}
-	}
 
-	WARN_ON(!q.pi_state);
+		WARN_ON(!q.pi_state);
 
-	/*
-	 * Only actually queue now that the atomic ops are done:
-	 */
-	__futex_queue(&q, hb);
+		/*
+		 * Only actually queue now that the atomic ops are done:
+		 */
+		__futex_queue(&q, hb);
 
-	if (trylock) {
-		ret = rt_mutex_futex_trylock(&q.pi_state->pi_mutex);
-		/* Fixup the trylock return value: */
-		ret = ret ? 0 : -EWOULDBLOCK;
-		goto no_block;
-	}
+		if (trylock) {
+			ret = rt_mutex_futex_trylock(&q.pi_state->pi_mutex);
+			/* Fixup the trylock return value: */
+			ret = ret ? 0 : -EWOULDBLOCK;
+			goto no_block;
+		}
 
-	/*
-	 * Must be done before we enqueue the waiter, here is unfortunately
-	 * under the hb lock, but that *should* work because it does nothing.
-	 */
-	rt_mutex_pre_schedule();
+		/*
+		 * Must be done before we enqueue the waiter, here is unfortunately
+		 * under the hb lock, but that *should* work because it does nothing.
+		 */
+		rt_mutex_pre_schedule();
 
-	rt_mutex_init_waiter(&rt_waiter);
+		rt_mutex_init_waiter(&rt_waiter);
 
-	/*
-	 * On PREEMPT_RT, when hb->lock becomes an rt_mutex, we must not
-	 * hold it while doing rt_mutex_start_proxy(), because then it will
-	 * include hb->lock in the blocking chain, even through we'll not in
-	 * fact hold it while blocking. This will lead it to report -EDEADLK
-	 * and BUG when futex_unlock_pi() interleaves with this.
-	 *
-	 * Therefore acquire wait_lock while holding hb->lock, but drop the
-	 * latter before calling __rt_mutex_start_proxy_lock(). This
-	 * interleaves with futex_unlock_pi() -- which does a similar lock
-	 * handoff -- such that the latter can observe the futex_q::pi_state
-	 * before __rt_mutex_start_proxy_lock() is done.
-	 */
-	raw_spin_lock_irq(&q.pi_state->pi_mutex.wait_lock);
-	spin_unlock(q.lock_ptr);
-	/*
-	 * __rt_mutex_start_proxy_lock() unconditionally enqueues the @rt_waiter
-	 * such that futex_unlock_pi() is guaranteed to observe the waiter when
-	 * it sees the futex_q::pi_state.
-	 */
-	ret = __rt_mutex_start_proxy_lock(&q.pi_state->pi_mutex, &rt_waiter, current, &wake_q);
-	raw_spin_unlock_irq_wake(&q.pi_state->pi_mutex.wait_lock, &wake_q);
+		/*
+		 * On PREEMPT_RT, when hb->lock becomes an rt_mutex, we must not
+		 * hold it while doing rt_mutex_start_proxy(), because then it will
+		 * include hb->lock in the blocking chain, even through we'll not in
+		 * fact hold it while blocking. This will lead it to report -EDEADLK
+		 * and BUG when futex_unlock_pi() interleaves with this.
+		 *
+		 * Therefore acquire wait_lock while holding hb->lock, but drop the
+		 * latter before calling __rt_mutex_start_proxy_lock(). This
+		 * interleaves with futex_unlock_pi() -- which does a similar lock
+		 * handoff -- such that the latter can observe the futex_q::pi_state
+		 * before __rt_mutex_start_proxy_lock() is done.
+		 */
+		raw_spin_lock_irq(&q.pi_state->pi_mutex.wait_lock);
+		spin_unlock(q.lock_ptr);
+		/*
+		 * __rt_mutex_start_proxy_lock() unconditionally enqueues the @rt_waiter
+		 * such that futex_unlock_pi() is guaranteed to observe the waiter when
+		 * it sees the futex_q::pi_state.
+		 */
+		ret = __rt_mutex_start_proxy_lock(&q.pi_state->pi_mutex, &rt_waiter, current, &wake_q);
+		raw_spin_unlock_irq_wake(&q.pi_state->pi_mutex.wait_lock, &wake_q);
 
-	if (ret) {
-		if (ret == 1)
-			ret = 0;
-		goto cleanup;
-	}
+		if (ret) {
+			if (ret == 1)
+				ret = 0;
+			goto cleanup;
+		}
 
-	if (unlikely(to))
-		hrtimer_sleeper_start_expires(to, HRTIMER_MODE_ABS);
+		if (unlikely(to))
+			hrtimer_sleeper_start_expires(to, HRTIMER_MODE_ABS);
 
-	ret = rt_mutex_wait_proxy_lock(&q.pi_state->pi_mutex, to, &rt_waiter);
+		ret = rt_mutex_wait_proxy_lock(&q.pi_state->pi_mutex, to, &rt_waiter);
 
 cleanup:
-	/*
-	 * If we failed to acquire the lock (deadlock/signal/timeout), we must
-	 * must unwind the above, however we canont lock hb->lock because
-	 * rt_mutex already has a waiter enqueued and hb->lock can itself try
-	 * and enqueue an rt_waiter through rtlock.
-	 *
-	 * Doing the cleanup without holding hb->lock can cause inconsistent
-	 * state between hb and pi_state, but only in the direction of not
-	 * seeing a waiter that is leaving.
-	 *
-	 * See futex_unlock_pi(), it deals with this inconsistency.
-	 *
-	 * There be dragons here, since we must deal with the inconsistency on
-	 * the way out (here), it is impossible to detect/warn about the race
-	 * the other way around (missing an incoming waiter).
-	 *
-	 * What could possibly go wrong...
-	 */
-	if (ret && !rt_mutex_cleanup_proxy_lock(&q.pi_state->pi_mutex, &rt_waiter))
-		ret = 0;
+		/*
+		 * If we failed to acquire the lock (deadlock/signal/timeout), we must
+		 * must unwind the above, however we canont lock hb->lock because
+		 * rt_mutex already has a waiter enqueued and hb->lock can itself try
+		 * and enqueue an rt_waiter through rtlock.
+		 *
+		 * Doing the cleanup without holding hb->lock can cause inconsistent
+		 * state between hb and pi_state, but only in the direction of not
+		 * seeing a waiter that is leaving.
+		 *
+		 * See futex_unlock_pi(), it deals with this inconsistency.
+		 *
+		 * There be dragons here, since we must deal with the inconsistency on
+		 * the way out (here), it is impossible to detect/warn about the race
+		 * the other way around (missing an incoming waiter).
+		 *
+		 * What could possibly go wrong...
+		 */
+		if (ret && !rt_mutex_cleanup_proxy_lock(&q.pi_state->pi_mutex, &rt_waiter))
+			ret = 0;
 
-	/*
-	 * Now that the rt_waiter has been dequeued, it is safe to use
-	 * spinlock/rtlock (which might enqueue its own rt_waiter) and fix up
-	 * the
-	 */
-	spin_lock(q.lock_ptr);
-	/*
-	 * Waiter is unqueued.
-	 */
-	rt_mutex_post_schedule();
+		/*
+		 * Now that the rt_waiter has been dequeued, it is safe to use
+		 * spinlock/rtlock (which might enqueue its own rt_waiter) and fix up
+		 * the
+		 */
+		spin_lock(q.lock_ptr);
+		/*
+		 * Waiter is unqueued.
+		 */
+		rt_mutex_post_schedule();
 no_block:
-	/*
-	 * Fixup the pi_state owner and possibly acquire the lock if we
-	 * haven't already.
-	 */
-	res = fixup_pi_owner(uaddr, &q, !ret);
-	/*
-	 * If fixup_pi_owner() returned an error, propagate that.  If it acquired
-	 * the lock, clear our -ETIMEDOUT or -EINTR.
-	 */
-	if (res)
-		ret = (res < 0) ? res : 0;
+		/*
+		 * Fixup the pi_state owner and possibly acquire the lock if we
+		 * haven't already.
+		 */
+		res = fixup_pi_owner(uaddr, &q, !ret);
+		/*
+		 * If fixup_pi_owner() returned an error, propagate that.  If it acquired
+		 * the lock, clear our -ETIMEDOUT or -EINTR.
+		 */
+		if (res)
+			ret = (res < 0) ? res : 0;
 
-	futex_unqueue_pi(&q);
-	spin_unlock(q.lock_ptr);
-	goto out;
+		futex_unqueue_pi(&q);
+		spin_unlock(q.lock_ptr);
+		goto out;
 
 out_unlock_put_key:
-	futex_q_unlock(hb);
+		futex_q_unlock(hb);
+		goto out;
+
+uaddr_faulted:
+		futex_q_unlock(hb);
+
+		ret = fault_in_user_writeable(uaddr);
+		if (ret)
+			goto out;
+
+		if (!(flags & FLAGS_SHARED))
+			goto retry_private;
+
+		goto retry;
+	}
 
 out:
 	if (to) {
@@ -1092,17 +1106,6 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags, ktime_t *time, int tryl
 	}
 	return ret != -EINTR ? ret : -ERESTARTNOINTR;
 
-uaddr_faulted:
-	futex_q_unlock(hb);
-
-	ret = fault_in_user_writeable(uaddr);
-	if (ret)
-		goto out;
-
-	if (!(flags & FLAGS_SHARED))
-		goto retry_private;
-
-	goto retry;
 }
 
 /*
@@ -1114,7 +1117,6 @@ int futex_unlock_pi(u32 __user *uaddr, unsigned int flags)
 {
 	u32 curval, uval, vpid = task_pid_vnr(current);
 	union futex_key key = FUTEX_KEY_INIT;
-	struct futex_hash_bucket *hb;
 	struct futex_q *top_waiter;
 	int ret;
 
@@ -1134,7 +1136,7 @@ int futex_unlock_pi(u32 __user *uaddr, unsigned int flags)
 	if (ret)
 		return ret;
 
-	hb = futex_hash(&key);
+	CLASS(hb, hb)(&key);
 	spin_lock(&hb->lock);
 retry_hb:
 
diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index b47bb764b352..01ba7d09036a 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -371,7 +371,6 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flags1,
 	union futex_key key1 = FUTEX_KEY_INIT, key2 = FUTEX_KEY_INIT;
 	int task_count = 0, ret;
 	struct futex_pi_state *pi_state = NULL;
-	struct futex_hash_bucket *hb1, *hb2;
 	struct futex_q *this, *next;
 	DEFINE_WAKE_Q(wake_q);
 
@@ -443,240 +442,242 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flags1,
 	if (requeue_pi && futex_match(&key1, &key2))
 		return -EINVAL;
 
-	hb1 = futex_hash(&key1);
-	hb2 = futex_hash(&key2);
-
 retry_private:
-	futex_hb_waiters_inc(hb2);
-	double_lock_hb(hb1, hb2);
+	if (1) {
+		CLASS(hb, hb1)(&key1);
+		CLASS(hb, hb2)(&key2);
 
-	if (likely(cmpval != NULL)) {
-		u32 curval;
+		futex_hb_waiters_inc(hb2);
+		double_lock_hb(hb1, hb2);
 
-		ret = futex_get_value_locked(&curval, uaddr1);
+		if (likely(cmpval != NULL)) {
+			u32 curval;
 
-		if (unlikely(ret)) {
-			double_unlock_hb(hb1, hb2);
-			futex_hb_waiters_dec(hb2);
+			ret = futex_get_value_locked(&curval, uaddr1);
 
-			ret = get_user(curval, uaddr1);
-			if (ret)
-				return ret;
+			if (unlikely(ret)) {
+				double_unlock_hb(hb1, hb2);
+				futex_hb_waiters_dec(hb2);
 
-			if (!(flags1 & FLAGS_SHARED))
-				goto retry_private;
+				ret = get_user(curval, uaddr1);
+				if (ret)
+					return ret;
 
-			goto retry;
-		}
-		if (curval != *cmpval) {
-			ret = -EAGAIN;
-			goto out_unlock;
-		}
-	}
+				if (!(flags1 & FLAGS_SHARED))
+					goto retry_private;
 
-	if (requeue_pi) {
-		struct task_struct *exiting = NULL;
+				goto retry;
+			}
+			if (curval != *cmpval) {
+				ret = -EAGAIN;
+				goto out_unlock;
+			}
+		}
 
-		/*
-		 * Attempt to acquire uaddr2 and wake the top waiter. If we
-		 * intend to requeue waiters, force setting the FUTEX_WAITERS
-		 * bit.  We force this here where we are able to easily handle
-		 * faults rather in the requeue loop below.
-		 *
-		 * Updates topwaiter::requeue_state if a top waiter exists.
-		 */
-		ret = futex_proxy_trylock_atomic(uaddr2, hb1, hb2, &key1,
-						 &key2, &pi_state,
-						 &exiting, nr_requeue);
+		if (requeue_pi) {
+			struct task_struct *exiting = NULL;
 
-		/*
-		 * At this point the top_waiter has either taken uaddr2 or
-		 * is waiting on it. In both cases pi_state has been
-		 * established and an initial refcount on it. In case of an
-		 * error there's nothing.
-		 *
-		 * The top waiter's requeue_state is up to date:
-		 *
-		 *  - If the lock was acquired atomically (ret == 1), then
-		 *    the state is Q_REQUEUE_PI_LOCKED.
-		 *
-		 *    The top waiter has been dequeued and woken up and can
-		 *    return to user space immediately. The kernel/user
-		 *    space state is consistent. In case that there must be
-		 *    more waiters requeued the WAITERS bit in the user
-		 *    space futex is set so the top waiter task has to go
-		 *    into the syscall slowpath to unlock the futex. This
-		 *    will block until this requeue operation has been
-		 *    completed and the hash bucket locks have been
-		 *    dropped.
-		 *
-		 *  - If the trylock failed with an error (ret < 0) then
-		 *    the state is either Q_REQUEUE_PI_NONE, i.e. "nothing
-		 *    happened", or Q_REQUEUE_PI_IGNORE when there was an
-		 *    interleaved early wakeup.
-		 *
-		 *  - If the trylock did not succeed (ret == 0) then the
-		 *    state is either Q_REQUEUE_PI_IN_PROGRESS or
-		 *    Q_REQUEUE_PI_WAIT if an early wakeup interleaved.
-		 *    This will be cleaned up in the loop below, which
-		 *    cannot fail because futex_proxy_trylock_atomic() did
-		 *    the same sanity checks for requeue_pi as the loop
-		 *    below does.
-		 */
-		switch (ret) {
-		case 0:
-			/* We hold a reference on the pi state. */
-			break;
-
-		case 1:
 			/*
-			 * futex_proxy_trylock_atomic() acquired the user space
-			 * futex. Adjust task_count.
+			 * Attempt to acquire uaddr2 and wake the top waiter. If we
+			 * intend to requeue waiters, force setting the FUTEX_WAITERS
+			 * bit.  We force this here where we are able to easily handle
+			 * faults rather in the requeue loop below.
+			 *
+			 * Updates topwaiter::requeue_state if a top waiter exists.
 			 */
-			task_count++;
-			ret = 0;
-			break;
+			ret = futex_proxy_trylock_atomic(uaddr2, hb1, hb2, &key1,
+							 &key2, &pi_state,
+							 &exiting, nr_requeue);
 
-		/*
-		 * If the above failed, then pi_state is NULL and
-		 * waiter::requeue_state is correct.
-		 */
-		case -EFAULT:
-			double_unlock_hb(hb1, hb2);
-			futex_hb_waiters_dec(hb2);
-			ret = fault_in_user_writeable(uaddr2);
-			if (!ret)
-				goto retry;
-			return ret;
-		case -EBUSY:
-		case -EAGAIN:
 			/*
-			 * Two reasons for this:
-			 * - EBUSY: Owner is exiting and we just wait for the
-			 *   exit to complete.
-			 * - EAGAIN: The user space value changed.
+			 * At this point the top_waiter has either taken uaddr2 or
+			 * is waiting on it. In both cases pi_state has been
+			 * established and an initial refcount on it. In case of an
+			 * error there's nothing.
+			 *
+			 * The top waiter's requeue_state is up to date:
+			 *
+			 *  - If the lock was acquired atomically (ret == 1), then
+			 *    the state is Q_REQUEUE_PI_LOCKED.
+			 *
+			 *    The top waiter has been dequeued and woken up and can
+			 *    return to user space immediately. The kernel/user
+			 *    space state is consistent. In case that there must be
+			 *    more waiters requeued the WAITERS bit in the user
+			 *    space futex is set so the top waiter task has to go
+			 *    into the syscall slowpath to unlock the futex. This
+			 *    will block until this requeue operation has been
+			 *    completed and the hash bucket locks have been
+			 *    dropped.
+			 *
+			 *  - If the trylock failed with an error (ret < 0) then
+			 *    the state is either Q_REQUEUE_PI_NONE, i.e. "nothing
+			 *    happened", or Q_REQUEUE_PI_IGNORE when there was an
+			 *    interleaved early wakeup.
+			 *
+			 *  - If the trylock did not succeed (ret == 0) then the
+			 *    state is either Q_REQUEUE_PI_IN_PROGRESS or
+			 *    Q_REQUEUE_PI_WAIT if an early wakeup interleaved.
+			 *    This will be cleaned up in the loop below, which
+			 *    cannot fail because futex_proxy_trylock_atomic() did
+			 *    the same sanity checks for requeue_pi as the loop
+			 *    below does.
 			 */
-			double_unlock_hb(hb1, hb2);
-			futex_hb_waiters_dec(hb2);
-			/*
-			 * Handle the case where the owner is in the middle of
-			 * exiting. Wait for the exit to complete otherwise
-			 * this task might loop forever, aka. live lock.
-			 */
-			wait_for_owner_exiting(ret, exiting);
-			cond_resched();
-			goto retry;
-		default:
-			goto out_unlock;
-		}
-	}
-
-	plist_for_each_entry_safe(this, next, &hb1->chain, list) {
-		if (task_count - nr_wake >= nr_requeue)
-			break;
-
-		if (!futex_match(&this->key, &key1))
-			continue;
-
-		/*
-		 * FUTEX_WAIT_REQUEUE_PI and FUTEX_CMP_REQUEUE_PI should always
-		 * be paired with each other and no other futex ops.
-		 *
-		 * We should never be requeueing a futex_q with a pi_state,
-		 * which is awaiting a futex_unlock_pi().
-		 */
-		if ((requeue_pi && !this->rt_waiter) ||
-		    (!requeue_pi && this->rt_waiter) ||
-		    this->pi_state) {
-			ret = -EINVAL;
-			break;
-		}
-
-		/* Plain futexes just wake or requeue and are done */
-		if (!requeue_pi) {
-			if (++task_count <= nr_wake)
-				this->wake(&wake_q, this);
-			else
-				requeue_futex(this, hb1, hb2, &key2);
-			continue;
+			switch (ret) {
+			case 0:
+				/* We hold a reference on the pi state. */
+				break;
+
+			case 1:
+				/*
+				 * futex_proxy_trylock_atomic() acquired the user space
+				 * futex. Adjust task_count.
+				 */
+				task_count++;
+				ret = 0;
+				break;
+
+				/*
+				 * If the above failed, then pi_state is NULL and
+				 * waiter::requeue_state is correct.
+				 */
+			case -EFAULT:
+				double_unlock_hb(hb1, hb2);
+				futex_hb_waiters_dec(hb2);
+				ret = fault_in_user_writeable(uaddr2);
+				if (!ret)
+					goto retry;
+				return ret;
+			case -EBUSY:
+			case -EAGAIN:
+				/*
+				 * Two reasons for this:
+				 * - EBUSY: Owner is exiting and we just wait for the
+				 *   exit to complete.
+				 * - EAGAIN: The user space value changed.
+				 */
+				double_unlock_hb(hb1, hb2);
+				futex_hb_waiters_dec(hb2);
+				/*
+				 * Handle the case where the owner is in the middle of
+				 * exiting. Wait for the exit to complete otherwise
+				 * this task might loop forever, aka. live lock.
+				 */
+				wait_for_owner_exiting(ret, exiting);
+				cond_resched();
+				goto retry;
+			default:
+				goto out_unlock;
+			}
 		}
 
-		/* Ensure we requeue to the expected futex for requeue_pi. */
-		if (!futex_match(this->requeue_pi_key, &key2)) {
-			ret = -EINVAL;
-			break;
-		}
+		plist_for_each_entry_safe(this, next, &hb1->chain, list) {
+			if (task_count - nr_wake >= nr_requeue)
+				break;
 
-		/*
-		 * Requeue nr_requeue waiters and possibly one more in the case
-		 * of requeue_pi if we couldn't acquire the lock atomically.
-		 *
-		 * Prepare the waiter to take the rt_mutex. Take a refcount
-		 * on the pi_state and store the pointer in the futex_q
-		 * object of the waiter.
-		 */
-		get_pi_state(pi_state);
+			if (!futex_match(&this->key, &key1))
+				continue;
 
-		/* Don't requeue when the waiter is already on the way out. */
-		if (!futex_requeue_pi_prepare(this, pi_state)) {
 			/*
-			 * Early woken waiter signaled that it is on the
-			 * way out. Drop the pi_state reference and try the
-			 * next waiter. @this->pi_state is still NULL.
+			 * FUTEX_WAIT_REQUEUE_PI and FUTEX_CMP_REQUEUE_PI should always
+			 * be paired with each other and no other futex ops.
+			 *
+			 * We should never be requeueing a futex_q with a pi_state,
+			 * which is awaiting a futex_unlock_pi().
 			 */
-			put_pi_state(pi_state);
-			continue;
-		}
+			if ((requeue_pi && !this->rt_waiter) ||
+			    (!requeue_pi && this->rt_waiter) ||
+			    this->pi_state) {
+				ret = -EINVAL;
+				break;
+			}
+
+			/* Plain futexes just wake or requeue and are done */
+			if (!requeue_pi) {
+				if (++task_count <= nr_wake)
+					this->wake(&wake_q, this);
+				else
+					requeue_futex(this, hb1, hb2, &key2);
+				continue;
+			}
+
+			/* Ensure we requeue to the expected futex for requeue_pi. */
+			if (!futex_match(this->requeue_pi_key, &key2)) {
+				ret = -EINVAL;
+				break;
+			}
 
-		ret = rt_mutex_start_proxy_lock(&pi_state->pi_mutex,
-						this->rt_waiter,
-						this->task);
-
-		if (ret == 1) {
-			/*
-			 * We got the lock. We do neither drop the refcount
-			 * on pi_state nor clear this->pi_state because the
-			 * waiter needs the pi_state for cleaning up the
-			 * user space value. It will drop the refcount
-			 * after doing so. this::requeue_state is updated
-			 * in the wakeup as well.
-			 */
-			requeue_pi_wake_futex(this, &key2, hb2);
-			task_count++;
-		} else if (!ret) {
-			/* Waiter is queued, move it to hb2 */
-			requeue_futex(this, hb1, hb2, &key2);
-			futex_requeue_pi_complete(this, 0);
-			task_count++;
-		} else {
 			/*
-			 * rt_mutex_start_proxy_lock() detected a potential
-			 * deadlock when we tried to queue that waiter.
-			 * Drop the pi_state reference which we took above
-			 * and remove the pointer to the state from the
-			 * waiters futex_q object.
+			 * Requeue nr_requeue waiters and possibly one more in the case
+			 * of requeue_pi if we couldn't acquire the lock atomically.
+			 *
+			 * Prepare the waiter to take the rt_mutex. Take a refcount
+			 * on the pi_state and store the pointer in the futex_q
+			 * object of the waiter.
 			 */
-			this->pi_state = NULL;
-			put_pi_state(pi_state);
-			futex_requeue_pi_complete(this, ret);
-			/*
-			 * We stop queueing more waiters and let user space
-			 * deal with the mess.
-			 */
-			break;
+			get_pi_state(pi_state);
+
+			/* Don't requeue when the waiter is already on the way out. */
+			if (!futex_requeue_pi_prepare(this, pi_state)) {
+				/*
+				 * Early woken waiter signaled that it is on the
+				 * way out. Drop the pi_state reference and try the
+				 * next waiter. @this->pi_state is still NULL.
+				 */
+				put_pi_state(pi_state);
+				continue;
+			}
+
+			ret = rt_mutex_start_proxy_lock(&pi_state->pi_mutex,
+							this->rt_waiter,
+							this->task);
+
+			if (ret == 1) {
+				/*
+				 * We got the lock. We do neither drop the refcount
+				 * on pi_state nor clear this->pi_state because the
+				 * waiter needs the pi_state for cleaning up the
+				 * user space value. It will drop the refcount
+				 * after doing so. this::requeue_state is updated
+				 * in the wakeup as well.
+				 */
+				requeue_pi_wake_futex(this, &key2, hb2);
+				task_count++;
+			} else if (!ret) {
+				/* Waiter is queued, move it to hb2 */
+				requeue_futex(this, hb1, hb2, &key2);
+				futex_requeue_pi_complete(this, 0);
+				task_count++;
+			} else {
+				/*
+				 * rt_mutex_start_proxy_lock() detected a potential
+				 * deadlock when we tried to queue that waiter.
+				 * Drop the pi_state reference which we took above
+				 * and remove the pointer to the state from the
+				 * waiters futex_q object.
+				 */
+				this->pi_state = NULL;
+				put_pi_state(pi_state);
+				futex_requeue_pi_complete(this, ret);
+				/*
+				 * We stop queueing more waiters and let user space
+				 * deal with the mess.
+				 */
+				break;
+			}
 		}
-	}
 
-	/*
-	 * We took an extra initial reference to the pi_state in
-	 * futex_proxy_trylock_atomic(). We need to drop it here again.
-	 */
-	put_pi_state(pi_state);
+		/*
+		 * We took an extra initial reference to the pi_state in
+		 * futex_proxy_trylock_atomic(). We need to drop it here again.
+		 */
+		put_pi_state(pi_state);
 
 out_unlock:
-	double_unlock_hb(hb1, hb2);
+		double_unlock_hb(hb1, hb2);
+		futex_hb_waiters_dec(hb2);
+	}
 	wake_up_q(&wake_q);
-	futex_hb_waiters_dec(hb2);
 	return ret ? ret : task_count;
 }
 
@@ -805,22 +806,12 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned int flags,
 	 * Prepare to wait on uaddr. On success, it holds hb->lock and q
 	 * is initialized.
 	 */
-	ret = futex_wait_setup(uaddr, val, flags, &q, &hb);
+	ret = futex_wait_setup(uaddr, val, flags, &q, &key2);
 	if (ret)
 		goto out;
 
-	/*
-	 * The check above which compares uaddrs is not sufficient for
-	 * shared futexes. We need to compare the keys:
-	 */
-	if (futex_match(&q.key, &key2)) {
-		futex_q_unlock(hb);
-		ret = -EINVAL;
-		goto out;
-	}
-
 	/* Queue the futex_q, drop the hb lock, wait for wakeup. */
-	futex_wait_queue(hb, &q, to);
+	futex_wait(&q, to);
 
 	switch (futex_requeue_pi_wakeup_sync(&q)) {
 	case Q_REQUEUE_PI_IGNORE:
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index eb86a7ade06a..daf9ab07a77f 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -154,7 +154,6 @@ void futex_wake_mark(struct wake_q_head *wake_q, struct futex_q *q)
  */
 int futex_wake(u32 __user *uaddr, unsigned int flags, int nr_wake, u32 bitset)
 {
-	struct futex_hash_bucket *hb;
 	struct futex_q *this, *next;
 	union futex_key key = FUTEX_KEY_INIT;
 	DEFINE_WAKE_Q(wake_q);
@@ -170,7 +169,7 @@ int futex_wake(u32 __user *uaddr, unsigned int flags, int nr_wake, u32 bitset)
 	if ((flags & FLAGS_STRICT) && !nr_wake)
 		return 0;
 
-	hb = futex_hash(&key);
+	CLASS(hb, hb)(&key);
 
 	/* Make sure we really have tasks to wakeup */
 	if (!futex_hb_waiters_pending(hb))
@@ -253,7 +252,6 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flags, u32 __user *uaddr2,
 		  int nr_wake, int nr_wake2, int op)
 {
 	union futex_key key1 = FUTEX_KEY_INIT, key2 = FUTEX_KEY_INIT;
-	struct futex_hash_bucket *hb1, *hb2;
 	struct futex_q *this, *next;
 	int ret, op_ret;
 	DEFINE_WAKE_Q(wake_q);
@@ -266,67 +264,69 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flags, u32 __user *uaddr2,
 	if (unlikely(ret != 0))
 		return ret;
 
-	hb1 = futex_hash(&key1);
-	hb2 = futex_hash(&key2);
-
 retry_private:
-	double_lock_hb(hb1, hb2);
-	op_ret = futex_atomic_op_inuser(op, uaddr2);
-	if (unlikely(op_ret < 0)) {
-		double_unlock_hb(hb1, hb2);
-
-		if (!IS_ENABLED(CONFIG_MMU) ||
-		    unlikely(op_ret != -EFAULT && op_ret != -EAGAIN)) {
-			/*
-			 * we don't get EFAULT from MMU faults if we don't have
-			 * an MMU, but we might get them from range checking
-			 */
-			ret = op_ret;
-			return ret;
-		}
-
-		if (op_ret == -EFAULT) {
-			ret = fault_in_user_writeable(uaddr2);
-			if (ret)
+	if (1) {
+		CLASS(hb, hb1)(&key1);
+		CLASS(hb, hb2)(&key2);
+
+		double_lock_hb(hb1, hb2);
+		op_ret = futex_atomic_op_inuser(op, uaddr2);
+		if (unlikely(op_ret < 0)) {
+			double_unlock_hb(hb1, hb2);
+
+			if (!IS_ENABLED(CONFIG_MMU) ||
+			    unlikely(op_ret != -EFAULT && op_ret != -EAGAIN)) {
+				/*
+				 * we don't get EFAULT from MMU faults if we don't have
+				 * an MMU, but we might get them from range checking
+				 */
+				ret = op_ret;
 				return ret;
-		}
-
-		cond_resched();
-		if (!(flags & FLAGS_SHARED))
-			goto retry_private;
-		goto retry;
-	}
+			}
 
-	plist_for_each_entry_safe(this, next, &hb1->chain, list) {
-		if (futex_match (&this->key, &key1)) {
-			if (this->pi_state || this->rt_waiter) {
-				ret = -EINVAL;
-				goto out_unlock;
+			if (op_ret == -EFAULT) {
+				ret = fault_in_user_writeable(uaddr2);
+				if (ret)
+					return ret;
 			}
-			this->wake(&wake_q, this);
-			if (++ret >= nr_wake)
-				break;
+
+			cond_resched();
+			if (!(flags & FLAGS_SHARED))
+				goto retry_private;
+			goto retry;
 		}
-	}
 
-	if (op_ret > 0) {
-		op_ret = 0;
-		plist_for_each_entry_safe(this, next, &hb2->chain, list) {
-			if (futex_match (&this->key, &key2)) {
+		plist_for_each_entry_safe(this, next, &hb1->chain, list) {
+			if (futex_match (&this->key, &key1)) {
 				if (this->pi_state || this->rt_waiter) {
 					ret = -EINVAL;
 					goto out_unlock;
 				}
 				this->wake(&wake_q, this);
-				if (++op_ret >= nr_wake2)
+				if (++ret >= nr_wake)
 					break;
 			}
 		}
-		ret += op_ret;
-	}
+
+		if (op_ret > 0) {
+			op_ret = 0;
+			plist_for_each_entry_safe(this, next, &hb2->chain, list) {
+				if (futex_match (&this->key, &key2)) {
+					if (this->pi_state || this->rt_waiter) {
+						ret = -EINVAL;
+						goto out_unlock;
+					}
+					this->wake(&wake_q, this);
+					if (++op_ret >= nr_wake2)
+						break;
+				}
+			}
+			ret += op_ret;
+		}
 
 out_unlock:
-	double_unlock_hb(hb1, hb2);
+		double_unlock_hb(hb1, hb2);
+	}
 	wake_up_q(&wake_q);
 	return ret;
 }
@@ -339,17 +339,8 @@ static long futex_wait_restart(struct restart_block *restart);
  * @q:		the futex_q to queue up on
  * @timeout:	the prepared hrtimer_sleeper, or null for no timeout
  */
-void futex_wait_queue(struct futex_hash_bucket *hb, struct futex_q *q,
-			    struct hrtimer_sleeper *timeout)
+void futex_wait(struct futex_q *q, struct hrtimer_sleeper *timeout)
 {
-	/*
-	 * The task state is guaranteed to be set before another task can
-	 * wake it. set_current_state() is implemented using smp_store_mb() and
-	 * futex_queue() calls spin_unlock() upon completion, both serializing
-	 * access to the hash list and forcing another memory barrier.
-	 */
-	set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
-	futex_queue(q, hb);
 
 	/* Arm the timer */
 	if (timeout)
@@ -451,20 +442,22 @@ int futex_wait_multiple_setup(struct futex_vector *vs, int count, int *woken)
 		struct futex_q *q = &vs[i].q;
 		u32 val = vs[i].w.val;
 
-		hb = futex_q_lock(q);
-		ret = futex_get_value_locked(&uval, uaddr);
+		if (1) {
+			CLASS(hb_q_lock, hb)(q);
+			ret = futex_get_value_locked(&uval, uaddr);
+
+			if (!ret && uval == val) {
+				/*
+				 * The bucket lock can't be held while dealing with the
+				 * next futex. Queue each futex at this moment so hb can
+				 * be unlocked.
+				 */
+				futex_queue(q, hb);
+				continue;
+			}
 
-		if (!ret && uval == val) {
-			/*
-			 * The bucket lock can't be held while dealing with the
-			 * next futex. Queue each futex at this moment so hb can
-			 * be unlocked.
-			 */
-			futex_queue(q, hb);
-			continue;
+			futex_q_unlock(hb);
 		}
-
-		futex_q_unlock(hb);
 		__set_current_state(TASK_RUNNING);
 
 		/*
@@ -589,7 +582,7 @@ int futex_wait_multiple(struct futex_vector *vs, unsigned int count,
  *  - <1 - -EFAULT or -EWOULDBLOCK (uaddr does not contain val) and hb is unlocked
  */
 int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
-		     struct futex_q *q, struct futex_hash_bucket **hb)
+		     struct futex_q *q, union futex_key *key2)
 {
 	u32 uval;
 	int ret;
@@ -618,26 +611,42 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
 		return ret;
 
 retry_private:
-	*hb = futex_q_lock(q);
+	if (1) {
+		CLASS(hb_q_lock, hb)(q);
 
-	ret = futex_get_value_locked(&uval, uaddr);
+		ret = futex_get_value_locked(&uval, uaddr);
 
-	if (ret) {
-		futex_q_unlock(*hb);
+		if (ret) {
+			futex_q_unlock(hb);
 
-		ret = get_user(uval, uaddr);
-		if (ret)
-			return ret;
+			ret = get_user(uval, uaddr);
+			if (ret)
+				return ret;
 
-		if (!(flags & FLAGS_SHARED))
-			goto retry_private;
+			if (!(flags & FLAGS_SHARED))
+				goto retry_private;
 
-		goto retry;
-	}
+			goto retry;
+		}
+
+		if (uval != val) {
+			futex_q_unlock(hb);
+			return -EWOULDBLOCK;
+		}
+
+		if (key2 && !futex_match(&q->key, key2)) {
+			futex_q_unlock(hb);
+			return -EINVAL;
+		}
 
-	if (uval != val) {
-		futex_q_unlock(*hb);
-		ret = -EWOULDBLOCK;
+		/*
+		 * The task state is guaranteed to be set before another task can
+		 * wake it. set_current_state() is implemented using smp_store_mb() and
+		 * futex_queue() calls spin_unlock() upon completion, both serializing
+		 * access to the hash list and forcing another memory barrier.
+		 */
+		set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
+		futex_queue(q, hb);
 	}
 
 	return ret;
@@ -647,7 +656,6 @@ int __futex_wait(u32 __user *uaddr, unsigned int flags, u32 val,
 		 struct hrtimer_sleeper *to, u32 bitset)
 {
 	struct futex_q q = futex_q_init;
-	struct futex_hash_bucket *hb;
 	int ret;
 
 	if (!bitset)
@@ -660,12 +668,12 @@ int __futex_wait(u32 __user *uaddr, unsigned int flags, u32 val,
 	 * Prepare to wait on uaddr. On success, it holds hb->lock and q
 	 * is initialized.
 	 */
-	ret = futex_wait_setup(uaddr, val, flags, &q, &hb);
+	ret = futex_wait_setup(uaddr, val, flags, &q, NULL);
 	if (ret)
 		return ret;
 
 	/* futex_queue and wait for wakeup, timeout, or a signal. */
-	futex_wait_queue(hb, &q, to);
+	futex_wait(&q, to);
 
 	/* If we were woken (and unqueued), we succeeded, whatever. */
 	if (!futex_unqueue(&q))
