Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E201E2853E7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761402; cv=none; b=txC8jDvhnt5FsMC9y4w5sHpuEBvHNkHyaegejaJzrOGsOP8olUciybCRjkrQInjoeWHgivbIdDPkLE+so955bOu8J0FbLN4vjf8kG9EJLiluA0tBtFOBrhjTMlqNHpGux+hSz4GlAjxYuedP4SMKQta2LMeAK0h4LyQoMzKBG+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761402; c=relaxed/simple;
	bh=CKzWP8Q57rTD8v8eYxui3RXOqALx6HFfj2YebUJ36GE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ggt/rtXB/YMZwFKPfdh0ZocwKCQkLDGBM2rSFGCmBlwB2+Za6M1ALoB46gVDHIgZR4tRQuzA09qW0zvkKk8sNI2raScULFz0+0a+bHf7Gc0QeXsuh2iFuGm2r61MhvOzR6fymKC3W0nOaIMjgvbsDxDTfLeoy37K9IelEp8WEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLQTNkga; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLQTNkga"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442fda876a6so46277285e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750761398; x=1751366198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkWlcH8jrZqIjUcA6hAY08QFifFzMj2nT0vEHV3qzH4=;
        b=vLQTNkgawl3wsghDV/SEjS8tsreyGBLbV4ZMyGy41b1Kx6pTC9d5xyMwX8dAfQDsRN
         F4zBPFh6Gvfu1QIeLN66YZZiIysFhTsMKlhxNdWQD/Z+QUgvVZbICpmELuWd5vptLZpk
         PHGllma6F5zDfb83014J3iB6j8lnxnos5aYFhb7VKmhMsyocimZI4QXAeMQcXx6FUdwH
         j/X1d4Who1lgnY9mlOSVWGwmWd3JgsSL088C6uh8t1WpKVGSiAT0ioRaJ0I6KdeHooiP
         h3RQBtwBkwXrRrHjK1JJNF1XfBAkPU/wBplBpEtaA8zo54AtmPzSh1ffCifgWBqeEWfB
         Fvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761398; x=1751366198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkWlcH8jrZqIjUcA6hAY08QFifFzMj2nT0vEHV3qzH4=;
        b=jQB35cU3sSf12AnUn6sd0W4nXcmID8pMtoTMPTeJOZtWU7yeyY5ot9pKbEVUCX1DZ1
         YkLwM7+o4ErtONwd86JtyumU0TmJj+ANrtU165OuymtQaomHrNFbR+dfi7WN6Om8n5CL
         ATe6UvYvRBTxlKeWFOy+1VE3mpgfoqig7SsPKRb6pyEWhDPLr8wR3ZC9gWgc1OVbxudN
         DHB2QcenFHFLg5OCEzfTopDIcpko1KhQEKUGxNuZLRJNJJCvVPG/AjKs9qVBn7KrgrjL
         FAwjT2H/9pcp5IfnXE9i4ojowwTsdIa3TX0sQin/e54Jlcn69HCU5u6CebkDHaQ9vtZf
         n8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR6Uyo0poWW7ITUp+NI3cUYFzR7SuGklMSoAGfBBkgSUNAXagwu2PdRJfFI+L7Vp38QDmTYHIT4XMhm0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzz64+4N+YZJ3mDrl49Sdl3r859YjEKnq4U1qrbqntG8VfSGjb
	4GXAC3z+J5N3onP5U/GZAuOvaQVWZ6gX5R3wjeZOyxgEp8WaIQIS2c9xfAWbULw2cWJ2Fe+cbgb
	Yfl0E
X-Gm-Gg: ASbGncuJ5zUpkv83oNORFQzL0rXDKwnh3KPo182bgc/DyjHOjnCsO3qVb3Txqu8VKkl
	9CODfLiXVuNRol4Ek45MuST787eKnaC6p/1DLRgSUAhNFBFCfZBd8G+VBDQ/Q9jEDs7u4NvixTq
	F4j6BFaWvxH1Wlq2w67CEPVzT89IZA9xidZZT8cd+bJrYGlcarkHw0fbL+gCynG2VVz668slNfM
	yIMvUkOn2Zhta5Ut0TLWA9+PukZJWjJPG5tUpIV5BN06Onu/Hm1PImG/J9xjWqw8P8EIcn8bEO1
	0dfRdXRRqqz9mDNE+GGVH2RAXBry5uxJXWjEO5R3FXJRcSpTlGhqj4HGc4lSJ1Ab2thm6+U=
