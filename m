Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB866221733
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685195; cv=none; b=dqzsMNnDLBnb8XJAY3B8SHe4eV8RVgSrbOUFXNzqSbUxtsb3li9AHrRrXdhOiJ5eTreMna4JqhfOAo4pi7mPU/Ns+pPq/D3u6nzgHKfEgjI/NVlm4YyDdlknzWZWgmfICnZUaGE6MQ0Us9uNHGDDbwdyuHlNkC80ozv6JZpS0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685195; c=relaxed/simple;
	bh=84sEftSYIXbatP8ktiNMwP5R5mvWYXBwXyaqvwHswlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i+khv8PKyOIpRpwviI3jYVhWC/IjE94H74zWEqnFWktydL0M7k1OLWhdS1TrWsgs/3GHiutI08yWVt4go5ispS08HojF3WoEU2JzDURMwwvxxWG/Ag6m/nzvDIYpCnuqp1hYM5vYoQy/9lNeGN/C0guGiNGh/KEIMjAxRxcTrgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OMZsgufo; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OMZsgufo"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af93cd64ef3so3462906a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685193; x=1745289993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8vA4hA6IVI4psjQZDVnpF3qlQM7CohLDDJ5h+RUQ50=;
        b=OMZsgufow1ebs6FLwZbHco8mCG+Z/vxDvHw0KkvQ3xivgPSthk+CN5l9KHYZ7XZiZl
         8R+p6fs7nxU8PVB7EKILd01yWYrBFb68n4BENYPDMTaecjExbkITfQ/XJnF+qVU6DuaA
         M9KzQmKibOvJImTZbQhxr0DkElSQjAOaizZQtFPKAKMleloGYmSMDV1EojFHuA0usGeA
         qQXQ5to4ik4KXD6DhQvhEGewtkkGQLD8eh8ET9eX07c0q0xXOzBYMxQRrMtzCzNI7O60
         1KSBrnNuioqwFfTvt6lxuFc7qkeQUtfH6KeBZQT16P9nDRNO688RVYvYs+YMjozHO/Hs
         RjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685193; x=1745289993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8vA4hA6IVI4psjQZDVnpF3qlQM7CohLDDJ5h+RUQ50=;
        b=sNt/uIAPhdXy5/eiVhfeG4WvJU4mE/pmdZiKbg1EDm91/ijfwL8we9vQcMvSMKCdY4
         YMpe94/mIqFfx/2tqccZIMKcQzZJSSAINitbcD8OnZrjv1cJ6Cknq1ZKCzsF5R3FI317
         y5uBk5UQP47lgtJ5J4VVymXPgE1GyW0j3ls9rOZAQ8OqqaqNfouqkAMvNkKmzdf1rfsw
         2Vl8NWNZNqRWEyyoQU92fs/U0tO7s9nemH0Cx3vPLF1X8QxOa00VBJkHIc8EDUas6tG/
         RFplgxKWCnfI4vs0QF5mRT1uJy/491AMustLs2EryFpBSAdXvFlr4N9XeqhlZoSsxM58
         GjIA==
X-Gm-Message-State: AOJu0Yy9rKesGZsgurhiPv/l0Qa1XqWu4Q9mDUnIaPuCK9Zq6VO6L1GR
	JYqmcf65akZxECD3LeVD1Gxl/lWhcCenN5W8dBldt9KJNcvNw7lWzxztTI8DfU0=
X-Gm-Gg: ASbGncvn9V/c9DuJQVXhaw8cfXCWdkvRYJ5xy9zRBiqXl2AYziYvG/RHkQ0UjwUjz94
	6gIspC/tR98L1+3K0EFAOSNTAWFsbwKS0wRhubvg0avG68bxf2Ceek3q9kMQlJBrYX8LPPDoRT9
	OYNrQJ9IR4hZ8pVIkJw6Xz08P8X0LUxWq7fZUHExl3nDlb4jJPj/6lHKvkmi052SXsGaju4myiT
	3LQ1cEzuKvoG79hO6JKwSw9llxG+pbrV/lgJtXwTqc2kVoKokzt2HL13UC4DHxs7RzQs/8a6Ag6
	i7UIE9dDggc6tKov8NL/JsRWy4mPamB0Sb0F8IrpadNCFzUBtGkedGln4kqV/la9lXmCyJxx
X-Google-Smtp-Source: AGHT+IGN/ZCUfpQSbaBS4W8bBOfntfSIoehjtu5uWTeww1FUk2wFfobrLS/nbSO2R96mT1mo6Vfdog==
X-Received: by 2002:a17:902:e552:b0:223:66bc:f1de with SMTP id d9443c01a7336-22bea4afc0fmr177104965ad.21.1744685192967;
        Mon, 14 Apr 2025 19:46:32 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.46.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:46:32 -0700 (PDT)
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
Subject: [PATCH RFC 07/28] mm: thp: use folio_batch to handle THP splitting in deferred_split_scan()
Date: Tue, 15 Apr 2025 10:45:11 +0800
Message-Id: <20250415024532.26632-8-songmuchun@bytedance.com>
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

The maintenance of the folio->_deferred_list is intricate because it's
reused in a local list.

