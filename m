Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790802066E2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041478; cv=none; b=jZ895LC0tgCwbj3qS6yCMRItF3GE4U3I94WmpEonhk/KyMp5tvCz+lnhzD1kcjXf6svvjJQ4ft4e3cyls6KwCvQLeCHIn8GT6HMD3EJgmry3VF71nyqyI/1oV1eAzZSt9Oa8ezJ0Zx0OUC8eyQ66jkNMoGRgQk4U2rWOeghAPeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041478; c=relaxed/simple;
	bh=uNKXtN/Oti6VPo0i3+DKitBDeiUel4Dv4EiBlqrOt8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvHthc0qnJ5Rvqg1wl9yEQu+vEI8WAqjnmgASJHDmererlfjQseBR3PRKUUG9wXwrJ9aRByRCHCGvYJT/gd6ZTr51njxmo6Y/me1BzPQEeMN1okOpsIf6s983jfTqwcCI4F7MpGo2Szt+mWhTK82h0HqzHGrkbrOBG9KfK/7BcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=akCVSZMh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jezvN3Fw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="akCVSZMh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jezvN3Fw"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vw2oDPbAa79dvzKpop78kz6urdk4j35vNzZsC8gnXa0=;
	b=akCVSZMhuacwzGc0obpZIST4paU7XbsExDAqCIO0n0iwn+8r+l9/u9zMqlLCPsJ/4yg/Kx
	JtZa6NJX6fVvzF5d/VavlTETeZ8I9G59seKzPqZ2R8BnaXBe7QjeatVPJYjSDCvPMxjhBg
	timTMjLQ60DlZYy/dLu6eJpjgku4SPD3YjcyZv03dSGyo2qabQZCwadLxMlYCcTornIJWB
	2agzavOPpInyyvtWxLNUFA4dx4vxGcMq1GpdqBKR7gJ8zK5PphYMRSeLeD8pzFyiiS0rF0
	zcbT3UUKnrzSvxw+1+8EDB3n7OY4CP6XStoxeBXnqyJEm18kmUCGQBApc+fA4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vw2oDPbAa79dvzKpop78kz6urdk4j35vNzZsC8gnXa0=;
	b=jezvN3FwxgU2mlLG5phv4FaY8fOBiO9CLiOH8tAgYacpYu3TkRj04EpbMhCpJTPI7A5QLd
	69dEuDjXvzNKPOBg==
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
Subject: [PATCH v11 12/19] futex: Add basic infrastructure for local task local hash.
Date: Mon,  7 Apr 2025 17:57:35 +0200
Message-ID: <20250407155742.968816-13-bigeasy@linutronix.de>
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The futex hash is system wide and shared by all tasks. Each slot
is hashed based on futex address and the VMA of the thread. Due to
randomized VMAs (and memory allocations) the same logical lock (pointer)
can end up in a different hash bucket on each invocation of the
application. This in turn means that different applications may share a
hash bucket on the first invocation but not on the second and it is not
always clear which applications will be involved. This can result in
high latency's to acquire the futex_hash_bucket::lock especially if the
lock owner is limited to a CPU and can not be effectively PI boosted.

Introduce basic infrastructure for process local hash which is shared by
all threads of process. This hash will only be used for a
PROCESS_PRIVATE FUTEX operation.

The hashmap can be allocated via
        prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, num)

A `num' of 0 means that the global hash is used instead of a private
hash.
Other values for `num' specify the number of slots for the hash and the
number must be power of two, starting with two.
The prctl() returns zero on success. This function can only be used
before a thread is created.

The current status for the private hash can be queried via
        num =3D prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_SLOTS);

which return the current number of slots. The value 0 means that the
global hash is used. Values greater than 0 indicate the number of slots
that are used. A negative number indicates an error.

For optimisation, for the private hash jhash2() uses only two arguments
the address and the offset. This omits the VMA which is always the same.

