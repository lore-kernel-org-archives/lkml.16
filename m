Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADC1257452
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963310; cv=none; b=Q0i+03TWw6nr4PREhzfPmC0LVaTaavScQiPbl2C6d3IvUzqjdJsVrELhM/s9PIPaIwGtqQDSi1Mie844Q4PYP7Y07+u6tOr2xwZqlz21zX9Er0yODT89z773mpzDlFacz9I6EsLsB0OtZ8l+vT60JJkE4ucI1TJZoWhcUYMeJ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963310; c=relaxed/simple;
	bh=SZLfsXPRDLV4F+4hb6ap0CmSiJ6OyHg1dcvc8VeYBF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9Y27NtAZ3GzkYeTh1xR2PkYRAL42BXA4QohwdScr7ccbwtfzRGDhttFiXU7s4Xrae+ESvFOTOjkhQdfFa9V6zceAnFCZcihtHZBL0XZDNsQtEUjG9pry0ktZhb3isQu2q+dLoyq9mp0FDGgpGaUlhMfBZZJ1BN+K4sotky3ku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSfd+lIg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSfd+lIg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745963307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IznTkOaPFCfAvRQt1OhWZrGExipCFPEqSVkrVHQdx+Y=;
	b=MSfd+lIgA9j4RdDj6jADsHDScmntO/MlI+YPxiB/0ueSApEaK6j1/L6nwvxQbRRzbEwJtz
	lPQ02NkaIg7G4gTtEtiOpdWrTGnZ1b/M1JLCpJCwBPWvs35INJ9laLXCFtetw5yOHDTzJ5
	Uk4g+GmCDlhgTwVxf7npGoeCWDp2fyU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-99-b2L_gP_UPuyXyBuQ_6Cl5w-1; Tue,
 29 Apr 2025 17:48:23 -0400
X-MC-Unique: b2L_gP_UPuyXyBuQ_6Cl5w-1
X-Mimecast-MFC-AGG-ID: b2L_gP_UPuyXyBuQ_6Cl5w_1745963300
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0EAF180048E;
	Tue, 29 Apr 2025 21:48:19 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6C7E619560A3;
	Tue, 29 Apr 2025 21:48:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>
Subject: [PATCH v4 3/7] rust: hrtimer: Add HrTimerCallbackContext and ::forward()
Date: Tue, 29 Apr 2025 17:44:39 -0400
Message-ID: <20250429214752.1637859-4-lyude@redhat.com>
In-Reply-To: <20250429214752.1637859-1-lyude@redhat.com>
References: <20250429214752.1637859-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

With Linux's hrtimer API, there's a number of methods that can only be
called in two situations:

* When we have exclusive access to the hrtimer and it is not currently
  active
* When we're within the context of an hrtimer callback context

This commit handles the second situation and implements hrtimer_forward()
support in the context of a timer callback. We do this by introducing a
HrTimerCallbackContext type which is provided to users during the
RawHrTimerCallback::run() callback, and then add a forward() function to
the type.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Improve SAFETY comments for HrTimerCallbackContext uses (I forgot to
  mention that we're within RawHrTimerCallback::run()
* Split forward into forward() and raw_forward() since we're going to have
  two contexts that we can call forward() from now.
* Clarify contexts in which certain hrtimer methods can be called.
* Make sure that we use a mutable reference for forward() here - just in
  case :).
* Rename interval to duration
V3:
* Rename duration -back- to interval (now that I actually have read
  hrtimer_forward's source, interval does make more sense than duration
  considering the fact we return the number of overruns that occurred
  according to the given interval).
* Rewrite documentation a bit (re: Andreas)

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs         | 59 ++++++++++++++++++++++++++++-
 rust/kernel/time/hrtimer/arc.rs     |  9 ++++-
 rust/kernel/time/hrtimer/pin.rs     |  9 ++++-
 rust/kernel/time/hrtimer/pin_mut.rs | 11 +++++-
 rust/kernel/time/hrtimer/tbox.rs    |  9 ++++-
 5 files changed, 90 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 76caf9fae8170..b0304b2cf2da9 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -73,7 +73,7 @@
     time::{Delta, Instant},
     types::Opaque,
 };
