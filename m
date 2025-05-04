Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9101624EA;
	Sun,  4 May 2025 05:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746334826; cv=none; b=J7wju+HVXunhg7CCMY0bv2Sbcg/IwTyz4b90DSVljKSvzClzmb3w4vsvAMvGfUyLLcb6zPh0YECMLDC8c06VRtIipWH7k0WwsbfMrWF+MvLYGXwUeUiZ+8yB5J/UymQfqriUA4JSaQ0aay6v14YmKmwmF5r4aQELlDfzZtAIxXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746334826; c=relaxed/simple;
	bh=sQSpKCM4nRT8s/biIXq9ewwRy0TRGc+mLHnMW7AnnJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQWpzyuPk7UNA2cJePRxY4PWJdXszJZATCk8Fial0tzh74S9zqduEUkgFSm9fkMC+beHlEudGwm/CHsL2ns0f8AynZVnZJ26aGmLh2aAXLFJE9YpFvm11wgp5T4oPtg6d5ZZEca1XL57/i/oj2CMVHh6uVN5NJgSQ3JhBgS07Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmGWGTYa; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmGWGTYa"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7376dd56eccso3856864b3a.0;
        Sat, 03 May 2025 22:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746334823; x=1746939623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agUh2e8B8oeY+1DKKBDray7XNmeFmBpkHwJwg0QmBUI=;
        b=TmGWGTYa/QVAnE/RLtKEEb9mdkbwiLsh5qQXwaGMAIOvCQemT5S2b+HSdpgsX6EP+8
         w2oUgLB1boUA1yOXM0xZonGrUaa1vIr+bTJDPaubEZR+PtwoE+kzTAMv5n4x4TAXEA6b
         U3TQVrB3I4VVWJbmgCj2C686UOpVqhRPow0DTWZGoWfZx/WOY+nULeF5zGWl1vC5xL1h
         Qotk5Dkl0j0sCJ3VvcSHA8XgP62LvC3uTNaZitnWjcd55IwUKMXI+Uy44flJ5KCKkhEI
         6CBF9jOv07rYEnfB2knPPNLTZmVhfA55ZQizFH+ujz2FAJoCKTt/bJlWmZ4j298IxXUQ
         ALXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746334823; x=1746939623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agUh2e8B8oeY+1DKKBDray7XNmeFmBpkHwJwg0QmBUI=;
        b=R19MLyOKdr0V8MS53yqq2JoOeSK2juMZRKvfva2EkKu5I4bqI0jp/nxYMJD6ba+dXw
         ltad0LMNTh+Ql0MTOaUaPHtophP6tzKse10oEqFhH4BTH93hVCLLANaCPaYUUkToJtnH
         SfrlFQsr+K6xoT+yZwE2Y2Jb1VxT1dR3UsAspas8icbR7LXkrbRdDAr6volJwmfYL3ya
         P0Wu9auaSitRTcVBmk3TwaEoI8Wo2F/2M2sm3zk+j58IFT1/fAkbf1Hvi18GdV+p2TBN
         6nJC6wj9XXiu4a1VyUzPM0nMdT50r1Pv6Pp8XBzbY/KzVwE6nUZXqFw+Hs+dwlBFZH3I
         2AsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCu3LDhUTWbZE3LWAJ1JhPrjp/yHo+xIun7iLkKeHn4ZsysY++d756n61y2TfmyLRSNR9DEek/A9TCrgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTh0yYyf6US8QNy+7Ls5SKx5BMy8DrYTYsIuJ6wNisTfj4fZDy
	51LeUwNaXVY8rvnZHeM1T60wKNQudJLhsvwj2/mqfFuHIcitLPnwQxk22MWF
X-Gm-Gg: ASbGnctWpzut9DyXAUfBsNFHuDeqeoZlGdND75+SmCpAm27yGA4v/0sI7vRF6zM1DmW
	2s3os69iTfXhNfW5PHMZiYT8rXwJI1OVQllf0xo+1tFrI2Ulr4VwwMcGcprrgD9FzxXOPhVY/Jn
	4T0frt6wynfn7zZFNrfYO1JWrgbRGu8SCF68eggzanDAFqPUPl7Xhj6GHGQK4+uk408BcbbJyaF
	rdp195LUH9VtTcuj/k952/E4JoT5NvTRRf/Q6kCmVRCmtnZE9jYhAiBEH7yqDDH0LZ3354tKm6/
	vsw3MvRsuGb4u9p9lv5XddQS6lec1TZGEs0yOZT8eDGnK6lfTG9vp0OUX3FkHKZpw3sLNgSsuCc
	CxLlNJO1W4Z/jNL94Fw==
