Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90021FECB1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483223; cv=none; b=X0LfIw0jm1fjUVxkpdVPI3uyay2OH3N0/BFEKQvw1XMbPhCdp8RiNVvXeRU1i2e6rOCBbmESlM0FgQCk3OOfunhVa58Orvdl90BqARFJtPk2H6u8MCOukKB9f5o9+I0Ws9YrrObPqE+XqithxT4+VEm+XobMcnOHAy0lSikYqV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483223; c=relaxed/simple;
	bh=GWTkTdANS3UrxTpYZoCpcwBtNSE2WMoiy/X9DGjxSlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbdfO9OMJMbDxmuNQBtXRGbqt7SDKRdbfgl2vYLhe6vXQN6gTZO/hhVaBkEvYwF7qbwlpGVQkSKb25W0Gdg0mhwKE7T4dfXS2qV34r5yDbtw2AY1igiGVOPMmtgBIXwGQa1Ftqghs3ZzUN8NTf6EccZtZGS/Sn/FUsXqzUwk6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8FVcHLP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8FVcHLP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso5976735e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749483219; x=1750088019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZK5F7C4/3QyMPlYogeS1FiaRgdwuH6v3hOpp6CFdSVg=;
        b=N8FVcHLPZpB07BQt6gG2x2s+mDd90rmr6oe6WT0hg/nSx4OdWAXgK89pmmEdF0cqbU
         fNTpNnv8CY+yT/xQrcXmspmiiXrj6WGXNe3SNWTaqbXus6ZZAMNqsLfaYYH4FyI8/U78
         yTzFaols51Z5n5uPxooI/oQzIxPaaqg6FhzLvdqCO6YRYWurNCaZAX999HS9aRwPV1Uf
         86oKZ8zRICKO0NbnDTJTmc0L3gR9UBU81UVd/CVENrKtYOGwP2tLYLlvVn6TvESk3dVp
         nT16mFIT9M0ACsvQQ0GxzMIMjnoYWOPv9IZKxKEXcvH7CLW35LGyUg1E8FQwMWzVKKYJ
         IAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483219; x=1750088019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZK5F7C4/3QyMPlYogeS1FiaRgdwuH6v3hOpp6CFdSVg=;
        b=FTAEcjeksBzk7XKxb8I3+hH0n38bzAYKNb92p5BQMYHxhLNkloNuhRN/3fnuEmB0j8
         kWmD0Ve/0R5ES8QQhhG0O+q+kp2nxCnfoRQs49MJeExGKECLaDT5kwrVHBvFTYF6rkSm
         AwT8e5gHyOUaDLbiONQ4vt+bycteVToJ9+RExTp5xWhCLB2rUlBnoW8nkcLDPU+BGsst
         pQXaayvcCPT8qXYQAA6KTXEJB7E8Zp7Ah8e7A6Wsg7UOPZlh925vkyjaHhLyp+I2jbKJ
         BeUKCZTmPDS+KvbWONHRGThj/Un50adoNQftJ9ATwrNjOLppV4lj/MR8HqvGM7moazGm
         2TWg==
X-Forwarded-Encrypted: i=1; AJvYcCVW4dFY4t/Z45WXcNDPNeIvUa4nzwRf44rHzYySwXV6eSsosEh6nCahG0SJEE7Ih7DSe8psMImREVuyA/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3WUkhGWHLXPfkj6NYNcNSQY1eAISnvmBZ2L15sczYhZ0sueMk
	+Bvxe8QnK+QRKNo25VDNEDwN4JbvxwLFF2DC795cEDktTr9KO2A8jLJwchhRSdzgxVcNZZ/YYXp
	SQ46rO+k=
X-Gm-Gg: ASbGncueNex+nzOC3XkGftvumx1UE0q7ZaoD7IepYBiyFJ1e4hGQJMyN/mlH5sqIJ2P
	8KIPR06W1TvfSMs5s7UkT5HeyxBUeEnqCbtlyM2xAnEkkB2SiygeZJbg1jU6I9aGGauoEIcime6
	+JCCLD8xYnc/oE5VtUw8gkUQQ9JTWX4tnTjnggiNlHMc31PB43thkDubqi3nRbLw1Bx6DnfH1i4
	Ip0zjBN+VFXz27EObSt1VqGABpNAqZaZ4EBzly4jyWe3nnlNG+h/iIY7/4bhH/uFEhNUJkoNu2e
	TZ+HVF3HoTke61iNTIetjE3kkUOGwVhRLbgaDFTKsxT7pHtVGyBWxVEXXPo3HcNzXVLTPnM=
X-Google-Smtp-Source: AGHT+IHIHUkukvAK71jFJiez1/GpgB6tOVcdw0g6KJbi705z+mYm3XxoZlZVO0uZvMC3Kr5+0Y/yQw==
X-Received: by 2002:a05:600c:4e4f:b0:44a:b9e4:4e6f with SMTP id 5b1f17b1804b1-452013ac461mr127453165e9.16.1749483219072;
        Mon, 09 Jun 2025 08:33:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137277basm115728695e9.32.2025.06.09.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:33:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Jun 2025 16:32:39 +0100
Subject: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
In-Reply-To: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.14.0

Using coherent memory here isn't functionally necessary. Because the
change to use non-coherent memory isn't overly complex and only a few
synchronization points are required, we might as well do it while fixing
up some other DMA issues.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 55 +++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 386a17871e79..567632042f8f 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -247,6 +247,11 @@ struct fsl_dspi {
 	void (*dev_to_host)(struct fsl_dspi *dspi, u32 rxdata);
 };
 
