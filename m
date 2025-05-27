Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2042165E2
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384615; cv=none; b=IGvGnMmrwrEGa/f6aHM/WXVBOpTZLlQHGDfIOFuRFI6mSvzBUQc1DDO4LzEoMr7UVcezCc8eLv+bLAxgiLEvYBWubYwHN3ADf3sIgWjTL5qIg0JTWNOH0PeEGOGr+MS+szR5dW0KJubrF4mvbgh9cvd8xx3U3fzjKcDIedeAFH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384615; c=relaxed/simple;
	bh=UaENH4ZMsNZOYxFnOKGRkn6MSzP+9Jy05qq0A4Yb2Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKIxrp2e2iFHIwkMONI6Qc16OWFxu5/ewFUhllK7kpn6UUuNQaeXlGwkQTSGxNKu7itkBm6gKAhcWRCFQRbQ6sXj8zLEcRgmt9Bf9EsgrPucD7Qs3GWK+SbwErqAW7w92aeKvtv8qW62PUMvPOFULCGAN6rjCs/YGqCCej1mkt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YWYX8pjK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YWYX8pjK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748384612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJV7g59pyf6aKPqQMD4Msa88yTBoagBc3guWzXNfM6w=;
	b=YWYX8pjKca+h0riDOkgKp2q4cn69Tz+ISA+gJatoASnqskkAxKJJjmb/fvNL8kZgTE0IN7
	zE5CMxN2LgEuAOgbn1WML3taVrbGTAUOYuSFyXEwKSVBZS7bB/nR73sDhMfB8UZAOITOpd
	6OiIjbC0rMu0Mm2ptMMY6a6f6tZ34+E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-KLeJmRb9N365Zs8jhJp7MQ-1; Tue,
 27 May 2025 18:23:29 -0400
X-MC-Unique: KLeJmRb9N365Zs8jhJp7MQ-1
X-Mimecast-MFC-AGG-ID: KLeJmRb9N365Zs8jhJp7MQ_1748384605
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 952161800447;
	Tue, 27 May 2025 22:23:24 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.105])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7DDED195608D;
	Tue, 27 May 2025 22:23:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Jens Axboe <axboe@kernel.dk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	NeilBrown <neilb@suse.de>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [RFC RESEND v10 03/14] irq & spin_lock: Add counted interrupt disabling/enabling
Date: Tue, 27 May 2025 18:21:44 -0400
Message-ID: <20250527222254.565881-4-lyude@redhat.com>
In-Reply-To: <20250527222254.565881-1-lyude@redhat.com>
References: <20250527222254.565881-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

From: Boqun Feng <boqun.feng@gmail.com>

Currently the nested interrupt disabling and enabling is present by
_irqsave() and _irqrestore() APIs, which are relatively unsafe, for
example:

	<interrupts are enabled as beginning>
	spin_lock_irqsave(l1, flag1);
	spin_lock_irqsave(l2, flag2);
	spin_unlock_irqrestore(l1, flags1);
	<l2 is still held but interrupts are enabled>
	// accesses to interrupt-disable protect data will cause races.

This is even easier to triggered with guard facilities:

	unsigned long flag2;

	scoped_guard(spin_lock_irqsave, l1) {
		spin_lock_irqsave(l2, flag2);
	}
	// l2 locked but interrupts are enabled.
	spin_unlock_irqrestore(l2, flag2);

(Hand-to-hand locking critical sections are not uncommon for a
fine-grained lock design)

And because this unsafety, Rust cannot easily wrap the
interrupt-disabling locks in a safe API, which complicates the design.

To resolve this, introduce a new set of interrupt disabling APIs:

*	local_interrupt_disable();
*	local_interrupt_enable();

They work like local_irq_save() and local_irq_restore() except that 1)
the outermost local_interrupt_disable() call save the interrupt state
into a percpu variable, so that the outermost local_interrupt_enable()
can restore the state, and 2) a percpu counter is added to record the
nest level of these calls, so that interrupts are not accidentally
enabled inside the outermost critical section.