X-Google-Smtp-Source: AGHT+IHdHowyMjgIUsJKcsoDOA0kOb5VVCmXkLZKvPXbu8T3Qjq2h/R3o3kD4F6iSYhnchKTZxVKFw==
X-Received: by 2002:a05:6a00:3012:b0:736:4704:d5da with SMTP id d2e1a72fcca58-7406f1b442emr3939398b3a.22.1746334823561;
        Sat, 03 May 2025 22:00:23 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db91dasm4225756b3a.44.2025.05.03.22.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:00:23 -0700 (PDT)
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
Subject: [PATCH v1 3/5] rust: time: Add HrTimerExpires trait
Date: Sun,  4 May 2025 13:59:56 +0900
Message-ID: <20250504045959.238068-4-fujita.tomonori@gmail.com>
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

Introduce the `HrTimerExpires` trait to represent types that can be
used as expiration values for high-resolution timers. Define a
required method, `as_nanos()`, which returns the expiration time as a
raw nanosecond value suitable for use with C's hrtimer APIs.

Also extend the `HrTimerMode` to use the `HrTimerExpires` trait.

This refactoring is a preparation for enabling hrtimer code to work
uniformly with both absolute and relative expiration modes.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs         |   5 +
 rust/kernel/time/hrtimer.rs | 181 ++++++++++++++++++++++++------------
 2 files changed, 128 insertions(+), 58 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index deca2999ced6..ac9551fca14f 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -194,6 +194,11 @@ pub fn now() -> Self {
     pub fn elapsed(&self) -> Delta {
         Self::now() - *self
     }
+
+    #[inline]
+    pub(crate) fn as_nanos(&self) -> i64 {
+        self.inner
+    }
 }
 
 impl<C: ClockSource> core::ops::Sub for Instant<C> {
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 24d013e47c7b..55e1825425b6 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -67,7 +67,7 @@
 //! A `restart` operation on a timer in the **stopped** state is equivalent to a
 //! `start` operation.
 
-use super::ClockSource;
+use super::{ClockSource, Delta, Instant};
 use crate::{prelude::*, types::Opaque};
 use core::marker::PhantomData;
 use pin_init::PinInit;
@@ -413,94 +413,159 @@ fn into_c(self) -> bindings::hrtimer_restart {
     }
 }
 
+/// Time representations that can be used as expiration values in [`HrTimer`].
+pub trait HrTimerExpires {
+    /// Converts the expiration time into a nanosecond representation.
+    ///
+    /// This value corresponds to a raw ktime_t value, suitable for passing to kernel
+    /// timer functions. The interpretation (absolute vs relative) depends on the
+    /// associated [HrTimerMode] in use.
+    fn as_nanos(&self) -> i64;
+}
+
+impl<C: ClockSource> HrTimerExpires for Instant<C> {
+    fn as_nanos(&self) -> i64 {
+        Instant::<C>::as_nanos(self)
+    }
+}
+
+impl HrTimerExpires for Delta {
+    fn as_nanos(&self) -> i64 {
+        Delta::as_nanos(self)
+    }
+}
+
 /// Operational mode of [`HrTimer`].
 pub trait HrTimerMode {
     /// The C representation of hrtimer mode.
     const C_MODE: bindings::hrtimer_mode;
-}
 
-/// Timer that expires at a fixed point in time.
-pub struct AbsoluteMode;
+    /// Type representing the clock source.
+    type Clock: ClockSource;
 
-impl HrTimerMode for AbsoluteMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS;
+    /// Type representing the expiration specification (absolute or relative time).
+    type Expires: HrTimerExpires;
 }
 
