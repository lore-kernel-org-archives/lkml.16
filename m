Received: from mailrelay6-3.pub.mailoutpod3-cph3.one.com (mailrelay6-3.pub.mailoutpod3-cph3.one.com [46.30.212.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB4927A92A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768822; cv=none; b=kg4W+Ix0HB/NWWa8kE4U2NTwM5Q8JZ9VObH+EMoMVO+1t2EDKXzUApH0aDNY6v2R8K/dchsieJ04Hk7Z836TpznBQ3Z4SadKDHistZkPcf3ysG5RqX7jJEKC9Fqxf5mlqRF9KMXZA756ItkXlFRe/beo/XcWbasHtgKhrLVoOLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768822; c=relaxed/simple;
	bh=BFmKSpEgAwVocaPSZwF9WbqCvnn76JBej5o9Mf7w2BI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TpeftXrJzMrRtP/IwoevrbcTSTNyW+mUlu33ZhLACaTWb5Brdr2VItQ79NU8sf3zb9ncuo2lXUq0BbACA4CRb0Zrg9XFCRlgP7ejngNZuBt/oAGDZkIW7k7VQHrlSWFei71j4AURjpdMMsb6julbeHg/fbXI8CPFkB+bxq96XkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=hKXBcyCt; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=MB3dR8WM; arc=none smtp.client-ip=46.30.212.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="hKXBcyCt";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="MB3dR8WM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750768751; x=1751373551;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=Y2ViI0m6Ko/2vCWgWrN+qyTDBaY8p8ed02QkoJAaUgU=;
	b=hKXBcyCtTZxzLkN8mpgHSAfYZEWU5l+qCuOSVj7cNfRCA5yA8LHoOeCLe8x4xWHcfUxAPhGydbBRU
	 J8G76QvBJs9kYkWc0pi8CjmONrJUvbnSVw3guNwyXP7GOpiHti6bRj2amUWkyprqO8f43BJHw2o9yj
	 OS4BUuukZaG+b1x+XlKIuHn30VW4HY4gpOWXo1Bpprgzlg+qr+XLtq2vxWkLNIajeGCvEl+mEfuq9x
	 kQSOFnrawVjOd6cHcXatVNtdNPuuanWfLlg6dKWhSJ/65OldvxKLGhG9KJVRQWOv+Rlv7MaXToy8YL
	 w6K1ohoOZRTkei92DmmhBxhLjW4T4og==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750768751; x=1751373551;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=Y2ViI0m6Ko/2vCWgWrN+qyTDBaY8p8ed02QkoJAaUgU=;
	b=MB3dR8WMaOW2GcVuKef7Hy+l/TxqwQ9K9miFC3174PDQTm8/6rsk6qwOneg98wNrbrtLOFyaMtPhm
	 pyW18P+Bw==
X-HalOne-ID: 39ceac8b-50f8-11f0-b346-417246ffdc90
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 39ceac8b-50f8-11f0-b346-417246ffdc90;
	Tue, 24 Jun 2025 12:39:11 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v2 1/2] mm/vmalloc: allow to set node and align in vrealloc
Date: Tue, 24 Jun 2025 14:38:59 +0200
Message-Id: <20250624123859.3258172-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250624123743.3258032-1-vitaly.wool@konsulko.se>
References: <20250624123743.3258032-1-vitaly.wool@konsulko.se>
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

