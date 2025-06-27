Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DB4271464
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017146; cv=none; b=HooLCH2UPBJ2BUWZRE5cFEW3/kEOWPrXRC9YlDoaMHOMnpUzwbz96aCqizLhBkz5HeUBI/0yjkCJZVcf6YLM32VLMWNWvXaMA4KImX/klmE9YhPdE7H8ZDjZjJ9fcNWD6x9XqS5KRTxddCf6qSPQsYfl6AVqzBpGIj1kkV6DJlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017146; c=relaxed/simple;
	bh=vTj9sdyfg8G0yoI82Xzj73+oAGnxEL+xm6ZGeVSNewc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O2mu0JjWqpElcWe7Hwg8K4kqZmq2g1wv0HcRx2dZ96qaq9zvDypXmBQIqCHC2Toaibj9eJ6TiideWD/fji5lGvqLysz2r6Lx2x0jzsAaucHHrK83A0G/M++Hd4Pxm0vHnbn+yVLOIarCqVZLeKgK9XTy0+ynb+ZgIHJ8wrsdmJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=SLC8WGqY; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=XIuLFsgY; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="SLC8WGqY";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="XIuLFsgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751017143; x=1751621943;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=Zx3LglPu0mTTlfXiukstk1SD/1VGL40wbfi6XAP+H6c=;
	b=SLC8WGqYSlOuExKlSLNnuwYPyRqCrtKmjCo9cjzxxalOzpHfwynKd2FQ2lKRiaUD2nfleTlQFiBzB
	 znNqjffyPyFMoziA0lGrMWUAzNvJeexYr0li0pNn9oYprRygXhBIkVnUvl1PfLso+oW3DcJ+Xxz3yd
	 70SyL21vuMpIbXhaVNE2qLqNYLoARkhwvxcVkf7ngVbKh7Vo/KM7XhgdBV+DB/26FjUNkjKBGQLebM
	 eU7764KD5weZ7miuSeMGJBn3MnTzrQcBGHH5yuUX5swX4DJgWWEy+McK3L4dDwEbStW11tO93pyiZH
	 YqPYIwsyzZ1RVpgX4Qs2Q0owUqwYjwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751017143; x=1751621943;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=Zx3LglPu0mTTlfXiukstk1SD/1VGL40wbfi6XAP+H6c=;
	b=XIuLFsgYciRqdOrFWVTDTZ2QHucN29Inmmd4QCdcnzLjTC2FfY7gG8Ec7G87pVKgTiIuuNhIwsiZz
	 Y62j114DA==
X-HalOne-ID: 8e647328-533a-11f0-b070-4f541c8bf1cc
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 8e647328-533a-11f0-b070-4f541c8bf1cc;
	Fri, 27 Jun 2025 09:39:02 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v5 3/4] rust: add support for NUMA ids in allocations
Date: Fri, 27 Jun 2025 11:38:58 +0200
Message-Id: <20250627093858.413855-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627092901.356909-1-vitaly.wool@konsulko.se>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for specifying NUMA ids in Rust allocators as an Option
(i. e. providing `None` as nid corresponds to NUMA_NO_NODE). To do
this, modify ReallocFunc to use the new extended realloc primitives
from the C side of the kernel (i. e. k[v]realloc_node/vrealloc_node)
and add the new function alloc_node to the Allocator trait while
keeping the existing one (alloc) for backward compatibility.

This will allow to specify node to use for allocation of e. g.
{KV}Box, as well as for future NUMA aware users of the API.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 rust/helpers/slab.c            | 13 +++++++++++++
 rust/helpers/vmalloc.c         |  6 ++++++
 rust/kernel/alloc.rs           | 28 ++++++++++++++++++++++++++--
 rust/kernel/alloc/allocator.rs | 33 ++++++++++++++++++++++-----------
 rust/kernel/alloc/kvec.rs      |  3 ++-
 5 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
index a842bfbddcba..5db9450e9348 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -13,3 +13,16 @@ rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
 {
 	return kvrealloc(p, size, flags);
 }
+
+void * __must_check __realloc_size(2)
+rust_helper_krealloc_node(const void *objp, size_t new_size, unsigned long align,
+			  gfp_t flags, int node)
+{
+	return krealloc_node(objp, new_size, align, flags, node);
+}
+
+void * __must_check __realloc_size(2)
+rust_helper_kvrealloc_node(const void *p, size_t size, unsigned long align, gfp_t flags, int node)
+{
+	return kvrealloc_node(p, size, align, flags, node);
+}
diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
index 80d34501bbc0..7a71427a1e78 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -7,3 +7,9 @@ rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
 {
 	return vrealloc(p, size, flags);
 }
+
+void * __must_check __realloc_size(2)
+rust_helper_vrealloc_node(const void *p, size_t size, unsigned long align, gfp_t flags, int node)
+{
+	return vrealloc_node(p, size, align, flags, node);
+}
diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index a2c49e5494d3..1e26c2a7f47c 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -156,7 +156,30 @@ pub unsafe trait Allocator {
     fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
         // SAFETY: Passing `None` to `realloc` is valid by its safety requirements and asks for a
         // new memory allocation.
-        unsafe { Self::realloc(None, layout, Layout::new::<()>(), flags) }
+        unsafe { Self::realloc(None, layout, Layout::new::<()>(), flags, None) }
+    }
+
+    /// Allocate memory based on `layout`, `flags` and `nid`.
+    ///
+    /// On success, returns a buffer represented as `NonNull<[u8]>` that satisfies the layout
+    /// constraints (i.e. minimum size and alignment as specified by `layout`).
+    ///
+    /// This function is equivalent to `realloc` when called with `None`.
+    ///
+    /// # Guarantees
+    ///
+    /// When the return value is `Ok(ptr)`, then `ptr` is
+    /// - valid for reads and writes for `layout.size()` bytes, until it is passed to
+    ///   [`Allocator::free`] or [`Allocator::realloc`],
+    /// - aligned to `layout.align()`,
+    ///
+    /// Additionally, `Flags` are honored as documented in
+    /// <https://docs.kernel.org/core-api/mm-api.html#mm-api-gfp-flags>.
+    fn alloc_node(layout: Layout, flags: Flags, nid: Option<i32>)
+                -> Result<NonNull<[u8]>, AllocError> {
+        // SAFETY: Passing `None` to `realloc` is valid by its safety requirements and asks for a
+        // new memory allocation.
+        unsafe { Self::realloc(None, layout, Layout::new::<()>(), flags, nid) }
     }
 
     /// Re-allocate an existing memory allocation to satisfy the requested `layout`.
