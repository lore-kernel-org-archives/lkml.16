Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E446B5;
	Tue, 20 May 2025 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771250; cv=none; b=QDVYMXXfViitNH8+1ho7SafqSwppTy/XCht4zuWN5eUhJVj7FtPa67eVT0Cpnwz4s8jO8EBxaSfdi95PkWRkKqB3X9+JalTKML+mVrm0HtbI90nhGAXf7dyKiHc2kxweVX1DDzaFvWc75uu8JM/9iZt7QYunhlWyz5e8SEjfJ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771250; c=relaxed/simple;
	bh=qKfSPG9K79WyI4EW3CnFmX5Ja+fl2qkbBt6UeOyPZ4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jv2tC53NraeEwHkbzIj/1govfh8hgiklqMZw4/qrchbJR7ANlpOZClwzQlvcY+PwJbvZ7JX1MYTA8PTIuDfjYbgWr6N1ekojgLcIV/vxcbs8D0dPMjPzTdWHGuWnJY4h+D9BorQczL6aijvbw8y7fISPMFS6/znAHW0pk3yWydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b255S0bC4z9t2q;
	Tue, 20 May 2025 22:00:44 +0200 (CEST)
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
Subject: [PATCH v5 1/9] rust: device: Create FwNode abstraction for accessing device properties
Date: Tue, 20 May 2025 22:00:16 +0200
Message-ID: <20250520200024.268655-2-remo@buenzli.dev>
In-Reply-To: <20250520200024.268655-1-remo@buenzli.dev>
References: <20250520200024.268655-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b255S0bC4z9t2q

Accessing device properties is currently done via methods on `Device`
itself, using bindings to device_property_* functions. This is
sufficient for the existing method property_present. However, it's not
sufficient for other device properties we want to access. For example,
iterating over child nodes of a device will yield a fwnode_handle.
That's not a device, so it wouldn't be possible to read the properties
of that child node. Thus, we need an abstraction over fwnode_handle and
methods for reading its properties.

Add a struct FwNode which abstracts over the C struct fwnode_handle.
Implement its reference counting analogous to other Rust abstractions
over reference-counted C structs.

Subsequent patches will add functionality to access FwNode and read
properties with it.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 MAINTAINERS                    |  1 +
 rust/helpers/helpers.c         |  1 +
 rust/helpers/property.c        |  8 ++++++
 rust/kernel/device.rs          |  2 ++
 rust/kernel/device/property.rs | 47 ++++++++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 rust/helpers/property.c
 create mode 100644 rust/kernel/device/property.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 3cbf9ac0d83f6..0b95c4b0f657e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7248,6 +7248,7 @@ F:	include/linux/property.h
 F:	include/linux/sysfs.h
 F:	lib/kobj*
 F:	rust/kernel/device.rs
+F:	rust/kernel/device/
 F:	rust/kernel/device_id.rs
 F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 1e7c84df72521..6aac840417648 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -25,6 +25,7 @@
 #include "platform.c"
 #include "pci.c"
 #include "pid_namespace.c"
+#include "property.c"
 #include "rbtree.c"
 #include "rcu.c"
 #include "refcount.c"
diff --git a/rust/helpers/property.c b/rust/helpers/property.c
new file mode 100644
index 0000000000000..08f68e2dac4a9
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
index 0353c5552769c..d8619d4485fb4 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -14,6 +14,8 @@
 #[cfg(CONFIG_PRINTK)]
 use crate::c_str;
 
+pub mod property;
+
 /// A reference-counted device.
 ///
 /// This structure represents the Rust abstraction for a C `struct device`. This implementation
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
new file mode 100644
index 0000000000000..e75d55f5856cf
--- /dev/null
+++ b/rust/kernel/device/property.rs
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Unified device property interface.
+//!
+//! C header: [`include/linux/property.h`](srctree/include/linux/property.h)
+
+use core::ptr;
+
+use crate::{bindings, types::Opaque};
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

