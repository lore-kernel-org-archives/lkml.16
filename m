Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2012980DF;
	Tue, 10 Jun 2025 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562133; cv=none; b=RVx7YrWDKsxUtIW/jaJcCKwicW1kQuku0wIreTUAGgFiQPPdFMb2GlYt40xXhlP0RUq3awlCh45cXuHUTAqKnhxJ95wrjLXaM28MFeKM54B+27y1+fm2xNqC/tIk6vCe+YhddvWxRBPSdkZ6PRuKbXfZO05KLAJn8JvRp/Hff04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562133; c=relaxed/simple;
	bh=NsDN6N5m8MLoqfwZQ1UsrDsIfxcdH6PywnNvCFwq4V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtwmyXxmOs0Wzk9+rMKF0NA4wxg/ISZExJxGIxIf17QrSDEIsSSsr9to01eVDcL+Z92PyF28Zrk1Jbs0dMLA2H7Evltbl2vSgg30B3/6cGcIJL5s8IzXX/HNQJNhOLKX7BO/T4B3sinjXAP3ZjDkUdamz5Awdruhmz0nnI8Ga40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkVJIM4O; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkVJIM4O"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2f62bbb5d6so2753670a12.0;
        Tue, 10 Jun 2025 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562131; x=1750166931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAHrmjESoEljqSEnck1mvwJh+eVSbJGX3azoeF8reFc=;
        b=TkVJIM4Ou7MO7Mi141wHi5IBoR+e8ayIP9KGKmDAOxFE7IYzuSGGATb9QMuCETltwF
         KIeUBkOhyLX2/ezPpIgb43GJ/IdI/bSTt8WjqAoIFfsopAoLDhG0RccoFT7mOQzImzKJ
         mld/J//7oHjyOpE/StYuEwJ+s7q0uWTPBkMihn145WvY+ixbtDz1NFDFKBAYth12dTrK
         Y8MF6o/mENgx6UH0JsvsFaWMEa7QM6xnqgeLCCkLlmapytpqOseai0sD8t7REotMPTgr
         47K16kUf3rdG5UyuSULJ+lGAlFRRhk+ho99SbdO2mBVP/ufUf5miD4WlepekK0ohPVI7
         8LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562131; x=1750166931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAHrmjESoEljqSEnck1mvwJh+eVSbJGX3azoeF8reFc=;
        b=vb2Ok5o1kLQnGbibnm1TVGo6QLWOc1vaq8jIcEfbUOfrYXlr/YMvGB9mrIGjSZ/VW5
         R92eqraWz5qNLieV96X5x/buujhKaCY8+g99L76kkOPraTE8Gix7HJmITMCuOq1lRJ6P
         gY7ZQSRoEzPxpZlx/jEi+vnO0EaLR1KS04ID5D/kXyfwYnmoH+lJImabrEXWCTjvBC7X
         qcYwM3GPZArkuu8g+DohgY1uRD/bOB2ogN6HLRCTys4Ru/jgxMB5aG/uK5/l1OVhJoKR
         qTQqTgpgGOsgGiczIYUHwbnB9p1859iyTs1XJuhpXF8cME7iAO2mgi1IsLCFm0CXwAJY
         uEkA==
X-Forwarded-Encrypted: i=1; AJvYcCUtNs2EGNbIQ0GoKsXZFMM86LGkQUB9QTfIH5NBbEiVMuxPG4HIT2BIDacfkzMEjUmosBWi6asiLqXfInMGLDc=@vger.kernel.org, AJvYcCUzG4107FVux/Yg9ETNdkmpFwAZ7OgqyQVHSFfmjspxi6lflY9ROxPxA2OjzOK596ImVo+jVQIN1zFoOh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLh8WWuNpd57vyXin/AgI3/3D2phqxrB2inImgSBttQVj2OcHF
	S9LvErVacdbJ4XM/c/nOEtwrKLT/NhQnkkVeeR+rlXGVOVquM6rKhNWr
X-Gm-Gg: ASbGncv0V8SIF7+SDiLnzyJksDmbKq2vf9ChFR3r1yviG5MZX+2Z4X8EPX1kDMJdG2H
	DfHnfVWBcgs2wYPCnzLZ31QhFWQXbatfQENnaIwLwgC3ohMuludxhhrZ9JxqbcSox3QqzyYcjN5
	CWeD8O0X8PdiMXtxoQISa9RqlfU5P9Mm7wryT/eH+dV3Cn9+yy6Pcte0VX0rEGPcu8vgre3DR08
	sduAAkuDlrGKzZA0hEoS1UL2WhLvxlZAfZOAFa4QadTKre5UK0qmAK5GFOklnj7SScqO+CPIHfI
	fygXUby7bWW0sD3G8SUNgFwaoBWBhaZukPruelzYLCqA6vROglSYvIGT3pmDRj8GIW2xhHfjw2/
	V9UBenWOsio0Zj5KWEAHBn917o4XqVNANBNU=
