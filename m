Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87A22A813;
	Tue,  3 Jun 2025 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963207; cv=pass; b=W/gcyIKKeifw1oXOcdgG7DdWzQgHxMezQPz/vgx3ecilN68r45G0n6yjp9BKM+elFbcglzLtRrP5dNqNM7B3ICEyulefTjSFZ9398VAIBjn4RZd5C6r/8T6x0h40+FL7/3sqchTEORG412mlyDgQWvRmDqcvfq8WjDTURxb2gAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963207; c=relaxed/simple;
	bh=eLjKllphdx9D9dVx/N8mD3nHYKl+fZN252MJd5iFBqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5sIBDLSWFtzW4MgYosoooXhYOqh8+TjaJQbsD/WjHTUWHE8vhi77i3S0OAWfhbHLbjts/8mVf8eB2nuD23HSu2x3ZkUPl1qLSPZF0ZSRQ1OxRIx4eZqnjcdDBB2aYtd9bORo4luZWhW8qAxdaVR64WelofawOBwERctl4Xxhho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=hqUAMUFf; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="hqUAMUFf"
ARC-Seal: i=1; a=rsa-sha256; t=1748963182; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d7j9Qp/gj1od7h26bQfjh69o4/6T3GA4uLeIh0QHwqkTtde88lsUIdEIcNxk6GG34hppMw0+c7THT7sVOHTayYf87mHxk8mmK0b+O8ePIlFv+i9F84xSgHkcLkXE17RPi1Iai8/cKpp/U3GO6JqO4KjPjxGoUdZv5YXnS5qV4/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748963182; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2uyj7NIVcWkTF2iRk/SFYpp1aLvAuNsvuv8ite9SmzE=; 
	b=lbNSnfyL3dggUm9gcjLXK1eyC1GQUQ03f6QlYosyi9SkggQ6iYprmOxlHHQ65mVvuMKszyx2Csediuk1mBEsltFoOsKKjiPp0Rp96uQm3paqZJRRm0djBrSWaQ7MBs2zVa4ni0xBop7b0fynRSj0bH9d//JSILbw4Sbu2vuXRq8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748963182;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2uyj7NIVcWkTF2iRk/SFYpp1aLvAuNsvuv8ite9SmzE=;
	b=hqUAMUFfmb2fyw7JRyinCUlELSfOOSxF6fl4SGEDUQsQ4LCuR4i0dKcPMpqiiVdu
	dsc9Ae/U8k4K9YoFoxnu1jXK4H7ghLJDwoqQaNg03GwK7FxPMH+AzOSRijV5pevIYRE
	r4+rSCVu9fhmVIw3Ko4lpxhSPCCMEl3GGv3crCHo=
Received: by mx.zohomail.com with SMTPS id 1748963180462299.34861723796234;
	Tue, 3 Jun 2025 08:06:20 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 03 Jun 2025 12:05:28 -0300
Subject: [PATCH v9 2/4] rust: io: mem: add a generic iomem abstraction
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-topics-tyr-platform_iomem-v9-2-a27e04157e3e@collabora.com>
References: <20250603-topics-tyr-platform_iomem-v9-0-a27e04157e3e@collabora.com>
In-Reply-To: <20250603-topics-tyr-platform_iomem-v9-0-a27e04157e3e@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Ying Huang <huang.ying.caritas@gmail.com>
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
index 939ab38ca61dac4cf884677a20edc760094d5812..4fbd70ab60f64155bef835a43b3c64d441aee7bf 100644
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
 void rust_helper_iounmap(volatile void __iomem *addr)
 {
 	iounmap(addr);
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 1da447078633e058000953a581b59d3ed5eb0e69..0249aedd8c6ce435b6b00137be0895a206956bca 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -7,6 +7,7 @@
 use crate::error::{code::EINVAL, Result};
 use crate::{bindings, build_assert};
 
+pub mod mem;
 pub mod resource;
 
 /// Raw representation of an MMIO region.
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
2.49.0

