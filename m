Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D11D88BF;
	Sun,  2 Feb 2025 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498862; cv=none; b=H0c2U00FSsiM4LPPAT7/nmQtENPLiT0b9dH/MAb8j4yVo100RtTgxe/kbV3MlUgLl5iYZFe2UnNd00PWVlTPFz3x4woCC+YClAG1+8neyiGYGgeWT9gLZ1upHmQA0Cc19zdJcr81xDqdzbPxJbjpXwKDBEF/SsEHPLmtPHMuLto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498862; c=relaxed/simple;
	bh=PhHQItICWXuIg6fvhEnV1tl4/7GZ7OAQhLK8n00WFLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFfl7QALyXndHLr8vnUd7nOqXslM5rSFxigQvT7fzidH5oCNYawKIGO4u2In9EnxH6M608USpic/DH9Pd8UJerA0NKueUJ5sAASt2NNgCmSp1IqBMhrmtU1xGrhhnv1JOh4Anc2vlJb+C+Rd4kXfn1jye/lD1weGFMBzduzkspA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/DEwvdm; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/DEwvdm"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4679eacf2c5so31979231cf.0;
        Sun, 02 Feb 2025 04:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738498859; x=1739103659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iDAJXMmYM90FFecEvdtPN6EQd1bt2bRs+UInsqj0Fg=;
        b=i/DEwvdmWZYdJ7Ppht/HeAewSKGxxJAkB9rpa9za4Staun94iEr2OL+QV4jiPKjzvR
         LJzVp/uis79z6LWZEXFmUAqJ8zw2rGuU2kzvyM7HfMF2EoC96QPqMuPtd4+NDZZybS2N
         jmk7UwyQDcHwwgWivFK0NV9vFPDE8Is3JIWgmbJi+rfjxgj+878JgxT9vY4+nAiP9Fi4
         NqrareGa5qUlsH3u29vuPbBtXWyXJrFVX/Qzdz7d0xcpj1a0gS+4KjLtUBzFTY+Ru0tN
         2tHbDln80/vgSZeDD22FELDIjnryk5u4H7QWf7tnLTrFxdf0cmhe+py4BlQqupzw7ixM
         hE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498859; x=1739103659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iDAJXMmYM90FFecEvdtPN6EQd1bt2bRs+UInsqj0Fg=;
        b=V9gwKzGZbrXiXnmtXjNSHnASM1bWDkITKNYX1tBLwbVWLyUgcv3EXEJbJSyBoPLXml
         Zr+++OLva7u7B6m/iU/zEP75SyDfnVicf/wkL2RjGx81EPr+/xRugwdkYvSBLd1lYOQn
         Kvne3ybyqAehqSCyN0Ymitc3ecvTXm5ATJvLPJX9ZAlCPNuJWMBqvk8qmHjpFa4reigi
         /1cUagYdXFgnRrVfHQ9U54HE9A5OXKHqkTok+pJpDus72l5lT9L2y7FOSS6A9WPyjm30
         /fzV16+weg2vuUWcGExJm6Ss67KQIeJ35v7XNOf0JzD82+p7ADPlnHknlrpTA0bWfQ+w
         ovVg==
X-Forwarded-Encrypted: i=1; AJvYcCX2XvAE9KvX6CTCSQ+Imw43TPfT3zWOeWtiA2UYAX7fiH83IycQXGyaxshUBB9LYQtzV1nDulEj2GzlySQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ8gA5ul60aCfLqzHMR27WK/OX43tkNiTOG9SoNVjs0FchRGGj
	bpz/QhmHkcQTRMXtB+jVpqUUN/BqYpGjImSRWAZ7n/bRQ3JgTMpC
X-Gm-Gg: ASbGncs/1fBQmbLzJbH0+HUSMFsIM3YOMC0kVa+6GwNmVknc6kuSm9EjSqy54WAYlgb
	q5u5pGvDcW+/OdIi8Q5l1Zxgnw5n3uQDKt5FGdz4sHFAcRqJnIFAs9fPEjIUTyCE/Co/LDOAIUJ
	DsySf3t/+q4fka1Wp/BKYaZEj7TP5KlqXOiyBTlcWQ2VeHCiP+NOKKkQnX4Lem80gfCwB1rjP01
	amoJu/tkfS1Ta2x2IAvrN5+En9qNyCPO35EL3v5BUgVRdXEccs3Dr4sQznxdRBuna9vq49i/t42
	dIe2csCAGbQj3XVafF7LfgI06CiZrXotw2woSZ4=
