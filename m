Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E241E0DEB;
	Sun,  4 May 2025 17:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379939; cv=none; b=iQ8qOmQmrW4pb2Mzk+MXeVqxevMGjnwfsEhKyyax2GZ6ZegudszvZ0NbwxcE8KIxfT7fR41/rewXx3wus2O/QQhOUY4L6cSQ2kT1DJp9dSaahk3XWkrUfOEi6k5rzHe7oa3OJNodt5Ze/jxdLaBjvOLVW5qhzcytHBMzhIPJL5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379939; c=relaxed/simple;
	bh=arVvYY/U4KcowDeyUPfOPUK4/y7MQua5SHBupaDB3gU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5Zxpsev81yYacTloR+BCHDn4Z2L/lC5rB+dYhIfLkQAHHqjAHU+U1g2VCIub4hUT9LtIBgKheA6gX+sqNr8VLNqPLHfAGHNHgLYESl+2zBbLqmPkzAjq8CbGbcYBkTAjzH/UWiCWyCZVzYQfHJFg9U+mEHZJmtdUnj4gsxuueU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZrBYV3TTcz9tSw;
	Sun,  4 May 2025 19:32:14 +0200 (CEST)
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
	Dirk Behme <dirk.behme@de.bosch.com>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 7/9] rust: device: Add child accessor and iterator
Date: Sun,  4 May 2025 19:31:52 +0200
Message-ID: <20250504173154.488519-8-remo@buenzli.dev>
In-Reply-To: <20250504173154.488519-1-remo@buenzli.dev>
References: <20250504173154.488519-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow Rust drivers to access children of a fwnode either by name or by
iterating over all of them.

In C, there is the function `fwnode_get_next_child_node` for iteration
and the macro `fwnode_for_each_child_node` that helps with handling the
pointers. Instead of a macro, a native iterator is used in Rust such
that regular for-loops can be used.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/property.rs | 79 +++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 413166e2d082e..10061156f79a8 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -12,7 +12,7 @@
     error::{to_result, Result},
     prelude::*,
     str::{CStr, CString},
-    types::Opaque,
+    types::{ARef, Opaque},
 };
 
 /// A reference-counted fwnode_handle.
@@ -34,6 +34,27 @@
 pub struct FwNode(Opaque<bindings::fwnode_handle>);
 
 impl FwNode {
+    /// # Safety
+    ///
+    /// Callers must ensure that:
+    /// - The reference count was incremented at least once.
+    /// - They relinquish that increment. That is, if there is only one
+    ///   increment, callers must not use the underlying object anymore -- it is
+    ///   only safe to do so via the newly created `ARef<FwNode>`.
+    unsafe fn from_raw(raw: *mut bindings::fwnode_handle) -> ARef<Self> {
+        // SAFETY: As per the safety requirements of this function:
+        // - `NonNull::new_unchecked`:
+        //   - `raw` is not null.
+        // - `ARef::from_raw`:
+        //   - `raw` has an incremented refcount.
+        //   - that increment is relinquished, i.e. it won't be decremented
+        //     elsewhere.
+        // CAST: It is safe to cast from a `*mut fwnode_handle` to
+        // `*mut FwNode`, because `FwNode` is  defined as a
+        // `#[repr(transparent)]` wrapper around `fwnode_handle`.
+        unsafe { ARef::from_raw(ptr::NonNull::new_unchecked(raw.cast())) }
+    }
+
     /// Obtain the raw `struct fwnode_handle *`.
     pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
         self.0.get()
@@ -215,6 +236,62 @@ pub fn property_read<'fwnode, 'name, T: Property>(
             name,
         }
     }
+
+    /// Returns first matching named child node handle.
+    pub fn get_child_by_name(&self, name: &CStr) -> Option<ARef<Self>> {
+        // SAFETY: `self` and `name` are valid by their type invariants.
+        let child =
+            unsafe { bindings::fwnode_get_named_child_node(self.as_raw(), name.as_char_ptr()) };
+        if child.is_null() {
+            return None;
+        }
+        // SAFETY:
+        // - `fwnode_get_named_child_node` returns a pointer with its refcount
+        //   incremented.
+        // - That increment is relinquished, i.e. the underlying object is not
+        //   used anymore except via the newly created `ARef`.
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
+            // SAFETY:
+            // - `self.as_raw()` is valid by its type invariant.
+            // - `prev_ptr` may be null, which is allowed and corresponds to
+            //   getting the first child. Otherwise, `prev_ptr` is valid, as it
+            //   is the stored return value from the previous invocation.
+            // - `prev_ptr` has its refount incremented.
+            // - The increment of `prev_ptr` is relinquished, i.e. the
+            //   underlying object won't be used anymore.
+            let next = unsafe { bindings::fwnode_get_next_child_node(self.as_raw(), prev_ptr) };
+            if next.is_null() {
+                return None;
+            }
+            // SAFETY:
+            // - `next` is valid because `fwnode_get_next_child_node` returns a
+            //   pointer with its refcount incremented.
+            // - That increment is relinquished, i.e. the underlying object
+            //   won't be used anymore, except via the newly created
+            //   `ARef<Self>`.
+            let next = unsafe { FwNode::from_raw(next) };
+            prev = Some(next.clone());
+            Some(next)
+        })
+    }
 }
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
-- 
2.49.0

