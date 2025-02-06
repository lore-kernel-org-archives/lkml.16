Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB58619D090
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864328; cv=none; b=U7xvr2mbLTE98ihBC20+87r0K/QTG6IY/OHjlH6DmDE5z6UJOwH4hUoOpyr7xbWbWsN7xbU39JjL00/wT22zbggaCShfp/T6pWs1FPvT1Ixu6aAgWJWDwLHMIfPTO2I4Xy5a+55cAh9NdCUlRk1R9KAlLG7Y6Da6mfR6kHCG5VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864328; c=relaxed/simple;
	bh=4AtMI7HM9rVN3zSDoXqZogsXsYdNEhtrtQrxhGH3gMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2Gap4sbI1+VNULrvKQhoAuMK7+JRx2XQgkW2kPv8SwP59SZ2+yM5qgixCPS7iaJVtTmh3yG0aM+0TKhDU0v4nGQiUYC8qA+6yCGvtSCA73hu6qR7U+Yb2CP+AuAek2DVCRcCU3tijgTz6Smn95WCyAPhGoM0dlO3pIU9M3EGlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=D/m8Aocm; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="D/m8Aocm"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6Y4Y0JzlgTwJ;
	Thu,  6 Feb 2025 17:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864314; x=1741456315; bh=gaXWB
	sfZvGkLPwNirVjb+FFBoCWeHrPWEo5+36wP7KA=; b=D/m8Aocm9Kt30tNNJidfT
	yKArwq0SVHLXcl+++fI904YHZygKhRvywN/G4hSQRdqZt6nsftzbtAbkfsCYYIOt
	cw2BmNQ3jTcYp+oeM0maWVCQheGd2SQ2hW8RPKBKfy0qw6seZf8BqvwlhokleVyb
	amVy8f+71QLKjx2CBZSZtTo7/U6I3sLmSKnK3AfpIdF4xiIkv0cvEDKu/FuFFeJY
	1Fmlim06Sy2UBQECzP1Hhzv6/D2Lq5+dWRqwIOGPWyndBFYnmburwhwB8I9omr/j
	KS2c41H+8rUgemYwZsu34KqjkDvmeMdhefWj9W/9lYtzHAGT/CIWovvUyo54WQVh
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id KnWkxfh2zoor; Thu,  6 Feb 2025 17:51:54 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl5z2Lh9zlgTxt;
	Thu,  6 Feb 2025 17:51:35 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH RFC 06/33] locking/mutex: Annotate struct mutex and mutex functions
Date: Thu,  6 Feb 2025 09:50:47 -0800
Message-ID: <20250206175114.1974171-7-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Inform the Clang thread-safety analyzer about mutex operations and also
about the meaning of the return value of the functions that operate on
mutexes.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/mutex.h       | 46 +++++++++++++++++++++++--------------
 include/linux/mutex_types.h |  5 ++--
 kernel/locking/mutex.c      | 12 ++++++++++
 3 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 6c0a8a843a29..b7669baeffe9 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -21,6 +21,7 @@
 #include <linux/debug_locks.h>
 #include <linux/cleanup.h>
 #include <linux/mutex_types.h>
+#include <linux/thread_safety.h>
=20
 struct device;
=20
@@ -154,14 +155,18 @@ static inline int __devm_mutex_init(struct device *=
dev, struct mutex *lock)
  * Also see Documentation/locking/mutex-design.rst.
  */
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
-extern void mutex_lock_nested(struct mutex *lock, unsigned int subclass)=
;
-extern void _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map=
 *nest_lock);
