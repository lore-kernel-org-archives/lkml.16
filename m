Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF12AE7F;
	Thu,  1 May 2025 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094532; cv=none; b=rUT19FdOs/qJ9K4OENVO5saY8HhiyBnPBJm7UD5rVYCu6HlMOZjEqS4wLMU1vYPrwTPctN++XjLWvOxTT9hTbP32zGUmyqArnI+FOlTNsJiunvZfOsrXMN5ha/1lvTro3Q7SgEmJKKCxqOrFYsc/OOgwWLmI7Mv62W80jotq334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094532; c=relaxed/simple;
	bh=Mt+tu6h8Fn8zaIxxJwvEwJw+Do65UIevysaXbL1IyVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GiXMnvSEdyXQ4E2LAJvebq6kSTD4XrE1gpSMgIiRj4bCpUEZ0R5umVlcXAOFzdCSugSW3gEUmT6Rl9IUj3m51p606q09mp0TAIo1EZzepYN00iaMg++yN+AKJExr3lcj5Ejo9FDgCqjLmlwUuuk80khMFuG6+60QnebzDzG/i5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9lCnu/C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9lCnu/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9383C4CEE3;
	Thu,  1 May 2025 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746094531;
	bh=Mt+tu6h8Fn8zaIxxJwvEwJw+Do65UIevysaXbL1IyVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B9lCnu/CENZtVqdHnADsBLiE1r7lK7j7FbRlvbt2crKRJEXjcV9H7A7p0qxjTjg64
	 vQCjvTG4ucUkCJBL17n9zSHTvQZKs8/VKFHkkj6cJmHSWlhZmPH/jYhNBgvzn9QR60
	 BqmmaYEyVReLdJ8sAbbfuHxNRV3zKjctL/9DZ7S5uHcJf1PPwirP4WpDky4pwxSh5v
	 f6zX7dl6yRmaXDKWSbTAOfMfhHgu9i7CUVuDsLmwSyzkTlEyaO0VSWkT5u/tS8pMS2
	 zKgjFmfSu33ZvnNqH5PUGzPQhzoB7yOyKgOrMhmIisrz56uT6H4CWTqxamCIinuFn1
	 wqADPDY9iY/ng==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 01 May 2025 12:14:37 +0200
Subject: [PATCH v6 2/3] rust: configfs: add a sample demonstrating configfs
 usage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-configfs-v6-2-66c61eb76368@kernel.org>
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
In-Reply-To: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Fiona Behrens <me@kloenk.dev>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Breno Leitao <leitao@debian.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7356; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Mt+tu6h8Fn8zaIxxJwvEwJw+Do65UIevysaXbL1IyVo=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoE0moOQKTvAE/pdjjNWhlno3KlcHdo4QFWTElQ
 SOC4q+frAyJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBNJqAAKCRDhuBo+eShj
 dx+RD/0ZDuoAOLECT1FbyVsEJj1GVgFd1dicREu+KiM3Eg9mclxtW64eTKCtblyG1MskfqxO/9j
 EEefdZxjLGCJXa3/tWsNxjSpyxQrdLTB6Y6sjW1xdCN1kJJ3rvNanPvJSgbtzXbYf87ayGqm2Uy
 TOPy+1ybu/8vxPcORFPSb7gWAcYLElYuc4FeaGe5iEFwNGrCietclD5NC8kwhLpfgKOiyw9Cd0H
 n2oymyJeH6hj/9DKeb+D2BiViq40EKeGdvoWfCpYVUDpO2GH8s5BoRrgPsoT+UYYOlYc/4ZzUbl
 NvflXb+zM2jMGpoHBJMdF4SkH/B6klUGeGSR1ZqyfFrDGvbGc9hEKjkpWWQhGKyEFgFQwOgPtyw
 +4AsugFqWzYNAM1NNCImDQOUg0F0NdrUrKZnI8tPxtNNOqscZuHJb84z6hiRXq3R4ruW+FOOLPa
 qZWay1DK+uttzn5lE5iv4uQNCASKM1wwnnwZaGdsb67DfhskfVMO3dU4oF4hbXTvH2cVYrL8p49
 ESlu08Vg1q41oE89UhNqtyHr3awMGc0QSqv4bT6YTZUAXalMpp8qDSk6dfKoyKX6Lo9fQBy4LFI
 qORfBjqwRiJEfn2S3My8/HG/dB71zXbF7iL5U2W4dcOE4K/B7MaaJaE1PhEkWG9smw+LgZZH4Yt
 GXLzRkdd+CxVNiA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a sample to the samples folder, demonstrating the intended use of the
Rust configfs API.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 samples/rust/Kconfig          |  11 +++
 samples/rust/Makefile         |   1 +
 samples/rust/rust_configfs.rs | 192 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+)

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index cad52b7120b5..be491ad9b3af 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -10,6 +10,17 @@ menuconfig SAMPLES_RUST
 
 if SAMPLES_RUST
 
+config SAMPLE_RUST_CONFIGFS
+	tristate "Configfs sample"
+	depends on CONFIGFS_FS
+	help
+	  This option builds the Rust configfs sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_configfs.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_MINIMAL
 	tristate "Minimal"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index c6a2479f7d9c..b3c9178d654a 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
+obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
 
diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
new file mode 100644
index 000000000000..9c0989072a8f
--- /dev/null
+++ b/samples/rust/rust_configfs.rs
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust configfs sample.
+
+use kernel::alloc::flags;
+use kernel::c_str;
+use kernel::configfs;
+use kernel::configfs_attrs;
+use kernel::new_mutex;
+use kernel::page::PAGE_SIZE;
+use kernel::prelude::*;
+use kernel::sync::Mutex;
+
+module! {
+    type: RustConfigfs,
+    name: "rust_configfs",
+    author: "Rust for Linux Contributors",
+    description: "Rust configfs sample",
+    license: "GPL",
+}
+
+#[pin_data]
+struct RustConfigfs {
+    #[pin]
+    config: configfs::Subsystem<Configuration>,
+}
+
+#[pin_data]
+struct Configuration {
+    message: &'static CStr,
+    #[pin]
+    bar: Mutex<(KBox<[u8; PAGE_SIZE]>, usize)>,
+}
+
+impl Configuration {
+    fn new() -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            message: c_str!("Hello World\n"),
+            bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
+        })
+    }
+}
+
+impl kernel::InPlaceModule for RustConfigfs {
+    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
+        pr_info!("Rust configfs sample (init)\n");
+
+        // Define a subsystem with the data type `Configuration`, two
+        // attributes, `message` and `bar` and child group type `Child`. `mkdir`
+        // in the directory representing this subsystem will create directories
+        // backed by the `Child` type.
+        let item_type = configfs_attrs! {
+            container: configfs::Subsystem<Configuration>,
+            data: Configuration,
+            child: Child,
+            attributes: [
+                message: 0,
+                bar: 1,
+            ],
+        };
+
+        try_pin_init!(Self {
+            config <- configfs::Subsystem::new(
+                c_str!("rust_configfs"), item_type, Configuration::new()
+            ),
+        })
+    }
+}
+
+#[vtable]
+impl configfs::GroupOperations for Configuration {
+    type Child = Child;
+
+    fn make_group(&self, name: &CStr) -> Result<impl PinInit<configfs::Group<Child>, Error>> {
+        // Define a group with data type `Child`, one attribute `baz` and child
+        // group type `GrandChild`. `mkdir` in the directory representing this
+        // group will create directories backed by the `GrandChild` type.
+        let tpe = configfs_attrs! {
+            container: configfs::Group<Child>,
+            data: Child,
+            child: GrandChild,
+            attributes: [
+                baz: 0,
+            ],
+        };
+
+        Ok(configfs::Group::new(name.try_into()?, tpe, Child::new()))
+    }
+}
+
+#[vtable]
+impl configfs::AttributeOperations<0> for Configuration {
+    type Data = Configuration;
+
+    fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
+        pr_info!("Show message\n");
+        let data = container.message;
+        page[0..data.len()].copy_from_slice(data);
+        Ok(data.len())
+    }
+}
+
+#[vtable]
+impl configfs::AttributeOperations<1> for Configuration {
+    type Data = Configuration;
+
+    fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
+        pr_info!("Show bar\n");
+        let guard = container.bar.lock();
+        let data = guard.0.as_slice();
+        let len = guard.1;
+        page[0..len].copy_from_slice(&data[0..len]);
+        Ok(len)
+    }
+
+    fn store(container: &Configuration, page: &[u8]) -> Result {
+        pr_info!("Store bar\n");
+        let mut guard = container.bar.lock();
+        guard.0[0..page.len()].copy_from_slice(page);
+        guard.1 = page.len();
+        Ok(())
+    }
+}
+
+// `pin_data` cannot handle structs without braces.
+#[pin_data]
+struct Child {}
+
+impl Child {
+    fn new() -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {})
+    }
+}
+
+#[vtable]
+impl configfs::GroupOperations for Child {
+    type Child = GrandChild;
+
+    fn make_group(&self, name: &CStr) -> Result<impl PinInit<configfs::Group<GrandChild>, Error>> {
+        // Define a group with data type `GrandChild`, one attribute `gz`. As no
+        // child type is specified, it will not be possible to create subgroups
+        // in this group, and `mkdir`in the directory representing this group
+        // will return an error.
+        let tpe = configfs_attrs! {
+            container: configfs::Group<GrandChild>,
+            data: GrandChild,
+            attributes: [
+                gc: 0,
+            ],
+        };
+
+        Ok(configfs::Group::new(
+            name.try_into()?,
+            tpe,
+            GrandChild::new(),
+        ))
+    }
+}
+
+#[vtable]
+impl configfs::AttributeOperations<0> for Child {
+    type Data = Child;
+
+    fn show(_container: &Child, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
+        pr_info!("Show baz\n");
+        let data = c"Hello Baz\n".to_bytes();
+        page[0..data.len()].copy_from_slice(data);
+        Ok(data.len())
+    }
+}
+
+// `pin_data` cannot handle structs without braces.
+#[pin_data]
+struct GrandChild {}
+
+impl GrandChild {
+    fn new() -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {})
+    }
+}
+
+#[vtable]
+impl configfs::AttributeOperations<0> for GrandChild {
+    type Data = GrandChild;
+
+    fn show(_container: &GrandChild, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
+        pr_info!("Show grand child\n");
+        let data = c"Hello GC\n".to_bytes();
+        page[0..data.len()].copy_from_slice(data);
+        Ok(data.len())
+    }
+}

-- 
2.47.2


