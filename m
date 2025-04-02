Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F981F7076
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630104; cv=none; b=XQqlLiJ1dM+ZcRrvgvRmXc2Zu/OC5+y08shVpiuAHAV53M+qJ5ejNjzZC/5EimHAGOmDSiHwo3pHCEP0eiy2zacokQM4Kw9ZYDeh4SQVXA06/yuOy8N5HgT/0UoWJyw1d0xyv/aW3UVgk7wQslzqtFjarhxXmBQaiWhtfv0/vJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630104; c=relaxed/simple;
	bh=vShHOWeitIbxplb9p87vnjIjjfuH54NQw+mD4RqzBcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyedYghFnMjgKYnvDtCvBhmWP8n2swkBqketAcFFxMwteSrzohSuRZO+yHlyHYrZzmKz9gIvkbz75HKgtr29XM/zZ14y9rCcl1zPmDaX/x7mEqyn/kD5PCVYIbsqyT3yRl5jDBYLlYVnxRHyzGLyWW+QBtpPffLSTV181jD4BZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSnbfa+1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSnbfa+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743630100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5nfhRkfaRcNmMXeHmWOJewhTgQsNNEyzLVy0F5Lha0=;
	b=MSnbfa+1JsbgICRmUQcAKVmLdkwNoolpwOhahbKrquIRgOXxHMtvOyJ6oqGk9LZnI2K67L
	UTBwP5pgsn2TFTNX35EB6NE5p2bnBSPahJHLF9j6aMBBB4l4hrjyxISZbp/g94So7NyGnT
	5DnnRMwDV41dpRiCCQAZLkn+Ua/B7rg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687--R6tZeW9NKOMopszrX3KMw-1; Wed,
 02 Apr 2025 17:41:34 -0400
X-MC-Unique: -R6tZeW9NKOMopszrX3KMw-1
X-Mimecast-MFC-AGG-ID: -R6tZeW9NKOMopszrX3KMw_1743630092
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B2AC1800263;
	Wed,  2 Apr 2025 21:41:32 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.95])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 35CCA3000704;
	Wed,  2 Apr 2025 21:41:29 +0000 (UTC)
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
Subject: [PATCH 4/6] rust: hrtimer: Add HrTimerClockBase::time()
Date: Wed,  2 Apr 2025 17:40:32 -0400
Message-ID: <20250402214109.653341-5-lyude@redhat.com>
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

This adds a wrapper for the get_time() callback contained within a
hrtimer_clock_base struct. We'll use this in the next commit in order to
implement HrTimerCallbackContext::forward_now().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index f633550882247..521ff1a8a5aa8 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -186,6 +186,16 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::hrtimer_clock_base) -> &'a Self {
         // - Our data layout is equivalent to said struct via our type invariants.
         unsafe { &*ptr.cast() }
     }
+
+    /// Retrieve the current time from this [`HrTimerClockBase`].
+    fn time(&self) -> Ktime {
+        // SAFETY: This callback is initialized to a valid NonNull function for as long as this type
+        // is exposed to users.
+        let get_time_fn = unsafe { (*self.0.get()).get_time.unwrap_unchecked() };
+
+        // SAFETY: This FFI function has no special requirements
+        Ktime::from_raw(unsafe { get_time_fn() })
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
-- 
2.48.1

