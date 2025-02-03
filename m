Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CF42063E8
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591192; cv=none; b=ayz4DDqL5Mirh259loB6knINfB21pQ0GbeY62DjhJGyZSe6tFh0/YUL1QBy7tfIQlTqewiB8x77YOxG/kzNQTKSOyoz9SINlDUGvFIiTRVdAXYT3Q1689lX7N06aw96d+nmmkjiO5XbtNE69bGP7Tobu9d5M1zUcDlCJkyVTHdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591192; c=relaxed/simple;
	bh=hPWB0PH5d6WOsOXdlYzGZPDLiqyfRYlk4+M7EReyrMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kb4JMMIINds9tzkyOJnPYtJSxBW0wyM0jFHmcSaaviNIum0J+9Vhan8+LUM7rLImrO/vKKRmfekbJywI7h5uw7/AIKnT0zT5eZL/cdt35YNEVMJ8CBB7KJu7+5rXq39486g8zsJ9+quOHoa5ssT2qTJTcCZtn+L97YpUZL/9Q8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qnQjaW8/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H9VG0cDm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qnQjaW8/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H9VG0cDm"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4LaPykV7UfafdMEsKb9zzrHTc/iBLj9D5gTxlSJA28=;
	b=qnQjaW8/NRAwq9oblnsj3x5Iaz/xYydcY9LIrA0TGDCMhwpERXAv8OkHdTpmdEbPIWZHYO
	balSpn9/h0GmvoC7v85jRI+pAEn/AJOpzwc+mPrv0rLMqlul+Z59C/loDFtYST9Dg1rOKK
	Wfpi7SEEncRIFhNiOmv+/UCWbesniDZTrzOqIeQGL8fucpZORptENYywemQxT1mjAJ89cW
	dXemxErATY1MQewEeLi0I0bpt+GUwBHrqgeVLbsrJYg6GDuDfH+6PhI+CwYSAh4clylew5
	4TZEW0O9gCfp1NH8dDIJ19lRW6kRNKvA0c6OahQOj8jMxScynoduYEBfRdMwWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4LaPykV7UfafdMEsKb9zzrHTc/iBLj9D5gTxlSJA28=;
	b=H9VG0cDm6thJHoEiLt2xvWS0qXroRSafP4Kj/tNOeEUwYqM0STL4GP3Qs7HPtlioyA3Q+c
	wBQSVtHruTfYlbBg==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v8 08/15] futex: Prepare for reference counting of the process private hash end of operation.
Date: Mon,  3 Feb 2025 14:59:28 +0100
Message-ID: <20250203135935.440018-9-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

To support runtime resizing of the process private hash, it's
required to add a reference count to the hash structure. The
reference count ensures that the hash cannot be resized or freed
while a task is operating on it.

The reference count will be obtained within futex_hash() and dropped
once the hash bucket is unlocked and not longer required for the
particular operation (queue, unqueue, wakeup etc.).

This is achieved by:

 - appending _put() to existing functions so it's clear that they
   also put the hash reference and fixing up the usage sites

 - providing new helpers, which combine common operations (unlock,
   put), and using them at the appropriate places

 - providing new helper for standalone reference counting
   functionality and using them at places, where the unlock operation
   needs to be separate.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 io_uring/futex.c        |  2 +-
 kernel/futex/core.c     | 12 ++++++++----
 kernel/futex/futex.h    | 31 ++++++++++++++++++++-----------
 kernel/futex/pi.c       | 19 ++++++++++---------
 kernel/futex/requeue.c  | 12 ++++++------
 kernel/futex/waitwake.c | 23 ++++++++++++-----------
 6 files changed, 57 insertions(+), 42 deletions(-)

diff --git a/io_uring/futex.c b/io_uring/futex.c
index 3159a2b7eeca1..2141811077b81 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -338,7 +338,7 @@ int io_futex_wait(struct io_kiocb *req, unsigned int is=
sue_flags)
 		hlist_add_head(&req->hash_node, &ctx->futex_list);
 		io_ring_submit_unlock(ctx, issue_flags);
=20
-		futex_queue(&ifd->q, hb);
+		futex_queue_put(&ifd->q, hb);
 		return IOU_ISSUE_SKIP_COMPLETE;
 	}
=20
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 6d12614dad5e8..b54fcb1c6248d 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -152,6 +152,9 @@ struct futex_hash_bucket *futex_hash(union futex_key *k=
ey)
 	return &futex_queues[hash & (futex_hashsize - 1)];
 }
