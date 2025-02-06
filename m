Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32E91C6FEE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867901; cv=none; b=F06hpbLrtmtpsHO8b4mTSE1Urb1TUhE7zmdmGQqgkr4+404Pu9d+lJOrk/K4NBMDklEZoQHRBwdiUXZgMVoFSX55v8+K5wPUGjud36xAKGAL7ndfe1kNiga4Pj92VWDhpxUUOCunA+obNFCLiOQQvHHTbCZ8rIW70KN9yPY4hJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867901; c=relaxed/simple;
	bh=ffwQ8Tp8XZIYbaj9AWTKAMDSaGO9X6prNZKnNfvc2aw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JPRwp9qLgOa9wVHWv5DAQwIXP4fkz3zE+DKgmQCD45ZOeX3RVHY+2dwLzaEeQTGHufs5TAjG1ysNHMflasU/q4KjzjKsY35uPLY4pX+ks9QhoYcXtcJ3fM7TZ+jCgyQp86lVJWTU/iChEQJZARBMDyRDjV6D6Xk+d41Aj1vXQwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tsRds4cb; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tsRds4cb"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2166464e236so39892535ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867899; x=1739472699; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XzNWdK53DK5kTMFUNWfsYU5y9JEDM1DtaDFYklZD4s=;
        b=tsRds4cbxjkJ15Czf0Tw6y8b93BNdWBL6IPwBtWcUV7wut+WrY9Cwg0OLzikO0cVMg
         9eCY3ZhEeMaFc4N3LCVmkMzJyJWi46eQVnpcaXMgiCjuLXdUdpmVB9fxf+rTmvr4+joh
         kaTBIfzs9LGV3zKlu4YyvM1BwCC7FxXACfvz/KhC4OUa28FUAFxEaA7gOzp+aXnNHzFz
         rK/Mfjo/natMOi3W2VY2pDDw6T1DEMrL7we24/rRYoQ0u9zU6UWM/6BP8EhC3QC42nIS
         B3mT/Bw1BfwZ9hFdecWYul4+qIsL9lO4fYPUA68wnPXRY6XC+idUezk8bzHO6bvLgJ7K
         tmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867899; x=1739472699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XzNWdK53DK5kTMFUNWfsYU5y9JEDM1DtaDFYklZD4s=;
        b=Eb49+jPPK9Wsk8msgny4MaDzI6H8IThoR0nTfWV9pGygzRBW5Euq0OmZuZU3N027QM
         /M9ZfbrmZmF0cdO+VSanKEp1GsETt4eas0BQBB4cqm7LfqHKGYNlTip98wGwsA1ZI3FF
         gut4v1737IaZRKKcj67XQjajO/RSrdiHmCPmT4wV+8tWaVeAldyeuFXc6en64zA00oHE
         P6uC2CZdGmnUbruqP5cCQKXd2p0EBAxnL5oAqofH5P4zhFrVOHc5GSkS1ewQ6eT3S9+r
         iOeu/iSlnscdgzx74nCNovFKrKbvQlX+oJiDqKU2a19hF6sey0E4FthERpeTmqzEtba3
         3eBw==
X-Forwarded-Encrypted: i=1; AJvYcCWFDVcIaMjARD7QjhCrzAQAP6yPaID5fK55uQtVbsTDAMSaGZU2wIH0Gsc51szMwz2VtZeg5P4qUHBEfb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDbghS0imBO/5pX6HSL8tiOzbsAGv1cX+DYpzreeVsl5f4JOQS
	Ps2TBflci2xilSZhDOqIEIWBBrDp6Nx59PfS0JFjfKmLEtTJJuA92x1C+ThSXIxHHab66Q==
X-Google-Smtp-Source: AGHT+IGIkx9zow3SNmjwLwkWX732+NMszmOw5UwG52/2qtVEFt/yi4VJkAhAKbmBsmMF+ToCMr1/WRbP
X-Received: from pgbdl12.prod.google.com ([2002:a05:6a02:d0c:b0:ad5:1a11:9dae])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3a87:b0:1ed:a565:f980
 with SMTP id adf61e73a8af0-1ee03bb030cmr937467637.27.1738867899243; Thu, 06
 Feb 2025 10:51:39 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:54 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-15-fvdl@google.com>
