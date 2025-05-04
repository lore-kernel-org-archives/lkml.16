Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F8E17A31C;
	Sun,  4 May 2025 05:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746334824; cv=none; b=a/h+iA47v+F/DG1xMImhA09kCpMA1s29OhvclKNdd45nPiFwzW/6s23KruEQZWI6tYFfZtKgyV78SQZjLXFTisWBQHqPFgerSOfPZorcnrqL345TLiToHtEhsfdyGLQOpXh1NWuxGgjkQQMq+mYehBLrn5GghMyNaysDASiKJ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746334824; c=relaxed/simple;
	bh=U3DM6lQPbqJ6rCjoJ36SG9EAj2Vpil7SfdTr2c8DC+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9DWJpNNZre2iFQwyW7dhXWVuSditcrn9ozX1xYpVRKS+DQ050d55WYRYb4Hfeklf1ebx3UlgoJi+Kh7EYWA2Dr0FPC8Sw0lG7fehlTBfxsz/n6NrE/LPNJT3G3ffP6dUMOI0M3go1qk0/ivVEDVBW5b/fagIuT1WnTVON+w7Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOfWjNWI; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOfWjNWI"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso4652748b3a.0;
        Sat, 03 May 2025 22:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746334819; x=1746939619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fqidDXq0kr00V4UH5PYapGK6UsK8iPCy8jxg2+xVp8=;
        b=jOfWjNWIzTBAIs7/yu3sKE0Qo87sF+OCQGnlXc79mb/Tx5PxLMfhnzzVsQhge0LGNa
         GUCgDI8SowHVda6t4ldh0Cn4F95jU/PEyp5w72vFGZey9Y/nP43RKmiXeaJKGrKxj5g/
         98pLWV2/1Eosvfl6YY4NlqJ5GFR+x8hLujJ5O/MoKt61ZZDlOHsGAjz/Xp4md0045Q0e
         UCVHOU4FQ1fhCZRrgM7gdsYm6dCvvTF57xJ7la4Vk4jcun/Y3t3m9VjRT4+igPBq/goA
         ZNOj6lMfmbr2JuY4rEKdmMG6lwCbaiKiD4DExMGSDI9sysoZhEujIUuk7tYwEha0x2Lu
         GNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746334819; x=1746939619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fqidDXq0kr00V4UH5PYapGK6UsK8iPCy8jxg2+xVp8=;
        b=QwTDrRqo+2vZAKzNMyJO4/B5MkjbhgNUvIde5wfOsnVCC+L2+Wh2dZ8eOOGmZOfUIR
         g7vXmOuCjKtTC83EQGMTlEX2olP751QrX4tMqGaa2AQurCFCb19N/pq+zx+aFh5xxJBk
         pBI7VLwTYupGS3tjdy82OMJluL6EJUaBZkZ0GtgGFUutCifY3X62AmceTr0liiXwBZQx
         hXdNdduoKpVMcK3L/YipJcvDUNttwEiS/+T++BldHL2dLWKhBAPXNKeT06s0LWMS4jgk
         hAURgZbVFB2fyjmnOWS84AD9C4gzfHt/EoRhs9SyA/v4Ejm2EsUXTM8b4nEuDal+D0ev
         Vrog==
X-Forwarded-Encrypted: i=1; AJvYcCVD/6Bq9rUwJkQMTzPi0TAhr+THTn/JuQYUHPUYpI0apInbEqxucAbKhvzLPOxh6dH6tvw0rk+hgvPAZbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhv46lxc6o8+G1tOxXteyLn+FG47XFjGvpAl5RyMBKBg20NnjN
	yq68Eejz+RhaX/Y1BEldNe8jN7fYfhPSVWXTrOoYNzYXAMT7njoGdIe4xoxx
X-Gm-Gg: ASbGncuUJwZ2iP8UEyJ12guS++0dfd286Qrsz1JUbUTvTydfdBOkvUXNJvU5WXNIdt3
	RxNovSyzsJhjO3js49oRRiOjwsL4y/tHTZadtzLFrKh9zt9R6J2YiZWc348DhoYC679u99rSRDs
	pFu7eBA7ow+GVD6DvPShiBPFty9umTgtnEQI1l4cU+orwK9XE++5fDNMO0/wmKRDkrwVImPO0xa
	JvnQnKqS7jkDYGVdRETSa7rS181iikbg32RDL2UXaRHYxbnABF258FKQE+QnET0ULZPWwPFW1Cb
	GJyVtdEd7dI2tWqKZy90xZqGIDRzabNBt7yyBhm/ktg99qeQRxfH9ETE79Mg9BBTcHqHjqcrMoz
	7pT4tARPCXncB2JI1mw==
