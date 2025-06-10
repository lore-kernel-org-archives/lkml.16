Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC6B2BEC42
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561385; cv=none; b=ciPndKB5AbuZme7HOXVLR2vwntumUXeS35H6whAIBD3d7CK+6njCH/TcuOSSveh0wx6E4coU/TiqDTjcKIGoH8/DrvF9FojM9HcxbjvOgZewvS3bvI2zUG+KqRbihaJRgeQT3wD3BYyLE9Nwa03w1dXK7ZVqV20Vwsh97lSaOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561385; c=relaxed/simple;
	bh=xFLKe3DGDZE+MtUUiJT9DrXOdykiAsxL3IMpaXC3w8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8jJg3E/Q5JCESM2Dbr4CGIp0H+oC1YP1d3AH3/8TxgHqrUyti5lPGs7VAu3YojIsFRKmSA7Ahc0Yi7zF9xZfaq2QKCOslV0lJDO+0pvouw/QxCIxj+z8X/fO1EwPPE94yZsjk+pNnDi9ZIEIKmEpuVK3l8A1K0Njh1rMGwpz3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ixr3gHCi; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ixr3gHCi"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade5a0442dfso377426166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561381; x=1750166181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/zrQKrz1ZdcacJlKYkPsE2jrLvANF9CRh8hMHgIKxo=;
        b=Ixr3gHCiuYHUMs+1PJXBwoxs0pNceFPRzX4A4+mRXQIAdLoMBz7j6LAVIGfDxS5/pp
         A3KPOcr+PYJYqB+WdLCowe3zkD4DrC77puxKIA7dzs0Yr5fmoGE/Y5cJUUeTVSOPY5Hy
         WQHtcQOO37RSDn3hFvhI7zB6JcjOEfjuf3qyiA9cjX3q7O5pSoLL3v7S6r8Q5R5uCJ5G
         x5QSkme+vKdkp3In+Rc6iuCDUnq09cMHS+32zCCt2WkVmodBYjPKhTb9bhU0zJF3Mzpy
         hVdTTJUHzYOpuhdFxJTy+hkeatx2g4k6sISt6HebjO2T7zTkapk0TZtHHzNEagQ7Y/Dk
         8Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561381; x=1750166181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/zrQKrz1ZdcacJlKYkPsE2jrLvANF9CRh8hMHgIKxo=;
        b=QF5VbdmiiBIPWnR5GYSL8thBmk3SJ/8MCWql0Ct/PBU2ptgDFTUJ1lMXq3s6dyUHE4
         g2vqjdN0Axtuz7Iit8Uc6LFIvmwArDHESwizQTKPBJuEtaJ6VPp7i70qE+8kNl7w2+xL
         qGXzh2r+9OuAipQV/OM+jyxg2HqMRRfqM5TlG7djtZtYOdfQzL/PgfCBPTgQyF5Tl3xJ
         wkbvxVAcP9APeZlLe64gq3q9TQGIO33b3XMtve2AoKgkJLBmf7TqJd2QL+yjlhzvULnc
         It3v8ArSPM5uSCKhfy4KNf2223DeGh00nPZ+eX2tLE1UYd1ftSDEeB10/BIw9GjZnMVi
         +UUw==
X-Gm-Message-State: AOJu0YxE7jm8mOsAKMdwIIX5xbN+k2aj8TOcqYOScO9Z7CziNgc7Drl7
	Ne5FXVF6TfskXWwJbU0CLdDXs2RRoMYkZA9Pp7sECqVIbv9yNLJDq41KWeP6SgFYHI8UbpxqVEh
	9wq/SMVo=
X-Gm-Gg: ASbGncu6zywqj+5j+IJxYa3j74bcWLYtpSbA4pItscgvphhvPLywhV4LGUd3oX0a2q2
	0Z41lHkaTYFA65SoSyMC4u92eXPjhUGFtGLvvsyQf3HCwndsoHLw6fVHodwtpkkazJHdZohVTxl
	mV3Z0RsO4BmL/ULr/Om5a9+TMmtyoJDdFfPFBnN+w91lXbLTJnWC+yDk7jxkGBJIp9RFwMoqmjd
	MCRCeEvaCZ0qhhKSYjZPqQqtBIIuG/nQvkalMvZs2ZXN469Xp4GEEIzkQpXM/XumvuA9j4+MYWi
	dfVk+eOYw6YZVbJlhLPNR37hVL5WlIl3/9z5uX+vTmdVzWxSexhw6cHoK32ddxza3WczOtcb9zS
	ecA8l5JmgGfLjsMxQPwbqEC4NUcB7O636mUnGQEQ=
