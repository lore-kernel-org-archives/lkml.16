Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91B3277CBE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472539; cv=none; b=AnvUiYrTk2UAc/fpqX1vX+pkHg6ZVZal/al8CmthBjO7ELnCdMXfMc0cpxDv80chOvxDcSDCaFlqclioYCUTLA/jvR2BaU2erWUWjst01MLqY0yxF4OGYyaW6jq25fHPL0lXbUHSX69t/RQ9wM3EYWjI8EJhKpKiErW2LyW3xcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472539; c=relaxed/simple;
	bh=uuUIbVChYGhxrD5dWkUuFMwdkRQr+hZAE/kcktlGaZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bHHX5pkfHpQEy7Hry8QULH0OFWSntIFiJ7qtaQG8cV1lVUzZDN2y1MEX2qTwliVRXmPvnMknNPcU0It6dfJQrnub53yePx+IYMk7eU55Vvw3kgCjOpw9F/MrgUAjiv52L/lCdxr5xwEghQhLjNTCef3FumxhrriNpn7vdTkn+Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=ZBMCZCPn; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=VVI2Xym9; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="ZBMCZCPn";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="VVI2Xym9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751472528; x=1752077328;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=Ln1llgkBCQ/Qt4TjbrmuVUjDSkuRqAErFzL4PoDrisM=;
	b=ZBMCZCPn7r1ZV0gxLEEStHFIZACbUHbsvkxTgHO7+ga1Na9vZ8S92L5PtooBPkOtH6tCmHt6FtjD6
	 sMzMlhpToTZBI2732u3wTE+NyV33d7EULB3dKsPV3tLrZfCsmFMlns84zH3CxtDTDoudc+sgMPaK0U
	 NAa1bfMgfhZx0MPFRJJyERo5Z7dOSgkxZTphCyfxDOykPxtWzXOco+ZCjCdFSrblyMta1y8cxx1Z7T
	 5bNA/ftY6543QfEou+rTtDGJlKDjvPtDyJDsF14cIE7t01Cq0cLtRqjXmpUF5nPEG5Ar124fi8HcNU
	 D2wWDit3G1nW4tWEdKQNk/dPV0+oqiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751472528; x=1752077328;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=Ln1llgkBCQ/Qt4TjbrmuVUjDSkuRqAErFzL4PoDrisM=;
	b=VVI2Xym9dZzXl0nrMrsLgsPo2DjnjwTa8c/gUaKew027WHpRiXPf4kKNAd1LG/7ddG9HYr/m7Ob6D
	 jNCP68dAA==
X-HalOne-ID: d5257562-575e-11f0-bdbb-85eb291bc831
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id d5257562-575e-11f0-bdbb-85eb291bc831;
	Wed, 02 Jul 2025 16:08:48 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v10 1/4] mm/vmalloc: allow to set node and align in vrealloc
Date: Wed,  2 Jul 2025 18:08:24 +0200
Message-Id: <20250702160824.3610055-1-vitaly.wool@konsulko.se>
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

Reimplement vrealloc() to be able to set node and alignment should
a user need to do so. Rename the function to vrealloc_node_align()
to better match what it actually does now and introduce macros for
vrealloc() and friends for backward compatibility.

With that change we also provide the ability for the Rust part of
the kernel to set node and alignment in its allocations.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 include/linux/vmalloc.h | 12 +++++++++---
 mm/nommu.c              |  3 ++-
 mm/vmalloc.c            | 28 +++++++++++++++++++++++-----
 3 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index fdc9aeb74a44..68791f7cb3ba 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -197,9 +197,15 @@ extern void *__vcalloc_noprof(size_t n, size_t size, gfp_t flags) __alloc_size(1
 extern void *vcalloc_noprof(size_t n, size_t size) __alloc_size(1, 2);
 #define vcalloc(...)		alloc_hooks(vcalloc_noprof(__VA_ARGS__))
 
-void * __must_check vrealloc_noprof(const void *p, size_t size, gfp_t flags)
-		__realloc_size(2);
-#define vrealloc(...)		alloc_hooks(vrealloc_noprof(__VA_ARGS__))
+void *__must_check vrealloc_node_align_noprof(const void *p, size_t size,
+		unsigned long align, gfp_t flags, int nid) __realloc_size(2);
+#define vrealloc_node_noprof(_p, _s, _f, _nid)	\
+	vrealloc_node_align_noprof(_p, _s, 1, _f, _nid)
+#define vrealloc_noprof(_p, _s, _f)		\
+	vrealloc_node_align_noprof(_p, _s, 1, _f, NUMA_NO_NODE)
+#define vrealloc_node_align(...)		alloc_hooks(vrealloc_node_align_noprof(__VA_ARGS__))
+#define vrealloc_node(...)			alloc_hooks(vrealloc_node_noprof(__VA_ARGS__))
+#define vrealloc(...)				alloc_hooks(vrealloc_noprof(__VA_ARGS__))
 
 extern void vfree(const void *addr);
 extern void vfree_atomic(const void *addr);
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
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6dbcdceecae1..412664656870 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4089,13 +4089,22 @@ void *vzalloc_node_noprof(unsigned long size, int node)
 EXPORT_SYMBOL(vzalloc_node_noprof);
 
 /**
- * vrealloc - reallocate virtually contiguous memory; contents remain unchanged
+ * vrealloc_node_align_noprof - reallocate virtually contiguous memory; contents
+ * remain unchanged
  * @p: object to reallocate memory for
  * @size: the size to reallocate
+ * @align: requested alignment
  * @flags: the flags for the page level allocator
+ * @nid: node number of the target node
+ *
+ * If @p is %NULL, vrealloc_XXX() behaves exactly like vmalloc(). If @size is
+ * 0 and @p is not a %NULL pointer, the object pointed to is freed.
  *
- * If @p is %NULL, vrealloc() behaves exactly like vmalloc(). If @size is 0 and
- * @p is not a %NULL pointer, the object pointed to is freed.
+ * if @nid is not NUMA_NO_NODE, this function will try to allocate memory on
+ * the given node. If reallocation is not necessary (e. g. the new size is less
+ * than the current allocated size), the current allocation will be preserved
+ * unless __GFP_THISNODE is set. In the latter case a new allocation on the
+ * requested node will be attempted.
  *
  * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
  * initial memory allocation, every subsequent call to this API for the same
@@ -4111,7 +4120,8 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
  * Return: pointer to the allocated memory; %NULL if @size is zero or in case of
  *         failure
  */
-void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
+void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
+				 gfp_t flags, int nid)
 {
 	struct vm_struct *vm = NULL;
 	size_t alloced_size = 0;
@@ -4135,6 +4145,12 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
 		if (WARN(alloced_size < old_size,
 			 "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
 			return NULL;
+		if (WARN(!IS_ALIGNED((unsigned long)p, align),
+			 "will not reallocate with a bigger alignment (0x%lx)\n", align))
+			return NULL;
+		if (unlikely(flags & __GFP_THISNODE) && nid != NUMA_NO_NODE &&
+			     nid != page_to_nid(vmalloc_to_page(p)))
+			goto need_realloc;
 	}
 
 	/*
@@ -4165,8 +4181,10 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
 		return (void *)p;
 	}
 
+need_realloc:
 	/* TODO: Grow the vm_area, i.e. allocate and map additional pages. */
-	n = __vmalloc_noprof(size, flags);
+	n = __vmalloc_node_noprof(size, align, flags, nid, __builtin_return_address(0));
+
 	if (!n)
 		return NULL;
 
-- 
2.39.2

