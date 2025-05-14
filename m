Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159D8296D28
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253905; cv=none; b=OyUPhU1XBMBEDKAW0JamIW9w2Au7dHoqhBTBTqKSUcKdrKmKtn8SVPPZP1mvS7XGCdkuZ/TEcSN9b84HBLysCSsyN9IHbt8rxOoXJI/efySx/3sYAhdjHjxI1ohmiWrl0t2wc9FWCw8orUR5ShROqpYoOSGsVZfa8CMjYfMj1OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253905; c=relaxed/simple;
	bh=jv3a0u4i4OezPCVaylwgnJvBZUQaOgVG08kC5zKrUXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N1mCkn/IgLbQc9L1jiFMS7ApYb/MfUoOc66jTAgrMKCuRcOX9nP/LxXmMQjkruUrGBFmF1MVnE++2Oro72WofmdN0kq1+S7fOni0opEPzKJCnvMyYkABH+Oh3GdyrWEUM+hIY6/oJVjhh4qSoma48SrvathtVrWvrY6PZxY7FrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwPAYGxI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwPAYGxI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30c7306890dso339966a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253901; x=1747858701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ItkUODB2Dv9WlomSi6a+hzarpKB44t5hUIjJHe4HUE=;
        b=DwPAYGxI01Iij4o430JkQuCfwiAZ3teyU2L+ucv9lkQUL/irNtz62KHkEbJ3l78wak
         o6/aIlTCXrYKe0pJ7wUyQPuq6oSm9+GjfEole0nBLfENR3s+haiINq552EnB0pnWugjo
         8AMcR7Yx26jPHaL1tJjMGjVlCRekd8nMcOy321lf2H/Wp2+xDnd7AB6UEMafuaPUx6E0
         Bc6GrmLmHSArillvseHuUuTzFbHxE98rBtOxNFceV6VMarAJK/bgjqOJwZ6O65+8dzv2
         v98DhCsayYUi0Ifw4X9lJ8Kau1zA/UO6FMSAW7um3OZMWfKe4NbcoYyERT9old7Dqu8V
         y3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253901; x=1747858701;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ItkUODB2Dv9WlomSi6a+hzarpKB44t5hUIjJHe4HUE=;
        b=kVmLBnWbVRNrwMcX/AxDZhTTRBLW7e0E3+HPX1uePfm3IWUmGguZLt7eE34ULqR9HB
         MD68M1+1bWoSpQteM2olhVBQuOYjR5pmARYDiI9rodrE3/crHS6NLHYDARiZTg+Hxsxy
         hUy5cOWFQw5JszpQApSmk5PAcOTJ7xmKHxZOloDb1vq4I++o6VbQakHzwAxuFnsqRFqI
         FdnSEDcD4v3hjcT2LdEwsWsUy0EI5ULsXAC3XxK4qbSYTN4p6us3vWU3Uk3rHK7OCJRF
         ULxgFRvQ5p4I/PFaoj5qQvnjZDVqwKA4XdM+/pHEP/Lwibcuu0mxPVM2wEV/nPUCYZk7
         3G3g==
X-Forwarded-Encrypted: i=1; AJvYcCUm1bow4ZwTdeSKyUEuevgSx0MDuvABij8PWoZCR0FjuP5+71/Eok6C/VW+F813ZbuOubYkemL1KY6mRgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkYHccHSwMe1h6jPOpDUx5abGolYSK2nCQueQQ9VejtwE22OuM
	mnupCg6rVQFHzLCRrHWvFmUPOr5U7jYNYQWm5J0iY49P/s2aDlpa
X-Gm-Gg: ASbGncu3c5Yk5TeT7wceZr28kQhlXbxWUKqXZO0Qh47s6UFrVxCZgkHLIS9S0UJ2Fbg
	FdOB0xvZtGy9s/z8cHffGwscJdoHPysDX8xf98NGovAn3vdpCSR4K7uaBgD6BwdCrcrPI6LVuSY
	fLc7dvp/Fwe6dFXJBQYJZ8jYOa6irlJ8bKNXXbSRrbcCJ65229VaPwS+K2OKirUHRRbnltt1V/H
	Yx6rm4GXEocggMY9HQBXam1wGEIo5mYHT4lss5Hi0A7VQQokGRMB96AMTf2gwMgDfXMYV/X6RLe
	5QMFqEhWU8ImmuBX+vAaxb0PmFDZ5J0HlSbVx8T5gqnp5h17JIC7PKHY8d8/2JT3RSJQ9Rjs
X-Google-Smtp-Source: AGHT+IEuJZsTAG3RG1CYP1QedhwIcKfaoboHEyCo1O9yXLAnU5HcdezmL75B4d42FJuWpW+Dyz+obw==
X-Received: by 2002:a17:90b:2585:b0:2ff:6167:e92d with SMTP id 98e67ed59e1d1-30e2e641ad2mr6920941a91.32.1747253900842;
        Wed, 14 May 2025 13:18:20 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:19 -0700 (PDT)
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
Subject: [PATCH 08/28] mm, swap: use swap table for the swap cache and switch API
Date: Thu, 15 May 2025 04:17:08 +0800
Message-ID: <20250514201729.48420-9-ryncsn@gmail.com>
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

Introduce basic swap table infrastructures, which is now just a
fix-sized flat array inside each swap cluster, with access wrappers.

Each table entry is an opaque atomic long, which could be in 3 types:
a shadow type (XA_VALUE), a folio type (pointer), or NULL.

In this first step, it only supports storing a folio or shadow, and
it is a drop-in replacement for the swap cache's underlying structure.

This commit converts all swap cache users to use new sets of APIs.
Swap cache lookups (swap_cache_get_*) are still lock-less and require a
pin on the swap device to prevent the memory from being freed, which
is unchanged as before.

All swap cache updates will now be protected by the swap cluster lock,
which is either handled by the new helpers internally, or the caller
has to lock the cluster before using __swap_cache_* functions. The
cluster lock also replaces where Xarray locks were used.

At this point it looks like just a downgrade from Xarray to flat array.
Later commits will implement a fully cluster based unified swap table,
with dynamic allocation, which should reduce the memory usage while
making the performance even better.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/swap.h |   2 -
 mm/filemap.c         |  20 +--
 mm/huge_memory.c     |  20 ++-
 mm/memory.c          |   2 +-
 mm/migrate.c         |  28 ++--
 mm/shmem.c           |  25 +---
 mm/swap.h            | 133 +++++++++++++------
 mm/swap_state.c      | 308 +++++++++++++++++++++----------------------
 mm/swap_table.h      | 103 +++++++++++++++
 mm/swapfile.c        | 108 ++++++++-------
 mm/vmscan.c          |  21 ++-
 mm/zswap.c           |   7 +-
 12 files changed, 473 insertions(+), 304 deletions(-)
 create mode 100644 mm/swap_table.h

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 4239852fd203..58230f3e15e6 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -454,8 +454,6 @@ extern int __swap_count(swp_entry_t entry);
 extern bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry);
 extern int swp_swapcount(swp_entry_t entry);
 struct backing_dev_info;