Subject: [PATCH v3 14/28] mm/hugetlb: check bootmem pages for zone intersections
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Bootmem hugetlb pages are allocated using memblock, which isn't
(and mostly can't be) aware of zones.

So, they may end up crossing zone boundaries. This would create
confusion, a hugetlb page that is part of multiple zones is bad.
Worse, HVO might then end up stealthily re-assigning pages to a
different zone when a hugetlb page is freed, since the tail page
structures beyond the first vmemmap page would inherit the zone
of the first page structures.

While the chance of this happening is low, you can definitely
create a configuration where this happens (especially using
ZONE_MOVABLE).

To avoid this issue, check if bootmem hugetlb pages intersect
with multiple zones during the gather phase, and discard
them, handing them to the page allocator, if they do. Record
the number of invalid bootmem pages per node and subtract them
from the number of available pages at the end, making it easier
to do these checks in multiple places later on.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/hugetlb.c  | 61 +++++++++++++++++++++++++++++++++++++++++++++++++--
 mm/internal.h |  2 ++
 mm/mm_init.c  | 25 +++++++++++++++++++++
 3 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index de8adfb487f4..789341158ef6 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -62,6 +62,7 @@ static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initdata;
 static unsigned long hugetlb_cma_size __initdata;
 
 __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
+static unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE] __initdata;
 
 /*
  * Due to ordering constraints across the init code for various
@@ -3308,6 +3309,44 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	}
 }
 
+static bool __init hugetlb_bootmem_page_zones_valid(int nid,
+						    struct huge_bootmem_page *m)
+{
+	unsigned long start_pfn;
+	bool valid;
+
+	start_pfn = virt_to_phys(m) >> PAGE_SHIFT;
+
+	valid = !pfn_range_intersects_zones(nid, start_pfn,
+			pages_per_huge_page(m->hstate));
+	if (!valid)
+		hstate_boot_nrinvalid[hstate_index(m->hstate)]++;
+
+	return valid;
+}
+
+/*
+ * Free a bootmem page that was found to be invalid (intersecting with
+ * multiple zones).
+ *
+ * Since it intersects with multiple zones, we can't just do a free
+ * operation on all pages at once, but instead have to walk all
+ * pages, freeing them one by one.
+ */
+static void __init hugetlb_bootmem_free_invalid_page(int nid, struct page *page,
+					     struct hstate *h)
+{
+	unsigned long npages = pages_per_huge_page(h);
+	unsigned long pfn;
+
+	while (npages--) {
+		pfn = page_to_pfn(page);
+		__init_reserved_page_zone(pfn, nid);
+		free_reserved_page(page);
+		page++;
+	}
+}
+
 /*
  * Put bootmem huge pages into the standard lists after mem_map is up.
  * Note: This only applies to gigantic (order > MAX_PAGE_ORDER) pages.
@@ -3315,14 +3354,25 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 static void __init gather_bootmem_prealloc_node(unsigned long nid)
 {
 	LIST_HEAD(folio_list);
-	struct huge_bootmem_page *m;
+	struct huge_bootmem_page *m, *tm;
 	struct hstate *h = NULL, *prev_h = NULL;
 
-	list_for_each_entry(m, &huge_boot_pages[nid], list) {
+	list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
 		struct page *page = virt_to_page(m);
 		struct folio *folio = (void *)page;
 
 		h = m->hstate;
+		if (!hugetlb_bootmem_page_zones_valid(nid, m)) {
+			/*
+			 * Can't use this page. Initialize the
+			 * page structures if that hasn't already
+			 * been done, and give them to the page
+			 * allocator.
+			 */
+			hugetlb_bootmem_free_invalid_page(nid, page, h);
+			continue;
+		}
+
 		/*
 		 * It is possible to have multiple huge page sizes (hstates)
 		 * in this list.  If so, process each size separately.
@@ -3594,13 +3644,20 @@ static void __init hugetlb_init_hstates(void)
 static void __init report_hugepages(void)
 {
 	struct hstate *h;
+	unsigned long nrinvalid;
 
 	for_each_hstate(h) {
 		char buf[32];
 
+		nrinvalid = hstate_boot_nrinvalid[hstate_index(h)];
+		h->max_huge_pages -= nrinvalid;
+
 		string_get_size(huge_page_size(h), 1, STRING_UNITS_2, buf, 32);
 		pr_info("HugeTLB: registered %s page size, pre-allocated %ld pages\n",
 			buf, h->free_huge_pages);
+		if (nrinvalid)
+			pr_info("HugeTLB: %s page size: %lu invalid page%s discarded\n",
+					buf, nrinvalid, nrinvalid > 1 ? "s" : "");
 		pr_info("HugeTLB: %d KiB vmemmap can be freed for a %s page\n",
 			hugetlb_vmemmap_optimizable_size(h) / SZ_1K, buf);
 	}
diff --git a/mm/internal.h b/mm/internal.h
index 57662141930e..63fda9bb9426 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -658,6 +658,8 @@ static inline struct page *pageblock_pfn_to_page(unsigned long start_pfn,
 }
 
 void set_zone_contiguous(struct zone *zone);
+bool pfn_range_intersects_zones(int nid, unsigned long start_pfn,
+			   unsigned long nr_pages);
 
 static inline void clear_zone_contiguous(struct zone *zone)
 {
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 925ed6564572..f7d5b4fe1ae9 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2287,6 +2287,31 @@ void set_zone_contiguous(struct zone *zone)
 	zone->contiguous = true;
 }
 
+/*
+ * Check if a PFN range intersects multiple zones on one or more
+ * NUMA nodes. Specify the @nid argument if it is known that this
+ * PFN range is on one node, NUMA_NO_NODE otherwise.
+ */
+bool pfn_range_intersects_zones(int nid, unsigned long start_pfn,
+			   unsigned long nr_pages)
+{
+	struct zone *zone, *izone = NULL;
+
+	for_each_zone(zone) {
+		if (nid != NUMA_NO_NODE && zone_to_nid(zone) != nid)
+			continue;
+
+		if (zone_intersects(zone, start_pfn, nr_pages)) {
+			if (izone != NULL)
+				return true;
+			izone = zone;
+		}
+
+	}
+
+	return false;
+}
+
 static void __init mem_init_print_info(void);
 void __init page_alloc_init_late(void)
 {
-- 
2.48.1.502.g6dc24dfdaf-goog

