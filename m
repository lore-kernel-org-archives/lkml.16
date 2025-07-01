Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4872727E2;
	Tue,  1 Jul 2025 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380552; cv=pass; b=Xgnfh0VcMpj8MvnsLdvKEiT7Jn59HCRZTsP/ZJCCOoiy6uuuLw8gEpFwpSGBN4FqtPMs3y+usuvqeb49GnDYBYZRuqgb7IwYz1xfDL5bGmTX6aOLMX7aAATkacIReyEzCFBXh5X6PvXFXfJ06UeyuhjgY4ucMVHrP+0isP7uhjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380552; c=relaxed/simple;
	bh=RFF4HZsCA1/aqivGylnpl/zmYTyzs6/vFUohEaI8E3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhf1w/E0hsVUhWrPQN0cPBrh+5i3l6plV9IeneaYF/7vob7oakWuczJWmtgMM8EclLbxWnxi91KjafHi5UqMlYSIq6DG/IfeX+xGC/0shu3Sjx6wubyhZB4D+5Ii6Auct2lssCX0aCgCDSFPE/dLERFdD+OK5xukM9HFg+OhqWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=e/RlLUV4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="e/RlLUV4"
ARC-Seal: i=1; a=rsa-sha256; t=1751380527; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TGVCgLk9mPGH4aRpbk61SIulwbSL077y4suEJkY3JBvVg+64IwA8vNum9OCdOxTw661Dr1TeTcvnFPDLfWq0Z2mOLM8oxySDi+uPOtW9czdOKg5eVHdHrjeE8n7pbypvaG6PEOPD4pRp7uuSS1iU2t6kFefRZDCo/ax+UyrLlAQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751380527; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9qx2K7ri1vTm3J/raEM49wZb7qlOxaHzPm52ap9Pbqw=; 
	b=OSGrwb2mknssxqiAsYQsxJVwDLjvoRiLjDuKLiue5xtesHFQu2xSNWVrYVC9VN4skLx5M9daUkfPNFaTaj0yAxAJhDPGqGVf77VkVNaPevDLrK37rcCUfp5eqBrejXirArNsF2Uv6L9P3N6UjaFD0ORnde0ANqVfjzokcObwblo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751380527;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9qx2K7ri1vTm3J/raEM49wZb7qlOxaHzPm52ap9Pbqw=;
	b=e/RlLUV4K9sj45DLW2xRIs8SIo7EZ4MRYxReUz/NjbJCBWqCkHX8QCIUfTRvrbS5
	NYzj505blrWfIEy1pBD/0dFgGgT8FMnqL6t0Qceq1cDLDN4VzaBDli70WiXNetio7yJ
	ZWdThDmoeZ9em3fIh8z77+5fSTtbDvwbui/+hca0=
Received: by mx.zohomail.com with SMTPS id 1751380526351830.310196252349;
	Tue, 1 Jul 2025 07:35:26 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 01 Jul 2025 11:34:42 -0300
Subject: [PATCH v11 4/4] rust: platform: allow ioremap of platform
 resources
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-topics-tyr-platform_iomem-v11-4-6cd5d5061151@collabora.com>
References: <20250701-topics-tyr-platform_iomem-v11-0-6cd5d5061151@collabora.com>
In-Reply-To: <20250701-topics-tyr-platform_iomem-v11-0-6cd5d5061151@collabora.com>
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

The preceding patches added support for resources, and for a general
IoMem abstraction, but thus far there is no way to access said IoMem
from drivers, as its creation is unsafe and depends on a resource that
must be acquired from some device first.

Now, allow the ioremap of platform resources themselves, thereby making
the IoMem available to platform drivers.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 127 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index bafd3ccea6d15b7965d1a993deef3f58e03b3490..b2c17fd6ab990c0b5ae6d6ed2e466b199eae2536 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -5,9 +5,14 @@
 //! C header: [`include/linux/platform_device.h`](srctree/include/linux/platform_device.h)
 
 use crate::{
-    acpi, bindings, container_of, device, driver,
+    acpi, bindings, container_of, device,
+    devres::Devres,
+    driver,
     error::{to_result, Result},
-    io::Resource,
+    io::{
+        mem::{ExclusiveIoMem, IoMem},
+        Resource,
+    },
     of,
     prelude::*,
     str::CStr,
@@ -251,6 +256,124 @@ pub fn resource_by_name(&self, name: &CStr) -> Option<&Resource> {
     }
 }
 
+impl Device<device::Bound> {
+    /// Maps a platform resource where the size is known at compile time.
+    ///
+    /// This uses the
+    /// [`ioremap()`](https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device)
+    /// C API.
+    ///
+    /// # Examples
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
+    ///       // If the size is known at compile time, use [`Self::iomap_resource_sized`].
+    ///       //
+    ///       // No runtime checks will apply when reading and writing.
+    ///       let resource = pdev.resource_by_index(0).ok_or(ENODEV)?;
+    ///       let iomem = pdev.iomap_resource_sized::<42>(&resource)?;
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
+    pub fn iomap_resource_sized<const SIZE: usize>(
+        &self,
+        resource: &Resource,
+    ) -> Result<impl PinInit<Devres<IoMem<SIZE>>, Error> + '_> {
+        IoMem::new(resource, self.as_ref())
+    }
+
+    /// Same as [`Self::iomap_resource_sized`] but with exclusive access to the
+    /// underlying region.
+    ///
+    /// This uses the
+    /// [`ioremap()`](https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device)
+    /// C API.
+    pub fn iomap_resource_exclusive_sized<const SIZE: usize>(
+        &self,
+        resource: &Resource,
+    ) -> Result<impl PinInit<Devres<ExclusiveIoMem<SIZE>>, Error> + '_> {
+        ExclusiveIoMem::new(resource, self.as_ref())
+    }
+
+    /// Maps a platform resource through `iomap()`.
+    ///
+    /// This uses the
+    /// [`ioremap()`](https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device)
+    /// C API.
+    ///
+    /// # Examples
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
+    ///       // Unlike [`Self::iomap_resource_sized`], here the size of the memory region
+    ///       // is not known at compile time, so only the `try_read*` and `try_write*`
+    ///       // family of functions should be used, leading to runtime checks on every
+    ///       // access.
+    ///       let resource = pdev.resource_by_index(0).ok_or(ENODEV)?;
+    ///       let iomem = pdev.iomap_resource(&resource)?;
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
+    pub fn iomap_resource(
+        &self,
+        resource: &Resource,
+    ) -> Result<impl PinInit<Devres<IoMem<0>>, Error> + '_> {
+        self.iomap_resource_sized::<0>(resource)
+    }
+
+    /// Same as [`Self::iomap_resource`] but with exclusive access to the underlying
+    /// region.
+    pub fn iomap_resource_exclusive(
+        &self,
+        resource: &Resource,
+    ) -> Result<impl PinInit<Devres<ExclusiveIoMem<0>>, Error> + '_> {
+        self.iomap_resource_exclusive_sized::<0>(resource)
+    }
+}
+
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
 // argument.
 kernel::impl_device_context_deref!(unsafe { Device });

-- 
2.50.0

