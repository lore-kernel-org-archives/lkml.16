Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B06985931
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344083; cv=none; b=mZvaMh3vYtYbjQrPwf5CPoCtXgtJpXVlV+xVQG05KyY/aeCN01s5fLWZmWCaUPilvpWtlPxHodLHllal31y350fopebmq6VobyXy1b53m0SyMwIpvJyfE1o7aNPrrTK/i0wswrI6r6bwr1+q/2dLoZkMlilTXXmTkdX6X6/Z+ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344083; c=relaxed/simple;
	bh=9R+Cf90mu3T0JORLd0H9EtQSXnYP+uLphYhUM+1N30g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcJmeY1/zuRtVV7yi5MI2gLeD9jp8ec1LQAVCfUASRilObPLB32tGRzN6YaH9s5/Pv0ADx6DSF/0Pl71OleoOqq2+IsJo3uNZfFYpYgLwTfOPeiXO59TybAXAEOdrtSfmYxvFJnoHYESqIIEGoPKz/IgPbvcx9kNO+G1BV5mWsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SotAurz+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SotAurz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A223C4CEE9;
	Tue, 22 Apr 2025 17:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745344082;
	bh=9R+Cf90mu3T0JORLd0H9EtQSXnYP+uLphYhUM+1N30g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SotAurz+nkXj5Gf6vpop4SQSYFnlC3FI5agC0HNCqyf27ygMtyk1qtXJp+DIlrS8N
	 zfJyAnwU/yhUlK0TogsF04JexILmPcpXslwlfyVcRM4QmTHt7gcZQKrhblaxqG1tE+
	 zjHB9kjn/AHw0V2ecLgY/QtIi9C7z6fhE6yzaIDYlq6JYu3D4FKErm+NKysY2I/aXf
	 pqkuao4WPADk792tpFDLVtSmS165joyX+E51PYIJYz+/DLP5HBX++KgcCE7A3Dqy5P
	 qKQR7iZf4A812KMg4EcUE1s7Hn4awc3qccqEhSK/ERj6RZzTdobRzOiD7aaqmXRlUE
	 qxTbJgtvN89lA==
Date: Tue, 22 Apr 2025 11:48:00 -0600
From: Keith Busch <kbusch@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] nvme/pci: PRP list DMA pool partitioning
Message-ID: <aAfWUGAMTpwsHf2b@kbusch-mbp.dhcp.thefacebook.com>
References: <20250422161959.1958205-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422161959.1958205-1-csander@purestorage.com>

On Tue, Apr 22, 2025 at 10:19:57AM -0600, Caleb Sander Mateos wrote:
> This reduces the _raw_spin_lock_irqsave overhead by about half, to
> 1.2%.

Could you try this atop your series? I hope to see if we can squeeze a
little more out by keeping the spinlock and list links local to the node
using them.

---
diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index cbd7734922f91..08a1488155084 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -412,9 +412,10 @@ nvme_setup_prp_pools(struct nvme_dev *dev, unsigned numa_node)
 	if (prp_pools->small)
 		return prp_pools; /* already initialized */
 
-	prp_pools->large = dma_pool_create("prp list page", dev->dev,
+	prp_pools->large = dma_pool_create_node("prp list page", dev->dev,
 						NVME_CTRL_PAGE_SIZE,
-						NVME_CTRL_PAGE_SIZE, 0);
+						NVME_CTRL_PAGE_SIZE, 0,
+						numa_node);
 	if (!prp_pools->large)
 		return ERR_PTR(-ENOMEM);
 
@@ -422,8 +423,9 @@ nvme_setup_prp_pools(struct nvme_dev *dev, unsigned numa_node)
 		small_align = 512;
 
 	/* Optimisation for I/Os between 4k and 128k */
