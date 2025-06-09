Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687E14B06C;
	Mon,  9 Jun 2025 01:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749431112; cv=none; b=N/9E8sCP+lswRwgNYeDdHw07dDhooLY7aB57FcUlAVEfkKoStHHqkc1HlygsJqS0ewSmnIXfEy8920xI29Imy5d+v5NObqq81GdV4Gq8t6tOaceRyZ0NdWo8d+SORp8U2UFdhKCUgcv/9iCGWngLoy631j+0A1FQLjvRSNP0rJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749431112; c=relaxed/simple;
	bh=VJS1o6fH53Gk0wr+SzSJ88FZMX5aOSnHLEB3YFcytRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uyKbCSUG7ilbkjPsUob0+1O1i552vCd6LMgjz2NhGkyf7eEObyGQBcYwq5FeVdvJV9HO9N7fdZBW0BB7mWW1KtzSOdCW7b0KN3vqLmvRR3c2+L73O0mR5KbeJGuPgaRUnAhuYSq7l+p/a6dCUDPcqdavaqwY+fYHNYRL4Djgj2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvbkwUZm; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvbkwUZm"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so3479365a12.0;
        Sun, 08 Jun 2025 18:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749431111; x=1750035911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Eo/fyQ4dEZ7p4MDxpCSFM4GRAM+Wphnvh8qgm44dY8=;
        b=WvbkwUZmd5RDSk87gd04y2n8kUFQcvSYS8mbtSus8opr4tNbYuycRDRjNJ8bbyQH8m
         +/VuD71+HStihL3yUZq2f9gCBblSNv0RyuMF8z9zwMDJRa5nvUxauJ2STQaMzjxB/7G1
         7TMQCNrgapzUzP0FQ1VNW2x5lw9u3+BjR5+Wss3Y2vfHHpokAV6LY5Of4YFf84anFK9K
         1JTcVZtG8L3RNcsMwbLbEf4qKgM5maOVNSm0BwmYUc2JQW28aWxWW3ayHcemhqZqKFSL
         XGe+KpqqTdQNaGW3aojjZSfNUaMhqZWOYzy7r3s4y8l54mjLreF0CmQ6TngSixwbudWe
         O93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749431111; x=1750035911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Eo/fyQ4dEZ7p4MDxpCSFM4GRAM+Wphnvh8qgm44dY8=;
        b=HNZu7fzXQ45VMRgcSC/utaJU+YzqDa1eAC3U+YLUty0PMeGbc2yHX3ryw02Pfkq0sc
         fo/2Psxh1GluyW9klerogAhFKJ/fpu5NLgiae3dl4VNhqLTs2DqrKWzudr7NWT7bORQO
         OCksPmaRXgedsD+agzgKE7+zVWaS2496Bfolnk98wBgSJM5UhwLd8W8PpFFR3Q8zbfkY
         Bve4bEn61yCl0PYF/3Z2ap2zFF/ELZmoRvUGuQgZuFDkCw6/d1jrri6UqZWkyCJM5OrE
         yphrwSR0NWZWWOV3vPHdWda1dGA9ORtzOf1K5oYsZ0YNoMleBQDItqiPyBeVFarcmuEQ
         5nHg==
X-Forwarded-Encrypted: i=1; AJvYcCUImyHaHnmi/AKYS1Q/zEDKmwgldy0UeDANFdYd/ngr1ph3OViXPBbe1uZODR79JwMkfdsy4952kA5tq+8=@vger.kernel.org, AJvYcCVsqAzstFZMdBa3+RbPF1HTBtyqVqCpkTwyWaX9FRo73WTv3eZqUbgWJQSWx94e9A2j6j4ljML7uYl0bDMfJh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOlTC94zIPFJucFwiOcFykuEMzyeUfESla2jX9h8DKrFpjRRGG
	92Q0Db2HBF1a181dKgTAlbxnvCKUDwvzYUh0BX6MaALMxohJoNEyGZiB
X-Gm-Gg: ASbGncvkFXr6JotDYHHrWucidYAi93J/bTTu4I5CQOdfiJpw4+DDMgEgjrx1fpQOBLM
	aU/jxIQ/ZxlF+DrGEKDLTMYFD/JQovJ+ue6fmxn45zBnqotUE2W9dAvMayLx7+TEXPfzfU11oB1
	1ojYL5m2RgauM/RWZP39rnmndjHGIKb/sSm0iqyf1Pm94H4ByZ/vQFS5eoQW+EV6ZzBXAIUsMav
	pk/or8J61jN4QrXO16WEjElmKwbYfZ1V3epN4ZwHBfPpJCXuzSe2P71QNfMMdYwkJuguWsJkZsp
	CDDsrJvl0G/LNR0HyqIchHSpYQZ93ormUkHK7Pa2ZkKeR//Vup4WHVsdoY/WjCc3pes78pIhu/W
	ddNVzCGsiB9FnfCn1CpSXtKaHS2yIyxssvPvUps8=
X-Google-Smtp-Source: AGHT+IHumULm8qHxKG9fzjfCPuWjsysWOvQE7mpZ83iJFiztQIYCuXO8n4DoBWs4I6ra778JvsFQEQ==
X-Received: by 2002:a05:6a21:20a:b0:21f:4f34:6b1 with SMTP id adf61e73a8af0-21f4f3408ccmr4880441637.14.1749431110617;
        Sun, 08 Jun 2025 18:05:10 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f6683b1sm3652201a12.50.2025.06.08.18.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 18:05:10 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v3 3/3] rust: time: Add ktime_get() to ClockSource trait
