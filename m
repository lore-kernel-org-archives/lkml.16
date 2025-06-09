Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEF92550C2;
	Mon,  9 Jun 2025 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464712; cv=none; b=L0Ms6mbl7WhnSSNCMn3ZE+ppRcWYRMpWVwlw3kO4QGUOlGxLw4sNWq4Pi9YbLK+5K1L5KCaFG470dWNlnzatRgrZ1Qmgl+M/z6MNBwWxKeGZ868THN3b7Pw14jx8bWc/mVFD16I2d2nYxsJIBYUKkhCquXOh5VQIKki2YwuFiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464712; c=relaxed/simple;
	bh=j4b32gST+Sd5FQne1N4+ughZne5o+yeHqtqhCdukX3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYLzPfJN/H9WM2aEEAgU938OiERiVy9L4BYyWEtO4CFObqKBH27BX8yc9IWHYPQfcNcvLZLXE/osAOfPg9d0n4HsU9Mlu24VZYr9WY/xoOoUEhvYYdBXBcC7x9ZvJmjDeckS/m/PjbpikX/nLNFjwofvOgW8WtL+bstHSU5oXjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7oRhIOR; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7oRhIOR"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3065294b3a.1;
        Mon, 09 Jun 2025 03:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749464710; x=1750069510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBIPwWaMFY+8D9dIpGFTBmW8iI9L0XYOiW5NiRN+S3E=;
        b=h7oRhIORwosu+CYkzHFM8LgKPD4HPykGMatcJetQS+n7Db7bCi1RLz0pMnInFZ9BNY
         x2ynTaVyN33sxyqo8V5TDKYkxx/iWimjhDWc0uzfwoH/uxYdKD7EDuQrM5T9ocyw/92h
         0BdXN7RrmNGmTSA+F9JVpboCSinQUm6J97D0ZM3zD9QzJPn+UhUEC0QeVUJucyYd0KdE
         hAI0chSqeE1PTR5sCKHv9qYTjcNxSAcJg1D4b50v0+v3GkPXj0JOG35ovP/obZ+XgwEn
         hMDLWLfGMssTcvcBvFWVsHtf2C/aeAJfYmFxjyysM+00rrBgtE71BRgPkmIzGw/1VyWw
         jjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464710; x=1750069510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBIPwWaMFY+8D9dIpGFTBmW8iI9L0XYOiW5NiRN+S3E=;
        b=nY8/iK6wTk3IJpSaZzIhzXwogD74jDvJRAxnEM3xzr9Iij0PYFzQmNDIyWWv9jyngn
         bt5bo13uO8wF0p7kEu1nv0gshH6z35aqxViP/0iXVZ7xqIlbfMHRhbdw2iAeZkSjU8SO
         xFgT7r3/jlLQTA7A5WDMTXg9dOBiwnNTNU9J9yvQF3brw9fUq1d4W3wtXL9uiheqheHU
         5ugo8/jXbPObgQ6JrlH7Q4X6Nel9NeswjK1hXQoFQ9stUf36Zgfrw20n2XnB6wH6bCQH
         ibAmceTVrlZpEk9MjHI29EU7o30mA+RtyN5prKo+q8elT1MvrBfOCSDfSY/glrOS78n7
         NQZw==
X-Forwarded-Encrypted: i=1; AJvYcCUP+xuashkGHTxHp/Qs1EGglH2BZ4m9ALUnfihWTfUStUvUE708pCAfEZY+wOrcXd/gJx5docge34u7ZwM=@vger.kernel.org, AJvYcCWptm4sGFUaWGBH6uaDeOfq7seHSa0czMHgrmG61LMjzfSB35//mGFwkbqBITD5+Lz5bVAz3UZXjZqQsypMTBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpyAjEYAJX1mKQ90PIJEJb2UsFXrz2AFF4JHxERt6rI3lBREPv
	TflfwIpFAJXcLLYY69hwBCS2GO91j8fLhBP+QAt3mKt6keUwvA2kMKMd
