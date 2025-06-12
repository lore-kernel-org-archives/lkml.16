Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F95C1632DD;
	Thu, 12 Jun 2025 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752125; cv=none; b=jNHl85uvkfd4O9lFu565aplJRLQlt79SqCgq/5L2BEnZnQjaAAYDtbAgBCnbvWM1+BY5HcFixdQMc77LDRUCm3wbX5MIkaQkrR6kyuGo26lzbrxSbbhzoiKwds3dJ0ECCuuAUdF0NQtgerBA+R0oThArfFrXqXT9wYWRS7ndM78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752125; c=relaxed/simple;
	bh=4ECuvmuOJa1WL+atdNsEmrWyTpz1tzuFAE4YXPmPJXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNarTpFAgT6GjD5BARVfeR7B+lGFdXa/3F/p5PzBqw3dRw5xVwEUGQMgy7DVsD6Da31cub8O7OUPNy4xM4Z9aU7M6kNUQPHteqaPxMCAXL+dlYx0kbHBtjDIwvmJ00GO5lcAA7VWWLB2MqjyJjtZVqetTpsNpV1vbIGnWZZkJDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwd6g1vT; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwd6g1vT"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e7db5c13088so1152437276.1;
        Thu, 12 Jun 2025 11:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749752122; x=1750356922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LArn2/NqwWy0wVHKXQau9kT4miDpoQMz65raO0syifs=;
        b=bwd6g1vTbLDVG/nGXzGhB7aTVM7x8vbmPX//5HpKEGz9ApsF5bAbgJSo4FY2gVe2f4
         WyRqLzX2ygUhtf3Tdk87myrG025bBfog9qvFjySagnZxWNge+T6mSXAaCtzDLvmIs5Mt
         rn2WoR3mLLuYXiTUDb4hwC4ysmKKIl9H85wKREN4DAExf3suVv1NhpX/ZvK/FN4xEowG
         5/xlcVBWdKOC91uWRR5MxeZZMavUlZmod5N5IHjyW4ZKR1wizEcTwBlO/nvuYMH+sjRR
         llnLxejTnjEWp4iuQshTl55iWgzYgw/bzlTBkF3h8reBh5/EXCkYZ77KrgfSdagomeJ/
         THpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749752122; x=1750356922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LArn2/NqwWy0wVHKXQau9kT4miDpoQMz65raO0syifs=;
        b=oDAwZ3rGaQo8rFZ+eAMMNPyyFbFlsinxTJclL6+kUGj7/aldqvgN32XK09KxQG3Nvt
         7Rtc1RtBi+Yp3BikYpLW4Ewcn1iqPNzs18Vc8r75J8blQQzpwI5SrfCWqVYM1j1ZqUew
         FZnx01jeWICwlzLhM4d7JagYyK6lTIjSYClWKHClHgSuuMSb7DHkN9AJtT3vqJ+pUO+s
         h70xMOteFx0Slr3oqgNBLQ/TiA1YrB2yGE/oD3T6RaZx/X5pEqauEkiUMJ79nj17cPA8
         76SPLanIkPUPQsX8Hst98pgWJDYkGSrzVpMDMAVVWYO1zbqrvhoODhN3AbLI7gG6p7pR
         K59Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIBIYoK0DuYFALRsZ8FX2ei62UGqVjX6cT+t6KJT+LirH/BeQUuottZJjcgkluXYM2HQVos/NGy6p1bwRv@vger.kernel.org, AJvYcCXU9RNRojvefs5C9803PH+FMpOHzhdJxV3dH8LPQvvZBmtibazq0EoNSVWCx+S/aKYNXI07K0r+fyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnrYXxDXiSS0wUvJxZQYaQO+wwDmzKt/48hD25GeUt40wgsxGu
	xG0cJcx4Gp8LGPo5S05ty5z1G5G4ME8Ggc9v3ft3OmyvcylvrC5I4kg2tUo0AX80zRk=
