Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15BD2E5B25;
	Fri,  4 Jul 2025 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646390; cv=pass; b=aKxdA+Gaf8p5Aw4yJEPDJIIn24KzjwJ1vIn1Ia/kaBWmOui9QfDo5JN6kAmk/FY0SDHQk61PUl24FB6vfEEgzjNb7jl7h3ymEZPg0f2sKzSprldcuHTbTXFNBCv1jgbZ/KJ4o15jAdDupqdS9g2K7mAj/uhUVcaJOU+Szp8LCu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646390; c=relaxed/simple;
	bh=dqbT+cv9K4EBv6qRIoIAMNiqazhPcGCp+b06vvi9oFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MeYXGrNxQHUGbX9FV/wzhQt89KKIRDgUaWgmAljOaln8iImlHbFAze4KqM/0hz7tMjmJzGMKLmhznccnUV/S7FR3nKCz2vIaWQVm4oCgCdL4dqFw1c3mNJL/yAelNr5UENbQqDQSnnhhuwNgufqRBPzoIad/a1FX99JKzkSscXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=L1GIgnEp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="L1GIgnEp"
ARC-Seal: i=1; a=rsa-sha256; t=1751646365; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g5TD45eKMNGIYst9HYtZMEBDoPPA5kOeCMT+4t5nsE3Z7tZbE8sfFrSE8+p1E6Nd2SiicnrRXmH4E54/uVcEjx84oCy/zK3IjeqxDBE/HNlPBl8BuXaCmVUa04f3esmiGZzNXZ/o1O9HuP7Xn7lO+KIlTttmroMXJ5TO5KUkMLg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751646365; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PElMNtxC61iJcBmNw0QxIXlWnoJj3FDm7n/ut91ZYCY=; 
	b=nF0pkgag/BMHPLrRN1mxProZgao9pyCIEjtaKtzqbhPsH/OqwOZ6zZ66zJ9/SJWL+lpdyN+kpfpwXBafuUfdqNfKNGDeHxgAMeZ8ULjyu7k7Gr0DtM9sdUlRpcjBXNO6axelARnBOS5hYgSiK9Pn8drbyTTtQg/4/hahOkA0jpc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751646365;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PElMNtxC61iJcBmNw0QxIXlWnoJj3FDm7n/ut91ZYCY=;
	b=L1GIgnEpe/k+xUsecqImfOKDVChffwDKZeyJTF7p3Mc7xK7/vFDC4iUBSLl5XbzI
	vV56EnLJ19ooz65YXg6ubup/AnHzzomUHAvETmwXhaiqhM3qOiA1I+J1sQLzAkjhLPp
	yp5GO4dncOOEcjWLa71a57SBEGai9byLyaG7G6NQ=
Received: by mx.zohomail.com with SMTPS id 1751646362711987.8884106579409;
	Fri, 4 Jul 2025 09:26:02 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 04 Jul 2025 13:25:27 -0300
Subject: [PATCH v12 2/3] rust: io: mem: add a generic iomem abstraction
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-topics-tyr-platform_iomem-v12-2-1d3d4bd8207d@collabora.com>
References: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
In-Reply-To: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
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
 Ying Huang <huang.ying.caritas@gmail.com>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

Add a generic iomem abstraction to safely read and write ioremapped
regions. This abstraction requires a previously acquired IoRequest
instance. This makes it so that both the resource and the device match,
or, in other words, that the resource is indeed a valid resource for a
given bound device.

A subsequent patch will add the ability to retrieve IoRequest instances
from platform devices.

The reads and writes are done through IoRaw, and are thus checked either
at compile-time, if the size of the region is known at that point, or at
runtime otherwise.

