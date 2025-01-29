Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712941E3DFD
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190560; cv=none; b=YVvAm3wpyOoLQz+1J5JWja/t6L6nqoe7aMT4jYhDMu8HFmTkh+lqQkTm8b3E4N3RVcauPC3mMPHFQC/2gg4vN2aE+yyMvkAIIA+lbfaQA2L7zIsLCIwtfkEHNT2jRLWv5GznDdHVmLodWkVUJeJBB4s3yxHKWomnooaIzg1WVgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190560; c=relaxed/simple;
	bh=F1U1d0suBs4upbIvyU8zs6jNKjEaoO4dYrbC2u9MVqE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nkCT4SVdbT1KYLmr8ze8qZu46UMkFFRpEdzOSLJ44xTTqsuVFh8n5ZcifzTg8vSazMht4tgCI72qtpF+bVL77Scd2rzSrEs777c7d0TMIbylDdAUZMMakB/llA3PKLviAQ6dv2DPVJpPpwxb/TP1WQ9yiR/yYZ3ZYAgzdBZ6lQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B0dnyZ8a; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B0dnyZ8a"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21655569152so3146515ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190557; x=1738795357; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLt9HBc0qt/kG8opRR3xwjjIGa13UKxYV2/Ut2PpccA=;
        b=B0dnyZ8aheOvKe+LMtQwocv/BC9+bVQA3MO0KjQECzAvpm3qTCCmOnttn5TufMh6aD
         MBMzCvDYZfH/Dp4wSuGJL7xIfasZZZdaIMBXepHdIj080fkWWFKT4uJg0C0/QMZ9gVad
         yl+GcfyKSr7n3LFJKTaOah6UkroNG1sgvrDpDOq6aPCheGVS4j9dYb2pUixmWdplylAv
         PXQCyKYl/nisE9wt5jmaJXIclN8tRkjwYOolPLsDp98JwfETV+YkRLmQDHVWba5LHJUo
         ipK6DlAMC0SGqp6OEjdgrzcY1DBBsFRlLdT1Z3EUafYZg3R9sIygYz+BOP5kyWoF0+CH
         vkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190557; x=1738795357;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLt9HBc0qt/kG8opRR3xwjjIGa13UKxYV2/Ut2PpccA=;
        b=lVBuyBmwlltu3VOZpVbQhiKRLigxdeFtHnvG8MgV6l5BxULeTj9/HAwpr8nA7hE1ip
         CF1hPqyF5i/Zy9kQY3ChQ9lsKSIPBV3xuvtEoZPnUwOyFbOBUSTvITWddXMU5tcGaFtG
         FOMmOUTlVIpuNLtCGVSyB8WDl9h+7wxGGkF6yeKfkCjvCzlpVIfqW6c71U4KVgparn1l
         Ubw3Vnx7CwPJ+WAxClUiB+4hD/K8jpXjcPndsRk8jy0AtH/+4c0xIHFJe56GiCu4KLP7
         wE1xujpSGHdSkOMQmwFifbBqAnXoaBKReiRH4VvkU1UL/7Wc3uTpyWXRSZKrMYhEJ8zb
         n5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXzognYu6sEs1OJ3e/dn8hl+5uEXWKaKUuM8WFYdk3IIZgZbTeMEijiLM0q8dTj6puSSgeE7OTNPT9UADQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YygcK7w9Wgl0RUF4OvMa3B0xjdPlApKtZU3J+juGexzYJHQ1iYc
	WN5SFtqm5uc7W7k3oyZN2JjViAYcVdLuFvG5nIdLznOpDUn2QVG7jcwRSrY4xt9qnpJ6Ig==
X-Google-Smtp-Source: AGHT+IG77o+oLUYvd4dsteZDfBQBaEerJ11jO3U7DjFTw9ASxdHAtRSoV+qn91gtydr1b6v63zVD5abu
X-Received: from plbmf13.prod.google.com ([2002:a17:902:fc8d:b0:215:5a53:ee06])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d551:b0:216:5556:8b46
 with SMTP id d9443c01a7336-21dd7e0728fmr78854645ad.49.1738190557688; Wed, 29
 Jan 2025 14:42:37 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:42 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-14-fvdl@google.com>
Subject: [PATCH v2 13/28] mm: define __init_reserved_page_zone function
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
2.48.1.262.g85cc9f2d1e-goog

