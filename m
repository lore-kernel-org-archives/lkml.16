Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987B721170D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483224; cv=none; b=ab5SXSfCKQkJ0CauFX8BuIrtnqT6nJSJJlzBgRribSTefdefM8BJ3t5s97xITO90VY3xreNO8nH+NA3P4/aZktj+H23UvRhGoWwNAi2IKX4ZhTe+VzbOEln9SwtVn3GXBEq4SvuyTpct0zwh//vu+FxabDpNFYJBULRnruRjhyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483224; c=relaxed/simple;
	bh=F6E6vLhtiApLAfH7jVShsvhhng5Af5yfJYjmbaQ+dgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+t0C2PXugMccstdOvHnGHZvZd8qhnZoPlsgEJuXFRsaO7CXhyZ6aN6rJJ9VJ6x9qUK+jXDJnVZoUIy0Pq0OfLv7sRQzlJqPh7Q7UM/U8vz+LRGEHFFbR09xD5PnVvCd30sbVJiu25z63M10fBMCsR2aW/L8J3ISIv1+uTHZhzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFM2s4Cn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFM2s4Cn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ce671a08so28062945e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749483220; x=1750088020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaezEOtMadWK56N6XyEFNb8rQwc+F+EkQ0Z25AB3jZ0=;
        b=YFM2s4Cn8ihLu6AViru+bYwURS3Hlkl1Bmt+KBLTElIHoH/y5MYUteow+qN2fcIKJ4
         p9f+SQABN8luPjor+BWCGSF0qffs8tbkexLtXYUKpZCP6+GfEBFnY+DyKWPl1wEknZnV
         prj4MRvHwvxCmGqKUg/R6a9fuFb5qD7q0wIImkbAtHbJtfXM745PEhvfnC9hPUk6G9G3
         CZsjD3GpTNe0xe7Zi1i/pBODiwU0MrJXtZElk/jGFpLeg4YMq0GWBQY0NjCfrawXnTS7
         B7doHUOgoVDzmPRSOVQ87OIbtZ12izjF71Mg7zuUKoOC82+UAtgPCigGMz/D1r9BwQsb
         5YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483220; x=1750088020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaezEOtMadWK56N6XyEFNb8rQwc+F+EkQ0Z25AB3jZ0=;
        b=WVHcHWTqT1Kf0t7wXTrJ/QQdjyVwAnkmppj+OBJKIRp6WReLz4AY1FeZT9r+q0JG6Y
         UlsA7dwodS2BRO462ggSaEQf2L7ZbD3+b4UN7+5qlVEv+C6/t2aHEiId0tMjYIKtgdN2
         XJ9K82dAuvRfqmpHf3pFqFS6um3QnBIJgRgAP+ApIWBEtyc78VjIN21paGTFS09lvrez
         I7g+3isgcgEG9Yuw27uaJiddskentrid95OHSSVRW4AWbUzKb6gCVquTwGIJNIPrHu/K
         qBTAP/qjfKFMjROyFMf7XoCjZET1tl9NbSoaXnpPizgbHX1aRwqgnoqK7b8wp9hhGtD1
         QjWg==
X-Forwarded-Encrypted: i=1; AJvYcCWKfAI37KjB8eh6mehZyUqRX3w3VbqvtWmUV+NBHMwqBnE5fbRI5KGNFfJn0iDNWk9keMWDbW0DHbirN9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwBMFbzup3FW0kC+GFexkpHBoEAdw8aKjct5R1rCANlZzdyaKF
	/qLUO7yYXhIJSwAhoPxXNfsPaRwIvSUifQNFESCp1OC015WpM+DpCZjBEB099fbwO04=
X-Gm-Gg: ASbGncuMbUdZRHqf5bqvHKm+mD3Rt00I1s/0cSDvYOHaodTSwTQOvsox5MJtjl2PRYy
	AbwucT1aCUO+4clshrBT8Ds97tc/wJ9px6kk54GYxTDQA/ApwtvpCKrHx6wZeINKabbfqZM7eGt
	Byto4qzUoWNnBSXWUaythhTrWw88Omiw8j5C2UsINfyXPy1KOMryvd/A2dqclAVTa8gWsPa/dFT
	O/yiakgRJawkTEJDK0drjgo+NQe/mQTBL7c5pO8E9F1mQ8fBulS6sl0YHZNm4UQbo6HqXHzgcqQ
	j2l9ZZNWMpRJrNKJouC6FWTbsc+8UhCU+VHQLFT6Rtq4VbjG62ZXmGUWcQvT
X-Google-Smtp-Source: AGHT+IGepX0ZeTm1oK5PJISBe8xztrPlaGG53R1SqnZP9IkWg7qUfIiTimmLJeMPuicniaung+m3Wg==
X-Received: by 2002:a05:600c:45cf:b0:450:d5bf:6720 with SMTP id 5b1f17b1804b1-4520136edc0mr142853995e9.3.1749483219912;
        Mon, 09 Jun 2025 08:33:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137277basm115728695e9.32.2025.06.09.08.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:33:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Jun 2025 16:32:40 +0100
Subject: [PATCH 3/4] spi: spi-fsl-dspi: Increase DMA buffer size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-james-nxp-spi-dma-v1-3-2b831e714be2@linaro.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
In-Reply-To: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, 
 Larisa Grigore <larisa.grigore@nxp.com>
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
index 567632042f8f..e211e44e977f 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -252,6 +252,39 @@ static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
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
@@ -474,6 +507,7 @@ static void dspi_setup_accel(struct fsl_dspi *dspi);
 static int dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
+	int max_words = dspi_dma_max_datawords(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	int ret = 0;
 
@@ -486,8 +520,8 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 		dspi_setup_accel(dspi);
 
 		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
-		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
-			dspi->words_in_flight = dspi->devtype_data->fifo_size;
+		if (dspi->words_in_flight > max_words)
+			dspi->words_in_flight = max_words;
 
 		message->actual_length += dspi->words_in_flight *
 					  dspi->oper_word_size;
@@ -504,7 +538,7 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 
 static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
+	int dma_bufsize = dspi_dma_bufsize(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct dma_slave_config cfg;
 	struct fsl_dspi_dma *dma;
@@ -588,7 +622,7 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 
 static void dspi_release_dma(struct fsl_dspi *dspi)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
+	int dma_bufsize = dspi_dma_bufsize(dspi);
 	struct fsl_dspi_dma *dma = dspi->dma;
 
 	if (!dma)

-- 
2.34.1

