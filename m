Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683441F5822
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630100; cv=none; b=hy8VFh7Vge9axxOzu00Nu3jtTp1Y0WlTqSwX6/oggLlqTtMLRQ11MgFAaYZsWf0jgmgQuSOecDCMEOA4rmE33R7VYQniAf2IwAthE1EOJ+0mkh5Zt4cotylXmLjNG1dQv/o3YA+OogpGTPbzSyfD9vh8JF/BED6gxg2JDtdv0eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630100; c=relaxed/simple;
	bh=kjwxKKeg1TEWoo7nt7NYEf0BLypObdO0+HBpB+tBaNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2d/B7itnm4er0dmUoODkFA/lnneA0PNAT3+MtrZLs6j2mcmjcseX+fRHioqRrNRD67VYCIqz63B710QFNFatNzOq6eylim2we6AGrvktua1UNyltBbvO+iWITWGIW6Ft8/3sFy88z/Rt8mrSg/bz3fZZzp3Ub0DJzehYLN4v1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h6qicbaV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h6qicbaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743630098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06MxKlOuB9aN0H2BLYnRnaIFm5vG7GdNp+2sASqjqO8=;
	b=h6qicbaVIj8cuBrEL1JtXmTaPHfbz02RbyqaeGJtPdOGSss9/ME4HNYF0QgFBGaYRPGI2P
	8ZoW+lt3HFm6v+eNOSB+NJS2ACjniqv8MUnEsd6FGOCWG/nOLGxomrhzwnqzkSTEhnQDEm
	FUbyRN7MCQCht7+CX/P94T8sNhCW8D8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-Dmkyiqd-PNKpq4uS5lrgsw-1; Wed,
 02 Apr 2025 17:41:37 -0400
X-MC-Unique: Dmkyiqd-PNKpq4uS5lrgsw-1
X-Mimecast-MFC-AGG-ID: Dmkyiqd-PNKpq4uS5lrgsw_1743630095
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 405581955BC5;
	Wed,  2 Apr 2025 21:41:35 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.95])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 884BA3000704;
	Wed,  2 Apr 2025 21:41:32 +0000 (UTC)
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
Subject: [PATCH 5/6] rust: hrtimer: Add HrTimerCallbackContext::forward_now()
Date: Wed,  2 Apr 2025 17:40:33 -0400
Message-ID: <20250402214109.653341-6-lyude@redhat.com>
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

Using the HrTimerClockBase::time() function we just added, add a binding
for hrtimer_forward_now().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 521ff1a8a5aa8..d52cbb6cfc57f 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -556,6 +556,14 @@ pub fn forward(&self, now: Ktime, interval: Ktime) -> u64 {
         // SAFETY: The C API requirements for this function are fulfilled by our type invariants.
         unsafe { bindings::hrtimer_forward(self.raw_get_timer(), now.to_ns(), interval.to_ns()) }
     }
+
+    /// Forward the time expiry so it expires after now.
+    ///
+    /// This is a variant of [`HrTimerCallbackContext::forward()`] that uses an interval after the
+    /// current time of the [`HrTimerClockBase`] for this [`HrTimerCallbackContext`].
+    pub fn forward_now(&self, interval: Ktime) -> u64 {
+        self.forward(self.clock_base().time(), interval)
+    }
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.
-- 
2.48.1

