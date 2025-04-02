Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB301F540F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630098; cv=none; b=sZgs22nhEBu0hNza8XiPLby+h7zqkHFsgKlEWmJXv6PxvrJThNnJFVWhj4I4UATSwUZDI2qPJWKtPxn7gYPBuIWMW+jHnaYB2XqocF4vLp/xcven8M3F4WUIKPRSYq8zu/8AqnaE5rp7mvxcJxvhUteNX80cnfQezEmbRXHqAJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630098; c=relaxed/simple;
	bh=Mt8jE/SZhTju8949LLhJnwf1Rcrul0/sLIfum+k63Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/GndbDGl0Q6iVjKGfUVxxYqbeJ4/zV1CviCdeyzjcG5yAREZ3Z4AHfdZQIcEvgCdknUjbfupxARtLUVUdyTe/NxvnGym8BtaE8EKSM/g3DQEnifIaO6Bfy8fTl+ltQBNMMpH86v1RIzbE1dePcLBfv+stVQ+IrnqaXjHmvaE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xyxxd5bN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xyxxd5bN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743630096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MC4jjMAzL+F+yN9B7xbTp8xSqrSEsEpBfudmMEov+PI=;
	b=Xyxxd5bNxP+RJLtF4TsFdjzckRx8Gb40Y62908puJfOO9GABJoB+ZFHlhV3nX7tEo2D5FS
	UQY/yPSgXc9qlvoHsJlagOvYyaWOIKdVvnGIP7B8mnjL3k4NlABUZGOMGh6tt+/Q0NVhAL
	os6PbAFf60MIuiE6MZ4nfvW4UTCXRzU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-vY0zSiOWOe6kn0CqcftJkQ-1; Wed,
 02 Apr 2025 17:41:31 -0400
X-MC-Unique: vY0zSiOWOe6kn0CqcftJkQ-1
X-Mimecast-MFC-AGG-ID: vY0zSiOWOe6kn0CqcftJkQ_1743630089
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DC2DA1955DC5;
	Wed,  2 Apr 2025 21:41:28 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.95])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9DC983000704;
	Wed,  2 Apr 2025 21:41:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 3/6] rust: hrtimer: Add HrTimerClockBase
Date: Wed,  2 Apr 2025 17:40:31 -0400
Message-ID: <20250402214109.653341-4-lyude@redhat.com>
In-Reply-To: <20250402214109.653341-1-lyude@redhat.com>
References: <20250402214109.653341-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This adds a simple wrapper for the hrtimer_clock_base struct, which can be
obtained from a HrTimerCallbackContext. We'll use this in the next commit to
add a function to acquire the current time for the base clock driving a
hrtimer.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index c92b10524f892..f633550882247 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -165,6 +165,29 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
     }
 }
 
+/// The timer base for a specific clock.
+///
+/// # Invariants
+///
+/// The layout of this type is equivalent to that of `struct hrtimer_clock_base`.
+#[repr(transparent)]
+pub struct HrTimerClockBase(Opaque<bindings::hrtimer_clock_base>);
+
+impl HrTimerClockBase {
+    /// Retrieve a reference to a [`HrTimerClockBase`] from `ptr`.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to a live `struct hrtimer_clock_base`.
+    unsafe fn from_raw<'a>(ptr: *mut bindings::hrtimer_clock_base) -> &'a Self {
+        // SAFETY:
+        // - `ptr` is guaranteed to point to a live `struct hrtimer_clock_base` by our safety
+        //   contract.
+        // - Our data layout is equivalent to said struct via our type invariants.
+        unsafe { &*ptr.cast() }
+    }
+}
+
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
 ///
 /// `Self` must be [`Sync`] because it is passed to timer callbacks in another
@@ -506,6 +529,15 @@ pub(crate) fn raw_get_timer(&self) -> *mut bindings::hrtimer {
         unsafe { HrTimer::raw_get(self.0.as_ptr()) }
     }
 
+    /// Get the [`HrTimerClockBase`] for the [`HrTimer`] associated with this [`HrTimerCallbackContext`].
+    pub fn clock_base(&self) -> &HrTimerClockBase {
+        // SAFETY:
+        // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`.
+        // - `base` is initialized and points to a valid `hrtimer_clock_base` for as long as
+        //   `HrTimer<T>` is exposed to users.
+        unsafe { HrTimerClockBase::from_raw((*self.raw_get_timer()).base) }
+    }
+
     /// Forward the timer expiry so it will expire in the future.
     ///
     /// Note that this does not requeue the timer, it simply updates its expiry value. It returns
-- 
2.48.1

