Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27239293C42
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016950; cv=none; b=Y4Nt5DtH/TKFkcoVWPTW75REdp2K++SAHUcVFs9lG2xJ0NsshVZ71nsM/DOrzbDNVyu5h4UQNllhitiTt5L7kkSKWT1Op4jdsd6ibVKqak773uDFhezBaVdyJpLjDEITEEII5n3ovp943zPaWjLI9msNT29pmtL6wWLUSE524l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016950; c=relaxed/simple;
	bh=3IEBar6mLVB3kmmqhzy1fX6Y8cIw4YGiIaa7fdoQdlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JFzABOZ8YLS1JqOKP87tqJeSiRhe8kS3sNcH5/FVKCIa9QCNeJyoxrh86v/XGjATJ0zNhzT7oKKC7SG86d6ZNwln482e9tO88Wt2Nd43hpyEGW+C6tOWgRwMBFe20TIVX198dxxEA2oiQP0o/KIXDVn2vo5kS1tncZOssKGQLAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=YaSWyKXm; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Bzs1mKGt; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="YaSWyKXm";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Bzs1mKGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751016940; x=1751621740;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=zkwJ4i4dwDao2rWYOJehq905CyIjzLTLMDu2gHmT6vw=;
	b=YaSWyKXmot4ncdE1drt7pMeviwBdIcXqNoGY6NnytCBGbPkJX1xNXgA0MIBpC6okkiNTFDfQ0V8EJ
	 CuekJCuGEPlainh8aj2VEeFrFMXUsjzgjerhC8zO6zOECq5RCUWVr29wSPRU/iHuePLowbM191wn5w
	 B1k6uJQ32mgdd/pUG/mN5UUOWPBIOtfMAqN/AeZorsB3PTj7WKq6jn41HTR3vU701QwHMLl1Fx+unW
	 nFezrdhwhJY96HA99BRw1dwu6VQSPwKIg/rgWBCY56L+sCo1YOh7nBeARmNumwVGe+gGh1LykHx2ls
	 CDncwNGw2R5KujtjU61XzUudSB5tSaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751016940; x=1751621740;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=zkwJ4i4dwDao2rWYOJehq905CyIjzLTLMDu2gHmT6vw=;
	b=Bzs1mKGtY2ZkvDPgn4Jsuquqs4SwAtKFF7QBvPxrxar+jfnNHX/5QUBRHAib5ALJZLOWEY3N11pxU
	 Rle9gJJAQ==
X-HalOne-ID: 1567cdf5-533a-11f0-83c2-e90f2b8e16ca
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 1567cdf5-533a-11f0-83c2-e90f2b8e16ca;
	Fri, 27 Jun 2025 09:35:39 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v5 1/4] mm/vmalloc: allow to set node and align in vrealloc
Date: Fri, 27 Jun 2025 11:35:29 +0200
Message-Id: <20250627093529.389311-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627092901.356909-1-vitaly.wool@konsulko.se>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
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
Reviewed-by: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
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
index 87e1acab0d64..6cec05c3312c 100644
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
index 6dbcdceecae1..412bf5b8d3ff 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4089,10 +4089,12 @@ void *vzalloc_node_noprof(unsigned long size, int node)
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
@@ -4111,7 +4113,7 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
  * Return: pointer to the allocated memory; %NULL if @size is zero or in case of
  *         failure
  */
-void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
+void *vrealloc_node_noprof(const void *p, size_t size, unsigned long align, gfp_t flags, int nid)
 {
 	struct vm_struct *vm = NULL;
 	size_t alloced_size = 0;
@@ -4135,6 +4137,13 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
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
@@ -4166,7 +4175,8 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
 	}
 
 	/* TODO: Grow the vm_area, i.e. allocate and map additional pages. */
-	n = __vmalloc_noprof(size, flags);
+	n = __vmalloc_node_noprof(size, align, flags, nid, __builtin_return_address(0));
+
 	if (!n)
 		return NULL;
 
-- 
2.39.2

