Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AC52989B4
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253990; cv=none; b=cto2nYcJbPap/ndhtNs6K/6J4DEpDmDjP2uXuisabAZZ5HDbEgx8IQB16G94dn9it3tEUEUKSpGvZlaCedRDShEJbNEb6zRzVtTfwtZucbagu3dIYlQK7UbzuGLKfNR8FLU1S9Y+csJ4vKnS44y1uZwFvKJTCjsx4VB39Xf8jDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253990; c=relaxed/simple;
	bh=OPT0y+WRZjCsDogNhl8lTzBq71NZbHgq+ogF/DweRgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGKCh8Ajhe7Te7F0CPeWN8pZdWvP8YiLhDq8yCtslqbWXyv0e/gNDFcybnyGvmRdr+PuSqj1A1aO6siHVOkmwmWjgWMx+qD279StbGB4Phi+wOVisijeQ8baU2kb5HVeCLgZhHbY1n/oQn5pVsFEzgYmgNlzv7icSgw5p2UBBmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVO8ZUXU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVO8ZUXU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e45088d6eso2842175ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253988; x=1747858788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0MUnnnVN3b+cBPjyOT3GG4FgLxBLXNmZ4SICIB9ihgo=;
        b=hVO8ZUXUodiiWdoUGQhEV9z/YE3qlP3j94XgRlsHzH3U9NwPsgw2P5BKO9sZREyu4S
         dYNc3oGEAJVH8KgqB9fX9vYe7l8c9G3XWxXBPAprE82TFg4XzApUHjrKE8q/c0GxOjTR
         0WNVq+qYgPJS9+4fWyc57S+K/XWjYDlxZqxpW7gCfx5yCtMj7g2zVrGle65l+yCC034b
         C5YtnS8PEyBA69S2vi/ZGN2N3bbAbmUWxqJn36r0mqhcm09aNtOswau5WKdyyI3CpldL
         wCu8po9f10E2Wbei5gFkgzCleinys4KuMYyRCErtCK4cF5SsRS6KGT7kP+pO9T0AMvuu
         sLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253988; x=1747858788;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MUnnnVN3b+cBPjyOT3GG4FgLxBLXNmZ4SICIB9ihgo=;
        b=QKcFTrPG8rXBBuBTPPRl9q1360EvtJ1MwwRJKGhLWxQrgPP0coegm1X8p8MR2JPiUq
         Rbq7Xnz7OJFio2cjLdHN3dP+Yx356HP9SqY96rPTghdDbnfWS5HMmY+dz//pRaddd3jY
         eQHW0k4UPEZqqXr5hDhhAyM5u7ygUCkFmRWBqSncQWWqdQtx17qxabH2CiEYbv3wiS9+
         BAqnnel4hEd+iYzE7tiwYjfFls4cvegO6mrRU8GFEFf7Gc1r6o1v866P9vP/5AzG4moJ
         4KFQwzfE9lpZuIN90nT/H29ebFcckykeUBkvmqBFrsflDP0GWRHKGsIszXtKF4sMzJF1
         mrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV36oKvd/57CEXFZ0y6ORQhTnYUjvCr9lb3EM+y6+lAv6sbdV0jile3rNW4BzHYk7O8zMPMJR6mdkcES6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/NsEwD5AIjfdBpGMw4g/GSXKKSwlCCJIig4GjRp7cQwtW2PTN
	e2/Qb1q8ZT/UPS43fE/8u9Asb4BKyTHp81qoU2nbB/6CZ1lXH4QU
X-Gm-Gg: ASbGncsUABi+NtZ9JTecYTgeq3LKllETTwZqlBUhppInokHaGpIFVxHgq91GG5EeQeF
	e2feWMGqyftovAnVYNFAHeqPYr++9P5mWqMSjAAJEP1oA4lro6rbF4goKeub+TIu7cwEMvvziwH
	zxaf156hxyeru5mqYIIfgeuCSPo5vEe7VKgS7MYhchJJFjepHaMlAm3thDnAUlw6WA+TIKNzIzz
	uB8rkHggBhMM867CHL5BFyWX5TnGZQI8OK4EIgXyJqdLmxQipw17oRthwXACXxEG1mK4+tgAXGf
	LqUnNrmwOkwyUk5SiSLLuLrjHU9OL/3gkHwtcF/pFPDL2nInToi/uD64xnEoVTK9JDUqKFKhJkW
	alt1AHv0=
