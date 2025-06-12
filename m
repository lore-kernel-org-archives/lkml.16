Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0141865EB;
	Thu, 12 Jun 2025 12:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730713; cv=none; b=YeLBZFJ2SAR9HnpuyVtwiR1Vh5US5/lAFjtOBr1dVxC1lQEau66jimsitl2O55uqQoGXCGOhGTN8cAOJab+fP/5t4lwbB9J05dltgjvr8VpGrmg1jlTm6FrIPU70JnbyyulTYVxVKsp3i3BaW1pLl9zFCUTFDOt+6937MleNIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730713; c=relaxed/simple;
	bh=Y5LgTa1nfrh/20k/L1uywIlaK2ClQdtMLPpJOEw9HDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPnoR1Jug6N2B5Fr2vkmTvyzK4PuCMYzXBweuDx2268XzZLoURwD2uNeXpbPb7xWXhzkHgxEX5h95VHUD67S5m34cW/iuv2ydQ4ElzkWr8cKbKZDxm8robdp+N9CkMLGkOR5JiM1NkHfQZ0Kqwhk6/47OpnRZd5vb9xeYlpevRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5nthBGo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5nthBGo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B89C4CEED;
	Thu, 12 Jun 2025 12:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749730711;
	bh=Y5LgTa1nfrh/20k/L1uywIlaK2ClQdtMLPpJOEw9HDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j5nthBGoRDmndOly10+digxhKKiW3ekRAuvJGXqCOf/bxZ8t6qGS/yOuwrI9t9E/h
	 R8majAdKRahPGSeriHiM1poBiJohBjx41ccoLQ6ENpkqE4fAK1fuSRReqv0LRMy8Uu
	 2LB3b+IitmvVxqyne/HbCIGfh2mbXq1gh2JN8070TYk3QNxXE3ADftTuGo5QZMYqzr
	 9upQ3VC2tn3MeRRVi5GOqvAFr4L/HsWDUtZsKCx4wZCYLntpuoWIjNcCh58skTCKJ6
	 LSl9epHRL67QJsdNxQycQvG9cDLxlndk7umA1ggIQTr9UDrhiNq8MnTaeVE6+pBUZA
	 pxHc/+RIPfpHg==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Subject: [PATCH v2 2/3] rust: revocable: indicate whether `data` has been revoked already
Date: Thu, 12 Jun 2025 14:17:14 +0200
Message-ID: <20250612121817.1621-3-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612121817.1621-1-dakr@kernel.org>
References: <20250612121817.1621-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return a boolean from Revocable::revoke() and Revocable::revoke_nosync()
to indicate whether the data has been revoked already.

Return true if the data hasn't been revoked yet (i.e. this call revoked
the data), false otherwise.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/revocable.rs | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index db4aa46bb121..06a3cdfce344 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -154,8 +154,10 @@ pub unsafe fn access(&self) -> &T {
     /// # Safety
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
-    unsafe fn revoke_internal<const SYNC: bool>(&self) {
-        if self.is_available.swap(false, Ordering::Relaxed) {
+    unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
             if SYNC {
                 // SAFETY: Just an FFI call, there are no further requirements.
                 unsafe { bindings::synchronize_rcu() };
@@ -165,6 +167,8 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) {
             // `compare_exchange` above that takes `is_available` from `true` to `false`.
             unsafe { drop_in_place(self.data.get()) };
         }
+
+        revoke
     }
 
     /// Revokes access to and drops the wrapped object.
@@ -172,10 +176,13 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) {
     /// Access to the object is revoked immediately to new callers of [`Revocable::try_access`],
     /// expecting that there are no concurrent users of the object.
     ///
+    /// Returns `true` if `&self` has been revoked with this call, `false` if it was revoked
+    /// already.
+    ///
     /// # Safety
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
-    pub unsafe fn revoke_nosync(&self) {
+    pub unsafe fn revoke_nosync(&self) -> bool {
         // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
         // accessing the data anymore and hence we don't have to wait for the grace period to
         // finish.
@@ -189,7 +196,10 @@ pub unsafe fn revoke_nosync(&self) {
     /// If there are concurrent users of the object (i.e., ones that called
     /// [`Revocable::try_access`] beforehand and still haven't dropped the returned guard), this
     /// function waits for the concurrent access to complete before dropping the wrapped object.
-    pub fn revoke(&self) {
+    ///
+    /// Returns `true` if `&self` has been revoked with this call, `false` if it was revoked
+    /// already.
+    pub fn revoke(&self) -> bool {
         // SAFETY: By passing `true` we ask `revoke_internal` to wait for the grace period to
         // finish.
         unsafe { self.revoke_internal::<true>() }
-- 
2.49.0

