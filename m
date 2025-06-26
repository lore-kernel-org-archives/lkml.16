Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A673293C7C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927000; cv=none; b=dfkn9oKWsBjVSe/k4DFVWyixkISk1KMffObrbb1zotoEoUTq6kkWuNF6/lFJzqd/PZh4vqaFpPHW+QF8yvQipstZDDcqz67tfD+v2AO0lnNDX854Pkfv4jBLfO/dkMYimaqn3e8/7XEeuuSo630wx6mxdvvj0SAtQZPQPQrScPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927000; c=relaxed/simple;
	bh=7YJuPkik1KBD4lbPP0cuZ1cG07RJnRRNZjS8MiZCo2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eTa1BiiaRHDYK6MOZ01zM+DMUI294PRpuz5rmt0t1yLpUUUjaTF0u+qQ0DIH7Q7fMlpLzuRuPyyONKh4iTMo7CbcgDLC0syCKWueDiDxDM0ZNhyerEx2qK8saIQeXsJQraypwVVZQUp8c8E4ABzntnjvKqla+LgFnIzszhK55pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=MaS7+d3L; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=qnY2tAg/; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="MaS7+d3L";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="qnY2tAg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750926995; x=1751531795;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=Q5e5J6xYEr32Saw5MlCRa9dyPVfRH3gV92WpTITaL6o=;
	b=MaS7+d3L0+J4gcShT3GTbAbNh5ouzKp+jOaPmM0g+E+7fLZVh6GgLfaeu+UosCXCzM9R0y8gixXA4
	 eNfqL+pMtCT6Pj+vfp5hcRW2RyZX9DXhO5iq+KDhMiWNQUE4yTsuqIyagAgWW5gsWsXMVIXBVsIHEw
	 lL7alYl0yFc4kW4E3zCaI7k7PQhS6onHggDC446DlYqAUo7VLRU/hRt2BM3BubhtVGJWzPRjzEU9ts
	 CbOB5SxwUOKyIBTsHrqQNe8RuBby/DA8uiPVFxCojeZcxXXN/B7F6gGzs+GPAU8svugc+JxVasZFAw
	 Nb2GeCwPgU4K5jRrij+MJ3uq7qC3iWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750926995; x=1751531795;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=Q5e5J6xYEr32Saw5MlCRa9dyPVfRH3gV92WpTITaL6o=;
	b=qnY2tAg/vZxKCqbs9EOFAShQHto+WqH5SYbgnc7coU/nZHRzgBwuwh6CbUt4Abl7Jj1kEKetkd4gI
	 v6O2GoJCg==
X-HalOne-ID: a964cd49-5268-11f0-9a7d-4f541c8bf1cc
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id a964cd49-5268-11f0-9a7d-4f541c8bf1cc;
	Thu, 26 Jun 2025 08:36:34 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v4 2/4] mm/slub: allow to set node and align in k[v]realloc
Date: Thu, 26 Jun 2025 10:36:32 +0200
Message-Id: <20250626083632.3596363-1-vitaly.wool@konsulko.se>
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

Reimplement k[v]realloc() to be able to set node and alignment
should a user need to do so. Rename the respective functions to
k[v]realloc_node() to better match what they actually do now and
introduce macros for k[v]realloc() for backward compatibility.

With that change we also provide the ability for the Rust part of
the kernel to set node and aligmnent in its K[v]xxx [re]allocations.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 include/linux/slab.h | 12 ++++++++----
 mm/slub.c            | 33 ++++++++++++++++++++++-----------
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index d5a8ab98035c..119f100978c8 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -465,9 +465,11 @@ int kmem_cache_shrink(struct kmem_cache *s);
 /*
  * Common kmalloc functions provided by all allocators
  */
-void * __must_check krealloc_noprof(const void *objp, size_t new_size,
-				    gfp_t flags) __realloc_size(2);
-#define krealloc(...)				alloc_hooks(krealloc_noprof(__VA_ARGS__))
+void * __must_check krealloc_node_noprof(const void *objp, size_t new_size,
+					 gfp_t flags, int nid) __realloc_size(2);
+#define krealloc_node(...)		alloc_hooks(krealloc_node_noprof(__VA_ARGS__))
+#define krealloc_noprof(o, s, f)	krealloc_node_noprof(o, s, f, NUMA_NO_NODE)
+#define krealloc(...)			alloc_hooks(krealloc_noprof(__VA_ARGS__))
 
 void kfree(const void *objp);
 void kfree_sensitive(const void *objp);
@@ -1073,8 +1075,10 @@ kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node)
 #define kvcalloc_node(...)			alloc_hooks(kvcalloc_node_noprof(__VA_ARGS__))
 #define kvcalloc(...)				alloc_hooks(kvcalloc_noprof(__VA_ARGS__))
 
