Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97D719E7D3
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314477; cv=none; b=UuGhr60fLxPLO1gQOFp0z5L1o2E78Sp1bse9F0nAKRDImT+pgfOohxjTz1z3FRJXKzSzMiWqLpxnHUeLa/9gqEM7DczqtWuOZq276rKxKDap2Z2gnCPLA0D+knRtBKFeUv+sIlKyYFk/evAo5fIZUkMOym7fOzBOw+myRvdyMQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314477; c=relaxed/simple;
	bh=XWzEpdwF5C7NhQLOAtNqbZYwOY+UZUsDyF/afAc7W3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oE+3Bcm+ndj+caTdp/NK7DKZY6sxzro3ApOZUtwHsFbw87YyqOcmBDmC4qN5VaE9YXdoHqz2oHuN/STq2ypbDRztvoLBGKdLffczDp2PLn+IPieUSrBoy0p0RQ0iYG6g6vYeCYVLUFm+4l/NEa4QDE98mGtvGc6+hwE89OLNkoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gefoaMK5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gefoaMK5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2166f1e589cso42500585ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314475; x=1738919275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqDkbsViMBfIzGLM8hcQE+HJuYFQMLk+aSWGFS+XSh0=;
        b=gefoaMK5706y/k7+To3RqP8c3NHpntoeoTlbbhH5uK6acUmrUU2fBBJlJZQXuQhHoR
         o3uUrQX84MTeFBx1n3ef/8cjmMmZ4RiLMvlcX+zbH2ktOG5nM9xaCZ1Dmu4iW9LJD1WJ
         YQ3ENjOoR6ttw36yuf8yRMugGn39zMP/notvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314475; x=1738919275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqDkbsViMBfIzGLM8hcQE+HJuYFQMLk+aSWGFS+XSh0=;
        b=Fncp645yVHi/K+cVhF/8j80I1EIq/WiPFi33P7gmLqPkS8sAni7FcNokmk4l866MOq
         WSrL1sPxecIh7xtwMFYtLZHHLTJiQmqPXkQ95Zoc3BgOur8QVaupXZnmnjpQiULhXk6p
         GebSJzfH41pP0JBd8b8wUSl+pOP0N4/Vo1o/8Ci05nsBGqzqVbK7jxDChGfqul+t20gw
         nKXYTkS/JTkYAaNMxr4vZl83ZO7Wdr4WbdEE3hEUFR5Q85ZaRLzBi8nw9ZP87H0SkyH7
         Ki4yCZCzfuEbgn0glJfOuqW8rzfkiT6d9+vhvxo2Ti40h+X6RN7I8CjeWjutw/nttjdF
         CCpA==
X-Forwarded-Encrypted: i=1; AJvYcCWSDdsD1jkYzaj/P2cZXjnMcgYh3clEYJyXjQm5so0rEVkYzmYiIZ5yR7VZ8G1OWtcmkJ5d5I8Gt0EzPCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyipFSgyPFvxrh6VvsAAsKF9L0y880lTPRD1pnBPXoyxAp3LyQY
	QW/7YL4+u2IfaOI7EbPiHvChOM28jCQOxd4puS80/gHZpR0iY2xS7O+KvBtqRg==
X-Gm-Gg: ASbGncsK/nn1Z/UQAGljVOMw/+Zs0DnJxkx09RHCyL0LeJqF8Gp59LZ94FdsAaAq8Q/
	y1OQdkPmoPgTGt75W/j/EeY1ZOZR1CxuY/Az+WKj5N0u7BO8J7DQSobbgK5IFCBlpfkXJ06khTO
	n5BMsKmbDxuk1qg7H/x+ociRazyFY0JBf1lsD85NYksvDb90y3YWCFsa+7CLxS3Kl2ppKgsEwaf
	BtLmKXb0rilmWc3eg0GC6WaZesIIrzs8+2f2wOCJOjqb5eni7/UcwLS5+YE3BAvEBTGdI5dn+m9
	HvDD9GMYFS8wB+XQaA==
