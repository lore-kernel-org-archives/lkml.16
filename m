Received: from smtp117.iad3b.emailsrvr.com (smtp117.iad3b.emailsrvr.com [146.20.161.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC91EBFF0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717631; cv=none; b=preHevnHcec7M5zBM8FMvoD3kFWM8UTMaqL2Xf42GXGOp7vBiQennQajaNO8n9RVNqoEiXbQ8iuSOWlug2f2fZhRgWnvuyO0aSKEwhO+udVP8s+YgFG9Be2zspoa9BhL5K0n7Zo1FV+UupDLhrcGWyXJslAllt5GTl2AgGWNZG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717631; c=relaxed/simple;
	bh=3XiA9Jo1cTtKj6ZYQ9r0yPn+Uqy5Q+V6czZhQJzNfR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coub3C9LUKnXrMFKIi4lYR1FiB+Su7eaJVglCzEzFyPA0OtX6NOQINxLSsU6GBJEA6v/kOJCWnU6rD7Ilu8a0yTmrwLePBzDrRRB55jBHSNuZv1aMNNxof+C9sEqaMV1MVGRT8OFIX6jZdSSFDsEA4poau58XZu2VfBe2/1I+GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=sLZClKJq; arc=none smtp.client-ip=146.20.161.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="sLZClKJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1744717228;
	bh=3XiA9Jo1cTtKj6ZYQ9r0yPn+Uqy5Q+V6czZhQJzNfR4=;
	h=From:To:Subject:Date:From;
	b=sLZClKJq62fu4SXZx1J3XZxvCIgdXFVHjgUNyQU78p7t5x3dxx6rxjUaMNypuoKXc
	 2e2VOn6XBO1gpN6MOH2oPYOB1lT24hjGjre8IRDBuXGwwIGMuUPdZ7Xv1qMc3sJVGV
	 VgiBRBOZEe+xGl7whf+pNYimndGNchhttPUNsbvQ=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp15.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id D79BAC0358;
	Tue, 15 Apr 2025 07:40:27 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH 4/4] comedi: allocate DMA coherent buffer as individual pages
Date: Tue, 15 Apr 2025 12:35:59 +0100
Message-ID: <20250415114008.5977-5-abbotti@mev.co.uk>
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
X-Classification-ID: 8a53f2c5-5989-413b-be2c-df2839710a9a-5-1

Depending on the driver, the acquisition buffer is allocated either from
normal memory, or from DMA coherent memory.  For normal memory, the
buffer is allocated as individual pages, but for DMA coherent memory, it
is allocated as a single block.  Prior to commit e36472145aa7 ("staging:
comedi: use dma_mmap_coherent for DMA-able buffer mmap"), the buffer was
allocated as individual pages for DMA coherent memory too, but that was
changed to allocate it as a single block to allow `dma_mmap_coherent()`
to be used to mmap it, because that requires the pages being mmap'ed to
be contiguous.

This patch allocates the buffer from DMA coherent memory a page at a
time again, and works around the limitation of `dma_mmap_coherent()` by
calling it in a loop for each page, with temporarily modified `vm_start`
and `vm_end` values in the VMA.  (The `vm_pgoff` value is 0.)

Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/comedi/comedi_buf.c  | 43 ++++++++++++------------------------
 drivers/comedi/comedi_fops.c | 43 +++++++++++++++++++++++-------------
 2 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/drivers/comedi/comedi_buf.c b/drivers/comedi/comedi_buf.c
index 5807007bb3dd..002c0e76baff 100644
--- a/drivers/comedi/comedi_buf.c
+++ b/drivers/comedi/comedi_buf.c
@@ -27,14 +27,12 @@ static void comedi_buf_map_kref_release(struct kref *kref)
 
 	if (bm->page_list) {
 		if (bm->dma_dir != DMA_NONE) {
-			/*
-			 * DMA buffer was allocated as a single block.
-			 * Address is in page_list[0].
-			 */
-			buf = &bm->page_list[0];
-			dma_free_coherent(bm->dma_hw_dev,
-					  PAGE_SIZE * bm->n_pages,
-					  buf->virt_addr, buf->dma_addr);
+			for (i = 0; i < bm->n_pages; i++) {
+				buf = &bm->page_list[i];
+				dma_free_coherent(bm->dma_hw_dev, PAGE_SIZE,
+						  buf->virt_addr,
+						  buf->dma_addr);
+			}
 		} else {
 			for (i = 0; i < bm->n_pages; i++) {
 				buf = &bm->page_list[i];
@@ -88,26 +86,14 @@ comedi_buf_map_alloc(struct comedi_device *dev, enum dma_data_direction dma_dir,
 		goto err;
 
 	if (bm->dma_dir != DMA_NONE) {
-		void *virt_addr;
-		dma_addr_t dma_addr;
-
-		/*
-		 * Currently, the DMA buffer needs to be allocated as a
-		 * single block so that it can be mmap()'ed.
-		 */
-		virt_addr = dma_alloc_coherent(bm->dma_hw_dev,
-					       PAGE_SIZE * n_pages, &dma_addr,
-					       GFP_KERNEL);
-		if (!virt_addr)
-			goto err;
-
 		for (i = 0; i < n_pages; i++) {
 			buf = &bm->page_list[i];
-			buf->virt_addr = virt_addr + (i << PAGE_SHIFT);
-			buf->dma_addr = dma_addr + (i << PAGE_SHIFT);
+			buf->virt_addr =
+			    dma_alloc_coherent(bm->dma_hw_dev, PAGE_SIZE,
+					       &buf->dma_addr, GFP_KERNEL);
+			if (!buf->virt_addr)
+				break;
 		}
-
-		bm->n_pages = i;
 	} else {
 		for (i = 0; i < n_pages; i++) {
 			buf = &bm->page_list[i];
@@ -117,11 +103,10 @@ comedi_buf_map_alloc(struct comedi_device *dev, enum dma_data_direction dma_dir,
 
 			SetPageReserved(virt_to_page(buf->virt_addr));
 		}
-
-		bm->n_pages = i;
-		if (i < n_pages)
-			goto err;
 	}
+	bm->n_pages = i;
+	if (i < n_pages)
+		goto err;
 
 	return bm;
 
diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index 37cfef36c1ad..3383a7ce27ff 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -2387,13 +2387,27 @@ static int comedi_mmap(struct file *file, struct vm_area_struct *vma)
 		goto done;
 	}
 	if (bm->dma_dir != DMA_NONE) {
+		unsigned long vm_start = vma->vm_start;
+		unsigned long vm_end = vma->vm_end;
+
 		/*
-		 * DMA buffer was allocated as a single block.
-		 * Address is in page_list[0].
+		 * Buffer pages are not contiguous, so temporarily modify VMA
+		 * start and end addresses for each buffer page.
 		 */
-		buf = &bm->page_list[0];
-		retval = dma_mmap_coherent(bm->dma_hw_dev, vma, buf->virt_addr,
-					   buf->dma_addr, n_pages * PAGE_SIZE);
+		for (i = 0; i < n_pages; ++i) {
+			buf = &bm->page_list[i];
+			vma->vm_start = start;
+			vma->vm_end = start + PAGE_SIZE;
+			retval = dma_mmap_coherent(bm->dma_hw_dev, vma,
+						   buf->virt_addr,
+						   buf->dma_addr, PAGE_SIZE);
+			if (retval)
+				break;
+
+			start += PAGE_SIZE;
+		}
+		vma->vm_start = vm_start;
+		vma->vm_end = vm_end;
 	} else {
 		for (i = 0; i < n_pages; ++i) {
 			unsigned long pfn;
@@ -2407,19 +2421,18 @@ static int comedi_mmap(struct file *file, struct vm_area_struct *vma)
 
 			start += PAGE_SIZE;
 		}
+	}
 
 #ifdef CONFIG_MMU
-		/*
-		 * Leaving behind a partial mapping of a buffer we're about to
-		 * drop is unsafe, see remap_pfn_range_notrack().
-		 * We need to zap the range here ourselves instead of relying
-		 * on the automatic zapping in remap_pfn_range() because we call
-		 * remap_pfn_range() in a loop.
-		 */
-		if (retval)
-			zap_vma_ptes(vma, vma->vm_start, size);
+	/*
+	 * Leaving behind a partial mapping of a buffer we're about to drop is
+	 * unsafe, see remap_pfn_range_notrack().  We need to zap the range
+	 * here ourselves instead of relying on the automatic zapping in
+	 * remap_pfn_range() because we call remap_pfn_range() in a loop.
+	 */
+	if (retval)
+		zap_vma_ptes(vma, vma->vm_start, size);
 #endif
-	}
 
 	if (retval == 0) {
 		vma->vm_ops = &comedi_vm_ops;
-- 
2.47.2

