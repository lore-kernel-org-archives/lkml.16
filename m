Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1972E338C;
	Mon, 14 Apr 2025 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636801; cv=none; b=jpgJnaV3c0JNA+ahY0YEdl5z6FFJRPfthc7VsUY7ueBOeZYu+cZLueiWoHaSktBMMR7gPk2bx9hEdYgd/Gx0kAq7CzjOGRjiKst3oWtlao5b7vzRB1dMpd9KQRec10J7yJidwjsWhewsDVwml8Zlb322ntvIeH56UUlJqMAzaQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636801; c=relaxed/simple;
	bh=aLWqfMc3LxAnj7N11OD12sfVIcutCmvYMivUM9e+DKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvhTzAPEHse21Vb7eL+sThNSwkyFVr3CH+P1qRQrgFl5mzNRtcG6x6gfGPseGxmbXONwhgQqcBT2FtEQlXQKOT+kAnV7aQtyrnZ+K/baD/g5+d1ahIyH0P5sbNlhAoGcVXn7PPjp2ffgJJbQGm6pHWNiIlhcvAYkhTF2rIc3py8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9wlSznv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9wlSznv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CCAC4CEE2;
	Mon, 14 Apr 2025 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744636801;
	bh=aLWqfMc3LxAnj7N11OD12sfVIcutCmvYMivUM9e+DKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I9wlSznvqT6nfjJ8DmvqwLKbGW1cO8YlnfjbFTvr1Q3BbMbBPVRIAWUF/AWdpVAoW
	 ZhszPDJhXuxxVIc9CUx+f2lo6TCSBKfi7Lkymbprvq3n4pGsZuVV0JHXkWUy4aDT5N
	 eErxiW/Vow74UENyzOUEuXI5dx/ml1R2K3DrZtofKybtukh3UKnUesqEebQzTTJ+pn
	 5UumgFY4HRdZgCTRojGHxoS1nKcyqTFObaNGgmrZkpmzFpY+zh943FKjWbPy8Hnc8R
	 PtJ6VGy8wi4Y4YS14GlgL0rWstT776SP15stHlWLtT1ZSpZnqyqxBK7jI6AxD0mYGm
	 0V3s4qNCAtYCg==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	airlied@gmail.com,
	acourbot@nvidia.com,
	jhubbard@nvidia.com
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 5/5] samples: rust: add Rust auxiliary driver sample
Date: Mon, 14 Apr 2025 15:18:08 +0200
Message-ID: <20250414131934.28418-6-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414131934.28418-1-dakr@kernel.org>
References: <20250414131934.28418-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a sample Rust auxiliary driver based on a PCI driver for QEMU's
"pci-testdev" device.

The PCI driver only registers an auxiliary device, in order to make the
corresponding auxiliary driver probe.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS                           |   1 +
 samples/rust/Kconfig                  |  12 +++
 samples/rust/Makefile                 |   1 +
 samples/rust/rust_driver_auxiliary.rs | 122 ++++++++++++++++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 samples/rust/rust_driver_auxiliary.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index a7bc29ca37d4..23c6ca105471 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7246,6 +7246,7 @@ F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
 F:	rust/kernel/faux.rs
 F:	rust/kernel/platform.rs
+F:	samples/rust/rust_driver_auxiliary.rs
 F:	samples/rust/rust_driver_platform.rs
 F:	samples/rust/rust_driver_faux.rs
 
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index cad52b7120b5..43cb72d72631 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -82,6 +82,18 @@ config SAMPLE_RUST_DRIVER_FAUX
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_AUXILIARY
+	tristate "Auxiliary Driver"
+	depends on AUXILIARY_BUS
+	depends on PCI
+	help
+	  This option builds the Rust auxiliary driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_auxiliary.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index c6a2479f7d9c..6a466afd2a21 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
 
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
new file mode 100644
index 000000000000..8373c9a2337b
--- /dev/null
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust auxiliary driver sample (based on a PCI driver for QEMU's `pci-testdev`).
+//!
+//! To make this driver probe, QEMU must be run with `-device pci-testdev`.
+
+use kernel::{
+    auxiliary, bindings, c_str, device::Core, driver, error::Error, pci, prelude::*, str::CStr,
+    InPlaceModule,
+};
+
+use pin_init::PinInit;
+
+const MODULE_NAME: &CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
+const AUXILIARY_NAME: &CStr = c_str!("auxiliary");
+
+struct AuxiliaryDriver;
+
+kernel::auxiliary_device_table!(
+    AUX_TABLE,
+    MODULE_AUX_TABLE,
+    <AuxiliaryDriver as auxiliary::Driver>::IdInfo,
+    [(auxiliary::DeviceId::new(MODULE_NAME, AUXILIARY_NAME), ())]
+);
+
+impl auxiliary::Driver for AuxiliaryDriver {
+    type IdInfo = ();
+
+    const ID_TABLE: auxiliary::IdTable<Self::IdInfo> = &AUX_TABLE;
+
+    fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
+        dev_info!(
+            adev.as_ref(),
+            "Probing auxiliary driver for auxiliary device with id={}\n",
+            adev.id()
+        );
+
+        ParentDriver::connect(adev)?;
+
+        let this = KBox::new(Self, GFP_KERNEL)?;
+
+        Ok(this.into())
+    }
+}
+
+struct ParentDriver {
+    _reg: [auxiliary::Registration; 2],
+}
+
+kernel::pci_device_table!(
+    PCI_TABLE,
+    MODULE_PCI_TABLE,
+    <ParentDriver as pci::Driver>::IdInfo,
+    [(
+        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_REDHAT, 0x5),
+        ()
+    )]
+);
+
+impl pci::Driver for ParentDriver {
+    type IdInfo = ();
+
+    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
+
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
+        let this = KBox::new(
+            Self {
+                _reg: [
+                    auxiliary::Registration::new(pdev.as_ref(), AUXILIARY_NAME, 0, MODULE_NAME)?,
+                    auxiliary::Registration::new(pdev.as_ref(), AUXILIARY_NAME, 1, MODULE_NAME)?,
+                ],
+            },
+            GFP_KERNEL,
+        )?;
+
+        Ok(this.into())
+    }
+}
+
+impl ParentDriver {
+    fn connect(adev: &auxiliary::Device) -> Result<()> {
+        if let Some(parent) = adev.parent() {
+            // Validate that we're the parent of the given auxiliary device.
+            let pdev: &pci::Device = parent.try_into()?;
+
+            dev_info!(
+                adev.as_ref(),
+                "Connect auxiliary {} with parent: VendorID={:#x}, DeviceID={:#x}\n",
+                adev.id(),
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+        }
+
+        Ok(())
+    }
+}
+
+#[pin_data]
+struct SampleModule {
+    #[pin]
+    _pci_driver: driver::Registration<pci::Adapter<ParentDriver>>,
+    #[pin]
+    _aux_driver: driver::Registration<auxiliary::Adapter<AuxiliaryDriver>>,
+}
+
+impl InPlaceModule for SampleModule {
+    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            _pci_driver <- driver::Registration::new(MODULE_NAME, module),
+            _aux_driver <- driver::Registration::new(MODULE_NAME, module),
+        })
+    }
+}
+
+module! {
+    type: SampleModule,
+    name: "rust_driver_auxiliary",
+    author: "Danilo Krummrich",
+    description: "Rust auxiliary driver",
+    license: "GPL v2",
+}
-- 
2.49.0

