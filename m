Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0091B4156;
	Thu, 30 Jan 2025 22:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738275289; cv=pass; b=NMex5KRWXRgbdHHWQN8k8I+lJleNVk3FqjCSweTmyEOo17jlO01P6JimaMPY5mA1ifO+6s/DvycYlusWZsTgv3T3wSuh1nZiPOf6o2DDRnXk23SXggdF8NRiHoZ7U64sIF/rYyhcEn4ktvN4IWyT1lxobDM4glIZtgoVn/Orres=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738275289; c=relaxed/simple;
	bh=paaeFJR7IuPnRAC6eLv1SFD9hwof6b/oIsFioNAwtTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iz98K/Theo16r8b9M8mL3Nwoie4K4mpSeiuXLoP/pztbv1R5j1G5Biku/WivhM6Qep8NszVwqtlqAvq0HBc/4YYfJ8lDe1skLGJtjdwMwbrm0TG9eQw2Z2OXpWAc9Hul2RulawxAczFn27wx4lYVomwUVgkAaL7TAuq34qZ48KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=WrzKgNmH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WrzKgNmH"
ARC-Seal: i=1; a=rsa-sha256; t=1738275266; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZZXV7dUBQbnu4s8VU9fhJVIuElzttQLlSHClSbV/owWxsC2DySsjRC+5sDGSnIPuUsrT0uN6On68rnJMjxv4C4hTyIPt7t4fwY/2EF12NqLDL99Tf1HVrDI63tlZs+8Bghtb8QP+wdTpD+FnvxyaaS1o9tNwVIk4MEl/t7UOG28=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738275266; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S0jt5DNQPlwYJQqb47kjT1wP836ehKjE8roiscU0BeA=; 
	b=FgybcF+Hl7obKA458DE71U5QXOq/rvTghT0hQNIenX+TGIXxerXw9h3cVUoMKIlJBAH0+D+hm8rtRGXgpCdtr8C4u0ME/ZlxO5DHeSRotUhNE77or4DRTECTz5R1batkmoXWWCzrj6v8cv6oudP2WRjrWRFtM6u7pRSPKWFf90I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738275266;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=S0jt5DNQPlwYJQqb47kjT1wP836ehKjE8roiscU0BeA=;
	b=WrzKgNmHfUBqKRzjwVk+WaPy6CPagmCwEw6JmGhZGHvV4sa+AefE4OGwoAscGe/q
	3Pt5cCsAWUhapTc913j/hIK+iJSRPvjUS1613oMIlVFfzPic1kAl13NeQTl9/FjnzzT
	xuA/elT01/k6wS/CC4Q2YXzgfqA4oRYpLn1EGj0c=
Received: by mx.zohomail.com with SMTPS id 1738275263083159.469891848398;
	Thu, 30 Jan 2025 14:14:23 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.mco,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	boris.brezillon@collabora.com,
	robh@kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fiona Behrens <me@kloenk.dev>
Subject: [PATCH v6 1/3] rust: io: add resource abstraction
Date: Thu, 30 Jan 2025 19:05:21 -0300
Message-ID: <20250130220529.665896-2-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250130220529.665896-1-daniel.almeida@collabora.com>
References: <20250130220529.665896-1-daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

In preparation for ioremap support, add a Rust abstraction for struct
resource.

A future commit will introduce the Rust API to ioremap a resource from a
platform device. The current abstraction, therefore, adds only the
minimum API needed to get that done.

Co-developed-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/io.c               |  36 +++++
 rust/kernel/io.rs               |   2 +
 rust/kernel/io/resource.rs      | 252 ++++++++++++++++++++++++++++++++
 4 files changed, 291 insertions(+)
 create mode 100644 rust/kernel/io/resource.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e9fdceb568b8..f9c2eedb5b9b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -16,6 +16,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/ioport.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/mdio.h>
diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 4c2401ccd720..939ab38ca61d 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/io.h>
+#include <linux/ioport.h>
 
 void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
 {
@@ -99,3 +100,38 @@ void rust_helper_writeq_relaxed(u64 value, volatile void __iomem *addr)
 	writeq_relaxed(value, addr);
 }
 #endif
+
+resource_size_t rust_helper_resource_size(struct resource *res)
+{
+	return resource_size(res);
+}
+
+struct resource *rust_helper_request_mem_region(resource_size_t start,
+						resource_size_t n,
+						const char *name)
+{
+	return request_mem_region(start, n, name);
+}
+
+void rust_helper_release_mem_region(resource_size_t start, resource_size_t n)
+{
+	release_mem_region(start, n);
+}
+
+struct resource *rust_helper_request_region(resource_size_t start,
+					    resource_size_t n, const char *name)
+{
+	return request_region(start, n, name);
+}
+
+struct resource *rust_helper_request_muxed_region(resource_size_t start,
+						  resource_size_t n,
+						  const char *name)
+{
+	return request_muxed_region(start, n, name);
+}
+
+void rust_helper_release_region(resource_size_t start, resource_size_t n)
+{
+	release_region(start, n);
+}
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index d4a73e52e3ee..566d8b177e01 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -7,6 +7,8 @@
 use crate::error::{code::EINVAL, Result};
 use crate::{bindings, build_assert};
 
