Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDBF10E0;
	Sun,  2 Feb 2025 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738514363; cv=none; b=emssu05Cn2WjauuzQEdgeBYN3B58L6wpD8rMwiV+GWg+kgkFzBhrMty3WQP2CGDO6V3LBTqmtK411KjOi3zw//tYEVnOzFe74T00X/X4JKV/jVq39VrNKIHHxRo86Xo68jI0TBj/+xohjNQp/tQADopDhZWa/okb94LshR/dScs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738514363; c=relaxed/simple;
	bh=eOh2rpdDyjrO4tsEi/ljquHrLIfisg7RinqcV+HVncs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQIPyxc2w/WiVyMUIrdpyg9taFXHi2v2IDlX1ZmlXMKvH2SnLDmvSCI4XLpjKWtcvhUim5aelKJFoVFAT4t+VPaJ2gcCdt8/FM6esElx25tLx2li5ZmpqEiyzyFfcghHF3vRH0T0WiV1GO5SwomoN6ZC90ogzDvBZJUtyjIRCpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGJcON4F; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGJcON4F"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f441904a42so6128009a91.1;
        Sun, 02 Feb 2025 08:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738514360; x=1739119160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Asgf1xelIrx+SrLj7fQhqz+2lJCzsMJqTI2bB/U+95g=;
        b=EGJcON4FXAbrIlBatVJZHl8ugX0c+CLRjA/90zpdNUa7gpCMvaRejgzf/L933JnSnw
         UGADNE2MHKw2JWacEKZP7S97a/2QVvf3ufHqJBMjevuVxVC+bo25f4fQiEpTv7pDM6p2
         SdZ+S6yNyiITkr+EJUf3sZDM5HmS20KyKhnZLhBqzuMIe5bKHJIB9mv2/8DIQ0XW5V6k
         IK0g/SnB2bkv+BxaOpcwtqfP8+e3+9iTx+M6v2v6WtNQj9dqxDR7GKB5wWP8UcpXcwDe
         NR1zyxNYyk4dmbdi4DO9vlD6WBAVglK7pam+DEuARkWrnaR79WDo+FFaWex7NPvqngb/
         VU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738514360; x=1739119160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Asgf1xelIrx+SrLj7fQhqz+2lJCzsMJqTI2bB/U+95g=;
        b=Dfcl8pYmesgYdJZr4qlj4AGWL7B7yR+GLppkD0L5lk/1uUfKF5bC9R0mst+ISVDDoq
         E58vpdTAIfkyZMTEl8ANlpFPf7dqP0ov3o2tso2FPcg1L7QGyHnCA/2sAjIZuBHk5Xql
         ALGD/zjJKfZTcSNa7gOmtTJHahiqlEkXWx38A16UtToNta6bN1R18xSrntOG1DbG8LCN
         h5wwIL/EjAEoRr1EbQTW1bmfbLULWEtEg07EYt8U1bK7FPVcmGAmFgcMAsAVeKeUB6cx
         fGZbwR7uzUsYxuvOt0Z2y/ghv9UXPC9VrTdoIb33eRBw8iYx1dgPtAN+FDNUlw4blP1Q
         Hhtw==
X-Forwarded-Encrypted: i=1; AJvYcCVjIbLLS10tvqSI3C0Z6xjNXBJWQNzumbeZtJQQCbMAZd8XC6AZcnjK8HqaV0ejOOJHh1Hls5m9D/s6Cmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpBwlO/j6ffmBx+vnl3EkF2qCccyroTl2oecSjgrJikp3tzBPd
	0O65bn245tSWfYFVnFFdoROCXU8eJjhGOxgzvi4wnJoxWVUlhsz4YJOxs8oVgZA=
X-Gm-Gg: ASbGncupsLCUNwx5NyxwADFKEjTRoYBTNGB3zcdsaXBCpxNIxkHOHkGDjALfHzWnaRv
	LM4cUnCg4mwiOjU05Q2PkXWde2snO2WWrvlSyVvqCBXsvBWEFCtymle7dJ5WKMNcQwoqXknLN9r
	927W8OKzP5DKCPXRImZuiHZiGambkQki6fvRfNHsJJ6wGVu5Wq9N5x3YqeBx9tNV2dfsV2LCnNX
	MMZcZ2p/wkw91Jw6FxUNzL9ucSGBL62mF+LtJYTD/HPFKHNP0o9mG4UQ4dGTIkddjDaET2l2zH6
	LC8P0w6HoMyZGMPFkWL7IWSRZzJFIpu++QqiQT4=
X-Google-Smtp-Source: AGHT+IFxtgkcG/S32dK4vtrKshUXTNx0djiHQHVyEy9QEer1Jg+04U2o3oFmWOE1ClXqY57TU12v2w==
X-Received: by 2002:a05:620a:258b:b0:7b6:dac1:cb73 with SMTP id af79cd13be357-7bffcda901cmr2986013385a.56.1738513891738;
        Sun, 02 Feb 2025 08:31:31 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bb957sm421307485a.14.2025.02.02.08.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 08:31:30 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 02 Feb 2025 11:31:19 -0500
Subject: [PATCH v7 2/4] rust: replace `CStr` with `core::ffi::CStr`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250202-cstr-core-v7-2-da1802520438@gmail.com>
References: <20250202-cstr-core-v7-0-da1802520438@gmail.com>
In-Reply-To: <20250202-cstr-core-v7-0-da1802520438@gmail.com>
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