X-Google-Smtp-Source: AGHT+IHnHG8Ymcs6mI05GBRBFrUZzgR9jwY5CS/PiRTnYH7tklfS4ZgIW9SwUKIcH9OXrjbOnuIlmQ==
X-Received: by 2002:ac8:58cb:0:b0:467:622d:896c with SMTP id d75a77b69052e-46fd0bbdb19mr269344111cf.46.1738498858538;
        Sun, 02 Feb 2025 04:20:58 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf1728efsm37700331cf.62.2025.02.02.04.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:20:57 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 02 Feb 2025 07:20:47 -0500
Subject: [PATCH v6 2/4] rust: replace `CStr` with `core::ffi::CStr`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250202-cstr-core-v6-2-8469cd6d29fd@gmail.com>
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
 rust/kernel/device.rs           |   5 +-
 rust/kernel/error.rs            |   4 +-
 rust/kernel/firmware.rs         |   2 +-
 rust/kernel/kunit.rs            |   4 +-
 rust/kernel/miscdevice.rs       |   2 +-
 rust/kernel/net/phy.rs          |   2 +-
 rust/kernel/prelude.rs          |   5 +-
 rust/kernel/seq_file.rs         |   4 +-
 rust/kernel/str.rs              | 449 ++++++----------------------------------
 rust/kernel/sync/condvar.rs     |   2 +-
 rust/kernel/sync/lock.rs        |   2 +-
 rust/kernel/sync/lock/global.rs |   2 +-
 rust/kernel/workqueue.rs        |   2 +-
 14 files changed, 88 insertions(+), 399 deletions(-)

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
index d5e6a19ff6b7..f97c409aaba9 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -10,9 +10,6 @@
 };
 use core::{fmt, ptr};
 
-#[cfg(CONFIG_PRINTK)]
-use crate::c_str;
-
 /// A reference-counted device.
 ///
 /// This structure represents the Rust abstraction for a C `struct device`. This implementation
@@ -175,7 +172,7 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             bindings::_dev_printk(
                 klevel as *const _ as *const crate::ffi::c_char,
                 self.as_raw(),
-                c_str!("%pA").as_char_ptr(),
+                crate::str::as_char_ptr(c"%pA"),
                 &msg as *const _ as *const crate::ffi::c_void,
             )
         };
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
index b3a6cc50b240..2dd20e981e9b 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -31,7 +31,7 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
         // SAFETY: All zeros is valid for this C type.
         let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
         result.minor = bindings::MISC_DYNAMIC_MINOR as _;
-        result.name = self.name.as_char_ptr();
+        result.name = crate::str::as_char_ptr(self.name);
         result.fops = create_vtable::<T>();
         result
     }
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index d7da29f95e43..9e410de3c3a3 100644
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
index 53450c956a6a..2b63cfaaa981 100644
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
@@ -119,11 +119,11 @@ impl fmt::Debug for BStr {
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
@@ -176,254 +176,10 @@ macro_rules! b_str {
     }};
 }
 