-extern int init_swap_address_space(unsigned int type, unsigned long nr_pages);
-extern void exit_swap_address_space(unsigned int type);
 extern struct swap_info_struct *get_swap_device(swp_entry_t entry);
 sector_t swap_folio_sector(struct folio *folio);
 
diff --git a/mm/filemap.c b/mm/filemap.c
index 09d005848f0d..6840cd817ed3 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -4403,23 +4403,17 @@ static void filemap_cachestat(struct address_space *mapping,
 #ifdef CONFIG_SWAP /* implies CONFIG_MMU */
 			if (shmem_mapping(mapping)) {
 				/* shmem file - in swap cache */
+				struct swap_info_struct *si;
 				swp_entry_t swp = radix_to_swp_entry(folio);
 
-				/* swapin error results in poisoned entry */
-				if (non_swap_entry(swp))
+				/* prevent swapoff from releasing the device */
+				si = get_swap_device(swp);
+				if (!si)
 					goto resched;
 
-				/*
-				 * Getting a swap entry from the shmem
-				 * inode means we beat
-				 * shmem_unuse(). rcu_read_lock()
-				 * ensures swapoff waits for us before
-				 * freeing the swapper space. However,
-				 * we can race with swapping and
-				 * invalidation, so there might not be
-				 * a shadow in the swapcache (yet).
-				 */
-				shadow = get_shadow_from_swap_cache(swp);
+				shadow = swap_cache_get_shadow(swp);
+				put_swap_device(si);
+
 				if (!shadow)
 					goto resched;
 			}
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d3e66136e41a..126cf217293c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3457,9 +3457,9 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		bool uniform_split)
 {
 	struct lruvec *lruvec;
-	struct address_space *swap_cache = NULL;
 	struct folio *origin_folio = folio;
 	struct folio *next_folio = folio_next(folio);
+	struct swap_cluster_info *ci = NULL;
 	struct folio *new_folio;
 	struct folio *next;
 	int order = folio_order(folio);
@@ -3476,8 +3476,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		if (!uniform_split || new_order != 0)
 			return -EINVAL;
 
-		swap_cache = swap_address_space(folio->swap);
-		xa_lock(&swap_cache->i_pages);
+		ci = swap_lock_folio_cluster(folio);
 	}
 
 	if (folio_test_anon(folio))
@@ -3566,7 +3565,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 				continue;
 
 			folio_ref_unfreeze(release, 1 +
-					((mapping || swap_cache) ?
+					((mapping || ci) ?
 						folio_nr_pages(release) : 0));
 
 			lru_add_split_folio(origin_folio, release, lruvec,
@@ -3584,10 +3583,9 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 			} else if (mapping) {
 				__xa_store(&mapping->i_pages,
 						release->index, release, 0);
-			} else if (swap_cache) {
-				__xa_store(&swap_cache->i_pages,
-						swap_cache_index(release->swap),
-						release, 0);
+			} else if (ci) {
+				__swap_cache_override_folio(ci, release->swap,
+							    origin_folio, release);
 			}
 		}
 	}
@@ -3599,12 +3597,12 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 	 * see stale page cache entries.
 	 */
 	folio_ref_unfreeze(origin_folio, 1 +
-		((mapping || swap_cache) ? folio_nr_pages(origin_folio) : 0));
+		((mapping || ci) ? folio_nr_pages(origin_folio) : 0));
 
 	unlock_page_lruvec(lruvec);
 
-	if (swap_cache)
-		xa_unlock(&swap_cache->i_pages);
+	if (ci)
+		swap_unlock_cluster(ci);
 	if (mapping)
 		xa_unlock(&mapping->i_pages);
 
diff --git a/mm/memory.c b/mm/memory.c
index cc1f6891cf99..f2897d9059f2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4603,7 +4603,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 
 				memcg1_swapin(entry, nr_pages);
 
-				shadow = get_shadow_from_swap_cache(entry);
+				shadow = swap_cache_get_shadow(entry);
 				if (shadow)
 					workingset_refault(folio, shadow);
 
