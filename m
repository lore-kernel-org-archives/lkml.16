Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EC2279789;
	Fri, 30 May 2025 19:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633384; cv=none; b=IovqwxeD16WPGOdyjapQgqIEp83PZmOQyajHBS0rFP2+YWI3m5SEFicEWzgxo5ZZvY8OOBqxkBDKO2v5xKqbrs1RHFS6rbQNYUdfyAJoHh42hXKzHuy/9rtESHyNXvDSkTXrJ9mRTTnFX1BGp6HR0jVYQiCYvX2sJ+IsX0YKlHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633384; c=relaxed/simple;
	bh=YVjl8ssW1FYgWnOqWFRY+JUR2XVcWqfEcIUf39K642k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPNH0OqM/opY8svc7WQoNOqGWF7awJcF4ICkhclJEmLzQszppxrMhlOOPLD4MPwRZSMq+JR3xlYccvEw8ENr6DFsFiI1hrfytfQqWQMLTIO3iz+X+Waqszlqt6HgJ5ZcWS2sxd0f8Ix/HX0PzYJlIW3TyAjVgZlQKyX6bkEKwhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4b8Cwy57zpz9tj8;
	Fri, 30 May 2025 21:29:38 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v7 6/9] rust: device: Implement accessors for firmware properties
Date: Fri, 30 May 2025 21:28:53 +0200
Message-ID: <20250530192856.1177011-7-remo@buenzli.dev>
In-Reply-To: <20250530192856.1177011-1-remo@buenzli.dev>
References: <20250530192856.1177011-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add methods to FwNode for reading several firmware property types like
strings, integers and arrays.

Most types are read with the generic `property_read` method. There are
two exceptions:

* `property_read_bool` cannot fail, so the fallible function signature
  of `property_read` would not make sense for reading booleans.

* `property_read_array_vec` can fail because of a dynamic memory
  allocation. This error must be handled separately, leading to a
  different function signature than `property_read`.

The traits `Property` and `PropertyInt` drive the generic behavior
of `property_read`. `PropertyInt` is necessary to associate
specific integer types with the C functions to read them. While
there is a C function to read integers of generic sizes called
`fwnode_property_read_int_array`, it was preferred not to make this
public.

Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/property.rs | 255 ++++++++++++++++++++++++++++++++-
 1 file changed, 253 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index b789fbbd0e6cc..46884c433606a 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -4,11 +4,15 @@
 //!
 //! C header: [`include/linux/property.h`](srctree/include/linux/property.h)
 
-use core::ptr;
+use core::{mem::MaybeUninit, ptr};
 
 use crate::{
+    alloc::KVec,
     bindings,
-    str::CStr,
+    error::{to_result, Result},
+    prelude::*,
+    private::Sealed,
+    str::{CStr, CString},
     types::{ARef, Either, Opaque},
 };
 
