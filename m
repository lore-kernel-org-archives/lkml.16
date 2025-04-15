Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9FE2528E5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746669; cv=none; b=GFMTWwwAkHx0QQD1kdjPGOCgmbDUhN8fbf+gzGoNeIKTigLYFdnIa4/MmF5XFoMZepSCxawk9U62dnNchH2wqrTerK2ol2DzYEA1cyyqTjm9b5DGMBTdLxeKjnF/ZYAlwDQZespi+kSXBtOMLqUMbV/ewkYFGh9fQzcmOnwoeWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746669; c=relaxed/simple;
	bh=q+rFCQn/nCK6GK8pRaSsYmHQsuaeaGNABm4AEBpwNhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=febHnZkWs/1V+fHRk/PW2Tqee4/BDKgikVDBz0XCF12JOe3YjrIS/dBuyipE6c3YR3305Yu9mC6kZDvdVcLs9uO1Isc03HEu7ZJyWKFMsmLIzPAVFm7tnawxh5/+IKDh5C903oTXNVW8EptSRFJdOtljVzFeHb2QI4leF+0FvRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wos2R0of; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wos2R0of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744746664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rP0tcaBZdVdRNJOSEcl9UgtJffLuvgd7dyVPPNDPWv8=;
	b=Wos2R0ofZE8NqzPIPVdxpbd8O4QWZt3lBe4Fm3vL/l9ttB5jXC9kV9ONM9b8OPU6Jtv0ne
	ZAPCzPiSPf6Tax7HSyW2L/SytgwkUbH2Mm5kDgj5xZww+Bzi17R2sOuJuH18Lk2N7e4OOZ
	/u9zh0n1Pab/xA1IyeXzo6U5vToH0Sk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-SmHKAeNsOGmnD6GcoUFbAg-1; Tue,
 15 Apr 2025 15:51:00 -0400
X-MC-Unique: SmHKAeNsOGmnD6GcoUFbAg-1
X-Mimecast-MFC-AGG-ID: SmHKAeNsOGmnD6GcoUFbAg_1744746658
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D8ACB1955DDD;
	Tue, 15 Apr 2025 19:50:57 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 18CD41955BEF;
	Tue, 15 Apr 2025 19:50:53 +0000 (UTC)
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
Subject: [PATCH v2 5/8] rust: time: Add Instant::from_nanos()
Date: Tue, 15 Apr 2025 15:48:26 -0400
Message-ID: <20250415195020.413478-6-lyude@redhat.com>
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

For implementing Rust bindings which can return a point in time.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 8d6aa88724ad8..545963140f180 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -83,6 +83,14 @@ pub fn elapsed(&self) -> Delta {
     pub(crate) fn as_nanos(self) -> i64 {
         self.inner
     }
+
+    #[expect(unused)]
+    #[inline]
+    pub(crate) fn from_nanos(nanos: i64) -> Self {
+        Self {
+            inner: nanos as bindings::ktime_t,
+        }
+    }
 }
 
 impl core::ops::Sub for Instant {
-- 
2.48.1