=20
+void futex_hash_put(struct futex_hash_bucket *hb)
+{
+}
=20
 /**
  * futex_setup_timer - set up the sleeping hrtimer.
@@ -543,8 +546,8 @@ struct futex_hash_bucket *futex_q_lock(struct futex_q *=
q)
 	 * Increment the counter before taking the lock so that
 	 * a potential waker won't miss a to-be-slept task that is
 	 * waiting for the spinlock. This is safe as all futex_q_lock()
-	 * users end up calling futex_queue(). Similarly, for housekeeping,
-	 * decrement the counter at futex_q_unlock() when some error has
+	 * users end up calling futex_queue_put(). Similarly, for housekeeping,
+	 * decrement the counter at futex_q_unlock_put() when some error has
 	 * occurred and we don't end up adding the task to the list.
 	 */
 	futex_hb_waiters_inc(hb); /* implies smp_mb(); (A) */
@@ -555,11 +558,12 @@ struct futex_hash_bucket *futex_q_lock(struct futex_q=
 *q)
 	return hb;
 }
=20
-void futex_q_unlock(struct futex_hash_bucket *hb)
+void futex_q_unlock_put(struct futex_hash_bucket *hb)
 	__releases(&hb->lock)
 {
 	futex_hb_waiters_dec(hb);
 	spin_unlock(&hb->lock);
+	futex_hash_put(hb);
 }
=20
 void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb)
@@ -586,7 +590,7 @@ void __futex_queue(struct futex_q *q, struct futex_hash=
_bucket *hb)
  * @q:	The futex_q to unqueue
  *
  * The q->lock_ptr must not be held by the caller. A call to futex_unqueue=
() must
- * be paired with exactly one earlier call to futex_queue().
+ * be paired with exactly one earlier call to futex_queue_put().
  *
  * Return:
  *  - 1 - if the futex_q was still queued (and we removed unqueued it);
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 99b32e728c4ad..36627617f7ced 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -202,6 +202,7 @@ futex_setup_timer(ktime_t *time, struct hrtimer_sleeper=
 *timeout,
 		  int flags, u64 range_ns);
=20
 extern struct futex_hash_bucket *futex_hash(union futex_key *key);
+extern void futex_hash_put(struct futex_hash_bucket *hb);
=20
 /**
  * futex_match - Check whether two futex keys are equal
@@ -288,23 +289,29 @@ extern void __futex_unqueue(struct futex_q *q);
 extern void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb);
 extern int futex_unqueue(struct futex_q *q);
=20
+static inline void futex_hb_unlock_put(struct futex_hash_bucket *hb)
+{
+	spin_unlock(&hb->lock);
+	futex_hash_put(hb);
+}
+
 /**
- * futex_queue() - Enqueue the futex_q on the futex_hash_bucket
+ * futex_queue_put() - Enqueue the futex_q on the futex_hash_bucket
  * @q:	The futex_q to enqueue
  * @hb:	The destination hash bucket
  *
- * The hb->lock must be held by the caller, and is released here. A call to
- * futex_queue() is typically paired with exactly one call to futex_unqueu=
e().  The
- * exceptions involve the PI related operations, which may use futex_unque=
ue_pi()
- * or nothing if the unqueue is done as part of the wake process and the u=
nqueue
- * state is implicit in the state of woken task (see futex_wait_requeue_pi=
() for
- * an example).
+ * The hb->lock must be held by the caller, and is released here and the r=
eference
+ * on the hb is dropped. A call to futex_queue_put() is typically paired w=
ith
+ * exactly one call to futex_unqueue(). The exceptions involve the PI rela=
ted
+ * operations, which may use futex_unqueue_pi() or nothing if the unqueue =
is
+ * done as part of the wake process and the unqueue state is implicit in t=
he
+ * state of woken task (see futex_wait_requeue_pi() for an example).
  */
-static inline void futex_queue(struct futex_q *q, struct futex_hash_bucket=
 *hb)
+static inline void futex_queue_put(struct futex_q *q, struct futex_hash_bu=
cket *hb)
 	__releases(&hb->lock)
 {
 	__futex_queue(q, hb);
-	spin_unlock(&hb->lock);
+	futex_hb_unlock_put(hb);
 }
=20
 extern void futex_unqueue_pi(struct futex_q *q);
@@ -350,7 +357,7 @@ static inline int futex_hb_waiters_pending(struct futex=
_hash_bucket *hb)
 }
=20
 extern struct futex_hash_bucket *futex_q_lock(struct futex_q *q);
-extern void futex_q_unlock(struct futex_hash_bucket *hb);
+extern void futex_q_unlock_put(struct futex_hash_bucket *hb);
=20
=20
 extern int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucke=
t *hb,
@@ -380,11 +387,13 @@ double_lock_hb(struct futex_hash_bucket *hb1, struct =
futex_hash_bucket *hb2)
 }
=20
 static inline void
