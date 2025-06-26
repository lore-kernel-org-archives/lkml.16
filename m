Received: from mailrelay3-3.pub.mailoutpod3-cph3.one.com (mailrelay3-3.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C26829550C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927025; cv=none; b=A0cj8pejAsEyU2ZvOEHXYkxjpeCpG6axamIjLDkke0rTeOeIv1YhyUN8rDwEGxP3q2/YMkYDKJhJmM1vm8iOo1X9zoRc0RpZ4wbmgvVgsm90dp7TaVccOT5rCt9wxRgAgKaQRGoEPwNZVP/PsumNCEzpJXoJX+npzKAosdG6eGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927025; c=relaxed/simple;
	bh=tZ6whH1q7CVG/zi0ymHgjD/jli8w2mYD4Bq31hbIZVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i9Zn2SWbu04W8Mb0/pCPJUQMm3zwGBPFhmG/n1mEZgyfhwiNnLhXZCTbpCbdLIJWSR9xf04esXUrre1qbX5kkr+MMw3BR/ySlNgzEkeJLB7w7oFco3RDQNyHFnIn5I9rf8ibnZsEZ2VpvFF6cGD3VyuQ16lHxamLC4MUc2H4ivs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=QKEutYsi; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=5NJ99EEw; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="QKEutYsi";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="5NJ99EEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750927016; x=1751531816;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=eY2PvRpyBIA97uJAt2Gqql9RLK3sKrcnmWF3Jybxl34=;
	b=QKEutYsiXmFvFBsUfSQmw8LXHu7Nfuo+e68Hc5tXHU+S8ex6ZXK5lU22xkT8Z9q/PxmgQRoBf1Q3Z
	 yfzr1unCGpB3MWu1WkCWaX4sM94zAj/wpQwEhZTNn6jm2oJACWGfMoeUqxX+fXeC4plwTJIjUgqX4J
	 GvmTXchwdJjJR8icpEZq0mudHnj3O9fIjl7F6Xe4Xl6bETePbwBSWza+YQW0US1XbIROwREZC8AoRx
	 SgRJdlju7amQvQ0vHxj+p8woDi/t3HeA9a/K+xyYhClkKrO5I3U7YPlI0jKdkLyg20E0ywLALeqKB9
	 E/JsFF5lpKig8M/POPwKDPmjyJsi0tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750927016; x=1751531816;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=eY2PvRpyBIA97uJAt2Gqql9RLK3sKrcnmWF3Jybxl34=;
	b=5NJ99EEwK9PPy829s2VDLjcc6yLi+kA/M0eIYzUp5WovVkAJUNMRG8oqGMiqPBUy+1RdKmwJNpL1l
	 CeU/xojCg==
X-HalOne-ID: b680223f-5268-11f0-86c4-2b8368a4d5c5
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id b680223f-5268-11f0-86c4-2b8368a4d5c5;
	Thu, 26 Jun 2025 08:36:55 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v4 4/4] rust: support NUMA ids in allocations
Date: Thu, 26 Jun 2025 10:36:53 +0200
Message-Id: <20250626083653.3596424-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250626083516.3596197-1-vitaly.wool@konsulko.se>
References: <20250626083516.3596197-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for specifying NUMA ids in Rust allocators as an Option
(i. e. providing `None` as nid corresponds to NUMA_NO_NODE). This
will allow to specify node to use for allocation of e. g. {KV}Box.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 rust/helpers/slab.c            |  9 +++++----
 rust/helpers/vmalloc.c         |  4 ++--
 rust/kernel/alloc.rs           | 28 ++++++++++++++++++++++++++--
 rust/kernel/alloc/allocator.rs | 26 ++++++++++++++++++--------
 rust/kernel/alloc/kvec.rs      |  3 ++-
 5 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
index 5e9e8dd2bba0..ab1cf72f8353 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -3,13 +3,14 @@
 #include <linux/slab.h>
 
 void * __must_check __realloc_size(2)
-rust_helper_krealloc(const void *objp, size_t new_size, unsigned long align, gfp_t flags)
+rust_helper_krealloc_node(const void *objp, size_t new_size, unsigned long align, gfp_t flags,
+			  int nid)
 {
-	return krealloc(objp, new_size, flags);
+	return krealloc_node(objp, new_size, flags, nid);
 }
 
 void * __must_check __realloc_size(2)
-rust_helper_kvrealloc(const void *p, size_t size, unsigned long align, gfp_t flags)
+rust_helper_kvrealloc_node(const void *p, size_t size, unsigned long align, gfp_t flags, int nid)
 {
-	return kvrealloc(p, size, flags);
+	return kvrealloc_node(p, size, flags, nid);
 }
diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
index 4618c0b79283..9131279222fa 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -3,7 +3,7 @@
 #include <linux/vmalloc.h>
 
 void * __must_check __realloc_size(2)
-rust_helper_vrealloc(const void *p, size_t size, unsigned long align, gfp_t flags)
+rust_helper_vrealloc_node(const void *p, size_t size, unsigned long align, gfp_t flags, int node)
 {
-	return vrealloc_node(p, size, align, flags, NUMA_NO_NODE);
+	return vrealloc_node(p, size, align, flags, node);
 }
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
index a0d78c497974..5a0d0a57dfe5 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -58,18 +58,19 @@ fn aligned_size(new_layout: Layout) -> usize {
 ///
 /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
 struct ReallocFunc(
-    unsafe extern "C" fn(*const crate::ffi::c_void, usize, usize, u32) -> *mut crate::ffi::c_void,
+    unsafe extern "C" fn(*const crate::ffi::c_void, usize, usize, u32, i32)
+                        -> *mut crate::ffi::c_void,
 );
 
 impl ReallocFunc {
     // INVARIANT: `krealloc` satisfies the type invariants.
-    const KREALLOC: Self = Self(bindings::krealloc);
+    const KREALLOC: Self = Self(bindings::krealloc_node);
 
     // INVARIANT: `vrealloc` satisfies the type invariants.
-    const VREALLOC: Self = Self(bindings::vrealloc);
+    const VREALLOC: Self = Self(bindings::vrealloc_node);
 
     // INVARIANT: `kvrealloc` satisfies the type invariants.
-    const KVREALLOC: Self = Self(bindings::kvrealloc);
+    const KVREALLOC: Self = Self(bindings::kvrealloc_node);
 
     /// # Safety
     ///
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
-            self.0(ptr.cast(), size, layout.align(), flags.0).cast()
+            self.0(ptr.cast(), size, layout.align(), flags.0, c_nid).cast()
         };
 
         let ptr = if size == 0 {
@@ -134,9 +141,10 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
         // SAFETY: `ReallocFunc::call` has the same safety requirements as `Allocator::realloc`.
-        unsafe { ReallocFunc::KREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::KREALLOC.call(ptr, layout, old_layout, flags, nid) }
     }
 }
 
@@ -151,10 +159,11 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags, nid) }
     }
 }
 
@@ -169,9 +178,10 @@ unsafe fn realloc(
         layout: Layout,
         old_layout: Layout,
         flags: Flags,
+        nid: Option<i32>
     ) -> Result<NonNull<[u8]>, AllocError> {
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
+        unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags, nid) }
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