-	prp_pools->small = dma_pool_create("prp list 256", dev->dev,
-						256, small_align, 0);
+	prp_pools->small = dma_pool_create_node("prp list 256", dev->dev,
+						256, small_align, 0,
+						numa_node);
 	if (!prp_pools->small) {
 		dma_pool_destroy(prp_pools->large);
 		prp_pools->large = NULL;
diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
index f632ecfb42384..36cb5f66111c6 100644
--- a/include/linux/dmapool.h
+++ b/include/linux/dmapool.h
@@ -18,8 +18,16 @@ struct device;
 
 #ifdef CONFIG_HAS_DMA
 
-struct dma_pool *dma_pool_create(const char *name, struct device *dev, 
-			size_t size, size_t align, size_t allocation);
+struct dma_pool *dma_pool_create_node(const char *name, struct device *dev,
+			size_t size, size_t align, size_t allocation, int node);
+
+static inline struct dma_pool *dma_pool_create(const char *name,
+			struct device *dev, size_t size, size_t align,
+			size_t allocation)
+{
+	return dma_pool_create_node(name, dev, size, align, allocation,
+				    NUMA_NO_NODE);
+}
 
 void dma_pool_destroy(struct dma_pool *pool);
 
@@ -35,6 +43,10 @@ struct dma_pool *dmam_pool_create(const char *name, struct device *dev,
 void dmam_pool_destroy(struct dma_pool *pool);
 
 #else /* !CONFIG_HAS_DMA */
+static inline struct dma_pool *dma_pool_create_node(const char *name,
+	struct device *dev, size_t size, size_t align, size_t allocation,
+	int node);
+{ return NULL; }
 static inline struct dma_pool *dma_pool_create(const char *name,
 	struct device *dev, size_t size, size_t align, size_t allocation)
 { return NULL; }
diff --git a/mm/dmapool.c b/mm/dmapool.c
index f0bfc6c490f4e..e07242b18c576 100644
--- a/mm/dmapool.c
+++ b/mm/dmapool.c
@@ -56,6 +56,7 @@ struct dma_pool {		/* the pool */
 	unsigned int size;
 	unsigned int allocation;
 	unsigned int boundary;
+	int node;
 	char name[32];
 	struct list_head pools;
 };
@@ -199,12 +200,13 @@ static void pool_block_push(struct dma_pool *pool, struct dma_block *block,
 
 
 /**
- * dma_pool_create - Creates a pool of consistent memory blocks, for dma.
+ * dma_pool_create_node - Creates a pool of consistent memory blocks, for dma.
  * @name: name of pool, for diagnostics
  * @dev: device that will be doing the DMA
  * @size: size of the blocks in this pool.
  * @align: alignment requirement for blocks; must be a power of two
  * @boundary: returned blocks won't cross this power of two boundary
+ * @node: NUMA node to use when allocating structs 'dma_pool' and 'dma_page'
  * Context: not in_interrupt()
  *
  * Given one of these pools, dma_pool_alloc()
@@ -221,8 +223,8 @@ static void pool_block_push(struct dma_pool *pool, struct dma_block *block,
  * Return: a dma allocation pool with the requested characteristics, or
  * %NULL if one can't be created.
  */
-struct dma_pool *dma_pool_create(const char *name, struct device *dev,
-				 size_t size, size_t align, size_t boundary)
+struct dma_pool *dma_pool_create_node(const char *name, struct device *dev,
+			size_t size, size_t align, size_t boundary, int node)
 {
 	struct dma_pool *retval;
 	size_t allocation;
@@ -251,13 +253,14 @@ struct dma_pool *dma_pool_create(const char *name, struct device *dev,
 
 	boundary = min(boundary, allocation);
 
-	retval = kzalloc(sizeof(*retval), GFP_KERNEL);
+	retval = kzalloc_node(sizeof(*retval), GFP_KERNEL, node);
 	if (!retval)
 		return retval;
 
 	strscpy(retval->name, name, sizeof(retval->name));
 
 	retval->dev = dev;
+	retval->node = node;
 
 	INIT_LIST_HEAD(&retval->page_list);
 	spin_lock_init(&retval->lock);
@@ -335,7 +338,7 @@ static struct dma_page *pool_alloc_page(struct dma_pool *pool, gfp_t mem_flags)
 {
 	struct dma_page *page;
 
-	page = kmalloc(sizeof(*page), mem_flags);
+	page = kmalloc_node(sizeof(*page), mem_flags, pool->node);
 	if (!page)
 		return NULL;
 
--
