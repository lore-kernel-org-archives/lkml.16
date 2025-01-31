Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2919DF99
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314481; cv=none; b=IbS0nejkjnKEWI+MhGVfI2axde69JSWtQDHddp2VN2IbzQV1hbVsAwiDXwkJNa1h6LsV5lmVCTkpp5K1axq9tZdfs1xbW7Fobm1YpztyllNzRh8k2uwiPovPaDx39Du30XmI7SlOqOEvHE1lQg8wp5IJrzm5oK6t4+6fhg4i9j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314481; c=relaxed/simple;
	bh=BNi+Kbwqr6U/J6I30WWLVwPz4DSS3fAEl1ytgSUOm6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuFfGBPL91dV6l+n+VwEMR37NmMuI18pbG5uwL6CRFpW4EQZABGZVgC4WYCtuKA0ibQyv6GekL+Px3E676taeB0mGrh/POyhoBzvW3FPMEbkmgPBpOXfaIhHXEdxIoN8ZmbjGQ8SxREOwRdw4cY55t/ewilV4qf28CRc+8rRYwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dupGKhQl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dupGKhQl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2161eb94cceso20833015ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314479; x=1738919279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMJPEUQI7RZrpU8Uw6E+fMbBL3rBKdqOy7rMXGa3DVQ=;
        b=dupGKhQl3tnPHdKxnM3lS6zwk0kYVwpOL2P7NqKvlsEeGIiF+UjLIK8zn4jdCmxYwU
         6ZNxgi8E6frZm7GiD1vx7OFbKKpBzjQpkXr7mGYU9TN9RjCZygtk61TMkELtTjks7bNj
         pq6WK/ZrBi6erJcVI54tkQYj4cmPJiN3LmzNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314479; x=1738919279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMJPEUQI7RZrpU8Uw6E+fMbBL3rBKdqOy7rMXGa3DVQ=;
        b=BjmgTKhhLuX1pIIxSt1JAiPsd2hQOj6udM9ohes95aA+FhtjXpJA78oD2MB68P8Nbs
         uebSDHPe2RQsTA/aykt2q51pug7OP9OvBG9cgVSQQyPS1CaIf2Y1BiWC0GhyV9OSD8U7
         r6O/+IuD/XJdpVeTfqkVL1Blfn4JBt43D5okCVNBm5w7g/K3SPXWZzssFVtR3Xf7Gpuk
         S6rB8/okAI4Rk4nwHJCSc5TVGQCD6WdCyFiUN9tJxyF0/q40k94Q9MEi8nxiP0dNs6Bz
         tj2YXRobKDya0tBxGaoWSaT/zS6TOzikpoZD2fYdsUP+YS3Tx5T+D3Fa57Q6CQCtSjPc
         Kxqg==
X-Forwarded-Encrypted: i=1; AJvYcCUuLB8DbBOMQP2Swp+rMpkTyejG4mVPoNvR7K8n4IkNQ+ucNvyslJNH1LDaoM6+v0ddU2kjiaf+SlX/fe8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6gOgnRRXZa6b9tCqDhQ3VFhxV5vQT8nWxG0V09MAWARSPoEQK
	fUrsSfRf0RmTj0ES+9zArgDlRdGkeuzBoVUmNQI/BTGnLGO6HkVd0BwLs7fo/g==
X-Gm-Gg: ASbGncvm5pVB77sEV0dxJh2Agz/RM9p/2dVVTk/K9QMPdE9h9gJCK/Vx1A9A9jlBObq
	ht4aBqTfMjeSw3AFuOmzHPmb99nCB5OAxE5Xu35gmgvC3CskkYtJGv6NgmGjYsLXjZ7VCV5GUfG
	wLjfCv23a91mujHdqMZitQ1W6UKtAIlb8WbXCold1yOofmX3k1+xIm/0sVUR2gJRfuIoJK82Ded
	mLdlTpEmu4Vem80X1oBJaz0MsjGbcJo4xLh+/az/nEw6DYz3KP5tx9dfI3EF6TV3Du22MG/YJk1
	e6oINIWe7WGehv+jBQ==
X-Google-Smtp-Source: AGHT+IHhqjztMQY9nyoxNY57ZCZdxtWzFwxbZ4LRhwZuQGquqZr7M2SqvkrDWTSh2oSFv8q0NO6MeA==
X-Received: by 2002:a17:902:ea06:b0:215:352c:af73 with SMTP id d9443c01a7336-21dd7c57eb0mr137738715ad.18.1738314478999;
        Fri, 31 Jan 2025 01:07:58 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de31f5a60sm25837715ad.61.2025.01.31.01.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:58 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>
Subject: [PATCHv4 13/17] zsmalloc: factor out size-class locking helpers
Date: Fri, 31 Jan 2025 18:06:12 +0900
Message-ID: <20250131090658.3386285-14-senozhatsky@chromium.org>
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

