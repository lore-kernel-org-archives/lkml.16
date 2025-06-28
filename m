Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9576623313E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751106381; cv=none; b=PkBOvae8ZJObwJjR+zKy5Z9w1I/9b8yedXAAcvVTdTS4UImHLoz2btdPXRQNPGS4HQPBBGZn305f8Q/UoA7uOrAz7g3vuv//dp97tw32fexXQxxa/DSJcguAw9lGg4Uxwb/A3w6bxhAdG5QkU7oyeW8B9kVkZ8MkaX0pOt01pUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751106381; c=relaxed/simple;
	bh=BQSKhNT8Rw4EJx4HfiqyQ0cJMICt7sK1eiY9Zem9N9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Apk4Dm5cWe4VCkupuoCk9cVL2rosGxoRiSLhTIJ7cVgqKwhxNdivqUPAAVVgm0Kxjv21fGmSNbrW/KidzpgP0OUTCkKkR5lE2nPZ7JNqqUbqR+NJo37HOX1i18Bfut65Fzuy2Jo7rQ2b+JD/EhG3Vka+ZRLaeS4AI7oc1ikc2ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=HVm6M2aL; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=50Nca+fz; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="HVm6M2aL";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="50Nca+fz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751106376; x=1751711176;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=e7OFYRStytxd8Whe4eCeFCBlvkMdhmB5TspEZhahhgg=;
	b=HVm6M2aLeqjQ221hWwXOAEKW/ApfNWub6cuEClecQKM7A9O/aMumBWURZ0AB1jV0WI0aoC9l+eS1v
	 8NF8nVh/qvC67uRTvZmxJxm1Iv5fjFtBjk8iXhMi9vNgd2c/PDbzetgKX01vCTVGu5s40DQAkhWl6e
	 XuMdUORxje37M0c4OZtK0syUDyvka1tCRIx8F8nC9Y0nnKANZjSc34V30yKkh0BivzNJ5BT+xFM01e
	 P0rTDhUdIwTqRcEuBBvz+60IYeMpQRpY6JMta3Wg995e71QlbrH/mkXYholqXWivFJC2c+qXfHeAI4
	 GcHqlmIqmXiW0p4a7wDcG0nOiT3g77A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751106376; x=1751711176;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=e7OFYRStytxd8Whe4eCeFCBlvkMdhmB5TspEZhahhgg=;
	b=50Nca+fzb0wFHPT2wt+wp30wSPsiTApV00BjbCDof9pid25ZiwzfZD2sUM76FDM9Y0fpujU04kMMM
	 8lJBVJtBg==
X-HalOne-ID: 5164ff25-540a-11f0-bd12-f78b1f841584
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 5164ff25-540a-11f0-bd12-f78b1f841584;
	Sat, 28 Jun 2025 10:26:15 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v8 3/4] rust: add support for NUMA ids in allocations
Date: Sat, 28 Jun 2025 12:26:11 +0200
Message-Id: <20250628102611.2542910-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250628102315.2542656-1-vitaly.wool@konsulko.se>
References: <20250628102315.2542656-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new type to support specifying NUMA identifiers in Rust
allocators and extend the allocators to have NUMA id as a
parameter. Thus, modify ReallocFunc to use the new extended realloc
primitives from the C side of the kernel (i. e.
k[v]realloc_node_align/vrealloc_node_align) and add the new function
alloc_node to the Allocator trait while keeping the existing one
(alloc) for backward compatibility.

This will allow to specify node to use for allocation of e. g.
{KV}Box, as well as for future NUMA aware users of the API.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 rust/helpers/slab.c            |  8 ++--
 rust/helpers/vmalloc.c         |  4 +-
 rust/kernel/alloc.rs           | 77 ++++++++++++++++++++++++++++++++--
 rust/kernel/alloc/allocator.rs | 42 +++++++++++--------
 4 files changed, 104 insertions(+), 27 deletions(-)

diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
index a842bfbddcba..8472370a4338 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -3,13 +3,13 @@
 #include <linux/slab.h>
 
 void * __must_check __realloc_size(2)
-rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
+rust_helper_krealloc_node(const void *objp, size_t new_size, gfp_t flags, int node)
 {
-	return krealloc(objp, new_size, flags);
+	return krealloc_node(objp, new_size, flags, node);
 }
 
 void * __must_check __realloc_size(2)
-rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
+rust_helper_kvrealloc_node(const void *p, size_t size, gfp_t flags, int node)
 {
-	return kvrealloc(p, size, flags);
+	return kvrealloc_node(p, size, flags, node);
 }
diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
index 80d34501bbc0..62d30db9a1a6 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -3,7 +3,7 @@
 #include <linux/vmalloc.h>
 
 void * __must_check __realloc_size(2)
-rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
+rust_helper_vrealloc_node(const void *p, size_t size, gfp_t flags, int node)
 {
-	return vrealloc(p, size, flags);
+	return vrealloc_node(p, size, flags, node);
 }
diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index a2c49e5494d3..8d2b046bf947 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -28,7 +28,9 @@
 /// Indicates an allocation error.
 #[derive(Copy, Clone, PartialEq, Eq, Debug)]
 pub struct AllocError;
