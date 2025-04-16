Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B7F217679
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820974; cv=none; b=CMVfO9GfIxwE2dhNgRtmhwBI6u59n8LVoIFP+hYWA0kM+JhNZ67NlpbCZYxg2XY5VmOPate9/DP07bU7RPV9F20xpyEND9ahTlGfEdwbJY9Zo6omDQphB+YGwES29ZAV1lSB1l+gSjnSdAvIgWQFEYNc/uTZZVrzJA3Mohmy2DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820974; c=relaxed/simple;
	bh=4RVs5yFFOy+skWJbJ0/tGqbCUNWFm8fmZA1dFb0K0h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMvSqYLxHHPRGSnCxPAc3SRcTVjwgWaIZmaWW/ArVA3Leoabjox/Z/I9OdREXQFCqpm0CI5GJCu8RKjgKgjeONRojWrfzO6OrVYgPS4hBLLb2gO1hnRfDxoX1UFgehhfBt3mn+BrO4i5mg7m0xxA3AzqQ9DiaaBM03SNB7SUhhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bs+/vFS9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X1FU8SgH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bs+/vFS9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X1FU8SgH"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744820968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZv5mCM9VZtVeecvyTzEV6NiEWP8t+URKBFUyOq84PE=;
	b=bs+/vFS9WTwXQO/ULpH2/0vAgTqygfJRMTST3dyCKbH8nSGdKe9U51TZUiZXLa7QnXYEz8
	463EJsWre3yJIYgBOjc2momDvLzs8K0NMhCTysOVpeo6/fGjSkWUiDEzAG3bFEdxv96UvA
	re392JFyzlgze3r86WDOuqmzx8Id+NBl9y3hiuXhF2yME4fRX5RerMbsgeZ1vDsbiukDrM
	a9hfjnXc3btBPuTWh7Aos1gCQ3IrQq03TQprm65wCiEEyRx0iMPq2i8F5GQdhykzxNK/hO
	IYfPddceWXjSio42WNvOdpNFKZhY8iCmWQQcYFKuAkXWqNXM5pYhOovZfjJusQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744820968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZv5mCM9VZtVeecvyTzEV6NiEWP8t+URKBFUyOq84PE=;
	b=X1FU8SgHYV9tJmvuUF9LaFnIbjMUSgni+Be+pd00We03+HwDPidtxcOr9QscacWWN1gzla
	0xx1zenkGyq6ybBw==
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
Subject: [PATCH v12 06/21] futex: Create futex_hash() get/put class
Date: Wed, 16 Apr 2025 18:29:06 +0200
Message-ID: <20250416162921.513656-7-bigeasy@linutronix.de>
In-Reply-To: <20250416162921.513656-1-bigeasy@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Zijlstra <peterz@infradead.org>

This gets us:

  hb =3D futex_hash(key) /* gets hb and inc users */
  futex_hash_get(hb)   /* inc users */
  futex_hash_put(hb)   /* dec users */

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c     |  6 +++---
 kernel/futex/futex.h    |  7 +++++++
 kernel/futex/pi.c       | 16 ++++++++++++----
 kernel/futex/requeue.c  | 10 +++-------
 kernel/futex/waitwake.c | 15 +++++----------
 5 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index e4cb5ce9785b1..56a5653e450cb 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -122,6 +122,8 @@ struct futex_hash_bucket *futex_hash(union futex_key *k=
ey)
 	return &futex_queues[hash & futex_hashmask];
 }
