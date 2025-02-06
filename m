Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357591DE891
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738875998; cv=none; b=T4nVQdjJ1aPdr2fydjqYhby5TGCh+PNCPgkJrRHO/8tpRNGwguUGfm2o1eYcJAVD6BB2NHjSfoVYP8HOBhR9U3tVfeeSdXTn8EfR/pWEveUwSckSdyW9TEFHT/gw9LY+WMRbs+HVdxZ1eThhTgBrlK45zw35XCvkV7S/zHrq5qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738875998; c=relaxed/simple;
	bh=kOOEPl/veYhynAhhL0jpvHiTjC+U6g7X09NmSzkbB80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OTRgxYNJysVpn52jq6A9arlj9PKw384ZpM/Kg8DrMB3O8aq8KFBxrubu/RQFFnvHXN+7tvPN3sX2BJcvYTw0+SmVqhbDZfmPmuRK9dO/vkoviLojpVfJ0354MEI2njDROaagZYn3zOGMLYWCjkk7HVu6dwCZbTh3UaFFM0vXL/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BT0JkoBg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BT0JkoBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738875995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GihRnkuZEyKR3tOEQSNi7Ep19r88LL1Tvr+PPotI6bE=;
	b=BT0JkoBgqJr/5+y4gzkUEdQEhtjO43jIX+qNnu6A4HAZhZP4CvhtvU2DKhDrv6am06Ws+R
	YrM6+k28LidoVnJd66Y7pm8dmKOJkfwvRGER4YzRHbEOv/bUUxc3H80PVUH4t53jp/ZRCY
	DnSy6sjrhhG6TgKAheeST5xF7EfI5Sw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-1CgXrbzLOb677x8OZ5Bheg-1; Thu,
 06 Feb 2025 16:06:32 -0500
X-MC-Unique: 1CgXrbzLOb677x8OZ5Bheg-1
X-Mimecast-MFC-AGG-ID: 1CgXrbzLOb677x8OZ5Bheg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 798731800877;
	Thu,  6 Feb 2025 21:06:29 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.66.91])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C75D71955BCB;
	Thu,  6 Feb 2025 21:06:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rust/kernel: Add faux device bindings
Date: Thu,  6 Feb 2025 16:04:56 -0500
Message-ID: <20250206210503.102061-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

This introduces a crate for working with faux devices in rust, along with
adding sample code to show how the API is used. Unlike other types of
devices, we don't provide any hooks for device probe/removal - since these
are optional for the faux API and are unnecessary in rust.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maíra Canal <mairacanal@riseup.net>
---
 rust/bindings/bindings_helper.h  |  1 +
 rust/kernel/faux.rs              | 60 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |  1 +
 samples/rust/Kconfig             | 10 ++++++
 samples/rust/Makefile            |  1 +
 samples/rust/rust_driver_faux.rs | 29 +++++++++++++++
 6 files changed, 102 insertions(+)
 create mode 100644 rust/kernel/faux.rs
 create mode 100644 samples/rust/rust_driver_faux.rs

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
index 0000000000000..5e58f397b747a
--- /dev/null
+++ b/rust/kernel/faux.rs
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+//! Abstractions for the faux bus.
+//!
+//! This crate provides bindings for working with faux devices in kernel modules. It should be
+//! preferred for creating virtual devices over the platform API.
+//!
+//! C header: [`include/linux/device/faux.h`]
+use crate::{bindings, device, error::from_err_ptr, prelude::*};
+use core::ptr::{addr_of_mut, null, NonNull};
+
+/// The faux device representation.
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
+pub struct Device(NonNull<bindings::faux_device>);
+
+impl Device {
+    /// Create and register a new faux device with the given name.
+    pub fn new(name: &CStr) -> Result<Self> {
+        // SAFETY:
+        // - `name` is copied by this function into its own storage
+        // - `faux_ops` is safe to leave NULL according to the C API
+        // - `faux_device_create` returns a valid non-null pointer to a `faux_device`, or error
+        from_err_ptr(unsafe { bindings::faux_device_create(name.as_char_ptr(), null()) })
+            .map(|d| Self(unsafe { NonNull::new_unchecked(d) }))
+    }
+
+    fn as_raw(&self) -> *mut bindings::faux_device {
+        self.0.as_ptr()
+    }
+}
+
+impl AsRef<device::Device> for Device {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
+        // a valid initialized `device`.
+        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }
+    }
+}
+
+impl Drop for Device {
+    fn drop(&mut self) {
+        // SAFETY: self.0 is a valid registered faux_device via our type invariants.
+        unsafe { bindings::faux_device_destroy(self.as_raw()) }
+    }
+}
+
+// SAFETY: The faux device API is thread-safe
+unsafe impl Send for Device {}
+
+// SAFETY: The faux device API is thread-safe
+unsafe impl Sync for Device {}
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
index 0000000000000..fb0d8527bdcb2
--- /dev/null
+++ b/samples/rust/rust_driver_faux.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust faux device sample.
+
+use kernel::{c_str, faux::*, prelude::*, Module};
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
+    _dev: Device,
+}
+
+impl Module for SampleModule {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("Initialising Rust Faux Device Sample\n");
+
+        let dev = Device::new(c_str!("rust-faux-sample-device"))?;
+
+        dev_info!(dev.as_ref(), "Hello from faux device!");
+
+        Ok(Self { _dev: dev })
+    }
+}

base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
prerequisite-patch-id: f05ff916822e21eec452f9e5b8d11339c409265a
-- 
2.48.1

