Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672BF288CB9;
	Tue, 10 Jun 2025 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548009; cv=none; b=pM/lndSEEtd3GEDHqolPl9x8micK1rhLWpJTb8tF5EStNCMPFn1miz9VBoUYzT/4qs+GsiyyeRbFc+/vib9FN6OcYw7nF1Yh5m82G4y3R+nI/Iu8LlzoqfZHWIYIh9OcaQUwsTrcBTSX4/bTeuigWaW3fJSTglb6PNHG4BXGFxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548009; c=relaxed/simple;
	bh=Bj9Sic5pV4QziwisslgX3CILsOrHnV/2KM9dO4tBN1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CsN3zC8ODZL/ofTr94W7t0wVVS8uqlooOZ5PEig7QH5bQsVBkGpbNVrteURCxtpIQ4zHAH9URdYYHaU1bk0Y/VBqdfddWU3SfkxBK2iGg+RLOAXA2urEl2XHp4WB2tzKL6LKAKigwFpi/qWcISVUJpsiatiTLx3+mj4irx+p3NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezzkQz69; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezzkQz69"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747fc77ba9eso3817413b3a.0;
        Tue, 10 Jun 2025 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548006; x=1750152806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+adE9eGbJy3NX1RAQES9UdpfUgSvvwR4hpIPwunfIWY=;
        b=ezzkQz69jSLjLn9fMBbGL3v9IYrQZb6AFUF8FbiA+ATq+P2gdqC6E0KbzZAoK94eR2
         gu+PSptv7I+Y8DuXBo22zHAWKV9u7QrxBwfmNL5GYJ/2DDsddYiLIPFym4rhtlnYw4+O
         y9yPoJePPcTPM4eZwol+1RmUpIqtZtRSJwf8hgMMjxk7QP+dWEfQNyR5u7pltq2rOBun
         pvMhji/CQr0AeTF6KQRcmo9+CjKuZ/4qoQlO88dyy5gJBElJ3P6NoBGvXJHGT88FbEef
         lieq1L5wgK6Nn0yVFvw7lJrcoLNlJdFskBZvUtxvcE4ugmcmwJAKV4GDl+3FCzhBwfo+
         jOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548006; x=1750152806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+adE9eGbJy3NX1RAQES9UdpfUgSvvwR4hpIPwunfIWY=;
        b=VFoK1YoU9Jiz0C0q9Z5IxPbj+d+1LzvsYriH7mKUbGynyxEsFj8QIIErgXogeQ6/Eh
         oamla1H3u/bIzaTt9mCJG++yCpLrxsDM7F4/1PcBiUPh4OiiHthESJQrJwoY/rN0TT+E
         4XJY2uAK4H3hZX2ZUhMjaEnO82U2QTihNraeS4/7/BXkPYycIGd6ytR/n8iECve1nmv4
         LhEfViPvA/jPnGyaXEJ9DGfpaDl2gG7pQ1JPOwKz8BCvLEBQDcTtFDT0iCF6YulEwPP9
         l3jbqkUcWbkEt3MYPg6APv8zV2E4ahDTUW3y/3urAvTHYbPvm58ky+iHwT0I26kA03Yz
         omUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk26PYcP6Tc5EkGN6xVgiEZxKBwwcZJIa0F9u6yG5WgmI+8lnBSmdxiszBuQ2U3rRrmhUs28KKGdUaYY0=@vger.kernel.org, AJvYcCXDs6RIn6hBvwX5wOoxyoi+SBPGRKEJYrlRDtcHdkj4nZYvypCXEwndkfbbyERxUDCraaE4B9BDSHil7032rCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQmYsha1gDv36Z2TyLIo5Y9PDwT36pNg3t36IMd4Hh9OUK1v5k
	8qKDPusWAnp3ydrAPd6pj73Ph7zrbcat3FA10UuJiPTMHmfALxfjBDwj
X-Gm-Gg: ASbGncuAXE6gr9yMo8gHHXgyAEf3TItYkqtbdgFve2wFAnrZClX/iHABnOJW8WMn9GB
	Tu2RMBGq1CrBY+cQXV0nm0e9KgrRNwHZmJtAHNR1jpME8PN/SJmNBpS98KOJew1nAbccE8qVNiH
	yK7efTheHp9YpzmxOmSzxi3S4F8V/+FVsIAru3QybxZoxF5zrocg3ZEZ28/df6RQVPl+SUBHSc2
	JigeSDNw712p6E7BilpG+4A/kO9pC8FXQwNewFSidyIzFoIFBjshPR1+DLplHYhvyoE/0RB3p7W
	oqi7L3LcU/rTrPD3lg3u0NgJo7U2NQoijrGkDrAUNTamrYbYDVhqCRyoN6nS66i2tryC8jH+ytX
	BaTkWTwrlpb277Yqu96Ey/ktv47gJV2nS4ZhoaVm9JVFJ4g==