+void mutex_lock_nested(struct mutex *lock, unsigned int subclass) ACQUIR=
E(*lock);
+void _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest_=
lock)
+	ACQUIRE(*lock);
=20
 extern int __must_check mutex_lock_interruptible_nested(struct mutex *lo=
ck,
-					unsigned int subclass);
+					unsigned int subclass)
+	TRY_ACQUIRE(0, *lock);
 extern int __must_check mutex_lock_killable_nested(struct mutex *lock,
-					unsigned int subclass);
-extern void mutex_lock_io_nested(struct mutex *lock, unsigned int subcla=
ss);
+					unsigned int subclass)
+	TRY_ACQUIRE(0, *lock);
+extern void mutex_lock_io_nested(struct mutex *lock, unsigned int subcla=
ss)
+	ACQUIRE(*lock);
=20
 #define mutex_lock(lock) mutex_lock_nested(lock, 0)
 #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(l=
ock, 0)
@@ -175,10 +180,11 @@ do {									\
 } while (0)
=20
 #else
-extern void mutex_lock(struct mutex *lock);
-extern int __must_check mutex_lock_interruptible(struct mutex *lock);
-extern int __must_check mutex_lock_killable(struct mutex *lock);
-extern void mutex_lock_io(struct mutex *lock);
+void mutex_lock(struct mutex *lock) ACQUIRE(*lock);
+int __must_check mutex_lock_interruptible(struct mutex *lock)
+	TRY_ACQUIRE(0, *lock);
+int __must_check mutex_lock_killable(struct mutex *lock) TRY_ACQUIRE(0, =
*lock);
+void mutex_lock_io(struct mutex *lock) ACQUIRE(*lock);
=20
 # define mutex_lock_nested(lock, subclass) mutex_lock(lock)
 # define mutex_lock_interruptible_nested(lock, subclass) mutex_lock_inte=
rruptible(lock)
@@ -193,13 +199,19 @@ extern void mutex_lock_io(struct mutex *lock);
  *
  * Returns 1 if the mutex has been acquired successfully, and 0 on conte=
ntion.
  */
-extern int mutex_trylock(struct mutex *lock);
-extern void mutex_unlock(struct mutex *lock);
-
-bool atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
-
-DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))
-DEFINE_GUARD_COND(mutex, _try, mutex_trylock(_T))
-DEFINE_GUARD_COND(mutex, _intr, mutex_lock_interruptible(_T) =3D=3D 0)
+int mutex_trylock(struct mutex *lock) TRY_ACQUIRE(1, *lock);
+void mutex_unlock(struct mutex *lock) RELEASE(*lock);
+
+bool atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock)
+	TRY_ACQUIRE(true, *lock);
+
+DEFINE_GUARD_ATTR(mutex, struct mutex *,
+		  mutex_lock(_T),
+		  ASSERT_CAPABILITY(*_T) NO_THREAD_SAFETY_ANALYSIS,
+		  mutex_unlock(_T))
+DEFINE_GUARD_COND_ATTR(mutex, _try, mutex_trylock(_T),
+		       ASSERT_CAPABILITY(*_T) NO_THREAD_SAFETY_ANALYSIS)
+DEFINE_GUARD_COND_ATTR(mutex, _intr, mutex_lock_interruptible(_T) =3D=3D=
 0,
+		       ASSERT_CAPABILITY(*_T) NO_THREAD_SAFETY_ANALYSIS)
=20
 #endif /* __LINUX_MUTEX_H */
diff --git a/include/linux/mutex_types.h b/include/linux/mutex_types.h
index fdf7f515fde8..59469956426a 100644
--- a/include/linux/mutex_types.h
+++ b/include/linux/mutex_types.h
@@ -6,6 +6,7 @@
 #include <linux/lockdep_types.h>
 #include <linux/osq_lock.h>
 #include <linux/spinlock_types.h>
+#include <linux/thread_safety.h>
 #include <linux/types.h>
=20
 #ifndef CONFIG_PREEMPT_RT
@@ -38,7 +39,7 @@
  * - detects multi-task circular deadlocks and prints out all affected
  *   locks and tasks (and only those tasks)
  */
