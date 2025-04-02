Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8791F4628
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630091; cv=none; b=W4aXmo3Qb7+XVRYZmzBaDEY/hSyILX8g0sebKpI5Rwj8Ak8rPDfd5fj5FZmxSgMw5lsvOR9mvbvmPtydycHyQwUZ2kk1f8OW+D0RMrcRaBKHe5Hnxq0RJEPmC340uRn9B0jiIXa49Beab2etBvu1v44QCcDEVnABZ8shjp1Aw2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630091; c=relaxed/simple;
	bh=9webYGdM454gxtHw9y7UrGofp4nqbdgFdzB3cD24yeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9BzurXp8ViramNa4kVCCw5qrAkIlWlRIA9nEncH5ErL4yYnzmMtRdPIjd/5ww6KHO69EbVL2Pg9Ln4zAgqR/HpTc149+5y0DKdO3GtZVw2W8zCQRApXjK6TNaEOEzMgPy0oxWOcz/LD6zrGboHrkWVCNFIBHQCOGir4tV0njZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJR/t8ZV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJR/t8ZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743630088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3S6L929NhUPmTnaNjv1n/DKXagAZ0HAL3Zw31NDUF20=;
	b=iJR/t8ZVYvT66XdSKjJqrRsqu59oWgNwfXQI216MhZw5ujVsnRrBdAVCb8F2bbP7U9l7EM
	Ggjstt+sIsS67AMBtSVliJ2nsIku1usSh5Xvy31OiTRbjraXYH9uD4JVdXW7Tk7vwCRyfT
	cuLQX9zlDQTXNd953JSYx7T+PdlYfgo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-mcQub3grOKWXvSpXfTPCdg-1; Wed,
 02 Apr 2025 17:41:23 -0400
X-MC-Unique: mcQub3grOKWXvSpXfTPCdg-1
X-Mimecast-MFC-AGG-ID: mcQub3grOKWXvSpXfTPCdg_1743630081
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7EB2C195608B;
	Wed,  2 Apr 2025 21:41:21 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.95])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABB1D3000704;
	Wed,  2 Apr 2025 21:41:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 1/6] rust: time: Add Ktime::from_ns()
Date: Wed,  2 Apr 2025 17:40:29 -0400
Message-ID: <20250402214109.653341-2-lyude@redhat.com>
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

A simple function to turn the provided value in nanoseconds into a Ktime
value. We allow any type which implements Into<bindings::ktime_t>, which
resolves to Into<i64>.

This is useful for some of the older DRM APIs that never got moved to
Ktime.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index f509cb0eb71e0..c05afda07a05f 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -1,5 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
-
+// SPDX-License-Identifier: GPL-2.0 
 //! Time related primitives.
 //!
 //! This module contains the kernel APIs related to time and timers that
@@ -9,6 +8,7 @@
 //! C header: [`include/linux/ktime.h`](srctree/include/linux/ktime.h).
 
 pub mod hrtimer;
+use core::convert::Into;
 
 /// The number of nanoseconds per millisecond.
 pub const NSEC_PER_MSEC: i64 = bindings::NSEC_PER_MSEC as i64;
@@ -65,6 +65,12 @@ pub fn to_ns(self) -> i64 {
     pub fn to_ms(self) -> i64 {
         self.divns_constant::<NSEC_PER_MSEC>()
     }
+
+    /// Creates a new Ktime from the given duration in nanoseconds.
+    #[inline]
+    pub fn from_nanos(ns: impl Into<bindings::ktime_t>) -> Self {
+        Self { inner: ns.into() }
+    }
 }
 
 /// Returns the number of milliseconds between two ktimes.
-- 
2.48.1