=20
+void futex_hash_get(struct futex_hash_bucket *hb) { }
+void futex_hash_put(struct futex_hash_bucket *hb) { }
=20
 /**
  * futex_setup_timer - set up the sleeping hrtimer.
@@ -957,9 +959,7 @@ static void exit_pi_state_list(struct task_struct *curr)
 		pi_state =3D list_entry(next, struct futex_pi_state, list);
 		key =3D pi_state->key;
 		if (1) {
-			struct futex_hash_bucket *hb;
-
-			hb =3D futex_hash(&key);
+			CLASS(hb, hb)(&key);
=20
 			/*
 			 * We can race against put_pi_state() removing itself from the
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index a219903e52084..77d9b3509f75c 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -7,6 +7,7 @@
 #include <linux/sched/wake_q.h>
 #include <linux/compat.h>
 #include <linux/uaccess.h>
+#include <linux/cleanup.h>
=20
 #ifdef CONFIG_PREEMPT_RT
 #include <linux/rcuwait.h>
@@ -202,6 +203,12 @@ futex_setup_timer(ktime_t *time, struct hrtimer_sleepe=
r *timeout,
 		  int flags, u64 range_ns);
=20
 extern struct futex_hash_bucket *futex_hash(union futex_key *key);
+extern void futex_hash_get(struct futex_hash_bucket *hb);
+extern void futex_hash_put(struct futex_hash_bucket *hb);
+
+DEFINE_CLASS(hb, struct futex_hash_bucket *,
+	     if (_T) futex_hash_put(_T),
+	     futex_hash(key), union futex_key *key);
=20
 /**
  * futex_match - Check whether two futex keys are equal
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index a56f28fda58dd..e52f540e81b6a 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -939,9 +939,8 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags=
, ktime_t *time, int tryl
=20
 retry_private:
 	if (1) {
-		struct futex_hash_bucket *hb;
+		CLASS(hb, hb)(&q.key);
=20
-		hb =3D futex_hash(&q.key);
 		futex_q_lock(&q, hb);
=20
 		ret =3D futex_lock_pi_atomic(uaddr, hb, &q.key, &q.pi_state, current,
@@ -994,6 +993,16 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flag=
s, ktime_t *time, int tryl
 			goto no_block;
 		}
=20
+		/*
+		 * Caution; releasing @hb in-scope. The hb->lock is still locked
+		 * while the reference is dropped. The reference can not be dropped
+		 * after the unlock because if a user initiated resize is in progress
+		 * then we might need to wake him. This can not be done after the
+		 * rt_mutex_pre_schedule() invocation. The hb will remain valid because
+		 * the thread, performing resize, will block on hb->lock during
+		 * the requeue.
+		 */
+		futex_hash_put(no_free_ptr(hb));
 		/*
 		 * Must be done before we enqueue the waiter, here is unfortunately
 		 * under the hb lock, but that *should* work because it does nothing.
@@ -1119,7 +1128,6 @@ int futex_unlock_pi(u32 __user *uaddr, unsigned int f=
lags)
 {
 	u32 curval, uval, vpid =3D task_pid_vnr(current);
 	union futex_key key =3D FUTEX_KEY_INIT;
-	struct futex_hash_bucket *hb;
 	struct futex_q *top_waiter;
 	int ret;
=20
@@ -1139,7 +1147,7 @@ int futex_unlock_pi(u32 __user *uaddr, unsigned int f=
lags)
 	if (ret)
 		return ret;
=20
-	hb =3D futex_hash(&key);
+	CLASS(hb, hb)(&key);
 	spin_lock(&hb->lock);
 retry_hb:
=20
diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index 209794cad6f2f..992e3ce005c6f 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -444,10 +444,8 @@ int futex_requeue(u32 __user *uaddr1, unsigned int fla=
gs1,
=20
 retry_private:
 	if (1) {
-		struct futex_hash_bucket *hb1, *hb2;
-
-		hb1 =3D futex_hash(&key1);
-		hb2 =3D futex_hash(&key2);
+		CLASS(hb, hb1)(&key1);
+		CLASS(hb, hb2)(&key2);
=20
 		futex_hb_waiters_inc(hb2);
 		double_lock_hb(hb1, hb2);
@@ -817,9 +815,7 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned i=
nt flags,
 	switch (futex_requeue_pi_wakeup_sync(&q)) {
 	case Q_REQUEUE_PI_IGNORE:
 		{
-			struct futex_hash_bucket *hb;
-
-			hb =3D futex_hash(&q.key);
+			CLASS(hb, hb)(&q.key);
 			/* The waiter is still on uaddr1 */
 			spin_lock(&hb->lock);
 			ret =3D handle_early_requeue_pi_wakeup(hb, &q, to);
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index 7dc35be09e436..d52541bcc07e9 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -154,7 +154,6 @@ void futex_wake_mark(struct wake_q_head *wake_q, struct=
 futex_q *q)
  */
 int futex_wake(u32 __user *uaddr, unsigned int flags, int nr_wake, u32 bit=
set)
 {
-	struct futex_hash_bucket *hb;
 	struct futex_q *this, *next;
 	union futex_key key =3D FUTEX_KEY_INIT;
 	DEFINE_WAKE_Q(wake_q);
@@ -170,7 +169,7 @@ int futex_wake(u32 __user *uaddr, unsigned int flags, i=
nt nr_wake, u32 bitset)
 	if ((flags & FLAGS_STRICT) && !nr_wake)
 		return 0;
=20
-	hb =3D futex_hash(&key);
+	CLASS(hb, hb)(&key);
=20
 	/* Make sure we really have tasks to wakeup */
 	if (!futex_hb_waiters_pending(hb))
@@ -267,10 +266,8 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int fla=
gs, u32 __user *uaddr2,
=20
 retry_private:
 	if (1) {
-		struct futex_hash_bucket *hb1, *hb2;
-
-		hb1 =3D futex_hash(&key1);
-		hb2 =3D futex_hash(&key2);
+		CLASS(hb, hb1)(&key1);
+		CLASS(hb, hb2)(&key2);
=20
 		double_lock_hb(hb1, hb2);
 		op_ret =3D futex_atomic_op_inuser(op, uaddr2);
@@ -444,9 +441,8 @@ int futex_wait_multiple_setup(struct futex_vector *vs, =
int count, int *woken)
 		u32 val =3D vs[i].w.val;
=20
 		if (1) {
-			struct futex_hash_bucket *hb;
+			CLASS(hb, hb)(&q->key);
=20
-			hb =3D futex_hash(&q->key);
 			futex_q_lock(q, hb);
 			ret =3D futex_get_value_locked(&uval, uaddr);
=20
@@ -618,9 +614,8 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsign=
ed int flags,
=20
 retry_private:
 	if (1) {
-		struct futex_hash_bucket *hb;
+		CLASS(hb, hb)(&q->key);
=20
-		hb =3D futex_hash(&q->key);
 		futex_q_lock(q, hb);
=20
 		ret =3D futex_get_value_locked(&uval, uaddr);
--=20
2.49.0

