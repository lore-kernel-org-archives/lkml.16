Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E3123F26A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905665; cv=none; b=m7DCmOnPFF/0afsseij2Y391q0sL/M3akMbdYwbnD0H/YsKAKVtMCtGA65z32GWhbU0csIX52HTpap9/MyUMqqcPZxnVIiQAh29suL+BKNtHFNXptl2QZ/AzRuckD59nc/1nZGYixnu11snPtTjK0iUuepkSfl5o0mg8u1pP4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905665; c=relaxed/simple;
	bh=WUd6Uj0euUClu2VIirkI9cynt6sttPCuUqrI5ZNzGv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEjBD9djyj6lx2n13gq0rwKpsLVpXkOXjlKxrSr+XDaqwud9OzqBvw6JzLMwdgWSxlSpbBvmRm4PA1J/mDAhKjB41yiC5KtoFagEtERE/8nyP3S4I5p3r162TtQWytPiLn6xXGv1ls4miyOj1l3UT/qsUmaFxMKd0eOs2XDxSqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3hFf/7Wn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZsjxBKAO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3hFf/7Wn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZsjxBKAO"
Date: Thu, 17 Apr 2025 18:00:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744905659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=rpLSM8h3w/HLo6QG040EAnKPdElDMmZYzmz+zqRkykU=;
	b=3hFf/7Wncx1AHndx5Atl96WhnJRdf50kk7Jt6qGikQezfjYqD/UnZE33oal9KnrI013VWc
	PX7HD/xgjH70o3iJ/FK4893sl6qPr1jOOiSlgAp1NlKjd3bVMXgghEiGRQZKICrlvgqV2K
	QvjkpgmFa0eYPqmCtGNIi6XRGDoCGYteI5NMU5RKssk8yzDm/QDxS/Mij/TyN6LIr1/FER
	2TbhHRLbIyVUKSwfRPSQtL3t3MYnZDnh6DDT3svxRTp/HVAj0B4mfk2cx8mGH2DogeFBnv
	PqvVwRYnRj9HkaAUDYGi0gat9qd+LFaRc0QCg6jO+7iN847i5/1KBtdFUmgTFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744905659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=rpLSM8h3w/HLo6QG040EAnKPdElDMmZYzmz+zqRkykU=;
	b=ZsjxBKAOQcNmdxupVGPSrpfMremR1tusYcQLEizuFHf+egzg5zJbc77WJsBxyhA4nRDFFB
	iuJyqaYMy1AvNNBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Subject: [RFC PATCH] local_lock: Add local_lock access for a CPU-local pointer
Message-ID: <20250417160057.jFRLMwfF@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

For the most part the local_lock API expects __percpu pointer to operate
on. So we have for instance
	local_lock(var.lock)

and local_lock() will invoke this_cpu_ptr(var.lock) and do the actual
locking on the resulting pointer. Good.

There is one exception to this, that is local_lock_init(), which expects
a CPU local (instead a __percpu) pointer. This is used with dynamic
per-CPU memory allocation. You wouldn't have guessed that based on
function naming but it is kind of obvious if you think about it. The two
users, that use it, pass the __percpu pointer to the locking function so
everything works as expected.

Now I got to the case where a __percpu variable is made CPU-local and
this pointer is passed to queue_work(). This is fine but the kworker
operates on a CPU-local pointer and now I need local_lock()
without the this_cpu_ptr() in it.
Adding a _local to the function name would be a bit too local. I added
_this instead but don't like it very much. Anyone with a better naming?

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/local_lock.h          |  6 ++++++
 include/linux/local_lock_internal.h | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/linux/local_lock.h b/include/linux/local_lock.h
index 1a0bc35839e36..5bce77200248b 100644
--- a/include/linux/local_lock.h
+++ b/include/linux/local_lock.h
@@ -138,6 +138,12 @@ DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
 #define local_unlock_nested_bh(_lock)				\
 	__local_unlock_nested_bh(_lock)
 
+#define local_lock_nested_bh_this(_lock)			\
+	__local_lock_nested_bh_this(_lock)
+
+#define local_unlock_nested_bh_this(_lock)			\
+	__local_unlock_nested_bh_this(_lock)
+
 DEFINE_GUARD(local_lock_nested_bh, local_lock_t __percpu*,
 	     local_lock_nested_bh(_T),
 	     local_unlock_nested_bh(_T))
diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
index 67bd13d142fac..84556b7d298f9 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -129,9 +129,18 @@ do {								\
 		local_lock_acquire(this_cpu_ptr(lock));	\
 	} while (0)
 
+#define __local_lock_nested_bh_this(lock)			\
+	do {							\
+		lockdep_assert_in_softirq();			\
+		local_lock_acquire(lock);	\
+	} while (0)
+
 #define __local_unlock_nested_bh(lock)				\
 	local_lock_release(this_cpu_ptr(lock))
 
+#define __local_unlock_nested_bh_this(lock)			\
+	local_lock_release(lock)
+
 /* localtry_lock_t variants */
 
 #define __localtry_lock_init(lock)				\
@@ -278,11 +287,22 @@ do {								\
 	spin_lock(this_cpu_ptr(lock));				\
 } while (0)
 
+#define __local_lock_nested_bh_this(lock)			\
+do {								\
+	lockdep_assert_in_softirq_func();			\
+	spin_lock(lock);					\
+} while (0)
+
 #define __local_unlock_nested_bh(lock)				\
 do {								\
 	spin_unlock(this_cpu_ptr((lock)));			\
 } while (0)
 
+#define __local_unlock_nested_bh_this(lock)			\
+do {								\
+	spin_unlock(lock);					\
+} while (0)
+
 /* localtry_lock_t variants */
 
 #define __localtry_lock_init(lock)			__local_lock_init(lock)
-- 
2.49.0

