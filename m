Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532D7297103
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254007; cv=none; b=jHwez2sqMExofdcyySlrW132ioF4UpmD0XHF8+XjQNWTyziwVgjhLz0iXDUo2XSSpY+rmFQkWBKGZBS5SRM03wR/PGEBb43zPCjKj7f2bnz/2x+cGn/KlfRCatAQeHHscajZNPlMBF4NHAho2g6f5CoFv61cmesy83cSShAHxNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254007; c=relaxed/simple;
	bh=h8N4ZFb0IkrgCLP84Xol2TKhUs+2NZb0XDNF/5+kwbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVKI1SScI/6NACbmALUXSyFuHBjtZHpEENF7Sq6XpfYFiHNBMcR33p67mqCjd79Qz0Ya5WH3QZG91jJmaE6TyfPZScfHZI1OFIkKvA+QVWKWB7NMQAsg23K+nOov4zlCQ1tPauTZJbaweptaFnsrj/fksj/i2GVq/gkL4Vi9tPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5I4syPa; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5I4syPa"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b200047a6a5so1199977a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747254004; x=1747858804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MohF8xjep3EJihAvZbq2d8o4xmfRYk2GxxHVwzr5OhY=;
        b=T5I4syPa2mkfOz33+tI7+CSQAedkKHJ5B51Ty6ynUJA5KeSYmB0jOrxj+Ft4qMBLh6
         80IWRxqAMBNEE0A93/E4JD5r3rnB17uhhSgYmP1ReFPQ5mwKoyP7ha0QqjGkliguosy8
         aCCppbECgzYE7K1utKPrrm+OV4nxq8KDiIjK4MT4/IbUx1wXqkMXZ+vvdmr4xbDFx9BH
         DUD/FaD4yw+T24UkRTe+REMEBsTp+NyUc8J01VGzORGtxFMGipL2OAQH6H6aR4AbnSFe
         sybv1Sb1cm0UDl7VhorEzDIP5abWGmHKQHd2C4STD2VyLpU4l8heTGEiJ7b1jSzg5KHW
         UWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747254004; x=1747858804;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MohF8xjep3EJihAvZbq2d8o4xmfRYk2GxxHVwzr5OhY=;
        b=LbF6Wtlsg5pluN2gvRNaSumhSmcxp79XiPGrMvI5eL19CEThMRI4OVqmS/IUSEfo8D
         LSfoyzt/66ny7VSZgf9bN7FWVqyStKAnORsxdWm5Op1NI5QWIW7Ti4CvrgPOYL4JFgHH
         UarpL6aGoVUxnnGf61wZVRk3t4vqLYv4SNa5MzaMVCYmy5D+YiHB4fMqDIaMMFKPeO9P
         gzP+xBSUkhgpt4NKD60hf65Wo56z+FKViHL44mNiTkfbRLW7Kwyu+NVKW8OUjATd2bT8
         uQE0YakjF4x14yopVPsQCe09fLRVg8knZwIQz4zRk32rdovmZzwRMw3vVSl3EjF5hsBN
         VqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW2IuSZkgLSIy3B1pkrINCCGe+QId2EcqoHejltQgYsCM66GQ7Gt+Piwy6KK4J76DRa3aoeLRL2xNchUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEZuj8YG5Xqv/AIrH1BSH2/rpZVQFOfF1LyCzoxhKBt5HOBEUr
	MczPZU/lqQ3+Ab3/g1Q9dwL03MSxuOXVQzZnIiR4rkParJipI32B
X-Gm-Gg: ASbGnctTw/AFw9SmYNQaT6exGQGOn7UOco+iJnVF6+ftNuZ+KHwYT92YYW+ptk7/Uep
	En6KZfCLQnBpZyqhuAeZVPbxB7171hkH7fOwfEkkJhnY6xSe8MRLuImpV9OJwGd2Xdci1BUY/QU
	9YyyM5zPxxfei0rIg2TLD3aKLwPTAj7yDj2AHMaG0mdezZ8S3SKJuPf5Tq/KMQTOPCozJFSh0ce
	D2T0rPUMgrNiy/ErJMJdtvtfU5t8E5hf2UU+IeaTjpN0HMYa40RrHwr3KwUM6JDpJQqGs0OJnrt
	Yg6OI/g8qiWP5OsL0KNeg+g5wrsT62g42sBXbj0UKRF+j3eryYPY68irI/XZ2/DjmmFByiyA
