Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7256430E83B;
	Wed,  2 Jul 2025 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487285; cv=none; b=pN06I2rNkmkMogeJE2k2VhR7F81RZ0dsy3nsF3ClkRmmgVPSTdXfRDs19Jx9FP7JMDyyLAfuViL1hVsoxMWTARdU4LwT1sWjY+rGrp0gvQGv9pPT9kiehy8IIxqxaMMwoNTrPrBw3cSisQyank2k+0LKT9+BOO4ugGuGX8PSa6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487285; c=relaxed/simple;
	bh=ya5MwjEB1xHq/yOFXYAj+pDIdDIqM4iOdvLYL2l39jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWN7wK7OzigiJAwio3DRKjrVjwVYmE7qvVN0rG6850vM7dMhK7+mHaNSCGxRRK3TT3YHiqewJMYwp2t9WlJ7Ov7aDwk84/5UI2yBVZm1/cGv7s5g+sWuFpazfd3keeZ5/dV8+Lv8Z8t9ieXNrPFiXCpeUpkDxdFlyVp4RKiasMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ws4rS4bL; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ws4rS4bL"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e733a6ff491so4577269276.2;
        Wed, 02 Jul 2025 13:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487282; x=1752092082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux7vTJe4Gmqx6TiCWWLEznlY/hR11iXVrOjLOOQ9hBo=;
        b=Ws4rS4bL830Phqud6A4DvuvgzKHiOIUu1g6zfWCqZK5UYpWNc7OXnZUNRI28YSlcTB
         qE1dYssFUtzXJjUJEwyqScQZ8SxRXWWzrnlR4IDTnqSI8YVr3nsuwsobenCCrKg/6X0g
         C89CBTdjOMDwEolKOHMqVRaNFxupu6DC75iq0GFgPfJLoXeGBeiyr1u00U1fH1+2dBA+
         Vxn3NmI3pwyvUYa0IdcdEgcfLkchrOXQucEyBS+aPiVacjaqDe4xK0tcnV5JCSXcKG08
         fP8cVOqgDhK4FU+ppt38KK9PhG2eKCHzxCgpI/sJiSZ6a+OQXe8CQ8BOspq20AUP7BnO
         L/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487282; x=1752092082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ux7vTJe4Gmqx6TiCWWLEznlY/hR11iXVrOjLOOQ9hBo=;
        b=pCvRrmYwx4h0cm8ed/zXQ4ScLCChdULFlW4Rql6GvSsJVMAqpJLciPF8QkEwbBVlXG
         Ed7GrkykDLiLRuyG3NKo5YbgCddr4C2KEfGhq6HaKlTwHJZUh6RG/Vgt2joXkNg1uECJ
         jFTABuEo3USl3IDoSpAUMQ8VzEuVdG0/+xH+TAzCRD3cCWzuPBluFk3btP7znC2/77YM
         hjK9vGBxAHKCNQP/JCpcbUwo2jptQTJd1OYlXFkuY1zC2p2m7ZohzmqcCZpSRPc1q7oW
         XkX1Uda62TkOkN/+6KmDJQ0S0aermzIz/6zEPUpg8kbV2bW5+IDEJgwFbP0upvdXkkfC
         97iA==
X-Forwarded-Encrypted: i=1; AJvYcCVAvChTWr4e/dSLtX+cvH3xpvinjzAgOVhhXmKuexvxkhftBC2YIaBNcLRPjUj2bwnPIOrsDIvW5AqOswnb@vger.kernel.org, AJvYcCWVyKGVibDG5kDJ6mZRUClZIVyITpsa0X2HLicIEB+Qwbc7PYKPujlCzhs4l3Z7RT8Vzyv2tnuxSBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF/ilUN6DnPPnf4jj9+YdbxxkvHsgiQ22p4XqxJNHr9Mlkx479
	uk1h3jrv6fLIwF3pmsEy7LqahHFAlmXvtYKRepgh8hmr5p6RG62BhGUu
X-Gm-Gg: ASbGncu2vWTpH3q77Oc50lgNZM+GaTi3xbPAdgn/BljWOvy08mW2ywvJHuAjOifvzJx
	QdQff4t68GM2JK0nyQS5EIrvtfkwAH3Z12N1g0ZD/SJdYUxAz/L9pdkYpB1KKr4ZQnHGD/DQPkX
	YlIWGdIyWKtwcYsCcXWnELCisr6Jc2EIpRq9NJlF/LHG6b51l24yzrRBSDUk+xrc+pALtxiIr34
	gikF5eCh3u6Q0z1NE7hNPUOEUaYtWM/Hh/xnJAM8fQnPJTj93IPBwtVDdbPNT6o8IBVqKkm2cOL
	7Mm+Gpf2hWpD7oM00IcwHm5u0fGdk4bsoed9hUqwovZCcSUTmDYZ5hDSJZozU1i1xLIXUrS0kda
	yk68CWCdc6YG+hRz3Mw==
