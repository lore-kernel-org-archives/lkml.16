Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE6212FAB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685190; cv=none; b=KPl/EN9mAEbdHvKkhJB/b+8MixNbUKIXsb5Lt4ujEXcm5Ax7pLnrtWt4tZbmW9PG+tnzjMjEYcfXpR2uRdQ94X1yoCjlMJYXr+IDhwPsxuXIw5ZHaXlJOypd90N/d058v+VJM92NBJsqwZ0xX17Ns2yv8aXKmZDzz7mLCKDSyE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685190; c=relaxed/simple;
	bh=KSYsL4yQvpm1WsPFuKmKy8oc/G+fxWcGcjCz7Keh7Sw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gB2yqsK9h8mKhqz3mq6QRaJpfOkquS7qiQTPoj+2k4P08IPdx23kp0Nb4osfxOSdhMXZGBgOOA+8E5VJdTYA7vp1jlTdZiQE1THy1UNNayXZXeSYcIer5rwa2KuPpsPtsePvqh34csu/GuRhWZNmjf3WS0+nwuOx+x8qtWoYVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=e3BqFIzY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="e3BqFIzY"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22928d629faso48589725ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685188; x=1745289988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVQwnJXLTzf5IbKZLnXsEzmufmqfYmZThSJSPJR5bRg=;
        b=e3BqFIzY01CWcNOElO1Yr2R4D2FKQ+U1QdgGNlKvNqjFd1Xe86t8eEkXlYQu8vGDEq
         KJgDGrTkb7iRM6bgHh92YcVjzjXvO7pmB9WlJEwrUY4BPLTz1JcCxu2jIsrVSvf5XWC/
         5NiokEcZ+pAiM5etuNhtXzv2TYVB/FIgvt0O9pjGG61Cxl7jSouBCFlRsX8xEY97H2D3
         jSxa25Ixfxjf4coBLNoBp1kwTprrp39A/g8pCE0l0fhKq8w3W51d75lGnSNZg+ZPBves
         7yEdalLPe6lvUbGtRuHbOEejt/2KUhAGOJ6t6E067mS/Sqt8zaP5Y2fxf7T3sUy9ijUM
         9tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685188; x=1745289988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVQwnJXLTzf5IbKZLnXsEzmufmqfYmZThSJSPJR5bRg=;
        b=QzGD9FjjAsArZK6eLX5/eAwgn31nUQLZ2LZu5VQGENEztSUu8SfDza8z9pmXd3tyoa
         SiCCH0PMbeOmhXLLJK4brO0z53f3RbkOeI5B7Yf2B+CA21bY3/DQpaoBT0rmbjpdobG0
         q8R/aQUYjEPi6j9IG5wGNuOsj+Au/nCCS+jo7csptECByop7I/mhZ6D6raaeKXS1EHMw
         u0IVbwGksDNo6xlaXKY+WG3WdiioihJhC42Gn0vplQxFlEUPLIN1GpRC7W72YNhCFhIb
         vZ590HdZUS5cMpsOYQL4qwyliKdOZ6O1GnNSvPVwbUa0vprF5EE8WBvPvxMHlHLkU2vD
         PFEw==
X-Gm-Message-State: AOJu0YytYHuETkUEVnS0Yq4JIGCQ6sLSwdiZwKBxBFbAlEmSaHJV006e
	gMK8NnzUQYGW4LhRI0e4Q9i9vaUYG7j3zuJDnw3DHdIgDub31KGMFmhgvS/7XFM=
X-Gm-Gg: ASbGncuFJOz+YWnhPseD/fO3YyTeGUURgAy+p5G47qSs9xj2sYXVcHJ4LcdKBGxn451
	SQ98yLyIsBzvrLI1O+GgwvrTNPIGNFILMMCs8+iS+5nHBuBxoKoFZwYFpr286rilgjqGA1cmAO4
	L8gNVcd4KVy/f2Ob5ePOwOfoyjI7h9Wg+73JI4018FxPUUpvKnKLp3dwhpmLUacbS7SNnHU7+OF
	I0a5Kethza9q77OmeKGdqzlWJgiYtjypICSmBw5F5M3eHDz+3RDQwk/J/ftSHlgIvFohfCz9sbb
	qgjORlPPJhILbboof4uq9S2PIAmwgjxuDVaHmQvoCkhPReye4U/8yKMIc446G2golPQJi4ex
