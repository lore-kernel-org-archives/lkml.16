Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F64A2741CF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963319; cv=none; b=WVH/lYMT2nw4PVoZaMEcY4Gk/kT9byMuzXfRRphRzHN5ZptslbOT6YO+bgXCtipzDzYn5fA1jSWMV6WweTTyozcfUCNoWPseIIvVVFWC/o/+jdyXnnZJrfQskOvdUCfU2Dhbrck366pwti6S8q3xXeZHDA/QYb75UqwoRJncGgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963319; c=relaxed/simple;
	bh=LxDKiZxsWVn3MCgks6lAPdndhGyh67qFf+XcSfWRWnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ajHr7OBWbNpxKrqa7JWe7jqysIghHVhsJbx3Us4rZdDzbTv+vXiO6WWiLkh0CTwesGzzjz2mhtcUBrSR3a8au/NAYxW5+vXEq3570NceLyfom4dOD9H6V+xFuWIphndPYJfN/CYZRfUXTj0ji0UhALabzrmK+lV41RNCReCA7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iCoCvNYe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iCoCvNYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745963317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YSxKqBS0jBP5OLr/ybCVe+hncFTUSwMxnhYHJYY0f+c=;
	b=iCoCvNYeFvpal7j29olxwF8EgpCJiMOFbRH301v+trGm/E77oCFvh/KOtn5kwL9TF3JCgj
	d1ROHtHsrbJ79kUS+1r2H09oBFeY22Bw3av5rd7zDM2ypWombLf7vo4hzuPEFdDQdYJ9uH
	xzoL0+T79wc6dcxHLTkm5tt1fU2owgw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-323--EvGlmiQPZqq6ziMAosMNw-1; Tue,
 29 Apr 2025 17:48:33 -0400
X-MC-Unique: -EvGlmiQPZqq6ziMAosMNw-1
X-Mimecast-MFC-AGG-ID: -EvGlmiQPZqq6ziMAosMNw_1745963311
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8728A18004A7;
	Tue, 29 Apr 2025 21:48:31 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0BAC319560A3;
	Tue, 29 Apr 2025 21:48:28 +0000 (UTC)
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
Subject: [PATCH v4 7/7] rust: hrtimer: Add HrTimer::expires()
Date: Tue, 29 Apr 2025 17:44:43 -0400
Message-ID: <20250429214752.1637859-8-lyude@redhat.com>
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

This adds the ability to read the expiry time of the given timer.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Convert from Ktime to Instant
* Use read_volatile instead of read and add a FIXME

V4:
* Correct read_volatile comment in HrTimer::expires()

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 0d93866d7b20a..5b508ff81aee2 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -73,7 +73,10 @@
     time::{Delta, Instant},
     types::Opaque,
 };
-use core::{marker::PhantomData, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    ptr::{addr_of, NonNull},
+};
 use pin_init::PinInit;
 
 /// A timer backed by a C `struct hrtimer`.
@@ -136,7 +139,7 @@ unsafe fn raw_get(this: *const Self) -> *mut bindings::hrtimer {
         // SAFETY: The field projection to `timer` does not go out of bounds,
         // because the caller of this function promises that `this` points to an
         // allocation of at least the size of `Self`.
-        unsafe { Opaque::raw_get(core::ptr::addr_of!((*this).timer)) }
+        unsafe { Opaque::raw_get(addr_of!((*this).timer)) }
     }
 
     /// Cancel an initialized and potentially running timer.
@@ -241,6 +244,26 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64 {
 
         self.forward(now, interval)
     }
+
+    /// Return the time expiry for this [`HrTimer`].
+    ///
+    /// This value should only be used as a snapshot, as the actual expiry time could change after
+    /// this function is called.
+    pub fn expires(&self) -> Instant {
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
+                core::ptr::read_volatile(addr_of!((*c_timer_ptr).node.expires)),
+            )
+        }
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
-- 
2.48.1

