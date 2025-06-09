Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962081FC3;
	Mon,  9 Jun 2025 01:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749431102; cv=none; b=l4RLPznwuMNsWwbf+poGTZix3ar5auYICuaFaf+hneo57ZTsIYlOr33yYvFTAXNjGnzrBbGctZkJOxTXzNO4bzD9GVS/HOUc0mejr4B1oEpz/socMlabu30WEbXalqu7FjCcVNAuPvAS8xqFB0y1bNgk2DLliWAWU1tiohC2pmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749431102; c=relaxed/simple;
	bh=vknM38HkAvSGmL15yw8cwIpmCNpppkeKXg5yKBleb3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XWTpDbGGwDRyTdOqFa5mh5F6REsURUY5BuQxQUKrCJLyTAsE9t79d+DIxtFdPfchjwnprH/7zN/b/4fFY7BCA+qLdO7nwM8LQLkC+lpjcPk3t8513KLYvwE9bPUBOKsAmuIpyzplDfYoWOc2QHqvstJ4jQashrZg4JQWfMChObM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfKNkwDq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfKNkwDq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so4126519b3a.0;
        Sun, 08 Jun 2025 18:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749431100; x=1750035900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeM2HMSNEan/iTm+VQjJMBjP9/hbVG2J9/6fmdl8YRs=;
        b=nfKNkwDqRnZ6CFVWudPrcISKfCLC4AWWNxxvrD/MQtZKEC1UX4dULqBORmJ5x+r4rp
         1//tW53Zk9s9b1piCPAnALYrC0FuDLJn4/H7JxNwZvoFwMo9e2clXzzzHDVZ0cW+5NqJ
         RJFXmqxxBVWTpp0l2qtQDTAp/SQnKQDcnMlZbDIjz4mys+IHHBr37r8xYxNR/3xxet/z
         31Egp+TdVrtB8nUcFJdKyI8pONDb2Je5+6zhSiPNZyBUY0tfJgz7a9lF+MzLaN0ArbTs
         I9mKkcQkxDOPLcOSFuXDnI+Yyy98s0nKEOPrXx8G4knoeulxXrwbjVZCP+RuH3gxsDPx
         Jafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749431100; x=1750035900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeM2HMSNEan/iTm+VQjJMBjP9/hbVG2J9/6fmdl8YRs=;
        b=L0nRBp06Xo7aHV6OcbisF8nAvHZqhpcijmkTi/onX1EV038tF4/3uwZd8bdq1JOHqk
         NrAft2xugz0VaChtg0q/Pbls855LJKjfi21FkGz+Nsyi62NrkV70hQvy+ufjvIwK8a22
         q96X4Xko7lCPee8jmVqZwqPW35lwtgXTgbKxRACkR96DAvCrtxoxYTet4ITJbgu3Vv1x
         9sBN8FMJ81TgX1GuRNd6rnUF2Nb27Y244T6Dx57OLdVPCIzsrOZvDMNZ/fDJibqTfwWs
         otD6fe4NjKPrqhApRwbqhU+ul6jeySjmtR/QNRRurWAGuRPOssKAK6rgt5HipiAkn9h7
         kJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDOu2Rd0hw2RRau+3dA0LqOk0TRxYWVDXMybOPJCCRjsxNYBjTbdyaKag6EOMeg5GFL+Vqg9cPPSFPmuw=@vger.kernel.org, AJvYcCV0rLCFa4VpZsk+z39I+D5RSS17xwg5QSFjbYo1J9Y7S1MlBbx8hxM843Wy0rC2EiHXShrBcyz3c+SCqEP12Rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWbnQAKEJUzTucBifxZBkvdZJKTOrPg1Ph6mMSwLmL0xwarI1l
	lU1egdx3O0AcBvg9KpigXB9HuWuNXTA+07YC+y0FvIDd5o+acvhosq8Q
X-Gm-Gg: ASbGncvEk07xRm/ZEpbfnhfvKR08Nbrm1kSjAMvDG4ae5JCVQFcAg6nN74GzkhuVyHc
	5ER5zdlzph4ymXhPssXkBPaxx7fC33MhbalBCdR9MD5K9Mmukvd4PLx7gGr7fcaKPulhoIAHFcl
	xtggHYeV3QgBlwsqxEPbvmw2g//VSIHvrW7wpHgJDShmOS9+yiuUa2pvEPJEObxq2oLZb5wJ2f9
	p/Kc4fVXifc4MpAGBzmnf8yk4NvdvBmIoT242a76Md7pEEx8LB7h7GFwHjIHdo7lsuKTlFrn2Kc
	k9NzUXartOnU2NIQICX9/WKs5L2JNvEAM3jjTVdX4g2nmfJJeU5htykaiu+035tQp1UwhxidRHE
	wUHzO413qBxxyPaYNcxmDrxnG3NZ/
X-Google-Smtp-Source: AGHT+IEkzp8+SUWkze4SZouIHqd8EsSd5jHHrhk7VTYRaKGSi4SgHE4FSy6WEmgiXw+0qdvG4d/6Vg==
X-Received: by 2002:a05:6a21:3483:b0:1f0:e6db:b382 with SMTP id adf61e73a8af0-21f48501feemr10847895637.8.1749431099716;
        Sun, 08 Jun 2025 18:04:59 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f6683b1sm3652201a12.50.2025.06.08.18.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 18:04:59 -0700 (PDT)
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
Subject: [PATCH v3 1/3] rust: time: Replace ClockId enum with ClockSource trait
Date: Mon,  9 Jun 2025 10:04:11 +0900
Message-ID: <20250609010415.3302835-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609010415.3302835-1-fujita.tomonori@gmail.com>
References: <20250609010415.3302835-1-fujita.tomonori@gmail.com>
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