+
 use core::{alloc::Layout, ptr::NonNull};
+use crate::error::{code::EINVAL, Result};
 
 /// Flags to be used when allocating memory.
 ///
@@ -115,6 +117,30 @@ pub mod flags {
     pub const __GFP_NOWARN: Flags = Flags(bindings::__GFP_NOWARN);
 }
 
+/// Non Uniform Memory Access (NUMA) node identifier
+#[derive(Clone, Copy, PartialEq)]
+pub struct NumaNode(i32);
+
+impl NumaNode {
+    /// create a new NUMA node identifer (non-negative integer)
+    /// returns EINVAL if a negative id is specified
+    pub fn new(node: i32) -> Result<Self> {
+        if node < 0 {
+            return Err(EINVAL);
+        }
+        Ok(Self(node))
+    }
+}
+
+/// Specify necessary constant to pass the information to Allocator that the caller doesn't care
+/// about the NUMA node to allocate memory from
+pub mod numa {
+    use super::NumaNode;
+
+    /// No preference for NUMA node
+    pub const NUMA_NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
+}
+
 /// The kernel's [`Allocator`] trait.
 ///
 /// An implementation of [`Allocator`] can allocate, re-allocate and free memory buffers described
@@ -148,7 +174,7 @@ pub unsafe trait Allocator {
     ///
     /// When the return value is `Ok(ptr)`, then `ptr` is
     /// - valid for reads and writes for `layout.size()` bytes, until it is passed to
-    ///   [`Allocator::free`] or [`Allocator::realloc`],
+    ///   [`Allocator::free`], [`Allocator::realloc`] or [`Allocator::realloc_node`],
     /// - aligned to `layout.align()`,
     ///
     /// Additionally, `Flags` are honored as documented in
@@ -159,7 +185,36 @@ fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
         unsafe { Self::realloc(None, layout, Layout::new::<()>(), flags) }
     }
 
-    /// Re-allocate an existing memory allocation to satisfy the requested `layout`.
+    /// Allocate memory based on `layout`, `flags` and `nid`.
+    ///
+    /// On success, returns a buffer represented as `NonNull<[u8]>` that satisfies the layout
+    /// constraints (i.e. minimum size and alignment as specified by `layout`).
+    ///
+    /// This function is equivalent to `realloc_node` when called with `None`.
+    ///
+    /// # Guarantees
+    ///
+    /// When the return value is `Ok(ptr)`, then `ptr` is
+    /// - valid for reads and writes for `layout.size()` bytes, until it is passed to
+    ///   [`Allocator::free`], [`Allocator::realloc`] or [`Allocator::realloc_node`],
+    /// - aligned to `layout.align()`,
+    ///
+    /// Additionally, `Flags` are honored as documented in
+    /// <https://docs.kernel.org/core-api/mm-api.html#mm-api-gfp-flags>.
+    fn alloc_node(layout: Layout, flags: Flags, nid: NumaNode)
+                -> Result<NonNull<[u8]>, AllocError> {
+        // SAFETY: Passing `None` to `realloc_node` is valid by its safety requirements and
+        // asks for a new memory allocation.
+        unsafe { Self::realloc_node(None, layout, Layout::new::<()>(), flags, nid) }
+    }
+
+    /// Re-allocate an existing memory allocation to satisfy the requested `layout` and
+    /// optionally a specific NUMA node request to allocate the memory for.
+    /// Systems employing a Non Uniform Memory Access (NUMA) architecture contain
+    /// collections of hardware resources including processors, memory, and I/O buses,
+    /// that comprise what is commonly known as a NUMA node.
+    /// `nid` stands for NUMA id, i. e. NUMA node identifier, which is a non-negative
+    /// integer if a node needs to be specified, or NUMA_NO_NODE if the caller doesn't care.
     ///
     /// If the requested size is zero, `realloc` behaves equivalent to `free`.
     ///
@@ -191,13 +246,29 @@ fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
     ///   and old size, i.e. `ret_ptr[0..min(layout.size(), old_layout.size())] ==
     ///   p[0..min(layout.size(), old_layout.size())]`.
     /// - when the return value is `Err(AllocError)`, then `ptr` is still valid.
