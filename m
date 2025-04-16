Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BAF21170B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820970; cv=none; b=a17uw9BjW8Tx+7IRqUpNz84Q8iqR/V5YOvG52O8ZBr+1PP3IDWq7/Xa/Y2WMNo5t+eyyWdJKDMohn6HRq2R9Lw+1oPyMrAKkkTIQpm0cqBmwy5Ncx3mdn/Qp6QlyqnHnDKhLDQlW5pFgRVKgtTPOq7pAIWgPioQbVQo5lS+8jKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820970; c=relaxed/simple;
	bh=LqNzPbHVr/YdzrkJlwIphlHRZxx/nS6ZHMaT8AIKgss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJT1e1sl3WGvBnzX5EuQ61CuC1/f2EUrljDeC+76Euit6bMGEJZIOjo9nM18YirOee7jf7r+OcWReRG0FLzTkfhiqUsj5CRWT6b1mXaBUDL8uYu+gBnsVIPxE8Rj26PL3xwt4xYYKUlj7+syH3wjiK8TxdqxPQ0ChZCwkn5KUF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FYiL1+TY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4YQN6KEf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FYiL1+TY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4YQN6KEf"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744820966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ixf69cvPKcltCaDhuFinxelm76iWpbIm6Qn87X50Bzo=;
	b=FYiL1+TYQ8tEQe9ZtUrNyXWmN/WiT0weoz/rxxGcm7E+XGSTvSyoKSsnmA1Atb1Y0w4dPA
	jqBwqXbAzseEwenTHPpODXE/vtTgaEPBHGhp8GiurcDIbM6oTPjl33V0H6/Q398W7ZvfIf
	uG4QsTZJju2ZSpsFTzSt83wC9idmjZBZ2nRijvyQJWeSPf7xjTRLgB280+kHNpGn2Hb56Y
	3jrGHJa+vCZdLhdl07YZoKs/kSsgCBS2laBBJ4SmP7jm5gORLsVNP3dHmTMQGkQrpjJKP1
	0uu9HSQ5F/JHPgRbL6tsVs8HGOoNAVgq95qlSmiSIIOc7C1eDI0yE0w4KIO4EA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744820966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ixf69cvPKcltCaDhuFinxelm76iWpbIm6Qn87X50Bzo=;
	b=4YQN6KEfhrxlBEtSSaBsINXO0S5yFl8y0Vkf2hGlHqZ/K/ENUN5VYzAZ34OHTMY113CWuF
	VkWkt7hr42Yi/PCg==
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
Subject: [PATCH v12 02/21] mm: Add vmalloc_huge_node()
Date: Wed, 16 Apr 2025 18:29:02 +0200
Message-ID: <20250416162921.513656-3-bigeasy@linutronix.de>
In-Reply-To: <20250416162921.513656-1-bigeasy@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
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

