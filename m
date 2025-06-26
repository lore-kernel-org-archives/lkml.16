Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBEA2E7648
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945345; cv=none; b=CRILjpSsPAO1lZqkpjqJV3tg4XINft8xeA8oV4K8a+Dm4powMkLoWmJpSCAdBXJ/NJmuvQOgy8laxN8fCP3v6NGe1g5kEyGpMXuE/f6U29411nEJ/M2OdN5O9V2/VQumsNtOdWANQ8aKz+r9Vux+BHoZQbrcQ2WDqjx2UnDyfbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945345; c=relaxed/simple;
	bh=n4GUHXxJO9DGY8nRbnY7BpSsOF3OqHkS8dbkQeKpkDE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PgK9mFqD0tjijmUtlWlsGkjFqaZ47xC4hK9CgHNXJpAKtPcp1uk9Hbkr9dCDfq4jf6jF807ASYn2RTf7/sqJnTAsh3RPfVVSTmsSwmqQSLDgvFl7LojAR/iVT48brkS2/vS7IgdtEsS5TyiNtMP+/A/9Ge0Mqt9sTa5P1tms59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=daCzbcHW; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="daCzbcHW"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45359bfe631so5241935e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750945342; x=1751550142; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3X/PLO35Kby/7c8Y0k4KR1mlzE+5Joj5D37Kq7kXi8s=;
        b=daCzbcHWuhe7OaDa0hw5LZ1UpUNig1vqzQVvHSj6Vl/ww2Nmg6mWefBH2JIZc7n4Ga
         ljK4y7qoFFEI9NJ9abTdlfkfm5sfWDj3tiR2s4xEB4Vz0nmTuN/Dh7UmkGFPvzOx0Ijj
         iyj3/h0PMX4tFFOtNo4A61caeEF+gZvmBqunzq2LvMC2VjndflRTPafoTKmGMCQNj1te
         ROWP0RNH+r+t5EzzUNvpaB9hUmlP1AhhLgkgQgDy06Vsp+0nG2eWAIu6Bu0tC7B8AJj1
         WCfXiFr3EHcBXmQJTE8Sm4lGsQl0o8r1w40N2ygpIBUqLhblPTXQwd21TcotfQ6pfbss
         2Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945342; x=1751550142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3X/PLO35Kby/7c8Y0k4KR1mlzE+5Joj5D37Kq7kXi8s=;
        b=ZCbbJPURhRXy+YkXKN29ZZKE3eMZSHRLtxOmIEsap4Fs9faaQqbcILomHeBSXin1Ju
         R7Bu4W9My6QOPtN4oFXWvjKQXuDpDCoX121zDutkjWGW+YohIBXVNznJx9eoBJ/0/N17
         TTcQdZH7VKuKIqms4v3b0JEe0GyfZtDB0idd5bAf9n4kNcxZ1zqy7kRN9cOf4l118QLS
         0iBFDkegr0yAX42ENP8Sx5mEsTXy9Nqb6DTklHVCuFDremwjP1z1ivUeCiTfa2tPlgy+
         YhA/ZcHeUicK712hfxZ6ZUdj63MYzCm0arm/XTe5+Q+tQ4PodarkX5aCipqeFU84Vop3
         7Uyg==
X-Forwarded-Encrypted: i=1; AJvYcCWN7/xxRzUSjKSLTZNSuU52vT65S6t+3iynGetAnfm1N+8HncaNwFK7LTsIkYeG5X75mRG1raymuWHhdys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0bqMFIYZeI/yAG+f6Z89LKWaiaOI2eGTJmZplE5m5BBs4rEkK
	3sQoElbnGEdrtcy+nn+Unk6AMw/c54F/zL5pUEGArqP8DakPxgnEm0A2SevGXGosX4+rJ99gBFJ
	YLlmRSA==
X-Google-Smtp-Source: AGHT+IGaQiZVJFDkAZXUNY/qII1+3KZPhGoe4YjY7s27kiSMY+xTHrBWHJuDY1SfNVHdSJTiJKaZbj+Mpa8=
X-Received: from wmbet8.prod.google.com ([2002:a05:600c:8188:b0:442:f451:ae05])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3590:b0:442:d9f2:ded8
 with SMTP id 5b1f17b1804b1-45381ab8dbemr83015875e9.15.1750945342082; Thu, 26
 Jun 2025 06:42:22 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:41:54 +0200
In-Reply-To: <20250626134158.3385080-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626134158.3385080-8-glider@google.com>
Subject: [PATCH v2 07/11] kcov: add trace and trace_size to struct kcov_state
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
No functional changes so far.

Signed-off-by: Alexander Potapenko <glider@google.com>

---
Change-Id: I50b5589ef0e0b6726aa0579334093c648f76790a

v2:
 - Address comments by Dmitry Vyukov:
   - tweak commit description
 - Address comments by Marco Elver:
   - rename sanitizer_cov_write_subsequent() to kcov_append_to_buffer()
 - Update code to match the new description of struct kcov_state
---
 include/linux/kcov_types.h |  9 ++++++-
 kernel/kcov.c              | 54 ++++++++++++++++++++++----------------
 2 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/include/linux/kcov_types.h b/include/linux/kcov_types.h