X-Google-Smtp-Source: AGHT+IEtSD4anpzO9q+ug4r6yS1A/sOVZcXXes4XAOF9ARsdeysAtYamMmoek830XIR0wKgHigDVrw==
X-Received: by 2002:a05:600c:a07:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-453659cb8e5mr128723565e9.19.1750761398202;
        Tue, 24 Jun 2025 03:36:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm143398245e9.3.2025.06.24.03.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 24 Jun 2025 11:35:35 +0100
Subject: [PATCH v3 5/6] spi: spi-fsl-dspi: Increase DMA buffer size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-james-nxp-spi-dma-v3-5-e7d574f5f62c@linaro.org>
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
In-Reply-To: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

When the device is configured as a target, the host won't stop sending
data while we're draining the buffer which leads to FIFO underflows
and corruption.

Increase the DMA buffer size to the maximum words that edma can
transfer once to reduce the chance of this happening.

While we're here, also change the buffer size for host mode back to a
page as it was before commit a957499bd437 ("spi: spi-fsl-dspi: Fix
bits-per-word acceleration in DMA mode"). dma_alloc_noncoherent()
allocations are backed by a full page anyway, so we might as well use it
all.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 172eb9929de1..58881911e74a 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -493,6 +493,39 @@ static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
 
 #if IS_ENABLED(CONFIG_HAS_DMA)
 
+static int dspi_dma_bufsize(struct fsl_dspi *dspi)
+{
+	if (spi_controller_is_target(dspi->ctlr)) {
+		/*
+		 * In target mode we have to be ready to receive the maximum
+		 * that can possibly be transferred at once by EDMA without any
+		 * FIFO underflows. This is CITER * SSIZE, where SSIZE is a max
+		 * of 4 when transferring to a peripheral.
+		 */
+		return GENMASK(14, 0) * DMA_SLAVE_BUSWIDTH_4_BYTES;
+	}
+
+	return PAGE_SIZE;
+}
+
+static int dspi_dma_max_datawords(struct fsl_dspi *dspi)
+{
+	/*
+	 * Transfers look like this so we always use a full DMA word regardless
+	 * of SPI word size:
+	 *
+	 * 31              16 15                   0
+	 * -----------------------------------------
+	 * |   CONTROL WORD  |     16-bit DATA     |
+	 * -----------------------------------------
+	 * or
+	 * -----------------------------------------
+	 * |   CONTROL WORD  | UNUSED | 8-bit DATA |
+	 * -----------------------------------------
+	 */
+	return dspi_dma_bufsize(dspi) / DMA_SLAVE_BUSWIDTH_4_BYTES;
+}
+
 static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
 {
 	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -608,6 +641,7 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 static void dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
+	int max_words = dspi_dma_max_datawords(dspi);
 	struct device *dev = &dspi->pdev->dev;
 
 	/*
@@ -619,8 +653,8 @@ static void dspi_dma_xfer(struct fsl_dspi *dspi)
 		dspi_setup_accel(dspi);
 
 		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
-		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
-			dspi->words_in_flight = dspi->devtype_data->fifo_size;
+		if (dspi->words_in_flight > max_words)
+			dspi->words_in_flight = max_words;
 
 		message->actual_length += dspi->words_in_flight *
 					  dspi->oper_word_size;
@@ -635,7 +669,7 @@ static void dspi_dma_xfer(struct fsl_dspi *dspi)
 
 static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
+	int dma_bufsize = dspi_dma_bufsize(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct dma_slave_config cfg;
 	struct fsl_dspi_dma *dma;
@@ -719,7 +753,7 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 
 static void dspi_release_dma(struct fsl_dspi *dspi)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
+	int dma_bufsize = dspi_dma_bufsize(dspi);
 	struct fsl_dspi_dma *dma = dspi->dma;
 
 	if (!dma)

-- 
2.34.1

