Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31402D12F5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019739; cv=none; b=NEm4t3eyC6Sd4fFmkSdLBpLGHdKMjLi41biW9Zs85Fxe/kRGrFj4IlCSkaxaNMHoNkVyyBtiOhdbuNmE6UHRhw/29TEBxteWHI3z26+NHdQFFo0HnX5yScCvYYYI+HOc0LuufmGtDSVLR2JnzcToJKp6LBh984T5ERbYFJ4x+bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019739; c=relaxed/simple;
	bh=tnlV1BTcXX8TkRVCvUT7BEAqgsHtSlAw6diYlslpUgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJ90C2o3fyOricwewg63wG8v5QqMvZ9WRM6mFZst6oN9oxNCc40hQKFkBL0xojFySryWv/T7csumWOGrAgB+M7IAQxMQob1Btwcflt8/Mpc3hgV4iUSon+dQdCPyra7bLuHE8qSxPF6paGmdsOSfHWaWBwaUa04E9AoA3qA/9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CgjSxoY7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CgjSxoY7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so15801855e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751019735; x=1751624535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMKMNWSy8hAGvbCZFBJvEFBm5RGHszf1PCWsZo/9xEE=;
        b=CgjSxoY73zn4hUYrqNPWWHQ/Zaz1RTMWgQya7lTTNFVEA7I5gxHGWDXlfY+uQZbHu6
         HMnZm83sUVR+vCqxte0MdcQGlbm3isWNeZkAwk6s+7YapjNKKWWH1dHPd0ifKQqCD/MM
         f0R/TcQ5q2xlDQVjEWvqLYHzkacKD0HUKlYqsMJDpxa9Iqk1ajJou/WbMD0InraH75yl
         z9r7/AfR16why1n3qTpftmOy3ZWuADaONoAH8ktkqyrjg+h1uMl8kn2UEOCg8lMgsl+A
         JqPXE0oUuQOo/BTOhpR+amBk0q00L6nYsnPUk2zd7eayp1/6nTIZrQUzJoBsstpA2wgZ
         bm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019735; x=1751624535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMKMNWSy8hAGvbCZFBJvEFBm5RGHszf1PCWsZo/9xEE=;
        b=ByE4s0kHB2MgL/rL/42mexCSKOVXdin6OzQk7fRNpdfWN1FoRn74j6C5xP8jLO644M
         1p4JUyyx4Dm+ahatKiBpV3IiK1UpcPU8BPLNEuHB4IAycIrJQP4lLeV5kbHm0yS0cs3t
         yDZAeYEQYkj/afgfCVO7Sf/j+T2ZdFq7xC24xR/B/0eQVGspbimz30NHc8SXKqFicfMA
         mri5PQVvJNMQP8P49v+IvhUjrRHEzN+zyLRLxR8Coi5K19R4Vrg1dWocDyY7bfDwvNss
         X/lNeEbC+WP5glRiX7qXBX6BptVmpHO5NXUxvG/KPP3FO2bXQUMxWD8U1yI9mxvIaicV
         /L6w==
X-Forwarded-Encrypted: i=1; AJvYcCWsHLNuWYTU1M1rOl5W2URL2megWHsN2Z/mthuBm3Vmf09vK9nAq03dvfSftbdTEs0nHtwPPOg4nYnvS3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIaHBk3o2ERXXzSSTJvagJHHMbdpTW5qMeqCZ79ev8iYhMnLgE
	JEpyzx2jCGNnUguu2MA5AYfscH6osUZxCGDPBt1PElY5z2gIiYkbglvioh8/hhnuhWI=
X-Gm-Gg: ASbGncuiexM2T5m7gK8X4z/Fg6qk2Z6MKVP7zNw0mRGJOfEYl+63VUUuuPQQGxqss8P
	0T5ISLmRyRqw91hQov0DQi9X3PjmVIT8pp+4Wj55OH8eSAEao1ufHWggt16SL1aPpd3IWx67N//
	xT9120cd2w6r7r5Rxcvoe0wUIlE2kMVGkxH2r9lLZ5I25tQT+/gCPVVXALktQov6a+dLb1V3FmM
	2tF+riaap/Lie2i7B9RuBwzTqBSZNwJCi0XDWVrPyKq3zc+iXSzaaiaCn5J/mfyD8geR1lz97DN
	j0gcAT+/8RLTqtD/TukEHAhG72mvpCikGBFwD2JpK8IQWz1ntTk/LaIiBcoHzHfiDvwsv28=
X-Google-Smtp-Source: AGHT+IFsKSW3JYeHrMvdSGefKS0adTCUH7itGRvgFnkdhGDlbVeAt6e7x+C9SF55foHinQ7yjVA6ng==
X-Received: by 2002:a05:600c:4752:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-4538ee27811mr36353175e9.10.1751019735290;
        Fri, 27 Jun 2025 03:22:15 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm47250955e9.13.2025.06.27.03.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:22:14 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 27 Jun 2025 11:21:42 +0100
Subject: [PATCH v4 6/6] spi: spi-fsl-dspi: Report FIFO overflows as errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-james-nxp-spi-dma-v4-6-178dba20c120@linaro.org>
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
In-Reply-To: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
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

Only do this for target mode in a DMA transfer, it's not likely these
flags will be set in host mode so it's not worth adding extra checks. In
IRQ and polling modes we use the same transfer functions for hosts and
targets so the error flags always get checked. This is slightly
inconsistent but it's not worth doing the check conditionally because it
may catch some host programming errors in the future.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 46d3cae9efed..2c2a263c5276 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -478,6 +478,17 @@ static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
 	dspi->dev_to_host(dspi, rxdata);
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
 #if IS_ENABLED(CONFIG_DMA_ENGINE)
 
 /* Prepare one TX FIFO entry (txdata plus cmd) */
@@ -566,6 +577,7 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
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
@@ -1067,6 +1080,9 @@ static void dspi_poll(struct fsl_dspi *dspi)
 			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
 			regmap_write(dspi->regmap, SPI_SR, spi_sr);
 
+			dspi->cur_msg->status = dspi_fifo_error(dspi, spi_sr);
+			if (dspi->cur_msg->status)
+				return;
 			if (spi_sr & SPI_SR_CMDTCF)
 				break;
 		}
@@ -1085,6 +1101,7 @@ static void dspi_poll(struct fsl_dspi *dspi)
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 {
 	struct fsl_dspi *dspi = (struct fsl_dspi *)dev_id;
+	int status;
 	u32 spi_sr;
 
 	regmap_read(dspi->regmap, SPI_SR, &spi_sr);
@@ -1093,6 +1110,14 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
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

