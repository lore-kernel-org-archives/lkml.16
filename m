Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C563F2066F4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041479; cv=none; b=dhwX8IiF1ey7DHxD3djEnRN+DqLIXiuQes5G524LFrzUzqfDDtRu8y2QRRqW9nxnl/uqiGGeMRfhros3mhc1J/IX1fhj03DYLl8AX5WnzbrmXXKg6erlt77Ny2e0AkeHpIBgXlgtdFu5OXwkjVUe0KIssHJ9eppdHDtfFRba07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041479; c=relaxed/simple;
	bh=Tz3tKtMfkavplRfjYzFXa6eDnDp9KlBblyszTAglji4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcTVsPt7cH0LvK2gJxCNtAAr7TT4SOp5JQzi7OMHf39+s4SUCscQgQ8w87VMHIADfG6uOMT60tfw1TysbJzqHdm4j24ko7CVtGz1MWbhCgyEX1Qsiv+Kz2dxWXVizK/uHzIM/+9dt7tTLoPzbs22w7r8daMWxKIRkldYorf+uzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O3qVRdjX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bZyz/ryo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O3qVRdjX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bZyz/ryo"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYDmteyotmxSvdzWVDZHQvIyBpNiHBANshGe93sbcrI=;
	b=O3qVRdjXDkiCjekkN3MDGSb38nSqU5bGzS9uOw2fBwf2/+lKl+ACHk0Ju9NpZTAxOeSrAy
	T5ewq+7eUr2GOGdiXYu51khCQ3rv7U5HE4sMDXBXyuUJ2zLmpBniH2lOIx+BwyCi1jlJ+3
	cHXZCePfOYXHVv9KCga4YpUKqWtMsJ0z++d9/6PqLybCmMMI53GY9lrhDaeq9LBKtStJny
	kMd8uUiJBRgaaStAM2xNNh/Sw8bndTCpEevHSCIzOvrarEWXiV03/jxs8/Ib3FmJeBe9gN
	JRDx1VqrL4zVcHR3+OSN4oZg0N/z10pA7RxMmus9nHZy9Tgv3JIz08n24TDx5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYDmteyotmxSvdzWVDZHQvIyBpNiHBANshGe93sbcrI=;
	b=bZyz/ryo00RUcLryearQqZmIHoQE5mbcceAR20KBtm0bsVFpYC4w149rKXspjNkR6ZHzC5
	TdSkkf6cbpNw2ACQ==
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
Subject: [PATCH v11 14/19] futex: Allow to resize the private local hash.
Date: Mon,  7 Apr 2025 17:57:37 +0200
Message-ID: <20250407155742.968816-15-bigeasy@linutronix.de>
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The mm_struct::futex_hash_lock guards the futex_hash_bucket assignment/
replacement. The futex_hash_allocate()/ PR_FUTEX_HASH_SET_SLOTS
operation can now be invoked at runtime and resize an already existing
internal private futex_hash_bucket to another size.

The reallocation is based on an idea by Thomas Gleixner: The initial
allocation of struct futex_private_hash sets the reference count
to one. Every user acquires a reference on the local hash before using
it and drops it after it enqueued itself on the hash bucket. There is no
reference held while the task is scheduled out while waiting for the
wake up.
The resize process allocates a new struct futex_private_hash and drops
the initial reference. Synchronized with mm_struct::futex_hash_lock it
is checked if the reference counter for the currently used
mm_struct::futex_phash is marked as DEAD. If so, then all users enqueued
on the current private hash are requeued on the new private hash and the
new private hash is set to mm_struct::futex_phash. Otherwise the newly
allocated private hash is saved as mm_struct::futex_phash_new and the
rehashing and reassigning is delayed to the futex_hash() caller once the
reference counter is marked DEAD.
The replacement is not performed at rcuref_put() time because certain
callers, such as futex_wait_queue(), drop their reference after changing
the task state. This change will be destroyed once the futex_hash_lock
is acquired.

The user can change the number slots with PR_FUTEX_HASH_SET_SLOTS
multiple times. An increase and decrease is allowed and request blocks
until the assignment is done.

