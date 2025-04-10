Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2963D2147F2;
	Thu, 10 Apr 2025 22:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325845; cv=none; b=UYLr9L5fqc9sqBwu+mmdpfQwU7YAymPfeiOIPZ8BfGTZe/pmfsjdSXz9uOgn23iMZZUiTguidcanZnmeL70mcsdqO67rxvg7Vb2w396X8rojZc7RpI/VM7h848EOkBGOoWXl7En03G7HZuxNKI75SAgHbuLvHDFN5SjeHlx9CaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325845; c=relaxed/simple;
	bh=44hc9zuqD5c5l3KpyWGERcYfSBH+nS55jrSfL+gj7MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VolUflNRK1BIG/sjD4GQaZa2o4L+TQImkmAqWaHYKl0xFcaRuEX4Znoa9r+gxLWiXaEBS2WSEAUS9T4kwgByV87pro6G7G1vt0mdoiHt25KE0Jx1UyPhMJCaw7sJAf+oZ0dWXkePCiJXYvGYXD+3nbbuL6eYdyQJHvLKRmhwtXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnXPirEd; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnXPirEd"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so1123059b3a.3;
        Thu, 10 Apr 2025 15:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744325843; x=1744930643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZC/8XYUFzMPhY1/PlvlTMwaJN2OFho3U0y3Hj8cMxo=;
        b=gnXPirEdflVRrwblPqCeXMf8bs8Ba5vcZengozIWJaKk7FspZztvs7l7V5NyEuo1Db
         81VboViroaqH/9difeubQ/PO5jrSxFja5WabxaLrKloYFmxuLF3W366Pq/oTM3F9XM2z
         fQhOc9YJz6ysCyVMRJMvuPs4iwC8226l2z6fNSpD0bmsbi1pCKPi8fPyTq1iLvDvohCP
         l+DSDnnTUqOkYfLctOMsgKtj84MiDuvDa3iyExfn5E3FSvaxUlYSPAuNdJjktUHp2KeF
         p5Odm7TFWoMUpGr6bwiwYhx+5oYOPURUb1ZdVqcCbL5hIGH3fJvVqupyA0wtKSXO8pWz
         l9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744325843; x=1744930643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZC/8XYUFzMPhY1/PlvlTMwaJN2OFho3U0y3Hj8cMxo=;
        b=i25KxNyUa6ysi8P3Kp19U5xoSe9TkBm7qUSHs+m7sLwNYG/3Z5wwlnslYHHo9nr61L
         F3ZlYKpCZKFrd71zP0cUsejwhYPXnnIZOWupVCn+Q4j1FuCbNbSsqql00GD7dwbayOzX
         XZHDuBIgSPEZ1HLBAn89tf5i77QX++IAfLtV5ysLOkFgBdep7WzfGtwQp9LFpVLG+9UV
         6o6RqO8TrIZiK7DGaqGve+87sq+GtlKl/eKkGDk6YXsYUq8yPQrapHYOrj/WA3zPK/0Z
         IWRFP1SPAGNg/CsMDHyNUJpV6W3KajVK5SG/C/4b2JO/+7h2jIyGy63hpzAnqJm5t8S/
         arAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbDYmzfK86zMO1jU4/Syqxj0xX+NwrW/wEgWPZWMhHEDJVUe196QDXA4g53/LnlJSVP0b8Q6GLSjG5mI14ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGCJh8+RwvJKnPnVxqJkWlwPgYo7rQ9VByHxHIsTqENyTlvNd2
	L8bYEOgAl2L6eVa5nRtzgvujAjGgEiJkiPfKiCTEyrfjNpCr8Z4OcF52Kmdj
X-Gm-Gg: ASbGnctEE8rX+xOAomLbzRzKaZ8/lAHrvph/dL6R4bb+DBhQ3dLzsH+OzD5dyAASo9q
	4A33KWOXV5Z8PeMRT3mTqxxHyz2faoLyakqnDMI43e6Ft6zonbcxsaNiw+TLuNY/KY9rrGvo5+X
	LGvXLuy+OLbB/4LvxDFORjw5MopZEvNEWB6TemvXMxTI4IGHj5rDqrKN5VuX+FFPuSQjP/Oe/Qt
	/Ku1hPIVjnHC9pFwCPRJKiK+ZXONpNxOUGj25fyBg9ZF4HWnmvGuSFaOPL99hAi+LAAzpFodY97
	ktspnHgGns3YRJbgqhqexv+XDUJa9Gt97zn+uEJDJ80zDaLltFjkSJKBGRc3pjdq1xhVoLPazMg
	eV93qSxrfzqHslGSNSILOyiUZjMLj
X-Google-Smtp-Source: AGHT+IHfyN0izXPCScO0Wr5me+oHiguigL9HGscPJd/AwlucwwI4JrxrXiSNV2QtdprpUOSL674sDA==
X-Received: by 2002:a05:6a21:1512:b0:1fd:e9c8:cf3b with SMTP id adf61e73a8af0-20179972e20mr1063116637.30.1744325843095;
        Thu, 10 Apr 2025 15:57:23 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a5e5sm3583310a12.54.2025.04.10.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 15:57:22 -0700 (PDT)
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
Subject: [PATCH v2 1/2] sched/core: Add __might_sleep_precision()
Date: Fri, 11 Apr 2025 07:56:22 +0900
Message-ID: <20250410225623.152616-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410225623.152616-1-fujita.tomonori@gmail.com>
References: <20250410225623.152616-1-fujita.tomonori@gmail.com>
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
index c81cf642dba0..6e87d997d03a 100644
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