-use core::marker::PhantomData;
+use core::{marker::PhantomData, ptr::NonNull};
 use pin_init::PinInit;
 
 /// A timer backed by a C `struct hrtimer`.
@@ -322,7 +322,10 @@ pub trait HrTimerCallback {
     type Pointer<'a>: RawHrTimerCallback;
 
     /// Called by the timer logic when the timer fires.
-    fn run(this: <Self::Pointer<'_> as RawHrTimerCallback>::CallbackTarget<'_>) -> HrTimerRestart
+    fn run<T>(
+        this: <Self::Pointer<'_> as RawHrTimerCallback>::CallbackTarget<'_>,
+        ctx: HrTimerCallbackContext<'_, T>,
+    ) -> HrTimerRestart
     where
         Self: Sized;
 }
@@ -515,6 +518,58 @@ fn into_c(self) -> bindings::hrtimer_mode {
     }
 }
 
+/// Privileged smart-pointer for a [`HrTimer`] callback context.
+///
+/// Many [`HrTimer`] methods can only be called in two situations:
+///
+/// * When the caller has exclusive access to the `HrTimer` and the `HrTimer` is guaranteed not to
+///   be running.
+/// * From within the context of an `HrTimer`'s callback method.
+///
+/// This type provides access to said methods from within a timer callback context.
+///
+/// # Invariants
+///
+/// * The existence of this type means the caller is currently within the callback for an
+///   [`HrTimer`].
+/// * `self.0` always points to a live instance of [`HrTimer<T>`].
+pub struct HrTimerCallbackContext<'a, T>(NonNull<HrTimer<T>>, PhantomData<&'a ()>);
+
+impl<'a, T> HrTimerCallbackContext<'a, T> {
+    /// Create a new [`HrTimerCallbackContext`].
+    ///
+    /// # Safety
+    ///
+    /// This function relies on the caller being within the context of a timer callback, so it must
+    /// not be used anywhere except for within implementations of [`RawHrTimerCallback::run`]. The
+    /// caller promises that `timer` points to a valid initialized instance of
+    /// [`bindings::hrtimer`].
+    pub(crate) unsafe fn from_raw(timer: *mut HrTimer<T>) -> Self {
+        // SAFETY: The caller guarantees `timer` is a valid pointer to an initialized
+        // `bindings::hrtimer`
+        Self(unsafe { NonNull::new_unchecked(timer) }, PhantomData)
+    }
+
+    /// Conditionally forward the timer.
+    ///
+    /// If the timer expires after `now`, this function does nothing and returns 0. If the timer
+    /// expired at or before `now`, this function forwards the timer by `interval` until the timer
+    /// expires after `now` and then returns the number of times the timer was forwarded by
+    /// `interval`.
+    ///
+    /// This function is mainly useful for timer types which can provide exclusive access to the
+    /// timer when the timer is not running. For forwarding the timer when you have exclusive access
+    /// to the timer, see [`HrTimer::forward()`].
+    ///
+    /// Returns the number of overruns that occurred as a result of the timer expiry change.
+    pub fn forward(&mut self, now: Instant, interval: Delta) -> u64 {
+        // SAFETY:
+        // - We are guaranteed to be within the context of a timer callback by our type invariants
+        // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`
+        unsafe { HrTimer::<T>::raw_forward(self.0.as_ptr(), now, interval) }
+    }
+}
+
 /// Use to implement the [`HasHrTimer<T>`] trait.
 ///
 /// See [`module`] documentation for an example.
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
index acc70a0ea1be5..f30efd2d1094d 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -3,6 +3,7 @@
 use super::HasHrTimer;
 use super::HrTimer;
 use super::HrTimerCallback;
+use super::HrTimerCallbackContext;
 use super::HrTimerHandle;
 use super::HrTimerPointer;
 use super::RawHrTimerCallback;
@@ -95,6 +96,12 @@ impl<T> RawHrTimerCallback for Arc<T>
         //    allocation from other `Arc` clones.
         let receiver = unsafe { ArcBorrow::from_raw(data_ptr) };
 
