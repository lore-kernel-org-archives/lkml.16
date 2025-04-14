Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694602797A5;
	Mon, 14 Apr 2025 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644421; cv=none; b=uBMEGxtpC79s6PRKm9cTkAiNU0UteHFzKDjBlBXZFWo39nhlGd2qcEuVtJkvgMVatIU/pz8soFyorSmhTSJTjetsxbqEqfDqXLV+8PT9uaDmPp8upiHP/uTOEXDEjq9ASbxJ8OMErffnUXbm2n+EOJWbFh9hCBcMvohT6U+Z7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644421; c=relaxed/simple;
	bh=/OOniz5y97ufY6GpsnjnVPhCO3eR2pFGm+lUHlJq+/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=roIj6gxyiE7QfJVocoDR3qiwiymdMf0/wAIfbNwEYkKI3fTJwOwhodDJ+TpBgDqBoEhodCSSBLB0W+lIok47Y1CtQ01IE9LU8o3iWIjkOswgLbM6O2lHJ2qQSb0ukIA8oD6FnXNrwbbFzrAW8VhzqKYgtVU16SR00JZHbgRvUHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Zbrk14hh4z9tF2;
	Mon, 14 Apr 2025 17:26:49 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/5] rust: Add bindings for reading device properties
Date: Mon, 14 Apr 2025 17:26:27 +0200
Message-ID: <20250414152630.1691179-3-remo@buenzli.dev>
In-Reply-To: <20250414152630.1691179-1-remo@buenzli.dev>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4Zbrk14hh4z9tF2

The device property API is a firmware agnostic API for reading
properties from firmware (DT/ACPI) devices nodes and swnodes.

While the C API takes a pointer to a caller allocated variable/buffer,
the rust API is designed to return a value and can be used in struct
initialization. Rust generics are also utilized to support different
types of properties where appropriate.

The PropertyGuard is a way to force users to specify whether a property
is supposed to be required or not. This allows us to move error
logging of missing required properties into core, preventing a lot of
boilerplate in drivers.

Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/property.rs | 385 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 383 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/property.rs b/rust/kernel/property.rs
index f6e6c980d..0d4ea3168 100644
--- a/rust/kernel/property.rs
+++ b/rust/kernel/property.rs
@@ -4,9 +4,17 @@
 //!
 //! C header: [`include/linux/property.h`](srctree/include/linux/property.h)
 
-use core::ptr;
+use core::{mem::MaybeUninit, ptr};
 
