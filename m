Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE57205E00
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041474; cv=none; b=aY4izTWYtLwFXCwbqjTGVnTkQxXhLOuQzBPCZ4YWL071WM3dHhPvTYBbSxFjQI2kvhXK/9avbOoN7tbhhOux1lgYrqRJLOjHp0CSXpDe542fFjEPxcNIGzwyve1+82sOvjVMAB+O/OsPSoRWHnCX/iiZwrI3ncDpJucDzuE4Hb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041474; c=relaxed/simple;
	bh=LqNzPbHVr/YdzrkJlwIphlHRZxx/nS6ZHMaT8AIKgss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4KQR3E6xkwweRs/i1aGzxSuBy/Thcb0BhOCJNn8UmeMUkr3Yvx6cECbDKYqnzo7JehCQz/NZZ9xhjgBWEtYQV0tOecuFXwJl9Ud3/I8yEcTAIibgQu0NWfg27YYQTRIgLUdx7/2SqSikB94V7kZl3vV9WV/IS5wan2lQ5aHW3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yWLgnoFv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nloc9rNr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yWLgnoFv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nloc9rNr"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ixf69cvPKcltCaDhuFinxelm76iWpbIm6Qn87X50Bzo=;
	b=yWLgnoFvUPICOhPatPB/D7LzrfxS1bzSu6i/gRACpAjDKr7RcAQ0Hpyc1WDl9e/gRSaEnA
	BUMvsPTUH9gDl+Nvh80aWqqbuKqI9Tv69y5S4jruKaL5pXV2MmlPHG6PJ2uBah7q045xBx
	K83WurKW8xN2NeXqmkFQPC9g4EQolM1VVfmvfDExR3BX4EeIU6/QyXxVS8qWYRXdJM1GoK
	D7uHjTX24rAW62i9W60zqfs7Mz35FkmFfPSPyGkjr7RWDZpkvBixuiYzS1APFpDYdfu1j7
	VpW4x6ABscJAYnY36PhJ3P8eO+pdZDyc58jIGOW3UzfqeaxJhmVUYyhu+BoyQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ixf69cvPKcltCaDhuFinxelm76iWpbIm6Qn87X50Bzo=;
	b=nloc9rNrZ+pC/KMdcnegwHHTagOYm1U2SfqCc48eOnF6y5mnw0ffVcp06QwDu9OvAkmHAO
	hI9u57NGNYk497BQ==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v11 02/19] mm: Add vmalloc_huge_node()
Date: Mon,  7 Apr 2025 17:57:25 +0200
Message-ID: <20250407155742.968816-3-bigeasy@linutronix.de>
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Zijlstra <peterz@infradead.org>

To enable node specific hash-tables using huge pages if possible.

[bigeasy: use __vmalloc_node_range_noprof(), add nommu bits, inline
vmalloc_huge]

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Uladzislau Rezki <urezki@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: linux-mm@kvack.org
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/vmalloc.h |  9 +++++++--
 mm/nommu.c              | 18 +++++++++++++++++-
 mm/vmalloc.c            | 11 ++++++-----
 3 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 31e9ffd936e39..de95794777ad6 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -168,8 +168,13 @@ void *__vmalloc_node_noprof(unsigned long size, unsign=
ed long align, gfp_t gfp_m
 		int node, const void *caller) __alloc_size(1);
 #define __vmalloc_node(...)	alloc_hooks(__vmalloc_node_noprof(__VA_ARGS__))
=20
-void *vmalloc_huge_noprof(unsigned long size, gfp_t gfp_mask) __alloc_size=
(1);
-#define vmalloc_huge(...)	alloc_hooks(vmalloc_huge_noprof(__VA_ARGS__))
+void *vmalloc_huge_node_noprof(unsigned long size, gfp_t gfp_mask, int nod=
e) __alloc_size(1);
+#define vmalloc_huge_node(...)	alloc_hooks(vmalloc_huge_node_noprof(__VA_A=
RGS__))
+
+static inline void *vmalloc_huge(unsigned long size, gfp_t gfp_mask)
+{
+	return vmalloc_huge_node(size, gfp_mask, NUMA_NO_NODE);
+}
=20
 extern void *__vmalloc_array_noprof(size_t n, size_t size, gfp_t flags) __=
alloc_size(1, 2);
 #define __vmalloc_array(...)	alloc_hooks(__vmalloc_array_noprof(__VA_ARGS_=
_))
diff --git a/mm/nommu.c b/mm/nommu.c
index 617e7ba8022f5..70f92f9a7fab3 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -200,7 +200,23 @@ void *vmalloc_noprof(unsigned long size)
 }
 EXPORT_SYMBOL(vmalloc_noprof);
=20
-void *vmalloc_huge_noprof(unsigned long size, gfp_t gfp_mask) __weak __ali=
as(__vmalloc_noprof);
+/*
+ *	vmalloc_huge_node  -  allocate virtually contiguous memory, on a node
+ *
+ *	@size:		allocation size
+ *	@gfp_mask:	flags for the page level allocator
+ *	@node:          node to use for allocation or NUMA_NO_NODE
+ *
+ *	Allocate enough pages to cover @size from the page level
+ *	allocator and map them into contiguous kernel virtual space.
+ *
+ *	Due to NOMMU implications the node argument and HUGE page attribute is
+ *	ignored.
+ */
+void *vmalloc_huge_node_noprof(unsigned long size, gfp_t gfp_mask, int nod=
e)
+{
+	return __vmalloc_noprof(size, gfp_mask);
+}
=20
 /*
  *	vzalloc - allocate virtually contiguous memory with zero fill
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ecd..8b9f6d3c099dd 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3943,9 +3943,10 @@ void *vmalloc_noprof(unsigned long size)
 EXPORT_SYMBOL(vmalloc_noprof);
=20
 /**
- * vmalloc_huge - allocate virtually contiguous memory, allow huge pages
+ * vmalloc_huge_node - allocate virtually contiguous memory, allow huge pa=
ges
  * @size:      allocation size
  * @gfp_mask:  flags for the page level allocator
+ * @node:	    node to use for allocation or NUMA_NO_NODE
  *
  * Allocate enough pages to cover @size from the page level
  * allocator and map them into contiguous kernel virtual space.
@@ -3954,13 +3955,13 @@ EXPORT_SYMBOL(vmalloc_noprof);
  *
  * Return: pointer to the allocated memory or %NULL on error
  */
-void *vmalloc_huge_noprof(unsigned long size, gfp_t gfp_mask)
+void *vmalloc_huge_node_noprof(unsigned long size, gfp_t gfp_mask, int nod=
e)
 {
 	return __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
-				    gfp_mask, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
-				    NUMA_NO_NODE, __builtin_return_address(0));
+					   gfp_mask, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
+					   node, __builtin_return_address(0));
 }
-EXPORT_SYMBOL_GPL(vmalloc_huge_noprof);
+EXPORT_SYMBOL_GPL(vmalloc_huge_node_noprof);
=20
 /**
  * vzalloc - allocate virtually contiguous memory with zero fill
--=20
2.49.0

