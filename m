Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55528231A3F;
	Fri, 30 May 2025 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615118; cv=none; b=NSlcMGL9hvyqzigRJFbiYCqv/jjmDlla3UmTRC1FyDMZ5p4kVSixG5nl1B3PyJD15DswiO1Zf/nHuAZr5z1Csfj0VgOkviC/kbnYRuUhCJyIFgfqEtGDVTmzj+cJCbR83vX0aTXbxsETsuAclHJzKNIYmt73+gHXOD3dfNiOuTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615118; c=relaxed/simple;
	bh=OemDzB7/Mo745bNLHFIg1xtCKR9iNReumwpsGuLmpEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzl2Q7Q9d7CDyEfwP0wgcMl0C3JP6eyDIjpsiK0OqkZMrVV5BGyjXJNGbNwPkot1EHJqlv2pS2vEhpRCYZO88MbUb0DvnGv79l6aZp34yNCAGZDmMPD7gZfkFIVZLOVXC65OGajTItvqOq0r7MEfeMKMWca3Cbn96Bc7V63Tnb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzBzxE+o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzBzxE+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053E6C4CEE9;
	Fri, 30 May 2025 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615118;
	bh=OemDzB7/Mo745bNLHFIg1xtCKR9iNReumwpsGuLmpEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzBzxE+oT4j7YFX/vFqu+HTQS7/xnl0B4O8d+HFMcjvzGq07ODh0FYlVjx0al4DNa
	 2nIcsRdxfQKECtLpBn0hl7JZP+52CvatHq9yiX+vo5lp1IENB6Edj8lnno6Zpji4vp
	 K0StAlDL1kYurr8fIMrgt4DfZvuPjja3b10Xty9TNZC0bpAtu5l/9PDL2sYg/yzxY/
	 H1GT/Sas71FNWfnz3ka9O2n51DCiUje3OkVGNhkgdSgbexoEftZmkxsqBZcMomz9P5
	 /VwpHldscaleMGQwLWGbFufpV6YwU19xLQhnPpGpFqrp24OD8XXqv0xj/lkP2GLAHm
	 kDuVUW1CE5p0g==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	chrisi.schrefl@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 7/7] rust: sample: misc: implement device driver sample
Date: Fri, 30 May 2025 16:24:20 +0200
Message-ID: <20250530142447.166524-8-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530142447.166524-1-dakr@kernel.org>
References: <20250530142447.166524-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to demonstrate and test a MiscDeviceRegistration with a parent
device, introduce CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT.

If CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT=y the misc device sample
is initialized with a parent device (faux), otherwise it is initialized
without a parent device, i.e. the exact same way as without this patch.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 samples/rust/Kconfig             |  8 +++++
 samples/rust/rust_misc_device.rs | 50 +++++++++++++++++++++++++++++---
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index b1006ab4bc3c..9948ec0939ef 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -30,6 +30,14 @@ config SAMPLE_RUST_MISC_DEVICE
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_MISC_DEVICE_WITH_PARENT
+	bool "Create a misc device with a parent device"
+	depends on SAMPLE_RUST_MISC_DEVICE
+	default n
+	help
+	  Say Y here if you want the misc device sample to create a misc
+	  device with a parent device.
+
 config SAMPLE_RUST_PRINT
 	tristate "Printing macros"
 	help
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 9bf1a0f64e6e..175638d6d341 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -167,6 +167,9 @@
     uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
 };
 
+#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
+use kernel::faux;
+
 const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x80);
 const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x81);
 const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x82);
@@ -181,19 +184,33 @@
     license: "GPL",
 }
 
+#[cfg(not(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT))]
 #[pin_data]
 struct RustMiscDeviceModule {
     #[pin]
     _miscdev: MiscDeviceRegistration<RustMiscDevice>,
 }
 
-impl kernel::InPlaceModule for RustMiscDeviceModule {
-    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
+#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
+struct RustMiscDeviceModule {
+    _faux: faux::Registration,
+    _miscdev: Pin<KBox<MiscDeviceRegistration<RustMiscDevice>>>,
+}
+
+impl RustMiscDeviceModule {
+    fn init() -> MiscDeviceOptions {
         pr_info!("Initializing Rust Misc Device Sample\n");
 
-        let options = MiscDeviceOptions {
+        MiscDeviceOptions {
             name: c_str!("rust-misc-device"),
-        };
+        }
+    }
+}
+
+#[cfg(not(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT))]
+impl kernel::InPlaceModule for RustMiscDeviceModule {
+    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
+        let options = Self::init();
 
         try_pin_init!(Self {
             _miscdev <- MiscDeviceRegistration::register(
@@ -205,6 +222,31 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
     }
 }
 
+#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
+impl kernel::Module for RustMiscDeviceModule {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        let options = Self::init();
+        let faux = faux::Registration::new(c_str!("rust-misc-device-sample"), None)?;
+
+        // For every other bus, this would be called from Driver::probe(), which would return a
+        // `Result<Pin<KBox<T>>>`, but faux always binds to a "dummy" driver, hence probe() is
+        // not required.
+        let misc = KBox::pin_init(
+            MiscDeviceRegistration::register(
+                options,
+                Arc::pin_init(new_mutex!(Inner { value: 0_i32 }), GFP_KERNEL),
+                Some(faux.as_ref()),
+            ),
+            GFP_KERNEL,
+        )?;
+
+        Ok(Self {
+            _faux: faux,
+            _miscdev: misc,
+        })
+    }
+}
+
 struct Inner {
     value: i32,
 }
-- 
2.49.0