The private hash allocated at thread creation is changed from 16 to
  16 <=3D 4 * number_of_threads <=3D global_hash_size
where number_of_threads can not exceed the number of online CPUs. Should
the user PR_FUTEX_HASH_SET_SLOTS then the auto scaling is disabled.

[peterz: reorganize the code to avoid state tracking and simplify new
object handling, block the user until changes are in effect, allow
increase and decrease of the hash].

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/futex.h    |   3 +-
 include/linux/mm_types.h |   4 +-
 kernel/futex/core.c      | 290 ++++++++++++++++++++++++++++++++++++---
 kernel/futex/requeue.c   |   5 +
 4 files changed, 281 insertions(+), 21 deletions(-)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index 0e147819ae153..0cb4c6d512dfb 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -85,7 +85,8 @@ void futex_hash_free(struct mm_struct *mm);
=20
 static inline void futex_mm_init(struct mm_struct *mm)
 {
-	mm->futex_phash =3D  NULL;
+	rcu_assign_pointer(mm->futex_phash, NULL);
+	mutex_init(&mm->futex_hash_lock);
 }
=20
 #else /* !CONFIG_FUTEX_PRIVATE_HASH */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index a4b5661e41770..32ba5126e2214 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1033,7 +1033,9 @@ struct mm_struct {
 		seqcount_t mm_lock_seq;
 #endif
 #ifdef CONFIG_FUTEX_PRIVATE_HASH
-		struct futex_private_hash	*futex_phash;
+		struct mutex			futex_hash_lock;
+		struct futex_private_hash	__rcu *futex_phash;
+		struct futex_private_hash	*futex_phash_new;
 #endif
=20
 		unsigned long hiwater_rss; /* High-watermark of RSS usage */
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index a8ede52bf7e63..220ddc7620e49 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -40,6 +40,7 @@
 #include <linux/fault-inject.h>
 #include <linux/slab.h>
 #include <linux/prctl.h>
+#include <linux/rcuref.h>
=20
 #include "futex.h"
 #include "../locking/rtmutex_common.h"
