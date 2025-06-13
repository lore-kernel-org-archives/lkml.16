Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE1028FA85
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749857327; cv=none; b=bShjcxpmC77wlqvAvjYz0S9AGzXktTibuWShTs4OVNJ98GFKlOZuU2Xao9ff2JqjAq6gSzJgOe1WF6AodBsIMA5+09nly3/YJ8YVAFtWBwlP9Wln1ZoIOYRtwHeDPk0/mguM/ow03+Bj5v3tp062YRXdjNfTanULjWCVPHgch6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749857327; c=relaxed/simple;
	bh=n9umnjaNSBSHX0GHX2P8zsGPIAl95NZy7G30H4N3fao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQicsS2ukYPaQKvkc01AFxbGwqRzxNYnT3CLjZXmMw/Gg3AspENzZAxUCxyWOHjtyvcfihJ+AivOxrjVY4OH2HfR2Pv6HSPI+XQwD+HxRTPZ7ERxJquZb9LD0oer/zI8lLk/MSLZx6QK/xM3eaE61voykUh1SEgoxODi7dY2vqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5HvLscj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5HvLscj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749857325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vE7a8Rvyx3n5Nss6xlhGQkT2GVTsPwwys36P7pqKvnI=;
	b=N5HvLscj34efZp/ucvB45+PyLRUCeWyIn8HHhsp+pswXjxhYr1SeBK7OKp3U4kf0Wt9zpe
	rhIFs+OlfHPXYD5Bshhph1NHiNsBIehM2pVLqlDIbMtfg+GhJrt3T4IjJC7hsqfFm3i0MQ
	qCkBNt/SEDAMILLjeBf3Zy7CXprT2Kc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-HS3fditTOY6RYgI0mO9AuA-1; Fri,
 13 Jun 2025 19:28:42 -0400
X-MC-Unique: HS3fditTOY6RYgI0mO9AuA-1
X-Mimecast-MFC-AGG-ID: HS3fditTOY6RYgI0mO9AuA_1749857320
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D386E195608E;
	Fri, 13 Jun 2025 23:28:39 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B4B14180045B;
	Fri, 13 Jun 2025 23:28:35 +0000 (UTC)
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
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 7/7] rust: hrtimer: Add forward_now() to HrTimer and HrTimerCallbackContext
Date: Fri, 13 Jun 2025 19:22:28 -0400
Message-ID: <20250613232754.451450-8-lyude@redhat.com>
In-Reply-To: <20250613232754.451450-1-lyude@redhat.com>
References: <20250613232754.451450-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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
 rust/kernel/time/hrtimer.rs | 58 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 79d86e1099a1e..0908359b0550a 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -201,7 +201,6 @@ unsafe fn raw_forward(self_ptr: *mut Self, now: HrTimerInstant<T>, interval: Del
     /// - The caller must ensure that the `hrtimer_clock_base` cannot possibly change in the context
     ///   this function is being called in. This means either exclusive access to `self_ptr` is
     ///   required, or we must be from within the timer callback context of `self_ptr`.
-    #[expect(unused)]
     unsafe fn raw_cb_time(self_ptr: *const Self) -> HrTimerInstant<T>
     where
         T: HasHrTimer<T>,
@@ -243,6 +242,44 @@ pub fn forward(self: Pin<&mut Self>, now: HrTimerInstant<T>, interval: Delta) ->
         //   exclusive access to it - fulfilling the requirements of the C API.
         unsafe { Self::raw_forward(self.get_unchecked_mut(), now, interval) }
     }
+
+    /// Conditionally forward the timer.
+    ///
+    /// This is a variant of [`forward()`](Self::forward) that uses an interval after the current
+    /// time of the base clock for the [`HrTimer`].
+    pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
+    where
+        T: HasHrTimer<T>,
+    {
+        // SAFETY: `self` is a mutable reference, guaranteeing it is both a valid pointer to Self
+        // and that we also have exclusive access to `self`.
+        let now = unsafe { Self::raw_cb_time(&*self.as_ref()) };
+
+        self.forward(now, interval)
+    }
+
+    /// Return the time expiry for this [`HrTimer`].
+    ///
+    /// This value should only be used as a snapshot, as the actual expiry time could change after
+    /// this function is called.
+    pub fn expires(&self) -> HrTimerInstant<T>
+    where
+        T: HasHrTimer<T>,
+    {
+        // SAFETY: `self` is an immutable reference and thus always points to a valid `HrTimer`.
+        let c_timer_ptr = unsafe { HrTimer::raw_get(self) };
+
+        // SAFETY:
+        // - `node.expires` is a ktime_t, so it must be within the range of `0` to `KTIME_MAX`.
+        // - There's no actual locking here, a racy read is fine and expected
+        unsafe {
+            Instant::from_nanos(
+                // This `read_volatile` is intended to correspond to a READ_ONCE call.
+                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
+                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
+            )
+        }
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
@@ -702,6 +739,25 @@ pub fn forward(&mut self, now: HrTimerInstant<T>, interval: Delta) -> u64
         // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`
         unsafe { HrTimer::<T>::raw_forward(self.0.as_ptr(), now, interval) }
     }
+
+    /// Conditionally forward the timer.
+    ///
+    /// This is a variant of [`HrTimerCallbackContext::forward()`] that uses an interval after the
+    /// current time of the base clock for the [`HrTimer`].
+    pub fn forward_now(&mut self, duration: Delta) -> u64
+    where
+        T: HasHrTimer<T>,
+    {
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
2.49.0

