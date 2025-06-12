Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E722DA1B;
	Thu, 12 Jun 2025 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730715; cv=none; b=F5gCh04YEuTg3mtfsML3Vf242A+MncXzC27ezEI+L16a9pDADPbzOgf4aarZKY61Zq3d39TSZbujT5VdaUx32PHw3f3C6HWWuN5C/4FLCXhSMOM2gCeoBXSnocP5QnXMqH4y8rCboKJtGVHeKOJvs9MdmYnupr331zFAkFXoY6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730715; c=relaxed/simple;
	bh=JrlAMR6/EfZihab+1FR+Xmwqg+pfXEbbyAcaW58VYRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faeKySIb7L3eWzz0LShOqlLMI/EXqfF+GecKiA+m7p1LF003i2kwQopJyXiFuXBNPdu3mZCO3irwzsRCNR9PDxgT1EsDs/53l5Nc9D1JqPc8DOnMp7CVmm061LuEO4qePCu7E68fDavT9nnVYDVxIX/r3GWvsYqJ0Y3wEOJlvac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXLplCyU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXLplCyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2649CC4CEF1;
	Thu, 12 Jun 2025 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749730715;
	bh=JrlAMR6/EfZihab+1FR+Xmwqg+pfXEbbyAcaW58VYRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mXLplCyU1eG9w8+J9nUZKQKVJx2968kKNkl+xQBtaOvFjnl+h+2CfMGU0uyjXbB4p
	 ipjY9GQzN5P3n5djKm64eVYX6VrrxlhVx52sAsMclXXuWTzXgnQ+iwTb69LFazrm6a
	 EUHvnfISjYA54aZlqo8K/Svk/TSbx1fXD86ChJZOTbxpxxlvCdsaG8nyYcazEHqrF0
	 v7aZkpJy4foCWcPQgCbrM7i0joaHbtpyIdkMJ777thoTs/Vc1FOi46h8vDmYywDmfh
	 B8/OPPMd65VJ4hPLz2rpsDJY9QRcNIEdl/EHwWiDJOHPH0k295m4jCIy0gAkHghX8s
	 C+qUnAbxHFT+g==
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
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 3/3] rust: devres: fix race in Devres::drop()
Date: Thu, 12 Jun 2025 14:17:15 +0200
Message-ID: <20250612121817.1621-4-dakr@kernel.org>
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

In Devres::drop() we first remove the devres action and then drop the
wrapped device resource.

The design goal is to give the owner of a Devres object control over when
the device resource is dropped, but limit the overall scope to the
corresponding device being bound to a driver.

However, there's a race that was introduced with commit 8ff656643d30
("rust: devres: remove action in `Devres::drop`"), but also has been
(partially) present from the initial version on.

In Devres::drop(), the devres action is removed successfully and
subsequently the destructor of the wrapped device resource runs.
However, there is no guarantee that the destructor of the wrapped device
resource completes before the driver core is done unbinding the
corresponding device.

If in Devres::drop(), the devres action can't be removed, it means that
the devres callback has been executed already, or is still running
concurrently. In case of the latter, either Devres::drop() wins revoking
the Revocable or the devres callback wins revoking the Revocable. If
Devres::drop() wins, we (again) have no guarantee that the destructor of
the wrapped device resource completes before the driver core is done
unbinding the corresponding device.

CPU0					CPU1
------------------------------------------------------------------------
Devres::drop() {			Devres::devres_callback() {
   self.data.revoke() {			   this.data.revoke() {
      is_available.swap() == true
					      is_available.swap == false
					   }
					}

					// [...]
					// device fully unbound
      drop_in_place() {
         // release device resource
      }
   }
}

Depending on the specific device resource, this can potentially lead to
user-after-free bugs.

In order to fix this, implement the following logic.

In the devres callback, we're always good when we get to revoke the
device resource ourselves, i.e. Revocable::revoke() returns true.

If Revocable::revoke() returns false, it means that Devres::drop(),
concurrently, already drops the device resource and we have to wait for
Devres::drop() to signal that it finished dropping the device resource.

Note that if we hit the case where we need to wait for the completion of
Devres::drop() in the devres callback, it means that we're actually
racing with a concurrent Devres::drop() call, which already started
revoking the device resource for us. This is rather unlikely and means
that the concurrent Devres::drop() already started doing our work and we
just need to wait for it to complete it for us. Hence, there should not
be any additional overhead from that.

