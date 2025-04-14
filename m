Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275332750F7;
	Mon, 14 Apr 2025 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644418; cv=none; b=p2O5sy0GhKkdH0y4MTVLOnEqUaebav0jqe7X2inQ3AFinmG0OpZYWrfg5P1dNI0ShRc5AUILqvTFRcs56237zNuckLZrnVgIIMHVTv7Hsld9xonNaRYnGpuKfdQzqNnj+uKoe+FJU8HuMLxXNhpDcHg/A0WLXhxffxKj7Ryq5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644418; c=relaxed/simple;
	bh=tljC7nX6BIWJmnp//ntgU0wE8rfph+aklnYeois2pjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T79BvpQmenoovwW7aMp8EnmIjlQEubLuFDdBmn+VdNRC8BlqCQgPH+h06+MIFAy+YvlIoknPnQ9etVPz+uTX7yXfKAA2ngKhFv9uYqCnmpdzu9umcAnBfbmWMYT8aKxG5fGyLRXdqMPFiIgAJxbB9L/wc7ym4Y2PsF9Of55Lcys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Zbrk41926z9tFN;
	Mon, 14 Apr 2025 17:26:52 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 3/5] rust: property: Add child accessor and iterator
Date: Mon, 14 Apr 2025 17:26:28 +0200
Message-ID: <20250414152630.1691179-4-remo@buenzli.dev>
In-Reply-To: <20250414152630.1691179-1-remo@buenzli.dev>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4Zbrk41926z9tFN

Allow Rust drivers to access children of a fwnode either by name or by
iterating over all of them.

In C, there is the function `fwnode_get_next_child_node` for iteration
and the macro `fwnode_for_each_child_node` that helps with handling the
pointers. Instead of a macro, a native iterator is used in Rust such
that regular for-loops can be used.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/property.rs | 75 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/property.rs b/rust/kernel/property.rs
index 0d4ea3168..d9fb773b6 100644
--- a/rust/kernel/property.rs
+++ b/rust/kernel/property.rs
@@ -13,7 +13,7 @@
     error::{to_result, Result},
     prelude::*,
     str::{BStr, CStr, CString},
-    types::Opaque,
+    types::{ARef, Opaque},
 };
 
 impl Device {
@@ -68,6 +68,16 @@ pub fn property_read<'fwnode, 'name, T: Property>(
     ) -> PropertyGuard<'fwnode, 'name, T> {
         self.fwnode().property_read(name)
     }
+
+    /// Returns first matching named child node handle.
+    pub fn get_child_by_name(&self, name: &CStr) -> Option<ARef<FwNode>> {
+        self.fwnode().get_child_by_name(name)
+    }
+
+    /// Returns an iterator over a node's children.
+    pub fn children<'a>(&'a self) -> impl Iterator<Item = ARef<FwNode>> + 'a {
+        self.fwnode().children()
+    }
 }
 
 /// A reference-counted fwnode_handle.
@@ -89,6 +99,22 @@ pub fn property_read<'fwnode, 'name, T: Property>(
 pub struct FwNode(Opaque<bindings::fwnode_handle>);
 
 impl FwNode {
+    /// # Safety
+    ///
+    /// Callers must ensure that the reference count was incremented at least
+    /// once, and that they are properly relinquishing one increment. That is,
+    /// if there is only one increment, callers must not use the underlying
+    /// object anymore -- it is only safe to do so via the newly created
+    /// [`ARef`].
+    unsafe fn from_raw(raw: *mut bindings::fwnode_handle) -> ARef<Self> {
+        // SAFETY: As per the safety requirement, raw has an incremented
+        // refcount which won't be decremented elsewhere. It also it not null.
+        // It is safe to cast from a `*mut fwnode_handle` to `*mut FwNode`,
+        // because `FwNode` is  defined as a `#[repr(transparent)]` wrapper
+        // around `fwnode_handle`.
+        unsafe { ARef::from_raw(ptr::NonNull::new_unchecked(raw.cast())) }
+    }
+
     /// Obtain the raw `struct fwnode_handle *`.
     pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
         self.0.get()
@@ -243,6 +269,53 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
 
         FwNodeDisplayPath(self)
     }
+
+    /// Returns first matching named child node handle.
+    pub fn get_child_by_name(&self, name: &CStr) -> Option<ARef<Self>> {
+        // SAFETY: `self` and `name` are valid.
+        let child =
+            unsafe { bindings::fwnode_get_named_child_node(self.as_raw(), name.as_char_ptr()) };
+        if child.is_null() {
+            return None;
+        }
+        // SAFETY: `fwnode_get_named_child_node` returns a pointer with refcount incremented.
+        Some(unsafe { Self::from_raw(child) })
+    }
+
+    /// Returns an iterator over a node's children.
+    pub fn children<'a>(&'a self) -> impl Iterator<Item = ARef<FwNode>> + 'a {
+        let mut prev: Option<ARef<FwNode>> = None;
+
+        core::iter::from_fn(move || {
+            let prev_ptr = match prev.take() {
+                None => ptr::null_mut(),
+                Some(prev) => {
+                    // We will pass `prev` to `fwnode_get_next_child_node`,
+                    // which decrements its refcount, so we use
+                    // `ARef::into_raw` to avoid decrementing the refcount
+                    // twice.
+                    let prev = ARef::into_raw(prev);
+                    prev.as_ptr().cast()
+                }
+            };
+            // SAFETY: `self.as_raw()` is valid. `prev_ptr` may be null,
+            // which is allowed and corresponds to getting the first child.
+            // Otherwise, `prev_ptr` is valid, as it is the stored return
+            // value from the previous invocation. `prev_ptr` has its refount
+            // incremented and it won't be decremented anymore on the Rust
+            // side. `fwnode_get_next_child_node` decrements the refcount of
+            // `prev_ptr`, so the refcount is handled correctly.
+            let next = unsafe { bindings::fwnode_get_next_child_node(self.as_raw(), prev_ptr) };
+            if next.is_null() {
+                return None;
+            }
+            // SAFETY: `fwnode_get_next_child_node` returns a pointer with
+            // refcount incremented.
+            let next = unsafe { FwNode::from_raw(next) };
+            prev = Some(next.clone());
+            Some(next)
+        })
+    }
 }
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
-- 
2.49.0

