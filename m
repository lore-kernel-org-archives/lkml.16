Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466D207DE5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041613; cv=none; b=fKPWxlyFMKHu8BWte394byLD1uFIQj05GSQYqQZVku3AuiEkwghiXWpdKqJR+ecHsAf6hWBboiaDkiygI4/Cy/XMk0uOoOENdDUzxY4V8fEahrIFHBuJQVMn2zZuUiZTIwSCDUR0u6fEsokzqD2kx7r7Pjc7rhhnBF3tXbKtUSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041613; c=relaxed/simple;
	bh=DXooKPmhxkPwSFrEUspu0Vs4eZ8pApjvFx2Ex+yE8OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgBaMcjO24o94cX6CLyJ4ix+Z6Qr4IezBRGPwvV5dly5ndEKYpj/g51cQ8MUL3tx1vx0kudw1VjE63LANpFboKUIUdEoLeZXEG8ar94wLeJDR3xwNt861/IYkNirG4k7SLp+eiuYfm2cHpBeTPTn/R+w/mg6aWDoRYAqXLfJJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PMYYh4ju; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g5E67kSM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PMYYh4ju";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g5E67kSM"
Date: Mon, 7 Apr 2025 18:00:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4yjFxDi+/gfeul2IKah3iTpYDw3emdF27H0IOnUc/S4=;
	b=PMYYh4ju9fcHXrJuCoGoHs9fLMfilQ0W4kTZNL6+JmPmTEmgnvEe0cfNCf9yf8yzRt3TQQ
	9m8ugiIXChEHe4RyjNAFEi/fzgBBi0pCgFiNtEsldXGHOhVxojVO3i6CKUrfxCfjY7M4Ns
	mOaPBVFNZyULs5FBbSjl85/5KBiZPAs2/3NUUJzGpV0oTSScohMBu3PR10alP7zXBDqXFC
	X1NhECqdbQovKWmoxxkn2nLCYVVJQG/Kd2U4siIbMif0hL2VMhOgoTt+ebFLPdBfyELRS0
	URw6BSHvjS0lytLDWRE7cwbtg0bhRTax5FJMCrSEoXkUwFjofV5EKMJxs6ACqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4yjFxDi+/gfeul2IKah3iTpYDw3emdF27H0IOnUc/S4=;
	b=g5E67kSMxKTXFFw3guV6JtAb1grlSuBXAyZopCaS1hkX3YJn0FG2ch69sfZZ24vtPUY7zW
	iE+aylWEh++OrBCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v11 00/19] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
Message-ID: <20250407160007.vOk8ijom@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>

On 2025-04-07 17:57:23 [+0200], To linux-kernel@vger.kernel.org wrote:
> This is the local hash map series with PeterZ FUTEX2_NUMA and
> FUTEX2_MPOL plus a few fixes on top.
=E2=80=A6
> v10=E2=80=A6v11: https://lore.kernel.org/all/20250312151634.2183278-1-big=
easy@linutronix.de
>   - PeterZ' fixups, changes to the local hash series have been folded
>     into the earlier patches so things are not added and renamed later
>     and the functionality is changed.

for easier comparison, here is a diff vs v10 excluding patches v17+

diff --git a/include/linux/futex.h b/include/linux/futex.h
index 19c37afa0432a..ee48dcfbfe59d 100644
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
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 09c3e3e33f1f8..de95794777ad6 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -168,12 +168,14 @@ void *__vmalloc_node_noprof(unsigned long size, unsig=
ned long align, gfp_t gfp_m
 		int node, const void *caller) __alloc_size(1);
 #define __vmalloc_node(...)	alloc_hooks(__vmalloc_node_noprof(__VA_ARGS__))
=20
-void *vmalloc_huge_noprof(unsigned long size, gfp_t gfp_mask) __alloc_size=
(1);
-#define vmalloc_huge(...)	alloc_hooks(vmalloc_huge_noprof(__VA_ARGS__))
-
 void *vmalloc_huge_node_noprof(unsigned long size, gfp_t gfp_mask, int nod=
e) __alloc_size(1);
 #define vmalloc_huge_node(...)	alloc_hooks(vmalloc_huge_node_noprof(__VA_A=
RGS__))
=20
+static inline void *vmalloc_huge(unsigned long size, gfp_t gfp_mask)
+{
+	return vmalloc_huge_node(size, gfp_mask, NUMA_NO_NODE);
+}
+
 extern void *__vmalloc_array_noprof(size_t n, size_t size, gfp_t flags) __=
