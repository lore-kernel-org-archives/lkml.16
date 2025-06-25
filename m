Received: from mailrelay5-3.pub.mailoutpod3-cph3.one.com (mailrelay5-3.pub.mailoutpod3-cph3.one.com [46.30.212.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACDC1E22E9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833039; cv=none; b=XPLBd0EhkpwB1EVGozeScM7zeCD03HFNQFYUn+Alx27sTyWgufV37iZLjGJNh/M2ERgVcVzxrOCKpCAa3Fpo6iiwIPFRmmABaYnBOJJ9TMvSj6smimVIkO1Cihl9jUlocbkO8zyqdkGRQtw1w081Y1SHviYKxaybKd55UugCZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833039; c=relaxed/simple;
	bh=SKXNK2Zafi76+EibEJpmGhgohZuq3bLnhcDIWse9mlI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=keUSnFUC6y6I30P5uBR81lRxYqU3C7wbdvaA6bRixMRdQwNBJLD1qG9xT0feVIxRiwA1GxQo8w0uhMlk2pXKqJKRgwoRO8u/jXtLELwFSW/NMtxeY1hQ2RIVlfN1v2fsmnMdXV+Xubog7+z+o/IeOEclP+1tay2uCgQ/OJ6Q1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=OA76rY39; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=5cnH5iKX; arc=none smtp.client-ip=46.30.212.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="OA76rY39";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="5cnH5iKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750833036; x=1751437836;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=fSXvnx+fgvE5GXly6XPTqjm0PPBXVKwM6V3gQyXQXoE=;
	b=OA76rY39MWM22xsVJ7hjXljB1U16EOfI9O2OKw1kJEMLHNWpXNAgZQtS729VvpJkNjC6P+eeC3lzk
	 c7/0/Q49KS8JL18LrHlcR99GInfun+HCs9uAtMi2UNhVDLot70cwryaXoyKk9qa0ORGHQyL3iEQU5A
	 0hl/j+XSJuxaQOad70p2vvSdatpluNbV8pwEIsb0Z3msrgc/fGWE+CPu0t9cUKt0Tr98O5SDSOeo/q
	 PPAHx5C59dkmjTljVQCEzY9TZafPrgNHAL0FzauEdKJNVVa0nUDL/uNMZsW5xhrBF7AdFavVos44p8
	 B3ZYX0MFEduRh6j3ThTboU4AUZLx2YA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750833036; x=1751437836;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=fSXvnx+fgvE5GXly6XPTqjm0PPBXVKwM6V3gQyXQXoE=;
	b=5cnH5iKXg5YmwXPrzVkNy8nYsX5vAWWPC5gI3yCxuRNWu586PmJyafz7HXDLMa/iqALpNMCI8A3bh
	 U/QejuRCA==
X-HalOne-ID: e5c569ab-518d-11f0-b995-d7c209f8bd06
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id e5c569ab-518d-11f0-b995-d7c209f8bd06;
	Wed, 25 Jun 2025 06:30:35 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v3 2/2] rust: support align and NUMA id in allocations
Date: Wed, 25 Jun 2025 08:30:26 +0200
Message-Id: <20250625063026.3379921-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for large (> PAGE_SIZE) alignments in Rust allocators
(Kmalloc support for large alignments is limited to the requested
size, which is a reasonable limitation anyway).
Besides, add support for NUMA id to Vmalloc.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 rust/helpers/slab.c            |  8 +++++--
 rust/helpers/vmalloc.c         |  4 ++--
 rust/kernel/alloc.rs           | 28 ++++++++++++++++++++++--
 rust/kernel/alloc/allocator.rs | 40 +++++++++++++++++++---------------
 rust/kernel/alloc/kvec.rs      |  3 ++-
 5 files changed, 59 insertions(+), 24 deletions(-)

diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
index a842bfbddcba..221c517f57a1 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -3,13 +3,17 @@
 #include <linux/slab.h>
 
 void * __must_check __realloc_size(2)
-rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
+rust_helper_krealloc(const void *objp, size_t new_size, unsigned long align, gfp_t flags, int nid)
 {
+	if (WARN_ON(new_size & (align - 1)))
+		return NULL;
 	return krealloc(objp, new_size, flags);
 }
 
 void * __must_check __realloc_size(2)
-rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
+rust_helper_kvrealloc(const void *p, size_t size, unsigned long align, gfp_t flags, int nid)
 {
+	if (WARN_ON(size & (align - 1)))
+		return NULL;
 	return kvrealloc(p, size, flags);
 }
diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
index 80d34501bbc0..9131279222fa 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -3,7 +3,7 @@
 #include <linux/vmalloc.h>
 
 void * __must_check __realloc_size(2)
-rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
+rust_helper_vrealloc_node(const void *p, size_t size, unsigned long align, gfp_t flags, int node)
 {
-	return vrealloc(p, size, flags);
+	return vrealloc_node(p, size, align, flags, node);
 }
diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 2e377c52fa07..12a723bf6092 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -161,7 +161,30 @@ pub unsafe trait Allocator {
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
@@ -201,6 +224,7 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError>;
 
     /// Free an existing memory allocation.
@@ -216,7 +240,7 @@ unsafe fn free(ptr: NonNull<u8>, layout: Layout) {
         // SAFETY: The caller guarantees that `ptr` points at a valid allocation created by this
         // allocator. We are passing a `Layout` with the smallest possible alignment, so it is
         // smaller than or equal to the alignment previously used with this allocation.
-        let _ = unsafe { Self::realloc(Some(ptr), Layout::new::<()>(), layout, Flags(0)) };
+        let _ = unsafe { Self::realloc(Some(ptr), Layout::new::<()>(), layout, Flags(0), None) };
     }
 }
 
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index aa2dfa9dca4c..91b36e128b92 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -58,7 +58,8 @@ fn aligned_size(new_layout: Layout) -> usize {
 ///
 /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
 struct ReallocFunc(
-    unsafe extern "C" fn(*const crate::ffi::c_void, usize, u32) -> *mut crate::ffi::c_void,
+    unsafe extern "C" fn(*const crate::ffi::c_void, usize, usize, u32, i32)
+                        -> *mut crate::ffi::c_void,
 );
 
 impl ReallocFunc {
@@ -66,7 +67,7 @@ impl ReallocFunc {
     const KREALLOC: Self = Self(bindings::krealloc);
 
     // INVARIANT: `vrealloc` satisfies the type invariants.
-    const VREALLOC: Self = Self(bindings::vrealloc);
+    const VREALLOC: Self = Self(bindings::vrealloc_node);
 
     // INVARIANT: `kvrealloc` satisfies the type invariants.
     const KVREALLOC: Self = Self(bindings::kvrealloc);
@@ -87,6 +88,7 @@ unsafe fn call(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
         let size = aligned_size(layout);
         let ptr = match ptr {
@@ -100,6 +102,11 @@ unsafe fn call(
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
@@ -110,7 +117,7 @@ unsafe fn call(
         // - Those functions provide the guarantees of this function.
         let raw_ptr = unsafe {
             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
-            self.0(ptr.cast(), size, flags.0).cast()
+            self.0(ptr.cast(), size, layout.align(), flags.0, c_nid).cast()
         };
 
         let ptr = if size == 0 {
@@ -134,9 +141,10 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        _nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
         // SAFETY: `ReallocFunc::call` has the same safety requirements as `Allocator::realloc`.
-        unsafe { ReallocFunc::KREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::KREALLOC.call(ptr, layout, old_layout, flags, None) }
     }
 }
 
@@ -151,16 +159,11 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        // TODO: Support alignments larger than PAGE_SIZE.
-        if layout.align() > bindings::PAGE_SIZE {
-            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-            return Err(AllocError);
-        }
-
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags, nid) }
     }
 }
 
@@ -175,15 +178,18 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        _nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        // TODO: Support alignments larger than PAGE_SIZE.
-        if layout.align() > bindings::PAGE_SIZE {
-            pr_warn!("KVmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-            return Err(AllocError);
-        }
+        // if the caller wants to have alignment bigger than PAGE_SIZE
+        // it's only vmalloc we can offer to satisfy that request
+        let alloc_func = if layout.align() > bindings::PAGE_SIZE {
+            ReallocFunc::VREALLOC
+        } else {
+            ReallocFunc::KVREALLOC
+        };
 
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { alloc_func.call(ptr, layout, old_layout, flags, None) }
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

