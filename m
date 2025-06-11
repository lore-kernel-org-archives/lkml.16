Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AB4224AFB;
	Wed, 11 Jun 2025 17:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664126; cv=none; b=ToU6s89YGhw7q+nyAjm9t82L8aORUkf1f+yo8IIaEsQaNPvQ/nrXYhjq/PXq6b+FduJuIs8R3R2+w+5OVmDNq9xK/nT3za2o+Uqc8IW9cPVmT82ejmzrFeQPFiQ4qfQ0twbLVnBfbX22Ob/kK73yvNHa8aS7pmaMaG/tBSYrcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664126; c=relaxed/simple;
	bh=mdRke/n+h17oYcItjGEfC78XXHJJ+uUBj3fjyng+SNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PRY0E4YOtY5XMprFxClljJBQy0qr7wH5c7/ZDkRVK48TePxewSC+DR43cK9hA6vLracbdT/+gluLk3an5+hMANCT2u4HHHM4e561RIS0HMbtbDmULMMVfmvizQyG5AedPMNDrloMj1H6CVqzueYYfpASiO32C93HM7zdmFiui2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rrO/KZ4X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrO/KZ4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E188C4CEE3;
	Wed, 11 Jun 2025 17:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749664126;
	bh=mdRke/n+h17oYcItjGEfC78XXHJJ+uUBj3fjyng+SNc=;
	h=From:To:Cc:Subject:Date:From;
	b=rrO/KZ4XSxJbHYQfTB0C4g9pwyzSug6su284OKjlNblW79itf1yPSYJyA01pQLF0T
	 Tq8wIYuz/fZWQO8tJhcN5AqyvVX9LpEbExyuT5nobgKw6OgBuTF1tAHbVr4AIgdDWC
	 tzqYzAkr6+Us+CIEBIZ57iNZBSJLXf1girT0sH4gtcfbr8K2U+/eOzedDOfhnhEGQw
	 wpfWF7O4QQqs+p/cKAefzXO59RScFa7NHd8P+UEdMZZae5XlxWGchZn+zHfzaY/xut
	 2MxPMtXfWGH7ets7OBE8+HGRuGvN+F9vQW2l/FnozvW+hHrVQUsbiCyoteZtwqF9M2
	 LMYrjNSgAnl+A==
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
	aliceryhl@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] rust: devres: do not dereference to the internal Revocable
Date: Wed, 11 Jun 2025 19:48:25 +0200
Message-ID: <20250611174827.380555-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can't expose direct access to the internal Revocable, since this
allows users to directly revoke the internal Revocable without Devres
having the chance to synchronize with the devres callback -- we have to
guarantee that the internal Revocable has been fully revoked before
the device is fully unbound.

Hence, remove the corresponding Deref implementation and, instead,
provide indirect accessors for the internal Revocable.

Note that we can still support Devres::revoke() by implementing the
required synchronization (which would be almost identical to the
synchronization in Devres::drop()).

Fixes: 76c01ded724b ("rust: add devres abstraction")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
This patch is based on [1].

[1] https://lore.kernel.org/lkml/20250603205416.49281-1-dakr@kernel.org/
---
 rust/kernel/devres.rs | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index dedb39d83cbe..d8bdf2bdb879 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -12,13 +12,11 @@
     error::{Error, Result},
     ffi::c_void,
     prelude::*,
-    revocable::Revocable,
-    sync::{Arc, Completion},
+    revocable::{Revocable, RevocableGuard},
+    sync::{rcu, Arc, Completion},
     types::ARef,
 };
 
-use core::ops::Deref;
-
 #[pin_data]
 struct DevresInner<T> {
     dev: ARef<Device>,
@@ -228,15 +226,22 @@ pub fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Result<&'a T> {
         // SAFETY: `dev` being the same device as the device this `Devres` has been created for
         // proves that `self.0.data` hasn't been revoked and is guaranteed to not be revoked as
         // long as `dev` lives; `dev` lives at least as long as `self`.
-        Ok(unsafe { self.deref().access() })
+        Ok(unsafe { self.0.data.access() })
     }
-}
 
-impl<T> Deref for Devres<T> {
-    type Target = Revocable<T>;
+    /// [`Devres`] accessor for [`Revocable::try_access`].
+    pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
+        self.0.data.try_access()
+    }
+
+    /// [`Devres`] accessor for [`Revocable::try_access_with`].
+    pub fn try_access_with<R, F: FnOnce(&T) -> R>(&self, f: F) -> Option<R> {
+        self.0.data.try_access_with(f)
+    }
 
-    fn deref(&self) -> &Self::Target {
-        &self.0.data
+    /// [`Devres`] accessor for [`Revocable::try_access_with_guard`].
+    pub fn try_access_with_guard<'a>(&'a self, guard: &'a rcu::Guard) -> Option<&'a T> {
+        self.0.data.try_access_with_guard(guard)
     }
 }
 
@@ -244,7 +249,7 @@ impl<T> Drop for Devres<T> {
     fn drop(&mut self) {
         // SAFETY: When `drop` runs, it is guaranteed that nobody is accessing the revocable data
         // anymore, hence it is safe not to wait for the grace period to finish.
-        if unsafe { self.revoke_nosync() } {
+        if unsafe { self.0.data.revoke_nosync() } {
             // We revoked `self.0.data` before the devres action did, hence try to remove it.
             if !DevresInner::remove_action(&self.0) {
                 // We could not remove the devres action, which means that it now runs concurrently,

base-commit: d0ba9ee1c7319e6bbc1f205aff8e31ebb547b571
-- 
2.49.0

