Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAF1223DE9;
	Tue,  3 Jun 2025 20:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748984071; cv=none; b=Lm0Qc1UuWWZPn6Z4Mvl6m4HbKEN9b5lkVwJm8jy07/gpAK/VBcl5knjeOp9+9RDqb+h1bAUyoh7/dXPrxbBDk8rF4eujkTAHtCnwu5TQQ3xSf7UeaaCdegeTjNjftEVVzB6xnQv2L6iT9cHXUC1uGAzSkTt7Xqii5QaC7ev845g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748984071; c=relaxed/simple;
	bh=3CyuAmIyzTqGGDA1FepfE0hCYoMCY4S7QwmZsYgDHc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eeAUQpKobtRtjhX68vSfuGrJ2taDdxxgX0rK5Gy3vj/8n3d+10ez6FcYVSblweCb4HYaMo42sJ1omUUHjLu2mBJrOWRagzSw8jT1GqwA2ix1uUXr6TuMrhfaWJpTEiRbXGv2qzJhPilZsWlDXdlgialc3T2VeEAiSYRiE1AoaoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGCmwQ62; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGCmwQ62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58ACC4CEED;
	Tue,  3 Jun 2025 20:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748984070;
	bh=3CyuAmIyzTqGGDA1FepfE0hCYoMCY4S7QwmZsYgDHc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VGCmwQ62fP/qj8WcOKa7vw7nVrQETcTphJ7r5mwuIuqYHdH8i0kvIEryjVmbyK1UN
	 C6dshYTuGAVOCAEiF5AGWC5A8y1KMgjPzekh2RSbi6ESHO+U5a/maw4KNIfg918uNz
	 RVlB0I9gDsYjErHRk4eoYLQNGjylFqZcuk4QlYAtWatElxLv6UieQ9Y6j6hiSBRcHU
	 e2d9FbHKKe3WeE15j5WNTENfqvLE96Crvai0Us30fYtr1MEBnP1NxLdEpMW8StCjGw
	 QFWRvBVuUeCbRSIe+bObbv9IwRME/bPRLQWh09goIZi3DReYdE/V17ZvYQ8XJXE7r5
	 /9BDLwd122vgg==
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
	tmgross@umich.edu,
	chrisi.schrefl@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/3] rust: revocable: indicate whether `data` has been revoked already
Date: Tue,  3 Jun 2025 22:48:51 +0200
Message-ID: <20250603205416.49281-3-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603205416.49281-1-dakr@kernel.org>
References: <20250603205416.49281-1-dakr@kernel.org>
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

