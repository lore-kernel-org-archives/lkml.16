Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE267221FB4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685200; cv=none; b=luoLT4PVujJFo8nW3b5PSQlwFthAPDINeulxFD4jg9maWgYeR919ldnNviQxHyGcfXVG++aFc+E7miLM9ShfZea4cYE3hxS6P7wWSJ+7K6KX/w2+3+BUklDBw+Li/70EFY1puABswvqtMilDZrRbOvPXbA/x8Nvy7SUYj2DTZHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685200; c=relaxed/simple;
	bh=I2MxloyZUm/6MBAy/p3ae3ToNEsICOYe03keV5sOoXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sfDtWnm3uEea+09ho9GS+n9pxw6GrjIFl3S5ciGzcMeia0/8M84oIFaBR8T3TuSLORIhipEirwN40rXe+NSAD6qLVZmLq1dExmIONopv4+ENK9p5AUYxmeaR88+xLB+CnkssIMGaD5wL6qK0sV6e5TglN4ZEjxVj8TyRY3/NNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aOk86XGD; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aOk86XGD"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b00e3c87713so4128795a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685198; x=1745289998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoWdLHOi8MZDe7tFGtzR8WCw9Q33zyNjsUf4A8uDwIg=;
        b=aOk86XGDAepWx1JdLufMOd84aBMvR4t2diQZnRIgYGrYmd8TrqePrx3hbTDfRsv4WI
         ++3bhSVzu4zymRuxkrvqzv+9XMIzX2JciVZWgnKO+M7hC5EbJyIGlowVG4o8uAPF2L4o
         Lqb670DgojdD/c3zJju3nSZAlcj1qcHPgw1O2ie5Nh3oFZiIgsCM3oL6v2Rxe4LVK/cC
         Ge1Mtj3HIsT2QtJIexccVuQrvexbQ7DuSt5RsTgrmB7HPo60q/iNqUC4JKDJ0wk+iM9H
         3fR55h4docd2Eh+8l1Uz/MaR/6nHaqO/tfvpgxUiIMvA0mkCYq1k6WZ0COMJ5SECvhcr
         bMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685198; x=1745289998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoWdLHOi8MZDe7tFGtzR8WCw9Q33zyNjsUf4A8uDwIg=;
        b=aaEIt6AgUscs0xQM+raLowcWD5QjbR7Gw+OFlVRnn/BUQGRyFcN0PfROtkzQygAoku
         gBdkq7TO4EdNTaQBYRMCA3bTN0x/2yhDPavYZRimqCoRNV3fL5tg/DXd5uV5g1gbpc8v
         UoalKrZ7VvEqtUpD1a26jGVc6kfKpXUs6U8U92W5fB7WLrl8cX9e+Ur/UGIeMTzbnIy5
         8B0RIAVoe6VVXI/Se1LQfGkYKkdq0fmtX6wuKVq3z8JBnLqVXDXYPBjBq4BPU03Fug+0
         P3MxpNbZOcTgi3k5Gk4bjYM0yRNUzZsWugcGjTZ6Hjz6dCeOJ8k0mW2lRBeGvDJbONPj
         vmOg==
X-Gm-Message-State: AOJu0Yz65e6WVzL/tAFvYb0Wg44zjkQgmDgGGhkR4Bn/0gjRO7FsOAB0
	neqOwOALe9kcvz26Pl9OLszT0p115KJksy05+cbDsm9ah6VkMybk/UHXoU6lLZ0=
