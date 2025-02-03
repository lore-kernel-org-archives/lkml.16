Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AB22063F3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591192; cv=none; b=kt6soQvGuvzX6be8TurJRJ/8lN4IbHAv5nNlw0S1kczHkQFl2GxYnEGK/3x0eCogMnENLKgMcBrAYAm3ZGdBE9TN3fNeXEgfGv7NKMHe/lUeRvwNm0tO6Tys+Dt/q1eT5eFgJ/Bj+xMQO02nfs46Wz83g8XdR62wvKiUjPYudXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591192; c=relaxed/simple;
	bh=yubPvaEZK0vxwclCtPELJ5sI0axGk6ORRtP2sesGHLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FB4EAg+jMWVrebObLhHSCk52qurjnslPCeFEwxi+oMTUH4gzWostn9SVhHUGxN9b6+XYm/UQFnC4xN8SG9ruVpho7K13vqGOH+QvFo+IbwhDCFWl46l8LvqKrnFeVhElgWlGuPNS1bX4FXqIQ8o63B5F9DLlZBvh0p8O2Me27k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EEK0NM6J; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z32FA2NU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EEK0NM6J";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z32FA2NU"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=angzKPUQ8WH0gNbUxVDwpfIDs5MjiCkNcpeGZGsQfvQ=;
	b=EEK0NM6JQStGUhcosxLsW8pbA9q98AzsmDTNOlVT6fclBbldgtjmf6U3HDB9QpEhQduN5t
	X6sg79D5V92cHyxFcjskViTHABorbmStBkG0Mp+kAJaGzlHAINqHaRMHSdTpmg2QOeXZoB
	VmRfAJz3lvZuFwW09vFdb2bizg17u1/A9gURufTxOXjfnsKg4H4odzWlDZQwfbTWOHtlNM
	idTABv0F06YKQ/VbFKeNGlj/8GoTh0Gp1cEq05wnps1KuCiSf9gen8pZzQSKMM1ptLYYVW
	FLO0oTI08kDei5zY8F5vn0IEYOox74VYFPWWSHkoNNUzx7t9afz8IJ+Ou0rLTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=angzKPUQ8WH0gNbUxVDwpfIDs5MjiCkNcpeGZGsQfvQ=;
	b=Z32FA2NUAwb9bDZPt5mZUwlrSJbejI+62IWj1T+1OqIfbxXsAFu/w7TJZPL8ghoS0/NG9y
	9hh3seNdnm9AIxAg==
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
Subject: [PATCH v8 10/15] futex: Introduce futex_get_locked_hb().
Date: Mon,  3 Feb 2025 14:59:30 +0100
Message-ID: <20250203135935.440018-11-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

futex_lock_pi() and __fixup_pi_state_owner() acquire the
futex_q::lock_ptr without holding a reference assuming the previously
obtained hash bucket and the assigned lock_ptr are still valid. This
isn't the case once the private hash can be resized and becomes invalid
after the reference drop.

Introduce futex_get_locked_hb() to lock the hash bucket recorded in
futex_q::lock_ptr. The lock pointer is read in a RCU section to ensure
that it does not go away if the hash bucket has been replaced and the
old pointer has been observed. After locking the pointer needs to be
compared to check if it changed. If so then the hash bucket has been
replaced and the user has been moved to the new one and lock_ptr has
been updated. The lock operation needs to be redone in this case.

Once the lock_ptr is the same, we can return the futex_hash_bucket it
belongs to as the hash bucket for the caller locked. This is important
because we don't own a reference so the hash bucket is valid as long as
we hold the lock.
This means if the local hash is resized then this (old) hash bucket
remains valid as long as we hold the lock because all user need to be
moved to the new hash bucket and have their lock_ptr updated. The task
performing the resize will block.

A special case is an early return in futex_lock_pi() (due to signal or
timeout) and a successful futex_wait_requeue_pi(). In both cases a valid
futex_q::lock_ptr is expected (and its matching hash bucket) but since
the waiter has been removed from the hash this can no longer be guaranteed.
Therefore before the waiter is removed a reference is acquired which is
later dropped by the waiter to avoid a resize.

