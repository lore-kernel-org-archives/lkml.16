Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0306917A31C;
	Sun,  4 May 2025 05:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746334830; cv=none; b=uscj4hIf9MC1hJltqr4BtOmBVhzjkdfJj0X6BobdvtHgy61NDttwS/00HwKvwJY4nngzrwuoZ9FSWilc1E25ZB04AmkiXsY2GLTUOmrbfvxzOvwn24R0LwJlFQDz8VfCS9HK02L5rcA8XAXhW3zKXaYSLzGpc27r8yXd4cBsdR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746334830; c=relaxed/simple;
	bh=FlPQ9iXVFrxRTyfeW2IF8MHi0vTPl/cxV5k8adyJ8P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lx/GSIyn4M2K7x7afIlhYsbBH1LJDhGZfCPb1gBQKcYMu4FxHec0WAPNrvUGxQ+eheaHs8yx3zE1xzpIzpxWZOko1MSSlk0FRdLYkSnnqi06qGwy8qX+CJTTMQSlAC4gGeiJrsUH3pkt9lmqEDx+fMCoQNJlWTPLZIxytvNM8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESmDqW51; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESmDqW51"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736c277331eso4145467b3a.1;
        Sat, 03 May 2025 22:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746334828; x=1746939628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjbGYG+8x4M0bAgJSxWznYro2eOFp8zdnX+tDzzFfAQ=;
        b=ESmDqW51O5WFETChONWteLCfF9eKAJFwkxradMo//MWxacIhBOUGDv6zXFSjTT9MET
         Yyc77hL4FSAOlTgi/ndka2n8mZlUzVUhazH5l3eOOQccojbKEkqC6K/5bMcxnOZtfRLI
         UI+iL0lPu2DXfBZpoDFbPalrLj8hkNTLRqbZWrdlyhQ7eLphwBtbgSo7Bu5QqBRFRwOP
         aQm5p3t3nvVI0uZKKkZZboqs7PA6xyn1CLYd9Io9p7CSPkFtklsb7IAvsQ9AGDQriDQ2
         mvDNLioBIY3P1kmJgwSZf9b4d4nGiDmX7WX86DqGJku8/w7yY3Vav1dW9+HfWOO2uZho
         lkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746334828; x=1746939628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjbGYG+8x4M0bAgJSxWznYro2eOFp8zdnX+tDzzFfAQ=;
        b=Hij9egLEBqj1PK3K4PIKHR4VEXbGVmblesLH9FOJd7mqMLOZyJgPT5aUXpU21hhpLO
         9vm7iXz/652LuaE6bkU+6mA4ixobK4BUrPMBhE75+0BFfb5KJmzp9B+vvX68GXVrhYjq
         3b8Bc7H+m409RqfFlVrg0XAjK3A5OY7Tv/MCo5cdMpEcp2gAR+h7pKr97OQRC0PRnLLC
         l+M/TOsfo6ivAgcb08tR5NnMG/b9n/qNWm7GPrII6vGaQWUspRe9X9DjALRw46TzPHAq
         69eYhWaCYDSo+ydYDy8s+WtKiGYRlCH5AAFSPdaBCybu+3eA3dFrZQK8d4kc7W2joA9Z
         4CUw==
X-Forwarded-Encrypted: i=1; AJvYcCU+tt5UU7y4rcVRSw9/fMLRtbMppm2I9Zr4UpAsP2Y8NGqqkD9S7Iz2F5Juz8k+CsKHoKmMbiSnA8ZzYBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbpTUms4mntjsBzZboIz470ttUThH8/VuyAbbBw2pxZgWZLoA
	c7Vu/Ua51tO17PATlSAtg69dI6LD+ZEHbHa9SrRFThM+XHDKQ2SJNi9JU2d7
X-Gm-Gg: ASbGncs9/XRk6wEjo1btKWSmvMBmLzvFD+pYngymYPnAo2dbyINOPdCLzPKUOHIsvoh
	YfLbeKiHMpJGz3nHe4vKUr71hIEWxzABkSkXJ26JCab67SAd1jDYNp7DvRWIMPpMndRcT+ZUGGw
	QPle1LYqYV4A1bqjszuGLwp7CsWuHJO5F7CjOjiFMiHCN7HxU1DjlGNMaH6dl+5r3/okQuO/9Lx
	yWwBdJrvabqHyIppC9Xns/Wu8zTribGO7x1MkB45e/Z0DYTQgQXcFdjDI0JI4932xN60+4jPGq7
	cY0d/3YxU0R49ebkj28xPoizf8y6Gx8uI/adT8SJtXAmSZUuhzIgph+7zp3kMf1dDiXQyWUezJ8
	jJskyYH7GUtpvQM0yTw==
X-Google-Smtp-Source: AGHT+IHVEpj3wb5RIgV9GVVQVJSdQwzAt+7ryU19fwFo/E9To3S8UZg3OFb90oJBkv6j17Y/8Zc1YQ==
X-Received: by 2002:a05:6a20:ce48:b0:1f5:9cdc:54bb with SMTP id adf61e73a8af0-20bd766234bmr16163940637.11.1746334827679;
        Sat, 03 May 2025 22:00:27 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db91dasm4225756b3a.44.2025.05.03.22.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:00:27 -0700 (PDT)
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
Subject: [PATCH v1 4/5] rust: time: Make HasHrTimer generic over HrTimerMode
Date: Sun,  4 May 2025 13:59:57 +0900
Message-ID: <20250504045959.238068-5-fujita.tomonori@gmail.com>
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

Add a `TimerMode` associated type to the `HasHrTimer` trait to
represent the operational mode of the timer, such as absolute or
relative expiration.  This new type must implement the `HrTimerMode`
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
        mode = AbsoluteMode<Monotonic>,
        self.timer
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
index 55e1825425b6..3355ae6fe76d 100644
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
+                expires.as_nanos(),
                 0,
-                (*Self::raw_get_timer(this)).mode,
+                <Self::TimerMode as HrTimerMode>::Clock::ID as u32,
             );
         }
     }
@@ -579,12 +604,16 @@ macro_rules! impl_has_hr_timer {
         impl$({$($generics:tt)*})?
             HasHrTimer<$timer_type:ty>
             for $self:ty
-        { self.$field:ident }
+        {
+            mode = $mode:ty,
+            self.$field:ident
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

