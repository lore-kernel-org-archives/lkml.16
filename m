Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AD227700C;
	Tue,  1 Jul 2025 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380549; cv=pass; b=DyWeykOU/g+Guk27vUCPjmMdFAUJvYhdzzOX5dUJF/9vJh6021R9NiwmV3aV5pTthnE5syuRh1ECOOLSyjz23NWfXyg1lAS00zHgfTakT9kunq3MICWRyUNqMykttdjuU2YNuHVuPgEK8Wavb8xQ5bI8Kt7mEbUIrGG7V6qARwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380549; c=relaxed/simple;
	bh=6iN3yOj7qhjC9r531PX5JclwzLQcfGWp/eWDOaiqZQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPopTfPLxAAqkMHeGtKQCIFsqxA8Qv1XlpQECbilAGoCNAsiKG0o0DzU9OtRRTfeNq7AsYM7hMHbmVuW4negcJy2hdYLIrVRB93BFD4Lc0AIGALkya06oUZ1M21Z85JqZnwreP2fUq5VHL6xdzKlQLmThpaQ5K97pvbFgcpbkSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=MLXZSe5m; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MLXZSe5m"
ARC-Seal: i=1; a=rsa-sha256; t=1751380523; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fz5tSSCepqKgpo04vYKVrtBWEnj2BbkHGNhv9L0mKHxbECCkO2hINRGn0daRsOARkVvZV+GQQf27PMijLq589ilvu1+I8s8uObZWA5YJUA3/M5plH+i0U1+WOqPMqkHPyCuIgKkk+D4wHoJyCHtt2pmu+wtYjtmEfvHCpUesdIc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751380523; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Jc9sdrd75wcC67sLGeH8ZfQI/75mCRckbSptWH4o3m4=; 
	b=TQMQGIf/3DZJI8qTsdxmUcfoFe+6BtgfhQXzTedZ8d0l2zM0OhlpPxc3UoXMz6YhLq09VWBz5o28Utuc1ylZ7aCO2Zm9nGN0YcEQg9nlVVggXudt6baV6rdffCuEJXYD0Pwv5CHPatSLnRQ4/SvwbhGnK6BrYeypPHGQleCBgz4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751380523;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Jc9sdrd75wcC67sLGeH8ZfQI/75mCRckbSptWH4o3m4=;
	b=MLXZSe5m0Wf+P1Qah0AzWyXTam72TxjC/XMjlIS7lBXmBGJxIPrGxKLjd527sVPi
	ADb2Fmrw3tjzejXU4IrHR7yJxPrwHCyhTSmOAvkCoYcHMMohahtsuAbVME9VFHTTopx
	QntchWxxZBTKMViXZ6f8CfSdC7dN+Srcw0kHsTQY=
Received: by mx.zohomail.com with SMTPS id 1751380521685497.0733471940739;
	Tue, 1 Jul 2025 07:35:21 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 01 Jul 2025 11:34:41 -0300
Subject: [PATCH v11 3/4] rust: platform: add resource accessors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-topics-tyr-platform_iomem-v11-3-6cd5d5061151@collabora.com>
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

A previous patch has exposed the abstractions struct resource.

Now make it possible to retrieve resources from platform devices in Rust
using either a name or an index.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 86f9d73c64b38ffe067be329a77b2fc04564c7fe..bafd3ccea6d15b7965d1a993deef3f58e03b3490 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -7,6 +7,7 @@
 use crate::{
     acpi, bindings, container_of, device, driver,
     error::{to_result, Result},
+    io::Resource,
     of,
     prelude::*,
     str::CStr,
@@ -211,6 +212,43 @@ impl<Ctx: device::DeviceContext> Device<Ctx> {
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
2.50.0

