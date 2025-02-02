Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA64E1D89E9;
	Sun,  2 Feb 2025 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498863; cv=none; b=qAF7tYBYvo614t6/MBs/sMux+xKiNDA5kmzaj8R3V1oFvIVguzG9vrYiAqvKGNpEZPYwNW/9XnOECTusXw8FnxrJx8LLlGPHChkM1wPfwpmHr1X7QhJ9cKr0wApmQJqA+q7SIVbL0+APtGsspN89dn4qOIznrpAsAnjKZdT82Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498863; c=relaxed/simple;
	bh=qCcE6Lf9182GcqVtS03nhQWQylhDhRsVQZCokxIQw68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEZg2WJl+MZaC2ZJxJbvOlKdxSC7Ih6rDSmA+QttF+Lwno/zflp3bh0j42tI6VAPyJEaSkIP2wNcNUr7N9L8/AWkA2E6IIjd1/HM6OLceE0WPfMWWGs6yik0rpqYCreZjQsKk5ih6372rT01zkek1OhaW5/HQKnScq8mLOYUBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlOenyeK; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlOenyeK"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467bc28277eso29994201cf.1;
        Sun, 02 Feb 2025 04:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738498860; x=1739103660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4JU7/btSDeoFoLH5evt7g0RxbhFmC5zD2zX4QG/3vc=;
        b=nlOenyeKOkaayCAs7V4Tsvi9JscYzkRbwdx5SV2jJTGOYq3Z1rBmoRsyfNR5RFIpkE
         YQRTPXVn0u4KCQp4WTyAONAIbwDoqctCwxU2pWOoNDxdB1SHNKFCnij0v90YCXASfwD+
         v9b5ikB98T+HNBwczsYbdCjSxdhc4lYPrXthCdGWtHmwO7c+dr6uUHIZdRN9bZPVV3+C
         486X4fxJ655l9wkxlWf8vLvczKPlx6xiOz0MKHKZzrbo/yfReqMLqx/kxDBoW5C7BeJV
         DYPSaI1orQHc6uDUENfm5G+3C2WKPZkFqQzzT2+7fx5vKTiIub7G0b+EPDsF6DrWaEx8
         aK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498860; x=1739103660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4JU7/btSDeoFoLH5evt7g0RxbhFmC5zD2zX4QG/3vc=;
        b=If1r1whDplo1CQtdGQ+m+GnFVOT8Lcj4nSxyw3FZEsRwr3Q44AoPybpbz2+3RIS/fC
         ZBZVakBHd9YndSiyfR7P0Jls5WQS2MbNCbH6UE57blz6LZbU/hXMkVBmdliZo0I63e8H
         Ay8e2CgMAQvZvtpkBuzMn4r0m6nAl7Wt/6oTd6rSgD5RiAF0xBerwapHLEdJ3B+rYPYY
         bOXMb+ihxzJlyMUK/aWbYRk9TKH9lhT7h+zT7SPkrDfE1+QOJJvpt8TZ30r5+vXR6JY9
         OW79yDTD8sT8pmRGdYyf5V8mDWZ+lzpcOLEsh+CMlx9/qTMHC+vGgrbRuC59GQyHeSbg
         BpJg==
X-Forwarded-Encrypted: i=1; AJvYcCVBPFXSX9TE8s1f2MlxwUWgPdDcpavbG8ChOfLqoxvwMBbLKT4RMjSJDbjFxfuLkW0V25eYml50gT3cxKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGAlKE9UR+4HNlCzlQWBQBQy9bZzNxx5O8DVZxyc8nItdnqCeS
	kPuiZq6FCgtrm7AxHy7p6rXHXQJNhHmyiZHHK4ucIWPma4ZbxCEz
X-Gm-Gg: ASbGncuMD/gV8T9NzmbmxqMSz12xFREpIGYSSWpPKa7wB8aoofc3eEiqWqch0f+zP9y
	rOl8F/cYkc8aI2Dmw0J8Y5f2koUpWBsZ7MOCUEvCFrHqvVTfm7l+BU/lSzoa/O+6n58KkbxcIgT
	+t2V2hFeP2qTfEBddZvZX1zq9oWWTzJzgFOezIqbQ6BhDbTr/LNSRRNW/PgKjTT5jw56RvZQPmV
	2cct7O6qeTIruOaYdsYiF4ro23Ath9xEq+r2tyVJ8zMa78gukTHBNAU8klot1xxWgERQOTwe9MR
	e+9/1Qu4kZGjy0w8ULD8h1MVX/qJ/2/9G8WPtFw=
X-Google-Smtp-Source: AGHT+IFajMRbR9qD9CM+8VgxakOzVQP/SNgr/FMkCbdBjK0L3k64Fq+wUS2wTQbOjsWG3gowLjAJow==
X-Received: by 2002:a05:622a:551b:b0:466:ac58:df71 with SMTP id d75a77b69052e-46fd0a817d4mr228441491cf.7.1738498860344;
        Sun, 02 Feb 2025 04:21:00 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf1728efsm37700331cf.62.2025.02.02.04.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:20:59 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 02 Feb 2025 07:20:48 -0500
Subject: [PATCH v6 3/4] rust: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250202-cstr-core-v6-3-8469cd6d29fd@gmail.com>
References: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com>
In-Reply-To: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com>
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
 drivers/net/phy/ax88796b_rust.rs |  7 +++----
 drivers/net/phy/qt2025.rs        |  5 ++---
 rust/kernel/firmware.rs          |  4 ++--
 rust/kernel/kunit.rs             |  7 ++++---
 rust/kernel/net/phy.rs           |  6 ++----
 rust/kernel/str.rs               | 37 ++++++++++++++++++++++++-------------
 rust/kernel/sync.rs              |  4 ++--
 rust/kernel/sync/lock/global.rs  |  3 ++-
 8 files changed, 41 insertions(+), 32 deletions(-)

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
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index e75db4d825ce..93e375e75ca0 100644
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
index 9f40ea744fc2..3d812edec057 100644
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
index 9e410de3c3a3..5fb9b0e1c9b1 100644
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
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 2b63cfaaa981..20d852aa8b3c 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -190,14 +190,13 @@ pub trait CStrExt {
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
@@ -250,25 +249,37 @@ pub const fn as_char_ptr(c_str: &CStr) -> *const crate::ffi::c_char {
     c_str.as_ptr().cast()
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
index 1eab7ebf25fd..ec7f80a924c3 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -61,9 +61,9 @@ macro_rules! static_lock_class {
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
index 4c4d60a51c1f..732dde45024b 100644
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
 

-- 
2.48.1

