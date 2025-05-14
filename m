Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A5B296D02
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253898; cv=none; b=n97FXaJpLqEI4GeTs7rUz3sdvhsnFGD+UillluVxU8CtEh3zzvAV6diHTNr8IAk0iutRV+u14eC1i2+XpjN7mTQE9FTzlrWsX9YICOP6tfqZWO82elBgSaEyQuJ2FJLqe4PSxGOMCyBaAlbGG2lrbUmsn2JFRTAP2Q2J9bvGFrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253898; c=relaxed/simple;
	bh=qzHGUX2xX44RO/s8HB0ZlnYj3HkZpu2QEi/YLXxDKlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+IEwWmk2+Rm1+F3GcXLeINEpwWjYqj4DCjOT+Q3/Vjf6rrrp3yMwm0RuTSixQssXa+NnLTz3P1kLgZ9ECN7HR+Cx387nErDP3PF5sGxLq8C/S5q3qQVyvUX7XYlMOQJBfM+IcIONWKVMUE3s2lGof1zqh/J0YjCMWvMWoHsWbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glHFDNxP; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glHFDNxP"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30c1c4a8224so249060a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253895; x=1747858695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hMZ4uysUw5XmBRCOMbR111V6yRnZBa1kOqJbE6cary8=;
        b=glHFDNxPsmlzdLHzoiSTWtoWNW3p3QvjiwTkjUzC+keotcfck2QGgJXODSmFIYmSrA
         d8x0mQNBUkvB/hnVEQnCtwxvzk1OY9cIWpBC7IwpSR5LcNvvjnK2cf1lEIqQcMlXSYTN
         UHNbeCuh1FfOKTnwd3wF9sR31fD8qzEYWeA8A57M4O2W/8+toflYAHeSd1CatzoDExGC
         0qNCL+H/pYki54trFGt7jCVfXc92x+Opxy3zkwmItvRvI4QugFW2+fUMgYxcbirmHN+x
         43ydVywTv3Nz9Bqov7mH4JPjQk0RxDBKxzxqST2JyKyoK5hIFz9Fh2BR3nz5VOkTSibc
         k5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253895; x=1747858695;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hMZ4uysUw5XmBRCOMbR111V6yRnZBa1kOqJbE6cary8=;
        b=CkKaPlixOScWjkNZ/tugyjBypco8olXl36lrAwtZGqqOXxkj8YtaYNgsAKC54Ia10z
         wQgXXGUZoY0K8s3fprxxO4iBBIwQ8IMpsClIux2zcBOAw4FH1QfiO4xsjH15VmuuW457
         Zrjo56bobcMf0VmmYd7Yeh42pusRLFMn/245xmUbLIrSZI+jqyhKZdGOFvsM9QqCX+AK
         eK6AtAsGM1KN4GEG6TJsRUPYiHow4im8bdiz+2htkHIFMvENsINgnXrdOBdmmgpOjvhJ
         x6AbN5WG56dwQiNGCOc/iAtA4dMhm95wa5KSxQQk2sJqJpOF459L5sCpNCI8r+Ju9cfT
         mnVA==
X-Forwarded-Encrypted: i=1; AJvYcCXwh6SBJGRV8jt+ovmvQQyzBkobPn+nBZMYmPWLDmEqsAkRjxiyAvsFOfPafcmvgHEckOMFUyds5SGrT68=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Sa9cgaiWCOXGNuez9q5pSaTW6QVmo7EpXahSQY1QshjIsYLu
	5YDYRnAIJduQOnYq6THKQMl/MrafA72ZFvPFNEx+bu24ZPKKdiCm