X-Google-Smtp-Source: AGHT+IH0uXKr0KJ6xOw01dclaGRwapxC+cZ57mqT8VHJVXzMXdBqWXQQ8E+M2n4/a2Vb6fIXE8woqw==
X-Received: by 2002:a17:903:98b:b0:224:1781:a950 with SMTP id d9443c01a7336-22bea4aba54mr197670155ad.14.1744685187749;
        Mon, 14 Apr 2025 19:46:27 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.46.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:46:27 -0700 (PDT)
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
Subject: [PATCH RFC 06/28] mm: thp: introduce folio_split_queue_lock and its variants
Date: Tue, 15 Apr 2025 10:45:10 +0800
Message-Id: <20250415024532.26632-7-songmuchun@bytedance.com>
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

In future memcg removal, the binding between a folio and a memcg may change,
making the split lock within the memcg unstable when held.

A new approach is required to reparent the split queue to its parent. This
patch starts introducing a unified way to acquire the split lock for future
work.

It's a code-only refactoring with no functional changes.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/memcontrol.h |  10 ++++
 mm/huge_memory.c           | 100 +++++++++++++++++++++++++++----------
 2 files changed, 83 insertions(+), 27 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index a045819bcf40..bb4f203733f3 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1639,6 +1639,11 @@ int alloc_shrinker_info(struct mem_cgroup *memcg);
 void free_shrinker_info(struct mem_cgroup *memcg);
 void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id);
 void reparent_shrinker_deferred(struct mem_cgroup *memcg);
+
+static inline int shrinker_id(struct shrinker *shrinker)
+{
+	return shrinker->id;
+}
 #else
 #define mem_cgroup_sockets_enabled 0
 static inline void mem_cgroup_sk_alloc(struct sock *sk) { };
@@ -1652,6 +1657,11 @@ static inline void set_shrinker_bit(struct mem_cgroup *memcg,
 				    int nid, int shrinker_id)
 {
 }
+
+static inline int shrinker_id(struct shrinker *shrinker)
+{
+	return -1;
+}
 #endif
 
 #ifdef CONFIG_MEMCG
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a81e89987ca2..70820fa75c1f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1059,26 +1059,75 @@ pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
 
 #ifdef CONFIG_MEMCG
 static inline
-struct deferred_split *get_deferred_split_queue(struct folio *folio)
+struct mem_cgroup *folio_split_queue_memcg(struct folio *folio,
+					   struct deferred_split *queue)
+{
+	if (mem_cgroup_disabled())
+		return NULL;
+	if (&NODE_DATA(folio_nid(folio))->deferred_split_queue == queue)
+		return NULL;
+	return container_of(queue, struct mem_cgroup, deferred_split_queue);
+}
+
+static inline struct deferred_split *folio_memcg_split_queue(struct folio *folio)
 {
 	struct mem_cgroup *memcg = folio_memcg(folio);
-	struct pglist_data *pgdat = NODE_DATA(folio_nid(folio));
 
-	if (memcg)
-		return &memcg->deferred_split_queue;
-	else
-		return &pgdat->deferred_split_queue;
+	return memcg ? &memcg->deferred_split_queue : NULL;
 }
 #else
 static inline
-struct deferred_split *get_deferred_split_queue(struct folio *folio)
+struct mem_cgroup *folio_split_queue_memcg(struct folio *folio,
+					   struct deferred_split *queue)
 {
-	struct pglist_data *pgdat = NODE_DATA(folio_nid(folio));
+	return NULL;
+}
 
-	return &pgdat->deferred_split_queue;
+static inline struct deferred_split *folio_memcg_split_queue(struct folio *folio)
+{
+	return NULL;
 }
 #endif
 
+static struct deferred_split *folio_split_queue(struct folio *folio)
+{
+	struct deferred_split *queue = folio_memcg_split_queue(folio);
+
+	return queue ? : &NODE_DATA(folio_nid(folio))->deferred_split_queue;
+}
+
+static struct deferred_split *folio_split_queue_lock(struct folio *folio)
+{
+	struct deferred_split *queue;
+
+	queue = folio_split_queue(folio);
+	spin_lock(&queue->split_queue_lock);
+
+	return queue;
+}
+
+static struct deferred_split *
+folio_split_queue_lock_irqsave(struct folio *folio, unsigned long *flags)
+{
+	struct deferred_split *queue;
+
+	queue = folio_split_queue(folio);
+	spin_lock_irqsave(&queue->split_queue_lock, *flags);
+
+	return queue;
+}
+
+static inline void split_queue_unlock(struct deferred_split *queue)
+{
+	spin_unlock(&queue->split_queue_lock);
+}
+
+static inline void split_queue_unlock_irqrestore(struct deferred_split *queue,
+						 unsigned long flags)
+{
+	spin_unlock_irqrestore(&queue->split_queue_lock, flags);
+}
+
 static inline bool is_transparent_hugepage(const struct folio *folio)
 {
 	if (!folio_test_large(folio))
@@ -3723,7 +3772,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct page *lock_at,
 		struct list_head *list, bool uniform_split)
 {
-	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
+	struct deferred_split *ds_queue;
 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
 	bool is_anon = folio_test_anon(folio);
 	struct address_space *mapping = NULL;
@@ -3857,7 +3906,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	}
 
 	/* Prevent deferred_split_scan() touching ->_refcount */
