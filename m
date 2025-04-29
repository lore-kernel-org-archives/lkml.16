Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABA7264609
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963312; cv=none; b=l+9sPYbTd1SB91iEsTH0rpUVBP2DylSo0pZfTiaX/dAwlcoav8Z5NWMFYmyOXb8llPS6pIZXC8l4scE5vfY1oxKXCI5uV4vj3CaXV1/4qeM265ydJUhspK1rPwpr8zBrUY0Hu1bg0F6n1if/bK5OY19sBdMP7j+g0XMUDczEgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963312; c=relaxed/simple;
	bh=VVGfYvtNB+DqgQn8Dz0h8wpBYiXA/auxzT7EcUd/bLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItX7lHqjJEdu14vO8llMCaaipJHiK110+gIAOLmM6zhT8Eyq22THASUkFMunmYjvna4fNzqJ/CEBn/PZHkpeLGl0J6AWEZc1yo2uJPBib6RZVEhSbdFaw9Y/MNMv5Dsq9XQxlNZ/CCOa9UQVLrpwJUSqSYgyKrzcoNLPanH6VU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fPvdU812; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fPvdU812"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745963309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mwV+qgsVrBGX1S4J98iXiHKoHWOuHRCS7QjqtlcZ2iU=;
	b=fPvdU812xIN852nmaMg+b9YsdBTufuvfQzFTLiAYdonyEx/5BsZF6ZUTrQ45Pce6YBgGxD
	7NGgenA0bMQtptbzRP32gJoiMmVbt/sObTKmmpfd4+EMPeiBFGh8gcSnDQ4IdLhXWGt4Ug
	KtaqkqNKaFkA3uuKiA0wjSwTsNpYWqg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-oag8ADNhP-OVvQTBsXqM5A-1; Tue,
 29 Apr 2025 17:48:25 -0400
X-MC-Unique: oag8ADNhP-OVvQTBsXqM5A-1
X-Mimecast-MFC-AGG-ID: oag8ADNhP-OVvQTBsXqM5A_1745963303
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D19BA1800374;
	Tue, 29 Apr 2025 21:48:22 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 322C819560AF;
	Tue, 29 Apr 2025 21:48:20 +0000 (UTC)
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
Subject: [PATCH v4 4/7] rust: time: Add Instant::from_nanos()
Date: Tue, 29 Apr 2025 17:44:40 -0400
Message-ID: <20250429214752.1637859-5-lyude@redhat.com>
In-Reply-To: <20250429214752.1637859-1-lyude@redhat.com>
References: <20250429214752.1637859-1-lyude@redhat.com>
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
V4:
* Turn from_nanos() into an unsafe function in order to ensure that we
  uphold the invariants of Instant

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 8d6aa88724ad8..6dcb65ed954db 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -83,6 +83,21 @@ pub fn elapsed(&self) -> Delta {
     pub(crate) fn as_nanos(self) -> i64 {
         self.inner
     }
+
+    /// Create an `Instant` from a time duration specified in nano seconds.
+    ///
+    /// # Safety
+    ///
+    /// The caller promises that `nanos` is in the range from 0 to `KTIME_MAX`.
+    #[expect(unused)]
+    #[inline]
+    pub(crate) unsafe fn from_nanos(nanos: i64) -> Self {
+        // INVARIANT: Our safety contract ensures that `nanos` is in the range from 0 to
+        // `KTIME_MAX`.
+        Self {
+            inner: nanos as bindings::ktime_t,
+        }
+    }
 }
 
 impl core::ops::Sub for Instant {
-- 
2.48.1

