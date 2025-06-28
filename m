Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDAD13BAE3
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751106352; cv=none; b=fOXFKQr+hyrAbh6EgHpqMWTdbke1S2IjNQTU/gRjZTDmnAMSpqUv649RurlPfrZbogoFbGH07bihCEMIv3zgbW4rPh0LgV9/ia0TGtWeAore1/TwfIetGu2RTuj27vOhc0eOzGyoMvXJN/Osg9rnvtNkRybtv51YQZxBVxgyne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751106352; c=relaxed/simple;
	bh=nZYbj1yAtgECMipsnUNlHPUK4pJhICc9gnUVyRAhqpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oFoZov1LlxuEQRi7zHBORZqz0YiW4OY/oOxowGMgpyazgxvv9Q+kjFL67zDbzFNVIpEtdrLPvCY9P2lvYnY+CM6GOYcZuCG/2suy+FMMFi7aSR2/kSiupFGicOOcyL/i4swztuFIqa+zPDaZ4bCmOPnl7QrYGZ/MhU47ElLi/G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=tKbMwsNy; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=3Cx0u+rk; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="tKbMwsNy";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="3Cx0u+rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751106343; x=1751711143;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=cg6Mb0y63NoDrvRbc/wKLzTLQZaf3be1Lhc8PUfhwzc=;
	b=tKbMwsNyIkt/bTwNj0rS4UH6zvFFzJGbmhgbVHAJ8ZrDQvIffWCH35ZERPZcXT9QhCH71fR4StMiM
	 jVjszMRLvMi6fdD7suY6HOypKZ5Se3srobtzUe8Hk4TfqtL+iygxsb0RkqmWhGOGDCqlehnaX+7NrU
	 bBb8c24fuxRzXVM/DuRegAdlOfit1b5a04jbiQPJX7fjZjga5wIn4s1CQq1wbTk4/YSqxZwB+sRG0v
	 10KWxXiKk2KJdntER5viXvFyBhWY8ioy0B+diRjvU/iUOE1eJtMJtWgBAdHBIHqlUaVlz2pa0zbT6S
	 bZVlamSlWDszecFpA9LaMXbCEnp8VBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751106343; x=1751711143;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=cg6Mb0y63NoDrvRbc/wKLzTLQZaf3be1Lhc8PUfhwzc=;
	b=3Cx0u+rk5lfa4MfnUhs/vJ1SknAS8kGUuR/1qfyj1wr2+IhX8NDzDPItusiR62t0dkPGSm1AIytPe
	 cIi3ui7Dg==
X-HalOne-ID: 3d44602b-540a-11f0-b10f-85eb291bc831
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 3d44602b-540a-11f0-b10f-85eb291bc831;
	Sat, 28 Jun 2025 10:25:42 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v8 1/4] mm/vmalloc: allow to set node and align in vrealloc
Date: Sat, 28 Jun 2025 12:25:37 +0200
Message-Id: <20250628102537.2542789-1-vitaly.wool@konsulko.se>
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

Reimplement vrealloc() to be able to set node and alignment should
a user need to do so. Rename the function to vrealloc_node_align()
to better match what it actually does now and introduce macros for
vrealloc() and friends for backward compatibility.

With that change we also provide the ability for the Rust part of
the kernel to set node and aligmnent in its allocations.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 include/linux/vmalloc.h | 12 +++++++++---
 mm/vmalloc.c            | 20 ++++++++++++++++----
 2 files changed, 25 insertions(+), 7 deletions(-)

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
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6dbcdceecae1..d633ac0ff977 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4089,12 +4089,15 @@ void *vzalloc_node_noprof(unsigned long size, int node)
 EXPORT_SYMBOL(vzalloc_node_noprof);
 
 /**
- * vrealloc - reallocate virtually contiguous memory; contents remain unchanged
+ * vrealloc_node_align_noprof - reallocate virtually contiguous memory; contents
+ * remain unchanged
  * @p: object to reallocate memory for
  * @size: the size to reallocate
+ * @align: requested alignment
  * @flags: the flags for the page level allocator
+ * @nid: node id
  *
- * If @p is %NULL, vrealloc() behaves exactly like vmalloc(). If @size is 0 and
+ * If @p is %NULL, vrealloc_XXX() behaves exactly like vmalloc(). If @size is 0 and
  * @p is not a %NULL pointer, the object pointed to is freed.
  *
  * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
@@ -4111,7 +4114,8 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
  * Return: pointer to the allocated memory; %NULL if @size is zero or in case of
  *         failure
  */
-void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
+void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
+				 gfp_t flags, int nid)
 {
 	struct vm_struct *vm = NULL;
 	size_t alloced_size = 0;
@@ -4135,6 +4139,13 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
 		if (WARN(alloced_size < old_size,
 			 "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
 			return NULL;
+		if (WARN(nid != NUMA_NO_NODE && nid != page_to_nid(vmalloc_to_page(p)),
+			 "vrealloc() has mismatched nids\n"))
+			return NULL;
+		if (WARN((uintptr_t)p & (align - 1),
+			 "will not reallocate with a bigger alignment (0x%lx)\n",
+			 align))
+			return NULL;
 	}
 
 	/*
@@ -4166,7 +4177,8 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
 	}
 
 	/* TODO: Grow the vm_area, i.e. allocate and map additional pages. */
-	n = __vmalloc_noprof(size, flags);
+	n = __vmalloc_node_noprof(size, align, flags, nid, __builtin_return_address(0));
+
 	if (!n)
 		return NULL;
 
-- 
2.39.2

