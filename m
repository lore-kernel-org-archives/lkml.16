Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CA41F78F3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630105; cv=none; b=hjibLCVtb15ANuEA2V+ijtC+Q1dBdPDm5t1e07fVnJ5PPevtRgJIbWWUaFIq+0E2clSXKXtzR8D96djtfcgSHITyYQCBHdTQ48x0dOIN5lQdwexAreNHfgUZbqRgcAYXewnnQKWcna59CwzcCNle1wb+T6DxLdzLzwq5kYcCCSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630105; c=relaxed/simple;
	bh=Je12764JTUiy+W/iiKjPImD2rYohU2GEdNzf9MOA5Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otl3rGXsuwYlDFg62yFLlyJmKxh7/4UREhqoIh0WUlA0zFluV+wOvMBVoYTUegIBTDbLhG2v1hAYZv6VVtAp9KrVF7ypreJwxtkMsr5LZqFsDXZCF4UvScrvCV4YObprROdHEQFTnWLcRBkogyve7cPMAz/xREeRqoYM0oOgCuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gRHyicqt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gRHyicqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743630103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ysHQ7r1S5oI0I97dPALUJn4xw1ohknTDswpZN4NdyM=;
	b=gRHyicqttZEvuQxLQhc9vrQsYWFgN1rjnKJfSgdCJpczLdfWcWfjAgm03awlQuvmW3ZVK8
	I3nT5sW8476a1W6d1ewDOen9JXiAp8v0BOG31O15sm8zqOYDmmFH5/Ou78CVGh/GFj33OQ
	rcVMUiMjVCKhJcoCx2wiuBJun9tJWSE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-1rOnHx3nMlmKTsPcwMi7QA-1; Wed,
 02 Apr 2025 17:41:40 -0400
X-MC-Unique: 1rOnHx3nMlmKTsPcwMi7QA-1
X-Mimecast-MFC-AGG-ID: 1rOnHx3nMlmKTsPcwMi7QA_1743630098
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0EECC180034D;
	Wed,  2 Apr 2025 21:41:38 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.95])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 820633000704;
	Wed,  2 Apr 2025 21:41:35 +0000 (UTC)
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
Subject: [PATCH 6/6] rust: hrtimer: Add HrTimerCallback::expires()
Date: Wed,  2 Apr 2025 17:40:34 -0400
Message-ID: <20250402214109.653341-7-lyude@redhat.com>
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

This adds the ability to read the expiry time of the current timer from the
HrTimerCallbackContext.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index d52cbb6cfc57f..e28b7895d8f37 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -69,7 +69,7 @@
 
 use super::ClockId;
 use crate::{init::PinInit, prelude::*, time::Ktime, types::Opaque};
-use core::{marker::PhantomData, ptr::NonNull};
+use core::{marker::PhantomData, ptr::{NonNull, addr_of}};
 
 /// A timer backed by a C `struct hrtimer`.
 ///
@@ -131,7 +131,7 @@ unsafe fn raw_get(this: *const Self) -> *mut bindings::hrtimer {
         // SAFETY: The field projection to `timer` does not go out of bounds,
         // because the caller of this function promises that `this` points to an
         // allocation of at least the size of `Self`.
-        unsafe { Opaque::raw_get(core::ptr::addr_of!((*this).timer)) }
+        unsafe { Opaque::raw_get(addr_of!((*this).timer)) }
     }
 
     /// Cancel an initialized and potentially running timer.
@@ -163,6 +163,31 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
         // handled on the C side.
         unsafe { bindings::hrtimer_cancel(c_timer_ptr) != 0 }
     }
+
+    /// Return the time expiry for the given timer pointer.
+    ///
+    /// This value should only be used as a snapshot, as the actual expiry time could change after
+    /// this function is called.
+    ///
+    /// # Safety
+    ///
+    /// `self_ptr` must point to a valid `Self`.
+    unsafe fn raw_expires(self_ptr: *const Self) -> Ktime {
+        // SAFETY: self_ptr points to an allocation of at least `HrTimer` size.
+        let c_timer_ptr = unsafe { HrTimer::raw_get(self_ptr) };
+
+        // SAFETY: There's no actual locking here, a racy read is fine and expected.
+        Ktime::from_raw(unsafe { core::ptr::read(addr_of!((*c_timer_ptr).node.expires)) })
+    }
+
+    /// Return the time expiry for this [`HrTimer`].
+    ///
+    /// This value should only be used as a snapshot, as the actual expiry time could change after
+    /// this function is called.
+    pub fn expires(&self) -> Ktime {
+        // SAFETY: By our type invariants, `self.0` always points to a valid `HrTimer<T>`.
+        unsafe { HrTimer::raw_expires(self) }
+    }
 }
 
 /// The timer base for a specific clock.
-- 
2.48.1

