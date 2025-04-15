Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0722512DC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746663; cv=none; b=cw0UPmvZl8eeji/4sEpcIXl7eYw7BMpnV+o4Oc1ovikWEOoF3dhwk/v37iOKLLKCEk6iMnA7nIXpy6iSjB9QSRPnbbYgpqYQWuDk9pB8E9KnQFOQSK3FNMKUse/58acrEHw831GSKM1ECG9BDMBtOsRZA3vt46VKAwe/vRG/yzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746663; c=relaxed/simple;
	bh=7qcwkn32Fa0sfbLRLUeoYAai3MiiIaWCqHs+F9VCGZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MprIqeIdif50wYPTPcoaY66UTrmDvcTd0K44ekbBTqm0Q32eIQWPf1ZVqx0L/UoeuQf7on/Fjk8KniOFqTfpQc2kFu8p4t8KyeUTn2vmGXxuC5fI+BnOe3R6iICjXXiX/J8GTDAojbkNPDtnkdVZFBn59S759qtiKIJRw+yksZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=htnxiwXR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="htnxiwXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744746660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ryYGmJ3J41KdHRoTFjagDnmKVKLfVIOtjqIQ3uqQjs=;
	b=htnxiwXRHzmL18ESvinLfTeO6MJnDzgFwf0mrkMqmD+rQYLRhaSxL0+WOUUQSetgw7MFS2
	6GOrmpLyDYN34pV2aoIXjQ57JjRa96fZCXNX68Oma9VhwEgr5CqVsT8eT6rVqk06lrgSAP
	jaAy+XtAex2KxoSQi6g2+Be5xpa7F+U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-zmeoNb1RNfaU2f96RZ3cZg-1; Tue,
 15 Apr 2025 15:50:53 -0400
X-MC-Unique: zmeoNb1RNfaU2f96RZ3cZg-1
X-Mimecast-MFC-AGG-ID: zmeoNb1RNfaU2f96RZ3cZg_1744746651
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 37CDD1800A38;
	Tue, 15 Apr 2025 19:50:49 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2EC3919560AD;
	Tue, 15 Apr 2025 19:50:45 +0000 (UTC)
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
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 3/8] rust: hrtimer: Add HrTimerCallbackContext and ::forward()
Date: Tue, 15 Apr 2025 15:48:24 -0400
Message-ID: <20250415195020.413478-4-lyude@redhat.com>
In-Reply-To: <20250415195020.413478-1-lyude@redhat.com>
References: <20250415195020.413478-1-lyude@redhat.com>
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

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs         | 51 +++++++++++++++++++++++++++--
 rust/kernel/time/hrtimer/arc.rs     |  9 ++++-
 rust/kernel/time/hrtimer/pin.rs     |  9 ++++-
 rust/kernel/time/hrtimer/pin_mut.rs | 11 +++++--
 rust/kernel/time/hrtimer/tbox.rs    |  9 ++++-
 5 files changed, 82 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index aadae8666f7ea..507fff67f8ab2 100644
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
@@ -314,7 +314,10 @@ pub trait HrTimerCallback {
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
@@ -507,6 +510,50 @@ fn into_c(self) -> bindings::hrtimer_mode {
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
+    /// Forward the timer expiry so it expires at `duration` after `now`.
+    ///
+    /// Note that this does not requeue the timer, it simply updates its expiry value. It returns
+    /// the number of overruns that have occurred as a result of the expiry change.
+    pub fn forward(&mut self, now: Instant, duration: Delta) -> u64 {
+        // SAFETY:
+        // - We are guaranteed to be within the context of a timer callback by our type invariants
+        // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`
+        unsafe { HrTimer::<T>::raw_forward(self.0.as_ptr(), now, duration) }
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

