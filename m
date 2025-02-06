Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF01D90A9
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867908; cv=none; b=j/I9scB+kmByvRPiU66vaT1/ucAie36zkMg6zIcQY63ACEsOjTC90DFB1RPXTs8254kLtmVDrBGrGIpHIKiN0wIErHHFQiMNYO+cyah2k5gtpyRW1Yq4THEXSNwAnpf8X+CXUg8uHzJIhmiG+ckPQVBd7GXo3e9dEXMxa8URVyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867908; c=relaxed/simple;
	bh=WVn7vDPfu+EjljprrRLvQ+shC+V+6zeTvZGJJUUZmjs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uKcWaGuNEf4dHAtGhh4pak9rqioIHSkdu1HTKtvWm4flmy1RMPXcNPJElrw/NLZeHjjGL2PGtEcYuLc9jaXRCmDTz0r+HN9zIXG5HjK+Bx07p/uAgYRuzpQIpU7Zt7tWBwe1MnjShhjnuievc2E6bk3DyVwvUIgVeCaQNzCFpzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mnCY+qgt; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mnCY+qgt"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21f1a7dc0e6so46757615ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867905; x=1739472705; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1RY4Sckn7GWnsNuNzDlgUqe5LNqypC0myFrtZsSR9cE=;
        b=mnCY+qgtr4grN+xA1KMlx+B7FPBv+gs/+cfBa4w14pyBG7QIxF5hZk3NuH1QB97hzA
         NQIKVBSB5erxyX65px844xm/XXah1aLSIX87qo2eXG86GPWfBon/+n78PHXwR2HtsnrH
         sM+ppOd4CDuLLZeH8qQ3ZuxgXLT+cRUWQtZ4M4lj009KOcDg4DUGHqZChN0O+Sq7hTxk
         VUx2sE/lP9l27rnleWFdcNaLD5vzJGEeL1i9kyf5k/XroJ8zI+aDSUPEecCwkSkqcktI
         20bLcAhRKJ/J+3A00hqIfOc1LAbHwrzuDS31zDwy6nuIYR/VPlnx2tSJp1vFFcZ7mt0B
         vfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867905; x=1739472705;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1RY4Sckn7GWnsNuNzDlgUqe5LNqypC0myFrtZsSR9cE=;
        b=LulP01ck2z1mHwmDC5CxGwncnZ4TV50YZvJQMJkDh1PO4gIzDyNnc3AYaBFd/PgJzY
         rI8SI4UwAE0DT4qiD7s8JMElUWx2W967Ze5rYYZ/xQ9UDThtRbQ+9QWlr6NwHtlE3boI
         QcljRol/+FJozorRbciQD68Y/pFub1PsLrTFnOLcEPAzlbSjyPBzRoexXzUvZYY/sl9P
         KuyVzQrEclp7XKJCL6ZRXpYHTUUL40LtrZtqzGQur3S18fVl7Ebt1xqVxOoRTDVN6OA6
         K0W6ZXPinUE/iZNImHG5aKwD/nktcA2HgICg18ztqjMDculAH3sgQRCcw/YrbZeZN+VO
         EdcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlaexQMoA4GF/UtnNmElH+ZTorfDobJ2cGFdm+w64n4PiP9cJO53Bf2yCjTa6QUqUBM1B2rEpbGpKLGrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZVvB4uaUJfDyG5Xkfd+1xLi6xlaaQNRktwztMfyJnFxpsxAZf
	lnhZwyNhpHk3Z6brUeCY61VK5MFavZPBuR8OOefUaPcMlMKdN8CGohDr8sXyHh8AWR9PWA==
