Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E37A1DF271
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048193; cv=none; b=YJ4DEX1h3hSX54KcTugG15/H1SYejiBKiI68JYRG5JGy0rOv8t5sgakUrXzAx1FhLXoGMEkJvZ8kfDhm2McoCk6ABsC006R4/gFIalIUGnCs8m0gLAaNcIc+/hXj07r9l1kbqSJAhHF6I3/ZTMCeIoYwTmcp7c5yQHEqGZ0pzXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048193; c=relaxed/simple;
	bh=NoHgq+K26IsAvEj6C2qrVRM6ACWDYkgMMicsGvtZPXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k3EL30alj8A5OuGBzkDQUZSsNaBYyhIdJTvK8DyRjZSMCvh05r8epKULLfRoG5Je2P1vF7bN04hNp+LtjKzdPtnMYsuvuIc1bXcOZxS/QXqokq9mN7byTpN0TjSNZpPrzaTnpmnRqNuGM3NDZtxFiDYdLPeqYisZeG1EG+4QBp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=EdlJTq0D; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=im3aBPmb; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="EdlJTq0D";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="im3aBPmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751048189; x=1751652989;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=4ZIeiPu/zic9E4s7Al+vArUw1KwvYwIAaepoA+hvdNI=;
	b=EdlJTq0DiPQ/tRPXVrVmVwIMtdjZW1QRgzCufCklM96w6o4x1XeV3vVGxJBIcBWnOdvfOHIKKs6m+
	 Fffwwz9Rgk88TbXJVEDpT5ehCsobLg8s+fngSX8B1shs8EDubjPFfpnfTDUe8EV8YMeJdq3C7CFhOY
	 ADUsB/8jmLo71vsV8iAn2qd7bvS3XM4SFNTz3C9NazuvCHxCUIpysWdOUk9TqpN274gsVoNpVtyY7N
	 YzK/P/vxd0TytgOIybXi4IKYncxR85Xu2EQHUaX2nUAMByjX0GnVgkbzBfU7NHgRLziGuA7ZI0X0dc
	 w3ThHhKC0bwH2/1RzhH5jCQ4M8e3KXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751048189; x=1751652989;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=4ZIeiPu/zic9E4s7Al+vArUw1KwvYwIAaepoA+hvdNI=;
	b=im3aBPmbYyNLlvLtzJU3miASsn3l81lUDqWy8pKpkTlGjRZbDWpL5saCKngcXeyB0Nr1REI9poNr1
	 IUSBmEoCw==
X-HalOne-ID: d751419d-5382-11f0-b928-4f541c8bf1cc
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id d751419d-5382-11f0-b928-4f541c8bf1cc;
	Fri, 27 Jun 2025 18:16:28 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v6 2/4] mm/slab: allow to set node and align in k[v]realloc
Date: Fri, 27 Jun 2025 20:16:19 +0200
Message-Id: <20250627181619.2081057-1-vitaly.wool@konsulko.se>
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

Reimplement k[v]realloc_node() to be able to set node and
alignment should a user need to do so. In order to do that while
retaining the maximal backward compatibility, add
k[v]realloc_node_align() functions and redefine the rest of API
using these new ones.

With that change we also provide the ability for the Rust part of
the kernel to set node and aligmnent in its K[v]xxx
[re]allocations.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 include/linux/slab.h | 40 +++++++++++++++++++---------
 mm/nommu.c           |  3 ++-
 mm/slub.c            | 63 ++++++++++++++++++++++++++++++--------------
 3 files changed, 72 insertions(+), 34 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index d5a8ab98035c..13abcf4ada22 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -465,9 +465,15 @@ int kmem_cache_shrink(struct kmem_cache *s);
 /*
  * Common kmalloc functions provided by all allocators
  */
