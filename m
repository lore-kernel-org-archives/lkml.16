Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29E4288CBE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761404; cv=none; b=crylBumW1J/39ARUg+RBWzgOoc/6aTT0vsn5ueKh80DF9STOORTcqo4C2CRQo2nBMfqzj0OX/0zs8xysdo18eNc6IHRIB57EIzY66nYW0kfNE0srASFSOHWzh509cePQjWmcelN5LIw1mPoJcNM7ug6JFTMl3ybWTIl1/zYAgkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761404; c=relaxed/simple;
	bh=X4TMFyCSx8+go3pfcWGphm0X5j2rswwDLDyFMqRvmhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRowk4/FgJxlPVTcbILrHr+c4eNq/EXAfDGCL+b+IT2mqMxkOyDUsvz178RqbPSVuiAVU3wyq7wephvgrERKe4qP3eZiosFaFeWBgHu7fR0zWwGT0tc1EfSrlZaE6eVlMWPwZYPa93f/pfl3O7E7JXra0B6d7v9CUe49z+roUT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HGNkWtKj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HGNkWtKj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so1990875e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750761399; x=1751366199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfaJB4wgBJF9kKkXQUfWPFPPVgluIefucU17tIlexuI=;
        b=HGNkWtKjyS+loBQXGemKg+KQ4MT/yigDhQJwr4+0UCsQ1XVODFiXTyoVSl47BZr4ao
         WOvxAGztnXTdg2dcqrlqWT2a72fJDuw4oRGNmvnD11av5kh6nQoZFNXAWNW4D7ywcZoM
         qo6EQqVyy+H/fa9uOmwqMaJpAzysT2hHEYctL3tAYjiILcsyKT9m6+FNCnpJleD5ZAFl
         fDU78B3B/MrEI5O30Ga0V6487+cgxefLd4V1k/5yAIWPKIJr8ljg+4gkpLw7EmwzFYh2
         U7orl8p7kAgR79On/LT43X3ivCh7/ZfV3UNMR5c3ceRn/kIoliNcpYC1f9mB3R47oP7L
         nlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761399; x=1751366199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfaJB4wgBJF9kKkXQUfWPFPPVgluIefucU17tIlexuI=;
        b=NVGq+Wx1YOq+0KNi1We+dD4AfdwxxeZa3P8Z2j0uRRm3TvWlig85N49QfuT9sKhTh8
         t/YIy8BnerlEyiM6HbgYMWWws29V08Op0/cmAisLCyHYPUeloSYKRax63doVTqoSNIDV
         ijlkgZrzWSDHtd323V0GG/Kd6yrbVk/re9lt7WGowqJnaJA5sd4D0xB3GyyJ4wUaqJRK
         rFxBZkxUTw4xADW0LZtbA/YBRzm7E/2MohpgcbXGKK424ASwEwxx/tNW/H0g/LSkzzVp
         hCJblmvcFRgdwtudEU9uXlMw6E6n9zyByqVzavNDl0pVodx2qzTtOrU8j4y1X5Y3yMcj
         Tl5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPvKwfCNNR9gp4cZ2ziojuE4jfBfr/LuC/3m+aBasYQv9byxPKtw3rb5X7QqBHjbqUZ1ejwXtEPCn7mDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEiAK+Emtsq0Ugp9BQIVyC5rnrxOST+SbvyQl57ZsTtmUWN2p7
	Ai6Krvb23HQNXxrlfnKGQxCOGRygz4lRM9utJcOr5XXC3ceoQK9uiYiftKQVxbWqfQY=
X-Gm-Gg: ASbGncuMoHK2Bdv6lIEXIrdJh1ZM/9eIBUiBGj5042AFv9N9f/u7/eQXvcQq9YacIuX
	++m075BWCcNz8q085sBExNJoDYEJCAWV6WBiz3ZF1qNWRnUpjVX75DZLvATFxN+68h1BWguEhBJ
	DO6wUP5IyJCK5RKrJ4OTkmH2DVv0cPXE+a1Dg8CnUHKu2yyC6ubaKIuqlNYY8Lk+8CG+FptSFov
	j447pKyA1WnV1Q2nRzDqFqnyXJzhW+GreVBQ9D1+r5E+iQ52e0xO298v6OBya1h+eNWYyZcgSC7
	MlLl5ZkcTPBHv+xYZM9VyNQ4HBQyQmDEjthwNQDu25GeJqVzIWLWqFxLUbOys+1eGn6pdLM=
