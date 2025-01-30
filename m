Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986FD15575C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212328; cv=none; b=opRfPtpHfpMFQbvtpHkho3JL9zZyhQbMHS2k3H9hIjadwKT9CkUhbjMZJmHDgc/e8NSzay91MVEAnUiAtcBZfQXgC1VB8mJ9WOyQxjsC08XqKDueiZasMYCRwJj72+C/KBjFCzIM0yIVEm6FWA3HXHxWtFIrYpE0vUUG3dYwPCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212328; c=relaxed/simple;
	bh=bBN3uqcIxfZxysLVVud1Gski6UXDpdWptNKobXsiPrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfls80vnTN/R72tS3FbeMz5ULG64nJelqKbqDmkTvnzpnhSpW4kVlpIGKIN/yZtimpeniqmPABVmPQvGjT/OJsdTsUvOYdNCp5582qyWRxTB+32nIqYnJt29OH9Km0DktlaIKNQVfc1cP87SQt1WTXgOEfv8451xHqXHiSrwB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=alEtrYLm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="alEtrYLm"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21669fd5c7cso5197155ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738212326; x=1738817126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7b48F13IaZHEp77kXliQ7Ulgv7dkxFEkUKlwPQJd7i8=;
        b=alEtrYLmGuw6rQvg5UFMA3UrWHjzt+c3Mf0emqngLbbebjqxfA1Mc+/bw6REQH3vuY
         +pYjBkolIJodeNkBa/OzDcuN/8M7/zj4X6pJCfXRHKENkNsK+oWuJJBzkvKPQNWR26Dp
         u8DTOYgOifbgA/Cx58eKPt2fdOwhypeta9rmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738212326; x=1738817126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b48F13IaZHEp77kXliQ7Ulgv7dkxFEkUKlwPQJd7i8=;
        b=MlDRmhSkDlJ7tuH7Sxr+aqxx0IjBiuPWsXLz8B9SV6xD+DwjsBNuEd8aiH7RZWFlB5
         YpYV2zS/WCI0eBC5F4y7kfjm2fM66ewcewUQhTnHikksfOyg5ktVxrkWeO1BVaeh/dRz
         7RWII5UvKZLpRgyVib4XOMDbv8vmDCJa9cffvx2Jt8y+GxjGQLEtfJlLF9JbjoXpunwY
         4pBuPyhbOXm5C9y96JnnhG46VP3qG9qwnZdJ92YA7i9b0ixi56C7NvyLlZdUJ3zpCgO3
         EginXFkDSGYspqTF+zaCV9uDec74h2OBhT9e+B0FRvYgZYk0GIE/nypwC6P38TUDPo0V
         bIAA==
X-Forwarded-Encrypted: i=1; AJvYcCV7SwXvPJWN18gB91PqA0tbgq/934oli8HtnfB4sw2Ca7S411ojMsNRxOfa4t0pTi8pVkPsmi1NZLm9x1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMEv6EQ3HqMiasWyYLnRwEZ6fJ3MvQyicDXyxYlFrL/En+vW5W
	RiH2Ig/uw13Q7Kd7gG9+RnfZajq4F/+IfqqH2w45TpNF/KfZQGqSVloKI6m8/g==
X-Gm-Gg: ASbGncsIyL/XmaLGRT+O6+n3FjZoxwLE80ZZT3ooX60t2RY6uA/ZKdy0hV7gXSU/kdx
	YhdBZNElRnkZk6E6/xtxN9Mq7FIGFUtLuBxBgZ8rBMxFwCygHFsL+tE6395FMk44SVs6cvXTo3J
	B7tZlu8BmpmG66DBQuodUadMZcYuNn/FPOYk6KLOu3cIlqmhYMnbZn8JpOQwhknGTrHVl31hFlK
	S38sMymEaPUVVDY+kwFQHtBtgR+/Xpm1qJMAS0pkbO2KIMUHclU+8I810WFA4wEaBS2ht+0TM5R
	fzyP0x7WesCY0b8EsQ==
X-Google-Smtp-Source: AGHT+IGash5oYuGdcs755/3JeUad/VkRFkG5UkbWIaV1ZyGTPZK/ra3hdD962IUxBHUrw6ORscpOlA==
X-Received: by 2002:a17:903:594:b0:216:36ff:ba33 with SMTP id d9443c01a7336-21dd7c67e06mr67812015ad.26.1738212325806;
        Wed, 29 Jan 2025 20:45:25 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de31ee137sm4551505ad.23.2025.01.29.20.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 20:45:25 -0800 (PST)
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
Subject: [PATCHv2 4/7] zsmalloc: make zspage lock preemptible
Date: Thu, 30 Jan 2025 13:42:47 +0900
Message-ID: <20250130044455.2642465-5-senozhatsky@chromium.org>
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

Switch over from rwlock_t to a atomic_t variable that takes negative
value when the page is under migration, or positive values when the
page is used by zsmalloc users (object map, etc.)   Using a rwsem
per-zspage is a little too memory heavy, a simple atomic_t should
suffice.

