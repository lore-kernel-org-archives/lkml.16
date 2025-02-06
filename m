Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ECA1A0739
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867897; cv=none; b=EU8AyOUKxjpfimcVHjB4ZH7TqtxgJofRwx2laOpTCZaWH4KKf38cFWY+GXzxbgl9Cr34QjleIyvFpcRVPWTynrgLkVnaXmsJLLzCXmQLfS5xMMLCZeKgwQlbqM1zQvoY1/Avj2UEWGKxJi9PhVYKVgAtg0P93t7c0xZImHLWBfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867897; c=relaxed/simple;
	bh=oMu1tGyn53Ze4K24SStlgpi0I/+/y0r77QLaVO4C+vs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SFF1HAveZxhyqx1xGTJgI+YIU+fDBySeNtZ39IEmnNOk7pBdPF/4QkdyYnJjLYStzE24PsJjAHGX0JdB0u3eLjp1fnIWFp9lo3SpQpz3l117Qjgfd9qLkXAh7wIlTTql/y4uBc+sK3aOpdkgKoi7LE/0JQZkrMLp0Er3tLA+dTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q9hN6QvP; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q9hN6QvP"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fa0204ad21so2418453a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867894; x=1739472694; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=laTVDvhr5jKOxEf5d1BFEkjR6DjNz8pI1Rzto2J5iEQ=;
        b=q9hN6QvP36Y2MbOMWCFF7VSBqkEhfZu40X0Dtfi7I7hGiQcxZ8QbZzcF+qGQkoR4XO
         1aiC4vpW16GewdmkRQlcHc6YwXt1xTWEwH6Ruq2uNMrqgp1uT25sOxEWvoetph67CkGJ
         HRdQbH1O+lhtDb/IPF8wx02IU2HyncKUYag+MZIe3c9sePMmOmTSlCWe9JnajX1K02MV
         2dHvCxLCHSd3QzCDqBtF0Fv1+oj3qut0kUS9cUbKLmyRjqCs9pTcj0UfH2gD/JQJGKdH
         InzFZ4uMM88v7jmZQvAeLR354kuhjvTdflPiPnLisiCrMh+ukBohOXvwwB+l6Fvk6ZXT
         uFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867894; x=1739472694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laTVDvhr5jKOxEf5d1BFEkjR6DjNz8pI1Rzto2J5iEQ=;
        b=qTDtDB23FGmZiyub+4UvPC+RkZyDd5hdc+08hUrOW+mtHfumW6g/qyHgI0yIuyc53M
         YsANJehIPDw45PotD1++mYbEAChwF/GxvbLkh1p6u4+5kuP/vGLpBeutB7wvMLtUxi2I
         TBSKzSPIAnXC0JcArDUicCA2lDEjRwUhaOex/ZoyHuxkP0kWsTsPtjW6rxlxW7u6yfy1
         jYlmA44+tZnuQ67Eah0CGYkAo6ztVbK+ThEINyTNSbwbXf5+GV0fsHWjPnH7Pwmpoq3q
         aNIhUOKB3QdwJn+RIfrntPGhqgRnqblRkFZiNCgjz4VDNYv5JfxQcubqGAhfT4wgMXNU
         bw+w==
X-Forwarded-Encrypted: i=1; AJvYcCWeA0t/qF1WYhYXyrp6DCZOUhI+9wsMnIgEPPILx+0H9TuA9AIMf461el9ePG/21Qh62Iis6piK92lAifs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi94QbOEqg9f7L9gGvyz5C23tOQ9lCamidiUxkIGEDTZfUHsr0
	DN3+RhQxtCJr+JShFy+MGGHz/peEnGlOyxpupNIO5GCN1nhAugm6mQjlwRW2BqXZxdQZBQ==
X-Google-Smtp-Source: AGHT+IFWXu22XDiYyc0nTMJwiopxxnqaKl40GlxcarOlGhTscpEPLMqJOzkRyOrxdabf2F7/pMajnLN0
X-Received: from pjur16.prod.google.com ([2002:a17:90a:d410:b0:2f2:e5c9:de99])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38d2:b0:2ee:48bf:7dc3
 with SMTP id 98e67ed59e1d1-2fa241646afmr193581a91.15.1738867894502; Thu, 06
 Feb 2025 10:51:34 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:51 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-12-fvdl@google.com>
