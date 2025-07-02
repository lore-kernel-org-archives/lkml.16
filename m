Received: from mailrelay1-3.pub.mailoutpod3-cph3.one.com (mailrelay1-3.pub.mailoutpod3-cph3.one.com [46.30.212.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7313A2E7BAF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472568; cv=none; b=IfwxB87g14hSQl6BlYM23X+X45zg0FwUfVMQHaA1OP3PDOQdWF6zfhdZZpifmYt3oKUfO6QxzmdBjbjjjIFvtx3MDlyIDIig473uWqu1TcxfDSsD746YwHzYOBKCKnzCXkI+yel9TZ8hv3aKXkL3PR8TYq+roUr6YmKSuBuITvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472568; c=relaxed/simple;
	bh=SYIW75+wm3VibWBWsPEbk0MAzhXEBD5WcQ0waXQDF8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VI0luJrqzyBjsVf7o5vTTek/Dvxpa/bCX+E+JbB96QVCGV7QRHr9o+N5HDUhpBm126EGcLXh61G+LyTqOF9OTK/d4dFmzT0gOMiak2VLebF6F0X40TPKqQ4dcSiYcq+F3v3upjN62ZA7QBkCGKU57QFlcLnawQtZ1l+UosEE66M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=6WROcM2D; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=dQPUYuCn; arc=none smtp.client-ip=46.30.212.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="6WROcM2D";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="dQPUYuCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751472564; x=1752077364;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=gALnPztzwr59zDTT061QlxUWux/AzyL/kG1HsRDCKCA=;
	b=6WROcM2DLPsHrpKb49sbmLJLoAnNEZzzsNFVn4HpXFH2oTiJz1jayjOJQn3m23WDnT4bD9nB9P7v3
	 Cx/b99i8L8evsyjIvvnL28jRGu9lSJGNMdwsflPFm76r0I1oF5weHc0wU8qsHcep10Ak+v1luAAnth
	 Xqfps3LLH4OwNQVHoowwPcNsqCIGlPDJ4qLI6CJbNYGQexxDTuGjny0+JC26AchRenPPDzgeKUb8cx
	 AdE5yvnSMIvcwnRB0bKHttLPetfqw2HCs3Aw4k6OEMYLORNrSOrsHwC3nSBHi77BtcmSI7rnenhTa0
	 FijH7kR5qGSAXnFXcbW+zw2S69Lvh+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751472564; x=1752077364;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=gALnPztzwr59zDTT061QlxUWux/AzyL/kG1HsRDCKCA=;
	b=dQPUYuCnHuYFEszxvpCEW2oq5+ZNWdHr8saktkE8JByP3BM+uCoVrzoOhA8l8h0HhzlQBysnwsPdW
	 1IvTTlaDA==
X-HalOne-ID: e9e51555-575e-11f0-918f-152d8afab6bc
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id e9e51555-575e-11f0-918f-152d8afab6bc;
	Wed, 02 Jul 2025 16:09:23 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v10 4/4] rust: support large alignments in allocations
Date: Wed,  2 Jul 2025 18:09:21 +0200
Message-Id: <20250702160921.3610168-1-vitaly.wool@konsulko.se>
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

Add support for large (> PAGE_SIZE) alignments in Rust allocators.
All the preparations on the C side are already done, we just need
to add bindings for <alloc>_node_align() functions and start
using those.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 rust/helpers/slab.c            | 10 ++++++----
 rust/helpers/vmalloc.c         |  5 +++--
 rust/kernel/alloc/allocator.rs | 27 ++++++++-------------------
 3 files changed, 17 insertions(+), 25 deletions(-)

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
index 15d737fe89ed..1a54513533cf 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -61,20 +61,21 @@ struct ReallocFunc(
     unsafe extern "C" fn(
         *const crate::ffi::c_void,
         usize,
+        crate::ffi::c_ulong,
         u32,
         crate::ffi::c_int,
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
@@ -116,7 +117,7 @@ unsafe fn call(
         // - Those functions provide the guarantees of this function.
         let raw_ptr = unsafe {
             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
-            self.0(ptr.cast(), size, flags.0, nid.0).cast()
+            self.0(ptr.cast(), size, layout.align(), flags.0, nid.0).cast()
         };
 
         let ptr = if size == 0 {
@@ -160,12 +161,6 @@ unsafe fn realloc_node(
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
@@ -185,12 +180,6 @@ unsafe fn realloc_node(
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