Also add the corresponding spin_lock primitives: spin_lock_irq_disable()
and spin_unlock_irq_enable(), as a result, code as follow:

	spin_lock_irq_disable(l1);
	spin_lock_irq_disable(l2);
	spin_unlock_irq_enable(l1);
	// Interrupts are still disabled.
	spin_unlock_irq_enable(l2);

doesn't have the issue that interrupts are accidentally enabled.

This also makes the wrapper of interrupt-disabling locks on Rust easier
to design.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

---
V10:
* Add missing __raw_spin_lock_irq_disable() definition in spinlock.c

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/linux/irqflags.h         |  1 -
 include/linux/irqflags_types.h   |  6 ++++
 include/linux/preempt.h          |  4 +++
 include/linux/spinlock.h         | 62 ++++++++++++++++++++++++++++++++
 include/linux/spinlock_api_smp.h | 27 ++++++++++++++
 include/linux/spinlock_api_up.h  |  8 +++++
 include/linux/spinlock_rt.h      | 10 ++++++
 kernel/locking/spinlock.c        | 31 ++++++++++++++++
 kernel/softirq.c                 |  3 ++
 9 files changed, 151 insertions(+), 1 deletion(-)

diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 57b074e0cfbbb..3519d06db55e0 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -231,7 +231,6 @@ extern void warn_bogus_irq_restore(void);
 		raw_safe_halt();		\
 	} while (0)
 
-
 #else /* !CONFIG_TRACE_IRQFLAGS */
 
 #define local_irq_enable()	do { raw_local_irq_enable(); } while (0)
diff --git a/include/linux/irqflags_types.h b/include/linux/irqflags_types.h
index c13f0d915097a..277433f7f53eb 100644
--- a/include/linux/irqflags_types.h
+++ b/include/linux/irqflags_types.h
@@ -19,4 +19,10 @@ struct irqtrace_events {
 
 #endif
 
+/* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
+struct interrupt_disable_state {
+	unsigned long flags;
+	long count;
+};
+
 #endif /* _LINUX_IRQFLAGS_TYPES_H */
diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 809af7b57470a..c1c5795be5d0f 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -148,6 +148,10 @@ static __always_inline unsigned char interrupt_context_level(void)
 #define in_softirq()		(softirq_count())
 #define in_interrupt()		(irq_count())
 
+#define hardirq_disable_count()	((preempt_count() & HARDIRQ_DISABLE_MASK) >> HARDIRQ_DISABLE_SHIFT)
+#define hardirq_disable_enter()	__preempt_count_add_return(HARDIRQ_DISABLE_OFFSET)
+#define hardirq_disable_exit()	__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET)
+
 /*
  * The preempt_count offset after preempt_disable();
  */
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index d3561c4a080e2..b21da4bd51a42 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -272,9 +272,11 @@ static inline void do_raw_spin_unlock(raw_spinlock_t *lock) __releases(lock)
 #endif
 
 #define raw_spin_lock_irq(lock)		_raw_spin_lock_irq(lock)
+#define raw_spin_lock_irq_disable(lock)	_raw_spin_lock_irq_disable(lock)
 #define raw_spin_lock_bh(lock)		_raw_spin_lock_bh(lock)
 #define raw_spin_unlock(lock)		_raw_spin_unlock(lock)
 #define raw_spin_unlock_irq(lock)	_raw_spin_unlock_irq(lock)
+#define raw_spin_unlock_irq_enable(lock)	_raw_spin_unlock_irq_enable(lock)
 
 #define raw_spin_unlock_irqrestore(lock, flags)		\
 	do {							\
@@ -300,11 +302,56 @@ static inline void do_raw_spin_unlock(raw_spinlock_t *lock) __releases(lock)
 	1 : ({ local_irq_restore(flags); 0; }); \
 })
 
