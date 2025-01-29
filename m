Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131831F1526
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190571; cv=none; b=qf9bUeYKx8EwZ/816x/aJ+VM8OQ9d9PekEnu112MOWX5eXfnUSCVsF/3eTLrSYTp8pjxclUyHbAX9l0m9x6FSmHIjQJidpqNzu6XF4gBSg4+J6GYkHr6JSTZiNEvTRgV6NHm3DqMjDQg+xRDlVuovBfAq9uAcmRVm8TGzylYknY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190571; c=relaxed/simple;
	bh=mGy4fjcsHG2azxtHY5NUUKIT+cauYXSJYxyCrT59kAM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G3LGwVgATJi/w2UCPg8+8h2Kkv6bh0d2xE2/oJoOCXKl3LFprp3tqUWIBQk5MSrd/oaOUBLpMfKhLTwgk0904C41pJeTU3smStugEyKr6Nd4icj/eAebyj/+02UHtqehd6yh2p6sxii0yCBpLKiMDiz2JUy3Ifz4fcZjJTCnDzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dM3/F/yJ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dM3/F/yJ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2161d5b3eb5so2654225ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190568; x=1738795368; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=98CKfAXCouaMhImAnm0e8KjEMzprOEcP3h/4GQttOQs=;
        b=dM3/F/yJ0eAWRLWvFZqBbIhi/bgts6KCYL9uiJpUcbSllSx1y9mwsFVx25tNBq+B89
         /ccT2E+pHydzSQx74+ghjJBXf05a35m7qBJuXz3ej5hLKoF2w7GhSlRRs8IL8o1NsVWF
         wH/rrxC6KVgKg8PpCFDSHs+uemHcK9idwyQZ37VBL4a44HpdtPqZ4KozU89IabsES3yv
         mxpCl7sHZyK9N38/bItIUKiyC1+df1+OXspFIO/tmLbWpwCdNDobzoPRPe67A8OapD9s
         2zKcZyZfMOfKOb3WnMbmRLElWoIEkaj2gZOlud7SP5qBsi7RiQ83PA8nnwqs3CYvzcuj
         aDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190568; x=1738795368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98CKfAXCouaMhImAnm0e8KjEMzprOEcP3h/4GQttOQs=;
        b=tXZ/WEQz1RhakNyE4WexlNeWoyC7+0F7nqrtdFsA5qf2Xa/1TjXbSZbsFY8/Htj8dh
         gD4ODIOzdmA925izifoH4sAcMAGIZljRyEs3VoID5HVf9yfoyeCk6Wxt2CP9bwRw1g9m
         liFU51Lm4A0mvKNN/DFK/DB6Ud56r1bCY2siaIiYZp5Fgsg46aYLPvHdv0RWCqknS7XS
         1791JmFef8XJ/xDweSBbHxbP4AzrodKCk5qcAd4Ndr1Y2xsw3SHSuPQNJtLkQQzlbbo5
         H+TymNIDTwtsuPf67SeswvGI4ha7Cupg5mouSqYSNwvxMOMAAOJCPekbo/shFbmtX1WS
         ukuA==
X-Forwarded-Encrypted: i=1; AJvYcCUErH7pwiuoTPUJ9q5EcxyTtHOaFlRQRmToc0rdv8f7Ny76Xwy6DAzMyTjoacCRf6blZVnibyQ1ig2ZBfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfQDQBo2VW0txWVFh5mdc80ArH5vXKYeghxLHN/ln40GlO5anW
	fLp1bO533ghOkVKzuMeDcSkcCllpcX18kvGOdnTR29+SFDSwwydmYx3o5q+c5Kq6jgn8CQ==
X-Google-Smtp-Source: AGHT+IEY1cyX1Tlj45D+PYHBljqRW8zszqnM/nXeXUYLBp6biLr4qmhI4En+OAtFaTTk0P/jl6YDzVhE
X-Received: from pfbb14.prod.google.com ([2002:a05:6a00:ac8e:b0:72a:a7a4:9a53])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a1e:b0:725:b347:c3cc
 with SMTP id d2e1a72fcca58-72fd0c7bfadmr7456497b3a.23.1738190568330; Wed, 29
 Jan 2025 14:42:48 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:49 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-21-fvdl@google.com>
Subject: [PATCH v2 20/28] mm/hugetlb: do pre-HVO for bootmem allocated pages
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
index b48f8638c9af..5af544960052 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3311,8 +3311,8 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
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
index bee22ca93654..29647fd3d606 100644
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
2.48.1.262.g85cc9f2d1e-goog

