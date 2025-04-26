Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6171E1E0E01
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745633279; cv=none; b=iV4SFFL2GbIfQfvp3RfKnknXKVzqpqeD0SKbniPJ2xn/QLUUUz0TbENTCLyO918L1HQZlzSauW4vdWMZ7fR37Zyw7eBm5soKqewhAaakOXCC2aznM5cTmijkZA3N6xQWs6BxnyJza5BGfDVy8SprhlteoZNimMZ2O4B0j8twq6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745633279; c=relaxed/simple;
	bh=RVl1/x48L5QPFusv576G2o1dt5vcOYipuP+xPdQuLaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzPJXOLKy41WqWtdZF/GCCi93NqsFCBx/phmJfLCFpsyZJxascXMRPH0GDUtJxISd2fp8N38CjE71qDa1CwgCcYoc1fWQrGEtbnbfmk1gjh+ea/n5vW6Sl6HWR5nDiWk6u5ImAFxOQhm3LV6MJoUppO1lKWFKoBd1PJMa7XLs6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=GDhj90U9; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="GDhj90U9"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-227e29b6c55so4993025ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745633276; x=1746238076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z70/ocLe9ndcQrFKMiE0tdyuA0H8cSwf3KgSSnH+OZY=;
        b=GDhj90U9fLXHDc0bjivdvI2PczPJpN3mGJ3POx7W31Kr0WKqx+lnYJSAVons3fB53G
         wWgrdQ03t1AKcv9bKXfKNxXqmOrpwnxzDoW3W8MwZTS7fayVgGUeTMOVUe5IFV43cL1H
         eBBMJWBYu+v2Twjikczf3ro8Or2t6M9m06Tbsp7hh0tKudAV8sae+GPF8eCgK5iWbw2g
         s4KEP2JwXsXnIyfDfTIfrRwj2DRIN5ExnLO8PhEOlHqKWP3L0hdZCrTf9aJ0rCVPX5kG
         6GAI8o8jEZzPVDXimTtpPkV+eMU+s6fJ01t34D8eM24dT6pfSx6BMZOif3yJ5IncnUXb
         QOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745633276; x=1746238076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z70/ocLe9ndcQrFKMiE0tdyuA0H8cSwf3KgSSnH+OZY=;
        b=W9VKH+zqJmI6HoHgN1gDGUW+gpaIdg9wcBMIQjsuo5auWWqr/Bie02ytYzIuX8f9a5
         R31fQc9s4s6VLgjuMq8cI5Zk2HcuLk8x2u8tiZl4grbIQIW9O3MdaCVVqEeJPBqTJboA
         SVpDQIshnv+VqWeVgFQRH080hNwXGRdUcEzRh43dazWGKRElP2HUNuCn9erNBtxpTE62
         b4zxmG4aiS/UhObljlousj+8D0+QyJgC4LfdrNr9V90H6q8/S1uEFufo9Q829oGkhcgJ
         iSoSgZkVMtecaSwPnJDE5z4f8K+y4GSWWCrfVqQJAoJ1yg0At6rZckpovIffwUifyUEy
         Yhwg==
X-Forwarded-Encrypted: i=1; AJvYcCUOiSXcx56LVwWgUyP4Ods06dHu5ZyT5YNfYlw2qQpNcqp3VgVVmwPsh0MqrFG6x9ZS0JHHbhqmpwnRr5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVLElx1rteIARLmtaAk9VQSSrukjy128diYqvf5Q8eau3DJ5bP
	Jzwb0ctkXi7MU3plISgiD7nVYFh6y9RUEfHVRP+AYjSpQEPcmOU1JIicFIL+35bJwN5ZRSCkejR
	eXZNBb9a0D/C+4pUYZPUiAEgUynR+9Wrbhf5Kk1Yk8ag9xEEN
X-Gm-Gg: ASbGnctRsj3oniXPLiM2dkYKB9dSngRt76KbYpHgSas7qbfes26h+iXH1rhhorKcuqU
	R89adgkAv2lOwaAPRP0xJSw8bWSdq0edeiK8xeQ8ywySRR48Gb+5HMBqNUtKx0x17rwFHT9/3x0
	MwWsaDM2yAYGeBHaF9t7K2r1QZcv/3aS1YJn+k6W5AydD4zp4ak8tIyz7wFdv+2BEh46/MRaMwG
	+FNZhU65wxG0FlYtYFrUjGuzBvbR/mfXvzieOwsOrDGXGIdzPqEFhpmDiQS31pZjupbu5xtwdXQ
	za+4N23hg0phlddiDrpzC0Pue106/w==
X-Google-Smtp-Source: AGHT+IEulsOmKO4sgUil3cqmh9Xg2ydaQ8ijeOqIsJOY/rWdqDrzJZvwB2xMFq9zFifYJhH8Z0JN0UgN+RXx
X-Received: by 2002:a17:902:d590:b0:21f:3e2d:7d43 with SMTP id d9443c01a7336-22dbf73b05dmr23686325ad.13.1745633276515;
        Fri, 25 Apr 2025 19:07:56 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-22db4f4523csm2250405ad.69.2025.04.25.19.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:07:56 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id D32F7340231;
	Fri, 25 Apr 2025 20:07:55 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id D0AABE41C66; Fri, 25 Apr 2025 20:07:55 -0600 (MDT)
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
Subject: [PATCH v6 1/3] dmapool: add NUMA affinity support
Date: Fri, 25 Apr 2025 20:06:34 -0600
Message-ID: <20250426020636.34355-2-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250426020636.34355-1-csander@purestorage.com>
References: <20250426020636.34355-1-csander@purestorage.com>
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
Reviewed-by: Jens Axboe <axboe@kernel.dk>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
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