-void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
+void *kvrealloc_node_noprof(const void *p, size_t size, gfp_t flags, int nid)
 		__realloc_size(2);
+#define kvrealloc_node(...)			alloc_hooks(kvrealloc_node_noprof(__VA_ARGS__))
+#define kvrealloc_noprof(p, s, f)		kvrealloc_node_noprof(p, s, f, NUMA_NO_NODE)
 #define kvrealloc(...)				alloc_hooks(kvrealloc_noprof(__VA_ARGS__))
 
 extern void kvfree(const void *addr);
diff --git a/mm/slub.c b/mm/slub.c
index c4b64821e680..2d5150d075d5 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4845,7 +4845,7 @@ void kfree(const void *object)
 EXPORT_SYMBOL(kfree);
 
 static __always_inline __realloc_size(2) void *
-__do_krealloc(const void *p, size_t new_size, gfp_t flags)
+__do_krealloc(const void *p, size_t new_size, gfp_t flags, int nid)
 {
 	void *ret;
 	size_t ks = 0;
@@ -4859,6 +4859,15 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
 	if (!kasan_check_byte(p))
 		return NULL;
 
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
@@ -4903,7 +4912,7 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
 	return (void *)p;
 
 alloc_new:
-	ret = kmalloc_node_track_caller_noprof(new_size, flags, NUMA_NO_NODE, _RET_IP_);
+	ret = kmalloc_node_track_caller_noprof(new_size, flags, nid, _RET_IP_);
 	if (ret && p) {
 		/* Disable KASAN checks as the object's redzone is accessed. */
 		kasan_disable_current();
@@ -4919,6 +4928,7 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
  * @p: object to reallocate memory for.
  * @new_size: how many bytes of memory are required.
  * @flags: the type of memory to allocate.
+ * @nid: NUMA node or NUMA_NO_NODE
  *
  * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
  * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
@@ -4947,7 +4957,7 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
  *
  * Return: pointer to the allocated memory or %NULL in case of error
  */
-void *krealloc_noprof(const void *p, size_t new_size, gfp_t flags)
+void *krealloc_node_noprof(const void *p, size_t new_size, gfp_t flags, int nid)
 {
 	void *ret;
 
@@ -4956,13 +4966,13 @@ void *krealloc_noprof(const void *p, size_t new_size, gfp_t flags)
 		return ZERO_SIZE_PTR;
 	}
 
-	ret = __do_krealloc(p, new_size, flags);
+	ret = __do_krealloc(p, new_size, flags, nid);
 	if (ret && kasan_reset_tag(p) != kasan_reset_tag(ret))
 		kfree(p);
 
 	return ret;
 }
-EXPORT_SYMBOL(krealloc_noprof);
+EXPORT_SYMBOL(krealloc_node_noprof);
 
 static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
 {
@@ -5079,10 +5089,11 @@ void kvfree_sensitive(const void *addr, size_t len)
 EXPORT_SYMBOL(kvfree_sensitive);
 
 /**
- * kvrealloc - reallocate memory; contents remain unchanged
+ * kvrealloc_node - reallocate memory; contents remain unchanged
  * @p: object to reallocate memory for
  * @size: the size to reallocate
  * @flags: the flags for the page level allocator
+ * @nid: NUMA node id
  *
  * If @p is %NULL, kvrealloc() behaves exactly like kvmalloc(). If @size is 0
  * and @p is not a %NULL pointer, the object pointed to is freed.
@@ -5100,17 +5111,17 @@ EXPORT_SYMBOL(kvfree_sensitive);
  *
  * Return: pointer to the allocated memory or %NULL in case of error
  */
-void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
+void *kvrealloc_node_noprof(const void *p, size_t size, gfp_t flags, int nid)
 {
 	void *n;
 
 	if (is_vmalloc_addr(p))
-		return vrealloc_noprof(p, size, flags);
+		return vrealloc_node_noprof(p, size, 1, flags, nid);
 
-	n = krealloc_noprof(p, size, kmalloc_gfp_adjust(flags, size));
+	n = krealloc_node_noprof(p, size, kmalloc_gfp_adjust(flags, size), nid);
 	if (!n) {
 		/* We failed to krealloc(), fall back to kvmalloc(). */
-		n = kvmalloc_noprof(size, flags);
+		n = kvmalloc_node_noprof(size, flags, nid);
 		if (!n)
 			return NULL;
 
@@ -5126,7 +5137,7 @@ void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
 
 	return n;
 }
-EXPORT_SYMBOL(kvrealloc_noprof);
+EXPORT_SYMBOL(kvrealloc_node_noprof);
 
 struct detached_freelist {
 	struct slab *slab;
-- 
2.39.2