X-Google-Smtp-Source: AGHT+IFjHGQ/H+wHW0syoZB/rCcGbth7MceBuzjub/X3klVhpmcprnqWAMJ0DPRZSe/+ArGUdMIdMg==
X-Received: by 2002:a05:600c:5250:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-453653925f1mr135996935e9.6.1750761399129;
        Tue, 24 Jun 2025 03:36:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm143398245e9.3.2025.06.24.03.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 24 Jun 2025 11:35:36 +0100
Subject: [PATCH v3 6/6] spi: spi-fsl-dspi: Report FIFO overflows as errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-james-nxp-spi-dma-v3-6-e7d574f5f62c@linaro.org>
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
In-Reply-To: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

In target mode, the host sending more data than can be consumed would be
a common problem for any message exceeding the FIFO or DMA buffer size.
Cancel the whole message as soon as this condition is hit as the message
will be corrupted.

Only do this for target mode in a DMA transfer because we need to add a
register read. In IRQ and polling modes always do it because SPI_SR was
already read and it might catch some host mode programming/buffer
management errors too.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 58881911e74a..16a9769f518d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -560,12 +560,24 @@ static void dspi_rx_dma_callback(void *arg)
 	complete(&dma->cmd_rx_complete);
 }
 
+static int dspi_fifo_error(struct fsl_dspi *dspi, u32 spi_sr)
+{
+	if (spi_sr & (SPI_SR_TFUF | SPI_SR_RFOF)) {
+		dev_err_ratelimited(&dspi->pdev->dev, "FIFO errors:%s%s\n",
+				    spi_sr & SPI_SR_TFUF ? " TX underflow," : "",
+				    spi_sr & SPI_SR_RFOF ? " RX overflow," : "");
+		return -EIO;
+	}
+	return 0;
+}
+
 static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 {
 	size_t size = dspi_dma_transfer_size(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct fsl_dspi_dma *dma = dspi->dma;
 	int time_left;
+	u32 spi_sr;
 	int i;
 
 	for (i = 0; i < dspi->words_in_flight; i++)
@@ -614,7 +626,8 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 	if (spi_controller_is_target(dspi->ctlr)) {
 		wait_for_completion_interruptible(&dspi->dma->cmd_rx_complete);
-		return 0;
+		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+		return dspi_fifo_error(dspi, spi_sr);
 	}
 
 	time_left = wait_for_completion_timeout(&dspi->dma->cmd_tx_complete,
@@ -1069,6 +1082,10 @@ static void dspi_poll(struct fsl_dspi *dspi)
 
 			if (spi_sr & SPI_SR_CMDTCF)
 				break;
+
+			dspi->cur_msg->status = dspi_fifo_error(dspi, spi_sr);
+			if (dspi->cur_msg->status)
+				return;
 		} while (--tries);
 
 		if (!tries) {
@@ -1085,6 +1102,7 @@ static void dspi_poll(struct fsl_dspi *dspi)
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 {
 	struct fsl_dspi *dspi = (struct fsl_dspi *)dev_id;
+	int status;
 	u32 spi_sr;
 
 	regmap_read(dspi->regmap, SPI_SR, &spi_sr);
@@ -1093,6 +1111,14 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 	if (!(spi_sr & SPI_SR_CMDTCF))
 		return IRQ_NONE;
 
+	status = dspi_fifo_error(dspi, spi_sr);
+	if (status) {
+		if (dspi->cur_msg)
+			WRITE_ONCE(dspi->cur_msg->status, status);
+		complete(&dspi->xfer_done);
+		return IRQ_HANDLED;
+	}
+
 	dspi_rxtx(dspi);
 
 	if (!dspi->len) {

-- 
2.34.1

