Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0977B201031
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257470; cv=none; b=o4bmO8LGFX15Wc9OLZLMnndCvYxN/S9lmTYFMtSXHgM7LGqcIGmMM1tOUD0dvbfohYSTVf9dOY5N0Ogj7F/RiaInwSuHQMHEEz01WRtT0bxca9rehlPvsa/UIaBPvfjhsYNPWKW9FFwJskP9HgM8VgDOiT+RgOCbcxDDz/Vi5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257470; c=relaxed/simple;
	bh=XbLhsbjg1pnvXCfaaBa7PJtCuV1G98Gervk3p8w/teg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=LNg9BH40ulBrnxh8iVEvqCcMv8aLDSQQ0gGrBZ5aqytmdM+Igp1TKe1WPNC8mhJed5FVRRbLPxJLKoUB09AxzQBbVWBkbnDFDJQaXKXpBLruNDmBoei9DcLxgIOA2cP7XZ+F6yAMy8t5KVu0eVzGvvQn7U95Xc/9O9b7TL4JpUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cipe7Qtl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cipe7Qtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744257465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f1N+YcIuKzs7QdLEHyEwZZ+GVIPuduBxUV08naMugGA=;
	b=Cipe7QtllYSJ2oHJFP6dX84AW1RpJ3q6/QxMo68ddXzh1ottmeDLOZm7fYQhuW8A9csr1G
	YFmoEV/4OWb08uza/EBrOxex1pVyxpSPiexcntBihx4gMk3KGSUIJHZhM4DVGmop8FykMQ
	V+QoBp/tOhIqEwxQ3GFcUvqWZcq1RgQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-122-lqz1GyQENkqkExtdQptSDQ-1; Wed,
 09 Apr 2025 23:57:41 -0400
X-MC-Unique: lqz1GyQENkqkExtdQptSDQ-1
X-Mimecast-MFC-AGG-ID: lqz1GyQENkqkExtdQptSDQ_1744257460
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5455218004A9;
	Thu, 10 Apr 2025 03:57:40 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7808219560AD;
	Thu, 10 Apr 2025 03:57:35 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	osalvador@suse.de,
	yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v4 3/4] mm/gup: remove gup_fast_pgd_leaf() and clean up the relevant codes
Date: Thu, 10 Apr 2025 11:57:16 +0800
Message-ID: <20250410035717.473207-4-bhe@redhat.com>
In-Reply-To: <20250410035717.473207-1-bhe@redhat.com>
References: <20250410035717.473207-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

In the current kernel, only pud huge page is supported in some
architectures. P4d and pgd huge pages haven't been supported yet.
And in mm/gup.c, there's no pgd huge page handling in the
follow_page_mask() code path. Hence it doesn't make sense to only
have gup_fast_pgd_leaf() in gup_fast code path.

Here remove gup_fast_pgd_leaf() and clean up the relevant codes.

Signed-off-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 49 +++----------------------------------------------
 1 file changed, 3 insertions(+), 46 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index eb668da933e1..77a5bc622567 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3172,46 +3172,6 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
 	return 1;
 }
 
-static int gup_fast_pgd_leaf(pgd_t orig, pgd_t *pgdp, unsigned long addr,
-		unsigned long end, unsigned int flags, struct page **pages,
-		int *nr)
-{
-	int refs;
-	struct page *page;
-	struct folio *folio;
-
-	if (!pgd_access_permitted(orig, flags & FOLL_WRITE))
-		return 0;
-
-	BUILD_BUG_ON(pgd_devmap(orig));
-
-	page = pgd_page(orig);
-	refs = record_subpages(page, PGDIR_SIZE, addr, end, pages + *nr);
-
-	folio = try_grab_folio_fast(page, refs, flags);
-	if (!folio)
-		return 0;
-
-	if (unlikely(pgd_val(orig) != pgd_val(*pgdp))) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	if (!pgd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	if (!gup_fast_folio_allowed(folio, flags)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	*nr += refs;
-	folio_set_referenced(folio);
-	return 1;
-}
-
 static int gup_fast_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr,
 		unsigned long end, unsigned int flags, struct page **pages,
 		int *nr)
@@ -3306,12 +3266,9 @@ static void gup_fast_pgd_range(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_none(pgd))
 			return;
-		if (unlikely(pgd_leaf(pgd))) {
-			if (!gup_fast_pgd_leaf(pgd, pgdp, addr, next, flags,
-					       pages, nr))
-				return;
-		} else if (!gup_fast_p4d_range(pgdp, pgd, addr, next, flags,
-					       pages, nr))
+		BUILD_BUG_ON(pgd_leaf(pgd));
+		if (!gup_fast_p4d_range(pgdp, pgd, addr, next, flags,
+					pages, nr))
 			return;
 	} while (pgdp++, addr = next, addr != end);
 }
-- 
2.41.0

