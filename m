Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9BEACD;
	Sun,  6 Apr 2025 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743937707; cv=none; b=HSLeVtqb3M2ISJ6CNMTCTF0rdfTRt/T7bf/66MctoKfigfdiyki3pgEyLp7yPJ3ofwsk/Oy0NAKKpMmIj+xmupO6HzInA+xY6KwBH/AtFgc09vcqJLnxnw7xKEC3tmPRW9ryLTB2TomRw4brWYRiX7nS2WfMsu93ZLnq1QxOkW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743937707; c=relaxed/simple;
	bh=rxIg5RTwqnXRnUX09uXszAwyq11Oh1VybfXOQ5FUbfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGcHq6eD33nwqVw/0MYIDrUDdoCcukqz2Xg5lBsXk2xi7PddazEsf91bGXjhEpe/Cjbka56/0v+jXDkDjgh9KJc58H9vBPFZIXK+ZCLTHNtSTaXHEnVSSnD42e8/a+eaT8ojT16q+Ot0f6wWDCTc/XuBa/kX4tKLXELlaoCLKzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yftk0fE5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yftk0fE5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224341bbc1dso29829365ad.3;
        Sun, 06 Apr 2025 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743937705; x=1744542505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLn7DNPH8RApMVZKUOw17/ZigdZ1A/5p/HC/V1zSLaQ=;
        b=Yftk0fE589gJ/WGAj9LLKO+UfuwA8rEuoi1sgP58MHFwjxBH/VRMoUakSG+29U2Rh5
         hnd1a3sLG1wFLhXzZLI4bLkhGRuwPAAyAhReteHo7hnK+n0fEw5uCZ9/WbEe38iwJfCE
         Z4I4Ux5qhVNxnZS2iS+aZGQuodm3eNrA2vnte1we4u1YzJt2QZ3BuGLjnzc431D1xO6A
         h5NqfPl1EJB+3GEr2nuZt4kaYHP/UCcFZxsYg5V5GnMi4TnpYgLqlQ+t9L0y8HAd0i71
         L/0e04qP2Nbu/Rx3iDpnSfSYaTyWzbz5qFE8JYtnDJmCrVydidhDpd/DEZvoOd9ZLwTV
         Ve/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743937705; x=1744542505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLn7DNPH8RApMVZKUOw17/ZigdZ1A/5p/HC/V1zSLaQ=;
        b=ibIvX/0cPc7C5lAt5atRtDTW21Tm1bqT02p1oCzpkt2LXXimwsY2W8ehOdaueMpqL1
         gG4UurNbFsc1kX3fPqkIi0GtcqmRUyjFMTvoIdDwCzcIY1ALmvJOTHMt7IGD5RXdjLyp
         FKJFO+rzdslBEXGJdS3siM1Hp7iW97wrWFZqf3VbVaMA13jvAFkHaHBir/KyRBCy9LqP
         akDD4DsjQ7Lq+5Kx5XbFRvu1W2imSbxDHU5z/1pqKcAmMZNp6RXNJlZ8fCpOBrQ0YGks
         v5XNU6dell/4Nz7GQWbHon4zGQVWaxyLuVuE1VxrkmzWieKLPLVsL1w7QqxtZDisXw/y
         rv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzMsFEBxFMdxMdpXzsFgiGb1uYlimX30Pb/5nwYqPXGHoH331PgKta3ziTqii6WJ0kA+914m+ftnr6VG5DDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5NyM0XjCMnun2eLTT3p3lR1mR+9G9VVBlS2dYvP17vEdWbAxu
	AyiXBKcruS58cNY40uOUvDucphoEBPDHZvGg4oRSbEZ+bTLEaTIR+fxr2abg
X-Gm-Gg: ASbGncvlu3RofLY2SzClEy79u/JTVpaPW4ZGIgN6N2MQvOQD3eMuqsWHgIHJpa4qX3M
	vViTX5anFGKZDNNphKvOH4YNrxDl8UlwOC0GDYHq0KGMXwhVEII6yI3VUIt6JFMHyb3g7nE2Nwv
	zExbCsItTVEBBgLp9ZDdA8d2XygCVf/Rk3cZZJJNPad8cJ6g2rAFdfsCdzmTMYZkr4fzuo6LpZm
	XrDtZXQ1SGtHknT+b/D7esRk+ZLacCfto/kiJdJs8J7zA1EsUUF+BOIqT5WbNBAKaPe0BYacPso
	NOt5HRry+bkfn1uAmEujDFd2IhDnsifLqEmTML6EcSqVvJSZCQBcWtw6/2ffrno6c7nc9+DEaYU
	GEMoXta+skWiMHhYSXHm4Aw==
X-Google-Smtp-Source: AGHT+IFsx69JDHsa9B99yE0RiopQGopjJmpIdxnuU5/dxYLtzh0BW2iAn+imqUEOwVzm0GjFTxidEw==
X-Received: by 2002:a17:903:2383:b0:223:4d7e:e52c with SMTP id d9443c01a7336-22a95514117mr81796735ad.5.1743937704858;
        Sun, 06 Apr 2025 04:08:24 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785adb04sm62080215ad.15.2025.04.06.04.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 04:08:24 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	pmladek@suse.com
Subject: [PATCH v1 1/2] sched/core: Add __might_sleep_precision()
Date: Sun,  6 Apr 2025 20:07:17 +0900
Message-ID: <20250406110718.126146-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250406110718.126146-1-fujita.tomonori@gmail.com>
References: <20250406110718.126146-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add __might_sleep_precision(), Rust friendly version of
__might_sleep(), which takes a pointer to a string with the length
instead of a null-terminated string.