X-Google-Smtp-Source: AGHT+IEwvmfAco98nGh9c9I804LgK/NI5B5gMjpE0yaCnjlhpRcIVXov0YtvuVPKefXIAwHAA8PGVQ==
X-Received: by 2002:a17:902:dad2:b0:22e:5e70:b2d3 with SMTP id d9443c01a7336-231980bbe7cmr66312145ad.1.1747253988233;
        Wed, 14 May 2025 13:19:48 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:47 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 25/28] mm/workingset: leave highest 8 bits empty for anon shadow
Date: Thu, 15 May 2025 04:17:25 +0800
Message-ID: <20250514201729.48420-26-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514201729.48420-1-ryncsn@gmail.com>
References: <20250514201729.48420-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Swap table entry will need 8 bits reserved for swap count, so anon
shadow should have 8 bits remain 0.

This should be OK for foreseeable future, take 52 bits physical address
space as example: for 4K pages, there would be at most 40 bits for
addressable pages. Currently we have 36 bits available (with NODES_SHIFT
set to 10, this can be decreased for more bits), so in worst case
refault distance compare will be done for every 64K sized bucket.

This commit may increases the bucket size to 16M, which should be fine
as the workingset size will be way larger than the bucket size for such
large machines.

For MGLRU 28 bits can track a huge amount of gens already, there should
be no problem either.

And the 8 bits can be changed to 6 or even fewer bits later.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swap_table.h |  1 +
 mm/workingset.c | 39 ++++++++++++++++++++++++++-------------
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/mm/swap_table.h b/mm/swap_table.h
index 9356004d211a..afb2953d408a 100644
--- a/mm/swap_table.h
+++ b/mm/swap_table.h
@@ -65,6 +65,7 @@ static inline swp_te_t shadow_swp_te(void *shadow)
 	BUILD_BUG_ON((BITS_PER_XA_VALUE + 1) != BITS_PER_BYTE * sizeof(swp_te_t));
 	BUILD_BUG_ON((unsigned long)xa_mk_value(0) != ENTRY_SHADOW_MARK);
 	VM_WARN_ON_ONCE(shadow && !xa_is_value(shadow));
+	VM_WARN_ON((unsigned long)shadow & ENTRY_COUNT_MASK);
 	swp_te.counter |= ENTRY_SHADOW_MARK;
 	return swp_te;
 }
diff --git a/mm/workingset.c b/mm/workingset.c
index 6e7f4cb1b9a7..86a549a17ae1 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -16,6 +16,7 @@
 #include <linux/dax.h>
 #include <linux/fs.h>
 #include <linux/mm.h>
+#include "swap_table.h"
 #include "internal.h"
 
 /*
@@ -184,7 +185,9 @@
 #define EVICTION_SHIFT	((BITS_PER_LONG - BITS_PER_XA_VALUE) +	\
 			 WORKINGSET_SHIFT + NODES_SHIFT + \
 			 MEM_CGROUP_ID_SHIFT)
+#define EVICTION_SHIFT_ANON	(EVICTION_SHIFT + SWAP_COUNT_SHIFT)
 #define EVICTION_MASK	(~0UL >> EVICTION_SHIFT)
+#define EVICTION_MASK_ANON	(~0UL >> EVICTION_SHIFT_ANON)
 
 /*
  * Eviction timestamps need to be able to cover the full range of
@@ -194,12 +197,16 @@
  * that case, we have to sacrifice granularity for distance, and group
  * evictions into coarser buckets by shaving off lower timestamp bits.
  */