X-Google-Smtp-Source: AGHT+IGX15C7/nD8ive9k+yk6hUyhUaEscDdlRfPOcsZ6APSPwhqAsXH+BxwUfuwKmae5iWyxWBwog==
X-Received: by 2002:a17:902:ebc2:b0:21b:d105:26b8 with SMTP id d9443c01a7336-21eddbf3366mr33372725ad.7.1738314475027;
        Fri, 31 Jan 2025 01:07:55 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f83bfc0ddbsm5391902a91.45.2025.01.31.01.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:54 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>
Subject: [PATCHv4 12/17] zsmalloc: factor out pool locking helpers
Date: Fri, 31 Jan 2025 18:06:11 +0900
Message-ID: <20250131090658.3386285-13-senozhatsky@chromium.org>
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

We currently have a mix of migrate_{read,write}_lock() helpers
that lock zspages, but it's zs_pool that actually has a ->migrate_lock
access to which is opene-coded.  Factor out pool migrate locking
into helpers, zspage migration locking API will be renamed to
reduce confusion.

It's worth mentioning that zsmalloc locks sync not only migration,
but also compaction.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>
---
 mm/zsmalloc.c | 69 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 22 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 817626a351f8..c129596ab960 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -18,7 +18,7 @@
 /*
  * lock ordering:
  *	page_lock
- *	pool->migrate_lock
+ *	pool->lock
  *	class->lock
  *	zspage->lock
  */
@@ -224,10 +224,35 @@ struct zs_pool {
 	struct work_struct free_work;
 #endif
 	/* protect page/zspage migration */
-	rwlock_t migrate_lock;
+	rwlock_t lock;
 	atomic_t compaction_in_progress;
 };
 
+static void pool_write_unlock(struct zs_pool *pool)
+{
+	write_unlock(&pool->lock);
+}
+
+static void pool_write_lock(struct zs_pool *pool)
+{
+	write_lock(&pool->lock);
+}
+
+static void pool_read_unlock(struct zs_pool *pool)
+{
+	read_unlock(&pool->lock);
+}
+
+static void pool_read_lock(struct zs_pool *pool)
+{
+	read_lock(&pool->lock);
+}
+
+static bool pool_lock_is_contended(struct zs_pool *pool)
+{
+	return rwlock_is_contended(&pool->lock);
+}
+
 static inline void zpdesc_set_first(struct zpdesc *zpdesc)
 {
 	SetPagePrivate(zpdesc_page(zpdesc));
@@ -290,7 +315,7 @@ static bool ZsHugePage(struct zspage *zspage)
 	return zspage->huge;
 }
 
-static void migrate_lock_init(struct zspage *zspage);
+static void lock_init(struct zspage *zspage);
 static void migrate_read_lock(struct zspage *zspage);
 static void migrate_read_unlock(struct zspage *zspage);
 static void migrate_write_lock(struct zspage *zspage);
@@ -992,7 +1017,7 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
 		return NULL;
 
 	zspage->magic = ZSPAGE_MAGIC;
