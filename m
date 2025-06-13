Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2224628EA72
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749857326; cv=none; b=cTbc5uY9rNlN60hbYCRQ9L7EGq2YpGzyM4uYrTgpYPM0VSuRwSt7DGZzotfBOmD/JQF3Cv+p8Aqa4Or12R1wg3jrFsK6GSJJhR7n3hti+oNNFjPm5OgrrFEvbm0qFe5KwryGFSbr5XZmaLYasQNBzPJgkUPKH4AYG1YR+H4WXbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749857326; c=relaxed/simple;
	bh=l/M1UVzH6GWd3CpAMU3Yz7OGvGlcaM3uAKFWiU0fTLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQcvq1MWq0a/HkoKVrIPL+PL1yABZAYhazrIKWVpwRYqS4WgCCMy2F2sQOSsUOLnL+YNXTRCy7hjXNH+d5O0eYaxmauM4zcyOjiRxzXWIaQzzAgrmvwPf1Qx/QnHc47/Zx48zXVhBpcPZXvXCeSshgt1Zz0pT/NNYeOWDdgdeI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JRLXq+7y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JRLXq+7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749857323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QSufGI8KxAD3MnOJ3Xozd5Wl4+LtdDR1VBG6GTMimng=;
	b=JRLXq+7yVyRw+iq9YjO2U3eEmmKJiF+RS8jyzMfoNoxDOcRDtobsW7XI9lKj3tNjzr3Kfn
	Ox1X0JIFnFISyrvc8H+yghBbFxfcuHZSUjeKz2QM4AetUDbHHtFMOk1BueCKSNTM8RN9rG
	nXV2oDKITbX90NzMP/CEWCE33+Eyk2k=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-aWHPd8MQPk6qTzo0SMQnUA-1; Fri,
 13 Jun 2025 19:28:37 -0400
X-MC-Unique: aWHPd8MQPk6qTzo0SMQnUA-1
X-Mimecast-MFC-AGG-ID: aWHPd8MQPk6qTzo0SMQnUA_1749857315
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 508AE195608D;
	Fri, 13 Jun 2025 23:28:35 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A02218002B5;
	Fri, 13 Jun 2025 23:28:31 +0000 (UTC)
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
Subject: [PATCH v5 6/7] rust: hrtimer: Add HrTimer::raw_cb_time()
Date: Fri, 13 Jun 2025 19:22:27 -0400
Message-ID: <20250613232754.451450-7-lyude@redhat.com>
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

This is a simple private unsafe wrapper for retrieving the current time
according to the hrtimer_clock_base struct for a given timer. This will be
used for implementing functions such as forward_now(), which rely on
retrieving the current time from the hrtimer's clock base.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
- Convert safety comment to invariant comment in from_raw()
- Add raw_clock_base() and implement clock_base() on HrTimer<T> as well

V4:
- Drop HrTimerClockBase entirely, reword commit as this is now about adding
  raw_cb_time()

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time.rs         |  1 -
 rust/kernel/time/hrtimer.rs | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index eed77297d58a6..27ee78070d72e 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -209,7 +209,6 @@ pub(crate) fn into_nanos(self) -> i64 {
     /// # Safety
     ///
     /// The caller promises that `nanos` is in the range from 0 to `KTIME_MAX`.
-    #[expect(unused)]
     #[inline]
     pub(crate) unsafe fn from_nanos(nanos: i64) -> Self {
         debug_assert!(nanos >= 0);
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 4a8416fbd187d..79d86e1099a1e 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -193,6 +193,33 @@ unsafe fn raw_forward(self_ptr: *mut Self, now: HrTimerInstant<T>, interval: Del
         }
     }
 
+    /// Retrieve the current time according to the `struct hrtimer_clock_base` for `self_ptr`.
+    ///
+    /// # Safety
+    ///
+    /// - `self_ptr` must point to a valid `Self`.
+    /// - The caller must ensure that the `hrtimer_clock_base` cannot possibly change in the context
+    ///   this function is being called in. This means either exclusive access to `self_ptr` is
+    ///   required, or we must be from within the timer callback context of `self_ptr`.
+    #[expect(unused)]
+    unsafe fn raw_cb_time(self_ptr: *const Self) -> HrTimerInstant<T>
+    where
+        T: HasHrTimer<T>,
+    {
+        // SAFETY: We're guaranteed `self_ptr` points to a valid `Self` by our safety contract.
+        let clock_base = unsafe { (*Self::raw_get(self_ptr)).base };
+
+        // SAFETY: The C API guarantees that `get_time` is initialized to a valid function pointer
+        // for as long as we expose hrtimers to users.
+        let get_time_fn = unsafe { (*clock_base).get_time.unwrap_unchecked() };
+
+        // SAFETY:
+        // - get_time_fn() returns a ktime_t, so we're guaranteed its return value is between `0`
+        //   and `KTIME_MAX`.
+        // - get_time_fn() itself has no special requirements.
+        unsafe { Instant::from_nanos(get_time_fn()) }
+    }
+
     /// Conditionally forward the timer.
     ///
     /// If the timer expires after `now`, this function does nothing and returns 0. If the timer
-- 
2.49.0