X-Gm-Gg: ASbGnctP0X3EPAzb8yTSPBhmTmBdx1dMUsSTabjgF3Ejz8O3qleeQeJZ2Whgmm9ZzT4
	N4PbHczj/LpnEfO4fpEM4Ko0bl3Y/vSsx1tiL0d+/SUQXKGTrdX2LBXydl5EDgsUJxRmmEUIBT6
	olconCscV5YLN5HcDxBeKeJqMfLPJKKJi/pfkP/M+9oZlrjZoaHNfpFvySQWa0QyBYt2Fs8dXWa
	uMotpRT+K7QUaYCZ26UyF/bISlqh+/lYYbKbVo3pqouCG8cj3psQJ2ShE4zVwGNqTXvyOCybSYA
	JvH/eE9Per6bVq+fsIBELRnkMw4JZAO2/DEhppo3NzFvu4EQZ0xCGD554mjfjXUFwuB3ldQ8Qrh
	A6rI2VHg=
X-Google-Smtp-Source: AGHT+IEUaI3tR4+A2EceQwbSasO0BEEqnAS6T39gRBWH2JvFh4nLt22ieE6sc3PwNU8lBlnMxoYivA==
X-Received: by 2002:a17:90b:2d4b:b0:2fe:e0a9:49d4 with SMTP id 98e67ed59e1d1-30e2e5818bcmr7861484a91.2.1747253895294;
        Wed, 14 May 2025 13:18:15 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:14 -0700 (PDT)
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
Subject: [PATCH 07/28] mm, swap: tidy up swap device and cluster info helpers
Date: Thu, 15 May 2025 04:17:07 +0800
Message-ID: <20250514201729.48420-8-ryncsn@gmail.com>
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

swp_swap_info is the common helper used for retrieving swap info in many
places. It has an internal check that may lead to a NULL return value,
but almost none of its caller checks the return value, and the internal
check is pointless. In fact, most of these callers already ensure the
entry is valid during that period and never expect a NULL value.

Tidy this up. If the caller ensures the swap entry / type is valid and
device is pinned, use swp_info / swp_type_info instead, which has more
debug checks and lower overhead as they are inline.

Caller that may expect a NULL value could use swp_get_info /
swp_type_get_info instead.

No feature change as the rearranged codes have no effect since they were
mostly ignored in some way, some new sanity checks are added for debug
built to catch potential misuse.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/swap.h |  6 ------
 mm/memory.c          |  2 +-
 mm/page_io.c         | 12 ++++++------
 mm/swap.h            | 32 ++++++++++++++++++++++++++++++--
 mm/swap_state.c      |  4 ++--
 mm/swapfile.c        | 35 ++++++++++++++++++-----------------
 6 files changed, 57 insertions(+), 34 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 1e7d9d55c39a..4239852fd203 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -453,7 +453,6 @@ extern sector_t swapdev_block(int, pgoff_t);
 extern int __swap_count(swp_entry_t entry);
 extern bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry);
 extern int swp_swapcount(swp_entry_t entry);
-struct swap_info_struct *swp_swap_info(swp_entry_t entry);
 struct backing_dev_info;
 extern int init_swap_address_space(unsigned int type, unsigned long nr_pages);
 extern void exit_swap_address_space(unsigned int type);
@@ -466,11 +465,6 @@ static inline void put_swap_device(struct swap_info_struct *si)
 }
 
 #else /* CONFIG_SWAP */