-void * __must_check krealloc_noprof(const void *objp, size_t new_size,
-				    gfp_t flags) __realloc_size(2);
-#define krealloc(...)				alloc_hooks(krealloc_noprof(__VA_ARGS__))
+void * __must_check krealloc_node_align_noprof(const void *objp, size_t new_size,
+					       unsigned long align,
+					       gfp_t flags, int nid) __realloc_size(2);
+#define krealloc_node_noprof(_p, _s, _f, _n) \
+	krealloc_node_align_noprof(_p, _s, 1, _f, _n)
+#define krealloc_noprof(...)		krealloc_node_noprof(__VA_ARGS__, NUMA_NO_NODE)
+#define krealloc_node_align(...)	alloc_hooks(krealloc_node_align_noprof(__VA_ARGS__))
+#define krealloc_node(...)		alloc_hooks(krealloc_node_noprof(__VA_ARGS__))
+#define krealloc(...)			alloc_hooks(krealloc_noprof(__VA_ARGS__))
 
 void kfree(const void *objp);
 void kfree_sensitive(const void *objp);
@@ -1041,18 +1047,23 @@ static inline __alloc_size(1) void *kzalloc_noprof(size_t size, gfp_t flags)
 #define kzalloc(...)				alloc_hooks(kzalloc_noprof(__VA_ARGS__))
 #define kzalloc_node(_size, _flags, _node)	kmalloc_node(_size, (_flags)|__GFP_ZERO, _node)
 
-void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node) __alloc_size(1);
-#define kvmalloc_node_noprof(size, flags, node)	\
-	__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(size, NULL), flags, node)
+void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
+			     gfp_t flags, int node) __alloc_size(1);
+#define kvmalloc_node_align_noprof(_size, _align, _flags, _node)	\
+	__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, NULL), _align, _flags, _node)
+#define kvmalloc_node_noprof(_size, _flags, _node)	\
+	kvmalloc_node_align_noprof(_size, 1, _flags, _node)
+#define kvmalloc_node_align(...)		\
+	alloc_hooks(kvmalloc_node_align_noprof(__VA_ARGS__))
 #define kvmalloc_node(...)			alloc_hooks(kvmalloc_node_noprof(__VA_ARGS__))
 
-#define kvmalloc(_size, _flags)			kvmalloc_node(_size, _flags, NUMA_NO_NODE)
-#define kvmalloc_noprof(_size, _flags)		kvmalloc_node_noprof(_size, _flags, NUMA_NO_NODE)
+#define kvmalloc_noprof(...)			kvmalloc_node_noprof(__VA_ARGS__, NUMA_NO_NODE)
+#define kvmalloc(...)				alloc_hooks(kvmalloc_noprof(__VA_ARGS__))
 #define kvzalloc(_size, _flags)			kvmalloc(_size, (_flags)|__GFP_ZERO)
 
-#define kvzalloc_node(_size, _flags, _node)	kvmalloc_node(_size, (_flags)|__GFP_ZERO, _node)
+#define kvzalloc_node(_s, _f, _n)		kvmalloc_node(_s, (_f)|__GFP_ZERO, _n)
 #define kmem_buckets_valloc(_b, _size, _flags)	\
-	alloc_hooks(__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), _flags, NUMA_NO_NODE))
+	alloc_hooks(__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), 1, _flags, NUMA_NO_NODE))
 
 static inline __alloc_size(1, 2) void *
 kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node)
@@ -1068,13 +1079,16 @@ kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node)
 #define kvmalloc_array_noprof(...)		kvmalloc_array_node_noprof(__VA_ARGS__, NUMA_NO_NODE)
 #define kvcalloc_node_noprof(_n,_s,_f,_node)	kvmalloc_array_node_noprof(_n,_s,(_f)|__GFP_ZERO,_node)
 #define kvcalloc_noprof(...)			kvcalloc_node_noprof(__VA_ARGS__, NUMA_NO_NODE)
-
 #define kvmalloc_array(...)			alloc_hooks(kvmalloc_array_noprof(__VA_ARGS__))
 #define kvcalloc_node(...)			alloc_hooks(kvcalloc_node_noprof(__VA_ARGS__))
 #define kvcalloc(...)				alloc_hooks(kvcalloc_noprof(__VA_ARGS__))
 