X-Google-Smtp-Source: AGHT+IGv5wn5p5nXx7RKxFjYk6wjYFPCzyPzBbZhXtDcOU21vQXSokgZmbD3Gr14JvKdrzDwy2bARR7t
X-Received: from pgev18.prod.google.com ([2002:a63:ac12:0:b0:abb:a12f:81a8])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9985:b0:1eb:7da4:305e
 with SMTP id adf61e73a8af0-1ee03b70cbcmr733791637.39.1738867905422; Thu, 06
 Feb 2025 10:51:45 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:58 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-19-fvdl@google.com>
Subject: [PATCH v3 18/28] mm/hugetlb: add pre-HVO framework
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Define flags for pre-HVOed bootmem hugetlb pages, and act on them.

The most important flag is the HVO flag, signalling that a bootmem
allocated gigantic page has already been HVO-ed. If this flag is
seen by the hugetlb bootmem gather code, the page is marked
as HVO optimized. The HVO code will then not try to optimize
it again. Instead, it will just map the tail page mirror pages
read-only, completing the HVO steps.

No functional change, as nothing sets the flags yet.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 arch/powerpc/mm/hugetlbpage.c |  1 +
 include/linux/hugetlb.h       |  4 +++
 mm/hugetlb.c                  | 24 ++++++++++++++++-
 mm/hugetlb_vmemmap.c          | 50 +++++++++++++++++++++++++++++++++--
 mm/hugetlb_vmemmap.h          | 15 +++++++++++
 5 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 6b043180220a..d3c1b749dcfc 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -113,6 +113,7 @@ static int __init pseries_alloc_bootmem_huge_page(struct hstate *hstate)
 	gpage_freearray[nr_gpages] = 0;
 	list_add(&m->list, &huge_boot_pages[0]);
 	m->hstate = hstate;
+	m->flags = 0;
 	return 1;
 }
 
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 5061279e5f73..10a7ce2b95e1 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -681,8 +681,12 @@ struct hstate {
 struct huge_bootmem_page {
 	struct list_head list;
 	struct hstate *hstate;
+	unsigned long flags;
 };
 
+#define HUGE_BOOTMEM_HVO		0x0001
+#define HUGE_BOOTMEM_ZONES_VALID	0x0002
+
 int isolate_or_dissolve_huge_page(struct page *page, struct list_head *list);
 int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn);
 struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 52ee5514a1f2..7e0810c217ce 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3219,6 +3219,7 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 	INIT_LIST_HEAD(&m->list);
 	list_add(&m->list, &huge_boot_pages[node]);
 	m->hstate = h;
+	m->flags = 0;
 	return 1;
 }
 
@@ -3286,7 +3287,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	struct folio *folio, *tmp_f;
 
 	/* Send list for bulk vmemmap optimization processing */
-	hugetlb_vmemmap_optimize_folios(h, folio_list);
+	hugetlb_vmemmap_optimize_bootmem_folios(h, folio_list);
 
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
 		if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
