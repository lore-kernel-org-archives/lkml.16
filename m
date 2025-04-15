Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8DD20DD54
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685180; cv=none; b=NmOFWA1t+a8haBlasdTl8I+LNJ0LYSRGSdeIiaOfzyKbRK+IojUXnp1sU9MlgMC3hf9cU50L2YfRje/5ydFEU8IbMQAnYHXOQrzbX/p8kxB7TZEw5SeXFwgvhqSG4ssFPdsAJFJSde0tZFhwbKZ3HX3yl3T1emyW3ZQCeR4OL/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685180; c=relaxed/simple;
	bh=cBh3aVYxqc3iw3A6mggzgpoySbYgwI2wab9Jivs2nVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mWkeYgGlGp7TNdhNndMBS7hP+V5W7yfbkBa15ZJlggSSSFuuTXYRCS9nJsQ29zRTCIBdFM/GPrd2oqJD8cYjoMRdzk3/svQT6fNJYWRf1n3jUCAn0Ytpkv1DzOSwUIhzHLJXTOWqHSMKfnwI05hgRo4RQIj3W1atcs73mrhZ9Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=J+EtbJYC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="J+EtbJYC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2254e0b4b79so67747985ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685177; x=1745289977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brxtynYJLZUnqxef6aOOLSxck7i4XWxbG91ObFKf1mY=;
        b=J+EtbJYCNrsiRhTnIXYwzKydCDbC9lQISKiD91+T5txjGvQbqzUVmU3m2g3SgDXhcR
         Tcl0No1utcmIIOtKMqmOjc1vHAaNq6O/li2soyt4lkqzzVgLGwIzc8uFzMVh4BUfPuq9
         ZMgdjbaz6QH2zqg1dvuexLWiGoTfqvO8RVmgzzBYUjdV9fSvDyj1fN2Ex4DznGn0nVnx
         PjMVPLjN4OAqlpFDDSsdf4s+WnM3v02QGrt2RQp38DI1tnV2Axf9kwORoHuxmxyrX2NI
         O00itmjSCjZ/yXLyscDs+E5FiECBeSilmFTzdXyPlou12nwLIWVyL7JqnISHllARykz9
         zgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685177; x=1745289977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brxtynYJLZUnqxef6aOOLSxck7i4XWxbG91ObFKf1mY=;
        b=QOvXZTGrHL9S5vXddIzizbiyCGsoUU0ll663BfZH2Ul54shFV4pp48A8mIJQkVI2U8
         e9sxu/rE5nr8nYAPiP7kr1b6hREn0r7o1XyTwNBSNwEWd4APqZQ9XOez5lG91ST/rlU6
         WwiV22xTO4Wjkew6tXGML67D5pn3r5NCBL8XBu7JC9cYEjRRXACwsvdmp/FCjK/42HUs
         xPCyGz/R1/2OWQh4DJPSoHjw1bxzQZhPiTs0yzGBhFcZd+rYj2vBmHBycYoleulnmBFH
         EZ1wSjjAepcG2Uh7LuIunPTWo2jVzMhFB3hVMTaDlrjZdPYiEBm3WTXg9iHz7HKQU7HJ
         uFgg==
X-Gm-Message-State: AOJu0YwgJr9Em4sBBLbHJKbOydv4uVXiS5hwhJ7y/Ketr6nPpv2KP4Mw
	DSziFCdOCWUMgfT6aIoxflLdW50b0wbs+i7BzZ0CPNv5l/f2+A1CiaTJwiYYqQA=
X-Gm-Gg: ASbGncvAKCHJqWgN7OZs2OVZ66gW8IlffKmJ1ppo34i9aglTofeYBbgw4bJJEBSA2i+
	eLGNeRI9w3yJAPajX9XIMHXtHR98mxfST/b6dInR7EdSEzXkP8ShXO+mOjMjHSstYITijZJU50g
	RVm0kz1MHSN+JkT2jKK3s0g8l+wbHVYCElMk9Uy9CDhwTl9Ji+qI36ERjvgC68IyKj1Q7KP1rV8
	WjXF/xTMUvvTQ889VIdiSPeTbaM5DDoZctBLa/OK9ucm71EQXEPbJRQMRUQHJ26HhwgpSWvpwW2
	OZVkAHKscn0Thz889j9OmKcDvoEqBLb1hBrLzTs0u0ayFwW3lGL2bzJKHer9CYwoHV2HJL0L