Subject: [PATCH v3 11/28] mm/sparse: allow for alternate vmemmap section init
 at boot
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Add functions that are called just before the per-section memmap
is initialized and just before the memmap page structures are
initialized. They are called sparse_vmemmap_init_nid_early and
sparse_vmemmap_init_nid_late, respectively.

This allows for mm subsystems to add calls to initialize memmap
and page structures in a specific way, if using SPARSEMEM_VMEMMAP.
Specifically, hugetlb can pre-HVO bootmem allocated pages that
way, so that no time and resources are wasted on allocating vmemmap
pages, only to free them later (and possibly unnecessarily running
the system out of memory in the process).

Refactor some code and export a few convenience functions for
external use.

In sparse_init_nid, skip any sections that are already initialized,
e.g. they have been initialized by sparse_vmemmap_init_nid_early
already.

The hugetlb code to use these functions will be added in a later
commit.

Export section_map_size, as any alternate memmap init code
will want to use it.

THe config option to enable this is SPARSEMEM_VMEMMAP_PREINIT,
which is dependent on and architecture-specific option,
ARCH_WANT_SPARSEMEM_VMEMMAP_PREINIT. This is done because
a section flag is used, and the number of flags available
is architecture-dependent (see mmzone.h). Architecures can
decide if there is room for the flag and enable the option.
Fortunately, as of right now, all sparse vmemmap using
architectures do have room.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 include/linux/mm.h     |  1 +
 include/linux/mmzone.h | 35 +++++++++++++++++
 mm/Kconfig             |  8 ++++
 mm/bootmem_info.c      |  4 +-
 mm/mm_init.c           |  3 ++
 mm/sparse-vmemmap.c    | 23 +++++++++++
 mm/sparse.c            | 87 ++++++++++++++++++++++++++++++++----------
 7 files changed, 139 insertions(+), 22 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6dfc41b461af..df83653ed6e3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3828,6 +3828,7 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
 #endif
 
 void *sparse_buffer_alloc(unsigned long size);
+unsigned long section_map_size(void);
 struct page * __populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 9540b41894da..44ecb2f90db4 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1933,6 +1933,9 @@ enum {
 	SECTION_IS_EARLY_BIT,
 #ifdef CONFIG_ZONE_DEVICE
 	SECTION_TAINT_ZONE_DEVICE_BIT,
+#endif
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
+	SECTION_IS_VMEMMAP_PREINIT_BIT,
 #endif
 	SECTION_MAP_LAST_BIT,
 };
@@ -1944,6 +1947,9 @@ enum {
 #ifdef CONFIG_ZONE_DEVICE
 #define SECTION_TAINT_ZONE_DEVICE	BIT(SECTION_TAINT_ZONE_DEVICE_BIT)
 #endif
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
+#define SECTION_IS_VMEMMAP_PREINIT	BIT(SECTION_IS_VMEMMAP_PREINIT_BIT)
+#endif
 #define SECTION_MAP_MASK		(~(BIT(SECTION_MAP_LAST_BIT) - 1))
 #define SECTION_NID_SHIFT		SECTION_MAP_LAST_BIT
 
@@ -1998,6 +2004,30 @@ static inline int online_device_section(struct mem_section *section)
 }
 #endif
 
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
+static inline int preinited_vmemmap_section(struct mem_section *section)
+{
+	return (section &&
+		(section->section_mem_map & SECTION_IS_VMEMMAP_PREINIT));
+}
+
+void sparse_vmemmap_init_nid_early(int nid);
+void sparse_vmemmap_init_nid_late(int nid);
+
+#else
+static inline int preinited_vmemmap_section(struct mem_section *section)
+{
+	return 0;
+}
+static inline void sparse_vmemmap_init_nid_early(int nid)
+{
+}
+
+static inline void sparse_vmemmap_init_nid_late(int nid)
+{
+}
+#endif
+
 static inline int online_section_nr(unsigned long nr)
 {
 	return online_section(__nr_to_section(nr));
@@ -2035,6 +2065,9 @@ static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
 }
 #endif
 