zspage lock is a leaf lock for zs_map_object(), where it's read-acquired.
Since this lock now permits preemption extra care needs to be taken when
it is write-acquired - all writers grab it in atomic context, so they
cannot spin and wait for (potentially preempted) reader to unlock zspage.
There are only two writers at this moment - migration and compaction.  In
both cases we use write-try-lock and bail out if zspage is read locked.
Writers, on the other hand, never get preempted, so readers can spin
waiting for the writer to unlock zspage.

With this we can implement a preemptible object mapping.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zsmalloc.c | 135 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 83 insertions(+), 52 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 9053777035af..d8cc8e2598cc 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -294,6 +294,9 @@ static inline void free_zpdesc(struct zpdesc *zpdesc)
 	__free_page(page);
 }
 
+#define ZS_PAGE_UNLOCKED	0
+#define ZS_PAGE_WRLOCKED	-1
+
 struct zspage {
 	struct {
 		unsigned int huge:HUGE_BITS;
@@ -306,7 +309,7 @@ struct zspage {
 	struct zpdesc *first_zpdesc;
 	struct list_head list; /* fullness list */
 	struct zs_pool *pool;
-	rwlock_t lock;
+	atomic_t lock;
 };
 
 struct mapping_area {
@@ -316,6 +319,59 @@ struct mapping_area {
 	enum zs_mapmode vm_mm; /* mapping mode */
 };
 
+static void zspage_lock_init(struct zspage *zspage)
+{
+	atomic_set(&zspage->lock, ZS_PAGE_UNLOCKED);
+}
+
+/*
+ * zspage lock permits preemption on the reader-side (there can be multiple
+ * readers).  Writers (exclusive zspage ownership), on the other hand, are
+ * always run in atomic context and cannot spin waiting for a (potentially
+ * preempted) reader to unlock zspage.  This, basically, means that writers
+ * can only call write-try-lock and must bail out if it didn't succeed.
+ *
+ * At the same time, writers cannot reschedule under zspage write-lock,
+ * so readers can spin waiting for the writer to unlock zspage.
+ */
+static void zspage_read_lock(struct zspage *zspage)
+{
+	atomic_t *lock = &zspage->lock;
+	int old = atomic_read(lock);
+
+	do {
+		if (old == ZS_PAGE_WRLOCKED) {
+			cpu_relax();
+			old = atomic_read(lock);
+			continue;
+		}
+	} while (!atomic_try_cmpxchg(lock, &old, old + 1));
+}
+
+static void zspage_read_unlock(struct zspage *zspage)
+{
+	atomic_dec(&zspage->lock);
+}
+
+static bool zspage_try_write_lock(struct zspage *zspage)
+{
+	atomic_t *lock = &zspage->lock;
+	int old = ZS_PAGE_UNLOCKED;
+
+	preempt_disable();
+	if (atomic_try_cmpxchg(lock, &old, ZS_PAGE_WRLOCKED))
+		return true;
+
+	preempt_enable();
+	return false;
+}
+
+static void zspage_write_unlock(struct zspage *zspage)
+{
+	atomic_set(&zspage->lock, ZS_PAGE_UNLOCKED);
+	preempt_enable();
+}
+
 /* huge object: pages_per_zspage == 1 && maxobj_per_zspage == 1 */
 static void SetZsHugePage(struct zspage *zspage)
 {
@@ -327,12 +383,6 @@ static bool ZsHugePage(struct zspage *zspage)
 	return zspage->huge;
 }
 
-static void migrate_lock_init(struct zspage *zspage);
-static void migrate_read_lock(struct zspage *zspage);
-static void migrate_read_unlock(struct zspage *zspage);
-static void migrate_write_lock(struct zspage *zspage);
-static void migrate_write_unlock(struct zspage *zspage);
-
 #ifdef CONFIG_COMPACTION
 static void kick_deferred_free(struct zs_pool *pool);
 static void init_deferred_free(struct zs_pool *pool);
@@ -1028,7 +1078,7 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
 		return NULL;
 
 	zspage->magic = ZSPAGE_MAGIC;
-	migrate_lock_init(zspage);
+	zspage_lock_init(zspage);
 
 	for (i = 0; i < class->pages_per_zspage; i++) {
 		struct zpdesc *zpdesc;
@@ -1253,7 +1303,7 @@ void *zs_map_object(struct zs_pool *pool, unsigned long handle,
 	 * zs_unmap_object API so delegate the locking from class to zspage
 	 * which is smaller granularity.
 	 */
-	migrate_read_lock(zspage);
+	zspage_read_lock(zspage);
 	pool_read_unlock(pool);
 
 	class = zspage_class(pool, zspage);
@@ -1313,7 +1363,7 @@ void zs_unmap_object(struct zs_pool *pool, unsigned long handle)
 	}
 	local_unlock(&zs_map_area.lock);
 
-	migrate_read_unlock(zspage);
+	zspage_read_unlock(zspage);
 }
 EXPORT_SYMBOL_GPL(zs_unmap_object);
 
@@ -1707,18 +1757,18 @@ static void lock_zspage(struct zspage *zspage)
 	/*
 	 * Pages we haven't locked yet can be migrated off the list while we're
 	 * trying to lock them, so we need to be careful and only attempt to
-	 * lock each page under migrate_read_lock(). Otherwise, the page we lock
+	 * lock each page under zspage_read_lock(). Otherwise, the page we lock
 	 * may no longer belong to the zspage. This means that we may wait for
 	 * the wrong page to unlock, so we must take a reference to the page
-	 * prior to waiting for it to unlock outside migrate_read_lock().
+	 * prior to waiting for it to unlock outside zspage_read_lock().
 	 */
 	while (1) {
-		migrate_read_lock(zspage);
+		zspage_read_lock(zspage);
 		zpdesc = get_first_zpdesc(zspage);
 		if (zpdesc_trylock(zpdesc))
 			break;
 		zpdesc_get(zpdesc);
-		migrate_read_unlock(zspage);
+		zspage_read_unlock(zspage);
 		zpdesc_wait_locked(zpdesc);
 		zpdesc_put(zpdesc);
 	}
@@ -1729,41 +1779,16 @@ static void lock_zspage(struct zspage *zspage)
 			curr_zpdesc = zpdesc;
 		} else {
 			zpdesc_get(zpdesc);
-			migrate_read_unlock(zspage);
+			zspage_read_unlock(zspage);
 			zpdesc_wait_locked(zpdesc);
 			zpdesc_put(zpdesc);
-			migrate_read_lock(zspage);
+			zspage_read_lock(zspage);
 		}
 	}
-	migrate_read_unlock(zspage);
+	zspage_read_unlock(zspage);
 }
 #endif /* CONFIG_COMPACTION */
 