+pub mod resource;
+
 /// Raw representation of an MMIO region.
 ///
 /// By itself, the existence of an instance of this structure does not provide any guarantees that
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
new file mode 100644
index 000000000000..64244a00786a
--- /dev/null
+++ b/rust/kernel/io/resource.rs
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstraction for system resources.
+//!
+//! C header: [`include/linux/ioport.h`](srctree/include/linux/ioport.h)
+
+use core::ops::Deref;
+use core::ptr::NonNull;
+
+use crate::str::CStr;
+use crate::types::Opaque;
+
+type RequestFn = unsafe extern "C" fn(
+    ResourceSize,
+    ResourceSize,
+    *const kernel::ffi::c_char,
+) -> *mut bindings::resource;
+
+#[cfg(CONFIG_HAS_IOPORT)]
+/// Returns a reference to the global `ioport_resource` variable.
+pub fn ioport_resource() -> &'static Resource {
+    // SAFETY: `bindings::ioport_resoure` has global lifetime and is of type Resource.
+    unsafe { Resource::from_ptr(core::ptr::addr_of_mut!(bindings::ioport_resource)) }
+}
+
+/// Returns a reference to the global `iomem_resource` variable.
+pub fn iomem_resource() -> &'static Resource {
+    // SAFETY: `bindings::iomem_resoure` has global lifetime and is of type Resource.
+    unsafe { Resource::from_ptr(core::ptr::addr_of_mut!(bindings::iomem_resource)) }
+}
+
+/// Resource Size type.
+/// This is a type alias to `u64`
+/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.
+#[cfg(CONFIG_PHYS_ADDR_T_64BIT)]
+pub type ResourceSize = u64;
+
+/// Resource Size type.
+/// This is a type alias to `u32`
+/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.
+#[cfg(not(CONFIG_PHYS_ADDR_T_64BIT))]
+pub type ResourceSize = u32;
+
+/// A region allocated from a parent resource.
+///
+/// # Invariants
+/// - `self.0` points to a valid `bindings::resource` that was obtained through
+/// `__request_region`.
+pub struct Region(NonNull<bindings::resource>);
+
+impl Deref for Region {
+    type Target = Resource;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Safe as per the invariant of `Region`
+        unsafe { Resource::from_ptr(self.0.as_ptr()) }
+    }
+}
+
+impl Drop for Region {
+    fn drop(&mut self) {
+        // SAFETY: Safe as per the invariant of `Region`
+        let res = unsafe { Resource::from_ptr(self.0.as_ptr()) };
+        let flags = res.flags();
+
+        let release_fn = if flags.contains(flags::IORESOURCE_MEM) {
+            bindings::release_mem_region
+        } else {
+            bindings::release_region
+        };
+
+        // SAFETY: Safe as per the invariant of `Region`
+        unsafe { release_fn(res.start(), res.size()) };
+    }
+}
+
+// SAFETY: `Region` only holds a pointer to a C `struct resource`, which is safe to be used from
+// any thead.
+unsafe impl Send for Region {}
+
+// SAFETY: `Region` only holds a pointer to a C `struct resource`, references to which are
+// safe to be used from any thead.
+unsafe impl Sync for Region {}
+
+/// A resource abstraction.
+///
+/// # Invariants
+///
+/// `Resource` is a transparent wrapper around a valid `bindings::resource`.
+#[repr(transparent)]
+pub struct Resource(Opaque<bindings::resource>);
+
+impl Resource {
+    /// Creates a reference to a [`Resource`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that for the duration of 'a, the pointer will
+    /// point at a valid `bindings::resource`
+    ///
+    /// The caller must also ensure that the `Resource` is only accessed via the
+    /// returned reference for the duration of 'a.
+    pub(crate) const unsafe fn from_ptr<'a>(ptr: *mut bindings::resource) -> &'a Self {
+        // SAFETY: Self is a transparent wrapper around `Opaque<bindings::resource>`.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// A helper to abstract the common pattern of requesting a region.
+    fn request_region_checked(
+        &self,
+        start: ResourceSize,
+        size: ResourceSize,
+        name: &CStr,
+        request_fn: RequestFn,
+    ) -> Option<Region> {
+        // SAFETY: Safe as per the invariant of `Resource`
+        let region = unsafe { request_fn(start, size, name.as_char_ptr()) };
+
+        Some(Region(NonNull::new(region)?))
+    }
+
+    /// Requests a resource region.
+    ///
+    /// Exclusive access will be given and the region will be marked as busy.
+    /// Further calls to `request_region` will return `None` if the region, or a
+    /// part of it, is already in use.
+    pub fn request_region(
+        &self,
+        start: ResourceSize,
+        size: ResourceSize,
+        name: &CStr,
+    ) -> Option<Region> {
+        self.request_region_checked(start, size, name, bindings::request_region)
+    }
+
+    /// Requests a resource region with the IORESOURCE_MUXED flag.
+    ///
+    /// Exclusive access will be given and the region will be marked as busy.
+    /// Further calls to `request_region` will return `None` if the region, or a
+    /// part of it, is already in use.
+    pub fn request_muxed_region(
+        &self,
+        start: ResourceSize,
+        size: ResourceSize,
+        name: &CStr,
+    ) -> Option<Region> {
+        self.request_region_checked(start, size, name, bindings::request_muxed_region)
+    }
+
+    /// Requests a memory resource region, i.e.: a resource of type
+    /// IORESOURCE_MEM.
+    ///
+    /// Exclusive access will be given and the region will be marked as busy.
+    /// Further calls to `request_region` will return `None` if the region, or a
+    /// part of it, is already in use.
+    pub fn request_mem_region(
+        &self,
+        start: ResourceSize,
+        size: ResourceSize,
+        name: &CStr,
+    ) -> Option<Region> {
+        self.request_region_checked(start, size, name, bindings::request_mem_region)
+    }
+
+    /// Returns the size of the resource.
+    pub fn size(&self) -> ResourceSize {
+        let inner = self.0.get();
+        // SAFETY: safe as per the invariants of `Resource`
+        unsafe { bindings::resource_size(inner) }
+    }
+
+    /// Returns the start address of the resource.
+    pub fn start(&self) -> u64 {
+        let inner = self.0.get();
+        // SAFETY: safe as per the invariants of `Resource`
+        unsafe { *inner }.start
+    }
+
+    /// Returns the name of the resource.
+    pub fn name(&self) -> &CStr {
+        let inner = self.0.get();
+        // SAFETY: safe as per the invariants of `Resource`
+        unsafe { CStr::from_char_ptr((*inner).name) }
+    }
+
+    /// Returns the flags associated with the resource.
+    pub fn flags(&self) -> Flags {
+        let inner = self.0.get();
+        // SAFETY: safe as per the invariants of `Resource`
+        let flags = unsafe { *inner }.flags;
+
+        Flags(flags)
+    }
+}
+
+// SAFETY: `Resource` only holds a pointer to a C `struct resource`, which is safe to be used from
+// any thead.
+unsafe impl Send for Resource {}
+
+// SAFETY: `Resource` only holds a pointer to a C `struct resource`, references to which are
+// safe to be used from any thead.
+unsafe impl Sync for Resource {}
+
+/// Resource flags as stored in the C `struct resource::flags` field.
+///
+/// They can be combined with the operators `|`, `&`, and `!`.
+///
+/// Values can be used from the [`flags`] module.
+#[derive(Clone, Copy, PartialEq)]
+pub struct Flags(u64);
+
+impl Flags {
+    /// Check whether `flags` is contained in `self`.
+    pub fn contains(self, flags: Flags) -> bool {
+        (self & flags) == flags
+    }
+}
+
+impl core::ops::BitOr for Flags {
+    type Output = Self;
+    fn bitor(self, rhs: Self) -> Self::Output {
+        Self(self.0 | rhs.0)
+    }
+}
+
+impl core::ops::BitAnd for Flags {
+    type Output = Self;
+    fn bitand(self, rhs: Self) -> Self::Output {
+        Self(self.0 & rhs.0)
+    }
+}
+
+impl core::ops::Not for Flags {
+    type Output = Self;
+    fn not(self) -> Self::Output {
+        Self(!self.0)
+    }
+}
+
+/// Resource flags as stored in the `struct resource::flags` field.
+pub mod flags {
+    use super::Flags;
+
+    /// PCI/ISA I/O ports
+    pub const IORESOURCE_IO: Flags = Flags(bindings::IORESOURCE_IO as u64);
+
+    /// Resource is software muxed.
+    pub const IORESOURCE_MUXED: Flags = Flags(bindings::IORESOURCE_MUXED as u64);
+
+    /// Resource represents a memory region.
+    pub const IORESOURCE_MEM: Flags = Flags(bindings::IORESOURCE_MEM as u64);
+}
-- 
2.48.0