X-Google-Smtp-Source: AGHT+IHG1xXP/ghbsduH5QnBJdiahgPcl7xssC8e17lcI1PdW+JMValcLHVRjZr8SrLUt+WHHm87yQ==
X-Received: by 2002:a05:6a00:138c:b0:736:33fd:f57d with SMTP id d2e1a72fcca58-74827f12fbdmr20286435b3a.17.1749548006432;
        Tue, 10 Jun 2025 02:33:26 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0847e9sm7037684b3a.87.2025.06.10.02.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:33:26 -0700 (PDT)
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
Subject: [PATCH v4 1/3] rust: time: Replace ClockId enum with ClockSource trait
Date: Tue, 10 Jun 2025 18:32:54 +0900
Message-ID: <20250610093258.3435874-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610093258.3435874-1-fujita.tomonori@gmail.com>
References: <20250610093258.3435874-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the ClockId enum with a trait-based abstraction called
ClockSource. This change enables expressing clock sources as types and
leveraging the Rust type system to enforce clock correctness at
compile time.

This also sets the stage for future generic abstractions over Instant
types such as Instant<C>.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs         | 147 ++++++++++++++++++++----------------
 rust/kernel/time/hrtimer.rs |   6 +-
 2 files changed, 84 insertions(+), 69 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index a8089a98da9e..efe68462b899 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -49,6 +49,87 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
     unsafe { bindings::__msecs_to_jiffies(msecs) }
 }
 
+/// Trait for clock sources.
+///
+/// Selection of the clock source depends on the use case. In some cases the usage of a
+/// particular clock is mandatory, e.g. in network protocols, filesystems. In other
+/// cases the user of the clock has to decide which clock is best suited for the
+/// purpose. In most scenarios clock [`Monotonic`] is the best choice as it
+/// provides a accurate monotonic notion of time (leap second smearing ignored).
+pub trait ClockSource {
+    /// The kernel clock ID associated with this clock source.
+    ///
+    /// This constant corresponds to the C side `clockid_t` value.
+    const ID: bindings::clockid_t;
+}
+
+/// A monotonically increasing clock.
+///
+/// A nonsettable system-wide clock that represents monotonic time since as
+/// described by POSIX, "some unspecified point in the past". On Linux, that
+/// point corresponds to the number of seconds that the system has been
+/// running since it was booted.
+///
+/// The CLOCK_MONOTONIC clock is not affected by discontinuous jumps in the
+/// CLOCK_REAL (e.g., if the system administrator manually changes the
+/// clock), but is affected by frequency adjustments. This clock does not
+/// count time that the system is suspended.
+pub struct Monotonic;
+
+impl ClockSource for Monotonic {
+    const ID: bindings::clockid_t = bindings::CLOCK_MONOTONIC as bindings::clockid_t;
+}
+
+/// A settable system-wide clock that measures real (i.e., wall-clock) time.
+///
+/// Setting this clock requires appropriate privileges. This clock is
+/// affected by discontinuous jumps in the system time (e.g., if the system
+/// administrator manually changes the clock), and by frequency adjustments
+/// performed by NTP and similar applications via adjtime(3), adjtimex(2),
+/// clock_adjtime(2), and ntp_adjtime(3). This clock normally counts the
+/// number of seconds since 1970-01-01 00:00:00 Coordinated Universal Time
+/// (UTC) except that it ignores leap seconds; near a leap second it may be
+/// adjusted by leap second smearing to stay roughly in sync with UTC. Leap
+/// second smearing applies frequency adjustments to the clock to speed up
+/// or slow down the clock to account for the leap second without
+/// discontinuities in the clock. If leap second smearing is not applied,
+/// the clock will experience discontinuity around leap second adjustment.
+pub struct RealTime;
+
+impl ClockSource for RealTime {
+    const ID: bindings::clockid_t = bindings::CLOCK_REALTIME as bindings::clockid_t;
+}
+
+/// A monotonic that ticks while system is suspended.
+///
+/// A nonsettable system-wide clock that is identical to CLOCK_MONOTONIC,
+/// except that it also includes any time that the system is suspended. This
+/// allows applications to get a suspend-aware monotonic clock without
+/// having to deal with the complications of CLOCK_REALTIME, which may have
+/// discontinuities if the time is changed using settimeofday(2) or similar.
+pub struct BootTime;
+
+impl ClockSource for BootTime {
+    const ID: bindings::clockid_t = bindings::CLOCK_BOOTTIME as bindings::clockid_t;
+}
+
+/// International Atomic Time.
+///
+/// A system-wide clock derived from wall-clock time but counting leap seconds.
+///
+/// This clock is coupled to CLOCK_REALTIME and will be set when CLOCK_REALTIME is
+/// set, or when the offset to CLOCK_REALTIME is changed via adjtimex(2). This
+/// usually happens during boot and **should** not happen during normal operations.
+/// However, if NTP or another application adjusts CLOCK_REALTIME by leap second
+/// smearing, this clock will not be precise during leap second smearing.
+///
+/// The acronym TAI refers to International Atomic Time.
+pub struct Tai;
+
+impl ClockSource for Tai {
+    const ID: bindings::clockid_t = bindings::CLOCK_TAI as bindings::clockid_t;
+}
+
 /// A specific point in time.
 ///
 /// # Invariants