-/// Possible errors when using conversion functions in [`CStr`].
-#[derive(Debug, Clone, Copy)]
-pub enum CStrConvertError {
-    /// Supplied bytes contain an interior `NUL`.
-    InteriorNul,
-
-    /// Supplied bytes are not terminated by `NUL`.
-    NotNulTerminated,
-}
-
-impl From<CStrConvertError> for Error {
-    #[inline]
-    fn from(_: CStrConvertError) -> Error {
-        EINVAL
-    }
-}
-
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
-    /// Converts this [`CStr`] to its ASCII lower case equivalent in-place.
-    ///
-    /// ASCII letters 'A' to 'Z' are mapped to 'a' to 'z',
-    /// but non-ASCII letters are unchanged.
-    ///
-    /// To return a new lowercased value without modifying the existing one, use
-    /// [`to_ascii_lowercase()`].
-    ///
-    /// [`to_ascii_lowercase()`]: #method.to_ascii_lowercase
-    pub fn make_ascii_lowercase(&mut self) {
-        // INVARIANT: This doesn't introduce or remove NUL bytes in the C
-        // string.
-        self.0.make_ascii_lowercase();
-    }
-
-    /// Converts this [`CStr`] to its ASCII upper case equivalent in-place.
-    ///
-    /// ASCII letters 'a' to 'z' are mapped to 'A' to 'Z',
-    /// but non-ASCII letters are unchanged.
-    ///
-    /// To return a new uppercased value without modifying the existing one, use
-    /// [`to_ascii_uppercase()`].
-    ///
-    /// [`to_ascii_uppercase()`]: #method.to_ascii_uppercase
-    pub fn make_ascii_uppercase(&mut self) {
-        // INVARIANT: This doesn't introduce or remove NUL bytes in the C
-        // string.
-        self.0.make_ascii_uppercase();
-    }
-
-    /// Returns a copy of this [`CString`] where each character is mapped to its
-    /// ASCII lower case equivalent.
-    ///
-    /// ASCII letters 'A' to 'Z' are mapped to 'a' to 'z',
-    /// but non-ASCII letters are unchanged.
-    ///
-    /// To lowercase the value in-place, use [`make_ascii_lowercase`].
-    ///
-    /// [`make_ascii_lowercase`]: str::make_ascii_lowercase
-    pub fn to_ascii_lowercase(&self) -> Result<CString, AllocError> {
-        let mut s = self.to_cstring()?;
-
-        s.make_ascii_lowercase();
-
-        Ok(s)
-    }
-
-    /// Returns a copy of this [`CString`] where each character is mapped to its
-    /// ASCII upper case equivalent.
-    ///
-    /// ASCII letters 'a' to 'z' are mapped to 'A' to 'Z',
-    /// but non-ASCII letters are unchanged.
-    ///
-    /// To uppercase the value in-place, use [`make_ascii_uppercase`].
-    ///
-    /// [`make_ascii_uppercase`]: str::make_ascii_uppercase
-    pub fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
-        let mut s = self.to_cstring()?;
-
-        s.make_ascii_uppercase();
-
-        Ok(s)
-    }
+pub use core::ffi::CStr;
 
+/// Extensions to [`CStr`].
+pub trait CStrExt {
     /// Returns an object that implements [`Display`] for safely printing a [`CStr`] that may
     /// contain non-Unicode data. If you would like an implementation which escapes the [`CStr`]
     /// please use [`Debug`] instead.
@@ -439,114 +195,59 @@ pub fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
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
+impl CStrExt for CStr {
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
+/// Wraps a raw C string with a safe C string wrapper.
+///
+/// # Safety
+///
+/// * The memory pointed to by `ptr` must contain a valid nul terminator at the end of the string.
+///
+/// * `ptr` must be [valid] for reads of bytes up to and including the nul terminator. This means in
+///   particular:
+///
+///     * The entire memory range of this `CStr` must be contained within a single allocated object!
+///     * `ptr` must be non-null even for a zero-length cstr.
+///
+/// * The memory referenced by the returned `CStr` must not be mutated for the duration of lifetime
+///   `'a`.
+///
+/// * The nul terminator must be within `isize::MAX` from `ptr`
+// This function exists to paper over the fact that `CStr::from_ptr` takes a `*const
+// core::ffi::c_char` rather than a `*const crate::ffi::c_char`.
+#[inline]
+pub unsafe fn from_char_ptr<'a>(ptr: *const crate::ffi::c_char) -> &'a CStr {
+    // SAFETY: The safety preconditions are the same as for `from_ptr`.
+    unsafe { CStr::from_ptr(ptr.cast()) }
 }
 
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
 
 /// Creates a new [`CStr`] from a string literal.
@@ -629,25 +330,15 @@ fn test_cstr_to_str_panic() {
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
@@ -663,14 +354,13 @@ fn test_cstr_display_all_bytes() {
 
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
@@ -850,14 +540,14 @@ fn write_str(&mut self, s: &str) -> fmt::Result {
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
@@ -915,9 +605,8 @@ fn deref(&self) -> &Self::Target {
 
 impl DerefMut for CString {
     fn deref_mut(&mut self) -> &mut Self::Target {
-        // SAFETY: A `CString` is always NUL-terminated and contains no other
-        // NUL bytes.
-        unsafe { CStr::from_bytes_with_nul_unchecked_mut(self.buf.as_mut_slice()) }
+        // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
+        unsafe { &mut *(self.buf.as_mut_slice() as *mut [u8] as *mut CStr) }
     }
 }
 
@@ -927,7 +616,7 @@ impl<'a> TryFrom<&'a CStr> for CString {
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
index 41dcddac69e2..16bf3014f068 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -128,7 +128,7 @@ pub fn new(t: T, name: &'static CStr, key: &'static LockClassKey) -> impl PinIni
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
index 1dcd53478edd..284b9a739c01 100644
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

