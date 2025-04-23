Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C482C155342
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424514; cv=none; b=OPoektCcTQdq7yZdThDZmSwp+p6vmaw0tOxLgJfG+5YMDoRYpF7Srl3rdYljKmXUKGstEOQebOf97KIpZtgmNUfWtONDaBo5kheAdALvxW7UjMwwjwsJDPi4YxeWw1e7WvAjVC2OLbAvDfdiY4IM9B1CWrQqYubu1Mytvnuu6ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424514; c=relaxed/simple;
	bh=tecvClq+rk+3b8V+Qs3YoQ0Th7ilIVvh0CG+JCzviVk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cYLBDsFur2n4ozou+IZvpyMi+nNO5CWXHCdGOfRAc95fjsGDwSvTzx+SPHDVTalrFleA72+pP8t2gnrXhAxq2iQi+ZNFKJwE+S0/l1vZnD1TPvYS4SqbU7r+yyqLJObE5W8nRTziAnKvVYXguWRD3/kGY6naoZpxoY2pqEr01SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3HKBKcd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3HKBKcd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD56C4CEE2;
	Wed, 23 Apr 2025 16:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745424514;
	bh=tecvClq+rk+3b8V+Qs3YoQ0Th7ilIVvh0CG+JCzviVk=;
	h=From:To:Cc:Subject:Date:From;
	b=j3HKBKcdJQYtNXhAM8rAx8+6fquRpLE0nJp2ticfzUo+6Pl7cPWkOoWYaBUjOccgp
	 Xiu+v3802FVYg93dhOIFy+TiE6AfbEuEC0SXxStiT7DhK1lSFJwn+XT1WqaDN3V5IZ
	 Qe2XKJklG8ju1ruCQFBt8ud2BxEoBusCaXhUfSWzydn0jiRhvfJNos9dwVinfc6Fy1
	 XnhAdCo8rkRB4PhgObOQ0uU6FnIbh5hJlA7BWl8f68aMf8k4XPLhkpnlBuy+ne7UML
	 2bxi181/vNwnCNzZwgsuHbL53b8as9D6EAWGF8GYdX7B8fKniosn/PYs2idnrTKQx4
	 9totkA2UUB1rA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Barry Song <baohua@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Frank van der Linden <fvdl@google.com>,
	York Jasper Niebuhr <yjnworkstation@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] memblock: mark init_deferred_page as __init_memblock
Date: Wed, 23 Apr 2025 18:08:08 +0200
Message-Id: <20250423160824.1498493-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On architectures that set CONFIG_ARCH_KEEP_MEMBLOCK, memmap_init_kho_scratch_pages
is not discarded but calls a function that is:

WARNING: modpost: vmlinux: section mismatch in reference: memmap_init_kho_scratch_pages+0x120 (section: .text) -> init_deferred_page (section: .init.text)
ERROR: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.

Mark init_deferred_page the same way as memmap_init_kho_scratch_pages
to avoid that warning. Unfortunately this requires marking additional
functions the same way to have them stay around as well.

Ideally memmap_init_kho_scratch_pages would become __meminit instead
of __init_memblock, but I could not convince myself that this is safe.

Fixes: 1b7936623970 ("memblock: introduce memmap_init_kho_scratch()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 mm/internal.h | 7 ++++---
 mm/mm_init.c  | 8 ++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 838f840ded83..40464f755092 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -9,6 +9,7 @@
 
 #include <linux/fs.h>
 #include <linux/khugepaged.h>
+#include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/mm_inline.h>
 #include <linux/pagemap.h>
@@ -543,7 +544,7 @@ extern int defrag_mode;
 
 void setup_per_zone_wmarks(void);
 void calculate_min_free_kbytes(void);
-int __meminit init_per_zone_wmark_min(void);
+int __init_memblock init_per_zone_wmark_min(void);
 void page_alloc_sysctl_init(void);
 
 /*
@@ -1532,9 +1533,9 @@ static inline bool pte_needs_soft_dirty_wp(struct vm_area_struct *vma, pte_t pte
 	return vma_soft_dirty_enabled(vma) && !pte_soft_dirty(pte);
 }
 
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
+void __init_memblock __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
-void __meminit __init_page_from_nid(unsigned long pfn, int nid);
+void __init_memblock __init_page_from_nid(unsigned long pfn, int nid);
 
 /* shrinker related functions */
 unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 7bb5f77cf195..31cf8bc31cc2 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -578,7 +578,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 	node_states[N_MEMORY] = saved_node_state;
 }
 
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
+void __init_memblock __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid)
 {
 	mm_zero_struct_page(page);
@@ -669,7 +669,7 @@ static inline void fixup_hashdist(void) {}
 /*
  * Initialize a reserved page unconditionally, finding its zone first.
  */
-void __meminit __init_page_from_nid(unsigned long pfn, int nid)
+void __init_memblock __init_page_from_nid(unsigned long pfn, int nid)
 {
 	pg_data_t *pgdat;
 	int zid;
@@ -744,7 +744,7 @@ defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
 	return false;
 }
 
-static void __meminit __init_deferred_page(unsigned long pfn, int nid)
+static void __init_memblock __init_deferred_page(unsigned long pfn, int nid)
 {
 	if (early_page_initialised(pfn, nid))
 		return;
@@ -769,7 +769,7 @@ static inline void __init_deferred_page(unsigned long pfn, int nid)
 }
 #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
 
-void __meminit init_deferred_page(unsigned long pfn, int nid)
+void __init_memblock init_deferred_page(unsigned long pfn, int nid)
 {
 	__init_deferred_page(pfn, nid);
 }
-- 
2.39.5

