Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130581F12F8;
	Thu, 30 Jan 2025 22:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738275291; cv=pass; b=lydRuiaasl7mQHHN5FTIjFGQoDTDnj2/F4mZQNiXiDqT9n/VVkK8hFvX17FrlLqTVuwu/bbdxv8UmM1SAc3gMZmKkS1qz2R1vE6SwDbU57BK/U8w+SwOWH2VT5GdzIS1kiwvqFMPuM0D0hlzXhvPJ4cf+XpK4N4L03fvyTH0/UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738275291; c=relaxed/simple;
	bh=kvbElVerjWF9U+ONGldy737b8Di61wJAlv5uzg+U+gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uq86npSHrwmVv9QDKP3dl9ouAYkJ11UJfv0GikAoFmIXnRzOSeQcl5uteg4ySWo8ZjJmklAvCvcfcGZzOn0DP6yZFYLVdE6d+y2pE52LZ2xyMcxwbLnTs+K7gjcxDDI+rUQIOFiGAMJdX6h8QWwh0ivh01tyWgsJmA7BlpzIZxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=AZ8lgX8z; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="AZ8lgX8z"
ARC-Seal: i=1; a=rsa-sha256; t=1738275276; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZSMfRO3cZGYdMFdMJhOXYClkHKmlq8vNWirb2LtFEWenJtm+Zfu2tA2kK4lOsnSFu7t4HQ/ott+klb1ZOoVRKzegdLZOhfLqzAXLgOcq2e4/sBQIpAQKnNcvpKLq+sA0JnGk1zqSgqHE8+NUc3hQLfpXszFqmLSGkjbcG2TRWDQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738275276; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q4/EAk52LC61HbVfLhV42xi0mncVAlXJG+fl9RaZtxQ=; 
	b=cYmOBx4dNiaDn5KsCpXLDL/PpKgeI6Y0dNqjsiNx83i2LuRq+LapTCTT9zeg3SyrN5fterKfqWouic2Z6wroP543MKaKh+FPvzZPCDJUryXgZj07oahEuBOZkEl0KmYfq+FMz93P5cRqhAfy+G/NRPaAMBBkb+x5kNT0xt7O51k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738275276;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=q4/EAk52LC61HbVfLhV42xi0mncVAlXJG+fl9RaZtxQ=;
	b=AZ8lgX8z1YBFTmLVbDXDlPFmG3r/tdAWxILY5bHkQ3MYx/gbzARBNYJ4di0k4PLN
	XERvQsQQ+HMoR6WX+esZym1UxRBIS5BzD6D7c27w2baoZOSitbzWUAq8STeODXncqXx
	s/MOjNjzg7uvqn9tNQPs7N2ve/zXGbawVCjKg6v0=
Received: by mx.zohomail.com with SMTPS id 1738275272360333.3154406555783;
	Thu, 30 Jan 2025 14:14:32 -0800 (PST)
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
Subject: [PATCH v6 3/3] rust: platform: allow ioremap of platform resources
Date: Thu, 30 Jan 2025 19:05:23 -0300
Message-ID: <20250130220529.665896-4-daniel.almeida@collabora.com>
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

The preceding patches added support for resources, and for a general
IoMem abstraction, but thus far there is no way to access said IoMem
from drivers, as its creation is unsafe and depends on a resource that
must be acquired from some device first.

