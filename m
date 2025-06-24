Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C946A2868A7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761400; cv=none; b=akRPFGNVio3orFDr4TKX0pNEe4Z32Bpt7LcvpzsLuAL9vaQVHDfuIUtTvSY6uMKdsKKLM4VIqIx6CAkeNoeRqlQUbxvIUM4KtKdhqWXd2neJ/2TNkY6qnbIAKLqowtb8xTLjJgiNgUWujVrc7zySlwppfwS4uj13Fx3oey2YZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761400; c=relaxed/simple;
	bh=rPPHmIeX2TaVZwC9/dZT7uMHCVr3ystFWnOCxGonJdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nP+lRSR998TrMPJ2D/HC8wp+r8snakTq6XnElit19m1mdCKIlAVng+DNYBNIe0r5FAamRWXZjFIOVhBabT/1syBwDA0zfH40fIW3AGfHR87QPYg2dYMcFw4+SOOMkODq1cerJeuPuDrOHI8rqBdjE3ORl5oN1dHLiPQJeeN4Z6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uk44DWTr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uk44DWTr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d7b50815so40761105e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750761395; x=1751366195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gysqRRatTbP7tTmH3nSH2f9cu6jlsK5Aa8DruBZasIA=;
        b=uk44DWTrDfVnc66GvbJycE91Y2cBI6zvTvQ5Sw9+AWxmIv2mRzFSWnhlnMvqgk19ya
         uvFGYNnOOJQfFpK0qwsjIKaGT/KQwhHPVMNLEdA2swfH/6V+8ZTH7TjhM2v+mERTMlzS
         1ppnStPih/LTNTBz0GYX3JLPP6KjmrBnqXslKXkjs36Xa2w07FimbiSVyHCEXmEMysAS
         i3vw6+T9NCsIJIUN0aSHOXcsMyA6v/xILCcqWipf1xyYhsMQaEXJwrUv/JORKggFF+Mu
         CJ8Xli6IEVyW9A6sk5EIp8kBKXmW6jjECuclJRuXHZlBvse8vPKALN9GCzus5QW4B78F
         Q4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761395; x=1751366195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gysqRRatTbP7tTmH3nSH2f9cu6jlsK5Aa8DruBZasIA=;
        b=X7nxPgWZ9USDgdNn+OsH79JvVTdh6hKwThnf+d5E9aHc4ohusXLFNE7CMCT5DAPNvd
         y/MSY60Gj+Fs6xLCP3ugHjvRi6l21f60LaiRDDCNPKZoinfv+Yu9WcVNPgWePmehfuwW
         NHGWFxiiCIitPUSaIg+FkwQPXYdbE6vAQQ5xK6U/nF2o03+KyWD0N/RPg4nxx2f8fF+c
         yAvqs/wdyh3Rt82T2HLByWtWlDdgtrmzsbhw8XmK2tsZXrtq6QBwK2AxVN+4sJEqupPn
         6UJFAN2HXpEvUqMxKPjb2QygH9dCMofuS+wa0VWgO7LVTJUUOFBfhfnlo9pBy1gCJA8O
         wGtw==
X-Forwarded-Encrypted: i=1; AJvYcCXGFV3B24CM3ElXhNgXPa8yz/goB0XfmHWhc9cXqakBuIj7TEuq4yPYaUSlp6jOgbi4b7gHHWf92cIsoEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCn7Y19k+BD3guIS8etjpespmciVFiR7Sn0JaPMgXNKwO8QN3F
	QI63zCLf0ub8oZZGj1a+Yu8YLqg5lqztMt0vA+mVKSg4RZoYix1yAqRIsTmGeO33lWM=
X-Gm-Gg: ASbGnctk+3rrb7YScDZ9y/EsC1rfnbecAToezkJNMYAyJ5CIA5SXm2H0iWzC0kHoQ4C
	8bYJD8mDgWYlrBZid3bzMm7WC4hRH/1JIMx3Pq0yJOU20eOpyrxJLfnNzkm4gK5p1e99MAVeatO
	LUeHn5tPJ/qulftCBT0yt+BmEjFxYWCsiv2ObXRTpcnW4zzIkc76Lp7PkEMzPOHig/0lilo4eV/
	I/pkb6+RoTqBlnJ3s/rA2UKYeIpAxOXgLPABZDFw91ww9WUSbTy3dqLVFsis7irvqoIFWB26qnK
	OcrCC1RAvOCGljlyFt0rh6reBEXT1trQXC17lAPlgb0EBs2DoGomiZ2lgRZLdq3qhw4j/6w=
X-Google-Smtp-Source: AGHT+IFw0SflV4Dcc0L4irSH0AC03LWWYU+kHmLLJTkRqnESJXIae3FlSgpPvJNiF5otB/q7x9CqBw==
X-Received: by 2002:a05:600c:1991:b0:444:c28f:e81a with SMTP id 5b1f17b1804b1-453659f5888mr134601975e9.27.1750761395024;
        Tue, 24 Jun 2025 03:36:35 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm143398245e9.3.2025.06.24.03.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 24 Jun 2025 11:35:32 +0100
