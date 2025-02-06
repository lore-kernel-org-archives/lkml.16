Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DCC1A08BC
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867900; cv=none; b=MbUUL0FL+fNnW5iOWa0ptpMvHQ3pEHgEeIBKR+l5BXigN/BCOTi0/7ksbZYzQdKSysu35LbfAFUUF3JUptsRSzz1FM8QmzYsmurJC8oWh8wuHaZO1CwAJAWX6MUIpw5PxlHfMUWsVkjdSWufNIg7iJYijSuyR9R54niaYJ2vQps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867900; c=relaxed/simple;
	bh=pwg6S22sqSel5O2JxWwl4u1ekaJhDyAQhSEgfU5URb8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=unMQYlmWRL+FYVI9PDOOVEpZvnQQ/z50aHZBnJM3E2kPcIdjIRWRsWrO6E+oe1JSxfOTV6nCgVI9J10PQygd+OVs7ZhM7jRE65Pn8V1oN/3wghgMNNqsONhfMwJ7x61P9DimxKXYz5R7VNewLKtEYQT56SYk+tDnl81G808/62I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wt6pZVVD; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wt6pZVVD"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fa11d8e448so2482729a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867898; x=1739472698; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N1nizw8LTgFJ6Hunu1baoXowLm72wInJnvRTI+vB3dI=;
        b=wt6pZVVD6ZWinfdoGf83MGFXO1KN2OGkFMUevNxVUsPfOVy9uPUYq083I5oMzLczRa
         0V0uEZYXiPLKriEPSuOfD8z9bOh/1VTB+uycVVBzvqJV7fVXHSGKCnnV1GX18GiyjVV/
         CYwGqRkujBcZsJAHjD+qjMSntzyC13u7PDTSSFM1aB8GGbXbmRdci1x+C/pY8j2N4Y9S
         RkolKd9FNU0AqUt8aY8XjHCbyX5Z3q+hiMXe1dA15R13zwM4UEQhUCP5qooM/0xLXbL8
         xf5/Y79qg8sgUEJg5ypeYOBI/Ypx9s6hAjLQ7Dv7HJ3JxaVOrKxVtpuiiGccsiM234+1
         F6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867898; x=1739472698;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N1nizw8LTgFJ6Hunu1baoXowLm72wInJnvRTI+vB3dI=;
        b=B6ljYS0I7xa35tjLHgR2iY/XJDkXuoGXQuvkzCw1K+pEjNGzQNli3WDvv1yDReqAOF
         pag0Sit5CTqotyFL4eM0KzIpFXNUpxOM7coGdBgRYlzKahqytBBIiAQe+NWXZAVoOsHp
         f4T6c3eUQby+A5RSQ6jxN6emhdJ/JQmddGdS0MhKdQGzJaH23s3783368W1n0mpp2Cs1
         dt9BaTQuJzj9QeQExo2zJl3w6mRAhdER6FtN8u4Hm2E+nsjSlhkQEbEVv5fJU/j/IuYD
         xopT4ZJ+D61yiZ6cMrzi0R52ZDxyUlM3Ur+1DccWXVvzsA57r1EKLxF7FXhvQB5qMFGn
         Y95A==
X-Forwarded-Encrypted: i=1; AJvYcCVyCzMyjhi//Sqx/djhzM9vzAUYjGyzgGFDUKNzlilmzKdIQMY6fhF3kxM6aOywCLKBpwrR6YkUYXKrb5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg41hHdh61xl1YQGg41zrmnZdCfkUlXDU4CX5M1rSVpz7Z4Qqc
	9vtyo0Rdkk73ilzr0BqKMAvsJE3Musk56hjXGFigeYuJ7lEji9IJWJUIa5ZaXLIWvz6qaA==
X-Google-Smtp-Source: AGHT+IHCvMErKFRJySbjcM7qJ570UaYkF9tu8lbCYFmm8LplntCVFlwxB6ni+y+lUDS7htgcQtwDW2+L
X-Received: from pfwy2.prod.google.com ([2002:a05:6a00:1c82:b0:72f:f548:3e09])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d27:b0:1e1:b105:87b
 with SMTP id adf61e73a8af0-1ee03a8f413mr928165637.23.1738867897906; Thu, 06
 Feb 2025 10:51:37 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:53 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-14-fvdl@google.com>
Subject: [PATCH v3 13/28] mm: define __init_reserved_page_zone function
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Sometimes page structs must be unconditionally initialized
as reserved, regardless of DEFERRED_STRUCT_PAGE_INIT.

Define a function, __init_reserved_page_zone, containing
code that already did all of the work in init_reserved_page,
and make it available for use.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/internal.h |  1 +
 mm/mm_init.c  | 38 +++++++++++++++++++++++---------------
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 109ef30fee11..57662141930e 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1448,6 +1448,7 @@ static inline bool pte_needs_soft_dirty_wp(struct vm_area_struct *vma, pte_t pte
 
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid);
+void __meminit __init_reserved_page_zone(unsigned long pfn, int nid);
 
 /* shrinker related functions */
 unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 9f1e41c3dde6..925ed6564572 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -650,6 +650,28 @@ static inline void fixup_hashdist(void)
 static inline void fixup_hashdist(void) {}
 #endif /* CONFIG_NUMA */
 
+/*
+ * Initialize a reserved page unconditionally, finding its zone first.
+ */
+void __meminit __init_reserved_page_zone(unsigned long pfn, int nid)
+{
+	pg_data_t *pgdat;
+	int zid;
+
+	pgdat = NODE_DATA(nid);
+
+	for (zid = 0; zid < MAX_NR_ZONES; zid++) {
+		struct zone *zone = &pgdat->node_zones[zid];
+
+		if (zone_spans_pfn(zone, pfn))
+			break;
+	}
+	__init_single_page(pfn_to_page(pfn), pfn, zid, nid);
+
+	if (pageblock_aligned(pfn))
+		set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE);
+}
+
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
 static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
 {
@@ -708,24 +730,10 @@ defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
 
 static void __meminit init_reserved_page(unsigned long pfn, int nid)
 {
-	pg_data_t *pgdat;
-	int zid;
-
 	if (early_page_initialised(pfn, nid))
 		return;
 
-	pgdat = NODE_DATA(nid);
-
-	for (zid = 0; zid < MAX_NR_ZONES; zid++) {
-		struct zone *zone = &pgdat->node_zones[zid];
-
-		if (zone_spans_pfn(zone, pfn))
-			break;
-	}
-	__init_single_page(pfn_to_page(pfn), pfn, zid, nid);
-
-	if (pageblock_aligned(pfn))
-		set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE);
+	__init_reserved_page_zone(pfn, nid);
 }
 #else
 static inline void pgdat_set_deferred_range(pg_data_t *pgdat) {}
-- 
2.48.1.502.g6dc24dfdaf-goog

