Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB9B24DFED;
	Mon,  5 May 2025 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447445; cv=none; b=bZxMQLrIaqVu/SuKwn606eUg9+2h+/f7xrxYGtSIOHPW2hUizIbG/1Z9aWmE0aRYqiABctesf7clvJ0Fhj4PzumEMFdEhWsT6l6xQ/cXPpv3eRlAmMeaLUhXbvUOqp5Y6H1aERuH1iB/UTGy9B5amZ6qkwBgIijDUQqjhftqu1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447445; c=relaxed/simple;
	bh=rzYVWa8T9n45Z4cSfo3JixMLHUxrIRHR2zB8t+Wr27g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TiuhQwtrdx+HCLz9ZqBZPtzdZhfKiFD0gbrB4eyoX/FVBKJxGssWUgpxtrKU5DfrZO/zcHxfpDhK4DJQY1D7uBizN2o3ijNTHKeYuee6Xyhpwtwvo3TOY8/byeE5FQGp23RHH63UzhFoMzw8khllsUo71hnWJZ8gDos47HRZxNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMcv6qus; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMcv6qus"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AD9C4CEEF;
	Mon,  5 May 2025 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746447444;
	bh=rzYVWa8T9n45Z4cSfo3JixMLHUxrIRHR2zB8t+Wr27g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XMcv6qus0M8Eul0W7sK7agNTIMFF+P0ZENMPw0e40x/sJk1e9IdZ3Isj6oiygMIiR
	 qHZfn7l76j+mdNDodlbyHWxsPLg2GXedprK5A0CdBcZVlU9xpPeP5B790d5wgrlrmL
	 C9GKLM+xVZI9whoQyWSPFI0GtwRpqBJQDmG6uqEgF0iWMYZ0iTV8/jLE7IKGvDG82W
	 Zhhe9sy8fMr2vTfe6lGD90zeyh0fbbsTujePI44lkjj1kwHsKJs1ifd8WkrkI3t5mz
	 2m0fe48KGPRDhHpsw5uiXKXgVAgYXhwYZDt+DpeadNKSQvuzoq7FvO8BGzl/V53F3a
	 4G3G7gBHeso0Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 05 May 2025 14:16:57 +0200
Subject: [PATCH v7 2/3] rust: configfs: add a sample demonstrating configfs
 usage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-configfs-v7-2-8bcf47c1fb88@kernel.org>
References: <20250505-configfs-v7-0-8bcf47c1fb88@kernel.org>
In-Reply-To: <20250505-configfs-v7-0-8bcf47c1fb88@kernel.org>
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
 h=from:subject:message-id; bh=rzYVWa8T9n45Z4cSfo3JixMLHUxrIRHR2zB8t+Wr27g=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoGKxExvuRHZwec4BsCbEsIWMOu6XbleC/AeL3V
 oK9orrVIayJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBisRAAKCRDhuBo+eShj
 d6zVD/9ROTA8f6TlyzQ62mMa8/D/xoR6klzZ2C8b4kX2po0KFAbMbY6lu+UyKeMNdqE9nFaQsZY
 I79SxRnyTlQVP1SCcqlXeX3rbtKI1Hn20iHlLHP2B9fOiySVIiNGWmwsUW8+VFuTb4Yzymc+D5c
 +27YyvDKs0chTtEN2VW6Ql0O7pmrL86siuQvZ4H+MJVKbxBmzqkrz5zMzqsXuCtCjNcwzI8tWbH
 y1TYexNQ97YVY7CBft5ibs0r+sbD9hSwok1ol93JP+19gp6u2Xa99HvF4npSErlQ6KrPsfnwsqT
 uUI8vo8tCpMFkUxdm1l9gqcZO+7JUfoBAXNKllNqsQC2ezvvDTdF2dkZ/iCpweLxyab936sm4eT
 Liip4kkaVK4ESnIkeHUqhx3/aIHbtsurDHbuThdeXI2/L2fd85Bu3SJJYirPGqGG4bwK+EWUg0A
 eXPcJmFTXTZxADYJGad1UcntL/oWVHAvfoGG3ANtfa+esMr0vj1DwR+elKux8Oih1G73tclnMX+
 L1uFsHkMqniGtUx++m8yrD8PP5IKBI4E2Zdya17B/HqJtiGLX+7PgNkFE9hZ6kWiVgErQDg5Igs
 IZFp65m6rxeOWMaEnK+tOcOBGiefN/ayDQpK+bZILrxH3TMsQpLHY/vwwsKd3XQPasUVGy4W8Ur
 S5bGOYZJLNeUHRw==
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
index 000000000000..60ddbe62cda3
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
+        // Define a group with data type `GrandChild`, one attribute `gc`. As no
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


