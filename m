Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E021CC60
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384665; cv=none; b=AY6zj0Bqz3S5QmZlnNzU/MQ80zPCaZn8QIdFQwOJ3M0iPAuuo1zRdDH40H0ZW+SNH3wkxVve39weIcnFSfOBjvu3AvRrlJSL/BYUtNpmC2WwenA3sCyhSKO65J506VK6ViCMW9NypqYrTibHPQBR+fvUcz2zikOezh7R3D6NNzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384665; c=relaxed/simple;
	bh=6e1hGsbiLPn3G4HmRaHrsMbLYS0h5QwozNlUuKFpbrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DIfUGpYwXMPEb9kTMse4e9S0yA9ubdENbvDFYTyfwKicdwrQe2EIOhdr0FL2ajlVcSKXoc1cPB0s/n1dy8huaeNJk0a7tPkqYvLdyoFhOkYI+4OzVr/WRq8QsKmt9scs/+MQGQzrT3CQAvLVHgTaPEblJY6isMcgxdhwIbI9UN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fPvE3pvB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fPvE3pvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748384663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lw6yO6YLVcj9INbokZOavvRu5qL/tSIGes0wbNGIl8I=;
	b=fPvE3pvBf/Vq1FzfNlj88ufuXDFBhg+wwcceYfAUz0fz6HSg/aRokfWzq7yz9SnrcWAXsW
	ycJlifkMZ3J7MrRJbNHTbuGYyJLOSf7MvGjvdKPpipDg85jwJlcaEi673rbDs58MOTgjPO
	gg5flldhxDXGqIFQSwfOt+mBaZoq+6w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-91-n9bDNZKRPoiIyRrWyn67Ug-1; Tue,
 27 May 2025 18:24:17 -0400
X-MC-Unique: n9bDNZKRPoiIyRrWyn67Ug-1
X-Mimecast-MFC-AGG-ID: n9bDNZKRPoiIyRrWyn67Ug_1748384655
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F1A41955D9A;
	Tue, 27 May 2025 22:24:15 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.105])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 81A6F195608D;
	Tue, 27 May 2025 22:24:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [RFC RESEND v10 13/14] rust: sync: lock/global: Add BackendInContext support to GlobalLock
Date: Tue, 27 May 2025 18:21:54 -0400
Message-ID: <20250527222254.565881-14-lyude@redhat.com>
In-Reply-To: <20250527222254.565881-1-lyude@redhat.com>
References: <20250527222254.565881-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Now that we have the ability to provide an explicit lifetime for a
GlobalGuard and an explicit Backend for a GlobalGuard, we can finally
implement lock_with() and try_lock_with().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock/global.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 1678655faae32..108b15f4466f5 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -89,6 +89,34 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, G, G::Backend>> {
             inner: self.inner.try_lock()?,
         })
     }
+
+    /// Lock this global lock with the provided `context`.
+    pub fn lock_with<B>(
+        &'static self,
+        context: <G::Backend as Backend>::Context<'a>,
+    ) -> GlobalGuard<'a, G, B>
+    where
+        G::Backend: Backend<BackendInContext = B>,
+        B: Backend,
+    {
+        GlobalGuard {
+            inner: self.inner.lock_with(context),
+        }
+    }
+
+    /// Try to lock this global lock with the provided `context`.
+    pub fn try_lock_with<B>(
+        &'static self,
+        context: <G::Backend as Backend>::Context<'a>,
+    ) -> Option<GlobalGuard<'a, G, B>>
+    where
+        G::Backend: Backend<BackendInContext = B>,
+        B: Backend,
+    {
+        Some(GlobalGuard {
+            inner: self.inner.try_lock_with(context)?,
+        })
+    }
 }
 
 /// A guard for a [`GlobalLock`].
-- 
2.49.0

