Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B851F55FD
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190574; cv=none; b=eXbcF6mRR7Ij+FkRx9+JuFFzXtYqdjY/40UnluM3MoTuVNcSi3RTB1zNWun2dzKSgeqUXjwSQqC22MdU4xFeaRtKXq/8TlCrOrKJVgThWBqNSvMUr1ZibhfzgzI5LhdyYoczto8dD1w98vYnHm8RWbsiOob+dT6K44cpGbYDJYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190574; c=relaxed/simple;
	bh=Vt7ujdZKCvDORcNh9GG00ZkzbBiErZxGi6KwynczEcs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qt29eCuAa/qxM4VFDPHIM8BNou/ODomdOTWuIgAK/zt+j/6JV93rtYtsTHznuK4fqbd8tFM+GzxbV+o5YZkaI442H+X+LaKPbJi6x+vGvCVxUafIuFbjYIVEoW3pgRhAQS6IaQdnDAuYE1P+QZ8XJcMBqtAanzoc26/SUOXkl5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1mYm0wXV; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1mYm0wXV"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21640607349so3649575ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190572; x=1738795372; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9+SFAfifGO+4WMyk38z+oj+T8+477UR0bm18OCN8QQ=;
        b=1mYm0wXV7aVohm8PlxtXjkoE/c3p/N6h34k8TPyLitrMQaasD/pG+mAj4klC8Y2Ifq
         7becEPDMnL0w5uIsizLoVIX24gsL6SlwPh7D9Ywyyr0q0SYWJ9sWF5dCdyTA8YMjpt6Q
         nNNsIvUARcT6JVBq+YrmpGx+m2uj4tLP0HNy5GTt/D5KJn9NNU++t0VpI4Wy6os2g/LE
         uLK5E9ahJK5V2O6ME+6En2t/0qGUn2BfxEsnU+308o4QjudwFssilMV7FDWWKtH5saAF
         8oxNkMEgVdfDgSfpDB0OAWnTodQ0D6FTel0GLpmCD5CIX2xwrIjcFN7BgJk8l4iV6Bw4
         YYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190572; x=1738795372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B9+SFAfifGO+4WMyk38z+oj+T8+477UR0bm18OCN8QQ=;
        b=OmyUs0BnyvOF/6P9QRJVXk98OA3WSSDiUMbv0Q5E9uWvfOIC2JSh5ENCuptp/WvP5F
         zQkgc9m+dhaiRWiu6CaOzYX5ekKVya1nIQT/CPhFHgpmb5kYDSsDoBq/mN2zOnuw2WO6
         x+JIAO//zdG2SRG5f/cufOAI8VLG0XI2Y5b6PqD4v6HVniYXASqQaPfxZNWYGBWzqy+l
         Gg2ik2ElubSI7pZ3nRU82tx3E3pKZkweJMWpc03qG/2tHGlkFyz0vL9u96TRfmZzT7Az
         rPIG6TkBg0r1JnEVA0Blzq+/s1i1hKyTZ/f2TZnwlgQ3zHVlLVSI3NQ36n1G/CelSKmk
         aF8A==
X-Forwarded-Encrypted: i=1; AJvYcCXzmojStZ51Unstc4nFosc7BPMcLUybk012KjXS/OV7j/XXbqNG4TzlWjvkDlYzMC38uWXFRzOW3AzjhrM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjsm/e8pFaN0Rjd7lNGWRW0AADoiS8WtJlNrPJKb7YngDtO7Gp
	8lklc0As338ptl/K8D5Re2dUorR9nJQ7RIx9bp1kNBRXN23NTBZ9isURId2kNzWA5pa72w==
X-Google-Smtp-Source: AGHT+IEfESeGYmpm9QvSf55e7+bojIZbnayRY5HSnlK9/hO+fi+i5SAew2Blg7kqEkcf7da+HHBE7s7h
X-Received: from pgbca33.prod.google.com ([2002:a05:6a02:6a1:b0:801:9268:c344])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3387:b0:1e0:c9a9:a950
 with SMTP id adf61e73a8af0-1ed7a61d4admr7290847637.39.1738190572647; Wed, 29
 Jan 2025 14:42:52 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:52 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-24-fvdl@google.com>
Subject: [PATCH v2 23/28] mm/cma: simplify zone intersection check
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

cma_activate_area walks all pages in the area, checking
their zone individually to see if the area resides in
more than one zone.

Make this a little more efficient by using the recently
introduced pfn_range_intersects_zones() function. Store
the NUMA node id (if any) in the cma structure to facilitate
this.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/cma.c | 13 ++++++-------
 mm/cma.h |  2 ++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 1704d5be6a07..6ad631c9fdca 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -103,7 +103,6 @@ static void __init cma_activate_area(struct cma *cma)
 {
 	unsigned long pfn, base_pfn;
 	int allocrange, r;
-	struct zone *zone;
 	struct cma_memrange *cmr;
 
 	for (allocrange = 0; allocrange < cma->nranges; allocrange++) {
@@ -124,12 +123,8 @@ static void __init cma_activate_area(struct cma *cma)
 		 * CMA resv range to be in the same zone.
 		 */
 		WARN_ON_ONCE(!pfn_valid(base_pfn));
-		zone = page_zone(pfn_to_page(base_pfn));
-		for (pfn = base_pfn + 1; pfn < base_pfn + cmr->count; pfn++) {
-			WARN_ON_ONCE(!pfn_valid(pfn));
-			if (page_zone(pfn_to_page(pfn)) != zone)
-				goto cleanup;
-		}
+		if (pfn_range_intersects_zones(cma->nid, base_pfn, cmr->count))
+			goto cleanup;
 
 		for (pfn = base_pfn; pfn < base_pfn + cmr->count;
 		     pfn += pageblock_nr_pages)
@@ -261,6 +256,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	cma->ranges[0].base_pfn = PFN_DOWN(base);
 	cma->ranges[0].count = cma->count;
 	cma->nranges = 1;
+	cma->nid = NUMA_NO_NODE;
 
 	*res_cma = cma;
 
@@ -497,6 +493,7 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
 	}
 
 	cma->nranges = nr;
+	cma->nid = nid;
 	*res_cma = cma;
 
 out:
@@ -684,6 +681,8 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t base,
 	if (ret)
 		memblock_phys_free(base, size);
 
+	(*res_cma)->nid = nid;
+
 	return ret;
 }
 
diff --git a/mm/cma.h b/mm/cma.h
index 5f39dd1aac91..ff79dba5508c 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -50,6 +50,8 @@ struct cma {
 	struct cma_kobject *cma_kobj;
 #endif
 	bool reserve_pages_on_error;
+	/* NUMA node (NUMA_NO_NODE if unspecified) */
+	int nid;
 };
 
 extern struct cma cma_areas[MAX_CMA_AREAS];
-- 
2.48.1.262.g85cc9f2d1e-goog

