Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B9E233D7B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793714; cv=none; b=AHS6CvOfQs4YtB8HyGqe+IYhAMH9se4f0w/HqEbzeyFNN7FhAg4lh1Jxr+dyoQ1QBLWzFZCbMN8jcpfJZshIguNzucVf4QeAAn8tzizi78snFMRKtv1xweGpFNujK2fvb5GE5zDKYOMqzoQgHKVz283FUNEDR3R9nsuvl4p+6vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793714; c=relaxed/simple;
	bh=dPOIh10gure8X6wh/3OaULp/Lh1z2dfsF7yCMitW81M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mexs5tBKtvHl5fTFQdoI42VRKLKApw66tdKZnlDPTHsn//aPMhfPl231QP/+r31oNajFTdcAf4NfzRkJ1EbOg6JbP8Cxir7XX/pPE0mCBvsbvTQJDv2FGKozcjw4u0gDeALJmGdw/yKV0xOAbyp3bLcWhZ6lJGa36gDEM50SEiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=whzbAV4M; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="whzbAV4M"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ac28f255a36so516272566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744793710; x=1745398510; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC4wZ/r+6T3+g58Jq4R0q5y2fMNgcKM6hKjFFkcrcac=;
        b=whzbAV4Mwj0ttS4aYj3A6GsaLcgawMj2mw+v8lSM9jNyqZeOjTmEJlPcTBL53nNcxj
         mD0C/RAQivlP0HbKBGonN3wLGFea73b+Bf0zBpKlZManWMHXnK0Jh1ZUC94fEfk2jEMc
         V/yjtNOcjZfGvgwYHMhE09ZoCvTcR+DzBN7z11vSUofTm3oN+xkev9EAaa3IRz+gcx+x
         6+oQgFi18N5jwX1E8A/vhr6eijoyfbDL9Bx6/WXNRQRBUZH972qQWLdjlvPfMY3217Yf
         cVJn/KJ0XwyPTMtQiE/BhYYbbVJA1PPG0vIOqC0d0mpkSIntbhcKbgkBilZCSNLFn/Bf
         eNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793710; x=1745398510;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC4wZ/r+6T3+g58Jq4R0q5y2fMNgcKM6hKjFFkcrcac=;
        b=J177dVKNVdPX/WhRMLwfmLNpAFrNMSCkn/z9EaDbaOyYhfvUe/l80E5I6bLxfEYm+p
         EUsx0j+SdEkia2LkEpGp/LVQvSGZnmZR0kEx/ZXHtOBzVmzTgO8NobLuUeciXOSl8DmG
         Y3Wk2GDQXmTehqFYuD0Y8keON88FDQSKJTdLlsNxKcguZA+KXwp+uBF7B83xCExFtZ9u
         5ZaEJuj7zfDHZdsWn/W8qRUMXK8ezVS6SuyX5c9koKQ/nE5GhJ2zNW1oa63Vl+h9y17M
         pZ8YYx7AG2O2UD62bH6w0VYmgJtLQ6ToZHa1thMxqB90sJNGnVqz5J/+Bi5LmrEfK7pM
         1zAg==
X-Forwarded-Encrypted: i=1; AJvYcCUMGOX7yzCAdNB4k+lP4Mekgr1XmOBB8/O7VttbqbF7gQ/NPN8m4voiq63jj4EPAdqbf8MkxRJIzW6258s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3q1YWWrrEa7jX6HWfKMxSYIFpY666Vc/WFK45j4+pkM3lk8Hz
	Y17iQ94dwQYjL/V2daqccDTKDlYgpxGunJDiOTjkoJedAEkC++FiXbNo/yTHosSEd+NH0jIu6Ga
	wJg==
X-Google-Smtp-Source: AGHT+IHqEJTrvIEc+myvUhn+5RHItbzkzPoGAvROGKJhXQ5+K0wH8/TsMQnizWCRPxTgDF3unV1G0QkOht8=
X-Received: from ejzs20.prod.google.com ([2002:a17:906:c314:b0:ac6:b746:be0b])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:f594:b0:abf:4708:8644
 with SMTP id a640c23a62f3a-acb42add337mr75919066b.43.1744793710441; Wed, 16
 Apr 2025 01:55:10 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:54:43 +0200
In-Reply-To: <20250416085446.480069-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416085446.480069-1-glider@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416085446.480069-6-glider@google.com>
Subject: [PATCH 5/7] kcov: add ioctl(KCOV_UNIQUE_ENABLE)
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

ioctl(KCOV_UNIQUE_ENABLE) enables collection of deduplicated coverage
in the presence of CONFIG_KCOV_ENABLE_GUARDS.