X-Google-Smtp-Source: AGHT+IGBftzOQtLPgzGHNeXG6c2zhp6CTLR8q3dJgPSZSp1EfRa2hlxKgikylIdO9cmYC3sLXz6TCQ==
X-Received: by 2002:a17:907:9720:b0:adb:413e:2a2f with SMTP id a640c23a62f3a-ade1aa0fbdbmr1346254066b.9.1749561380962;
        Tue, 10 Jun 2025 06:16:20 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:20 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v10 6/9] tee: add tee_shm_alloc_dma_mem()
Date: Tue, 10 Jun 2025 15:13:50 +0200
Message-ID: <20250610131600.2972232-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
identify it as DMA memory. The allocated memory will later be lent to
the TEE to be used as protected memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_shm.c    | 85 +++++++++++++++++++++++++++++++++++++++-
 include/linux/tee_core.h |  5 +++
 2 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index e63095e84644..60b0f3932cee 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -5,6 +5,8 @@
 #include <linux/anon_inodes.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/highmem.h>
 #include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/mm.h>
@@ -13,9 +15,14 @@
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
 #include <linux/uio.h>
-#include <linux/highmem.h>
 #include "tee_private.h"
 
+struct tee_shm_dma_mem {
+	struct tee_shm shm;
+	dma_addr_t dma_addr;
+	struct page *page;
+};
+
 static void shm_put_kernel_pages(struct page **pages, size_t page_count)
 {
 	size_t n;
@@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 {
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_DMA_MEM) {
+#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
+		struct tee_shm_dma_mem *dma_mem;
+
+		dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
+		p = dma_mem;
+		dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
+			       dma_mem->dma_addr, DMA_BIDIRECTIONAL);
+#endif
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -303,6 +319,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
+/**
+ * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory object
+ * @ctx:	Context that allocates the shared memory
+ * @page_count:	Number of pages
+ *
+ * The allocated memory is expected to be lent (made inaccessible to the
+ * kernel) to the TEE while it's used and returned (accessible to the
+ * kernel again) before it's freed.
+ *
+ * This function should normally only be used internally in the TEE
+ * drivers.
+ *
+ * @returns a pointer to 'struct tee_shm'
+ */
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count)
+{
+	struct tee_device *teedev = ctx->teedev;
+	struct tee_shm_dma_mem *dma_mem;
+	dma_addr_t dma_addr;
+	struct page *page;
+
+	if (!tee_device_get(teedev))
+		return ERR_PTR(-EINVAL);
+
+	page = dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE,
+			       &dma_addr, DMA_BIDIRECTIONAL, GFP_KERNEL);
+	if (!page)
+		goto err_put_teedev;
+
+	dma_mem = kzalloc(sizeof(*dma_mem), GFP_KERNEL);
+	if (!dma_mem)
+		goto err_free_pages;
+
+	refcount_set(&dma_mem->shm.refcount, 1);
+	dma_mem->shm.ctx = ctx;
+	dma_mem->shm.paddr = page_to_phys(page);
+	dma_mem->dma_addr = dma_addr;
+	dma_mem->page = page;
+	dma_mem->shm.size = page_count * PAGE_SIZE;
+	dma_mem->shm.flags = TEE_SHM_DMA_MEM;
+
+	teedev_ctx_get(ctx);
+
+	return &dma_mem->shm;
+
+err_free_pages:
+	dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_addr,
+		       DMA_BIDIRECTIONAL);
+err_put_teedev:
+	tee_device_put(teedev);
+
+	return ERR_PTR(-ENOMEM);
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
+#else
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count)
+{
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
+#endif
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index f17710196c4c..e46a53e753af 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -29,6 +29,8 @@
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
 #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
+#define TEE_SHM_DMA_MEM		BIT(5)	/* Memory allocated with */
+					/* dma_alloc_pages() */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
  */
 struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
 
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count);
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
-- 
2.43.0

