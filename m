Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBBC176AB5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 23:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738972185; cv=none; b=SgO40OcpeaQFFJ2V/zuqrHIamgcdyWcebmMzhPZ4zta3W3tr2kTEDpqj4/D7d9AsHzwmKldrNKXRk4KBRTe2ItVslg5a+f1IUAVqgwHJUMPN/dDa1SH0VMDHNRCbPyhqAx0c4YRqgp9lqJ3EugOEYxJOAJ+tS4t9kR5oDRyTA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738972185; c=relaxed/simple;
	bh=KlSxacvrBHL4HX4T+f6Eu1WDOV4GQzHiWmR6m6N5vrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SNWCiiapD3w19UvNYayCE6fNixz5YljC5c/EoHi8rvRSu5WH59c1NFdaa+qQr519Wse39uupTEzV9UGGODmoR8O/bNRss8IpsUC1lDQp8Nsu8kdjv8BgZgTdCwDG4xwecOgR+Tr/cmyYB+9suHaSnzFmMrae/ZMKDL3hTSjyYTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VtMWkqX4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VtMWkqX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738972182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3nQf3zproGrPEWkXPrJ3HTkRdptRqyzJENVw6P4Fyss=;
	b=VtMWkqX41htrBsKvuzb/Zoo8c+RGFGwnpMucBtMK5mUGAGkf7fuhMIcoq7TRIUxqaK9oBb
	UOz+3pUDwCGr7Z86Ciyfj+y8H2p+m7YROJGjky/TZdLujXFjL6ereNMdLVx3UJkam3pkMF
	xtuKOOlZVn0vbKjLBrLck/RfDH4m8Vs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-98-NHnYJ3H6PDWeeboANC1mOw-1; Fri,
 07 Feb 2025 18:49:37 -0500
X-MC-Unique: NHnYJ3H6PDWeeboANC1mOw-1
X-Mimecast-MFC-AGG-ID: NHnYJ3H6PDWeeboANC1mOw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE4E919560AD;
	Fri,  7 Feb 2025 23:49:34 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.88.55])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 81771195608D;
	Fri,  7 Feb 2025 23:49:30 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] rust/kernel: Add faux device bindings
Date: Fri,  7 Feb 2025 18:49:25 -0500
Message-ID: <20250207234928.420693-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

This introduces a module for working with faux devices in rust, along with
adding sample code to show how the API is used. Unlike other types of
devices, we don't provide any hooks for device probe/removal - since these
are optional for the faux API and are unnecessary in rust.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maíra Canal <mairacanal@riseup.net>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

---
V2:
* Check for NULL on return from device_create(), not a pointer error
* Rename Device to Registration to make its purpose more clear
* Drop platform device comment from crate docstring.
* Update MAINTAINERS
V3:
* Clarify safety comment around thread-safety
* Return ENODEV on failure from new()
* Add missing newline in faux driver sample
* s/crate/module/ in descriptions
* Add newline after faux module docstring
* Fix missing markdown in safety comments
* Add missing INVARIANT: comment in Registration
* s/Registration/faux::Registration/ in rust_driver_faux.rs

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 MAINTAINERS                      |  2 +
 rust/bindings/bindings_helper.h  |  1 +
 rust/kernel/faux.rs              | 67 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |  1 +
 samples/rust/Kconfig             | 10 +++++
 samples/rust/Makefile            |  1 +
 samples/rust/rust_driver_faux.rs | 29 ++++++++++++++
 7 files changed, 111 insertions(+)
 create mode 100644 rust/kernel/faux.rs
 create mode 100644 samples/rust/rust_driver_faux.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f0dc98dab5fa..aa81e57b4c25c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7119,8 +7119,10 @@ F:	rust/kernel/device.rs
 F:	rust/kernel/device_id.rs
 F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
+F:	rust/kernel/faux.rs
 F:	rust/kernel/platform.rs
 F:	samples/rust/rust_driver_platform.rs
+F:	samples/rust/rust_driver_faux.rs
 
 DRIVERS FOR OMAP ADAPTIVE VOLTAGE SCALING (AVS)
 M:	Nishanth Menon <nm@ti.com>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 55354e4dec14e..f46cf3bb70695 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -11,6 +11,7 @@
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
 #include <linux/cred.h>