[peterz: Use 0 for global hash. A bit shuffling and renaming. ]

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/futex.h      |  26 ++++-
 include/linux/mm_types.h   |   5 +-
 include/uapi/linux/prctl.h |   5 +
 init/Kconfig               |   5 +
 kernel/fork.c              |   2 +
 kernel/futex/core.c        | 206 +++++++++++++++++++++++++++++++++----
 kernel/futex/futex.h       |  10 ++
 kernel/sys.c               |   4 +
 8 files changed, 242 insertions(+), 21 deletions(-)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index b70df27d7e85c..bbc897e54c864 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -4,11 +4,11 @@
=20
 #include <linux/sched.h>
 #include <linux/ktime.h>
+#include <linux/mm_types.h>
=20
 #include <uapi/linux/futex.h>
=20
 struct inode;
-struct mm_struct;
 struct task_struct;
=20
 /*
@@ -77,7 +77,22 @@ void futex_exec_release(struct task_struct *tsk);
=20
 long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t *timeout,
 	      u32 __user *uaddr2, u32 val2, u32 val3);
-#else
+int futex_hash_prctl(unsigned long arg2, unsigned long arg3);
+
+#ifdef CONFIG_FUTEX_PRIVATE_HASH
+void futex_hash_free(struct mm_struct *mm);
+
+static inline void futex_mm_init(struct mm_struct *mm)
+{
+	mm->futex_phash =3D  NULL;
+}
+
+#else /* !CONFIG_FUTEX_PRIVATE_HASH */
+static inline void futex_hash_free(struct mm_struct *mm) { }
+static inline void futex_mm_init(struct mm_struct *mm) { }
+#endif /* CONFIG_FUTEX_PRIVATE_HASH */
+
+#else /* !CONFIG_FUTEX */
 static inline void futex_init_task(struct task_struct *tsk) { }
 static inline void futex_exit_recursive(struct task_struct *tsk) { }
 static inline void futex_exit_release(struct task_struct *tsk) { }
@@ -88,6 +103,13 @@ static inline long do_futex(u32 __user *uaddr, int op, =
u32 val,
 {
 	return -EINVAL;
 }
+static inline int futex_hash_prctl(unsigned long arg2, unsigned long arg3)
+{
+	return -EINVAL;
+}
+static inline void futex_hash_free(struct mm_struct *mm) { }
+static inline void futex_mm_init(struct mm_struct *mm) { }
+
 #endif
=20
 #endif
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 56d07edd01f91..a4b5661e41770 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -31,6 +31,7 @@
 #define INIT_PASID	0
=20
 struct address_space;
+struct futex_private_hash;
 struct mem_cgroup;
=20
 /*
@@ -1031,7 +1032,9 @@ struct mm_struct {
 		 */
 		seqcount_t mm_lock_seq;
 #endif
-
+#ifdef CONFIG_FUTEX_PRIVATE_HASH
+		struct futex_private_hash	*futex_phash;
+#endif
=20
 		unsigned long hiwater_rss; /* High-watermark of RSS usage */
 		unsigned long hiwater_vm;  /* High-water virtual memory usage */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11a..3b93fb906e3c5 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -364,4 +364,9 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
=20
+/* FUTEX hash management */
+#define PR_FUTEX_HASH			78
+# define PR_FUTEX_HASH_SET_SLOTS	1
+# define PR_FUTEX_HASH_GET_SLOTS	2
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/init/Kconfig b/init/Kconfig
index dd2ea3b9a7992..b308b98d79347 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1699,6 +1699,11 @@ config FUTEX_PI
 	depends on FUTEX && RT_MUTEXES
 	default y
=20
+config FUTEX_PRIVATE_HASH
+	bool
+	depends on FUTEX && !BASE_SMALL && MMU
+	default y
+
 config EPOLL
 	bool "Enable eventpoll support" if EXPERT
 	default y
diff --git a/kernel/fork.c b/kernel/fork.c
index c4b26cd8998b8..831dfec450544 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1305,6 +1305,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm=
, struct task_struct *p,
 	RCU_INIT_POINTER(mm->exe_file, NULL);
 	mmu_notifier_subscriptions_init(mm);
 	init_tlb_flush_pending(mm);
+	futex_mm_init(mm);
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLO=
CKS)
 	mm->pmd_huge_pte =3D NULL;
 #endif