`std::ffi::CStr` was moved to `core::ffi::CStr` in Rust 1.64. Replace
`kernel::str::CStr` with `core::ffi::CStr` now that we can.

`kernel::str::CStr::{from,as}_char_ptr` live on as free functions in
`kernel::str` to paper over the difference between `core::ffi::c_char`
and `kernel::ffi::char`; see the code comment on the latter type for
details.

C-String literals were added in Rust 1.77. Opportunistically replace
instances of `kernel::c_str!` with C-String literals where other code
changes were already necessary; the rest will be done in a later commit.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/drm_panic_qr.rs |   2 +-
 rust/kernel/device.rs           |  12 +-
 rust/kernel/error.rs            |   4 +-
 rust/kernel/firmware.rs         |   2 +-
 rust/kernel/kunit.rs            |   4 +-
 rust/kernel/miscdevice.rs       |   2 +-
 rust/kernel/net/phy.rs          |   2 +-
 rust/kernel/of.rs               |   2 +-
 rust/kernel/pci.rs              |   8 +-
 rust/kernel/platform.rs         |   2 +-
 rust/kernel/prelude.rs          |   5 +-
 rust/kernel/seq_file.rs         |   4 +-
 rust/kernel/str.rs              | 446 ++++++++++------------------------------
 rust/kernel/sync/condvar.rs     |   2 +-
 rust/kernel/sync/lock.rs        |   2 +-
 rust/kernel/sync/lock/global.rs |   2 +-
 rust/kernel/workqueue.rs        |   2 +-
 17 files changed, 138 insertions(+), 365 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index bcf248f69252..ef294017888e 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -958,7 +958,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
     } else {
         // SAFETY: The caller ensures that `url` is a valid pointer to a
         // nul-terminated string.
-        let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
+        let url_cstr: &CStr = unsafe { kernel::str::from_char_ptr(url) };
         let segments = &[
             &Segment::Binary(url_cstr.as_bytes()),
             &Segment::Numeric(&data_slice[0..data_len]),
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index db2d9658ba47..9554921368c0 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -11,9 +11,6 @@
 };
 use core::{fmt, ptr};
 
-#[cfg(CONFIG_PRINTK)]
-use crate::c_str;
-
 /// A reference-counted device.
 ///
 /// This structure represents the Rust abstraction for a C `struct device`. This implementation
@@ -176,7 +173,7 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             bindings::_dev_printk(
                 klevel as *const _ as *const crate::ffi::c_char,
                 self.as_raw(),
-                c_str!("%pA").as_char_ptr(),
+                crate::str::as_char_ptr(c"%pA"),
                 &msg as *const _ as *const crate::ffi::c_void,
             )
         };
@@ -185,7 +182,12 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
     /// Checks if property is present or not.
     pub fn property_present(&self, name: &CStr) -> bool {
         // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
-        unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
+        unsafe {
+            bindings::device_property_present(
+                self.as_raw().cast_const(),
+                crate::str::as_char_ptr(name),
+            )
+        }
     }
 }
 
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index f6ecf09cb65f..51c5e0f0a0bc 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -164,7 +164,7 @@ pub fn name(&self) -> Option<&'static CStr> {
             None
         } else {
             // SAFETY: The string returned by `errname` is static and `NUL`-terminated.
-            Some(unsafe { CStr::from_char_ptr(ptr) })
+            Some(unsafe { crate::str::from_char_ptr(ptr) })
         }
     }
 
