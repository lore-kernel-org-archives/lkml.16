Received: from mailrelay6-3.pub.mailoutpod3-cph3.one.com (mailrelay6-3.pub.mailoutpod3-cph3.one.com [46.30.212.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2957F9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833021; cv=none; b=BnxDJ4CTBA4fWAK0ca376DILIChqHYS5RsvjzQ9gWFydOpjfqojFQFpX8hK+lAfnMd5RL9o8qivZqnfvsZFxuAUXULDeYcskE240UUXLz1iEiplvawa9ROTK/hSgCtYWwudHB67vxc1e4tUNSvAIOfUBdUPpRe5mVUJuxbyqewQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833021; c=relaxed/simple;
	bh=qQLmriCJNRXZyEY7sikt2q77Kex+BuQ1f8VEOCmEHNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OQrrPE7C2hekr/eJeJNsUyrwdgJOqSR3KuJP9tQjo9kqsOAVo35yI3qoY1dFGnwlG+e1EjVLwKr9c4gOVxjbssOdEghegn2Cv4FXCn44cA9Dqjs02Mqcl3KUGW1WgzyRSPSrsjELj0P4V0WPMg286zf9G7xLFaT7zVfdjco936M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=mdHOsk+K; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=D4JuP3p3; arc=none smtp.client-ip=46.30.212.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="mdHOsk+K";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="D4JuP3p3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750833016; x=1751437816;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=D0x/pTDcFb9pevSx82X48KOGSgZKiyjVSzlAvoUa5m8=;
	b=mdHOsk+K5OeP97lLxGWgnLKIr0zfdUY00pO8VkeUHl5J4yZvHK0l1WUZf7QzxbK0movr+tHiUIy4N
	 IunkDRbwiGpDICzRVUz55cpN6T9ggAweEbnVVzMGNdUhHph3xmQeNFZMFOmgkNkSx9yYL5YUOIQ2X+
	 tgzB2pmtBahZa8locAt037aGaAv8Xw12f5zfTCSAcmyY6LdAZ/xXycvRhs3tg0OnD2qBQ+OnxNbymy
	 ew38oO1m5FiLbqwg1hy0llLBUXm0cFfzsVzBVJbdPMrv7NEXeNsq7K4rL0eLZAdSmon4KytHS1BWis
	 2mSqRrya3Q6AfMB6DgO/TD1MsJjeyBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750833016; x=1751437816;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=D0x/pTDcFb9pevSx82X48KOGSgZKiyjVSzlAvoUa5m8=;
	b=D4JuP3p3A3CvYIHdITepWPPwZJJgK6lsUPXyNfCfPJbAHtG8G/S2wadzC7MZzGtHKpYLtisVT8oa1
	 kOFQM6aCw==
X-HalOne-ID: dabebd03-518d-11f0-bce5-417246ffdc90
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id dabebd03-518d-11f0-bce5-417246ffdc90;
	Wed, 25 Jun 2025 06:30:16 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v3 1/2] mm/vmalloc: allow to set node and align in vrealloc
Date: Wed, 25 Jun 2025 08:30:13 +0200
Message-Id: <20250625063013.3379896-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reimplement vrealloc() to be able to set node and alignment should
a user need to do so. Rename the function to vrealloc_node() to
better match what it actually does now and introduce a macro for
vrealloc() for backward compatibility.

With that change we also provide the ability for the Rust part of
the kernel to set node and aligmnent in its allocations.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 include/linux/vmalloc.h |  8 +++++---
 mm/nommu.c              |  3 ++-
 mm/vmalloc.c            | 16 +++++++++++++---
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index fdc9aeb74a44..7d5251287687 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -197,9 +197,11 @@ extern void *__vcalloc_noprof(size_t n, size_t size, gfp_t flags) __alloc_size(1
 extern void *vcalloc_noprof(size_t n, size_t size) __alloc_size(1, 2);
 #define vcalloc(...)		alloc_hooks(vcalloc_noprof(__VA_ARGS__))
 
-void * __must_check vrealloc_noprof(const void *p, size_t size, gfp_t flags)
-		__realloc_size(2);
-#define vrealloc(...)		alloc_hooks(vrealloc_noprof(__VA_ARGS__))
+void *__must_check vrealloc_node_noprof(const void *p, size_t size,
+		unsigned long align, gfp_t flags, int nid) __realloc_size(2);
+#define vrealloc_noprof(p, s, f)	vrealloc_node_noprof(p, s, 1, f, NUMA_NO_NODE)
+#define vrealloc_node(...)		alloc_hooks(vrealloc_node_noprof(__VA_ARGS__))
+#define vrealloc(...)			alloc_hooks(vrealloc_noprof(__VA_ARGS__))
 
 extern void vfree(const void *addr);
 extern void vfree_atomic(const void *addr);
diff --git a/mm/nommu.c b/mm/nommu.c
index b624acec6d2e..ae240115607f 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -119,7 +119,8 @@ void *__vmalloc_noprof(unsigned long size, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(__vmalloc_noprof);
 
-void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
+void *vrealloc_node_noprof(const void *p, size_t size, unsigned long align,
+			   gfp_t flags, int nid)
 {
 	return krealloc_noprof(p, size, (flags | __GFP_COMP) & ~__GFP_HIGHMEM);
 }
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ab986dd09b6a..117894301db1 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4081,10 +4081,12 @@ void *vzalloc_node_noprof(unsigned long size, int node)
 EXPORT_SYMBOL(vzalloc_node_noprof);
 
 /**
- * vrealloc - reallocate virtually contiguous memory; contents remain unchanged
+ * vrealloc_node - reallocate virtually contiguous memory; contents remain unchanged
  * @p: object to reallocate memory for
  * @size: the size to reallocate
+ * @align: requested alignment
  * @flags: the flags for the page level allocator
+ * @nid: node id
  *
  * If @p is %NULL, vrealloc() behaves exactly like vmalloc(). If @size is 0 and
  * @p is not a %NULL pointer, the object pointed to is freed.
@@ -4103,7 +4105,7 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
  * Return: pointer to the allocated memory; %NULL if @size is zero or in case of
  *         failure
  */
-void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
+void *vrealloc_node_noprof(const void *p, size_t size, unsigned long align, gfp_t flags, int nid)
 {
 	struct vm_struct *vm = NULL;
 	size_t alloced_size = 0;
@@ -4127,6 +4129,13 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
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
@@ -4158,7 +4167,8 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
 	}
 
 	/* TODO: Grow the vm_area, i.e. allocate and map additional pages. */
-	n = __vmalloc_noprof(size, flags);
+	n = __vmalloc_node_noprof(size, align, flags, nid, __builtin_return_address(0));
+
 	if (!n)
 		return NULL;
 
-- 
2.39.2