Non-exclusive access to the underlying memory region is made possible to
cater to cases where overlapped regions are unavoidable.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/helpers/io.c     |   5 +
 rust/kernel/io.rs     |   1 +
 rust/kernel/io/mem.rs | 274 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 280 insertions(+)

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
index 0000000000000000000000000000000000000000..b047b9a73ae535bb221b2aea48d875a66a3fbc13
--- /dev/null
+++ b/rust/kernel/io/mem.rs
@@ -0,0 +1,274 @@
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
+/// An IO request for a specific device and resource.
+pub struct IoRequest<'a> {
+    device: &'a Device<Bound>,
+    resource: &'a Resource,
+}
+
+impl<'a> IoRequest<'a> {
+    /// Creates a new [`IoRequest`] instance.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `resource` is valid for `device` during the
+    /// lifetime `'a`.
+    pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> Self {
+        IoRequest { device, resource }
+    }
+
+    /// Maps an [`IoRequest`] where the size is known at compile time.
+    ///
+    /// This uses the
+    /// [`ioremap()`](https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device)
+    /// C API.
+    ///
+    /// # Examples
+    ///
+    /// The following example uses a [`platform::Device`] for illustration
+    /// purposes.
+    ///
+    /// ```no_run
+    /// # use kernel::{bindings, c_str, platform, of, device::Core};
+    /// # struct SampleDriver;
+    ///
+    /// impl platform::Driver for SampleDriver {
+    ///    # type IdInfo = ();
+    ///    # const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = None;
+    ///
+    ///    fn probe(
+    ///       pdev: &platform::Device<Core>,
+    ///       info: Option<&Self::IdInfo>,
+    ///    ) -> Result<Pin<KBox<Self>>> {
+    ///       let offset = 0; // Some offset.
+    ///
+    ///       // If the size is known at compile time, use [`Self::iomap_sized`].
+    ///       //
+    ///       // No runtime checks will apply when reading and writing.
+    ///       let request = pdev.request_io_by_index(0).ok_or(ENODEV)?;
+    ///       let iomem = request.iomap_sized::<42>()?;
+    ///       let iomem = KBox::pin_init(iomem, GFP_KERNEL)?;
+    ///
+    ///       let io = iomem.access(pdev.as_ref())?;
+    ///
+    ///       // Read and write a 32-bit value at `offset`.
+    ///       let data = io.read32_relaxed(offset);
+    ///
+    ///       io.write32_relaxed(data, offset);
+    ///
+    ///       # Ok(KBox::new(SampleDriver, GFP_KERNEL)?.into())
+    ///     }
+    /// }
+    /// ```
+    pub fn iomap_sized<const SIZE: usize>(
+        self,
+    ) -> Result<impl PinInit<Devres<IoMem<SIZE>>, Error> + 'a> {
+        IoMem::new(self)
+    }
+
+    /// Same as [`Self::iomap_sized`] but with exclusive access to the
+    /// underlying region.
+    ///
+    /// This uses the
+    /// [`ioremap()`](https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device)
+    /// C API.
+    pub fn iomap_exclusive_sized<const SIZE: usize>(
+        self,
+    ) -> Result<impl PinInit<Devres<ExclusiveIoMem<SIZE>>, Error> + 'a> {
+        ExclusiveIoMem::new(self)
+    }
+
+    /// Maps an [`IoRequest`] where the size is not known at compile time,
+    ///
+    /// This uses the
+    /// [`ioremap()`](https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device)
+    /// C API.
+    ///
+    /// # Examples
+    ///
+    /// The following example uses a [`platform::Device`] for illustration
+    /// purposes.
+    ///
+    /// ```no_run
+    /// # use kernel::{bindings, c_str, platform, of, device::Core};
+    /// # struct SampleDriver;
+    ///
+    /// impl platform::Driver for SampleDriver {
+    ///    # type IdInfo = ();
+    ///    # const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = None;
+    ///
+    ///    fn probe(
+    ///       pdev: &platform::Device<Core>,
+    ///       info: Option<&Self::IdInfo>,
+    ///    ) -> Result<Pin<KBox<Self>>> {
+    ///       let offset = 0; // Some offset.
+    ///
+    ///       // Unlike [`Self::iomap_sized`], here the size of the memory region
+    ///       // is not known at compile time, so only the `try_read*` and `try_write*`
+    ///       // family of functions should be used, leading to runtime checks on every
+    ///       // access.
+    ///       let request = pdev.request_io_by_index(0).ok_or(ENODEV)?;
+    ///       let iomem = request.iomap()?;
+    ///       let iomem = KBox::pin_init(iomem, GFP_KERNEL)?;
+    ///
+    ///       let io = iomem.access(pdev.as_ref())?;
+    ///
+    ///       let data = io.try_read32_relaxed(offset)?;
+    ///
+    ///       io.try_write32_relaxed(data, offset)?;
+    ///
+    ///       # Ok(KBox::new(SampleDriver, GFP_KERNEL)?.into())
+    ///     }
+    /// }
+    /// ```
+    pub fn iomap(self) -> Result<impl PinInit<Devres<IoMem<0>>, Error> + 'a> {
+        Self::iomap_sized::<0>(self)
+    }
+
+    /// Same as [`Self::iomap`] but with exclusive access to the underlying
+    /// region.
+    pub fn iomap_exclusive(self) -> Result<impl PinInit<Devres<ExclusiveIoMem<0>>, Error> + 'a> {
+        Self::iomap_exclusive_sized::<0>(self)
+    }
+}
+
+/// An exclusive memory-mapped IO region.
+///
+/// # Invariants
+///
+/// - [`ExclusiveIoMem`] has exclusive access to the underlying [`IoMem`].
+#[pin_data]
+pub struct ExclusiveIoMem<const SIZE: usize> {
+    /// The underlying `IoMem` instance.
+    iomem: IoMem<SIZE>,
+
+    /// The region abstraction. This represents exclusive access to the
+    /// range represented by the underlying `iomem`.
+    ///
+    /// This field is needed for ownership of the region.
+    _region: Region,
+}
+
+impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
+    /// Creates a new `ExclusiveIoMem` instance.
+    fn ioremap(resource: &Resource) -> Result<Self> {
+        let start = resource.start();
+        let size = resource.size();
+        let name = resource.name();
+
+        let region = resource
+            .request_region(start, size, name, io::resource::flags::IORESOURCE_MEM)
+            .ok_or(EBUSY)?;
+
+        let iomem = IoMem::ioremap(resource)?;
+
+        let iomem = ExclusiveIoMem {
+            iomem,
+            _region: region,
+        };
+
+        Ok(iomem)
+    }
+
+    /// Creates a new `ExclusiveIoMem` instance from a previously acquired [`IoRequest`].
+    pub fn new<'a>(io_request: IoRequest<'a>) -> Result<impl PinInit<Devres<Self>, Error> + 'a> {
+        let iomem = Self::ioremap(io_request.resource)?;
+        let devres = Devres::new(io_request.device, iomem);
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
+    /// Creates a new `IoMem` instance from a previously acquired [`IoRequest`].
+    pub fn new<'a>(io_request: IoRequest<'a>) -> Result<impl PinInit<Devres<Self>, Error> + 'a> {
+        let io = Self::ioremap(io_request.resource)?;
+        let devres = Devres::new(io_request.device, io);
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

