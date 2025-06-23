Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AD8221FD2;
	Mon, 23 Jun 2025 21:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750714368; cv=pass; b=ufQ2JuVOXrVkwjQD9l2iGxbT47+Fn7KiI/OBPh2CyTMoUjfgI+dtE8ACclrXNR6JBkKb1awUv4iQ+P0dSEv3GuU9THGElx68tm9Lbwy9hk8fxm77njdibDnpFN2me2IZU9aa2BmxsMKh7hNBd1gxqkwmyH91yTAOaPJuphuP0/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750714368; c=relaxed/simple;
	bh=oximUYWIsV+5f0nj/vMo55JEzcH/KkyfzNtAT2jxPdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iPuK/RSwTpiZCWwTQnyahxr3C6qCchE3SUOMqtD9z6gAbyHx3UoSdaLUx5SpLJ9BpASwf9RSW5Sd3FhP/wVuNXpw5rP179on5Cf4hD4qIKnt5qRIGKt88dbtsd5jIjSuUxRViuYf6m2XCwGsbEYRBF76h7bdMlWNv45ciL1Y4dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Pd4EESow; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Pd4EESow"
ARC-Seal: i=1; a=rsa-sha256; t=1750714336; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DOzmQS4HL5duIRpqkP2L1TO221akN3+BgR/sQshYXjc0ZykAbOGkE/QmjXr2CA7sLKvFwJjj4oE65tW1plRbYGnlJw8FV3U47GVZif+nfTHI3SVQiA4mP9UlvBHrDiEfd9yPm0WfYDS4eDUWBb1OxeHn/CmYhVft0I7FBf3Am4I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750714336; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AdBywMSi2zUNfzPrJYZf6MUMtQ6hq9JkTejSCSLDtjk=; 
	b=E+3OjWNF1IymmVB2H2hA/MUklDqDtr0AH0ZM+j58Q1ztML9LyoF6wx46rGo/jGYnQWmapePT43Cc02Wf0cNz3GGItpUVyTIhiZD+WOuXSngyRlQsnzibTmDpau+gGHQ6hQYqWJ40XP1xFmvFDpXsm0pwiohP/MVzGm8Zyw/p/+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750714336;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=AdBywMSi2zUNfzPrJYZf6MUMtQ6hq9JkTejSCSLDtjk=;
	b=Pd4EESow0uVuti3PG88SqbZWkBwwhXsp5GWalYxiMsMa8XIiSnbtgNitnUzEqLLX
	k6ZNGwnY01W2RdpmJB/AeODi+vqh4XJZc6AjsWWKcRzXQ481nTUzRjAEqNmb8FBsG5b
	tRyfwtgRfKKMB09YqjMV5Uu/yXlD9UZ2ZiM8r6t0=
Received: by mx.zohomail.com with SMTPS id 17507143342501016.53061496044;
	Mon, 23 Jun 2025 14:32:14 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Jun 2025 18:31:57 -0300
Subject: [PATCH v2] rust: io_pgtable: Add io_pgtable abstraction
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-io_pgtable-v2-1-fd72daac75f1@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMzHWWgC/03MywqDMBCF4VeRWTclE2+tq75HkRLjqAPWSCKhR
 fLuTYVCl/+B8+3gyTF5aLIdHAX2bJcU6pSBmfQykuA+NSipSpmrQrB9rOOmu5kE9b0qDZKRlYJ
 0WB0N/Dqwe5t6Yr9Z9z7sgN/1x1T/TECBYsC8riReL/VQ3IydZ91Zp8/GPqGNMX4AEt+dXqgAA
 AA=
X-Change-ID: 20250324-io_pgtable-edd25c1ec062
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Asahi Lina <lina+kernel@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Asahi Lina <lina+kernel@asahilina.net>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

From: Asahi Lina <lina+kernel@asahilina.net>

The io_pgtable subsystem implements page table management for various
IOMMU page table formats. This abstraction provides a bare minimum
feature-set, enough to map and unmap pages as needed.

