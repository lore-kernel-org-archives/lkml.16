Received: from mailrelay2-3.pub.mailoutpod3-cph3.one.com (mailrelay2-3.pub.mailoutpod3-cph3.one.com [46.30.212.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E8B27C154
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758705; cv=none; b=GSkWZ7n+JPr2MFO0rd+x/3Qx8PVidiBGhznp40XKv9YHJZVnc4jFqNuP2v4vkZ9mjIfmrUFUiCK/BI5lvHOzzUVf5caa7k8gVlOl86Y5YosToiXCBkhKuvzYORpY1vylMy4KYuKu2DmLz+Q2bYZFt0N90q/KPWz9HtdlrFdivZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758705; c=relaxed/simple;
	bh=BFmKSpEgAwVocaPSZwF9WbqCvnn76JBej5o9Mf7w2BI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K6bKnF8b0hy2sgaoPDChQm7f/lafEjqyUI9lX7wYeWi/sSw2kD71GOKqI5sV+Lfo71WyDwo8EP/L4nZZJx6WMi4ECXAcQZOci7sJDHk1YK5ht2dFgztq6C+yWEpzIc4mjBm7LLPhCFD5sttJ8/Tq6PAwadZPrN4Aw5F5q8gvXUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=xb2dolm7; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=6hNG98yt; arc=none smtp.client-ip=46.30.212.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="xb2dolm7";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="6hNG98yt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750758693; x=1751363493;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=Y2ViI0m6Ko/2vCWgWrN+qyTDBaY8p8ed02QkoJAaUgU=;
	b=xb2dolm77e4o92saCnwSqyWpYW9GAv3uL4RlOkuUBjwsNbue22f0cRtCdJsd2htSG5QfloSi5BicU
	 K2vHl7Ki2kTNG+gg/n2Af4gF/60s+q64vAb8DiVr4sG8v5RBE7sj1fF6I9ESqldRIpLZKF2hPc4Rlf
	 2Wt+h/wMtVXkL0qH/mC6FZLINkVzjU4qJSoa51HNHv7VJj7AHpwXm5g2exIGo7uoOjmsMkkwlb3Mtm
	 KrW6wbHNAX7tsbKGMGAV8KO12Cc+Hx0g4R0T0kTiG9pCl4idcB05z2vvkTsZKQkNnazTAn5G4dqMha
	 KZCYMMMpuhADBp22uTamHK3rsqAcGOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750758693; x=1751363493;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=Y2ViI0m6Ko/2vCWgWrN+qyTDBaY8p8ed02QkoJAaUgU=;
	b=6hNG98ytp9OfWzzNVSjeBjQl0/oyu15lMqzPrsfOmom+8QOlJLCEQZpFo1W5VC1uL+GugOOoZ/T1R
	 nFD5FalAg==
X-HalOne-ID: ce8fdaae-50e0-11f0-b958-b37c246f863f
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id ce8fdaae-50e0-11f0-b958-b37c246f863f;
	Tue, 24 Jun 2025 09:51:33 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH] mm/vmalloc: allow to set node and align in vrealloc
Date: Tue, 24 Jun 2025 11:51:21 +0200
Message-Id: <20250624095121.3243540-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
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
 mm/vmalloc.c            | 16 +++++++++++++---
 2 files changed, 18 insertions(+), 6 deletions(-)

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

