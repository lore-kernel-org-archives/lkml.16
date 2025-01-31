Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704F016E863
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314432; cv=none; b=EnB0RBILKtu45EarajLpFjHxUFHv+EwwgXXR2wzWi//j2Ls0EcU6uB0mOCG6JoizkTE9ygjPIrUol5NN6JZxiKEZmNLUaN79xgc2NjO0/uzukXjLvse/JbvtY9tgwnrkXceW3WwpMvyZmTklhJc60qtqBsuZn/6U4zoDbkT/Sg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314432; c=relaxed/simple;
	bh=kRrj9VavLNM5dJKp/VhjyPZ+ot3462OfKKSaaaG31CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZO7J2YGlg+uSOwK2XKPtKVai6ifhWgrJk8b9f00IvUNYEueh+Kx8rkBatZo+ei2XC/NNmhlAFngq49owSW23cisTKlM4TVqmnS4/zWmLIG0Kkd2qlvQeOx6IIzVEPDKFyWWj4H8nZavi4fE90RscP1k+M+HV6DA8pvXDPfleFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e4gEzeVO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e4gEzeVO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so2312367a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314429; x=1738919229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaFN5XJ8A1km1G4xPnULAZdvrmEAmo6pRkSTLZcPqY0=;
        b=e4gEzeVO3wCdOMPRt5a1TRg9h6goXxvnCabwHpJnPH9AZXJG5Z7HpQgOsnnvORPoHk
         ndtBtoNmySI/okvt+sTKbmdsMA0SFPi2PaAP7r1JgAGxMp05kX+nUwyO7YwU4Q++YWs2
         kh60Ev40BLfWQ5w46qsNl5Kww9jAuxFoPFjl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314429; x=1738919229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaFN5XJ8A1km1G4xPnULAZdvrmEAmo6pRkSTLZcPqY0=;
        b=UhudjdjbIrmsbceU+TJbUiHvvQ482dk/8RFbB78PvTHavyFsrHptD/sM9VXgWCpFza
         HVXZE7YugA43xJ9KcZCx+GxaCmv2aWmv6B4dA93IoV5UrUafg9nWbmYHVQeL46sWmQTR
         dmsW+xgDlxlbDapqdb5P/pNuevZI4thiQzjVLrgwTZscn6DvSoax0orAIJ6C6fWI+TEA
         52arcHdE66/1xYMsqLaiUvLmWab/tj4xD/AZOzYpeqZow4EK5G5a5qgW6CArMDKxyuKO
         s5g5qqXR0Fd9cfvfCTmiMPDtl6yBux3AZJhEZgqSmiD2o7j6z6Z6Ll5LoNw5ZvL8dI4N
         aPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4zP/QVMFCc6/JfWFK/LCw4p//Omwp4RWZI53QYDm2curu0y5d/NHKI6el41EMLA8ooFS0Q+Qc56mO5vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjNOyRqdxYTZ937dQvq7p6n2IUObveDXY3v4bplRxnBMJP7Rbu
	x8BsgHWfAAgNcmBJw8m29vdzmO7EKAieX7dgrthdUESPRXeCW1k1IB7hlVPDxg==
X-Gm-Gg: ASbGncuPGS+EOIi/toGWU00OTU+tdzWxSJh0690g9ksz2dDLL40Vs1w/82HLEx78pEF
	0zzxioDvX5KBTwCAi7vArlSZNO+Qy/lJwkKqSRuRNpsxQ1i+lrdYNiUm8ggLjFvYz96NoeTgtsm
	4q53/v69bu5P/33hiGHhmbg/xQ1RBFKLMWHkaXrKa24AVFFdFxxPvXAKHYig/YK69dReSPUeToz
	nNrSHiBzd52PJcOG47THEZZQ94bd7Ru/nD+mGQEnkmSQL7quMNIymRl6hGby+hm9xYpXLHjtDHC
	p2soxetJCnfuRqbLrw==
X-Google-Smtp-Source: AGHT+IGIXN+n6f5l+y68Non+b6GFZDbdRRf5AaVlS7GSpPKO4QWiW4YKeYlyUraz6wfdYS57hfAKuA==
X-Received: by 2002:a17:90a:d890:b0:2ee:e317:69ab with SMTP id 98e67ed59e1d1-2f83aa65ed2mr19463617a91.0.1738314428603;
        Fri, 31 Jan 2025 01:07:08 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f83bf93e97sm5869177a91.31.2025.01.31.01.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:08 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Date: Fri, 31 Jan 2025 18:06:00 +0900