The buffer shared with the userspace is divided in two parts, one holding
a bitmap, and the other one being the trace. The single parameter of
ioctl(KCOV_UNIQUE_ENABLE) determines the number of words used for the
bitmap.

Each __sanitizer_cov_trace_pc_guard() instrumentation hook receives a
pointer to a unique guard variable. Upon the first call of each hook,
the guard variable is initialized with a unique integer, which is used to
map those hooks to bits in the bitmap. In the new coverage collection mode,
the kernel first checks whether the bit corresponding to a particular hook
is set, and then, if it is not, the PC is written into the trace buffer,
and the bit is set.

Note: when CONFIG_KCOV_ENABLE_GUARDS is disabled, ioctl(KCOV_UNIQUE_ENABLE)
returns -ENOTSUPP, which is consistent with the existing kcov code.

Also update the documentation.

Signed-off-by: Alexander Potapenko <glider@google.com>
---
 Documentation/dev-tools/kcov.rst |  43 +++++++++++
 include/linux/kcov-state.h       |   8 ++
 include/linux/kcov.h             |   2 +
 include/uapi/linux/kcov.h        |   1 +
 kernel/kcov.c                    | 129 +++++++++++++++++++++++++++----
 5 files changed, 170 insertions(+), 13 deletions(-)

diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index 6611434e2dd24..271260642d1a6 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -137,6 +137,49 @@ mmaps coverage buffer, and then forks child processes in a loop. The child
 processes only need to enable coverage (it gets disabled automatically when
 a thread exits).
 
+Unique coverage collection
+---------------------------
+
+Instead of collecting raw PCs, KCOV can deduplicate them on the fly.
+This mode is enabled by the ``KCOV_UNIQUE_ENABLE`` ioctl (only available if
+``CONFIG_KCOV_ENABLE_GUARDS`` is on).
+
+.. code-block:: c
+
+	/* Same includes and defines as above. */
+	#define KCOV_UNIQUE_ENABLE		_IOW('c', 103, unsigned long)
+	#define BITMAP_SIZE			(4<<10)
+
+	/* Instead of KCOV_ENABLE, enable unique coverage collection. */
+	if (ioctl(fd, KCOV_UNIQUE_ENABLE, BITMAP_SIZE))
+		perror("ioctl"), exit(1);
+	/* Reset the coverage from the tail of the ioctl() call. */
+	__atomic_store_n(&cover[BITMAP_SIZE], 0, __ATOMIC_RELAXED);
+	memset(cover, 0, BITMAP_SIZE * sizeof(unsigned long));
+
+	/* Call the target syscall call. */
+	/* ... */
+
+	/* Read the number of collected PCs. */
+	n = __atomic_load_n(&cover[BITMAP_SIZE], __ATOMIC_RELAXED);
+	/* Disable the coverage collection. */
+	if (ioctl(fd, KCOV_DISABLE, 0))
+		perror("ioctl"), exit(1);
+
+Calling ``ioctl(fd, KCOV_UNIQUE_ENABLE, bitmap_size)`` carves out ``bitmap_size``
+words from those allocated by ``KCOV_INIT_TRACE`` to keep an opaque bitmap that
+prevents the kernel from storing the same PC twice. The remaining part of the
+trace is used to collect PCs, like in other modes (this part must contain at
+least two words, like when collecting non-unique PCs).
+
+The mapping between a PC and its position in the bitmap is persistent during the
+kernel lifetime, so it is possible for the callers to directly use the bitmap
+contents as a coverage signal (like when fuzzing userspace with AFL).
+
+In order to reset the coverage between the runs, the user needs to rewind the
+trace (by writing 0 into the first word past ``bitmap_size``) and wipe the whole
+bitmap.
+
 Comparison operands collection
 ------------------------------
 