X-Google-Smtp-Source: AGHT+IE9BVGGBr8b4QTBxIX92j8pKWkNoZc+Iw5IK09BuZF7Akl49Q0ff8mA98Prqc4XhY1G1FhkCg==
X-Received: by 2002:a17:90b:4986:b0:2ff:6e58:89f5 with SMTP id 98e67ed59e1d1-30e4db21a7cmr1411576a91.6.1747254003810;
        Wed, 14 May 2025 13:20:03 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:20:03 -0700 (PDT)
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
Subject: [PATCH 28/28] mm, swap: implement dynamic allocation of swap table
Date: Thu, 15 May 2025 04:17:28 +0800
Message-ID: <20250514201729.48420-29-ryncsn@gmail.com>
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

Now swap table is cluster based, which means free clusters can free its
table since no one should modify it.

There could be speculative readers, like swap cache look up, protect
them by making them RCU safe. All swap table should be filled with null
entries before free, so such readers will either see a NULL pointer or
a null filled table being lazy freed.

On allocation, allocate the table when a cluster is used by any order.

This way, we can reduce the memory usage of large swap device
significantly.

This idea to dynamically release unused swap cluster data was initially
suggested by Chris Li while proposing the cluster swap allocator and
I found it suits the swap table idea very well.

Suggested-by: Chris Li <chrisl@kernel.org>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swap.h       |   8 +-
 mm/swap_state.c |  11 +--
 mm/swap_table.h |  25 ++++-
 mm/swapfile.c   | 241 +++++++++++++++++++++++++++++++++++-------------
 4 files changed, 213 insertions(+), 72 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index 228195e54c9d..dfe9fc1552e8 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -24,6 +24,12 @@ extern struct swap_info_struct *swap_info[];
  */
 typedef atomic_long_t swp_te_t;
 
+/* A typical flat array as swap table */
+struct swap_table_flat {
+	swp_te_t entries[SWAPFILE_CLUSTER];
+	struct rcu_head rcu;
+};
+
 /*
  * We use this to track usage of a cluster. A cluster is a block of swap disk
  * space with SWAPFILE_CLUSTER pages long and naturally aligns in disk. All
@@ -38,7 +44,7 @@ struct swap_cluster_info {
 	u16 count;
 	u8 flags;
 	u8 order;
-	swp_te_t *table;
+	swp_te_t __rcu *table;
 	unsigned long *extend_table; /* Only used for extended swap count */
 	struct list_head list;
 };
diff --git a/mm/swap_state.c b/mm/swap_state.c
index b08d26e7dda5..dd14e110f273 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -163,6 +163,8 @@ struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
 	existing = NULL;
 	si = swp_info(entry);
 	ci = swap_lock_cluster(si, offset);
