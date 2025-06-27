Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A90827381E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059536; cv=none; b=qHHR0LRTuEtZOJ9pIHEwxliqXlgLmSD5XrKqRGCYkjQPBTGFxzDdfoECNQr3QsVB4yXJip879IPGkD9ZemVc4QVZ/A7rN68y8alcmAM3S9lQn2tgmr4b7Ap03Jmw+3/iJT98haZZKcU5j6q6Xk9VKY5ghFZJtjFo1cnY1G1QtxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059536; c=relaxed/simple;
	bh=nZYbj1yAtgECMipsnUNlHPUK4pJhICc9gnUVyRAhqpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fFkWiP3GWCkahXcdzIkF1dDQAJCgLkkSMfi37Q+O/3yQaQcAGZHN5N21BhP8O40hUI8IIQUP4GLynCgksEgN4ucisaOS7MP1Ca1MAONFER3vTOjnIi9IR/IdAp+K2Gt4FmJQ9kM1jCzgwzYVYnoUWxWO14rQJ/yn0MmkOaxZSMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=F7V7LJBe; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=tYbqjutT; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="F7V7LJBe";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="tYbqjutT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751059532; x=1751664332;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=cg6Mb0y63NoDrvRbc/wKLzTLQZaf3be1Lhc8PUfhwzc=;
	b=F7V7LJBer2os7JqY9zbFKT7iuSqRrBgnxewbwZw0TSIZsl0Kea8SxF2fmfzBk5wIImMLUdklKUHm3
	 4XvVIagjSZeMjKl305enZjXPv5a9KtO/aBJfZ9Uk1ysXeB/8uFhwrlfZKXma0CAMRRwpxH97iR6eaS
	 PDUfLo2B3N5QH1OEkGqZuiughFMsY0dWi3vHd7RBhET5rc269rwUrmKYoB5gkt83uV5tEdp6k7xbmY
	 goazUPWUMRH5YqgBr7WFK+P0OZXcfXIOL5cd42W8XB7gWWbGt781qZsUFQKDa3DLmgdsConllB3ByZ
	 wYfI12bOesN0iGsdTU0ww8NKsCBLMGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751059532; x=1751664332;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=cg6Mb0y63NoDrvRbc/wKLzTLQZaf3be1Lhc8PUfhwzc=;
	b=tYbqjutTmaAQ0hzQx86gbBaLt9WfpoZui21Ut3vP2IQqfUiV+bA73RLzWb4vwjAxQ9/cwP5Sth/M5
	 l2IQAVgDA==
X-HalOne-ID: 40323c6c-539d-11f0-a66f-85eb291bc831
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 40323c6c-539d-11f0-a66f-85eb291bc831;
	Fri, 27 Jun 2025 21:25:32 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v7 1/4] mm/vmalloc: allow to set node and align in vrealloc
Date: Fri, 27 Jun 2025 23:25:23 +0200
Message-Id: <20250627212523.2181687-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627212451.2181627-1-vitaly.wool@konsulko.se>
References: <20250627212451.2181627-1-vitaly.wool@konsulko.se>
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