-void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
-		__realloc_size(2);
+void *kvrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
+				  gfp_t flags, int nid) __realloc_size(2);
+#define kvrealloc_node_align(...)		kvrealloc_node_align_noprof(__VA_ARGS__)
+#define kvrealloc_node_noprof(_p, _s, _f, _n)	kvrealloc_node_align_noprof(_p, _s, 1, _f, _n)
+#define kvrealloc_node(...)			alloc_hooks(kvrealloc_node_noprof(__VA_ARGS__))
+#define kvrealloc_noprof(...)			kvrealloc_node_noprof(__VA_ARGS__, NUMA_NO_NODE)
 #define kvrealloc(...)				alloc_hooks(kvrealloc_noprof(__VA_ARGS__))
 
 extern void kvfree(const void *addr);
diff --git a/mm/nommu.c b/mm/nommu.c
index 87e1acab0d64..8359b2025b9f 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -119,7 +119,8 @@ void *__vmalloc_noprof(unsigned long size, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(__vmalloc_noprof);
 
-void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
+void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
+				 gfp_t flags, int node)
 {
 	return krealloc_noprof(p, size, (flags | __GFP_COMP) & ~__GFP_HIGHMEM);
 }
diff --git a/mm/slub.c b/mm/slub.c
index c4b64821e680..ec355ce31965 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4845,7 +4845,7 @@ void kfree(const void *object)
 EXPORT_SYMBOL(kfree);
 
 static __always_inline __realloc_size(2) void *
