Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8584D270ED5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963314; cv=none; b=rhaeyu4nVuZwCxNM4hG3iKuYiPNHbQbSlPMXLRDx8AFu9FSZBPfnMPu+Hz5CYYyK89G1sgynNnxUiYBPEgqTRptwjVs1l2EUsO1P43X2rNVGYY8M4MdwYJRlEyhloNkM8cIyyC0KDFKAvAF2xPzBSHXGaWuQcmunozMVRTrexaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963314; c=relaxed/simple;
	bh=boKpxPdq27k+oAkg/UOCG61wHmXN1RDEa6N4ZOXYkiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u932NUGdvlzjcRqAyrJd7LY79W0tCiRTcrhs+wqO+WU5IRVCnsDPnjHNdXQgoN0skGBjkaGWmdWA+pNvXw0j1IpgMWt81/geiPcl29R/KVKAYNzJacUXR8+iuLD41ysRYccd6ZNYFmH/QRO14sn/d/OPXxzgm98wae8HDUQWcT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rh9U8Hfn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rh9U8Hfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745963311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjTGTxy+2mRzzCLysTJFKthKDEummASAP6ilEo9uHW4=;
	b=Rh9U8HfnK6Mosq1PeV2S1gQrgAZpaxw+AzritIZhrMWNmGwResWcNdZk9lDHE4Gb1HqJ8I
	GeL2rZXRGYP0Vd5ICxeilWM+cx8OnfqlqcpBGn0lgRwyZZCTx867kQoVLJWSB0TK3ihBNx
	F+py4rC6kjLXbp0DBtMHq5YbD0RkC4A=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-o_h5bBUeMHKJ2lHmDLkK6w-1; Tue,
 29 Apr 2025 17:48:28 -0400
X-MC-Unique: o_h5bBUeMHKJ2lHmDLkK6w-1
X-Mimecast-MFC-AGG-ID: o_h5bBUeMHKJ2lHmDLkK6w_1745963305
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA1F81800370;
	Tue, 29 Apr 2025 21:48:25 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3EE8119560A3;
	Tue, 29 Apr 2025 21:48:23 +0000 (UTC)
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
Subject: [PATCH v4 5/7] rust: hrtimer: Add HrTimer::raw_cb_time()
Date: Tue, 29 Apr 2025 17:44:41 -0400
Message-ID: <20250429214752.1637859-6-lyude@redhat.com>
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
 rust/kernel/time/hrtimer.rs | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6dcb65ed954db..ce6a991ce7583 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -89,7 +89,6 @@ pub(crate) fn as_nanos(self) -> i64 {
     /// # Safety
     ///
     /// The caller promises that `nanos` is in the range from 0 to `KTIME_MAX`.
-    #[expect(unused)]
     #[inline]
     pub(crate) unsafe fn from_nanos(nanos: i64) -> Self {
         // INVARIANT: Our safety contract ensures that `nanos` is in the range from 0 to
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index b0304b2cf2da9..80270e14daafd 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -186,6 +186,30 @@ unsafe fn raw_forward(self_ptr: *mut Self, now: Instant, interval: Delta) -> u64
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
+    unsafe fn raw_cb_time(self_ptr: *const Self) -> Instant {
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
2.48.1

