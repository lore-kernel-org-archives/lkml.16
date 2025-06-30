Received: from mailrelay4-3.pub.mailoutpod3-cph3.one.com (mailrelay4-3.pub.mailoutpod3-cph3.one.com [46.30.212.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC992405F6
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321826; cv=none; b=IjiF614ibzrLpmzx0ws0J/9ZkeafaS5BcdM1crGShXW/6tcW1hrTTPB95mPkYjVx9dynnqwKCKTJ8vQbYU8uDBYIJ7ORu7Q2cfu0Hcu3N534dAkdHmXbWt8p9ipCGksQ6Jpu4kYZfiXzOJRHI+e1eNbeZuwkm+LwqcrYzdSJbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321826; c=relaxed/simple;
	bh=+icoHdD16rtAElqIFrplkTciRveLhQeWCFCs/gsB+ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XqOsZyMFLkWjaBReQGj49uL2L4yY+EZ7Y9pdYOM6p4dB6ru4289tTQWCbx54vnf0RVhBBBDo5h3xR1lrRwxNn4hifmRPXqqZ4b88n3ay/KF1j135X3sBO9IuDVl8fhzu67ATCHUrIF3RVUjA1Ud/4q8xIM/ENRXYtWujiKOJuUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=gzIw72ke; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Z63KqWek; arc=none smtp.client-ip=46.30.212.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="gzIw72ke";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Z63KqWek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751321816; x=1751926616;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=xlhdGuz/Z+dkJo2xYiSj4xZE1JqckJSK1NBWLMJ0VOE=;
	b=gzIw72ke3MazTuhdxrRztK6R2Yw4oEdiz6vndPzAc1MDC19knX725alEn3Rwk5sbS3EKkjjGPoGHm
	 2JtLwf40LsHXhRVKzguoYH+WdK/Ac4/kH56JkhezyU7eC5C3zme+cwxXyV6dTyrZv9W/XpEhEA3I3A
	 NspzpHuURJhb0wFbePLoFS2VPAdJ3GeD/ngYEx2s/J+iy0lW8AW6fTg30u+qTvYp95PHMyOBN4D1QF
	 JlSE5kjTVkeTdVzQO+D2rapf4Q6tEjsq7hDeUsK8hlvuqKFHX80cgsFXHhy6dZvEIVAUWf0VF04Whn
	 YnRJ30jEhzkL9TrRNFs+h49rdKWHz8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751321816; x=1751926616;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=xlhdGuz/Z+dkJo2xYiSj4xZE1JqckJSK1NBWLMJ0VOE=;
	b=Z63KqWekIbMKVQhsvGJ9ejEtf0+nL8ZL0Xjg4Tpe+N3tMohLbta5EIkomnd9NXzxrkWtZaAUCqkj9
	 EWirzn0Bg==
X-HalOne-ID: ee37d59e-55ff-11f0-b560-29b2d794c87d
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id ee37d59e-55ff-11f0-b560-29b2d794c87d;
	Mon, 30 Jun 2025 22:16:55 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v4 4/4] rust: support large alignments in allocations
Date: Tue,  1 Jul 2025 00:16:53 +0200
Message-Id: <20250630221653.3325329-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
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

