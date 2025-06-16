Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04FF2C3745
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072722; cv=none; b=sTHdqDEaRVQ+GYfTzTw9pWcFHiN0ZlZ9jG7vMWrLMonUHjX3fvUMwWhlog+IDzwUhhy7jqy5alXhT0qAx6OLVtKgduS8bEMPGQSvoaNejLp4BRgmEUCuGb8mnBhQD7QJIUeDKZgW+ovT/jLIO+vkGbKKL1h+pURA22LiuMZtvBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072722; c=relaxed/simple;
	bh=hrasx9LpaBhIfwmbsVUucBku/W+eFelK4E1GYnytmA4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aRXiSDQc57hsIkNq1ujY1z1bMbttRkKlo+Bj7XmxnqHvXkgDawTQB4fbxy/Rk4OUmzYvnUMavwR83jD7q7MbFkw1RXQT9A4vgeA9BgcXqpDynx4BZf+FvcV2mE17EpR1T6/4hnooC2NY9OOWGGyNYRYbcCLf3Jl9H9A2OJ1eI+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w4lgbJp/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4lgbJp/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so34974575e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750072718; x=1750677518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFRRbT8s9vGTGk+mkini82Ing/hSasgp2YN4IKINJ8I=;
        b=w4lgbJp/viQVmzvRxgkhM9UhM3iz2JmbxdsPct7cvo8zQX3RCSyH1YcPcrpTAIZvCp
         EORrCCBbytOQfBQ8UiUMd6DWVq569vBaVA+iIzrzzOLcW6A4DjNTAstu2ng8xIbzu+pz
         O2o/kW9ndjvkfExHnRNNNFQnUXnsv0oU/543bT5O7Mo3PPorsREjdkmO6WZhkCt5gtQs
         TgL9dq7brMN+lFB95n3x1gRKSlnhCqPbL8Vwbf+C80aWKSrog8UJTQD5xDISBTA/YuYK
         CxUSwgJhQZAH3j+lHVXWgPzCjJlDa9JPRtu66yrypYj1Ga4VgC7jIUwgQ6Yy241C02m0
         kFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072718; x=1750677518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFRRbT8s9vGTGk+mkini82Ing/hSasgp2YN4IKINJ8I=;
        b=X772xCffxTS9kjcO6zDkz7nasx0BuA/ZYahHc9fNOQAyeU1sdvBZxp5DVHV2JCXU+n
         c0yPIl80bCCnXuBzm9GbJP47QbELYk7zpXKanqiNXOaG5dh2CYaSivg+w9LpYxR3z1hV
         0C4c8rRhgOqpy/vSczpMQttKwA8VK5RstXnNmTpYzdhqYZOL5Q06R+1whGDlYDXvnUpW
         S7FggSk0iHfFliRykvYRIplHIFPTU4eSVtNnUlx5es+sqbp6NPH8Y4HshRG14HaHuk/S
         YXoa19Xl/hfuU570Sd1/9Mt3bv9RvsdMRqBgwy3TR9DXfClD/DqLvEqKH4taZkuSZoHI
         U1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk6Dk7UowzUX/wwYxxiuY8tk/DvN62ARuAT/BDspEG49VhCXWPbmyx57w6ljTKTp0P8OlVi3XTiO4ub/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxILAZpf2rcAT0Vt6tcWtCLWJt+FMyQ68cG7HIeGyTqC59lGJzl
	4Nu1qxZWuChc/X+AL6DoqbM1YuqWNhx1IuO0TLntNojfh7/a+Cbhv2ZYDXyNI73AxgHK1XuE6i4
	eReH0
X-Gm-Gg: ASbGncujo/4QYXXoaHQVtj1qZrRs1KsJnwrsiH7tpyAIHTDFahYL1EM7ExmlRP+06CL
	BBvCdDTfTaJnWjFzCOa36PvqikD8uvh8SXSxuNjUbLV7d2O9ujumJVaALsaVIUn7Yybs4CbTR+I
	2mjpygRMUW4BgkNYPNyE2bOuwO7uGxuemPgYHI1mPoMTweXnpZ555sE0uPz+ER/xrFtQA1gOsDo
	49ySezsEeB/4PIzRHD8TWU3J5VWkT3pQTkX0trETiBnKB+Mm7Aj1lAXLqVrIlpziVEAD6Y6uaVe
	01Pp314fi7LIRaV2yjrXIey3SLnwij16nmnKeMeRywKhTj/0/4bARMV9cBd2piUxmI4+PtCrLWm
	fVA==
X-Google-Smtp-Source: AGHT+IF204pDh3GMb9mprc3RWx877M/hSlys4cJP5Klv0u7H3rkiPLZ3mCZ6j16z/jbKHnJ8e4e+kw==
X-Received: by 2002:a05:600c:3e18:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-4533caa629amr84883665e9.16.1750072717932;
        Mon, 16 Jun 2025 04:18:37 -0700 (PDT)
Received: from localhost.localdomain ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54a36sm10931250f8f.15.2025.06.16.04.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:18:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: hch@lst.de
Cc: olteanv@gmail.com,
	broonie@kernel.org,
	oe-kbuild-all@lists.linux.dev,
	arnd@arndb.de,
	larisa.grigore@nxp.com,
	Frank.li@nxp.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Clark <james.clark@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev
Subject: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
Date: Mon, 16 Jun 2025 12:17:49 +0100
Message-Id: <20250616111749.316413-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202506160036.t9VDxF6p-lkp@intel.com>
References: <202506160036.t9VDxF6p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The implementations are in mapping.c which requires HAS_DMA so stub them
out if not present. This is required for some drivers to pass randconfig
builds.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506160036.t9VDxF6p-lkp@intel.com/
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/linux/dma-mapping.h | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 55c03e5fe8cb..766f28a0e11f 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -161,6 +161,12 @@ void *dma_vmap_noncontiguous(struct device *dev, size_t size,
 void dma_vunmap_noncontiguous(struct device *dev, void *vaddr);
 int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
 		size_t size, struct sg_table *sgt);
+struct page *dma_alloc_pages(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
+void dma_free_pages(struct device *dev, size_t size, struct page *page,
+		dma_addr_t dma_handle, enum dma_data_direction dir);
+int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
+		size_t size, struct page *page);
 #else /* CONFIG_HAS_DMA */
 static inline dma_addr_t dma_map_page_attrs(struct device *dev,
 		struct page *page, size_t offset, size_t size,
@@ -291,6 +297,21 @@ static inline int dma_mmap_noncontiguous(struct device *dev,
 {
 	return -EINVAL;
 }
+static inline struct page *dma_alloc_pages(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
+{
+	return NULL;
+}
+static inline void dma_free_pages(struct device *dev, size_t size,
+		struct page *page, dma_addr_t dma_handle,
+		enum dma_data_direction dir)
+{
+}
+static inline int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
+				 size_t size, struct page *page)
+{
+	return -EINVAL;
+}
 #endif /* CONFIG_HAS_DMA */
 
 #ifdef CONFIG_IOMMU_DMA
@@ -438,13 +459,6 @@ static inline bool dma_need_unmap(struct device *dev)
 }
 #endif /* !CONFIG_HAS_DMA || !CONFIG_DMA_NEED_SYNC */
 
-struct page *dma_alloc_pages(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
-void dma_free_pages(struct device *dev, size_t size, struct page *page,
-		dma_addr_t dma_handle, enum dma_data_direction dir);
-int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
-		size_t size, struct page *page);
-
 static inline void *dma_alloc_noncoherent(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
 {
-- 
2.34.1