diff --git a/mm/migrate.c b/mm/migrate.c
index 784ac2256d08..dad428b1a78f 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -458,10 +458,10 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 		struct folio *newfolio, struct folio *folio, int expected_count)
 {
 	XA_STATE(xas, &mapping->i_pages, folio_index(folio));
+	struct swap_cluster_info *ci = NULL;
 	struct zone *oldzone, *newzone;
 	int dirty;
 	long nr = folio_nr_pages(folio);
-	long entries, i;
 
 	if (!mapping) {
 		/* Take off deferred split queue while frozen and memcg set */
@@ -487,9 +487,16 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 	oldzone = folio_zone(folio);
 	newzone = folio_zone(newfolio);
 
-	xas_lock_irq(&xas);
+	if (folio_test_swapcache(folio))
+		ci = swap_lock_folio_cluster_irq(folio);
+	else
+		xas_lock_irq(&xas);
+
 	if (!folio_ref_freeze(folio, expected_count)) {
-		xas_unlock_irq(&xas);
+		if (ci)
+			swap_unlock_cluster(ci);
+		else
+			xas_unlock_irq(&xas);
 		return -EAGAIN;
 	}
 
@@ -510,9 +517,6 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 	if (folio_test_swapcache(folio)) {
 		folio_set_swapcache(newfolio);
 		newfolio->private = folio_get_private(folio);
-		entries = nr;
-	} else {
-		entries = 1;
 	}
 
 	/* Move dirty while folio refs frozen and newfolio not yet exposed */
@@ -522,11 +526,10 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 		folio_set_dirty(newfolio);
 	}
 
-	/* Swap cache still stores N entries instead of a high-order entry */
-	for (i = 0; i < entries; i++) {
+	if (folio_test_swapcache(folio))
+		WARN_ON_ONCE(__swap_cache_replace_folio(ci, folio->swap, folio, newfolio));
+	else
 		xas_store(&xas, newfolio);
-		xas_next(&xas);
-	}
 
 	/*
 	 * Drop cache reference from old folio by unfreezing
@@ -535,8 +538,11 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 	 */
 	folio_ref_unfreeze(folio, expected_count - nr);
 
-	xas_unlock(&xas);
 	/* Leave irq disabled to prevent preemption while updating stats */
+	if (ci)
+		swap_unlock_cluster(ci);
+	else
+		xas_unlock(&xas);
 
 	/*
 	 * If moved to a different zone then also account
diff --git a/mm/shmem.c b/mm/shmem.c
index 43d9e3bf16f4..0da9e06eaee8 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2009,7 +2009,7 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 	new->swap = entry;
 
 	memcg1_swapin(entry, nr_pages);
-	shadow = get_shadow_from_swap_cache(entry);
+	shadow = swap_cache_get_shadow(entry);
 	if (shadow)
 		workingset_refault(new, shadow);
 	folio_add_lru(new);
@@ -2038,13 +2038,11 @@ static int shmem_replace_folio(struct folio **foliop, gfp_t gfp,
 				struct shmem_inode_info *info, pgoff_t index,
 				struct vm_area_struct *vma)
 {
+	struct swap_cluster_info *ci;
 	struct folio *new, *old = *foliop;
 	swp_entry_t entry = old->swap;
-	struct address_space *swap_mapping = swap_address_space(entry);
-	pgoff_t swap_index = swap_cache_index(entry);
-	XA_STATE(xas, &swap_mapping->i_pages, swap_index);
 	int nr_pages = folio_nr_pages(old);
-	int error = 0, i;
+	int error = 0;
 
 	/*
 	 * We have arrived here because our zones are constrained, so don't
@@ -2073,25 +2071,14 @@ static int shmem_replace_folio(struct folio **foliop, gfp_t gfp,
 	new->swap = entry;
 	folio_set_swapcache(new);
 
-	/* Swap cache still stores N entries instead of a high-order entry */
-	xa_lock_irq(&swap_mapping->i_pages);
-	for (i = 0; i < nr_pages; i++) {
-		void *item = xas_load(&xas);
-
-		if (item != old) {
-			error = -ENOENT;
-			break;
-		}
-
-		xas_store(&xas, new);
-		xas_next(&xas);
-	}
+	ci = swap_lock_folio_cluster_irq(old);
+	error = __swap_cache_replace_folio(ci, entry, old, new);
 	if (!error) {
 		mem_cgroup_replace_folio(old, new);
 		shmem_update_stats(new, nr_pages);
 		shmem_update_stats(old, -nr_pages);
 	}
-	xa_unlock_irq(&swap_mapping->i_pages);
+	swap_unlock_cluster(ci);
 
 	if (unlikely(error)) {
 		/*
diff --git a/mm/swap.h b/mm/swap.h
index 4982e6c2ad95..30cd257aecbb 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -15,6 +15,15 @@ extern int page_cluster;
 
 extern struct swap_info_struct *swap_info[];
 
+/*
+ * A swap table entry represents the status of a swap slot
+ * on a swap (physical or virtual) device. Swap table is a
+ * 1:1 map of the swap device, composed of swap table entries.
+ *
+ * See mm/swap_table.h for details.
+ */
+typedef atomic_long_t swp_te_t;
+
 /*
  * We use this to track usage of a cluster. A cluster is a block of swap disk
  * space with SWAPFILE_CLUSTER pages long and naturally aligns in disk. All
@@ -25,14 +34,11 @@ extern struct swap_info_struct *swap_info[];
  * protected by cluster lock.
  */
 struct swap_cluster_info {
-	spinlock_t lock;	/*
-				 * Protect swap_cluster_info fields
-				 * other than list, and swap_info_struct->swap_map
-				 * elements corresponding to the swap cluster.
-				 */
+	spinlock_t lock; /* Protects all fields below except `list`. */
 	u16 count;
 	u8 flags;
 	u8 order;
+	swp_te_t *table;
 	struct list_head list;
 };
 
@@ -79,21 +85,56 @@ static inline struct swap_cluster_info *swp_offset_cluster(
 	return &si->cluster_info[offset / SWAPFILE_CLUSTER];
 }
 
-static inline struct swap_cluster_info *swap_lock_cluster(
-		struct swap_info_struct *si,
-		unsigned long offset)
+static inline struct swap_cluster_info *swp_cluster(swp_entry_t entry)
+{
+	return swp_offset_cluster(swp_info(entry), swp_offset(entry));
+}
+
+/*
+ * Lock the swap cluster of given offset. Caller must ensure modification
+ * won't cross multiple cluster. swap_lock_folio_cluster is preferred when
+ * with more sanity checks.
+ */
+static inline struct swap_cluster_info *__swap_lock_cluster(
+		struct swap_info_struct *si, unsigned long offset, bool irq)
 {
 	struct swap_cluster_info *ci = swp_offset_cluster(si, offset);
 	VM_WARN_ON_ONCE(percpu_ref_is_zero(&si->users)); /* race with swapoff */
-	spin_lock(&ci->lock);
+	if (irq)
+		spin_lock_irq(&ci->lock);
+	else
+		spin_lock(&ci->lock);
 	return ci;
 }
+#define swap_lock_cluster(si, offset) __swap_lock_cluster(si, offset, false)
+#define swap_lock_cluster_irq(si, offset) __swap_lock_cluster(si, offset, true)
+
+/*
+ * Lock the swap cluster that holds a folio's swap entries. This is safer as a
+ * locked folio in swap cache always have its entry limited in one cluster,
+ * won't be freed, and pins the device.
+ */
+static inline struct swap_cluster_info *__swap_lock_folio_cluster(
+		struct folio *folio, bool irq)
+{
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_swapcache(folio), folio);
+	return __swap_lock_cluster(swp_info(folio->swap),
+				   swp_offset(folio->swap), irq);
+}
+#define swap_lock_folio_cluster(folio) __swap_lock_folio_cluster(folio, false)
+#define swap_lock_folio_cluster_irq(folio) __swap_lock_folio_cluster(folio, true)
 
 static inline void swap_unlock_cluster(struct swap_cluster_info *ci)
 {
 	spin_unlock(&ci->lock);
 }
 
+static inline void swap_unlock_cluster_irq(struct swap_cluster_info *ci)
+{
+	spin_unlock_irq(&ci->lock);
+}
+
 /* linux/mm/page_io.c */
 int sio_pool_init(void);
 struct swap_iocb;
@@ -109,14 +150,27 @@ int swap_writepage(struct page *page, struct writeback_control *wbc);
 void __swap_writepage(struct folio *folio, struct writeback_control *wbc);
 
 /* linux/mm/swap_state.c */
-/* One swap address space for each 64M swap space */
-#define SWAP_ADDRESS_SPACE_SHIFT	14
-#define SWAP_ADDRESS_SPACE_PAGES	(1 << SWAP_ADDRESS_SPACE_SHIFT)
-#define SWAP_ADDRESS_SPACE_MASK		(SWAP_ADDRESS_SPACE_PAGES - 1)
-extern struct address_space *swapper_spaces[];
-#define swap_address_space(entry)			    \
-	(&swapper_spaces[swp_type(entry)][swp_offset(entry) \
-		>> SWAP_ADDRESS_SPACE_SHIFT])
+extern struct address_space swap_space __ro_after_init;
+static inline struct address_space *swap_address_space(swp_entry_t entry)
+{
+	return &swap_space;
+}
+
+/* Below helpers requires the caller to pin the swap device. */
+extern struct folio *swap_cache_get_folio(swp_entry_t entry);
+extern int swap_cache_add_folio(swp_entry_t entry,
+				struct folio *folio, void **shadow);
+extern void *swap_cache_get_shadow(swp_entry_t entry);
+/* Below helpers requires the caller to lock the swap cluster. */
+extern void __swap_cache_del_folio(swp_entry_t entry,
+				   struct folio *folio, void *shadow);
+extern int __swap_cache_replace_folio(struct swap_cluster_info *ci,
+				      swp_entry_t entry, struct folio *old,
+				      struct folio *new);
+extern void __swap_cache_override_folio(struct swap_cluster_info *ci,
+					swp_entry_t entry, struct folio *old,
+					struct folio *new);
+extern void __swap_cache_clear_shadow(swp_entry_t entry, int nr_ents);
 
 /*
  * Return the swap device position of the swap entry.
@@ -131,8 +185,7 @@ static inline loff_t swap_dev_pos(swp_entry_t entry)
  */
 static inline pgoff_t swap_cache_index(swp_entry_t entry)
 {
-	BUILD_BUG_ON((SWP_OFFSET_MASK | SWAP_ADDRESS_SPACE_MASK) != SWP_OFFSET_MASK);
-	return swp_offset(entry) & SWAP_ADDRESS_SPACE_MASK;
+	return swp_offset(entry);
 }
 
 /*
@@ -152,16 +205,8 @@ static inline bool folio_swap_contains(struct folio *folio, swp_entry_t entry)
 }
 
 void show_swap_cache_info(void);
-void *get_shadow_from_swap_cache(swp_entry_t entry);
-int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
-		      gfp_t gfp, void **shadowp);
-void __delete_from_swap_cache(struct folio *folio,
-			      swp_entry_t entry, void *shadow);
 void delete_from_swap_cache(struct folio *folio);
-void clear_shadow_from_swap_cache(int type, unsigned long begin,
-				  unsigned long end);
 void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr);
-struct folio *swap_cache_get_folio(swp_entry_t entry);
 struct folio *read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		struct vm_area_struct *vma, unsigned long addr,
 		struct swap_iocb **plug);
@@ -207,6 +252,14 @@ static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
 
 #else /* CONFIG_SWAP */
 struct swap_iocb;
+
+#define swap_lock_cluster(si, offset) NULL
+#define swap_lock_cluster_irq(si, offset) NULL
+#define swap_lock_folio_cluster(folio) NULL
+#define swap_lock_folio_cluster_irq(folio) NULL
+#define swap_unlock_cluster(ci) do {} while (0)
+#define swap_unlock_cluster_irq(ci) do {} while (0)
+
 static inline struct swap_info_struct *swp_info(swp_entry_t entry)
 {
 	return NULL;
@@ -269,28 +322,34 @@ static inline struct folio *swap_cache_get_folio(swp_entry_t entry)
 	return NULL;
 }
 
-static inline void *get_shadow_from_swap_cache(swp_entry_t entry)
+static inline int swap_cache_add_folio(swp_entry_t end, struct folio *folio, void **shadow)
 {
-	return NULL;
+	return -EINVAL;
 }
 
-static inline int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
-					gfp_t gfp_mask, void **shadowp)
+static inline void __swap_cache_del_folio(swp_entry_t entry, struct folio *folio, void *shadow)
 {
-	return -1;
 }
 