@@ -91,72 +172,6 @@ fn sub(self, other: Instant) -> Delta {
     }
 }
 
-/// An identifier for a clock. Used when specifying clock sources.
-///
-///
-/// Selection of the clock depends on the use case. In some cases the usage of a
-/// particular clock is mandatory, e.g. in network protocols, filesystems.In other
-/// cases the user of the clock has to decide which clock is best suited for the
-/// purpose. In most scenarios clock [`ClockId::Monotonic`] is the best choice as it
-/// provides a accurate monotonic notion of time (leap second smearing ignored).
-#[derive(Clone, Copy, PartialEq, Eq, Debug)]
-#[repr(u32)]
-pub enum ClockId {
-    /// A settable system-wide clock that measures real (i.e., wall-clock) time.
-    ///
-    /// Setting this clock requires appropriate privileges. This clock is
-    /// affected by discontinuous jumps in the system time (e.g., if the system
-    /// administrator manually changes the clock), and by frequency adjustments
-    /// performed by NTP and similar applications via adjtime(3), adjtimex(2),
-    /// clock_adjtime(2), and ntp_adjtime(3). This clock normally counts the
-    /// number of seconds since 1970-01-01 00:00:00 Coordinated Universal Time
-    /// (UTC) except that it ignores leap seconds; near a leap second it may be
-    /// adjusted by leap second smearing to stay roughly in sync with UTC. Leap
-    /// second smearing applies frequency adjustments to the clock to speed up
-    /// or slow down the clock to account for the leap second without
-    /// discontinuities in the clock. If leap second smearing is not applied,
-    /// the clock will experience discontinuity around leap second adjustment.
-    RealTime = bindings::CLOCK_REALTIME,
-    /// A monotonically increasing clock.
-    ///
-    /// A nonsettable system-wide clock that represents monotonic time since—as
-    /// described by POSIX—"some unspecified point in the past". On Linux, that
-    /// point corresponds to the number of seconds that the system has been
-    /// running since it was booted.
-    ///
-    /// The CLOCK_MONOTONIC clock is not affected by discontinuous jumps in the
-    /// CLOCK_REAL (e.g., if the system administrator manually changes the
-    /// clock), but is affected by frequency adjustments. This clock does not
-    /// count time that the system is suspended.
-    Monotonic = bindings::CLOCK_MONOTONIC,
-    /// A monotonic that ticks while system is suspended.
-    ///
-    /// A nonsettable system-wide clock that is identical to CLOCK_MONOTONIC,
-    /// except that it also includes any time that the system is suspended. This
-    /// allows applications to get a suspend-aware monotonic clock without
-    /// having to deal with the complications of CLOCK_REALTIME, which may have
-    /// discontinuities if the time is changed using settimeofday(2) or similar.
-    BootTime = bindings::CLOCK_BOOTTIME,
-    /// International Atomic Time.
-    ///
-    /// A system-wide clock derived from wall-clock time but counting leap seconds.
-    ///
-    /// This clock is coupled to CLOCK_REALTIME and will be set when CLOCK_REALTIME is
-    /// set, or when the offset to CLOCK_REALTIME is changed via adjtimex(2). This
-    /// usually happens during boot and **should** not happen during normal operations.
-    /// However, if NTP or another application adjusts CLOCK_REALTIME by leap second
-    /// smearing, this clock will not be precise during leap second smearing.
-    ///
-    /// The acronym TAI refers to International Atomic Time.
-    TAI = bindings::CLOCK_TAI,
-}
-
-impl ClockId {
-    fn into_c(self) -> bindings::clockid_t {
-        self as bindings::clockid_t
-    }
-}
-
 /// A span of time.
 ///
 /// This struct represents a span of time, with its value stored as nanoseconds.
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 9df3dcd2fa39..280128d7e982 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -67,7 +67,7 @@
 //! A `restart` operation on a timer in the **stopped** state is equivalent to a
 //! `start` operation.
 
-use super::ClockId;
+use super::ClockSource;
 use crate::{prelude::*, types::Opaque};
 use core::marker::PhantomData;
 use pin_init::PinInit;
@@ -112,7 +112,7 @@ unsafe impl<T> Sync for HrTimer<T> {}
 
 impl<T> HrTimer<T> {
     /// Return an initializer for a new timer instance.
-    pub fn new(mode: HrTimerMode, clock: ClockId) -> impl PinInit<Self>
+    pub fn new<U: ClockSource>(mode: HrTimerMode) -> impl PinInit<Self>
     where
         T: HrTimerCallback,
     {
@@ -126,7 +126,7 @@ pub fn new(mode: HrTimerMode, clock: ClockId) -> impl PinInit<Self>
                     bindings::hrtimer_setup(
                         place,
                         Some(T::Pointer::run),
-                        clock.into_c(),
+                        U::ID,
                         mode.into_c(),
                     );
                 }
-- 
2.43.0

