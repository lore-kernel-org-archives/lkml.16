Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACA51B87D4
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314472; cv=none; b=RZu83KjVhE394+6h2JqHoYLJI+fpLhfrV3W6wU7+omWJkDYFtQfybex5rpsaxn1zo3q9c1yaaYyZZiQe9s4xnFhiCLGPdAdqwo+K/b79QhIXdpG6/JJLuacZEz7IUjPUK7KrKRDptMvpQ4qeM2QpyqBYAjAowinVq2/fB33oobA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314472; c=relaxed/simple;
	bh=aNMRzj06u4cEjeWmxV1/VeVb2cpxVVX3UefcDx9ncnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVJimHxi8LyINErFcdTnlC+PYuRit/WD5CIFyP7B7iBp2XmcNSQ2zVuYshzArQR/qDMtgmZoEdjbpqp/puH1rG9qrRfibV12p2GUMiPm7iuLQd40RKcCaC31KH2HFihMOd2tAEU+8beAPj/5XblK1eAQP5cMrwWV0Oz32uVn5Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c/TGb4kv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c/TGb4kv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-215770613dbso22354545ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314470; x=1738919270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3R6ZrvyVvJXmo0SkC31+WiXIWMORonA8dJRkgz1Hic=;
        b=c/TGb4kv9FarqgvxsX0l3Ons3yJ2nYHfAE/EipkVhajBffLdBrFkDuUN8HuwIFTWlz
         nRMNdqpc+MHOmV67IW23mfK++o6prbGSzlVaFICJDochX557tVArDy0k14YA7GAr+AgK
         o54zexk29vkH0RGr/DUb6p2wfTmwoNA5opib4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314470; x=1738919270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3R6ZrvyVvJXmo0SkC31+WiXIWMORonA8dJRkgz1Hic=;
        b=aZBdfBn+1ANDj5Y5U8CraGaBfARLt/RCODONkpKQpIl+BOFhTMySVffzrq438uecmN
         ZYqhIcKYJUk+1KFeFSSP1qCm1Cjp+/+9FC6EhiZlgG1H2dKscdBcixY92DK7Ep9qAXSg
         cPM7pVPnZKMBLAq1wNsN3JD0JDcpCxp/DG8gbP3o0kl9qAYKhX5cP3TtR97/1LKDAAC2
         QTEbqVsT4i/h9TfiL6Q4yYP0GsjoZGD90Ffk0fTT2fbLO8qTCBeJt08r5kqsNDS5yyCA
         4PrI7Z5z39OMtGWetayKOInKaRCXRdkisNuxuDhd2V0nF4CLnp6sH4vFBmoR+a27KtKo
         sQxw==
X-Forwarded-Encrypted: i=1; AJvYcCW9jgVjNRq2FaLaHwB9vTbzbLGV9adjV2U83UIx1Ae4cPyId+sqtGq05nY71EvjCCHZzvvmH35HBi8fkRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTEJkm7yqQ+/YW0FezfoZtN/JQJEq4cq3sDhbWqU0E4/A1JLYr
	wGGXKJfFNJfehQYKb0swVM24WFmGRU/tBSqnzobll2zBMS5KIP7INCVYrPM5wg==
X-Gm-Gg: ASbGnct5DDeEuGWlJSr0c6VcaF+wgfqRs35ySGj3Q4alsRV2Hui7l2pOxhZ3fsfclGC
	K4kurF/e1JPcu0Nm/QyNwWS50ax3GOa1VbvQoP5qJLGUYWousmdxyQOq8UnM+oJ+ZpUDQDHuqf3
	XZSvvNDe6ZK11AzEXBV3EeoKtCXpvkGtGP9QcyeLGK3Jh+K2x23kJj/244vZv7gGNCoJ3DJX+pf
	ei3lDegaE322yWhxZqyeYSleOVWHCv8YrhPypfgStZhADJbEZrjixwo9fxv58KOnXnLImvMZFSO
	sRdrKQNZmZF92rDQuQ==
X-Google-Smtp-Source: AGHT+IHLXvsFhFTC2/CpnCNKtJm8HspbzNrFJ2stc8XPxlxgUVecxgwWhc2fHSMoQmdPv+pgQ7aEHA==
X-Received: by 2002:a17:903:18c:b0:215:522d:72d6 with SMTP id d9443c01a7336-21dd7dcd025mr173931335ad.38.1738314470104;
        Fri, 31 Jan 2025 01:07:50 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de3302a68sm26120825ad.180.2025.01.31.01.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:49 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 11/17] zram: unlock slot during recompression
Date: Fri, 31 Jan 2025 18:06:10 +0900
Message-ID: <20250131090658.3386285-12-senozhatsky@chromium.org>
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

Recompression, like writeback, makes a local copy of slot data
(we need to decompress it anyway) before post-processing so we
can unlock slot-entry once we have that local copy.

Unlock the entry write-lock before recompression loop (secondary
algorithms can be tried out one by one, in order of priority) and
re-acquire it right after the loop.

There is one more potentially costly operation recompress_slot()
does - new zs_handle allocation, which can schedule().  Release
the slot-entry write-lock before zsmalloc allocation and grab it
again after the allocation.