Message-ID: <20250131090658.3386285-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250131090658.3386285-1-senozhatsky@chromium.org>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Concurrent modifications of meta table entries is now handled
by per-entry spin-lock.  This has a number of shortcomings.

First, this imposes atomic requirements on compression backends.
zram can call both zcomp_compress() and zcomp_decompress() under
entry spin-lock, which implies that we can use only compression
algorithms that don't schedule/sleep/wait during compression and
decompression.  This, for instance, makes it impossible to use
some of the ASYNC compression algorithms (H/W compression, etc.)
implementations.

Second, this can potentially trigger watchdogs.  For example,
entry re-compression with secondary algorithms is performed
under entry spin-lock.  Given that we chain secondary
compression algorithms and that some of them can be configured
for best compression ratio (and worst compression speed) zram
can stay under spin-lock for quite some time.

Do not use per-entry spin-locks and instead convert it to an
atomic_t variable which open codes reader-writer type of lock.
This permits preemption from slot_lock section, also reduces
the sizeof() zram entry when lockdep is enabled.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 126 ++++++++++++++++++++--------------
 drivers/block/zram/zram_drv.h |   6 +-
 2 files changed, 79 insertions(+), 53 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 9f5020b077c5..1c2df2341704 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -58,19 +58,50 @@ static void zram_free_page(struct zram *zram, size_t index);
 static int zram_read_from_zspool(struct zram *zram, struct page *page,
 				 u32 index);
 
-static int zram_slot_trylock(struct zram *zram, u32 index)
+static bool zram_slot_try_write_lock(struct zram *zram, u32 index)
 {
-	return spin_trylock(&zram->table[index].lock);
+	atomic_t *lock = &zram->table[index].lock;
+	int old = ZRAM_ENTRY_UNLOCKED;
+
+	return atomic_try_cmpxchg(lock, &old, ZRAM_ENTRY_WRLOCKED);
+}
+
+static void zram_slot_write_lock(struct zram *zram, u32 index)
+{
+	atomic_t *lock = &zram->table[index].lock;
+	int old = atomic_read(lock);
+
+	do {
+		if (old != ZRAM_ENTRY_UNLOCKED) {
+			cond_resched();
+			old = atomic_read(lock);
+			continue;
+		}
+	} while (!atomic_try_cmpxchg(lock, &old, ZRAM_ENTRY_WRLOCKED));
+}
+
+static void zram_slot_write_unlock(struct zram *zram, u32 index)
+{
+	atomic_set(&zram->table[index].lock, ZRAM_ENTRY_UNLOCKED);
 }
 
-static void zram_slot_lock(struct zram *zram, u32 index)
+static void zram_slot_read_lock(struct zram *zram, u32 index)
 {
-	spin_lock(&zram->table[index].lock);
+	atomic_t *lock = &zram->table[index].lock;
+	int old = atomic_read(lock);
+
+	do {
+		if (old == ZRAM_ENTRY_WRLOCKED) {
+			cond_resched();
+			old = atomic_read(lock);
+			continue;
+		}
+	} while (!atomic_try_cmpxchg(lock, &old, old + 1));
 }
 
-static void zram_slot_unlock(struct zram *zram, u32 index)
+static void zram_slot_read_unlock(struct zram *zram, u32 index)
 {
-	spin_unlock(&zram->table[index].lock);
+	atomic_dec(&zram->table[index].lock);
 }
 
 static inline bool init_done(struct zram *zram)
@@ -93,7 +124,6 @@ static void zram_set_handle(struct zram *zram, u32 index, unsigned long handle)
 	zram->table[index].handle = handle;
 }
 
