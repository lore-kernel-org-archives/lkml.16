Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFDD1BD50C
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314486; cv=none; b=r41kH9dRGGUHsQ/5rY4OA66NNJ8zBaS+UaHEMGbOcBr0jiXl2n4fR3wtunx+zF4UYuGj7XEC50K/yXwt2nSSRu7f1EC+xkLrcvDvXRgS/+aXC9M0uZEGySlXzmEoh/LT6GXI6Q77FgP5uyI4bzu7khyokQ3+hXiiTq/5t6THCgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314486; c=relaxed/simple;
	bh=zwmutWgB0aePSiLsNGMtF2l6izDQjWv/zVEYjALBtvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSJL3vCoBDssZhqln+S/OFABjLVzEIC/xOunOVp+lPCZAKXmIxQXW+omR1VFYqeXjKp86N5zi14OOGoNeeNU6JRoEa3a2BppyqODpTad1tPtCl2kfqIhBoXb5nAjFHTTlPvb3mW0LycS2+2ndHzaVT7hymk9HT7ELeLB2/DHUSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I2hgJKdl; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I2hgJKdl"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21634338cfdso41851455ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314483; x=1738919283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K14zF8RGObITiXxNWEiw4I5DkmsIF3aHWMHaZssq3hI=;
        b=I2hgJKdl3OPXs8+EJ1ok6ua89wJXfblooZ7a2hfIOjzl1dRAVnoLucF7xBFnLaYBAS
         cl8jJg9Obrnjdocs1sB5oiUkY40jpE1RO9t9DCtLGB61Dh1dcdd2afjY0A1BhubpeFaE
         fYyOhfGCZRprKF5UXxyENQXxYvZJpPcPr5TeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314483; x=1738919283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K14zF8RGObITiXxNWEiw4I5DkmsIF3aHWMHaZssq3hI=;
        b=LFyehvmsY02gpQ2iCy+fQjCd4krQTIKhBoISQ+HlftFfQFYNvAKT83AAD6+CQbuiqD
         DSjEpfZKXlJ2VjmuVslhVs5PEZ62oSoNHEDCr1se+t5C7xtp/LEPhpMeel+R9otnVNBS
         Td3AF/E/sxe9gahvPjkgVBkgbTFJ3keMswFqWbvj83EdlirhBeoi1GXgFurv8QXPaps2
         7R8URLeVg2suu3c85isDuHxxU4KAMgyRJsyCQ/yOWf+yDR5oKU+jVNLFlsbNXbzzZ4PK
         2vK4MFU11zXez/Dcysi6LnUYeSZpMz5VxaR7lENpM9yn+LIQlCEPK7hIY+rz46++ItMg
         Mt/g==
X-Forwarded-Encrypted: i=1; AJvYcCXg7uO2+UUevNvGHMw9+6mKHA1rl284hTjbi1BYm08cEWTKfta8Ijmu0eWrKGi6yVVYVQ9PEppe1b/u3jM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwroOiuTug+zVwtmDz1+Qne3fqBIe8yFGytmMBaoM945zpcUIJj
	rIV38ZyGptCNeCrax3x4LhDmoSLyMVGATSzHv39elHFfC4RUbwlElYzYhhG8iA==
X-Gm-Gg: ASbGncuXL7oXsXosF99hK7iTfhp5l4zHzeBogmnh+mNbW/gxfw6SI7umn6F/Ds3FzIR
	pNfUNlV1iFEfNlb59Kcoe06zBDXRy8xwxJQErg2ebCc+gPxsEMALLuwzzlQS1K6Rutdlhyu4ESJ
	0T40nEhmBx+A/iuFI+8DVwNKkB9bWNC9nBrM6TR4HzHqr/4o6eFBxdfbE9KUGkwqyNvLKzZH0CA
	6gR+5W9/RLY/+HgHm8Z09fp4Hq9lIy5xAFDByWmG7CwpiK14muzvVPA2/UFZz42/Bgp2XDdilop
	xpahUYJkQjXHkkRrvQ==
X-Google-Smtp-Source: AGHT+IFoGKrZNGGlmGxZx2UZTouqjuhCYFoIKMcMR38ulc4zYXbCr002OD1N6TYgHMj1w9Keyos0HA==
X-Received: by 2002:a17:902:ecce:b0:211:3275:3fe with SMTP id d9443c01a7336-21dd7c65555mr158196745ad.17.1738314483547;
        Fri, 31 Jan 2025 01:08:03 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de31f80c2sm26197065ad.72.2025.01.31.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:08:03 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>