-use crate::{bindings, device::Device, str::CStr, types::Opaque};
+use crate::{
+    alloc::KVec,
+    bindings, c_str,
+    device::Device,
+    error::{to_result, Result},
+    prelude::*,
+    str::{BStr, CStr, CString},
+    types::Opaque,
+};
 
 impl Device {
     /// Obtain the fwnode corresponding to the device.
@@ -28,6 +36,38 @@ fn fwnode(&self) -> &FwNode {
     pub fn property_present(&self, name: &CStr) -> bool {
         self.fwnode().property_present(name)
     }
+
+    /// Returns firmware property `name` boolean value
+    pub fn property_read_bool(&self, name: &CStr) -> bool {
+        self.fwnode().property_read_bool(name)
+    }
+
+    /// Returns the index of matching string `match_str` for firmware string property `name`
+    pub fn property_match_string(&self, name: &CStr, match_str: &CStr) -> Result<usize> {
+        self.fwnode().property_match_string(name, match_str)
+    }
+
+    /// Returns firmware property `name` integer array values in a KVec
+    pub fn property_read_array_vec<'fwnode, 'name, T: PropertyInt>(
+        &'fwnode self,
+        name: &'name CStr,
+        len: usize,
+    ) -> Result<PropertyGuard<'fwnode, 'name, KVec<T>>> {
+        self.fwnode().property_read_array_vec(name, len)
+    }
+
+    /// Returns integer array length for firmware property `name`
+    pub fn property_count_elem<T: PropertyInt>(&self, name: &CStr) -> Result<usize> {
+        self.fwnode().property_count_elem::<T>(name)
+    }
+
+    /// Returns firmware property `name` integer scalar value
+    pub fn property_read<'fwnode, 'name, T: Property>(
+        &'fwnode self,
+        name: &'name CStr,
+    ) -> PropertyGuard<'fwnode, 'name, T> {
+        self.fwnode().property_read(name)
+    }
 }
 
 /// A reference-counted fwnode_handle.
@@ -59,6 +99,150 @@ pub fn property_present(&self, name: &CStr) -> bool {
         // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
         unsafe { bindings::fwnode_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
     }
+
+    /// Returns firmware property `name` boolean value
+    pub fn property_read_bool(&self, name: &CStr) -> bool {
+        // SAFETY: `name` is non-null and null-terminated. `self.as_raw()` is valid
+        // because `self` is valid.
+        unsafe { bindings::fwnode_property_read_bool(self.as_raw(), name.as_char_ptr()) }
+    }
+
+    /// Returns the index of matching string `match_str` for firmware string property `name`
+    pub fn property_match_string(&self, name: &CStr, match_str: &CStr) -> Result<usize> {
+        // SAFETY: `name` and `match_str` are non-null and null-terminated. `self.as_raw` is
+        // valid because `self` is valid.
+        let ret = unsafe {
+            bindings::fwnode_property_match_string(
+                self.as_raw(),
+                name.as_char_ptr(),
+                match_str.as_char_ptr(),
+            )
+        };
+        to_result(ret)?;
+        Ok(ret as usize)
+    }
+
+    /// Returns firmware property `name` integer array values in a KVec
+    pub fn property_read_array_vec<'fwnode, 'name, T: PropertyInt>(
+        &'fwnode self,
+        name: &'name CStr,
+        len: usize,
+    ) -> Result<PropertyGuard<'fwnode, 'name, KVec<T>>> {
+        let mut val: KVec<T> = KVec::with_capacity(len, GFP_KERNEL)?;
+
+        // SAFETY: `val.as_mut_ptr()` is valid because `KVec::with_capacity`
+        // didn't return an error and it has at least space for `len` number
+        // of elements.
+        let err = unsafe { read_array_out_param::<T>(self, name, val.as_mut_ptr(), len) };
+        let res = if err < 0 {
+            Err(Error::from_errno(err))
+        } else {
+            // SAFETY: fwnode_property_read_int_array() writes exactly `len` entries on success
+            unsafe { val.set_len(len) }
+            Ok(val)
+        };
+        Ok(PropertyGuard {
+            inner: res,
+            fwnode: self,
+            name,
+        })
+    }
+
+    /// Returns integer array length for firmware property `name`
+    pub fn property_count_elem<T: PropertyInt>(&self, name: &CStr) -> Result<usize> {
+        // SAFETY: `out_param` is allowed to be null because `len` is zero.
+        let ret = unsafe { read_array_out_param::<T>(self, name, ptr::null_mut(), 0) };
+        to_result(ret)?;
+        Ok(ret as usize)
+    }
+
+    /// Returns the value of firmware property `name`.
+    ///
+    /// This method is generic over the type of value to read. Informally,
+    /// the types that can be read are booleans, strings, unsigned integers and
+    /// arrays of unsigned integers.
+    ///
+    /// Reading a `KVec` of integers is done with the separate
+    /// method [`Self::property_read_array_vec`], because it takes an
+    /// additional `len` argument.
+    ///
+    /// When reading a boolean, this method never fails. A missing property
+    /// is interpreted as `false`, whereas a present property is interpreted
+    /// as `true`.
+    ///
+    /// For more precise documentation about what types can be read, see
+    /// the [implementors of Property][Property#implementors] and [its
+    /// implementations on foreign types][Property#foreign-impls].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use crate::{device::Device, types::CString};
+    /// fn examples(dev: &Device) -> Result {
+    ///     let fwnode = dev.fwnode();
+    ///     let b: bool = fwnode.property_read("some-bool").required()?;
+    ///     if let Some(s) = fwnode.property_read::<CString>("some-str").optional() {
+    ///         // ...
+    ///     }
+    /// }
+    /// ```
+    pub fn property_read<'fwnode, 'name, T: Property>(
+        &'fwnode self,
+        name: &'name CStr,
+    ) -> PropertyGuard<'fwnode, 'name, T> {
+        PropertyGuard {
+            inner: T::read(self, name),
+            fwnode: self,
+            name,
+        }
+    }
+
+    /// helper used to display name or path of a fwnode
+    ///
+    /// # Safety
+    ///
+    /// Callers must provide a valid format string for a fwnode.
+    unsafe fn fmt(&self, f: &mut core::fmt::Formatter<'_>, fmt_str: &CStr) -> core::fmt::Result {
+        let mut buf = [0; 256];
+        // SAFETY: `buf` is valid and `buf.len()` is its length. `self.as_raw()` is
+        // valid because `self` is valid.
+        let written = unsafe {
+            bindings::scnprintf(buf.as_mut_ptr(), buf.len(), fmt_str.as_ptr(), self.as_raw())
+        };
+        // SAFETY: `written` is smaller or equal to `buf.len()`.
+        let b: &[u8] = unsafe { core::slice::from_raw_parts(buf.as_ptr(), written as usize) };
+        write!(f, "{}", BStr::from_bytes(b))
+    }
+
+    /// Returns an object that implements [`Display`](core::fmt::Display) for
+    /// printing the name of a node.
+    pub fn display_name(&self) -> impl core::fmt::Display + use<'_> {
+        struct FwNodeDisplayName<'a>(&'a FwNode);
+
+        impl core::fmt::Display for FwNodeDisplayName<'_> {
+            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+                // SAFETY: "%pfwP" is a valid format string for fwnode
+                unsafe { self.0.fmt(f, c_str!("%pfwP")) }
+            }
+        }
+
+        FwNodeDisplayName(self)
+    }
+
+    /// Returns an object that implements [`Display`](core::fmt::Display) for
+    /// printing the full path of a node.
+    pub fn display_path(&self) -> impl core::fmt::Display + use<'_> {
+        struct FwNodeDisplayPath<'a>(&'a FwNode);
+
+        impl core::fmt::Display for FwNodeDisplayPath<'_> {
+            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+                // SAFETY: "%pfwf" is a valid format string for fwnode
+                unsafe { self.0.fmt(f, c_str!("%pfwf")) }
+            }
+        }
+
+        FwNodeDisplayPath(self)
+    }
 }
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
@@ -73,3 +257,200 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
         unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
     }
 }
