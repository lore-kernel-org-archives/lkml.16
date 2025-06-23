Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DC028ECDE;
	Mon, 23 Jun 2025 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701710; cv=pass; b=pz5IrgOXSQwDaGquW7HbTuqrJhk+3wCKnFUXGluoKbb4aPgJdslbXXzoWQETotJIPPpDFvSPYjMgadkJJs2Z0/bRUEfm3QpKlU0NeQOCkH3uo16vPXnXdnIHIu+FY/jfOZtA54ZgcS7GhhiRslHs6dAqgXJMqnjkbJmaKXVXJME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701710; c=relaxed/simple;
	bh=sq3Q0uLG8bGNYrc02jS2SFjriPDRGj4eOUz8WbyIXKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdUaaJG/YQy88Bx+/xF+g8ibae2Kwqp0BJBeurz3os25XvS2iFzFWUQa3czCcsYr1MtT10bdmpQ9NAZk2Ck0J60jJZay4zmXKqx8TPRfA3M+HijbQiik7QOSLzI9ApaZybUUa2suX685t8ZKl3H/H02fIfnbszXPoLN9I25TPKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=AwI7HGih; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="AwI7HGih"
ARC-Seal: i=1; a=rsa-sha256; t=1750701691; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZJFAN8gqMz3WHD5WWJNUJC/zDsIXyf0yin7sxJ9zMOnXGu7dADPxKwwHeHno5WoBcfHLujbKndcRS7ImzhIfMCWD9m8OtBYX359Ld4DpJVQN+gNnUw/NqEvJi7l4phz7FZq+PGRp5UfLgc5S3CQGavSQ7lgX51oGQ1uAr6RIdBk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750701691; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v/zklfuAzyTlu9HDCWeDf9Ydv1ELPS8SbfUtRAJHhSs=; 
	b=LhgrdAz6K1xdnIrO4Q1270YnxdalGI51GZq7HqvQp0dL5XQfaooIpHLzyrBQlTWyNaNsX0+pFbIEq98OpzQ9bzLPsZIwJ2LdFSi4j8Rq22W8i5uapujgqDIjO5lPXd8AvzfKNr3eD6jYYKoZ80vaRlUL4wXU6JexgNapjnuWYxk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750701691;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=v/zklfuAzyTlu9HDCWeDf9Ydv1ELPS8SbfUtRAJHhSs=;
	b=AwI7HGihOcrtk1JagyeL9e+kigp1aTBBS5rF+HPHBzJ1xrxwDkq+xzN+tkD1lcpD
	7Zhsych1Bih5dOdKAl7Q3cu5E+R8dRdo3VoTrTKv1DNQWskAnmk0de7wL8iUyY8RYvW
	S7hXDMuAPQYHMYtEJCCzrznsMF3x+iTUWX7zU8JA=
Received: by mx.zohomail.com with SMTPS id 1750701688729856.990313539685;
	Mon, 23 Jun 2025 11:01:28 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Jun 2025 15:00:59 -0300
Subject: [PATCH v10 2/4] rust: io: mem: add a generic iomem abstraction
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-topics-tyr-platform_iomem-v10-2-ed860a562940@collabora.com>
References: <20250623-topics-tyr-platform_iomem-v10-0-ed860a562940@collabora.com>
In-Reply-To: <20250623-topics-tyr-platform_iomem-v10-0-ed860a562940@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Ying Huang <huang.ying.caritas@gmail.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

Add a generic iomem abstraction to safely read and write ioremapped
regions.

The reads and writes are done through IoRaw, and are thus checked either
at compile-time, if the size of the region is known at that point, or at
runtime otherwise.

Non-exclusive access to the underlying memory region is made possible to
cater to cases where overlapped regions are unavoidable.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/helpers/io.c     |   5 ++
 rust/kernel/io.rs     |   1 +
 rust/kernel/io/mem.rs | 142 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 404776cf6717c8570c7600a24712ce6e4623d3c6..c475913c69e647b1042e8e7d66b9148d892947a1 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -8,6 +8,11 @@ void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
 	return ioremap(offset, size);
 }
 