-/// Timer that expires after a delay from now.
-pub struct RelativeMode;
-
-impl HrTimerMode for RelativeMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL;
-}
+/// Defines a new `HrTimerMode` implementation with a given expiration type and C mode.
+#[doc(hidden)]
+macro_rules! define_hrtimer_mode {
+    (
+        $(#[$meta:meta])*
+        $vis:vis struct $name:ident<$clock:ident> {
+            c = $mode:ident,
+            expires = $expires:ty
+        }
+    ) => {
+        $(#[$meta])*
+        $vis struct $name<$clock: $crate::time::ClockSource>(
+            ::core::marker::PhantomData<$clock>
+        );
 
-/// Timer with absolute expiration time, pinned to its current CPU.
-pub struct AbsolutePinnedMode;
+        impl<$clock: $crate::time::ClockSource> $crate::time::hrtimer::HrTimerMode for $name<$clock> {
+            const C_MODE: $crate::bindings::hrtimer_mode =
+                $crate::macros::paste! {$crate::bindings::[<hrtimer_mode_ $mode>]};
 
-impl HrTimerMode for AbsolutePinnedMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED;
+            type Clock = $clock;
+            type Expires = $expires;
+        }
+    };
 }
 
-/// Timer with relative expiration time, pinned to its current CPU.
-pub struct RelativePinnedMode;
-
-impl HrTimerMode for RelativePinnedMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED;
+define_hrtimer_mode! {
+    /// Timer that expires at a fixed point in time.
+    pub struct AbsoluteMode<C> {
+        c = HRTIMER_MODE_ABS,
+        expires = Instant<C>
+    }
 }
 
-/// Timer with absolute expiration, handled in soft irq context.
-pub struct AbsoluteSoftMode;
-
-impl HrTimerMode for AbsoluteSoftMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_SOFT;
+define_hrtimer_mode! {
+    /// Timer that expires after a delay from now.
+    pub struct RelativeMode<C> {
+        c = HRTIMER_MODE_REL,
+        expires = Delta
+    }
 }
 
-/// Timer with relative expiration, handled in soft irq context.
-pub struct RelativeSoftMode;
-
-impl HrTimerMode for RelativeSoftMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_SOFT;
+define_hrtimer_mode! {
+    /// Timer with absolute expiration time, pinned to its current CPU.
+    pub struct AbsolutePinnedMode<C> {
+        c = HRTIMER_MODE_ABS_PINNED,
+        expires = Instant<C>
+    }
 }
 
-/// Timer with absolute expiration, pinned to CPU and handled in soft irq context.
-pub struct AbsolutePinnedSoftMode;
-
-impl HrTimerMode for AbsolutePinnedSoftMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED_SOFT;
+define_hrtimer_mode! {
+    /// Timer with relative expiration time, pinned to its current CPU.
+    pub struct RelativePinnedMode<C> {
+        c = HRTIMER_MODE_REL_PINNED,
+        expires = Delta
+    }
 }
 
-/// Timer with relative expiration, pinned to CPU and handled in soft irq context.
-pub struct RelativePinnedSoftMode;
-
-impl HrTimerMode for RelativePinnedSoftMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED_SOFT;
+define_hrtimer_mode! {
+    /// Timer with absolute expiration, handled in soft irq context.
+    pub struct AbsoluteSoftMode<C> {
+        c = HRTIMER_MODE_ABS_SOFT,
+        expires = Instant<C>
+    }
 }
 
-/// Timer with absolute expiration, handled in hard irq context.
-pub struct AbsoluteHardMode;
-
-impl HrTimerMode for AbsoluteHardMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_HARD;
+define_hrtimer_mode! {
+    /// Timer with relative expiration, handled in soft irq context.
+    pub struct RelativeSoftMode<C> {
+        c = HRTIMER_MODE_REL_SOFT,
+        expires = Delta
+    }
 }
 
-/// Timer with relative expiration, handled in hard irq context.
-pub struct RelativeHardMode;
+define_hrtimer_mode! {
+    /// Timer with absolute expiration, pinned to CPU and handled in soft irq context.
+    pub struct AbsolutePinnedSoftMode<C> {
+        c = HRTIMER_MODE_ABS_PINNED_SOFT,
+        expires = Instant<C>
+    }
+}
 
-impl HrTimerMode for RelativeHardMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_HARD;
+define_hrtimer_mode! {
+    /// Timer with absolute expiration, pinned to CPU and handled in soft irq context.
+    pub struct RelativePinnedSoftMode<C> {
+        c = HRTIMER_MODE_REL_PINNED_SOFT,
+        expires = Delta
+    }
 }
 
-/// Timer with absolute expiration, pinned to CPU and handled in hard irq context.
-pub struct AbsolutePinnedHardMode;
+define_hrtimer_mode! {
+    /// Timer with absolute expiration, handled in hard irq context.
+    pub struct AbsoluteHardMode<C> {
+        c = HRTIMER_MODE_ABS_HARD,
+        expires = Instant<C>
+    }
+}
 
-impl HrTimerMode for AbsolutePinnedHardMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED_HARD;
+define_hrtimer_mode! {
+    /// Timer with relative expiration, handled in hard irq context.
+    pub struct RelativeHardMode<C> {
+        c = HRTIMER_MODE_REL_HARD,
+        expires = Delta
+    }
 }
 
-/// Timer with relative expiration, pinned to CPU and handled in hard irq context.
-pub struct RelativePinnedHardMode;
+define_hrtimer_mode! {
+    /// Timer with absolute expiration, pinned to CPU and handled in hard irq context.
+    pub struct AbsolutePinnedHardMode<C> {
+        c = HRTIMER_MODE_ABS_PINNED_HARD,
+        expires = Instant<C>
+    }
+}
 
-impl HrTimerMode for RelativePinnedHardMode {
-    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED_HARD;
+define_hrtimer_mode! {
+    /// Timer with relative expiration, pinned to CPU and handled in hard irq context.
+    pub struct RelativePinnedHardMode<C> {
+        c = HRTIMER_MODE_REL_PINNED_HARD,
+        expires = Delta
+    }
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.
-- 
2.43.0

