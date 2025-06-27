Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4D2C08CF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019738; cv=none; b=ae4tAIw2No5edXAkKEegkA5AS6A3Q42xdvJyzVUFMwwk+hWLNKR65Ptg1G7lpapyT9kOE8USzTtCCXknoDHstmHVty7zTEEqApgQraXHEi9fSbckKxFwSA2hMpAeHxePb6F/58kq/F4Cq4ltZ59k2fadg2LT9eY40V0GgJiqz2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019738; c=relaxed/simple;
	bh=tDElKRBLK/qNKu5SjxAXb85BKJ6QoLktzarB0QqasrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTV5BbirMTlUhrzFnexpfrU5TFYWjTI0xrKCCM7Y6xifHuvT1vhu1+EoLeghKbICukW6lX2jv4lB+jHZGaSfN/9n0nF1LKr/JWVxnf56uF3W9ycaS35X41oKlPS6YtdUANUeKDzUDP2msX9ti/1NvvQxqzGxAlv09whQUzO9fH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BjKZu+m0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BjKZu+m0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a582e09144so1275333f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751019734; x=1751624534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwlNaAwBOfLtistkNFy2ROGaDKhEVpmQrgosAfN44tc=;
        b=BjKZu+m0LiUjWSgI9BmefKEZj3TO/kLPB758BZwrZ/3r3709psLuiwnfqnn7CHXCxq
         unylcrfVsaPot3pqCdc/qbM6xWqhqEb7CHMyfqomkn2dg37If8dBI2cC6kkqcO2do6UJ
         ZFFsfQ7Eb11q0S0wv2UtQ8NFWFSojbF+udmZon/cMmQS9ah/dxM57+DoKs/qbB3W1JM8
         h3jhkifqZWDPIeSSlnP924qQ86A177v4rXGf9SKxWCDEyq5W8Bk44luz9fADqlYD5XEM
         A0O0sj4Wg3EMLMI/VBpV0X6wPiBaMsG7XST6BVmuTr8CRn3ocqZrlR8vuIzDu86JbAYk
         IOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019734; x=1751624534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwlNaAwBOfLtistkNFy2ROGaDKhEVpmQrgosAfN44tc=;
        b=QL5wrS/D576f3QLD5CA7z/2p2FhX7pNCcCib0ChUe4LvJy1kFxHF0gKh6YjofhndAF
         oUA4zmjiBukL79bWWfhVB6Wp+QhVsb/UIiBSgaA7OrqwcfgqDnRZXV3fyG7zme6K8SZU
         rSeUrYyE8sR2sR0R1D+3wOvnOa2JIgPo4WAoqj7AihOmE+/hSlAmPmqpTrJ/40m35ZUQ
         zebA6XiUtbPkxCfKNpRwDfpaZGr1HwNdXGDruc/oLEtKyMT7BZKrRFdsC7nzfR5hhgD+
         gtFOv063O8qZ95SyjAfv8YQDRLTtvRCop/f1ZOoU1g+DrOkko+wNzLGs7z784zqW02Yq
         E4sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUierywqYrT6LkhaQF0Qxfk9ROPbZC1QmZxmRezKOL+ru8ZWI6oXwL1dOb0L1yujmbhpdYdlpZHiTSOeUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxfzKuB++nzJUNNnde6QoDXBFlMb6XG9CQktNeNZ19SsVsaO80
	xu/ukWJqrccZKDF+MbQIrvnAIKZF5hTNJoY0MLkYM8F+fVHnP1pp6ZMzr02tvvw6Fss=
X-Gm-Gg: ASbGnct/h6SqtU5HfFuP/lhjaq9nomPFTtzcwggM5lX1blpDEId7HryIt6JXOcdoAuU
	m5PeicToc8CxNmw9wHibPcqP6hBCjDWgAmwpEqkN06Vl69o7+aSCTzq42ExZGC/uQIc2BgYJTop
	dfkvpNlce3mZN7uWni1XQrnUsjiZoxRIqt4+UPL2JArOro2y02HmJgYN6+FVWfIpf6yrReZHVu2
	9l+o2EmxnQKCwcQ+zcVQV5FoP8/XuFeKDwMb1vk8tSsIzgOQcFodPR8ev2CzbMhy8kHFGwBHI6/
	fx8/BBnCqnJqMZeuEi+/IL7Qw6CaldFNN5fbjbGAnKJeRBgcE9NmON4w/gfNhTHViROqEW4=
X-Google-Smtp-Source: AGHT+IHTsdKq6puWRpwlj/VM3TSQdnueqR9QrLPQyNLzpjBixFVOdE5jwKmG5jakQu4jPPketOSLPw==
X-Received: by 2002:a05:6000:25ca:b0:3a4:ddd6:427f with SMTP id ffacd0b85a97d-3a8ff51fab7mr2718088f8f.35.1751019734307;
        Fri, 27 Jun 2025 03:22:14 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm47250955e9.13.2025.06.27.03.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:22:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 27 Jun 2025 11:21:41 +0100
Subject: [PATCH v4 5/6] spi: spi-fsl-dspi: Increase DMA buffer size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-james-nxp-spi-dma-v4-5-178dba20c120@linaro.org>
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
In-Reply-To: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
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
index e7856f9c9440..46d3cae9efed 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -493,6 +493,39 @@ static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
 	return cmd << 16 | data;
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

