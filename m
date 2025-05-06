Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0071D22C35E;
	Tue,  6 May 2025 04:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507538; cv=none; b=WbyhBA6O4RqcsYDBavzPuLtu27SUAyKg1T/ku5wu4+bh9qcldRk7YST7eGBDofuTrmSnKYf/A9wRna/Gyz/nDjoIb2dbmxjzIDgB8j0xhtLTIJpONKv/uvkBa884VCP/9FqI2ZRIToNGQkziu3vFlSEAAuNHHxFK19hOwmZrPkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507538; c=relaxed/simple;
	bh=2rKTDohoIZTv364VBRei4ErD52RBTQMB1Pfa9/nE7Qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hbs5PXQFd5I5DXoUJRcdcyJGSYcXRy4HvMIF28/9bmvdPqUDegeysPStuzeL5F5gDjyMeroPeGNnym3x8bEFg8AKqzUy8VSxzExU4MBx4LTU0OCDQG3y+hvXRNIm70uH65G2gIIrKWr8+UlO9knHvusQJ/tZK4BnyoXwKXPlrH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHL0p6R2; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHL0p6R2"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e900a7ce55so92792166d6.3;
        Mon, 05 May 2025 21:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746507536; x=1747112336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VOzgpOO8eORRFq8I92/Pf3cpq9kLRkLkWGI5a9WKGkQ=;
        b=cHL0p6R2zQrFo3AU19ijnyifJ/t41l6wu3BlnWIN/OsTgEzmPd+Ndl7ZOxa+OfVitu
         xPQts8XU9qX5HLBWpaXfu36FaqxHphQNydBvDprPdVZzoeQtAcGlnhN7BY6niRHbDWY7
         Iwc+0KgLYNYy9OwHdcBPWU2Xc9GvoMifkWkHUczYkOiyFec7UdVSBEFaY5Sln09KJFTq
         NFqk+lGo5dS5Eh36tWwmyjuygj5er9FZxDKjC1bo/vPDe2HIOMxJzP2Aw4miH+nY5DGO
         DgoBzglUpcD7wfmeDbYWxiQnJeK5wi0T0C77M5e9tKk62h87iPQdTKeyKYYaRnYnkgLi
         8Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746507536; x=1747112336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOzgpOO8eORRFq8I92/Pf3cpq9kLRkLkWGI5a9WKGkQ=;
        b=QkRg27I6P/cadhoYdmxT2wq4I+vXL5Gm995+iIijTgzt809CvEL37VFISey4+bnrkp
         Bkt6v96ZIvwPV7ndRm6q721VKwXDmqrroEJMn0BuGjPv16ttr/juD+ra0AmSgZq4lFdb
         jiXh2gYrz99VDLzUv0h65NkjEIhDltKeLT4g2Tia3E6aVSlckDl/255lE0OG1aFlzEj4
         SjCvoO5y3j3seS67pdJvuljH9Rj38KorQyItawdk6JgLw5oDT7dPMjATuU+Uvga5Ubu+
         GcEPDVjV1LNEbrhjFK30olnJWB+LYes3IkaW5VGqeW7iI4+v0PWUddXFV0Ch0pLWI+Pe
         1Hhw==
X-Forwarded-Encrypted: i=1; AJvYcCWCVoBclFneqoRo1p8m0IE5NZYhpvLKSXQ+A9JTPdg1kku6uAn+hk/jIz+KpRsCbwZmH2jcXg3SZD1G/c5bfTg=@vger.kernel.org, AJvYcCWsV2cm1ybzMFNhEsx4+W/iwdzDvf3IAZPWovolTGBqIe2IxTZIarMdzxgGwah9NJd41iL7chRnbHadFU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9yELVGeXrCSpT6Xuuz8622TOMMkP/oy0ljSGDmo6kSTUxB4Pm
	Oj97v5goHMJv6O2xwDvXOHzZeuhbwYEcsoGlULJ7I29p0IEP/ske
X-Gm-Gg: ASbGncsd8P6wSIXfIGWJ+7uioI6uyE8qkW78njj4xv8PLngXd+o06GcIFuuhZoSstwV
	+Cq7hcNUIPSdBmLmKAPcqyyG7uFPSQ3dm/AjslebWNVDLFLdsODaq159Cyxfq8SzRjV7977Ou/4
	tZMYY0lmJijwTRnF1yI/SaKHByS77FWNw96Ev3VOBVGZRCUpjgK2Wr/BFB5TDcUGAMzZ/6MKNQt
	RyJP9pGflD+TK6YPcHrTUxfJp3eOBXkdqPATY+fSU8HhA+PgHuwSRrZvAUw17wZ5RBjyLgXQ+F7
	8rAPYyo64v2XUCpHips+ADHpPMrtJkrpDfU57zW8PbjZMfNEo52T/9cv/hZ+ff7/G/Bvdc2Kwgl
	53q/zW+G/PMYU9T17Af7zhYwQYXRSgdE=
