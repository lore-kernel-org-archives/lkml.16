Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6571F130E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627388; cv=none; b=b8OQt0bsPhJk1Po6MY+Ce3IMaVKmIowR6+txms7oq37oxNiFxtCRpIAXeaNrG/ifATa6iNKU1SZAta+vFgQS5O7LHMvDGdooCHGhs/hQ/aknyJ9GJdFlq/0u24CF616hKnk1B7a8ZHC3BBsxqwf7naHIIb3R5dP9139yfH/EJA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627388; c=relaxed/simple;
	bh=7HfioOhqOtWDZ2pUS0ZvWzrOGzh7i0+5PXjx51rHNz0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rQZmEkb+cqBXxoosVATkfOVALfZP5ITPiM21GzgvgVnFqIDdao5+a7Lb5iPWGJDzLi3VZYHNakDZCxeQ/VneVhMBq9IuerCFfgio95rBqBhtWnG9O8N2Fckr/VF4V8nEq3adgQO/XQF35bdxtfUxnyREJ163COJv/FJ4LeV+kh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DvmEMI6D; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DvmEMI6D"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736c135f695so138349b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743627386; x=1744232186; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9IOaG1peQ4ioEH8Qm0YRdkG68FfP97qOsWWlZTfTOM0=;
        b=DvmEMI6D3Rj422N2awKuT/kttsEKqUK569iqXZhd5ARHaWRHFnI3At34YBetdD4zqq
         KxFsfCDJMk31RuGee45vzsP6sx8JkC36A1Lj7j8IuDL17C33hrCDtB8l0WZEA8jtQnAl
         zxyvI7R57X6JQLdk/i2W6+16NS1Yi/CcMReq/diPiRLJOJ1hgl0Sd4KlqBjclH6DCQ65
         IFdHMIFH0+BBTJ/h4iwhvDyVSEi/GbkW/ACU6pwPB8mn5AfhWIHQ3GpVGjBzQZy77yLr
         xjl9LMZpLOp/d17Vu0jrkkMsreqH/fgkOvTkjbsHz4znmAAZwLwjxWx9LmTjqqSr26lZ
         2d/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627386; x=1744232186;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IOaG1peQ4ioEH8Qm0YRdkG68FfP97qOsWWlZTfTOM0=;
        b=XE/yOym03nKbI+rp565iBWABjZRrDUdFfwsLLH69RYRzlin03IHFb4td7ij3FalMFm
         BGdYPwF3apEZWokxK/XnKZnZi2JieEaA/ycMabpGeD4vSlJcRaIvGw5vdwBo+VW/wIA0
         lDYEax6ergTxtW+pMffUBcIC1tjYPjSw46IR7+vBI5Z/oM7zn/UcQR5c/Mgho4WW/xeQ
         ZP4xbgG9VjNzC1/iHZD0aova3p5/yMEsQ+qkAeH7R7X9+/tjd3HLDWcpQzJiSNpM+XWq
         wzppwMdYHi69XXiBNzDiX16vgo8li0iigcF/+MmMTLKsd68dhIOwDhG1v+4hkNgwNJNK
         gh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWg+Tq6DLtvAH3HXcZ7mpFuzssCVREuAZ55+PMKmylg+ISt5+xMsQquXeGBUZGiGh7pMrMCNYpFs5+S7gE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYE8fvXjbGcRTYw1qDOmTWU+vrcaqEezIgrojwBNt+hk7wyQ9A
	dXyhJTDKD3PJvFVlnvAbcjl5MnQwn3FpCmAOPV++yuPadaBpdjJDtHL8SfW06L8nFNuIbw==
X-Google-Smtp-Source: AGHT+IH+lFyhrUoBmSaCUUXaPG/BGBUuVyfFE/hf4AXktz8/7cr/BmFOcHngVLoFHJaT9TNyzunAv2XE
X-Received: from pfbei43.prod.google.com ([2002:a05:6a00:80eb:b0:736:46a8:452d])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1829:b0:736:5dc6:a14b
 with SMTP id d2e1a72fcca58-739d855846amr214293b3a.13.1743627386357; Wed, 02
 Apr 2025 13:56:26 -0700 (PDT)
Date: Wed,  2 Apr 2025 20:56:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250402205613.3086864-1-fvdl@google.com>
Subject: [PATCH] mm/hugetlb: use separate nodemask for bootmem allocations
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: david@redhat.com, osalvador@suse.de, luizcap@redhat.com, 
	Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Hugetlb boot allocation has used online nodes for allocation since