Rust's core::panic::Location::file(), which gives the file name of a
caller, doesn't provide a null-terminated
string. __might_sleep_precision() uses a precision specifier in the
printk format, which specifies the length of a string; a string
doesn't need to be a null-terminated.

Modify __might_sleep() to call __might_sleep_precision() but the
impact should be negligible. When printing the error (sleeping
function called from invalid context), the precision string format is
used instead of the simple string format; the precision specifies the
the maximum length of the displayed string.

Note that Location::file() providing a null-terminated string for
better C interoperability is under discussion [1].

[1]: https://github.com/rust-lang/libs-team/issues/466

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 include/linux/kernel.h |  2 ++
 kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
 2 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index be2e8c0a187e..086ee1dc447e 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -87,6 +87,7 @@ extern int dynamic_might_resched(void);
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 extern void __might_resched(const char *file, int line, unsigned int offsets);
 extern void __might_sleep(const char *file, int line);
+extern void __might_sleep_precision(const char *file, int len, int line);
 extern void __cant_sleep(const char *file, int line, int preempt_offset);
 extern void __cant_migrate(const char *file, int line);
 
@@ -145,6 +146,7 @@ extern void __cant_migrate(const char *file, int line);
   static inline void __might_resched(const char *file, int line,
 				     unsigned int offsets) { }
 static inline void __might_sleep(const char *file, int line) { }
+static inline void __might_sleep_precision(const char *file, int len, int line) { }
 # define might_sleep() do { might_resched(); } while (0)
 # define cant_sleep() do { } while (0)
 # define cant_migrate()		do { } while (0)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index cfaca3040b2f..f212e1706d5a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8730,24 +8730,6 @@ void __init sched_init(void)
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 
-void __might_sleep(const char *file, int line)
-{
-	unsigned int state = get_current_state();
-	/*
-	 * Blocking primitives will set (and therefore destroy) current->state,
-	 * since we will exit with TASK_RUNNING make sure we enter with it,
-	 * otherwise we will destroy state.
-	 */
-	WARN_ONCE(state != TASK_RUNNING && current->task_state_change,
-			"do not call blocking ops when !TASK_RUNNING; "
-			"state=%x set at [<%p>] %pS\n", state,
-			(void *)current->task_state_change,
-			(void *)current->task_state_change);
-
-	__might_resched(file, line, 0);
-}
-EXPORT_SYMBOL(__might_sleep);
-
 static void print_preempt_disable_ip(int preempt_offset, unsigned long ip)
 {
 	if (!IS_ENABLED(CONFIG_DEBUG_PREEMPT))
@@ -8769,7 +8751,8 @@ static inline bool resched_offsets_ok(unsigned int offsets)
 	return nested == offsets;
 }
 
-void __might_resched(const char *file, int line, unsigned int offsets)
+static void __might_resched_precision(const char *file, int file_len, int line,
+				      unsigned int offsets)
 {
 	/* Ratelimiting timestamp: */
 	static unsigned long prev_jiffy;
@@ -8792,8 +8775,8 @@ void __might_resched(const char *file, int line, unsigned int offsets)
 	/* Save this before calling printk(), since that will clobber it: */
 	preempt_disable_ip = get_preempt_disable_ip(current);
 
-	pr_err("BUG: sleeping function called from invalid context at %s:%d\n",
-	       file, line);
+	pr_err("BUG: sleeping function called from invalid context at %.*s:%d\n",
+	       file_len, file, line);
 	pr_err("in_atomic(): %d, irqs_disabled(): %d, non_block: %d, pid: %d, name: %s\n",
 	       in_atomic(), irqs_disabled(), current->non_block_count,
 	       current->pid, current->comm);
@@ -8818,8 +8801,45 @@ void __might_resched(const char *file, int line, unsigned int offsets)
 	dump_stack();
 	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
 }
+
+/*
+ * The precision in vsnprintf() specifies the maximum length of the
+ * displayed string. The precision needs to be larger than the actual
+ * length of the string, so a sufficiently large value should be used
+ * for the filename length.
+ */
+#define MAX_FILENAME_LEN (1<<14)
+
+void __might_resched(const char *file, int line, unsigned int offsets)
+{
+	__might_resched_precision(file, MAX_FILENAME_LEN, line, offsets);
+}
 EXPORT_SYMBOL(__might_resched);
 
+void __might_sleep_precision(const char *file, int len, int line)
+{
+	unsigned int state = get_current_state();
+	/*
+	 * Blocking primitives will set (and therefore destroy) current->state,
+	 * since we will exit with TASK_RUNNING make sure we enter with it,
+	 * otherwise we will destroy state.
+	 */
+	WARN_ONCE(state != TASK_RUNNING && current->task_state_change,
+			"do not call blocking ops when !TASK_RUNNING; "
+			"state=%x set at [<%p>] %pS\n", state,
+			(void *)current->task_state_change,
+			(void *)current->task_state_change);
+
+	__might_resched_precision(file, len, line, 0);
+}
+EXPORT_SYMBOL_GPL(__might_sleep_precision);
+
+void __might_sleep(const char *file, int line)
+{
+	__might_sleep_precision(file, MAX_FILENAME_LEN, line);
+}
+EXPORT_SYMBOL(__might_sleep);
+
 void __cant_sleep(const char *file, int line, int preempt_offset)
 {
 	static unsigned long prev_jiffy;
-- 
2.43.0

