Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDBE23F296
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748286; cv=none; b=Zzij3Oz7TmaQu0WMQhDa/1w/1VZIuq+ansY6xvhdPITLFWO7BZe9AOsdDQnj89/SuHJeQJeDcj2rgZNl6PhraEaOJriIXyiKR03pkks4itIgBiXWXKZ3M+7We7D3YQRuXgYdk+FJFADLYCYvsrGqJyrMZVClSY/mV9ZbpGxXXpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748286; c=relaxed/simple;
	bh=FP1FoUwUzOb0EuId7zPJ6/XrjkXt/QC/ppUHzdxy544=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQhH2HOBfI3WeiIEPR8UjMF5/unId1Vx8Ey9eznDYLksxsA3RYFUzYrxuSP3ggBKGwvThc8KctA9fmf/ZLm73ZaNqHiiqXbMbVBq4UKPx04iJ9l6kdz8UDhkPD4Ocm5/+BR+n45kon0sidw4sv2lHT0ELq8tOeIY2fj9WFVE1QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nf0e9o6y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nf0e9o6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744748282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+zbNO9DdlGnJdtWrarPxZhGqIU9VsFB36g+B/ftd/RY=;
	b=Nf0e9o6ymo0G1PrOH/hTQ4IXPyvO1rLFvIPm8YCh5kAtiF+Prbbvpy04tQN9kshoBOjzkK
	CcisXj5RHKNaybLtBtZfpwJ9XpS9D/masoFcad9P+Wf3XP0Ezesp3nptQKIE+JCCXNeTQB
	QU3edfXQpuyXk1VPIJZtKw0DkOCKUQA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-418-fsLLwmjLP6uXpvyTvsNQVg-1; Tue,
 15 Apr 2025 16:18:00 -0400
X-MC-Unique: fsLLwmjLP6uXpvyTvsNQVg-1
X-Mimecast-MFC-AGG-ID: fsLLwmjLP6uXpvyTvsNQVg_1744748278
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25A2E1800361;
	Tue, 15 Apr 2025 20:17:58 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F26051955BC0;
	Tue, 15 Apr 2025 20:17:53 +0000 (UTC)
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
Subject: [PATCH v3] rust: hrtimer: Add forward_now() to HrTimer and HrTimerCallbackContext
Date: Tue, 15 Apr 2025 16:17:46 -0400
Message-ID: <20250415201747.417825-1-lyude@redhat.com>
In-Reply-To: <20250415195020.413478-8-lyude@redhat.com>
References: <20250415195020.413478-8-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Using the HrTimerClockBase::time() function, we can now add an equivalent
to hrtimer_forward_now() to both HrTimer and HrTimerCallbackContext.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Change from Ktime to Delta
* Make sure that forward_now() takes a mutable reference to the timer
  struct
* Reword this to point out that we're adding forward_now() to both callback
  context and mutable timer reference
* Rename interval to duration
V3:
* Fix rust documentation for HrTimerCallbackContext (forgot to update both
  forward_now() declarations)

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 4da1e72e016d1..ec7800ac20616 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -217,6 +217,14 @@ pub fn forward(&mut self, now: Instant, duration: Delta) -> u64 {
         //   timer callback context - fulfilling the requirements of the C API.
         unsafe { Self::raw_forward(self, now, duration) }
     }
+
+    /// Forward the time expiry so it expires at `duration` after the current time.
+    ///
+    /// This is a variant of [`forward`](Self::forward) that uses a duration after the current time
+    /// of the [`HrTimerClockBase`] for this [`HrTimerCallbackContext`].
+    pub fn forward_now(&mut self, duration: Delta) -> u64 {
+        self.forward(self.clock_base().time(), duration)
+    }
 }
 
 /// The timer base for a specific clock.
@@ -612,6 +620,14 @@ pub fn forward(&mut self, now: Instant, duration: Delta) -> u64 {
         // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`
         unsafe { HrTimer::<T>::raw_forward(self.0.as_ptr(), now, duration) }
     }
+
+    /// Forward the timer expiry so it expires at `duration` after the current time.
+    ///
+    /// This is a variant of [`HrTimerCallbackContext::forward()`] that uses an interval after the
+    /// current time of the [`HrTimerClockBase`] for this [`HrTimerCallbackContext`].
+    pub fn forward_now(&mut self, duration: Delta) -> u64 {
+        self.forward(self.clock_base().time(), duration)
+    }
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.
-- 
2.48.1

