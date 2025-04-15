Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD6F25178B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746684; cv=none; b=SDcw7TBC25I/W4F/cbG+GkL/PYi23SjNKAJ5NXzWJuAUNDxySW9lXDEAbOeFGtlUKn2EnEXB9fB8+foFuAJoree4wB18URJuEQXyEnhunLhmtH/+yiTOwUdHllArbgUhnjFMpzYG8N7lzl5aJbWhIE+zUDhlXHRyUKoX/qqScGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746684; c=relaxed/simple;
	bh=eQ+r648TrWpuEgvULfWc7sb7QOPoBlGuqKdN3eqAVsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhfUJWgXe2l2rxrVwnneMDMq2qEaTr3XYkATo72eft3T6Si9pKLknkgn8iw4TS0zGOHGolhhrsgrHTN752HVPz3g9fvhEmug7VjDui5wabQaE0kvNKQeoG9PcXEmqIhUR48+LOUf7KscnRzCiqG6IDcZYJBKNMxZr7ngskDeUik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Im1u0Yib; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Im1u0Yib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744746679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6lTDNYrXkRzbCWl+8hVKAKf9CSfOeUD8xTgHV59ocoE=;
	b=Im1u0YibVqjQmD9zlw5gDjI+s5Q2BNp2CvRCSqB50xuNfhbjfBZkgRqrYrJXaezQe6FsZ7
	FYvohw8hDcf27ZlG1dQXU7zUXILgAsGt01GI4XG/PCfyC/qz22O86R7DBSmEtoakupMcEN
	bcJzFV7XyNB+6uI7OYr8LnnrnppO1oc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-2N7zl2tZMw-0O1P2LZCdTw-1; Tue,
 15 Apr 2025 15:51:14 -0400
X-MC-Unique: 2N7zl2tZMw-0O1P2LZCdTw-1
X-Mimecast-MFC-AGG-ID: 2N7zl2tZMw-0O1P2LZCdTw_1744746668
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 69BB31956059;
	Tue, 15 Apr 2025 19:51:08 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4AFDF1955BEF;
	Tue, 15 Apr 2025 19:51:05 +0000 (UTC)
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
Subject: [PATCH v2 8/8] rust: hrtimer: Add HrTimer::expires()
Date: Tue, 15 Apr 2025 15:48:29 -0400
Message-ID: <20250415195020.413478-9-lyude@redhat.com>
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

This adds the ability to read the expiry time of the given timer.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Convert from Ktime to Instant
* Use read_volatile instead of read and add a FIXME

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index c84dcdacb4882..b8a74c15e6609 100644
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
@@ -225,6 +228,21 @@ pub fn forward(&mut self, now: Instant, duration: Delta) -> u64 {
     pub fn forward_now(&mut self, duration: Delta) -> u64 {
         self.forward(self.clock_base().time(), duration)
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
+        // SAFETY: There's no actual locking here, a racy read is fine and expected.
+        Instant::from_nanos(unsafe {
+            // FIXME: read_volatile
+            core::ptr::read_volatile(addr_of!((*c_timer_ptr).node.expires))
+        })
+    }
 }
 
 /// The timer base for a specific clock.
-- 
2.48.1