-__do_krealloc(const void *p, size_t new_size, gfp_t flags)
+__do_krealloc(const void *p, size_t new_size, unsigned long align, gfp_t flags, int nid)
 {
 	void *ret;
 	size_t ks = 0;
@@ -4859,6 +4859,19 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
 	if (!kasan_check_byte(p))
 		return NULL;
 
+	/* refuse to proceed if alignment is bigger than what kmalloc() provides */
+	if (((uintptr_t)p & (align - 1)) || new_size < align)
+		return NULL;
+
+	/*
+	 * it is possible to support reallocation with a different nid, but
+	 * it doesn't go well with the concept of krealloc(). Such
+	 * reallocation should be done explicitly instead.
+	 */
+	if (WARN(nid != NUMA_NO_NODE && nid != page_to_nid(virt_to_page(p)),
+				"krealloc() has mismatched nids\n"))
+		return NULL;
+
 	if (is_kfence_address(p)) {
 		ks = orig_size = kfence_ksize(p);
 	} else {
@@ -4903,7 +4916,7 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
 	return (void *)p;
 
 alloc_new:
-	ret = kmalloc_node_track_caller_noprof(new_size, flags, NUMA_NO_NODE, _RET_IP_);
+	ret = kmalloc_node_track_caller_noprof(new_size, flags, nid, _RET_IP_);
 	if (ret && p) {
 		/* Disable KASAN checks as the object's redzone is accessed. */
 		kasan_disable_current();
@@ -4915,10 +4928,12 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
 }
 
 /**
- * krealloc - reallocate memory. The contents will remain unchanged.
+ * krealloc_node_align - reallocate memory. The contents will remain unchanged.
  * @p: object to reallocate memory for.
  * @new_size: how many bytes of memory are required.
+ * @align: desired alignment.
  * @flags: the type of memory to allocate.
+ * @nid: NUMA node or NUMA_NO_NODE
  *
  * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
  * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
@@ -4947,7 +4962,8 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
  *
  * Return: pointer to the allocated memory or %NULL in case of error
  */
-void *krealloc_noprof(const void *p, size_t new_size, gfp_t flags)
+void *krealloc_node_align_noprof(const void *p, size_t new_size, unsigned long align,
+				 gfp_t flags, int nid)
 {
 	void *ret;
 
@@ -4956,13 +4972,13 @@ void *krealloc_noprof(const void *p, size_t new_size, gfp_t flags)
 		return ZERO_SIZE_PTR;
 	}
 
-	ret = __do_krealloc(p, new_size, flags);
+	ret = __do_krealloc(p, new_size, align, flags, nid);
 	if (ret && kasan_reset_tag(p) != kasan_reset_tag(ret))
 		kfree(p);
 
 	return ret;
 }
-EXPORT_SYMBOL(krealloc_noprof);
+EXPORT_SYMBOL(krealloc_node_align_noprof);
 
 static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
 {
@@ -4993,6 +5009,7 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
  * failure, fall back to non-contiguous (vmalloc) allocation.
  * @size: size of the request.
  * @b: which set of kmalloc buckets to allocate from.
+ * @align: desired alignment.
  * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
  * @node: numa node to allocate from
  *
@@ -5005,19 +5022,22 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
  *
  * Return: pointer to the allocated memory of %NULL in case of failure
  */
-void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
+void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
+			     gfp_t flags, int node)
 {
 	void *ret;
 
 	/*
 	 * It doesn't really make sense to fallback to vmalloc for sub page
-	 * requests
+	 * requests and small alignments
 	 */
-	ret = __do_kmalloc_node(size, PASS_BUCKET_PARAM(b),
-				kmalloc_gfp_adjust(flags, size),
-				node, _RET_IP_);
-	if (ret || size <= PAGE_SIZE)
-		return ret;
+	if (size >= align) {
+		ret = __do_kmalloc_node(size, PASS_BUCKET_PARAM(b),
+					kmalloc_gfp_adjust(flags, size),
+					node, _RET_IP_);
+		if (ret || size <= PAGE_SIZE)
+			return ret;
+	}
 
 	/* non-sleeping allocations are not supported by vmalloc */
 	if (!gfpflags_allow_blocking(flags))
@@ -5035,7 +5055,7 @@ void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
 	 * about the resulting pointer, and cannot play
 	 * protection games.
 	 */
-	return __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
+	return __vmalloc_node_range_noprof(size, align, VMALLOC_START, VMALLOC_END,
 			flags, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
 			node, __builtin_return_address(0));
 }
@@ -5079,10 +5099,12 @@ void kvfree_sensitive(const void *addr, size_t len)
 EXPORT_SYMBOL(kvfree_sensitive);
 
 /**
- * kvrealloc - reallocate memory; contents remain unchanged
+ * kvrealloc_node_align - reallocate memory; contents remain unchanged
  * @p: object to reallocate memory for
  * @size: the size to reallocate
+ * @align: desired alignment
  * @flags: the flags for the page level allocator
+ * @nid: NUMA node id
  *
  * If @p is %NULL, kvrealloc() behaves exactly like kvmalloc(). If @size is 0
  * and @p is not a %NULL pointer, the object pointed to is freed.
@@ -5100,17 +5122,18 @@ EXPORT_SYMBOL(kvfree_sensitive);
  *
  * Return: pointer to the allocated memory or %NULL in case of error
  */
-void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
+void *kvrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
+				  gfp_t flags, int nid)
 {
 	void *n;
 
 	if (is_vmalloc_addr(p))
-		return vrealloc_noprof(p, size, flags);
+		return vrealloc_node_align_noprof(p, size, align, flags, nid);
 
-	n = krealloc_noprof(p, size, kmalloc_gfp_adjust(flags, size));
+	n = krealloc_node_align_noprof(p, size, align, kmalloc_gfp_adjust(flags, size), nid);
 	if (!n) {
 		/* We failed to krealloc(), fall back to kvmalloc(). */
-		n = kvmalloc_noprof(size, flags);
+		n = kvmalloc_node_align_noprof(size, align, flags, nid);
 		if (!n)
 			return NULL;
 
@@ -5126,7 +5149,7 @@ void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
 
 	return n;
 }
-EXPORT_SYMBOL(kvrealloc_noprof);
+EXPORT_SYMBOL(kvrealloc_node_align_noprof);
 
 struct detached_freelist {
 	struct slab *slab;
-- 
2.39.2

