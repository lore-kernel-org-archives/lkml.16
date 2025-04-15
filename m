Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738F3253B7B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746686; cv=none; b=f7ayNvxwxrEanqtt/pvMf0SrMJ3RzdK518mh9MXK0Q/1OOXUU6pbfRSXWUu8Gqu4BlZNNZ0sdB8Xc5lQxSs6LQWDKRtmglupy9Q73u137uqLk9Eu+eC4Trb3aRM4be/IQtahTiQas7bK1PDrTBkxjbLRa9ZvRVvd0UUQ0zHgZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746686; c=relaxed/simple;
	bh=0G1KuodMEyIcRnZKJ6Q+rj4XT5an2oMOznfG5sLkrtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtJeHU8sWqemyc6+/APyYZT76EcoZyWmGj6Q9c655D8mx55VcZSRo3giMjwgnc9YaLZ4+/02eD40FdBKdjEo0AZvPuqsUdw/8BLQqA2sJjW6qXL7Gy1tYetKkedSrtoNdJaj8/pEEVbainZm7CJTh+Yx6+WRxd/EB/etixoY2ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jE3ytDZD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jE3ytDZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744746679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tjk0+slSv3zs0lqjn04tupz+JEYT+G9QQhKT2WLYntg=;
	b=jE3ytDZDDJ29JJOLW3eacqQ9vrCin311gQ3y+nc+g6O0hMclOT5GvlhObPp8/WUtIGQcT8
	44WseUlIA40x1SREdyfWCeKwBOrCyI4tBg/0uPj29KnuAVX445U7pAah6o6fU7X5a6XnkY
	SQu+7jiv7JgA4jJrn+d7DGDnuZwExpE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-274-CJhbr3v-Os-jgdMOWyh6JA-1; Tue,
 15 Apr 2025 15:51:11 -0400
X-MC-Unique: CJhbr3v-Os-jgdMOWyh6JA-1
X-Mimecast-MFC-AGG-ID: CJhbr3v-Os-jgdMOWyh6JA_1744746665
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E1A2419560B0;
	Tue, 15 Apr 2025 19:51:04 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C60AD1955BF6;
	Tue, 15 Apr 2025 19:51:01 +0000 (UTC)
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
Subject: [PATCH v2 7/8] rust: hrtimer: Add forward_now() to HrTimer and HrTimerCallbackContext
Date: Tue, 15 Apr 2025 15:48:28 -0400
Message-ID: <20250415195020.413478-8-lyude@redhat.com>
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

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 4da1e72e016d1..c84dcdacb4882 100644
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
+    /// Forward the time expiry so it expires after now.
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