Subject: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Date: Fri, 31 Jan 2025 18:06:13 +0900
Message-ID: <20250131090658.3386285-15-senozhatsky@chromium.org>
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
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>
---
 mm/zsmalloc.c | 135 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 83 insertions(+), 52 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 4b4c77bc08f9..f5b5fe732e50 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -292,6 +292,9 @@ static inline void free_zpdesc(struct zpdesc *zpdesc)
 	__free_page(page);
 }
 
+#define ZS_PAGE_UNLOCKED	0
+#define ZS_PAGE_WRLOCKED	-1
+
 struct zspage {
 	struct {
 		unsigned int huge:HUGE_BITS;
@@ -304,7 +307,7 @@ struct zspage {
 	struct zpdesc *first_zpdesc;
 	struct list_head list; /* fullness list */
 	struct zs_pool *pool;
-	rwlock_t lock;
+	atomic_t lock;
 };
 
 struct mapping_area {
@@ -314,6 +317,59 @@ struct mapping_area {
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
@@ -325,12 +381,6 @@ static bool ZsHugePage(struct zspage *zspage)
 	return zspage->huge;
 }
 
-static void lock_init(struct zspage *zspage);
-static void migrate_read_lock(struct zspage *zspage);
-static void migrate_read_unlock(struct zspage *zspage);
-static void migrate_write_lock(struct zspage *zspage);
-static void migrate_write_unlock(struct zspage *zspage);
-
 #ifdef CONFIG_COMPACTION
 static void kick_deferred_free(struct zs_pool *pool);
 static void init_deferred_free(struct zs_pool *pool);
@@ -1026,7 +1076,7 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
 		return NULL;
 
 	zspage->magic = ZSPAGE_MAGIC;
-	lock_init(zspage);
+	zspage_lock_init(zspage);
 
 	for (i = 0; i < class->pages_per_zspage; i++) {
 		struct zpdesc *zpdesc;
@@ -1251,7 +1301,7 @@ void *zs_map_object(struct zs_pool *pool, unsigned long handle,
 	 * zs_unmap_object API so delegate the locking from class to zspage
 	 * which is smaller granularity.
 	 */
-	migrate_read_lock(zspage);
+	zspage_read_lock(zspage);
 	pool_read_unlock(pool);
 
 	class = zspage_class(pool, zspage);
@@ -1311,7 +1361,7 @@ void zs_unmap_object(struct zs_pool *pool, unsigned long handle)
 	}
 	local_unlock(&zs_map_area.lock);
 
-	migrate_read_unlock(zspage);
+	zspage_read_unlock(zspage);
 }
 EXPORT_SYMBOL_GPL(zs_unmap_object);
 
@@ -1705,18 +1755,18 @@ static void lock_zspage(struct zspage *zspage)
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
@@ -1727,41 +1777,16 @@ static void lock_zspage(struct zspage *zspage)
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
 
-static void lock_init(struct zspage *zspage)
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
@@ -1803,7 +1828,7 @@ static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 }
 
 static int zs_page_migrate(struct page *newpage, struct page *page,
-		enum migrate_mode mode)
+			   enum migrate_mode mode)
 {
 	struct zs_pool *pool;
 	struct size_class *class;
@@ -1819,15 +1844,12 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 
 	VM_BUG_ON_PAGE(!zpdesc_is_isolated(zpdesc), zpdesc_page(zpdesc));
 
-	/* We're committed, tell the world that this is a Zsmalloc page. */
-	__zpdesc_set_zsmalloc(newzpdesc);
-
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
 
 	/*
-	 * The pool lock protects the race between zpage migration
+	 * The pool->lock protects the race between zpage migration
 	 * and zs_free.
 	 */
 	pool_write_lock(pool);
@@ -1837,8 +1859,15 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
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
@@ -1869,7 +1898,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	 */
 	pool_write_unlock(pool);
 	size_class_unlock(class);
-	migrate_write_unlock(zspage);
+	zspage_write_unlock(zspage);
 
 	zpdesc_get(newzpdesc);
 	if (zpdesc_zone(newzpdesc) != zpdesc_zone(zpdesc)) {
@@ -2005,9 +2034,11 @@ static unsigned long __zs_compact(struct zs_pool *pool,
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
2.48.1.362.g079036d154-goog