-static inline void __delete_from_swap_cache(struct folio *folio,
-					swp_entry_t entry, void *shadow)
+static inline int __swap_cache_replace_folio(
+		struct swap_cluster_info *ci, swp_entry_t entry,
+		struct folio *old, struct folio *new)
 {
+	return -EINVAL;
 }
 
-static inline void delete_from_swap_cache(struct folio *folio)
+static inline void __swap_cache_override_folio(
+		struct swap_cluster_info *ci, swp_entry_t entry,
+		struct folio *old, struct folio *new)
 {
 }
 
-static inline void clear_shadow_from_swap_cache(int type, unsigned long begin,
-				unsigned long end)
+static inline void *swap_cache_get_shadow(swp_entry_t end)
+{
+	return NULL;
+}
+
+static inline void delete_from_swap_cache(struct folio *folio)
 {
 }
 
diff --git a/mm/swap_state.c b/mm/swap_state.c
index db9efa64f64e..bef9633533ec 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -23,6 +23,7 @@
 #include <linux/huge_mm.h>
 #include <linux/shmem_fs.h>
 #include "internal.h"
+#include "swap_table.h"
 #include "swap.h"
 
 /*
@@ -37,8 +38,11 @@ static const struct address_space_operations swap_aops = {
 #endif
 };
 
-struct address_space *swapper_spaces[MAX_SWAPFILES] __read_mostly;
-static unsigned int nr_swapper_spaces[MAX_SWAPFILES] __read_mostly;
+/* swap_space is read only as swap cache is handled by swap table */
+struct address_space swap_space __ro_after_init = {
+	.a_ops = &swap_aops,
+};
+
 static bool enable_vma_readahead __read_mostly = true;
 
 #define SWAP_RA_ORDER_CEILING	5
@@ -70,164 +74,187 @@ void show_swap_cache_info(void)
 	printk("Total swap = %lukB\n", K(total_swap_pages));
 }
 
-void *get_shadow_from_swap_cache(swp_entry_t entry)
+/* For huge page splitting, override an old folio with a smaller new one. */
+void __swap_cache_override_folio(struct swap_cluster_info *ci, swp_entry_t entry,
+				 struct folio *old, struct folio *new)
 {
-	struct address_space *address_space = swap_address_space(entry);
-	pgoff_t idx = swap_cache_index(entry);
-	void *shadow;
-
-	shadow = xa_load(&address_space->i_pages, idx);
-	if (xa_is_value(shadow))
-		return shadow;
-	return NULL;
+	pgoff_t offset = swp_offset(entry);
+	pgoff_t end = offset + folio_nr_pages(new);
+
+	VM_WARN_ON_ONCE(entry.val < old->swap.val || entry.val != new->swap.val);
+	VM_WARN_ON_ONCE(!folio_test_locked(old) || !folio_test_locked(new));
+
+	do {
+		VM_WARN_ON_ONCE(swp_te_folio(__swap_table_get(ci, offset)) != old);
+		__swap_table_set_folio(ci, offset, new);
+	} while (++offset < end);
 }
 