commit de55996d7188 ("mm/hugetlb: use online nodes for bootmem
allocation"). This was needed to be able to do the allocations
earlier in boot, before N_MEMORY was set.

This might lead to a different distribution of gigantic hugepages
across NUMA nodes if there are memoryless nodes in the system.

What happens is that the memoryless nodes are tried, but then
the memblock allocation fails and falls back, which usually means
that the node that has the highest physical address available
will be used (top-down allocation). While this will end up
getting the same number of hugetlb pages, they might not be
be distributed the same way. The fallback for each memoryless
node might not end up coming from the same node as the
successful round-robin allocation from N_MEMORY nodes.

While administrators that rely on having a specific number of
hugepages per node should use the hugepages=N:X syntax, it's
better not to change the old behavior for the plain hugepages=N
case.

To do this, construct a nodemask for hugetlb bootmem purposes
only, containing nodes that have memory. Then use that
for round-robin bootmem allocations.

This saves some cycles, and the added advantage here is that
hugetlb_cma can use it too, avoiding the older issue of
pointless attempts to create a CMA area for memoryless nodes
(which will also cause the per-node CMA area size to be too
small).

Fixes: de55996d7188 ("mm/hugetlb: use online nodes for bootmem allocation")
Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 include/linux/hugetlb.h |  3 +++
 mm/hugetlb.c            | 30 ++++++++++++++++++++++++++++--
 mm/hugetlb_cma.c        | 11 +++++++----
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 8f3ac832ee7f..fc9166f7f679 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -14,6 +14,7 @@
 #include <linux/pgtable.h>
 #include <linux/gfp.h>
 #include <linux/userfaultfd_k.h>
+#include <linux/nodemask.h>
 
 struct ctl_table;
 struct user_struct;
@@ -176,6 +177,8 @@ extern struct list_head huge_boot_pages[MAX_NUMNODES];
 
 void hugetlb_bootmem_alloc(void);
 bool hugetlb_bootmem_allocated(void);
+extern nodemask_t hugetlb_bootmem_nodes;
+void hugetlb_bootmem_set_nodes(void);
 
 /* arch callbacks */
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6fccfe6d046c..e69f6f31e082 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -58,6 +58,7 @@ int hugetlb_max_hstate __read_mostly;
 unsigned int default_hstate_idx;
 struct hstate hstates[HUGE_MAX_HSTATE];
 
+__initdata nodemask_t hugetlb_bootmem_nodes;
 __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
 static unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE] __initdata;
 
@@ -3237,7 +3238,8 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 	}
 
 	/* allocate from next node when distributing huge pages */
-	for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node, &node_states[N_ONLINE]) {
+	for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node,
+				    &hugetlb_bootmem_nodes) {
 		m = alloc_bootmem(h, node, false);
 		if (!m)
 			return 0;
@@ -3701,6 +3703,15 @@ static void __init hugetlb_init_hstates(void)
 	struct hstate *h, *h2;
 
 	for_each_hstate(h) {
+		/*
+		 * Always reset to first_memory_node here, even if
+		 * next_nid_to_alloc was set before - we can't
+		 * reference hugetlb_bootmem_nodes after init, and
+		 * first_memory_node is right for all further allocations.
+		 */
+		h->next_nid_to_alloc = first_memory_node;
+		h->next_nid_to_free = first_memory_node;
+
 		/* oversize hugepages were init'ed in early boot */
 		if (!hstate_is_gigantic(h))
 			hugetlb_hstate_alloc_pages(h);
@@ -4990,6 +5001,20 @@ static int __init default_hugepagesz_setup(char *s)
 }
 hugetlb_early_param("default_hugepagesz", default_hugepagesz_setup);
 
+void __init hugetlb_bootmem_set_nodes(void)
+{
+	int i, nid;
+	unsigned long start_pfn, end_pfn;
+
+	if (!nodes_empty(hugetlb_bootmem_nodes))
+		return;
+
+	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
+		if (end_pfn > start_pfn)
+			node_set(nid, hugetlb_bootmem_nodes);
+	}
+}
+
 static bool __hugetlb_bootmem_allocated __initdata;
 
 bool __init hugetlb_bootmem_allocated(void)
@@ -5005,6 +5030,8 @@ void __init hugetlb_bootmem_alloc(void)
 	if (__hugetlb_bootmem_allocated)
 		return;
 
+	hugetlb_bootmem_set_nodes();
+
 	for (i = 0; i < MAX_NUMNODES; i++)
 		INIT_LIST_HEAD(&huge_boot_pages[i]);
 
@@ -5012,7 +5039,6 @@ void __init hugetlb_bootmem_alloc(void)
 
 	for_each_hstate(h) {
 		h->next_nid_to_alloc = first_online_node;
-		h->next_nid_to_free = first_online_node;
 
 		if (hstate_is_gigantic(h))
 			hugetlb_hstate_alloc_pages(h);
diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index e0f2d5c3a84c..f58ef4969e7a 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -66,7 +66,7 @@ hugetlb_cma_alloc_bootmem(struct hstate *h, int *nid, bool node_exact)
 		if (node_exact)
 			return NULL;
 
-		for_each_online_node(node) {
+		for_each_node_mask(node, hugetlb_bootmem_nodes) {
 			cma = hugetlb_cma[node];
 			if (!cma || node == *nid)
 				continue;
@@ -153,11 +153,13 @@ void __init hugetlb_cma_reserve(int order)
 	if (!hugetlb_cma_size)
 		return;
 
+	hugetlb_bootmem_set_nodes();
+
 	for (nid = 0; nid < MAX_NUMNODES; nid++) {
 		if (hugetlb_cma_size_in_node[nid] == 0)
 			continue;
 
-		if (!node_online(nid)) {
+		if (!node_isset(nid, hugetlb_bootmem_nodes)) {
 			pr_warn("hugetlb_cma: invalid node %d specified\n", nid);
 			hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
 			hugetlb_cma_size_in_node[nid] = 0;
@@ -190,13 +192,14 @@ void __init hugetlb_cma_reserve(int order)
 		 * If 3 GB area is requested on a machine with 4 numa nodes,
 		 * let's allocate 1 GB on first three nodes and ignore the last one.
 		 */
-		per_node = DIV_ROUND_UP(hugetlb_cma_size, nr_online_nodes);
+		per_node = DIV_ROUND_UP(hugetlb_cma_size,
+					nodes_weight(hugetlb_bootmem_nodes));
 		pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
 			hugetlb_cma_size / SZ_1M, per_node / SZ_1M);
 	}
 
 	reserved = 0;
-	for_each_online_node(nid) {
+	for_each_node_mask(nid, hugetlb_bootmem_nodes) {
 		int res;
 		char name[CMA_MAX_NAME];
 
-- 
2.49.0.504.g3bcea36a83-goog