X-Google-Smtp-Source: AGHT+IHA+gOuV+brpZwRwERkJ7yj/jSN/p3J3iXUigSwyqpIrYWnlxAOmwngxwZ6r4wEWO6YRW3O0Q==
X-Received: by 2002:a05:690c:6002:b0:70e:a1e:d9f8 with SMTP id 00721157ae682-716590c4d46mr15751777b3.22.1751487281890;
        Wed, 02 Jul 2025 13:14:41 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:14:41 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	joshua.hahnjy@gmail.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com,
	Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Subject: [RFC PATCH v3 08/13] mm/damon: Move migration helpers from paddr to ops-common
Date: Wed,  2 Jul 2025 15:13:31 -0500
Message-ID: <20250702201337.5780-9-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702201337.5780-1-bijan311@gmail.com>
References: <20250702201337.5780-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bijan Tabatabai <bijantabatab@micron.com>

This patch moves the damon_pa_migrate_pages function along with its
corresponding helper functions from paddr to ops-common. The function
prefix of "damon_pa_" was also changed to just "damon_" accordingly.

This patch will allow page migration to be available to vaddr schemes as
well as paddr schemes.

Co-developed-by: Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Signed-off-by: Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 mm/damon/ops-common.c | 120 +++++++++++++++++++++++++++++++++++++++++
 mm/damon/ops-common.h |   2 +
 mm/damon/paddr.c      | 122 +-----------------------------------------
 3 files changed, 123 insertions(+), 121 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index b43620fee6bb..918158ef3d99 100644
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
@@ -138,3 +140,121 @@ int damon_cold_score(struct damon_ctx *c, struct damon_region *r,
 	/* Return coldness of the region */
 	return DAMOS_MAX_SCORE - hotness;
 }
+
+static unsigned int __damon_migrate_folio_list(
+		struct list_head *migrate_folios, struct pglist_data *pgdat,
+		int target_nid)
+{
+	unsigned int nr_succeeded = 0;
+	struct migration_target_control mtc = {
+		/*
+		 * Allocate from 'node', or fail quickly and quietly.
+		 * When this happens, 'page' will likely just be discarded
+		 * instead of migrated.
+		 */
+		.gfp_mask = (GFP_HIGHUSER_MOVABLE & ~__GFP_RECLAIM) |
+			__GFP_NOWARN | __GFP_NOMEMALLOC | GFP_NOWAIT,
+		.nid = target_nid,
+	};
+
+	if (pgdat->node_id == target_nid || target_nid == NUMA_NO_NODE)
+		return 0;
+
+	if (list_empty(migrate_folios))
+		return 0;
+
+	/* Migration ignores all cpuset and mempolicy settings */
+	migrate_pages(migrate_folios, alloc_migration_target, NULL,
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
+unsigned long damon_migrate_pages(struct list_head *folio_list, int target_nid)
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
index fcab148e6865..48e3e6fed636 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -13,7 +13,6 @@
 #include <linux/rmap.h>
 #include <linux/swap.h>
 #include <linux/memory-tiers.h>
-#include <linux/migrate.h>
 #include <linux/mm_inline.h>
 
 #include "../internal.h"
@@ -381,125 +380,6 @@ static unsigned long damon_pa_deactivate_pages(struct damon_region *r,
 			sz_filter_passed);
 }
 
-static unsigned int __damon_pa_migrate_folio_list(
-		struct list_head *migrate_folios, struct pglist_data *pgdat,
-		int target_nid)
-{
-	unsigned int nr_succeeded = 0;
-	struct migration_target_control mtc = {
-		/*
-		 * Allocate from 'node', or fail quickly and quietly.
-		 * When this happens, 'page' will likely just be discarded
-		 * instead of migrated.
-		 */
-		.gfp_mask = (GFP_HIGHUSER_MOVABLE & ~__GFP_RECLAIM) |
-			__GFP_NOWARN | __GFP_NOMEMALLOC | GFP_NOWAIT,
-		.nid = target_nid,
-	};
-
-	if (pgdat->node_id == target_nid || target_nid == NUMA_NO_NODE)
-		return 0;
-
-	if (list_empty(migrate_folios))
-		return 0;
-
-	/* Migration ignores all cpuset and mempolicy settings */
-	migrate_pages(migrate_folios, alloc_migration_target, NULL,
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
@@ -527,7 +407,7 @@ static unsigned long damon_pa_migrate(struct damon_region *r, struct damos *s,
 		addr += folio_size(folio);
 		folio_put(folio);
 	}
-	applied = damon_pa_migrate_pages(&folio_list, s->target_nid);
+	applied = damon_migrate_pages(&folio_list, s->target_nid);
 	cond_resched();
 	s->last_applied = folio;
 	return applied * PAGE_SIZE;
-- 
2.43.5

