Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD94204596;
	Mon,  3 Feb 2025 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583447; cv=none; b=c/uNBU5HyaXuKwtWg6tmZy7vUxxHoZNjCCiqnDg2pcBPzsRW9OrTtLFvt7IL5VZeO2VHG8qHGLgC3pq9FnAljY47MxOdXm6DP146JmTF4hzMAjSmFcC8FBTYwr8sTxtVvnxKbOsxGGcjslhVSQAyqqCHYA0qdRRUM6S16CUfCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583447; c=relaxed/simple;
	bh=Xc/9ZA1svD+W8Zk+r5r2vEEtYQy0QL9FvwxWHubcuTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTICW2qx0CAeKBfEN7gtgQ9230QQZuopfWeSSAkxTX8q8S8O2dOfitwwGOTArz6EdIfCB2xTk/r6xId3pk0nbwdu9EkKlf3x5M1zK8oLr6c1aQsuc37JgxamBAxm4kdOgm04jv4fWg/m4ltnBz5tBY1YwHsk+IjYKEHScTVyKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmWYH7b+; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmWYH7b+"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7be3d681e74so380473185a.0;
        Mon, 03 Feb 2025 03:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583441; x=1739188241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Vy9EadRf3cXRaDYVz9+tg0Vbxem82yzCopxglP0KpQ=;
        b=hmWYH7b+foOFA/hZZ0aDt0WP5CIeeHquSJ9YBscQr8jiJP1XjAtIljRsbgureoj+Oq
         37x+93R/DdI7EZRcecsFL9SXNuZI1SDJSNV/W/tfvH3R1y9ShjTGVmC4hjgvIxmrwI6b
         /ag/JilCh4dgpjqTD1LJF3cflbIFB0DS5vlTnEKD2DChYMLIlkJFtZyNtj02amkqrCYy
         974VtwjNxbleekjknkqaMaFXafPXi626folMS/TS5BlYxAV7qKED5hDueqctal2jKZvz
         z8a84aRK9kk4OLWq4lgda0etjH6Fu5h9pyEafUfmdieIcKd36UwCj0rvTn6kbCynTojR
         DnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583441; x=1739188241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vy9EadRf3cXRaDYVz9+tg0Vbxem82yzCopxglP0KpQ=;
        b=hpM5IF8tPyHdAY3JSX9BVIO9R13mJGotJqR8I0OIhilYhhEqgOe3/yTOvtGuG2BQK0
         svSqM9Jfgg6Yv/DWeni77WhPSNRFkOH3Kxm9ojvoIXMm1duW52zkjAUfnut5rZEmZjNy
         0RpynpUTHxGULwbm3IWcOh/F8g/FqK8xrOOudpEGU98ov8+R/LRz75EmCQz/uSm2Dh9O
         ovLXRulY3e/s7pnQmiI+Iz7kbippOxh8eWjYz3FAnHFy0UHBF+2ASdzo0+34Z4iYShI6
         UnxoDG1xAo2WBfnaG1CWjzbIixwMShxjueq6wqqFXkuHFHqVxu5OuyC6taBjmJL/d8g+
         vTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7khuE1i12v3DfKQpit1tRa5nszjvXMswa98BMrzXy1PXZ88PT0XMSZO26PlCs1g2S7ade5eUza7Kn9/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8mlRFcGxYJz/JZJYuWHFLKue2qFIXSde2qEzBtbk0Ze7Wghz6
	T8rS7xn7HUvl9kKR4vaslTq4/RUfwZnGTpP2BjIGZ6fbHplj/mn+9syn8ZKUI+g=
X-Gm-Gg: ASbGncs0cDDkGCaM1SxGmpP/8Ragr9+uCEnMgt44XMSQ/IUsNfJLnSS+ZDxjiUXTF5a
	RrLZk6TV6qDwYWOlotHb/gObKS1Nfz4c3UmF3tNP/4RCJNdBGJCW1zKgOb077DgcgsiqLga02I+
	Xqr4hsbleHJLQE+C114faPfnQ6YGjTlj8KhrA4E5yn84oGCfPA9LsYf7JvorW7rzl4M3H7xPF9y
	wqZmQxYWuWYXviOKdDj31Udg+i7zA2n2R3YHuseQpDFxBKzsSQy+8ccxD7bkd6/9s/xmhqepkuT
	J+Z97lMD5O4Opp05fAqOTpNwcZ2iyBwmi2eV0Ww=