(Actually, for now it's even better if Devres::drop() does the work for
us, since it can bypass the synchronize_rcu() call implied by
Revocable::revoke(), but this goes away anyways once I get to implement
the split devres callback approach, which allows us to first flip the
atomics of all registered Devres objects of a certain device, execute a
single synchronize_rcu() and then drop all revocable objects.)

In Devres::drop() we try to revoke the device resource. If that is *not*
successful, it means that the devres callback already did and we're good.

Otherwise, we try to remove the devres action, which, if successful,
means that we're good, since the device resource has just been revoked
by us *before* we removed the devres action successfully.

If the devres action could not be removed, it means that the devres
callback must be running concurrently, hence we signal that the device
resource has been revoked by us, using the completion.

This makes it safe to drop a Devres object from any task and at any point
of time, which is one of the design goals.

Fixes: 76c01ded724b ("rust: add devres abstraction")
Reported-by: Alice Ryhl <aliceryhl@google.com>
Closes: https://lore.kernel.org/lkml/aD64YNuqbPPZHAa5@google.com/
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/devres.rs | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 0f79a2ec9474..dedb39d83cbe 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -13,7 +13,7 @@
     ffi::c_void,
     prelude::*,
     revocable::Revocable,
-    sync::Arc,
+    sync::{Arc, Completion},
     types::ARef,
 };
 
@@ -25,6 +25,8 @@ struct DevresInner<T> {
     callback: unsafe extern "C" fn(*mut c_void),
     #[pin]
     data: Revocable<T>,
+    #[pin]
+    revoke: Completion,
 }
 
 /// This abstraction is meant to be used by subsystems to containerize [`Device`] bound resources to
@@ -102,6 +104,7 @@ fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>
                 dev: dev.into(),
                 callback: Self::devres_callback,
                 data <- Revocable::new(data),
+                revoke <- Completion::new(),
             }),
             flags,
         )?;
@@ -130,26 +133,28 @@ fn as_ptr(&self) -> *const Self {
         self as _
     }
 
-    fn remove_action(this: &Arc<Self>) {
+    fn remove_action(this: &Arc<Self>) -> bool {
         // SAFETY:
         // - `self.inner.dev` is a valid `Device`,
         // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
         //   previously,
         // - `self` is always valid, even if the action has been released already.
-        let ret = unsafe {
+        let success = unsafe {
             bindings::devm_remove_action_nowarn(
                 this.dev.as_raw(),
                 Some(this.callback),
                 this.as_ptr() as _,
             )
-        };
+        } == 0;
 
-        if ret == 0 {
+        if success {
             // SAFETY: We leaked an `Arc` reference to devm_add_action() in `DevresInner::new`; if
             // devm_remove_action_nowarn() was successful we can (and have to) claim back ownership
             // of this reference.
             let _ = unsafe { Arc::from_raw(this.as_ptr()) };
         }
+
+        success
     }
 
     #[allow(clippy::missing_safety_doc)]
@@ -161,7 +166,12 @@ fn remove_action(this: &Arc<Self>) {
         //         `DevresInner::new`.
         let inner = unsafe { Arc::from_raw(ptr) };
 
-        inner.data.revoke();
+        if !inner.data.revoke() {
+            // If `revoke()` returns false, it means that `Devres::drop` already started revoking
+            // `inner.data` for us. Hence we have to wait until `Devres::drop()` signals that it
+            // completed revoking `inner.data`.
+            inner.revoke.wait_for_completion();
+        }
     }
 }
 
@@ -232,6 +242,15 @@ fn deref(&self) -> &Self::Target {
 
 impl<T> Drop for Devres<T> {
     fn drop(&mut self) {
-        DevresInner::remove_action(&self.0);
+        // SAFETY: When `drop` runs, it is guaranteed that nobody is accessing the revocable data
+        // anymore, hence it is safe not to wait for the grace period to finish.
+        if unsafe { self.revoke_nosync() } {
+            // We revoked `self.0.data` before the devres action did, hence try to remove it.
+            if !DevresInner::remove_action(&self.0) {
+                // We could not remove the devres action, which means that it now runs concurrently,
+                // hence signal that `self.0.data` has been revoked successfully.
+                self.0.revoke.complete_all();
+            }
+        }
     }
 }
-- 
2.49.0