+void __iomem *rust_helper_ioremap_np(phys_addr_t offset, size_t size)
+{
+	return ioremap_np(offset, size);
+}
+
 void rust_helper_iounmap(void __iomem *addr)
 {
 	iounmap(addr);
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 7b70d5b5477e57d6d0f24bcd26bd8b0071721bc0..b7fc759f8b5d3c3ac6f33f5a66e9f619c58b7405 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -7,6 +7,7 @@
 use crate::error::{code::EINVAL, Result};
 use crate::{bindings, build_assert};
 
+pub mod mem;
 pub mod resource;
 
 pub use resource::Resource;
diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
new file mode 100644
index 0000000000000000000000000000000000000000..2bd9cf4c4f1a59f027999a6e9a203dc99ad6c003
--- /dev/null
+++ b/rust/kernel/io/mem.rs
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic memory-mapped IO.
+
+use core::ops::Deref;
+
+use crate::device::Bound;
+use crate::device::Device;
+use crate::devres::Devres;
+use crate::io;
+use crate::io::resource::Region;
+use crate::io::resource::Resource;
+use crate::io::Io;
+use crate::io::IoRaw;
+use crate::prelude::*;
+
+/// An exclusive memory-mapped IO region.
+///
+/// # Invariants
+///
+/// - [`ExclusiveIoMem`] has exclusive access to the underlying [`IoMem`].
+pub struct ExclusiveIoMem<const SIZE: usize> {
+    /// The region abstraction. This represents exclusive access to the
+    /// range represented by the underlying `iomem`.
+    ///
+    /// It's placed first to ensure that the region is released before it is
+    /// unmapped as a result of the drop order.
+    ///
+    /// This field is needed for ownership of the region.
+    _region: Region,
+    /// The underlying `IoMem` instance.
+    iomem: IoMem<SIZE>,
+}
+
+impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
+    /// Creates a new `ExclusiveIoMem` instance.
+    pub(crate) fn ioremap(resource: &Resource) -> Result<Self> {
+        let iomem = IoMem::ioremap(resource)?;
+
+        let start = resource.start();
+        let size = resource.size();
+        let name = resource.name();
+
+        let region = resource
+            .request_region(start, size, name, io::resource::flags::IORESOURCE_MEM)
+            .ok_or(EBUSY)?;
+
+        let iomem = ExclusiveIoMem {
+            iomem,
+            _region: region,
+        };
+
+        Ok(iomem)
+    }
+
+    pub(crate) fn new(resource: &Resource, device: &Device<Bound>) -> Result<Devres<Self>> {
+        let iomem = Self::ioremap(resource)?;
+        let devres = Devres::new(device, iomem, GFP_KERNEL)?;
+
+        Ok(devres)
+    }
+}
+
+impl<const SIZE: usize> Deref for ExclusiveIoMem<SIZE> {
+    type Target = Io<SIZE>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.iomem
+    }
+}
+
+/// A generic memory-mapped IO region.
+///
+/// Accesses to the underlying region is checked either at compile time, if the
+/// region's size is known at that point, or at runtime otherwise.
+///
+/// # Invariants
+///
+/// [`IoMem`] always holds an [`IoRaw`] instance that holds a valid pointer to the
+/// start of the I/O memory mapped region.
+pub struct IoMem<const SIZE: usize = 0> {
+    io: IoRaw<SIZE>,
+}
+
+impl<const SIZE: usize> IoMem<SIZE> {
+    fn ioremap(resource: &Resource) -> Result<Self> {
+        let size = resource.size();
+        if size == 0 {
+            return Err(EINVAL);
+        }
+
+        let res_start = resource.start();
+
+        let addr = if resource
+            .flags()
+            .contains(io::resource::flags::IORESOURCE_MEM_NONPOSTED)
+        {
+            // SAFETY:
+            // - `res_start` and `size` are read from a presumably valid `struct resource`.
+            // - `size` is known not to be zero at this point.
+            unsafe { bindings::ioremap_np(res_start, size as usize) }
+        } else {
+            // SAFETY:
+            // - `res_start` and `size` are read from a presumably valid `struct resource`.
+            // - `size` is known not to be zero at this point.
+            unsafe { bindings::ioremap(res_start, size as usize) }
+        };
+
+        if addr.is_null() {
+            return Err(ENOMEM);
+        }
+
+        let io = IoRaw::new(addr as usize, size as usize)?;
+        let io = IoMem { io };
+
+        Ok(io)
+    }
+
+    /// Creates a new `IoMem` instance.
+    pub(crate) fn new(resource: &Resource, device: &Device<Bound>) -> Result<Devres<Self>> {
+        let io = Self::ioremap(resource)?;
+        let devres = Devres::new(device, io, GFP_KERNEL)?;
+
+        Ok(devres)
+    }
+}
+
+impl<const SIZE: usize> Drop for IoMem<SIZE> {
+    fn drop(&mut self) {
+        // SAFETY: Safe as by the invariant of `Io`.
+        unsafe { bindings::iounmap(self.io.addr() as *mut core::ffi::c_void) }
+    }
+}
+
+impl<const SIZE: usize> Deref for IoMem<SIZE> {
+    type Target = Io<SIZE>;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Safe as by the invariant of `IoMem`.
+        unsafe { Io::from_raw(&self.io) }
+    }
+}

-- 
2.50.0

