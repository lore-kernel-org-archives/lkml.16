Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F409264609
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963296; cv=none; b=MXVRzZhh2UwQtki3DWSxRf3oa8wbi+/pVOtV/QvQBG6zWq15mE/3LdexZduch5yiiXnBCxXaJ97oYGCber/00Au9VuLA8ck1vJ108yWwwTNKeNczdLE7lyrUpJDWcdlkqaH3wpkhCC13JuarVbTzywxy4Kdx4cfC/yk6up4SVHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963296; c=relaxed/simple;
	bh=MSF0qwmCf6ZWXrtsVfIP/yBIfGWSyTA2Js4oFfyZz3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jC+RC3CfJR2jXII2qF5PxoDyF5R9X3EKizdPC9OZmf0eicgQArkCNnKUjDAxrnuKN7nHGVBKPxtWpb8s+DrAZ2Sbpcij0+dkbBfkT8Xem/xUxi8loz0J1URv6id3SrAZTHxPuKy4ECkqtIol2ZCBZRO+Ab5cuGVo3YJLjmYbTvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dGszl4de; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dGszl4de"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745963293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZb82PbyGYSBKPulXkIr1Fg1XkWaJSRhe1YdKH7R7kE=;
	b=dGszl4deY0bQl/Gi1Eg8Pln2wl6lASi3ww034mjpYQ7gVgVvUH1QklYTW9MvGWZ5vHeReG
	oMi5CO7VKrU4Y7IK97/TS1STx6ag3SU9nLxFa1qjscDW4mY8wvmZ7Cs4fl05eca1p/pl3x
	F/goWV6SkeUQf5wt0Ca0nu9r9bG/1bw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-5sbtlesFPNCQxhQ6mYB1hw-1; Tue,
 29 Apr 2025 17:48:10 -0400
X-MC-Unique: 5sbtlesFPNCQxhQ6mYB1hw-1
X-Mimecast-MFC-AGG-ID: 5sbtlesFPNCQxhQ6mYB1hw_1745963287
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A1391956094;
	Tue, 29 Apr 2025 21:48:07 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6767E19560A3;
	Tue, 29 Apr 2025 21:48:03 +0000 (UTC)
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
Subject: [PATCH v4 2/7] rust: hrtimer: Add HrTimer::raw_forward() and forward()
Date: Tue, 29 Apr 2025 17:44:38 -0400
Message-ID: <20250429214752.1637859-3-lyude@redhat.com>
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

Within the hrtimer API there are quite a number of functions that can only
be safely called from one of two contexts:

* When we have exclusive access to the hrtimer and the timer is not active.
* When we're within the hrtimer's callback context as it is being executed.

This commit adds bindings for hrtimer_forward() for the first such context,
along with HrTimer::raw_forward() for later use in implementing the
hrtimer_forward() in the latter context.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V4:
* Fix the safety contract for raw_forward()
* Require Pin<&mut Self>, not &mut self
* Drop incorrect UniquePin example
* Rewrite documentation a bit (re: Andreas)

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 44 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index ef96c7e2c21ff..76caf9fae8170 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -68,7 +68,11 @@
 //! `start` operation.
 
 use super::ClockId;
-use crate::{prelude::*, time::Instant, types::Opaque};
+use crate::{
+    prelude::*,
+    time::{Delta, Instant},
+    types::Opaque,
+};
 use core::marker::PhantomData;
 use pin_init::PinInit;
 
@@ -164,6 +168,44 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
         // handled on the C side.
         unsafe { bindings::hrtimer_cancel(c_timer_ptr) != 0 }
     }
+
+    /// Forward the timer expiry for a given timer pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `self_ptr` must point to a valid `Self`.
+    /// - The caller must either have exclusive access to the data pointed at by `self_ptr`, or be
+    ///   within the context of the timer callback.
+    #[inline]
+    unsafe fn raw_forward(self_ptr: *mut Self, now: Instant, interval: Delta) -> u64 {
+        // SAFETY:
+        // * The C API requirements for this function are fulfilled by our safety contract.
+        // * `self_ptr` is guaranteed to point to a valid `Self` via our safety contract
+        unsafe {
+            bindings::hrtimer_forward(Self::raw_get(self_ptr), now.as_nanos(), interval.as_nanos())
+        }
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
+    /// timer when the timer is not running. For forwarding the timer from within the timer callback
+    /// context, see [`HrTimerCallbackContext::forward()`].
+    ///
+    /// Returns the number of overruns that occurred as a result of the timer expiry change.
+    pub fn forward(self: Pin<&mut Self>, now: Instant, interval: Delta) -> u64 {
+        // SAFETY:
+        // - `raw_forward` does not move `self`.
+        // - Self is a mutable reference and thus always points to a valid `HrTimer`
+        // - The only way that we could hold a mutable reference to `HrTimer<T>` is if we have
+        //   exclusive access to it - fulfilling the requirements of the C API.
+        unsafe { Self::raw_forward(self.get_unchecked_mut(), now, interval) }
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
-- 
2.48.1

