Received: from smtp117.iad3b.emailsrvr.com (smtp117.iad3b.emailsrvr.com [146.20.161.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD771DE2D6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717632; cv=none; b=d/qj+xuwggVOc21YURSJxZ3MVNe7dE9qU2tKkaBjAjAXVXY2GZV0riRB0M8rNsIfwvvWGHn78zLSfuoajnfSp6VOr1+I18MBq4xOhhT+Q+XizG1xzmWJHBBcFzA0ZySQNpPZIE8VXadsWB40uewpLc9n6cMnH5G8qqnM0ov2RKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717632; c=relaxed/simple;
	bh=F5RCZgD7o87oQZUpFxCLl9/2kHwyCIEn26RkRT2gcpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ug2Hs6YIe00teD9ejN6n76h3WNBU7q4TvCYbqgwjLn6DlX6yNcDsOffRPa2yAcI3P9SfGg/wjWlwpSjiyQ2JV2epQJFSH6n11DqnKD4CBf37WqMEMdtlxWTlI8Q/IgAFKW4xzdFGWxftKwgIybHsqFoGfZD8KYU84uWtiRPiFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=EvE5I9QM; arc=none smtp.client-ip=146.20.161.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="EvE5I9QM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1744717227;
	bh=F5RCZgD7o87oQZUpFxCLl9/2kHwyCIEn26RkRT2gcpU=;
	h=From:To:Subject:Date:From;
	b=EvE5I9QMZJnxGhZE5GJhiKxLpzmdgwhVsyyhrxhRbw4L7Ky9RlhDswd54/KsJdich
	 kTXfYpexUSbqGh4gwe/DChFW99n55JnVhaD6/Czcm5IRFQiQM43WKLnnlYCsbeTQqY
	 yAUSTw5/HNzrI5wqghUosFtDWx3MQsHFchHgVvkU=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp15.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id DB58BC0356;
	Tue, 15 Apr 2025 07:40:26 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH 3/4] comedi: remove the mapping of the Comedi buffer in vmalloc address space
Date: Tue, 15 Apr 2025 12:35:58 +0100
Message-ID: <20250415114008.5977-4-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250415114008.5977-1-abbotti@mev.co.uk>
References: <20250415114008.5977-1-abbotti@mev.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 8a53f2c5-5989-413b-be2c-df2839710a9a-4-1

Now that all the code that accesses the Comedi buffer data does so
page-by-page, using the `virt_addr` member of `struct comedi_buf_page`
to point to the data of each page, do not linearly map the buffer into
vmalloc address space (pointed to by the `prealloc_buf` member of
`struct comedi_async`).  That was only done for convenience, but was not
done for those drivers that need a DMA coherent buffer, which is
allocated in a single chunk.  Remove the `prealloc_buf` member as it is
no longer used.

Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/comedi/comedi_buf.c      | 45 +++-----------------------------
 include/linux/comedi/comedidev.h | 10 ++-----
 2 files changed, 6 insertions(+), 49 deletions(-)

diff --git a/drivers/comedi/comedi_buf.c b/drivers/comedi/comedi_buf.c
index 0d956dd40a2b..5807007bb3dd 100644
--- a/drivers/comedi/comedi_buf.c
+++ b/drivers/comedi/comedi_buf.c
@@ -56,13 +56,7 @@ static void __comedi_buf_free(struct comedi_device *dev,
 	struct comedi_buf_map *bm;
 	unsigned long flags;
 
-	if (async->prealloc_buf) {
-		if (s->async_dma_dir == DMA_NONE)
-			vunmap(async->prealloc_buf);
-		async->prealloc_buf = NULL;
-		async->prealloc_bufsz = 0;
-	}
-
+	async->prealloc_bufsz = 0;
 	spin_lock_irqsave(&s->spin_lock, flags);
 	bm = async->buf_map;
 	async->buf_map = NULL;
@@ -141,11 +135,8 @@ static void __comedi_buf_alloc(struct comedi_device *dev,
 			       unsigned int n_pages)
 {
 	struct comedi_async *async = s->async;
-	struct page **pages = NULL;
 	struct comedi_buf_map *bm;
-	struct comedi_buf_page *buf;
 	unsigned long flags;
-	unsigned int i;
 
 	if (!IS_ENABLED(CONFIG_HAS_DMA) && s->async_dma_dir != DMA_NONE) {
 		dev_err(dev->class_dev,
@@ -160,30 +151,7 @@ static void __comedi_buf_alloc(struct comedi_device *dev,
 	spin_lock_irqsave(&s->spin_lock, flags);
 	async->buf_map = bm;
 	spin_unlock_irqrestore(&s->spin_lock, flags);
-
-	if (bm->dma_dir != DMA_NONE) {
-		/*
-		 * DMA buffer was allocated as a single block.
-		 * Address is in page_list[0].
-		 */
-		buf = &bm->page_list[0];
-		async->prealloc_buf = buf->virt_addr;
-	} else {
-		pages = vmalloc(sizeof(struct page *) * n_pages);
-		if (!pages)
-			return;
-
-		for (i = 0; i < n_pages; i++) {
-			buf = &bm->page_list[i];
-			pages[i] = virt_to_page(buf->virt_addr);
-		}
-
-		/* vmap the pages to prealloc_buf */
-		async->prealloc_buf = vmap(pages, n_pages, VM_MAP,
-					   COMEDI_PAGE_PROTECTION);
-
-		vfree(pages);
-	}
+	async->prealloc_bufsz = n_pages << PAGE_SHIFT;
 }
 
 void comedi_buf_map_get(struct comedi_buf_map *bm)
@@ -264,7 +232,7 @@ int comedi_buf_alloc(struct comedi_device *dev, struct comedi_subdevice *s,
 	new_size = (new_size + PAGE_SIZE - 1) & PAGE_MASK;
 
 	/* if no change is required, do nothing */
-	if (async->prealloc_buf && async->prealloc_bufsz == new_size)
+	if (async->prealloc_bufsz == new_size)
 		return 0;
 
 	/* deallocate old buffer */
@@ -275,14 +243,9 @@ int comedi_buf_alloc(struct comedi_device *dev, struct comedi_subdevice *s,
 		unsigned int n_pages = new_size >> PAGE_SHIFT;
 
 		__comedi_buf_alloc(dev, s, n_pages);
-
-		if (!async->prealloc_buf) {
-			/* allocation failed */
-			__comedi_buf_free(dev, s);
+		if (!async->prealloc_bufsz)
 			return -ENOMEM;
-		}
 	}
-	async->prealloc_bufsz = new_size;
 
 	return 0;
 }
diff --git a/include/linux/comedi/comedidev.h b/include/linux/comedi/comedidev.h
index c08416a7364b..4cb0400ad616 100644
--- a/include/linux/comedi/comedidev.h
+++ b/include/linux/comedi/comedidev.h
@@ -234,16 +234,12 @@ struct comedi_buf_page {
  *
  * A COMEDI data buffer is allocated as individual pages, either in
  * conventional memory or DMA coherent memory, depending on the attached,
- * low-level hardware device.  (The buffer pages also get mapped into the
- * kernel's contiguous virtual address space pointed to by the 'prealloc_buf'
- * member of &struct comedi_async.)
+ * low-level hardware device.
  *
  * The buffer is normally freed when the COMEDI device is detached from the
  * low-level driver (which may happen due to device removal), but if it happens
  * to be mmapped at the time, the pages cannot be freed until the buffer has
- * been munmapped.  That is what the reference counter is for.  (The virtual
- * address space pointed by 'prealloc_buf' is freed when the COMEDI device is
- * detached.)
+ * been munmapped.  That is what the reference counter is for.
  */
 struct comedi_buf_map {
 	struct device *dma_hw_dev;
@@ -255,7 +251,6 @@ struct comedi_buf_map {
 
 /**
  * struct comedi_async - Control data for asynchronous COMEDI commands
- * @prealloc_buf: Kernel virtual address of allocated acquisition buffer.
  * @prealloc_bufsz: Buffer size (in bytes).
  * @buf_map: Map of buffer pages.
  * @max_bufsize: Maximum allowed buffer size (in bytes).
@@ -344,7 +339,6 @@ struct comedi_buf_map {
  * less than or equal to UINT_MAX).
  */
 struct comedi_async {
-	void *prealloc_buf;
 	unsigned int prealloc_bufsz;
 	struct comedi_buf_map *buf_map;
 	unsigned int max_bufsize;
-- 
2.47.2