+void sparse_init_early_section(int nid, struct page *map, unsigned long pnum,
+			       unsigned long flags);
+
 #ifndef CONFIG_HAVE_ARCH_PFN_VALID
 /**
  * pfn_valid - check if there is a valid memory map entry for a PFN
@@ -2116,6 +2149,8 @@ void sparse_init(void);
 #else
 #define sparse_init()	do {} while (0)
 #define sparse_index_init(_sec, _nid)  do {} while (0)
+#define sparse_vmemmap_init_nid_early(_nid, _use) do {} while (0)
+#define sparse_vmemmap_init_nid_late(_nid) do {} while (0)
 #define pfn_in_present_section pfn_valid
 #define subsection_map_init(_pfn, _nr_pages) do {} while (0)
 #endif /* CONFIG_SPARSEMEM */
diff --git a/mm/Kconfig b/mm/Kconfig
index 1b501db06417..f984dd928ce7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -489,6 +489,14 @@ config SPARSEMEM_VMEMMAP
 	  SPARSEMEM_VMEMMAP uses a virtually mapped memmap to optimise
 	  pfn_to_page and page_to_pfn operations.  This is the most
 	  efficient option when sufficient kernel resources are available.
+
+config ARCH_WANT_SPARSEMEM_VMEMMAP_PREINIT
+	bool
+
+config SPARSEMEM_VMEMMAP_PREINIT
+	bool "Early init of sparse memory virtual memmap"
+	depends on SPARSEMEM_VMEMMAP && ARCH_WANT_SPARSEMEM_VMEMMAP_PREINIT
+	default y
 #
 # Select this config option from the architecture Kconfig, if it is preferred
 # to enable the feature of HugeTLB/dev_dax vmemmap optimization.
diff --git a/mm/bootmem_info.c b/mm/bootmem_info.c
index 95f288169a38..b0e2a9fa641f 100644
--- a/mm/bootmem_info.c
+++ b/mm/bootmem_info.c
@@ -88,7 +88,9 @@ static void __init register_page_bootmem_info_section(unsigned long start_pfn)
 
 	memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
 
-	register_page_bootmem_memmap(section_nr, memmap, PAGES_PER_SECTION);
+	if (!preinited_vmemmap_section(ms))
+		register_page_bootmem_memmap(section_nr, memmap,
+				PAGES_PER_SECTION);
 
 	usage = ms->usage;
 	page = virt_to_page(usage);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index d2dee53e95dd..9f1e41c3dde6 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1862,6 +1862,9 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 		}
 	}
 
+	for_each_node_state(nid, N_MEMORY)
+		sparse_vmemmap_init_nid_late(nid);
+
 	calc_nr_kernel_pages();
 	memmap_init();
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 3287ebadd167..8751c46c35e4 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -470,3 +470,26 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 
 	return pfn_to_page(pfn);
 }
