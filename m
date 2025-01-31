Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0676A175D53
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314493; cv=none; b=uTm0EXsS4uocO3pbq+LLJPJnEwqIhLXAIi3NUsySz0wzeXgudZuy9k7tsz2+TgLGbXLDYmCQPb2Neug5UZ2bP7XaNMtmbFTN4IA1eDGK4bOmnBqGeQTkUmRJdn/Nmn+iGQTgX9n5nI7NBg6LX/13A4NU42PdQQGN2afGvWYVBE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314493; c=relaxed/simple;
	bh=VhFIMmkHatni2lHAbsPw4Uxfib58Qe3afuGaSW20Pno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSd9cN8FFU0CBBUzKtXZULfP6iwEeZTSl35DL5vkE8wCWAsbTGHW1CIiTuGiB1F8TxQWOwpB7PUNezpFjNEzfQAPMqlfcPHPIdfqNV/DLfmcuvtPQ+9u+S92I04wgmZegdhQE0Rbz0I+S8qxEvVgTlxhpyG/Vnnwe8p+tVkM8Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ApY1VfGf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ApY1VfGf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2163dc5155fso30742615ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314491; x=1738919291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsBQiXFOiDXEVopox/DL4fBI7MjKngkv74+OC5sfCK8=;
        b=ApY1VfGfIdqHu+3S+JJmCdAKG9iCdpfr7CW7L2LwTxZrEoEFMyILdN3lZDgCiO3F9z
         XwehE8inHcpOHoiAPziUYUpH/BMygDLQCghaKkICVhtipcCilcSJ96Qd0mjajpV1muK0
         t5hMIcdbIfsL2RkF+y78RYqNed+H3+Rwf3V+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314491; x=1738919291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsBQiXFOiDXEVopox/DL4fBI7MjKngkv74+OC5sfCK8=;
        b=WspvCscDlB/6+unmaCGyJQAAQSZVIK7ds6k78fEirqV12g5BsE+IUnTTGkTBleEt1B
         8PJEVgcPxQufmg83XChw9OW1rqllYK82oSlcx5rfT6u9xK7c18Z/GK1reF2a3bnPS3hL
         7JoMJ8NBRNHksWqpiq4U+vAAabvqK+UShMOtdHLK8sQ7hwLcbGAO5cDV804TGiQk3OIR
         mTvQJT5VFQTlLnppqLfUcKYjrQwGSp47OkbXvxVuvKr4V/hWc2Akdsz4cSyrv9MAzRmO
         i2HSouIjUv7b2cGGxxnzp8mS29FLHwpwaCaKd+NBbbj4GkgQNBOFnsaH9JEPq/2SfK3X
         vKdA==
X-Forwarded-Encrypted: i=1; AJvYcCWOky83UeWYe1GYHp9nOOM6ZYN1JYFB1KPblr+NS3IkhSfffflU9Fcva4zbAw2D9/aFWSF91f0RRyP21x8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrQHx8g3ZA8OiBxNbNNePQd2hpeDaCVGPZNmXsngbGiZNRabj5
	xOv/OZ7LQas4jco7QjEavHYae1JMQ7Zu0OKDUpqAh0vPX1odtz6Kr7BHsSXyog==
X-Gm-Gg: ASbGncuvdQzOk6agk85PwqGomOuth1nw8EhP3A8m6aN4MrAj4pcGBYANwKQLp6JDD6A
	jxUKZFjv1VpCL+sx7gMqlin2u0hVWFMafZMKawsuhsK2n/s9MTQPnTe4CSVoeAPn2SU+bfNig00
	qY3DftJDOvfdi0VAxs1WrXtFPJk52lcGOAFVNSuHQ4cxUQUUomA+Y/SSRCFi6XrWoKQeK4PO/H6
	L5TdAbFewqnsOEM7TirKpQ6AoUwTzHLmRd0kriVmWl5p8Er1dV4yvFjxy9JeNHoTGBcIgPDb3Od
	R/FVqh9wy0w4xQfphg==
X-Google-Smtp-Source: AGHT+IENlfyVLhUqijJuU7j/zhaZph0w7819UX7xL0oXUri1pMuVzz1XrUZpnmESTer0aRPTpzNpUQ==
X-Received: by 2002:a17:902:dacd:b0:216:50fb:5dfc with SMTP id d9443c01a7336-21dd7c3cddemr135410395ad.9.1738314491281;
        Fri, 31 Jan 2025 01:08:11 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de33032dbsm25983505ad.191.2025.01.31.01.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:08:10 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 16/17] zram: switch to new zsmalloc object mapping API
Date: Fri, 31 Jan 2025 18:06:15 +0900
Message-ID: <20250131090658.3386285-17-senozhatsky@chromium.org>
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
index cfbb3072ee9e..f85502ae7dce 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1553,11 +1553,11 @@ static int read_incompressible_page(struct zram *zram, struct page *page,
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
@@ -1575,11 +1575,11 @@ static int read_compressed_page(struct zram *zram, struct page *page, u32 index)
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
@@ -1675,7 +1675,7 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 				     u32 index)
 {
 	unsigned long handle;
-	void *src, *dst;
+	void *src;
 
 	/*
 	 * This function is called from preemptible context so we don't need
@@ -1692,11 +1692,9 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
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
@@ -1717,7 +1715,7 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 	int ret = 0;
 	unsigned long handle;
 	unsigned int comp_len;
-	void *dst, *mem;
+	void *mem;
 	struct zcomp_strm *zstrm;
 	unsigned long element;
 	bool same_filled;
@@ -1760,11 +1758,8 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
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
@@ -1876,7 +1871,7 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 	unsigned int comp_len_new;
 	unsigned int class_index_old;
 	unsigned int class_index_new;
-	void *src, *dst;
+	void *src;
 	int ret;
 
 	handle_old = zram_get_handle(zram, index);
@@ -2000,12 +1995,9 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
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
2.48.1.362.g079036d154-goog

