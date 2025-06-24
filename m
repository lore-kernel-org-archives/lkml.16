Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB8B307496
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791686; cv=none; b=Dp1Bpc5Ni17wMpAkpsy8Q0YbKsBVWAd98XBMyMCo6lYumX/OCp4VowWbfZnnSoGSR/ERGMo2auZDF4InD22GKs7FshcegdJkvG/y8mRC8aD5BkFrHkYjbvdhwTc4kjraG6E27YIM5OY4tTQ2PUqoa5nLNNRc4WqwDrdGPtCfdp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791686; c=relaxed/simple;
	bh=NTbTSItUgVE9/Bsh/xikMpsoTCBDProJ8pw3I95/Zes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YM6xHUBKurfGq+vbmMgZ5NxYp6ZD9XTfR1gLvMn2ucp+zNtdly6AoHxhzOEyT7VVxfFfUlCq+22oA0dK9zKl23rToHm1/Oe/EjOETX+xL7WTLxMWdE1icBVmzVQFwbTfeIJBm1jLi5wCWSOXwQPe5pepgNt9peMcNDFjoVcuKOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rfLkPrn1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rfLkPrn1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P70Dp+RvfffTKzpsdOKQTOFC8Y6uuF3EzU8USAJQXoA=; b=rfLkPrn1iD9dY36JF+pGuwOAoX
	lKg6+oDaIzQSZv8fieD1h/UkPE0Y2wp6g1tm3dCorUa1EenvuBY98BJHOlszvdRLb/3ymXlWBqL+v
	bv484AJMdacqnV9MZl0zS3xNqSWQwIQg4YKtAt5jRCknQGPe0yU8mpVka12Q5rSakf10jjQz3Rgss
	ez4GGoOymDXpphUoqXlgYS344epJ53macXJSapQ7Rqdd/i9clV+2VFA8n6D7p5Hx0FJ3cC4TFZkMs
	uc7KwxLZkjXHgRMsYUkcjBywIdDq16QHzeTLwQfTTGQHmOuPaOT37fzpAS5/5fjrK5+gx0ze2wXtO
	2KTz8HAw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8tU-00000007PZj-1mdO;
	Tue, 24 Jun 2025 19:01:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 07C15307E4E; Tue, 24 Jun 2025 21:01:19 +0200 (CEST)
Date: Tue, 24 Jun 2025 21:01:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606070638.2Wk45AMk@linutronix.de>

On Fri, Jun 06, 2025 at 09:06:38AM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-05 20:55:27 [-0400], Chris Mason wrote:
> > >> We've got large systems that are basically dedicated to single
> > >> workloads, and those will probably miss the larger global hash table,
> > >> regressing like schbench did.  Then we have large systems spread over
> > >> multiple big workloads that will love the private tables.
> > >>
> > >> In either case, I think growing the hash table as a multiple of thread
> > >> count instead of cpu count will probably better reflect the crazy things
> > >> multi-threaded applications do?  At any rate, I don't think we want
> > >> applications to need prctl to get back to the performance they had on
> > >> older kernels.
> > > 
> > > This is only an issue if all you CPUs spend their time in the kernel
> > > using the hash buckets at the same time.
> > > This was the case in every benchmark I've seen so far. Your thing might
> > > be closer to an actual workload.
> > > 
> > 
> > I didn't spend a ton of time looking at the perf profiles of the slower
> > kernel, was the bottleneck in the hash chain length or in contention for
> > the buckets?
> 
> Every futex operation does a rcuref_get() (which is an atomic inc) on
> the private hash. This is before anything else happens. If you have two
> threads, on two CPUs, which simultaneously do a futex() operation then
> both do this rcuref_get(). That atomic inc ensures that the cacheline
> bounces from one CPU to the other. On the exit of the syscall there is a
> matching rcuref_put().

How about something like this (very lightly tested)...

the TL;DR is that it turns all those refcounts into per-cpu ops when
there is no hash replacement pending (eg. the normal case), and only
folds the lot into an atomic when we really care about it.

