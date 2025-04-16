Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB023371E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793711; cv=none; b=T1xPL1ik2cOZ0AzeNIfNSDVnlFn5WgVvqwio3sMrj0EQ696IInYm/8dIgUHhqlKoUZKDfD2W2WND22LdIBpF349s7oTlt2vQO1hnWshk25eBxZjU5kqttSGz6tf6D23BeZHWmaqL1bDXL51LjNH4sCZ21nuepFgi+h0fot0D3eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793711; c=relaxed/simple;
	bh=LpOL65sGsG7Az4e//JrWMOg/Lwmm8AClYhRDaY4MFgg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tTaGIA2l2gh3s9KeS1yz/2Fmj41RvNDvpaZHa4BSUj4O6XM/h/TI624GTgM91lbl4lkv3AsIRDoVMjlOEnGoqSo2l7X7QsOhXD4e0epc0pxqdvfsXGmKvzwVDbBT02GKEnGM6A9uyUV8x6XWrskF44DkChpD5GyYz1+EzQff9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EHj+R712; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EHj+R712"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ac6caf952d7so633472566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744793708; x=1745398508; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D7PaNu9SLcaDW6rJLrXYufwflTdOL8oZuD382JbLKOQ=;
        b=EHj+R712nnN+/J5oltrnyAqQgCq25RlFPAAuJsltwbit6xvjCqKkPBt4+9wWCiobzp
         YXs2r9gbJIFhsB0vaCzHs/R8t8Kc4MVIqQ4zBqLTcEOlkeM+EJEfKPmdfl6AJnS2TqR9
         iWHyFSU9v04vBeRfNCTxAT8vPjgIfILcHT5ze5AhxoJppBey879NC2G4JitpIQEYejeJ
         bULydd2EYghHTrHDeUzOk0y3JxWpQAvGj+XSkTdEygKkW2piHxwgCW4/HPDzE0tnqmIK
         Qzl6MSN99WhUBPVu7/pfQ7KWyFP1amMPGcpf8r79CedofInjVeH255PJCtKzlU03Ph3Z
         QvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793708; x=1745398508;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7PaNu9SLcaDW6rJLrXYufwflTdOL8oZuD382JbLKOQ=;
        b=XB6Z5V4G4d/r4yqalO0zMYjOKxUWZwIQcEt9MtZJ5XicWKuWAdS100cYHt/xTqrbuS
         hyqKa2+SLMz4DWgiRFj4bvLKGJ2rJoxkZoHSTQRyHkgutSuRh+QHtLnC3w6VhseZYPII
         kbyv5oFXP72yQZUx8J/+Yl+UiRsQ3QHRMw07UeJr/1gjvNbzp5Hk3K21nrX55tNLmHQP
         ZRqE2MgG1DyMiiK7ej05BvYYvW/Ie9++HH9kPxlc4JvI2mQgagPr0Y2f9+YI0Ep9DZbw
         UiA8WUDsW47qLlNLcZkTwznu0Rt6zzjjDtC/jWfQohUTMo1kvm3qUBgj5oZ1oP0OLNi8
         9Ntg==
X-Forwarded-Encrypted: i=1; AJvYcCWe8d/AzWBFCqH6TMt3l7NqNVaQxVGnVL2lsCJVsMtyJLze/s48JjAHD1EeNoDqspRTrlmVq+dhLoz6/ZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAXTE9PPIv+yvIMuQAEbiRAO/JV/DtMdrp+7/WuamXNcmwq0r+
	UARI9BOZq2/vtxo313bl+2hDf2t8c4OyHLip0yZIrqO7sK48lyfSWjU/fOmdkBRQTuF/c1l8ZSk
	+yQ==
X-Google-Smtp-Source: AGHT+IG9lth0q3y30P/VyLYjisZmGmSRBC3r0wPf3kzY90O2m4xRYk1/bvFuHz0H5Eow7kT1r9e29N8gQwY=
X-Received: from ejbgq18.prod.google.com ([2002:a17:906:e252:b0:ac2:8b71:dd54])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:748:b0:ac1:e53c:d13f
 with SMTP id a640c23a62f3a-acb42c13a70mr69983766b.50.1744793707726; Wed, 16
 Apr 2025 01:55:07 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:54:42 +0200
In-Reply-To: <20250416085446.480069-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416085446.480069-1-glider@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416085446.480069-5-glider@google.com>
Subject: [PATCH 4/7] kcov: add `trace` and `trace_size` to `struct kcov_state`
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Keep kcov_state.area as the pointer to the memory buffer used by
kcov and shared with the userspace. Store the pointer to the trace
(part of the buffer holding sequential events) separately, as we will
be splitting that buffer in multiple parts.
No functional change so far.

Signed-off-by: Alexander Potapenko <glider@google.com>
---
 include/linux/kcov-state.h |  9 ++++++-
 kernel/kcov.c              | 54 ++++++++++++++++++++++----------------
 2 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/include/linux/kcov-state.h b/include/linux/kcov-state.h
