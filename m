Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35521F78EC
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190583; cv=none; b=PoazUlaH0e+nqy0DQyZA4L2O4NuXTDxT39PIPR7VMsjOnFIrconQ9z71ZmqcJdvx2j7aCCJzIu9eJi802pkkCpgG3aJiAf+qGVl75D1IN/mYww0/PptOMF8+hBGuNdf2sCBdQgZUsUYtJJwL2x0fyws18OWjaMley+PEps3wa+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190583; c=relaxed/simple;
	bh=ahWO5/NteXAquK3IMZahG/IwBguVO84SNacjgPRLiwI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u9TpMXT7Ekk7HV82NIAlC9hwkU6xPAPuNopmBTsR+3Ub7NszvtMh1GTRPzyQApZ7jG6SOpgzkH8OwkRPLsfqObi5RvZ0Ou7Ff+fDWRmwsTgxhqjjmrSf9/AOyxYGDhRa7LTVP6qARJJ1PKITLu6Jw/zVHNTluCi2Kp7ug/5C4/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T9BIAbD5; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T9BIAbD5"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2178115051dso3216495ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190580; x=1738795380; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aH4nwlMvvSTbckejE0k1f4dtYPUtlX/28RtOz+k6ygU=;
        b=T9BIAbD5FossZaL+mZWYA100nc886IIS3A3xpI6nuTvSsS2Bc2azspjCnaGe+5tGj/
         k166uMApiPKGynGm4PjP0DE5pDK+ilaqQ3p7YdUc1e6jQol7mn9nnBEAaf+t4y33A7bN
         kAcdTBovsot6WHLIi9YyQ93L3KQzU3j7OGxO0FDTvDuiLiQFYe0BeOROOXuhMUc3hC6Q
         ev0MEz+vcfCZDUd/Uo31gzSo99pmAIz5vQ/K5hVTe1fK6S88K0qARJh3AapJ7letYO7A
         jHQXVK/Q+qO9g6VahwRRH8LpTIryF9DsJRy8CPbN5gYCw6/tRAtDCOZYTq2oIEpYhVz4
         4mpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190580; x=1738795380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aH4nwlMvvSTbckejE0k1f4dtYPUtlX/28RtOz+k6ygU=;
        b=IhRo/P7poeLCBTjTZhMy1rPfOJaWVzI8jQKtl+W1usw7a7DRYH3iteI01Bw2W1tFs1
         X3yQuit1X9F306SMlF1fTAs9nfHU9F9SOXIFbs3D81lZ/PiVnGUEKtrYHFOYA/Ld1WGZ
         kbmYBaZEVq9tdJ7K9UGK+7hhvQ61fgmqk/SxlNllCot6VIXGh11Q2avpGfrUrWvMlAz+
         sUaAy4sSNO+egQchE2AnSfMOaV/eQwKbrMO7b3H9+n+6uO29uzZC9baX3RwR+eyzpEPi
         C2WRM4RjCdkFhpAR+4nmsmQ+yyN7E5rtTYfBUjxXv+LI33D8Fn40KhCrodbmsoeNcoY6
         2mKA==
X-Forwarded-Encrypted: i=1; AJvYcCWhabLy53GFBZJK2LpiMBwnBnZ7YzphnNfqJtGF8lbBSGW5xRZRQjOWHyP8j76UT87onE9IymYwQutLJ/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDdLm5ior3kidkcL5M9O0mSQel4jheNRqczWQxybwVCeo31yfy
	Tv5HbQpErchh2EcPxLhuEcneBCARk763T2sXJUG/wmCvIOWIp3jIJiGJcQrRB5NUx9UJmg==
X-Google-Smtp-Source: AGHT+IE+pj10b4z63haeyix4paPMsUGHOoSvFej7RbeeYAi9eA9qHLwGBxnt7Q4A+DDX+iTalohvAtl5
X-Received: from plgm4.prod.google.com ([2002:a17:902:f644:b0:20c:5d5a:9d64])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:188:b0:215:7b06:90ca
 with SMTP id d9443c01a7336-21dd7c57d68mr67625625ad.17.1738190580369; Wed, 29
 Jan 2025 14:43:00 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:57 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-29-fvdl@google.com>