-static unsigned int bucket_order __read_mostly;
+static unsigned int bucket_order[ANON_AND_FILE] __read_mostly;
 
 static void *pack_shadow(int memcgid, pg_data_t *pgdat, unsigned long eviction,
-			 bool workingset)
+			 bool workingset, bool file)
 {
-	eviction &= EVICTION_MASK;
+	if (file)
+		eviction &= EVICTION_MASK;
+	else
+		eviction &= EVICTION_MASK_ANON;
+
 	eviction = (eviction << MEM_CGROUP_ID_SHIFT) | memcgid;
 	eviction = (eviction << NODES_SHIFT) | pgdat->node_id;
 	eviction = (eviction << WORKINGSET_SHIFT) | workingset;
@@ -244,7 +251,8 @@ static void *lru_gen_eviction(struct folio *folio)
 	struct mem_cgroup *memcg = folio_memcg(folio);
 	struct pglist_data *pgdat = folio_pgdat(folio);
 
-	BUILD_BUG_ON(LRU_GEN_WIDTH + LRU_REFS_WIDTH > BITS_PER_LONG - EVICTION_SHIFT);
+	BUILD_BUG_ON(LRU_GEN_WIDTH + LRU_REFS_WIDTH >
+		     BITS_PER_LONG - max(EVICTION_SHIFT, EVICTION_SHIFT_ANON));
 
 	lruvec = mem_cgroup_lruvec(memcg, pgdat);
 	lrugen = &lruvec->lrugen;
@@ -254,7 +262,7 @@ static void *lru_gen_eviction(struct folio *folio)
 	hist = lru_hist_from_seq(min_seq);
 	atomic_long_add(delta, &lrugen->evicted[hist][type][tier]);
 
-	return pack_shadow(mem_cgroup_id(memcg), pgdat, token, workingset);
+	return pack_shadow(mem_cgroup_id(memcg), pgdat, token, workingset, type);
 }
 
 /*
@@ -381,6 +389,7 @@ void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages)
 void *workingset_eviction(struct folio *folio, struct mem_cgroup *target_memcg)
 {
 	struct pglist_data *pgdat = folio_pgdat(folio);
+	int file = folio_is_file_lru(folio);
 	unsigned long eviction;
 	struct lruvec *lruvec;
 	int memcgid;
@@ -397,10 +406,10 @@ void *workingset_eviction(struct folio *folio, struct mem_cgroup *target_memcg)
 	/* XXX: target_memcg can be NULL, go through lruvec */
 	memcgid = mem_cgroup_id(lruvec_memcg(lruvec));
 	eviction = atomic_long_read(&lruvec->nonresident_age);
-	eviction >>= bucket_order;
+	eviction >>= bucket_order[file];
 	workingset_age_nonresident(lruvec, folio_nr_pages(folio));
 	return pack_shadow(memcgid, pgdat, eviction,
-				folio_test_workingset(folio));
+			   folio_test_workingset(folio), folio_is_file_lru(folio));
 }
 
 /**
@@ -438,7 +447,7 @@ bool workingset_test_recent(void *shadow, bool file, bool *workingset,
 
 	rcu_read_lock();
 	unpack_shadow(shadow, &memcgid, &pgdat, &eviction, workingset);
-	eviction <<= bucket_order;
+	eviction <<= bucket_order[file];
 
 	/*
 	 * Look up the memcg associated with the stored ID. It might
@@ -780,8 +789,8 @@ static struct lock_class_key shadow_nodes_key;
 
 static int __init workingset_init(void)
 {
+	unsigned int timestamp_bits, timestamp_bits_anon;
 	struct shrinker *workingset_shadow_shrinker;
-	unsigned int timestamp_bits;
 	unsigned int max_order;
 	int ret = -ENOMEM;
 
@@ -794,11 +803,15 @@ static int __init workingset_init(void)
 	 * double the initial memory by using totalram_pages as-is.
 	 */
 	timestamp_bits = BITS_PER_LONG - EVICTION_SHIFT;
+	timestamp_bits_anon = BITS_PER_LONG - EVICTION_SHIFT_ANON;
 	max_order = fls_long(totalram_pages() - 1);
-	if (max_order > timestamp_bits)
-		bucket_order = max_order - timestamp_bits;
-	pr_info("workingset: timestamp_bits=%d max_order=%d bucket_order=%u\n",
-	       timestamp_bits, max_order, bucket_order);
+	if (max_order > (BITS_PER_LONG - EVICTION_SHIFT))
+		bucket_order[WORKINGSET_FILE] = max_order - timestamp_bits;
+	if (max_order > timestamp_bits_anon)
+		bucket_order[WORKINGSET_ANON] = max_order - timestamp_bits_anon;
+	pr_info("workingset: timestamp_bits=%d (anon: %d) max_order=%d bucket_order=%u (anon: %d)\n",
+		timestamp_bits, timestamp_bits_anon, max_order,
+		bucket_order[WORKINGSET_FILE], bucket_order[WORKINGSET_ANON]);
 
 	workingset_shadow_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
 						    SHRINKER_MEMCG_AWARE,
-- 
2.49.0