-/*
- * add_to_swap_cache resembles filemap_add_folio on swapper_space,
- * but sets SwapCache flag and 'swap' instead of mapping and index.
- */
-int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
-			gfp_t gfp, void **shadowp)
+/* For migration and shmem replacement, replace an old folio with a new one. */
+int __swap_cache_replace_folio(struct swap_cluster_info *ci, swp_entry_t entry,
+			       struct folio *old, struct folio *new)
 {
-	struct address_space *address_space = swap_address_space(entry);
-	pgoff_t idx = swap_cache_index(entry);
-	XA_STATE_ORDER(xas, &address_space->i_pages, idx, folio_order(folio));
-	unsigned long i, nr = folio_nr_pages(folio);
-	void *old;
+	unsigned long nr_pages = folio_nr_pages(old);
+	pgoff_t offset = swp_offset(entry);
+	pgoff_t end = offset + nr_pages;
+
+	VM_WARN_ON_ONCE(entry.val != old->swap.val || entry.val != new->swap.val);
+	VM_WARN_ON_ONCE(!folio_test_locked(old) || !folio_test_locked(new));
 
-	xas_set_update(&xas, workingset_update_node);
+	do {
+		if (swp_te_folio(__swap_table_get(ci, offset)) != old)
+			return -ENOENT;
+		__swap_table_set_folio(ci, offset, new);
+	} while (++offset < end);
+
+	return 0;
+}
+
+int swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
+			 void **shadow)
+{
+	swp_te_t exist;
+	pgoff_t end, start, offset;
+	struct swap_cluster_info *ci;
+	unsigned long nr_pages = folio_nr_pages(folio);
+
+	start = swp_offset(entry);
+	end = start + nr_pages;
 
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_BUG_ON_FOLIO(folio_test_swapcache(folio), folio);
 	VM_BUG_ON_FOLIO(!folio_test_swapbacked(folio), folio);
 
-	folio_ref_add(folio, nr);
+	offset = start;
+	ci = swap_lock_cluster(swp_info(entry), offset);
+	do {
+		exist = __swap_table_get(ci, offset);
+		if (unlikely(swp_te_is_folio(exist)))
+			goto out_failed;
+		if (shadow && swp_te_is_shadow(exist))
+			*shadow = swp_te_shadow(exist);
+		__swap_table_set_folio(ci, offset, folio);
+	} while (++offset < end);
+
+	folio_ref_add(folio, nr_pages);
 	folio_set_swapcache(folio);
 	folio->swap = entry;
+	swap_unlock_cluster(ci);
 
-	do {
-		xas_lock_irq(&xas);
-		xas_create_range(&xas);
-		if (xas_error(&xas))
-			goto unlock;
-		for (i = 0; i < nr; i++) {
-			VM_BUG_ON_FOLIO(xas.xa_index != idx + i, folio);
-			if (shadowp) {
-				old = xas_load(&xas);
-				if (xa_is_value(old))
-					*shadowp = old;
-			}
-			xas_store(&xas, folio);
-			xas_next(&xas);
-		}
-		address_space->nrpages += nr;
-		__node_stat_mod_folio(folio, NR_FILE_PAGES, nr);
-		__lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr);
-unlock:
-		xas_unlock_irq(&xas);
-	} while (xas_nomem(&xas, gfp));
+	node_stat_mod_folio(folio, NR_FILE_PAGES, nr_pages);
+	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr_pages);
 
-	if (!xas_error(&xas))
-		return 0;
+	return 0;
 
-	folio_clear_swapcache(folio);
-	folio_ref_sub(folio, nr);
-	return xas_error(&xas);
+out_failed:
+	/*
+	 * We may lose shadow due to raced swapin, which should be
+	 * fine, caller better keep the previous returned shadow.
+	 */
+	while (offset-- > start)
+		__swap_table_set_shadow(ci, offset, NULL);
+	swap_unlock_cluster(ci);
+
+	return -EEXIST;
 }
 
 /*
- * This must be called only on folios that have
- * been verified to be in the swap cache.
+ * This must be called only on folios that have been verified to
+ * be in the swap cache and locked. It will never put the folio
+ * into the free list, the caller has a reference on the folio.
  */
-void __delete_from_swap_cache(struct folio *folio,
-			swp_entry_t entry, void *shadow)
+void __swap_cache_del_folio(swp_entry_t entry,
+			    struct folio *folio, void *shadow)
 {
-	struct address_space *address_space = swap_address_space(entry);
-	int i;
-	long nr = folio_nr_pages(folio);
-	pgoff_t idx = swap_cache_index(entry);
-	XA_STATE(xas, &address_space->i_pages, idx);
-
-	xas_set_update(&xas, workingset_update_node);
+	swp_te_t exist;
+	pgoff_t offset, start, end;
+	struct swap_info_struct *si;
+	struct swap_cluster_info *ci;
+	unsigned long nr_pages = folio_nr_pages(folio);
 
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_BUG_ON_FOLIO(!folio_test_swapcache(folio), folio);
 	VM_BUG_ON_FOLIO(folio_test_writeback(folio), folio);
 
-	for (i = 0; i < nr; i++) {
-		void *entry = xas_store(&xas, shadow);
-		VM_BUG_ON_PAGE(entry != folio, entry);
-		xas_next(&xas);
-	}
+	start = swp_offset(entry);
+	end = start + nr_pages;
+
+	si = swp_info(entry);
+	ci = swp_offset_cluster(si, start);
+	offset = start;
+	do {
+		exist = __swap_table_get(ci, offset);
+		VM_WARN_ON_ONCE(swp_te_folio(exist) != folio);
+		__swap_table_set_shadow(ci, offset, shadow);
+	} while (++offset < end);
+
 	folio->swap.val = 0;
 	folio_clear_swapcache(folio);
-	address_space->nrpages -= nr;
-	__node_stat_mod_folio(folio, NR_FILE_PAGES, -nr);
-	__lruvec_stat_mod_folio(folio, NR_SWAPCACHE, -nr);
+	node_stat_mod_folio(folio, NR_FILE_PAGES, -nr_pages);
+	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, -nr_pages);
 }
 
-/*
- * Lookup a swap entry in the swap cache. A found folio will be returned
- * unlocked and with its refcount incremented.
- *
- * Caller must hold a reference of the swap device, and check if the
- * returned folio is still valid after locking it (e.g. folio_swap_contains).
- */
-struct folio *swap_cache_get_folio(swp_entry_t entry)
+void delete_from_swap_cache(struct folio *folio)
 {
-	struct folio *folio = filemap_get_folio(swap_address_space(entry),
-						swap_cache_index(entry));
-	if (!IS_ERR(folio))
-		return folio;
-	return NULL;
+	struct swap_cluster_info *ci;
+	swp_entry_t entry = folio->swap;
+
+	ci = swap_lock_cluster(swp_info(entry), swp_offset(entry));
+	__swap_cache_del_folio(entry, folio, NULL);
+	swap_unlock_cluster(ci);
+
+	put_swap_folio(folio, entry);
+	folio_ref_sub(folio, folio_nr_pages(folio));
 }
 
 /*
- * This must be called only on folios that have
- * been verified to be in the swap cache and locked.
- * It will never put the folio into the free list,
- * the caller has a reference on the folio.
+ * Caller must hold a reference on the swap device, and check if the
+ * returned folio is still valid after locking it (e.g. folio_swap_contains).
  */
-void delete_from_swap_cache(struct folio *folio)
+void *swap_cache_get_shadow(swp_entry_t entry)
 {
-	swp_entry_t entry = folio->swap;
-	struct address_space *address_space = swap_address_space(entry);
+	swp_te_t swp_te;
 
-	xa_lock_irq(&address_space->i_pages);
-	__delete_from_swap_cache(folio, entry, NULL);
-	xa_unlock_irq(&address_space->i_pages);
+	pgoff_t offset = swp_offset(entry);
+	swp_te = __swap_table_get(swp_cluster(entry), offset);
 
-	put_swap_folio(folio, entry);
-	folio_ref_sub(folio, folio_nr_pages(folio));
+	return swp_te_is_shadow(swp_te) ? swp_te_shadow(swp_te) : NULL;
 }
 