Subject: [PATCH v2 28/28] mm/hugetlb: move hugetlb CMA code in to its own file
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

hugetlb.c contained a number of CONFIG_CMA ifdefs, and
the code inside them was large enough to merit being in
its own file, so move it, cleaning up things a bit.

Hide some direct variable access behind functions to
accomodate the move.

No functional change intended.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/Makefile      |   3 +
 mm/hugetlb.c     | 252 +++------------------------------------------
 mm/hugetlb_cma.c | 258 +++++++++++++++++++++++++++++++++++++++++++++++
 mm/hugetlb_cma.h |  55 ++++++++++
 4 files changed, 332 insertions(+), 236 deletions(-)
 create mode 100644 mm/hugetlb_cma.c
 create mode 100644 mm/hugetlb_cma.h

diff --git a/mm/Makefile b/mm/Makefile
index 850386a67b3e..810ccd45d270 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -79,6 +79,9 @@ obj-$(CONFIG_SWAP)	+= page_io.o swap_state.o swapfile.o swap_slots.o
 obj-$(CONFIG_ZSWAP)	+= zswap.o
 obj-$(CONFIG_HAS_DMA)	+= dmapool.o
 obj-$(CONFIG_HUGETLBFS)	+= hugetlb.o
+ifdef CONFIG_CMA
+obj-$(CONFIG_HUGETLBFS)	+= hugetlb_cma.o
+endif
 obj-$(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP)	+= hugetlb_vmemmap.o
 obj-$(CONFIG_NUMA) 	+= mempolicy.o
 obj-$(CONFIG_SPARSEMEM)	+= sparse.o
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 5a3e9f7deaba..6e296f16116d 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -50,19 +50,13 @@
 #include <linux/page_owner.h>
 #include "internal.h"
 #include "hugetlb_vmemmap.h"
+#include "hugetlb_cma.h"
 #include <linux/page-isolation.h>
 
 int hugetlb_max_hstate __read_mostly;
 unsigned int default_hstate_idx;
 struct hstate hstates[HUGE_MAX_HSTATE];
 
-#ifdef CONFIG_CMA
-static struct cma *hugetlb_cma[MAX_NUMNODES];
-static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initdata;
-#endif
-static bool hugetlb_cma_only;
-static unsigned long hugetlb_cma_size __initdata;
-
 __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
 __initdata unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE];
 
@@ -129,14 +123,11 @@ static struct resv_map *vma_resv_map(struct vm_area_struct *vma);
 
 static void hugetlb_free_folio(struct folio *folio)
 {
-#ifdef CONFIG_CMA
-	int nid = folio_nid(folio);
-
 	if (folio_test_hugetlb_cma(folio)) {
-		WARN_ON_ONCE(!cma_free_folio(hugetlb_cma[nid], folio));
+		hugetlb_cma_free_folio(folio);
 		return;
 	}
-#endif
+
 	folio_put(folio);
 }
 