@@ -1387,6 +1388,7 @@ static inline void __mmput(struct mm_struct *mm)
 	if (mm->binfmt)
 		module_put(mm->binfmt->module);
 	lru_gen_del_mm(mm);
+	futex_hash_free(mm);
 	mmdrop(mm);
 }
=20
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index afc66780f84fc..479a629b9aeea 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -39,6 +39,7 @@
 #include <linux/memblock.h>
 #include <linux/fault-inject.h>
 #include <linux/slab.h>
+#include <linux/prctl.h>
=20
 #include "futex.h"
 #include "../locking/rtmutex_common.h"
@@ -55,6 +56,12 @@ static struct {
 #define futex_queues   (__futex_data.queues)
 #define futex_hashmask (__futex_data.hashmask)
=20
+struct futex_private_hash {
+	unsigned int	hash_mask;
+	void		*mm;
+	bool		custom;
+	struct futex_hash_bucket queues[];
+};
=20
 /*
  * Fault injections for futexes.
@@ -107,9 +114,17 @@ late_initcall(fail_futex_debugfs);
=20
 #endif /* CONFIG_FAIL_FUTEX */
=20
-struct futex_private_hash *futex_private_hash(void)
+static struct futex_hash_bucket *
+__futex_hash(union futex_key *key, struct futex_private_hash *fph);
+
+#ifdef CONFIG_FUTEX_PRIVATE_HASH
+static inline bool futex_key_is_private(union futex_key *key)
 {
-	return NULL;
+	/*
+	 * Relies on get_futex_key() to set either bit for shared
+	 * futexes -- see comment with union futex_key.
+	 */
+	return !(key->both.offset & (FUT_OFF_INODE | FUT_OFF_MMSHARED));
 }
=20
 bool futex_private_hash_get(struct futex_private_hash *fph)
@@ -117,21 +132,8 @@ bool futex_private_hash_get(struct futex_private_hash =
*fph)
 	return false;
 }
=20
-void futex_private_hash_put(struct futex_private_hash *fph) { }
-
-/**
- * futex_hash - Return the hash bucket in the global hash
- * @key:	Pointer to the futex key for which the hash is calculated
- *
- * We hash on the keys returned from get_futex_key (see below) and return =
the
- * corresponding hash bucket in the global hash.
- */
-struct futex_hash_bucket *futex_hash(union futex_key *key)
+void futex_private_hash_put(struct futex_private_hash *fph)
 {
-	u32 hash =3D jhash2((u32 *)key, offsetof(typeof(*key), both.offset) / 4,
-			  key->both.offset);
-
-	return &futex_queues[hash & futex_hashmask];
 }