X-Gm-Gg: ASbGncvb+GyZc8axHPoiQaVMp9YeMJ/P/ZUGvIxyxQpu9lde6MM6AaZlP8+yYBufWtj
	DgRQibpEbW7K3FAs9zErUoHK2pa/E3C+JQ2ZL2gVKV77kcb+p5M2b9rDYtmtfqTdEWQ4lrBKDCl
	agm+QLODXzJvbi2e4DtzXs4BWgO5zGdo/C3fjH1+o7QZeVTdOuloP3ORkfjtafQxKgUlHylW9VD
	hOqHq8jtRHMBieBcqhnnaBWj9wIVNjBJ9h6tDREJc1SLXIJ6Tz54OgEGf9RUaMwfKEO1MW9/FWK
	7GZ/iMSXGgO3ZV9iZWfp7ANA1/fDpyJjv8+DxB33Ojy3YWvDRkA0JruX5yYifI1+0vfQTKQIw/d
	4cxULYks=
X-Google-Smtp-Source: AGHT+IH8StR2oqDE+bGgZZWyYluYInSYI54x04NKJ85FqXoRUgJbr/xsBUEHZcj6UiB3fcMUvqy1wA==
X-Received: by 2002:a05:6902:220c:b0:e81:b5c8:3d71 with SMTP id 3f1490d57ef6-e820baf86edmr5215637276.17.1749752122004;
        Thu, 12 Jun 2025 11:15:22 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:dd1b:d4ae:15de:11db])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e312452sm592480276.40.2025.06.12.11.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:15:21 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	david@redhat.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH 3/4] mm/damon: Move damon_pa_migrate_pages to ops-common
Date: Thu, 12 Jun 2025 13:13:29 -0500
Message-ID: <20250612181330.31236-4-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612181330.31236-1-bijan311@gmail.com>
References: <20250612181330.31236-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bijan Tabatabai <bijantabatab@micron.com>

This patch moves damon_pa_migrate_pages from mm/damon/paddr.c to
mm/damon/ops-common.c and renames it damon_migrate_pages. This gives
vaddr based actions the ability to migrate pages as well.

Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 mm/damon/ops-common.c | 123 +++++++++++++++++++++++++++++++++++++++++
 mm/damon/ops-common.h |   2 +
 mm/damon/paddr.c      | 125 +-----------------------------------------
 3 files changed, 127 insertions(+), 123 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index b43620fee6bb..2c4fb274b7f6 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -5,6 +5,7 @@
  * Author: SeongJae Park <sj@kernel.org>
  */
 
+#include <linux/migrate.h>
 #include <linux/mmu_notifier.h>
 #include <linux/page_idle.h>
 #include <linux/pagemap.h>
@@ -12,6 +13,7 @@
 #include <linux/swap.h>
 #include <linux/swapops.h>
 
+#include "../internal.h"
 #include "ops-common.h"
 
 /*
@@ -138,3 +140,124 @@ int damon_cold_score(struct damon_ctx *c, struct damon_region *r,
 	/* Return coldness of the region */
 	return DAMOS_MAX_SCORE - hotness;
 }
