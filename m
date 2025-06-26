Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFC1294A15
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927008; cv=none; b=Ik1o+w2IH66CfoexbzZWcSxlElJ2hix9W0L2RmTnQVgaCYR4tSq0wCVVWjngY0M4fa396MfUfbA2BmbabRtjb8futcYGTICSY7kJJWLad/zkT/isUM64UoWIMhoYV5jDohIzmiVa7RoiLvOEFaIOV+CjnhKQZEDjPlXeLZl+JLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927008; c=relaxed/simple;
	bh=s49bqDVsFhjHPmMT9sFI5qUHSjOibuALwhdsRHZnH58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DxYC1x5Txw/MrISQAHPrsXPLt3/gWzQPGqNVvQdig+acJw16jAypSPaBb11ORHeyCl5CNgHE0I3t/QNc/5CiK40EgTrGkDOemUfy+r2/KiW0cOSBW5f35o/X0Utcv8n/VeP+CCQSwaLmspA999rhz/y7BxFjjMF1X4ubtbtnhTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=WeWVR6F1; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=NdjUMegl; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="WeWVR6F1";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="NdjUMegl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750927005; x=1751531805;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=knXSD5S79O6CdllCbDYQ90STJZQwheeGaY9xHv0HFjs=;
	b=WeWVR6F1DZzK9aJJpyYfcIHvevfq/ymYN4+/WB+T2NSKYkVk112r00ki4TkOSV8S4FFOf43Iln9U8
	 XYzyjXchohDKzwDDgj5taaKCx6fDS/0ezC36rhEka/SidbkcgPrFTxLFk24LDusZfOyCCklwyLOCjj
	 LZ/ZjHTtNvdd2KiZoJaTPt2WlcQgqEARtYRsWZlLjwgUUUF+PWNfYPogid3tWhselQXnEPDdqSOwVE
	 qI6cJwQ+7Wpt+UoJDs0kr1bTPTT8eaSWRTr5M9zKkyfpYTqXGD9NfnT7p65RayVOestCOScj7prnhh
	 F0hFSec7ZmBYJsoobDgb5mhi/7aULwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750927005; x=1751531805;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=knXSD5S79O6CdllCbDYQ90STJZQwheeGaY9xHv0HFjs=;
	b=NdjUMegl0YpZPkrK+HYEkoohulFB3JW2aImrbECIF8X6VuzFRs6P7g14qMhgbHaHca8xNKcZYgrJD
	 1LBOE/FBQ==
X-HalOne-ID: aff13161-5268-11f0-bfae-494313b7f784
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id aff13161-5268-11f0-bfae-494313b7f784;
	Thu, 26 Jun 2025 08:36:44 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v4 3/4] rust: support large alignments in allocations
Date: Thu, 26 Jun 2025 10:36:42 +0200
Message-Id: <20250626083642.3596388-1-vitaly.wool@konsulko.se>
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

Add support for large (> PAGE_SIZE) alignments in Rust allocators
(Kmalloc support for large alignments is limited to the requested
size, which is a reasonable limitation anyway).

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 rust/helpers/slab.c            |  4 ++--
 rust/helpers/vmalloc.c         |  4 ++--
 rust/kernel/alloc/allocator.rs | 16 ++--------------
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
index a842bfbddcba..5e9e8dd2bba0 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -3,13 +3,13 @@
 #include <linux/slab.h>
 
 void * __must_check __realloc_size(2)
-rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
+rust_helper_krealloc(const void *objp, size_t new_size, unsigned long align, gfp_t flags)
 {
 	return krealloc(objp, new_size, flags);
 }
 
 void * __must_check __realloc_size(2)
-rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
+rust_helper_kvrealloc(const void *p, size_t size, unsigned long align, gfp_t flags)
 {
 	return kvrealloc(p, size, flags);
 }
diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
index 80d34501bbc0..4618c0b79283 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -3,7 +3,7 @@
 #include <linux/vmalloc.h>
 
 void * __must_check __realloc_size(2)
-rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
+rust_helper_vrealloc(const void *p, size_t size, unsigned long align, gfp_t flags)
 {
-	return vrealloc(p, size, flags);
+	return vrealloc_node(p, size, align, flags, NUMA_NO_NODE);
 }
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index aa2dfa9dca4c..a0d78c497974 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -58,7 +58,7 @@ fn aligned_size(new_layout: Layout) -> usize {
 ///
 /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
 struct ReallocFunc(
-    unsafe extern "C" fn(*const crate::ffi::c_void, usize, u32) -> *mut crate::ffi::c_void,
+    unsafe extern "C" fn(*const crate::ffi::c_void, usize, usize, u32) -> *mut crate::ffi::c_void,
 );
 
 impl ReallocFunc {
@@ -110,7 +110,7 @@ unsafe fn call(
         // - Those functions provide the guarantees of this function.
         let raw_ptr = unsafe {
             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
-            self.0(ptr.cast(), size, flags.0).cast()
+            self.0(ptr.cast(), size, layout.align(), flags.0).cast()
         };
 
         let ptr = if size == 0 {
@@ -152,12 +152,6 @@ unsafe fn realloc(
         old_layout: Layout,
         flags: Flags,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        // TODO: Support alignments larger than PAGE_SIZE.
-        if layout.align() > bindings::PAGE_SIZE {
-            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-            return Err(AllocError);
-        }
-
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
         unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
@@ -176,12 +170,6 @@ unsafe fn realloc(
         old_layout: Layout,
         flags: Flags,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        // TODO: Support alignments larger than PAGE_SIZE.
-        if layout.align() > bindings::PAGE_SIZE {
-            pr_warn!("KVmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-            return Err(AllocError);
-        }
-
         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
         // allocated with this `Allocator`.
         unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
-- 
2.39.2