@@ -57,7 +58,9 @@ static struct {
 #define futex_hashmask (__futex_data.hashmask)
=20
 struct futex_private_hash {
+	rcuref_t	users;
 	unsigned int	hash_mask;
+	struct rcu_head	rcu;
 	void		*mm;
 	bool		custom;
 	struct futex_hash_bucket queues[];
@@ -129,11 +132,14 @@ static inline bool futex_key_is_private(union futex_k=
ey *key)
=20
 bool futex_private_hash_get(struct futex_private_hash *fph)
 {
-	return false;
+	return rcuref_get(&fph->users);
 }
=20
 void futex_private_hash_put(struct futex_private_hash *fph)
 {
+	/* Ignore return value, last put is verified via rcuref_is_dead() */
+	if (rcuref_put(&fph->users))
+		wake_up_var(fph->mm);
 }
=20
 /**
@@ -143,8 +149,23 @@ void futex_private_hash_put(struct futex_private_hash =
*fph)
  * Obtain an additional reference for the already obtained hash bucket. The
  * caller must already own an reference.
  */
-void futex_hash_get(struct futex_hash_bucket *hb) { }
-void futex_hash_put(struct futex_hash_bucket *hb) { }
+void futex_hash_get(struct futex_hash_bucket *hb)
+{
+	struct futex_private_hash *fph =3D hb->priv;
+
+	if (!fph)
+		return;
+	WARN_ON_ONCE(!futex_private_hash_get(fph));
+}
+
+void futex_hash_put(struct futex_hash_bucket *hb)
+{
+	struct futex_private_hash *fph =3D hb->priv;
+
+	if (!fph)
+		return;
+	futex_private_hash_put(fph);
+}
=20
 static struct futex_hash_bucket *
 __futex_hash_private(union futex_key *key, struct futex_private_hash *fph)
@@ -155,7 +176,7 @@ __futex_hash_private(union futex_key *key, struct futex=
_private_hash *fph)
 		return NULL;
=20
 	if (!fph)
-		fph =3D key->private.mm->futex_phash;
+		fph =3D rcu_dereference(key->private.mm->futex_phash);
 	if (!fph || !fph->hash_mask)
 		return NULL;
=20
@@ -165,21 +186,119 @@ __futex_hash_private(union futex_key *key, struct fu=
tex_private_hash *fph)
 	return &fph->queues[hash & fph->hash_mask];
 }
=20
+static void futex_rehash_private(struct futex_private_hash *old,
+				 struct futex_private_hash *new)
+{
+	struct futex_hash_bucket *hb_old, *hb_new;
+	unsigned int slots =3D old->hash_mask + 1;
+	unsigned int i;
+
+	for (i =3D 0; i < slots; i++) {
+		struct futex_q *this, *tmp;
+
+		hb_old =3D &old->queues[i];
+
+		spin_lock(&hb_old->lock);
+		plist_for_each_entry_safe(this, tmp, &hb_old->chain, list) {
+
+			plist_del(&this->list, &hb_old->chain);
+			futex_hb_waiters_dec(hb_old);
+
+			WARN_ON_ONCE(this->lock_ptr !=3D &hb_old->lock);
+
+			hb_new =3D __futex_hash(&this->key, new);
+			futex_hb_waiters_inc(hb_new);
+			/*
+			 * The new pointer isn't published yet but an already
+			 * moved user can be unqueued due to timeout or signal.
+			 */
+			spin_lock_nested(&hb_new->lock, SINGLE_DEPTH_NESTING);
+			plist_add(&this->list, &hb_new->chain);
+			this->lock_ptr =3D &hb_new->lock;
+			spin_unlock(&hb_new->lock);
+		}
+		spin_unlock(&hb_old->lock);
+	}
+}
+
+static bool __futex_pivot_hash(struct mm_struct *mm,
+			       struct futex_private_hash *new)
+{
+	struct futex_private_hash *fph;
+
+	WARN_ON_ONCE(mm->futex_phash_new);
+
+	fph =3D rcu_dereference_protected(mm->futex_phash,
+					lockdep_is_held(&mm->futex_hash_lock));
+	if (fph) {
+		if (!rcuref_is_dead(&fph->users)) {
+			mm->futex_phash_new =3D new;
+			return false;
+		}
+
+		futex_rehash_private(fph, new);
+	}
+	rcu_assign_pointer(mm->futex_phash, new);
+	kvfree_rcu(fph, rcu);
+	return true;
+}
+
+static void futex_pivot_hash(struct mm_struct *mm)
+{
+	scoped_guard(mutex, &mm->futex_hash_lock) {
+		struct futex_private_hash *fph;
+
+		fph =3D mm->futex_phash_new;
+		if (fph) {
+			mm->futex_phash_new =3D NULL;
+			__futex_pivot_hash(mm, fph);
+		}
+	}
+}
+
 struct futex_private_hash *futex_private_hash(void)
 {
 	struct mm_struct *mm =3D current->mm;
-	struct futex_private_hash *fph;
+	/*
+	 * Ideally we don't loop. If there is a replacement in progress
+	 * then a new private hash is already prepared and a reference can't be
+	 * obtained once the last user dropped it's.
+	 * In that case we block on mm_struct::futex_hash_lock and either have
+	 * to perform the replacement or wait while someone else is doing the
+	 * job. Eitherway, on the second iteration we acquire a reference on the
+	 * new private hash or loop again because a new replacement has been
+	 * requested.
+	 */
+again:
+	scoped_guard(rcu) {
+		struct futex_private_hash *fph;
=20
-	fph =3D mm->futex_phash;
-	return fph;
+		fph =3D rcu_dereference(mm->futex_phash);
+		if (!fph)
+			return NULL;
+
+		if (rcuref_get(&fph->users))
+			return fph;
+	}
+	futex_pivot_hash(mm);
+	goto again;
 }
=20
 struct futex_hash_bucket *futex_hash(union futex_key *key)
 {
+	struct futex_private_hash *fph;
 	struct futex_hash_bucket *hb;
=20
-	hb =3D __futex_hash(key, NULL);
-	return hb;
+again:
+	scoped_guard(rcu) {
+		hb =3D __futex_hash(key, NULL);
+		fph =3D hb->priv;
+
+		if (!fph || futex_private_hash_get(fph))
+			return hb;
+	}
+	futex_pivot_hash(key->private.mm);
+	goto again;
 }
=20
 #else /* !CONFIG_FUTEX_PRIVATE_HASH */
@@ -664,6 +783,8 @@ int futex_unqueue(struct futex_q *q)
 	spinlock_t *lock_ptr;
 	int ret =3D 0;
=20
+	/* RCU so lock_ptr is not going away during locking. */
+	guard(rcu)();
 	/* In the common case we don't take the spinlock, which is nice. */
 retry:
 	/*
@@ -1065,6 +1186,10 @@ static void exit_pi_state_list(struct task_struct *c=
urr)
 	struct futex_pi_state *pi_state;
 	union futex_key key =3D FUTEX_KEY_INIT;
=20
+	/*
+	 * The mutex mm_struct::futex_hash_lock might be acquired.
+	 */
+	might_sleep();
 	/*
 	 * Ensure the hash remains stable (no resize) during the while loop
 	 * below. The hb pointer is acquired under the pi_lock so we can't block
@@ -1261,7 +1386,51 @@ static void futex_hash_bucket_init(struct futex_hash=
_bucket *fhb,
 #ifdef CONFIG_FUTEX_PRIVATE_HASH
 void futex_hash_free(struct mm_struct *mm)
 {
-	kvfree(mm->futex_phash);
+	struct futex_private_hash *fph;
+
+	kvfree(mm->futex_phash_new);
+	fph =3D rcu_dereference_raw(mm->futex_phash);
+	if (fph) {
+		WARN_ON_ONCE(rcuref_read(&fph->users) > 1);
+		kvfree(fph);
+	}
+}
+
+static bool futex_pivot_pending(struct mm_struct *mm)
+{
+	struct futex_private_hash *fph;
+
+	guard(rcu)();
+
+	if (!mm->futex_phash_new)
+		return true;
+
+	fph =3D rcu_dereference(mm->futex_phash);
+	return rcuref_is_dead(&fph->users);
+}
+
+static bool futex_hash_less(struct futex_private_hash *a,
+			    struct futex_private_hash *b)
+{
+	/* user provided always wins */
+	if (!a->custom && b->custom)
+		return true;
+	if (a->custom && !b->custom)
+		return false;
+
+	/* zero-sized hash wins */
+	if (!b->hash_mask)
+		return true;
+	if (!a->hash_mask)
+		return false;
+
+	/* keep the biggest */
+	if (a->hash_mask < b->hash_mask)
+		return true;
+	if (a->hash_mask > b->hash_mask)
+		return false;
+
+	return false; /* equal */
 }