@@ -196,6 +219,7 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError>;
 
     /// Free an existing memory allocation.
@@ -211,7 +235,7 @@ unsafe fn free(ptr: NonNull<u8>, layout: Layout) {
         // SAFETY: The caller guarantees that `ptr` points at a valid allocation created by this
         // allocator. We are passing a `Layout` with the smallest possible alignment, so it is
         // smaller than or equal to the alignment previously used with this allocation.
-        let _ = unsafe { Self::realloc(Some(ptr), Layout::new::<()>(), layout, Flags(0)) };
+        let _ = unsafe { Self::realloc(Some(ptr), Layout::new::<()>(), layout, Flags(0), None) };
     }
 }
 
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index aa2dfa9dca4c..4f0fe2b67593 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -58,18 +58,20 @@ fn aligned_size(new_layout: Layout) -> usize {
 ///
 /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
 struct ReallocFunc(
-    unsafe extern "C" fn(*const crate::ffi::c_void, usize, u32) -> *mut crate::ffi::c_void,
+    unsafe extern "C" fn(*const crate::ffi::c_void, usize, crate::ffi::c_ulong, u32,
+                         crate::ffi::c_int
+    ) -> *mut crate::ffi::c_void,
 );
 
 impl ReallocFunc {
-    // INVARIANT: `krealloc` satisfies the type invariants.
-    const KREALLOC: Self = Self(bindings::krealloc);
+    // INVARIANT: `krealloc_node` satisfies the type invariants.
+    const KREALLOC_NODE: Self = Self(bindings::krealloc_node);
 
-    // INVARIANT: `vrealloc` satisfies the type invariants.
-    const VREALLOC: Self = Self(bindings::vrealloc);
+    // INVARIANT: `vrealloc_node` satisfies the type invariants.
+    const VREALLOC_NODE: Self = Self(bindings::vrealloc_node);
 
-    // INVARIANT: `kvrealloc` satisfies the type invariants.
-    const KVREALLOC: Self = Self(bindings::kvrealloc);
+    // INVARIANT: `kvrealloc_node` satisfies the type invariants.
+    const KVREALLOC_NODE: Self = Self(bindings::kvrealloc_node);
 
     /// # Safety
     ///
@@ -87,6 +89,7 @@ unsafe fn call(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
         let size = aligned_size(layout);
         let ptr = match ptr {
@@ -100,6 +103,11 @@ unsafe fn call(
             None => ptr::null(),
         };
 
+        let c_nid = match nid {
+            None => bindings::NUMA_NO_NODE,
+            Some(n) => n,
+        };
+
         // SAFETY:
         // - `self.0` is one of `krealloc`, `vrealloc`, `kvrealloc` and thus only requires that
         //   `ptr` is NULL or valid.
@@ -110,7 +118,7 @@ unsafe fn call(
         // - Those functions provide the guarantees of this function.
         let raw_ptr = unsafe {
             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
-            self.0(ptr.cast(), size, flags.0).cast()
+            self.0(ptr.cast(), size, 1, flags.0, c_nid).cast()
         };
 
         let ptr = if size == 0 {
@@ -134,9 +142,10 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
         // SAFETY: `ReallocFunc::call` has the same safety requirements as `Allocator::realloc`.
-        unsafe { ReallocFunc::KREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::KREALLOC_NODE.call(ptr, layout, old_layout, flags, nid) }
     }
 }
 
@@ -151,6 +160,7 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
         // TODO: Support alignments larger than PAGE_SIZE.
         if layout.align() > bindings::PAGE_SIZE {
@@ -160,7 +170,7 @@ unsafe fn realloc(
 
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::VREALLOC_NODE.call(ptr, layout, old_layout, flags, nid) }
     }
 }
 
@@ -175,6 +185,7 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
         // TODO: Support alignments larger than PAGE_SIZE.
         if layout.align() > bindings::PAGE_SIZE {
@@ -184,6 +195,6 @@ unsafe fn realloc(
 
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::KVREALLOC_NODE.call(ptr, layout, old_layout, flags, nid) }
     }
 }
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 1a0dd852a468..ef4f977ba012 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -633,6 +633,7 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
                 layout.into(),
                 self.layout.into(),
                 flags,
+                None,
             )?
         };
 
@@ -1058,7 +1059,7 @@ pub fn collect(self, flags: Flags) -> Vec<T, A> {
             // the type invariant to be smaller than `cap`. Depending on `realloc` this operation
             // may shrink the buffer or leave it as it is.
             ptr = match unsafe {
-                A::realloc(Some(buf.cast()), layout.into(), old_layout.into(), flags)
+                A::realloc(Some(buf.cast()), layout.into(), old_layout.into(), flags, None)
             } {
                 // If we fail to shrink, which likely can't even happen, continue with the existing
                 // buffer.
-- 
2.39.2