X-Gm-Gg: ASbGnct66FTO6yBd9UfjCO9O4nraD6Vkg7fUMNHB8CVJqq3rqSkEbpxI3DNcSyoEOtA
	dbFs73nJBG6qroB1hSHLcMuMkqeLai//hvyshHPME8zVrM/3uqjKZCi4zwGahXDrEQpAIGr59NB
	cZ4GcaI8V/ZQ4Bzt0IHpvERqN0wWOHdfYod2X11BZO4J68mjl8YiYOn2l16m0k6BAXK+FBB9Z+c
	g0VwvMGyNEgQXpa1Yhnw0x9QCVFhap5oHR2f0PXzsmfvupvv+/sLAQfnQ9PMByZ/pQLCdMtCZ8x
	xrnrzPuA+KQY/e+hsBLfueUVleq8hXG0iocHfketV1P+FR3AHFfcRPMlYqDAhhxBTQNfUWDHkF6
	MCmqwwbw=
X-Google-Smtp-Source: AGHT+IEKT/drxov/S/IJkMzk/bPhvMbUiZuHxa6kWkMhcuX0SINcw3+8GdOiNf/WYjYHBQMzkgoxKg==
X-Received: by 2002:a17:90b:2f0b:b0:2f6:f32e:90ac with SMTP id 98e67ed59e1d1-30823639726mr23171470a91.11.1744685198109;
        Mon, 14 Apr 2025 19:46:38 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.46.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:46:37 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	david@fromorbit.com,
	zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH RFC 08/28] mm: vmscan: refactor move_folios_to_lru()
Date: Tue, 15 Apr 2025 10:45:12 +0800
Message-Id: <20250415024532.26632-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250415024532.26632-1-songmuchun@bytedance.com>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a subsequent patch, we'll reparent the LRU folios. The folios that are
moved to the appropriate LRU list can undergo reparenting during the
move_folios_to_lru() process. Hence, it's incorrect for the caller to hold
a lruvec lock. Instead, we should utilize the more general interface of
folio_lruvec_relock_irq() to obtain the correct lruvec lock.