+#include <linux/device/faux.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/file.h>
diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
new file mode 100644
index 0000000000000..6eae643c6afe3
--- /dev/null
+++ b/rust/kernel/faux.rs
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+//! Abstractions for the faux bus.
+//!
+//! This module provides bindings for working with faux devices in kernel modules.
+//!
+//! C header: [`include/linux/device/faux.h`]
+
+use crate::{bindings, device, error::code::*, prelude::*};
+use core::ptr::{addr_of_mut, null, NonNull};
+
+/// The registration of a faux device.
+///
+/// This type represents the registration of a [`struct faux_device`]. When an instance of this type
+/// is dropped, its respective faux device will be unregistered from the system.
+///
+/// # Invariants
+///
+/// `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
+///
+/// [`struct faux_device`]: srctree/include/linux/device/faux.h
+#[repr(transparent)]
+pub struct Registration(NonNull<bindings::faux_device>);
+
+impl Registration {
+    /// Create and register a new faux device with the given name.
+    pub fn new(name: &CStr) -> Result<Self> {
+        // SAFETY:
+        // - `name` is copied by this function into its own storage
+        // - `faux_ops` is safe to leave NULL according to the C API
+        let dev = unsafe { bindings::faux_device_create(name.as_char_ptr(), null()) };
+
+        // The above function will return either a valid device, or NULL on failure
+        // INVARIANT: The device will remain registered until faux_device_destroy() is called, which
+        // happens in our Drop implementation.
+        Ok(Self(NonNull::new(dev).ok_or(ENODEV)?))
+    }
+
+    fn as_raw(&self) -> *mut bindings::faux_device {
+        self.0.as_ptr()
+    }
+}
+
+impl AsRef<device::Device> for Registration {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
+        // a valid initialized `device`.
+        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }
+    }
+}
+
+impl Drop for Registration {
+    fn drop(&mut self) {
+        // SAFETY: `self.0` is a valid registered faux_device via our type invariants.
+        unsafe { bindings::faux_device_destroy(self.as_raw()) }
+    }
+}
+
+// SAFETY: The faux device API is thread-safe as guaranteed by the device core, as long as
+// faux_device_destroy() is guaranteed to only be called once - which is guaranteed by our type not
+// having Copy/Clone.
+unsafe impl Send for Registration {}
+
+// SAFETY: The faux device API is thread-safe as guaranteed by the device core, as long as
+// faux_device_destroy() is guaranteed to only be called once - which is guaranteed by our type not
+// having Copy/Clone.
+unsafe impl Sync for Registration {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911a..398242f92a961 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -46,6 +46,7 @@
 pub mod devres;
 pub mod driver;
 pub mod error;
+pub mod faux;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fs;
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 918dbead2c0b4..3b6eae84b2977 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -61,6 +61,16 @@ config SAMPLE_RUST_DRIVER_PLATFORM
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_FAUX
+	tristate "Faux Driver"
+	help
+	  This option builds the Rust Faux driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_faux.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 5a8ab0df0567c..0dbc6d90f1ef9 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)		+= rust_misc_device.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
 
diff --git a/samples/rust/rust_driver_faux.rs b/samples/rust/rust_driver_faux.rs
new file mode 100644
index 0000000000000..048c6cb98b29a
--- /dev/null
+++ b/samples/rust/rust_driver_faux.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+//! Rust faux device sample.
+
+use kernel::{c_str, faux, prelude::*, Module};
+
+module! {
+    type: SampleModule,
+    name: "rust_faux_driver",
+    author: "Lyude Paul",
+    description: "Rust faux device sample",
+    license: "GPL",
+}
+
+struct SampleModule {
+    _reg: faux::Registration,
+}
+
+impl Module for SampleModule {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("Initialising Rust Faux Device Sample\n");
+
+        let reg = faux::Registration::new(c_str!("rust-faux-sample-device"))?;
+
+        dev_info!(reg.as_ref(), "Hello from faux device!\n");
+
+        Ok(Self { _reg: reg })
+    }
+}

base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
prerequisite-patch-id: f05ff916822e21eec452f9e5b8d11339c409265a
-- 
2.48.1

