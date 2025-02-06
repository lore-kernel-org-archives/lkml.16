Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EBD1DE4D0
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867917; cv=none; b=Nn3HZsRAQbhfcq67/cBOk03Gd7eHqLj7FtL4EPm6JSAWKPBNlZobbD8h9yVphwBRzBfi7vJPSF//qK/y1yelLmJFjLIFzMG0BSBFAN6U6vEJynGH/S0GuGGnskzOw3FwyYGC88tiZefG3kQvZJhuuSpf+nbm+m6YhWwyQ4z39rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867917; c=relaxed/simple;
	bh=ulolHMBM9mu2AADD0bujgm62JTsEMiIusrvyXP1wP4w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yynx71cPC0B47rRHDT/R8lK1j3jriv6SwfIklE/QUgv978Y5L+60ToYO6F3RHaQEpuH7KdffQ3l4UTIRI5eRHD+ZGA8cxYlYAxCS/DTKjED029TLFh5DZvAlBmySLJGoCTpjN/G93NGDsqLIPB1SG4qXWiIyySyEQ4JqsSij7eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PrSyFThs; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PrSyFThs"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216750b679eso20321185ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867915; x=1739472715; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yt0ZJmO4eMnkUw1+mDBNXTwvRT3PLwjDe9mC0zKYM+w=;
        b=PrSyFThsyPor2Ba6xE9XCi6OhR3pOjqPsjWQUWpxl6SlxUZdFTvD/l8EVJBzi164yX
         hF7Uc8LYc8Fa307mGZYw9zOx1FjT96xBLHLa1FMkrtcPionnT4Aa7stC56sPmJjY92kt
         z+E4ZcPAG028IK+R4r46OXzGjKUtBwcw/FavlaXFZ+RxLQlO5J1AMRAzg0qg85ipXu+T
         VjI3ouiRY5UvPXbod/aY+AFKQcm4N484ZUmxrkzUctoxBguhxm3EdGivovLOJMQmz/cz
         hLx0qg+U4cCR5zipzfslAvhugJEtQTZ7AKsXCFIKcOBGFRF7XueCJXSaBnCJJgs0pKbN
         7Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867915; x=1739472715;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yt0ZJmO4eMnkUw1+mDBNXTwvRT3PLwjDe9mC0zKYM+w=;
        b=lZQ3cP4jhHQ47avmXU3uEtRhw/qIaP8Zlb67WuurSIfHzL82ZKmr485qff/kx3KUJA
         tYJeV+havj7kvk4MUwNQVABzdVfT+NUXFbQclTpz4nFkDrrdnVgjZMsDA7HjtgVgE2YC
         zkqltt0I2fZFfxUAqViYzkZ0mm2rQCzrGdSm69Ehd9adEC0DvxfSE9LgPOEMgUWjNSmz
         MTNBycdWisQJM8VuWBPP4wqC86kDPA9LACSc1CcB1qHLsowG3QdmwZLcArWFijrGEzSb
         Jjr/60n5zysSrVnQrfrfFyU66+vYLkG1BXh0RGGkFmnCs7/vcFwOzgrXY/1qv7peu3Wa
         vmZg==
X-Forwarded-Encrypted: i=1; AJvYcCXqEFLuBtd79Gp7I9fJCYHC6Vk7ccJQo1mQQfKvtODUVhEdW0RDijO8tf8Bp2ItNjOt4M0mbMuIPpfC8wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFl1FFOO9OPeANMytVUQEej4XWwjs5f6KkiCykEO4XiEO7Rg8J
	cUIaNFGyPC9sfy2HF824UxZl8qjE6RRSmQSzTiBC84FbSTPCWNyC6sL8gAuJQBrCFigrRw==
X-Google-Smtp-Source: AGHT+IFZhH2u1+M+xFH2j0CpMHxi5A7C45tXR32gxTZbZ8iZD/tY8JR/54qpQpgRoE2PyZBUqmPt1YR+
X-Received: from pgcv13.prod.google.com ([2002:a05:6a02:530d:b0:801:d724:5abd])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9f8e:b0:1e1:94a2:275c
 with SMTP id adf61e73a8af0-1ee03a3f4camr941358637.18.1738867915504; Thu, 06
 Feb 2025 10:51:55 -0800 (PST)
Date: Thu,  6 Feb 2025 18:51:04 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-25-fvdl@google.com>
Subject: [PATCH v3 24/28] mm/cma: introduce a cma validate function
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Define a function to check if a CMA area is valid, which means:
do its ranges not cross any zone boundaries. Store the result
in the newly created flags for each CMA area, so that multiple
calls are dealt with.

This allows for checking the validity of a CMA area early, which
is needed later in order to be able to allocate hugetlb bootmem
pages from it with pre-HVO.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 include/linux/cma.h |  5 ++++
 mm/cma.c            | 60 ++++++++++++++++++++++++++++++++++++---------
 mm/cma.h            |  8 +++++-
 3 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 03d85c100dcc..62d9c1cf6326 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -60,6 +60,7 @@ extern void cma_reserve_pages_on_error(struct cma *cma);
 #ifdef CONFIG_CMA
 struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp);
 bool cma_free_folio(struct cma *cma, const struct folio *folio);