@@ -1493,31 +1484,9 @@ static struct folio *alloc_gigantic_folio(struct hstate *h, gfp_t gfp_mask,
 	if (nid == NUMA_NO_NODE)
 		nid = numa_mem_id();
 retry:
-	folio = NULL;
-#ifdef CONFIG_CMA
-	{
-		int node;
-
-		if (hugetlb_cma[nid])
-			folio = cma_alloc_folio(hugetlb_cma[nid], order, gfp_mask);
-
-		if (!folio && !(gfp_mask & __GFP_THISNODE)) {
-			for_each_node_mask(node, *nodemask) {
-				if (node == nid || !hugetlb_cma[node])
-					continue;
-
-				folio = cma_alloc_folio(hugetlb_cma[node], order, gfp_mask);
-				if (folio)
-					break;
-			}
-		}
-
-		if (folio)
-			folio_set_hugetlb_cma(folio);
-	}
-#endif
+	folio = hugetlb_cma_alloc_folio(h, gfp_mask, nid, nodemask);
 	if (!folio) {
-		if (hugetlb_cma_only)
+		if (hugetlb_cma_exclusive_alloc())
 			return NULL;
 
 		folio = folio_alloc_gigantic(order, gfp_mask, nid, nodemask);
@@ -3180,32 +3149,19 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
 	return ERR_PTR(-ENOSPC);
 }
 
-static bool __init hugetlb_early_cma(struct hstate *h)
-{
-	if (arch_has_huge_bootmem_alloc())
-		return false;
-
-	return (hstate_is_gigantic(h) && hugetlb_cma_only);
-}
-
 static __init void *alloc_bootmem(struct hstate *h, int nid)
 {
 	struct huge_bootmem_page *m;
-	unsigned long flags;
-	struct cma *cma;
 
-#ifdef CONFIG_CMA
-	if (hugetlb_early_cma(h)) {
-		flags = HUGE_BOOTMEM_CMA;
-		cma = hugetlb_cma[nid];
-		m = cma_reserve_early(cma, huge_page_size(h));
-	} else
-#endif
-	{
-		flags = 0;
-		cma = NULL;
+	if (hugetlb_early_cma(h))
+		m = hugetlb_cma_alloc_bootmem(h, nid);
+	else {
 		m = memblock_alloc_try_nid_raw(huge_page_size(h),
 			huge_page_size(h), 0, MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+		if (m) {
+			m->flags = 0;
+			m->cma = NULL;
+		}
 	}
 
 	if (m) {
@@ -3220,8 +3176,6 @@ static __init void *alloc_bootmem(struct hstate *h, int nid)
 		INIT_LIST_HEAD(&m->list);
 		list_add(&m->list, &huge_boot_pages[nid]);
 		m->hstate = h;
-		m->flags = flags;
-		m->cma = cma;
 	}
 
 	return m;
@@ -3666,7 +3620,8 @@ static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
 	 * Skip gigantic hugepages allocation if early CMA
 	 * reservations are not available.
 	 */
-	if (hstate_is_gigantic(h) && hugetlb_cma_size && !hugetlb_early_cma(h)) {
+	if (hstate_is_gigantic(h) && hugetlb_cma_total_size() &&
+	    !hugetlb_early_cma(h)) {
 		pr_warn_once("HugeTLB: hugetlb_cma is enabled, skip boot time allocation\n");
 		return;
 	}
@@ -3703,7 +3658,7 @@ static void __init hugetlb_init_hstates(void)
 		 */
 		if (hstate_is_gigantic(h) && !gigantic_page_runtime_supported())
 			continue;
-		if (hugetlb_cma_size && h->order <= HUGETLB_PAGE_ORDER)
+		if (hugetlb_cma_total_size() && h->order <= HUGETLB_PAGE_ORDER)
 			continue;
 		for_each_hstate(h2) {
 			if (h2 == h)
@@ -4605,14 +4560,6 @@ static void hugetlb_register_all_nodes(void) { }
 
 #endif
 
-#ifdef CONFIG_CMA
-static void __init hugetlb_cma_check(void);
-#else
-static inline __init void hugetlb_cma_check(void)
-{
-}
-#endif
-
 static void __init hugetlb_sysfs_init(void)
 {
 	struct hstate *h;
@@ -4796,8 +4743,7 @@ static __init void hugetlb_parse_params(void)
 		hcp->setup(hcp->val);
 	}
 
-	if (!hugetlb_cma_size)
-		hugetlb_cma_only = false;
+	hugetlb_cma_validate_params();
 }
 
 /*
@@ -7867,169 +7813,3 @@ void hugetlb_unshare_all_pmds(struct vm_area_struct *vma)
 	hugetlb_unshare_pmds(vma, ALIGN(vma->vm_start, PUD_SIZE),
 			ALIGN_DOWN(vma->vm_end, PUD_SIZE));
 }
-
-#ifdef CONFIG_CMA
-static bool cma_reserve_called __initdata;
-
-static int __init cmdline_parse_hugetlb_cma(char *p)
-{
-	int nid, count = 0;
-	unsigned long tmp;
-	char *s = p;
-
-	while (*s) {
-		if (sscanf(s, "%lu%n", &tmp, &count) != 1)
-			break;
-
-		if (s[count] == ':') {
-			if (tmp >= MAX_NUMNODES)
-				break;
-			nid = array_index_nospec(tmp, MAX_NUMNODES);
-
-			s += count + 1;
-			tmp = memparse(s, &s);
-			hugetlb_cma_size_in_node[nid] = tmp;
-			hugetlb_cma_size += tmp;
-
-			/*
-			 * Skip the separator if have one, otherwise
-			 * break the parsing.
-			 */
-			if (*s == ',')
-				s++;
-			else
-				break;
-		} else {
-			hugetlb_cma_size = memparse(p, &p);
-			break;
-		}
-	}
-
-	return 0;
-}
-
-early_param("hugetlb_cma", cmdline_parse_hugetlb_cma);
-
-static int __init cmdline_parse_hugetlb_cma_only(char *p)
-{
-	return kstrtobool(p, &hugetlb_cma_only);
-}
-
-early_param("hugetlb_cma_only", cmdline_parse_hugetlb_cma_only);
-
-void __init hugetlb_cma_reserve(int order)
-{
-	unsigned long size, reserved, per_node;
-	bool node_specific_cma_alloc = false;
-	int nid;
-
-	/*
-	 * HugeTLB CMA reservation is required for gigantic
-	 * huge pages which could not be allocated via the
-	 * page allocator. Just warn if there is any change
-	 * breaking this assumption.
-	 */
-	VM_WARN_ON(order <= MAX_PAGE_ORDER);
-	cma_reserve_called = true;
-
-	if (!hugetlb_cma_size)
-		return;
-
-	for (nid = 0; nid < MAX_NUMNODES; nid++) {
-		if (hugetlb_cma_size_in_node[nid] == 0)
-			continue;
-
-		if (!node_online(nid)) {
-			pr_warn("hugetlb_cma: invalid node %d specified\n", nid);
-			hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
-			hugetlb_cma_size_in_node[nid] = 0;
-			continue;
-		}
-
-		if (hugetlb_cma_size_in_node[nid] < (PAGE_SIZE << order)) {
-			pr_warn("hugetlb_cma: cma area of node %d should be at least %lu MiB\n",
-				nid, (PAGE_SIZE << order) / SZ_1M);
-			hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
-			hugetlb_cma_size_in_node[nid] = 0;
-		} else {
-			node_specific_cma_alloc = true;
-		}
-	}
-
-	/* Validate the CMA size again in case some invalid nodes specified. */
-	if (!hugetlb_cma_size)
-		return;
-
-	if (hugetlb_cma_size < (PAGE_SIZE << order)) {
-		pr_warn("hugetlb_cma: cma area should be at least %lu MiB\n",
-			(PAGE_SIZE << order) / SZ_1M);
-		hugetlb_cma_size = 0;
-		return;
-	}
-
-	if (!node_specific_cma_alloc) {
-		/*
-		 * If 3 GB area is requested on a machine with 4 numa nodes,
-		 * let's allocate 1 GB on first three nodes and ignore the last one.
-		 */
-		per_node = DIV_ROUND_UP(hugetlb_cma_size, nr_online_nodes);
-		pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
-			hugetlb_cma_size / SZ_1M, per_node / SZ_1M);
-	}
-
-	reserved = 0;
-	for_each_online_node(nid) {
-		int res;
-		char name[CMA_MAX_NAME];
-
-		if (node_specific_cma_alloc) {
-			if (hugetlb_cma_size_in_node[nid] == 0)
-				continue;
-
-			size = hugetlb_cma_size_in_node[nid];
-		} else {
-			size = min(per_node, hugetlb_cma_size - reserved);
-		}
-
-		size = round_up(size, PAGE_SIZE << order);
-
-		snprintf(name, sizeof(name), "hugetlb%d", nid);
-		/*
-		 * Note that 'order per bit' is based on smallest size that
-		 * may be returned to CMA allocator in the case of
-		 * huge page demotion.
-		 */
-		res = cma_declare_contiguous_multi(size, PAGE_SIZE << order,
-					HUGETLB_PAGE_ORDER, name,
-					&hugetlb_cma[nid], nid);
-		if (res) {
-			pr_warn("hugetlb_cma: reservation failed: err %d, node %d",
-				res, nid);
-			continue;
-		}
-
-		reserved += size;
-		pr_info("hugetlb_cma: reserved %lu MiB on node %d\n",
-			size / SZ_1M, nid);
-
-		if (reserved >= hugetlb_cma_size)
-			break;
-	}
-
-	if (!reserved)
-		/*
-		 * hugetlb_cma_size is used to determine if allocations from
-		 * cma are possible.  Set to zero if no cma regions are set up.
-		 */
-		hugetlb_cma_size = 0;
-}
-
-static void __init hugetlb_cma_check(void)
-{
-	if (!hugetlb_cma_size || cma_reserve_called)
-		return;
-
-	pr_warn("hugetlb_cma: the option isn't supported by current arch\n");
-}
-
-#endif /* CONFIG_CMA */
diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
new file mode 100644
index 000000000000..3ea9cd0f6b9f
--- /dev/null
+++ b/mm/hugetlb_cma.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/mm.h>
+#include <linux/cma.h>
+#include <linux/compiler.h>
+#include <linux/mm_inline.h>
+
+#include <asm/page.h>
+#include <asm/setup.h>
+
+#include <linux/hugetlb.h>
+#include "internal.h"
+#include "hugetlb_cma.h"
+
+
+static struct cma *hugetlb_cma[MAX_NUMNODES];
+static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initdata;
+static bool hugetlb_cma_only;
+static unsigned long hugetlb_cma_size __initdata;
+
+void hugetlb_cma_free_folio(struct folio *folio)
+{
+	int nid = folio_nid(folio);
+
+	WARN_ON_ONCE(!cma_free_folio(hugetlb_cma[nid], folio));
+}
+
+
+struct folio *hugetlb_cma_alloc_folio(struct hstate *h, gfp_t gfp_mask,
+				      int nid, nodemask_t *nodemask)
+{
+	int node;
+	int order = huge_page_order(h);
+	struct folio *folio = NULL;
+
+	if (hugetlb_cma[nid])
+		folio = cma_alloc_folio(hugetlb_cma[nid], order, gfp_mask);
+
+	if (!folio && !(gfp_mask & __GFP_THISNODE)) {
+		for_each_node_mask(node, *nodemask) {
+			if (node == nid || !hugetlb_cma[node])
+				continue;
+
+			folio = cma_alloc_folio(hugetlb_cma[node], order, gfp_mask);
+			if (folio)
+				break;
+		}
+	}
+
+	if (folio)
+		folio_set_hugetlb_cma(folio);
+
+	return folio;
+}
+
+struct huge_bootmem_page * __init
+hugetlb_cma_alloc_bootmem(struct hstate *h, int nid)
+{
+	struct cma *cma;
+	struct huge_bootmem_page *m;
+
+	cma = hugetlb_cma[nid];
+	m = cma_reserve_early(cma, huge_page_size(h));
+	if (m) {
+		m->flags = HUGE_BOOTMEM_CMA;
+		m->cma = cma;
+	}
+
+	return m;
+}
+
+
+static bool cma_reserve_called __initdata;
+
+static int __init cmdline_parse_hugetlb_cma(char *p)
+{
+	int nid, count = 0;
+	unsigned long tmp;
+	char *s = p;
+
+	while (*s) {
+		if (sscanf(s, "%lu%n", &tmp, &count) != 1)
+			break;
+
+		if (s[count] == ':') {
+			if (tmp >= MAX_NUMNODES)
+				break;
+			nid = array_index_nospec(tmp, MAX_NUMNODES);
+
+			s += count + 1;
+			tmp = memparse(s, &s);
+			hugetlb_cma_size_in_node[nid] = tmp;
+			hugetlb_cma_size += tmp;
+
+			/*
+			 * Skip the separator if have one, otherwise
+			 * break the parsing.
+			 */
+			if (*s == ',')
+				s++;
+			else
+				break;
+		} else {
+			hugetlb_cma_size = memparse(p, &p);
+			break;
+		}
+	}
+
+	return 0;
+}
+
+early_param("hugetlb_cma", cmdline_parse_hugetlb_cma);
+
+static int __init cmdline_parse_hugetlb_cma_only(char *p)
+{
+	return kstrtobool(p, &hugetlb_cma_only);
+}
+
+early_param("hugetlb_cma_only", cmdline_parse_hugetlb_cma_only);
+
+void __init hugetlb_cma_reserve(int order)
+{
+	unsigned long size, reserved, per_node;
+	bool node_specific_cma_alloc = false;
+	int nid;
+
+	/*
+	 * HugeTLB CMA reservation is required for gigantic
+	 * huge pages which could not be allocated via the
+	 * page allocator. Just warn if there is any change
+	 * breaking this assumption.
+	 */
+	VM_WARN_ON(order <= MAX_PAGE_ORDER);
+	cma_reserve_called = true;
+
+	if (!hugetlb_cma_size)
+		return;
+
+	for (nid = 0; nid < MAX_NUMNODES; nid++) {
+		if (hugetlb_cma_size_in_node[nid] == 0)
+			continue;
+
+		if (!node_online(nid)) {
+			pr_warn("hugetlb_cma: invalid node %d specified\n", nid);
+			hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
+			hugetlb_cma_size_in_node[nid] = 0;
+			continue;
+		}
+
+		if (hugetlb_cma_size_in_node[nid] < (PAGE_SIZE << order)) {
+			pr_warn("hugetlb_cma: cma area of node %d should be at least %lu MiB\n",
+				nid, (PAGE_SIZE << order) / SZ_1M);
+			hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
+			hugetlb_cma_size_in_node[nid] = 0;
+		} else {
+			node_specific_cma_alloc = true;
+		}
+	}
+
+	/* Validate the CMA size again in case some invalid nodes specified. */
+	if (!hugetlb_cma_size)
+		return;
+
+	if (hugetlb_cma_size < (PAGE_SIZE << order)) {
+		pr_warn("hugetlb_cma: cma area should be at least %lu MiB\n",
+			(PAGE_SIZE << order) / SZ_1M);
+		hugetlb_cma_size = 0;
+		return;
+	}
+
+	if (!node_specific_cma_alloc) {
+		/*
+		 * If 3 GB area is requested on a machine with 4 numa nodes,
+		 * let's allocate 1 GB on first three nodes and ignore the last one.
+		 */
+		per_node = DIV_ROUND_UP(hugetlb_cma_size, nr_online_nodes);
+		pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
+			hugetlb_cma_size / SZ_1M, per_node / SZ_1M);
+	}
+
+	reserved = 0;
+	for_each_online_node(nid) {
+		int res;
+		char name[CMA_MAX_NAME];
+
+		if (node_specific_cma_alloc) {
+			if (hugetlb_cma_size_in_node[nid] == 0)
+				continue;
+
+			size = hugetlb_cma_size_in_node[nid];
+		} else {
+			size = min(per_node, hugetlb_cma_size - reserved);
+		}
+
+		size = round_up(size, PAGE_SIZE << order);
+
+		snprintf(name, sizeof(name), "hugetlb%d", nid);
+		/*
+		 * Note that 'order per bit' is based on smallest size that
+		 * may be returned to CMA allocator in the case of
+		 * huge page demotion.
+		 */
+		res = cma_declare_contiguous_multi(size, PAGE_SIZE << order,
+					HUGETLB_PAGE_ORDER, name,
+					&hugetlb_cma[nid], nid);
+		if (res) {
+			pr_warn("hugetlb_cma: reservation failed: err %d, node %d",
+				res, nid);
+			continue;
+		}
+
+		reserved += size;
+		pr_info("hugetlb_cma: reserved %lu MiB on node %d\n",
+			size / SZ_1M, nid);
+
+		if (reserved >= hugetlb_cma_size)
+			break;
+	}
+
+	if (!reserved)
+		/*
+		 * hugetlb_cma_size is used to determine if allocations from
+		 * cma are possible.  Set to zero if no cma regions are set up.
+		 */
+		hugetlb_cma_size = 0;
+}
+
+void __init hugetlb_cma_check(void)
+{
+	if (!hugetlb_cma_size || cma_reserve_called)
+		return;
+
+	pr_warn("hugetlb_cma: the option isn't supported by current arch\n");
+}
+
+bool hugetlb_cma_exclusive_alloc(void)
+{
+	return hugetlb_cma_only;
+}
+
+unsigned long __init hugetlb_cma_total_size(void)
+{
+	return hugetlb_cma_size;
+}
+
+void __init hugetlb_cma_validate_params(void)
+{
+	if (!hugetlb_cma_size)
+		hugetlb_cma_only = false;
+}
+
+bool __init hugetlb_early_cma(struct hstate *h)
+{
+	if (arch_has_huge_bootmem_alloc())
+		return false;
+
+	return hstate_is_gigantic(h) && hugetlb_cma_only;
+}
diff --git a/mm/hugetlb_cma.h b/mm/hugetlb_cma.h
new file mode 100644
index 000000000000..92eb7530fe9e
--- /dev/null
+++ b/mm/hugetlb_cma.h
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+#ifndef _LINUX_HUGETLB_CMA_H
+#define _LINUX_HUGETLB_CMA_H
+
+#ifdef CONFIG_CMA
+void hugetlb_cma_free_folio(struct folio *folio);
+struct folio *hugetlb_cma_alloc_folio(struct hstate *h, gfp_t gfp_mask,
+				      int nid, nodemask_t *nodemask);
+struct huge_bootmem_page *hugetlb_cma_alloc_bootmem(struct hstate *h, int nid);
+void hugetlb_cma_check(void);
+bool hugetlb_cma_exclusive_alloc(void);
+unsigned long hugetlb_cma_total_size(void);
+void hugetlb_cma_validate_params(void);
+bool hugetlb_early_cma(struct hstate *h);
+#else
+static inline void hugetlb_cma_free_folio(struct folio *folio)
+{
+}
+
+static inline struct folio *hugetlb_cma_alloc_folio(struct hstate *h,
+	    gfp_t gfp_mask, int nid, nodemask_t *nodemask)
+{
+	return NULL;
+}
+
+static inline
+struct huge_bootmem_page *hugetlb_cma_alloc_bootmem(struct hstate *h, int nid)
+{
+	return NULL;
+}
+
+static inline void hugetlb_cma_check(void)
+{
+}
+
+static inline bool hugetlb_cma_exclusive_alloc(void)
+{
+	return false;
+}
+
+static inline unsigned long hugetlb_cma_total_size(void)
+{
+	return 0;
+}
+
+static inline void hugetlb_cma_validate_params(void)
+{
+}
+
+static inline bool hugetlb_early_cma(struct hstate *h)
+{
+	return false;
+}
+#endif
+#endif
-- 
2.48.1.262.g85cc9f2d1e-goog