-        T::run(receiver).into_c()
+        // SAFETY:
+        // - By C API contract `timer_ptr` is the pointer that we passed when queuing the timer, so
+        //   it is a valid pointer to a `HrTimer<T>` embedded in a `T`.
+        // - We are within `RawHrTimerCallback::run`
+        let context = unsafe { HrTimerCallbackContext::from_raw(timer_ptr) };
+
+        T::run(receiver, context).into_c()
     }
 }
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
index dba22d11a95f5..c694a96fcd9d5 100644
--- a/rust/kernel/time/hrtimer/pin.rs
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -3,6 +3,7 @@
 use super::HasHrTimer;
 use super::HrTimer;
 use super::HrTimerCallback;
+use super::HrTimerCallbackContext;
 use super::HrTimerHandle;
 use super::RawHrTimerCallback;
 use super::UnsafeHrTimerPointer;
@@ -99,6 +100,12 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a T>
         // here.
         let receiver_pin = unsafe { Pin::new_unchecked(receiver_ref) };
 
-        T::run(receiver_pin).into_c()
+        // SAFETY:
+        // - By C API contract `timer_ptr` is the pointer that we passed when queuing the timer, so
+        //   it is a valid pointer to a `HrTimer<T>` embedded in a `T`.
+        // - We are within `RawHrTimerCallback::run`
+        let context = unsafe { HrTimerCallbackContext::from_raw(timer_ptr) };
+
+        T::run(receiver_pin, context).into_c()
     }
 }
diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtimer/pin_mut.rs
index aeff8e102e1dc..82242c79ee433 100644
--- a/rust/kernel/time/hrtimer/pin_mut.rs
+++ b/rust/kernel/time/hrtimer/pin_mut.rs
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use super::{
-    HasHrTimer, HrTimer, HrTimerCallback, HrTimerHandle, RawHrTimerCallback, UnsafeHrTimerPointer,
+    HasHrTimer, HrTimer, HrTimerCallback, HrTimerCallbackContext, HrTimerHandle,
+    RawHrTimerCallback, UnsafeHrTimerPointer,
 };
 use crate::time::Instant;
 use core::{marker::PhantomData, pin::Pin, ptr::NonNull};
@@ -103,6 +104,12 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a mut T>
         // here.
         let receiver_pin = unsafe { Pin::new_unchecked(receiver_ref) };
 
-        T::run(receiver_pin).into_c()
+        // SAFETY:
+        // - By C API contract `timer_ptr` is the pointer that we passed when queuing the timer, so
+        //   it is a valid pointer to a `HrTimer<T>` embedded in a `T`.
+        // - We are within `RawHrTimerCallback::run`
+        let context = unsafe { HrTimerCallbackContext::from_raw(timer_ptr) };
+
+        T::run(receiver_pin, context).into_c()
     }
 }
diff --git a/rust/kernel/time/hrtimer/tbox.rs b/rust/kernel/time/hrtimer/tbox.rs
index 3df4e359e9bb0..c5c952721cee2 100644
--- a/rust/kernel/time/hrtimer/tbox.rs
+++ b/rust/kernel/time/hrtimer/tbox.rs
@@ -3,6 +3,7 @@
 use super::HasHrTimer;
 use super::HrTimer;
 use super::HrTimerCallback;
+use super::HrTimerCallbackContext;
 use super::HrTimerHandle;
 use super::HrTimerPointer;
 use super::RawHrTimerCallback;
@@ -115,6 +116,12 @@ impl<T, A> RawHrTimerCallback for Pin<Box<T, A>>
         //   `data_ptr` exist.
         let data_mut_ref = unsafe { Pin::new_unchecked(&mut *data_ptr) };
 
-        T::run(data_mut_ref).into_c()
+        // SAFETY:
+        // - By C API contract `timer_ptr` is the pointer that we passed when queuing the timer, so
+        //   it is a valid pointer to a `HrTimer<T>` embedded in a `T`.
+        // - We are within `RawHrTimerCallback::run`
+        let context = unsafe { HrTimerCallbackContext::from_raw(timer_ptr) };
+
+        T::run(data_mut_ref, context).into_c()
     }
 }
-- 
2.48.1