diff --git a/include/linux/kcov-state.h b/include/linux/kcov-state.h
index 6e576173fd442..26e275fe90684 100644
--- a/include/linux/kcov-state.h
+++ b/include/linux/kcov-state.h
@@ -26,6 +26,14 @@ struct kcov_state {
 		/* Buffer for coverage collection, shared with the userspace. */
 		unsigned long *trace;
 
+		/* Size of the bitmap (in bits). */
+		unsigned int bitmap_size;
+		/*
+		 * Bitmap for coverage deduplication, shared with the
+		 * userspace.
+		 */
+		unsigned long *bitmap;
+
 		/*
 		 * KCOV sequence number: incremented each time kcov is
 		 * reenabled, used by kcov_remote_stop(), see the comment there.
diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 7ec2669362fd1..41eebcd3ab335 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -10,6 +10,7 @@ struct task_struct;
 #ifdef CONFIG_KCOV
 
 enum kcov_mode {
+	KCOV_MODE_INVALID = -1,
 	/* Coverage collection is not enabled yet. */
 	KCOV_MODE_DISABLED = 0,
 	/* KCOV was initialized, but tracing mode hasn't been chosen yet. */
@@ -23,6 +24,7 @@ enum kcov_mode {
 	KCOV_MODE_TRACE_CMP = 3,
 	/* The process owns a KCOV remote reference. */
 	KCOV_MODE_REMOTE = 4,
+	KCOV_MODE_TRACE_UNIQUE_PC = 5,
 };
 
 #define KCOV_IN_CTXSW (1 << 30)
diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index ed95dba9fa37e..fe1695ddf8a06 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -22,6 +22,7 @@ struct kcov_remote_arg {
 #define KCOV_ENABLE			_IO('c', 100)
 #define KCOV_DISABLE			_IO('c', 101)
 #define KCOV_REMOTE_ENABLE		_IOW('c', 102, struct kcov_remote_arg)
+#define KCOV_UNIQUE_ENABLE		_IOR('c', 103, unsigned long)
 
 enum {
 	/*
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 7b726fd761c1b..dea25c8a53b52 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -29,6 +29,10 @@
 
 #include <asm/setup.h>
 
+#ifdef CONFIG_KCOV_ENABLE_GUARDS
+atomic_t kcov_guard_max_index = ATOMIC_INIT(1);
+#endif
+
 #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
 
 /* Number of 64-bit words written per one comparison: */
@@ -161,8 +165,7 @@ static __always_inline bool in_softirq_really(void)
 	return in_serving_softirq() && !in_hardirq() && !in_nmi();
 }
 
-static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
-				    struct task_struct *t)
+static notrace enum kcov_mode get_kcov_mode(struct task_struct *t)
 {
 	unsigned int mode;
 
@@ -172,7 +175,7 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
 	 * coverage collection section in a softirq.
 	 */
 	if (!in_task() && !(in_softirq_really() && t->kcov_softirq))
-		return false;
+		return KCOV_MODE_INVALID;
 	mode = READ_ONCE(t->kcov_state.mode);
 	/*
 	 * There is some code that runs in interrupts but for which
@@ -182,7 +185,7 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
 	 * kcov_start().
 	 */
 	barrier();
-	return mode == needed_mode;
+	return mode;
 }
 
 static notrace unsigned long canonicalize_ip(unsigned long ip)
@@ -201,7 +204,7 @@ static void sanitizer_cov_write_subsequent(unsigned long *trace, int size,
 
 	if (likely(pos < size)) {
 		/*
-		 * Some early interrupt code could bypass check_kcov_mode() check
+		 * Some early interrupt code could bypass get_kcov_mode() check
 		 * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
 		 * raised between writing pc and updating pos, the pc could be
 		 * overitten by the recursive __sanitizer_cov_trace_pc().
@@ -220,7 +223,7 @@ static void sanitizer_cov_write_subsequent(unsigned long *trace, int size,
 #ifndef CONFIG_KCOV_ENABLE_GUARDS
 void notrace __sanitizer_cov_trace_pc(void)
 {
-	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
+	if (get_kcov_mode(current) != KCOV_MODE_TRACE_PC)
 		return;
 
 	sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
@@ -229,14 +232,73 @@ void notrace __sanitizer_cov_trace_pc(void)
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
 #else
+
+DEFINE_PER_CPU(u32, saved_index);
+/*
+ * Assign an index to a guard variable that does not have one yet.
+ * For an unlikely case of a race with another task executing the same basic
+ * block, we store the unused index in a per-cpu variable.
+ * In an even less likely case the current task may lose a race and get
+ * rescheduled onto a CPU that already has a saved index, discarding that index.
+ * This will result in an unused hole in the bitmap, but such events should have
+ * minor impact on the overall memory consumption.
+ */
+static __always_inline u32 init_pc_guard(u32 *guard)
+{
+	/* If the current CPU has a saved free index, use it. */
+	u32 index = this_cpu_xchg(saved_index, 0);
+	u32 old_guard;
+
+	if (likely(!index))
+		/*
+		 * Allocate a new index. No overflow is possible, because 2**32
+		 * unique basic blocks will take more space than the max size
+		 * of the kernel text segment.
+		 */
+		index = atomic_inc_return(&kcov_guard_max_index) - 1;
+
+	/*
+	 * Make sure another task is not initializing the same guard
+	 * concurrently.
+	 */
+	old_guard = cmpxchg(guard, 0, index);
+	if (unlikely(old_guard)) {
+		/* We lost the race, save the index for future use. */
+		this_cpu_write(saved_index, index);
+		return old_guard;
+	}
+	return index;
+}
+
 void notrace __sanitizer_cov_trace_pc_guard(u32 *guard)
 {
-	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
-		return;
+	u32 pc_index;
+	enum kcov_mode mode = get_kcov_mode(current);
 
-	sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
-				       current->kcov_state.s.trace_size,
-				       canonicalize_ip(_RET_IP_));
+	switch (mode) {
+	case KCOV_MODE_TRACE_UNIQUE_PC:
+		pc_index = READ_ONCE(*guard);
+		if (unlikely(!pc_index))
+			pc_index = init_pc_guard(guard);
+
+		/*
+		 * Use the bitmap for coverage deduplication. We assume both
+		 * s.bitmap and s.trace are non-NULL.
+		 */
+		if (likely(pc_index < current->kcov_state.s.bitmap_size))
+			if (test_and_set_bit(pc_index,
+					     current->kcov_state.s.bitmap))
+				return;
+		/* If the PC is new, write it to the trace. */
+		fallthrough;
+	case KCOV_MODE_TRACE_PC:
+		sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
+					       current->kcov_state.s.trace_size,
+					       canonicalize_ip(_RET_IP_));
+		break;
+	default:
+		return;
+	}
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard);
 
@@ -255,7 +317,7 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 	u64 *trace;
 
 	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_CMP, t))
