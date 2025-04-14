Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0B72BE7A8;
	Mon, 14 Apr 2025 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636793; cv=none; b=PiTr0e1LlNfaqywxReokyuu674FTWFc7rBLL2N5eMoBEq5+ySLlCP9KZzr2r9k9OkzjPaZjYRXSYG5fcs90bAEcR0COeA9iRaDeofaTog4f69T1YdmN5sjsKFfBTvvK6rtOm4lPOVXI94Ravt5A7is39i3Z2LT1X0WEsg6sfylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636793; c=relaxed/simple;
	bh=UDI/AINJ2eSGkvDP2SFZPf6QNDNrXltQ02V5ZBvYLvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SyngCADMklVfMRn6N5X1CGPseetj8ASUAmwnOoT6dYZ4agyzSUk3pWyTXf4KXe0/fdAQEU8KlJPHSz4GfCNWiNeGl6fYP1fQIlb9RZybVfqLqbwnfm8BkSziLdMrquelzBbVFo0zf7/prUaEGKzvk2LtjNFvDGFowM17SeqzYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHn1qc33; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHn1qc33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A86BC4CEE2;
	Mon, 14 Apr 2025 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744636793;
	bh=UDI/AINJ2eSGkvDP2SFZPf6QNDNrXltQ02V5ZBvYLvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AHn1qc33BaFCwQETZnb5xvuBUTxZnnXiEUtTFbfetO2ji2+7aKxRasi+GRboscaR8
	 +rWqMad5hu8L2kQjU8TB5l0W5vi4t7JJsjwBLd1FYqGKzle2dU5buX7PDF6Z8nuWqx
	 M/vZJWE27xGc5XBF0U5hbWvFssnf5vY05SwLyMykiOvPWM0Y9TQcp/Lcr/2iglEEhb
	 dhWdHIE99Hj1hzZzABIeXbEccjVHpNE9tVmEuYBTVNnzBXj9bxh8zoaW2wOFlG5YFD
	 0ziYPRVKRLqWQskcYVEEEOrXDi0EJV4CYDMgGbhoBLP9l1OU3FDmC/bnop8+i5f2Al
	 vCbswBpvSW13A==
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
Subject: [PATCH v4 3/5] rust: auxiliary: add auxiliary device / driver abstractions
Date: Mon, 14 Apr 2025 15:18:06 +0200
Message-ID: <20250414131934.28418-4-dakr@kernel.org>
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

Implement the basic auxiliary abstractions required to implement a
driver matching an auxiliary device.

The design and implementation is analogous to PCI and platform and is
based on the generic device / driver abstractions.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/auxiliary.c        |  23 +++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/auxiliary.rs        | 274 ++++++++++++++++++++++++++++++++
 rust/kernel/device.rs           |   1 -
 rust/kernel/lib.rs              |   2 +
 7 files changed, 303 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/auxiliary.c
 create mode 100644 rust/kernel/auxiliary.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..a7bc29ca37d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3872,6 +3872,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
 F:	Documentation/driver-api/auxiliary_bus.rst
 F:	drivers/base/auxiliary.c
 F:	include/linux/auxiliary_bus.h
+F:	rust/kernel/auxiliary.rs
+F:	samples/rust/rust_driver_auxiliary.rs
 
 AUXILIARY DISPLAY DRIVERS
 M:	Andy Shevchenko <andy@kernel.org>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ab37e1d35c70..8a2add69e5d6 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -7,6 +7,7 @@
  */
 
 #include <kunit/test.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
