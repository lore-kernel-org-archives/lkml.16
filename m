Received: from mailrelay4-3.pub.mailoutpod3-cph3.one.com (mailrelay4-3.pub.mailoutpod3-cph3.one.com [46.30.212.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD67224AE6
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751106394; cv=none; b=Tu87RP1m1EuyBjma+3cfC6/avQT9AmiWdYKC18DGzeGQAdBob7NADY/PQNhzpaxgGV8JHh5VAEuf37SmtPBwlZc9pB+4p1VmGeFswE+Bmp1gVRPwxIrL6aQYRnN4uDy8JjtimUVinSAC2NlWiJaTgH7T4yoawzLI7KQwTO6XZLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751106394; c=relaxed/simple;
	bh=+icoHdD16rtAElqIFrplkTciRveLhQeWCFCs/gsB+ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NpmiNzyDeaffOJDZn6UzhTzNP1X094g3E5Xlensdn3wBCCyFrngjYFWEfFvPjJyH+IcliQSNsQJ9R27qD/Ir3Rd/5wNonPqQSNiErcEiDoc8A6XE2tgRAGsRZHhNClOGxEw4p2nxFWOReirqWX3Fvuh5cO8KrVDckUJ8llYRcUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=QSZ+lYJi; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=NuIaGDGg; arc=none smtp.client-ip=46.30.212.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="QSZ+lYJi";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="NuIaGDGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751106390; x=1751711190;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=xlhdGuz/Z+dkJo2xYiSj4xZE1JqckJSK1NBWLMJ0VOE=;
	b=QSZ+lYJiZSB7Toib+iyiSJ3/SIzdf98oKheYebvFNLbjGPu8zBZE2g7L5gOuiAPO4E7A90ZoPAIJE
	 6matMIx8TFsgWmyt3HIIySVFKoSE3hkywtECygbxMCT1u67m4QY2GypMiGmblTtgCsMeQ8ujIbkA7B
	 S5hkwzBE+tzBGCsrwxuowfMXp9xzYw+dmrzZLseZo/5C2sFtiHx3ZHe6sqYEBna47HXkgDsI0lqu+F
	 T1f4HsOLmTC0Zrvgi/jjIdZTZa3nuw5JsOeU3tNyf9vX5+TEPvvSYSi+6QuXcuj2a79UU+taGa9zV7
	 gKsLpnBifkaSwOft3eGF2QRWV1kQXFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751106390; x=1751711190;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=xlhdGuz/Z+dkJo2xYiSj4xZE1JqckJSK1NBWLMJ0VOE=;
	b=NuIaGDGgweqG2u/jIxj6mcXd/5JQk5UQSVMztjkrY8ddwsuy+pc/9KcXSDnDjnWYikhdkRmzsvHdj
	 MSJLU5HDg==
X-HalOne-ID: 59c0416d-540a-11f0-8548-29b2d794c87d
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 59c0416d-540a-11f0-8548-29b2d794c87d;
	Sat, 28 Jun 2025 10:26:30 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v8 4/4] rust: support large alignments in allocations
Date: Sat, 28 Jun 2025 12:26:26 +0200
Message-Id: <20250628102626.2542946-1-vitaly.wool@konsulko.se>
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

Add support for large (> PAGE_SIZE) alignments in Rust allocators.
All the preparations on the C side are already done, we just need
to add bindings for <alloc>_node_align() functions and start
using those.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 rust/helpers/slab.c            | 10 ++++++----
 rust/helpers/vmalloc.c         |  5 +++--
 rust/kernel/alloc/allocator.rs | 28 ++++++++--------------------
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
index 8472370a4338..d729be798f31 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -3,13 +3,15 @@
 #include <linux/slab.h>
 
 void * __must_check __realloc_size(2)
-rust_helper_krealloc_node(const void *objp, size_t new_size, gfp_t flags, int node)
+rust_helper_krealloc_node_align(const void *objp, size_t new_size, unsigned long align,
+				gfp_t flags, int node)
 {
-	return krealloc_node(objp, new_size, flags, node);
+	return krealloc_node_align(objp, new_size, align, flags, node);
 }
 
 void * __must_check __realloc_size(2)
-rust_helper_kvrealloc_node(const void *p, size_t size, gfp_t flags, int node)
+rust_helper_kvrealloc_node_align(const void *p, size_t size, unsigned long align,
+				gfp_t flags, int node)
 {
-	return kvrealloc_node(p, size, flags, node);
+	return kvrealloc_node_align(p, size, align, flags, node);
 }
diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
index 62d30db9a1a6..7d7f7336b3d2 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -3,7 +3,8 @@
 #include <linux/vmalloc.h>
 
 void * __must_check __realloc_size(2)
-rust_helper_vrealloc_node(const void *p, size_t size, gfp_t flags, int node)
+rust_helper_vrealloc_node_align(const void *p, size_t size, unsigned long align,
+				gfp_t flags, int node)
 {
-	return vrealloc_node(p, size, flags, node);
+	return vrealloc_node_align(p, size, align, flags, node);
 }
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 2e86e9839a1b..58e5bf78c159 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -59,19 +59,19 @@ fn aligned_size(new_layout: Layout) -> usize {
 /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
 struct ReallocFunc(
     unsafe extern "C" fn(
-        *const crate::ffi::c_void, usize,  u32, crate::ffi::c_int,
+        *const crate::ffi::c_void, usize, crate::ffi::c_ulong, u32, crate::ffi::c_int,
     ) -> *mut crate::ffi::c_void,
 );
 
 impl ReallocFunc {
-    // INVARIANT: `krealloc_node` satisfies the type invariants.
-    const KREALLOC: Self = Self(bindings::krealloc_node);
+    // INVARIANT: `krealloc_node_align` satisfies the type invariants.
+    const KREALLOC: Self = Self(bindings::krealloc_node_align);
 
-    // INVARIANT: `vrealloc_node` satisfies the type invariants.
-    const VREALLOC: Self = Self(bindings::vrealloc_node);
+    // INVARIANT: `vrealloc_node_align` satisfies the type invariants.
+    const VREALLOC: Self = Self(bindings::vrealloc_node_align);
 
-    // INVARIANT: `kvrealloc_node` satisfies the type invariants.
-    const KVREALLOC: Self = Self(bindings::kvrealloc_node);
+    // INVARIANT: `kvrealloc_node_align` satisfies the type invariants.
+    const KVREALLOC: Self = Self(bindings::kvrealloc_node_align);
 
     /// # Safety
     ///
@@ -113,7 +113,7 @@ unsafe fn call(
         // - Those functions provide the guarantees of this function.
         let raw_ptr = unsafe {
             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
-            self.0(ptr.cast(), size, flags.0, nid.0).cast()
+            self.0(ptr.cast(), size, layout.align(), flags.0, nid.0).cast()
         };
 
         let ptr = if size == 0 {
@@ -157,12 +157,6 @@ unsafe fn realloc_node(
         flags: Flags,
         nid: NumaNode,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        // TODO: Support alignments larger than PAGE_SIZE.
-        if layout.align() > bindings::PAGE_SIZE {
-            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-            return Err(AllocError);
-        }
-
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
         unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags, nid) }
@@ -182,12 +176,6 @@ unsafe fn realloc_node(
         flags: Flags,
         nid: NumaNode,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        // TODO: Support alignments larger than PAGE_SIZE.
-        if layout.align() > bindings::PAGE_SIZE {
-            pr_warn!("KVmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-            return Err(AllocError);
-        }
-
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
         unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags, nid) }
-- 
2.39.2