This abstraction will be used by some upcoming GPU drivers in order to map
and unmap iova ranges, which in turn is used by a lot of other GPU
operations.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
Changes in v2:
- Rebase on rust-next
- Use Opaque<T> where applicable
- Use .cast() as applicable
- Slightly reword commit message
- cc more people
- Link to v1: https://lore.kernel.org/r/20250326-io_pgtable-v1-1-f137601987f4@collabora.com
---
 rust/bindings/bindings_helper.h |   4 +-
 rust/kernel/io_pgtable.rs       | 389 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 3 files changed, 393 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 8cbb660e2ec218021d16e6e0144acf6f4d7cca13..2b8cde31fb4401a4522c1c25ccf5a3bbbab3a1ff 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -52,6 +52,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/io-pgtable.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/mdio.h>
@@ -89,7 +90,8 @@ const gfp_t RUST_CONST_HELPER_GFP_NOWAIT = GFP_NOWAIT;
 const gfp_t RUST_CONST_HELPER___GFP_ZERO = __GFP_ZERO;
 const gfp_t RUST_CONST_HELPER___GFP_HIGHMEM = ___GFP_HIGHMEM;
 const gfp_t RUST_CONST_HELPER___GFP_NOWARN = ___GFP_NOWARN;
-const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL = BLK_FEAT_ROTATIONAL;
+const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL =
+	BLK_FEAT_ROTATIONAL;
 const fop_flags_t RUST_CONST_HELPER_FOP_UNSIGNED_OFFSET = FOP_UNSIGNED_OFFSET;
 
 const xa_mark_t RUST_CONST_HELPER_XA_PRESENT = XA_PRESENT;
