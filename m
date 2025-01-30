Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8E81547C9
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212322; cv=none; b=nf4RUQFEVIIuMzfrVf/d/tJvtVQiO1BkfEIU4Pq/MX72SWzhLk+xRl55m5pva8L5/odjrEvSqbh7xeMlA4fEsUR2mHBBdjtNJ5k8mZxJSPPKSlEPwootaihwST9l8Rs1OKmaMYY4jBZUDwEKwzlTB4lF/YUxlsTCK0fRyzm0eJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212322; c=relaxed/simple;
	bh=0k23mwnYe/7vfQzpi+Blz+DQHj0FF3rrHJ6fxvyUseM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/srlwQnCYBa2gQl+Mtgvp418VTyXrQt3ZDQCecN5IcQLg6if+0TkTlXEXAbg1opo0UwBkRQKu3j3/5dXWQc7/pYX1+20AGFjkKhWg8MWAqJgov62vEz7oyzpUia8XNOECdkjqZhYqxDCC2OFmp9Lo3MrhgvUO2b2QefvvedCKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CQD14uPe; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CQD14uPe"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163dc5155fso5594875ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738212320; x=1738817120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DZ2RsvFcvw71ALze2h8Qgc3kShnLK348TMZbsDChLU=;
        b=CQD14uPequKFGvZu5vA6LwYnH4tX2gxsXD2t9uxa8BRtbNY0H7S9+C9fTGbL5k3gv8
         ENy2VKo/Q/XJpvmklM1VAzuTMQumeqAEsGoQ5+NLy/+TsROXZHbbri3lTvV77h0FxDwN
         xyCdVXAMcnA+fLG437DCU1BOchHB1OsCBWB14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738212320; x=1738817120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DZ2RsvFcvw71ALze2h8Qgc3kShnLK348TMZbsDChLU=;
        b=o6IkrMv8sFbLkc3hrDXVvDWz2l0Gof74lnN7BbU0+qHRKlECtT3d+lByldCEs+UNPX
         0pdg6JSgegglA1w4xWqEMm79LXittw17044yGoZpzZDrK50pcB0TA8fNKFiY4+WCqosy
         esBts4nGeJgKbdu9T5OW5nH8sOcu1SNNI5tM6fiROxzZmA+hB8Dtl31DUfbdAgGAufPI
         Ogr1Ir79li8DP6taS0GyF0yC3D785X64D9U782/Irvw3iSUrO+15+5bCby2D8euZOMn0
         tZOLMLJCuJLVehus8FJw0jf9qsmrA6zHGctk71epvgUQUPQA/y+Zg8dVgC5CrimTuT1K
         SC3w==
X-Forwarded-Encrypted: i=1; AJvYcCVCMwIYxjP5VIO3aoXv7+dEAOe8o5Kmq9VnQQd49JcyGO6nDRGSb59JfeZPQlaJPiWr69hcad1F/7YBsAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1dQNAU5VOcYEiV28BSJzELGUYfmv9W1Bs6KrvzvjFUuHHIr21
	Tm8IZ1YNtjlzs2Ov4sDNxNWVBYXBLDPBx07tzF9vp8fx5PK2RuaStCxADImVJw==
X-Gm-Gg: ASbGncskY1DhIIESZEAcAnUtVRbIJiPGJ1wS3gKsbP7VsbllxmOPXrvMa3yogE/HOes
	kaoXDEtDTu2s3Or/PqrvNkhejlti5NhKy709DDtqiqrwSFjYLrst4WYQTPx4l/2hdWTPV390H/A
	h8Wo7E55I4novf0N/ubUiniSNU1xezmWYNu1OIo9mYhtv/4yKrgl/vfy7DygMfjvpwFG3oKr7vZ
	5RT/NYUk5JuYr651FwiS5TzsX3H/KcbwlZGhZwGODRulaRU2oT/K0gEu/KattNAKYIz0tHpMNcW
	Em56ZADKj6haRcc6YQ==
X-Google-Smtp-Source: AGHT+IFN7QhZkttButj+44a8KQus5JiMx2Oq0RGEUpSgZ97hnkDVL1qKxutrj1FjlwXhcYZwTuD5rg==
X-Received: by 2002:a05:6a21:9004:b0:1e1:9f24:2e4c with SMTP id adf61e73a8af0-1ed7a5f0665mr8510856637.16.1738212320451;
        Wed, 29 Jan 2025 20:45:20 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-acebe385085sm321668a12.25.2025.01.29.20.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 20:45:20 -0800 (PST)
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
Subject: [PATCHv2 3/7] zsmalloc: factor out size-class locking helpers
Date: Thu, 30 Jan 2025 13:42:46 +0900
Message-ID: <20250130044455.2642465-4-senozhatsky@chromium.org>
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

Move open-coded size-class locking to dedicated helpers.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>
---
 mm/zsmalloc.c | 47 ++++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 2280ea17796b..9053777035af 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -255,6 +255,16 @@ static bool pool_lock_is_contended(struct zs_pool *pool)
 	return rwlock_is_contended(&pool->migrate_lock);
 }
 
