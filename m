Received: from mail-yb1-f228.google.com (mail-yb1-f228.google.com [209.85.219.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B9E56A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359807; cv=none; b=I3kKyb+iBHggxU2h7pLFlnGzgpZgmmkt+f5/aRuiWMAuq4h44EmkFGjoTxfYbXOa7Vb7aHNFZhdQ1oXm35qHwFnAxAGoMuuFPKJ+VG9NrdHvk9KI4TW1aFkwSZqwE98BUw+4FLr9TTAngYnAEJcGUf9psS7th6/lFVzrFVPygiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359807; c=relaxed/simple;
	bh=t9JeHMYuJFQFJqP5gt0M4thwwwP9l+X5gxYpzjhkUQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qM8fVWQytJkXOtjWhhZ6aRMmbbzhKSFF+VxAEzj77svoqgv2KvtCstT1ebiJqIRD9M5COIpPVDwNJCWec5Lv1IOMCljGDZvbuS12K/IZeBAzZizGusQUVLupa7Qp6yZn6WrbX+sFU3uXQjNoR0vQafX8kCAxB5vqA1aQy4iax1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=CCnermli; arc=none smtp.client-ip=209.85.219.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="CCnermli"
Received: by mail-yb1-f228.google.com with SMTP id 3f1490d57ef6-e728740b637so627811276.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745359804; x=1745964604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3duo+Csxu3imlxdQHveRRBWNAS1YAjez61JSWKYAhc=;
        b=CCnermliW/oVj10YTR860qaUSXe3gCEwOizOWlZI/zDVERUqL6xHavkvzB3NepyOMI
         fnocKtGbVKYkqWkFuvL8wV8fOj6tNxn3pBp3TfUiDtl+b80RJ4VFR9mYV1f3aOd/kq14
         LvC29X3g/g0xls9QkkWZlpAn3S7yfaFnc0kio4JAuauJByDyo0p92bbkEOSKtIV4ZIMt
         YmoL2u75NGCeLV0rJLtOubykh6CNKhWAH6ECQ54WbGpU9NRF0RBJLBKhQTUn+yO4Zbkf
         nMe8kHtuELI/lQMnu0fRKdLsRRnpJUlEYjosUUTDQTglAhzVWBSaQQY2Qg7GnCpOuQp6
         NalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359804; x=1745964604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3duo+Csxu3imlxdQHveRRBWNAS1YAjez61JSWKYAhc=;
        b=cS/pfLFsx/69+oGZxTvujS4eykWvUQTrKmJzaJ8Su6fe7YAoHkjvBgC632yUzkTzqF
         H6q3Bhab/jQKLTcPKadxCSwdgtL8cooV3CL0IhWDhdO09PoD1qcjREipStnV5SguifI9
         5KL05pM0u4EbsehuVykaMi5lp4OV6JP+tOu/r+R0ayYy9aCt01qn/k9a3iIhmW1KTVEy
         j0mlQN1nzp3M9kUIHX2jveOcsNJ+rTbWvkdXayF381IJEqijj2XkvDVK55lGA1xDhC9b
         2XxMHnkQhkX+Yg/bhqbJrma7hujmbHk4oGuzXWqTDWRm4zOc0tybLmHasHMWlxYx5EHN
         V04g==
X-Forwarded-Encrypted: i=1; AJvYcCVGUmK1KpBLzOgmMlGSYzEiDhavu2aHTy0jEfPguLCD2bqXvnL+JzIlLDgDl9lILHAsY/Z/YfWpIw+jbSE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/xbMJlAZCsKQvJgMjadHEQk62zA/lqXdAvJnavPDrp+LqLiz
	ZbupkBczDDMio7c2XG6pw/3Mna/fhB0fyx3u7bmFdUCBoPcRQqrYr9mJhqQPbOZftvUSHXcyF3l
	/uTarntDjLYry1+IJKMCF8cuVxnxFbfDCuCIRz6F5toAgqObl
X-Gm-Gg: ASbGncs1Th4QY3nXzyku5ywcxxKZzx2shD1J3VuQm6AllRZrNfaVfrCoaR485UX203x
	IRlBY0KO1XljcTgbzDSGB3NXLcDJsh17yZXQ0H6Gpsd7kMGUT92Xw/drc9w++qODxC81pB/FSn+
	2YFea/hm3/vgcB1sxuWk0rDpNzv3QcTbPt56oHVwJsWlDodYLbbiqqNCSmswF9CWU7ENWju+t1I
	HJXmVOlTnA59CuB50lDbUx0yc/YnxrLEecwdXozjt1pqRD0txX5HvtaOXpCUzNRa7HsJRbTBUQs
	fi9aLvehbB6W2d8++230qxO+Ia52Og==
X-Google-Smtp-Source: AGHT+IEYwgoo4RLAGc+GeQs8g8qLOVHt34WI8ndT0WmR16dcscV7Ta6VOH8lfCbw/+EtF9tG8Y5HbI0z+x3U
X-Received: by 2002:a05:690c:39b:b0:703:ac44:d369 with SMTP id 00721157ae682-706ccdda133mr109130937b3.5.1745359804156;
        Tue, 22 Apr 2025 15:10:04 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-706ca475061sm6640437b3.2.2025.04.22.15.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:10:04 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 9035B340159;
	Tue, 22 Apr 2025 16:10:03 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 8DF5EE41D69; Tue, 22 Apr 2025 16:10:03 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kanchan Joshi <joshi.k@samsung.com>,
	linux-nvme@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v5 1/3] dmapool: add NUMA affinity support
Date: Tue, 22 Apr 2025 16:09:50 -0600
Message-ID: <20250422220952.2111584-2-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250422220952.2111584-1-csander@purestorage.com>
References: <20250422220952.2111584-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Keith Busch <kbusch@kernel.org>

Introduce dma_pool_create_node(), like dma_pool_create() but taking an
additional NUMA node argument. Allocate struct dma_pool on the desired
node, and store the node on dma_pool for allocating struct dma_page.
Make dma_pool_create() an alias for dma_pool_create_node() with node set
to NUMA_NO_NODE.

Signed-off-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/dmapool.h | 17 +++++++++++++----
 mm/dmapool.c            | 16 ++++++++++------
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
index f632ecfb4238..bbf1833a24f7 100644
--- a/include/linux/dmapool.h
+++ b/include/linux/dmapool.h
@@ -9,19 +9,20 @@
  */
 
 #ifndef LINUX_DMAPOOL_H
 #define	LINUX_DMAPOOL_H
 
+#include <linux/nodemask_types.h>
 #include <linux/scatterlist.h>
 #include <asm/io.h>
 
 struct device;
 
 #ifdef CONFIG_HAS_DMA
 
-struct dma_pool *dma_pool_create(const char *name, struct device *dev, 
-			size_t size, size_t align, size_t allocation);
+struct dma_pool *dma_pool_create_node(const char *name, struct device *dev,
+			size_t size, size_t align, size_t boundary, int node);
 
 void dma_pool_destroy(struct dma_pool *pool);
 
 void *dma_pool_alloc(struct dma_pool *pool, gfp_t mem_flags,
 		     dma_addr_t *handle);
@@ -33,12 +34,13 @@ void dma_pool_free(struct dma_pool *pool, void *vaddr, dma_addr_t addr);
 struct dma_pool *dmam_pool_create(const char *name, struct device *dev,
 				  size_t size, size_t align, size_t allocation);
 void dmam_pool_destroy(struct dma_pool *pool);
 
 #else /* !CONFIG_HAS_DMA */
-static inline struct dma_pool *dma_pool_create(const char *name,
-	struct device *dev, size_t size, size_t align, size_t allocation)
+static inline struct dma_pool *dma_pool_create_node(const char *name,
+	struct device *dev, size_t size, size_t align, size_t boundary,
+	int node)
 { return NULL; }
 static inline void dma_pool_destroy(struct dma_pool *pool) { }
 static inline void *dma_pool_alloc(struct dma_pool *pool, gfp_t mem_flags,
 				   dma_addr_t *handle) { return NULL; }
 static inline void dma_pool_free(struct dma_pool *pool, void *vaddr,
@@ -47,10 +49,17 @@ static inline struct dma_pool *dmam_pool_create(const char *name,
 	struct device *dev, size_t size, size_t align, size_t allocation)
 { return NULL; }
 static inline void dmam_pool_destroy(struct dma_pool *pool) { }
 #endif /* !CONFIG_HAS_DMA */
 
+static inline struct dma_pool *dma_pool_create(const char *name,
+	struct device *dev, size_t size, size_t align, size_t boundary)
+{
+	return dma_pool_create_node(name, dev, size, align, boundary,
+				    NUMA_NO_NODE);
+}
+
 static inline void *dma_pool_zalloc(struct dma_pool *pool, gfp_t mem_flags,
 				    dma_addr_t *handle)
 {
 	return dma_pool_alloc(pool, mem_flags | __GFP_ZERO, handle);
 }
diff --git a/mm/dmapool.c b/mm/dmapool.c
index f0bfc6c490f4..4de531542814 100644
--- a/mm/dmapool.c
+++ b/mm/dmapool.c
@@ -54,10 +54,11 @@ struct dma_pool {		/* the pool */
 	size_t nr_pages;
 	struct device *dev;
 	unsigned int size;
 	unsigned int allocation;
 	unsigned int boundary;
+	int node;
 	char name[32];
 	struct list_head pools;
 };
 
 struct dma_page {		/* cacheable header for 'allocation' bytes */
@@ -197,16 +198,17 @@ static void pool_block_push(struct dma_pool *pool, struct dma_block *block,
 	pool->next_block = block;
 }
 
 
 /**
- * dma_pool_create - Creates a pool of consistent memory blocks, for dma.
+ * dma_pool_create_node - Creates a pool of consistent memory blocks, for dma.
  * @name: name of pool, for diagnostics
  * @dev: device that will be doing the DMA
  * @size: size of the blocks in this pool.
  * @align: alignment requirement for blocks; must be a power of two
  * @boundary: returned blocks won't cross this power of two boundary
+ * @node: optional NUMA node to allocate structs 'dma_pool' and 'dma_page' on
  * Context: not in_interrupt()
  *
  * Given one of these pools, dma_pool_alloc()
  * may be used to allocate memory.  Such memory will all have "consistent"
  * DMA mappings, accessible by the device and its driver without using
@@ -219,12 +221,13 @@ static void pool_block_push(struct dma_pool *pool, struct dma_block *block,
  * boundaries of 4KBytes.
  *
  * Return: a dma allocation pool with the requested characteristics, or
  * %NULL if one can't be created.
  */
-struct dma_pool *dma_pool_create(const char *name, struct device *dev,
-				 size_t size, size_t align, size_t boundary)
+struct dma_pool *dma_pool_create_node(const char *name, struct device *dev,
+				      size_t size, size_t align, size_t boundary,
+				      int node)
 {
 	struct dma_pool *retval;
 	size_t allocation;
 	bool empty;
 
@@ -249,11 +252,11 @@ struct dma_pool *dma_pool_create(const char *name, struct device *dev,
 	else if ((boundary < size) || (boundary & (boundary - 1)))
 		return NULL;
 
 	boundary = min(boundary, allocation);
 
-	retval = kzalloc(sizeof(*retval), GFP_KERNEL);
+	retval = kzalloc_node(sizeof(*retval), GFP_KERNEL, node);
 	if (!retval)
 		return retval;
 
 	strscpy(retval->name, name, sizeof(retval->name));
 
@@ -262,10 +265,11 @@ struct dma_pool *dma_pool_create(const char *name, struct device *dev,
 	INIT_LIST_HEAD(&retval->page_list);
 	spin_lock_init(&retval->lock);
 	retval->size = size;
 	retval->boundary = boundary;
 	retval->allocation = allocation;
+	retval->node = node;
 	INIT_LIST_HEAD(&retval->pools);
 
 	/*
 	 * pools_lock ensures that the ->dma_pools list does not get corrupted.
 	 * pools_reg_lock ensures that there is not a race between
@@ -293,11 +297,11 @@ struct dma_pool *dma_pool_create(const char *name, struct device *dev,
 		}
 	}
 	mutex_unlock(&pools_reg_lock);
 	return retval;
 }
-EXPORT_SYMBOL(dma_pool_create);
+EXPORT_SYMBOL(dma_pool_create_node);
 
 static void pool_initialise_page(struct dma_pool *pool, struct dma_page *page)
 {
 	unsigned int next_boundary = pool->boundary, offset = 0;
 	struct dma_block *block, *first = NULL, *last = NULL;
@@ -333,11 +337,11 @@ static void pool_initialise_page(struct dma_pool *pool, struct dma_page *page)
 
 static struct dma_page *pool_alloc_page(struct dma_pool *pool, gfp_t mem_flags)
 {
 	struct dma_page *page;
 
-	page = kmalloc(sizeof(*page), mem_flags);
+	page = kmalloc_node(sizeof(*page), mem_flags, pool->node);
 	if (!page)
 		return NULL;
 
 	page->vaddr = dma_alloc_coherent(pool->dev, pool->allocation,
 					 &page->dma, mem_flags);
-- 
2.45.2