Move open-coded size-class locking to dedicated helpers.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>
---
 mm/zsmalloc.c | 47 ++++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index c129596ab960..4b4c77bc08f9 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -253,6 +253,16 @@ static bool pool_lock_is_contended(struct zs_pool *pool)
 	return rwlock_is_contended(&pool->lock);
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
@@ -613,8 +623,7 @@ static int zs_stats_size_show(struct seq_file *s, void *v)
 		if (class->index != i)
 			continue;
 
-		spin_lock(&class->lock);
-
+		size_class_lock(class);
 		seq_printf(s, " %5u %5u ", i, class->size);
 		for (fg = ZS_INUSE_RATIO_10; fg < NR_FULLNESS_GROUPS; fg++) {
 			inuse_totals[fg] += class_stat_read(class, fg);
@@ -624,7 +633,7 @@ static int zs_stats_size_show(struct seq_file *s, void *v)
 		obj_allocated = class_stat_read(class, ZS_OBJS_ALLOCATED);
 		obj_used = class_stat_read(class, ZS_OBJS_INUSE);
 		freeable = zs_can_compact(class);
-		spin_unlock(&class->lock);
+		size_class_unlock(class);
 
 		objs_per_zspage = class->objs_per_zspage;
 		pages_used = obj_allocated / objs_per_zspage *
@@ -1399,7 +1408,7 @@ unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
 	class = pool->size_class[get_size_class_index(size)];
 
 	/* class->lock effectively protects the zpage migration */
-	spin_lock(&class->lock);
+	size_class_lock(class);
 	zspage = find_get_zspage(class);
 	if (likely(zspage)) {
 		obj_malloc(pool, zspage, handle);
@@ -1410,7 +1419,7 @@ unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
 		goto out;
 	}
 
-	spin_unlock(&class->lock);
+	size_class_unlock(class);
 
 	zspage = alloc_zspage(pool, class, gfp);
 	if (!zspage) {
@@ -1418,7 +1427,7 @@ unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
 		return (unsigned long)ERR_PTR(-ENOMEM);
 	}
 
-	spin_lock(&class->lock);
+	size_class_lock(class);
 	obj_malloc(pool, zspage, handle);
 	newfg = get_fullness_group(class, zspage);
 	insert_zspage(class, zspage, newfg);
@@ -1429,7 +1438,7 @@ unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
 	/* We completely set up zspage so mark them as movable */
 	SetZsPageMovable(pool, zspage);
 out:
-	spin_unlock(&class->lock);
+	size_class_unlock(class);
 
 	return handle;
 }
@@ -1483,7 +1492,7 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
 	obj_to_zpdesc(obj, &f_zpdesc);
 	zspage = get_zspage(f_zpdesc);
 	class = zspage_class(pool, zspage);
-	spin_lock(&class->lock);
+	size_class_lock(class);
 	pool_read_unlock(pool);
 
 	class_stat_sub(class, ZS_OBJS_INUSE, 1);
@@ -1493,7 +1502,7 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
 	if (fullness == ZS_INUSE_RATIO_0)
 		free_zspage(pool, class, zspage);
 
-	spin_unlock(&class->lock);
+	size_class_unlock(class);
 	cache_free_handle(pool, handle);
 }
 EXPORT_SYMBOL_GPL(zs_free);
@@ -1827,7 +1836,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	/*
 	 * the class lock protects zpage alloc/free in the zspage.
 	 */
-	spin_lock(&class->lock);
+	size_class_lock(class);
 	/* the migrate_write_lock protects zpage access via zs_map_object */
 	migrate_write_lock(zspage);
 
@@ -1859,7 +1868,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	 * it's okay to release migration_lock.
 	 */
 	pool_write_unlock(pool);
-	spin_unlock(&class->lock);
+	size_class_unlock(class);
 	migrate_write_unlock(zspage);
 
 	zpdesc_get(newzpdesc);
@@ -1903,10 +1912,10 @@ static void async_free_zspage(struct work_struct *work)
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
@@ -1914,10 +1923,10 @@ static void async_free_zspage(struct work_struct *work)
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
 
@@ -1982,7 +1991,7 @@ static unsigned long __zs_compact(struct zs_pool *pool,
 	 * as well as zpage allocation/free
 	 */
 	pool_write_lock(pool);
-	spin_lock(&class->lock);
+	size_class_lock(class);
 	while (zs_can_compact(class)) {
 		int fg;
 
@@ -2012,11 +2021,11 @@ static unsigned long __zs_compact(struct zs_pool *pool,
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
 
@@ -2026,7 +2035,7 @@ static unsigned long __zs_compact(struct zs_pool *pool,
 	if (dst_zspage)
 		putback_zspage(class, dst_zspage);
 
-	spin_unlock(&class->lock);
+	size_class_unlock(class);
 	pool_write_unlock(pool);
 
 	return pages_freed;
-- 
2.48.1.362.g079036d154-goog