+#define raw_spin_trylock_irq_disable(lock) \
+({ \
+	local_interrupt_disable(); \
+	raw_spin_trylock(lock) ? \
+	1 : ({ local_interrupt_enable(); 0; }); \
+})
+
 #ifndef CONFIG_PREEMPT_RT
 /* Include rwlock functions for !RT */
 #include <linux/rwlock.h>
 #endif
 
+DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
+
+static inline void local_interrupt_disable(void)
+{
+	unsigned long flags;
+	int new_count;
+
+	new_count = hardirq_disable_enter();
+
+	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
+		local_irq_save(flags);
+		raw_cpu_write(local_interrupt_disable_state.flags, flags);
+	}
+}
+
+static inline void local_interrupt_enable(void)
+{
+	int new_count;
+
+	new_count = hardirq_disable_exit();
+
+	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
+		unsigned long flags;
+
+		flags = raw_cpu_read(local_interrupt_disable_state.flags);
+		local_irq_restore(flags);
+		/*
+		 * TODO: re-read preempt count can be avoided, but it needs
+		 * should_resched() taking another parameter as the current
+		 * preempt count
+		 */
+#ifdef PREEMPTION
+		if (should_resched(0))
+			__preempt_schedule();
+#endif
+	}
+}
+
 /*
  * Pull the _spin_*()/_read_*()/_write_*() functions/declarations:
  */
@@ -376,6 +423,11 @@ static __always_inline void spin_lock_irq(spinlock_t *lock)
 	raw_spin_lock_irq(&lock->rlock);
 }
 
+static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
+{
+	raw_spin_lock_irq_disable(&lock->rlock);
+}
+
 #define spin_lock_irqsave(lock, flags)				\
 do {								\
 	raw_spin_lock_irqsave(spinlock_check(lock), flags);	\
@@ -401,6 +453,11 @@ static __always_inline void spin_unlock_irq(spinlock_t *lock)
 	raw_spin_unlock_irq(&lock->rlock);
 }
 
+static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
+{
+	raw_spin_unlock_irq_enable(&lock->rlock);
+}
+
 static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
 {
 	raw_spin_unlock_irqrestore(&lock->rlock, flags);
@@ -421,6 +478,11 @@ static __always_inline int spin_trylock_irq(spinlock_t *lock)
 	raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
 })
 
+static __always_inline int spin_trylock_irq_disable(spinlock_t *lock)
+{
+	return raw_spin_trylock_irq_disable(&lock->rlock);
+}
+
 /**
  * spin_is_locked() - Check whether a spinlock is locked.
  * @lock: Pointer to the spinlock.
diff --git a/include/linux/spinlock_api_smp.h b/include/linux/spinlock_api_smp.h
index 9ecb0ab504e32..92532103b9eaa 100644
--- a/include/linux/spinlock_api_smp.h
+++ b/include/linux/spinlock_api_smp.h
@@ -28,6 +28,8 @@ _raw_spin_lock_nest_lock(raw_spinlock_t *lock, struct lockdep_map *map)
 void __lockfunc _raw_spin_lock_bh(raw_spinlock_t *lock)		__acquires(lock);
 void __lockfunc _raw_spin_lock_irq(raw_spinlock_t *lock)
 								__acquires(lock);
+void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+								__acquires(lock);
 
 unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
 								__acquires(lock);
@@ -39,6 +41,7 @@ int __lockfunc _raw_spin_trylock_bh(raw_spinlock_t *lock);
 void __lockfunc _raw_spin_unlock(raw_spinlock_t *lock)		__releases(lock);
 void __lockfunc _raw_spin_unlock_bh(raw_spinlock_t *lock)	__releases(lock);
 void __lockfunc _raw_spin_unlock_irq(raw_spinlock_t *lock)	__releases(lock);
+void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)	__releases(lock);
 void __lockfunc
 _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
 								__releases(lock);
@@ -55,6 +58,11 @@ _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
 #define _raw_spin_lock_irq(lock) __raw_spin_lock_irq(lock)
 #endif
 
+/* Use the same config as spin_lock_irq() temporarily. */
+#ifdef CONFIG_INLINE_SPIN_LOCK_IRQ
+#define _raw_spin_lock_irq_disable(lock) __raw_spin_lock_irq_disable(lock)
+#endif
+
 #ifdef CONFIG_INLINE_SPIN_LOCK_IRQSAVE
 #define _raw_spin_lock_irqsave(lock) __raw_spin_lock_irqsave(lock)
 #endif