X-Google-Smtp-Source: AGHT+IHWgxRU9v/Ez3h8OweUu3jQ+PJx/BV+W9M3oi5krURPloo+fJ7rKnLAl8ODDkccIXynfeVPZQ==
X-Received: by 2002:ad4:5c6d:0:b0:6e1:6aa2:2156 with SMTP id 6a1803df08f44-6e243ca86demr271251166d6.30.1738583441123;
        Mon, 03 Feb 2025 03:50:41 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254835641sm49537626d6.62.2025.02.03.03.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:50:40 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 03 Feb 2025 06:50:33 -0500
Subject: [PATCH v8 3/4] rust: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250203-cstr-core-v8-3-cb3f26e78686@gmail.com>
References: <20250203-cstr-core-v8-0-cb3f26e78686@gmail.com>
In-Reply-To: <20250203-cstr-core-v8-0-cb3f26e78686@gmail.com>
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible and rename
`kernel::c_str!` to `c_str_avoid_literals` to clarify its intended use.

Closes: https://github.com/Rust-for-Linux/linux/issues/1075
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs     |  7 +++----
 drivers/net/phy/qt2025.rs            |  5 ++---
 rust/kernel/devres.rs                |  2 +-
 rust/kernel/firmware.rs              |  4 ++--
 rust/kernel/kunit.rs                 |  7 ++++---
 rust/kernel/net/phy.rs               |  6 ++----
 rust/kernel/platform.rs              |  4 ++--
 rust/kernel/str.rs                   | 37 +++++++++++++++++++++++-------------
 rust/kernel/sync.rs                  |  4 ++--
 rust/kernel/sync/lock/global.rs      |  3 ++-
 rust/macros/module.rs                |  2 +-
 samples/rust/rust_driver_pci.rs      |  4 ++--
 samples/rust/rust_driver_platform.rs |  4 ++--
 samples/rust/rust_misc_device.rs     |  3 +--
 14 files changed, 50 insertions(+), 42 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 8c7eb009d9fc..b07d36f45a43 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -5,7 +5,6 @@
 //!
 //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.c)
 use kernel::{
-    c_str,
     net::phy::{self, reg::C22, DeviceId, Driver},
     prelude::*,
     uapi,
@@ -41,7 +40,7 @@ fn asix_soft_reset(dev: &mut phy::Device) -> Result {
 #[vtable]
 impl Driver for PhyAX88772A {
     const FLAGS: u32 = phy::flags::IS_INTERNAL;
-    const NAME: &'static CStr = c_str!("Asix Electronics AX88772A");
+    const NAME: &'static CStr = c"Asix Electronics AX88772A";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1861);
 
     // AX88772A is not working properly with some old switches (NETGEAR EN 108TP):
@@ -105,7 +104,7 @@ fn link_change_notify(dev: &mut phy::Device) {
 #[vtable]
 impl Driver for PhyAX88772C {
     const FLAGS: u32 = phy::flags::IS_INTERNAL;
-    const NAME: &'static CStr = c_str!("Asix Electronics AX88772C");
+    const NAME: &'static CStr = c"Asix Electronics AX88772C";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1881);
 
     fn suspend(dev: &mut phy::Device) -> Result {
@@ -125,7 +124,7 @@ fn soft_reset(dev: &mut phy::Device) -> Result {
 
 #[vtable]
 impl Driver for PhyAX88796B {
-    const NAME: &'static CStr = c_str!("Asix Electronics AX88796B");
+    const NAME: &'static CStr = c"Asix Electronics AX88796B";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_model_mask(0x003b1841);
 
     fn soft_reset(dev: &mut phy::Device) -> Result {
diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
index 1ab065798175..2f4ba85a0d73 100644
--- a/drivers/net/phy/qt2025.rs
+++ b/drivers/net/phy/qt2025.rs
@@ -9,7 +9,6 @@
 //!
 //! The QT2025 PHY integrates an Intel 8051 micro-controller.
 
-use kernel::c_str;
 use kernel::error::code;
 use kernel::firmware::Firmware;
 use kernel::net::phy::{
@@ -36,7 +35,7 @@
 
 #[vtable]
 impl Driver for PhyQT2025 {
-    const NAME: &'static CStr = c_str!("QT2025 10Gpbs SFP+");
+    const NAME: &'static CStr = c"QT2025 10Gpbs SFP+";
     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x0043a400);
 
     fn probe(dev: &mut phy::Device) -> Result<()> {
@@ -69,7 +68,7 @@ fn probe(dev: &mut phy::Device) -> Result<()> {
         // The micro-controller will start running from the boot ROM.
         dev.write(C45::new(Mmd::PCS, 0xe854), 0x00c0)?;
 
-        let fw = Firmware::request(c_str!("qt2025-2.0.3.3.fw"), dev.as_ref())?;
+        let fw = Firmware::request(c"qt2025-2.0.3.3.fw", dev.as_ref())?;
         if fw.data().len() > SZ_16K + SZ_8K {
             return Err(code::EFBIG);
         }
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 942376f6f3af..68af33ca2f25 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -45,7 +45,7 @@ struct DevresInner<T> {
 /// # Example
 ///
 /// ```no_run
-/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io::{Io, IoRaw}};
+/// # use kernel::{bindings, device::Device, devres::Devres, io::{Io, IoRaw}};
 /// # use core::ops::Deref;
 ///
 /// // See also [`pci::Bar`] for a real example.
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index c5162fdc95ff..e371df67261e 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -40,13 +40,13 @@ fn request_nowarn() -> Self {
 /// # Examples
 ///
 /// ```no_run
-/// # use kernel::{c_str, device::Device, firmware::Firmware};
+/// # use kernel::{device::Device, firmware::Firmware};
 ///
 /// # fn no_run() -> Result<(), Error> {
 /// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device>` instance
 /// # let dev = unsafe { Device::get_device(core::ptr::null_mut()) };
 ///
-/// let fw = Firmware::request(c_str!("path/to/firmware.bin"), &dev)?;
+/// let fw = Firmware::request(c"path/to/firmware.bin", &dev)?;
 /// let blob = fw.data();
 ///
 /// # Ok(())
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index d858757aeace..527794dcc439 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -56,10 +56,11 @@ macro_rules! kunit_assert {
                 break 'out;
             }
 
-            static NAME: &'static $crate::str::CStr = $crate::c_str!($name);
-            static FILE: &'static $crate::str::CStr = $crate::c_str!($file);
+            static NAME: &'static $crate::str::CStr = $crate::c_str_avoid_literals!($name);
+            static FILE: &'static $crate::str::CStr = $crate::c_str_avoid_literals!($file);
             static LINE: i32 = core::line!() as i32 - $diff;
-            static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
+            static CONDITION: &'static $crate::str::CStr =
+                $crate::c_str_avoid_literals!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
             let kunit_test = unsafe { $crate::bindings::kunit_get_current_test() };
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 73df0f55f94e..edd03e5b8b28 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -780,7 +780,6 @@ const fn as_int(&self) -> u32 {
 ///
 /// ```
 /// # mod module_phy_driver_sample {
-/// use kernel::c_str;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -799,7 +798,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// #[vtable]
 /// impl phy::Driver for PhySample {
-///     const NAME: &'static CStr = c_str!("PhySample");
+///     const NAME: &'static CStr = c"PhySample";
 ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
 /// }
 /// # }
@@ -808,7 +807,6 @@ const fn as_int(&self) -> u32 {
 /// This expands to the following code:
 ///
 /// ```ignore
-/// use kernel::c_str;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -828,7 +826,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// #[vtable]
 /// impl phy::Driver for PhySample {
-///     const NAME: &'static CStr = c_str!("PhySample");
+///     const NAME: &'static CStr = c"PhySample";
 ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
 /// }
 ///
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 50e6b0421813..99af0a16ae85 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -120,7 +120,7 @@ macro_rules! module_platform_driver {
 /// # Example
 ///
 ///```
-/// # use kernel::{bindings, c_str, of, platform};
+/// # use kernel::{bindings, of, platform};
 ///
 /// struct MyDriver;
 ///
@@ -129,7 +129,7 @@ macro_rules! module_platform_driver {
 ///     MODULE_OF_TABLE,
 ///     <MyDriver as platform::Driver>::IdInfo,
 ///     [
-///         (of::DeviceId::new(c_str!("test,device")), ())
+///         (of::DeviceId::new(c"test,device"), ())
 ///     ]
 /// );
 ///
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 13dd2f6cc572..4063d393ab58 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -273,14 +273,13 @@ pub trait CStrExt {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::fmt;
     /// # use kernel::str::CString;
-    /// let penguin = c_str!("🐧");
+    /// let penguin = c"🐧";
     /// let s = CString::try_from_fmt(fmt!("{}", penguin.display()))?;
     /// assert_eq!(s.to_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
     ///
-    /// let ascii = c_str!("so \"cool\"");
+    /// let ascii = c"so \"cool\"";
     /// let s = CString::try_from_fmt(fmt!("{}", ascii.display()))?;
     /// assert_eq!(s.to_bytes_with_nul(), "so \"cool\"\0".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
@@ -368,25 +367,37 @@ fn as_ref(&self) -> &BStr {
     }
 }
 
-/// Creates a new [`CStr`] from a string literal.
+/// Creates a static C string wrapper at compile time.
 ///
-/// The string literal should not contain any `NUL` bytes.
+/// Rust supports C string literals since Rust 1.77, and they should be used instead of this macro
+/// where possible. This macro exists to allow static *non-literal* C strings to be created at
+/// compile time. This is most often used in other macros.
+///
+/// # Panics
+///
+/// This macro panics if the operand contains an interior `NUL` byte.
 ///
 /// # Examples
 ///
 /// ```
-/// # use kernel::c_str;
+/// # use kernel::c_str_avoid_literals;
 /// # use kernel::str::CStr;
-/// const MY_CSTR: &CStr = c_str!("My awesome CStr!");
+/// const MY_CSTR: &CStr = c_str_avoid_literals!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
-macro_rules! c_str {
+macro_rules! c_str_avoid_literals {
+    // NB: we could write `($str:lit) => compile_error!("use a C string literal instead");` here but
+    // that would trigger when the literal is at the top of several macro expansions. That would be
+    // too limiting to macro authors, so we rely on the name as a hint instead.
     ($str:expr) => {{
-        const S: &str = concat!($str, "\0");
-        const C: &$crate::str::CStr = match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
-            Ok(v) => v,
-            Err(_) => panic!("string contains interior NUL"),
-        };
+        const S: &'static str = concat!($str, "\0");
+        const C: &'static $crate::str::CStr =
+            match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
+                Ok(v) => v,
+                Err(core::ffi::FromBytesWithNulError { .. }) => {
+                    panic!("string contains interior NUL")
+                }
+            };
         C
     }};
 }
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 3498fb344dc9..f86d109b4b89 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -62,9 +62,9 @@ macro_rules! static_lock_class {
 #[macro_export]
 macro_rules! optional_name {
     () => {
-        $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!()))
+        $crate::c_str_avoid_literals!(::core::concat!(::core::file!(), ":", ::core::line!()))
     };
     ($name:literal) => {
-        $crate::c_str!($name)
+        $crate::c_str_avoid_literals!($name)
     };
 }
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 6a28f5b60482..4a040c29faee 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -266,7 +266,8 @@ macro_rules! global_lock {
         $pub enum $name {}
 
         impl $crate::sync::lock::GlobalLockBackend for $name {
-            const NAME: &'static $crate::str::CStr = $crate::c_str!(::core::stringify!($name));
+            const NAME: &'static $crate::str::CStr =
+                $crate::c_str_avoid_literals!(::core::stringify!($name));
             type Item = $valuety;
             type Backend = $crate::global_lock_inner!(backend $kind);
 
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index cdf94f4982df..a534fabd29d6 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -229,7 +229,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             }};
 
             impl kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static kernel::str::CStr = kernel::c_str!(\"{name}\");
+                const NAME: &'static kernel::str::CStr = c\"{name}\";
             }}
 
             // Double nested modules, since then nobody can access the public items inside.
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 1fb6e44f3395..cb4a9247ff5e 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -4,7 +4,7 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
-use kernel::{bindings, c_str, devres::Devres, pci, prelude::*};
+use kernel::{bindings, devres::Devres, pci, prelude::*};
 
 struct Regs;
 
@@ -73,7 +73,7 @@ fn probe(pdev: &mut pci::Device, info: &Self::IdInfo) -> Result<Pin<KBox<Self>>>
         pdev.enable_device_mem()?;
         pdev.set_master();
 
-        let bar = pdev.iomap_region_sized::<{ Regs::END }>(0, c_str!("rust_driver_pci"))?;
+        let bar = pdev.iomap_region_sized::<{ Regs::END }>(0, c"rust_driver_pci")?;
 
         let drvdata = KBox::new(
             Self {
diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 8120609e2940..d2df2d0f8261 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -2,7 +2,7 @@
 
 //! Rust Platform driver sample.
 
-use kernel::{c_str, of, platform, prelude::*};
+use kernel::{of, platform, prelude::*};
 
 struct SampleDriver {
     pdev: platform::Device,
@@ -14,7 +14,7 @@ struct SampleDriver {
     OF_TABLE,
     MODULE_OF_TABLE,
     <SampleDriver as platform::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("test,rust-device")), Info(42))]
+    [(of::DeviceId::new(c"test,rust-device"), Info(42))]
 );
 
 impl platform::Driver for SampleDriver {
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 40ad7266c225..9d85819a195b 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -97,7 +97,6 @@
 use core::pin::Pin;
 
 use kernel::{
-    c_str,
     device::Device,
     fs::File,
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
@@ -132,7 +131,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         pr_info!("Initialising Rust Misc Device Sample\n");
 
         let options = MiscDeviceOptions {
-            name: c_str!("rust-misc-device"),
+            name: c"rust-misc-device",
         };
 
         try_pin_init!(Self {

-- 
2.48.1

