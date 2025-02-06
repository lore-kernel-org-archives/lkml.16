Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6505F1DC9B4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867911; cv=none; b=skOZYLbyjkNw5j8OKdGHk1tX3JxoPIZWn7VfvEsGUVsNISq7zghJnhjr4zax4u7hVVZq0q5qtLM597++RGiPBc6Trr5NSE9nSnOk91IS3i6+aqO4IL0dFYoDgs+raGHG36uloGBXaG93Y3vnaF1yPC49v7R1UsYwE2hWAdC2mIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867911; c=relaxed/simple;
	bh=MwQoEMcDUUcX7Mfjoxiv5kP8Ft1uxkLcbUM1Sp/36xE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BdgsVqugDUlZMRRlo5iaXVRhkRHl6AvE7n0UxhfOB0rhclvkudN4Vf291SuHmWdqSLOYJt3An2ZMjW155oppFsdjy+u/ODRhgsJ6BowkhSWrLtsmIADZ4HYEyV+e/g1IepM6/UovzjmE88ywWRImTVUpA+DxPNRxJklwDLXWg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cz/knLmH; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cz/knLmH"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f9c02f54f2so2486922a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867909; x=1739472709; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=41QLNtbtqhWSGZ/oObOknHg0NviKslOOeQUP783wlTM=;
        b=cz/knLmH3pBALSWrayHfVEUE05zCPIG4hClr4aInennr0TUNkLT7BzeZBS9vkTLpll
         Pafvbck2Ej2AeoC5o8sk6CAQuaNfyhG6PqgZ5dp2e4N4Doh9dw3jPyH+WvM52a9vsN96
         wNCUqmOrylSYLIWUD4BK0EE9QUxzvFU+vLrQxnPfBGjauwOTEruoh4tcJZoD+XY4Lf10
         Y71epegm3mTXLadOj7eAT2mxmoKzjVvz2rJtnVJQBxvDKvTvL89HuhOrZNgyz1JIis27
         6R9HdVfT3FHEQrScZJHeLgUp6BWOI6Ahel8u3+Ps9J1U8wvgpB6b08M7cVyilhq3VOIi
         oFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867909; x=1739472709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=41QLNtbtqhWSGZ/oObOknHg0NviKslOOeQUP783wlTM=;
        b=YM0HWg/k/1tPXrfwOiCsJtPuqu5wUPIReWxSUxOoTqsEY3abeHgydUp3LJi8tVW/Y3
         SrFq6UTUQQG7xC/aBPzz4CkliffRe8XvBbVMgOwHxxCAVIJcASUcaugCeV7RGylSHYu1
         gzS+DfpU6uqY8zSDmIozMaA8n/SU3uNn/PoZuSB2R0WaxKviLnc1KNrRJuFmV4cN+35j
         MAWt9CPknmR3K8ZoJAvYMCIL1+jjtVMhtzLMRTwULBpNopLA5Do6ESRB+vy+TShl5k41
         0MOJlAx68pWjqq6kzxhF/drIwt96PbyYvyMHwFeKpZYAVZ+BGBHheItq5tIwmdLpsVZ3
         dR3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5C+a21UZsXYQWPVUSmqUVmSY6hdQuhwq9S56DY/3ezpzcvdlEgWVXDVGOj3ESPmPvxZOKImqaB0s/TN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEa9nijmk7umg33k0zMfNvsIoqw5Ud2AOAppFcBpC6rdmtfhJc
	+5qV4+i/vWYak0CVg+CQyQRXK9RhaigeHdZoLXc/o+TpT2+xnMaz9WbW5icICvd0IjGeSw==
X-Google-Smtp-Source: AGHT+IGVxYFLO6PMMj5YOBtKJIkBsk+UPteT4nuImFK20RZLySxCL3GaHTYjR4JwUAp1YZGI3vapG7Y+
X-Received: from pfbhd4.prod.google.com ([2002:a05:6a00:6584:b0:72f:8e60:adb8])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e9c:b0:725:e405:6df7
 with SMTP id d2e1a72fcca58-7305d46f7bemr390731b3a.10.1738867908791; Thu, 06
 Feb 2025 10:51:48 -0800 (PST)
Date: Thu,  6 Feb 2025 18:51:00 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-21-fvdl@google.com>
Subject: [PATCH v3 20/28] mm/hugetlb: do pre-HVO for bootmem allocated pages
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

For large systems, the overhead of vmemmap pages for hugetlb
is substantial. It's about 1.5% of memory, which is about
45G for a 3T system. If you want to configure most of that
system for hugetlb (e.g. to use as backing memory for VMs),
there is a chance of running out of memory on boot, even
though you know that the 45G will become available later.