-	migrate_lock_init(zspage);
+	lock_init(zspage);
 
 	for (i = 0; i < class->pages_per_zspage; i++) {
 		struct zpdesc *zpdesc;
@@ -1206,7 +1231,7 @@ void *zs_map_object(struct zs_pool *pool, unsigned long handle,
 	BUG_ON(in_interrupt());
 
 	/* It guarantees it can get zspage from handle safely */
-	read_lock(&pool->migrate_lock);
+	pool_read_lock(pool);
 	obj = handle_to_obj(handle);
 	obj_to_location(obj, &zpdesc, &obj_idx);
 	zspage = get_zspage(zpdesc);
@@ -1218,7 +1243,7 @@ void *zs_map_object(struct zs_pool *pool, unsigned long handle,
 	 * which is smaller granularity.
 	 */
 	migrate_read_lock(zspage);
-	read_unlock(&pool->migrate_lock);
+	pool_read_unlock(pool);
 
 	class = zspage_class(pool, zspage);
 	off = offset_in_page(class->size * obj_idx);
@@ -1450,16 +1475,16 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
 		return;
 
 	/*
-	 * The pool->migrate_lock protects the race with zpage's migration
+	 * The pool->lock protects the race with zpage's migration
 	 * so it's safe to get the page from handle.
 	 */
-	read_lock(&pool->migrate_lock);
+	pool_read_lock(pool);
 	obj = handle_to_obj(handle);
 	obj_to_zpdesc(obj, &f_zpdesc);
 	zspage = get_zspage(f_zpdesc);
 	class = zspage_class(pool, zspage);
 	spin_lock(&class->lock);
-	read_unlock(&pool->migrate_lock);
+	pool_read_unlock(pool);
 
 	class_stat_sub(class, ZS_OBJS_INUSE, 1);
 	obj_free(class->size, obj);
@@ -1703,7 +1728,7 @@ static void lock_zspage(struct zspage *zspage)
 }
 #endif /* CONFIG_COMPACTION */
 
-static void migrate_lock_init(struct zspage *zspage)
+static void lock_init(struct zspage *zspage)
 {
 	rwlock_init(&zspage->lock);
 }
@@ -1793,10 +1818,10 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	pool = zspage->pool;
 
 	/*
-	 * The pool migrate_lock protects the race between zpage migration
+	 * The pool lock protects the race between zpage migration
 	 * and zs_free.
 	 */
-	write_lock(&pool->migrate_lock);
+	pool_write_lock(pool);
 	class = zspage_class(pool, zspage);
 
 	/*
@@ -1833,7 +1858,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	 * Since we complete the data copy and set up new zspage structure,
 	 * it's okay to release migration_lock.
 	 */
-	write_unlock(&pool->migrate_lock);
+	pool_write_unlock(pool);
 	spin_unlock(&class->lock);
 	migrate_write_unlock(zspage);
 
@@ -1956,7 +1981,7 @@ static unsigned long __zs_compact(struct zs_pool *pool,
 	 * protect the race between zpage migration and zs_free
 	 * as well as zpage allocation/free
 	 */
-	write_lock(&pool->migrate_lock);
+	pool_write_lock(pool);
 	spin_lock(&class->lock);
 	while (zs_can_compact(class)) {
 		int fg;
@@ -1983,14 +2008,14 @@ static unsigned long __zs_compact(struct zs_pool *pool,
 		src_zspage = NULL;
 
 		if (get_fullness_group(class, dst_zspage) == ZS_INUSE_RATIO_100
-		    || rwlock_is_contended(&pool->migrate_lock)) {
+		    || pool_lock_is_contended(pool)) {
 			putback_zspage(class, dst_zspage);
 			dst_zspage = NULL;
 
 			spin_unlock(&class->lock);
-			write_unlock(&pool->migrate_lock);
+			pool_write_unlock(pool);
 			cond_resched();
-			write_lock(&pool->migrate_lock);
+			pool_write_lock(pool);
 			spin_lock(&class->lock);
 		}
 	}
@@ -2002,7 +2027,7 @@ static unsigned long __zs_compact(struct zs_pool *pool,
 		putback_zspage(class, dst_zspage);
 
 	spin_unlock(&class->lock);
-	write_unlock(&pool->migrate_lock);
+	pool_write_unlock(pool);
 
 	return pages_freed;
 }
@@ -2014,10 +2039,10 @@ unsigned long zs_compact(struct zs_pool *pool)
 	unsigned long pages_freed = 0;
 
 	/*
-	 * Pool compaction is performed under pool->migrate_lock so it is basically
+	 * Pool compaction is performed under pool->lock so it is basically
 	 * single-threaded. Having more than one thread in __zs_compact()
-	 * will increase pool->migrate_lock contention, which will impact other
-	 * zsmalloc operations that need pool->migrate_lock.
+	 * will increase pool->lock contention, which will impact other
+	 * zsmalloc operations that need pool->lock.
 	 */
 	if (atomic_xchg(&pool->compaction_in_progress, 1))
 		return 0;
@@ -2139,7 +2164,7 @@ struct zs_pool *zs_create_pool(const char *name)
 		return NULL;
 
 	init_deferred_free(pool);
-	rwlock_init(&pool->migrate_lock);
+	rwlock_init(&pool->lock);
 	atomic_set(&pool->compaction_in_progress, 0);
 
 	pool->name = kstrdup(name, GFP_KERNEL);
-- 
2.48.1.362.g079036d154-goog

