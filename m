Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5038DD3
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212339; cv=none; b=PWRmaiy1f/GTcE9rPsvvGiuQcqxHlfnvuMpRdKVjjtQepg6u5jWeWzWegmvbESSMaEURsP/f8AF7naree37OmDmUz1lkhO71sS1RTO+92nkVNKwfho/YzrCw8D5kONoHew8yvxmbI72U6n5nk4z3CvW2zM+xLWBT7HbE/0Lbtpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212339; c=relaxed/simple;
	bh=b8wby6Mnz0jOlZOj4F5r8wWAxtOJ93uxJ6l+SPSOOYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrRJ4nU3yWxBQBRP3YIPb3hu3kGuJxr99jqkhHephgj+WFWUQ9XuI4cSUZDanDNHJ9+E4U3A5/nXX8APMCNIhA2NWNRN6GMTYmZPS0a0ahGHAB3lpnn161xqGT9PBy53i+d2dACAmGi9/WHnIjfm/x9U/p2Szg+wnDTDEHdm/eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f3qDZNPk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f3qDZNPk"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166022c5caso4765505ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738212337; x=1738817137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jm+b3R/xkgu1u5aIyHjEy9+3hXzV4kVBwpygpgrob3Q=;
        b=f3qDZNPki8xjA716pcRiJ+I9oDDhnVCBz4QBoWxelR/xzVfzu3sTTMjgdOdiwLe/iX
         uWzLQWT5WBHgxE1506JUdukbKcUCI1G4FWhhsxqB9AOdyNEp9cIoL2Yv+ox6Ti/vsvIG
         wTYLASIimQ7EF/ym9ZaemzSoDG3dg+fWEOZ3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738212337; x=1738817137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jm+b3R/xkgu1u5aIyHjEy9+3hXzV4kVBwpygpgrob3Q=;
        b=lHEDM784/7/yuvrTDILAX1stwovr53eNn5GTb89bJHHO58o5pLOyllS1+ud60epA7N
         4TXj+NHC56l5rIzzqI1fDm88JUcMN89aJ/RLHuPLnwR92PtALxfUQOu7EKKPTqx4Iwe+
         Rdu5xavAXhND+8VWPXmNb8wuv6eIowxhtKxLwrHIy79Pxe6LC9VO2I5wMpWddEGVNWHw
         SxLJwyqNAYt9/BzmLkFkaNgOUkEuN5NfAbLRopU4o3zL6skDUuUXaLcDoB4FLIo3GZSj
         6nWSsQfUInPWMTT4CCLLrB2uxfcidPRVYZgmYWl3SfOB7VXqD1I64Zl3VoJTQc8fxk0x
         /q7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/UJ8lH5mg4akgp800G54j1RncRwe1mLEpNxB7iScSmzjbJkdEeS2LoaQ2jhbFvbSY17W5J5ejRzOIiOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/9jBI+jHUA92A3gdmfmMtc1Mr+3lQvCvsoxycL7/dmmUfvsY
	iRs4eO9gDoxD7gNQaH/wntp4M3mev8JbuTThPlAj5puEz31eVTCf0adEAXF/nQ==
X-Gm-Gg: ASbGncsbPf2jmxY0KP2NZLIeCeKUCAuSW1CGZt+CLyGZIle3ZvDztOmQM/p5t2YP527
	JcAIPtC3v86UPhUqToTcqp++zn3Z6ZmlCpuitYB4YlWedEQiFBCeG3H5IAtDU5aSyNppBEbs8e3
	DwxdBAVf6/6aga7M3MEvEFj6gFjB742Ujr1Rshd0YO+hzdndy5MzJr/G+7nCMtYPe/C1lPwNvnJ
	BY4SY1NEHl39PLUFQLhjVF9pu4lbnGXqAO5Sow3D036oszXDc26ZR37Wm3PWw3Zp7DJquU7Zd4T
	abZ383QK/GlLvqm7WA==
X-Google-Smtp-Source: AGHT+IHUyr8/2Fq8AovilKRJ28NBYk+8bvRw/3TGJlSrvnfXxKWiWthlwKdxoZwtf3TrFQyikvGQUQ==
X-Received: by 2002:a17:903:594:b0:216:36ff:ba33 with SMTP id d9443c01a7336-21dd7c67e06mr67817495ad.26.1738212336948;
        Wed, 29 Jan 2025 20:45:36 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de33000e0sm4566895ad.167.2025.01.29.20.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 20:45:36 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Minchan Kim <minchan@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 6/7] zram: switch to new zsmalloc object mapping API
Date: Thu, 30 Jan 2025 13:42:49 +0900
Message-ID: <20250130044455.2642465-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250130044455.2642465-1-senozhatsky@chromium.org>
References: <20250130044455.2642465-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new read/write zsmalloc object API.  For cases when RO mapped
object spans two physical pages (requires temp buffer) compression
streams now carry around one extra physical page.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c    |  4 +++-
 drivers/block/zram/zcomp.h    |  2 ++
 drivers/block/zram/zram_drv.c | 28 ++++++++++------------------
 3 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index efd5919808d9..675f2a51ad5f 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -45,6 +45,7 @@ static const struct zcomp_ops *backends[] = {
 static void zcomp_strm_free(struct zcomp *comp, struct zcomp_strm *strm)
 {
 	comp->ops->destroy_ctx(&strm->ctx);
+	vfree(strm->local_copy);
 	vfree(strm->buffer);
 	kfree(strm);
 }
@@ -66,12 +67,13 @@ static struct zcomp_strm *zcomp_strm_alloc(struct zcomp *comp)
 		return NULL;
 	}
 
