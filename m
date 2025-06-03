Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3BB23BD1F;
	Tue,  3 Jun 2025 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963213; cv=pass; b=b2vPF3KzOxYTLoDCNfnppY3x7su4UdXbxPijQCuHsXQ/rpb6M7Kun1Nl8hk8KrSVy5sYUB5QHJ8G2lwZUrtYyUY0gGZQYUU11OUkrrDrdexZJhxAKScJYbiY5cByWKVnZ9iyLR3w45sa3iv15PUDue6UWn1Dr3PUKuQctypMvik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963213; c=relaxed/simple;
	bh=xkcLhcHFSZ5ve9Nj6w0b2OS9Tsm1rGLSCxt5xh3oeHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4PSxaF+JJDf465Qohu6aK9bzf1qCZjAxeE81ENqYttryceno1GJFLKu13v9u+2bsh5qMuQT+YQ8M7ErPDiyLJRWb/h4qHwZUNHQu6gCC94RBOTYKEUkO0wC3zSq5+5+XBfWot7uoNQDF4EUSlxD/wttiES7Dr3hXp4xPkf9zRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=UwANQ2sh; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UwANQ2sh"
ARC-Seal: i=1; a=rsa-sha256; t=1748963186; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=co8iSyHBdtN+tA6LhOtpNBEArKwlkQmGeDMkYu+a1xrMGR8DSbTOabs7b7GngUrWqv8njeKQcdIokMPysv4j3TkRFjVlvvrfXQhGzMO35/ZWoXLx/2AbLolfaIb32br4w/XpVn6FYViHHaGRMKli17hzAMGSRRhfH2THsTugkc8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748963186; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jZffzdn2W8kvxTQetg+C03AnS6TS/ju5MbP+AN840e0=; 
	b=G+lmx8kZ+NXlxkwyDngeqNnRmx1nMdQrj6eJNWCTyQW2AGk8DugkyEa0fMZSs6K4K8mJJfpRdsPnGYvUccN+jL3SdglcDM/CkZJAFJQPluvJIaeAGuLXht/dAomltTbtXotAVm+WDMbZU9Eg1LXJh7iAz8Gcy5vWcej5rs5CVU8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748963186;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=jZffzdn2W8kvxTQetg+C03AnS6TS/ju5MbP+AN840e0=;
	b=UwANQ2sh83ITkPcY/9YDgYC1uoQN4oV/5G5LpQgnzvW3KzGurQ6qvWHsHt4MkqTO
	V1AidFVv43I7gatr78BFpyn7dNtr8NqTDSKOWUuGZJlQKwuvO4hipTZ9cHL9+gqJH+G
	Cga4lNBbuJp+V7zY7n3qlDDRBEseX2OFcmjk/U3g=
Received: by mx.zohomail.com with SMTPS id 1748963185327416.87391942151964;
	Tue, 3 Jun 2025 08:06:25 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 03 Jun 2025 12:05:29 -0300
Subject: [PATCH v9 3/4] rust: platform: add resource accessors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-topics-tyr-platform_iomem-v9-3-a27e04157e3e@collabora.com>
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

A previous patch has exposed the abstractions struct resource.

Now make it possible to retrieve retrieve resources from platform devices
in Rust using either a name or an index.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 08849d92c07418d6390803bb8cc51516368bca84..427bc706f4349083b6bab81a02cb8ed803903590 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -7,6 +7,7 @@
 use crate::{
     bindings, container_of, device, driver,
     error::{to_result, Result},
+    io::resource::Resource,
     of,
     prelude::*,
     str::CStr,
@@ -187,6 +188,43 @@ impl<Ctx: device::DeviceContext> Device<Ctx> {
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
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic

-- 
2.49.0