+
+static unsigned int __damon_migrate_folio_list(
+		struct list_head *migrate_folios, struct pglist_data *pgdat,
+		int target_nid)
+{
+	unsigned int nr_succeeded = 0;
+	nodemask_t allowed_mask = NODE_MASK_NONE;
+	struct migration_target_control mtc = {
+		/*
+		 * Allocate from 'node', or fail quickly and quietly.
+		 * When this happens, 'page' will likely just be discarded
+		 * instead of migrated.
+		 */
+		.gfp_mask = (GFP_HIGHUSER_MOVABLE & ~__GFP_RECLAIM) |
+			__GFP_NOWARN | __GFP_NOMEMALLOC | GFP_NOWAIT,
+		.nid = target_nid,
+		.nmask = &allowed_mask
+	};
+
+	if (pgdat->node_id == target_nid || target_nid == NUMA_NO_NODE)
+		return 0;
+
+	if (list_empty(migrate_folios))
+		return 0;
+
+	/* Migration ignores all cpuset and mempolicy settings */
+	migrate_pages(migrate_folios, alloc_migrate_folio, NULL,
+		      (unsigned long)&mtc, MIGRATE_ASYNC, MR_DAMON,
+		      &nr_succeeded);
+
+	return nr_succeeded;
+}
+
+static unsigned int damon_migrate_folio_list(struct list_head *folio_list,
+						struct pglist_data *pgdat,
+						int target_nid)
+{
+	unsigned int nr_migrated = 0;
+	struct folio *folio;
+	LIST_HEAD(ret_folios);
+	LIST_HEAD(migrate_folios);
+
+	while (!list_empty(folio_list)) {
+		struct folio *folio;
+
+		cond_resched();
+
+		folio = lru_to_folio(folio_list);
+		list_del(&folio->lru);
+
+		if (!folio_trylock(folio))
+			goto keep;
+
+		/* Relocate its contents to another node. */
+		list_add(&folio->lru, &migrate_folios);
+		folio_unlock(folio);
+		continue;
+keep:
+		list_add(&folio->lru, &ret_folios);
+	}
+	/* 'folio_list' is always empty here */
+
+	/* Migrate folios selected for migration */
+	nr_migrated += __damon_migrate_folio_list(
+			&migrate_folios, pgdat, target_nid);
+	/*
+	 * Folios that could not be migrated are still in @migrate_folios.  Add
+	 * those back on @folio_list
+	 */
+	if (!list_empty(&migrate_folios))
+		list_splice_init(&migrate_folios, folio_list);
+
+	try_to_unmap_flush();
+
+	list_splice(&ret_folios, folio_list);
+
+	while (!list_empty(folio_list)) {
+		folio = lru_to_folio(folio_list);
+		list_del(&folio->lru);
+		folio_putback_lru(folio);
+	}
+
+	return nr_migrated;
+}
+
+unsigned long damon_migrate_pages(struct list_head *folio_list,
+					    int target_nid)
+{
+	int nid;
+	unsigned long nr_migrated = 0;
+	LIST_HEAD(node_folio_list);
+	unsigned int noreclaim_flag;
+
+	if (list_empty(folio_list))
+		return nr_migrated;
+
+	noreclaim_flag = memalloc_noreclaim_save();
+
+	nid = folio_nid(lru_to_folio(folio_list));
+	do {
+		struct folio *folio = lru_to_folio(folio_list);
+
+		if (nid == folio_nid(folio)) {
+			list_move(&folio->lru, &node_folio_list);
+			continue;
+		}
+
+		nr_migrated += damon_migrate_folio_list(&node_folio_list,
+							   NODE_DATA(nid),
+							   target_nid);
+		nid = folio_nid(lru_to_folio(folio_list));
+	} while (!list_empty(folio_list));
+
+	nr_migrated += damon_migrate_folio_list(&node_folio_list,
+						   NODE_DATA(nid),
+						   target_nid);
+
+	memalloc_noreclaim_restore(noreclaim_flag);
+
+	return nr_migrated;
+}
diff --git a/mm/damon/ops-common.h b/mm/damon/ops-common.h
index cc9f5da9c012..54209a7e70e6 100644
--- a/mm/damon/ops-common.h
+++ b/mm/damon/ops-common.h
@@ -16,3 +16,5 @@ int damon_cold_score(struct damon_ctx *c, struct damon_region *r,
 			struct damos *s);
 int damon_hot_score(struct damon_ctx *c, struct damon_region *r,
 			struct damos *s);
+
+unsigned long damon_migrate_pages(struct list_head *folio_list, int target_nid);
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index e989464635cd..722d69f26e37 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -381,127 +381,6 @@ static unsigned long damon_pa_deactivate_pages(struct damon_region *r,
 			sz_filter_passed);
 }
 