@@ -139,6 +143,104 @@ pub fn property_present(&self, name: &CStr) -> bool {
         // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
         unsafe { bindings::fwnode_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
     }
+
+    /// Returns firmware property `name` boolean value.
+    pub fn property_read_bool(&self, name: &CStr) -> bool {
+        // SAFETY:
+        // - `name` is non-null and null-terminated.
+        // - `self.as_raw()` is valid because `self` is valid.
+        unsafe { bindings::fwnode_property_read_bool(self.as_raw(), name.as_char_ptr()) }
+    }
+
+    /// Returns the index of matching string `match_str` for firmware string
+    /// property `name`.
+    pub fn property_match_string(&self, name: &CStr, match_str: &CStr) -> Result<usize> {
+        // SAFETY:
+        // - `name` and `match_str` are non-null and null-terminated.
+        // - `self.as_raw` is valid because `self` is valid.
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
+    /// Returns firmware property `name` integer array values in a [`KVec`].
+    pub fn property_read_array_vec<'fwnode, 'name, T: PropertyInt>(
+        &'fwnode self,
+        name: &'name CStr,
+        len: usize,
+    ) -> Result<PropertyGuard<'fwnode, 'name, KVec<T>>> {
+        let mut val: KVec<T> = KVec::with_capacity(len, GFP_KERNEL)?;
+
+        let res = T::read_array_from_fwnode_property(self, name, val.spare_capacity_mut());
+        let res = match res {
+            Ok(_) => {
+                // SAFETY:
+                // - `len` is equal to `val.capacity - val.len`, because
+                //   `val.capacity` is `len` and `val.len` is zero.
+                // - All elements within the interval [`0`, `len`) were initialized
+                //   by `read_array_from_fwnode_property`.
+                unsafe { val.inc_len(len) }
+                Ok(val)
+            }
+            Err(e) => Err(e),
+        };
+        Ok(PropertyGuard {
+            inner: res,
+            fwnode: self,
+            name,
+        })
+    }
+
+    /// Returns integer array length for firmware property `name`.
+    pub fn property_count_elem<T: PropertyInt>(&self, name: &CStr) -> Result<usize> {
+        T::read_array_len_from_fwnode_property(self, name)
+    }
+
+    /// Returns the value of firmware property `name`.
+    ///
+    /// This method is generic over the type of value to read. The types that
+    /// can be read are strings, integers and arrays of integers.
+    ///
+    /// Reading a [`KVec`] of integers is done with the separate
+    /// method [`Self::property_read_array_vec`], because it takes an
+    /// additional `len` argument.
+    ///
+    /// Reading a boolean is done with the separate method
+    /// [`Self::property_read_bool`], because this operation is infallible.
+    ///
+    /// For more precise documentation about what types can be read, see
+    /// the [implementors of Property][Property#implementors] and [its
+    /// implementations on foreign types][Property#foreign-impls].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{c_str, device::{Device, property::FwNode}, str::CString};
+    /// fn examples(dev: &Device) -> Result {
+    ///     let fwnode = dev.fwnode().ok_or(ENOENT)?;
+    ///     let b: u32 = fwnode.property_read(c_str!("some-number")).required_by(dev)?;
+    ///     if let Some(s) = fwnode.property_read::<CString>(c_str!("some-str")).optional() {
+    ///         // ...
+    ///     }
+    ///     Ok(())
+    /// }
+    /// ```
+    pub fn property_read<'fwnode, 'name, T: Property>(
+        &'fwnode self,
+        name: &'name CStr,
+    ) -> PropertyGuard<'fwnode, 'name, T> {
+        PropertyGuard {
+            inner: T::read_from_fwnode_property(self, name),
+            fwnode: self,
+            name,
+        }
+    }
 }
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
@@ -156,6 +258,155 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
     }
 }
 
