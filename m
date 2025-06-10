Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCB317A305;
	Tue, 10 Jun 2025 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562129; cv=none; b=qPKgOvrUJWd9bDLSzXs4W7w2kDh1DHjwHGNldIDwDGT6PP1ieGMIKhjfLe+PGh1zynKgyk+91z3e9OjY5Ed1dYxUOwyk8qJeR3fbsAbeK4G2ICQeoNKIcqvY8gpTf0EGZZ+79z6JzUOsAnX33PLAXyQ4agQCk0fPexb9vW4Gk8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562129; c=relaxed/simple;
	bh=2HKkeS+D/53hmI7d01xFjBfZF8ViSPG4/bm7I3oKskA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7y+gtYViauM2tD+nG2Kym6nt3YtjQGCSH7+A8rYiKmOMswiEoOo/2Ef4I0vhrH0iWeuCjEIX7DK8TvKQscgRmZBO/oPMiOIhXVzbQwoxClHqEkEFPEKfGRix2Sml5vv/PZOa+pGl1ufDpjMxCHSraWFIAUrjZ6Vs/u6Wzq2+88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJY8KG5H; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJY8KG5H"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3109f106867so6556852a91.1;
        Tue, 10 Jun 2025 06:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562127; x=1750166927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li/TEVC1pHmYwJ7Qq6x5hEv02gsKC/iDeTYpmuevE7o=;
        b=iJY8KG5HMZghLhicSoVNv/AbAItUfrcYoiG6ePtXA/UkKLV7XjAo8GNcZPUxSIgxY9
         fIxG92LC83keCYRrC5L+cgi/ayQ6kNDFQWmXQG2HaEbFvQlBHV9L4TyuKV1o6VwBqxNr
         HMNQvdgPmqo5/JJEAjmtMkuKbPrbVjPqMKyATuLkyINdHnrJIQ0tbXlPUY10jYoHIfOP
         kvO7O2abvJtr1EKflXLKOU73gq6YL6LBA1ZH74sQ0CoV/mAQhhVrQuYp9W/vg413mfXk
         EB2ZWP80+ZBR6781ZxCiyvsasm122LUUS3mo5KmVRCwuzzYZLt8hF9gvsuAX3ZIF6xG3
         wroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562127; x=1750166927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li/TEVC1pHmYwJ7Qq6x5hEv02gsKC/iDeTYpmuevE7o=;
        b=Vp/7II/L3lm+rjC9Q9i4+Aq73iH9PlTWVZlpwSUSvxN3CzUZ5dfoqY7HbGHfzspzuF
         ElqXXiSORHjQn7xv1fp+e0P0kgsufRYhkDB1HXEupswRHn18sn2+z4G95mDWmbLbuHEo
         41Nz6EEDSwD98IvXMU3ty83t/+djjC9ghfxM5F+2gTdYHEkC8BWmnT3JmHP5gGmAvgLP
         UOpotteCD5/WlaeJGavnMzNLmIyIBCR0AX0jtxEkzgtPOec7IQ4gEUdbulD44EFy2t8S
         Zps7cLTHOjqPGDXFgDA3VGwLFyMKYnZSJy5lMBAK4/q25sgksNgIFTKbOQFKJSXtDMUe
         NKUg==
X-Forwarded-Encrypted: i=1; AJvYcCUA8i375xiUjHLIfIB70uGAufQBEi2Awm305Sve4uHAbWUlibUQYahCIq4Ta6lUdFHDzwgErH+tBXqtzpo=@vger.kernel.org, AJvYcCUE6hH9/Hj57VFhDT3BeISbbZ483H9c9wbtOLicbwZvZlSHQ1W6N1fxJ3j8nsGPsJGWEwdFnsaPtsVr1VjKCzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYEHsKqjTC7gZ5FmgTu5qnTsBucStx41CQX/OkFb/AQBtjfrA7
	3XNZ93Xb5WIoj757g3+u1pZpLOpWDSJ3kSEj+Y9R+Q17o1QHagkm7WKJ
X-Gm-Gg: ASbGncu2WwjmLgWoi62ECXHRqzhNOA9w6oTlxEG5uEEkrdiQjDNweZekKp1eNC7U/np
	J5oOcO/OqWlh4UYoi2Enp1zqiZplnqxsRXe6vbsWK2V+/z8spW7/ElBrZ3jt68RSD6syzLV4pVs
	5EX8V9zNjoL0+Z+28ixtbH9qqwZk9Uw501gMaYsWC6H9J4I9ANHufxZkmRdG+L580luuO4DlBGw
	ExJI+RpoWLo/qo5nukBs05yIzKfSvku7CsH9dbo50NXFfuKvkohGD8TecfPZrE5FPuPLC4WVPLz
	wTl6OcJWh2TTAVaIww/8wG+9SDnesl4LfgYOL7sqQiL8WPBdfD/AyJTTSshN7oHHe9VFiSfn6tA
	lHuNJR00hk9Mo6qmc5Jq7mrhtvQUwKKSenWw=
X-Google-Smtp-Source: AGHT+IFclABCfX/IC3J/vArRt3KWJm5NyGdrbWqQlZNl1/xizi1DEqwHkxrPFPW2RF8ZN0wSsLIZpg==
X-Received: by 2002:a17:90b:1b09:b0:311:ff18:b83e with SMTP id 98e67ed59e1d1-313a1542b4dmr3834471a91.9.1749562126839;
        Tue, 10 Jun 2025 06:28:46 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b128050sm7969276a91.25.2025.06.10.06.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:28:46 -0700 (PDT)
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
Subject: [PATCH v3 3/5] rust: time: Add HrTimerExpires trait
Date: Tue, 10 Jun 2025 22:28:21 +0900
Message-ID: <20250610132823.3457263-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
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

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
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

