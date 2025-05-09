Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6F2620CF;
	Fri,  9 May 2025 20:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822664; cv=pass; b=sLUFEiM5FnneEaXeKovdhyKTRIRdkuUvtELY55US9PzsjxkpTh/z2s/pAF3qXBhx56F0TeGkx6LL7LA+mrpohPDFCWPqfZVd6CTw30ygNPnXCNzOHB+pxbxbMSFlfbbF7gvYWyttG3SMcHR9+k4kjbLdF11cwh2FrBrdP+8fmt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822664; c=relaxed/simple;
	bh=uGsHslfadVtzQMFd7uv3XnKZO1T7hO4Vzaci6mywkWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhmW/0JgG4Ckv+GNNG+FbjLXRK9incyVNWibNI+e3BJxYOes8fCFrlXE8MM8uQBGYR1EaOBszU/SH3jW5L0fvo97Rk1kUdAkKqsn4eQMdwNb8kZm9glNg9Cu5kWRQ8w1aKhW8+8R9M8fAngA2alv+JO82c+XdUOLDOFxgmD90TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=JtfVNi7X; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JtfVNi7X"
ARC-Seal: i=1; a=rsa-sha256; t=1746822630; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cezu0ZaIyjSZABX8T0ud6Iq62sThklHbV76PZoBUjl6/MlMzPBaJtdzWVa8qdWZZ1HOS7g0im6vqkTG4SZafEZDtnwfgpVpaVUnEoX0aCiU+cIt7M13AHROwtmwdJIzj/YvKagjD8HopEiLcvDmxkbgM52IVvBzARPrzDypxfDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746822630; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qu73aN/11JKKL7rBUc2aLWgmQaah1q4olqaWKa9p0bM=; 
	b=SaYG94J1egXe2nKW4cdPS6Zdb2BeIpsDAw0TH2vAC1iYG5rr11931C6sgc/cp5KseDr4LuzUjvnSqTQ2tuT0runh1JUsn3J0suaxYAyIgAjs/gD+St/N49le0UqnmRTB+nfD0gdnGMeu2dhG12B0mS5/c2HxySTKTRmtnMv6uiE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746822630;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qu73aN/11JKKL7rBUc2aLWgmQaah1q4olqaWKa9p0bM=;
	b=JtfVNi7XKK30bXxClVxNkTvpKadznmdQP7gAWPPyCGY0XEh9QAU5/Jqxyx0yT+sj
	vYhhYPQCGoIzJTfzuaT685qW45G9Txn7VWnP7Z5XzmijjYP+Y9+QwENYUdzyvYtY1VH
	ngM4Qaf4EanH6ubZJBp9Zvk2KPFEPa76I1RsfPfc=
Received: by mx.zohomail.com with SMTPS id 1746822629167357.30977442245967;
	Fri, 9 May 2025 13:30:29 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 09 May 2025 17:29:47 -0300
Subject: [PATCH v8 2/3] rust: io: mem: add a generic iomem abstraction
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topics-tyr-platform_iomem-v8-2-e9f1725a40da@collabora.com>
References: <20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com>
In-Reply-To: <20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com>
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
 rust/kernel/io/mem.rs | 141 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+)

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
index 0000000000000000000000000000000000000000..3e7ef8b6f0ca8b5b195a94c7ed0f94a9e6c72944
--- /dev/null
+++ b/rust/kernel/io/mem.rs
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic memory-mapped IO.
+
+use core::ops::Deref;
+
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
+/// - [`ExclusiveIoMem`] has exclusive access to the underlying `iomem`.
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
+    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<Devres<Self>> {
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
+/// `IoMem` always holds an `IoRaw` instance that holds a valid pointer to the
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
+    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<Devres<Self>> {
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