-	spin_lock(&ds_queue->split_queue_lock);
+	ds_queue = folio_split_queue_lock(folio);
 	if (folio_ref_freeze(folio, 1 + extra_pins)) {
 		if (folio_order(folio) > 1 &&
 		    !list_empty(&folio->_deferred_list)) {
@@ -3875,7 +3924,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 			 */
 			list_del_init(&folio->_deferred_list);
 		}
-		spin_unlock(&ds_queue->split_queue_lock);
+		split_queue_unlock(ds_queue);
 		if (mapping) {
 			int nr = folio_nr_pages(folio);
 
@@ -3896,7 +3945,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 				split_at, lock_at, list, end, &xas, mapping,
 				uniform_split);
 	} else {
-		spin_unlock(&ds_queue->split_queue_lock);
+		split_queue_unlock(ds_queue);
 fail:
 		if (mapping)
 			xas_unlock(&xas);
@@ -4050,8 +4099,7 @@ bool __folio_unqueue_deferred_split(struct folio *folio)
 	WARN_ON_ONCE(folio_ref_count(folio));
 	WARN_ON_ONCE(!mem_cgroup_disabled() && !folio_memcg_charged(folio));
 
-	ds_queue = get_deferred_split_queue(folio);
-	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
+	ds_queue = folio_split_queue_lock_irqsave(folio, &flags);
 	if (!list_empty(&folio->_deferred_list)) {
 		ds_queue->split_queue_len--;
 		if (folio_test_partially_mapped(folio)) {
@@ -4062,7 +4110,7 @@ bool __folio_unqueue_deferred_split(struct folio *folio)
 		list_del_init(&folio->_deferred_list);
 		unqueued = true;
 	}
-	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
+	split_queue_unlock_irqrestore(ds_queue, flags);
 
 	return unqueued;	/* useful for debug warnings */
 }
@@ -4070,10 +4118,7 @@ bool __folio_unqueue_deferred_split(struct folio *folio)
 /* partially_mapped=false won't clear PG_partially_mapped folio flag */
 void deferred_split_folio(struct folio *folio, bool partially_mapped)
 {
-	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
-#ifdef CONFIG_MEMCG
-	struct mem_cgroup *memcg = folio_memcg(folio);
-#endif
+	struct deferred_split *ds_queue;
 	unsigned long flags;
 
 	/*
@@ -4096,7 +4141,7 @@ void deferred_split_folio(struct folio *folio, bool partially_mapped)
 	if (folio_test_swapcache(folio))
 		return;
 
-	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
+	ds_queue = folio_split_queue_lock_irqsave(folio, &flags);
 	if (partially_mapped) {
 		if (!folio_test_partially_mapped(folio)) {
 			folio_set_partially_mapped(folio);
@@ -4111,15 +4156,16 @@ void deferred_split_folio(struct folio *folio, bool partially_mapped)
 		VM_WARN_ON_FOLIO(folio_test_partially_mapped(folio), folio);
 	}
 	if (list_empty(&folio->_deferred_list)) {
+		struct mem_cgroup *memcg;
+
+		memcg = folio_split_queue_memcg(folio, ds_queue);
 		list_add_tail(&folio->_deferred_list, &ds_queue->split_queue);
 		ds_queue->split_queue_len++;
-#ifdef CONFIG_MEMCG
 		if (memcg)
 			set_shrinker_bit(memcg, folio_nid(folio),
-					 deferred_split_shrinker->id);
-#endif
+					 shrinker_id(deferred_split_shrinker));
 	}
-	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
+	split_queue_unlock_irqrestore(ds_queue, flags);
 }
 
 static unsigned long deferred_split_count(struct shrinker *shrink,
@@ -4202,7 +4248,7 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
 		if (!--sc->nr_to_scan)
 			break;
 	}
-	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
+	split_queue_unlock_irqrestore(ds_queue, flags);
 
 	list_for_each_entry_safe(folio, next, &list, _deferred_list) {
 		bool did_split = false;
@@ -4251,7 +4297,7 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
 	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
 	list_splice_tail(&list, &ds_queue->split_queue);
 	ds_queue->split_queue_len -= removed;
-	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
+	split_queue_unlock_irqrestore(ds_queue, flags);
 
 	if (prev)
 		folio_put(prev);
-- 
2.20.1