diff --git a/rust/helpers/auxiliary.c b/rust/helpers/auxiliary.c
new file mode 100644
index 000000000000..0db3860d774e
--- /dev/null
+++ b/rust/helpers/auxiliary.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/auxiliary_bus.h>
+
+void rust_helper_auxiliary_set_drvdata(struct auxiliary_device *adev, void *data)
+{
+	auxiliary_set_drvdata(adev, data);
+}
+
+void *rust_helper_auxiliary_get_drvdata(struct auxiliary_device *adev)
+{
+	return auxiliary_get_drvdata(adev);
+}
+
+void rust_helper_auxiliary_device_uninit(struct auxiliary_device *adev)
+{
+	return auxiliary_device_uninit(adev);
+}
+
+void rust_helper_auxiliary_device_delete(struct auxiliary_device *adev)
+{
+	return auxiliary_device_delete(adev);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e1c21eba9b15..6b279279cb12 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -7,6 +7,7 @@
  * Sorted alphabetically.
  */
 
+#include "auxiliary.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
new file mode 100644
index 000000000000..75423737032a
--- /dev/null
+++ b/rust/kernel/auxiliary.rs
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for the auxiliary bus.
+//!
+//! C header: [`include/linux/auxiliary_bus.h`](srctree/include/linux/auxiliary_bus.h)
+
+use crate::{
+    bindings, device,
+    device_id::RawDeviceId,
+    driver,
+    error::{to_result, Result},
+    prelude::*,
+    str::CStr,
+    types::{ForeignOwnable, Opaque},
+    ThisModule,
+};
+use core::{
+    marker::PhantomData,
+    ptr::{addr_of_mut, NonNull},
+};
+
+/// An adapter for the registration of auxiliary drivers.
+pub struct Adapter<T: Driver>(T);
+
+// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
+// a preceding call to `register` has been successful.
+unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
+    type RegType = bindings::auxiliary_driver;
+
+    unsafe fn register(
+        adrv: &Opaque<Self::RegType>,
+        name: &'static CStr,
+        module: &'static ThisModule,
+    ) -> Result {
+        // SAFETY: It's safe to set the fields of `struct auxiliary_driver` on initialization.
+        unsafe {
+            (*adrv.get()).name = name.as_char_ptr();
+            (*adrv.get()).probe = Some(Self::probe_callback);
+            (*adrv.get()).remove = Some(Self::remove_callback);
+            (*adrv.get()).id_table = T::ID_TABLE.as_ptr();
+        }
+
+        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
+        to_result(unsafe {
+            bindings::__auxiliary_driver_register(adrv.get(), module.0, name.as_char_ptr())
+        })
+    }
+
+    unsafe fn unregister(adrv: &Opaque<Self::RegType>) {
+        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
+        unsafe { bindings::auxiliary_driver_unregister(adrv.get()) }
+    }
+}
+
+impl<T: Driver + 'static> Adapter<T> {
+    extern "C" fn probe_callback(
+        adev: *mut bindings::auxiliary_device,
+        id: *const bindings::auxiliary_device_id,
+    ) -> core::ffi::c_int {
+        // SAFETY: The auxiliary bus only ever calls the probe callback with a valid pointer to a
+        // `struct auxiliary_device`.
+        //
+        // INVARIANT: `adev` is valid for the duration of `probe_callback()`.
+        let adev = unsafe { &*adev.cast::<Device<device::Core>>() };
+
+        // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct auxiliary_device_id` and
+        // does not add additional invariants, so it's safe to transmute.
+        let id = unsafe { &*id.cast::<DeviceId>() };
+        let info = T::ID_TABLE.info(id.index());
+
+        match T::probe(adev, info) {
+            Ok(data) => {
+                // Let the `struct auxiliary_device` own a reference of the driver's private data.
+                // SAFETY: By the type invariant `adev.as_raw` returns a valid pointer to a
+                // `struct auxiliary_device`.
+                unsafe { bindings::auxiliary_set_drvdata(adev.as_raw(), data.into_foreign()) };
+            }
+            Err(err) => return Error::to_errno(err),
+        }
+
+        0
+    }
+
+    extern "C" fn remove_callback(adev: *mut bindings::auxiliary_device) {
+        // SAFETY: The auxiliary bus only ever calls the remove callback with a valid pointer to a
+        // `struct auxiliary_device`.
+        let ptr = unsafe { bindings::auxiliary_get_drvdata(adev) };
+
+        // SAFETY: `remove_callback` is only ever called after a successful call to
+        // `probe_callback`, hence it's guaranteed that `ptr` points to a valid and initialized
+        // `KBox<T>` pointer created through `KBox::into_foreign`.
+        let _ = unsafe { KBox::<T>::from_foreign(ptr) };
+    }
+}
+
+/// Declares a kernel module that exposes a single auxiliary driver.
+#[macro_export]
+macro_rules! module_auxiliary_driver {
+    ($($f:tt)*) => {
+        $crate::module_driver!(<T>, $crate::auxiliary::Adapter<T>, { $($f)* });
+    };
+}
+
+/// Abstraction for `bindings::auxiliary_device_id`.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct DeviceId(bindings::auxiliary_device_id);
+
+impl DeviceId {
+    /// Create a new [`DeviceId`] from name.
+    pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
+        let name = name.as_bytes_with_nul();
+        let modname = modname.as_bytes_with_nul();
+
+        // TODO: Replace with `bindings::auxiliary_device_id::default()` once stabilized for
+        // `const`.
+        //
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut id: bindings::auxiliary_device_id = unsafe { core::mem::zeroed() };
+
+        let mut i = 0;
+        while i < modname.len() {
+            id.name[i] = modname[i];
+            i += 1;
+        }
+
+        // Reuse the space of the NULL terminator.
+        id.name[i - 1] = b'.';
+
+        let mut j = 0;
+        while j < name.len() {
+            id.name[i] = name[j];
+            i += 1;
+            j += 1;
+        }
+
+        Self(id)
+    }
+}
+
+// SAFETY:
+// * `DeviceId` is a `#[repr(transparent)` wrapper of `auxiliary_device_id` and does not add
+//   additional invariants, so it's safe to transmute to `RawType`.
+// * `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field.
+unsafe impl RawDeviceId for DeviceId {
+    type RawType = bindings::auxiliary_device_id;
+
+    const DRIVER_DATA_OFFSET: usize =
+        core::mem::offset_of!(bindings::auxiliary_device_id, driver_data);
+
+    fn index(&self) -> usize {
+        self.0.driver_data
+    }
+}
+
+/// IdTable type for auxiliary drivers.
+pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
+
+/// Create a auxiliary `IdTable` with its alias for modpost.
+#[macro_export]
+macro_rules! auxiliary_device_table {
+    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
+        const $table_name: $crate::device_id::IdArray<
+            $crate::auxiliary::DeviceId,
+            $id_info_type,
+            { $table_data.len() },
+        > = $crate::device_id::IdArray::new($table_data);
+
+        $crate::module_device_table!("auxiliary", $module_table_name, $table_name);
+    };
+}
+
+/// The auxiliary driver trait.
+///
+/// Drivers must implement this trait in order to get an auxiliary driver registered.
+pub trait Driver {
+    /// The type holding information about each device id supported by the driver.
+    ///
+    /// TODO: Use associated_type_defaults once stabilized:
+    ///
+    /// type IdInfo: 'static = ();
+    type IdInfo: 'static;
+
+    /// The table of device ids supported by the driver.
+    const ID_TABLE: IdTable<Self::IdInfo>;
+
+    /// Auxiliary driver probe.
+    ///
+    /// Called when an auxiliary device is matches a corresponding driver.
+    fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> Result<Pin<KBox<Self>>>;
+}
+
+/// The auxiliary device representation.
+///
+/// This structure represents the Rust abstraction for a C `struct auxiliary_device`. The
+/// implementation abstracts the usage of an already existing C `struct auxiliary_device` within
+/// Rust code that we get passed from the C side.
+///
+/// # Invariants
+///
+/// A [`Device`] instance represents a valid `struct auxiliary_device` created by the C portion of
+/// the kernel.
+#[repr(transparent)]
+pub struct Device<Ctx: device::DeviceContext = device::Normal>(
+    Opaque<bindings::auxiliary_device>,
+    PhantomData<Ctx>,
+);
+
+impl<Ctx: device::DeviceContext> Device<Ctx> {
+    fn as_raw(&self) -> *mut bindings::auxiliary_device {
+        self.0.get()
+    }
+
+    /// Returns the auxiliary device' id.
+    pub fn id(&self) -> u32 {
+        // SAFETY: By the type invariant `self.as_raw()` is a valid pointer to a
+        // `struct auxiliary_device`.
+        unsafe { (*self.as_raw()).id }
+    }
+
+    /// Returns a reference to the parent [`device::Device`], if any.
+    pub fn parent(&self) -> Option<&device::Device> {
+        let ptr: *const Self = self;
+        // CAST: `Device<Ctx: DeviceContext>` types are transparent to each other.
+        let ptr: *const Device = ptr.cast();
+        // SAFETY: `ptr` was derived from `&self`.
+        let this = unsafe { &*ptr };
+
+        this.as_ref().parent()
+    }
+}
+
+// SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
+// argument.
+kernel::impl_device_context_deref!(unsafe { Device });
+kernel::impl_device_context_into_aref!(Device);
+
+// SAFETY: Instances of `Device` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // CAST: `Self` a transparent wrapper of `bindings::auxiliary_device`.
+        let adev: *mut bindings::auxiliary_device = obj.cast().as_ptr();
+
+        // SAFETY: By the type invariant of `Self`, `adev` is a pointer to a valid
+        // `struct auxiliary_device`.
+        let dev = unsafe { addr_of_mut!((*adev).dev) };
+
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::put_device(dev) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
+        // `struct auxiliary_device`.
+        let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
+
+        // SAFETY: `dev` points to a valid `struct device`.
+        unsafe { device::Device::as_ref(dev) }
+    }
+}
+
+// SAFETY: A `Device` is always reference-counted and can be released from any thread.
+unsafe impl Send for Device {}
+
+// SAFETY: `Device` can be shared among threads because all methods of `Device`
+// (i.e. `Device<Normal>) are thread safe.
+unsafe impl Sync for Device {}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 911045e32c34..bbd308b8c694 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -68,7 +68,6 @@ pub(crate) fn as_raw(&self) -> *mut bindings::device {
     }
 
     /// Returns a reference to the parent device, if any.
-    #[expect(unused)]
     pub(crate) fn parent(&self) -> Option<&Self> {
         // SAFETY:
         // - By the type invariant `self.as_raw()` is always valid.
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index de07aadd1ff5..55a8dfeece0b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -38,6 +38,8 @@
 pub use ffi;
 
 pub mod alloc;
+#[cfg(CONFIG_AUXILIARY_BUS)]
+pub mod auxiliary;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 #[doc(hidden)]
-- 
2.49.0