-/* flag operations require table entry bit_spin_lock() being held */
 static bool zram_test_flag(struct zram *zram, u32 index,
 			enum zram_pageflags flag)
 {
@@ -229,9 +259,9 @@ static void release_pp_slot(struct zram *zram, struct zram_pp_slot *pps)
 {
 	list_del_init(&pps->entry);
 
-	zram_slot_lock(zram, pps->index);
+	zram_slot_write_lock(zram, pps->index);
 	zram_clear_flag(zram, pps->index, ZRAM_PP_SLOT);
-	zram_slot_unlock(zram, pps->index);
+	zram_slot_write_unlock(zram, pps->index);
 
 	kfree(pps);
 }
@@ -394,11 +424,11 @@ static void mark_idle(struct zram *zram, ktime_t cutoff)
 		 *
 		 * And ZRAM_WB slots simply cannot be ZRAM_IDLE.
 		 */
-		zram_slot_lock(zram, index);
+		zram_slot_write_lock(zram, index);
 		if (!zram_allocated(zram, index) ||
 		    zram_test_flag(zram, index, ZRAM_WB) ||
 		    zram_test_flag(zram, index, ZRAM_SAME)) {
-			zram_slot_unlock(zram, index);
+			zram_slot_write_unlock(zram, index);
 			continue;
 		}
 
@@ -410,7 +440,7 @@ static void mark_idle(struct zram *zram, ktime_t cutoff)
 			zram_set_flag(zram, index, ZRAM_IDLE);
 		else
 			zram_clear_flag(zram, index, ZRAM_IDLE);
-		zram_slot_unlock(zram, index);
+		zram_slot_write_unlock(zram, index);
 	}
 }
 