-void clear_shadow_from_swap_cache(int type, unsigned long begin,
-				unsigned long end)
+void __swap_cache_clear_shadow(swp_entry_t entry, int nr_ents)
 {
-	unsigned long curr = begin;
-	void *old;
+	struct swap_cluster_info *ci;
+	pgoff_t offset = swp_offset(entry), end;
 
-	for (;;) {
-		swp_entry_t entry = swp_entry(type, curr);
-		unsigned long index = curr & SWAP_ADDRESS_SPACE_MASK;
-		struct address_space *address_space = swap_address_space(entry);
-		XA_STATE(xas, &address_space->i_pages, index);
-
-		xas_set_update(&xas, workingset_update_node);
-
-		xa_lock_irq(&address_space->i_pages);
-		xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
-			if (!xa_is_value(old))
-				continue;
-			xas_store(&xas, NULL);
-		}
-		xa_unlock_irq(&address_space->i_pages);
+	ci = swp_offset_cluster(swp_info(entry), offset);
+	end = offset + nr_ents;
+	do {
+		WARN_ON_ONCE(swp_te_is_folio(__swap_table_get(ci, offset)));
+		__swap_table_set_null(ci, offset);
+	} while (++offset < end);
+}
 
-		/* search the next swapcache until we meet end */
-		curr = ALIGN((curr + 1), SWAP_ADDRESS_SPACE_PAGES);
-		if (curr > end)
-			break;
-	}
+/*
+ * Lookup a swap entry in the swap cache. A found folio will be returned
+ * unlocked and with its refcount incremented.
+ *
+ * Caller must hold a reference of the swap device, and check if the
+ * returned folio is still valid after locking it (e.g. folio_swap_contains).
+ */
+struct folio *swap_cache_get_folio(swp_entry_t entry)
+{
+	swp_te_t swp_te;
+	struct folio *folio;
+	swp_te = __swap_table_get(swp_cluster(entry), swp_offset(entry));
+
+	if (!swp_te_is_folio(swp_te))
+		return NULL;
+
+	folio = swp_te_folio(swp_te);
+	if (!folio_try_get(folio))
+		return NULL;
+
+	return folio;
 }
 
 /*
@@ -387,7 +414,7 @@ struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 			goto put_and_return;
 
 		/*
-		 * We might race against __delete_from_swap_cache(), and
+		 * We might race against __swap_cache_del_folio(), and
 		 * stumble across a swap_map entry whose SWAP_HAS_CACHE
 		 * has not yet been cleared.  Or race against another
 		 * __read_swap_cache_async(), which has set SWAP_HAS_CACHE
@@ -405,8 +432,7 @@ struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 	if (mem_cgroup_swapin_charge_folio(new_folio, NULL, gfp_mask, entry))
 		goto fail_unlock;
 
-	/* May fail (-ENOMEM) if XArray node allocation failed. */
-	if (add_to_swap_cache(new_folio, entry, gfp_mask & GFP_RECLAIM_MASK, &shadow))
+	if (swap_cache_add_folio(entry, new_folio, &shadow))
 		goto fail_unlock;
 
 	memcg1_swapin(entry, 1);
@@ -600,41 +626,6 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t gfp_mask,
 	return folio;
 }
 
-int init_swap_address_space(unsigned int type, unsigned long nr_pages)
-{
-	struct address_space *spaces, *space;
-	unsigned int i, nr;
-
-	nr = DIV_ROUND_UP(nr_pages, SWAP_ADDRESS_SPACE_PAGES);
-	spaces = kvcalloc(nr, sizeof(struct address_space), GFP_KERNEL);
-	if (!spaces)
-		return -ENOMEM;
-	for (i = 0; i < nr; i++) {
-		space = spaces + i;
-		xa_init_flags(&space->i_pages, XA_FLAGS_LOCK_IRQ);
-		atomic_set(&space->i_mmap_writable, 0);
-		space->a_ops = &swap_aops;
-		/* swap cache doesn't use writeback related tags */
-		mapping_set_no_writeback_tags(space);
-	}
-	nr_swapper_spaces[type] = nr;
-	swapper_spaces[type] = spaces;
-
-	return 0;
-}
-
-void exit_swap_address_space(unsigned int type)
-{
-	int i;
-	struct address_space *spaces = swapper_spaces[type];
-
-	for (i = 0; i < nr_swapper_spaces[type]; i++)
-		VM_WARN_ON_ONCE(!mapping_empty(&spaces[i]));
-	kvfree(spaces);
-	nr_swapper_spaces[type] = 0;
-	swapper_spaces[type] = NULL;
-}
-
 static int swap_vma_ra_win(struct vm_fault *vmf, unsigned long *start,
 			   unsigned long *end)
 {
@@ -807,7 +798,7 @@ static const struct attribute_group swap_attr_group = {
 	.attrs = swap_attrs,
 };
 
-static int __init swap_init_sysfs(void)
+static int __init swap_init(void)
 {
 	int err;
 	struct kobject *swap_kobj;
@@ -822,11 +813,12 @@ static int __init swap_init_sysfs(void)
 		pr_err("failed to register swap group\n");
 		goto delete_obj;
 	}
+	mapping_set_no_writeback_tags(&swap_space);
 	return 0;
 
 delete_obj:
 	kobject_put(swap_kobj);
 	return err;
 }
-subsys_initcall(swap_init_sysfs);
+subsys_initcall(swap_init);
 #endif
diff --git a/mm/swap_table.h b/mm/swap_table.h
new file mode 100644
index 000000000000..69a074339444
--- /dev/null
+++ b/mm/swap_table.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _MM_SWAP_TABLE_H
+#define _MM_SWAP_TABLE_H
+
+#include "swap.h"
+
+/*
+ * Swap table entry could be a pointer (folio), a XA_VALUE (shadow), or NULL.
+ */
+
+/*
+ * Helpers for casting one type of info into a swap table entry.
+ */
+static inline swp_te_t null_swp_te(void)
+{
+	swp_te_t swp_te = ATOMIC_LONG_INIT(0);
+	return swp_te;
+}
+
+static inline swp_te_t folio_swp_te(struct folio *folio)
+{
+	BUILD_BUG_ON(sizeof(swp_te_t) != sizeof(void *));
+	swp_te_t swp_te = { .counter = (unsigned long)folio };
+	return swp_te;
+}
+
+static inline swp_te_t shadow_swp_te(void *shadow)
+{
+	BUILD_BUG_ON((BITS_PER_XA_VALUE + 1) !=
+		     BITS_PER_BYTE * sizeof(swp_te_t));
+	VM_WARN_ON_ONCE(shadow && !xa_is_value(shadow));
+	swp_te_t swp_te = { .counter = ((unsigned long)shadow) };
+	return swp_te;
+}
+
+/*
+ * Helpers for swap table entry type checking.
+ */
+static inline bool swp_te_is_null(swp_te_t swp_te)
+{
+	return !swp_te.counter;
+}
+
+static inline bool swp_te_is_folio(swp_te_t swp_te)
+{
+	return !xa_is_value((void *)swp_te.counter) && !swp_te_is_null(swp_te);
+}
+
+static inline bool swp_te_is_shadow(swp_te_t swp_te)
+{
+	return xa_is_value((void *)swp_te.counter);
+}
+
+/*
+ * Helpers for retrieving info from swap table.
+ */
+static inline struct folio *swp_te_folio(swp_te_t swp_te)
+{
+	VM_WARN_ON(!swp_te_is_folio(swp_te));
+	return (void *)swp_te.counter;
+}
+
+static inline void *swp_te_shadow(swp_te_t swp_te)
+{
+	VM_WARN_ON(!swp_te_is_shadow(swp_te));
+	return (void *)swp_te.counter;
+}
+
+/*
+ * Helpers for accessing or modifying the swap table,
+ * the swap cluster must be locked.
+ */
+static inline void __swap_table_set(struct swap_cluster_info *ci, pgoff_t off,
+				    swp_te_t swp_te)
+{
+	atomic_long_set(&ci->table[off % SWAPFILE_CLUSTER], swp_te.counter);
+}
+
+static inline swp_te_t __swap_table_get(struct swap_cluster_info *ci, pgoff_t off)
+{
+	swp_te_t swp_te = {
+		.counter = atomic_long_read(&ci->table[off % SWAPFILE_CLUSTER])
+	};
+	return swp_te;
+}
+
+static inline void __swap_table_set_folio(struct swap_cluster_info *ci, pgoff_t off,
+					  struct folio *folio)
+{
+	__swap_table_set(ci, off, folio_swp_te(folio));
+}
+
+static inline void __swap_table_set_shadow(struct swap_cluster_info *ci, pgoff_t off,
+					   void *shadow)
+{
+	__swap_table_set(ci, off, shadow_swp_te(shadow));
+}
+
+static inline void __swap_table_set_null(struct swap_cluster_info *ci, pgoff_t off)
+{
+	__swap_table_set(ci, off, null_swp_te());
+}
+#endif
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 2f834069b7ad..aaf7d21eaecb 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -46,6 +46,7 @@
 #include <asm/tlbflush.h>
 #include <linux/swapops.h>
 #include <linux/swap_cgroup.h>
