Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCCD149C50
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212312; cv=none; b=LncvHpo3uBMprc9/I7ddLZSB0YN5NO0zlIQ3STrD001obJ5WYNYX3qTk5qeNEbc9QkR1GUtdWumPlIWPTIXw3la5BC74MgGm6+2Pqc6W6XqauU5oF5WU4mdgrXmkgTCKTcbQI9ZoqeXROj0Lpvqdn/wi+HTM+vTsRhcvGB/YCoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212312; c=relaxed/simple;
	bh=BziQv4iV5STepAfuHgjzd6hfIYwqdyff/nRvfV2Mdgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=giUQTR96XgeFJX4Slwe/Bozzzd4YiV+d9RNnwQODbcvKW/uALD3b1RG9w9TdpjyBwQHiyuczx6sfng47HM6KltQ8HdDLfHAeZTVnYhpbeDSykVaD3iQtEPTWacANmsFvFrJbkcgxiZjqWjiwlWRfSG0SDjDPSFe5ZJJ/2jrWCHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RH0T0V/B; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RH0T0V/B"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2164b1f05caso5695945ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738212309; x=1738817109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkZn1kC+dMtAGDYo9TtmpyB1pyvIkC5NDATu7QnxsYw=;
        b=RH0T0V/BKaIB59ZUpFze0UZpkYBCFsQFpmmBJY82Y5lKVKE9O9GN1LC8SeszqJSmzv
         5PfE4ZJ+4/Ij/UoxHUnEEu1XXLAI2H4z++EqeEQuHZCXN3psLruhclla7yv+xzNT5w2h
         jXa8g5F/WuFYs7ojlQAXeknHakORlzGe1UR6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738212309; x=1738817109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkZn1kC+dMtAGDYo9TtmpyB1pyvIkC5NDATu7QnxsYw=;
        b=PEfH9G09IMLVcsgCCnoA1WvZN8PSuYxgfvjK9sYiQjTsJICTfM69M/Z6RcEakDgjQJ
         LvpiZpszoi8ECo3tudpwQDKiyUvX3X+uPjSP9eLxHS80RYg1Sv3YftDPG2CJvOfVNXji
         GzUJnNDmor9uUl8CR2svo+Gksen3m6QPypb2pkdqQ+sMTvJJpunbGJpZcq+J87oTYVb3
         qT3sBVjHXlyAUnL1KJDuXt6an9aqIvQ/SLmB9xWC55h6tpQk/wghJPj/5WUxcDdiqatf
         5/+cvliTU9qcEYY1aG8upUjQXtkGCIeLTrA7QSThP1lz5O46W1scoSIaYe7iyPe42cQl
         dwZg==
X-Forwarded-Encrypted: i=1; AJvYcCVD/5N8pbL66P5eQCLezpOGNALympBByhDIRMX8Z451FV+421TZpFp3bw/9V6RVcc4hsr+EYN5tSYhkYlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCGJeqhBtbIs1qmoYRtM3EMbspetlhyZeC+RIzguWhvAQibz84
	j1nkbxFeDlmNl70CKObEG+31kzg37/ZZkPWvtNxrheQSykIp2uBoSXVK5Ny4Ww==
X-Gm-Gg: ASbGnctWdnyJ2rWFwGTXRFVYqxR7tY8IANFn7tQ3wuYkvKZF5BaVFQ9FeyabcNavqQT
	F3iAnrtNPWPpbAcVgSj+gG5nvqOhB46fSx1lbtUCUk8QDZctcO3Xos+7xNGn/sOWnyLcd/nUHXt
	ZVx1CZ29JyrVhi0zOXENtuZoXGPFW5/ZJTi9O3M1q+6BX6pKCjlBqTw9KQajl8XSLqamXkC723v
	9/7aIQNwUBUhYughJx36p+Xv74fJy6b6wrWOLhV6yggo2HI0BaN6895NAoLdPF4GGI/3oDBu6BV
	tNaGIn4GwOX41jv9sA==
X-Google-Smtp-Source: AGHT+IGZ3YC1dM+qQG3bGdWrkOZcidEoUlnu3m+rti9TiEBtmbAsSMQiEuLAx2BRY18SnHSZlarSww==
X-Received: by 2002:a05:6a20:1584:b0:1e3:cf57:5f5f with SMTP id adf61e73a8af0-1ed7a6b290dmr9388630637.27.1738212308930;
        Wed, 29 Jan 2025 20:45:08 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-acebe8568fesm402564a12.40.2025.01.29.20.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 20:45:08 -0800 (PST)
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
Subject: [PATCHv2 1/7] zsmalloc: factor out pool locking helpers
Date: Thu, 30 Jan 2025 13:42:44 +0900
Message-ID: <20250130044455.2642465-2-senozhatsky@chromium.org>
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

We currently have a mix of migrate_{read,write}_lock() helpers
that lock zspages, but it's zs_pool that actually has a ->migrate_lock
access to which is opene-coded.  Factor out pool migrate locking
into helpers, zspage migration locking API will be renamed to
reduce confusion.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zsmalloc.c | 47 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 6d0e47f7ae33..8972b4b56cd3 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -228,6 +228,31 @@ struct zs_pool {
 	atomic_t compaction_in_progress;
 };
 
+static void pool_write_unlock(struct zs_pool *pool)
+{
+	write_unlock(&pool->migrate_lock);
+}
+
+static void pool_write_lock(struct zs_pool *pool)
+{
+	write_lock(&pool->migrate_lock);
+}
+
+static void pool_read_unlock(struct zs_pool *pool)
+{
+	read_unlock(&pool->migrate_lock);
+}
+
+static void pool_read_lock(struct zs_pool *pool)
+{
+	read_lock(&pool->migrate_lock);
+}
+
+static bool pool_lock_is_contended(struct zs_pool *pool)
+{
+	return rwlock_is_contended(&pool->migrate_lock);
+}
+
 static inline void zpdesc_set_first(struct zpdesc *zpdesc)
 {
 	SetPagePrivate(zpdesc_page(zpdesc));
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
@@ -1453,13 +1478,13 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
 	 * The pool->migrate_lock protects the race with zpage's migration
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
@@ -1796,7 +1821,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	 * The pool migrate_lock protects the race between zpage migration
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
-- 
2.48.1.262.g85cc9f2d1e-goog

