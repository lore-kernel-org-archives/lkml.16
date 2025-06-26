Received: from mailrelay4-3.pub.mailoutpod3-cph3.one.com (mailrelay4-3.pub.mailoutpod3-cph3.one.com [46.30.212.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D17225F964
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926990; cv=none; b=SlB1bzxAwuty6yk+KCvOBrM/Y3GyyiCkhoaoTkNygnLKhvl8ym8xMfPxyQ5aogpjA4nll6PKv9HaQ7pvq9l+xLelCQJvGttSa751dOSEc3xwmgaYvZ8wPPDsqgbOZ67vMkQSkEFup+6Wd5O5mMvC49XfjIO9jJLGNvZLnKo+OYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926990; c=relaxed/simple;
	bh=gQn4VmqsD0HYtYPDRubHPhoNsnIoIExefHu5TFwwrKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I2xXY64SWyEP7ZnRSpj4+bi6JMmeU+ycNr6MnRwRQvSshxDKwjP1nRcPUOHgmcYFrRvuiCBun7CZrI8zsSIhJEPJlqPIsoUjaNHQ3WalREkvpEUAl/RtUGmCRvHF/uiuSMRHJkbtwCGcDiA3rkNK1dVIff7RUWH5AbHl20/ltY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=cn5kbwdr; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=ioaMVepK; arc=none smtp.client-ip=46.30.212.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="cn5kbwdr";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="ioaMVepK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750926980; x=1751531780;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=mkYpvclAYF6uZDEKl93atoHVzEINRICyZlGgMsyMSN8=;
	b=cn5kbwdrF0U0ijbydoKjcGWYj45rESCFlARBFb3a3xk5AeytbkLXtpXygHIvf+GHnFgyry4H/E8Y/
	 xa4ralAXWUP6A/CaZV2FHo372ysJfkKEB3JEjlOue5PyXGb9aPlmH5MbOLtrmvSeYZ56CzM/IK6eUv
	 siz7vAWhL/TZRX1bxFAWJCuDwUu6l4v8UshLbqzXQumX51vXO2qt4foDLN0oBPkfc5Mb9f2355CIHl
	 pBvlEekquW7MbiOgGNqfZufFOMp+dRrEhAKob6snl06Pahd9At3Gt1Dv8SYa2CbHn12U+Iip7rjlGz
	 XYHEOZwE51SJ++/fOk0KxyHedYLA6vA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750926980; x=1751531780;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=mkYpvclAYF6uZDEKl93atoHVzEINRICyZlGgMsyMSN8=;
	b=ioaMVepK/VgZgirl2GI14/87I/2Zw/jDC/YpwE31muFRDbDmhjKabDOkOwivvYa28cZkBVI+JPEim
	 CtS1W+ZAg==
X-HalOne-ID: a129904f-5268-11f0-9ab1-29b2d794c87d
Received: from localhost.localdomain (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id a129904f-5268-11f0-9ab1-29b2d794c87d;
	Thu, 26 Jun 2025 08:36:20 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCHi v4 1/4] mm/vmalloc: allow to set node and align in vrealloc
Date: Thu, 26 Jun 2025 10:36:17 +0200
Message-Id: <20250626083617.3596326-1-vitaly.wool@konsulko.se>
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