@@ -709,7 +739,7 @@ static int scan_slots_for_writeback(struct zram *zram, u32 mode,
 
 		INIT_LIST_HEAD(&pps->entry);
 
-		zram_slot_lock(zram, index);
+		zram_slot_write_lock(zram, index);
 		if (!zram_allocated(zram, index))
 			goto next;
 
@@ -731,7 +761,7 @@ static int scan_slots_for_writeback(struct zram *zram, u32 mode,
 		place_pp_slot(zram, ctl, pps);
 		pps = NULL;
 next:
-		zram_slot_unlock(zram, index);
+		zram_slot_write_unlock(zram, index);
 	}
 
 	kfree(pps);
@@ -822,7 +852,7 @@ static ssize_t writeback_store(struct device *dev,
 		}
 
 		index = pps->index;
-		zram_slot_lock(zram, index);
+		zram_slot_read_lock(zram, index);
 		/*
 		 * scan_slots() sets ZRAM_PP_SLOT and relases slot lock, so
 		 * slots can change in the meantime. If slots are accessed or
@@ -833,7 +863,7 @@ static ssize_t writeback_store(struct device *dev,
 			goto next;
 		if (zram_read_from_zspool(zram, page, index))
 			goto next;
-		zram_slot_unlock(zram, index);
+		zram_slot_read_unlock(zram, index);
 
 		bio_init(&bio, zram->bdev, &bio_vec, 1,
 			 REQ_OP_WRITE | REQ_SYNC);
@@ -860,7 +890,7 @@ static ssize_t writeback_store(struct device *dev,
 		}
 
 		atomic64_inc(&zram->stats.bd_writes);
-		zram_slot_lock(zram, index);
+		zram_slot_write_lock(zram, index);
 		/*
 		 * Same as above, we release slot lock during writeback so
 		 * slot can change under us: slot_free() or slot_free() and
@@ -882,7 +912,7 @@ static ssize_t writeback_store(struct device *dev,
 			zram->bd_wb_limit -=  1UL << (PAGE_SHIFT - 12);
 		spin_unlock(&zram->wb_limit_lock);
 next:
-		zram_slot_unlock(zram, index);
+		zram_slot_write_unlock(zram, index);
 		release_pp_slot(zram, pps);
 
 		cond_resched();
@@ -1001,7 +1031,7 @@ static ssize_t read_block_state(struct file *file, char __user *buf,
 	for (index = *ppos; index < nr_pages; index++) {
 		int copied;
 
-		zram_slot_lock(zram, index);
+		zram_slot_read_lock(zram, index);
 		if (!zram_allocated(zram, index))
 			goto next;
 
@@ -1019,13 +1049,13 @@ static ssize_t read_block_state(struct file *file, char __user *buf,
 				       ZRAM_INCOMPRESSIBLE) ? 'n' : '.');
 
 		if (count <= copied) {
-			zram_slot_unlock(zram, index);
+			zram_slot_read_unlock(zram, index);
 			break;
 		}
 		written += copied;
 		count -= copied;
 next:
-		zram_slot_unlock(zram, index);
+		zram_slot_read_unlock(zram, index);
 		*ppos += 1;
 	}
 
@@ -1473,15 +1503,11 @@ static bool zram_meta_alloc(struct zram *zram, u64 disksize)
 		huge_class_size = zs_huge_class_size(zram->mem_pool);
 
 	for (index = 0; index < num_pages; index++)
-		spin_lock_init(&zram->table[index].lock);
+		atomic_set(&zram->table[index].lock, ZRAM_ENTRY_UNLOCKED);
+
 	return true;
 }
 
-/*
- * To protect concurrent access to the same index entry,
- * caller should hold this table index entry's bit_spinlock to
- * indicate this index entry is accessing.
- */
 static void zram_free_page(struct zram *zram, size_t index)
 {
 	unsigned long handle;
@@ -1602,17 +1628,17 @@ static int zram_read_page(struct zram *zram, struct page *page, u32 index,
 {
 	int ret;
 
-	zram_slot_lock(zram, index);
+	zram_slot_read_lock(zram, index);
 	if (!zram_test_flag(zram, index, ZRAM_WB)) {
 		/* Slot should be locked through out the function call */
 		ret = zram_read_from_zspool(zram, page, index);
-		zram_slot_unlock(zram, index);
+		zram_slot_read_unlock(zram, index);
 	} else {
 		/*
 		 * The slot should be unlocked before reading from the backing
 		 * device.
 		 */
-		zram_slot_unlock(zram, index);
+		zram_slot_read_unlock(zram, index);
 
 		ret = read_from_bdev(zram, page, zram_get_handle(zram, index),
 				     parent);
@@ -1655,10 +1681,10 @@ static int zram_bvec_read(struct zram *zram, struct bio_vec *bvec,
 static int write_same_filled_page(struct zram *zram, unsigned long fill,
 				  u32 index)
 {
-	zram_slot_lock(zram, index);
+	zram_slot_write_lock(zram, index);
 	zram_set_flag(zram, index, ZRAM_SAME);
 	zram_set_handle(zram, index, fill);
-	zram_slot_unlock(zram, index);
+	zram_slot_write_unlock(zram, index);
 
 	atomic64_inc(&zram->stats.same_pages);
 	atomic64_inc(&zram->stats.pages_stored);
@@ -1693,11 +1719,11 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	kunmap_local(src);
 	zs_unmap_object(zram->mem_pool, handle);
 
-	zram_slot_lock(zram, index);
+	zram_slot_write_lock(zram, index);
 	zram_set_flag(zram, index, ZRAM_HUGE);
 	zram_set_handle(zram, index, handle);
 	zram_set_obj_size(zram, index, PAGE_SIZE);
-	zram_slot_unlock(zram, index);
+	zram_slot_write_unlock(zram, index);
 
 	atomic64_add(PAGE_SIZE, &zram->stats.compr_data_size);
 	atomic64_inc(&zram->stats.huge_pages);
@@ -1718,9 +1744,9 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 	bool same_filled;
 
 	/* First, free memory allocated to this slot (if any) */
-	zram_slot_lock(zram, index);
+	zram_slot_write_lock(zram, index);
 	zram_free_page(zram, index);
-	zram_slot_unlock(zram, index);
+	zram_slot_write_unlock(zram, index);
 
 	mem = kmap_local_page(page);
 	same_filled = page_same_filled(mem, &element);
@@ -1790,10 +1816,10 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 	zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
 	zs_unmap_object(zram->mem_pool, handle);
 
-	zram_slot_lock(zram, index);
+	zram_slot_write_lock(zram, index);
 	zram_set_handle(zram, index, handle);
 	zram_set_obj_size(zram, index, comp_len);
-	zram_slot_unlock(zram, index);
+	zram_slot_write_unlock(zram, index);
 
 	/* Update stats */
 	atomic64_inc(&zram->stats.pages_stored);
@@ -1850,7 +1876,7 @@ static int scan_slots_for_recompress(struct zram *zram, u32 mode,
 
 		INIT_LIST_HEAD(&pps->entry);
 
-		zram_slot_lock(zram, index);
+		zram_slot_write_lock(zram, index);
 		if (!zram_allocated(zram, index))
 			goto next;
 
@@ -1871,7 +1897,7 @@ static int scan_slots_for_recompress(struct zram *zram, u32 mode,
 		place_pp_slot(zram, ctl, pps);
 		pps = NULL;
 next:
-		zram_slot_unlock(zram, index);
+		zram_slot_write_unlock(zram, index);
 	}
 
 	kfree(pps);
@@ -2162,7 +2188,7 @@ static ssize_t recompress_store(struct device *dev,
 		if (!num_recomp_pages)
 			break;
 
-		zram_slot_lock(zram, pps->index);
+		zram_slot_write_lock(zram, pps->index);
 		if (!zram_test_flag(zram, pps->index, ZRAM_PP_SLOT))
 			goto next;
 
@@ -2170,7 +2196,7 @@ static ssize_t recompress_store(struct device *dev,
 				      &num_recomp_pages, threshold,
 				      prio, prio_max);
 next:
-		zram_slot_unlock(zram, pps->index);
+		zram_slot_write_unlock(zram, pps->index);
 		release_pp_slot(zram, pps);
 
 		if (err) {
@@ -2217,9 +2243,9 @@ static void zram_bio_discard(struct zram *zram, struct bio *bio)
 	}
 
 	while (n >= PAGE_SIZE) {
-		zram_slot_lock(zram, index);
+		zram_slot_write_lock(zram, index);
 		zram_free_page(zram, index);
-		zram_slot_unlock(zram, index);
+		zram_slot_write_unlock(zram, index);
 		atomic64_inc(&zram->stats.notify_free);
 		index++;
 		n -= PAGE_SIZE;
@@ -2248,9 +2274,9 @@ static void zram_bio_read(struct zram *zram, struct bio *bio)
 		}
 		flush_dcache_page(bv.bv_page);
 
-		zram_slot_lock(zram, index);
+		zram_slot_write_lock(zram, index);
 		zram_accessed(zram, index);
-		zram_slot_unlock(zram, index);
+		zram_slot_write_unlock(zram, index);
 
 		bio_advance_iter_single(bio, &iter, bv.bv_len);
 	} while (iter.bi_size);
@@ -2278,9 +2304,9 @@ static void zram_bio_write(struct zram *zram, struct bio *bio)
 			break;
 		}
 
-		zram_slot_lock(zram, index);
+		zram_slot_write_lock(zram, index);
 		zram_accessed(zram, index);
-		zram_slot_unlock(zram, index);
+		zram_slot_write_unlock(zram, index);
 
 		bio_advance_iter_single(bio, &iter, bv.bv_len);
 	} while (iter.bi_size);
@@ -2321,13 +2347,13 @@ static void zram_slot_free_notify(struct block_device *bdev,
 	zram = bdev->bd_disk->private_data;
 
 	atomic64_inc(&zram->stats.notify_free);
-	if (!zram_slot_trylock(zram, index)) {
+	if (!zram_slot_try_write_lock(zram, index)) {
 		atomic64_inc(&zram->stats.miss_free);
 		return;
 	}
 
 	zram_free_page(zram, index);
-	zram_slot_unlock(zram, index);
+	zram_slot_write_unlock(zram, index);
 }
 
 static void zram_comp_params_reset(struct zram *zram)
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index db78d7c01b9a..e20538cdf565 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -28,7 +28,6 @@
 #define ZRAM_SECTOR_PER_LOGICAL_BLOCK	\
 	(1 << (ZRAM_LOGICAL_BLOCK_SHIFT - SECTOR_SHIFT))
 
-
 /*
  * ZRAM is mainly used for memory efficiency so we want to keep memory
  * footprint small and thus squeeze size and zram pageflags into a flags
@@ -58,13 +57,14 @@ enum zram_pageflags {
 	__NR_ZRAM_PAGEFLAGS,
 };
 
-/*-- Data structures */
+#define ZRAM_ENTRY_UNLOCKED	0
+#define ZRAM_ENTRY_WRLOCKED	(-1)
 
 /* Allocated for each disk page */
 struct zram_table_entry {
 	unsigned long handle;
 	unsigned int flags;
-	spinlock_t lock;
+	atomic_t lock;
 #ifdef CONFIG_ZRAM_TRACK_ENTRY_ACTIME
 	ktime_t ac_time;
 #endif
-- 
2.48.1.362.g079036d154-goog

