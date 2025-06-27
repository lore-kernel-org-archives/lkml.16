Received: from mailrelay2-3.pub.mailoutpod3-cph3.one.com (mailrelay2-3.pub.mailoutpod3-cph3.one.com [46.30.212.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B94A21
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048222; cv=none; b=sIn4M+Kww22/CgJGmoWj8VLifLDiY5xJaXVh+CQq+3CwQdTsAHolLKeYB5TlQsmHX6A69qYD1zxKtrfcig42yded32GiCxP6wr4tIpVRJGZD6FXCmJfNt6MYwWTPN2FdC9XK1EED7kvNPt4NPzg8eDMnNOfgfiDRWfMcixlzImM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048222; c=relaxed/simple;
	bh=OSnfF0rkhizQ5UItDZhugwlhecd7aPvj7lMsuNsab9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N2IUwDUJ/w4GFub1m0QXH+oUL3QsgMEuvHCLohndyWTZzPAhH/L0yHsE46FufycpuDWVtE0hTJm6Sk7UayrCc2pKyXFTgf5cQc16M4m9Gqat0ZDFS2i72Fi1x7SDPlfdvzd0P6/Kg7jz4rUpgquyqy/2FFKUAi9uvDKVTTgWzQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=q2T6/3Zy; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=rnigHV4Q; arc=none smtp.client-ip=46.30.212.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="q2T6/3Zy";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="rnigHV4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751048212; x=1751653012;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=nGDXplcE1kynSxniFbixzug4U6mDvYyhwrjb8WHIhtg=;
	b=q2T6/3ZyOqMhuPtNThP7x9F/JyEqdmaZ+scvIPY2wYJU26q8X6AW3IsSE3ScjEt9n9DCVuIaEQi16
	 fdZD9dPLAJcAgjdCQlkq946utdeNwp8fyYxzbirr+zeVz40td08NVa1jQb7/Nc2rhNbAibtK+XWjfe
	 kql6nMooVFo0fdHCReSRp/lQ7ooSJFiccQ7JzqkqN86M+uCzo8rgKBcfJK+2lPenKeiIuxU+9wpRi/
	 cqqRR8kkGSzGptQ+hdNEQSi17ySAPPNmQALMk/OkMGKKYILDkfUHL9+5Z59H1hh3YRz6HUprQrKxF0
	 /ORRCu8eCCCJ3SiuQhZcouJDRrplM/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751048212; x=1751653012;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=nGDXplcE1kynSxniFbixzug4U6mDvYyhwrjb8WHIhtg=;
	b=rnigHV4QpoNKhsBxThOlStYW8z3A/ltqFBVXlnO69ooDSHvDLnc++oaCBb0CY5gdhScDWhSmnlTxy
	 +ku7ObGCg==
X-HalOne-ID: e597f1cd-5382-11f0-b0a1-b37c246f863f
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id e597f1cd-5382-11f0-b0a1-b37c246f863f;
	Fri, 27 Jun 2025 18:16:52 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v6 4/4] rust: support large alignments in allocations
Date: Fri, 27 Jun 2025 20:16:50 +0200
Message-Id: <20250627181650.2081123-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627181505.2080916-1-vitaly.wool@konsulko.se>
References: <20250627181505.2080916-1-vitaly.wool@konsulko.se>
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
 rust/helpers/slab.c            | 14 ++++++++++++++
 rust/helpers/vmalloc.c         |  7 +++++++
 rust/kernel/alloc/allocator.rs | 34 +++++++++++-----------------------
 3 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
index 5abd552ccbd4..c4bb451bcf4e 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -25,3 +25,17 @@ rust_helper_kvrealloc_node(const void *p, size_t size, gfp_t flags, int node)
 {
 	return kvrealloc_node(p, size, flags, node);
 }
+
+void * __must_check __realloc_size(2)
+rust_helper_krealloc_node_align(const void *objp, size_t new_size, unsigned long align,
+				gfp_t flags, int node)
+{
+	return krealloc_node_align(objp, new_size, align, flags, node);
+}
+
+void * __must_check __realloc_size(2)
+rust_helper_kvrealloc_node_align(const void *p, size_t size, unsigned long align,
+				gfp_t flags, int node)
+{
+	return kvrealloc_node_align(p, size, align, flags, node);
+}
diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
index e6c796c65ee1..09aee472340f 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -13,3 +13,10 @@ rust_helper_vrealloc_node(const void *p, size_t size, gfp_t flags, int node)
 {
 	return vrealloc_node(p, size, flags, node);
 }
+
+void * __must_check __realloc_size(2)
+rust_helper_vrealloc_node_align(const void *p, size_t size, unsigned long align,
+				gfp_t flags, int node)
+{
+	return vrealloc_node_align(p, size, align, flags, node);
+}
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 47d9668c3599..7f986c974150 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -59,19 +59,19 @@ fn aligned_size(new_layout: Layout) -> usize {
 /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
 struct ReallocFunc(
     unsafe extern "C" fn(
-        *const crate::ffi::c_void, usize, u32, crate::ffi::c_int
+        *const crate::ffi::c_void, usize, crate::ffi::c_ulong, u32, crate::ffi::c_int,
     ) -> *mut crate::ffi::c_void,
 );
 
 impl ReallocFunc {
-    // INVARIANT: `krealloc_node` satisfies the type invariants.
-    const KREALLOC_NODE: Self = Self(bindings::krealloc_node);
+    // INVARIANT: `krealloc_node_align` satisfies the type invariants.
+    const KREALLOC_NODE_ALIGN: Self = Self(bindings::krealloc_node_align);
 
-    // INVARIANT: `vrealloc_node` satisfies the type invariants.
-    const VREALLOC_NODE: Self = Self(bindings::vrealloc_node);
+    // INVARIANT: `vrealloc_node_align` satisfies the type invariants.
+    const VREALLOC_NODE_ALIGN: Self = Self(bindings::vrealloc_node_align);
 
-    // INVARIANT: `kvrealloc_node` satisfies the type invariants.
-    const KVREALLOC_NODE: Self = Self(bindings::kvrealloc_node);
+    // INVARIANT: `kvrealloc_node_align` satisfies the type invariants.
+    const KVREALLOC_NODE_ALIGN: Self = Self(bindings::kvrealloc_node_align);
 
     /// # Safety
     ///
@@ -118,7 +118,7 @@ unsafe fn call(
         // - Those functions provide the guarantees of this function.
         let raw_ptr = unsafe {
             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
-            self.0(ptr.cast(), size, flags.0, c_nid).cast()
+            self.0(ptr.cast(), size, layout.align(), flags.0, c_nid).cast()
         };
 
         let ptr = if size == 0 {
@@ -145,7 +145,7 @@ unsafe fn realloc(
         nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
         // SAFETY: `ReallocFunc::call` has the same safety requirements as `Allocator::realloc`.
-        unsafe { ReallocFunc::KREALLOC_NODE.call(ptr, layout, old_layout, flags, nid) }
+        unsafe { ReallocFunc::KREALLOC_NODE_ALIGN.call(ptr, layout, old_layout, flags, nid) }
     }
 }
 
@@ -162,15 +162,9 @@ unsafe fn realloc(
         flags: Flags,
         nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        // TODO: Support alignments larger than PAGE_SIZE.
-        if layout.align() > bindings::PAGE_SIZE {
-            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-            return Err(AllocError);
-        }
-
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::VREALLOC_NODE.call(ptr, layout, old_layout, flags, nid) }
+        unsafe { ReallocFunc::VREALLOC_NODE_ALIGN.call(ptr, layout, old_layout, flags, nid) }
     }
 }
 
@@ -187,14 +181,8 @@ unsafe fn realloc(
         flags: Flags,
         nid: Option<i32>,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        // TODO: Support alignments larger than PAGE_SIZE.
-        if layout.align() > bindings::PAGE_SIZE {
-            pr_warn!("KVmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-            return Err(AllocError);
-        }
-
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
-        unsafe { ReallocFunc::KVREALLOC_NODE.call(ptr, layout, old_layout, flags, nid) }
+        unsafe { ReallocFunc::KVREALLOC_NODE_ALIGN.call(ptr, layout, old_layout, flags, nid) }
     }
 }
-- 
2.39.2