Date: Mon,  9 Jun 2025 10:04:13 +0900
Message-ID: <20250609010415.3302835-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609010415.3302835-1-fujita.tomonori@gmail.com>
References: <20250609010415.3302835-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the ktime_get() associated function to the ClockSource
trait, allowing each clock source to specify how it retrieves the
current time. This enables Instant::now() to be implemented
generically using the type-level ClockSource abstraction.

This change enhances the type safety and extensibility of timekeeping
by statically associating time retrieval mechanisms with their
respective clock types. It also reduces the reliance on hardcoded
clock logic within Instant.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/helpers.c |  1 +
 rust/helpers/time.c    | 18 ++++++++++++++++++
 rust/kernel/time.rs    | 32 ++++++++++++++++++++++++++++----
 3 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 rust/helpers/time.c

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0f1b5d115985..0613a849e05c 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -39,6 +39,7 @@
 #include "spinlock.c"
 #include "sync.c"
 #include "task.c"
+#include "time.c"
 #include "uaccess.c"
 #include "vmalloc.c"
 #include "wait.c"
diff --git a/rust/helpers/time.c b/rust/helpers/time.c
new file mode 100644
index 000000000000..9c296e93a560
--- /dev/null
+++ b/rust/helpers/time.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/timekeeping.h>
+
+ktime_t rust_helper_ktime_get_real(void)
+{
+	return ktime_get_with_offset(TK_OFFS_REAL);
+}
+
+ktime_t rust_helper_ktime_get_boottime(void)
+{
+	return ktime_get_with_offset(TK_OFFS_BOOT);
+}
+
+ktime_t rust_helper_ktime_get_clocktai(void)
+{
+	return ktime_get_with_offset(TK_OFFS_TAI);
+}
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index bba62c7f37e4..9fd487276457 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -63,6 +63,11 @@ pub trait ClockSource {
     ///
     /// This constant corresponds to the C side `clockid_t` value.
     const ID: bindings::clockid_t;
+
+    /// Get the current time from the clock source.
+    ///
+    /// The function must return a value in the range from 0 to `KTIME_MAX`.
+    fn ktime_get() -> bindings::ktime_t;
 }
 
 /// A monotonically increasing clock.
@@ -80,6 +85,11 @@ pub trait ClockSource {
 
 impl ClockSource for Monotonic {
     const ID: bindings::clockid_t = bindings::CLOCK_MONOTONIC as bindings::clockid_t;
+
+    fn ktime_get() -> bindings::ktime_t {
+        // SAFETY: It is always safe to call `ktime_get()` outside of NMI context.
+        unsafe { bindings::ktime_get() }
+    }
 }
 
 /// A settable system-wide clock that measures real (i.e., wall-clock) time.
@@ -100,6 +110,11 @@ impl ClockSource for Monotonic {
 
 impl ClockSource for RealTime {
     const ID: bindings::clockid_t = bindings::CLOCK_REALTIME as bindings::clockid_t;
+
+    fn ktime_get() -> bindings::ktime_t {
+        // SAFETY: It is always safe to call `ktime_get_real()` outside of NMI context.
+        unsafe { bindings::ktime_get_real() }
+    }
 }
 
 /// A monotonic that ticks while system is suspended.
@@ -113,6 +128,11 @@ impl ClockSource for RealTime {
 
 impl ClockSource for BootTime {
     const ID: bindings::clockid_t = bindings::CLOCK_BOOTTIME as bindings::clockid_t;
+
+    fn ktime_get() -> bindings::ktime_t {
+        // SAFETY: It is always safe to call `ktime_get_boottime()` outside of NMI context.
+        unsafe { bindings::ktime_get_boottime() }
+    }
 }
 
 /// International Atomic Time.
@@ -130,6 +150,11 @@ impl ClockSource for BootTime {
 
 impl ClockSource for Tai {
     const ID: bindings::clockid_t = bindings::CLOCK_TAI as bindings::clockid_t;
+
+    fn ktime_get() -> bindings::ktime_t {
+        // SAFETY: It is always safe to call `ktime_get_tai()` outside of NMI context.
+        unsafe { bindings::ktime_get_clocktai() }
+    }
 }
 
 /// A specific point in time.
@@ -153,14 +178,13 @@ fn clone(&self) -> Self {
 impl<C: ClockSource> Copy for Instant<C> {}
 
 impl<C: ClockSource> Instant<C> {
-    /// Get the current time using `CLOCK_MONOTONIC`.
+    /// Get the current time from the clock source.
     #[inline]
     pub fn now() -> Self {
-        // INVARIANT: The `ktime_get()` function returns a value in the range
+        // INVARIANT: The `ClockSource::ktime_get()` function returns a value in the range
         // from 0 to `KTIME_MAX`.
         Self {
-            // SAFETY: It is always safe to call `ktime_get()` outside of NMI context.
-            inner: unsafe { bindings::ktime_get() },
+            inner: C::ktime_get(),
             _c: PhantomData,
         }
     }
-- 
2.43.0