+static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
+{
+	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
+}
+
 static void dspi_native_host_to_dev(struct fsl_dspi *dspi, u32 *txdata)
 {
 	switch (dspi->oper_word_size) {
@@ -361,7 +366,10 @@ static void dspi_tx_dma_callback(void *arg)
 {
 	struct fsl_dspi *dspi = arg;
 	struct fsl_dspi_dma *dma = dspi->dma;
+	struct device *dev = &dspi->pdev->dev;
 
+	dma_sync_single_for_cpu(dev, dma->tx_dma_phys,
+				dspi_dma_transfer_size(dspi), DMA_TO_DEVICE);
 	complete(&dma->cmd_tx_complete);
 }
 
@@ -369,9 +377,13 @@ static void dspi_rx_dma_callback(void *arg)
 {
 	struct fsl_dspi *dspi = arg;
 	struct fsl_dspi_dma *dma = dspi->dma;
+	struct device *dev = &dspi->pdev->dev;
 	int i;
 
 	if (dspi->rx) {
+		dma_sync_single_for_cpu(dev, dma->rx_dma_phys,
+					dspi_dma_transfer_size(dspi),
+					DMA_FROM_DEVICE);
 		for (i = 0; i < dspi->words_in_flight; i++)
 			dspi_push_rx(dspi, dspi->dma->rx_dma_buf[i]);
 	}
@@ -381,6 +393,7 @@ static void dspi_rx_dma_callback(void *arg)
 
 static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 {
+	size_t size = dspi_dma_transfer_size(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct fsl_dspi_dma *dma = dspi->dma;
 	int time_left;
@@ -389,10 +402,9 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 	for (i = 0; i < dspi->words_in_flight; i++)
 		dspi->dma->tx_dma_buf[i] = dspi_pop_tx_pushr(dspi);
 
+	dma_sync_single_for_device(dev, dma->tx_dma_phys, size, DMA_TO_DEVICE);
 	dma->tx_desc = dmaengine_prep_slave_single(dma->chan_tx,
-					dma->tx_dma_phys,
-					dspi->words_in_flight *
-					DMA_SLAVE_BUSWIDTH_4_BYTES,
+					dma->tx_dma_phys, size,
 					DMA_MEM_TO_DEV,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!dma->tx_desc) {
@@ -407,10 +419,10 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 		return -EINVAL;
 	}
 
+	dma_sync_single_for_device(dev, dma->rx_dma_phys, size,
+				   DMA_FROM_DEVICE);
 	dma->rx_desc = dmaengine_prep_slave_single(dma->chan_rx,
-					dma->rx_dma_phys,
-					dspi->words_in_flight *
-					DMA_SLAVE_BUSWIDTH_4_BYTES,
+					dma->rx_dma_phys, size,
 					DMA_DEV_TO_MEM,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!dma->rx_desc) {
@@ -512,17 +524,17 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 		goto err_tx_channel;
 	}
 
-	dma->tx_dma_buf = dma_alloc_coherent(dma->chan_tx->device->dev,
-					     dma_bufsize, &dma->tx_dma_phys,
-					     GFP_KERNEL);
+	dma->tx_dma_buf = dma_alloc_noncoherent(dma->chan_tx->device->dev,
+						dma_bufsize, &dma->tx_dma_phys,
+						DMA_TO_DEVICE, GFP_KERNEL);
 	if (!dma->tx_dma_buf) {
 		ret = -ENOMEM;
 		goto err_tx_dma_buf;
 	}
 
-	dma->rx_dma_buf = dma_alloc_coherent(dma->chan_rx->device->dev,
-					     dma_bufsize, &dma->rx_dma_phys,
-					     GFP_KERNEL);
+	dma->rx_dma_buf = dma_alloc_noncoherent(dma->chan_rx->device->dev,
+						dma_bufsize, &dma->rx_dma_phys,
+						DMA_FROM_DEVICE, GFP_KERNEL);
 	if (!dma->rx_dma_buf) {
 		ret = -ENOMEM;
 		goto err_rx_dma_buf;
@@ -557,11 +569,12 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 	return 0;
 
 err_slave_config:
-	dma_free_coherent(dma->chan_rx->device->dev,
-			  dma_bufsize, dma->rx_dma_buf, dma->rx_dma_phys);
+	dma_free_noncoherent(dma->chan_rx->device->dev, dma_bufsize,
+			     dma->rx_dma_buf, dma->rx_dma_phys,
+			     DMA_FROM_DEVICE);
 err_rx_dma_buf:
-	dma_free_coherent(dma->chan_tx->device->dev,
-			  dma_bufsize, dma->tx_dma_buf, dma->tx_dma_phys);
+	dma_free_noncoherent(dma->chan_tx->device->dev, dma_bufsize,
+			     dma->tx_dma_buf, dma->tx_dma_phys, DMA_TO_DEVICE);
 err_tx_dma_buf:
 	dma_release_channel(dma->chan_tx);
 err_tx_channel:
@@ -582,14 +595,16 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
 		return;
 
 	if (dma->chan_tx) {
-		dma_free_coherent(dma->chan_tx->device->dev, dma_bufsize,
-				  dma->tx_dma_buf, dma->tx_dma_phys);
+		dma_free_noncoherent(dma->chan_tx->device->dev, dma_bufsize,
+				     dma->tx_dma_buf, dma->tx_dma_phys,
+				     DMA_TO_DEVICE);
 		dma_release_channel(dma->chan_tx);
 	}
 
 	if (dma->chan_rx) {
-		dma_free_coherent(dma->chan_rx->device->dev, dma_bufsize,
-				  dma->rx_dma_buf, dma->rx_dma_phys);
+		dma_free_noncoherent(dma->chan_rx->device->dev, dma_bufsize,
+				     dma->rx_dma_buf, dma->rx_dma_phys,
+				     DMA_FROM_DEVICE);
 		dma_release_channel(dma->chan_rx);
 	}
 }

-- 
2.34.1