@@ -79,6 +87,11 @@ _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
 #define _raw_spin_unlock_irq(lock) __raw_spin_unlock_irq(lock)
 #endif
 
+/* Use the same config as spin_unlock_irq() temporarily. */
+#ifdef CONFIG_INLINE_SPIN_UNLOCK_IRQ
+#define _raw_spin_unlock_irq_enable(lock) __raw_spin_unlock_irq_enable(lock)
+#endif
+
 #ifdef CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE
 #define _raw_spin_unlock_irqrestore(lock, flags) __raw_spin_unlock_irqrestore(lock, flags)
 #endif
@@ -120,6 +133,13 @@ static inline void __raw_spin_lock_irq(raw_spinlock_t *lock)
 	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
 }
 
+static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+{
+	local_interrupt_disable();
+	spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
+	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
+}
+
 static inline void __raw_spin_lock_bh(raw_spinlock_t *lock)
 {
 	__local_bh_disable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
@@ -160,6 +180,13 @@ static inline void __raw_spin_unlock_irq(raw_spinlock_t *lock)
 	preempt_enable();
 }
 
+static inline void __raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
+{
+	spin_release(&lock->dep_map, _RET_IP_);
+	do_raw_spin_unlock(lock);
+	local_interrupt_enable();
+}
+
 static inline void __raw_spin_unlock_bh(raw_spinlock_t *lock)
 {
 	spin_release(&lock->dep_map, _RET_IP_);
diff --git a/include/linux/spinlock_api_up.h b/include/linux/spinlock_api_up.h
index 819aeba1c87e6..d02a73671713b 100644
--- a/include/linux/spinlock_api_up.h
+++ b/include/linux/spinlock_api_up.h
@@ -36,6 +36,9 @@
 #define __LOCK_IRQ(lock) \
   do { local_irq_disable(); __LOCK(lock); } while (0)
 
+#define __LOCK_IRQ_DISABLE(lock) \
+  do { local_interrupt_disable(); __LOCK(lock); } while (0)
+
 #define __LOCK_IRQSAVE(lock, flags) \
   do { local_irq_save(flags); __LOCK(lock); } while (0)
 
@@ -52,6 +55,9 @@
 #define __UNLOCK_IRQ(lock) \
   do { local_irq_enable(); __UNLOCK(lock); } while (0)
 
+#define __UNLOCK_IRQ_ENABLE(lock) \
+  do { __UNLOCK(lock); local_interrupt_enable(); } while (0)
+
 #define __UNLOCK_IRQRESTORE(lock, flags) \
   do { local_irq_restore(flags); __UNLOCK(lock); } while (0)
 
@@ -64,6 +70,7 @@
 #define _raw_read_lock_bh(lock)			__LOCK_BH(lock)
 #define _raw_write_lock_bh(lock)		__LOCK_BH(lock)
 #define _raw_spin_lock_irq(lock)		__LOCK_IRQ(lock)
+#define _raw_spin_lock_irq_disable(lock)	__LOCK_IRQ_DISABLE(lock)
 #define _raw_read_lock_irq(lock)		__LOCK_IRQ(lock)
 #define _raw_write_lock_irq(lock)		__LOCK_IRQ(lock)
 #define _raw_spin_lock_irqsave(lock, flags)	__LOCK_IRQSAVE(lock, flags)
@@ -80,6 +87,7 @@
 #define _raw_write_unlock_bh(lock)		__UNLOCK_BH(lock)
 #define _raw_read_unlock_bh(lock)		__UNLOCK_BH(lock)
 #define _raw_spin_unlock_irq(lock)		__UNLOCK_IRQ(lock)
+#define _raw_spin_unlock_irq_enable(lock)	__UNLOCK_IRQ_ENABLE(lock)
 #define _raw_read_unlock_irq(lock)		__UNLOCK_IRQ(lock)
 #define _raw_write_unlock_irq(lock)		__UNLOCK_IRQ(lock)
 #define _raw_spin_unlock_irqrestore(lock, flags) \
diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
index f6499c37157df..6ea08fafa6d7b 100644
--- a/include/linux/spinlock_rt.h
+++ b/include/linux/spinlock_rt.h
@@ -93,6 +93,11 @@ static __always_inline void spin_lock_irq(spinlock_t *lock)
 	rt_spin_lock(lock);
 }
 
