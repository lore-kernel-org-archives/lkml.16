Received: from mailrelay2-3.pub.mailoutpod3-cph3.one.com (mailrelay2-3.pub.mailoutpod3-cph3.one.com [46.30.212.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF063FC1D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321790; cv=none; b=syfSjfmohJna44E6EvzBM+vBqx8jGYF7aJBEqgM0+/AyS8ir1eRGqO9+4K7UcqPyzWGRTI84aTZZjX5HEBGwHJkZNztAM/v8ZRO9AFUy4dRSdA5fUwyfTCjIdNpvLeX26/eD6PUuxCNDl912gwP3o5JJtqyWcVtr6rTwuzwz83g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321790; c=relaxed/simple;
	bh=s/J2Pgoc2VlrryNCeBnaOgwc8Yno1X59Y8j8yfjwpGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7l5SMKOdkoxPwznqmYFKEhEx1ZXcayLH2hi5gKDRsd88vf4jjO7xQ6KjQTj5SO43FuutWmyeg90kNghTj7JPPb9Gg6ap/a8eRe46V6SldsUTsZ0Tbtb/3A2EeJUV55mnx/Cg93hhmnxVZGg9/Z/ddFn3aXvW7WUzl13DqrHLQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=D+I0dwqm; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=LwGnb9Aq; arc=none smtp.client-ip=46.30.212.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="D+I0dwqm";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="LwGnb9Aq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751321779; x=1751926579;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=c8OUTOJ9QXIZKHiAVisSVEZ4SA1EHQ39CWuIRc9zb34=;
	b=D+I0dwqmAPoXotdh/DdKx53RAW/esHPU/sB+Wlf07DkduSmH/+k9qAl3f3psAtzRsmlXhDS9gyriZ
	 YcmOYuaFR8lmrmGpvKpQd9ITV9n0lm33VjJbuVtKiOnRAzzXfOicCvQMQ/PhzW+FVvyiAoX4XRGTQZ
	 n6O+XJL5DImAynvj+f25zOaQIHd+zmnLNIqGYJHw7itvK5lfDsRKiyKlokP+ELh+5LtaxmwYGgdlzB
	 Y4PpbsWtzU3bjYVVmPmA6bKhUvkDpv9uLWLJCVCcrUwPBetakE8uBre4WRFvuNJxpQa+K2RjH3rNWF
	 FC8KnhDm2+vH9amrHtQsDxxG5obbLjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751321779; x=1751926579;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=c8OUTOJ9QXIZKHiAVisSVEZ4SA1EHQ39CWuIRc9zb34=;
	b=LwGnb9Aqhrck1QYSdmBDPAUZaSDs75sbAEIkom7dtYOhQLAnRJZyyPoOArUZWeMy0c2HsU4vSj935
	 HRPsca4Cw==
X-HalOne-ID: d79ef2f0-55ff-11f0-aa71-b37c246f863f
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id d79ef2f0-55ff-11f0-aa71-b37c246f863f;
	Mon, 30 Jun 2025 22:16:19 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH v9 1/4] mm/vmalloc: allow to set node and align in vrealloc
Date: Tue,  1 Jul 2025 00:16:15 +0200
Message-Id: <20250630221615.3325221-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
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
 mm/vmalloc.c            | 19 +++++++++++++++----
 2 files changed, 24 insertions(+), 7 deletions(-)

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
index 6dbcdceecae1..776c68f84ce2 100644
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
@@ -4135,6 +4139,11 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
 		if (WARN(alloced_size < old_size,
 			 "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
 			return NULL;
+		if (WARN(!IS_ALIGNED((unsigned long)p, align),
+			 "will not reallocate with a bigger alignment (0x%lx)\n", align))
+			return NULL;
+		if (nid != NUMA_NO_NODE && nid != page_to_nid(vmalloc_to_page(p)))
+			goto need_realloc;
 	}
 
 	/*
@@ -4165,8 +4174,10 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
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

