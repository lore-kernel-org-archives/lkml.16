Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35276255E20;
	Mon,  9 Jun 2025 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464717; cv=none; b=a5CDp5P38XcmjopSlGQJ1OHIBNrZ31/jftt1svxSJyMb+XYjUC+gs23PrvWQPXk6WkKxfIJ4j7g2Ob9c40rOLjBnOgTxdbz3D9wSTGcQJitXhpds0h+zjc3ebk+0NWupmP4hkldWfiTb6w5lJnC3GIyszqfzAiY+7a0rYsh4i2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464717; c=relaxed/simple;
	bh=ikQfQUEJD7NfFftkwbT1gGhSeYVXxXtCHIzIva6mAhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DetsWOa1COb++l26EF36id7GAdpCSRsoBbsdpiktulWAUW8MtOe7ObyK1XOQvBxvwwuqLzHFhnYOo9fiKuelkUjEyXseD1PO2+O2MD758J63C6sqsRHOukUgT5u79xiKAa+QtJLSp+h/WKJA5d+iKbQuFZ++vsSt/xM5+cIp6DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEKQLmu6; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEKQLmu6"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso4797469b3a.2;
        Mon, 09 Jun 2025 03:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749464714; x=1750069514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+664eAK1bFjv8cCz2aiE7lib6RoXZjewlOrbAQW03Q=;
        b=gEKQLmu62GzHSbNCmNqNIkH0ZJkAmyTdLc0Wucg6rYl5b5d6W++yu+vceAv7AfRik4
         Iw/aY/Vme9tRuCIXvSay6ullAnosda0HpKglUEefI0oYpW/rPNYKAsyyFXOh7hADkXKj
         cFHKqMEj/FqyKAr6ZqxeycEY5dMKhcp4DGe7sJmRIV/dVsjWJVzCKwC9qRRxEo8qAcjL
         895CtmO9Tw3SI/L5r7dU1oTcC8K7gv8FWL/2F4gdEG9H1Ry1z1+P5G4q+75GJEKxc4Am
         DPwbVRlJzHanXD/cBZee2gHNGX2uz5QNn2SfVa08iSbpeZS+Lh0DNJa6i3a6BHJTWIJn
         FOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464714; x=1750069514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+664eAK1bFjv8cCz2aiE7lib6RoXZjewlOrbAQW03Q=;
        b=l7CGHnx061z/mr7/g3lW1wq85Oonpjn6O1S69QULrDOkHCrenMk530KHfePQJBTy9s
         fgjeb/pKfdJ95fG9FNroGKOI8ABe7f6zKyr/3zxr64MZIP0ShCFW6auyoFV3lLvJu+cT
         WUWuGWpTz7S8v23vFsF/6Rrr+Qmp7kTyJSi7r2SfAWTwneD2aE/uVYRlPWH+C11LpaEV
         IAcZG5GhBYmdlsCDWqLywMPiLKQebYiygE3ZhTI9/rfJ5fybQJPXZmiyt63XYXbJEtUf
         kMrH49MPoqu49rPsAjW1U2+9GRt27ftLgwGcCW1bamaYLLv8nF67IUibo7Y+262gInVk
         CRzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2PRA3Z7pvHUQ2PMI0oEH+Ap0KPheH/v4zM+ncWJtThNkOBI8MrpC2Ame76H0k7hqdBbS9vxt9QyyfWsz1BnI=@vger.kernel.org, AJvYcCXSHNSeJV62r6Gc6fS5s4/M5cEPbn1w60g3n4JyJZDuVzEYw2nldd5yJPXIzfdCcDroaYe3x7KcNiHi4sI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzHVq4xFYEbWpSaOHNIyc6ZKLJcSW9fcEKFQnldbxDBuOkoz/+
	E+ZUOeYtN2FOS1OgY0Ev1++qtAcpuPclYiXDchK9AIl5AMTiJWzQG/+MD+3ulkJt
X-Gm-Gg: ASbGncszyKAr7yK3j8SPMrPyK3we7U0TYiwTldnCREtXl8F7ogAqaLDyid0F4DQmbvH
	aerHp7Q96Rs0CICFEHpNx0n7OAgr9qlfkpeQdS8uzKLaeU18Fhv4Od33AlML7mhS7qDToAR1j6D
	BZeG/Qkx+o1I7Lm48/jpS2Jo+Qg3arbQOMJktsvXMtwHCNC0fM+oq8lKdqpnn8QhnNrqY6yjOFq
	uUXNqCSjPruhO0KK0AGEifcUCNxSLk21TSWJtZAzRrJDcj3xY6Sbmo7jpNsko57h/LYrJGeuTZ8
	Kl5kWI2hBCl9SvPThsJS9F3kAwP978e39ktXmWux7RM8v8IPGiatkrv7IduX2uriqr0XcUkG+Pz
	cXXPFff3uOVnO1DDl98EtjCt4FjkQ
X-Google-Smtp-Source: AGHT+IEOzP6LCumpOr3UAlpQEF4SR+z8Z4jFyUs2cAXQthJq5ITxhv/MY10D2kmN92NSdIxr1g9Mdw==
X-Received: by 2002:a05:6300:6c0a:b0:21f:4ecc:11b7 with SMTP id adf61e73a8af0-21f4ecc15c8mr8246524637.36.1749464714431;
        Mon, 09 Jun 2025 03:25:14 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c082csm5403262b3a.121.2025.06.09.03.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:25:14 -0700 (PDT)
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
Subject: [PATCH v2 4/5] rust: time: Make HasHrTimer generic over HrTimerMode
Date: Mon,  9 Jun 2025 19:24:17 +0900
Message-ID: <20250609102418.3345792-5-fujita.tomonori@gmail.com>
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
index 0ba87f1233cd..fe68d8de4101 100644
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
+            field : self.$field:ident
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