+
+/// Implemented for several types that can be read as properties.
+///
+/// Informally, this is implemented for strings, integers and arrays of
+/// integers. It's used to make [`FwNode::property_read`] generic over the
+/// type of property being read. There are also two dedicated methods to read
+/// other types, because they require more specialized function signatures:
+/// - [`property_read_bool`](Device::property_read_bool)
+/// - [`property_read_array_vec`](Device::property_read_array_vec)
+pub trait Property: Sized {
+    /// Used to make [`FwNode::property_read`] generic.
+    fn read(fwnode: &FwNode, name: &CStr) -> Result<Self>;
+}
+
+impl Property for CString {
+    fn read(fwnode: &FwNode, name: &CStr) -> Result<Self> {
+        let mut str: *mut u8 = ptr::null_mut();
+        let pstr: *mut _ = &mut str;
+
+        // SAFETY: `name` is non-null and null-terminated. `fwnode.as_raw` is
+        // valid because `fwnode` is valid.
+        let ret = unsafe {
+            bindings::fwnode_property_read_string(fwnode.as_raw(), name.as_char_ptr(), pstr.cast())
+        };
+        to_result(ret)?;
+
+        // SAFETY: `pstr` contains a non-null ptr on success
+        let str = unsafe { CStr::from_char_ptr(*pstr) };
+        Ok(str.try_into()?)
+    }
+}
+/// Implemented for all integers that can be read as properties.
+///
+/// This helper trait is needed on top of the existing [`Property`]
+/// trait to associate the integer types of various sizes with their
+/// corresponding `fwnode_property_read_*_array` functions.
+pub trait PropertyInt: Copy {
+    /// # Safety
+    ///
+    /// Callers must uphold the same safety invariants as for the various
+    /// `fwnode_property_read_*_array` functions.
+    unsafe fn read_array(
+        fwnode: *const bindings::fwnode_handle,
+        propname: *const ffi::c_char,
+        val: *mut Self,
+        nval: usize,
+    ) -> ffi::c_int;
+}
+// This macro generates implementations of the traits `Property` and
+// `PropertyInt` for integers of various sizes. Its input is a list
+// of pairs separated by commas. The first element of the pair is the
+// type of the integer, the second one is the name of its corresponding
+// `fwnode_property_read_*_array` function.
+macro_rules! impl_property_for_int {
+    ($($int:ty: $f:ident),* $(,)?) => { $(
+        impl PropertyInt for $int {
+            unsafe fn read_array(
+                fwnode: *const bindings::fwnode_handle,
+                propname: *const ffi::c_char,
+                val: *mut Self,
+                nval: usize,
+            ) -> ffi::c_int {
+                // SAFETY: The safety invariants on the trait require
+                // callers to uphold the invariants of the functions
+                // this macro is called with.
+                unsafe {
+                    bindings::$f(fwnode, propname, val.cast(), nval)
+                }
+            }
+        }
+    )* };
+}
+impl_property_for_int! {
+    u8: fwnode_property_read_u8_array,
+    u16: fwnode_property_read_u16_array,
+    u32: fwnode_property_read_u32_array,
+    u64: fwnode_property_read_u64_array,
+    i8: fwnode_property_read_u8_array,
+    i16: fwnode_property_read_u16_array,
+    i32: fwnode_property_read_u32_array,
+    i64: fwnode_property_read_u64_array,
+}
+/// # Safety
+///
+/// Callers must ensure that if `len` is non-zero, `out_param` must be
+/// valid and point to memory that has enough space to hold at least
+/// `len` number of elements.
+unsafe fn read_array_out_param<T: PropertyInt>(
+    fwnode: &FwNode,
+    name: &CStr,
+    out_param: *mut T,
+    len: usize,
+) -> ffi::c_int {
+    // SAFETY: `name` is non-null and null-terminated.
+    // `fwnode.as_raw` is valid because `fwnode` is valid.
+    // `out_param` is valid and has enough space for at least
+    // `len` number of elements as per the safety requirement.
+    unsafe { T::read_array(fwnode.as_raw(), name.as_char_ptr(), out_param, len) }
+}
+impl<T: PropertyInt, const N: usize> Property for [T; N] {
+    fn read(fwnode: &FwNode, name: &CStr) -> Result<Self> {
+        let mut val: [MaybeUninit<T>; N] = [const { MaybeUninit::uninit() }; N];
+
+        // SAFETY: `val.as_mut_ptr()` is valid and points to enough space for
+        // `N` elements. Casting from `*mut MaybeUninit<T>` to `*mut T` is safe
+        // because `MaybeUninit<T>` has the same memory layout as `T`.
+        let ret = unsafe { read_array_out_param::<T>(fwnode, name, val.as_mut_ptr().cast(), N) };
+        to_result(ret)?;
+
+        // SAFETY: `val` is always initialized when
+        // fwnode_property_read_<T>_array is successful.
+        Ok(val.map(|v| unsafe { v.assume_init() }))
+    }
+}
+impl<T: PropertyInt> Property for T {
+    fn read(fwnode: &FwNode, name: &CStr) -> Result<Self> {
+        let val: [_; 1] = <[T; 1] as Property>::read(fwnode, name)?;
+        Ok(val[0])
+    }
+}
+
+/// A helper for reading device properties.
+///
+/// Use [`Self::required`] if a missing property is considered a bug and
+/// [`Self::optional`] otherwise.
+///
+/// For convenience, [`Self::or`] and [`Self::or_default`] are provided.
+pub struct PropertyGuard<'fwnode, 'name, T> {
+    /// The result of reading the property.
+    inner: Result<T>,
+    /// The fwnode of the property, used for logging in the "required" case.
+    fwnode: &'fwnode FwNode,
+    /// The name of the property, used for logging in the "required" case.
+    name: &'name CStr,
+}
+
+impl<T> PropertyGuard<'_, '_, T> {
+    /// Access the property, indicating it is required.
+    ///
+    /// If the property is not present, the error is automatically logged. If a
+    /// missing property is not an error, use [`Self::optional`] instead.
+    pub fn required(self) -> Result<T> {
+        if self.inner.is_err() {
+            // Get the device associated with the fwnode for device-associated
+            // logging.
+            // TODO: Are we allowed to do this? The field `fwnode_handle.dev`
+            // has a somewhat vague comment, which could mean we're not
+            // supposed to access it:
+            // https://elixir.bootlin.com/linux/v6.13.6/source/include/linux/fwnode.h#L51
+            // SAFETY: According to the invariant of FwNode, it is valid.
+            let dev = unsafe { (*self.fwnode.as_raw()).dev };
+
+            if dev.is_null() {
+                pr_err!(
+                    "{}: property '{}' is missing\n",
+                    self.fwnode.display_path(),
+                    self.name
+                );
+            } else {
+                // SAFETY: If dev is not null, it points to a valid device.
+                let dev: &Device = unsafe { &*dev.cast() };
+                dev_err!(
+                    dev,
+                    "{}: property '{}' is missing\n",
+                    self.fwnode.display_path(),
+                    self.name
+                );
+            };
+        }
+        self.inner
+    }
+
+    /// Access the property, indicating it is optional.
+    ///
+    /// In contrast to [`Self::required`], no error message is logged if
+    /// the property is not present.
+    pub fn optional(self) -> Option<T> {
+        self.inner.ok()
+    }
+
+    /// Access the property or the specified default value.
+    ///
+    /// Do not pass a sentinel value as default to detect a missing property.
+    /// Use [`Self::required`] or [`Self::optional`] instead.
+    pub fn or(self, default: T) -> T {
+        self.inner.unwrap_or(default)
+    }
+}
+
+impl<T: Default> PropertyGuard<'_, '_, T> {
+    /// Access the property or a default value.
+    ///
+    /// Use [`Self::or`] to specify a custom default value.
+    pub fn or_default(self) -> T {
+        self.inner.unwrap_or_default()
+    }
+}
-- 
2.49.0