X-Google-Smtp-Source: AGHT+IGbR+X/XCX7yvRNACmxnQX6hpeszflRUO/N06xDw0HBKwL+UCyJuF2NqSqOECgXdY7GNILAug==
X-Received: by 2002:a05:6a00:2985:b0:736:3c2b:c38e with SMTP id d2e1a72fcca58-7406735b5a1mr6972772b3a.13.1746334819445;
        Sat, 03 May 2025 22:00:19 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db91dasm4225756b3a.44.2025.05.03.22.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:00:19 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
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
Subject: [PATCH v1 2/5] rust: timer: Replace HrTimerMode enum with trait-based mode types
Date: Sun,  4 May 2025 13:59:55 +0900
Message-ID: <20250504045959.238068-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504045959.238068-1-fujita.tomonori@gmail.com>
References: <20250504045959.238068-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the `HrTimerMode` enum with a trait-based approach that uses
zero-sized types to represent each mode of operation. Each mode now
implements the `HrTimerMode` trait.

This refactoring is a preparation for replacing raw `Ktime` in HrTimer
with the `Instant` and `Delta` types, and for making `HrTimer` generic
over a `ClockSource`.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 164 ++++++++++++++++++++----------------
 1 file changed, 90 insertions(+), 74 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 380712d4302a..24d013e47c7b 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -98,7 +98,7 @@ pub fn to_ns(self) -> i64 {
 pub struct HrTimer<T> {
     #[pin]
     timer: Opaque<bindings::hrtimer>,
-    mode: HrTimerMode,
+    mode: bindings::hrtimer_mode,
     _t: PhantomData<T>,
 }
 
@@ -112,7 +112,7 @@ unsafe impl<T> Sync for HrTimer<T> {}
 
 impl<T> HrTimer<T> {
     /// Return an initializer for a new timer instance.
-    pub fn new<U: ClockSource>(mode: HrTimerMode) -> impl PinInit<Self>
+    pub fn new<U: ClockSource, M: HrTimerMode>() -> impl PinInit<Self>
     where
         T: HrTimerCallback,
     {
@@ -127,11 +127,11 @@ pub fn new<U: ClockSource>(mode: HrTimerMode) -> impl PinInit<Self>
                         place,
                         Some(T::Pointer::run),
                         U::ID,
-                        mode.into_c(),
+                        M::C_MODE,
                     );
                 }
             }),
-            mode: mode,
+            mode: M::C_MODE,
             _t: PhantomData,
         })
     }
@@ -389,7 +389,7 @@ unsafe fn start(this: *const Self, expires: Ktime) {
                 Self::c_timer_ptr(this).cast_mut(),
                 expires.to_ns(),
                 0,
-                (*Self::raw_get_timer(this)).mode.into_c(),
+                (*Self::raw_get_timer(this)).mode,
             );
         }
     }
@@ -414,77 +414,93 @@ fn into_c(self) -> bindings::hrtimer_restart {
 }
 
 /// Operational mode of [`HrTimer`].
