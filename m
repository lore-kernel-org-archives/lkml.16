Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA181F63CF
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190576; cv=none; b=Kzq3dGk0UdtdJzq3f/btesOYjk+3p3PrNnnQ8lQdPPqhPGaKthnOPVnh1Ld0toMyVdVtdj9O0Q1zQkcwnDDRpvoN8j7Na7TkGWy52ZFrW9tZLOKpIXup0T+IpNnUSF72fbli1Sp4oU2kP8b+1u5rNUp7Z2dcEThDuJzswn9hXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190576; c=relaxed/simple;
	bh=2sbmT7XtFZlzqPrXcTHMyauFid3nwdk6aZCeOqsQMuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RvrxAz9X5G6/tb2PipBd6jx/TQYpDQnxe7YpvNCHt5+qCpp92qOryVmbUqyN9TaDtLS8K2jspk1Gq8MT/pzW0pE+rYi2lJpT6AsSXiK6r2ddPwE2hE5G7sAQ8Xnc90jEtWoF3N6yhEBe2/BGcCL8cKPgfxq2rh8njpB4h4p5Xx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=et8bWR9F; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="et8bWR9F"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21632eacb31so2133525ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190574; x=1738795374; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1345eHEo/n5m5FCY0Prqgv+HivXDQh8NAfYom1ZqdDA=;
        b=et8bWR9F0VU6SIHetciEk6GwTVUPRocFaJVBb07VTZdjHeRT/8lIC1JD+Twz7BNX43
         jL2flpwJWcfOM3BpVxcsCpFYxdmLBgafXodjYd6xtZGgA4U9qPL8/Lfeu30HTZGduAng
         0OzakKhMPDy1Ukon5lNJiltOwYselS6W4MhApk14OaAijV9Rr3f7yXUWaKNqE6yV+J1l
         9xmqv/W4oZQY/yrbcHGc8/A0LFsEbKTE4dfWOmbYSE2c59P19omoKciQ1JH948XHh8Sx
         TNCiQkgH6ejDba/hhA4uGVGZmURFgaKIo3qDQYGrPxlxXSk3fbIFFLHbJeDwfsxNI3+g
         uCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190574; x=1738795374;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1345eHEo/n5m5FCY0Prqgv+HivXDQh8NAfYom1ZqdDA=;
        b=a6+02dgI5cQNdmCMENsKZQRj/AP2Jfrx6lLRkSGtiz//SQl23jAwl+v2a210zZlrZy
         sW30LWVIg3EaLqoWkUeNtIMZHom4ZcJGZVrGuNX+rbp2/TC4YMWuxD+u+jq1tNvf0d6A
         bY1QJPpD/a3OlRd7+UJd/OJ/Fuy5krc0bGJ0a/5C7izXw68bnhU0mRqlv7QXazAm+nIu
         zWW+nPdNrUFgOZwyvgp+AmpfyxFzJxhPdtyx+04XOiDUOCl1Hlv9E1IyMesboHMXco7I
         aCAIYkeXd1Pb79i8UhzcaONwHrBlgyqMOIzxBmoIsrl22VFg2SFzbGZauUQcKRTLkR+n
         pYaw==
X-Forwarded-Encrypted: i=1; AJvYcCUt6Am5WuA5sQBVjbSL2J+fV5swmXONkNWmgaEvEPr+DZ/vTefQHB2+8BPfx3sttoDc7HpmRA4eIvM7a48=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGrg1oGrnp6e0Jv00qzjwJ0u2shk/68CdAIb/Z3TPl9pBn+P1x
	XMbiBE9JCwBdifZ069zJCAG3hvGZeoOkK4FMiM5sPjFHnjkrZvhRHwOFZ4sO2qFGntGtEA==
X-Google-Smtp-Source: AGHT+IFgKpf48L7TtwmSEw8t26tIVwiTmSEC5MTe4TDZk31dErMHXlLcuwwt7qrIclDuDAgLXqefYm/Q
X-Received: from pfu1.prod.google.com ([2002:a05:6a00:a381:b0:725:f324:ad1c])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1508:b0:1e0:dc7b:4ee9
 with SMTP id adf61e73a8af0-1ed7a5b66c4mr8200655637.8.1738190574200; Wed, 29
 Jan 2025 14:42:54 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:53 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-25-fvdl@google.com>
Subject: [PATCH v2 24/28] mm/cma: introduce a cma validate function
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
index 6ad631c9fdca..41248dee7197 100644
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
2.48.1.262.g85cc9f2d1e-goog