alloc_size(1, 2);
 #define __vmalloc_array(...)	alloc_hooks(__vmalloc_array_noprof(__VA_ARGS_=
_))
=20
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 55b843644c51a..2344c1feaa4e3 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -354,7 +354,7 @@ struct prctl_mm_map {
 #define PR_LOCK_SHADOW_STACK_STATUS      76
=20
 /* FUTEX hash management */
-#define PR_FUTEX_HASH			77
+#define PR_FUTEX_HASH			78
 # define PR_FUTEX_HASH_SET_SLOTS	1
 # define PR_FUTEX_HASH_GET_SLOTS	2
=20
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 65523f3cfe32e..2f2a92c791def 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -124,6 +124,10 @@ late_initcall(fail_futex_debugfs);
=20
 #endif /* CONFIG_FAIL_FUTEX */
=20
+static struct futex_hash_bucket *
+__futex_hash(union futex_key *key, struct futex_private_hash *fph);
+
+#ifdef CONFIG_FUTEX_PRIVATE_HASH
 static inline bool futex_key_is_private(union futex_key *key)
 {
 	/*
@@ -133,10 +137,43 @@ static inline bool futex_key_is_private(union futex_k=
ey *key)
 	return !(key->both.offset & (FUT_OFF_INODE | FUT_OFF_MMSHARED));
 }
=20
-static struct futex_hash_bucket *
-__futex_hash(union futex_key *key, struct futex_private_hash *fph);
+bool futex_private_hash_get(struct futex_private_hash *fph)
+{
+	return rcuref_get(&fph->users);
+}
+
+void futex_private_hash_put(struct futex_private_hash *fph)
+{
+	/* Ignore return value, last put is verified via rcuref_is_dead() */
+	if (rcuref_put(&fph->users))
+		wake_up_var(fph->mm);
+}
+
+/**
+ * futex_hash_get - Get an additional reference for the local hash.
+ * @hb:                    ptr to the private local hash.
+ *
+ * Obtain an additional reference for the already obtained hash bucket. The
+ * caller must already own an reference.
+ */
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
-#ifdef CONFIG_FUTEX_PRIVATE_HASH
 static struct futex_hash_bucket *
 __futex_hash_private(union futex_key *key, struct futex_private_hash *fph)
 {
@@ -210,13 +247,12 @@ static bool __futex_pivot_hash(struct mm_struct *mm,
 	}
 	rcu_assign_pointer(mm->futex_phash, new);
 	kvfree_rcu(fph, rcu);
-	wake_up_var(mm);
 	return true;
 }
=20
 static void futex_pivot_hash(struct mm_struct *mm)
 {
-	scoped_guard (mutex, &mm->futex_hash_lock) {
+	scoped_guard(mutex, &mm->futex_hash_lock) {
 		struct futex_private_hash *fph;
=20
 		fph =3D mm->futex_phash_new;
@@ -255,28 +291,13 @@ struct futex_private_hash *futex_private_hash(void)
 	goto again;
 }
=20
-bool futex_private_hash_get(struct futex_private_hash *fph)
-{
-	return rcuref_get(&fph->users);
-}
-
-void futex_private_hash_put(struct futex_private_hash *fph)
-{
-	/*
-	 * Ignore the result; the DEAD state is picked up
-	 * when rcuref_get() starts failing via rcuref_is_dead().
-	 */
-	if (rcuref_put(&fph->users))
-		wake_up_var(fph->mm);
-}
-
 struct futex_hash_bucket *futex_hash(union futex_key *key)
 {
 	struct futex_private_hash *fph;
 	struct futex_hash_bucket *hb;
=20
 again:
-	scoped_guard (rcu) {
+	scoped_guard(rcu) {
 		hb =3D __futex_hash(key, NULL);
 		fph =3D hb->priv;
=20
@@ -287,27 +308,9 @@ struct futex_hash_bucket *futex_hash(union futex_key *=
key)
 	goto again;
 }
=20
-void futex_hash_get(struct futex_hash_bucket *hb)
-{
-	struct futex_private_hash *fph =3D hb->priv;
-
-	if (!fph)
-		return;
-	WARN_ON_ONCE(!futex_private_hash_get(fph));
-}
-
-void futex_hash_put(struct futex_hash_bucket *hb)
-{
-	struct futex_private_hash *fph =3D hb->priv;
-
-	if (!fph)
-		return;
-	futex_private_hash_put(fph);
-}
-
 #else /* !CONFIG_FUTEX_PRIVATE_HASH */
=20
-static inline struct futex_hash_bucket *
+static struct futex_hash_bucket *
 __futex_hash_private(union futex_key *key, struct futex_private_hash *fph)
 {
 	return NULL;
@@ -388,12 +391,15 @@ static int futex_mpol(struct mm_struct *mm, unsigned =
long addr)
 #endif /* CONFIG_FUTEX_MPOL */
=20
 /**
- * futex_hash - Return the hash bucket in the global hash
+ * __futex_hash - Return the hash bucket
  * @key:	Pointer to the futex key for which the hash is calculated
+ * @fph:	Pointer to private hash if known
  *
  * We hash on the keys returned from get_futex_key (see below) and return =
the
- * corresponding hash bucket in the global hash. If the FUTEX is private a=
nd
- * a local hash table is privated then this one is used.
+ * corresponding hash bucket.
+ * If the FUTEX is PROCESS_PRIVATE then a per-process hash bucket (from the
+ * private hash) is returned if existing. Otherwise a hash bucket from the
+ * global hash is returned.
  */
 static struct futex_hash_bucket *
 __futex_hash(union futex_key *key, struct futex_private_hash *fph)
@@ -1522,10 +1528,10 @@ static bool futex_pivot_pending(struct mm_struct *m=
m)
 	guard(rcu)();
=20
 	if (!mm->futex_phash_new)
-		return false;
+		return true;
=20
 	fph =3D rcu_dereference(mm->futex_phash);
-	return !rcuref_read(&fph->users);
+	return rcuref_is_dead(&fph->users);
 }
=20
 static bool futex_hash_less(struct futex_private_hash *a,
@@ -1564,7 +1570,7 @@ static int futex_hash_allocate(unsigned int hash_slot=
s, bool custom)
 	/*
 	 * Once we've disabled the global hash there is no way back.
 	 */
-	scoped_guard (rcu) {
+	scoped_guard(rcu) {
 		fph =3D rcu_dereference(mm->futex_phash);
 		if (fph && !fph->hash_mask) {
 			if (custom)
@@ -1631,7 +1637,7 @@ static int futex_hash_allocate(unsigned int hash_slot=
s, bool custom)
 		if (new) {
 			/*
 			 * Will set mm->futex_phash_new on failure;
-			 * futex_get_private_hash() will try again.
+			 * futex_private_hash_get() will try again.
 			 */
 			if (!__futex_pivot_hash(mm, new) && custom)
 				goto again;
@@ -1681,7 +1687,7 @@ static int futex_hash_get_slots(void)
=20
 	guard(rcu)();
 	fph =3D rcu_dereference(current->mm->futex_phash);
-	if (fph)
+	if (fph && fph->hash_mask)
 		return fph->hash_mask + 1;
 	return 0;
 }
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 52e9c0c4b6c87..004e4dbee4f93 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -222,7 +222,6 @@ futex_setup_timer(ktime_t *time, struct hrtimer_sleeper=
 *timeout,
 		  int flags, u64 range_ns);
=20
 extern struct futex_hash_bucket *futex_hash(union futex_key *key);
-
 #ifdef CONFIG_FUTEX_PRIVATE_HASH
 extern void futex_hash_get(struct futex_hash_bucket *hb);
 extern void futex_hash_put(struct futex_hash_bucket *hb);
@@ -234,15 +233,8 @@ extern void futex_private_hash_put(struct futex_privat=
e_hash *fph);
 #else /* !CONFIG_FUTEX_PRIVATE_HASH */
 static inline void futex_hash_get(struct futex_hash_bucket *hb) { }
 static inline void futex_hash_put(struct futex_hash_bucket *hb) { }
-
-static inline struct futex_private_hash *futex_private_hash(void)
-{
-	return NULL;
-}
-static inline bool futex_private_hash_get(struct futex_private_hash *fph)
-{
-	return false;
-}
+static inline struct futex_private_hash *futex_private_hash(void) { return=
 NULL; }
+static inline bool futex_private_hash_get(void) { return false; }
 static inline void futex_private_hash_put(struct futex_private_hash *fph) =
{ }
 #endif
=20
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index 51c69e8808152..356e52c17d3c5 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -1042,7 +1042,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int fla=
gs, ktime_t *time, int tryl
 cleanup:
 		/*
 		 * If we failed to acquire the lock (deadlock/signal/timeout), we must
-		 * must unwind the above, however we canont lock hb->lock because
+		 * unwind the above, however we canont lock hb->lock because
 		 * rt_mutex already has a waiter enqueued and hb->lock can itself try
 		 * and enqueue an rt_waiter through rtlock.
 		 *
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index 74647f6bf75de..bd8fef0f8d180 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -297,7 +297,7 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flag=
s, u32 __user *uaddr2,
 		}
=20
 		plist_for_each_entry_safe(this, next, &hb1->chain, list) {
-			if (futex_match (&this->key, &key1)) {
+			if (futex_match(&this->key, &key1)) {
 				if (this->pi_state || this->rt_waiter) {
 					ret =3D -EINVAL;
 					goto out_unlock;
@@ -311,7 +311,7 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flag=
s, u32 __user *uaddr2,
 		if (op_ret > 0) {
 			op_ret =3D 0;
 			plist_for_each_entry_safe(this, next, &hb2->chain, list) {
-				if (futex_match (&this->key, &key2)) {
+				if (futex_match(&this->key, &key2)) {
 					if (this->pi_state || this->rt_waiter) {
 						ret =3D -EINVAL;
 						goto out_unlock;
@@ -385,7 +385,7 @@ int futex_unqueue_multiple(struct futex_vector *v, int =
count)
 }
=20
 /**
- * __futex_wait_multiple_setup - Prepare to wait and enqueue multiple fute=
xes
+ * futex_wait_multiple_setup - Prepare to wait and enqueue multiple futexes
  * @vs:		The futex list to wait on
  * @count:	The size of the list
  * @woken:	Index of the last woken futex, if any. Used to notify the
diff --git a/mm/nommu.c b/mm/nommu.c
index d04e601a8f4d7..aed58ea7398db 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -207,11 +207,22 @@ void *vmalloc_noprof(unsigned long size)
 }
 EXPORT_SYMBOL(vmalloc_noprof);
=20
-void *vmalloc_huge_noprof(unsigned long size, gfp_t gfp_mask) __weak __ali=
as(__vmalloc_noprof);
-
+/*
+ *	vmalloc_huge_node  -  allocate virtually contiguous memory, on a node
+ *
+ *	@size:		allocation size
+ *	@gfp_mask:	flags for the page level allocator
+ *	@node:          node to use for allocation or NUMA_NO_NODE
+ *
+ *	Allocate enough pages to cover @size from the page level
+ *	allocator and map them into contiguous kernel virtual space.
+ *
+ *	Due to NOMMU implications the node argument and HUGE page attribute is
+ *	ignored.
+ */
 void *vmalloc_huge_node_noprof(unsigned long size, gfp_t gfp_mask, int nod=
e)
 {
-	return vmalloc_huge_noprof(size, gfp_mask);
+	return __vmalloc_noprof(size, gfp_mask);
 }
=20
 /*
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 69247b46413ca..0e2c49aaf84f1 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3947,9 +3947,10 @@ void *vmalloc_noprof(unsigned long size)
 EXPORT_SYMBOL(vmalloc_noprof);
=20
 /**
- * vmalloc_huge - allocate virtually contiguous memory, allow huge pages
+ * vmalloc_huge_node - allocate virtually contiguous memory, allow huge pa=
ges
  * @size:      allocation size
  * @gfp_mask:  flags for the page level allocator
+ * @node:	    node to use for allocation or NUMA_NO_NODE
  *
  * Allocate enough pages to cover @size from the page level
  * allocator and map them into contiguous kernel virtual space.
@@ -3958,20 +3959,13 @@ EXPORT_SYMBOL(vmalloc_noprof);
  *
  * Return: pointer to the allocated memory or %NULL on error
  */
-void *vmalloc_huge_noprof(unsigned long size, gfp_t gfp_mask)
-{
-	return __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
-				    gfp_mask, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
-				    NUMA_NO_NODE, __builtin_return_address(0));
-}
-EXPORT_SYMBOL_GPL(vmalloc_huge_noprof);
-
 void *vmalloc_huge_node_noprof(unsigned long size, gfp_t gfp_mask, int nod=
e)
 {
 	return __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
 					   gfp_mask, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
 					   node, __builtin_return_address(0));
 }
+EXPORT_SYMBOL_GPL(vmalloc_huge_node_noprof);
=20
 /**
  * vzalloc - allocate virtually contiguous memory with zero fill
