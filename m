Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5E25E804;
	Mon, 14 Apr 2025 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644806; cv=none; b=b5WGKOI0uiufU8jOEJ1/SOyOLEEjxpyiJfM0fzj7Tt4+3vyt8QOD/iKIiqFGkcuxLUVsdChZymXNUD1FmJ3/LhTyFNaFhn6SrF3IGQH5YLR034JUDhPh5DSJVkyr0O2gPZ1YVrIapfh57fIFkZOUZSBJoixIdhpwx9hBrt1qwgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644806; c=relaxed/simple;
	bh=/5e3b4eP8pS4/WvG/ZgIGg0AVs+8eFE99KZLo+hs5uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V47KCh1TZCYg2A6MZSbqbY92y1RJgHdR7k/0DYs221RH9q4jk9pgLKoZbs6zYYgbGPJdlzupPCR9v1Q1AF5311eKzStjva4eqspKGgW/M8liWPhwKIcbP4HT3jlJH0VfKetpKcNXB3MEDlPkyS1Wh/ocAz+B/cPB2+tnIgEENx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Zbrjz1Bc2z9t9v;
	Mon, 14 Apr 2025 17:26:47 +0200 (CEST)
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
Subject: [PATCH v2 1/5] rust: Move property_present to separate file
Date: Mon, 14 Apr 2025 17:26:26 +0200
Message-ID: <20250414152630.1691179-2-remo@buenzli.dev>
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
X-Rspamd-Queue-Id: 4Zbrjz1Bc2z9t9v

Not all property-related APIs can be exposed directly on a device.
For example, iterating over child nodes of a device will yield
fwnode_handle. Thus, in order to access properties on these child nodes,
duplicate the APIs on a fwnode as they are in C.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 MAINTAINERS             |  1 +
 rust/helpers/helpers.c  |  1 +
 rust/helpers/property.c |  8 +++++
 rust/kernel/device.rs   |  7 ----
 rust/kernel/lib.rs      |  1 +
 rust/kernel/property.rs | 75 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 86 insertions(+), 7 deletions(-)
 create mode 100644 rust/helpers/property.c
 create mode 100644 rust/kernel/property.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index c8d9e8187..a34471662 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7117,6 +7117,7 @@ F:	rust/kernel/device_id.rs
 F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
 F:	rust/kernel/platform.rs
+F:	rust/kernel/property.rs
 F:	samples/rust/rust_driver_platform.rs
 
 DRIVERS FOR OMAP ADAPTIVE VOLTAGE SCALING (AVS)
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0640b7e11..b4eec5bf2 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -23,6 +23,7 @@
 #include "platform.c"
 #include "pci.c"
 #include "pid_namespace.c"
+#include "property.c"
 #include "rbtree.c"
 #include "rcu.c"
 #include "refcount.c"
diff --git a/rust/helpers/property.c b/rust/helpers/property.c
new file mode 100644
index 000000000..08f68e2da
--- /dev/null
+++ b/rust/helpers/property.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/property.h>
+
+void rust_helper_fwnode_handle_put(struct fwnode_handle *fwnode)
+{
+	fwnode_handle_put(fwnode);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index db2d9658b..d5e6a19ff 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,7 +6,6 @@
 
 use crate::{
     bindings,
-    str::CStr,
     types::{ARef, Opaque},
 };
 use core::{fmt, ptr};
@@ -181,12 +180,6 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             )
         };
     }
-
-    /// Checks if property is present or not.
-    pub fn property_present(&self, name: &CStr) -> bool {
-        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
-        unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
-    }
 }
 
 // SAFETY: Instances of `Device` are always reference-counted.
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0..ca233fd20 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -67,6 +67,7 @@
 pub mod platform;
 pub mod prelude;
 pub mod print;
+pub mod property;
 pub mod rbtree;
 pub mod revocable;
 pub mod security;
diff --git a/rust/kernel/property.rs b/rust/kernel/property.rs
new file mode 100644
index 000000000..f6e6c980d
--- /dev/null
+++ b/rust/kernel/property.rs
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Unified device property interface.
+//!
+//! C header: [`include/linux/property.h`](srctree/include/linux/property.h)
+
+use core::ptr;
+
+use crate::{bindings, device::Device, str::CStr, types::Opaque};
+
+impl Device {
+    /// Obtain the fwnode corresponding to the device.
+    fn fwnode(&self) -> &FwNode {
+        // SAFETY: `self` is valid.
+        let fwnode_handle = unsafe { bindings::__dev_fwnode(self.as_raw()) };
+        if fwnode_handle.is_null() {
+            panic!("fwnode_handle cannot be null");
+        }
+        // SAFETY: `fwnode_handle` is valid. Its lifetime is tied to `&self`. We
+        // return a reference instead of an `ARef<FwNode>` because `dev_fwnode()`
+        // doesn't increment the refcount. It is safe to cast from a
+        // `struct fwnode_handle*` to a `*const FwNode` because `FwNode` is
+        // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
+        unsafe { &*fwnode_handle.cast() }
+    }
+
+    /// Checks if property is present or not.
+    pub fn property_present(&self, name: &CStr) -> bool {
+        self.fwnode().property_present(name)
+    }
+}
+
+/// A reference-counted fwnode_handle.
+///
+/// This structure represents the Rust abstraction for a
+/// C `struct fwnode_handle`. This implementation abstracts the usage of an
+/// already existing C `struct fwnode_handle` within Rust code that we get
+/// passed from the C side.
+///
+/// # Invariants
+///
+/// A `FwNode` instance represents a valid `struct fwnode_handle` created by the
+/// C portion of the kernel.
+///
+/// Instances of this type are always reference-counted, that is, a call to
+/// `fwnode_handle_get` ensures that the allocation remains valid at least until
+/// the matching call to `fwnode_handle_put`.
+#[repr(transparent)]
+pub struct FwNode(Opaque<bindings::fwnode_handle>);
+
+impl FwNode {
+    /// Obtain the raw `struct fwnode_handle *`.
+    pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
+        self.0.get()
+    }
+
+    /// Checks if property is present or not.
+    pub fn property_present(&self, name: &CStr) -> bool {
+        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
+        unsafe { bindings::fwnode_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
+    }
+}
+
+// SAFETY: Instances of `FwNode` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for FwNode {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::fwnode_handle_get(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
+    }
+}
-- 
2.49.0

