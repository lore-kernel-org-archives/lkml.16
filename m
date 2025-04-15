Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E397C254855
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746675; cv=none; b=DcLcmPKcAjqeTcTPecNDybRj+rS3Ppj8FXN8NXXGlO3Exd1OgipudZO7bZkAtFYfOBdV04a0FWCKFvofCgLf/9CSJM/no2nJGkrghUpIPvGYNzEEQdp9/+YTBuSL6r6TOHjq5uE/2cAzt0Hqr+ImeQkSr5ek+m1wlS/nxM9Mcow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746675; c=relaxed/simple;
	bh=9+ZKX7BMpPCcKPmHdR+Ydn+RWm+AObN4sCEuLcun7UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF3NhJxBvRVQgHLVhMYR7WhvETTJJLPLZ7uZ/UzJbGVQ8QfdWTybL34mh6+L2BGwW8osIbRibgotwm230AGzoGoYLu6Y8NpqX0p2Bei6TBBOPPznB+0EX1o+dIn0pNXptyVj+nSj50GVpaAisg4tZe+/1XpgmyRGQAkbQ5iVCoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YbeLv9t6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YbeLv9t6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744746669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/GUTMQLXiEZ1s45es323+Zi8DveURJQBpjAPFJ/wdxY=;
	b=YbeLv9t6TS4YhMffu+qXqjxJZh+CYRPnAkS0b+NEMAZIOqlq34Tp3SX4jI0vuCbuvnTyZ4
	hXfu44JR+W89YbCQQCNnG2uooW4uqk/ow8CNqSiccUK3VP0aKsWm/LTwsNJOIuuB3ggRZx
	PcOTyy9KZXqlN+srANEK8ZYlLmXr228=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-31-AcTJ1EYZN4632VSEKBAGPQ-1; Tue,
 15 Apr 2025 15:51:03 -0400
X-MC-Unique: AcTJ1EYZN4632VSEKBAGPQ-1
X-Mimecast-MFC-AGG-ID: AcTJ1EYZN4632VSEKBAGPQ_1744746661
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6700D180AF65;
	Tue, 15 Apr 2025 19:51:01 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4FBFB19560AD;
	Tue, 15 Apr 2025 19:50:58 +0000 (UTC)
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
Subject: [PATCH v2 6/8] rust: hrtimer: Add HrTimerClockBase::time()
Date: Tue, 15 Apr 2025 15:48:27 -0400
Message-ID: <20250415195020.413478-7-lyude@redhat.com>
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

This adds a wrapper for the get_time() callback contained within a
hrtimer_clock_base struct. We'll use this in the next commit in order to
implement HrTimerCallbackContext::forward_now().

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Convert from Ktime to Instant
* Don't forget to make HrTimerClockBase::time() pub

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time.rs         |  1 -
 rust/kernel/time/hrtimer.rs | 10 ++++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 545963140f180..a9a29dd80fc28 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -84,7 +84,6 @@ pub(crate) fn as_nanos(self) -> i64 {
         self.inner
     }
 
-    #[expect(unused)]
     #[inline]
     pub(crate) fn from_nanos(nanos: i64) -> Self {
         Self {
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index a56c66104f692..4da1e72e016d1 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -241,6 +241,16 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::hrtimer_clock_base) -> &'a Self {
         // - Our data layout is equivalent to said struct via our type invariants.
         unsafe { &*ptr.cast() }
     }
+
+    /// Retrieve the current time from this [`HrTimerClockBase`].
+    pub fn time(&self) -> Instant {
+        // SAFETY: This callback is initialized to a valid NonNull function for as long as this type
+        // is exposed to users.
+        let get_time_fn = unsafe { (*self.0.get()).get_time.unwrap_unchecked() };
+
+        // SAFETY: This FFI function has no special requirements
+        Instant::from_nanos(unsafe { get_time_fn() })
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
-- 
2.48.1

