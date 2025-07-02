Received: from mailrelay5-3.pub.mailoutpod3-cph3.one.com (mailrelay5-3.pub.mailoutpod3-cph3.one.com [46.30.212.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C7C274FC6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472564; cv=none; b=qKDONXacZCXg7MFPM6LdgqkgVumoIv5AFUuRYn5nlpYI2n+3bvkkMSDTghu2xj2lO0K7mSAiPicurxJetIHDueXG9hzsODyP8mnIk5DCzHL/Ns99vPBLxJxhgXsNPCl+7IbkEW5rvHsR/Ugo9PjLuJ8CfvauFcu1asLzR6GaN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472564; c=relaxed/simple;
	bh=WtlIscCmmyHdw4d2Sw84+n10yjioxwr92xY4ConutKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PmOvM6aDERK7S/L5NY8d4eSXmYc3DOBtLLp5xcjmUg1ooxLk2POX2uU5C8BabmXXci+YTB8o2RNMVs0JaMVf+hEfpfUQ1JXLOGsnYhHx7sY4mCLUSJ0NkFqEZnui+FvfYTyW3eSbx4unMrYiqD3z9VcNILSprHqHX4P/DuUdGYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Cspe6/Wu; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=lVXTivcN; arc=none smtp.client-ip=46.30.212.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Cspe6/Wu";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="lVXTivcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751472553; x=1752077353;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=39Aelcqkm+vhkbXAOciY3LU2fUSU+HwremshsfOFB1w=;
	b=Cspe6/WuXV/PAFJnza7QvVDSJSyRg5Eym6siVKiDLcSvNPU6aWjC+NmOtdxo8nzby53eWAsr6/ZsT
	 SXPeftagK+BJjm4agajwMXYsqpe4c43l5oSfNlql3j/swf14LFgE75bjKD+QoFWtp34lbvrwV65XtR
	 T1w48YyeVzLEPByjC54aZbIh3M6y5trY+rwNKJ4p6ysy48leBbuHfcV3WKqyOYWmsBb0OLJOxR4WlU
	 gU4eKgpV8AoeMHa5OHf5TZJYZvrvDlj4o5hOOTMh2h3CGN3ICrzps1GU/an2IPIwLuFjXEgJ6Qoncj
	 zH0BZkrTbC+XCtrZpJXFeom0Z6THRFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751472553; x=1752077353;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=39Aelcqkm+vhkbXAOciY3LU2fUSU+HwremshsfOFB1w=;
	b=lVXTivcN/wVsF5LH1qS6G0Vn8Q/ww2Roq5l3H6tK7qUSpnsIMGah4BcHyhkjA0c+zMUHApaAjKS95
	 yYnSDzMBg==
X-HalOne-ID: e417e732-575e-11f0-bc18-d7c209f8bd06
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id e417e732-575e-11f0-bc18-d7c209f8bd06;
	Wed, 02 Jul 2025 16:09:12 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v10 3/4] rust: add support for NUMA ids in allocations
Date: Wed,  2 Jul 2025 18:09:10 +0200
Message-Id: <20250702160910.3610134-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250702160758.3609992-1-vitaly.wool@konsulko.se>
References: <20250702160758.3609992-1-vitaly.wool@konsulko.se>
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
 rust/kernel/alloc.rs           | 78 ++++++++++++++++++++++++++++++++--
 rust/kernel/alloc/allocator.rs | 45 ++++++++++++--------
 4 files changed, 108 insertions(+), 27 deletions(-)

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
index a2c49e5494d3..b178ebdf2d87 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -28,6 +28,8 @@
 /// Indicates an allocation error.
 #[derive(Copy, Clone, PartialEq, Eq, Debug)]
 pub struct AllocError;
+
+use crate::error::{code::EINVAL, Result};
 use core::{alloc::Layout, ptr::NonNull};
 
 /// Flags to be used when allocating memory.
@@ -115,6 +117,28 @@ pub mod flags {
     pub const __GFP_NOWARN: Flags = Flags(bindings::__GFP_NOWARN);
 }
 
+/// Non Uniform Memory Access (NUMA) node identifier
+#[derive(Clone, Copy, PartialEq)]
+pub struct NumaNode(i32);
+
+impl NumaNode {
+    /// create a new NUMA node identifer (non-negative integer)
+    /// returns EINVAL if a negative id or an id exceeding MAX_NUMNODES is specified
+    pub fn new(node: i32) -> Result<Self> {
+        // SAFETY: MAX_NUMNODES never exceeds 2**10 because NODES_SHIFT is 0..10
+        if node < 0 || node >= bindings::MAX_NUMNODES as i32 {
+            return Err(EINVAL);
+        }
+        Ok(Self(node))
+    }
+}
+
+/// Specify necessary constant to pass the information to Allocator that the caller doesn't care
+/// about the NUMA node to allocate memory from.
+impl NumaNode {
+    pub const NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
+}
+
 /// The kernel's [`Allocator`] trait.
 ///
 /// An implementation of [`Allocator`] can allocate, re-allocate and free memory buffers described
@@ -148,7 +172,7 @@ pub unsafe trait Allocator {
     ///
     /// When the return value is `Ok(ptr)`, then `ptr` is
     /// - valid for reads and writes for `layout.size()` bytes, until it is passed to
-    ///   [`Allocator::free`] or [`Allocator::realloc`],
+    ///   [`Allocator::free`], [`Allocator::realloc`] or [`Allocator::realloc_node`],
     /// - aligned to `layout.align()`,
     ///
     /// Additionally, `Flags` are honored as documented in
@@ -159,7 +183,41 @@ fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
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
+    fn alloc_node(
+        layout: Layout,
+        flags: Flags,
+        nid: NumaNode,
+    ) -> Result<NonNull<[u8]>, AllocError> {
+        // SAFETY: Passing `None` to `realloc_node` is valid by its safety requirements and
+        // asks for a new memory allocation.
+        unsafe { Self::realloc_node(None, layout, Layout::new::<()>(), flags, nid) }
+    }
+
+    /// Re-allocate an existing memory allocation to satisfy the requested `layout` and
+    /// a specific NUMA node request to allocate the memory for.
+    ///
+    /// Systems employing a Non Uniform Memory Access (NUMA) architecture contain collections of
+    /// hardware resources including processors, memory, and I/O buses, that comprise what is
+    /// commonly known as a NUMA node.
+    ///
+    /// `nid` stands for NUMA id, i. e. NUMA node identifier, which is a non-negative
+    /// integer if a node needs to be specified, or NO_NODE if the caller doesn't care.
     ///
     /// If the requested size is zero, `realloc` behaves equivalent to `free`.
     ///
@@ -191,13 +249,27 @@ fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
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
+        unsafe { Self::realloc_node(ptr, layout, old_layout, flags, NumaNode::NO_NODE) }
+    }
+
     /// Free an existing memory allocation.
     ///
     /// # Safety
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index aa2dfa9dca4c..15d737fe89ed 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -13,7 +13,7 @@
 use core::ptr;
 use core::ptr::NonNull;
 
-use crate::alloc::{AllocError, Allocator};
+use crate::alloc::{AllocError, Allocator, NumaNode};
 use crate::bindings;
 use crate::pr_warn;
 
@@ -58,18 +58,23 @@ fn aligned_size(new_layout: Layout) -> usize {
 ///
 /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
 struct ReallocFunc(
-    unsafe extern "C" fn(*const crate::ffi::c_void, usize, u32) -> *mut crate::ffi::c_void,
+    unsafe extern "C" fn(
+        *const crate::ffi::c_void,
+        usize,
+        u32,
+        crate::ffi::c_int,
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
@@ -87,6 +92,7 @@ unsafe fn call(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: NumaNode,
     ) -> Result<NonNull<[u8]>, AllocError> {
         let size = aligned_size(layout);
         let ptr = match ptr {
@@ -110,7 +116,7 @@ unsafe fn call(
         // - Those functions provide the guarantees of this function.
         let raw_ptr = unsafe {
             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
-            self.0(ptr.cast(), size, flags.0).cast()
+            self.0(ptr.cast(), size, flags.0, nid.0).cast()
         };
 
         let ptr = if size == 0 {
@@ -123,34 +129,36 @@ unsafe fn call(
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
@@ -160,21 +168,22 @@ unsafe fn realloc(
 
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
@@ -184,6 +193,6 @@ unsafe fn realloc(
 
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags, nid) }
     }
 }
-- 
2.39.2