There's some sharp corners still.. but it boots and survives the
(slightly modified) selftest.

---
 include/linux/futex.h                              |  12 +-
 include/linux/mm_types.h                           |   5 +
 kernel/futex/core.c                                | 238 +++++++++++++++++++--
 .../selftests/futex/functional/futex_priv_hash.c   |  11 +-
 4 files changed, 239 insertions(+), 27 deletions(-)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index b37193653e6b..5f92c7a8ba57 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -85,17 +85,11 @@ int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4)
 #ifdef CONFIG_FUTEX_PRIVATE_HASH
 int futex_hash_allocate_default(void);
 void futex_hash_free(struct mm_struct *mm);
-
-static inline void futex_mm_init(struct mm_struct *mm)
-{
-	RCU_INIT_POINTER(mm->futex_phash, NULL);
-	mm->futex_phash_new = NULL;
-	mutex_init(&mm->futex_hash_lock);
-}
+int futex_mm_init(struct mm_struct *mm);
 
 #else /* !CONFIG_FUTEX_PRIVATE_HASH */
 static inline int futex_hash_allocate_default(void) { return 0; }
-static inline void futex_hash_free(struct mm_struct *mm) { }
+static inline int futex_hash_free(struct mm_struct *mm) { return 0; }
 static inline void futex_mm_init(struct mm_struct *mm) { }
 #endif /* CONFIG_FUTEX_PRIVATE_HASH */
 
@@ -118,7 +112,7 @@ static inline int futex_hash_allocate_default(void)
 {
 	return 0;
 }
