Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6640823C8D3;
	Tue,  3 Jun 2025 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963218; cv=pass; b=e1BZQYXTawpnDBz8TGwdCbJaKwdtPPqOgJirO56rw1qvwDSIRTkgUukhIbx4aKvkA2ohKSt3kfFr5rxpZ2W1eSplJHn0/8AkvO1c5r0ncG+iWvSI/2g3sgi8/bRhs5P2L2BCC0aAWon+rY3GbO2xVucXGPF3q7PYzs3g09G/5vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963218; c=relaxed/simple;
	bh=tNDU1zQaU6Vz1VnAGr2VhrYE55byTD9pxyb2mb+b+pc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIksscxD/xpsMDbTCSMWyMLSvAIRBSTb0jqCsOHxA/TVmSQHtzThjUe3OQDNPt+8bQKMsR2Ene+S2XEKsaZu1Vs3G0730mY+eO0OLCtm2e8EqTD+dWZr9iHmkTIvMbcgwKe5YFHlEva5Q3aijBec72tID8fn8/hlxLMHRjgjoS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Fe+Kfbb4; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Fe+Kfbb4"
ARC-Seal: i=1; a=rsa-sha256; t=1748963193; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UwZzo9d2NxnOcZ7epV72WqcACuHdEeIIOqFQBcz85i99jQ7MPjYyY7iWk3zh+ZEmvDSBbGdS9VQOwgz0ayP26s19utiCUyrNaaaRtvvjn0t4Cx8AzFskiGWukiri/rUx0pMa2P4lA63KaXNcHdOEpxaxabeOEptvFuxL5MtJyRw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748963193; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T3yU8CXxTLuipg5JsHWMG+be2YfylB3fwzElXc1ikec=; 
	b=DRBAgnJX3IX6iQqZfXPIKGZTi9CspcbDKJYTW0otjGr56B47LQj++/j2UsHmjenY1V2ma+K9AJahsHitzdHRiNco/uEM53Bzq72bLlo+tH+3eI5AAnypYQPWRk1aY3UH7sB6MaRr/yEB8tjIqT/KyFG3Y+rM05fXtFGhcOx9XoA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748963193;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=T3yU8CXxTLuipg5JsHWMG+be2YfylB3fwzElXc1ikec=;
	b=Fe+Kfbb4i0ZUbWJ9rTpWm5jw8+yqPDJqwENjFvs6Hu5QNqUk1MA5tXmbvfXb88Gz
	nVzh8WA/5WbtV+qy8bruwKWOtDgFOk3ymDs3GzjWp99fCqoxpz3l1n8r8k+tyygOHCz
	Tx8Jv0euHmdXbEMMmDWmU8iSx8lvmyHlt7o52Xaw=
Received: by mx.zohomail.com with SMTPS id 1748963189882603.10385779974;
	Tue, 3 Jun 2025 08:06:29 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 03 Jun 2025 12:05:30 -0300
Subject: [PATCH v9 4/4] rust: platform: allow ioremap of platform resources
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-topics-tyr-platform_iomem-v9-4-a27e04157e3e@collabora.com>
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

The preceding patches added support for resources, and for a general
IoMem abstraction, but thus far there is no way to access said IoMem
from drivers, as its creation is unsafe and depends on a resource that
must be acquired from some device first.

Now, allow the ioremap of platform resources themselves, thereby making
the IoMem available to platform drivers.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 123 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 427bc706f4349083b6bab81a02cb8ed803903590..57414fd0db296e412f45fbefd7707b338b37332a 100644
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
-    io::resource::Resource,
+    io::{
+        mem::{ExclusiveIoMem, IoMem},
+        resource::Resource,
+    },
     of,
     prelude::*,
     str::CStr,
@@ -227,6 +232,120 @@ pub fn resource_by_name(&self, name: &CStr) -> Option<&Resource> {
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
+    ///       // Read and write a 32-bit value at `offset`. Calling `try_access()` on
+    ///       // the `Devres` makes sure that the resource is still valid.
+    ///       let data = io.read32_relaxed(offset);
+    ///
+    ///       iomem.try_access().ok_or(ENODEV)?.write32_relaxed(data, offset);
+    ///
+    ///       # let sample_driver = KBox::new(SampleDriver, GFP_KERNEL).map_err(|_| ENOMEM)?;
+    ///       # Ok(sample_driver.into())
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
+    /// Maps a platform resource through iomap().
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
+    ///       # let sample_driver = KBox::new(SampleDriver, GFP_KERNEL).map_err(|_| ENOMEM)?;
+    ///       # Ok(sample_driver.into())
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
2.49.0