Add futex_get_locked_hb() and use it.
Acquire an additional reference in requeue_pi_wake_futex() and
futex_unlock_pi() while the futex_q is removed, denote this extra reference
in futex_q::drop_hb_ref and let the waiter drop the reference in this case.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 kernel/futex/futex.h   |  4 +++-
 kernel/futex/pi.c      | 17 +++++++++++++++--
 kernel/futex/requeue.c | 16 ++++++++++++----
 4 files changed, 71 insertions(+), 7 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index b54fcb1c6248d..b0fb2b10a387c 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -156,6 +156,17 @@ void futex_hash_put(struct futex_hash_bucket *hb)
 {
 }
=20
+/**
+ * futex_hash_get - Get an additional reference for the local hash.
+ * @hb:		ptr to the private local hash.
+ *
+ * Obtain an additional reference for the already obtained hash bucket. The
+ * caller must already own an reference.
+ */
+void futex_hash_get(struct futex_hash_bucket *hb)
+{
+}
+
 /**
  * futex_setup_timer - set up the sleeping hrtimer.
  * @time:	ptr to the given timeout value
@@ -639,6 +650,36 @@ int futex_unqueue(struct futex_q *q)
 	return ret;
 }
=20
+struct futex_hash_bucket *futex_get_locked_hb(struct futex_q *q)
+{
+	struct futex_hash_bucket *hb;
+	spinlock_t *lock_ptr;
+
+	/*
+	 * See futex_unqueue() why lock_ptr can change.
+	 */
+	guard(rcu)();
+retry:
+	lock_ptr =3D READ_ONCE(q->lock_ptr);
+	spin_lock(lock_ptr);
+
+	if (unlikely(lock_ptr !=3D q->lock_ptr)) {
+		spin_unlock(lock_ptr);
+		goto retry;
+	}
+
+	hb =3D container_of(lock_ptr, struct futex_hash_bucket, lock);
+	/*
+	 * The caller needs to either hold a reference on the hash (to ensure
+	 * that the hash is not resized) _or_ be enqueued on the hash. This
+	 * ensures that futex_q::lock_ptr is updated while moved to the new
+	 * hash during resize.
+	 * Once the hash bucket is locked the resize operation, which might be
+	 * in progress, will block on the lock.
+	 */
+	return hb;
+}
+
 /*
  * PI futexes can not be requeued and must remove themselves from the hash
  * bucket. The hash bucket lock (i.e. lock_ptr) is held.
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 36627617f7ced..5b33016648ecd 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -182,6 +182,7 @@ struct futex_q {
 	union futex_key *requeue_pi_key;
 	u32 bitset;
 	atomic_t requeue_state;
+	bool drop_hb_ref;
 #ifdef CONFIG_PREEMPT_RT
 	struct rcuwait requeue_wait;
 #endif
@@ -196,12 +197,13 @@ enum futex_access {
=20
 extern int get_futex_key(u32 __user *uaddr, unsigned int flags, union fute=
x_key *key,
 			 enum futex_access rw);
-
+extern struct futex_hash_bucket *futex_get_locked_hb(struct futex_q *q);
 extern struct hrtimer_sleeper *
 futex_setup_timer(ktime_t *time, struct hrtimer_sleeper *timeout,
 		  int flags, u64 range_ns);
=20
 extern struct futex_hash_bucket *futex_hash(union futex_key *key);
+extern void futex_hash_get(struct futex_hash_bucket *hb);
 extern void futex_hash_put(struct futex_hash_bucket *hb);
=20
 /**
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index 797270228665a..c83fe575f954a 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -806,7 +806,7 @@ static int __fixup_pi_state_owner(u32 __user *uaddr, st=
ruct futex_q *q,
 		break;
 	}
=20
-	spin_lock(q->lock_ptr);
+	futex_get_locked_hb(q);
 	raw_spin_lock_irq(&pi_state->pi_mutex.wait_lock);
=20
 	/*
@@ -922,6 +922,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags=
, ktime_t *time, int tryl
 	struct rt_mutex_waiter rt_waiter;
 	struct futex_hash_bucket *hb;
 	struct futex_q q =3D futex_q_init;
+	bool fast_path_ref_put =3D false;
 	DEFINE_WAKE_Q(wake_q);
 	int res, ret;
=20
@@ -988,6 +989,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags=
, ktime_t *time, int tryl
 		ret =3D rt_mutex_futex_trylock(&q.pi_state->pi_mutex);
 		/* Fixup the trylock return value: */
 		ret =3D ret ? 0 : -EWOULDBLOCK;
