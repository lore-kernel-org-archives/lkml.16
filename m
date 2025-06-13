Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8DF291C22
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806967; cv=none; b=V88X3DfluGitx3yhLEveoskbcBuNHNQ49p8fMou75euDW56//yX3acqVZlqQjHbAv84JtTp5PebNz3xmARxhmF/g8+qdPx3dHrcy5A/Ydup6qH5AcIsvNnffFOdVsOSDGqGXJhSp1MOv99FaliPikQ+Wdosnz3JoLvP7231GFXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806967; c=relaxed/simple;
	bh=oPZC9WcHWp2uw7qUgqeltlwh3GKlbwEm7TL/tFX+PYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qCR9DhEr7f23plmbonCSruvwouREaf+6zWxPuKPVg0MNzZcxWX24fUGe5W4+mvAKya2LBI7wNtjA8VhLy5l3ZnXwuIgg9bSNyhNPPN3c/GrM2lOJRKiySwP6PWaKM+fOlscU3y9pJXzYBEMV1DpsOonyw8MrGrWrb2JYNg/5P1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzqQt2A4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzqQt2A4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a361b8a664so1716293f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806964; x=1750411764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGpw4hdT+pS+Tk0ux1ZccyT+nzLrIjJeYWKUMN+4QXw=;
        b=JzqQt2A4Sad4L8J1IsURmKsiYsrbiv8LKDYtcBGrqo1948/9em6cffwqWMyUeaPRcu
         9sdxGkjdVjprs5BLfK4WbhWsAfHFcfqyqpYt4WR4Ye6RQqZLtoTKo2IlVZgELCwzCx5U
         +nE6ruqs8BgoKrxtv7jJRzMIUWphhkshW/h/MysbOd5pW+qKGcrnP2hPwCu74GpjYToa
         7FokjpfT2ZgfwLUGp3hrnYr0TwLYwww5cv724YzXAFHvYcbXWF7xR8hw+hZOUyliFNHl
         C0LcwzLgim19Sw/Vjjv14Lvg/0WcMhXk7oNlao5ktlOimVuWVp8AtUtp2hox8Qpq+ScS
         p7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806964; x=1750411764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGpw4hdT+pS+Tk0ux1ZccyT+nzLrIjJeYWKUMN+4QXw=;
        b=gJzb5KcQ7TZnSS6s1uibLzv6lwrgl5dmRvGLelKkTiiNvZVi5qthVF8O5jagH3+RGA
         ayTsQodfwx2VQh843zQy8j3FLlPPO/OaClQrY3nJ8F8kVN3hb0iffki7B0FXkbWx7x+K
         XDTWhUbUcIlpTzWFMhuOWOUIuEX+2exIYcWyeJ2ilJjA4naJsEPNaqp73KlQ8CbuL2ts
         u/KjJFmHWu2BWgE8i8BTGgwVWMW+7aaopzvMRpk0yu/S2lC8vz9bIIrSjg5jQG6coiZt
         IEUhJqYKwAiv9NIvYizwi/KlmtZlJiuAkENukVKwlwuRZuHgPwZ6BwQseCKfTLIP0amC
         XhCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT5js8azucEqYDGsQx2HOt5ssbsTiQHL1moGSJcI4Am1hvvEFH43xCQ+V61VQ97vP/GC44nxZg3nNgykw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUZnr8qbG+Mk0nlEiFTkfePsNpYWk3O4g8OayrfBmJ8FOsia6O
	uMfHGlBWT0k14nPPtVtM/GwaCiymVJREepsLLNPZhf8KhY5lGvSRrcOL8sZSi67CVoecWEwxxLJ
	FtuZ5
X-Gm-Gg: ASbGncs5BsXxAD9KRwE5KBp+QtLyULERtvjqCt4ZYRWmGkm8bMJtNj87Zo+j/LWQcy5
	8/43tV4iKmMgvRrg2Cd0BvXpi/8inzC2A9ig9XD5Sl87in6+VXdOmYzsRTb4VYaPEOJjTIy3Vur
	enO7gi6s1haueQk1whB1YZkghV8o/nVKrWS3pW132zh1XPQrzZy4vQ/xJKJ/MuC9Wt/2/Vo92h9
	iVVTwvcgSFUQT3O+q4DgmKcIZAxToHTzdEYR/c+appTXm9PbuU2jcci9YtvhwRSvDD+FCNTYVNV
	bHiqUkMjpqiC34uMge2COiw/X2kLg12jInNLOG34lNrhvm/Yju8J+vVCtp8gXA/TrL1cu7o=
X-Google-Smtp-Source: AGHT+IEyN57GGxt89BBjLJPXb8Na+NGB2N/ZXIR/zS24fZTczxeUzsibUPRMUEUB3mdpyDV/5IDtqw==
X-Received: by 2002:a5d:5f8f:0:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a568683084mr1645149f8f.11.1749806963823;
        Fri, 13 Jun 2025 02:29:23 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm1805946f8f.62.2025.06.13.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 02:29:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 13 Jun 2025 10:28:57 +0100
Subject: [PATCH v2 2/5] spi: spi-fsl-dspi: Use non-coherent memory for DMA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-james-nxp-spi-dma-v2-2-017eecf24aab@linaro.org>
References: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
In-Reply-To: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>, 
 Frank Li <Frank.li@nxp.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
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
index 744dfc561db2..f19404e10c92 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -379,6 +379,11 @@ static bool is_s32g_dspi(struct fsl_dspi *data)
 	       data->devtype_data == &devtype_data[S32G_TARGET];
 }
 
+static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
+{
+	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
+}
+
 static void dspi_native_host_to_dev(struct fsl_dspi *dspi, u32 *txdata)
 {
 	switch (dspi->oper_word_size) {
@@ -493,7 +498,10 @@ static void dspi_tx_dma_callback(void *arg)
 {
 	struct fsl_dspi *dspi = arg;
 	struct fsl_dspi_dma *dma = dspi->dma;
+	struct device *dev = &dspi->pdev->dev;
 
+	dma_sync_single_for_cpu(dev, dma->tx_dma_phys,
+				dspi_dma_transfer_size(dspi), DMA_TO_DEVICE);
 	complete(&dma->cmd_tx_complete);
 }
 
@@ -501,9 +509,13 @@ static void dspi_rx_dma_callback(void *arg)
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
@@ -513,6 +525,7 @@ static void dspi_rx_dma_callback(void *arg)
 
 static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 {
+	size_t size = dspi_dma_transfer_size(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct fsl_dspi_dma *dma = dspi->dma;
 	int time_left;
@@ -521,10 +534,9 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
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
@@ -539,10 +551,10 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
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
@@ -644,17 +656,17 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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
@@ -689,11 +701,12 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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
@@ -714,14 +727,16 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
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

