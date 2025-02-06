Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02AE1DE3BD
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867916; cv=none; b=rKvY45twInLJ/Vr6MNm0XomwGNWaa/ewLlRDT50wyJJgNoW7swE5nIJMPrecjhSvbtXBKaPa5PKTaIXAWGC44cMs3Z4b92iAEpbkWnukn0lvz3ZaAw+PCGCxq17j6Yv98OX0qTmAdF07PMZbHa1u7r+KApzZYr3EwluAfm4zRFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867916; c=relaxed/simple;
	bh=/gVxm+CO3j4k2UrkTYq4821BXZp+btUj4aX7Ztv8FA4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eyuuzkpfu6tnS6QNColswu4oDKloeUmauY1JBjxAs573vz9Sih0mlXPwLNk7FRAgKh+7yISTO+2/mjDhXwKJ03QEEu2xvmy+aifRjvW44Dq41nJrWi1RuM7AAV4JnoRFerYvy7Sjo0bP3pIQrsJ1RJPIvePWWqAwAAgZBgEo0HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QS4b/0r2; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QS4b/0r2"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f9d1ca50c9so3896771a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867914; x=1739472714; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LNVYMIarRsr0t8rcUQ946hUXqx5cMeLkMOmL07Z29aU=;
        b=QS4b/0r2A7wyd9WVSZ3ngjv0jYZUhbgBCm5QTJibvmhgQUmmh3qhfYPrek9kVRlM0Z
         CiPVqZapVzFlvpnOjGWqjvwWnuJTcWT/mDJRMYkrKmKhiWiKzKUtYMdIzvjKMKazGtur
         0OY4HtrKvNllCZKziNDjk5VqnxvedEtmgvzvGWrCfDv/biXcK6pDQDRkjdgUm62DxrfP
         Sega3krKLjjhdqSG2sDTu9c32Vo2CvNQhfR8AHl4Srzx5855l0cdoWaHCoWeD7l8FYch
         S/BntJIX/q6AP30SjPXMtUQpZSaRulFk0DrYUb1ZpzXPF8HvrPcwX2kh6Vn3FVARo4kt
         9u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867914; x=1739472714;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LNVYMIarRsr0t8rcUQ946hUXqx5cMeLkMOmL07Z29aU=;
        b=CdqejdpKgMHuVNVJdVQ20OCoenmm/r0ZUBiDAH/7J8qDpKicGH1RUeqrTXiNNl5Jmw
         NZ65eAEBi0cM2XbS31hsrw9EMKu+U4Se1yBNJscS0jsPxUZp3Wevg3QeDi1jwLXFvqJ+
         +AoApvs9h0iRrRwmfSMcefZ8+lQEiwMj8MMizi0KI2umqcm8GiUg9Zow5NCVOK+W2iXq
         Qyij7ujoa+XMGC6BIa7DqRBmAoHB5uG30/r7ErbbQFOqMld14FNTz5CwGeGUojCQ5nIk
         OFU8i/qzos4pOL4R2nTtmNpLuh26AFBAYV9P3cdcd16Ddo8J1W/7GMk7mWOVt6A8/g7L
         cttQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL7lDs0wC4B/m09CPuda3yx9kBPy4LKMWTFFHrHzDpOvK+xgo3SKOoOw2CJQNNcrvssF97jo71Ho5HLbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJCdjtzXZI+dCiRw+A35sBIdVItmGoWNrsneOywXJlaHI0Zaqj
	An27t3J4R240IucX/B0YJrqVqkWdct/xwP3luIlMgA/26ZE+R6TkiTTp3qCnUs2xvwLiNw==
X-Google-Smtp-Source: AGHT+IFAHneXOb/4XfmdG9sW63Is4KRKWVRpRsXVSKXLK7gMZJrhr70i+wLMYHxanmPA9luzKj98Soc+
X-Received: from pfbko5.prod.google.com ([2002:a05:6a00:4605:b0:730:5607:bee4])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:139c:b0:72a:a7a4:b4cd
 with SMTP id d2e1a72fcca58-7305d54712emr393600b3a.21.1738867913918; Thu, 06
 Feb 2025 10:51:53 -0800 (PST)
Date: Thu,  6 Feb 2025 18:51:03 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-24-fvdl@google.com>
Subject: [PATCH v3 23/28] mm/cma: simplify zone intersection check
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
index c7116a5819c5..d0227af4bb71 100644
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
2.48.1.502.g6dc24dfdaf-goog

