Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E65A275108
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963317; cv=none; b=Mi3sUu1K0yqO7ax63UGS9KNdzkJtbNDKHgXo/zi/0xr9Ts7DzaOdo0fBU8YL8pYQezx70DxIataUOZILFpvx/A80UPnVavD3rg44VnOv0ERlZOsuMKASxI+5cLrVZdA1XxzkIbx7rTxLFGG5/HUv29fodfmDPaBcdaGs1Boljn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963317; c=relaxed/simple;
	bh=EEi47JhKU4scdAOtuIqQPebfCQhZyRg+10HsI94IKe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EId0Les9Z7rVO5bdhF6IIdIbxw48qtZTJrgPOz+9NFfYNiG+E10jTTyMUxr+GvYe21m1LPHduttu2sHOqJhd8wlKLt9GXZD/2CbCtvB00nqB5fUyRbejI0GjIhOZ5M/9CnHcIeNWSQjmbQqqH37zM6YfrrZ1I+8D5JgxjBUUrdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O3PfSCxc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O3PfSCxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745963314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kNsJKZYf8Jen4eNtgKuwwIYr6+X3oK52kaO2gEfl+Gg=;
	b=O3PfSCxcDmQKtFBCdR1mmN9cGfQXe05y4mplLLUzLu+7v4zeu78AAAfg+z29wGDqKFNBNF
	XITGGKoyy7FyGlCeTh0/32NhixC5ggtkeVrIuqrYFjngbktMBheJZ4pnXRPyDg0oouz5sS
	l7HwCQGIMwxu+laN7emNpGLsZ9Mrvog=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-193-p6GeKYtnOtO5McjA0fF90A-1; Tue,
 29 Apr 2025 17:48:31 -0400
X-MC-Unique: p6GeKYtnOtO5McjA0fF90A-1
X-Mimecast-MFC-AGG-ID: p6GeKYtnOtO5McjA0fF90A_1745963308
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2573180087B;
	Tue, 29 Apr 2025 21:48:28 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 22CDF19560A3;
	Tue, 29 Apr 2025 21:48:26 +0000 (UTC)
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
Subject: [PATCH v4 6/7] rust: hrtimer: Add forward_now() to HrTimer and HrTimerCallbackContext
Date: Tue, 29 Apr 2025 17:44:42 -0400
Message-ID: <20250429214752.1637859-7-lyude@redhat.com>
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

Using the HrTimer::raw_time_cb() function, we can now add an equivalent to
hrtimer_forward_now() to both HrTimer and HrTimerCallbackContext.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Change from Ktime to Delta
* Make sure that forward_now() takes a mutable reference to the timer
  struct
* Reword this to point out that we're adding forward_now() to both callback
  context and mutable timer reference
* Rename interval to duration

V4:
* Fix rust documentation for HrTimerCallbackContext (forgot to update both
  forward_now() declarations)
* Use Pin<&mut Self> for context-less forward.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 80270e14daafd..0d93866d7b20a 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -194,7 +194,6 @@ unsafe fn raw_forward(self_ptr: *mut Self, now: Instant, interval: Delta) -> u64
     /// - The caller must ensure that the `hrtimer_clock_base` cannot possibly change in the context
     ///   this function is being called in. This means either exclusive access to `self_ptr` is
     ///   required, or we must be from within the timer callback context of `self_ptr`.
-    #[expect(unused)]
     unsafe fn raw_cb_time(self_ptr: *const Self) -> Instant {
         // SAFETY: We're guaranteed `self_ptr` points to a valid `Self` by our safety contract.
         let clock_base = unsafe { (*Self::raw_get(self_ptr)).base };
@@ -230,6 +229,18 @@ pub fn forward(self: Pin<&mut Self>, now: Instant, interval: Delta) -> u64 {
         //   exclusive access to it - fulfilling the requirements of the C API.
         unsafe { Self::raw_forward(self.get_unchecked_mut(), now, interval) }
     }
+
+    /// Conditionally forward the timer.
+    ///
+    /// This is a variant of [`forward()`](Self::forward) that uses an interval after the current
+    /// time of the base clock for the [`HrTimer`].
+    pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64 {
+        // SAFETY: `self` is a mutable reference, guaranteeing it is both a valid pointer to Self
+        // and that we also have exclusive access to `self`.
+        let now = unsafe { Self::raw_cb_time(&*self.as_ref()) };
+
+        self.forward(now, interval)
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
@@ -592,6 +603,22 @@ pub fn forward(&mut self, now: Instant, interval: Delta) -> u64 {
         // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`
         unsafe { HrTimer::<T>::raw_forward(self.0.as_ptr(), now, interval) }
     }
+
+    /// Conditionally forward the timer.
+    ///
+    /// This is a variant of [`HrTimerCallbackContext::forward()`] that uses an interval after the
+    /// current time of the base clock for the [`HrTimer`].
+    pub fn forward_now(&mut self, duration: Delta) -> u64 {
+        self.forward(
+            // SAFETY:
+            // - We're guaranteed `self.0` points to a valid `HrTimer<T>` instance by type
+            //   invariants.
+            // - We're guaranteed to be within the context of the timer callback by our type
+            //   invariants.
+            unsafe { HrTimer::<T>::raw_cb_time(self.0.as_ptr()) },
+            duration,
+        )
+    }
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.
-- 
2.48.1