+static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
+{
+	rt_spin_lock(lock);
+}
+
 #define spin_lock_irqsave(lock, flags)			 \
 	do {						 \
 		typecheck(unsigned long, flags);	 \
@@ -116,6 +121,11 @@ static __always_inline void spin_unlock_irq(spinlock_t *lock)
 	rt_spin_unlock(lock);
 }
 
+static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
+{
+	rt_spin_unlock(lock);
+}
+
 static __always_inline void spin_unlock_irqrestore(spinlock_t *lock,
 						   unsigned long flags)
 {
diff --git a/kernel/locking/spinlock.c b/kernel/locking/spinlock.c
index 7685defd7c526..13f91117794fd 100644
--- a/kernel/locking/spinlock.c
+++ b/kernel/locking/spinlock.c
@@ -125,6 +125,21 @@ static void __lockfunc __raw_##op##_lock_bh(locktype##_t *lock)		\
  */
 BUILD_LOCK_OPS(spin, raw_spinlock);
 
+/* No rwlock_t variants for now, so just build this function by hand */
+static void __lockfunc __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+{
+	for (;;) {
+		preempt_disable();
+		local_interrupt_disable();
+		if (likely(do_raw_spin_trylock(lock)))
+			break;
+		local_interrupt_enable();
+		preempt_enable();
+
+		arch_spin_relax(&lock->raw_lock);
+	}
+}
+
 #ifndef CONFIG_PREEMPT_RT
 BUILD_LOCK_OPS(read, rwlock);
 BUILD_LOCK_OPS(write, rwlock);
@@ -172,6 +187,14 @@ noinline void __lockfunc _raw_spin_lock_irq(raw_spinlock_t *lock)
 EXPORT_SYMBOL(_raw_spin_lock_irq);
 #endif
 
+#ifndef CONFIG_INLINE_SPIN_LOCK_IRQ
+noinline void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+{
+	__raw_spin_lock_irq_disable(lock);
+}
+EXPORT_SYMBOL_GPL(_raw_spin_lock_irq_disable);
+#endif
+
 #ifndef CONFIG_INLINE_SPIN_LOCK_BH
 noinline void __lockfunc _raw_spin_lock_bh(raw_spinlock_t *lock)
 {
@@ -204,6 +227,14 @@ noinline void __lockfunc _raw_spin_unlock_irq(raw_spinlock_t *lock)
 EXPORT_SYMBOL(_raw_spin_unlock_irq);
 #endif
 
+#ifndef CONFIG_INLINE_SPIN_UNLOCK_IRQ
+noinline void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
+{
+	__raw_spin_unlock_irq_enable(lock);
+}
+EXPORT_SYMBOL_GPL(_raw_spin_unlock_irq_enable);
+#endif
+
 #ifndef CONFIG_INLINE_SPIN_UNLOCK_BH
 noinline void __lockfunc _raw_spin_unlock_bh(raw_spinlock_t *lock)
 {
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 513b1945987cc..f7a2ff4d123be 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -88,6 +88,9 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabled);
 EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
 #endif
 
+DEFINE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
+EXPORT_PER_CPU_SYMBOL_GPL(local_interrupt_disable_state);
+
 /*
  * SOFTIRQ_OFFSET usage:
  *
-- 
2.49.0