Subject: [PATCH v3 2/6] spi: spi-fsl-dspi: Store status directly in
 cur_msg->status
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-james-nxp-spi-dma-v3-2-e7d574f5f62c@linaro.org>
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
In-Reply-To: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

This will allow us to return a status from the interrupt handler in a
later commit and avoids copying it at the end of
dspi_transfer_one_message(). For consistency make polling and DMA modes
use the same mechanism.

Refactor dspi_rxtx() and dspi_poll() to not return -EINPROGRESS because
this isn't actually a status that was ever returned to the core layer
but some internal state. Wherever that was used we can look at dspi->len
instead.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 68 ++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 744dfc561db2..feb29bb92a77 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -591,11 +591,10 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 static void dspi_setup_accel(struct fsl_dspi *dspi);
 
-static int dspi_dma_xfer(struct fsl_dspi *dspi)
+static void dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
 	struct device *dev = &dspi->pdev->dev;
-	int ret = 0;
 
 	/*
 	 * dspi->len gets decremented by dspi_pop_tx_pushr in
@@ -612,14 +611,12 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 		message->actual_length += dspi->words_in_flight *
 					  dspi->oper_word_size;
 
-		ret = dspi_next_xfer_dma_submit(dspi);
-		if (ret) {
+		message->status = dspi_next_xfer_dma_submit(dspi);
+		if (message->status) {
 			dev_err(dev, "DMA transfer failed\n");
 			break;
 		}
 	}
-
-	return ret;
 }
 
 static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
@@ -986,36 +983,40 @@ static void dspi_fifo_write(struct fsl_dspi *dspi)
 				dspi->progress, !dspi->irq);
 }
 
-static int dspi_rxtx(struct fsl_dspi *dspi)
+static void dspi_rxtx(struct fsl_dspi *dspi)
 {
 	dspi_fifo_read(dspi);
 
 	if (!dspi->len)
 		/* Success! */
-		return 0;
+		return;
 
 	dspi_fifo_write(dspi);
-
-	return -EINPROGRESS;
 }
 
-static int dspi_poll(struct fsl_dspi *dspi)
+static void dspi_poll(struct fsl_dspi *dspi)
 {
 	int tries = 1000;
 	u32 spi_sr;
 
-	do {
-		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
-		regmap_write(dspi->regmap, SPI_SR, spi_sr);
+	while (dspi->len) {
+		do {
+			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+			regmap_write(dspi->regmap, SPI_SR, spi_sr);
 
-		if (spi_sr & SPI_SR_CMDTCF)
-			break;
-	} while (--tries);
+			if (spi_sr & SPI_SR_CMDTCF)
+				break;
+		} while (--tries);
 
-	if (!tries)
-		return -ETIMEDOUT;
+		if (!tries) {
+			dspi->cur_msg->status = -ETIMEDOUT;
+			return;
+		}
 
-	return dspi_rxtx(dspi);
+		dspi_rxtx(dspi);
+	}
+
+	dspi->cur_msg->status = 0;
 }
 
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
@@ -1029,8 +1030,13 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 	if (!(spi_sr & SPI_SR_CMDTCF))
 		return IRQ_NONE;
 
-	if (dspi_rxtx(dspi) == 0)
+	dspi_rxtx(dspi);
+
+	if (!dspi->len) {
+		if (dspi->cur_msg)
+			WRITE_ONCE(dspi->cur_msg->status, 0);
 		complete(&dspi->xfer_done);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1060,7 +1066,6 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 	struct spi_device *spi = message->spi;
 	struct spi_transfer *transfer;
 	bool cs = false;
-	int status = 0;
 	u32 val = 0;
 	bool cs_change = false;
 
@@ -1120,7 +1125,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				       dspi->progress, !dspi->irq);
 
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
-			status = dspi_dma_xfer(dspi);
+			dspi_dma_xfer(dspi);
 		} else {
 			/*
 			 * Reset completion counter to clear any extra
@@ -1133,15 +1138,12 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 
 			dspi_fifo_write(dspi);
 
-			if (dspi->irq) {
+			if (dspi->irq)
 				wait_for_completion(&dspi->xfer_done);
-			} else {
-				do {
-					status = dspi_poll(dspi);
-				} while (status == -EINPROGRESS);
-			}
+			else
+				dspi_poll(dspi);
 		}
-		if (status)
+		if (READ_ONCE(message->status))
 			break;
 
 		spi_transfer_delay_exec(transfer);
@@ -1150,7 +1152,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 			dspi_deassert_cs(spi, &cs);
 	}
 
-	if (status || !cs_change) {
+	dspi->cur_msg = NULL;
+	if (message->status || !cs_change) {
 		/* Put DSPI in stop mode */
 		regmap_update_bits(dspi->regmap, SPI_MCR,
 				   SPI_MCR_HALT, SPI_MCR_HALT);
@@ -1159,10 +1162,9 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 			;
 	}
 
-	message->status = status;
 	spi_finalize_current_message(ctlr);
 
-	return status;
+	return message->status;
 }
 
 static int dspi_set_mtf(struct fsl_dspi *dspi)

-- 
2.34.1