This patch involves only code refactoring and doesn't introduce any
functional changes.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/vmscan.c | 51 +++++++++++++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index a76b3cee043d..eac5e6e70660 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1901,24 +1901,27 @@ static bool too_many_isolated(struct pglist_data *pgdat, int file,
 /*
  * move_folios_to_lru() moves folios from private @list to appropriate LRU list.
  *
- * Returns the number of pages moved to the given lruvec.
+ * Returns the number of pages moved to the appropriate lruvec.
+ *
+ * Note: The caller must not hold any lruvec lock.
  */
-static unsigned int move_folios_to_lru(struct lruvec *lruvec,
-		struct list_head *list)
+static unsigned int move_folios_to_lru(struct list_head *list)
 {
 	int nr_pages, nr_moved = 0;
+	struct lruvec *lruvec = NULL;
 	struct folio_batch free_folios;
 
 	folio_batch_init(&free_folios);
 	while (!list_empty(list)) {
 		struct folio *folio = lru_to_folio(list);
 
+		lruvec = folio_lruvec_relock_irq(folio, lruvec);
 		VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
 		list_del(&folio->lru);
 		if (unlikely(!folio_evictable(folio))) {
-			spin_unlock_irq(&lruvec->lru_lock);
+			lruvec_unlock_irq(lruvec);
 			folio_putback_lru(folio);
-			spin_lock_irq(&lruvec->lru_lock);
+			lruvec = NULL;
 			continue;
 		}
 
@@ -1940,19 +1943,15 @@ static unsigned int move_folios_to_lru(struct lruvec *lruvec,
 
 			folio_unqueue_deferred_split(folio);
 			if (folio_batch_add(&free_folios, folio) == 0) {
-				spin_unlock_irq(&lruvec->lru_lock);
+				lruvec_unlock_irq(lruvec);
 				mem_cgroup_uncharge_folios(&free_folios);
 				free_unref_folios(&free_folios);
-				spin_lock_irq(&lruvec->lru_lock);
+				lruvec = NULL;
 			}
 
 			continue;
 		}
 
-		/*
-		 * All pages were isolated from the same lruvec (and isolation
-		 * inhibits memcg migration).
-		 */
 		VM_BUG_ON_FOLIO(!folio_matches_lruvec(folio, lruvec), folio);
 		lruvec_add_folio(lruvec, folio);
 		nr_pages = folio_nr_pages(folio);
@@ -1961,11 +1960,12 @@ static unsigned int move_folios_to_lru(struct lruvec *lruvec,
 			workingset_age_nonresident(lruvec, nr_pages);
 	}
 
+	if (lruvec)
+		lruvec_unlock_irq(lruvec);
+
 	if (free_folios.nr) {
-		spin_unlock_irq(&lruvec->lru_lock);
 		mem_cgroup_uncharge_folios(&free_folios);
 		free_unref_folios(&free_folios);
-		spin_lock_irq(&lruvec->lru_lock);
 	}
 
 	return nr_moved;
@@ -2033,9 +2033,9 @@ static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
 
 	nr_reclaimed = shrink_folio_list(&folio_list, pgdat, sc, &stat, false);
 
-	spin_lock_irq(&lruvec->lru_lock);
-	move_folios_to_lru(lruvec, &folio_list);
+	move_folios_to_lru(&folio_list);
 
+	local_irq_disable();
 	__mod_lruvec_state(lruvec, PGDEMOTE_KSWAPD + reclaimer_offset(sc),
 					stat.nr_demoted);
 	__mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, -nr_taken);
@@ -2044,7 +2044,7 @@ static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
 		__count_vm_events(item, nr_reclaimed);
 	__count_memcg_events(lruvec_memcg(lruvec), item, nr_reclaimed);
 	__count_vm_events(PGSTEAL_ANON + file, nr_reclaimed);
-	spin_unlock_irq(&lruvec->lru_lock);
+	local_irq_enable();
 
 	lru_note_cost(lruvec, file, stat.nr_pageout, nr_scanned - nr_reclaimed);
 
@@ -2183,16 +2183,15 @@ static void shrink_active_list(unsigned long nr_to_scan,
 	/*
 	 * Move folios back to the lru list.
 	 */
-	spin_lock_irq(&lruvec->lru_lock);
-
-	nr_activate = move_folios_to_lru(lruvec, &l_active);
-	nr_deactivate = move_folios_to_lru(lruvec, &l_inactive);
+	nr_activate = move_folios_to_lru(&l_active);
+	nr_deactivate = move_folios_to_lru(&l_inactive);
 
+	local_irq_disable();
 	__count_vm_events(PGDEACTIVATE, nr_deactivate);
 	__count_memcg_events(lruvec_memcg(lruvec), PGDEACTIVATE, nr_deactivate);
 
 	__mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, -nr_taken);
-	spin_unlock_irq(&lruvec->lru_lock);
+	local_irq_enable();
 
 	if (nr_rotated)
 		lru_note_cost(lruvec, file, 0, nr_rotated);
@@ -4723,14 +4722,15 @@ static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, int swap
 			set_mask_bits(&folio->flags, LRU_REFS_FLAGS, BIT(PG_active));
 	}
 
-	spin_lock_irq(&lruvec->lru_lock);
-
-	move_folios_to_lru(lruvec, &list);
+	move_folios_to_lru(&list);
 
+	local_irq_disable();
 	walk = current->reclaim_state->mm_walk;
 	if (walk && walk->batched) {
 		walk->lruvec = lruvec;
+		spin_lock(&lruvec->lru_lock);
 		reset_batch_size(walk);
+		spin_unlock(&lruvec->lru_lock);
 	}
 
 	__mod_lruvec_state(lruvec, PGDEMOTE_KSWAPD + reclaimer_offset(sc),
@@ -4741,8 +4741,7 @@ static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, int swap
 		__count_vm_events(item, reclaimed);
 	__count_memcg_events(memcg, item, reclaimed);
 	__count_vm_events(PGSTEAL_ANON + type, reclaimed);
-
-	spin_unlock_irq(&lruvec->lru_lock);
+	local_irq_enable();
 
 	list_splice_init(&clean, &list);
 
-- 
2.20.1