-double_unlock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *=
hb2)
+double_unlock_hb_put(struct futex_hash_bucket *hb1, struct futex_hash_buck=
et *hb2)
 {
 	spin_unlock(&hb1->lock);
 	if (hb1 !=3D hb2)
 		spin_unlock(&hb2->lock);
+	futex_hash_put(hb1);
+	futex_hash_put(hb2);
 }
=20
 /* syscalls */
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index daea650b16f51..797270228665a 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -217,9 +217,9 @@ static int attach_to_pi_state(u32 __user *uaddr, u32 uv=
al,
 	/*
 	 * We get here with hb->lock held, and having found a
 	 * futex_top_waiter(). This means that futex_lock_pi() of said futex_q
-	 * has dropped the hb->lock in between futex_queue() and futex_unqueue_pi=
(),
-	 * which in turn means that futex_lock_pi() still has a reference on
-	 * our pi_state.
+	 * has dropped the hb->lock in between futex_queue_put() and
+	 * futex_unqueue_pi(), which in turn means that futex_lock_pi() still
+	 * has a reference on our pi_state.
 	 *
 	 * The waiter holding a reference on @pi_state also protects against
 	 * the unlocked put_pi_state() in futex_unlock_pi(), futex_lock_pi()
@@ -963,7 +963,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags=
, ktime_t *time, int tryl
 			 *   exit to complete.
 			 * - EAGAIN: The user space value changed.
 			 */
-			futex_q_unlock(hb);
+			futex_q_unlock_put(hb);
 			/*
 			 * Handle the case where the owner is in the middle of
 			 * exiting. Wait for the exit to complete otherwise
@@ -1083,7 +1083,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int fla=
gs, ktime_t *time, int tryl
 	goto out;
=20
 out_unlock_put_key:
-	futex_q_unlock(hb);
+	futex_q_unlock_put(hb);
=20
 out:
 	if (to) {
@@ -1093,7 +1093,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int fla=
gs, ktime_t *time, int tryl
 	return ret !=3D -EINTR ? ret : -ERESTARTNOINTR;
=20
 uaddr_faulted:
-	futex_q_unlock(hb);
+	futex_q_unlock_put(hb);
=20
 	ret =3D fault_in_user_writeable(uaddr);
 	if (ret)
@@ -1193,7 +1193,7 @@ int futex_unlock_pi(u32 __user *uaddr, unsigned int f=
lags)
 		}
=20
 		get_pi_state(pi_state);
-		spin_unlock(&hb->lock);
+		futex_hb_unlock_put(hb);
=20
 		/* drops pi_state->pi_mutex.wait_lock */
 		ret =3D wake_futex_pi(uaddr, uval, pi_state, rt_waiter);
@@ -1232,7 +1232,8 @@ int futex_unlock_pi(u32 __user *uaddr, unsigned int f=
lags)
 	 * owner.
 	 */
 	if ((ret =3D futex_cmpxchg_value_locked(&curval, uaddr, uval, 0))) {
-		spin_unlock(&hb->lock);
+		futex_hb_unlock_put(hb);
+
 		switch (ret) {
 		case -EFAULT:
 			goto pi_faulted;
@@ -1252,7 +1253,7 @@ int futex_unlock_pi(u32 __user *uaddr, unsigned int f=
lags)
 	ret =3D (curval =3D=3D uval) ? 0 : -EAGAIN;
=20
 out_unlock:
-	spin_unlock(&hb->lock);
+	futex_hb_unlock_put(hb);
 	return ret;
=20
 pi_retry:
diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index fb69dcdf74da8..217cec5c8302e 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -58,7 +58,7 @@ enum {
 };
=20
 const struct futex_q futex_q_init =3D {
-	/* list gets initialized in futex_queue()*/
+	/* list gets initialized in futex_queue_put()*/
 	.wake		=3D futex_wake_mark,
 	.key		=3D FUTEX_KEY_INIT,
 	.bitset		=3D FUTEX_BITSET_MATCH_ANY,
@@ -457,7 +457,7 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
=20
 		if (unlikely(ret)) {
 			futex_hb_waiters_dec(hb2);
-			double_unlock_hb(hb1, hb2);
+			double_unlock_hb_put(hb1, hb2);
=20
 			ret =3D get_user(curval, uaddr1);
 			if (ret)
@@ -543,7 +543,7 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
 		 */
 		case -EFAULT:
 			futex_hb_waiters_dec(hb2);
-			double_unlock_hb(hb1, hb2);
+			double_unlock_hb_put(hb1, hb2);
 			ret =3D fault_in_user_writeable(uaddr2);
 			if (!ret)
 				goto retry;
@@ -557,7 +557,7 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
 			 * - EAGAIN: The user space value changed.
 			 */
 			futex_hb_waiters_dec(hb2);
-			double_unlock_hb(hb1, hb2);
+			double_unlock_hb_put(hb1, hb2);
 			/*
 			 * Handle the case where the owner is in the middle of
 			 * exiting. Wait for the exit to complete otherwise
@@ -675,7 +675,7 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
=20
 out_unlock:
 	futex_hb_waiters_dec(hb2);
-	double_unlock_hb(hb1, hb2);
+	double_unlock_hb_put(hb1, hb2);
 	wake_up_q(&wake_q);
 	return ret ? ret : task_count;
 }
@@ -814,7 +814,7 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned i=
nt flags,
 	 * shared futexes. We need to compare the keys:
 	 */
 	if (futex_match(&q.key, &key2)) {
-		futex_q_unlock(hb);
+		futex_q_unlock_put(hb);
 		ret =3D -EINVAL;
 		goto out;
 	}
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index eb86a7ade06a2..8027195802ca1 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -195,7 +195,7 @@ int futex_wake(u32 __user *uaddr, unsigned int flags, i=
nt nr_wake, u32 bitset)
 		}
 	}
=20
-	spin_unlock(&hb->lock);
+	futex_hb_unlock_put(hb);
 	wake_up_q(&wake_q);
 	return ret;
 }
@@ -273,7 +273,7 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flag=
s, u32 __user *uaddr2,
 	double_lock_hb(hb1, hb2);
 	op_ret =3D futex_atomic_op_inuser(op, uaddr2);
 	if (unlikely(op_ret < 0)) {
-		double_unlock_hb(hb1, hb2);
+		double_unlock_hb_put(hb1, hb2);
=20
 		if (!IS_ENABLED(CONFIG_MMU) ||
 		    unlikely(op_ret !=3D -EFAULT && op_ret !=3D -EAGAIN)) {
@@ -326,7 +326,7 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flag=
s, u32 __user *uaddr2,
 	}
=20
 out_unlock:
-	double_unlock_hb(hb1, hb2);
+	double_unlock_hb_put(hb1, hb2);
 	wake_up_q(&wake_q);
 	return ret;
 }
@@ -334,7 +334,7 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flag=
s, u32 __user *uaddr2,
 static long futex_wait_restart(struct restart_block *restart);
=20
 /**
- * futex_wait_queue() - futex_queue() and wait for wakeup, timeout, or sig=
nal
+ * futex_wait_queue() - futex_queue_put() and wait for wakeup, timeout, or=
 signal
  * @hb:		the futex hash bucket, must be locked by the caller
  * @q:		the futex_q to queue up on
  * @timeout:	the prepared hrtimer_sleeper, or null for no timeout
@@ -345,11 +345,11 @@ void futex_wait_queue(struct futex_hash_bucket *hb, s=
truct futex_q *q,
 	/*
 	 * The task state is guaranteed to be set before another task can
 	 * wake it. set_current_state() is implemented using smp_store_mb() and
-	 * futex_queue() calls spin_unlock() upon completion, both serializing
+	 * futex_queue_put() calls spin_unlock() upon completion, both serializing
 	 * access to the hash list and forcing another memory barrier.
 	 */
 	set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
-	futex_queue(q, hb);
+	futex_queue_put(q, hb);
=20
 	/* Arm the timer */
 	if (timeout)
@@ -460,11 +460,12 @@ int futex_wait_multiple_setup(struct futex_vector *vs=
, int count, int *woken)
 			 * next futex. Queue each futex at this moment so hb can
 			 * be unlocked.
 			 */
-			futex_queue(q, hb);
+			futex_queue_put(q, hb);
 			continue;
 		}
=20
-		futex_q_unlock(hb);
+		futex_q_unlock_put(hb);
+
 		__set_current_state(TASK_RUNNING);
=20
 		/*
@@ -623,7 +624,7 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsign=
ed int flags,
 	ret =3D futex_get_value_locked(&uval, uaddr);
=20
 	if (ret) {
-		futex_q_unlock(*hb);
+		futex_q_unlock_put(*hb);
=20
 		ret =3D get_user(uval, uaddr);
 		if (ret)
@@ -636,7 +637,7 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsign=
ed int flags,
 	}
=20
 	if (uval !=3D val) {
-		futex_q_unlock(*hb);
+		futex_q_unlock_put(*hb);
 		ret =3D -EWOULDBLOCK;
 	}
=20
@@ -664,7 +665,7 @@ int __futex_wait(u32 __user *uaddr, unsigned int flags,=
 u32 val,
 	if (ret)
 		return ret;
=20
-	/* futex_queue and wait for wakeup, timeout, or a signal. */
+	/* futex_queue_put() and wait for wakeup, timeout, or a signal. */
 	futex_wait_queue(hb, &q, to);
=20
 	/* If we were woken (and unqueued), we succeeded, whatever. */
--=20
2.47.2