+bool cma_validate_zones(struct cma *cma);
 #else
 static inline struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp)
 {
@@ -70,6 +71,10 @@ static inline bool cma_free_folio(struct cma *cma, const struct folio *folio)
 {
 	return false;
 }
+static inline bool cma_validate_zones(struct cma *cma)
+{
+	return false;
+}
 #endif
 
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index d0227af4bb71..4388d941d381 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -99,6 +99,49 @@ static void cma_clear_bitmap(struct cma *cma, const struct cma_memrange *cmr,
 	spin_unlock_irqrestore(&cma->lock, flags);
 }
 
+/*
+ * Check if a CMA area contains no ranges that intersect with
+ * multiple zones. Store the result in the flags in case
+ * this gets called more than once.
+ */
+bool cma_validate_zones(struct cma *cma)
+{
+	int r;
+	unsigned long base_pfn;
+	struct cma_memrange *cmr;
+	bool valid_bit_set;
+
+	/*
+	 * If already validated, return result of previous check.
+	 * Either the valid or invalid bit will be set if this
+	 * check has already been done. If neither is set, the
+	 * check has not been performed yet.
+	 */
+	valid_bit_set = test_bit(CMA_ZONES_VALID, &cma->flags);
+	if (valid_bit_set || test_bit(CMA_ZONES_INVALID, &cma->flags))
+		return valid_bit_set;
+
+	for (r = 0; r < cma->nranges; r++) {
+		cmr = &cma->ranges[r];
+		base_pfn = cmr->base_pfn;
+
+		/*
+		 * alloc_contig_range() requires the pfn range specified
+		 * to be in the same zone. Simplify by forcing the entire
+		 * CMA resv range to be in the same zone.
+		 */
+		WARN_ON_ONCE(!pfn_valid(base_pfn));
+		if (pfn_range_intersects_zones(cma->nid, base_pfn, cmr->count)) {
+			set_bit(CMA_ZONES_INVALID, &cma->flags);
+			return false;
+		}
+	}
+
+	set_bit(CMA_ZONES_VALID, &cma->flags);
+
+	return true;
+}
+
 static void __init cma_activate_area(struct cma *cma)
 {
 	unsigned long pfn, base_pfn;
@@ -113,19 +156,12 @@ static void __init cma_activate_area(struct cma *cma)
 			goto cleanup;
 	}
 
+	if (!cma_validate_zones(cma))
+		goto cleanup;
+
 	for (r = 0; r < cma->nranges; r++) {
 		cmr = &cma->ranges[r];
 		base_pfn = cmr->base_pfn;
-
-		/*
-		 * alloc_contig_range() requires the pfn range specified
-		 * to be in the same zone. Simplify by forcing the entire
-		 * CMA resv range to be in the same zone.
-		 */
-		WARN_ON_ONCE(!pfn_valid(base_pfn));
-		if (pfn_range_intersects_zones(cma->nid, base_pfn, cmr->count))
-			goto cleanup;
-
 		for (pfn = base_pfn; pfn < base_pfn + cmr->count;
 		     pfn += pageblock_nr_pages)
 			init_cma_reserved_pageblock(pfn_to_page(pfn));
@@ -145,7 +181,7 @@ static void __init cma_activate_area(struct cma *cma)
 		bitmap_free(cma->ranges[r].bitmap);
 
 	/* Expose all pages to the buddy, they are useless for CMA. */
-	if (!cma->reserve_pages_on_error) {
+	if (!test_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags)) {
 		for (r = 0; r < allocrange; r++) {
 			cmr = &cma->ranges[r];
 			for (pfn = cmr->base_pfn;
@@ -172,7 +208,7 @@ core_initcall(cma_init_reserved_areas);
 
 void __init cma_reserve_pages_on_error(struct cma *cma)
 {
-	cma->reserve_pages_on_error = true;
+	set_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags);
 }
 
 static int __init cma_new_area(const char *name, phys_addr_t size,
diff --git a/mm/cma.h b/mm/cma.h
index ff79dba5508c..bddc84b3cd96 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -49,11 +49,17 @@ struct cma {
 	/* kobject requires dynamic object */
 	struct cma_kobject *cma_kobj;
 #endif
-	bool reserve_pages_on_error;
+	unsigned long flags;
 	/* NUMA node (NUMA_NO_NODE if unspecified) */
 	int nid;
 };
 
+enum cma_flags {
+	CMA_RESERVE_PAGES_ON_ERROR,
+	CMA_ZONES_VALID,
+	CMA_ZONES_INVALID,
+};
+
 extern struct cma cma_areas[MAX_CMA_AREAS];
 extern unsigned int cma_area_count;
 
-- 
2.48.1.502.g6dc24dfdaf-goog

