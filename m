Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4211C5F08;
	Fri, 31 Jan 2025 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738330340; cv=none; b=P9Xr+qyB2qyAyyEENlfyPzR1Mm+JsIv2vN5kjp36ss0iB9d9rRFl5EO4M3n9/JrVFijANelW0QR3cB78T6S2Iq8ahe3ySG+eR1pYhAUXXk+tEBxduQ7i5ULTys5Q/MCul7K4G4rGGVZyW/uPS0/68PRn3Qz75+vwWSooYy0kgOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738330340; c=relaxed/simple;
	bh=5kUbYYl6O9tWK5RDQX4Cl2uMDL6vlLePNSLAY9RUwXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7ywX9721/zmhA0SXC2Lmvw/u5IckUHFw9Ll/AdeMOpIcpApO5njBhLcp5XEHu6K4jjebLLLS0IyY9odmIfKag0gkJoLrCgXu6aIOO+2vwDZIymRQFgOWadmBSyBfMVs1AnMkBPcnNlQyv8i+2oxkdmeHU/BHHdE0AxB5g+c1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9vg4NTX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9vg4NTX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DF3C4CEDF;
	Fri, 31 Jan 2025 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738330339;
	bh=5kUbYYl6O9tWK5RDQX4Cl2uMDL6vlLePNSLAY9RUwXY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e9vg4NTXhi2tOtOrNqblIqDIw/64BQbCsdT5uzO/8vbacuaNebCp4uF7IM7eEhHLd
	 FmnpCDq7J+TrtmG5+XJTXtAkwNfHjeTS/7J9pFgOiApKDqLytxBwJ3MSlztx/Edjfy
	 8lKG5fMxW0R0MU9KegjJsrEgUWb3nXDioHLW29+cnrv0L2lHU88mDthIDFa9FnEL53
	 fqonwto2Sh11Jz/LvTGkcGhJscArkYB8ZozPhj4UOHwCnTkFbjayjDUQCI0320G90p
	 VYnhp5oM4CRIgFBek0dLF0jymSmrSlShrKCfFH4zuKsAOkYZOoplXYs2211/sudjeq
	 f+L9dC9BEdwCQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 31 Jan 2025 14:30:10 +0100
Subject: [PATCH 3/4] rust: configfs: introduce rust support for configfs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-configfs-v1-3-87947611401c@kernel.org>
References: <20250131-configfs-v1-0-87947611401c@kernel.org>
In-Reply-To: <20250131-configfs-v1-0-87947611401c@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Christoph Hellwig <hch@lst.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=40827;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=5kUbYYl6O9tWK5RDQX4Cl2uMDL6vlLePNSLAY9RUwXY=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnnNCFVyIRYsi0WkvnCP4abr6uEy5FxwSKemn7c
 ouTjkk7eVOJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ5zQhQAKCRDhuBo+eShj
 d3U5EACsttUzgUB/sHQWHcslihgE6sFnpbEAkbq0Z/biKpSu4FmnJ/OPGU+eI7iNehJxq7rt8hD
 c/oJ+Z5Ry3Xh9qJI5XmLBVOuQD17E7Bh3QIjRpksTBTXFjE62A7aDt17/mjIkbAZICgPvq5C1l+
 pibdqKbpo/sal77uxnvYegfpJfaO2W++ihxl1x0qmYToLEy6MOUi61ALV5FA+UuNeXILbREJHpf
 zSCpURF9w+3uz8MMB8fibIek1gst3sfsMApSXb6sZE//M4NGPdtMwiqC/p/ftAEXYljsFIPJM1M
 PIBXNx8tRBKEIh1cQZ0BG95A+k9jVP9qX73UEAJOo94S6/0kEGOm75TmSBw/jM9zKssApMeMez3
 pQeE5iBEGRFt1FSKDE1Iqkb0/Wuzmv3SAWSGPPJo5xzWNgqQU8NGu4zMiGIZhwpD7vRGZ3uKf/B
 Z1hoRGj+rpvLO048IKt0i9eLb5smawBkAss1M2qrueVeo0x2AIKSBfnexlaty5M1nOjhpeLTf3d
 XkQUrbHE1ekXCdLYcWP7inm6ZTShz9K6EUM7Un0lTJQBK1JHfRziRYDEzMP9NsMe42VCb43x5q5
 wArA0lqRypDJTPYafVMxFy9ljCylVTr4Og+UB9yLQi11cD2jnQjkERHT7GfzzPYhNIh/1PKUuw/
 kaRRXWszJrlLfqw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This patch adds a rust API for configfs, thus allowing rust modules to use
configfs for configuration. The implementation is a shim on top of the C
configfs implementation allowing safe use of the C infrastructure from
rust.

The patch enables the `const_mut_refs` feature on compilers before rustc
1.83. The feature was stabilized in rustc 1.83 and is not required to be
explicitly enabled on later versions.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

---