-static void migrate_lock_init(struct zspage *zspage)
-{
-	rwlock_init(&zspage->lock);
-}
-
-static void migrate_read_lock(struct zspage *zspage) __acquires(&zspage->lock)
-{
-	read_lock(&zspage->lock);
-}
-
-static void migrate_read_unlock(struct zspage *zspage) __releases(&zspage->lock)
-{
-	read_unlock(&zspage->lock);
-}
-
-static void migrate_write_lock(struct zspage *zspage)
-{
-	write_lock(&zspage->lock);
-}
-
-static void migrate_write_unlock(struct zspage *zspage)
-{
-	write_unlock(&zspage->lock);
-}
-
 #ifdef CONFIG_COMPACTION
 
 static const struct movable_operations zsmalloc_mops;
@@ -1805,7 +1830,7 @@ static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 }
 
 static int zs_page_migrate(struct page *newpage, struct page *page,
-		enum migrate_mode mode)
+			   enum migrate_mode mode)
 {
 	struct zs_pool *pool;
 	struct size_class *class;
@@ -1821,15 +1846,12 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 
 	VM_BUG_ON_PAGE(!zpdesc_is_isolated(zpdesc), zpdesc_page(zpdesc));
 
-	/* We're committed, tell the world that this is a Zsmalloc page. */
-	__zpdesc_set_zsmalloc(newzpdesc);
-
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
 
 	/*
-	 * The pool migrate_lock protects the race between zpage migration
+	 * The pool->migrate_lock protects the race between zpage migration
 	 * and zs_free.
 	 */
 	pool_write_lock(pool);
@@ -1839,8 +1861,15 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	 * the class lock protects zpage alloc/free in the zspage.
 	 */
 	size_class_lock(class);
-	/* the migrate_write_lock protects zpage access via zs_map_object */
-	migrate_write_lock(zspage);
+	/* the zspage write_lock protects zpage access via zs_map_object */
+	if (!zspage_try_write_lock(zspage)) {
+		size_class_unlock(class);
+		pool_write_unlock(pool);
+		return -EINVAL;
+	}
+
+	/* We're committed, tell the world that this is a Zsmalloc page. */
+	__zpdesc_set_zsmalloc(newzpdesc);
 
 	offset = get_first_obj_offset(zpdesc);
 	s_addr = kmap_local_zpdesc(zpdesc);
@@ -1871,7 +1900,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	 */
 	pool_write_unlock(pool);
 	size_class_unlock(class);
-	migrate_write_unlock(zspage);
+	zspage_write_unlock(zspage);
 
 	zpdesc_get(newzpdesc);
 	if (zpdesc_zone(newzpdesc) != zpdesc_zone(zpdesc)) {
@@ -2007,9 +2036,11 @@ static unsigned long __zs_compact(struct zs_pool *pool,
 		if (!src_zspage)
 			break;
 
-		migrate_write_lock(src_zspage);
+		if (!zspage_try_write_lock(src_zspage))
+			break;
+
 		migrate_zspage(pool, src_zspage, dst_zspage);
-		migrate_write_unlock(src_zspage);
+		zspage_write_unlock(src_zspage);
 
 		fg = putback_zspage(class, src_zspage);
 		if (fg == ZS_INUSE_RATIO_0) {
-- 
2.48.1.262.g85cc9f2d1e-goog