In both cases, once the slot-lock is re-acquired we examine slot's
ZRAM_PP_SLOT flag to make sure that the slot has not been modified
by a concurrent operation.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 80 +++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 36 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 256439361367..cfbb3072ee9e 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1869,14 +1869,13 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 			   u64 *num_recomp_pages, u32 threshold, u32 prio,
 			   u32 prio_max)
 {
-	struct zcomp_strm *zstrm = NULL;
+	struct zcomp_strm *zstrm;
 	unsigned long handle_old;
 	unsigned long handle_new;
 	unsigned int comp_len_old;
 	unsigned int comp_len_new;
 	unsigned int class_index_old;
 	unsigned int class_index_new;
-	u32 num_recomps = 0;
 	void *src, *dst;
 	int ret;
 
@@ -1903,6 +1902,13 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 	zram_clear_flag(zram, index, ZRAM_IDLE);
 
 	class_index_old = zs_lookup_class_index(zram->mem_pool, comp_len_old);
+	prio = max(prio, zram_get_priority(zram, index) + 1);
+	/* Slot data copied out - unlock its bucket */
+	zram_slot_write_unlock(zram, index);
+	/* Recompression slots scan takes care of this, but just in case */
+	if (prio >= prio_max)
+		return 0;
+
 	/*
 	 * Iterate the secondary comp algorithms list (in order of priority)
 	 * and try to recompress the page.
@@ -1911,24 +1917,14 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 		if (!zram->comps[prio])
 			continue;
 
-		/*
-		 * Skip if the object is already re-compressed with a higher
-		 * priority algorithm (or same algorithm).
-		 */
-		if (prio <= zram_get_priority(zram, index))
-			continue;
-
-		num_recomps++;
 		zstrm = zcomp_stream_get(zram->comps[prio]);
 		src = kmap_local_page(page);
 		ret = zcomp_compress(zram->comps[prio], zstrm,
 				     src, &comp_len_new);
 		kunmap_local(src);
 
-		if (ret) {
-			zcomp_stream_put(zram->comps[prio], zstrm);
-			return ret;
-		}
+		if (ret)
+			break;
 
 		class_index_new = zs_lookup_class_index(zram->mem_pool,
 							comp_len_new);
@@ -1937,6 +1933,7 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 		if (class_index_new >= class_index_old ||
 		    (threshold && comp_len_new >= threshold)) {
 			zcomp_stream_put(zram->comps[prio], zstrm);
+			zstrm = NULL;
 			continue;
 		}
 
@@ -1944,14 +1941,7 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 		break;
 	}
 
-	/*
-	 * We did not try to recompress, e.g. when we have only one
-	 * secondary algorithm and the page is already recompressed
-	 * using that algorithm
-	 */
-	if (!zstrm)
-		return 0;
-
+	zram_slot_write_lock(zram, index);
 	/*
 	 * Decrement the limit (if set) on pages we can recompress, even
 	 * when current recompression was unsuccessful or did not compress
@@ -1961,37 +1951,55 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 	if (*num_recomp_pages)
 		*num_recomp_pages -= 1;
 
-	if (class_index_new >= class_index_old) {
+	/* Compression error */
+	if (ret) {
+		zcomp_stream_put(zram->comps[prio], zstrm);
+		return ret;
+	}
+
+	if (!zstrm) {
 		/*
 		 * Secondary algorithms failed to re-compress the page
-		 * in a way that would save memory, mark the object as
-		 * incompressible so that we will not try to compress
-		 * it again.
+		 * in a way that would save memory.
 		 *
-		 * We need to make sure that all secondary algorithms have
-		 * failed, so we test if the number of recompressions matches
-		 * the number of active secondary algorithms.
+		 * Mark the object incompressible if the max-priority
+		 * algorithm couldn't re-compress it.
 		 */
-		if (num_recomps == zram->num_active_comps - 1)
+		if (prio < zram->num_active_comps)
+			return 0;
+		if (zram_test_flag(zram, index, ZRAM_PP_SLOT))
 			zram_set_flag(zram, index, ZRAM_INCOMPRESSIBLE);
 		return 0;
 	}
 
-	/* Successful recompression but above threshold */
-	if (threshold && comp_len_new >= threshold)
+	/* Slot has been modified concurrently */
+	if (!zram_test_flag(zram, index, ZRAM_PP_SLOT)) {
+		zcomp_stream_put(zram->comps[prio], zstrm);
 		return 0;
+	}
 
-	/*
-	 * If we cannot alloc memory for recompressed object then we bail out
-	 * and simply keep the old (existing) object in zsmalloc.
-	 */
+	/* zsmalloc handle allocation can schedule, unlock slot's bucket */
+	zram_slot_write_unlock(zram, index);
 	handle_new = zs_malloc(zram->mem_pool, comp_len_new,
 			       GFP_NOIO | __GFP_HIGHMEM | __GFP_MOVABLE);
+	zram_slot_write_lock(zram, index);
+
+	/*
+	 * If we couldn't allocate memory for recompressed object then bail
+	 * out and simply keep the old (existing) object in mempool.
+	 */
 	if (IS_ERR_VALUE(handle_new)) {
 		zcomp_stream_put(zram->comps[prio], zstrm);
 		return PTR_ERR((void *)handle_new);
 	}
 
+	/* Slot has been modified concurrently */
+	if (!zram_test_flag(zram, index, ZRAM_PP_SLOT)) {
+		zcomp_stream_put(zram->comps[prio], zstrm);
+		zs_free(zram->mem_pool, handle_new);
+		return 0;
+	}
+
 	dst = zs_map_object(zram->mem_pool, handle_new, ZS_MM_WO);
 	memcpy(dst, zstrm->buffer, comp_len_new);
 	zcomp_stream_put(zram->comps[prio], zstrm);
-- 
2.48.1.362.g079036d154-goog

