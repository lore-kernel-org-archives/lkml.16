Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857D1EE7AA
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190561; cv=none; b=kYfuVrQfv6so6Rup3MJ3sIwysK3KnTji6nBQLTXlZTQ8zYus8NYeQ+QZHSAMEgaWM5zb+vIoFrrwQmECnWB1jM5T0MMBM4dnIWATeprRgFrq093EepchVOJnR7eIxgB9R1kMZnClJE8fqdlGLXi1rh/aTAyn3oLJ5MT6iF1JHmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190561; c=relaxed/simple;
	bh=uliIavhn3jJdykzLNJFxBtoJrXgefAaukHFwz7YW/Ek=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HRdl0RvrTprzh0xJIGDytyg7+GO0jzA3J4kSJLLIXlqCxFvwR1DWJ74q7smPNydgUbLxFizQRpPWrWFGsi2DcuI2uMeeUBuWq8b24dvgCp2j9ahSuq70HX2cjQouxR+dOqYZyS3TLyOgR5QmjpQVUHizYLLQ4vGmqL074uNT9xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QwkQcFHf; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QwkQcFHf"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21650d4612eso3939735ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190559; x=1738795359; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bphjz2B5H2n+p6toKCuCjUfnxwYaF6wPJ0biY9P/V2E=;
        b=QwkQcFHfZ9PxWB0WiCnxscT3dxZOgsF8T3lv09GZW080ErDzANG2B+nTpuVgLzjjip
         yV8nr1p8cIPuLrxrYBKRT77U674tf/Su/QXDZnMu5n6CiNt7CplrU2OxTMcoa0PeAxbp
         78lewGxRP+bkXdRceQuuxshT+7hCrHdhFaLKbfRUP3nXuD66TstO8IGmuIAPbk+548g3
         tl5sSL+nU8Pzu5auY8Zw/rqCTMLpsPiw85bvRaiQ0Fvx0B+dhzlkCiO2XfvJ/ocRrn0+
         qDxR1or2kcYyKSm2DId5xoqm3MusFyv/3n4raWzdzOp6FZjz+A0dOt3ubAF8GZt7FbCW
         HA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190559; x=1738795359;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bphjz2B5H2n+p6toKCuCjUfnxwYaF6wPJ0biY9P/V2E=;
        b=eT6g7N8iNfuH1aje203aB9UGR2dWsMPF8QsBBLYdPkM525TM+90s2sOZgtuSPl2YMy
         H2MEIW3qAsIIiSAIAC3zZMNnjymD43e02ypbD1UALPNugdwSchxGD29WWuNvU41BifKn
         +ssleGbvtJ8NlwRwxi9gW8ZOR9tizbLZAV27ejw9RYH1HSpC8qUd9yHVam8AkrMD5XZv
         tB+2NVkNjwd2EWVYwoBwFt6ShQCsT34snQA8Iy2UJY0AKi/FH6XyBLAW2ZqE/qc+pQbc
         BgKuFe87m6qabXef8WHPLsA4NDdRXHZPL6pjCk6GI6Nvbhds5AxtiV8rjBoZZ++GVJGa
         lgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCl6RT+ec8Jf5qMmZnJ1fbjmbUpFbfS/9wuNq7bmGkc5XsRel/MvMnKaUiFw0WxWbO+L0CKZ8cc9HfM7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxurCtvbPEN5g8uYGkIAO9m9mlSO0yBDEBuyTls6FUTP1ywHqsT
	s+2XdA0i2g4L6KagLNVS3hc8nd/i4mu5M5Kg0hz7wIeUn5sCXWrWlVQp4BdFXMenxU+zBA==
X-Google-Smtp-Source: AGHT+IEupuZBL681CzwqacE6l9j1whrVwEezyuvYbWICKt+dR8gVuQALet2uv2LXpK1TnJ3eAsBEWAai
X-Received: from plxd18.prod.google.com ([2002:a17:902:ef12:b0:21d:dae1:77e8])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea02:b0:21c:fb6:7c50
 with SMTP id d9443c01a7336-21dd7d8aa02mr76684975ad.31.1738190559165; Wed, 29
 Jan 2025 14:42:39 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:43 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-15-fvdl@google.com>
Subject: [PATCH v2 14/28] mm/hugetlb: check bootmem pages for zone intersections
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
index e5ca5cf2c6fd..a0a87d1a8569 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -63,6 +63,7 @@ static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initdata;
 static unsigned long hugetlb_cma_size __initdata;
 
 __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
+__initdata unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE];
 
 /*
  * Due to ordering constraints across the init code for various
@@ -3309,6 +3310,44 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
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
@@ -3316,14 +3355,25 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
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
@@ -3595,13 +3645,20 @@ static void __init hugetlb_init_hstates(void)
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
2.48.1.262.g85cc9f2d1e-goog