-static unsigned int __damon_pa_migrate_folio_list(
-		struct list_head *migrate_folios, struct pglist_data *pgdat,
-		int target_nid)
-{
-	unsigned int nr_succeeded = 0;
-	nodemask_t allowed_mask = NODE_MASK_NONE;
-	struct migration_target_control mtc = {
-		/*
-		 * Allocate from 'node', or fail quickly and quietly.
-		 * When this happens, 'page' will likely just be discarded
-		 * instead of migrated.
-		 */
-		.gfp_mask = (GFP_HIGHUSER_MOVABLE & ~__GFP_RECLAIM) |
-			__GFP_NOWARN | __GFP_NOMEMALLOC | GFP_NOWAIT,
-		.nid = target_nid,
-		.nmask = &allowed_mask
-	};
-
-	if (pgdat->node_id == target_nid || target_nid == NUMA_NO_NODE)
-		return 0;
-
-	if (list_empty(migrate_folios))
-		return 0;
-
-	/* Migration ignores all cpuset and mempolicy settings */
-	migrate_pages(migrate_folios, alloc_migrate_folio, NULL,
-		      (unsigned long)&mtc, MIGRATE_ASYNC, MR_DAMON,
-		      &nr_succeeded);
-
-	return nr_succeeded;
-}
-
-static unsigned int damon_pa_migrate_folio_list(struct list_head *folio_list,
-						struct pglist_data *pgdat,
-						int target_nid)
-{
-	unsigned int nr_migrated = 0;
-	struct folio *folio;
-	LIST_HEAD(ret_folios);
-	LIST_HEAD(migrate_folios);
-
-	while (!list_empty(folio_list)) {
-		struct folio *folio;
-
-		cond_resched();
-
-		folio = lru_to_folio(folio_list);
-		list_del(&folio->lru);
-
-		if (!folio_trylock(folio))
-			goto keep;
-
-		/* Relocate its contents to another node. */
-		list_add(&folio->lru, &migrate_folios);
-		folio_unlock(folio);
-		continue;
-keep:
-		list_add(&folio->lru, &ret_folios);
-	}
-	/* 'folio_list' is always empty here */
-
-	/* Migrate folios selected for migration */
-	nr_migrated += __damon_pa_migrate_folio_list(
-			&migrate_folios, pgdat, target_nid);
-	/*
-	 * Folios that could not be migrated are still in @migrate_folios.  Add
-	 * those back on @folio_list
-	 */
-	if (!list_empty(&migrate_folios))
-		list_splice_init(&migrate_folios, folio_list);
-
-	try_to_unmap_flush();
-
-	list_splice(&ret_folios, folio_list);
-
-	while (!list_empty(folio_list)) {
-		folio = lru_to_folio(folio_list);
-		list_del(&folio->lru);
-		folio_putback_lru(folio);
-	}
-
-	return nr_migrated;
-}
-
-static unsigned long damon_pa_migrate_pages(struct list_head *folio_list,
-					    int target_nid)
-{
-	int nid;
-	unsigned long nr_migrated = 0;
-	LIST_HEAD(node_folio_list);
-	unsigned int noreclaim_flag;
-
-	if (list_empty(folio_list))
-		return nr_migrated;
-
-	noreclaim_flag = memalloc_noreclaim_save();
-
-	nid = folio_nid(lru_to_folio(folio_list));
-	do {
-		struct folio *folio = lru_to_folio(folio_list);
-
-		if (nid == folio_nid(folio)) {
-			list_move(&folio->lru, &node_folio_list);
-			continue;
-		}
-
-		nr_migrated += damon_pa_migrate_folio_list(&node_folio_list,
-							   NODE_DATA(nid),
-							   target_nid);
-		nid = folio_nid(lru_to_folio(folio_list));
-	} while (!list_empty(folio_list));
-
-	nr_migrated += damon_pa_migrate_folio_list(&node_folio_list,
-						   NODE_DATA(nid),
-						   target_nid);
-
-	memalloc_noreclaim_restore(noreclaim_flag);
-
-	return nr_migrated;
-}
-
 static unsigned long damon_pa_migrate(struct damon_region *r, struct damos *s,
 		unsigned long *sz_filter_passed)
 {
@@ -529,7 +408,7 @@ static unsigned long damon_pa_migrate(struct damon_region *r, struct damos *s,
 		addr += folio_size(folio);
 		folio_put(folio);
 	}
-	applied = damon_pa_migrate_pages(&folio_list, s->target_nid);
+	applied = damon_migrate_pages(&folio_list, s->target_nid);
 	cond_resched();
 	s->last_applied = folio;
 	return applied * PAGE_SIZE;
@@ -627,7 +506,7 @@ static unsigned long damon_pa_interleave(struct damon_region *r, struct damos *s
 
 	applied = 0;
 	for (int i = 0; i < nr_node_ids; i++) {
-		applied += damon_pa_migrate_pages(&priv.folio_migration_list[i], i);
+		applied += damon_migrate_pages(&priv.folio_migration_list[i], i);
 		cond_resched();
 	}
 
-- 
2.43.5