diff --git a/rust/kernel/io_pgtable.rs b/rust/kernel/io_pgtable.rs
new file mode 100644
index 0000000000000000000000000000000000000000..ff2c01b92d07d6825d0633cec13dac1d034745df
--- /dev/null
+++ b/rust/kernel/io_pgtable.rs
@@ -0,0 +1,389 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! IOMMU page table management.
+//!
+//! C header: [`include/io-pgtable.h`](srctree/include/io-pgtable.h)
+
+use crate::bindings;
+use crate::types::Opaque;
+use core::marker::PhantomData;
+use core::mem;
+use core::num::NonZeroU64;
+
+use crate::device;
+use crate::error::code::*;
+use crate::error::to_result;
+use crate::error::Result;
+use crate::types::ForeignOwnable;
+use crate::types::ScopeGuard;
+
+/// Protection flags used with IOMMU mappings.
+pub mod prot {
+    /// Read access.
+    pub const READ: u32 = bindings::IOMMU_READ;
+    /// Write access.
+    pub const WRITE: u32 = bindings::IOMMU_WRITE;
+    /// Request cache coherency.
+    pub const CACHE: u32 = bindings::IOMMU_CACHE;
+    /// Request no-execute permission.
+    pub const NOEXEC: u32 = bindings::IOMMU_NOEXEC;
+    /// MMIO peripheral mapping.
+    pub const MMIO: u32 = bindings::IOMMU_MMIO;
+    /// Privileged mapping.
+    pub const PRIV: u32 = bindings::IOMMU_PRIV;
+}
+
+/// Represents a requested io_pgtable configuration.
+pub struct Config {
+    /// Quirk bitmask (type-specific).
+    pub quirks: usize,
+    /// Valid page sizes, as a bitmask of powers of two.
+    pub pgsize_bitmap: usize,
+    /// Input address space size in bits.
+    pub ias: usize,
+    /// Output address space size in bits.
+    pub oas: usize,
+    /// IOMMU uses coherent accesses for page table walks.
+    pub coherent_walk: bool,
+}
+
+/// `IOMMU` callbacks for `TLB` and page table management.
+///
+/// Users must implement this trait to perform the `TLB` flush actions for this
+/// `IOMMU`, if required.
+pub trait FlushOps {
+    /// User-specified type owned by the [`IOPagetable`] that will be passed to TLB
+    /// operations.
+    type Data: ForeignOwnable + Send + Sync;
+
+    /// Synchronously invalidate the entire TLB context.
+    fn tlb_flush_all(data: <Self::Data as ForeignOwnable>::Borrowed<'_>);
+
+    /// Synchronously invalidate all intermediate TLB state (sometimes referred
+    /// to as the "walk cache") for a virtual address range.
+    fn tlb_flush_walk(
+        data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+        iova: usize,
+        size: usize,
+        granule: usize,
+    );
+
+    /// Optional callback to queue up leaf TLB invalidation for a single page.
+    ///
+    /// IOMMUs that cannot batch TLB invalidation operations efficiently will
+    /// typically issue them here, but others may decide to update the
+    /// iommu_iotlb_gather structure and defer the invalidation until
+    /// iommu_iotlb_sync() instead.
+    ///
+    // TODO: Implement the gather argument for batching.
+    fn tlb_add_page(
+        data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+        iova: usize,
+        granule: usize,
+    );
+}
+
+/// Inner page table information that is shared across all table types.
+///
+/// # Invariants
+///
+/// - [`self.ops`] is valid and non-null.
+/// - [`self.cfg`] is valid.
+/// - [`self.data`] is valid and points to the data passed to `IoPageTable::new_fmt`.
+#[doc(hidden)]
+pub struct IoPageTableInner {
+    ops: *mut bindings::io_pgtable_ops,
+    cfg: Opaque<bindings::io_pgtable_cfg>,
+    data: *mut core::ffi::c_void,
+}
+
+/// Helper trait to get the config type for a single page table type from the union.
+pub trait GetConfig {
+    /// Returns the specific output configuration for this page table type.
+    fn cfg(iopt: &impl IoPageTable) -> &Self
+    where
+        Self: Sized;
+}
+
+mod private {
+    pub trait Sealed {}
+}
+
+/// A generic IOMMU page table
+pub trait IoPageTable: private::Sealed {
+    #[doc(hidden)]
+    const FLUSH_OPS: bindings::iommu_flush_ops;
+
+    #[doc(hidden)]
+    fn new_fmt<T: FlushOps>(
+        dev: &device::Device,
+        format: u32,
+        config: Config,
+        data: T::Data,
+    ) -> Result<IoPageTableInner> {
+        let ptr: *mut core::ffi::c_void = data.into_foreign().cast();
+        let guard = ScopeGuard::new(|| {
+            // SAFETY: `ptr` came from a previous call to `into_foreign`.
+            unsafe { T::Data::from_foreign(ptr.cast()) };
+        });
+
+        // SAFETY: this type was manually checked to be valid to zero-initialize.
+        let __bindgen_anon_1 = unsafe { mem::zeroed() };
+
+        let mut raw_cfg = bindings::io_pgtable_cfg {
+            quirks: config.quirks,
+            pgsize_bitmap: config.pgsize_bitmap,
+            ias: config.ias.try_into()?,
+            oas: config.oas.try_into()?,
+            coherent_walk: config.coherent_walk,
+            tlb: &Self::FLUSH_OPS,
+            iommu_dev: dev.as_raw(),
+            alloc: None,
+            free: None,
+            __bindgen_anon_1,
+        };
+
+        // SAFETY: there are no specific safety requirements for this call. We
+        // simply make sure that all the arguments are valid.
+        let ops = unsafe {
+            bindings::alloc_io_pgtable_ops(
+                format as bindings::io_pgtable_fmt,
+                &mut raw_cfg,
+                ptr.cast(),
+            )
+        };
+
+        if ops.is_null() {
+            return Err(EINVAL);
+        }
+
+        guard.dismiss();
+        Ok(IoPageTableInner {
+            ops,
+            cfg: Opaque::new(raw_cfg),
+            data: ptr,
+        })
+    }
+
+    /// Map a range of pages.
+    fn map_pages(
+        &mut self,
+        iova: usize,
+        paddr: usize,
+        pgsize: usize,
+        pgcount: usize,
+        prot: u32,
+    ) -> Result<usize> {
+        let mut mapped: usize = 0;
+
+        // SAFETY: `self.ops` is valid as per the invariant of `IoPageTableInner`.
+        to_result(unsafe {
+            (*self.inner_mut().ops).map_pages.unwrap()(
+                self.inner_mut().ops,
+                iova,
+                paddr as u64,
+                pgsize,
+                pgcount,
+                prot as i32,
+                bindings::GFP_KERNEL,
+                &mut mapped,
+            )
+        })?;
+
+        Ok(mapped)
+    }
+
+    /// Unmap a range of pages.
+    fn unmap_pages(
+        &mut self,
+        iova: usize,
+        pgsize: usize,
+        pgcount: usize,
+        // TODO: gather: *mut iommu_iotlb_gather,
+    ) -> usize {
+        // SAFETY: `self.ops` is valid as per the invariants of `IoPageTableInner`.
+        unsafe {
+            (*self.inner_mut().ops).unmap_pages.unwrap()(
+                self.inner_mut().ops,
+                iova,
+                pgsize,
+                pgcount,
+                core::ptr::null_mut(),
+            )
+        }
+    }
+
+    /// Translate an IOVA to the corresponding physical address, if mapped.
+    fn iova_to_phys(&mut self, iova: usize) -> Option<NonZeroU64> {
+        // SAFETY: `self.ops` is valid as per the invariants of `IoPageTableInner`.
+        let iova_to_phys =
+            unsafe { (*self.inner_mut().ops).iova_to_phys.unwrap()(self.inner_mut().ops, iova) };
+
+        NonZeroU64::new(iova_to_phys)
+    }
+
+    #[doc(hidden)]
+    fn inner_mut(&mut self) -> &mut IoPageTableInner;
+
+    #[doc(hidden)]
+    fn inner(&self) -> &IoPageTableInner;
+
+    #[doc(hidden)]
+    fn raw_cfg(&self) -> &bindings::io_pgtable_cfg {
+        // SAFETY: It is valid to manufacture a reference here.
+        unsafe { &*self.inner().cfg.get() }
+    }
+}
+
+/// # Safety
+///
+/// This function is only safe to be called by the IOMMU C code.
+unsafe extern "C" fn tlb_flush_all_callback<T: FlushOps>(cookie: *mut core::ffi::c_void) {
+    // SAFETY:
+    //
+    // - `cookie` was passed to `into_foreign()` in `IoPageTable::new_fmt`.
+    // - We do not overlap with any call to borrow() or borrow_mut().
+    T::tlb_flush_all(unsafe { T::Data::borrow(cookie.cast()) });
+}
+
+/// # Safety
+///
+/// This function is only safe to be called by the IOMMU C code.
+unsafe extern "C" fn tlb_flush_walk_callback<T: FlushOps>(
+    iova: usize,
+    size: usize,
+    granule: usize,
+    cookie: *mut core::ffi::c_void,
+) {
+    // SAFETY:
+    //
+    // - `cookie` was passed to `into_foreign()` in `IoPageTable::new_fmt`.
+    // - We do not overlap with any call to borrow() or borrow_mut().
+    T::tlb_flush_walk(
+        unsafe { T::Data::borrow(cookie.cast()) },
+        iova,
+        size,
+        granule,
+    );
+}
+
+/// # Safety
+///
+/// This function is only safe to be called by the IOMMU C code.
+unsafe extern "C" fn tlb_add_page_callback<T: FlushOps>(
+    _gather: *mut bindings::iommu_iotlb_gather,
+    iova: usize,
+    granule: usize,
+    cookie: *mut core::ffi::c_void,
+) {
+    // SAFETY:
+    //
+    // - `cookie` was passed to `into_foreign()` in `IoPageTable::new_fmt`.
+    // - We do not overlap with any call to borrow() or borrow_mut().
+    T::tlb_add_page(unsafe { T::Data::borrow(cookie.cast()) }, iova, granule);
+}
+
+macro_rules! iopt_cfg {
+    ($name:ident, $field:ident, $type:ident) => {
+        /// An IOMMU page table configuration for a specific kind of pagetable.
+        pub type $name = bindings::$type;
+
+        impl GetConfig for $name {
+            fn cfg(iopt: &impl IoPageTable) -> &$name {
+                // SAFETY: The very purpose of this macro is to provide a safe
+                // way to access the field by implementing GetConfig for a
+                // particular type.
+                unsafe { &iopt.raw_cfg().__bindgen_anon_1.$field }
+            }
+        }
+    };
+}
+
+macro_rules! iopt_type {
+    ($type:ident, $cfg:ty, $fmt:ident) => {
+        /// Represents an IOPagetable of this type.
+        pub struct $type<T: FlushOps>(IoPageTableInner, PhantomData<T>);
+
+        impl<T: FlushOps> $type<T> {
+            /// Creates a new IOPagetable implementation of this type.
+            pub fn new(dev: &device::Device, config: Config, data: T::Data) -> Result<Self> {
+                Ok(Self(
+                    <Self as IoPageTable>::new_fmt::<T>(dev, bindings::$fmt, config, data)?,
+                    PhantomData,
+                ))
+            }
+
+            /// Get the configuration for this IOPagetable.
+            pub fn cfg(&self) -> &$cfg {
+                <$cfg as GetConfig>::cfg(self)
+            }
+        }
+
+        impl<T: FlushOps> private::Sealed for $type<T> {}
+
+        impl<T: FlushOps> IoPageTable for $type<T> {
+            const FLUSH_OPS: bindings::iommu_flush_ops = bindings::iommu_flush_ops {
+                tlb_flush_all: Some(tlb_flush_all_callback::<T>),
+                tlb_flush_walk: Some(tlb_flush_walk_callback::<T>),
+                tlb_add_page: Some(tlb_add_page_callback::<T>),
+            };
+
+            fn inner(&self) -> &IoPageTableInner {
+                &self.0
+            }
+
+            fn inner_mut(&mut self) -> &mut IoPageTableInner {
+                &mut self.0
+            }
+        }
+
+        impl<T: FlushOps> Drop for $type<T> {
+            fn drop(&mut self) {
+                // SAFETY: The pointer is valid by the type invariant.
+                unsafe { bindings::free_io_pgtable_ops(self.0.ops) };
+
+                // Free context data.
+                //
+                // SAFETY: This matches the call to `into_foreign` from `new` in the success case.
+                unsafe { T::Data::from_foreign(self.0.data.cast()) };
+            }
+        }
+    };
+}
+
+iopt_cfg!(
+    ARMLPAES1Cfg,
+    arm_lpae_s1_cfg,
+    io_pgtable_cfg__bindgen_ty_1__bindgen_ty_1
+);
+iopt_cfg!(
+    ARMLPAES2Cfg,
+    arm_lpae_s2_cfg,
+    io_pgtable_cfg__bindgen_ty_1__bindgen_ty_2
+);
+iopt_cfg!(
+    ARMv7SCfg,
+    arm_v7s_cfg,
+    io_pgtable_cfg__bindgen_ty_1__bindgen_ty_3
+);
+iopt_cfg!(
+    ARMMaliLPAECfg,
+    arm_mali_lpae_cfg,
+    io_pgtable_cfg__bindgen_ty_1__bindgen_ty_4
+);
+iopt_cfg!(
+    AppleDARTCfg,
+    apple_dart_cfg,
+    io_pgtable_cfg__bindgen_ty_1__bindgen_ty_5
+);
+iopt_cfg!(AmdCfg, amd, io_pgtable_cfg__bindgen_ty_1__bindgen_ty_6);
+
+iopt_type!(ARM32LPAES1, ARMLPAES1Cfg, io_pgtable_fmt_ARM_32_LPAE_S1);
+iopt_type!(ARM32LPAES2, ARMLPAES2Cfg, io_pgtable_fmt_ARM_32_LPAE_S2);
+iopt_type!(ARM64LPAES1, ARMLPAES1Cfg, io_pgtable_fmt_ARM_64_LPAE_S1);
+iopt_type!(ARM64LPAES2, ARMLPAES2Cfg, io_pgtable_fmt_ARM_64_LPAE_S2);
+iopt_type!(ARMv7S, ARMv7SCfg, io_pgtable_fmt_ARM_V7S);
+iopt_type!(ARMMaliLPAE, ARMMaliLPAECfg, io_pgtable_fmt_ARM_MALI_LPAE);
+iopt_type!(AMDIOMMUV1, AmdCfg, io_pgtable_fmt_AMD_IOMMU_V1);
+iopt_type!(AppleDART, AppleDARTCfg, io_pgtable_fmt_APPLE_DART);
+iopt_type!(AppleDART2, AppleDARTCfg, io_pgtable_fmt_APPLE_DART2);
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..fcd1a97b32e9d8db92300ff6925a97cbeb0ffada 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -80,6 +80,7 @@
 pub mod fs;
 pub mod init;
 pub mod io;
+pub mod io_pgtable;
 pub mod ioctl;
 pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]

---
base-commit: dc35ddcf97e99b18559d0855071030e664aae44d
change-id: 20250324-io_pgtable-edd25c1ec062

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

