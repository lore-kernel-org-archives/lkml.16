Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F042609C5;
	Fri,  9 May 2025 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822658; cv=pass; b=am1a4vt13AxtUw8p0Iam3cnuJtaGqQChE5RmoJa45oZDVmr67SRyT3JQO7urWJ/hZy5Gn7j4E5sRwvJrMBNgdckyOQnmij2cGW4rI6t92D9IG8aMs/XPut/i1R1X8Mgo39AV85aAZRAopPHyUWbzA7sF9VxwC8wJXmxdm1hLnsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822658; c=relaxed/simple;
	bh=g4xK+IK4BImSC14HdsS++ep7CdOpLL494mV1DOevMbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NEFHT36E5j/d1Ad0JNGBc1xqSxPdBI58/TzEYG6SPMtTGYhWAxqJsyOi99WZuwUZ+0Kr2lYIw1gSfuNCySag/18b3sYvkMFD5I7qQbWw9U6GqXed3Y7hpxox8G0dEINCF/QuW9cNNpYOBihNVqej/D+Tj1DKNedKPILVNh5Tvag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Wkso9Q0z; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Wkso9Q0z"
ARC-Seal: i=1; a=rsa-sha256; t=1746822636; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LmtcfD2g/GmXS1hmLLMlkdQ/R7gXOFJzN6Hhpvi2wkOCJ4qlFIbOWfxo6NoVekfFIju+9jaZ/X2k9paISwPQV/u+EShHihFVhbt30iJEbavQefuB5J0uJabb9bPRj1sd21bcayLGt1u9pcfm88ISUCWT4Y8Qpg0rQVe/AuQWMVc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746822636; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RElrvEtrUBjegoNK3Js/pxhC9lRfgLJ048TkPpu2NmM=; 
	b=acp5Wh72RFLfqb4iMhop6MnEewVeMndlP/AQyOvmwwmxK1+u4FhiVhVVgNG3EiO+O6G8uK7ObubQGrYXCNxwQXium8XdDTLx+vxcEp/uJto4QWmk3iSVNoj6ZwOUqBFmdTnLaUhQREDK2HH9TTnpidXN8JGF0vFQjeJETGudW2A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746822636;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RElrvEtrUBjegoNK3Js/pxhC9lRfgLJ048TkPpu2NmM=;
	b=Wkso9Q0zvtAe/gSm9XizkSe8vA83TY2PfI3NgsDk7Fqy9S1J/BZbHSfvD12nFmUk
	7nrT4fhVRDXfxemHYV7GisduvJGOkuIx9B3+u+uSiCNRL6L9SPYnuvnpyaJJDCnW+Yx
	VxQ3uaOa1p9DtNOm478IxPvQvas/X/IH71AYV8no=
Received: by mx.zohomail.com with SMTPS id 1746822635564827.5178149363463;
	Fri, 9 May 2025 13:30:35 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 09 May 2025 17:29:48 -0300
Subject: [PATCH v8 3/3] rust: platform: allow ioremap of platform resources
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topics-tyr-platform_iomem-v8-3-e9f1725a40da@collabora.com>
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

The preceding patches added support for resources, and for a general
IoMem abstraction, but thus far there is no way to access said IoMem
from drivers, as its creation is unsafe and depends on a resource that
must be acquired from some device first.

Now, allow the ioremap of platform resources themselves, thereby making
the IoMem available to platform drivers.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 128 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 4917cb34e2fe8027d3d861e90de51de85f006735..5c550fc6d429ffc541a17fb5f8a1c2eb4476b560 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -5,8 +5,14 @@
 //! C header: [`include/linux/platform_device.h`](srctree/include/linux/platform_device.h)
 
 use crate::{
-    bindings, device, driver,
+    bindings, device,
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
@@ -223,6 +229,126 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
+impl Device<device::Core> {
+    /// Maps a platform resource through ioremap() where the size is known at
+    /// compile time.
+    ///
+    /// # Examples
+    ///
+    /// ```no_run
+    /// # use kernel::{bindings, c_str, platform};
+    /// # use kernel::device::Core;
+    ///
+    ///
+    /// fn probe(pdev: &mut platform::Device<Core>, /* ... */) -> Result<()> {
+    ///     let offset = 0; // Some offset.
+    ///
+    ///     // If the size is known at compile time, use `ioremap_resource_sized`.
+    ///     // No runtime checks will apply when reading and writing.
+    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
+    ///     let iomem = pdev.ioremap_resource_sized::<42>(&resource)?;
+    ///
+    ///     // Read and write a 32-bit value at `offset`. Calling `try_access()` on
+    ///     // the `Devres` makes sure that the resource is still valid.
+    ///     let data = iomem.try_access().ok_or(ENODEV)?.read32_relaxed(offset);
+    ///
+    ///     iomem.try_access().ok_or(ENODEV)?.write32_relaxed(data, offset);
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
+    /// # use kernel::device::Core;
+    ///
+    /// fn probe(pdev: &mut platform::Device<Core>, /* ... */) -> Result<()> {
+    ///     let offset = 0; // Some offset.
+    ///
+    ///     // Unlike `ioremap_resource_sized`, here the size of the memory region
+    ///     // is not known at compile time, so only the `try_read*` and `try_write*`
+    ///     // family of functions should be used, leading to runtime checks on every
+    ///     // access.
+    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
+    ///     let iomem = pdev.ioremap_resource(&resource)?;
+    ///
+    ///     let data = iomem.try_access().ok_or(ENODEV)?.try_read32_relaxed(offset)?;
+    ///
+    ///     iomem.try_access().ok_or(ENODEV)?.try_write32_relaxed(data, offset)?;
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
+}
+
 impl AsRef<device::Device> for Device {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid

-- 
2.49.0

