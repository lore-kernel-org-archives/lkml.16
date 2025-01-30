Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C370B1C1AD4
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235529; cv=none; b=jGliZfsXdc/FOKWOyTqilKQ+XMrnnSAl2YKcTP1UCl/+K2jx9PYsyURi+hNrRq6GokJyOv1kA9FhAeOntCn7Gt1rrVogw22D4H2l2kSisaYVcxm10f4n9zafY5szhMQq63UuYflYmTK3CWc98u+1w6tnSlE/+KSL0+ZpO8nGWNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235529; c=relaxed/simple;
	bh=iHY1ysTq1PF3D/y6XmbzczXcD651ZYxNBzFqLWai1DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfbYyvz29S20Ge0/gw8P/06+9u2VX1MKRShODnh+byon9S8mlKmM1rvV4RUCA6TQbrdh61gO/xg9NqtMdxtCJT5es+ALqbFq5SvnrL31/QFG4idtuXGKgPsznq0ZqLffuEj8wv7mdcYA6i8PBlF4cL+7UHiotLNsYKG+9RtbPQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RhArdJKK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RhArdJKK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2164b662090so11617795ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738235527; x=1738840327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLxgJRPaVNwNF6Kcm4INbLog064v7nke9leBvmEg3e4=;
        b=RhArdJKKjZMBKAj13d7UQM5sSmoPHJtxYahRfXRgJsFBUqQMOhotVDny8Dw7t/KDMQ
         qEs7RW0MgBQzL4tdsmeTOPHtGc4X1TzQ+ee08Ll/MSY9vYNilkY0fH0co8I0SUPB1EFD
         3+cHkvpYzl5fPSDYZ9hU9CsPTAgJxfPUN0PGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235527; x=1738840327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLxgJRPaVNwNF6Kcm4INbLog064v7nke9leBvmEg3e4=;
        b=I5kGmsVstDHvGuo6crNmEWdXHQBKfZUbzBHMDGa67KmTVs66POS0FPYSRt8sYCRDzz
         cUF4B8og4FQEarUTD//x7KrXCjfKJejXEYMSvAUbWi3lIMTB0Ap65/NgzS+pafgby6zE
         CH8gQoWGXbv/AaIviMU44UfshIb/K6yYRUlrJQ3V4fDjObsz/sWePnhAjvlKGE559Hdd
         8BEa8u6HSuwJDXjYBdedz+JGQyabdAAsf7LsRaJsCT77bnPSCVEecIn86xkes/fUGo5P
         ve8S6Un/ZQxklUTm4mOY+Sn4cUpgDoBaMxUQ6EcBixM/4FB3CGxdjP/pFAHQB3dKILiF
         Bm6g==
X-Forwarded-Encrypted: i=1; AJvYcCWoMNnFTmoYziW2xRRqT3VFs70xhhtuHTEnKu9rQiwGUqa9Evm7gD5z1oCMz0xCcQ4quVwY+WhZc/oxBb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNmS2OEmKO23oJ43DAB/Rb9/RaMY8rrMZMr0ByAdQXlT5dYAD
	shuo9lKGwz4TG7XDFl9ZJJ25Z2bKObIon6jT0prf3KnOLb31E0/NmUr+AOGPXg==
X-Gm-Gg: ASbGncvZDw6JByVtr0/uQQ+DicIE+nzMUrFR7oFCSWT1lXJYh3g3jqD5ReROCRRjc6I
	yMUzdNkbHzPXyaiEqDhCDVe+ihOG890GINBjO+eCflUOC37byMTZTTCts6tEwuJU08x17h7FvII
	IMW3H5C9HoXA6xZibomH+CPKIjkoroL8QNodRw7GSbLc6mr5KZdEU5hewaNqBf2d7Fy820LmPrb
	wOLSAqbPVH5xnZ1Dwb1dj0MYb5rj4YC2PbGCveMZGAJUQDsoCAi5vbhjAB6zGcgDTsmE4aBIM46
	f0fxBM4cBBTd+P+b
X-Google-Smtp-Source: AGHT+IEmgqIzatKzhSxji3bLavuavRKHjn6PnEoK7vJ9Qf8RpneZSWnCVW2omFdSy80mZ0nOsxnoUg==
X-Received: by 2002:a05:6a20:9c8e:b0:1e6:8f39:d607 with SMTP id adf61e73a8af0-1ed7a6b17bcmr12484502637.31.1738235527034;
        Thu, 30 Jan 2025 03:12:07 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe6429218sm1210151b3a.66.2025.01.30.03.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:12:06 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 11/11] zram: unlock slot during recompression
Date: Thu, 30 Jan 2025 20:10:56 +0900
Message-ID: <20250130111105.2861324-12-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250130111105.2861324-1-senozhatsky@chromium.org>
References: <20250130111105.2861324-1-senozhatsky@chromium.org>
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
index 500d6c8b17fc..a6bc1c2dfbe6 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1871,14 +1871,13 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
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
 
@@ -1905,6 +1904,13 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
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
@@ -1913,24 +1919,14 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
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
@@ -1939,6 +1935,7 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 		if (class_index_new >= class_index_old ||
 		    (threshold && comp_len_new >= threshold)) {
 			zcomp_stream_put(zram->comps[prio], zstrm);
+			zstrm = NULL;
 			continue;
 		}
 
@@ -1946,14 +1943,7 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
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
@@ -1963,37 +1953,55 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
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
2.48.1.262.g85cc9f2d1e-goog