Now, allow the ioremap of platform resources themselves, thereby making
the IoMem available to platform drivers.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 123 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 50e6b0421813..0ab10d2dfd5e 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -5,8 +5,14 @@
 //! C header: [`include/linux/platform_device.h`](srctree/include/linux/platform_device.h)
 
 use crate::{
-    bindings, container_of, device, driver,
+    bindings, container_of, device,
+    devres::Devres,
+    driver,
     error::{to_result, Result},
+    io::{
+        mem::{ExclusiveIoMem, IoMem},
+        resource::Resource,
+    },
     of,
     prelude::*,
     str::CStr,
@@ -191,6 +197,121 @@ fn as_raw(&self) -> *mut bindings::platform_device {
         // embedded in `struct platform_device`.
         unsafe { container_of!(self.0.as_raw(), bindings::platform_device, dev) }.cast_mut()
     }
+
+    /// Maps a platform resource through ioremap() where the size is known at
+    /// compile time.
+    ///
+    /// # Examples
+    ///
+    /// ```no_run
+    /// use kernel::{bindings, c_str, platform};
+    ///
+    /// fn probe(pdev: &mut platform::Device, /* ... */) -> Result<()> {
+    ///     let offset = 0; // Some offset.
+    ///
+    ///     // If the size is known at compile time, use `ioremap_resource_sized`.
+    ///     // No runtime checks will apply when reading and writing.
+    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
+    ///     let iomem = pdev.ioremap_resource_sized::<42>(&resource)?;
+    ///
+    ///     // Read and write a 32-bit value at `offset`. Calling `try_access()` on
+    ///     // the `Devres` makes sure that the resource is still valid.
+    ///     let data = iomem.try_access().ok_or(ENODEV)?.readl(offset);
+    ///
+    ///     iomem.try_access().ok_or(ENODEV)?.writel(data, offset);
+    ///
+    ///     # Ok::<(), Error>(())
+    /// }
+    /// ```
+    pub fn ioremap_resource_sized<const SIZE: usize>(
+        &self,
+        resource: &Resource,
+    ) -> Result<Devres<IoMem<SIZE>>> {
+        IoMem::new(resource, self.as_ref())
+    }
+
+    /// Same as [`Self::ioremap_resource_sized`] but with exclusive access to the
+    /// underlying region.
+    pub fn ioremap_resource_exclusive_sized<const SIZE: usize>(
+        &self,
+        resource: &Resource,
+    ) -> Result<Devres<ExclusiveIoMem<SIZE>>> {
+        ExclusiveIoMem::new(resource, self.as_ref())
+    }
+
+    /// Maps a platform resource through ioremap().
+    ///
+    /// # Examples
+    ///
+    /// ```no_run
+    /// # use kernel::{bindings, c_str, platform};
+    ///
+    /// fn probe(pdev: &mut platform::Device, /* ... */) -> Result<()> {
+    ///     let offset = 0; // Some offset.
+    ///
+    ///     // Unlike `ioremap_resource_sized`, here the size of the memory region
+    ///     // is not known at compile time, so only the `try_read*` and `try_write*`
+    ///     // family of functions are exposed, leading to runtime checks on every
+    ///     // access.
+    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
+    ///     let iomem = pdev.ioremap_resource(&resource)?;
+    ///
+    ///     let data = iomem.try_access().ok_or(ENODEV)?.try_readl(offset)?;
+    ///
+    ///     iomem.try_access().ok_or(ENODEV)?.try_writel(data, offset)?;
+    ///
+    ///     # Ok::<(), Error>(())
+    /// }
+    /// ```
+    pub fn ioremap_resource(&self, resource: &Resource) -> Result<Devres<IoMem<0>>> {
+        self.ioremap_resource_sized::<0>(resource)
+    }
+
+    /// Same as [`Self::ioremap_resource`] but with exclusive access to the underlying
+    /// region.
+    pub fn ioremap_resource_exclusive(
+        &self,
+        resource: &Resource,
+    ) -> Result<Devres<ExclusiveIoMem<0>>> {
+        self.ioremap_resource_exclusive_sized::<0>(resource)
+    }
+
+    /// Returns the resource at `index`, if any.
+    pub fn resource(&self, index: u32) -> Option<&Resource> {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct platform_device`.
+        let resource = unsafe {
+            bindings::platform_get_resource(self.as_raw(), bindings::IORESOURCE_MEM, index)
+        };
+
+        if resource.is_null() {
+            return None;
+        }
+
+        // SAFETY: `resource` is a valid pointer to a `struct resource` as
+        // returned by `platform_get_resource`.
+        Some(unsafe { Resource::from_ptr(resource) })
+    }
+
+    /// Returns the resource with a given `name`, if any.
+    pub fn resource_by_name(&self, name: &CStr) -> Option<&Resource> {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct
+        // platform_device` and `name` points to a valid C string.
+        let resource = unsafe {
+            bindings::platform_get_resource_byname(
+                self.as_raw(),
+                bindings::IORESOURCE_MEM,
+                name.as_char_ptr(),
+            )
+        };
+
+        if resource.is_null() {
+            return None;
+        }
+
+        // SAFETY: `resource` is a valid pointer to a `struct resource` as
+        // returned by `platform_get_resource`.
+        Some(unsafe { Resource::from_ptr(resource) })
+    }
 }
 
 impl AsRef<device::Device> for Device {
-- 
2.48.0