=20
 static int futex_hash_allocate(unsigned int hash_slots, bool custom)
@@ -1273,16 +1442,23 @@ static int futex_hash_allocate(unsigned int hash_sl=
ots, bool custom)
 	if (hash_slots && (hash_slots =3D=3D 1 || !is_power_of_2(hash_slots)))
 		return -EINVAL;
=20
-	if (mm->futex_phash)
-		return -EALREADY;
-
-	if (!thread_group_empty(current))
-		return -EINVAL;
+	/*
+	 * Once we've disabled the global hash there is no way back.
+	 */
+	scoped_guard(rcu) {
+		fph =3D rcu_dereference(mm->futex_phash);
+		if (fph && !fph->hash_mask) {
+			if (custom)
+				return -EBUSY;
+			return 0;
+		}
+	}
=20
 	fph =3D kvzalloc(struct_size(fph, queues, hash_slots), GFP_KERNEL_ACCOUNT=
);
 	if (!fph)
 		return -ENOMEM;
=20
+	rcuref_init(&fph->users, 1);
 	fph->hash_mask =3D hash_slots ? hash_slots - 1 : 0;
 	fph->custom =3D custom;
 	fph->mm =3D mm;
@@ -1290,26 +1466,102 @@ static int futex_hash_allocate(unsigned int hash_s=
lots, bool custom)
 	for (i =3D 0; i < hash_slots; i++)
 		futex_hash_bucket_init(&fph->queues[i], fph);
