Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5A6267F75;
	Fri, 25 Apr 2025 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593331; cv=none; b=Ma6VdbpN1HJUcTY2EMOGmNvRJhnBbO6Ow4NjIVrHT3y8wF39ObADE/5jqfSBaBzO2Og3w0OHz4w+JS6ksZlZm6hlhGOwtZcff798CyKRGjEuLqAFaKR4Oy7gtP8s22FlhD4QuVnGKBBMayvYIfcSVf1BcNuv68OgojIMbUHxLOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593331; c=relaxed/simple;
	bh=iTu3xyMaen6N4lYL60lO/zs4WK1E+diSLwDbJZm8Ee8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oa4blcwvTO6pbHnZot0RYbkzR+pkhY7TZIEAxbVMWmH6LviALerEHMbpZrHtXcYksTvvjDagl0B3u5iupSjTBlzFIPh/U7/hC5XyuX0LOfccSm+GNcTJyCXxztw0uEVt3/lpDUbhLiVLyuo7YC9fxABvpXA1Z+ZjaIgiUJzr3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZkbfF4thPz9srM;
	Fri, 25 Apr 2025 17:01:57 +0200 (CEST)
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
Subject: [PATCH v3 1/7] rust: property: Move property_present to separate file
Date: Fri, 25 Apr 2025 17:01:24 +0200
Message-ID: <20250425150130.13917-2-remo@buenzli.dev>
In-Reply-To: <20250425150130.13917-1-remo@buenzli.dev>
References: <20250425150130.13917-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4ZkbfF4thPz9srM

Not all property-related APIs can be exposed directly on a device.
For example, iterating over child nodes of a device will yield
fwnode_handle. Thus, in order to access properties on these child nodes,
the property access methods must be implemented on the abstraction over
fwnode_handle.

While it's possible to expose similar methods on `Device` directly for
convenience, those methods would have to get the `FwNode` first, which
is a fallible operation, making the API inconsistent. For this reason,
such duplicated methods are omitted. Users who need to read properties
of a device will have to explictily get the `FwNode` first (handle the
`None` case) and then read properties on that.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 MAINTAINERS                              |  3 +-
 rust/helpers/helpers.c                   |  1 +
 rust/helpers/property.c                  |  8 +++
 rust/kernel/{device.rs => device/mod.rs} |  9 +--
 rust/kernel/device/property.rs           | 70 ++++++++++++++++++++++++
 5 files changed, 83 insertions(+), 8 deletions(-)
 create mode 100644 rust/helpers/property.c
 rename rust/kernel/{device.rs => device/mod.rs} (97%)
 create mode 100644 rust/kernel/device/property.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index c8d9e8187..4585f9e7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7112,7 +7112,8 @@ F:	include/linux/kobj*
 F:	include/linux/property.h
 F:	include/linux/sysfs.h
 F:	lib/kobj*
-F:	rust/kernel/device.rs
+F:	rust/kernel/device/mod.rs
+F:	rust/kernel/device/property.rs
 F:	rust/kernel/device_id.rs
 F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
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
diff --git a/rust/kernel/device.rs b/rust/kernel/device/mod.rs
similarity index 97%
rename from rust/kernel/device.rs
rename to rust/kernel/device/mod.rs
index db2d9658b..e49107452 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device/mod.rs
@@ -6,7 +6,6 @@
 
 use crate::{
     bindings,
-    str::CStr,
     types::{ARef, Opaque},
 };
 use core::{fmt, ptr};
@@ -14,6 +13,8 @@
 #[cfg(CONFIG_PRINTK)]
 use crate::c_str;
 
+pub mod property;
+
 /// A reference-counted device.
 ///
 /// This structure represents the Rust abstraction for a C `struct device`. This implementation
@@ -181,12 +182,6 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
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
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
new file mode 100644
index 000000000..d89715f7d
--- /dev/null
+++ b/rust/kernel/device/property.rs
@@ -0,0 +1,70 @@
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
+    pub fn fwnode(&self) -> Option<&FwNode> {
+        // SAFETY: `self` is valid.
+        let fwnode_handle = unsafe { bindings::__dev_fwnode(self.as_raw()) };
+        if fwnode_handle.is_null() {
+            return None;
+        }
+        // SAFETY: `fwnode_handle` is valid. Its lifetime is tied to `&self`. We
+        // return a reference instead of an `ARef<FwNode>` because `dev_fwnode()`
+        // doesn't increment the refcount. It is safe to cast from a
+        // `struct fwnode_handle*` to a `*const FwNode` because `FwNode` is
+        // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
+        Some(unsafe { &*fwnode_handle.cast() })
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