To avoid this scenario, and since it's a waste to first
allocate and then free that 45G during boot, do pre-HVO
for hugetlb bootmem allocated pages ('gigantic' pages).

pre-HVO is done by adding functions that are called from
sparse_init_nid_early and sparse_init_nid_late. The first
is called before memmap allocation, so it takes care of
allocating memmap HVO-style. The second verifies that all
bootmem pages look good, specifically it checks that they
do not intersect with multiple zones. This can only be done
from sparse_init_nid_late path, when zones have been
initialized.

The hugetlb page size must be aligned to the section size,
and aligned to the size of memory described by the number
of page structures contained in one PMD (since pre-HVO
is not prepared to split PMDs). This should be true for
most 'gigantic' pages, it is for 1G pages on x86, where
both of these alignment requirements are 128M.

This will only have an effect if hugetlb_bootmem_alloc was
called early in boot. If not, it won't do anything, and
HVO for bootmem hugetlb pages works as before.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 include/linux/hugetlb.h |   2 +
 mm/hugetlb.c            |   4 +-
 mm/hugetlb_vmemmap.c    | 143 ++++++++++++++++++++++++++++++++++++++++
 mm/hugetlb_vmemmap.h    |   6 ++
 mm/sparse-vmemmap.c     |   4 ++
 5 files changed, 157 insertions(+), 2 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 10a7ce2b95e1..2512463bca49 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -687,6 +687,8 @@ struct huge_bootmem_page {
 #define HUGE_BOOTMEM_HVO		0x0001
 #define HUGE_BOOTMEM_ZONES_VALID	0x0002
 
+bool hugetlb_bootmem_page_zones_valid(int nid, struct huge_bootmem_page *m);
+
 int isolate_or_dissolve_huge_page(struct page *page, struct list_head *list);
 int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn);
 struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7e0810c217ce..29b3a6e70a53 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3310,8 +3310,8 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	}
 }
 