-struct mutex {
+struct CAPABILITY("mutex") mutex {
 	atomic_long_t		owner;
 	raw_spinlock_t		wait_lock;
 #ifdef CONFIG_MUTEX_SPIN_ON_OWNER
@@ -59,7 +60,7 @@ struct mutex {
  */
 #include <linux/rtmutex.h>
=20
-struct mutex {
+struct CAPABILITY("mutex") mutex {
 	struct rt_mutex_base	rtmutex;
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	struct lockdep_map	dep_map;
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 0af175f5f031..e44becde2610 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -254,6 +254,7 @@ static void __sched __mutex_lock_slowpath(struct mute=
x *lock);
  * This function is similar to (but not equivalent to) down().
  */
 void __sched mutex_lock(struct mutex *lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	might_sleep();
=20
@@ -515,6 +516,7 @@ static noinline void __sched __mutex_unlock_slowpath(=
struct mutex *lock, unsigne
  * This function is similar to (but not equivalent to) up().
  */
 void __sched mutex_unlock(struct mutex *lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 #ifndef CONFIG_DEBUG_LOCK_ALLOC
 	if (__mutex_unlock_fast(lock))
@@ -536,6 +538,7 @@ EXPORT_SYMBOL(mutex_unlock);
  * of a unlocked mutex is not allowed.
  */
 void __sched ww_mutex_unlock(struct ww_mutex *lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	__ww_mutex_unlock(lock);
 	mutex_unlock(&lock->base);
@@ -751,6 +754,7 @@ __ww_mutex_lock(struct mutex *lock, unsigned int stat=
e, unsigned int subclass,
  * A mutex acquired with this function must be released with ww_mutex_un=
lock.
  */
 int ww_mutex_trylock(struct ww_mutex *ww, struct ww_acquire_ctx *ww_ctx)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (!ww_ctx)
 		return mutex_trylock(&ww->base);
@@ -778,6 +782,7 @@ EXPORT_SYMBOL(ww_mutex_trylock);
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 void __sched
 mutex_lock_nested(struct mutex *lock, unsigned int subclass)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	__mutex_lock(lock, TASK_UNINTERRUPTIBLE, subclass, NULL, _RET_IP_);
 }
@@ -786,6 +791,7 @@ EXPORT_SYMBOL_GPL(mutex_lock_nested);
=20
 void __sched
 _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	__mutex_lock(lock, TASK_UNINTERRUPTIBLE, 0, nest, _RET_IP_);
 }
@@ -807,6 +813,7 @@ EXPORT_SYMBOL_GPL(mutex_lock_interruptible_nested);
=20
 void __sched
 mutex_lock_io_nested(struct mutex *lock, unsigned int subclass)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	int token;
=20
@@ -957,6 +964,7 @@ __mutex_lock_interruptible_slowpath(struct mutex *loc=
k);
  * signal arrived.
  */
 int __sched mutex_lock_interruptible(struct mutex *lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	might_sleep();
=20
@@ -981,6 +989,7 @@ EXPORT_SYMBOL(mutex_lock_interruptible);
  * fatal signal arrived.
  */
 int __sched mutex_lock_killable(struct mutex *lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	might_sleep();
=20
@@ -1061,6 +1070,7 @@ __ww_mutex_lock_interruptible_slowpath(struct ww_mu=
tex *lock,
  * mutex must be released by the same task that acquired it.
  */
 int __sched mutex_trylock(struct mutex *lock)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	bool locked;
=20
@@ -1077,6 +1087,7 @@ EXPORT_SYMBOL(mutex_trylock);
 #ifndef CONFIG_DEBUG_LOCK_ALLOC
 int __sched
 ww_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	might_sleep();
=20
@@ -1092,6 +1103,7 @@ EXPORT_SYMBOL(ww_mutex_lock);
=20
 int __sched
 ww_mutex_lock_interruptible(struct ww_mutex *lock, struct ww_acquire_ctx=
 *ctx)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	might_sleep();
=20