@@ -187,7 +187,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
             Some(name) => f
                 .debug_tuple(
                     // SAFETY: These strings are ASCII-only.
-                    unsafe { core::str::from_utf8_unchecked(name) },
+                    unsafe { core::str::from_utf8_unchecked(name.to_bytes()) },
                 )
                 .finish(),
         }
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index c5162fdc95ff..e75db4d825ce 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -61,7 +61,7 @@ fn request_internal(name: &CStr, dev: &Device, func: FwFunc) -> Result<Self> {
 
         // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
         // `name` and `dev` are valid as by their type invariants.
-        let ret = unsafe { func.0(pfw as _, name.as_char_ptr(), dev.as_raw()) };
+        let ret = unsafe { func.0(pfw as _, crate::str::as_char_ptr(name), dev.as_raw()) };
         if ret != 0 {
             return Err(Error::from_errno(ret));
         }
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 630b947c708c..9f40ea744fc2 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -101,12 +101,12 @@ unsafe impl Sync for Location {}
             unsafe impl Sync for UnaryAssert {}
 
             static LOCATION: Location = Location($crate::bindings::kunit_loc {
-                file: FILE.as_char_ptr(),
+                file: $crate::str::as_char_ptr(FILE),
                 line: LINE,
             });
             static ASSERTION: UnaryAssert = UnaryAssert($crate::bindings::kunit_unary_assert {
                 assert: $crate::bindings::kunit_assert {},
-                condition: CONDITION.as_char_ptr(),
+                condition: $crate::str::as_char_ptr(CONDITION),
                 expected_true: true,
             });
 
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index e14433b2ab9d..65f70ff61eb3 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -34,7 +34,7 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
         // SAFETY: All zeros is valid for this C type.
         let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
         result.minor = bindings::MISC_DYNAMIC_MINOR as _;
-        result.name = self.name.as_char_ptr();
+        result.name = crate::str::as_char_ptr(self.name);
         result.fops = create_vtable::<T>();
         result
     }
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index bb654a28dab3..c60205606aee 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -504,7 +504,7 @@ unsafe impl Sync for DriverVTable {}
 pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
     // INVARIANT: All the fields of `struct phy_driver` are initialized properly.
     DriverVTable(Opaque::new(bindings::phy_driver {
-        name: T::NAME.as_char_ptr().cast_mut(),
+        name: crate::str::as_char_ptr(T::NAME),
         flags: T::FLAGS,
         phy_id: T::PHY_DEVICE_ID.id,
         phy_id_mask: T::PHY_DEVICE_ID.mask_as_int(),
diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 04f2d8ef29cb..12ea65df46de 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -29,7 +29,7 @@ fn index(&self) -> usize {
 impl DeviceId {
     /// Create a new device id from an OF 'compatible' string.
     pub const fn new(compatible: &'static CStr) -> Self {
-        let src = compatible.as_bytes_with_nul();
+        let src = compatible.to_bytes_with_nul();
         // Replace with `bindings::of_device_id::default()` once stabilized for `const`.
         // SAFETY: FFI type is valid to be zero-initialized.
         let mut of: bindings::of_device_id = unsafe { core::mem::zeroed() };
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 4c98b5b9aa1e..af36ddac80ff 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -35,7 +35,7 @@ unsafe fn register(
     ) -> Result {
         // SAFETY: It's safe to set the fields of `struct pci_driver` on initialization.
         unsafe {
-            (*pdrv.get()).name = name.as_char_ptr();
+            (*pdrv.get()).name = crate::str::as_char_ptr(name);
             (*pdrv.get()).probe = Some(Self::probe_callback);
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
@@ -43,7 +43,7 @@ unsafe fn register(
 
         // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
         to_result(unsafe {
-            bindings::__pci_register_driver(pdrv.get(), module.0, name.as_char_ptr())
+            bindings::__pci_register_driver(pdrv.get(), module.0, crate::str::as_char_ptr(name))
         })
     }
 
@@ -275,7 +275,9 @@ fn new(pdev: Device, num: u32, name: &CStr) -> Result<Self> {
         // `pdev` is valid by the invariants of `Device`.
         // `num` is checked for validity by a previous call to `Device::resource_len`.
         // `name` is always valid.
-        let ret = unsafe { bindings::pci_request_region(pdev.as_raw(), num, name.as_char_ptr()) };
+        let ret = unsafe {
+            bindings::pci_request_region(pdev.as_raw(), num, crate::str::as_char_ptr(name))
+        };
         if ret != 0 {
             return Err(EBUSY);
         }
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 50e6b0421813..d1752a978af4 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -36,7 +36,7 @@ unsafe fn register(
 
         // SAFETY: It's safe to set the fields of `struct platform_driver` on initialization.
         unsafe {
-            (*pdrv.get()).driver.name = name.as_char_ptr();
+            (*pdrv.get()).driver.name = crate::str::as_char_ptr(name);
             (*pdrv.get()).probe = Some(Self::probe_callback);
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).driver.of_match_table = of_table;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index dde2e0649790..96e7029c27da 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -34,7 +34,10 @@
 
 pub use super::error::{code::*, Error, Result};
 
-pub use super::{str::CStr, ThisModule};
+pub use super::{
+    str::{CStr, CStrExt as _},
+    ThisModule,
+};
 
 pub use super::init::{InPlaceInit, InPlaceWrite, Init, PinInit};
 
diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 04947c672979..bb3c49fd4ef3 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_file.h)
 
-use crate::{bindings, c_str, types::NotThreadSafe, types::Opaque};
+use crate::{bindings, types::NotThreadSafe, types::Opaque};
 
 /// A utility for generating the contents of a seq file.
 #[repr(transparent)]
@@ -35,7 +35,7 @@ pub fn call_printf(&self, args: core::fmt::Arguments<'_>) {
         unsafe {
             bindings::seq_printf(
                 self.inner.get(),
-                c_str!("%pA").as_char_ptr(),
+                crate::str::as_char_ptr(c"%pA"),
                 &args as *const _ as *const crate::ffi::c_void,
             );
         }
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index c273f1367607..0c4189a478b4 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -4,7 +4,7 @@
 
 use crate::alloc::{flags::*, AllocError, KVec};
 use core::fmt::{self, Write};
-use core::ops::{self, Deref, DerefMut, Index};
+use core::ops::{Deref, DerefMut};
 
 use crate::error::{code::*, Error};
 
@@ -45,11 +45,11 @@ pub const fn from_bytes(bytes: &[u8]) -> &Self {
     /// # use kernel::{fmt, b_str, str::CString};
     /// let ascii = b_str!("Hello, BStr!");
     /// let s = CString::try_from_fmt(fmt!("{}", ascii.display()))?;
-    /// assert_eq!(s.as_bytes(), "Hello, BStr!".as_bytes());
+    /// assert_eq!(s.to_bytes(), "Hello, BStr!".as_bytes());
     ///
     /// let non_ascii = b_str!("🦀");
     /// let s = CString::try_from_fmt(fmt!("{}", non_ascii.display()))?;
-    /// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
+    /// assert_eq!(s.to_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
     #[inline]
@@ -74,11 +74,11 @@ pub fn display(&self) -> Display<'_> {
 /// # use kernel::{fmt, b_str, str::CString};
 /// let ascii = b_str!("Hello, BStr!");
 /// let s = CString::try_from_fmt(fmt!("{}", ascii.display()))?;
-/// assert_eq!(s.as_bytes(), "Hello, BStr!".as_bytes());
+/// assert_eq!(s.to_bytes(), "Hello, BStr!".as_bytes());
 ///
 /// let non_ascii = b_str!("🦀");
 /// let s = CString::try_from_fmt(fmt!("{}", non_ascii.display()))?;
-/// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
+/// assert_eq!(s.to_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
 /// # Ok::<(), kernel::error::Error>(())
 /// ```
 ///
@@ -120,11 +120,11 @@ impl fmt::Debug for BStr {
     /// // Embedded double quotes are escaped.
     /// let ascii = b_str!("Hello, \"BStr\"!");
     /// let s = CString::try_from_fmt(fmt!("{:?}", ascii))?;
-    /// assert_eq!(s.as_bytes(), "\"Hello, \\\"BStr\\\"!\"".as_bytes());
+    /// assert_eq!(s.to_bytes(), "\"Hello, \\\"BStr\\\"!\"".as_bytes());
     ///
     /// let non_ascii = b_str!("😺");
     /// let s = CString::try_from_fmt(fmt!("{:?}", non_ascii))?;
-    /// assert_eq!(s.as_bytes(), "\"\\xf0\\x9f\\x98\\xba\"".as_bytes());
+    /// assert_eq!(s.to_bytes(), "\"\\xf0\\x9f\\x98\\xba\"".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
@@ -177,190 +177,36 @@ macro_rules! b_str {
     }};
 }
 
-/// Possible errors when using conversion functions in [`CStr`].
-#[derive(Debug, Clone, Copy)]
-pub enum CStrConvertError {
-    /// Supplied bytes contain an interior `NUL`.
-    InteriorNul,
+pub use core::ffi::CStr;
 
-    /// Supplied bytes are not terminated by `NUL`.
-    NotNulTerminated,
+/// Wraps a raw C string with a safe C string wrapper.
+///
+/// # Safety
+///
+/// `ptr` must be a valid pointer to a `NUL`-terminated C string, and it must
+/// last at least `'a`. When `CStr` is alive, the memory pointed by `ptr`
+/// must not be mutated.
+// This function exists to paper over the fact that `CStr::from_ptr` takes a `*const
+// core::ffi::c_char` rather than a `*const crate::ffi::c_char`.
+#[inline]
+pub unsafe fn from_char_ptr<'a>(ptr: *const crate::ffi::c_char) -> &'a CStr {
+    // SAFETY: The safety preconditions are the same as for `CStr::from_ptr`.
+    unsafe { CStr::from_ptr(ptr.cast()) }
 }
 
-impl From<CStrConvertError> for Error {
-    #[inline]
-    fn from(_: CStrConvertError) -> Error {
-        EINVAL
-    }
+/// Returns a C pointer to the string.
+// This function exists to paper over the fact that `CStr::as_ptr` returns a `*const
+// core::ffi::c_char` rather than a `*const crate::ffi::c_char`. It is a free function rather than a
+// method on an extension trait because:
+//
+// - error[E0379]: functions in trait impls cannot be declared const
+#[inline]
+pub const fn as_char_ptr(c_str: &CStr) -> *const crate::ffi::c_char {
+    c_str.as_ptr().cast()
 }
 
-/// A string that is guaranteed to have exactly one `NUL` byte, which is at the
-/// end.
-///
-/// Used for interoperability with kernel APIs that take C strings.
-#[repr(transparent)]
-pub struct CStr([u8]);
-
-impl CStr {
-    /// Returns the length of this string excluding `NUL`.
-    #[inline]
-    pub const fn len(&self) -> usize {
-        self.len_with_nul() - 1
-    }
-
-    /// Returns the length of this string with `NUL`.
-    #[inline]
-    pub const fn len_with_nul(&self) -> usize {
-        if self.0.is_empty() {
-            // SAFETY: This is one of the invariant of `CStr`.
-            // We add a `unreachable_unchecked` here to hint the optimizer that
-            // the value returned from this function is non-zero.
-            unsafe { core::hint::unreachable_unchecked() };
-        }
-        self.0.len()
-    }
-
-    /// Returns `true` if the string only includes `NUL`.
-    #[inline]
-    pub const fn is_empty(&self) -> bool {
-        self.len() == 0
-    }
-
-    /// Wraps a raw C string pointer.
-    ///
-    /// # Safety
-    ///
-    /// `ptr` must be a valid pointer to a `NUL`-terminated C string, and it must
-    /// last at least `'a`. When `CStr` is alive, the memory pointed by `ptr`
-    /// must not be mutated.
-    #[inline]
-    pub unsafe fn from_char_ptr<'a>(ptr: *const crate::ffi::c_char) -> &'a Self {
-        // SAFETY: The safety precondition guarantees `ptr` is a valid pointer
-        // to a `NUL`-terminated C string.
-        let len = unsafe { bindings::strlen(ptr) } + 1;
-        // SAFETY: Lifetime guaranteed by the safety precondition.
-        let bytes = unsafe { core::slice::from_raw_parts(ptr as _, len) };
-        // SAFETY: As `len` is returned by `strlen`, `bytes` does not contain interior `NUL`.
-        // As we have added 1 to `len`, the last byte is known to be `NUL`.
-        unsafe { Self::from_bytes_with_nul_unchecked(bytes) }
-    }
-
-    /// Creates a [`CStr`] from a `[u8]`.
-    ///
-    /// The provided slice must be `NUL`-terminated, does not contain any
-    /// interior `NUL` bytes.
-    pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError> {
-        if bytes.is_empty() {
-            return Err(CStrConvertError::NotNulTerminated);
-        }
-        if bytes[bytes.len() - 1] != 0 {
-            return Err(CStrConvertError::NotNulTerminated);
-        }
-        let mut i = 0;
-        // `i + 1 < bytes.len()` allows LLVM to optimize away bounds checking,
-        // while it couldn't optimize away bounds checks for `i < bytes.len() - 1`.
-        while i + 1 < bytes.len() {
-            if bytes[i] == 0 {
-                return Err(CStrConvertError::InteriorNul);
-            }
-            i += 1;
-        }
-        // SAFETY: We just checked that all properties hold.
-        Ok(unsafe { Self::from_bytes_with_nul_unchecked(bytes) })
-    }
-
-    /// Creates a [`CStr`] from a `[u8]` without performing any additional
-    /// checks.
-    ///
-    /// # Safety
-    ///
-    /// `bytes` *must* end with a `NUL` byte, and should only have a single
-    /// `NUL` byte (or the string will be truncated).
-    #[inline]
-    pub const unsafe fn from_bytes_with_nul_unchecked(bytes: &[u8]) -> &CStr {
-        // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
-        unsafe { core::mem::transmute(bytes) }
-    }
-
-    /// Creates a mutable [`CStr`] from a `[u8]` without performing any
-    /// additional checks.
-    ///
-    /// # Safety
-    ///
-    /// `bytes` *must* end with a `NUL` byte, and should only have a single
-    /// `NUL` byte (or the string will be truncated).
-    #[inline]
-    pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
-        // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
-        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
-    }
-
-    /// Returns a C pointer to the string.
-    #[inline]
-    pub const fn as_char_ptr(&self) -> *const crate::ffi::c_char {
-        self.0.as_ptr()
-    }
-
-    /// Convert the string to a byte slice without the trailing `NUL` byte.
-    #[inline]
-    pub fn as_bytes(&self) -> &[u8] {
-        &self.0[..self.len()]
-    }
-
-    /// Convert the string to a byte slice containing the trailing `NUL` byte.
-    #[inline]
-    pub const fn as_bytes_with_nul(&self) -> &[u8] {
-        &self.0
-    }
-
-    /// Yields a [`&str`] slice if the [`CStr`] contains valid UTF-8.
-    ///
-    /// If the contents of the [`CStr`] are valid UTF-8 data, this
-    /// function will return the corresponding [`&str`] slice. Otherwise,
-    /// it will return an error with details of where UTF-8 validation failed.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// # use kernel::str::CStr;
-    /// let cstr = CStr::from_bytes_with_nul(b"foo\0")?;
-    /// assert_eq!(cstr.to_str(), Ok("foo"));
-    /// # Ok::<(), kernel::error::Error>(())
-    /// ```
-    #[inline]
-    pub fn to_str(&self) -> Result<&str, core::str::Utf8Error> {
-        core::str::from_utf8(self.as_bytes())
-    }
-
-    /// Unsafely convert this [`CStr`] into a [`&str`], without checking for
-    /// valid UTF-8.
-    ///
-    /// # Safety
-    ///
-    /// The contents must be valid UTF-8.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// # use kernel::c_str;
-    /// # use kernel::str::CStr;
-    /// let bar = c_str!("ツ");
-    /// // SAFETY: String literals are guaranteed to be valid UTF-8
-    /// // by the Rust compiler.
-    /// assert_eq!(unsafe { bar.as_str_unchecked() }, "ツ");
-    /// ```
-    #[inline]
-    pub unsafe fn as_str_unchecked(&self) -> &str {
-        // SAFETY: TODO.
-        unsafe { core::str::from_utf8_unchecked(self.as_bytes()) }
-    }
-
-    /// Convert this [`CStr`] into a [`CString`] by allocating memory and
-    /// copying over the string data.
-    pub fn to_cstring(&self) -> Result<CString, AllocError> {
-        CString::try_from(self)
-    }
-
+/// Extensions to [`CStr`].
+pub trait CStrExt {
     /// Converts this [`CStr`] to its ASCII lower case equivalent in-place.
     ///
     /// ASCII letters 'A' to 'Z' are mapped to 'a' to 'z',
@@ -370,11 +216,7 @@ pub fn to_cstring(&self) -> Result<CString, AllocError> {
     /// [`to_ascii_lowercase()`].
     ///
     /// [`to_ascii_lowercase()`]: #method.to_ascii_lowercase
-    pub fn make_ascii_lowercase(&mut self) {
-        // INVARIANT: This doesn't introduce or remove NUL bytes in the C
-        // string.
-        self.0.make_ascii_lowercase();
-    }
+    fn make_ascii_lowercase(&mut self);
 
     /// Converts this [`CStr`] to its ASCII upper case equivalent in-place.
     ///
@@ -385,11 +227,7 @@ pub fn make_ascii_lowercase(&mut self) {
     /// [`to_ascii_uppercase()`].
     ///
     /// [`to_ascii_uppercase()`]: #method.to_ascii_uppercase
-    pub fn make_ascii_uppercase(&mut self) {
-        // INVARIANT: This doesn't introduce or remove NUL bytes in the C
-        // string.
-        self.0.make_ascii_uppercase();
-    }
+    fn make_ascii_uppercase(&mut self);
 
     /// Returns a copy of this [`CString`] where each character is mapped to its
     /// ASCII lower case equivalent.
@@ -400,13 +238,7 @@ pub fn make_ascii_uppercase(&mut self) {
     /// To lowercase the value in-place, use [`make_ascii_lowercase`].
     ///
     /// [`make_ascii_lowercase`]: str::make_ascii_lowercase
-    pub fn to_ascii_lowercase(&self) -> Result<CString, AllocError> {
-        let mut s = self.to_cstring()?;
-
-        s.make_ascii_lowercase();
-
-        Ok(s)
-    }
+    fn to_ascii_lowercase(&self) -> Result<CString, AllocError>;
 
     /// Returns a copy of this [`CString`] where each character is mapped to its
     /// ASCII upper case equivalent.
@@ -417,13 +249,7 @@ pub fn to_ascii_lowercase(&self) -> Result<CString, AllocError> {
     /// To uppercase the value in-place, use [`make_ascii_uppercase`].
     ///
     /// [`make_ascii_uppercase`]: str::make_ascii_uppercase
-    pub fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
-        let mut s = self.to_cstring()?;
-
-        s.make_ascii_uppercase();
-
-        Ok(s)
-    }
+    fn to_ascii_uppercase(&self) -> Result<CString, AllocError>;
 
     /// Returns an object that implements [`Display`] for safely printing a [`CStr`] that may
     /// contain non-Unicode data. If you would like an implementation which escapes the [`CStr`]
@@ -440,116 +266,65 @@ pub fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
     /// # use kernel::str::CString;
     /// let penguin = c_str!("🐧");
     /// let s = CString::try_from_fmt(fmt!("{}", penguin.display()))?;
-    /// assert_eq!(s.as_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
+    /// assert_eq!(s.to_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
     ///
     /// let ascii = c_str!("so \"cool\"");
     /// let s = CString::try_from_fmt(fmt!("{}", ascii.display()))?;
-    /// assert_eq!(s.as_bytes_with_nul(), "so \"cool\"\0".as_bytes());
+    /// assert_eq!(s.to_bytes_with_nul(), "so \"cool\"\0".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
+    fn display(&self) -> Display<'_>;
+}
+
+/// Converts a mutable C string to a mutable byte slice.
+///
+/// # Safety
+///
+/// The caller must ensure that the slice ends in a NUL byte and contains no other NUL bytes before
+/// the borrow ends and the underlying [`CStr`] is used.
+unsafe fn to_bytes_mut(s: &mut CStr) -> &mut [u8] {
+    // SAFETY: the cast from `&CStr` to `&[u8]` is safe since `CStr` has the same layout as `&[u8]`
+    // (this is technically not guaranteed, but we rely on it here). The pointer dereference is
+    // safe since it comes from a mutable reference which is guaranteed to be valid for writes.
+    unsafe { &mut *(s as *mut CStr as *mut [u8]) }
+}
+
+impl CStrExt for CStr {
+    fn make_ascii_lowercase(&mut self) {
+        // SAFETY: This doesn't introduce or remove NUL bytes in the C string.
+        unsafe { to_bytes_mut(self) }.make_ascii_lowercase();
+    }
+
+    fn make_ascii_uppercase(&mut self) {
+        // SAFETY: This doesn't introduce or remove NUL bytes in the C string.
+        unsafe { to_bytes_mut(self) }.make_ascii_uppercase();
+    }
+
+    fn to_ascii_lowercase(&self) -> Result<CString, AllocError> {
+        let mut s = CString::try_from(self)?;
+
+        s.make_ascii_lowercase();
+
+        Ok(s)
+    }
+
+    fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
+        let mut s = CString::try_from(self)?;
+
+        s.make_ascii_uppercase();
+
+        Ok(s)
+    }
+
     #[inline]
-    pub fn display(&self) -> Display<'_> {
+    fn display(&self) -> Display<'_> {
         Display {
-            inner: self,
+            inner: BStr::from_bytes(self.to_bytes()),
             escape_common: false,
         }
     }
 }
 
-impl fmt::Debug for CStr {
-    /// Formats printable ASCII characters with a double quote on either end, escaping the rest.
-    ///
-    /// ```
-    /// # use kernel::c_str;
-    /// # use kernel::fmt;
-    /// # use kernel::str::CString;
-    /// let penguin = c_str!("🐧");
-    /// let s = CString::try_from_fmt(fmt!("{:?}", penguin))?;
-    /// assert_eq!(s.as_bytes_with_nul(), "\"\\xf0\\x9f\\x90\\xa7\"\0".as_bytes());
-    ///
-    /// // Embedded double quotes are escaped.
-    /// let ascii = c_str!("so \"cool\"");
-    /// let s = CString::try_from_fmt(fmt!("{:?}", ascii))?;
-    /// assert_eq!(s.as_bytes_with_nul(), "\"so \\\"cool\\\"\"\0".as_bytes());
-    /// # Ok::<(), kernel::error::Error>(())
-    /// ```
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        f.write_str("\"")?;
-        for &c in self.as_bytes() {
-            match c {
-                // Printable characters.
-                b'\"' => f.write_str("\\\"")?,
-                0x20..=0x7e => f.write_char(c as char)?,
-                _ => write!(f, "\\x{:02x}", c)?,
-            }
-        }
-        f.write_str("\"")
-    }
-}
-
-impl AsRef<BStr> for CStr {
-    #[inline]
-    fn as_ref(&self) -> &BStr {
-        BStr::from_bytes(self.as_bytes())
-    }
-}
-
-impl Deref for CStr {
-    type Target = BStr;
-
-    #[inline]
-    fn deref(&self) -> &Self::Target {
-        self.as_ref()
-    }
-}
-
-impl Index<ops::RangeFrom<usize>> for CStr {
-    type Output = CStr;
-
-    #[inline]
-    fn index(&self, index: ops::RangeFrom<usize>) -> &Self::Output {
-        // Delegate bounds checking to slice.
-        // Assign to _ to mute clippy's unnecessary operation warning.
-        let _ = &self.as_bytes()[index.start..];
-        // SAFETY: We just checked the bounds.
-        unsafe { Self::from_bytes_with_nul_unchecked(&self.0[index.start..]) }
-    }
-}
-
-impl Index<ops::RangeFull> for CStr {
-    type Output = CStr;
-
-    #[inline]
-    fn index(&self, _index: ops::RangeFull) -> &Self::Output {
-        self
-    }
-}
-
-mod private {
-    use core::ops;
-
-    // Marker trait for index types that can be forward to `BStr`.
-    pub trait CStrIndex {}
-
-    impl CStrIndex for usize {}
-    impl CStrIndex for ops::Range<usize> {}
-    impl CStrIndex for ops::RangeInclusive<usize> {}
-    impl CStrIndex for ops::RangeToInclusive<usize> {}
-}
-
-impl<Idx> Index<Idx> for CStr
-where
-    Idx: private::CStrIndex,
-    BStr: Index<Idx>,
-{
-    type Output = <BStr as Index<Idx>>::Output;
-
-    #[inline]
-    fn index(&self, index: Idx) -> &Self::Output {
-        &self.as_ref()[index]
-    }
-}
-
 /// Creates a new [`CStr`] from a string literal.
 ///
 /// The string literal should not contain any `NUL` bytes.
@@ -630,25 +405,15 @@ fn test_cstr_to_str_panic() {
         checked_cstr.to_str().unwrap();
     }
 
-    #[test]
-    fn test_cstr_as_str_unchecked() {
-        let good_bytes = b"\xf0\x9f\x90\xA7\0";
-        let checked_cstr = CStr::from_bytes_with_nul(good_bytes).unwrap();
-        // SAFETY: The contents come from a string literal which contains valid UTF-8.
-        let unchecked_str = unsafe { checked_cstr.as_str_unchecked() };
-        assert_eq!(unchecked_str, "🐧");
-    }
-
     #[test]
     fn test_cstr_display() {
-        let hello_world = CStr::from_bytes_with_nul(b"hello, world!\0").unwrap();
-        assert_eq!(format!("{}", hello_world.display()), "hello, world!");
-        let non_printables = CStr::from_bytes_with_nul(b"\x01\x09\x0a\0").unwrap();
-        assert_eq!(format!("{}", non_printables.display()), "\\x01\\x09\\x0a");
-        let non_ascii = CStr::from_bytes_with_nul(b"d\xe9j\xe0 vu\0").unwrap();
-        assert_eq!(format!("{}", non_ascii.display()), "d\\xe9j\\xe0 vu");
-        let good_bytes = CStr::from_bytes_with_nul(b"\xf0\x9f\xa6\x80\0").unwrap();
-        assert_eq!(format!("{}", good_bytes.display()), "\\xf0\\x9f\\xa6\\x80");
+        assert_eq!(format!("{}", c"hello, world!".display()), "hello, world!");
+        assert_eq!(format!("{}", c"\x01\x09\x0a".display()), "\\x01\\x09\\x0a");
+        assert_eq!(format!("{}", c"d\xe9j\xe0 vu".display()), "d\\xe9j\\xe0 vu");
+        assert_eq!(
+            format!("{}", c"\xf0\x9f\xa6\x80".display()),
+            "\\xf0\\x9f\\xa6\\x80"
+        );
     }
 
     #[test]
@@ -664,14 +429,13 @@ fn test_cstr_display_all_bytes() {
 
     #[test]
     fn test_cstr_debug() {
-        let hello_world = CStr::from_bytes_with_nul(b"hello, world!\0").unwrap();
-        assert_eq!(format!("{:?}", hello_world), "\"hello, world!\"");
-        let non_printables = CStr::from_bytes_with_nul(b"\x01\x09\x0a\0").unwrap();
-        assert_eq!(format!("{:?}", non_printables), "\"\\x01\\x09\\x0a\"");
-        let non_ascii = CStr::from_bytes_with_nul(b"d\xe9j\xe0 vu\0").unwrap();
-        assert_eq!(format!("{:?}", non_ascii), "\"d\\xe9j\\xe0 vu\"");
-        let good_bytes = CStr::from_bytes_with_nul(b"\xf0\x9f\xa6\x80\0").unwrap();
-        assert_eq!(format!("{:?}", good_bytes), "\"\\xf0\\x9f\\xa6\\x80\"");
+        assert_eq!(format!("{:?}", c"hello, world!"), "\"hello, world!\"");
+        assert_eq!(format!("{:?}", c"\x01\x09\x0a"), "\"\\x01\\t\\n\"");
+        assert_eq!(format!("{:?}", c"d\xe9j\xe0 vu"), "\"d\\xe9j\\xe0 vu\"");
+        assert_eq!(
+            format!("{:?}", c"\xf0\x9f\xa6\x80"),
+            "\"\\xf0\\x9f\\xa6\\x80\""
+        );
     }
 
     #[test]
@@ -851,14 +615,14 @@ fn write_str(&mut self, s: &str) -> fmt::Result {
 /// # Examples
 ///
 /// ```
-/// use kernel::{str::CString, fmt};
+/// use kernel::{fmt, str::CString};
 ///
 /// let s = CString::try_from_fmt(fmt!("{}{}{}", "abc", 10, 20))?;
-/// assert_eq!(s.as_bytes_with_nul(), "abc1020\0".as_bytes());
+/// assert_eq!(s.to_bytes_with_nul(), "abc1020\0".as_bytes());
 ///
 /// let tmp = "testing";
 /// let s = CString::try_from_fmt(fmt!("{tmp}{}", 123))?;
-/// assert_eq!(s.as_bytes_with_nul(), "testing123\0".as_bytes());
+/// assert_eq!(s.to_bytes_with_nul(), "testing123\0".as_bytes());
 ///
 /// // This fails because it has an embedded `NUL` byte.
 /// let s = CString::try_from_fmt(fmt!("a\0b{}", 123));
@@ -916,9 +680,11 @@ fn deref(&self) -> &Self::Target {
 
 impl DerefMut for CString {
     fn deref_mut(&mut self) -> &mut Self::Target {
-        // SAFETY: A `CString` is always NUL-terminated and contains no other
-        // NUL bytes.
-        unsafe { CStr::from_bytes_with_nul_unchecked_mut(self.buf.as_mut_slice()) }
+        // SAFETY: the cast from `&[u8]` to `&CStr` is safe since `CStr` has the same layout as
+        // `&[u8]` (this is technically not guaranteed, but we rely on it here). The pointer
+        // dereference is safe since it comes from a mutable reference which is guaranteed to be
+        // valid for writes.
+        unsafe { &mut *(self.buf.as_mut_slice() as *mut [u8] as *mut CStr) }
     }
 }
 
@@ -928,7 +694,7 @@ impl<'a> TryFrom<&'a CStr> for CString {
     fn try_from(cstr: &'a CStr) -> Result<CString, AllocError> {
         let mut buf = KVec::new();
 
-        buf.extend_from_slice(cstr.as_bytes_with_nul(), GFP_KERNEL)?;
+        buf.extend_from_slice(cstr.to_bytes_with_nul(), GFP_KERNEL)?;
 
         // INVARIANT: The `CStr` and `CString` types have the same invariants for
         // the string data, and we copied it over without changes.
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 7df565038d7d..7bf3df980433 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -107,7 +107,7 @@ pub fn new(name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self
             // SAFETY: `slot` is valid while the closure is called and both `name` and `key` have
             // static lifetimes so they live indefinitely.
             wait_queue_head <- Opaque::ffi_init(|slot| unsafe {
-                bindings::__init_waitqueue_head(slot, name.as_char_ptr(), key.as_ptr())
+                bindings::__init_waitqueue_head(slot, crate::str::as_char_ptr(name), key.as_ptr())
             }),
         })
     }
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index eb80048e0110..5ad62d718279 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -136,7 +136,7 @@ pub fn new(t: T, name: &'static CStr, key: &'static LockClassKey) -> impl PinIni
             // SAFETY: `slot` is valid while the closure is called and both `name` and `key` have
             // static lifetimes so they live indefinitely.
             state <- Opaque::ffi_init(|slot| unsafe {
-                B::init(slot, name.as_char_ptr(), key.as_ptr())
+                B::init(slot, crate::str::as_char_ptr(name), key.as_ptr())
             }),
         })
     }
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 480ee724e3cc..4c4d60a51c1f 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -69,7 +69,7 @@ pub unsafe fn init(&'static self) {
         unsafe {
             B::Backend::init(
                 self.inner.state.get(),
-                B::NAME.as_char_ptr(),
+                crate::str::as_char_ptr(B::NAME),
                 B::get_lock_class().as_ptr(),
             )
         }
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 0cd100d2aefb..1008dd2635e1 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -382,7 +382,7 @@ pub fn new(name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self
                         slot,
                         Some(T::Pointer::run),
                         false,
-                        name.as_char_ptr(),
+                        crate::str::as_char_ptr(name),
                         key.as_ptr(),
                     )
                 }

-- 
2.48.1

