Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430A428BA9F;
	Tue, 10 Jun 2025 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548016; cv=none; b=FUAvHj4hGmE+OFpo8BtA9xngUR+LnDJ4Gc0w0Y5lAe5kZjc+6S6BOk8reA+pvUnkubCY/kqhinOSH9gLntJDM5tH/5Wt2oBus9zQyS8PhKdKB1GX79rf1Qf9dajn2KJA8PL+pspEVwenVUEM71h7huDccKZJxTjSaCO5pUA6u6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548016; c=relaxed/simple;
	bh=W1d08jaSgIfruH3mOqOqSxuXLtN6w+hQDE9ys0a6DFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbcL4ddIViY1V1+jUsGBXKMJpQ3rsFBHK8FHGYWG++q1zrZk8s/5+/XnjljP62XPQVqLrm0e2U70gFya/jAo++ezdoxEeEav/huC+ctewcGcsTzqlNCV2/QWMNEtxOWhNF9wsIfVkLRHcO5tCCtJ5/60K9i/ZWpHUy7jHLdc1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmvJhB85; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmvJhB85"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso4599640b3a.2;
        Tue, 10 Jun 2025 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548014; x=1750152814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRHF11saV1NN0W+sCw/Qk3BmNy4EmF/eTZscZe/XeMw=;
        b=UmvJhB85Xy8QhMiYvOdLt6bTY4u4ZZzizJ1/a8yOXvQBXVlCryhImrCao3crsNwxv4
         ONwz9prURKR3wQEvEKAHOOrzH6n3naYIXWfo+6AAnE81sWLb+H46JOtMn3pWGdPZIKsP
         ITbB56rj6C35TV+PSd0vOBNYkmL+nNf6vCUNZH334ygNZIe1QCGessONagJmW7n3+Kwn
         GULe1BhY3P14N8qQJmKaLLsYQ/QZImEjS+ZEnOeaIEHoqBQztF0HZ9uWxEKCWBLT9dIV
         KnOWqj6y5dy81sgncZJOEPgU/QN5SphigYcyK6XT6F4yUzMOL0Kin7rV7Fe9yHK2HrFi
         2kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548014; x=1750152814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRHF11saV1NN0W+sCw/Qk3BmNy4EmF/eTZscZe/XeMw=;
        b=m07MrckVK6QzsqETcQzEcr/4q8yEEP/TTEm1rLZsCcMGkdg1CQ9YKzxe5DpgscITkf
         hHYI77kYfpsLKQOYRLzEffd+KGwAZw2qcUjX1aryTdfypmz8kjbPyS3+fEE86A+LHhAz
         w4oSz8YSdubI1mDVIdylxcIhnJ9kygJz2Hn0yu1hGYuNVEN9mWxxLMXTGakR8ImKZZOd
         8kJaAQDbjT0kwXQkIQDK0uRH2snI1BTE428/zaQdO8GYtQVoarpj0PTCjB0dyvHtoYRS
         h1dIyU0L22ZRqe8rzigDj4BtHeRnmV712QKTOghPeRmN/Hyx/1JLiUEg/Y7LXNa8GlxV
         tMsw==
X-Forwarded-Encrypted: i=1; AJvYcCX62RJ1HpvkOoEKpVR7JKBrtdDR7JDeJxDIWUGwWH12vUHg3oMg0xY5A+fy9/eE8lu7YbbYlyU4pGM0CEv2EpA=@vger.kernel.org, AJvYcCXlv9XOfDCnX7vTD7JTWaqrMp0s+n7lyDg8h+fULEqk51VTTFcRr9uMWaAF+iy5CQMxUUA3McIUPuF3YA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwEXaW0jf946dxDePE3MeNzknmEEfKvFm7SpLaraOMwR5amp5J
	l0YggWmuoNvtPg/CPwpcBHmH8zb4wfGPGakIKkXUwiH6W5AXr/eIKHIu
X-Gm-Gg: ASbGncvGD8jafLNuC0ChkLHsjVfMGCp7kjCj3nNTHjSvdXExC2rejs+KUr/pHEaxZSC
	r/x/A8fHomkIV2KZbWx4VVUZwDc+6NcI3Ia9VlTF4tUXcLaS36v/XyJtnkhVx7WCRP17qxHJtLv
	0uAJGxnMuynx5lXPzKr+S7lnnICctMxQO4L+3mQB7m4P9NN2IIi4vuK4l7KK1fLFNBGkak5U6Jz
	HuegDCo4ocvyvRAD85Xzxj3I52MxKLbvT8nho5jeSZtFYhxVjoR9MzH9fP5RSOnq+PqY1SNvuJM
	O8ag5p8QZJwbLbXnTK71IFvx1LJDmAt6KT+JUTmr8Sc/tOAPTQIVh1g0ZTWklgbaDA+g/6NCAmn
	mwiNG/SIoc2loPjsJWsZgR7FgvqfgtFnETiQ=
X-Google-Smtp-Source: AGHT+IE7HC00zZOwfrEaNrx2TbCqkBjgo1u5471RtIb0C6a0gVqVw5ZoJ8OhMNaYX05AdusU6nOxzg==
X-Received: by 2002:a05:6a00:21d1:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-74827ea2b39mr20183743b3a.12.1749548014364;
        Tue, 10 Jun 2025 02:33:34 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0847e9sm7037684b3a.87.2025.06.10.02.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:33:34 -0700 (PDT)
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
Subject: [PATCH v4 3/3] rust: time: Add ktime_get() to ClockSource trait
Date: Tue, 10 Jun 2025 18:32:56 +0900
Message-ID: <20250610093258.3435874-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610093258.3435874-1-fujita.tomonori@gmail.com>
References: <20250610093258.3435874-1-fujita.tomonori@gmail.com>
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
index 000000000000..c99ea77c5ceb
--- /dev/null
+++ b/rust/helpers/time.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/timekeeping.h>
+
+ktime_t rust_helper_ktime_get_real(void)
+{
+	return ktime_get_real();
+}
+
+ktime_t rust_helper_ktime_get_boottime(void)
+{
+	return ktime_get_boottime();
+}
+
+ktime_t rust_helper_ktime_get_clocktai(void)
+{
+	return ktime_get_clocktai();
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