X-Google-Smtp-Source: AGHT+IHyyAeyjZ49bEZ0MTKd+BqhH6rBa5vP3SZXknSqiAeNZVb3i/S33ow8Ug4oRyTybyiTWON2CQ==
X-Received: by 2002:a17:902:db0b:b0:21f:164d:93fe with SMTP id d9443c01a7336-22bea50832bmr206493445ad.53.1744685177428;
        Mon, 14 Apr 2025 19:46:17 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.46.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:46:16 -0700 (PDT)
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
Subject: [PATCH RFC 04/28] mm: rename unlock_page_lruvec_irq and its variants
Date: Tue, 15 Apr 2025 10:45:08 +0800
Message-Id: <20250415024532.26632-5-songmuchun@bytedance.com>
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

It is inappropriate to use folio_lruvec_lock() variants in conjunction with
unlock_page_lruvec() variants, as this involves the inconsistent operation of
locking a folio while unlocking a page. To rectify this, the functions
unlock_page_lruvec{_irq, _irqrestore} are renamed to lruvec_unlock{_irq,
_irqrestore}.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
---
 include/linux/memcontrol.h | 10 +++++-----
 mm/compaction.c            | 14 +++++++-------
 mm/huge_memory.c           |  2 +-
 mm/mlock.c                 |  2 +-
 mm/swap.c                  | 12 ++++++------
 mm/vmscan.c                |  4 ++--
 6 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 53364526d877..a045819bcf40 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1510,17 +1510,17 @@ static inline struct lruvec *parent_lruvec(struct lruvec *lruvec)
 	return mem_cgroup_lruvec(memcg, lruvec_pgdat(lruvec));
 }
 
-static inline void unlock_page_lruvec(struct lruvec *lruvec)
+static inline void lruvec_unlock(struct lruvec *lruvec)
 {
 	spin_unlock(&lruvec->lru_lock);
 }
 
-static inline void unlock_page_lruvec_irq(struct lruvec *lruvec)
+static inline void lruvec_unlock_irq(struct lruvec *lruvec)
 {
 	spin_unlock_irq(&lruvec->lru_lock);
 }
 
-static inline void unlock_page_lruvec_irqrestore(struct lruvec *lruvec,
+static inline void lruvec_unlock_irqrestore(struct lruvec *lruvec,
 		unsigned long flags)
 {
 	spin_unlock_irqrestore(&lruvec->lru_lock, flags);
@@ -1542,7 +1542,7 @@ static inline struct lruvec *folio_lruvec_relock_irq(struct folio *folio,
 		if (folio_matches_lruvec(folio, locked_lruvec))
 			return locked_lruvec;
 
-		unlock_page_lruvec_irq(locked_lruvec);
+		lruvec_unlock_irq(locked_lruvec);
 	}
 
 	return folio_lruvec_lock_irq(folio);
@@ -1556,7 +1556,7 @@ static inline void folio_lruvec_relock_irqsave(struct folio *folio,
 		if (folio_matches_lruvec(folio, *lruvecp))
 			return;
 
-		unlock_page_lruvec_irqrestore(*lruvecp, *flags);
+		lruvec_unlock_irqrestore(*lruvecp, *flags);
 	}
 
 	*lruvecp = folio_lruvec_lock_irqsave(folio, flags);
diff --git a/mm/compaction.c b/mm/compaction.c
index 139f00c0308a..ce45d633ddad 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -946,7 +946,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		 */
 		if (!(low_pfn % COMPACT_CLUSTER_MAX)) {
 			if (locked) {
-				unlock_page_lruvec_irqrestore(locked, flags);
+				lruvec_unlock_irqrestore(locked, flags);
 				locked = NULL;
 			}
 
@@ -997,7 +997,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 			}
 			/* for alloc_contig case */
 			if (locked) {
-				unlock_page_lruvec_irqrestore(locked, flags);
+				lruvec_unlock_irqrestore(locked, flags);
 				locked = NULL;
 			}
 
@@ -1089,7 +1089,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 			if (unlikely(__PageMovable(page)) &&
 					!PageIsolated(page)) {
 				if (locked) {
-					unlock_page_lruvec_irqrestore(locked, flags);
+					lruvec_unlock_irqrestore(locked, flags);
 					locked = NULL;
 				}
 
@@ -1194,7 +1194,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		/* If we already hold the lock, we can skip some rechecking */
 		if (lruvec != locked) {
 			if (locked)
-				unlock_page_lruvec_irqrestore(locked, flags);
+				lruvec_unlock_irqrestore(locked, flags);
 
 			compact_lock_irqsave(&lruvec->lru_lock, &flags, cc);
 			locked = lruvec;
@@ -1262,7 +1262,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 isolate_fail_put:
 		/* Avoid potential deadlock in freeing page under lru_lock */
 		if (locked) {
-			unlock_page_lruvec_irqrestore(locked, flags);
+			lruvec_unlock_irqrestore(locked, flags);
 			locked = NULL;
 		}
 		folio_put(folio);
@@ -1278,7 +1278,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		 */
 		if (nr_isolated) {
 			if (locked) {
-				unlock_page_lruvec_irqrestore(locked, flags);
+				lruvec_unlock_irqrestore(locked, flags);
 				locked = NULL;
 			}
 			putback_movable_pages(&cc->migratepages);
@@ -1310,7 +1310,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 
 isolate_abort:
 	if (locked)
-		unlock_page_lruvec_irqrestore(locked, flags);
+		lruvec_unlock_irqrestore(locked, flags);
 	if (folio) {
 		folio_set_lru(folio);
 		folio_put(folio);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2a47682d1ab7..df66aa4bc4c2 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3605,7 +3605,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 	folio_ref_unfreeze(origin_folio, 1 +
 		((mapping || swap_cache) ? folio_nr_pages(origin_folio) : 0));
 
-	unlock_page_lruvec(lruvec);
+	lruvec_unlock(lruvec);
 
 	if (swap_cache)
 		xa_unlock(&swap_cache->i_pages);
diff --git a/mm/mlock.c b/mm/mlock.c
index 3cb72b579ffd..86cad963edb7 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -205,7 +205,7 @@ static void mlock_folio_batch(struct folio_batch *fbatch)
 	}
 
 	if (lruvec)
-		unlock_page_lruvec_irq(lruvec);
+		lruvec_unlock_irq(lruvec);
 	folios_put(fbatch);
 }
 
diff --git a/mm/swap.c b/mm/swap.c
index 77b2d5997873..ee19e171857d 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -91,7 +91,7 @@ static void page_cache_release(struct folio *folio)
 
 	__page_cache_release(folio, &lruvec, &flags);
 	if (lruvec)
-		unlock_page_lruvec_irqrestore(lruvec, flags);
+		lruvec_unlock_irqrestore(lruvec, flags);
 }
 
 void __folio_put(struct folio *folio)
@@ -171,7 +171,7 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
 	}
 
 	if (lruvec)
-		unlock_page_lruvec_irqrestore(lruvec, flags);
+		lruvec_unlock_irqrestore(lruvec, flags);
 	folios_put(fbatch);
 }
 
@@ -343,7 +343,7 @@ void folio_activate(struct folio *folio)
 
 	lruvec = folio_lruvec_lock_irq(folio);
 	lru_activate(lruvec, folio);
-	unlock_page_lruvec_irq(lruvec);
+	lruvec_unlock_irq(lruvec);
 	folio_set_lru(folio);
 }
 #endif