X-Google-Smtp-Source: AGHT+IFnzXjSN8oZARyuqmWkK94Q2uxrqTrZ3SFevLP0LIiobO2sgsFCBz1T+Mmwh+vgfl/ETf8Ldg==
X-Received: by 2002:a17:90b:3dd0:b0:311:ea13:2e6e with SMTP id 98e67ed59e1d1-31347678ba4mr26824372a91.28.1749562131034;
        Tue, 10 Jun 2025 06:28:51 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b128050sm7969276a91.25.2025.06.10.06.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:28:50 -0700 (PDT)
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
Subject: [PATCH v3 4/5] rust: time: Make HasHrTimer generic over HrTimerMode
Date: Tue, 10 Jun 2025 22:28:22 +0900
Message-ID: <20250610132823.3457263-5-fujita.tomonori@gmail.com>
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

Add a `TimerMode` associated type to the `HasHrTimer` trait to
represent the operational mode of the timer, such as absolute or
relative expiration. This new type must implement the `HrTimerMode`
trait, which defines how expiration values are interpreted.

Update the `start()` method to accept an `expires` parameter of type
`<Self::TimerMode as HrTimerMode>::Expires` instead of the fixed `Ktime`.
This enables different timer modes to provide strongly typed expiration
values, such as `Instant<C>` or `Delta`.

The `impl_has_hr_timer` macro is also extended to allow specifying the
`HrTimerMode`. In the following example, it guarantees that the
`start()` method for `Foo` only accepts `Instant<Monotonic>`. Using a
`Delta` or an `Instant` with a different clock source will result in a
compile-time error:

struct Foo {
    #[pin]
    timer: HrTimer<Self>,
}

impl_has_hr_timer! {
    impl HasHrTimer<Self> for Foo {
        mode : AbsoluteMode<Monotonic>,
        field : self.timer
    }
}

This design eliminates runtime mismatches between expires types and
clock sources, and enables stronger type-level guarantees throughout
hrtimer.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs         | 55 ++++++++++++++++++++++-------
 rust/kernel/time/hrtimer/arc.rs     |  8 +++--
 rust/kernel/time/hrtimer/pin.rs     |  8 +++--
 rust/kernel/time/hrtimer/pin_mut.rs |  8 +++--
 rust/kernel/time/hrtimer/tbox.rs    |  8 +++--
 5 files changed, 66 insertions(+), 21 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 0ba87f1233cd..4ca153f8fce6 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -98,7 +98,6 @@ pub fn to_ns(self) -> i64 {
 pub struct HrTimer<T> {
     #[pin]
     timer: Opaque<bindings::hrtimer>,
-    mode: bindings::hrtimer_mode,
     _t: PhantomData<T>,
 }
 
@@ -112,9 +111,10 @@ unsafe impl<T> Sync for HrTimer<T> {}
 
 impl<T> HrTimer<T> {
     /// Return an initializer for a new timer instance.
-    pub fn new<U: ClockSource, M: HrTimerMode>() -> impl PinInit<Self>
+    pub fn new() -> impl PinInit<Self>
     where
         T: HrTimerCallback,
+        T: HasHrTimer<T>,
     {
         pin_init!(Self {
             // INVARIANT: We initialize `timer` with `hrtimer_setup` below.
@@ -126,12 +126,11 @@ pub fn new<U: ClockSource, M: HrTimerMode>() -> impl PinInit<Self>
                     bindings::hrtimer_setup(
                         place,
                         Some(T::Pointer::run),
-                        U::ID,
-                        M::C_MODE,
+                        <<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Clock::ID,
+                        <T as HasHrTimer<T>>::TimerMode::C_MODE,
                     );
                 }
             }),
-            mode: M::C_MODE,
             _t: PhantomData,
         })
     }
