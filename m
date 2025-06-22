Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C98BA34;
	Sun, 22 Jun 2025 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750597136; cv=none; b=c1MxA2fyIPY/6d/vajfzupoyi30dieOI7AgJ1G1Kt21eNLA+J5gr1QOwFBaLLawmHtan6bhdKFkrVLS0gHl5PbDlC4XG9eSaUTt/p2y8C8Pt5oNwki2eiSodwF6SoE9PYiSvyQr5qbv6XAode5hTksVaaUoak38MQkBmJqh4uJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750597136; c=relaxed/simple;
	bh=Ygh4EXiwp2YXoTEH7jX4nu7C8/6De8xwJ1XjogF3BR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ij5g5XrWWtpRtyanI/eYGYvX6nCg1RBCxPWoZgbW7vK5zcax8FwDieWBFcRK3jNYeG4ArE/HwtwMUxTS7B4b1CJWmobZTdiMG2R80AoDTlp/hStMATbdXdW3fBhnlwZuA1p43+IIcSuIQ9sDxGvZyBDYylSFx82kCYJ9zSDpaKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScK0MfYW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScK0MfYW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1FBC4CEF4;
	Sun, 22 Jun 2025 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750597136;
	bh=Ygh4EXiwp2YXoTEH7jX4nu7C8/6De8xwJ1XjogF3BR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ScK0MfYWKPDgvbWd81ROUZJ66XHOAWa63OJIO9JH3ZhZnVkY9n8SrRCfxPzI8SjLo
	 Rbk16grZwvLZ+/yzZF7zEmnGt1E8zkXtOIkjesSpMxWKur8SMOo2bV/HpvDrgRoHR7
	 qw81z+qfoctHWXRa7BdlVpw0ULMgvMopVRbGMr1oEaWy/QADe7YfaG6VxEDz1RAzpx
	 by/iHS5Kp50rd7hx7GbAXgNOaGmS4JrtoST00BP4rFtkpsShvS9/5qeULAYHzBcqk1
	 TN9cnmQZ1+K1yTEYZ0ScXVZqTg3Z+hjpMW3uLGTOevz4HIRapGXy4xkFM6tsziLNaW
	 hQzn9MVDg5GjQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	Alex Mantel <alexmantel93@mailbox.org>
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] rust: make `Arc::into_unique_or_drop` associated function
Date: Sun, 22 Jun 2025 13:57:28 +0100
Message-ID: <20250622125802.3224264-3-gary@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250622125802.3224264-1-gary@kernel.org>
References: <20250622125802.3224264-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Make `Arc::into_unique_or_drop` to become a mere associated function
instead of a method (i.e. removing the `self` receiver).

It's a general convention for Rust smart pointers to avoid having
methods defined on them, because if the pointee type has a method of the
same name, then it is shadowed. This is normally for avoiding semver
breakage, which isn't an issue for kernel codebase, but it's still
generally a good practice to follow this rule, so that `ptr.foo()` would
always be calling a method on the pointee type.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/sync/arc.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index c7af0aa48a0a..09a471fea4da 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -320,7 +320,7 @@ pub fn ptr_eq(this: &Self, other: &Self) -> bool {
     /// use kernel::sync::{Arc, UniqueArc};
     ///
     /// let arc = Arc::new(42, GFP_KERNEL)?;
-    /// let unique_arc = arc.into_unique_or_drop();
+    /// let unique_arc = Arc::into_unique_or_drop(arc);
     ///
     /// // The above conversion should succeed since refcount of `arc` is 1.
     /// assert!(unique_arc.is_some());
@@ -336,18 +336,18 @@ pub fn ptr_eq(this: &Self, other: &Self) -> bool {
     /// let arc = Arc::new(42, GFP_KERNEL)?;
     /// let another = arc.clone();
     ///
-    /// let unique_arc = arc.into_unique_or_drop();
+    /// let unique_arc = Arc::into_unique_or_drop(arc);
     ///
     /// // The above conversion should fail since refcount of `arc` is >1.
     /// assert!(unique_arc.is_none());
     ///
     /// # Ok::<(), Error>(())
     /// ```
-    pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
+    pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
         // We will manually manage the refcount in this method, so we disable the destructor.
-        let me = ManuallyDrop::new(self);
+        let this = ManuallyDrop::new(this);
         // SAFETY: We own a refcount, so the pointer is still valid.
-        let refcount = unsafe { me.ptr.as_ref() }.refcount.get();
+        let refcount = unsafe { this.ptr.as_ref() }.refcount.get();
 
         // If the refcount reaches a non-zero value, then we have destroyed this `Arc` and will
         // return without further touching the `Arc`. If the refcount reaches zero, then there are
@@ -364,7 +364,7 @@ pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
             // must pin the `UniqueArc` because the values was previously in an `Arc`, and they pin
             // their values.
             Some(Pin::from(UniqueArc {
-                inner: ManuallyDrop::into_inner(me),
+                inner: ManuallyDrop::into_inner(this),
             }))
         } else {
             None
-- 
2.49.0