-// NOTE: Some of these have the same encoding on the C side, so we keep
-// `repr(Rust)` and convert elsewhere.
-#[derive(Clone, Copy, PartialEq, Eq, Debug)]
-pub enum HrTimerMode {
-    /// Timer expires at the given expiration time.
-    Absolute,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    Relative,
-    /// Timer does not move between CPU cores.
-    Pinned,
-    /// Timer handler is executed in soft irq context.
-    Soft,
-    /// Timer handler is executed in hard irq context.
-    Hard,
-    /// Timer expires at the given expiration time.
-    /// Timer does not move between CPU cores.
-    AbsolutePinned,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    /// Timer does not move between CPU cores.
-    RelativePinned,
-    /// Timer expires at the given expiration time.
-    /// Timer handler is executed in soft irq context.
-    AbsoluteSoft,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    /// Timer handler is executed in soft irq context.
-    RelativeSoft,
-    /// Timer expires at the given expiration time.
-    /// Timer does not move between CPU cores.
-    /// Timer handler is executed in soft irq context.
-    AbsolutePinnedSoft,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    /// Timer does not move between CPU cores.
-    /// Timer handler is executed in soft irq context.
-    RelativePinnedSoft,
-    /// Timer expires at the given expiration time.
-    /// Timer handler is executed in hard irq context.
-    AbsoluteHard,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    /// Timer handler is executed in hard irq context.
-    RelativeHard,
-    /// Timer expires at the given expiration time.
-    /// Timer does not move between CPU cores.
-    /// Timer handler is executed in hard irq context.
-    AbsolutePinnedHard,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    /// Timer does not move between CPU cores.
-    /// Timer handler is executed in hard irq context.
-    RelativePinnedHard,
+pub trait HrTimerMode {
+    /// The C representation of hrtimer mode.
+    const C_MODE: bindings::hrtimer_mode;
 }
 
-impl HrTimerMode {
-    fn into_c(self) -> bindings::hrtimer_mode {
-        use bindings::*;
-        match self {
-            HrTimerMode::Absolute => hrtimer_mode_HRTIMER_MODE_ABS,
-            HrTimerMode::Relative => hrtimer_mode_HRTIMER_MODE_REL,
-            HrTimerMode::Pinned => hrtimer_mode_HRTIMER_MODE_PINNED,
-            HrTimerMode::Soft => hrtimer_mode_HRTIMER_MODE_SOFT,
-            HrTimerMode::Hard => hrtimer_mode_HRTIMER_MODE_HARD,
-            HrTimerMode::AbsolutePinned => hrtimer_mode_HRTIMER_MODE_ABS_PINNED,
-            HrTimerMode::RelativePinned => hrtimer_mode_HRTIMER_MODE_REL_PINNED,
-            HrTimerMode::AbsoluteSoft => hrtimer_mode_HRTIMER_MODE_ABS_SOFT,
-            HrTimerMode::RelativeSoft => hrtimer_mode_HRTIMER_MODE_REL_SOFT,
-            HrTimerMode::AbsolutePinnedSoft => hrtimer_mode_HRTIMER_MODE_ABS_PINNED_SOFT,
-            HrTimerMode::RelativePinnedSoft => hrtimer_mode_HRTIMER_MODE_REL_PINNED_SOFT,
-            HrTimerMode::AbsoluteHard => hrtimer_mode_HRTIMER_MODE_ABS_HARD,
-            HrTimerMode::RelativeHard => hrtimer_mode_HRTIMER_MODE_REL_HARD,
-            HrTimerMode::AbsolutePinnedHard => hrtimer_mode_HRTIMER_MODE_ABS_PINNED_HARD,
-            HrTimerMode::RelativePinnedHard => hrtimer_mode_HRTIMER_MODE_REL_PINNED_HARD,
-        }
-    }
+/// Timer that expires at a fixed point in time.
+pub struct AbsoluteMode;
+
+impl HrTimerMode for AbsoluteMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS;
+}
+
+/// Timer that expires after a delay from now.
+pub struct RelativeMode;
+
+impl HrTimerMode for RelativeMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL;
+}
+
+/// Timer with absolute expiration time, pinned to its current CPU.
+pub struct AbsolutePinnedMode;
+
+impl HrTimerMode for AbsolutePinnedMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED;
+}
+
+/// Timer with relative expiration time, pinned to its current CPU.
+pub struct RelativePinnedMode;
+
+impl HrTimerMode for RelativePinnedMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED;
+}
+
+/// Timer with absolute expiration, handled in soft irq context.
+pub struct AbsoluteSoftMode;
+
+impl HrTimerMode for AbsoluteSoftMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_SOFT;
+}
+
+/// Timer with relative expiration, handled in soft irq context.
+pub struct RelativeSoftMode;
+
+impl HrTimerMode for RelativeSoftMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_SOFT;
+}
+
+/// Timer with absolute expiration, pinned to CPU and handled in soft irq context.
+pub struct AbsolutePinnedSoftMode;
+
+impl HrTimerMode for AbsolutePinnedSoftMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED_SOFT;
+}
+
+/// Timer with relative expiration, pinned to CPU and handled in soft irq context.
+pub struct RelativePinnedSoftMode;
+
+impl HrTimerMode for RelativePinnedSoftMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED_SOFT;
+}
+
+/// Timer with absolute expiration, handled in hard irq context.
+pub struct AbsoluteHardMode;
+
+impl HrTimerMode for AbsoluteHardMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_HARD;
+}
+
+/// Timer with relative expiration, handled in hard irq context.
+pub struct RelativeHardMode;
+
+impl HrTimerMode for RelativeHardMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_HARD;
+}
+
+/// Timer with absolute expiration, pinned to CPU and handled in hard irq context.
+pub struct AbsolutePinnedHardMode;
+
+impl HrTimerMode for AbsolutePinnedHardMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED_HARD;
+}
+
+/// Timer with relative expiration, pinned to CPU and handled in hard irq context.
+pub struct RelativePinnedHardMode;
+
+impl HrTimerMode for RelativePinnedHardMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED_HARD;
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.
-- 
2.43.0