-    unsafe fn realloc(
+    unsafe fn realloc_node(
         ptr: Option<NonNull<u8>>,
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: NumaNode,
     ) -> Result<NonNull<[u8]>, AllocError>;
 
+
+    /// Re-allocate an existing memory allocation to satisfy the requested `layout`. This
+    /// function works exactly as realloc_node() but it doesn't give the ability to specify
+    /// the NUMA node in the call.
+    unsafe fn realloc(
+        ptr: Option<NonNull<u8>>,
+        layout: Layout,
+        old_layout: Layout,
+        flags: Flags,
+    ) -> Result<NonNull<[u8]>, AllocError> {
+        // SAFETY: guaranteed by realloc_node()
+        unsafe { Self::realloc_node(ptr, layout, old_layout, flags, numa::NUMA_NO_NODE) }
+    }
+
+
     /// Free an existing memory allocation.
     ///
     /// # Safety
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index aa2dfa9dca4c..2e86e9839a1b 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -13,7 +13,7 @@
 use core::ptr;
 use core::ptr::NonNull;
 
-use crate::alloc::{AllocError, Allocator};
+use crate::alloc::{AllocError, Allocator, NumaNode};
 use crate::bindings;
 use crate::pr_warn;
 
@@ -58,18 +58,20 @@ fn aligned_size(new_layout: Layout) -> usize {
 ///
 /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
 struct ReallocFunc(
-    unsafe extern "C" fn(*const crate::ffi::c_void, usize, u32) -> *mut crate::ffi::c_void,
+    unsafe extern "C" fn(
+        *const crate::ffi::c_void, usize,  u32, crate::ffi::c_int,
+    ) -> *mut crate::ffi::c_void,
 );
 
 impl ReallocFunc {
-    // INVARIANT: `krealloc` satisfies the type invariants.
-    const KREALLOC: Self = Self(bindings::krealloc);
+    // INVARIANT: `krealloc_node` satisfies the type invariants.
+    const KREALLOC: Self = Self(bindings::krealloc_node);
 
-    // INVARIANT: `vrealloc` satisfies the type invariants.
-    const VREALLOC: Self = Self(bindings::vrealloc);
+    // INVARIANT: `vrealloc_node` satisfies the type invariants.
+    const VREALLOC: Self = Self(bindings::vrealloc_node);
 
-    // INVARIANT: `kvrealloc` satisfies the type invariants.
-    const KVREALLOC: Self = Self(bindings::kvrealloc);
+    // INVARIANT: `kvrealloc_node` satisfies the type invariants.
+    const KVREALLOC: Self = Self(bindings::kvrealloc_node);
 
     /// # Safety
     ///
@@ -87,6 +89,7 @@ unsafe fn call(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: NumaNode,
     ) -> Result<NonNull<[u8]>, AllocError> {
         let size = aligned_size(layout);
         let ptr = match ptr {
@@ -110,7 +113,7 @@ unsafe fn call(
         // - Those functions provide the guarantees of this function.
         let raw_ptr = unsafe {
             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
-            self.0(ptr.cast(), size, flags.0).cast()
+            self.0(ptr.cast(), size, flags.0, nid.0).cast()
         };
 
         let ptr = if size == 0 {
@@ -123,34 +126,36 @@ unsafe fn call(
     }
 }
 
-// SAFETY: `realloc` delegates to `ReallocFunc::call`, which guarantees that
+// SAFETY: `realloc_node` delegates to `ReallocFunc::call`, which guarantees that
 // - memory remains valid until it is explicitly freed,
 // - passing a pointer to a valid memory allocation is OK,
 // - `realloc` satisfies the guarantees, since `ReallocFunc::call` has the same.
 unsafe impl Allocator for Kmalloc {
     #[inline]
-    unsafe fn realloc(
+    unsafe fn realloc_node(
         ptr: Option<NonNull<u8>>,
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: NumaNode,
     ) -> Result<NonNull<[u8]>, AllocError> {
         // SAFETY: `ReallocFunc::call` has the same safety requirements as `Allocator::realloc`.
-        unsafe { ReallocFunc::KREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::KREALLOC.call(ptr, layout, old_layout, flags, nid) }
     }
 }
 
-// SAFETY: `realloc` delegates to `ReallocFunc::call`, which guarantees that
+// SAFETY: `realloc_node` delegates to `ReallocFunc::call`, which guarantees that
 // - memory remains valid until it is explicitly freed,
 // - passing a pointer to a valid memory allocation is OK,
 // - `realloc` satisfies the guarantees, since `ReallocFunc::call` has the same.
 unsafe impl Allocator for Vmalloc {
     #[inline]
-    unsafe fn realloc(
+    unsafe fn realloc_node(
         ptr: Option<NonNull<u8>>,
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: NumaNode,
     ) -> Result<NonNull<[u8]>, AllocError> {
         // TODO: Support alignments larger than PAGE_SIZE.
         if layout.align() > bindings::PAGE_SIZE {
@@ -160,21 +165,22 @@ unsafe fn realloc(
 
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags, nid) }
     }
 }
 
-// SAFETY: `realloc` delegates to `ReallocFunc::call`, which guarantees that
+// SAFETY: `realloc_node` delegates to `ReallocFunc::call`, which guarantees that
 // - memory remains valid until it is explicitly freed,
 // - passing a pointer to a valid memory allocation is OK,
 // - `realloc` satisfies the guarantees, since `ReallocFunc::call` has the same.
 unsafe impl Allocator for KVmalloc {
     #[inline]
-    unsafe fn realloc(
+    unsafe fn realloc_node(
         ptr: Option<NonNull<u8>>,
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: NumaNode,
     ) -> Result<NonNull<[u8]>, AllocError> {
         // TODO: Support alignments larger than PAGE_SIZE.
         if layout.align() > bindings::PAGE_SIZE {
@@ -184,6 +190,6 @@ unsafe fn realloc(
 
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags, nid) }
     }
 }
-- 
2.39.2

