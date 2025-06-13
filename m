Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E27291C34
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806969; cv=none; b=KHisdLrTVauBrwxpK0nZ0tYmvWNUFYrmdtfYMJrHMLKB8Klfk1Q6FHLQSWacYCMN6l/Ri2u76lyU0g7q1AhSgHC/7r3JpH+LYgNjxZSPoZx/xaM/j3AgtsFVxIMH6e6OWiGs5/67petc1nJWzdeE2mCaeQLbVztkD62SiTlU+3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806969; c=relaxed/simple;
	bh=CVwoRk0GER0LYrtRwOuy/VUCpYDZks7f+rhuuxXoALQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxePJt1tUyj85kxFc7NnMsFhwSsCvtIywepFtCF3wTL49MzW7CI49GmW5T1+ItTG4Kp3kKZGVSCQPvXQASPQRA8a7uhJkcvgBB4GpCVhHlHmHZ2tXvbkBAsULqsYylDnB+jdy5ucF4FCqv5x+MDu7hi2GqT+5kf0EBtv6+F0vOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hD47HNMZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hD47HNMZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1229776f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806965; x=1750411765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yB3v1heJMNnrfSWRvq2YsjasUe3fnLxNvvV0vI7w6w=;
        b=hD47HNMZMaNQ2f8OGo5ht2gCb1T3fnG76ZVYWxIYiS9BXZ4RpzTz4/U214W3EXQMQ4
         FLE54/SH3hfbs+sckcucL8EUz//slSPPIZ23JaAg/kvBYpiz3xYnyjAb/2GrOOoiRQZZ
         237febwrH0SGxPRLkBwwkzVLF4JL/VMFEOSZZhZxSibcTeSFzU4spwWHNM9ljQ2RKS3Y
         IDHBZUnLFKg0KKkTGnbaVcZ/h/mmFxSiS72zCMqbaeQYks/GgiFsGtIwuI+41OAlnH/g
         qUs2QsYSXuRDm9YAFLwTyzyqDwtADZB/23pvHQm3/N6Q2/KYTVkqJ3VLqVd+2IMuoWjE
         Wt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806965; x=1750411765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yB3v1heJMNnrfSWRvq2YsjasUe3fnLxNvvV0vI7w6w=;
        b=DJ6SMedLzSe2BRSyWSZyO26cEA1XoT8x42AqUtk/gq4dqgA1wYFC2z0XnUXMeKCTWm
         ddHf54LlxSzh3bFdoKabhwW4KYnnLhHD9UtGtvmkZXa4vkzxzzHf/ogvIJHhRW6MdX5A
         SeWdGnt7s2OJYCiCUHX/r/FVRGbLiNAsbOmNHYkBoBknsiyhZUSpbQ0AGIJPEqrv6Y36
         pG2WhwNscFXVMqxcxL9u+EJl1s6ouTDwUzTV/yLaf48l/PKl5WSilPqRbfW2Hif0YYhr
         T3LUFKcXOLdDSCGoAHZhafQ7NcfnNuhTT0BZnZuEkJ5j98O12SQwScffZirNg1C89DLp
         ZLkw==
X-Forwarded-Encrypted: i=1; AJvYcCXc7taAQ9rA9BE6qkZRxkddUi/vCIbBITqpDPmwjPh3QMXdFy3PDMO3fiplXO553NOEtOvIQizGPI7b1K8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4iMtYEBumWF+zRLUXcK7Jg5RmVhuA2JeJrINTc62KEe3woiTI
	HHddoyTVeGprVxkSyR4i3cVix45javcWCKVjKknIJB3v95dCXnO+fseUlbEKSjOn8l+zH60huRD
	z+qR1
X-Gm-Gg: ASbGnctPsGANWPf2KiFNLQlEfLnrOwUFuX0DREAjdICmulFLVD9YK6iUpjvFSAi85kN
	w5GI9lh8HXH1hNGCTk3jvHngcOeK5ajxLdU3g7hRXCwJFVzxKMXa3zYlE8doqKnRHrUQc4gWioq
	bW5WmupyemS0Ds4fZVTtM/YGqKEwKyzobSx4bKf2oH7KvDdvBfwGSIvO0xSyXnHRTFxqiqdp+Gz
	dFBD3bJWPP8F6mXEKdeIF4ZNEmGamo/dFxr1veNjNBA3lJLg0pbTT7UF0QGy7mnk3ufH68nOGO2
	mo2hL3fF8H8AQxiIc9aPn2nWm/aesml0aOa1uY5Qr8rZAn/xwj5VvmWzacluyuETCm5hNAo=
X-Google-Smtp-Source: AGHT+IHVoRas9OADbI1CexwPchRHvmKk79BDFD51FrhgWuPNDtOHfG14Xc4l+6ijC1aURbgK4Ow2vA==
X-Received: by 2002:a05:6000:310d:b0:3a4:f6bc:d6f1 with SMTP id ffacd0b85a97d-3a56866f804mr2073879f8f.14.1749806964790;
        Fri, 13 Jun 2025 02:29:24 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm1805946f8f.62.2025.06.13.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 02:29:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 13 Jun 2025 10:28:58 +0100
Subject: [PATCH v2 3/5] spi: spi-fsl-dspi: Increase DMA buffer size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-james-nxp-spi-dma-v2-3-017eecf24aab@linaro.org>
References: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
In-Reply-To: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>, 
 Frank Li <Frank.li@nxp.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
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
index f19404e10c92..48c2ebefcd4a 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -384,6 +384,39 @@ static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
 	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
 }
 
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
 static void dspi_native_host_to_dev(struct fsl_dspi *dspi, u32 *txdata)
 {
 	switch (dspi->oper_word_size) {
@@ -606,6 +639,7 @@ static void dspi_setup_accel(struct fsl_dspi *dspi);
 static int dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
+	int max_words = dspi_dma_max_datawords(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	int ret = 0;
 
@@ -618,8 +652,8 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 		dspi_setup_accel(dspi);
 
 		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
-		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
-			dspi->words_in_flight = dspi->devtype_data->fifo_size;
+		if (dspi->words_in_flight > max_words)
+			dspi->words_in_flight = max_words;
 
 		message->actual_length += dspi->words_in_flight *
 					  dspi->oper_word_size;
@@ -636,7 +670,7 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 
 static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
+	int dma_bufsize = dspi_dma_bufsize(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct dma_slave_config cfg;
 	struct fsl_dspi_dma *dma;
@@ -720,7 +754,7 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 
 static void dspi_release_dma(struct fsl_dspi *dspi)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
+	int dma_bufsize = dspi_dma_bufsize(dspi);
 	struct fsl_dspi_dma *dma = dspi->dma;
 
 	if (!dma)

-- 
2.34.1