X-Google-Smtp-Source: AGHT+IFQN30BafUiqDdeBzYv8NLBc7OgLuq4IV6Uz/0rbVOFp3cLcOixfIhpiNw/jdY6LbD/sLR14w==
X-Received: by 2002:a05:6214:3001:b0:6f5:d21:cf90 with SMTP id 6a1803df08f44-6f528cecc37mr141978996d6.29.1746507535854;
        Mon, 05 May 2025 21:58:55 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3c4492sm65288086d6.35.2025.05.05.21.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:58:55 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 89FBC1200066;
	Tue,  6 May 2025 00:58:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 06 May 2025 00:58:54 -0400
X-ME-Sender: <xms:DpcZaC9W0dFvJHLPuybwzJk71bbhv-khnsoDrZqGoljyNIXsUVaz1g>
    <xme:DpcZaCsI2uacXWbL8KBOq0zdSuibMlDCpndYc7YViJBcF9fUCmkIbPlGzKRfcLDpI
    hK-umI-f5QSXTJ3Tw>
X-ME-Received: <xmr:DpcZaIB0MPdvsNr3NblFoJ7mL4PFfZUBpS8nfQPCvqgA3_WmZUaUcDHC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeekteetjeegudeikedujeefvddvtdeigfei
    ffffleejfeeiheeiffefvdeffffgteenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepfeeipdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhngh
    hosehrvgguhhgrthdrtghomhdprhgtphhtthhopehjuhhrihdrlhgvlhhlihesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnthdrghhuihhtthhotheslhhinhgrrh
    hordhorhhgpdhrtghpthhtohepughivghtmhgrrhdrvghgghgvmhgrnhhnsegrrhhmrdgt
    ohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtth
    hopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmghhorhhmrghn
    sehsuhhsvgdruggv
X-ME-Proxy: <xmx:DpcZaKcGMHOKUZDLoEiVuAqP-CYB79w64Tylz42UzlYX1GUw3cQ4iA>
    <xmx:DpcZaHOjpGG_h_HXdhXZz42oEVrg3qX7jJrDJPboLXP5Ki45mHxz5A>
    <xmx:DpcZaEmG3WbpXjOFQm8FTCCKAboaHaUAEnXlszoonlu3oXNS_2G0fg>
    <xmx:DpcZaJtU4V4IBBX3yFmaY5HdzzWLBjb0ZGw2SCCLjphUnyoSV08U7A>
    <xmx:DpcZaNsUiUl_GAScjWuxJAEAoovHbbzEh17qypMV_J4JgHcw5gDn0qTf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:58:53 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 4/5] sched/core: Add __might_sleep_precision()
Date: Mon,  5 May 2025 21:58:42 -0700
Message-Id: <20250506045843.51258-5-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250506045843.51258-1-boqun.feng@gmail.com>
References: <20250506045843.51258-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

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
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250410225623.152616-2-fujita.tomonori@gmail.com
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
index 79692f85643f..496bd462d29e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8732,24 +8732,6 @@ void __init sched_init(void)
 
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
@@ -8771,7 +8753,8 @@ static inline bool resched_offsets_ok(unsigned int offsets)
 	return nested == offsets;
 }
 
-void __might_resched(const char *file, int line, unsigned int offsets)
+static void __might_resched_precision(const char *file, int file_len, int line,
+				      unsigned int offsets)
 {
 	/* Ratelimiting timestamp: */
 	static unsigned long prev_jiffy;
@@ -8794,8 +8777,8 @@ void __might_resched(const char *file, int line, unsigned int offsets)
 	/* Save this before calling printk(), since that will clobber it: */
 	preempt_disable_ip = get_preempt_disable_ip(current);
 
-	pr_err("BUG: sleeping function called from invalid context at %s:%d\n",
-	       file, line);
+	pr_err("BUG: sleeping function called from invalid context at %.*s:%d\n",
+	       file_len, file, line);
 	pr_err("in_atomic(): %d, irqs_disabled(): %d, non_block: %d, pid: %d, name: %s\n",
 	       in_atomic(), irqs_disabled(), current->non_block_count,
 	       current->pid, current->comm);
@@ -8820,8 +8803,45 @@ void __might_resched(const char *file, int line, unsigned int offsets)
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
2.39.5 (Apple Git-154)