X-Gm-Gg: ASbGncskaQnZ95SlZSgGGUmrgr04g+72/OKi14CB632tWLxt00KCQf2rbdlygiO5o5l
	9ODhfVb1sDXh+llXxkavrSagUwAddm9rx0NYI8PQ+w1oMIEgZpJJeGv/ux+bH5OC+CWrVEEHmO1
	HLSdZgX5WC7QU/5Go9QTf3n1WuyVch2I3TSN+5EE3rn2bW5fmMs461VUS6G3p18Odyqy4epT9O+
	TfmzLHNca/1/kD0NgdTzuqcExAeiV6YDM/5whG0uowR7mcG0JijZ/FPTeqCXuEGHDA28PIgZp16
	QPRlmSDm/H85zLvuCWEfx6UMnD5GlLeccFDiy0H2Ig+uGRLV6vRMPoM1ApeIN83GHWQfWa10Qzr
	m95siGWn7GD3ciBGwDV390CImLg8AJ/subV/rDLA=
X-Google-Smtp-Source: AGHT+IFDOyT043z3mzfuZ3wv5BFkxGEOKJB2DvW6YsxHDp+LgwwWI+XCVeoDgceewViKwjEcZlt7fg==
X-Received: by 2002:a05:6a00:c93:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-74829381a76mr15321642b3a.11.1749464710422;
        Mon, 09 Jun 2025 03:25:10 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c082csm5403262b3a.121.2025.06.09.03.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:25:10 -0700 (PDT)
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
Subject: [PATCH v2 3/5] rust: time: Add HrTimerExpires trait
Date: Mon,  9 Jun 2025 19:24:16 +0900
Message-ID: <20250609102418.3345792-4-fujita.tomonori@gmail.com>
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

Introduce the `HrTimerExpires` trait to represent types that can be
used as expiration values for high-resolution timers. Define a
required method, `into_nanos()`, which returns the expiration time as a
raw nanosecond value suitable for use with C's hrtimer APIs.

Also extend the `HrTimerMode` to use the `HrTimerExpires` trait.

This refactoring is a preparation for enabling hrtimer code to work
uniformly with both absolute and relative expiration modes.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs         |   5 ++
 rust/kernel/time/hrtimer.rs | 126 +++++++++++++++++++++++++-----------
 2 files changed, 95 insertions(+), 36 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 2a231c321afa..70bd3be0facc 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -194,6 +194,11 @@ pub fn now() -> Self {
     pub fn elapsed(&self) -> Delta {
         Self::now() - *self
     }
+
+    #[inline]
+    pub(crate) fn into_nanos(self) -> i64 {
+        self.inner
+    }
 }
 
 impl<C: ClockSource> core::ops::Sub for Instant<C> {
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 23f9f1ba8607..0ba87f1233cd 100644
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
@@ -411,94 +411,148 @@ fn into_c(self) -> bindings::hrtimer_restart {
     }
 }
 
+/// Time representations that can be used as expiration values in [`HrTimer`].
+pub trait HrTimerExpires {
+    /// Converts the expiration time into a nanosecond representation.
+    ///
+    /// This value corresponds to a raw ktime_t value, suitable for passing to kernel
+    /// timer functions. The interpretation (absolute vs relative) depends on the
+    /// associated [HrTimerMode] in use.
+    fn into_nanos(self) -> i64;
+}
+
+impl<C: ClockSource> HrTimerExpires for Instant<C> {
+    fn into_nanos(self) -> i64 {
+        Instant::<C>::into_nanos(self)
+    }
+}
+
+impl HrTimerExpires for Delta {
+    fn into_nanos(self) -> i64 {
+        Delta::into_nanos(self)
+    }
+}
+
 /// Operational mode of [`HrTimer`].
 pub trait HrTimerMode {
     /// The C representation of hrtimer mode.
     const C_MODE: bindings::hrtimer_mode;
+
+    /// Type representing the clock source.
+    type Clock: ClockSource;
+
+    /// Type representing the expiration specification (absolute or relative time).
+    type Expires: HrTimerExpires;
 }
 
 /// Timer that expires at a fixed point in time.
-pub struct AbsoluteMode;
+pub struct AbsoluteMode<C: ClockSource>(PhantomData<C>);
 
-impl HrTimerMode for AbsoluteMode {
+impl<C: ClockSource> HrTimerMode for AbsoluteMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS;
+
+    type Clock = C;
+    type Expires = Instant<C>;
 }
 
 /// Timer that expires after a delay from now.
-pub struct RelativeMode;
+pub struct RelativeMode<C: ClockSource>(PhantomData<C>);
 
-impl HrTimerMode for RelativeMode {
+impl<C: ClockSource> HrTimerMode for RelativeMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL;
+
+    type Clock = C;
+    type Expires = Delta;
 }
 
 /// Timer with absolute expiration time, pinned to its current CPU.