+	strm->local_copy = vzalloc(PAGE_SIZE);
 	/*
 	 * allocate 2 pages. 1 for compressed data, plus 1 extra in case if
 	 * compressed data is larger than the original one.
 	 */
 	strm->buffer = vzalloc(2 * PAGE_SIZE);
-	if (!strm->buffer) {
+	if (!strm->buffer || !strm->local_copy) {
 		zcomp_strm_free(comp, strm);
 		return NULL;
 	}
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index 62330829db3f..9683d4aa822d 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -34,6 +34,8 @@ struct zcomp_strm {
 	struct list_head entry;
 	/* compression buffer */
 	void *buffer;
+	/* local copy of handle memory */
+	void *local_copy;
 	struct zcomp_ctx ctx;
 };
 
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index ad3e8885b0d2..d73e8374e9cc 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1562,11 +1562,11 @@ static int read_incompressible_page(struct zram *zram, struct page *page,
 	void *src, *dst;
 
 	handle = zram_get_handle(zram, index);
-	src = zs_map_object(zram->mem_pool, handle, ZS_MM_RO);
+	src = zs_obj_read_begin(zram->mem_pool, handle, NULL);
 	dst = kmap_local_page(page);
 	copy_page(dst, src);
 	kunmap_local(dst);
-	zs_unmap_object(zram->mem_pool, handle);
+	zs_obj_read_end(zram->mem_pool, handle, src);
 
 	return 0;
 }
@@ -1584,11 +1584,11 @@ static int read_compressed_page(struct zram *zram, struct page *page, u32 index)
 	prio = zram_get_priority(zram, index);
 
 	zstrm = zcomp_stream_get(zram->comps[prio]);
-	src = zs_map_object(zram->mem_pool, handle, ZS_MM_RO);
+	src = zs_obj_read_begin(zram->mem_pool, handle, zstrm->local_copy);
 	dst = kmap_local_page(page);
 	ret = zcomp_decompress(zram->comps[prio], zstrm, src, size, dst);
 	kunmap_local(dst);
-	zs_unmap_object(zram->mem_pool, handle);
+	zs_obj_read_end(zram->mem_pool, handle, src);
 	zcomp_stream_put(zram->comps[prio], zstrm);
 
 	return ret;
@@ -1684,7 +1684,7 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 				     u32 index)
 {
 	unsigned long handle;
-	void *src, *dst;
+	void *src;
 
 	/*
 	 * This function is called from preemptible context so we don't need
@@ -1701,11 +1701,9 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 		return -ENOMEM;
 	}
 
-	dst = zs_map_object(zram->mem_pool, handle, ZS_MM_WO);
 	src = kmap_local_page(page);
-	memcpy(dst, src, PAGE_SIZE);
+	zs_obj_write(zram->mem_pool, handle, src, PAGE_SIZE);
 	kunmap_local(src);
-	zs_unmap_object(zram->mem_pool, handle);
 
 	zram_slot_write_lock(zram, index);
 	zram_set_flag(zram, index, ZRAM_HUGE);
@@ -1726,7 +1724,7 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 	int ret = 0;
 	unsigned long handle;
 	unsigned int comp_len;
-	void *dst, *mem;
+	void *mem;
 	struct zcomp_strm *zstrm;
 	unsigned long element;
 	bool same_filled;
@@ -1769,11 +1767,8 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 		return -ENOMEM;
 	}
 
-	dst = zs_map_object(zram->mem_pool, handle, ZS_MM_WO);
-
-	memcpy(dst, zstrm->buffer, comp_len);
+	zs_obj_write(zram->mem_pool, handle, zstrm->buffer, comp_len);
 	zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
-	zs_unmap_object(zram->mem_pool, handle);
 
 	zram_slot_write_lock(zram, index);
 	zram_set_handle(zram, index, handle);
@@ -1882,7 +1877,7 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 	unsigned int class_index_old;
 	unsigned int class_index_new;
 	u32 num_recomps = 0;
-	void *src, *dst;
+	void *src;
 	int ret;
 
 	handle_old = zram_get_handle(zram, index);
@@ -2020,12 +2015,9 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 		return 0;
 	}
 
-	dst = zs_map_object(zram->mem_pool, handle_new, ZS_MM_WO);
-	memcpy(dst, zstrm->buffer, comp_len_new);
+	zs_obj_write(zram->mem_pool, handle_new, zstrm->buffer, comp_len_new);
 	zcomp_stream_put(zram->comps[prio], zstrm);
 
-	zs_unmap_object(zram->mem_pool, handle_new);
-
 	zram_free_page(zram, index);
 	zram_set_handle(zram, index, handle_new);
 	zram_set_obj_size(zram, index, comp_len_new);
-- 
2.48.1.262.g85cc9f2d1e-goog