+
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
+/*
+ * This is called just before initializing sections for a NUMA node.
+ * Any special initialization that needs to be done before the
+ * generic initialization can be done from here. Sections that
+ * are initialized in hooks called from here will be skipped by
+ * the generic initialization.
+ */
+void __init sparse_vmemmap_init_nid_early(int nid)
+{
+}
+
+/*
+ * This is called just before the initialization of page structures
+ * through memmap_init. Zones are now initialized, so any work that
+ * needs to be done that needs zone information can be done from
+ * here.
+ */
+void __init sparse_vmemmap_init_nid_late(int nid)
+{
+}
+#endif
diff --git a/mm/sparse.c b/mm/sparse.c
index 133b033d0cba..ee0234a77c7f 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -408,13 +408,13 @@ static void __init check_usemap_section_nr(int nid,
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-static unsigned long __init section_map_size(void)
+unsigned long __init section_map_size(void)
 {
 	return ALIGN(sizeof(struct page) * PAGES_PER_SECTION, PMD_SIZE);
 }
 
 #else
-static unsigned long __init section_map_size(void)
+unsigned long __init section_map_size(void)
 {
 	return PAGE_ALIGN(sizeof(struct page) * PAGES_PER_SECTION);
 }
@@ -495,6 +495,44 @@ void __weak __meminit vmemmap_populate_print_last(void)
 {
 }
 
+static void *sparse_usagebuf __meminitdata;
+static void *sparse_usagebuf_end __meminitdata;
+
+/*
+ * Helper function that is used for generic section initialization, and
+ * can also be used by any hooks added above.
+ */
+void __init sparse_init_early_section(int nid, struct page *map,
+				      unsigned long pnum, unsigned long flags)
+{
+	BUG_ON(!sparse_usagebuf || sparse_usagebuf >= sparse_usagebuf_end);
+	check_usemap_section_nr(nid, sparse_usagebuf);
+	sparse_init_one_section(__nr_to_section(pnum), pnum, map,
+			sparse_usagebuf, SECTION_IS_EARLY | flags);
+	sparse_usagebuf = (void *)sparse_usagebuf + mem_section_usage_size();
+}
+
+static int __init sparse_usage_init(int nid, unsigned long map_count)
+{
+	unsigned long size;
+
+	size = mem_section_usage_size() * map_count;
+	sparse_usagebuf = sparse_early_usemaps_alloc_pgdat_section(
+				NODE_DATA(nid), size);
+	if (!sparse_usagebuf) {
+		sparse_usagebuf_end = NULL;
+		return -ENOMEM;
+	}
+
+	sparse_usagebuf_end = sparse_usagebuf + size;
+	return 0;
+}
+
+static void __init sparse_usage_fini(void)
+{
+	sparse_usagebuf = sparse_usagebuf_end = NULL;
+}
+
 /*
  * Initialize sparse on a specific node. The node spans [pnum_begin, pnum_end)
  * And number of present sections in this node is map_count.
@@ -503,47 +541,54 @@ static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
 				   unsigned long pnum_end,
 				   unsigned long map_count)
 {
-	struct mem_section_usage *usage;
 	unsigned long pnum;
 	struct page *map;
+	struct mem_section *ms;
 
-	usage = sparse_early_usemaps_alloc_pgdat_section(NODE_DATA(nid),
-			mem_section_usage_size() * map_count);
-	if (!usage) {
+	if (sparse_usage_init(nid, map_count)) {
 		pr_err("%s: node[%d] usemap allocation failed", __func__, nid);
 		goto failed;
 	}
+
 	sparse_buffer_init(map_count * section_map_size(), nid);
+
+	sparse_vmemmap_init_nid_early(nid);
+
 	for_each_present_section_nr(pnum_begin, pnum) {
 		unsigned long pfn = section_nr_to_pfn(pnum);
 
 		if (pnum >= pnum_end)
 			break;
 
-		map = __populate_section_memmap(pfn, PAGES_PER_SECTION,
-				nid, NULL, NULL);
-		if (!map) {
-			pr_err("%s: node[%d] memory map backing failed. Some memory will not be available.",
-			       __func__, nid);
-			pnum_begin = pnum;
-			sparse_buffer_fini();
-			goto failed;
+		ms = __nr_to_section(pnum);
+		if (!preinited_vmemmap_section(ms)) {
+			map = __populate_section_memmap(pfn, PAGES_PER_SECTION,
+					nid, NULL, NULL);
+			if (!map) {
+				pr_err("%s: node[%d] memory map backing failed. Some memory will not be available.",
+				       __func__, nid);
+				pnum_begin = pnum;
+				sparse_usage_fini();
+				sparse_buffer_fini();
+				goto failed;
+			}
+			sparse_init_early_section(nid, map, pnum, 0);
 		}
-		check_usemap_section_nr(nid, usage);
-		sparse_init_one_section(__nr_to_section(pnum), pnum, map, usage,
-				SECTION_IS_EARLY);
-		usage = (void *) usage + mem_section_usage_size();
 	}
+	sparse_usage_fini();
 	sparse_buffer_fini();
 	return;
 failed:
-	/* We failed to allocate, mark all the following pnums as not present */
+	/*
+	 * We failed to allocate, mark all the following pnums as not present,
+	 * except the ones already initialized earlier.
+	 */
 	for_each_present_section_nr(pnum_begin, pnum) {
-		struct mem_section *ms;
-
 		if (pnum >= pnum_end)
 			break;
 		ms = __nr_to_section(pnum);
+		if (!preinited_vmemmap_section(ms))
+			ms->section_mem_map = 0;
 		ms->section_mem_map = 0;
 	}
 }
-- 
2.48.1.502.g6dc24dfdaf-goog