-static inline struct swap_info_struct *swp_swap_info(swp_entry_t entry)
-{
-	return NULL;
-}
-
 static inline struct swap_info_struct *get_swap_device(swp_entry_t entry)
 {
 	return NULL;
diff --git a/mm/memory.c b/mm/memory.c
index 254be0e88801..cc1f6891cf99 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4315,7 +4315,7 @@ static struct folio *__alloc_swap_folio(struct vm_fault *vmf)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
 {
-	struct swap_info_struct *si = swp_swap_info(entry);
+	struct swap_info_struct *si = swp_info(entry);
 	pgoff_t offset = swp_offset(entry);
 	int i;
 
diff --git a/mm/page_io.c b/mm/page_io.c
index 4bce19df557b..eaf6319b81ab 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -204,7 +204,7 @@ static bool is_folio_zero_filled(struct folio *folio)
 static void swap_zeromap_folio_set(struct folio *folio)
 {
 	struct obj_cgroup *objcg = get_obj_cgroup_from_folio(folio);
-	struct swap_info_struct *sis = swp_swap_info(folio->swap);
+	struct swap_info_struct *sis = swp_info(folio->swap);
 	int nr_pages = folio_nr_pages(folio);
 	swp_entry_t entry;
 	unsigned int i;
@@ -223,7 +223,7 @@ static void swap_zeromap_folio_set(struct folio *folio)
 
 static void swap_zeromap_folio_clear(struct folio *folio)
 {
-	struct swap_info_struct *sis = swp_swap_info(folio->swap);
+	struct swap_info_struct *sis = swp_info(folio->swap);
 	swp_entry_t entry;
 	unsigned int i;
 
@@ -375,7 +375,7 @@ static void sio_write_complete(struct kiocb *iocb, long ret)
 static void swap_writepage_fs(struct folio *folio, struct writeback_control *wbc)
 {
 	struct swap_iocb *sio = NULL;
-	struct swap_info_struct *sis = swp_swap_info(folio->swap);
+	struct swap_info_struct *sis = swp_info(folio->swap);
 	struct file *swap_file = sis->swap_file;
 	loff_t pos = swap_dev_pos(folio->swap);
 
@@ -452,7 +452,7 @@ static void swap_writepage_bdev_async(struct folio *folio,
 
 void __swap_writepage(struct folio *folio, struct writeback_control *wbc)
 {
-	struct swap_info_struct *sis = swp_swap_info(folio->swap);
+	struct swap_info_struct *sis = swp_info(folio->swap);
 
 	VM_BUG_ON_FOLIO(!folio_test_swapcache(folio), folio);
 	/*
@@ -543,7 +543,7 @@ static bool swap_read_folio_zeromap(struct folio *folio)
 
 static void swap_read_folio_fs(struct folio *folio, struct swap_iocb **plug)
 {
-	struct swap_info_struct *sis = swp_swap_info(folio->swap);
+	struct swap_info_struct *sis = swp_info(folio->swap);
 	struct swap_iocb *sio = NULL;
 	loff_t pos = swap_dev_pos(folio->swap);
 
@@ -614,7 +614,7 @@ static void swap_read_folio_bdev_async(struct folio *folio,
 
 void swap_read_folio(struct folio *folio, struct swap_iocb **plug)
 {
-	struct swap_info_struct *sis = swp_swap_info(folio->swap);
+	struct swap_info_struct *sis = swp_info(folio->swap);
 	bool synchronous = sis->flags & SWP_SYNCHRONOUS_IO;
 	bool workingset = folio_test_workingset(folio);
 	unsigned long pflags;
diff --git a/mm/swap.h b/mm/swap.h
index 38d37d241f1c..4982e6c2ad95 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -13,6 +13,8 @@ extern int page_cluster;
 #define swap_entry_order(order)	0
 #endif
 
+extern struct swap_info_struct *swap_info[];
+
 /*
  * We use this to track usage of a cluster. A cluster is a block of swap disk
  * space with SWAPFILE_CLUSTER pages long and naturally aligns in disk. All
@@ -51,9 +53,29 @@ enum swap_cluster_flags {
 #include <linux/swapops.h> /* for swp_offset */
 #include <linux/blk_types.h> /* for bio_end_io_t */
 
+/*
+ * All swp_* function callers must ensure the entry is valid, and hold the
+ * swap device reference or pin the device in other ways. E.g, a locked
+ * folio in the swap cache makes sure its entries (folio->swap) are valid
+ * and won't be freed, the device is also pinned by its entries.
+ */
+static inline struct swap_info_struct *swp_type_info(int type)
+{
+	struct swap_info_struct *si;
+	si = READ_ONCE(swap_info[type]); /* rcu_dereference() */
+	VM_WARN_ON_ONCE(percpu_ref_is_zero(&si->users)); /* race with swapoff */
+	return si;
+}
+
+static inline struct swap_info_struct *swp_info(swp_entry_t entry)
+{
+	return swp_type_info(swp_type(entry));
+}
+
 static inline struct swap_cluster_info *swp_offset_cluster(
 		struct swap_info_struct *si, pgoff_t offset)
 {
+	VM_WARN_ON_ONCE(percpu_ref_is_zero(&si->users)); /* race with swapoff */
 	return &si->cluster_info[offset / SWAPFILE_CLUSTER];
 }
 
@@ -62,6 +84,7 @@ static inline struct swap_cluster_info *swap_lock_cluster(
 		unsigned long offset)
 {
 	struct swap_cluster_info *ci = swp_offset_cluster(si, offset);
+	VM_WARN_ON_ONCE(percpu_ref_is_zero(&si->users)); /* race with swapoff */
 	spin_lock(&ci->lock);
 	return ci;
 }
@@ -154,7 +177,7 @@ void swap_update_readahead(struct folio *folio, struct vm_area_struct *vma,
 
 static inline unsigned int folio_swap_flags(struct folio *folio)
 {
-	return swp_swap_info(folio->swap)->flags;
+	return swp_info(folio->swap)->flags;
 }
 
 /*
@@ -165,7 +188,7 @@ static inline unsigned int folio_swap_flags(struct folio *folio)
 static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
 		bool *is_zeromap)
 {
-	struct swap_info_struct *sis = swp_swap_info(entry);
+	struct swap_info_struct *sis = swp_info(entry);
 	unsigned long start = swp_offset(entry);
 	unsigned long end = start + max_nr;
 	bool first_bit;
@@ -184,6 +207,11 @@ static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
 
 #else /* CONFIG_SWAP */
 struct swap_iocb;
+static inline struct swap_info_struct *swp_info(swp_entry_t entry)
+{
+	return NULL;
+}
+
 static inline void swap_read_folio(struct folio *folio, struct swap_iocb **plug)
 {
 }
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 07c41676486a..db9efa64f64e 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -330,7 +330,7 @@ struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		struct mempolicy *mpol, pgoff_t ilx, bool *new_page_allocated,
 		bool skip_if_exists)
 {
-	struct swap_info_struct *si = swp_swap_info(entry);
+	struct swap_info_struct *si = swp_info(entry);
 	struct folio *folio;
 	struct folio *new_folio = NULL;
 	struct folio *result = NULL;
@@ -554,7 +554,7 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t gfp_mask,
 	unsigned long offset = entry_offset;
 	unsigned long start_offset, end_offset;
 	unsigned long mask;
-	struct swap_info_struct *si = swp_swap_info(entry);
+	struct swap_info_struct *si = swp_info(entry);
 	struct blk_plug plug;
 	struct swap_iocb *splug = NULL;
 	bool page_allocated;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index ba3fd99eb5fa..2f834069b7ad 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -102,7 +102,7 @@ static PLIST_HEAD(swap_active_head);
 static struct plist_head *swap_avail_heads;
 static DEFINE_SPINLOCK(swap_avail_lock);
 
-static struct swap_info_struct *swap_info[MAX_SWAPFILES];
+struct swap_info_struct *swap_info[MAX_SWAPFILES];
 
 static DEFINE_MUTEX(swapon_mutex);
 
@@ -124,14 +124,20 @@ static DEFINE_PER_CPU(struct percpu_swap_cluster, percpu_swap_cluster) = {
 	.lock = INIT_LOCAL_LOCK(),
 };
 
-static struct swap_info_struct *swap_type_to_swap_info(int type)
+/* May return NULL on invalid type, caller must check for NULL return */
+static struct swap_info_struct *swp_type_get_info(int type)
 {
 	if (type >= MAX_SWAPFILES)
 		return NULL;
-
 	return READ_ONCE(swap_info[type]); /* rcu_dereference() */
 }
 
+/* May return NULL on invalid entry, caller must check for NULL return */
+static struct swap_info_struct *swp_get_info(swp_entry_t entry)
+{
+	return swp_type_get_info(swp_type(entry));
+}
+
 static inline unsigned char swap_count(unsigned char ent)
 {
 	return ent & ~SWAP_HAS_CACHE;	/* may include COUNT_CONTINUED flag */
@@ -343,7 +349,7 @@ offset_to_swap_extent(struct swap_info_struct *sis, unsigned long offset)
 
 sector_t swap_folio_sector(struct folio *folio)
 {
-	struct swap_info_struct *sis = swp_swap_info(folio->swap);
+	struct swap_info_struct *sis = swp_info(folio->swap);
 	struct swap_extent *se;
 	sector_t sector;
 	pgoff_t offset;
@@ -1272,7 +1278,7 @@ static struct swap_info_struct *_swap_info_get(swp_entry_t entry)
 
 	if (!entry.val)
 		goto out;
-	si = swp_swap_info(entry);
+	si = swp_get_info(entry);
 	if (!si)
 		goto bad_nofile;
 	if (data_race(!(si->flags & SWP_USED)))
@@ -1381,7 +1387,7 @@ struct swap_info_struct *get_swap_device(swp_entry_t entry)
 
 	if (!entry.val)
 		goto out;
-	si = swp_swap_info(entry);
+	si = swp_get_info(entry);
 	if (!si)
 		goto bad_nofile;
 	if (!get_swap_device_info(si))
@@ -1560,7 +1566,7 @@ void put_swap_folio(struct folio *folio, swp_entry_t entry)
 
 int __swap_count(swp_entry_t entry)
 {
-	struct swap_info_struct *si = swp_swap_info(entry);
+	struct swap_info_struct *si = swp_info(entry);
 	pgoff_t offset = swp_offset(entry);
 
 	return swap_count(si->swap_map[offset]);
@@ -1791,7 +1797,7 @@ void free_swap_and_cache_nr(swp_entry_t entry, int nr)
 
 swp_entry_t get_swap_page_of_type(int type)
 {
-	struct swap_info_struct *si = swap_type_to_swap_info(type);
+	struct swap_info_struct *si = swp_type_get_info(type);
 	unsigned long offset;
 	swp_entry_t entry = {0};
 
@@ -1872,7 +1878,7 @@ int find_first_swap(dev_t *device)
  */
 sector_t swapdev_block(int type, pgoff_t offset)
 {
-	struct swap_info_struct *si = swap_type_to_swap_info(type);
+	struct swap_info_struct *si = swp_type_get_info(type);
 	struct swap_extent *se;
 
 	if (!si || !(si->flags & SWP_WRITEOK))
@@ -2801,7 +2807,7 @@ static void *swap_start(struct seq_file *swap, loff_t *pos)
 	if (!l)
 		return SEQ_START_TOKEN;
 
-	for (type = 0; (si = swap_type_to_swap_info(type)); type++) {
+	for (type = 0; (si = swp_type_get_info(type)); type++) {
 		if (!(si->flags & SWP_USED) || !si->swap_map)
 			continue;
 		if (!--l)
@@ -2822,7 +2828,7 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
 		type = si->type + 1;
 
 	++(*pos);
-	for (; (si = swap_type_to_swap_info(type)); type++) {
+	for (; (si = swp_type_get_info(type)); type++) {
 		if (!(si->flags & SWP_USED) || !si->swap_map)
 			continue;
 		return si;
@@ -3483,7 +3489,7 @@ static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
 	unsigned char has_cache;
 	int err, i;
 
-	si = swp_swap_info(entry);
+	si = swp_get_info(entry);
 	if (WARN_ON_ONCE(!si)) {
 		pr_err("%s%08lx\n", Bad_file, entry.val);
 		return -EINVAL;
@@ -3598,11 +3604,6 @@ void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr)
 	swap_entries_put_cache(si, entry, nr);
 }
 
-struct swap_info_struct *swp_swap_info(swp_entry_t entry)
-{
-	return swap_type_to_swap_info(swp_type(entry));
-}
-
 /*
  * add_swap_count_continuation - called when a swap count is duplicated
  * beyond SWAP_MAP_MAX, it allocates a new page and links that to the entry's
-- 
2.49.0