+	if (!ci->table)
+		goto out_failed;
 	do {
 		exist = __swap_table_get(ci, offset);
 		if (unlikely(swp_te_is_folio(exist))) {
@@ -263,10 +265,8 @@ void __swap_cache_del_folio(swp_entry_t entry,
 void *swap_cache_get_shadow(swp_entry_t entry)
 {
 	swp_te_t swp_te;
-
 	pgoff_t offset = swp_offset(entry);
-	swp_te = __swap_table_get(swp_cluster(entry), offset);
-
+	swp_te = swap_table_try_get(swp_cluster(entry), offset);
 	return swp_te_is_shadow(swp_te) ? swp_te_shadow(swp_te) : NULL;
 }
 
@@ -281,8 +281,7 @@ struct folio *swap_cache_get_folio(swp_entry_t entry)
 {
 	swp_te_t swp_te;
 	struct folio *folio;
-	swp_te = __swap_table_get(swp_cluster(entry), swp_offset(entry));
-
+	swp_te = swap_table_try_get(swp_cluster(entry), swp_offset(entry));
 	if (!swp_te_is_folio(swp_te))
 		return NULL;
 
@@ -300,7 +299,7 @@ struct folio *swap_cache_get_folio(swp_entry_t entry)
 bool swap_cache_check_folio(swp_entry_t entry)
 {
 	swp_te_t swp_te;
-	swp_te = __swap_table_get(swp_cluster(entry), swp_offset(entry));
+	swp_te = swap_table_try_get(swp_cluster(entry), swp_offset(entry));
 	return swp_te_is_folio(swp_te);
 }
 
diff --git a/mm/swap_table.h b/mm/swap_table.h
index afb2953d408a..6f0b80fee03c 100644
--- a/mm/swap_table.h
+++ b/mm/swap_table.h
@@ -2,6 +2,7 @@
 #ifndef _MM_SWAP_TABLE_H
 #define _MM_SWAP_TABLE_H
 
+#include <linux/rcupdate.h>
 #include "swap.h"
 
 /*
@@ -161,13 +162,31 @@ static inline void __swap_table_set(struct swap_cluster_info *ci, pgoff_t off,
 				    swp_te_t swp_te)
 {
 	atomic_long_set(&ci->table[off % SWAPFILE_CLUSTER], swp_te.counter);
+	lockdep_assert_held(&ci->lock);
+	swp_te_t *table = rcu_dereference_protected(ci->table, true);
+	atomic_long_set(&table[off % SWAPFILE_CLUSTER], swp_te.counter);
+}
+
+static inline swp_te_t swap_table_try_get(struct swap_cluster_info *ci, pgoff_t off)
+{
+	swp_te_t swp_te;
+	rcu_read_lock();
+	swp_te_t *table = rcu_dereference_check(ci->table,
+						lockdep_is_held(&ci->lock));
+	if (table)
+		swp_te.counter = atomic_long_read(&table[off % SWAPFILE_CLUSTER]);
+	else
+		swp_te = null_swp_te();
+	rcu_read_unlock();
+	return swp_te;
 }
 
 static inline swp_te_t __swap_table_get(struct swap_cluster_info *ci, pgoff_t off)
 {
-	swp_te_t swp_te = {
-		.counter = atomic_long_read(&ci->table[off % SWAPFILE_CLUSTER])
-	};
+	swp_te_t swp_te;
+	swp_te_t *table = rcu_dereference_check(ci->table,
+						lockdep_is_held(&ci->lock));
+	swp_te.counter = atomic_long_read(&table[off % SWAPFILE_CLUSTER]);
 	return swp_te;
 }
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 17b592e938bc..b2d2d501ef8e 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -101,6 +101,8 @@ static DEFINE_SPINLOCK(swap_avail_lock);
 
 struct swap_info_struct *swap_info[MAX_SWAPFILES];
 
+static struct kmem_cache *swap_table_cachep;
+
 static DEFINE_MUTEX(swapon_mutex);
 
 static DECLARE_WAIT_QUEUE_HEAD(proc_poll_wait);
@@ -373,6 +375,11 @@ static inline bool cluster_is_discard(struct swap_cluster_info *info)
 	return info->flags == CLUSTER_FLAG_DISCARD;
 }
 
+static inline bool cluster_need_populate(struct swap_cluster_info *ci)
+{
+	return rcu_access_pointer(ci->table) == NULL;
+}
+
 static inline bool cluster_is_usable(struct swap_cluster_info *ci, int order)
 {
 	if (unlikely(ci->flags > CLUSTER_FLAG_USABLE))
@@ -412,17 +419,22 @@ static void move_cluster(struct swap_info_struct *si,
 	ci->flags = new_flags;
 }
 
-static int cluster_table_alloc(struct swap_cluster_info *ci)
+/* Allocate tables for reserved (bad) entries */
+static int cluster_populate_init_table(struct swap_cluster_info *ci)
 {
-	WARN_ON(ci->table);
-	ci->table = kzalloc(sizeof(swp_te_t) * SWAPFILE_CLUSTER,
-			    GFP_KERNEL);
-	if (!ci->table)
-		return -ENOMEM;
+	void *table;
+
+	if (!ci->table) {
+		table = kmem_cache_zalloc(swap_table_cachep, GFP_KERNEL);
+		if (!table)
+			return -ENOMEM;
+		rcu_assign_pointer(ci->table, table);
+	}
+
 	return 0;
 }
 
-static void cluster_table_free(struct swap_cluster_info *ci)
+static void cluster_free_init_table(struct swap_cluster_info *ci)
 {
 	swp_te_t swp_te;
 	unsigned int offset;
@@ -431,12 +443,36 @@ static void cluster_table_free(struct swap_cluster_info *ci)
 		return;
 
 	for (offset = 0; offset <= SWAPFILE_CLUSTER; offset++) {
-		swp_te = __swap_table_get(ci, offset);
+		swp_te = swap_table_try_get(ci, offset);
 		WARN_ON_ONCE(!swp_te_is_null(swp_te) && !swp_te_is_bad(swp_te));
 	}
 
+	rcu_assign_pointer(ci->table, NULL);
 	kfree(ci->table);
-	ci->table = NULL;
+}
+
+static void cluster_populate(struct swap_cluster_info *ci, void *alloced)
+{
+	VM_WARN_ON_ONCE(!cluster_is_empty(ci));
+	VM_WARN_ON_ONCE(!cluster_need_populate(ci));
+	rcu_assign_pointer(ci->table, alloced);
+}
+
+static void swap_table_flat_free(struct swap_table_flat *table)
+{
+	unsigned int offset;
+
+	for (offset = 0; offset < SWAPFILE_CLUSTER; offset++)
+		WARN_ON_ONCE(!swp_te_is_null(table->entries[offset]));
+
+	kmem_cache_free(swap_table_cachep, table);
+}
+
+static void swap_table_flat_free_cb(struct rcu_head *head)
+{
+	struct swap_table_flat *table;
+	table = container_of(head, struct swap_table_flat, rcu);
+	swap_table_flat_free(table);
 }
 
 /* Add a cluster to discard list and schedule it to do discard */
@@ -450,7 +486,13 @@ static void swap_cluster_schedule_discard(struct swap_info_struct *si,
 
 static void __free_cluster(struct swap_info_struct *si, struct swap_cluster_info *ci)
 {
+	struct swap_table_flat *table;
 	lockdep_assert_held(&ci->lock);
+
+	table = (void *)rcu_access_pointer(ci->table);
+	rcu_assign_pointer(ci->table, NULL);
+	call_rcu(&table->rcu, swap_table_flat_free_cb);
+
 	move_cluster(si, ci, &si->free_clusters, CLUSTER_FLAG_FREE);
 	ci->order = 0;
 }
@@ -470,10 +512,6 @@ static struct swap_cluster_info *isolate_lock_cluster(
 	struct swap_cluster_info *ci, *ret = NULL;
 
 	spin_lock(&si->lock);
-
-	if (unlikely(!(si->flags & SWP_WRITEOK)))
-		goto out;
-
 	list_for_each_entry(ci, list, list) {
 		if (!spin_trylock(&ci->lock))
 			continue;
@@ -488,12 +526,73 @@ static struct swap_cluster_info *isolate_lock_cluster(
 		ret = ci;
 		break;
 	}
-out:
 	spin_unlock(&si->lock);
 
 	return ret;
 }
 
+/* Free cluster need to be populated before use. */
+static struct swap_cluster_info *isolate_lock_free_cluster(
+		struct swap_info_struct *si, int order)
+{
+	struct list_head *free_clusters = &si->free_clusters;
+	struct swap_cluster_info *ci, *ret = NULL;
+	void *table;
+
+	if (list_empty(free_clusters))
+		return NULL;
+
+	table = kmem_cache_zalloc(swap_table_cachep, GFP_ATOMIC);
+	if (!table) {
+		if (!(si->flags & SWP_SOLIDSTATE))
+			spin_unlock(&si->global_cluster_lock);
+		local_unlock(&percpu_swap_cluster.lock);
+
+		table = kmem_cache_zalloc(swap_table_cachep, GFP_KERNEL);
+
+		local_lock(&percpu_swap_cluster.lock);
+		if (!(si->flags & SWP_SOLIDSTATE))
+			spin_lock(&si->global_cluster_lock);
+
+		/*
+		 * If migrated to a new CPU with usable local cluster,
+		 * use that instead to prevent contention and fragmentation.
+		 */
+		if (this_cpu_read(percpu_swap_cluster.offset[order])) {
+			if (table)
+				kmem_cache_free(swap_table_cachep, table);
+			return ERR_PTR(-EAGAIN);
+		}
+		if (!table)
+			return ERR_PTR(-ENOMEM);
+	}
+
+	spin_lock(&si->lock);
+	list_for_each_entry(ci, &si->free_clusters, list) {
+		if (!spin_trylock(&ci->lock))
+			continue;
+		list_del(&ci->list);
+
+		VM_WARN_ON_ONCE(ci->flags != CLUSTER_FLAG_FREE);
+		cluster_populate(ci, table);
+		/*
+		 * Set order here, the cluster will surely be used unless
+		 * raced with swapoff (!SWP_WRITEOK), in that case it will
+		 * be freed again by relocate_cluster (may lead to discard
+		 * on empty space, but that's a really rare case).
+		 */
+		ci->order = order;
+		ci->flags = CLUSTER_FLAG_NONE;
+		ret = ci;
+		break;
+	}
+	spin_unlock(&si->lock);
+
+	if (!ret)
+		kmem_cache_free(swap_table_cachep, table);
+	return ret;
+}
+
 /*
  * Doing discard actually. After a cluster discard is finished, the cluster
  * will be added to free cluster list. Discard cluster is a bit special as
@@ -648,7 +747,7 @@ static bool cluster_reclaim_range(struct swap_info_struct *si,
 
 	spin_unlock(&ci->lock);
 	do {
-		entry = __swap_table_get(ci, offset);
+		entry = swap_table_try_get(ci, offset);
 		if (swp_te_get_count(entry))
 			break;
 		nr_reclaim = __try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
@@ -663,7 +762,7 @@ static bool cluster_reclaim_range(struct swap_info_struct *si,
 	 * could have been be freed while we are not holding the lock.
 	 */
 	for (offset = start; offset < end; offset++) {
-		entry = __swap_table_get(ci, offset);
+		entry = swap_table_try_get(ci, offset);
 		if (!swp_te_is_null(entry))
 			return false;
 	}
@@ -710,14 +809,10 @@ static bool cluster_alloc_range(struct swap_info_struct *si,
 	swp_entry_t entry = swp_entry(si->type, offset);
 	unsigned long nr_pages = 1 << order;
 
+	VM_WARN_ON_ONCE(ci->order != order && order);
+
 	if (!(si->flags & SWP_WRITEOK))
 		return false;
-	/*
-	 * The first allocation in a cluster makes the
-	 * cluster exclusive to this order
-	 */
-	if (cluster_is_empty(ci))
-		ci->order = order;
 
 	swap_range_alloc(si, nr_pages);
 	ci->count += nr_pages;
@@ -735,12 +830,12 @@ static bool cluster_alloc_range(struct swap_info_struct *si,
 }
 
 /* Try use a new cluster for current CPU and allocate from it. */
-static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
-					    struct swap_cluster_info *ci,
-					    struct folio *folio,
-					    unsigned long offset)
+static long alloc_swap_scan_cluster(struct swap_info_struct *si,
+				    struct swap_cluster_info *ci,
+				    struct folio *folio,
+				    unsigned long offset)
 {
-	unsigned int next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	long next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 	unsigned long start = ALIGN_DOWN(offset, SWAPFILE_CLUSTER);
 	unsigned long end = min(start + SWAPFILE_CLUSTER, si->max);
 	unsigned int order = folio ? folio_order(folio) : 0;
@@ -759,16 +854,16 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 		if (need_reclaim) {
 			ret = cluster_reclaim_range(si, ci, offset, offset + nr_pages);
 			/*
-			 * Reclaim drops ci->lock and cluster could be used
-			 * by another order. Not checking flag as off-list
-			 * cluster has no flag set, and change of list
-			 * won't cause fragmentation.
+			 * Reclaim drops ci->lock and cluster could be modified
+			 * by others. Need to check the cluster status.
 			 */
+			if (cluster_is_empty(ci)) {
+				found = -EAGAIN;
+				goto out;
+			}
 			if (!cluster_is_usable(ci, order))
 				goto out;
-			if (cluster_is_empty(ci))
-				offset = start;
-			/* Reclaim failed but cluster is usable, try next */
+			/* Reclaim failed but cluster is still usable, go on */
 			if (!ret)
 				continue;
 		}
@@ -809,7 +904,7 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 		to_scan--;
 
 		while (offset < end) {
-			entry = __swap_table_get(ci, offset);
+			entry = swap_table_try_get(ci, offset);
 			if (swp_te_is_folio(entry) && !swp_te_get_count(entry)) {
 				spin_unlock(&ci->lock);
 				nr_reclaim = __try_to_reclaim_swap(si, offset,
@@ -851,7 +946,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 {
 	struct swap_cluster_info *ci;
 	unsigned int order = folio ? folio_order(folio) : 0;
-	unsigned int offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	unsigned long offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 
 	/*
 	 * Swapfile is not block device so unable
@@ -866,10 +961,8 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 		offset = si->global_cluster->next[order];
 
 		ci = swap_lock_cluster(si, offset);
-		/* Cluster could have been used by another order */
-		if (cluster_is_usable(ci, order)) {
-			if (cluster_is_empty(ci))
-				offset = cluster_offset(si, ci);
+		/* Cluster could have been modified by another order */
+		if (cluster_is_usable(ci, order) && !cluster_is_empty(ci)) {
 			found = alloc_swap_scan_cluster(si, ci, folio, offset);
 		} else {
 			swap_unlock_cluster(ci);
@@ -879,8 +972,8 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	}
 
 new_cluster:
-	ci = isolate_lock_cluster(si, &si->free_clusters);
-	if (ci) {
+	ci = isolate_lock_free_cluster(si, order);
+	if (!IS_ERR_OR_NULL(ci)) {
 		found = alloc_swap_scan_cluster(si, ci, folio, cluster_offset(si, ci));
 		if (found)
 			goto done;
@@ -941,8 +1034,13 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 		}
 	}
 done:
+	/* The unlocked reclaim may release a complete new cluster */
+	if (found == -EAGAIN)
+		goto new_cluster;
+
 	if (!(si->flags & SWP_SOLIDSTATE))
 		spin_unlock(&si->global_cluster_lock);
+
 	return found;
 }
 
@@ -1143,13 +1241,17 @@ static bool swap_alloc_fast(struct folio *folio)
 	if (!si || !offset || !get_swap_device_info(si))
 		return false;
 
+	/*
+	 * Don't use non usable cluster, and don't use empty cluster
+	 * either. Empty cluster need to be populated before use.
+	 */
 	ci = swap_lock_cluster(si, offset);
-	if (cluster_is_usable(ci, order)) {
-		if (cluster_is_empty(ci))
-			offset = cluster_offset(si, ci);
+	if (cluster_is_usable(ci, order) && !cluster_is_empty(ci)) {
 		alloc_swap_scan_cluster(si, ci, folio, offset);
 	} else {
 		swap_unlock_cluster(ci);
+		this_cpu_write(percpu_swap_cluster.offset[order],
+			       SWAP_ENTRY_INVALID);
 	}
 	put_swap_device(si);
 	return folio->swap.val != SWAP_ENTRY_INVALID;
@@ -1634,10 +1736,11 @@ bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry)
 {
 	pgoff_t offset = swp_offset(entry);
 	struct swap_cluster_info *ci;
-	swp_te_t swp_te;
+	swp_te_t swp_te = null_swp_te();
 
 	ci = swap_lock_cluster(si, offset);
-	swp_te = __swap_table_get(ci, offset);
+	if (ci->table)
+		swp_te = __swap_table_get(ci, offset);
 	swap_unlock_cluster(ci);
 
 	return __swp_te_is_countable(swp_te) && swp_te_get_count(swp_te);
@@ -1651,7 +1754,7 @@ int swp_swapcount(swp_entry_t entry)
 {
 	struct swap_info_struct *si;
 	struct swap_cluster_info *ci;
-	swp_te_t ste;
+	swp_te_t ste = null_swp_te();
 	pgoff_t offset;
 	int count;
 
@@ -1661,7 +1764,8 @@ int swp_swapcount(swp_entry_t entry)
 
 	offset = swp_offset(entry);
 	ci = swap_lock_cluster(si, offset);
-	ste = __swap_table_get(ci, offset);
+	if (ci->table)
+		ste = __swap_table_get(ci, offset);
 	count = swp_te_get_count(ste);
 	if (count == ENTRY_COUNT_MAX)
 		count = ci->extend_table[offset % SWAPFILE_CLUSTER];
@@ -1681,6 +1785,8 @@ static bool swap_page_trans_huge_swapped(struct swap_info_struct *si,
 	bool ret = false;
 
 	ci = swap_lock_cluster(si, offset);
+	if (!ci->table)
+		return false;
 	if (nr_pages == 1) {
 		if (swp_te_get_count(__swap_table_get(ci, roffset)))
 			ret = true;
@@ -1807,7 +1913,7 @@ void do_put_swap_entries(swp_entry_t entry, int nr)
 	 */
 	for (offset = start_offset; offset < end_offset; offset += nr) {
 		nr = 1;
-		swp_te = __swap_table_get(swp_offset_cluster(si, offset), offset);
+		swp_te = swap_table_try_get(swp_offset_cluster(si, offset), offset);
 		if (swp_te_is_folio(swp_te) && !swp_te_get_count(swp_te)) {
 			/*
 			 * Folios are always naturally aligned in swap so
@@ -2127,7 +2233,7 @@ static int unuse_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 						&vmf);
 		}
 		if (!folio) {
-			swp_count = swp_te_get_count(__swap_table_get(swp_cluster(entry),
+			swp_count = swp_te_get_count(swap_table_try_get(swp_cluster(entry),
 						     swp_offset(entry)));
 			if (swp_count == 0 || swp_count == SWAP_MAP_BAD)
 				continue;
@@ -2278,7 +2384,7 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 	 * allocations from this area (while holding swap_lock).
 	 */
 	for (i = prev + 1; i < si->max; i++) {
-		swp_te = __swap_table_get(swp_offset_cluster(si, i), i);
+		swp_te = swap_table_try_get(swp_offset_cluster(si, i), i);
 		if (!swp_te_is_null(swp_te) && !swp_te_is_bad(swp_te))
 			break;
 		if ((i % LATENCY_LIMIT) == 0)
@@ -2651,11 +2757,11 @@ static void free_swap_cluster_info(struct swap_cluster_info *cluster_info,
 				   unsigned long max)
 {
 	int i, nr_clusters = DIV_ROUND_UP(max, SWAPFILE_CLUSTER);
-	if (!cluster_info)
+
+	if (!cluster_info || WARN_ON(!nr_clusters))
 		return;
-	VM_WARN_ON(!nr_clusters);
 	for (i = 0; i < nr_clusters; i++)
-		cluster_table_free(&cluster_info[i]);
+		cluster_free_init_table(&cluster_info[i]);
 	kvfree(cluster_info);
 }
 
@@ -3147,6 +3253,7 @@ static int setup_swap_map_and_extents(struct swap_info_struct *si,
 					unsigned long maxpages,
 					sector_t *span)
 {
+	struct swap_cluster_info *ci;
 	unsigned int nr_good_pages;
 	unsigned long i;
 	int nr_extents;
@@ -3158,14 +3265,23 @@ static int setup_swap_map_and_extents(struct swap_info_struct *si,
 		if (page_nr == 0 || page_nr > swap_header->info.last_page)
 			return -EINVAL;
 		if (page_nr < maxpages) {
-			__swap_table_set(&si->cluster_info[page_nr / SWAPFILE_CLUSTER],
-					 page_nr, bad_swp_te());
+			ci = &si->cluster_info[page_nr / SWAPFILE_CLUSTER];
+			if (cluster_populate_init_table(ci))
+				return -ENOMEM;
+			spin_lock(&ci->lock);
+			__swap_table_set(ci, page_nr, bad_swp_te());
+			spin_unlock(&ci->lock);
 			nr_good_pages--;
 		}
 	}
 
 	if (nr_good_pages) {
-		__swap_table_set(&si->cluster_info[0], 0, bad_swp_te());
+		ci = &si->cluster_info[0];
+		if (cluster_populate_init_table(ci))
+			return -ENOMEM;
+		spin_lock(&ci->lock);
+		__swap_table_set(ci, 0, bad_swp_te());
+		spin_unlock(&ci->lock);
 		si->pages = nr_good_pages;
 		nr_extents = setup_swap_extents(si, span);
 		if (nr_extents < 0)
@@ -3199,11 +3315,8 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	if (!cluster_info)
 		goto err;
 
-	for (i = 0; i < nr_clusters; i++) {
+	for (i = 0; i < nr_clusters; i++)
 		spin_lock_init(&cluster_info[i].lock);
-		if (cluster_table_alloc(&cluster_info[i]))
-			goto err_free;
-	}
 
 	if (!(si->flags & SWP_SOLIDSTATE)) {
 		si->global_cluster = kmalloc(sizeof(*si->global_cluster),
@@ -3580,6 +3693,10 @@ static int __init swapfile_init(void)
 
 	swapfile_maximum_size = arch_max_swapfile_size();
 
+	swap_table_cachep = kmem_cache_create("swap_table",
+			    sizeof(struct swap_table_flat),
+			    0, SLAB_PANIC, NULL);
+
 #ifdef CONFIG_MIGRATION
 	if (swapfile_maximum_size >= (1UL << SWP_MIG_TOTAL_BITS))
 		swap_migration_ad_supported = true;
-- 
2.49.0