+static void size_class_lock(struct size_class *class)
+{
+	spin_lock(&class->lock);
+}
+
+static void size_class_unlock(struct size_class *class)
+{
+	spin_unlock(&class->lock);
+}
+
 static inline void zpdesc_set_first(struct zpdesc *zpdesc)
 {
 	SetPagePrivate(zpdesc_page(zpdesc));
@@ -615,8 +625,7 @@ static int zs_stats_size_show(struct seq_file *s, void *v)
 		if (class->index != i)
 			continue;
 
-		spin_lock(&class->lock);
-
+		size_class_lock(class);
 		seq_printf(s, " %5u %5u ", i, class->size);
 		for (fg = ZS_INUSE_RATIO_10; fg < NR_FULLNESS_GROUPS; fg++) {
 			inuse_totals[fg] += class_stat_read(class, fg);
@@ -626,7 +635,7 @@ static int zs_stats_size_show(struct seq_file *s, void *v)
 		obj_allocated = class_stat_read(class, ZS_OBJS_ALLOCATED);
 		obj_used = class_stat_read(class, ZS_OBJS_INUSE);
 		freeable = zs_can_compact(class);
-		spin_unlock(&class->lock);
+		size_class_unlock(class);
 
 		objs_per_zspage = class->objs_per_zspage;
 		pages_used = obj_allocated / objs_per_zspage *
@@ -1401,7 +1410,7 @@ unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
 	class = pool->size_class[get_size_class_index(size)];
 
 	/* class->lock effectively protects the zpage migration */
-	spin_lock(&class->lock);
+	size_class_lock(class);
 	zspage = find_get_zspage(class);
 	if (likely(zspage)) {
 		obj_malloc(pool, zspage, handle);
@@ -1412,7 +1421,7 @@ unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
 		goto out;
 	}
 
-	spin_unlock(&class->lock);
+	size_class_unlock(class);
 
 	zspage = alloc_zspage(pool, class, gfp);
 	if (!zspage) {
@@ -1420,7 +1429,7 @@ unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
 		return (unsigned long)ERR_PTR(-ENOMEM);
 	}
 
-	spin_lock(&class->lock);
+	size_class_lock(class);
 	obj_malloc(pool, zspage, handle);
 	newfg = get_fullness_group(class, zspage);
 	insert_zspage(class, zspage, newfg);
@@ -1431,7 +1440,7 @@ unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
 	/* We completely set up zspage so mark them as movable */
 	SetZsPageMovable(pool, zspage);
 out:
-	spin_unlock(&class->lock);
+	size_class_unlock(class);
 
 	return handle;
 }
@@ -1485,7 +1494,7 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
 	obj_to_zpdesc(obj, &f_zpdesc);
 	zspage = get_zspage(f_zpdesc);
 	class = zspage_class(pool, zspage);
-	spin_lock(&class->lock);
+	size_class_lock(class);
 	pool_read_unlock(pool);
 
 	class_stat_sub(class, ZS_OBJS_INUSE, 1);
@@ -1495,7 +1504,7 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
 	if (fullness == ZS_INUSE_RATIO_0)
 		free_zspage(pool, class, zspage);
 
-	spin_unlock(&class->lock);
+	size_class_unlock(class);
 	cache_free_handle(pool, handle);
 }
 EXPORT_SYMBOL_GPL(zs_free);
@@ -1829,7 +1838,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	/*
 	 * the class lock protects zpage alloc/free in the zspage.
 	 */
-	spin_lock(&class->lock);
+	size_class_lock(class);
 	/* the migrate_write_lock protects zpage access via zs_map_object */
 	migrate_write_lock(zspage);
 
@@ -1861,7 +1870,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	 * it's okay to release migration_lock.
 	 */
 	pool_write_unlock(pool);
-	spin_unlock(&class->lock);
+	size_class_unlock(class);
 	migrate_write_unlock(zspage);
 
 	zpdesc_get(newzpdesc);
@@ -1905,10 +1914,10 @@ static void async_free_zspage(struct work_struct *work)
 		if (class->index != i)
 			continue;
 
-		spin_lock(&class->lock);
+		size_class_lock(class);
 		list_splice_init(&class->fullness_list[ZS_INUSE_RATIO_0],
 				 &free_pages);
-		spin_unlock(&class->lock);
+		size_class_unlock(class);
 	}
 
 	list_for_each_entry_safe(zspage, tmp, &free_pages, list) {
@@ -1916,10 +1925,10 @@ static void async_free_zspage(struct work_struct *work)
 		lock_zspage(zspage);
 
 		class = zspage_class(pool, zspage);
-		spin_lock(&class->lock);
+		size_class_lock(class);
 		class_stat_sub(class, ZS_INUSE_RATIO_0, 1);
 		__free_zspage(pool, class, zspage);
-		spin_unlock(&class->lock);
+		size_class_unlock(class);
 	}
 };
 
@@ -1984,7 +1993,7 @@ static unsigned long __zs_compact(struct zs_pool *pool,
 	 * as well as zpage allocation/free
 	 */
 	pool_write_lock(pool);
-	spin_lock(&class->lock);
+	size_class_lock(class);
 	while (zs_can_compact(class)) {
 		int fg;
 
@@ -2014,11 +2023,11 @@ static unsigned long __zs_compact(struct zs_pool *pool,
 			putback_zspage(class, dst_zspage);
 			dst_zspage = NULL;
 
-			spin_unlock(&class->lock);
+			size_class_unlock(class);
 			pool_write_unlock(pool);
 			cond_resched();
 			pool_write_lock(pool);
-			spin_lock(&class->lock);
+			size_class_lock(class);
 		}
 	}
 
@@ -2028,7 +2037,7 @@ static unsigned long __zs_compact(struct zs_pool *pool,
 	if (dst_zspage)
 		putback_zspage(class, dst_zspage);
 
-	spin_unlock(&class->lock);
+	size_class_unlock(class);
 	pool_write_unlock(pool);
 
 	return pages_freed;
-- 
2.48.1.262.g85cc9f2d1e-goog