Here are some peculiarities:

   1) When a folio is removed from its split queue and added to a local
      on-stack list in deferred_split_scan(), the ->split_queue_len isn't
      updated, leading to an inconsistency between it and the actual
      number of folios in the split queue.

   2) When the folio is split via split_folio() later, it's removed from
      the local list while holding the split queue lock. At this time,
      this lock protects the local list, not the split queue.

   3) To handle the race condition with a third-party freeing or migrating
      the preceding folio, we must ensure there's always one safe (with
      raised refcount) folio before by delaying its folio_put(). More
      details can be found in commit e66f3185fa04. It's rather tricky.

We can use the folio_batch infrastructure to handle this clearly. In this
case, ->split_queue_len will be consistent with the real number of folios
in the split queue. If list_empty(&folio->_deferred_list) returns false,
it's clear the folio must be in its split queue (not in a local list
anymore).

In the future, we aim to reparent LRU folios during memcg offline to
eliminate dying memory cgroups. This patch prepares for using
folio_split_queue_lock_irqsave() as folio memcg may change then.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/huge_memory.c | 69 +++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 39 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 70820fa75c1f..d2bc943a40e8 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4220,40 +4220,47 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
 	struct pglist_data *pgdata = NODE_DATA(sc->nid);
 	struct deferred_split *ds_queue = &pgdata->deferred_split_queue;
 	unsigned long flags;
-	LIST_HEAD(list);
-	struct folio *folio, *next, *prev = NULL;
-	int split = 0, removed = 0;
+	struct folio *folio, *next;
+	int split = 0, i;
+	struct folio_batch fbatch;
+	bool done;
 
 #ifdef CONFIG_MEMCG
 	if (sc->memcg)
 		ds_queue = &sc->memcg->deferred_split_queue;
 #endif
-
+	folio_batch_init(&fbatch);
+retry:
+	done = true;
 	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
 	/* Take pin on all head pages to avoid freeing them under us */
 	list_for_each_entry_safe(folio, next, &ds_queue->split_queue,
 							_deferred_list) {
 		if (folio_try_get(folio)) {
-			list_move(&folio->_deferred_list, &list);
-		} else {
+			folio_batch_add(&fbatch, folio);
+		} else if (folio_test_partially_mapped(folio)) {
 			/* We lost race with folio_put() */
-			if (folio_test_partially_mapped(folio)) {
-				folio_clear_partially_mapped(folio);
-				mod_mthp_stat(folio_order(folio),
-					      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
-			}
-			list_del_init(&folio->_deferred_list);
-			ds_queue->split_queue_len--;
+			folio_clear_partially_mapped(folio);
+			mod_mthp_stat(folio_order(folio),
+				      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
 		}
+		list_del_init(&folio->_deferred_list);
+		ds_queue->split_queue_len--;
 		if (!--sc->nr_to_scan)
 			break;
+		if (folio_batch_space(&fbatch) == 0) {
+			done = false;
+			break;
+		}
 	}
 	split_queue_unlock_irqrestore(ds_queue, flags);
 
-	list_for_each_entry_safe(folio, next, &list, _deferred_list) {
+	for (i = 0; i < folio_batch_count(&fbatch); i++) {
 		bool did_split = false;
 		bool underused = false;
+		struct deferred_split *fqueue;
 
+		folio = fbatch.folios[i];
 		if (!folio_test_partially_mapped(folio)) {
 			underused = thp_underused(folio);
 			if (!underused)
@@ -4269,39 +4276,23 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
 		}
 		folio_unlock(folio);
 next:
+		if (did_split || !folio_test_partially_mapped(folio))
+			continue;
 		/*
-		 * split_folio() removes folio from list on success.
 		 * Only add back to the queue if folio is partially mapped.
 		 * If thp_underused returns false, or if split_folio fails
 		 * in the case it was underused, then consider it used and
 		 * don't add it back to split_queue.
 		 */
-		if (did_split) {
-			; /* folio already removed from list */
-		} else if (!folio_test_partially_mapped(folio)) {
-			list_del_init(&folio->_deferred_list);
-			removed++;
-		} else {
-			/*
-			 * That unlocked list_del_init() above would be unsafe,
-			 * unless its folio is separated from any earlier folios
-			 * left on the list (which may be concurrently unqueued)
-			 * by one safe folio with refcount still raised.
-			 */
-			swap(folio, prev);
-		}
-		if (folio)
-			folio_put(folio);
+		fqueue = folio_split_queue_lock_irqsave(folio, &flags);
+		list_add_tail(&folio->_deferred_list, &fqueue->split_queue);
+		fqueue->split_queue_len++;
+		split_queue_unlock_irqrestore(fqueue, flags);
 	}
+	folios_put(&fbatch);
 
-	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
-	list_splice_tail(&list, &ds_queue->split_queue);
-	ds_queue->split_queue_len -= removed;
-	split_queue_unlock_irqrestore(ds_queue, flags);
-
-	if (prev)
-		folio_put(prev);
-
+	if (!done)
+		goto retry;
 	/*
 	 * Stop shrinker if we didn't split any page, but the queue is empty.
 	 * This can happen if pages were freed under us.
-- 
2.20.1