=20
-	mm->futex_phash =3D fph;
+	if (custom) {
+		/*
+		 * Only let prctl() wait / retry; don't unduly delay clone().
+		 */
+again:
+		wait_var_event(mm, futex_pivot_pending(mm));
+	}
+
+	scoped_guard(mutex, &mm->futex_hash_lock) {
+		struct futex_private_hash *free __free(kvfree) =3D NULL;
+		struct futex_private_hash *cur, *new;
+
+		cur =3D rcu_dereference_protected(mm->futex_phash,
+						lockdep_is_held(&mm->futex_hash_lock));
+		new =3D mm->futex_phash_new;
+		mm->futex_phash_new =3D NULL;
+
+		if (fph) {
+			if (cur && !new) {
+				/*
+				 * If we have an existing hash, but do not yet have
+				 * allocated a replacement hash, drop the initial
+				 * reference on the existing hash.
+				 */
+				futex_private_hash_put(cur);
+			}
+
+			if (new) {
+				/*
+				 * Two updates raced; throw out the lesser one.
+				 */
+				if (futex_hash_less(new, fph)) {
+					free =3D new;
+					new =3D fph;
+				} else {
+					free =3D fph;
+				}
+			} else {
+				new =3D fph;
+			}
+			fph =3D NULL;
+		}
+
+		if (new) {
+			/*
+			 * Will set mm->futex_phash_new on failure;
+			 * futex_private_hash_get() will try again.
+			 */
+			if (!__futex_pivot_hash(mm, new) && custom)
+				goto again;
+		}
+	}
 	return 0;
 }
=20
 int futex_hash_allocate_default(void)
 {
+	unsigned int threads, buckets, current_buckets =3D 0;
+	struct futex_private_hash *fph;
+
 	if (!current->mm)
 		return 0;
=20
-	if (current->mm->futex_phash)
+	scoped_guard(rcu) {
+		threads =3D min_t(unsigned int,
+				get_nr_threads(current),
+				num_online_cpus());
+
+		fph =3D rcu_dereference(current->mm->futex_phash);
+		if (fph) {
+			if (fph->custom)
+				return 0;
+
+			current_buckets =3D fph->hash_mask + 1;
+		}
+	}
+
+	/*
+	 * The default allocation will remain within
+	 *   16 <=3D threads * 4 <=3D global hash size
+	 */
+	buckets =3D roundup_pow_of_two(4 * threads);
+	buckets =3D clamp(buckets, 16, futex_hashmask + 1);
+
+	if (current_buckets >=3D buckets)
 		return 0;
=20
-	return futex_hash_allocate(16, false);
+	return futex_hash_allocate(buckets, false);
 }
=20
 static int futex_hash_get_slots(void)
 {
 	struct futex_private_hash *fph;
=20
-	fph =3D current->mm->futex_phash;
+	guard(rcu)();
+	fph =3D rcu_dereference(current->mm->futex_phash);
 	if (fph && fph->hash_mask)
 		return fph->hash_mask + 1;
 	return 0;
diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index b0e64fd454d96..c716a66f86929 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -87,6 +87,11 @@ void requeue_futex(struct futex_q *q, struct futex_hash_=
bucket *hb1,
 		futex_hb_waiters_inc(hb2);
 		plist_add(&q->list, &hb2->chain);
 		q->lock_ptr =3D &hb2->lock;
+		/*
+		 * hb1 and hb2 belong to the same futex_hash_bucket_private
+		 * because if we managed get a reference on hb1 then it can't be
+		 * replaced. Therefore we avoid put(hb1)+get(hb2) here.
+		 */
 	}
 	q->key =3D *key2;
 }
--=20
2.49.0