+/// Implemented for types that can be read as properties.
+///
+/// This is implemented for strings, integers and arrays of integers. It's used
+/// to make [`FwNode::property_read`] generic over the type of property being
+/// read. There are also two dedicated methods to read other types, because they
+/// require more specialized function signatures:
+/// - [`property_read_bool`](FwNode::property_read_bool)
+/// - [`property_read_array_vec`](FwNode::property_read_array_vec)
+///
+/// It must be public, because it appears in the signatures of other public
+/// functions, but its methods shouldn't be used outside the kernel crate.
+pub trait Property: Sized + Sealed {
+    /// Used to make [`FwNode::property_read`] generic.
+    fn read_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<Self>;
+}
+
+impl Sealed for CString {}
+
+impl Property for CString {
+    fn read_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<Self> {
+        let mut str: *mut u8 = ptr::null_mut();
+        let pstr: *mut _ = &mut str;
+
+        // SAFETY:
+        // - `name` is non-null and null-terminated.
+        // - `fwnode.as_raw` is valid because `fwnode` is valid.
+        let ret = unsafe {
+            bindings::fwnode_property_read_string(fwnode.as_raw(), name.as_char_ptr(), pstr.cast())
+        };
+        to_result(ret)?;
+
+        // SAFETY:
+        // - `pstr` is a valid pointer to a NUL-terminated C string.
+        // - It is valid for at least as long as `fwnode`, but it's only used
+        //   within the current function.
+        // - The memory it points to is not mutated during that time.
+        let str = unsafe { CStr::from_char_ptr(*pstr) };
+        Ok(str.try_into()?)
+    }
+}
+
+/// Implemented for all integers that can be read as properties.
+///
+/// This helper trait is needed on top of the existing [`Property`]
+/// trait to associate the integer types of various sizes with their
+/// corresponding `fwnode_property_read_*_array` functions.
+///
+/// It must be public, because it appears in the signatures of other public
+/// functions, but its methods shouldn't be used outside the kernel crate.
+pub trait PropertyInt: Copy + Sealed {
+    /// Reads a property array.
+    fn read_array_from_fwnode_property<'a>(
+        fwnode: &FwNode,
+        name: &CStr,
+        out: &'a mut [MaybeUninit<Self>],
+    ) -> Result<&'a mut [Self]>;
+
+    /// Reads the length of a property array.
+    fn read_array_len_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<usize>;
+}
+// This macro generates implementations of the traits `Property` and
+// `PropertyInt` for integers of various sizes. Its input is a list
+// of pairs separated by commas. The first element of the pair is the
+// type of the integer, the second one is the name of its corresponding
+// `fwnode_property_read_*_array` function.
+macro_rules! impl_property_for_int {
+    ($($int:ty: $f:ident),* $(,)?) => { $(
+        impl Sealed for $int {}
+        impl<const N: usize> Sealed for [$int; N] {}
+
+        impl PropertyInt for $int {
+            fn read_array_from_fwnode_property<'a>(
+                fwnode: &FwNode,
+                name: &CStr,
+                out: &'a mut [MaybeUninit<Self>],
+            ) -> Result<&'a mut [Self]> {
+                // SAFETY:
+                // - `fwnode`, `name` and `out` are all valid by their type
+                //   invariants.
+                // - `out.len()` is a valid bound for the memory pointed to by
+                //   `out.as_mut_ptr()`.
+                // CAST: It's ok to cast from `*mut MaybeUninit<$int>` to a
+                // `*mut $int` because they have the same memory layout.
+                let ret = unsafe {
+                    bindings::$f(
+                        fwnode.as_raw(),
+                        name.as_char_ptr(),
+                        out.as_mut_ptr().cast(),
+                        out.len(),
+                    )
+                };
+                to_result(ret)?;
+                // SAFETY: Transmuting from `&'a mut [MaybeUninit<Self>]` to
+                // `&'a mut [Self]` is sound, because the previous call to a
+                // `fwnode_property_read_*_array` function (which didn't fail)
+                // fully initialized the slice.
+                Ok(unsafe { core::mem::transmute(out) })
+            }
+
+            fn read_array_len_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<usize> {
+                // SAFETY:
+                // - `fwnode` and `name` are valid by their type invariants.
+                // - It's ok to pass a null pointer to the
+                //   `fwnode_property_read_*_array` functions if `nval` is zero.
+                //   This will return the length of the array.
+                let ret = unsafe {
+                    bindings::$f(
+                        fwnode.as_raw(),
+                        name.as_char_ptr(),
+                        ptr::null_mut(),
+                        0,
+                    )
+                };
+                to_result(ret)?;
+                Ok(ret as usize)
+            }
+        }
+
+        impl Property for $int {
+            fn read_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<Self> {
+                let val: [_; 1] = <[$int; 1]>::read_from_fwnode_property(fwnode, name)?;
+                Ok(val[0])
+            }
+        }
+
+        impl<const N: usize> Property for [$int; N] {
+            fn read_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<Self> {
+                let mut val: [MaybeUninit<$int>; N] = [const { MaybeUninit::uninit() }; N];
+
+                <$int>::read_array_from_fwnode_property(fwnode, name, &mut val)?;
+
+                // SAFETY: `val` is always initialized when
+                // `fwnode_property_read_*_array` is successful.
+                Ok(val.map(|v| unsafe { v.assume_init() }))
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
+
 /// A helper for reading device properties.
 ///
 /// Use [`Self::required_by`] if a missing property is considered a bug and
-- 
2.49.0

