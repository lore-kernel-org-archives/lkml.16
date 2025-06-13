Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B228F514
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749857320; cv=none; b=dNzooOyJ/TMFcbSlx+r2Plh6mu8Q2WWVz2g01pbK1Pe/vEYBK5v66pPMXaUqEnE2sD1kTin55yE2DwE6Jd0xZt5TSfZkxaM6xOm0L/85X2uwXliSVp/uxfLmYJx0CYQuliWtJBxHMrbS0yHD9d0EiO7j0bhYimc7qLGMHmu3bpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749857320; c=relaxed/simple;
	bh=7RUxsgkmSiqHONpj1nEJ1Gf1e7ZN0xexa4L73K0zYI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aioDDAKA1aR4RPoFwveAvG180CxZKwb5tf4osbLoAnxWD48544S3ABcAhHqEDh9pB0Os53mPU7/zrJZu3NUsiE6fi/UxEXceKoj0tlzz7YY6WVGUrkG9z8TDkvcJz3ZbCjPk0MNEKK7qrQOskqygG801mhZVo6rVdTEUxPW7xsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pfzz9A64; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pfzz9A64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749857317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FrTmBS+IzXJqE+9OXrlq6wyWinCr33fBbb4V8i19iNU=;
	b=Pfzz9A64FDTH3Nt7AhHvO1pc8B61QXQ09HKqeP7HnOGyU29qVI5pl5u2CxR7E08F1d8PK8
	MxqD88TMxiEM0zLG5CPRiZBEfFleJajoQ31YU2BV+O3dl6SFGBfYpWqkszaQNIH77fgLd0
	j2MLpVYCeNznR06r/IvceYj0GCaZk1c=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-yhNBggBvNGSlVt-iwUNSyQ-1; Fri,
 13 Jun 2025 19:28:34 -0400
X-MC-Unique: yhNBggBvNGSlVt-iwUNSyQ-1
X-Mimecast-MFC-AGG-ID: yhNBggBvNGSlVt-iwUNSyQ_1749857311
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F5C719560AA;
	Fri, 13 Jun 2025 23:28:31 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7FA13180035C;
	Fri, 13 Jun 2025 23:28:28 +0000 (UTC)
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
Subject: [PATCH v5 5/7] rust: time: Add Instant::from_nanos()
Date: Fri, 13 Jun 2025 19:22:26 -0400
Message-ID: <20250613232754.451450-6-lyude@redhat.com>
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

For implementing Rust bindings which can return a point in time.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V4:
* Turn from_nanos() into an unsafe function in order to ensure that we
  uphold the invariants of Instant
V5:
* Add debug_assert!() to from_nanos

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 70bd3be0facc0..eed77297d58a6 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -199,6 +199,28 @@ pub fn elapsed(&self) -> Delta {
     pub(crate) fn into_nanos(self) -> i64 {
         self.inner
     }
+
+    /// Create an [`Instant`] from a time duration specified in nano seconds.
+    ///
+    /// # Panics
+    ///
+    /// On debug builds, this function will panic if `nanos` violates our safety contract.
+    ///
+    /// # Safety
+    ///
+    /// The caller promises that `nanos` is in the range from 0 to `KTIME_MAX`.
+    #[expect(unused)]
+    #[inline]
+    pub(crate) unsafe fn from_nanos(nanos: i64) -> Self {
+        debug_assert!(nanos >= 0);
+
+        // INVARIANT: Our safety contract ensures that `nanos` is in the range from 0 to
+        // `KTIME_MAX`.
+        Self {
+            inner: nanos as bindings::ktime_t,
+            _c: PhantomData,
+        }
+    }
 }
 
 impl<C: ClockSource> core::ops::Sub for Instant<C> {
-- 
2.49.0

