Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FB317BB35;
	Sun,  4 May 2025 04:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746332698; cv=none; b=ES94kEpKecHSTyf2Srho9696t/0N1hWqC39EsrWZ4wxWAm+X4Pc7JEdhFoR1BhOMBDMKf6t1funfnQ441bLMRdNvnKzgGa2OEWOvg68P3ox5hgHBPVKGqC0mjcHVL5KOv+Y72e6ly7tBQDAyD1DU+cdNqDBMtaqI50UjDxN/ZgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746332698; c=relaxed/simple;
	bh=1sBK2RO1fUXRegO3hXO+fTjEo09ojRhQfVGN29ukGZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMcTDDZaOgpCdfiY+IeNrOG23aMisQf79SVkLF897QrLw2NvGsezwl/s4y7fsnq/m2e37Ted/Jp7r+0UF3h53T5XLjPrFQXwCcM+ASZt3TIPRo/my+mXehorNmh+DhB2F3q3Q+KATNIvvk09YPloRqQdtiv14ThkbilGgTptWOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/KpjrK6; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/KpjrK6"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af908bb32fdso2978252a12.1;
        Sat, 03 May 2025 21:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746332696; x=1746937496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7Tna5veepmGz/9U/3f4p7MVzaMNOPpGUU1xoKU1Tno=;
        b=F/KpjrK6VE4OxP258JuSk0TCqZckLmhOP3A66faIg6DPrCkbK69WHKx0M/wYFblE5a
         HXUEMEE8Y5uPEy8MGanfZuxVeQgs9sTkqjsvtMqJMHlY8DSsLrqr8ERmaRWLrG91yfw1
         fQAj/ke/eXlNq4MpU+QghSIQX/ogTen5PXcLVLfrUlJt01afI9qamh6PjSeyaWSGxJUi
         jjxVvOP7E4iDY7lMAzdxKdAoViZQVaFI01E7O2ZWpiZTg/dR7ImwVRRAh78yc83YrWJk
         WZSo6lifL8ibA2Eks0/yU6fIMUjUmWo8b4KgW5WMa6nKWR7G6TAiOzbQD0dM/XbYX2KK
         uxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746332696; x=1746937496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7Tna5veepmGz/9U/3f4p7MVzaMNOPpGUU1xoKU1Tno=;
        b=RrmWzIJdzoAvmTQk1pMoL+NwFYfimufJxzzIx0e92VLsM0Yv4+We+uycCM2ycLdaGa
         a3CZs8AHzoE+5PXWH6lgrMAxyT44B84vLr0x0Qy7UpgTr2RHXMBnLZgOjPCFs/RvBiu6
         C16Vifb8IhFKvXppyA8+HA3xAshUpmG73ypzwHKYjW2JDwT2lMgzW8SwEJx1cZciTcrK
         yTvhlQvdPw+4c0GBOx/NxgWogRYuLI3DfN8lRsdtPWt2eA6Qgzj1DYvdsqNVmEf4RfLN
         /i3R2KoLcMeLfem0YRAlgEuH3mkm71mz5I7d3RO/dYcj93Kg9dCsQPiZ5ke4xb4MjVmO
         mhWw==
X-Forwarded-Encrypted: i=1; AJvYcCX3PMxMX/9N5iuGBOdAOZM+5C2mlSG6i8KKlebB8FGVmmtsFKP/twMrY+OX7o4gtnD0sr682340cGqE3zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxnEv9fDeO2kwHohnSAi8Qh2WppvI/kSy2dTMHtRuvrFL/yEO
	e0Su3cfnrO6O7XxW2AeGsxHqp0kYAGw6mOe9qbrZHO6xzfYQW6ht0HVVxR7e
X-Gm-Gg: ASbGnctFGvLOMlRPmwXr9c0JDetf7RGnmyVR8ha3ac8267Da2MnQ3mdZQn/00Mj91bO
	1V+UoCl8x9YMNte2Tj8CHOAxWl8yhxlPV3nYhk0M/UA8NoH5MupE5G3oK8G/kSuLCBS2CEoG3s/
	/oS1LhMpMGZUMMScEgGnJBWkCxCjfYptrMiuvHwW/Hwyo1yLrFeUBTtd/i7l7bYiSZtZxYv9TgW
	noNvA3DvuX5HNHKCqjzqHIvtOu5MnjHyuK3R/5kBclmBk2RvGBsCruHEaTwW/MKs2boH7QZ4FNL
	upprwrutk7zyLj7vqv9EXexKVAY+bYHkwNAU767kMf35c0Gz2kwphBg1RHOeyFB6NUcT2fBrtpG
	j+9np9/nXsUeVkEpSuQ==
X-Google-Smtp-Source: AGHT+IF+q32viBchNhIVP0ATOeLTCT175civYMi9xVnpHibFJtK/AnWe4JHRr6QKeFO/i3Yjiv/CXw==
X-Received: by 2002:a17:902:f607:b0:221:751f:cfbe with SMTP id d9443c01a7336-22e100a19d8mr144016635ad.19.1746332696282;
        Sat, 03 May 2025 21:24:56 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fbc8sm31482185ad.142.2025.05.03.21.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 21:24:55 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@linutronix.de,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] rust: time: Add ktime_get() to ClockSource trait
Date: Sun,  4 May 2025 13:24:35 +0900
Message-ID: <20250504042436.237756-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504042436.237756-1-fujita.tomonori@gmail.com>
References: <20250504042436.237756-1-fujita.tomonori@gmail.com>
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
 rust/helpers/time.c | 16 ++++++++++++++++
 rust/kernel/time.rs | 32 ++++++++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 3d31473bce08..31208f1042a1 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/ktime.h>
+#include <linux/timekeeping.h>
 
 s64 rust_helper_ktime_to_us(const ktime_t kt)
 {
@@ -11,3 +12,18 @@ s64 rust_helper_ktime_to_ms(const ktime_t kt)
 {
 	return ktime_to_ms(kt);
 }
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
index 3bc76f75bfd0..1be5ecd814d3 100644
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