index 4c4688d01c616..6e576173fd442 100644
--- a/include/linux/kcov-state.h
+++ b/include/linux/kcov-state.h
@@ -15,9 +15,16 @@ struct kcov_state {
 	struct {
 		/* Size of the area (in long's). */
 		unsigned int size;
+		/*
+		 * Pointer to user-provided memory used by kcov. This memory may
+		 * contain multiple buffers.
+		 */
+		void *area;
 
+		/* Size of the trace (in long's). */
+		unsigned int trace_size;
 		/* Buffer for coverage collection, shared with the userspace. */
-		void *area;
+		unsigned long *trace;
 
 		/*
 		 * KCOV sequence number: incremented each time kcov is
diff --git a/kernel/kcov.c b/kernel/kcov.c
index b97f429d17436..7b726fd761c1b 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -193,11 +193,11 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
 	return ip;
 }
 
-static void sanitizer_cov_write_subsequent(unsigned long *area, int size,
+static void sanitizer_cov_write_subsequent(unsigned long *trace, int size,
 					   unsigned long ip)
 {
 	/* The first 64-bit word is the number of subsequent PCs. */
-	unsigned long pos = READ_ONCE(area[0]) + 1;
+	unsigned long pos = READ_ONCE(trace[0]) + 1;
 
 	if (likely(pos < size)) {
 		/*
@@ -207,9 +207,9 @@ static void sanitizer_cov_write_subsequent(unsigned long *area, int size,
 		 * overitten by the recursive __sanitizer_cov_trace_pc().
 		 * Update pos before writing pc to avoid such interleaving.
 		 */
-		WRITE_ONCE(area[0], pos);
+		WRITE_ONCE(trace[0], pos);
 		barrier();
-		area[pos] = ip;
+		trace[pos] = ip;
 	}
 }
 
@@ -223,8 +223,8 @@ void notrace __sanitizer_cov_trace_pc(void)
 	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
 		return;
 
-	sanitizer_cov_write_subsequent(current->kcov_state.s.area,
-				       current->kcov_state.s.size,
+	sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
+				       current->kcov_state.s.trace_size,
 				       canonicalize_ip(_RET_IP_));
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
@@ -234,8 +234,8 @@ void notrace __sanitizer_cov_trace_pc_guard(u32 *guard)
 	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
 		return;
 
-	sanitizer_cov_write_subsequent(current->kcov_state.s.area,
-				       current->kcov_state.s.size,
+	sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
+				       current->kcov_state.s.trace_size,
 				       canonicalize_ip(_RET_IP_));
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard);
@@ -250,9 +250,9 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard_init);
 #ifdef CONFIG_KCOV_ENABLE_COMPARISONS
 static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 {
-	struct task_struct *t;
-	u64 *area;
 	u64 count, start_index, end_pos, max_pos;
+	struct task_struct *t;
+	u64 *trace;
 
 	t = current;
 	if (!check_kcov_mode(KCOV_MODE_TRACE_CMP, t))
@@ -264,22 +264,22 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 	 * We write all comparison arguments and types as u64.
 	 * The buffer was allocated for t->kcov_state.size unsigned longs.
 	 */
-	area = (u64 *)t->kcov_state.s.area;
+	trace = (u64 *)t->kcov_state.s.trace;
 	max_pos = t->kcov_state.s.size * sizeof(unsigned long);
 
-	count = READ_ONCE(area[0]);
+	count = READ_ONCE(trace[0]);
 
 	/* Every record is KCOV_WORDS_PER_CMP 64-bit words. */
 	start_index = 1 + count * KCOV_WORDS_PER_CMP;
 	end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
 	if (likely(end_pos <= max_pos)) {
 		/* See comment in sanitizer_cov_write_subsequent(). */
-		WRITE_ONCE(area[0], count + 1);
+		WRITE_ONCE(trace[0], count + 1);
 		barrier();
-		area[start_index] = type;
-		area[start_index + 1] = arg1;
-		area[start_index + 2] = arg2;
-		area[start_index + 3] = ip;
+		trace[start_index] = type;
+		trace[start_index + 1] = arg1;
+		trace[start_index + 2] = arg2;
+		trace[start_index + 3] = ip;
 	}
 }
 
@@ -380,11 +380,13 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
 
 static void kcov_stop(struct task_struct *t)
 {
+	int saved_sequence = t->kcov_state.s.sequence;
+
 	WRITE_ONCE(t->kcov_state.mode, KCOV_MODE_DISABLED);
 	barrier();
 	t->kcov = NULL;
-	t->kcov_state.s.size = 0;
-	t->kcov_state.s.area = NULL;
+	t->kcov_state.s = (typeof(t->kcov_state.s)){ 0 };
+	t->kcov_state.s.sequence = saved_sequence;
 }
 
 static void kcov_task_reset(struct task_struct *t)
@@ -733,6 +735,8 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		}
 		kcov->state.s.area = area;
 		kcov->state.s.size = size;
+		kcov->state.s.trace = area;
+		kcov->state.s.trace_size = size;
 		kcov->state.mode = KCOV_MODE_INIT;
 		spin_unlock_irqrestore(&kcov->lock, flags);
 		return 0;
@@ -924,10 +928,12 @@ void kcov_remote_start(u64 handle)
 		local_lock_irqsave(&kcov_percpu_data.lock, flags);
 	}
 
-	/* Reset coverage size. */
-	*(u64 *)area = 0;
 	state.s.area = area;
 	state.s.size = size;
+	state.s.trace = area;
+	state.s.trace_size = size;
+	/* Reset coverage size. */
+	state.s.trace[0] = 0;
 
 	if (in_serving_softirq()) {
 		kcov_remote_softirq_start(t);
@@ -1000,8 +1006,8 @@ void kcov_remote_stop(void)
 	struct task_struct *t = current;
 	struct kcov *kcov;
 	unsigned int mode;
-	void *area;
-	unsigned int size;
+	void *area, *trace;
+	unsigned int size, trace_size;
 	int sequence;
 	unsigned long flags;
 
@@ -1033,6 +1039,8 @@ void kcov_remote_stop(void)
 	kcov = t->kcov;
 	area = t->kcov_state.s.area;
 	size = t->kcov_state.s.size;
+	trace = t->kcov_state.s.trace;
+	trace_size = t->kcov_state.s.trace_size;
 	sequence = t->kcov_state.s.sequence;
 
 	kcov_stop(t);
-- 
2.49.0.604.gff1f9ca942-goog

