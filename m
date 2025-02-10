Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021CB1EF084;
	Mon, 10 Feb 2025 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190647; cv=none; b=WoJijKaESoUBw50DRZPycalfuHb8tFB2wTjzVJTkVV26JVIIjbl98XwnaoieflBx9Yj/DltOAKOS77wk32lYIN15UrOx/ZTcMrWHDG/bz0Rqg2R69oO3rJCZuIff82z3oiS7NM2C6nD+C1ofO7kz6FZZATs5CtmOJGRD6wYJ9OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190647; c=relaxed/simple;
	bh=TbyqhjqLFSMkkL2OvZYpbagA5+Vaa48gsL5qnhq+CrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bi5INGAg8szIk+ws3B9JvEMMrCkuvBjCuK+1yd2dCn45NIWJEjri9IxJxk/d55N3xI4JDkyZsTyDFFEL8htO1VYiUy8/SYrAxBxoZTwQtUp9VWWtUPqyTZ6ChSOunjrOWJ7QXVgLb+yl2n24kmDPt9nTrdvlZ3OGpouRExkVz8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hXOluAc2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hXOluAc2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EFCC4CED1;
	Mon, 10 Feb 2025 12:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739190646;
	bh=TbyqhjqLFSMkkL2OvZYpbagA5+Vaa48gsL5qnhq+CrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hXOluAc2VAteNfZgnnrinqwFQmlcYTcHBqMDHU/FTs+lBHy3uaxofjU83O7L1118d
	 p0+gMA5AOO4a/A8ag+vgo7lGvQc+EwczdyT18mPnkkV+h/v0EQtpzpLYYUmnUTf1K6
	 GYbZU1j9t8giI4B4CNrYyUisPg4RUEzgVxBRRhJU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 2/9] rust/kernel: Add faux device bindings
Date: Mon, 10 Feb 2025 13:30:26 +0100
Message-ID: <2025021026-exert-accent-b4c6@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025021023-sandstorm-precise-9f5d@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7374; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=IHnp0Ph4eRqCEOwqPBSB6DS+nWbvVwV3QnDR4rv7WoA=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkrPyZ9K0y7+cv2F18+o7TJDavSRXtPC25Okjj+3M3nY KM4R5VERywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAExkmh3DHI6kyiNnWLj3qh7d rbPwyj2lrMj+yQwLzgX5Ppp+1TP31t62BWI+69v55U5tAAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Lyude Paul <lyude@redhat.com>

This introduces a module for working with faux devices in rust, along with
adding sample code to show how the API is used. Unlike other types of
devices, we don't provide any hooks for device probe/removal - since these
are optional for the faux API and are unnecessary in rust.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Maíra Canal <mairacanal@riseup.net>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v4: - new patch added to this series
    - api tweaked due to parent pointer added to faux_device create
      function.
v3: - no change
v2: - renamed vdev variable to fdev thanks to Mark
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
index 25c86f47353d..19ea159b2309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7116,8 +7116,10 @@ F:	rust/kernel/device.rs
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
index 55354e4dec14..f46cf3bb7069 100644
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
index 000000000000..5acc0c02d451
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
+use core::ptr::{addr_of_mut, null, null_mut, NonNull};
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
+        let dev = unsafe { bindings::faux_device_create(name.as_char_ptr(), null_mut(), null()) };
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
index 496ed32b0911..398242f92a96 100644
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
index 918dbead2c0b..3b6eae84b297 100644
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
index 5a8ab0df0567..0dbc6d90f1ef 100644
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
index 000000000000..048c6cb98b29
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
-- 
2.48.1