index 53b25b6f0addd..233e7a682654b 100644
--- a/include/linux/kcov_types.h
+++ b/include/linux/kcov_types.h
@@ -7,9 +7,16 @@
 struct kcov_state {
 	/* Size of the area (in long's). */
 	unsigned int size;
+	/*
+	 * Pointer to user-provided memory used by kcov. This memory may
+	 * contain multiple buffers.
+	 */
+	void *area;
 
+	/* Size of the trace (in long's). */
+	unsigned int trace_size;
 	/* Buffer for coverage collection, shared with the userspace. */
-	void *area;
+	unsigned long *trace;
 
 	/*
 	 * KCOV sequence number: incremented each time kcov is reenabled, used
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 8e98ca8d52743..038261145cf93 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -195,11 +195,11 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
 	return ip;
 }
 
-static notrace void kcov_append_to_buffer(unsigned long *area, int size,
+static notrace void kcov_append_to_buffer(unsigned long *trace, int size,
 					  unsigned long ip)
 {
 	/* The first 64-bit word is the number of subsequent PCs. */
-	unsigned long pos = READ_ONCE(area[0]) + 1;
+	unsigned long pos = READ_ONCE(trace[0]) + 1;
 
 	if (likely(pos < size)) {
 		/*
@@ -209,9 +209,9 @@ static notrace void kcov_append_to_buffer(unsigned long *area, int size,
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
 
@@ -225,8 +225,8 @@ void notrace __sanitizer_cov_trace_pc_guard(u32 *guard)
 	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
 		return;
 
-	kcov_append_to_buffer(current->kcov_state.area,
-			      current->kcov_state.size,
+	kcov_append_to_buffer(current->kcov_state.trace,
+			      current->kcov_state.trace_size,
 			      canonicalize_ip(_RET_IP_));
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard);
@@ -242,8 +242,8 @@ void notrace __sanitizer_cov_trace_pc(void)
 	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
 		return;
 
-	kcov_append_to_buffer(current->kcov_state.area,
-			      current->kcov_state.size,
+	kcov_append_to_buffer(current->kcov_state.trace,
+			      current->kcov_state.trace_size,
 			      canonicalize_ip(_RET_IP_));
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
@@ -252,9 +252,9 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
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
@@ -266,22 +266,22 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 	 * We write all comparison arguments and types as u64.
 	 * The buffer was allocated for t->kcov_state.size unsigned longs.
 	 */
-	area = (u64 *)t->kcov_state.area;
+	trace = (u64 *)t->kcov_state.trace;
 	max_pos = t->kcov_state.size * sizeof(unsigned long);
 
-	count = READ_ONCE(area[0]);
+	count = READ_ONCE(trace[0]);
 
 	/* Every record is KCOV_WORDS_PER_CMP 64-bit words. */
 	start_index = 1 + count * KCOV_WORDS_PER_CMP;
 	end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
 	if (likely(end_pos <= max_pos)) {
 		/* See comment in kcov_append_to_buffer(). */
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
 
@@ -382,11 +382,13 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
 
 static void kcov_stop(struct task_struct *t)
 {
+	int saved_sequence = t->kcov_state.sequence;
+
 	WRITE_ONCE(t->kcov_mode, KCOV_MODE_DISABLED);
 	barrier();
 	t->kcov = NULL;
-	t->kcov_state.size = 0;
-	t->kcov_state.area = NULL;
+	t->kcov_state = (typeof(t->kcov_state)){ 0 };
+	t->kcov_state.sequence = saved_sequence;
 }
 
 static void kcov_task_reset(struct task_struct *t)
@@ -736,6 +738,8 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		}
 		kcov->state.area = area;
 		kcov->state.size = size;
+		kcov->state.trace = area;
+		kcov->state.trace_size = size;
 		kcov->mode = KCOV_MODE_INIT;
 		spin_unlock_irqrestore(&kcov->lock, flags);
 		return 0;
@@ -928,10 +932,12 @@ void kcov_remote_start(u64 handle)
 		local_lock_irqsave(&kcov_percpu_data.lock, flags);
 	}
 
-	/* Reset coverage size. */
-	*(u64 *)area = 0;
 	state.area = area;
 	state.size = size;
+	state.trace = area;
+	state.trace_size = size;
+	/* Reset coverage size. */
+	state.trace[0] = 0;
 
 	if (in_serving_softirq()) {
 		kcov_remote_softirq_start(t);
@@ -1004,8 +1010,8 @@ void kcov_remote_stop(void)
 	struct task_struct *t = current;
 	struct kcov *kcov;
 	unsigned int mode;
-	void *area;
-	unsigned int size;
+	void *area, *trace;
+	unsigned int size, trace_size;
 	int sequence;
 	unsigned long flags;
 
@@ -1037,6 +1043,8 @@ void kcov_remote_stop(void)
 	kcov = t->kcov;
 	area = t->kcov_state.area;
 	size = t->kcov_state.size;
+	trace = t->kcov_state.trace;
+	trace_size = t->kcov_state.trace_size;
 	sequence = t->kcov_state.sequence;
 
 	kcov_stop(t);
-- 
2.50.0.727.gbf7dc18ff4-goog

