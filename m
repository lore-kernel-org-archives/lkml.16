Received: from mailrelay3-3.pub.mailoutpod3-cph3.one.com (mailrelay3-3.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D771DE8AD
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048175; cv=none; b=XCaur+fG4jEoORb2OQoa5Ryppzi5AWS5jH5CP/3XdJ+M9Qk2iDpOPDH02cM/2GlEtfMolQtAaYEytFPwvrAlk7KWvLWkiIVnvj19Jy8DIhusi6WgUgCho3CHj7N5UD9QbbkiUg79/6bag6QmMaQFFvGX/H1kqcWL6K9R1xLcY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048175; c=relaxed/simple;
	bh=nZYbj1yAtgECMipsnUNlHPUK4pJhICc9gnUVyRAhqpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oFbqc+S9HUABEQHUVjBx9WijqgvXgHNDb7aPNAxOpkq45bvHB88FnXg/mHYlT+GXPIHUpVsvLengWln7s+UMrXnlU+GCPWBwDgl94jl8Gevoa7uXuebOXmKlYBAi+ULzhktW0dIPVGxFkMYWqfCL1MqnMuCkyY6BsmUKlUPz8/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=tymEKEXF; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=G+Yo+f4t; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="tymEKEXF";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="G+Yo+f4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751048170; x=1751652970;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=cg6Mb0y63NoDrvRbc/wKLzTLQZaf3be1Lhc8PUfhwzc=;
	b=tymEKEXFcvYmZXy0KkwgIZaGf2UBDbK1uB2G4E2TAKayCcyQpyRiSDwqSBkQ99b/gOd902CvNC/0m
	 xYPGgqCAv9hZkUPaQ4PN6a+YVXeSIFNOXoniGJ7oJnU4fwBY6uhVOyDzc/NHrQzxlr8gOCTR0oEP6y
	 ece5dpImWn7tbu1x///kauMWs1F7RVfrWVGd+iryHoxmVyeCSgtApKQMPSTxt0Qzirw9+HkeiMTVN/
	 wXIlI97ITYvzSJHpOBU0Sy2WXGVgWSCPU1JNjDNNlZiKF3liBP1U28JlhhUtRL5eV7Ty8wxyJ2KiFD
	 X29eY0iAaVkAFJ30LKkxG/WF/u3JYjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751048170; x=1751652970;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=cg6Mb0y63NoDrvRbc/wKLzTLQZaf3be1Lhc8PUfhwzc=;
	b=G+Yo+f4t+036wEfcSqr7KWcHT8T3kqaezBLHKVaG3rOqVNSs8aiCsMzeBcGf3eYiD4zhMVyLCQj5n
	 xalVbuGCw==
X-HalOne-ID: cc06b684-5382-11f0-a377-2b8368a4d5c5
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id cc06b684-5382-11f0-a377-2b8368a4d5c5;
	Fri, 27 Jun 2025 18:16:10 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v6 1/4] mm/vmalloc: allow to set node and align in vrealloc
Date: Fri, 27 Jun 2025 20:16:08 +0200
Message-Id: <20250627181608.2081032-1-vitaly.wool@konsulko.se>
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

