Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E9E218AC4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384657; cv=none; b=ZR8xnUEmwjjd/yjmjHgnx2cYEF6L/Ci6g3GyLW9IoYkyBS2gUOmTLiemsUIyzbO8FcnJSjWVeGzKDIxm9F6HAkg6OWDIso60z3/VKtKoA5VYv5KRaeFUd120HYU7n3wnl3Z9zeL7CsKKTpaJ1VWJljfcvTXy9mtTsk85LrnNtfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384657; c=relaxed/simple;
	bh=5i9/y+Ape+Gy0HgAXWSjhnnANvLH+9s02jL5ioTrk7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Al/MVa0kjh6Bo/JDNm4mque7tAEzgk7yzSC58TyicBkAtJeaYUvUTgbo0FCHAJWYX1Fa9bWKS3oXnmAAU6ThYBBC++HkKzY+GnPiS/bPSP0VU+IhJbF5B7Y6vmXM7vzJ1+ti3dACQrUbhwCQA94JLlVNXIQ97kB3UihZSY/RLNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OxeK5Z0j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OxeK5Z0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748384654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/5YUrPV3C5m+tws2LG2mHT3fyexUVeYO2Q1tZ+A/II=;
	b=OxeK5Z0jSdGWZY5Onf2c8M+Ckc/7mHds3JKvlG+ycdEG5EGrcG2x+FSP+IGQX5n+7r14dk
	9rMnSNEwcPYM1wd0IVULl0+lQUtfdxBKQnfaq6G1eSAeeuAUiqhwEve8+hRrrXFv+OF+Zw
	TNwqLdCkEoH0INl2az0CBKczMVi3rc4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-WxQV3eXDMOS7V0Q5Z6VzUg-1; Tue,
 27 May 2025 18:24:11 -0400
X-MC-Unique: WxQV3eXDMOS7V0Q5Z6VzUg-1
X-Mimecast-MFC-AGG-ID: WxQV3eXDMOS7V0Q5Z6VzUg_1748384647
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35CC219560AA;
	Tue, 27 May 2025 22:24:07 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.105])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB33C19560AA;
	Tue, 27 May 2025 22:24:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: [RFC RESEND v10 11/14] rust: sync: Expose lock::Backend
Date: Tue, 27 May 2025 18:21:52 -0400
Message-ID: <20250527222254.565881-12-lyude@redhat.com>
In-Reply-To: <20250527222254.565881-1-lyude@redhat.com>
References: <20250527222254.565881-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Due to the addition of sync::lock::Backend::Context, lock guards can be
returned with a different Backend than their respective lock. Since we'll
be adding a trait bound for Backend to GlobalGuard in order to support
this, users will need to be able to directly refer to Backend so that they
can use it in trait bounds.

So, let's make this easier for users and expose Backend in sync.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 07e83992490d5..0d9c3353c8d69 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -23,6 +23,7 @@
 pub use lock::spinlock::{
     new_spinlock, new_spinlock_irq, SpinLock, SpinLockGuard, SpinLockIrq, SpinLockIrqGuard,
 };
+pub use lock::Backend;
 pub use locked_by::LockedBy;
 
 /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
-- 
2.49.0

