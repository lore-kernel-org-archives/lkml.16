Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87F82D3A66;
	Mon, 23 Jun 2025 18:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701715; cv=pass; b=uQgrSKmNxj9mVgDdQVvHejRabNzBEJLD3MpI71ci7+Z8igo0oWjGBsqrFRWV4eUbozQhzu25WUlfUSwoMVgUkNZvB6SK8oAD0lc4A0uyPCIz3LCA4LLosCur/4s959Tvu5ay4cEUd4GtsDar8JZHWzQ1fngGSPPFWU3+hOvhjdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701715; c=relaxed/simple;
	bh=jD0Bs8pEGYPz7Co3uofmKUKddNMzKnpOUNwkMt5xm9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PA9Dohf3aicmQsJvlleyDHfc2SUiL29YILW89BQ9hkICVjEVKBDC7zUPYGWsVH0vavryKfKmy+OgoqSGSW/g5SCOy5/cbp6pRt4ecTUbrTid/P2YmeVHlFo9Qz//RVfki7OercFrvUbNZB7cTvQEnfmI/9ch/hKfwjHxqOd+fdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ARPuBqwK; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ARPuBqwK"
ARC-Seal: i=1; a=rsa-sha256; t=1750701695; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iCbDQEXnNosRGbP0xeH85y5jc+bx0dqN7yojPmAU8guMR1lCQVLk7W4KJQTtGKGRCbIlchq5m96sQ4Z+E7gWQPlN7qlbcrE2cshfuyYzed+jQNoEgP4OzQuWDp1ZnF38TNRvxEMpXO99NVLOcRIxiWfiNNQ2JjoE5Qaa/BqSn1I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750701695; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jXtQ5usej9364YkX/FNJQWmiFrppYRFaFOduw0COy+E=; 
	b=O75osqKpFlXyhx55p9bA92Lmx2PRQHYafUC4sTMRb26Bc2mCz64fnTuzCaK6k97tqc7Uv3laoMr5Xt+Hp5Jcr07bScx8GzreercMyHJmb9utiCPGPDgiNtrI9NIm9k0ezEpE5QnhtzJBhqf9Aj/qnefYAQLEDXhEruhnNymkCek=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750701695;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=jXtQ5usej9364YkX/FNJQWmiFrppYRFaFOduw0COy+E=;
	b=ARPuBqwKaL1kv2BvRx7u3jqemRHU0i3CqMBHAz9L84PeoZclRCUm1bSSRzF5WFl6
	S5XnP3NfFhQIIOC+Y0I+l+idutSIwbggiLYye+HnJLgYaZTo9t6VuCkMe+/FQhogQEM
	aH+QexbBxGDIYitpCkTj/SBmwymcppWuwPBdxc7I=
Received: by mx.zohomail.com with SMTPS id 1750701693614683.6155317146832;
	Mon, 23 Jun 2025 11:01:33 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Jun 2025 15:01:00 -0300
Subject: [PATCH v10 3/4] rust: platform: add resource accessors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-topics-tyr-platform_iomem-v10-3-ed860a562940@collabora.com>
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

A previous patch has exposed the abstractions struct resource.

Now make it possible to retrieve resources from platform devices in Rust
using either a name or an index.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 5b21fa517e55348582622ec10471918919502959..0eedb8239fec31df7ab64dc68d220c9d965f1f21 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -7,6 +7,7 @@
 use crate::{
     bindings, container_of, device, driver,
     error::{to_result, Result},
+    io::Resource,
     of,
     prelude::*,
     str::CStr,
@@ -188,6 +189,43 @@ impl<Ctx: device::DeviceContext> Device<Ctx> {
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