@@ -193,6 +192,11 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
 /// exist. A timer can be manipulated through any of the handles, and a handle
 /// may represent a cancelled timer.
 pub trait HrTimerPointer: Sync + Sized {
+    /// The operational mode associated with this timer.
+    ///
+    /// This defines how the expiration value is interpreted.
+    type TimerMode: HrTimerMode;
+
     /// A handle representing a started or restarted timer.
     ///
     /// If the timer is running or if the timer callback is executing when the
@@ -205,7 +209,7 @@ pub trait HrTimerPointer: Sync + Sized {
 
     /// Start the timer with expiry after `expires` time units. If the timer was
     /// already running, it is restarted with the new expiry time.
-    fn start(self, expires: Ktime) -> Self::TimerHandle;
+    fn start(self, expires: <Self::TimerMode as HrTimerMode>::Expires) -> Self::TimerHandle;
 }
 
 /// Unsafe version of [`HrTimerPointer`] for situations where leaking the
@@ -220,6 +224,11 @@ pub trait HrTimerPointer: Sync + Sized {
 /// [`UnsafeHrTimerPointer`] outlives any associated [`HrTimerPointer::TimerHandle`]
 /// instances.
 pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
+    /// The operational mode associated with this timer.
+    ///
+    /// This defines how the expiration value is interpreted.
+    type TimerMode: HrTimerMode;
+
     /// A handle representing a running timer.
     ///
     /// # Safety
@@ -236,7 +245,7 @@ pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
     ///
     /// Caller promises keep the timer structure alive until the timer is dead.
     /// Caller can ensure this by not leaking the returned [`Self::TimerHandle`].
-    unsafe fn start(self, expires: Ktime) -> Self::TimerHandle;
+    unsafe fn start(self, expires: <Self::TimerMode as HrTimerMode>::Expires) -> Self::TimerHandle;
 }
 
 /// A trait for stack allocated timers.
@@ -246,9 +255,14 @@ pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
 /// Implementers must ensure that `start_scoped` does not return until the
 /// timer is dead and the timer handler is not running.
 pub unsafe trait ScopedHrTimerPointer {
+    /// The operational mode associated with this timer.
+    ///
+    /// This defines how the expiration value is interpreted.
+    type TimerMode: HrTimerMode;
+
     /// Start the timer to run after `expires` time units and immediately
     /// after call `f`. When `f` returns, the timer is cancelled.
-    fn start_scoped<T, F>(self, expires: Ktime, f: F) -> T
+    fn start_scoped<T, F>(self, expires: <Self::TimerMode as HrTimerMode>::Expires, f: F) -> T
     where
         F: FnOnce() -> T;
 }
@@ -260,7 +274,13 @@ unsafe impl<T> ScopedHrTimerPointer for T
 where
     T: UnsafeHrTimerPointer,
 {
-    fn start_scoped<U, F>(self, expires: Ktime, f: F) -> U
+    type TimerMode = T::TimerMode;
+
+    fn start_scoped<U, F>(
+        self,
+        expires: <<T as UnsafeHrTimerPointer>::TimerMode as HrTimerMode>::Expires,
+        f: F,
+    ) -> U
     where
         F: FnOnce() -> U,
     {
@@ -335,6 +355,11 @@ pub unsafe trait HrTimerHandle {
 /// their documentation. All the methods of this trait must operate on the same
 /// field.
 pub unsafe trait HasHrTimer<T> {
+    /// The operational mode associated with this timer.
+    ///
+    /// This defines how the expiration value is interpreted.
+    type TimerMode: HrTimerMode;
+
     /// Return a pointer to the [`HrTimer`] within `Self`.
     ///
     /// This function is useful to get access to the value without creating
@@ -382,14 +407,14 @@ unsafe fn c_timer_ptr(this: *const Self) -> *const bindings::hrtimer {
     /// - `this` must point to a valid `Self`.
     /// - Caller must ensure that the pointee of `this` lives until the timer
     ///   fires or is canceled.
-    unsafe fn start(this: *const Self, expires: Ktime) {
+    unsafe fn start(this: *const Self, expires: <Self::TimerMode as HrTimerMode>::Expires) {
         // SAFETY: By function safety requirement, `this` is a valid `Self`.
         unsafe {
             bindings::hrtimer_start_range_ns(
                 Self::c_timer_ptr(this).cast_mut(),
-                expires.to_ns(),
+                expires.into_nanos(),
                 0,
-                (*Self::raw_get_timer(this)).mode,
+                <Self::TimerMode as HrTimerMode>::Clock::ID as u32,
             );
         }
     }
@@ -566,12 +591,16 @@ macro_rules! impl_has_hr_timer {
         impl$({$($generics:tt)*})?
             HasHrTimer<$timer_type:ty>
             for $self:ty
-        { self.$field:ident }
+        {
+            mode : $mode:ty,
+            field : self.$field:ident $(,)?
+        }
         $($rest:tt)*
     ) => {
         // SAFETY: This implementation of `raw_get_timer` only compiles if the
         // field has the right type.
         unsafe impl$(<$($generics)*>)? $crate::time::hrtimer::HasHrTimer<$timer_type> for $self {
+            type TimerMode = $mode;
 
             #[inline]
             unsafe fn raw_get_timer(
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
index ccf1e66e5b2d..ed490a7a8950 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -4,8 +4,8 @@
 use super::HrTimer;
 use super::HrTimerCallback;
 use super::HrTimerHandle;
+use super::HrTimerMode;
 use super::HrTimerPointer;
-use super::Ktime;
 use super::RawHrTimerCallback;
 use crate::sync::Arc;
 use crate::sync::ArcBorrow;
@@ -54,9 +54,13 @@ impl<T> HrTimerPointer for Arc<T>
     T: HasHrTimer<T>,
     T: for<'a> HrTimerCallback<Pointer<'a> = Self>,
 {
+    type TimerMode = <T as HasHrTimer<T>>::TimerMode;
     type TimerHandle = ArcHrTimerHandle<T>;
 
-    fn start(self, expires: Ktime) -> ArcHrTimerHandle<T> {
+    fn start(
+        self,
+        expires: <<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Expires,
+    ) -> ArcHrTimerHandle<T> {
         // SAFETY:
         //  - We keep `self` alive by wrapping it in a handle below.
         //  - Since we generate the pointer passed to `start` from a valid
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
index 293ca9cf058c..550aad28d987 100644
--- a/rust/kernel/time/hrtimer/pin.rs
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -4,7 +4,7 @@
 use super::HrTimer;
 use super::HrTimerCallback;
 use super::HrTimerHandle;
-use super::Ktime;
+use super::HrTimerMode;
 use super::RawHrTimerCallback;
 use super::UnsafeHrTimerPointer;
 use core::pin::Pin;
@@ -54,9 +54,13 @@ unsafe impl<'a, T> UnsafeHrTimerPointer for Pin<&'a T>
     T: HasHrTimer<T>,
     T: HrTimerCallback<Pointer<'a> = Self>,
 {
+    type TimerMode = <T as HasHrTimer<T>>::TimerMode;
     type TimerHandle = PinHrTimerHandle<'a, T>;
 
-    unsafe fn start(self, expires: Ktime) -> Self::TimerHandle {
+    unsafe fn start(
+        self,
+        expires: <<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Expires,
+    ) -> Self::TimerHandle {
         // Cast to pointer
         let self_ptr: *const T = self.get_ref();
 
diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtimer/pin_mut.rs
index 6033572d35ad..bacd3d5d972a 100644
--- a/rust/kernel/time/hrtimer/pin_mut.rs
+++ b/rust/kernel/time/hrtimer/pin_mut.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use super::{
-    HasHrTimer, HrTimer, HrTimerCallback, HrTimerHandle, Ktime, RawHrTimerCallback,
+    HasHrTimer, HrTimer, HrTimerCallback, HrTimerHandle, HrTimerMode, RawHrTimerCallback,
     UnsafeHrTimerPointer,
 };
 use core::{marker::PhantomData, pin::Pin, ptr::NonNull};
@@ -52,9 +52,13 @@ unsafe impl<'a, T> UnsafeHrTimerPointer for Pin<&'a mut T>
     T: HasHrTimer<T>,
     T: HrTimerCallback<Pointer<'a> = Self>,
 {
+    type TimerMode = <T as HasHrTimer<T>>::TimerMode;
     type TimerHandle = PinMutHrTimerHandle<'a, T>;
 
-    unsafe fn start(mut self, expires: Ktime) -> Self::TimerHandle {
+    unsafe fn start(
+        mut self,
+        expires: <<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Expires,
+    ) -> Self::TimerHandle {
         // SAFETY:
         // - We promise not to move out of `self`. We only pass `self`
         //   back to the caller as a `Pin<&mut self>`.
diff --git a/rust/kernel/time/hrtimer/tbox.rs b/rust/kernel/time/hrtimer/tbox.rs
index 29526a5da203..ec08303315f2 100644
--- a/rust/kernel/time/hrtimer/tbox.rs
+++ b/rust/kernel/time/hrtimer/tbox.rs
@@ -4,8 +4,8 @@
 use super::HrTimer;
 use super::HrTimerCallback;
 use super::HrTimerHandle;
+use super::HrTimerMode;
 use super::HrTimerPointer;
-use super::Ktime;
 use super::RawHrTimerCallback;
 use crate::prelude::*;
 use core::ptr::NonNull;
@@ -64,9 +64,13 @@ impl<T, A> HrTimerPointer for Pin<Box<T, A>>
     T: for<'a> HrTimerCallback<Pointer<'a> = Pin<Box<T, A>>>,
     A: crate::alloc::Allocator,
 {
+    type TimerMode = <T as HasHrTimer<T>>::TimerMode;
     type TimerHandle = BoxHrTimerHandle<T, A>;
 
-    fn start(self, expires: Ktime) -> Self::TimerHandle {
+    fn start(
+        self,
+        expires: <<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Expires,
+    ) -> Self::TimerHandle {
         // SAFETY:
         //  - We will not move out of this box during timer callback (we pass an
         //    immutable reference to the callback).
-- 
2.43.0