@@ -3315,6 +3316,13 @@ static bool __init hugetlb_bootmem_page_zones_valid(int nid,
 	unsigned long start_pfn;
 	bool valid;
 
+	if (m->flags & HUGE_BOOTMEM_ZONES_VALID) {
+		/*
+		 * Already validated, skip check.
+		 */
+		return true;
+	}
+
 	start_pfn = virt_to_phys(m) >> PAGE_SHIFT;
 
 	valid = !pfn_range_intersects_zones(nid, start_pfn,
@@ -3347,6 +3355,11 @@ static void __init hugetlb_bootmem_free_invalid_page(int nid, struct page *page,
 	}
 }
 
+static bool __init hugetlb_bootmem_page_prehvo(struct huge_bootmem_page *m)
+{
+	return (m->flags & HUGE_BOOTMEM_HVO);
+}
+
 /*
  * Put bootmem huge pages into the standard lists after mem_map is up.
  * Note: This only applies to gigantic (order > MAX_PAGE_ORDER) pages.
@@ -3387,6 +3400,15 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		hugetlb_folio_init_vmemmap(folio, h,
 					   HUGETLB_VMEMMAP_RESERVE_PAGES);
 		init_new_hugetlb_folio(h, folio);
+
+		if (hugetlb_bootmem_page_prehvo(m))
+			/*
+			 * If pre-HVO was done, just set the
+			 * flag, the HVO code will then skip
+			 * this folio.
+			 */
+			folio_set_hugetlb_vmemmap_optimized(folio);
+
 		list_add(&folio->lru, &folio_list);
 
 		/*
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 5b484758f813..be6b33ecbc8e 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -649,14 +649,39 @@ static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *fol
 	return vmemmap_remap_split(vmemmap_start, vmemmap_end, vmemmap_reuse);
 }
 
-void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
+static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
+					      struct list_head *folio_list,
+					      bool boot)
 {
 	struct folio *folio;
+	int nr_to_optimize;
 	LIST_HEAD(vmemmap_pages);
 	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
 
+	nr_to_optimize = 0;
 	list_for_each_entry(folio, folio_list, lru) {
-		int ret = hugetlb_vmemmap_split_folio(h, folio);
+		int ret;
+		unsigned long spfn, epfn;
+
+		if (boot && folio_test_hugetlb_vmemmap_optimized(folio)) {
+			/*
+			 * Already optimized by pre-HVO, just map the
+			 * mirrored tail page structs RO.
+			 */
+			spfn = (unsigned long)&folio->page;
+			epfn = spfn + pages_per_huge_page(h);
+			vmemmap_wrprotect_hvo(spfn, epfn, folio_nid(folio),
+					HUGETLB_VMEMMAP_RESERVE_SIZE);
+			register_page_bootmem_memmap(pfn_to_section_nr(spfn),
+					&folio->page,
+					HUGETLB_VMEMMAP_RESERVE_SIZE);
+			static_branch_inc(&hugetlb_optimize_vmemmap_key);
+			continue;
+		}
+
+		nr_to_optimize++;
+
+		ret = hugetlb_vmemmap_split_folio(h, folio);
 
 		/*
 		 * Spliting the PMD requires allocating a page, thus lets fail
@@ -668,6 +693,16 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 			break;
 	}
 
+	if (!nr_to_optimize)
+		/*
+		 * All pre-HVO folios, nothing left to do. It's ok if
+		 * there is a mix of pre-HVO and not yet HVO-ed folios
+		 * here, as __hugetlb_vmemmap_optimize_folio() will
+		 * skip any folios that already have the optimized flag
+		 * set, see vmemmap_should_optimize_folio().
+		 */
+		goto out;
+
 	flush_tlb_all();
 
 	list_for_each_entry(folio, folio_list, lru) {
@@ -693,10 +728,21 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 		}
 	}
 
+out:
 	flush_tlb_all();
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
+void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
+{
+	__hugetlb_vmemmap_optimize_folios(h, folio_list, false);
+}
+
+void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h, struct list_head *folio_list)
+{
+	__hugetlb_vmemmap_optimize_folios(h, folio_list, true);
+}
+
 static const struct ctl_table hugetlb_vmemmap_sysctls[] = {
 	{
 		.procname	= "hugetlb_optimize_vmemmap",
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 2fcae92d3359..a6354a27e63f 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -24,6 +24,8 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 					struct list_head *non_hvo_folios);
 void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio);
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list);
+void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h, struct list_head *folio_list);
+
 
 static inline unsigned int hugetlb_vmemmap_size(const struct hstate *h)
 {
@@ -64,6 +66,19 @@ static inline void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list
 {
 }
 
+static inline void hugetlb_vmemmap_init_early(int nid)
+{
+}
+
+static inline void hugetlb_vmemmap_init_late(int nid)
+{
+}
+
+static inline void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h,
+						struct list_head *folio_list)
+{
+}
+
 static inline unsigned int hugetlb_vmemmap_optimizable_size(const struct hstate *h)
 {
 	return 0;
-- 
2.48.1.502.g6dc24dfdaf-goog