-static inline void futex_hash_free(struct mm_struct *mm) { }
+static inline int futex_hash_free(struct mm_struct *mm) { return 0; }
 static inline void futex_mm_init(struct mm_struct *mm) { }
 
 #endif
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index d6b91e8a66d6..0f0662157066 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1070,6 +1070,11 @@ struct mm_struct {
 		struct mutex			futex_hash_lock;
 		struct futex_private_hash	__rcu *futex_phash;
 		struct futex_private_hash	*futex_phash_new;
+		/* futex-ref */
+		unsigned long			futex_batches;
+		struct rcu_head			futex_rcu;
+		atomic_long_t			futex_atomic;
+		unsigned int			__percpu *futex_ref;
 #endif
 
 		unsigned long hiwater_rss; /* High-watermark of RSS usage */
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 90d53fb0ee9e..cfa7c105a7dc 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -42,7 +42,6 @@
 #include <linux/fault-inject.h>
 #include <linux/slab.h>
 #include <linux/prctl.h>
-#include <linux/rcuref.h>
 #include <linux/mempolicy.h>
 #include <linux/mmap_lock.h>
 
@@ -65,7 +64,7 @@ static struct {
 #define futex_queues	(__futex_data.queues)
 
 struct futex_private_hash {
-	rcuref_t	users;
+	int		state;
 	unsigned int	hash_mask;
 	struct rcu_head	rcu;
 	void		*mm;
@@ -129,6 +128,12 @@ static struct futex_hash_bucket *
 __futex_hash(union futex_key *key, struct futex_private_hash *fph);
 
 #ifdef CONFIG_FUTEX_PRIVATE_HASH
+static bool futex_ref_get(struct futex_private_hash *fph);
+static bool futex_ref_put(struct futex_private_hash *fph);
+static bool futex_ref_is_dead(struct futex_private_hash *fph);
+
+enum { FR_PERCPU = 0, FR_ATOMIC };
+
 static inline bool futex_key_is_private(union futex_key *key)
 {
 	/*
@@ -142,15 +147,14 @@ bool futex_private_hash_get(struct futex_private_hash *fph)
 {
 	if (fph->immutable)
 		return true;
-	return rcuref_get(&fph->users);
+	return futex_ref_get(fph);
 }
 
 void futex_private_hash_put(struct futex_private_hash *fph)
 {
-	/* Ignore return value, last put is verified via rcuref_is_dead() */
 	if (fph->immutable)
 		return;
-	if (rcuref_put(&fph->users))
+	if (futex_ref_put(fph))
 		wake_up_var(fph->mm);
 }
 
@@ -243,14 +247,18 @@ static bool __futex_pivot_hash(struct mm_struct *mm,
 	fph = rcu_dereference_protected(mm->futex_phash,
 					lockdep_is_held(&mm->futex_hash_lock));
 	if (fph) {
-		if (!rcuref_is_dead(&fph->users)) {
+		if (!futex_ref_is_dead(fph)) {
 			mm->futex_phash_new = new;
 			return false;
 		}
 
 		futex_rehash_private(fph, new);
 	}
-	rcu_assign_pointer(mm->futex_phash, new);
+	new->state = FR_PERCPU;
+	scoped_guard (rcu) {
+		mm->futex_batches = get_state_synchronize_rcu();
+		rcu_assign_pointer(mm->futex_phash, new);
+	}
 	kvfree_rcu(fph, rcu);
 	return true;
 }
@@ -289,9 +297,7 @@ struct futex_private_hash *futex_private_hash(void)
 		if (!fph)
 			return NULL;
 
-		if (fph->immutable)
-			return fph;
-		if (rcuref_get(&fph->users))
+		if (futex_private_hash_get(fph))
 			return fph;
 	}
 	futex_pivot_hash(mm);
@@ -1527,16 +1533,214 @@ static void futex_hash_bucket_init(struct futex_hash_bucket *fhb,
 #define FH_IMMUTABLE	0x02
 
 #ifdef CONFIG_FUTEX_PRIVATE_HASH
+
+/*
+ * futex-ref
+ *
+ * Heavily inspired by percpu-rwsem/percpu-refcount; not reusing any of that
+ * code because it just doesn't fit right.
+ *
+ * Dual counter, per-cpu / atomic approach like percpu-refcount, except it
+ * re-initializes the state automatically, such that the fph swizzle is also a
+ * transition back to per-cpu.
+ */
+
+static void futex_ref_rcu(struct rcu_head *head);
+
+static void __futex_ref_atomic_begin(struct futex_private_hash *fph)
+{
+	struct mm_struct *mm = fph->mm;
+
+	/*
+	 * The counter we're about to switch to must have fully switched;
+	 * otherwise it would be impossible for it to have reported success
+	 * from futex_ref_is_dead().
+	 */
+	WARN_ON_ONCE(atomic_long_read(&mm->futex_atomic) != 0);
+
+	/*
+	 * Set the atomic to the bias value such that futex_ref_{get,put}()
+	 * will never observe 0. Will be fixed up in __futex_ref_atomic_end()
+	 * when folding in the percpu count.
+	 */
+	atomic_long_set(&mm->futex_atomic, LONG_MAX);
+	smp_store_release(&fph->state, FR_ATOMIC);
+
+	call_rcu_hurry(&mm->futex_rcu, futex_ref_rcu);
+}
+
+static void __futex_ref_atomic_end(struct futex_private_hash *fph)
+{
+	struct mm_struct *mm = fph->mm;
+	unsigned int count = 0;
+	long ret;
+	int cpu;
+
+	/*
+	 * Per __futex_ref_atomic_begin() the state of the fph must be ATOMIC
+	 * and per this RCU callback, everybody must now observe this state and
+	 * use the atomic variable.
+	 */
+	WARN_ON_ONCE(fph->state != FR_ATOMIC);
+
+	/*
+	 * Therefore the per-cpu counter is now stable, sum and reset.
+	 */
+	for_each_possible_cpu(cpu) {
+		unsigned int *ptr = per_cpu_ptr(mm->futex_ref, cpu);
+		count += *ptr;
+		*ptr = 0;
+	}
+
+	/*
+	 * Re-init for the next cycle.
+	 */
+	this_cpu_inc(*mm->futex_ref); /* 0 -> 1 */
+
+	/*
+	 * Add actual count, subtract bias and initial refcount.
+	 *
+	 * The moment this atomic operation happens, futex_ref_is_dead() can
+	 * become true.
+	 */
+	ret = atomic_long_add_return(count - LONG_MAX - 1, &mm->futex_atomic);
+	if (!ret)
+		wake_up_var(mm);
+
+	WARN_ON_ONCE(ret < 0);
+}
+
+static void futex_ref_rcu(struct rcu_head *head)
+{
+	struct mm_struct *mm = container_of(head, struct mm_struct, futex_rcu);
+	struct futex_private_hash *fph = rcu_dereference_raw(mm->futex_phash);
+
+	if (fph->state == FR_PERCPU) {
+		/*
+		 * Per this extra grace-period, everybody must now observe
+		 * fph as the current fph and no previously observed fph's
+		 * are in-flight.
+		 *
+		 * Notably, nobody will now rely on the atomic
+		 * futex_ref_is_dead() state anymore so we can begin the
+		 * migration of the per-cpu counter into the atomic.
+		 */
+		__futex_ref_atomic_begin(fph);
+		return;
+	}
+
+	__futex_ref_atomic_end(fph);
+}
+
+/*
+ * Drop the initial refcount and transition to atomics.
+ */
+static void futex_ref_drop(struct futex_private_hash *fph)
+{
+	struct mm_struct *mm = fph->mm;
+
+	/*
+	 * Can only transition the current fph;
+	 */
+	WARN_ON_ONCE(rcu_dereference_raw(mm->futex_phash) != fph);
+
+	/*
+	 * In order to avoid the following scenario:
+	 *
+	 * futex_hash()			__futex_pivot_hash()
+	 *   guard(rcu);		  guard(mm->futex_hash_lock);
+	 *   fph = mm->futex_phash;
+	 *				  rcu_assign_pointer(&mm->futex_phash, new);
+	 *				futex_hash_allocate()
+	 *				  futex_ref_drop()
+	 *				    fph->state = FR_ATOMIC;
+	 *				    atomic_set(, BIAS);
+	 *
+	 *   futex_private_hash_get(fph); // OOPS
+	 *
+	 * Where an old fph (which is FR_ATOMIC) and should fail on
+	 * inc_not_zero, will succeed because a new transition is started and
+	 * the atomic is bias'ed away from 0.
+	 *
+	 * There must be at least one full grace-period between publishing a
+	 * new fph and trying to replace it.
+	 */
+	if (poll_state_synchronize_rcu(mm->futex_batches)) {
+		/*
+		 * There was a grace-period, we can begin now.
+		 */
+		__futex_ref_atomic_begin(fph);
+		return;
+	}
+
+	call_rcu_hurry(&mm->futex_rcu, futex_ref_rcu);
+}
+
+static bool futex_ref_get(struct futex_private_hash *fph)
+{
+	struct mm_struct *mm = fph->mm;
+
+	guard(preempt)();
+
+	if (smp_load_acquire(&fph->state) == FR_PERCPU) {
+		this_cpu_inc(*mm->futex_ref);
+		return true;
+	}
+
+	return atomic_long_inc_not_zero(&mm->futex_atomic);
+}
+
+static bool futex_ref_put(struct futex_private_hash *fph)
+{
+	struct mm_struct *mm = fph->mm;
+
+	guard(preempt)();
+
+	if (smp_load_acquire(&fph->state) == FR_PERCPU) {
+		this_cpu_dec(*mm->futex_ref);
+		return false;
+	}
+
+	return atomic_long_dec_and_test(&mm->futex_atomic);
+}
+
+static bool futex_ref_is_dead(struct futex_private_hash *fph)
+{
+	struct mm_struct *mm = fph->mm;
+
+	guard(preempt)();
+
+	if (smp_load_acquire(&fph->state) == FR_PERCPU)
+		return false;
+
+	return atomic_long_read(&mm->futex_atomic) == 0;
+}
+
+// TODO propagate error
+int futex_mm_init(struct mm_struct *mm)
+{
+	mutex_init(&mm->futex_hash_lock);
+	RCU_INIT_POINTER(mm->futex_phash, NULL);
+	mm->futex_phash_new = NULL;
+	/* futex-ref */
+	atomic_long_set(&mm->futex_atomic, 0);
+	mm->futex_batches = get_state_synchronize_rcu();
+	mm->futex_ref = alloc_percpu(unsigned int);
+	if (!mm->futex_ref)
+		return -ENOMEM;
+	this_cpu_inc(*mm->futex_ref); /* 0 -> 1 */
+	return 0;
+}
+
 void futex_hash_free(struct mm_struct *mm)
 {
 	struct futex_private_hash *fph;
 
+	free_percpu(mm->futex_ref);
 	kvfree(mm->futex_phash_new);
 	fph = rcu_dereference_raw(mm->futex_phash);
-	if (fph) {
-		WARN_ON_ONCE(rcuref_read(&fph->users) > 1);
+	if (fph)
 		kvfree(fph);
-	}
 }
 
 static bool futex_pivot_pending(struct mm_struct *mm)
@@ -1549,7 +1753,7 @@ static bool futex_pivot_pending(struct mm_struct *mm)
 		return true;
 
 	fph = rcu_dereference(mm->futex_phash);
-	return rcuref_is_dead(&fph->users);
+	return futex_ref_is_dead(fph);
 }
 
 static bool futex_hash_less(struct futex_private_hash *a,
@@ -1598,11 +1802,11 @@ static int futex_hash_allocate(unsigned int hash_slots, unsigned int flags)
 		}
 	}
 
-	fph = kvzalloc(struct_size(fph, queues, hash_slots), GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
+	fph = kvzalloc(struct_size(fph, queues, hash_slots),
+		       GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
 	if (!fph)
 		return -ENOMEM;
 
-	rcuref_init(&fph->users, 1);
 	fph->hash_mask = hash_slots ? hash_slots - 1 : 0;
 	fph->custom = custom;
 	fph->immutable = !!(flags & FH_IMMUTABLE);
@@ -1645,7 +1849,7 @@ static int futex_hash_allocate(unsigned int hash_slots, unsigned int flags)
 				 * allocated a replacement hash, drop the initial
 				 * reference on the existing hash.
 				 */
-				futex_private_hash_put(cur);
+				futex_ref_drop(cur);
 			}
 
 			if (new) {
diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index 24a92dc94eb8..1238a7178715 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -97,6 +97,7 @@ static void create_max_threads(void *(*thread_fn)(void *))
 		ret = pthread_create(&threads[i], NULL, thread_fn, NULL);
 		if (ret)
 			ksft_exit_fail_msg("pthread_create failed: %m\n");
+		usleep(5000);
 	}
 }
 
@@ -131,6 +132,7 @@ int main(int argc, char *argv[])
 	int use_global_hash = 0;
 	int ret;
 	int c;
+	int retry = 2;
 
 	while ((c = getopt(argc, argv, "cghv:")) != -1) {
 		switch (c) {
@@ -208,11 +210,18 @@ int main(int argc, char *argv[])
 	 */
 	ksft_print_msg("Online CPUs: %d\n", online_cpus);
 	if (online_cpus > 16) {
+again:
 		futex_slotsn = futex_hash_slots_get();
 		if (futex_slotsn < 0 || futex_slots1 == futex_slotsn) {
 			ksft_print_msg("Expected increase of hash buckets but got: %d -> %d\n",
 				       futex_slots1, futex_slotsn);
-			ksft_exit_fail_msg(test_msg_auto_inc);
+			if (--retry) {
+				usleep(500000);
+				goto again;
+			} else {
+				ksft_test_result_fail(test_msg_auto_inc);
+//				ksft_exit_fail_msg(test_msg_auto_inc);
+			}
 		}
 		ksft_test_result_pass(test_msg_auto_inc);
 	} else {