-pub struct AbsolutePinnedMode;
-
-impl HrTimerMode for AbsolutePinnedMode {
+pub struct AbsolutePinnedMode<C: ClockSource>(PhantomData<C>);
+impl<C: ClockSource> HrTimerMode for AbsolutePinnedMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED;
+
+    type Clock = C;
+    type Expires = Instant<C>;
 }
 
 /// Timer with relative expiration time, pinned to its current CPU.
-pub struct RelativePinnedMode;
-
-impl HrTimerMode for RelativePinnedMode {
+pub struct RelativePinnedMode<C: ClockSource>(PhantomData<C>);
+impl<C: ClockSource> HrTimerMode for RelativePinnedMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED;
+
+    type Clock = C;
+    type Expires = Delta;
 }
 
 /// Timer with absolute expiration, handled in soft irq context.
-pub struct AbsoluteSoftMode;
-
-impl HrTimerMode for AbsoluteSoftMode {
+pub struct AbsoluteSoftMode<C: ClockSource>(PhantomData<C>);
+impl<C: ClockSource> HrTimerMode for AbsoluteSoftMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_SOFT;
+
+    type Clock = C;
+    type Expires = Instant<C>;
 }
 
 /// Timer with relative expiration, handled in soft irq context.
-pub struct RelativeSoftMode;
-
-impl HrTimerMode for RelativeSoftMode {
+pub struct RelativeSoftMode<C: ClockSource>(PhantomData<C>);
+impl<C: ClockSource> HrTimerMode for RelativeSoftMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_SOFT;
+
+    type Clock = C;
+    type Expires = Delta;
 }
 
 /// Timer with absolute expiration, pinned to CPU and handled in soft irq context.
-pub struct AbsolutePinnedSoftMode;
-
-impl HrTimerMode for AbsolutePinnedSoftMode {
+pub struct AbsolutePinnedSoftMode<C: ClockSource>(PhantomData<C>);
+impl<C: ClockSource> HrTimerMode for AbsolutePinnedSoftMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED_SOFT;
-}
 
-/// Timer with relative expiration, pinned to CPU and handled in soft irq context.
-pub struct RelativePinnedSoftMode;
+    type Clock = C;
+    type Expires = Instant<C>;
+}
 
-impl HrTimerMode for RelativePinnedSoftMode {
+/// Timer with absolute expiration, pinned to CPU and handled in soft irq context.
+pub struct RelativePinnedSoftMode<C: ClockSource>(PhantomData<C>);
+impl<C: ClockSource> HrTimerMode for RelativePinnedSoftMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED_SOFT;
+
+    type Clock = C;
+    type Expires = Delta;
 }
 
 /// Timer with absolute expiration, handled in hard irq context.
-pub struct AbsoluteHardMode;
-
-impl HrTimerMode for AbsoluteHardMode {
+pub struct AbsoluteHardMode<C: ClockSource>(PhantomData<C>);
+impl<C: ClockSource> HrTimerMode for AbsoluteHardMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_HARD;
+
+    type Clock = C;
+    type Expires = Instant<C>;
 }
 
 /// Timer with relative expiration, handled in hard irq context.
-pub struct RelativeHardMode;
-
-impl HrTimerMode for RelativeHardMode {
+pub struct RelativeHardMode<C: ClockSource>(PhantomData<C>);
+impl<C: ClockSource> HrTimerMode for RelativeHardMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_HARD;
+
+    type Clock = C;
+    type Expires = Delta;
 }
 
 /// Timer with absolute expiration, pinned to CPU and handled in hard irq context.
-pub struct AbsolutePinnedHardMode;
-
-impl HrTimerMode for AbsolutePinnedHardMode {
+pub struct AbsolutePinnedHardMode<C: ClockSource>(PhantomData<C>);
+impl<C: ClockSource> HrTimerMode for AbsolutePinnedHardMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED_HARD;
+
+    type Clock = C;
+    type Expires = Instant<C>;
 }
 
 /// Timer with relative expiration, pinned to CPU and handled in hard irq context.
-pub struct RelativePinnedHardMode;
-
-impl HrTimerMode for RelativePinnedHardMode {
+pub struct RelativePinnedHardMode<C: ClockSource>(PhantomData<C>);
+impl<C: ClockSource> HrTimerMode for RelativePinnedHardMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED_HARD;
+
+    type Clock = C;
+    type Expires = Delta;
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.
-- 
2.43.0

