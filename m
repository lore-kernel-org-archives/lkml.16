Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CCF254AEC;
	Mon,  9 Jun 2025 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464709; cv=none; b=YbSYcI2kTwuM4bYF4xXxn98/0Eluatq/Vnyuoqm1WvnHGR4qLG95ABFEtr+3zicdJpdTXwyYmtcZdonXXztsXn/gR1xOGvBpRWBQF6OgThK33yBJbSu9iptUj9GEOAWE8Yed5ffsjfRcE5dlglcCSBbxFddurFcU25iywkhzt8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464709; c=relaxed/simple;
	bh=NRoPuLsRJOm5rC5ZB155G6bpOMGKHlkV77L8xCoa4OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZ5WJlWrBO1+5Rl151+0sBYJ+J6m7ERvw0yzWhgYYAB67nIgKu4Ic6TWpIL0YFrezCG0Ay0T4EjItFb4KHf7BSCTdyIplxFlKgNRfvsEoRv4ZBzKYu70R8NTMUUtbuuro10B5XMMCr0+pEcNX8sDvMH1ce4ArUsQREtRmdvXCCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYwQK8An; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYwQK8An"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74267c68c11so3215263b3a.0;
        Mon, 09 Jun 2025 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749464706; x=1750069506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mvvzlMbDdYmXYPtcaFob3b+rqUp5cEbqhNbwJWVQeI=;
        b=iYwQK8Ank+M+VHyZwBRY3cu5xlkvIpIvjSv64fmHJVhdXDDBYIsvkcYmACJw9CXdey
         Ojbunes4ptCKx0nIy15Z7m5AsNuhq+r1F98Mc2DiYm3xZJj+rCV/pCj1O+ZvkDNydAJR
         Q7sScvsuRKbL9PaKz13LQ5gV9jv1Ll9dx018NLqMPPhuOjLbfQmpUtC6RjhPUDhJ4z9b
         xuFOtGDOISOksPXAj7RoXAqw5QGftiaN+jYxoZagjOuUJiSfRhIajTHd1I738usFwXCV
         ZxQLawlPttkP5gTZyddCqE0envRLNPMha2nUx34FMjdhLr+Add/LsJzQ/a7oQo5r0wT5
         BB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464706; x=1750069506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mvvzlMbDdYmXYPtcaFob3b+rqUp5cEbqhNbwJWVQeI=;
        b=CgRYpM93g1wUrs1wKpL87SCMPpzZLHpAd8R+fTPY8PuR/rcRJTjpQ7+WqetbQRq+6H
         VujQ3l/e2b7IiF9yjU9MjAiGOC4u+ibd1RCznmqS8uEM7/9HMdZEpqbgNDcZ4cyjKS7g
         Qn5yFwrh0486TXZeoToojdbeqpIhIsQu39E1f77PlNBIbJnmiwrIPGW3skEj/nn7PD9A
         PIycU1NqL20Cvh5VxeWQs6Ww20xvrmwdQ8ERE6Qjrhv/+3OcUFTER5dzU7Tl5O0XrYQ5
         OfF8sXfIEYqA3qB7dBNF+FYxlI+IrHM8pLTPfK+FPNGpGekaskY9hTWHIBlSxMxzrVYi
         rKrw==
X-Forwarded-Encrypted: i=1; AJvYcCUb8wzaWG94f1Erzsmom/BeZGVEHL/Cm81gaFAFBib5MhaJM0U2BpXtT9N2AKNViy+MyjT8RmpooBUn2FNhnXM=@vger.kernel.org, AJvYcCXc1pDMzIpu8SfcuN785DIa7SPwKuvUkcTmkq1ZsRSn3HpZe2HbmjfFIKcCtPohsjJa4r2qAiK429PlUZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcF03VSe30oEgdxiAvW2Dv1Wo8wTqRmAHlTmQXP7xsETcbpe64
	PLQj3yjuy6Gf+0kNIUuAr6nJAwF6qo+bQ0QjW6EDr4L3HXVsq1AR8sKZ
X-Gm-Gg: ASbGnct+eT0CL6I4l2wFd/OLx3M8XYhWphR3InhkzW+mhUG2W9vOqtD/QFAKK97mbUE
	1jjgyC4Iv5znFaclkcjE+TMACZC2JtytLBECSsoy/I+VNE9WtsUEJ7UvhVw3door5G6cyq4hfGC
	p8Ts0lUvwA3qgh1O+6Ah/Gn2Z0imRT7qh8d3Ok+G1NMtB1mbYsVMIuZx+hzao4stmOWCCYR9jfQ
	foZ6nB+66Ufg2dcBb+p0MhToZBTcDDBOJTAOX6DixUoofmJejVs/fvoF28o5MZqjpaRsZYaS/fA
	0xR9c6uMwbzi4rkhToT3gmJmJOoJ6pRyWv1SGLjEWzNIl2t4VdipXjF42WxgTrQeGqoH8Xi+hk9
	6lnXApeELbWcL7WEPcK/hSs0ZuOXI
X-Google-Smtp-Source: AGHT+IFFPwoVXxhdM4S72s0OU9VWdVYA66KBKYdAIFgoOapovhqANyPB+kLyEWcaGCb/LOIcbgX05w==
X-Received: by 2002:a05:6a00:13a4:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-74827e51491mr17733848b3a.3.1749464706447;
        Mon, 09 Jun 2025 03:25:06 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c082csm5403262b3a.121.2025.06.09.03.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:25:06 -0700 (PDT)
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
Subject: [PATCH v2 2/5] rust: time: Replace HrTimerMode enum with trait-based mode types
Date: Mon,  9 Jun 2025 19:24:15 +0900
Message-ID: <20250609102418.3345792-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609102418.3345792-1-fujita.tomonori@gmail.com>
References: <20250609102418.3345792-1-fujita.tomonori@gmail.com>
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

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 164 ++++++++++++++++++++----------------
 1 file changed, 90 insertions(+), 74 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 280128d7e982..23f9f1ba8607 100644
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
@@ -412,77 +412,93 @@ fn into_c(self) -> bindings::hrtimer_restart {
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