-static bool __init hugetlb_bootmem_page_zones_valid(int nid,
-						    struct huge_bootmem_page *m)
+bool __init hugetlb_bootmem_page_zones_valid(int nid,
+					     struct huge_bootmem_page *m)
 {
 	unsigned long start_pfn;
 	bool valid;
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index be6b33ecbc8e..9a99dfa3c495 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -743,6 +743,149 @@ void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h, struct list_head
 	__hugetlb_vmemmap_optimize_folios(h, folio_list, true);
 }
 
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
+
+/* Return true of a bootmem allocated HugeTLB page should be pre-HVO-ed */
+static bool vmemmap_should_optimize_bootmem_page(struct huge_bootmem_page *m)
+{
+	unsigned long section_size, psize, pmd_vmemmap_size;
+	phys_addr_t paddr;
+
+	if (!READ_ONCE(vmemmap_optimize_enabled))
+		return false;
+
+	if (!hugetlb_vmemmap_optimizable(m->hstate))
+		return false;
+
+	psize = huge_page_size(m->hstate);
+	paddr = virt_to_phys(m);
+
+	/*
+	 * Pre-HVO only works if the bootmem huge page
+	 * is aligned to the section size.
+	 */
+	section_size = (1UL << PA_SECTION_SHIFT);
+	if (!IS_ALIGNED(paddr, section_size) ||
+	    !IS_ALIGNED(psize, section_size))
+		return false;
+
+	/*
+	 * The pre-HVO code does not deal with splitting PMDS,
+	 * so the bootmem page must be aligned to the number
+	 * of base pages that can be mapped with one vmemmap PMD.
+	 */
+	pmd_vmemmap_size = (PMD_SIZE / (sizeof(struct page))) << PAGE_SHIFT;
+	if (!IS_ALIGNED(paddr, pmd_vmemmap_size) ||
+	    !IS_ALIGNED(psize, pmd_vmemmap_size))
+		return false;
+
+	return true;
+}
+
+/*
+ * Initialize memmap section for a gigantic page, HVO-style.
+ */
+void __init hugetlb_vmemmap_init_early(int nid)
+{
+	unsigned long psize, paddr, section_size;
+	unsigned long ns, i, pnum, pfn, nr_pages;
+	unsigned long start, end;
+	struct huge_bootmem_page *m = NULL;
+	void *map;
+
+	/*
+	 * Noting to do if bootmem pages were not allocated
+	 * early in boot, or if HVO wasn't enabled in the
+	 * first place.
+	 */
+	if (!hugetlb_bootmem_allocated())
+		return;
+
+	if (!READ_ONCE(vmemmap_optimize_enabled))
+		return;
+
+	section_size = (1UL << PA_SECTION_SHIFT);
+
+	list_for_each_entry(m, &huge_boot_pages[nid], list) {
+		if (!vmemmap_should_optimize_bootmem_page(m))
+			continue;
+
+		nr_pages = pages_per_huge_page(m->hstate);
+		psize = nr_pages << PAGE_SHIFT;
+		paddr = virt_to_phys(m);
+		pfn = PHYS_PFN(paddr);
+		map = pfn_to_page(pfn);
+		start = (unsigned long)map;
+		end = start + nr_pages * sizeof(struct page);
+
+		if (vmemmap_populate_hvo(start, end, nid,
+					HUGETLB_VMEMMAP_RESERVE_SIZE) < 0)
+			continue;
+
+		memmap_boot_pages_add(HUGETLB_VMEMMAP_RESERVE_SIZE / PAGE_SIZE);
+
+		pnum = pfn_to_section_nr(pfn);
+		ns = psize / section_size;
+
+		for (i = 0; i < ns; i++) {
+			sparse_init_early_section(nid, map, pnum,
+					SECTION_IS_VMEMMAP_PREINIT);
+			map += section_map_size();
+			pnum++;
+		}
+
+		m->flags |= HUGE_BOOTMEM_HVO;
+	}
+}
+
+void __init hugetlb_vmemmap_init_late(int nid)
+{
+	struct huge_bootmem_page *m, *tm;
+	unsigned long phys, nr_pages, start, end;
+	unsigned long pfn, nr_mmap;
+	struct hstate *h;
+	void *map;
+
+	if (!hugetlb_bootmem_allocated())
+		return;
+
+	if (!READ_ONCE(vmemmap_optimize_enabled))
+		return;
+
+	list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
+		if (!(m->flags & HUGE_BOOTMEM_HVO))
+			continue;
+
+		phys = virt_to_phys(m);
+		h = m->hstate;
+		pfn = PHYS_PFN(phys);
+		nr_pages = pages_per_huge_page(h);
+
+		if (!hugetlb_bootmem_page_zones_valid(nid, m)) {
+			/*
+			 * Oops, the hugetlb page spans multiple zones.
+			 * Remove it from the list, and undo HVO.
+			 */
+			list_del(&m->list);
+
+			map = pfn_to_page(pfn);
+
+			start = (unsigned long)map;
+			end = start + nr_pages * sizeof(struct page);
+
+			vmemmap_undo_hvo(start, end, nid,
+					 HUGETLB_VMEMMAP_RESERVE_SIZE);
+			nr_mmap = end - start - HUGETLB_VMEMMAP_RESERVE_SIZE;
+			memmap_boot_pages_add(DIV_ROUND_UP(nr_mmap, PAGE_SIZE));
+
+			memblock_phys_free(phys, huge_page_size(h));
+			continue;
+		} else
+			m->flags |= HUGE_BOOTMEM_ZONES_VALID;
+	}
+}
+#endif
+
 static const struct ctl_table hugetlb_vmemmap_sysctls[] = {
 	{
 		.procname	= "hugetlb_optimize_vmemmap",
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 926b8b27b5cb..0031e49b12f7 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -9,6 +9,8 @@
 #ifndef _LINUX_HUGETLB_VMEMMAP_H
 #define _LINUX_HUGETLB_VMEMMAP_H
 #include <linux/hugetlb.h>
+#include <linux/io.h>
+#include <linux/memblock.h>
 
 /*
  * Reserve one vmemmap page, all vmemmap addresses are mapped to it. See
@@ -25,6 +27,10 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio);
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list);
 void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h, struct list_head *folio_list);
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
+void hugetlb_vmemmap_init_early(int nid);
+void hugetlb_vmemmap_init_late(int nid);
+#endif
 
 
 static inline unsigned int hugetlb_vmemmap_size(const struct hstate *h)
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 8cc848c4b17c..fd2ab5118e13 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -32,6 +32,8 @@
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 
+#include "hugetlb_vmemmap.h"
+
 /*
  * Flags for vmemmap_populate_range and friends.
  */
@@ -594,6 +596,7 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
  */
 void __init sparse_vmemmap_init_nid_early(int nid)
 {
+	hugetlb_vmemmap_init_early(nid);
 }
 
 /*
@@ -604,5 +607,6 @@ void __init sparse_vmemmap_init_nid_early(int nid)
  */
 void __init sparse_vmemmap_init_nid_late(int nid)
 {
+	hugetlb_vmemmap_init_late(nid);
 }
 #endif
-- 
2.48.1.502.g6dc24dfdaf-goog

