Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F99252912
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746665; cv=none; b=tY4Z+252YyyA6qw7v/FjwcwjeswJcj1UYOizc2voXsBz3pXFpnBzzu20MZ8VuOzAFrDjzI65sCP+6vxCPFW/fJfJjrFiDKFKM3IeoQz8ITPEaJPlXHPoDt+PYpYK8XVVmpMfG+SzjdXtY3qR5Td8FqHQTUrLHpPb77UNNu7pSGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746665; c=relaxed/simple;
	bh=zchRka33d94ED3NLGmKD0KwCjnIWbYH40bk5JXAkI50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VY4ld9yoKnwnGeFfE8CMEOxR2vNFpf035ShUJye3ZHM4UnfcWnRc/3m0nKNVGpzyVgd/Zi73QbdeW8KJPUrdz1UGg+Th/Vq/XoV5KVd1MJEM+Qw/PnQZG4dsMX+EXxhJS/1xCsUFMzx2xuBqTM4+Ui5bgNoM6sPMcme1ptRupeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VpLA4yOU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VpLA4yOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744746660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ji2FnGc7GWmpbxp6bUnSlbcZu0xWECkZ+19vDopO8c=;
	b=VpLA4yOUcXAHOd+bJoTOEpd4OiBfYn8z9kuWWhsOxXI2mLxeMfmRQojq9xl6uUHACjgrtk
	4LkAvYRNKupKKqUn/IhGtWrVaWVtoTMyuCdpKR9wkxTjhEKKft4sGM/03gpBteRIqnLyTw
	VtIy8xX7Qyrvy7kGO+O9FVklM3Lt2EM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-IHBt5OCyP2iiotkbdl0cNA-1; Tue,
 15 Apr 2025 15:50:57 -0400
X-MC-Unique: IHBt5OCyP2iiotkbdl0cNA-1
X-Mimecast-MFC-AGG-ID: IHBt5OCyP2iiotkbdl0cNA_1744746653
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9FEFA195609E;
	Tue, 15 Apr 2025 19:50:53 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB33419560AD;
	Tue, 15 Apr 2025 19:50:49 +0000 (UTC)
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
Subject: [PATCH v2 4/8] rust: hrtimer: Add HrTimerClockBase
Date: Tue, 15 Apr 2025 15:48:25 -0400
Message-ID: <20250415195020.413478-5-lyude@redhat.com>
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

This adds a simple wrapper for the hrtimer_clock_base struct, which can be
obtained from a HrTimerCallbackContext. We'll use this in the next commit to
add a function to acquire the current time for the base clock driving a
hrtimer.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Convert safety comment to invariant comment in from_raw()
- Add raw_clock_base() and implement clock_base() on HrTimer<T> as well

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 507fff67f8ab2..a56c66104f692 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -183,6 +183,25 @@ unsafe fn raw_forward(self_ptr: *mut Self, now: Instant, interval: Delta) -> u64
         }
     }
 
+    /// Retrieve the [`HrTimerClockBase`] for a given timer pointer.
+    ///
+    /// # Safety
+    ///
+    /// `self_ptr` must point to a valid `Self`.
+    unsafe fn raw_clock_base<'a>(self_ptr: *const Self) -> &'a HrTimerClockBase {
+        // SAFETY:
+        // - By our safety contract, `self_ptr` always points to a valid `HrTimer<T>`.
+        // - `base` is initialized and points to a valid `hrtimer_clock_base` for as long as
+        //   `HrTimer<T>` is exposed to users.
+        unsafe { HrTimerClockBase::from_raw((*Self::raw_get(self_ptr)).base) }
+    }
+
+    /// Retrieve the [`HrTimerClockBase`] for this [`HrTimer`].
+    pub fn clock_base(&self) -> &HrTimerClockBase {
+        // SAFETY: `self` is an immutable reference and thus always points to a valid `HrTimer`
+        unsafe { Self::raw_clock_base(self) }
+    }
+
     /// Forward the timer expiry so it expires at `duration` after `now`.
     ///
     /// This is mainly useful for timer types that can start off providing a mutable reference (e.g.
@@ -200,6 +219,30 @@ pub fn forward(&mut self, now: Instant, duration: Delta) -> u64 {
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
+        // INVARIANT:
+        // - `ptr` is guaranteed to point to a live `struct hrtimer_clock_base` by our safety
+        //   contract.
+        // SAFETY:
+        // - Our data layout is equivalent to said struct via our type invariants.
+        unsafe { &*ptr.cast() }
+    }
+}
+
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
 ///
 /// `Self` must be [`Sync`] because it is passed to timer callbacks in another
@@ -542,6 +585,13 @@ pub(crate) unsafe fn from_raw(timer: *mut HrTimer<T>) -> Self {
         Self(unsafe { NonNull::new_unchecked(timer) }, PhantomData)
     }
 
+    /// Get the [`HrTimerClockBase`] for the [`HrTimer`] associated with this
+    /// [`HrTimerCallbackContext`].
+    pub fn clock_base(&self) -> &HrTimerClockBase {
+        // SAFETY: By our type invariants, `self.0` always points to a valid `HrTimer<T>`.
+        unsafe { HrTimer::<T>::raw_clock_base(self.0.as_ptr()) }
+    }
+
     /// Forward the timer expiry so it expires at `duration` after `now`.
     ///
     /// Note that this does not requeue the timer, it simply updates its expiry value. It returns
-- 
2.48.1

