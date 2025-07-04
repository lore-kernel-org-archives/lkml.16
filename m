Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3112E5B24;
	Fri,  4 Jul 2025 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646390; cv=pass; b=o1H3MCuemJVBJ+sLVpGvRTHSmIr3Q9U5PbdgCWMZxweDWbuJLBpJccNvzQPrQcCBLeVLjN174Yuwc84kuKFPv8lMgk4Eg+aiaETgJ+qi8Gn7m8H/tjvFng2aLq+oUJWSts8w00hoUaWi9HtdpY2FkrHgyoNYlhIP9EOicuxP+Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646390; c=relaxed/simple;
	bh=0vFBZkvj1MbMxvY4+6UpfBllOPy91S01WvzRjgCT+5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NSRR06mo2DxwFlm9RuY74Jn6hVgX2M+nYTuB6m1nos1u4eiUKLjUM3bNaFjKGyw5Jbf4Biu1FYoqudYFa9CopOT4uW/K7zKTYNCODNq7OVvfV4K9WxQxO8FYWGnPfWVbeNkGo8h5G1FyR18FA+NJxP2vfXOekQBQXZd7k2EKpA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CBT3Y9bB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CBT3Y9bB"
ARC-Seal: i=1; a=rsa-sha256; t=1751646369; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Klppk0SJ48eMbu+BcJpM1X2wxc9b/fvYfVO47WdI7Rb7A6yKy3jVIRSCuHpCb9UJ2lfpJNqZuvcOszwPSHwMJBS+NTWelV9bCRbCD9vCGUWYOdoiAQHSQ+3yVARFqJxu517XEaSpjlNm/Q8Nvj5O/I+dbbMhkjiDomHIlp7lt5A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751646369; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EHiw+TLWTB+E5RH83iWm1KEXV9AoZB+dSLtwqxP7kA4=; 
	b=Xp3oq1Do154UBlKUFwTxbZ4QNGL2fDsP6S0nqWhNONBF5Uh0kpYSNrR8QNQ+YXJBMQTrG2htUtyOl3vWVjUkFCaXZE9rGXSbRukW8v0yVPA2P97BGMg3xWdkX5ZkQcXLweR6Nb/A/eqv7qRfQSMe7mtROeNGZvnNBGU73xKrSAQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751646369;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=EHiw+TLWTB+E5RH83iWm1KEXV9AoZB+dSLtwqxP7kA4=;
	b=CBT3Y9bBw3aDUVb7z9dcuZ0o0GKX1TSIGU1XX8IUkB6jA6qb//YJXdgx8iXnjxgp
	1COHZ6UaFn1OJUsPmhNxA0j4jO2aKzWmo7u0dk3rBl4BZxDl1w6kBWHeQ4oIyS3Bish
	vGaBg97Y+jpti6erfUeaJzEnLwyb9Rsm+h/sG3xI=
Received: by mx.zohomail.com with SMTPS id 1751646367321535.741342334998;
	Fri, 4 Jul 2025 09:26:07 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 04 Jul 2025 13:25:28 -0300
Subject: [PATCH v12 3/3] rust: platform: add resource accessors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-topics-tyr-platform_iomem-v12-3-1d3d4bd8207d@collabora.com>
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

The previous patches have added the abstractions for Resources and the
ability to map them and therefore read and write the underlying memory .

The only thing missing to make this accessible for platform devices is
to provide accessors that return instances of IoRequest<'a>. These
ensure that the resource are valid only for the lifetime of the platform
device, and that the platform device is in the Bound state.

Therefore, add these accessors. Also make it possible to retrieve
resources from platform devices in Rust using either a name or an index.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 60 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 86f9d73c64b38ffe067be329a77b2fc04564c7fe..b2b4ca4671f019e1080e0579ae42a356eaa5f0bb 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -5,8 +5,11 @@
 //! C header: [`include/linux/platform_device.h`](srctree/include/linux/platform_device.h)
 
 use crate::{
-    acpi, bindings, container_of, device, driver,
+    acpi, bindings, container_of,
+    device::{self, Bound},
+    driver,
     error::{to_result, Result},
+    io::{mem::IoRequest, Resource},
     of,
     prelude::*,
     str::CStr,
@@ -211,6 +214,61 @@ impl<Ctx: device::DeviceContext> Device<Ctx> {
     fn as_raw(&self) -> *mut bindings::platform_device {
         self.0.get()
     }
+
+    /// Returns the resource at `index`, if any.
+    pub fn resource_by_index(&self, index: u32) -> Option<&Resource> {
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
+        Some(unsafe { Resource::as_ref(resource) })
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
+        Some(unsafe { Resource::as_ref(resource) })
+    }
+}
+
+impl Device<Bound> {
+    /// Returns an `IoRequest` for the resource at `index`, if any.
+    pub fn request_io_by_index(&self, index: u32) -> Option<IoRequest<'_>> {
+        // SAFETY: `resource` is a valid resource for `&self` during the
+        // lifetime of the `IoRequest`.
+        self.resource_by_index(index)
+            .map(|resource| unsafe { IoRequest::new(self.as_ref(), resource) })
+    }
+
+    /// Returns an `IoRequest` for the resource with a given `name`, if any.
+    pub fn request_io_by_name(&self, name: &CStr) -> Option<IoRequest<'_>> {
+        // SAFETY: `resource` is a valid resource for `&self` during the
+        // lifetime of the `IoRequest`.
+        self.resource_by_name(name)
+            .map(|resource| unsafe { IoRequest::new(self.as_ref(), resource) })
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic

-- 
2.50.0

