Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F361257ACF
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640930; cv=none; b=U4Ow2uLRnS+Yvb5Ipzb30DCH5JcPhkjAvsD6TF9tMC0yB+tJQEg92Hkr4yAkTvU3QHaz+gJURBLmFnBg1SdjOXd2sHrMkxMbSnBuf6pXM7mjjnSJa1zYGG9qgv1bC78P3ti75ZVTV+oD0KkT36pRDKjsjY6LyehtA0YcLwJ9tug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640930; c=relaxed/simple;
	bh=P+7mA+e0mNdPIFNh9dUQuRv6rqP2ptUkjxEq2xLIjgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xg/+cjwqCKvtm0xX8HLaX9kCjOii/pDBE+pYO/j1g6WYwFVQMfw7DyvTT8lxsE7DSt4OQkbxQszwhhKVBg5xe0SIV5zvOcBD2gghtgCQqZBY6a/RRhYZ/7pRRkrSgQ0sQ/RB3QvPSIgFqaVz9Lu6AqJlByy5/dlXifBv6R1KeA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5444B168F;
	Mon, 19 May 2025 00:48:35 -0700 (PDT)
Received: from K4MQJ0H1H2.blr.arm.com (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E5D03F6A8;
	Mon, 19 May 2025 00:48:41 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
Date: Mon, 19 May 2025 13:18:20 +0530
Message-Id: <20250519074824.42909-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250519074824.42909-1-dev.jain@arm.com>
References: <20250519074824.42909-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of prot_numa, there are various cases in which we can skip to the
next iteration. Since the skip condition is based on the folio and not
the PTEs, we can skip a PTE batch.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 88608d0dc2c2..1ee160ed0b14 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -83,6 +83,18 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 	return pte_dirty(pte);
 }
 
+static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,
+		pte_t pte, int max_nr_ptes)
+{
+	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+
+	if (!folio_test_large(folio) || (max_nr_ptes == 1))
+		return 1;
+
+	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
+			       NULL, NULL, NULL);
+}
+
 static long change_pte_range(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
@@ -94,6 +106,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
 	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
 	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
+	int nr_ptes;
 
 	tlb_change_page_size(tlb, PAGE_SIZE);
 	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
@@ -108,8 +121,10 @@ static long change_pte_range(struct mmu_gather *tlb,
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 	do {
+		nr_ptes = 1;
 		oldpte = ptep_get(pte);
 		if (pte_present(oldpte)) {
+			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
 			pte_t ptent;
 
 			/*
@@ -126,15 +141,18 @@ static long change_pte_range(struct mmu_gather *tlb,
 					continue;
 
 				folio = vm_normal_folio(vma, addr, oldpte);
-				if (!folio || folio_is_zone_device(folio) ||
-				    folio_test_ksm(folio))
+				if (!folio)
 					continue;
 
+				if (folio_is_zone_device(folio) ||
+				    folio_test_ksm(folio))
+					goto skip_batch;
+
 				/* Also skip shared copy-on-write pages */
 				if (is_cow_mapping(vma->vm_flags) &&
 				    (folio_maybe_dma_pinned(folio) ||
 				     folio_maybe_mapped_shared(folio)))
-					continue;
+					goto skip_batch;
 
 				/*
 				 * While migration can move some dirty pages,
@@ -143,7 +161,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 				 */
 				if (folio_is_file_lru(folio) &&
 				    folio_test_dirty(folio))
-					continue;
+					goto skip_batch;
 
 				/*
 				 * Don't mess with PTEs if page is already on the node
@@ -151,7 +169,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 				 */
 				nid = folio_nid(folio);
 				if (target_node == nid)
-					continue;
+					goto skip_batch;
 				toptier = node_is_toptier(nid);
 
 				/*
@@ -159,8 +177,12 @@ static long change_pte_range(struct mmu_gather *tlb,
 				 * balancing is disabled
 				 */
 				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
-				    toptier)
+				    toptier) {
+skip_batch:
+					nr_ptes = mprotect_batch(folio, addr, pte,
+								 oldpte, max_nr_ptes);
 					continue;
+				}
 				if (folio_use_access_time(folio))
 					folio_xchg_access_time(folio,
 						jiffies_to_msecs(jiffies));
@@ -280,7 +302,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 				pages++;
 			}
 		}
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
 	arch_leave_lazy_mmu_mode();
 	pte_unmap_unlock(pte - 1, ptl);
 
-- 
2.30.2

