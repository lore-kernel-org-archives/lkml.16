Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580541F1313;
	Thu, 30 Jan 2025 22:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738275292; cv=pass; b=L0c4QBYHw6ibzo3RT4mF1sq6hoCiK2iuMf6W5He9CLEtlDhcuAQtUNTTkrsVVDw1HXMezfHFm1nk7x075auS1J+WNOXDLEU8W7Xa2LxMk+SVU6qg0Xev50D839DizcDEnvszG/ao58g9oUz80TL7yg+NSk5INI/d99wmZEZ/hts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738275292; c=relaxed/simple;
	bh=gY9MhPYBpjo05OWPTydOrrNx4uo5ZppNjZh+K/Xd72w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8nhynCqlH+TyZll5uzNpI51yM/J3cbzRqI9yw5918MZnZm1MetZFvJPLL1F10lXtwuS4cGxQw2QDUC/n+zjLPeJnpgN4WG5Bf7LwBkHGqTQM3IIjB4mZ+wDAc5m4DDs77Ck4uXTC/8PShmV6/l31GKWVJJ6E9ytEbCJvaf9aMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=gwUtWkCa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="gwUtWkCa"
ARC-Seal: i=1; a=rsa-sha256; t=1738275272; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jgyaaxTlexT1SG16MKgmtxGXcFKLu92rrymiqCzAE8jNTL03IqScqLLiWIDkVkc68RA/0ExNywuBhtm2d2YdviqxPVgCLOMCl8JLmt3h6mTTl2qDGeJg8kOBOtuvKRhW+aSdvHNz6x+Cn0iWIr8cGSyPooXfjxkM1QjvLzD9aEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738275272; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JN0sYBLGfhpZ6u8uZWDJDdKbvOzwsQgneZgTKdfEBHs=; 
	b=D11Jemt+xt9ulUehoSk4KtTpjxcdUEB2mcJvRSalD7TMd5JCqWKouk2nmxoHQ4o5k+p9Vs3kSHTM0wshOAhYl1faPfvSfVXijZvazF0HCtqyjzRLwJeoqiRP8qIM7yczx2zk+OrW83BmWoo1cxtzst6WDfcchZzp/CEz1Knja6g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738275272;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JN0sYBLGfhpZ6u8uZWDJDdKbvOzwsQgneZgTKdfEBHs=;
	b=gwUtWkCaIm52pvzxqQ5uo0fCg0B6/VC0JlCiD0G7w82iTLI2JXspufNbxqWlb02P
	90xZF84Y4/PiE6nLcHKH8WWWznqTQXYIJguxoLrF7XyqdP77TzLWWvlgwOHalj6xxfG
	QcWZl+YI81XeBDRrse8OyC2MUwmhQyIKdsN7BXM8=
Received: by mx.zohomail.com with SMTPS id 17382752677711013.3040681841859;
	Thu, 30 Jan 2025 14:14:27 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
Date: Thu, 30 Jan 2025 19:05:22 -0300
Message-ID: <20250130220529.665896-3-daniel.almeida@collabora.com>
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

Add a generic iomem abstraction to safely read and write ioremapped
regions.

The reads and writes are done through IoRaw, and are thus checked either
at compile-time, if the size of the region is known at that point, or at
runtime otherwise.

Non-exclusive access to the underlying memory region is made possible to
cater to cases where overlapped regions are unavoidable.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/io.rs     |   1 +
 rust/kernel/io/mem.rs | 125 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 rust/kernel/io/mem.rs

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 566d8b177e01..9ce3482b5ecd 100644
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
index 000000000000..f87433ed858e
--- /dev/null
+++ b/rust/kernel/io/mem.rs
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic memory-mapped IO.
+
+use core::ops::Deref;
+
+use crate::device::Device;
+use crate::devres::Devres;
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
+/// - ExclusiveIoMem has exclusive access to the underlying `iomem`.
+pub struct ExclusiveIoMem<const SIZE: usize> {
+    /// The region abstraction. This represents exclusive access to the
+    /// range represented by the underlying `iomem`.
+    ///
+    /// It's placed first to ensure that the region is released before it is
+    /// unmapped as a result of the drop order.
+    #[allow(dead_code)]
+    region: Region,
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
+            .request_mem_region(start, size, name)
+            .ok_or(EBUSY)?;
+
+        let iomem = ExclusiveIoMem { iomem, region };
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
+        &*self.iomem
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
+/// `IoMem` always holds an `IoRaw` inststance that holds a valid pointer to the
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
+        // SAFETY:
+        // - `res_start` and `size` are read from a presumably valid `struct resource`.
+        // - `size` is known not to be zero at this point.
+        let addr = unsafe { bindings::ioremap(res_start, size as kernel::ffi::c_ulong) };
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
2.48.0