@@ -953,7 +953,7 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 
 		if (folio_is_zone_device(folio)) {
 			if (lruvec) {
-				unlock_page_lruvec_irqrestore(lruvec, flags);
+				lruvec_unlock_irqrestore(lruvec, flags);
 				lruvec = NULL;
 			}
 			if (folio_ref_sub_and_test(folio, nr_refs))
@@ -967,7 +967,7 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 		/* hugetlb has its own memcg */
 		if (folio_test_hugetlb(folio)) {
 			if (lruvec) {
-				unlock_page_lruvec_irqrestore(lruvec, flags);
+				lruvec_unlock_irqrestore(lruvec, flags);
 				lruvec = NULL;
 			}
 			free_huge_folio(folio);
@@ -981,7 +981,7 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 		j++;
 	}
 	if (lruvec)
-		unlock_page_lruvec_irqrestore(lruvec, flags);
+		lruvec_unlock_irqrestore(lruvec, flags);
 	if (!j) {
 		folio_batch_reinit(folios);
 		return;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index b620d74b0f66..a76b3cee043d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1847,7 +1847,7 @@ bool folio_isolate_lru(struct folio *folio)
 		folio_get(folio);
 		lruvec = folio_lruvec_lock_irq(folio);
 		lruvec_del_folio(lruvec, folio);
-		unlock_page_lruvec_irq(lruvec);
+		lruvec_unlock_irq(lruvec);
 		ret = true;
 	}
 
@@ -7681,7 +7681,7 @@ void check_move_unevictable_folios(struct folio_batch *fbatch)
 	if (lruvec) {
 		__count_vm_events(UNEVICTABLE_PGRESCUED, pgrescued);
 		__count_vm_events(UNEVICTABLE_PGSCANNED, pgscanned);
-		unlock_page_lruvec_irq(lruvec);
+		lruvec_unlock_irq(lruvec);
 	} else if (pgscanned) {
 		count_vm_events(UNEVICTABLE_PGSCANNED, pgscanned);
 	}
-- 
2.20.1