+#include "swap_table.h"
 #include "internal.h"
 #include "swap.h"
 
@@ -438,6 +439,30 @@ static void move_cluster(struct swap_info_struct *si,
 	ci->flags = new_flags;
 }
 
+static int cluster_table_alloc(struct swap_cluster_info *ci)
+{
+	WARN_ON(ci->table);
+	ci->table = kzalloc(sizeof(swp_te_t) * SWAPFILE_CLUSTER,
+			    GFP_KERNEL);
+	if (!ci->table)
+		return -ENOMEM;
+	return 0;
+}
+
+static void cluster_table_free(struct swap_cluster_info *ci)
+{
+	unsigned int offset;
+
+	if (!ci->table)
+		return;
+
+	for (offset = 0; offset <= SWAPFILE_CLUSTER; offset++)
+		WARN_ON(!swp_te_is_null(__swap_table_get(ci, offset)));
+
+	kfree(ci->table);
+	ci->table = NULL;
+}
+
 /* Add a cluster to discard list and schedule it to do discard */
 static void swap_cluster_schedule_discard(struct swap_info_struct *si,
 		struct swap_cluster_info *ci)
@@ -582,7 +607,9 @@ static void free_cluster(struct swap_info_struct *si, struct swap_cluster_info *
 static void partial_free_cluster(struct swap_info_struct *si,
 				 struct swap_cluster_info *ci)
 {
-	VM_BUG_ON(!ci->count || ci->count == SWAPFILE_CLUSTER);
+	VM_BUG_ON(!ci->count);
+	VM_BUG_ON(ci->count == SWAPFILE_CLUSTER);
+
 	lockdep_assert_held(&ci->lock);
 
 	if (ci->flags != CLUSTER_FLAG_NONFULL)
@@ -707,6 +734,7 @@ static bool cluster_alloc_range(struct swap_info_struct *si, struct swap_cluster
 				unsigned int order)
 {
 	unsigned int nr_pages = 1 << order;
+	unsigned long offset, end = start + nr_pages;
 
 	lockdep_assert_held(&ci->lock);
 
@@ -720,7 +748,11 @@ static bool cluster_alloc_range(struct swap_info_struct *si, struct swap_cluster
 	if (cluster_is_empty(ci))
 		ci->order = order;
 
-	memset(si->swap_map + start, usage, nr_pages);
+	for (offset = start; offset < end; offset++) {
+		VM_WARN_ON_ONCE(swap_count(si->swap_map[offset]));
+		VM_WARN_ON_ONCE(!swp_te_is_null(__swap_table_get(ci, offset)));
+		si->swap_map[offset] = usage;
+	}
 	swap_range_alloc(si, nr_pages);
 	ci->count += nr_pages;
 
@@ -1070,7 +1102,6 @@ static void swap_range_alloc(struct swap_info_struct *si,
 static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
 			    unsigned int nr_entries)
 {
-	unsigned long begin = offset;
 	unsigned long end = offset + nr_entries - 1;
 	void (*swap_slot_free_notify)(struct block_device *, unsigned long);
 	unsigned int i;
@@ -1089,13 +1120,13 @@ static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
 			si->bdev->bd_disk->fops->swap_slot_free_notify;
 	else
 		swap_slot_free_notify = NULL;
+	__swap_cache_clear_shadow(swp_entry(si->type, offset), nr_entries);
 	while (offset <= end) {
 		arch_swap_invalidate_page(si->type, offset);
 		if (swap_slot_free_notify)
 			swap_slot_free_notify(si->bdev, offset);
 		offset++;
 	}
-	clear_shadow_from_swap_cache(si->type, begin, end);
 
 	/*
 	 * Make sure that try_to_unuse() observes si->inuse_pages reaching 0
@@ -1252,15 +1283,7 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
 	if (!entry.val)
 		return -ENOMEM;
 
-	/*
-	 * XArray node allocations from PF_MEMALLOC contexts could
-	 * completely exhaust the page allocator. __GFP_NOMEMALLOC
-	 * stops emergency reserves from being allocated.
-	 *
-	 * TODO: this could cause a theoretical memory reclaim
-	 * deadlock in the swap out path.
-	 */
-	if (add_to_swap_cache(folio, entry, gfp | __GFP_NOMEMALLOC, NULL))
+	if (swap_cache_add_folio(entry, folio, NULL))
 		goto out_free;
 
 	atomic_long_sub(size, &nr_swap_pages);
@@ -2598,6 +2621,18 @@ static void wait_for_allocation(struct swap_info_struct *si)
 	}
 }
 
+static void free_cluster_info(struct swap_cluster_info *cluster_info,
+			      unsigned long maxpages)
+{
+	int i, nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
+
+	if (!cluster_info)
+		return;
+	for (i = 0; i < nr_clusters; i++)
+		cluster_table_free(&cluster_info[i]);
+	kvfree(cluster_info);
+}
+
 /*
  * Called after swap device's reference count is dead, so
  * neither scan nor allocation will use it.
@@ -2738,6 +2773,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	zeromap = p->zeromap;
 	p->zeromap = NULL;
 	cluster_info = p->cluster_info;
+	free_cluster_info(cluster_info, p->max);
 	p->cluster_info = NULL;
 	spin_unlock(&p->lock);
 	spin_unlock(&swap_lock);
@@ -2748,10 +2784,8 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	p->global_cluster = NULL;
 	vfree(swap_map);
 	kvfree(zeromap);
-	kvfree(cluster_info);
 	/* Destroy swap account information */
 	swap_cgroup_swapoff(p->type);
-	exit_swap_address_space(p->type);
 
 	inode = mapping->host;
 
@@ -3141,15 +3175,18 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
 {
 	unsigned long nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 	struct swap_cluster_info *cluster_info;
-	unsigned long i, j, idx;
 	int err = -ENOMEM;
+	unsigned long i;
 
 	cluster_info = kvcalloc(nr_clusters, sizeof(*cluster_info), GFP_KERNEL);
 	if (!cluster_info)
 		goto err;
 
-	for (i = 0; i < nr_clusters; i++)
+	for (i = 0; i < nr_clusters; i++) {
 		spin_lock_init(&cluster_info[i].lock);
+		if (cluster_table_alloc(&cluster_info[i]))
+			goto err_free;
+	}
 
 	if (!(si->flags & SWP_SOLIDSTATE)) {
 		si->global_cluster = kmalloc(sizeof(*si->global_cluster),
@@ -3184,31 +3221,19 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
 		INIT_LIST_HEAD(&si->frag_clusters[i]);
 	}
 
-	/*
-	 * Reduce false cache line sharing between cluster_info and
-	 * sharing same address space.
-	 */
-	for (j = 0; j < SWAP_CLUSTER_COLS; j++) {
-		for (i = 0; i < DIV_ROUND_UP(nr_clusters, SWAP_CLUSTER_COLS); i++) {
-			struct swap_cluster_info *ci;
-			idx = i * SWAP_CLUSTER_COLS + j;
-			ci = cluster_info + idx;
-			if (idx >= nr_clusters)
-				continue;
-			if (ci->count) {
-				ci->flags = CLUSTER_FLAG_NONFULL;
-				list_add_tail(&ci->list, &si->nonfull_clusters[0]);
-				continue;
-			}
+	for (i = 0; i < nr_clusters; i++) {
+		struct swap_cluster_info *ci = &cluster_info[i];
+		if (ci->count) {
+			ci->flags = CLUSTER_FLAG_NONFULL;
+			list_add_tail(&ci->list, &si->nonfull_clusters[0]);
+		} else {
 			ci->flags = CLUSTER_FLAG_FREE;
 			list_add_tail(&ci->list, &si->free_clusters);
 		}
 	}
-
 	return cluster_info;
-
 err_free:
-	kvfree(cluster_info);
+	free_cluster_info(cluster_info, maxpages);
 err:
 	return ERR_PTR(err);
 }
@@ -3381,13 +3406,9 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		}
 	}
 
-	error = init_swap_address_space(si->type, maxpages);
-	if (error)
-		goto bad_swap_unlock_inode;
-
 	error = zswap_swapon(si->type, maxpages);
 	if (error)
-		goto free_swap_address_space;
+		goto bad_swap_unlock_inode;
 
 	/*
 	 * Flush any pending IO and dirty mappings before we start using this
@@ -3422,8 +3443,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	goto out;
 free_swap_zswap:
 	zswap_swapoff(si->type);
-free_swap_address_space:
-	exit_swap_address_space(si->type);
 bad_swap_unlock_inode:
 	inode_unlock(inode);
 bad_swap:
@@ -3438,7 +3457,8 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	spin_unlock(&swap_lock);
 	vfree(swap_map);
 	kvfree(zeromap);
-	kvfree(cluster_info);
+	if (cluster_info)
+		free_cluster_info(cluster_info, maxpages);
 	if (inced_nr_rotate_swap)
 		atomic_dec(&nr_rotate_swap);
 	if (swap_file)
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 7d6d1ce3921e..7b5f41b4147b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -743,13 +743,19 @@ static int __remove_mapping(struct address_space *mapping, struct folio *folio,
 {
 	int refcount;
 	void *shadow = NULL;
+	struct swap_cluster_info *ci;
 
 	BUG_ON(!folio_test_locked(folio));
 	BUG_ON(mapping != folio_mapping(folio));
 
-	if (!folio_test_swapcache(folio))
+	if (folio_test_swapcache(folio)) {
+		ci = swap_lock_cluster_irq(swp_info(folio->swap),
+					   swp_offset(folio->swap));
+	} else {
 		spin_lock(&mapping->host->i_lock);
-	xa_lock_irq(&mapping->i_pages);
+		xa_lock_irq(&mapping->i_pages);
+	}
+
 	/*
 	 * The non racy check for a busy folio.
 	 *
@@ -789,9 +795,9 @@ static int __remove_mapping(struct address_space *mapping, struct folio *folio,
 
 		if (reclaimed && !mapping_exiting(mapping))
 			shadow = workingset_eviction(folio, target_memcg);
-		__delete_from_swap_cache(folio, swap, shadow);
+		__swap_cache_del_folio(swap, folio, shadow);
 		memcg1_swapout(folio, swap);
-		xa_unlock_irq(&mapping->i_pages);
+		swap_unlock_cluster_irq(ci);
 		put_swap_folio(folio, swap);
 	} else {
 		void (*free_folio)(struct folio *);
@@ -829,9 +835,12 @@ static int __remove_mapping(struct address_space *mapping, struct folio *folio,
 	return 1;
 
 cannot_free:
-	xa_unlock_irq(&mapping->i_pages);
-	if (!folio_test_swapcache(folio))
+	if (folio_test_swapcache(folio)) {
+		swap_unlock_cluster_irq(ci);
+	} else {
+		xa_unlock_irq(&mapping->i_pages);
 		spin_unlock(&mapping->host->i_lock);
+	}
 	return 0;
 }
 
diff --git a/mm/zswap.c b/mm/zswap.c
index 455e9425c5f5..af954bda0b02 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -233,10 +233,13 @@ static bool zswap_has_pool;
 * helpers and fwd declarations
 **********************************/
 
+/* One swap address space for each 64M swap space */
+#define ZSWAP_ADDRESS_SPACE_SHIFT 14
+#define ZSWAP_ADDRESS_SPACE_PAGES (1 << ZSWAP_ADDRESS_SPACE_SHIFT)
 static inline struct xarray *swap_zswap_tree(swp_entry_t swp)
 {
 	return &zswap_trees[swp_type(swp)][swp_offset(swp)
-		>> SWAP_ADDRESS_SPACE_SHIFT];
+		>> ZSWAP_ADDRESS_SPACE_SHIFT];
 }
 
 #define zswap_pool_debug(msg, p)				\
@@ -1741,7 +1744,7 @@ int zswap_swapon(int type, unsigned long nr_pages)
 	struct xarray *trees, *tree;
 	unsigned int nr, i;
 
-	nr = DIV_ROUND_UP(nr_pages, SWAP_ADDRESS_SPACE_PAGES);
+	nr = DIV_ROUND_UP(nr_pages, ZSWAP_ADDRESS_SPACE_PAGES);
 	trees = kvcalloc(nr, sizeof(*tree), GFP_KERNEL);
 	if (!trees) {
 		pr_err("alloc failed, zswap disabled for swap type %d\n", type);
-- 
2.49.0

