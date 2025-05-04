Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399701624E9;
	Sun,  4 May 2025 04:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746332691; cv=none; b=aIMeYHQWyLhuAm0SKe9jQeX7y06S3Skx8Ig/iTFXx99Fz3vCkO3kJe5KZdhba16Uk2GPApHa6cU12qgN5I/xkIf2ijtP/Sm3QNf3l0GRMvT+n9WTxxxbWcRIofJY+bf688eobQ9emFrqvxYA93YnqCVXm75f+Q4F4sAjFlDaUwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746332691; c=relaxed/simple;
	bh=6SiFMa5mM++NGOjLEokCQPQrGCkyUORvFikHbWGnUqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unE3rsXsHHrAGkGm73zPBMDQ4APWruDWzfiZoX1g8WgyK61vvFOLeeymMwjmE/5I2/w/lM+wx7xttt1llA5tBdyT2gewKNoTO+XZaGcGDJOOA1mhq4kO1PCIn8qOP4dIFLFrY7IV+ftLSxmLXdijGj2FrWnQw2xp1y1lobXWDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+fGeUqC; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+fGeUqC"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so2215180a12.0;
        Sat, 03 May 2025 21:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746332688; x=1746937488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LE30wOms6oGnNGtfcrQE9Pg8OoY+5+nNc+vYh1EjOjg=;
        b=X+fGeUqC5DYlD3OBpUYwtz76FIw67v+/B+yx3+Qo7k9nsxU4t1fthd7s3kwXGFPM4F
         SyOrheVOfKzUDxTtyo3c/Y/yfj48vt32hXJuyQ+O7jQnUzDpD+AemBJkjZC0XcoWjNKy
         An4+x/C/hcLEcbCSEmEKJjTbVw8REXW0NM8trg7Wb8zlCYQUoh56Rd/1x+TyMfUn7iM0
         g/OFf8mHkFrq4iZS8CHKZ2Kw+2WN/MBm2SG95RZ5b+z4B0sUp+Jab5a6G/njT8OuYZj8
         EHOxVS4u7QnH4LyuKxagqlZ583Q9MYPk6nSBb+cFTjilNtjLksIdJ/E2oSso/YifHqx9
         yOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746332688; x=1746937488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LE30wOms6oGnNGtfcrQE9Pg8OoY+5+nNc+vYh1EjOjg=;
        b=bUvrsR95UzWWWa9RC1qp1tGu6aS533IvRfDleqZv/eMJdGv31+EKE1ARquTd6THzyk
         hzsEH+svjduDgxOKZHNzslaWgWoEm0mJuhGcyrfSlOVpzUS83n/rt1GxVLNLEmffuTNV
         WhXM5NbvxsF2AhtGfl+j+R64XW7xBiR2mAoCdlHYxz17aa96FKPWnFOaKT9wU9OE0DbI
         AQ1zmYRbrcRaDBC7o6dPPTlNmEvKW7Z29eRqm7xUMWOR9OC8wrll7Dr4F54WqXrA75sl
         gDA4S7zQHTTnrMPPaltgjIpMYqLdIjh4oGIPXr2t5ngQFMHTyQYA5v4olkIaZM5uGZGH
         vCiw==
X-Forwarded-Encrypted: i=1; AJvYcCUG7rNQCvJCCtABe2crj7/4FzY7vtQcJ+PhkCMoj5aBGVIgRkln6vsWAytpbYMUmne6GVOsAOP7046XNbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKL8cInCSl7O+n1x3i19U9OiLRUoCzut/rY8JBLma6QRpj85R
	EpryXqcL8TAbn2foygKDVZSEUKgWWnlQUnWDrlpeTxg+uxoK6qfkoBbiPFp0
X-Gm-Gg: ASbGncvyTGP7c3iBDaEBXjGHoyL6p0kWdQv+ocV01DLEzumKgMMOlkOBXtTXK5+OITb
	0qTQyY5jsFbCuMZ5CqryIfEaTZH6WfgRRYYu/JVegm3h2ccj2qLRDkOyEqBTqEn+/Sgu8C6mtZX
	t2FCfAPtoxZHI/mbHZz5yk6UYBLgI4gMUKltV+dQAkQax1iJKQ6AYd5EEEUZJ10Rq5RgjCRY+oE
	6ikYgs85VzX3TaHp2sst2LlEY/HxmAC2E+mMdrT1s0m5FVJD2hAA4cYuoahPO3ju5LSEpq711Pa
	PYkLqkesLaRwjGRsgpF+xZzbfhvj9TSPbo1fd0fbNaMyLc03Eu28fz6LX4eIdihoz2syXgIcJXn
	HJtGrh/6QwBqYUezKfA==
X-Google-Smtp-Source: AGHT+IGJ9ve5oG93kK5P5S0kJNEmhpuPHr+yhxtbuXqK2qObmN8tkjl8E8rHn9hQ6Hjtp7TaFvrh3A==
X-Received: by 2002:a17:902:ea01:b0:223:42ca:10ef with SMTP id d9443c01a7336-22e18c4f091mr63817225ad.43.1746332688084;
        Sat, 03 May 2025 21:24:48 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fbc8sm31482185ad.142.2025.05.03.21.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 21:24:47 -0700 (PDT)
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
Subject: [PATCH v2 1/3] rust: time: Replace ClockId enum with ClockSource trait
Date: Sun,  4 May 2025 13:24:33 +0900
Message-ID: <20250504042436.237756-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504042436.237756-1-fujita.tomonori@gmail.com>
References: <20250504042436.237756-1-fujita.tomonori@gmail.com>
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
index b0a8f3c0ba49..1d2600288ed1 100644
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
index 17824aa0c0f3..380712d4302a 100644
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