=20
 /**
@@ -144,6 +146,84 @@ struct futex_hash_bucket *futex_hash(union futex_key *=
key)
 void futex_hash_get(struct futex_hash_bucket *hb) { }
 void futex_hash_put(struct futex_hash_bucket *hb) { }
=20
+static struct futex_hash_bucket *
+__futex_hash_private(union futex_key *key, struct futex_private_hash *fph)
+{
+	u32 hash;
+
+	if (!futex_key_is_private(key))
+		return NULL;
+
+	if (!fph)
+		fph =3D key->private.mm->futex_phash;
+	if (!fph || !fph->hash_mask)
+		return NULL;
+
+	hash =3D jhash2((void *)&key->private.address,
+		      sizeof(key->private.address) / 4,
+		      key->both.offset);
+	return &fph->queues[hash & fph->hash_mask];
+}
+
+struct futex_private_hash *futex_private_hash(void)
+{
+	struct mm_struct *mm =3D current->mm;
+	struct futex_private_hash *fph;
+
+	fph =3D mm->futex_phash;
+	return fph;
+}
+
+struct futex_hash_bucket *futex_hash(union futex_key *key)
+{
+	struct futex_hash_bucket *hb;
+
+	hb =3D __futex_hash(key, NULL);
+	return hb;
+}
+
+#else /* !CONFIG_FUTEX_PRIVATE_HASH */
+
+static struct futex_hash_bucket *
+__futex_hash_private(union futex_key *key, struct futex_private_hash *fph)
+{
+	return NULL;
+}
+
+struct futex_hash_bucket *futex_hash(union futex_key *key)
+{
+	return __futex_hash(key, NULL);
+}
+
+#endif /* CONFIG_FUTEX_PRIVATE_HASH */
+
+/**
+ * __futex_hash - Return the hash bucket
+ * @key:	Pointer to the futex key for which the hash is calculated
+ * @fph:	Pointer to private hash if known
+ *
+ * We hash on the keys returned from get_futex_key (see below) and return =
the
+ * corresponding hash bucket.
+ * If the FUTEX is PROCESS_PRIVATE then a per-process hash bucket (from the
+ * private hash) is returned if existing. Otherwise a hash bucket from the
+ * global hash is returned.
+ */
+static struct futex_hash_bucket *
+__futex_hash(union futex_key *key, struct futex_private_hash *fph)
+{
+	struct futex_hash_bucket *hb;
+	u32 hash;
+
+	hb =3D __futex_hash_private(key, fph);
+	if (hb)
+		return hb;
+
+	hash =3D jhash2((u32 *)key,
+		      offsetof(typeof(*key), both.offset) / 4,
+		      key->both.offset);
+	return &futex_queues[hash & futex_hashmask];
+}
+
 /**
  * futex_setup_timer - set up the sleeping hrtimer.
  * @time:	ptr to the given timeout value
@@ -985,6 +1065,13 @@ static void exit_pi_state_list(struct task_struct *cu=
rr)
 	struct futex_pi_state *pi_state;
 	union futex_key key =3D FUTEX_KEY_INIT;
=20
+	/*
+	 * Ensure the hash remains stable (no resize) during the while loop
+	 * below. The hb pointer is acquired under the pi_lock so we can't block
+	 * on the mutex.
+	 */
+	WARN_ON(curr !=3D current);
+	guard(private_hash)();
 	/*
 	 * We are a ZOMBIE and nobody can enqueue itself on
 	 * pi_state_list anymore, but we have to be careful
@@ -1160,13 +1247,96 @@ void futex_exit_release(struct task_struct *tsk)
 	futex_cleanup_end(tsk, FUTEX_STATE_DEAD);
 }
=20
-static void futex_hash_bucket_init(struct futex_hash_bucket *fhb)
+static void futex_hash_bucket_init(struct futex_hash_bucket *fhb,
+				   struct futex_private_hash *fph)
 {
+#ifdef CONFIG_FUTEX_PRIVATE_HASH
+	fhb->priv =3D fph;
+#endif
 	atomic_set(&fhb->waiters, 0);
 	plist_head_init(&fhb->chain);
 	spin_lock_init(&fhb->lock);
 }
=20
+#ifdef CONFIG_FUTEX_PRIVATE_HASH
+void futex_hash_free(struct mm_struct *mm)
+{
+	kvfree(mm->futex_phash);
+}
+
+static int futex_hash_allocate(unsigned int hash_slots, bool custom)
+{
+	struct mm_struct *mm =3D current->mm;
+	struct futex_private_hash *fph;
+	int i;
+
+	if (hash_slots && (hash_slots =3D=3D 1 || !is_power_of_2(hash_slots)))
+		return -EINVAL;
+
+	if (mm->futex_phash)
+		return -EALREADY;
+
+	if (!thread_group_empty(current))
+		return -EINVAL;
+
+	fph =3D kvzalloc(struct_size(fph, queues, hash_slots), GFP_KERNEL_ACCOUNT=
);
+	if (!fph)
+		return -ENOMEM;
+
+	fph->hash_mask =3D hash_slots ? hash_slots - 1 : 0;
+	fph->custom =3D custom;
+	fph->mm =3D mm;
+
+	for (i =3D 0; i < hash_slots; i++)
+		futex_hash_bucket_init(&fph->queues[i], fph);
+
+	mm->futex_phash =3D fph;
+	return 0;
+}
+
+static int futex_hash_get_slots(void)
+{
+	struct futex_private_hash *fph;
+
+	fph =3D current->mm->futex_phash;
+	if (fph && fph->hash_mask)
+		return fph->hash_mask + 1;
+	return 0;
+}
+
+#else
+
+static int futex_hash_allocate(unsigned int hash_slots, bool custom)
+{
+	return -EINVAL;
+}
+
+static int futex_hash_get_slots(void)
+{
+	return 0;
+}
+#endif
+
+int futex_hash_prctl(unsigned long arg2, unsigned long arg3)
+{
+	int ret;
+
+	switch (arg2) {
+	case PR_FUTEX_HASH_SET_SLOTS:
+		ret =3D futex_hash_allocate(arg3, true);
+		break;
+
+	case PR_FUTEX_HASH_GET_SLOTS:
+		ret =3D futex_hash_get_slots();
+		break;
+
+	default:
+		ret =3D -EINVAL;
+		break;
+	}
+	return ret;
+}
+
 static int __init futex_init(void)
 {
 	unsigned long hashsize, i;
@@ -1185,7 +1355,7 @@ static int __init futex_init(void)
 	hashsize =3D 1UL << futex_shift;
=20
 	for (i =3D 0; i < hashsize; i++)
-		futex_hash_bucket_init(&futex_queues[i]);
+		futex_hash_bucket_init(&futex_queues[i], NULL);
=20
 	futex_hashmask =3D hashsize - 1;
 	return 0;
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 26e69333cb745..899aed5acde12 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -118,6 +118,7 @@ struct futex_hash_bucket {
 	atomic_t waiters;
 	spinlock_t lock;
 	struct plist_head chain;
+	struct futex_private_hash *priv;
 } ____cacheline_aligned_in_smp;
=20
 /*
@@ -204,6 +205,7 @@ futex_setup_timer(ktime_t *time, struct hrtimer_sleeper=
 *timeout,
 		  int flags, u64 range_ns);
=20
 extern struct futex_hash_bucket *futex_hash(union futex_key *key);
+#ifdef CONFIG_FUTEX_PRIVATE_HASH
 extern void futex_hash_get(struct futex_hash_bucket *hb);
 extern void futex_hash_put(struct futex_hash_bucket *hb);
=20
@@ -211,6 +213,14 @@ extern struct futex_private_hash *futex_private_hash(v=
oid);
 extern bool futex_private_hash_get(struct futex_private_hash *fph);
 extern void futex_private_hash_put(struct futex_private_hash *fph);
=20
+#else /* !CONFIG_FUTEX_PRIVATE_HASH */
+static inline void futex_hash_get(struct futex_hash_bucket *hb) { }
+static inline void futex_hash_put(struct futex_hash_bucket *hb) { }
+static inline struct futex_private_hash *futex_private_hash(void) { return=
 NULL; }
+static inline bool futex_private_hash_get(void) { return false; }
+static inline void futex_private_hash_put(struct futex_private_hash *fph) =
{ }
+#endif
+
 DEFINE_CLASS(hb, struct futex_hash_bucket *,
 	     if (_T) futex_hash_put(_T),
 	     futex_hash(key), union futex_key *key);
diff --git a/kernel/sys.c b/kernel/sys.c
index c434968e9f5dd..d446d8ecb0b33 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -52,6 +52,7 @@
 #include <linux/user_namespace.h>
 #include <linux/time_namespace.h>
 #include <linux/binfmts.h>
+#include <linux/futex.h>
=20
 #include <linux/sched.h>
 #include <linux/sched/autogroup.h>
@@ -2820,6 +2821,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, ar=
g2, unsigned long, arg3,
 			return -EINVAL;
 		error =3D posixtimer_create_prctl(arg2);
 		break;
+	case PR_FUTEX_HASH:
+		error =3D futex_hash_prctl(arg2, arg3);
+		break;
 	default:
 		trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
 		error =3D -EINVAL;
--=20
2.49.0

