Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1912D3A88;
	Mon, 23 Jun 2025 18:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701718; cv=pass; b=Y1w8ut4rGExk92LH7+kB8PlW+53zqcft22duVhoqBIGN9C0hE/RvavcJ4LDfiBaaAuQ5JFU3M4VjmPwUREQWEkIwaFkHqtIoEmr0DAhMQIA3qaIHroCu8/DlHJfSidDNW2vW5cL4H3eMrCIXoDTjEGEPB92n56HPv3xHyRwwkDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701718; c=relaxed/simple;
	bh=gqe57Gt1/AsaP6Lk5heZxUpWQuZW+wILnzh1U51++LM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3cNFzlVnqVbZdcpAM8074tUDx18hHoQ0Y8vIQslEzODN23IroKHGvcgDFkcdhndjFhTuwLSfN2K9Yvav3Uv8U+9lsqrnUj6lZB59OygyUcyTgxBbtmtoD2Qp8eOEoqW1KhU0+SzKpNvNk4azkqsfu/tG9sgcIlTUDCyWgFQVKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=RRjlCR/8; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="RRjlCR/8"
ARC-Seal: i=1; a=rsa-sha256; t=1750701701; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MDBUR8mBLdfEVJLUYH8B5d7EBXYmhP7VisxJK/KGxbXGkkRZwLlzyCSFil3PZp83KzbQqDD1Xw00SauYwPco5RQK8jJEz/KkFnzD2yspK8ZHV3zb773au1PTjYeW2JRKCYP8G+OXDMvDEEy+cPNAFfzm1cmFnc0DaKeqeKUYGBo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750701701; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U3Ka0jrgiaMi7VcajGGF4TMYKe+38iCUzYIMv0gB1Jg=; 
	b=PjR483IaUJzQzlGXWo47yHyBZpX88sjQdtAY46Oha/b+9WLQeM5YWB87iHEXKs6rAdmjzSWXP7RFqEcH3zhfKmrCBJTPRNfF6AskGsOhRjFICjSm8C4EyI5oatEGqEEKN5Mzq5T4pBdX4wdEoSi+uFvYkEWjyCzCaFhhQxDBJ3c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750701701;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=U3Ka0jrgiaMi7VcajGGF4TMYKe+38iCUzYIMv0gB1Jg=;
	b=RRjlCR/8UBAHXkO4S5PG0/5PuvhkozwmF8Pe+I9DbBMtGbzYdDfbiI9JwI1as1jl
	TjtV1SbTUcqEzYE+ubUYZFzr2QLz6U3fsA4wjhR8DrKLAXLd+AGxYTkJ7aIunYoeiC+
	kWOHlujIXDwcpos0nONSWeO5J3jqTczhcppI4RRo=
Received: by mx.zohomail.com with SMTPS id 1750701698231550.6081453967741;
	Mon, 23 Jun 2025 11:01:38 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Jun 2025 15:01:01 -0300
Subject: [PATCH v10 4/4] rust: platform: allow ioremap of platform
 resources
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-topics-tyr-platform_iomem-v10-4-ed860a562940@collabora.com>
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

The preceding patches added support for resources, and for a general
IoMem abstraction, but thus far there is no way to access said IoMem
from drivers, as its creation is unsafe and depends on a resource that
must be acquired from some device first.

Now, allow the ioremap of platform resources themselves, thereby making
the IoMem available to platform drivers.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 120 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 0eedb8239fec31df7ab64dc68d220c9d965f1f21..5e787cf85f41722837bb34a6620c92d13d55625b 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -5,9 +5,14 @@
 //! C header: [`include/linux/platform_device.h`](srctree/include/linux/platform_device.h)
 
 use crate::{
-    bindings, container_of, device, driver,
+    bindings, container_of, device,
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
@@ -228,6 +233,117 @@ pub fn resource_by_name(&self, name: &CStr) -> Option<&Resource> {
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
+    ) -> Result<Devres<IoMem<SIZE>>> {
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
+    ) -> Result<Devres<ExclusiveIoMem<SIZE>>> {
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
+    pub fn iomap_resource(&self, resource: &Resource) -> Result<Devres<IoMem<0>>> {
+        self.iomap_resource_sized::<0>(resource)
+    }
+
+    /// Same as [`Self::iomap_resource`] but with exclusive access to the underlying
+    /// region.
+    pub fn iomap_resource_exclusive(
+        &self,
+        resource: &Resource,
+    ) -> Result<Devres<ExclusiveIoMem<0>>> {
+        self.iomap_resource_exclusive_sized::<0>(resource)
+    }
+}
+
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
 // argument.
 kernel::impl_device_context_deref!(unsafe { Device });

-- 
2.50.0