+	if (get_kcov_mode(t) != KCOV_MODE_TRACE_CMP)
 		return;
 
 	ip = canonicalize_ip(ip);
@@ -374,7 +436,7 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
 	/* Cache in task struct for performance. */
 	t->kcov_state.s = state->s;
 	barrier();
-	/* See comment in check_kcov_mode(). */
+	/* See comment in get_kcov_mode(). */
 	WRITE_ONCE(t->kcov_state.mode, state->mode);
 }
 
@@ -408,6 +470,10 @@ static void kcov_reset(struct kcov *kcov)
 	kcov->state.mode = KCOV_MODE_INIT;
 	kcov->remote = false;
 	kcov->remote_size = 0;
+	kcov->state.s.trace = kcov->state.s.area;
+	kcov->state.s.trace_size = kcov->state.s.size;
+	kcov->state.s.bitmap = NULL;
+	kcov->state.s.bitmap_size = 0;
 	kcov->state.s.sequence++;
 }
 
@@ -594,6 +660,41 @@ static inline bool kcov_check_handle(u64 handle, bool common_valid,
 	return false;
 }
 
+static long kcov_handle_unique_enable(struct kcov *kcov,
+				      unsigned long bitmap_words)
+{
+	struct task_struct *t = current;
+
+	if (!IS_ENABLED(CONFIG_KCOV_ENABLE_GUARDS))
+		return -ENOTSUPP;
+	if (kcov->state.mode != KCOV_MODE_INIT || !kcov->state.s.area)
+		return -EINVAL;
+	if (kcov->t != NULL || t->kcov != NULL)
+		return -EBUSY;
+
+	/*
+	 * Cannot use zero-sized bitmap, also the bitmap must leave at least two
+	 * words for the trace.
+	 */
+	if ((!bitmap_words) || (bitmap_words >= (kcov->state.s.size - 1)))
+		return -EINVAL;
+
+	kcov->state.s.bitmap_size = bitmap_words * sizeof(unsigned long) * 8;
+	kcov->state.s.bitmap = kcov->state.s.area;
+	kcov->state.s.trace_size = kcov->state.s.size - bitmap_words;
+	kcov->state.s.trace =
+		((unsigned long *)kcov->state.s.area + bitmap_words);
+
+	kcov_fault_in_area(kcov);
+	kcov->state.mode = KCOV_MODE_TRACE_UNIQUE_PC;
+	kcov_start(t, kcov, &kcov->state);
+	kcov->t = t;
+	/* Put either in kcov_task_exit() or in KCOV_DISABLE. */
+	kcov_get(kcov);
+
+	return 0;
+}
+
 static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 			     unsigned long arg)
 {
@@ -627,6 +728,8 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		/* Put either in kcov_task_exit() or in KCOV_DISABLE. */
 		kcov_get(kcov);
 		return 0;
+	case KCOV_UNIQUE_ENABLE:
+		return kcov_handle_unique_enable(kcov, arg);
 	case KCOV_DISABLE:
 		/* Disable coverage for the current task. */
 		unused = arg;
-- 
2.49.0.604.gff1f9ca942-goog