+		fast_path_ref_put =3D true;
 		goto no_block;
 	}
=20
@@ -1014,6 +1016,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int fla=
gs, ktime_t *time, int tryl
 	 */
 	raw_spin_lock_irq(&q.pi_state->pi_mutex.wait_lock);
 	spin_unlock(q.lock_ptr);
+	futex_hash_put(hb);
 	/*
 	 * __rt_mutex_start_proxy_lock() unconditionally enqueues the @rt_waiter
 	 * such that futex_unlock_pi() is guaranteed to observe the waiter when
@@ -1060,7 +1063,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int fla=
gs, ktime_t *time, int tryl
 	 * spinlock/rtlock (which might enqueue its own rt_waiter) and fix up
 	 * the
 	 */
-	spin_lock(q.lock_ptr);
+	hb =3D futex_get_locked_hb(&q);
 	/*
 	 * Waiter is unqueued.
 	 */
@@ -1080,6 +1083,10 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int fl=
ags, ktime_t *time, int tryl
=20
 	futex_unqueue_pi(&q);
 	spin_unlock(q.lock_ptr);
+	if (q.drop_hb_ref)
+		futex_hash_put(hb);
+	if (fast_path_ref_put)
+		futex_hash_put(hb);
 	goto out;
=20
 out_unlock_put_key:
@@ -1187,6 +1194,12 @@ int futex_unlock_pi(u32 __user *uaddr, unsigned int =
flags)
 		 */
 		rt_waiter =3D rt_mutex_top_waiter(&pi_state->pi_mutex);
 		if (!rt_waiter) {
+			/*
+			 * Acquire a reference for the leaving waiter to ensure
+			 * valid futex_q::lock_ptr.
+			 */
+			futex_hash_get(hb);
+			top_waiter->drop_hb_ref =3D true;
 			__futex_unqueue(top_waiter);
 			raw_spin_unlock_irq(&pi_state->pi_mutex.wait_lock);
 			goto retry_hb;
diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index 31ec543e7fdb3..167204e856fec 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -231,7 +231,12 @@ void requeue_pi_wake_futex(struct futex_q *q, union fu=
tex_key *key,
=20
 	WARN_ON(!q->rt_waiter);
 	q->rt_waiter =3D NULL;
-
+	/*
+	 * Acquire a reference for the waiter to ensure valid
+	 * futex_q::lock_ptr.
+	 */
+	futex_hash_get(hb);
+	q->drop_hb_ref =3D true;
 	q->lock_ptr =3D &hb->lock;
=20
 	/* Signal locked state to the waiter */
@@ -825,7 +830,8 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned i=
nt flags,
 	switch (futex_requeue_pi_wakeup_sync(&q)) {
 	case Q_REQUEUE_PI_IGNORE:
 		/* The waiter is still on uaddr1 */
-		spin_lock(&hb->lock);
+		hb =3D futex_get_locked_hb(&q);
+
 		ret =3D handle_early_requeue_pi_wakeup(hb, &q, to);
 		spin_unlock(&hb->lock);
 		break;
@@ -833,7 +839,7 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned i=
nt flags,
 	case Q_REQUEUE_PI_LOCKED:
 		/* The requeue acquired the lock */
 		if (q.pi_state && (q.pi_state->owner !=3D current)) {
-			spin_lock(q.lock_ptr);
+			futex_get_locked_hb(&q);
 			ret =3D fixup_pi_owner(uaddr2, &q, true);
 			/*
 			 * Drop the reference to the pi state which the
@@ -860,7 +866,7 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned i=
nt flags,
 		if (ret && !rt_mutex_cleanup_proxy_lock(pi_mutex, &rt_waiter))
 			ret =3D 0;
=20
-		spin_lock(q.lock_ptr);
+		futex_get_locked_hb(&q);
 		debug_rt_mutex_free_waiter(&rt_waiter);
 		/*
 		 * Fixup the pi_state owner and possibly acquire the lock if we
@@ -892,6 +898,8 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned i=
nt flags,
 	default:
 		BUG();
 	}
+	if (q.drop_hb_ref)
+		futex_hash_put(hb);
=20
 out:
 	if (to) {
--=20
2.47.2