This patch is a direct dependency for `rnull`, the rust null block driver.
---
 init/Kconfig                    |   3 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/configfs.rs         | 811 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   3 +
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_configfs.rs   | 192 ++++++++++
 7 files changed, 1022 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 868ffa922b2c2852bdff67a0a17cf49277d39d40..c54a413de532a7d8616e994b4f1911972acc5c79 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -132,6 +132,9 @@ config CC_HAS_COUNTED_BY
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
+config RUSTC_HAS_CONST_MUT_REFS_MERGED
+	def_bool RUSTC_VERSION >= 108300
+
 config PAHOLE_VERSION
 	int
 	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 5c4dfe22f41a5a106330e8c43ffbd342c69c4e0b..bb3bf08a1cd7f34ad517372b78afcb9a680689da 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/configfs.h>
 #include <linux/cred.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7680461870efab1ef56045770158cf3fd4e45e14
--- /dev/null
+++ b/rust/kernel/configfs.rs
@@ -0,0 +1,811 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! `configfs` interface.
+//!
+//! `configfs` is an in-memory pseudo file system for configuration of kernel
+//! modules. Please see the [C documentation] for details and intended use of
+//! `configfs`.
+//!
+//! This module does not support the following `configfs` features:
+//!
+//! - Items. All group children are groups.
+//! - Symlink support.
+//! - `disconnect_notify` hook.
+//! - Item `release` hook
+//! - Default groups.
+//!
+//! See the [rust_configfs.rs] sample for a full example use of this module.
+//!
+//! C header: [`include/linux/configfs.h`](srctree/include/linux/configfs.h)
+//!
+//! [C documentation]: srctree/Documentation/filesystems/configfs.rst
+//! [rust_configfs.rs]: srctree/samples/rust/rust_configfs.rs
+
+use crate::container_of;
+use crate::page::PAGE_SIZE;
+use crate::types::ForeignOwnable;
+use crate::{prelude::*, types::Opaque};
+use core::cell::UnsafeCell;
+use core::marker::PhantomData;
+use core::ptr::addr_of;
+use core::ptr::addr_of_mut;
+use kernel::alloc::flags;
+use kernel::str::CString;
+
+/// A `configfs` subsystem.
+///
+/// This is the top level entrypoint for a `configfs` hierarchy. Embed a field
+/// of this type into a struct and implement [`HasSubsystem`] for the struct
+/// with the [`kernel::impl_has_subsystem`] macro. Instantiate the subsystem with
+/// [`Subsystem::register`].
+///
+/// A [`Subsystem`] is also a [`Group`], and implementing [`HasSubsystem`] for a
+/// type will automatically implement [`HasGroup`] for the type.
+#[pin_data(PinnedDrop)]
+pub struct Subsystem<DATA> {
+    #[pin]
+    subsystem: Opaque<bindings::configfs_subsystem>,
+    #[pin]
+    data: DATA,
+}
+
+// SAFETY: We do not provide any operations on `Subsystem`.
+unsafe impl<DATA> Sync for Subsystem<DATA> {}
+
+// SAFETY: Ownership of `Subsystem` can safely be transferred to other threads.
+unsafe impl<DATA> Send for Subsystem<DATA> {}
+
+impl<DATA> Subsystem<DATA> {
+    /// Create an initializer for a [`Subsystem`].
+    ///
+    /// The subsystem will appear in configfs as a directory name given by
+    /// `name`. The attributes available in directory are specified by
+    /// `item_type`.
+    pub fn new(
+        name: &'static CStr,
+        item_type: &'static ItemType<DATA>,
+        data: impl PinInit<DATA, Error>,
+    ) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            subsystem <- kernel::init::zeroed().chain(
+                |place: &mut Opaque<bindings::configfs_subsystem>| {
+                    // SAFETY: All of `place` is valid for write.
+                    unsafe {
+                        addr_of_mut!((*place.get()).su_group.cg_item.ci_name )
+                            .write(name.as_ptr().cast_mut().cast())
+                    };
+                    // SAFETY: All of `place` is valid for write.
+                    unsafe {
+                        addr_of_mut!((*place.get()).su_group.cg_item.ci_type)
+                            .write(item_type.as_ptr())
+                    };
+                    // SAFETY: We initialized the required fields of `place.group` above.
+                    unsafe { bindings::config_group_init(&mut (*place.get()).su_group) };
+                    // SAFETY: `place.su_mutex` is valid for use as a mutex.
+                    unsafe { bindings::__mutex_init(
+                        &mut (*place.get()).su_mutex,
+                        kernel::optional_name!().as_char_ptr(),
+                        kernel::static_lock_class!().as_ptr())
+                    }
+                    Ok(())
+                }),
+            data <- data,
+        })
+        .pin_chain(|this| {
+            crate::error::to_result(
+                // SAFETY: We initialized `this.subsystem` according to C API contract above.
+                unsafe { bindings::configfs_register_subsystem(this.subsystem.get()) },
+            )
+        })
+    }
+}
+
+#[pinned_drop]
+impl<DATA> PinnedDrop for Subsystem<DATA> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: We registered `self.subsystem` in the initializer returned by `Self::new`.
+        unsafe { bindings::configfs_unregister_subsystem(self.subsystem.get()) };
+    }
+}
+
+/// Trait that allows offset calculations for structs that embed a `bindings::config_group`.
+///
+/// # Safety
+///
+/// - Implementers of this trait must embed a `bindings::config_group`.
+/// - Methods must be implemented according to method documentation.
+unsafe trait HasGroup<DATA> {
+    /// Return the address of the `bindings::config_group` embedded in `Self`.
+    ///
+    /// # Safety
+    ///
+    /// - `this` must be a valid allocation of at least the size of `Self`.
+    unsafe fn group(this: *const Self) -> *const bindings::config_group;
+
+    /// Return the address of the `Self` that `group` is embedded in.
+    ///
+    /// # Safety
+    ///
+    /// - `group` must point to the `bindings::config_group` that is embedded in
+    ///   `Self`.
+    unsafe fn container_of(group: *const bindings::config_group) -> *const Self;
+}
+
+// SAFETY: `Subsystem<DATA>` embeds a field of type `bindings::config_group`
+// within the `subsystem` field.
+unsafe impl<DATA> HasGroup<DATA> for Subsystem<DATA> {
+    unsafe fn group(this: *const Self) -> *const bindings::config_group {
+        // SAFETY: By impl and function safety requirement this projection is in bounds.
+        unsafe { addr_of!((*(*this).subsystem.get()).su_group) }
+    }
+
+    unsafe fn container_of(group: *const bindings::config_group) -> *const Self {
+        // SAFETY: By impl and function safety requirement this projection is in bounds.
+        let c_subsys_ptr = unsafe { container_of!(group, bindings::configfs_subsystem, su_group) };
+        let opaque_ptr = c_subsys_ptr.cast::<Opaque<bindings::configfs_subsystem>>();
+        // SAFETY: By impl and function safety requirement, `opaque_ptr` and the
+        // pointer it returns, are within the same allocation.
+        unsafe { container_of!(opaque_ptr, Subsystem<DATA>, subsystem) }
+    }
+}
+
+/// A `configfs` group.
+///
+/// To add a subgroup to `configfs`, embed a field of this type into a struct
+/// and use it for the `CHLD` generic of [`GroupOperations`].
+#[pin_data]
+pub struct Group<DATA> {
+    #[pin]
+    group: Opaque<bindings::config_group>,
+    #[pin]
+    data: DATA,
+}
+
+impl<DATA> Group<DATA> {
+    /// Create an initializer for a new group.
+    ///
+    /// When instantiated, the group will appear as a directory with the name
+    /// given by `name` and it will contain attributes specified by `item_type`.
+    pub fn new(
+        name: CString,
+        item_type: &'static ItemType<DATA>,
+        data: impl PinInit<DATA, Error>,
+    ) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            group <- kernel::init::zeroed().chain(|v: &mut Opaque<bindings::config_group>| {
+                let place = v.get();
+                let name = name.as_bytes_with_nul().as_ptr();
+                // SAFETY: It is safe to initialize a group once it has been zeroed.
+                unsafe {
+                    bindings::config_group_init_type_name(place, name as _, item_type.as_ptr())
+                };
+                Ok(())
+            }),
+            data <- data,
+        })
+    }
+}
+
+// SAFETY: `Group<DATA>` embeds a field of type `bindings::config_group`
+// within the `group` field.
+unsafe impl<DATA> HasGroup<DATA> for Group<DATA> {
+    unsafe fn group(this: *const Self) -> *const bindings::config_group {
+        Opaque::raw_get(
+            // SAFETY: By impl and function safety requirements this field
+            // projection is within bounds of the allocation.
+            unsafe { addr_of!((*this).group) },
+        )
+    }
+
+    unsafe fn container_of(group: *const bindings::config_group) -> *const Self {
+        let opaque_ptr = group.cast::<Opaque<bindings::config_group>>();
+        // SAFETY: By impl and function safety requirement, `opaque_ptr` and
+        // pointer it returns will be in the same allocation.
+        unsafe { container_of!(opaque_ptr, Self, group) }
+    }
+}
+
+struct GroupOperationsVTable<PAR, CHLD, CPTR, PCPTR>(PhantomData<(PAR, CHLD, CPTR, PCPTR)>)
+where
+    PAR: GroupOperations<Child = CHLD, ChildPointer = CPTR, PinChildPointer = PCPTR>,
+    CPTR: InPlaceInit<Group<CHLD>, PinnedSelf = PCPTR>,
+    PCPTR: ForeignOwnable<PointedTo = Group<CHLD>>;
+
+/// # Safety
+///
+/// `this` must be a valid pointer.
+///
+/// If `this` does not represent the root group of a `configfs` subsystem,
+/// `this` must be a pointer to a `bindings::config_group` embedded in a
+/// `Group<PAR>`.
+///
+/// Otherwise, `this` must be a pointer to a `bindings::config_group` that
+/// is embedded in a `bindings::configfs_subsystem` that is embedded in a
+/// `Subsystem<PAR>`.
+unsafe fn get_group_data<'a, PAR>(this: *mut bindings::config_group) -> &'a PAR {
+    // SAFETY: `this` is a valid pointer.
+    let is_root = unsafe { (*this).cg_subsys.is_null() };
+
+    if !is_root {
+        // SAFETY: By C API contact, `this` is a pointer to a
+        // `bindings::config_group` that we passed as a return value in from
+        // `make_group`. Such a pointer is embedded within a `Group<PAR>`.
+        unsafe { &(*Group::<PAR>::container_of(this)).data }
+    } else {
+        // SAFETY: By C API contract, `this` is a pointer to the
+        // `bindings::config_group` field within a `Subsystem<PAR>`.
+        unsafe { &(*Subsystem::container_of(this)).data }
+    }
+}
+
+impl<PAR, CHLD, CPTR, PCPTR> GroupOperationsVTable<PAR, CHLD, CPTR, PCPTR>
+where
+    PAR: GroupOperations<Child = CHLD, ChildPointer = CPTR, PinChildPointer = PCPTR>,
+    CPTR: InPlaceInit<Group<CHLD>, PinnedSelf = PCPTR>,
+    PCPTR: ForeignOwnable<PointedTo = Group<CHLD>>,
+{
+    /// # Safety
+    ///
+    /// `this` must be a valid pointer.
+    ///
+    /// If `this` does not represent the root group of a `configfs` subsystem,
+    /// `this` must be a pointer to a `bindings::config_group` embedded in a
+    /// `Group<PAR>`.
+    ///
+    /// Otherwise, `this` must be a pointer to a `bindings::config_group` that
+    /// is embedded in a `bindings::configfs_subsystem` that is embedded in a
+    /// `Subsystem<PAR>`.
+    ///
+    /// `name` must point to a null terminated string.
+    unsafe extern "C" fn make_group(
+        this: *mut bindings::config_group,
+        name: *const kernel::ffi::c_char,
+    ) -> *mut bindings::config_group {
+        // SAFETY: By function safety requirements of this function, this call
+        // is safe.
+        let parent_data = unsafe { get_group_data(this) };
+
+        let group_init = match PAR::make_group(
+            parent_data,
+            // SAFETY: By function safety requirements, name points to a null
+            // terminated string.
+            unsafe { CStr::from_char_ptr(name) },
+        ) {
+            Ok(init) => init,
+            Err(e) => return e.to_ptr(),
+        };
+
+        let child_group = CPTR::try_pin_init(group_init, flags::GFP_KERNEL);
+
+        match child_group {
+            Ok(child_group) => {
+                let child_group_ptr = child_group.into_foreign();
+                // SAFETY: We allocated the pointee of `child_ptr` above as a
+                // `Group<CHLD>`.
+                unsafe { Group::<CHLD>::group(child_group_ptr) }.cast_mut()
+            }
+            Err(e) => e.to_ptr(),
+        }
+    }
+
+    /// # Safety
+    ///
+    /// If `this` does not represent the root group of a `configfs` subsystem,
+    /// `this` must be a pointer to a `bindings::config_group` embedded in a
+    /// `Group<PAR>`.
+    ///
+    /// Otherwise, `this` must be a pointer to a `bindings::config_group` that
+    /// is embedded in a `bindings::configfs_subsystem` that is embedded in a
+    /// `Subsystem<PAR>`.
+    ///
+    /// `item` must point to a `bindings::config_item` within a
+    /// `bindings::config_group` within a `Group<CHLD>`.
+    unsafe extern "C" fn drop_item(
+        this: *mut bindings::config_group,
+        item: *mut bindings::config_item,
+    ) {
+        // SAFETY: By function safety requirements of this function, this call
+        // is safe.
+        let parent_data = unsafe { get_group_data(this) };
+
+        // SAFETY: By function safety requirements, `item` is embedded in a
+        // `config_group`.
+        let c_child_group_ptr =
+            unsafe { kernel::container_of!(item, bindings::config_group, cg_item) };
+        // SAFETY: By function safety requirements, `c_child_group_ptr` is
+        // embedded within a `Group<CHLD>`.
+        let r_child_group_ptr = unsafe { Group::<CHLD>::container_of(c_child_group_ptr) };
+
+        if PAR::HAS_DROP_ITEM {
+            PAR::drop_item(
+                parent_data,
+                // SAFETY: We called `into_foreign` to produce `r_child_group_ptr` in
+                // `make_group`. There are not other borrows of this pointer in existence.
+                unsafe { PCPTR::borrow(r_child_group_ptr.cast_mut()) },
+            );
+        }
+
+        // SAFETY: By C API contract, `configfs` is not going to touch `item`
+        // again.
+        unsafe { bindings::config_item_put(item) };
+
+        // SAFETY: We called `into_foreign` on `r_chilc_group_ptr` in
+        // `make_group`.
+        let pin_child: PCPTR = unsafe { PCPTR::from_foreign(r_child_group_ptr.cast_mut()) };
+        drop(pin_child);
+    }
+
+    const VTABLE: bindings::configfs_group_operations = bindings::configfs_group_operations {
+        make_item: None,
+        make_group: Some(Self::make_group),
+        disconnect_notify: None,
+        drop_item: Some(Self::drop_item),
+        is_visible: None,
+        is_bin_visible: None,
+    };
+}
+
+/// Operations implemented by `configfs` groups that can create subgroups.
+///
+/// Implement this trait on structs that embed a [`Subsystem`] or a [`Group`].
+#[vtable]
+pub trait GroupOperations {
+    /// The parent data object type.
+    ///
+    /// The implementer of this trait is this kind of data object. Shold be set
+    /// to `Self`.
+    type Parent;
+
+    /// The child data object type.
+    ///
+    /// This group will create subgroups (subdirectories) backed by this kind of
+    /// object.
+    type Child;
+
+    /// The type of the pointer used to point to [`Self::Child`].
+    ///
+    /// This pointer type should support pinned in-place initialization.
+    type ChildPointer: InPlaceInit<Group<Self::Child>, PinnedSelf = Self::PinChildPointer>;
+
+    /// The pinned version of the child pointer.
+    ///
+    /// This type must be convertible to a raw pointer according to [`ForeignOwnable`].
+    type PinChildPointer: ForeignOwnable<PointedTo = Group<Self::Child>>;
+
+    /// The kernel will call this method in response to `mkdir(2)` in the
+    /// directory representing `this`.
+    ///
+    /// To accept the request to create a group, implementations should
+    /// instantiate a `CHLD` and return a `CPTR` to it. To prevent creation,
+    /// return a suitable error.
+    fn make_group(
+        this: &Self::Parent,
+        name: &CStr,
+    ) -> Result<impl PinInit<Group<Self::Child>, Error>>;
+
+    /// The kernel will call this method before the directory representing
+    /// `_child` is removed from `configfs`.
+    ///
+    /// Implementations can use this method to do house keeping before
+    /// `configfs` drops its reference to `CHLD`.
+    fn drop_item(
+        _this: &Self::Parent,
+        _child: <Self::PinChildPointer as ForeignOwnable>::Borrowed<'_>,
+    ) {
+        kernel::build_error!(kernel::error::VTABLE_DEFAULT_ERROR)
+    }
+}
+
+/// A `configfs` attribute.
+///
+/// An attribute appear as a file in configfs, inside a folder that represent
+/// the group that the attribute belongs to.
+#[repr(transparent)]
+pub struct Attribute<const ID: u64, AO, DATA> {
+    attribute: Opaque<bindings::configfs_attribute>,
+    _p: PhantomData<(AO, DATA)>,
+}
+
+// SAFETY: We do not provide any operations on `Attribute`.
+unsafe impl<const ID: u64, AO, DATA> Sync for Attribute<ID, AO, DATA> {}
+
+// SAFETY: Ownership of `Attribute` can safely be transferred to other threads.
+unsafe impl<const ID: u64, AO, DATA> Send for Attribute<ID, AO, DATA> {}
+
+impl<const ID: u64, AO, DATA> Attribute<ID, AO, DATA>
+where
+    AO: AttributeOperations<ID, Data = DATA>,
+{
+    /// # Safety
+    ///
+    /// `item` must be embedded in a `bindings::config_group`.
+    ///
+    /// If `item` does not represent the root group of a `configfs` subsystem,
+    /// the group must be embedded in a `Group<PAR>`.
+    ///
+    /// Otherwise, the group must be a embedded in a
+    /// `bindings::configfs_subsystem` that is embedded in a `Subsystem<PAR>`.
+    ///
+    /// `page` must point to a writable buffer of size at least [`PAGE_SIZE`].
+    unsafe extern "C" fn show(
+        item: *mut bindings::config_item,
+        page: *mut kernel::ffi::c_char,
+    ) -> isize {
+        let c_group: *mut bindings::config_group =
+        // SAFETY: By function safety requirements, `item` is embedded in a
+        // `config_group`.
+            unsafe { container_of!(item, bindings::config_group, cg_item) }.cast_mut();
+
+        // SAFETY: The function safety requirements for this function satisfy
+        // the conditions for this call.
+        let data: &DATA = unsafe { get_group_data(c_group) };
+
+        // SAFETY: By function safety requirements, `page` is writable for `PAGE_SIZE`.
+        let ret = AO::show(data, unsafe { &mut *(page as *mut [u8; PAGE_SIZE]) });
+
+        match ret {
+            Ok(size) => size as isize,
+            Err(err) => err.to_errno() as isize,
+        }
+    }
+
+    /// # Safety
+    ///
+    /// `item` must be embedded in a `bindings::config_group`.
+    ///
+    /// If `item` does not represent the root group of a `configfs` subsystem,
+    /// the group must be embedded in a `Group<PAR>`.
+    ///
+    /// Otherwise, the group must be a embedded in a
+    /// `bindings::configfs_subsystem` that is embedded in a `Subsystem<PAR>`.
+    ///
+    /// `page` must point to a readable buffer of size at least `size`.
+    unsafe extern "C" fn store(
+        item: *mut bindings::config_item,
+        page: *const kernel::ffi::c_char,
+        size: usize,
+    ) -> isize {
+        let c_group: *mut bindings::config_group =
+        // SAFETY: By function safety requirements, `item` is embedded in a
+        // `config_group`.
+            unsafe { container_of!(item, bindings::config_group, cg_item) }.cast_mut();
+
+        // SAFETY: The function safety requirements for this function satisfy
+        // the conditions for this call.
+        let data: &DATA = unsafe { get_group_data(c_group) };
+
+        let ret = AO::store(
+            data,
+            // SAFETY: By function safety requirements, `page` is readable
+            // for at least `size`.
+            unsafe { core::slice::from_raw_parts(page.cast(), size) },
+        );
+
+        match ret {
+            Ok(()) => size as isize,
+            Err(err) => err.to_errno() as isize,
+        }
+    }
+
+    /// Create a new attribute.
+    ///
+    /// The attribute will appear as a file with name given by `name`.
+    pub const fn new(name: &'static CStr) -> Self {
+        Self {
+            attribute: Opaque::new(bindings::configfs_attribute {
+                ca_name: name as *const _ as _,
+                ca_owner: core::ptr::null_mut(),
+                ca_mode: 0o660,
+                show: Some(Self::show),
+                store: if AO::HAS_STORE {
+                    Some(Self::store)
+                } else {
+                    None
+                },
+            }),
+            _p: PhantomData,
+        }
+    }
+}
+
+/// Operations supported by an attribute.
+///
+/// Implement this trait on type and pass that type as generic parameter when
+/// creating an [`Attribute`]. The type carrying the implementation serve no
+/// purpose other than specifying the attribute operations.
+#[vtable]
+pub trait AttributeOperations<const ID: u64 = 0> {
+    /// The type of the object that contains the field that is backing the
+    /// attribute for this operation.
+    type Data;
+
+    /// This function is called by the kernel to read the value of an attribute.
+    ///
+    /// Implementations should write the rendering of the attribute to `page`
+    /// and return the number of bytes written.
+    fn show(data: &Self::Data, page: &mut [u8; PAGE_SIZE]) -> Result<usize>;
+
+    /// This function is called by the kernel to update the value of an attribute.
+    ///
+    /// Implementations should parse the value from `page` and update internal
+    /// state to reflect the parsed value. Partial writes are not supported and
+    /// implementations should expect the full page to arrive in one write
+    /// operation.
+    fn store(_data: &Self::Data, _page: &[u8]) -> Result {
+        kernel::build_error!(kernel::error::VTABLE_DEFAULT_ERROR)
+    }
+}
+
+/// A list of attributes.
+///
+/// This type is used to construct a new [`ItemType`]. It represents a list of
+/// [`Attribute`] that will appear in the directory representing a [`Group`].
+/// Users should not directly instantiate this type, rather they should use the
+/// [`kernel::configfs_attrs`] macro to declare a static set of attributes for a
+/// group.
+#[repr(transparent)]
+pub struct AttributeList<const N: usize, DATA>(
+    UnsafeCell<[*mut kernel::ffi::c_void; N]>,
+    PhantomData<DATA>,
+);
+
+// SAFETY: Ownership of `AttributeList` can safely be transferred to other threads.
+unsafe impl<const N: usize, DATA> Send for AttributeList<N, DATA> {}
+
+// SAFETY: We do not provide any operations on `AttributeList` that need synchronization.
+unsafe impl<const N: usize, DATA> Sync for AttributeList<N, DATA> {}
+
+impl<const N: usize, DATA> AttributeList<N, DATA> {
+    #[doc(hidden)]
+    /// # Safety
+    ///
+    /// This function can only be called by expanding the `configfs_attrs`
+    /// macro.
+    pub const unsafe fn new() -> Self {
+        Self(UnsafeCell::new([core::ptr::null_mut(); N]), PhantomData)
+    }
+
+    #[doc(hidden)]
+    /// # Safety
+    ///
+    /// This function can only be called by expanding the `configfs_attrs`
+    /// macro.
+    pub const unsafe fn add<
+        const I: usize,
+        const ID: u64,
+        O: AttributeOperations<ID, Data = DATA>,
+    >(
+        &'static self,
+        attribute: &'static Attribute<ID, O, DATA>,
+    ) {
+        if I >= N - 1 {
+            kernel::build_error!("Invalid attribute index");
+        }
+
+        // SAFETY: This function is only called through `configfs_attrs`. This
+        // ensures that we are evaluating the function in const context when
+        // initializing a static. As such, the reference created below will be
+        // exclusive.
+        unsafe {
+            (&mut *self.0.get())[I] = (attribute as *const Attribute<ID, O, DATA>)
+                .cast_mut()
+                .cast()
+        };
+    }
+}
+
+/// A representation of the attributes that will appear in a [`Group`].
+///
+/// Users should not directly instantiate objects of this type. Rather, they
+/// should use the [`kernel::configfs_attrs`] macro to statically declare the
+/// shape of a [`Group`].
+#[pin_data]
+pub struct ItemType<DATA> {
+    #[pin]
+    item_type: Opaque<bindings::config_item_type>,
+    _p: PhantomData<DATA>,
+}
+
+// SAFETY: We do not provide any operations on `ItemType` that need synchronization.
+unsafe impl<DATA> Sync for ItemType<DATA> {}
+
+// SAFETY: Ownership of `ItemType` can safely be transferred to other threads.
+unsafe impl<DATA> Send for ItemType<DATA> {}
+
+impl<DATA> ItemType<DATA> {
+    #[doc(hidden)]
+    pub const fn new_with_child_ctor<const N: usize, PAR, CHLD, CPTR, PCPTR>(
+        owner: &'static ThisModule,
+        attributes: &'static AttributeList<N, DATA>,
+    ) -> Self
+    where
+        PAR: GroupOperations<Child = CHLD, ChildPointer = CPTR, PinChildPointer = PCPTR>,
+        CPTR: InPlaceInit<Group<CHLD>, PinnedSelf = PCPTR>,
+        PCPTR: ForeignOwnable<PointedTo = Group<CHLD>>,
+    {
+        Self {
+            item_type: Opaque::new(bindings::config_item_type {
+                ct_owner: owner.as_ptr(),
+                ct_group_ops: (&GroupOperationsVTable::<PAR, CHLD, CPTR, PCPTR>::VTABLE as *const _)
+                    as *mut _,
+                ct_item_ops: core::ptr::null_mut(),
+                ct_attrs: attributes as *const _ as _,
+                ct_bin_attrs: core::ptr::null_mut(),
+            }),
+            _p: PhantomData,
+        }
+    }
+
+    #[doc(hidden)]
+    pub const fn new<const N: usize>(
+        owner: &'static ThisModule,
+        attributes: &'static AttributeList<N, DATA>,
+    ) -> Self {
+        Self {
+            item_type: Opaque::new(bindings::config_item_type {
+                ct_owner: owner.as_ptr(),
+                ct_group_ops: core::ptr::null_mut(),
+                ct_item_ops: core::ptr::null_mut(),
+                ct_attrs: attributes as *const _ as _,
+                ct_bin_attrs: core::ptr::null_mut(),
+            }),
+            _p: PhantomData,
+        }
+    }
+}
+
+impl<DATA> ItemType<DATA> {
+    fn as_ptr(&self) -> *const bindings::config_item_type {
+        self.item_type.get()
+    }
+}
+
+/// Define a list of configfs attributes statically.
+#[macro_export]
+macro_rules! configfs_attrs {
+    (
+        container: $container:ty,
+        attributes: [
+            $($name:ident: $attr:literal,)*
+        ],
+    ) => {
+        $crate::configfs_attrs!(
+            count:
+            @container($container),
+            @child(),
+            @no_child(x),
+            @attrs($($name $attr)*),
+            @eat($($name $attr,)*),
+            @assign(),
+            @cnt(0usize),
+        )
+    };
+    (
+        container: $container:ty,
+        child: $child:ty,
+        pointer: $pointer:ty,
+        pinned: $pinned:ty,
+        attributes: [
+            $($name:ident: $attr:literal,)*
+        ],
+    ) => {
+        $crate::configfs_attrs!(
+            count:
+            @container($container),
+            @child($child, $pointer, $pinned),
+            @no_child(),
+            @attrs($($name $attr)*),
+            @eat($($name $attr,)*),
+            @assign(),
+            @cnt(0usize),
+        )
+    };
+    (count:
+     @container($container:ty),
+     @child($($child:ty, $pointer:ty, $pinned:ty)?),
+     @no_child($($no_child:ident)?),
+     @attrs($($aname:ident $aattr:literal)*),
+     @eat($name:ident $attr:literal, $($rname:ident $rattr:literal,)*),
+     @assign($($assign:block)*),
+     @cnt($cnt:expr),
+    ) => {
+        $crate::configfs_attrs!(
+            count:
+            @container($container),
+            @child($($child, $pointer, $pinned)?),
+            @no_child($($no_child)?),
+            @attrs($($aname $aattr)*),
+            @eat($($rname $rattr,)*),
+            @assign($($assign)* {
+                const N: usize = $cnt;
+                // SAFETY: We are expanding `configfs_attrs`.
+                unsafe {
+                    $crate::macros::paste!( [< $container:upper _ATTRS >])
+                        .add::<N, $attr, _>(
+                            & $crate::macros::paste!( [< $container:upper _ $name:upper _ATTR >])
+                        )
+                };
+            }),
+            @cnt(1usize + $cnt),
+        )
+    };
+    (count:
+     @container($container:ty),
+     @child($($child:ty, $pointer:ty, $pinned:ty)?),
+     @no_child($($no_child:ident)?),
+     @attrs($($aname:ident $aattr:literal)*),
+     @eat(),
+     @assign($($assign:block)*),
+     @cnt($cnt:expr),
+    ) =>
+    {
+        $crate::configfs_attrs!(final:
+                                @container($container),
+                                @child($($child, $pointer, $pinned)?),
+                                @no_child($($no_child)?),
+                                @attrs($($aname $aattr)*),
+                                @assign($($assign)*),
+                                @cnt($cnt),
+        )
+    };
+    (final:
+     @container($container:ty),
+     @child($($child:ty, $pointer:ty, $pinned:ty)?),
+     @no_child($($no_child:ident)?),
+     @attrs($($name:ident $attr:literal)*),
+     @assign($($assign:block)*),
+     @cnt($cnt:expr),
+    ) =>
+    {
+        {
+            $(
+                $crate::macros::paste!{
+                    // SAFETY: We are expanding `configfs_attrs`.
+                    static [< $container:upper _ $name:upper _ATTR >]:
+                      $crate::configfs::Attribute<$attr, $container, $container> =
+                        unsafe {
+                            $crate::configfs::Attribute::new(c_str!(::core::stringify!($name)))
+                        };
+                }
+            )*
+
+
+            const N: usize = $cnt + 1usize;
+            $crate::macros::paste!{
+                // SAFETY: We are expanding `configfs_attrs`.
+                static [< $container:upper _ATTRS >]:
+                  $crate::configfs::AttributeList<N, $container> =
+                    unsafe { $crate::configfs::AttributeList::new() };
+            }
+
+            $($assign)*
+
+            $(
+                $crate::macros::paste!{
+                    const [<$no_child:upper>]: bool = true;
+                };
+
+                $crate::macros::paste!{
+                    static [< $container:upper _TPE >] : $crate::configfs::ItemType<$container>  =
+                        $crate::configfs::ItemType::new::<N>(
+                            &THIS_MODULE, &[<$ container:upper _ATTRS >]
+                        );
+                }
+            )?
+
+            $(
+                $crate::macros::paste!{
+                    static [< $container:upper _TPE >]:
+                      $crate::configfs::ItemType<$container>  =
+                        $crate::configfs::ItemType::new_with_child_ctor::
+                    <N, $container, $child, $pointer, $pinned>(
+                        &THIS_MODULE, &[<$ container:upper _ATTRS >]
+                    );
+                }
+            )?
+
+            &$crate::macros::paste!( [< $container:upper _TPE >] )
+        }
+    };
+
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 545d1170ee6358e185b48ce10493fc61c646155c..91f05cf54db0ea83f27837c4c3a80cf48c5158da 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -19,6 +19,7 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
 #![feature(inline_const)]
 #![feature(lint_reasons)]
+#![cfg_attr(not(CONFIG_RUSTC_HAS_CONST_MUT_REFS_MERGED), feature(const_mut_refs))]
 
 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.
@@ -35,6 +36,8 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+#[cfg(CONFIG_CONFIGFS_FS)]
+pub mod configfs;
 pub mod cred;
 pub mod device;
 pub mod error;
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index b0f74a81c8f9ad24c9dc1ca057f83531156084aa..ba540a167ebf49853f377f09374bba0c6facee8c 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -30,6 +30,17 @@ config SAMPLE_RUST_PRINT
 
 	  If unsure, say N.
 
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
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index c1a5c16553955b1cfc59d77e85e1d60b06242967..2b2621046f10609321b76cad3c7f327bafc802c0 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -3,6 +3,7 @@ ccflags-y += -I$(src)				# needed for trace events
 
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
 
diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a77fe292d1b6c775210abb31d706519de2ab125a
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
+use kernel::prelude::*;
+use kernel::sync::Arc;
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
+    bar: Mutex<(KBox<[u8; 4096]>, usize)>,
+}
+
+impl Configuration {
+    fn new() -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            message: c_str!("Hello World\n"),
+            bar <- new_mutex!((KBox::new([0;4096], flags::GFP_KERNEL)?,0)),
+        })
+    }
+}
+
+impl kernel::InPlaceModule for RustConfigfs {
+    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
+        pr_info!("Rust configfs sample (init)\n");
+
+        let item_type = configfs_attrs! {
+            container: Configuration,
+            child: Child,
+            pointer: Arc<configfs::Group<Child>>,
+            pinned: Arc<configfs::Group<Child>>,
+            attributes: [
+                message: 0,
+                bar: 1,
+            ],
+        };
+
+        try_pin_init!(Self {
+            config <- configfs::Subsystem::new(
+                kernel::c_str!("rust_configfs"), item_type, Configuration::new()
+            ),
+        })
+    }
+}
+
+#[vtable]
+impl configfs::GroupOperations for Configuration {
+    type Parent = Self;
+    type Child = Child;
+    type ChildPointer = Arc<configfs::Group<Child>>;
+    type PinChildPointer = Arc<configfs::Group<Child>>;
+
+    fn make_group(
+        _this: &Self,
+        name: &CStr,
+    ) -> Result<impl PinInit<configfs::Group<Child>, Error>> {
+        let tpe = configfs_attrs! {
+            container: Child,
+            child: GrandChild,
+            pointer: Arc<configfs::Group<GrandChild>>,
+            pinned: Arc<configfs::Group<GrandChild>>,
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
+    fn show(container: &Configuration, page: &mut [u8; 4096]) -> Result<usize> {
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
+    fn show(container: &Configuration, page: &mut [u8; 4096]) -> Result<usize> {
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
+    type Parent = Self;
+    type Child = GrandChild;
+    type ChildPointer = Arc<configfs::Group<GrandChild>>;
+    type PinChildPointer = Arc<configfs::Group<GrandChild>>;
+
+    fn make_group(
+        _this: &Self,
+        name: &CStr,
+    ) -> Result<impl PinInit<configfs::Group<GrandChild>, Error>> {
+        let tpe = configfs_attrs! {
+            container: GrandChild,
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
+    fn show(_container: &Child, page: &mut [u8; 4096]) -> Result<usize> {
+        pr_info!("Show baz\n");
+        let data = c"Hello Baz\n".to_bytes();
+        page[0..data.len()].copy_from_slice(data);
+        Ok(data.len())
+    }
+}
+
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
+    fn show(_container: &GrandChild, page: &mut [u8; 4096]) -> Result<usize> {
+        pr_info!("Show baz\n");
+        let data = c"Hello GC\n".to_bytes();
+        page[0..data.len()].copy_from_slice(data);
+        Ok(data.len())
+    }
+}

-- 
2.47.0


