Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2616A298CB1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019736; cv=none; b=dayRdlkGUXuAM8J18G5y2/1TeqeLgLDMxAwlzYmSOHJskWCOLBHRLO5qMrGKrWC4Av5cUjEmYvmCYUCtQRatZLe+6i6iu74xufJBy7EL+Xzl7yT+xbS6ZqrQvBQaXrEWW15BmviyznPYm7wjAEpjMXWqEErINPKjKFC90WizEtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019736; c=relaxed/simple;
	bh=W5RB8ofdrCpDCxp+XelolJjRKHlOwBuWzYdhjuY+18A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BoVHU/ifhkiBonBQ/3ZotAnt+JEf9iq6cVIyoVQcLc0v0rus5hH4WPEk+9ukeZhQ1kNyuW3g7IhdLZD9GxqbvfFnEqwWqCOm3mWX2IHRbf6OVBpoqO2NQehaVhNIGRhAiCDh5/jn+ewlXMbO1O+PzDh2b/A8sfihDKFf6xGP5Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kTubgysl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kTubgysl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so18957035e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751019732; x=1751624532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1FhM4WVr7ZEX7RFMvmUpdlE0FbKvEgU2ax6ATn6XZY=;
        b=kTubgyslG8YTj8izLLDgl5CWuMoDOxDfur6QV6TfLEi0F9G+J7oMCdTDNHTvQt1m+Q
         dVEI8Yi03bnlsQJNve0bkXwlxjaq13dEpE2khBN91F5a1M06xvYNi/HMTdGOue3Lih1d
         /M041DSg2G4/GlvlOUMPMu/X8MqvA6Bpt9cBoY7n1XYGb660+W1MWXXZ0JM+FgBbl9AK
         UBDc3v1QGp+s/w/OlG3a7q26wMErlrg7v++ox0KHtsQcMDjr01dC5lPS2VPS9A+OdU2c
         l5Ijy2KlGhK5ZmdPFs/uy6AknoK2szcmHgFSaOg5hv2gsJbqe0XQGyfuh0GsKAqN5P9W
         IlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019732; x=1751624532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1FhM4WVr7ZEX7RFMvmUpdlE0FbKvEgU2ax6ATn6XZY=;
        b=sQLiXs27iPqhzR5UVdvQaTB/BBLbawMBpNX42BgK+E9qUyxVdSnsM2MO6MOAiTBrPW
         nzDAlnLvb5G3exHXaVD4UVkzZKhvG3TPkF5oCYqLPlq9qkDwlFRQnnRxqThVPeD51hgd
         /Qyy8YG94MNlC7lQhIvYDi9kbfJqqgsGFN2PFdSqpgUS9T6/kxi+djdyA+GhYu6/47Vo
         J/WPNfEeWACM3445xJmt5ngs2Q9YfB4WATXy/XamM75QOqj+pOS78VRWjhoGOS6K4stW
         AJi/3YrIQ+pgGG0v8eQROTbsBL59J4u6ZrPr6O7RgBczuIRBqv55rnY1A4mxiSxBEQRC
         7wwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl6VfTVYpw3st+IHy2g1oDgyQXX1WQNvaqV5dP9+BhLSTlb58DDa/env7ikKNmw27dcPHlK96rWS5ues8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq0jdzWG8TTAChaarprnstFAe9uEdZuVgQP2/+l5+qk6BoWtGi
	ioxNLqdDfeFdJuxReQjyLWNaiyI2K5A9Ls8B2QC0eVugukJO0N/YQETjhNhYIGHAW+o=
X-Gm-Gg: ASbGncvE+yu63g70V/FHiLWzfCtuf8JOKRuJw9nIkuaQ+NWv8BDm/NO7w3LUUkoPFBa
	FE6fdXXMF1G5lhz3PKE9XaGmW16WHbbyUnZaP6gRi4EBYpc8/PQflYIMNaM8ykZLrGjVQXyUk0r
	3xz3UIs9NPhV3HCLjfgjz7EB4J72TTCwr788h2OHjxr5dU0G/lzmucDYZAwAHpjiv8XKgXzdRIM
	2bJty0FHT1yZBs+4XwefR3xV7fmO6dU+6C5qiusgq2XWGAU4acQLeY/dbAwt/aaYq9AjOr+oNqy
	67hhIdRTEgLgtbAOACSQhJpDBfNIPfH7+Q37vBnB3diRlqMKgHfonTKHIVYQrt9FVn5XRb8=
X-Google-Smtp-Source: AGHT+IHlOyXervQn+haGiBOZ0vl0FJLTAGumJfi3y5HJSPxa1Q9XBHEO6HL8VaKj5iB0Ic1H05DlqQ==
X-Received: by 2002:a05:600c:608a:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-4538ee4f7c2mr28086715e9.7.1751019732480;
        Fri, 27 Jun 2025 03:22:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm47250955e9.13.2025.06.27.03.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:22:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 27 Jun 2025 11:21:39 +0100
Subject: [PATCH v4 3/6] spi: spi-fsl-dspi: Stub out DMA functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-james-nxp-spi-dma-v4-3-178dba20c120@linaro.org>
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
In-Reply-To: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

This will allow the build to succeed with !CONFIG_HAS_DMA, either due to
a randconfig build test or when the target only uses one of the non-DMA
transfer modes which this driver supports.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 65567745fe9a..feff475dddfc 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -373,6 +373,8 @@ struct fsl_dspi {
 	void (*dev_to_host)(struct fsl_dspi *dspi, u32 rxdata);
 };
 
+static void dspi_setup_accel(struct fsl_dspi *dspi);
+
 static bool is_s32g_dspi(struct fsl_dspi *data)
 {
 	return data->devtype_data == &devtype_data[S32G] ||
@@ -468,6 +470,16 @@ static u32 dspi_pop_tx(struct fsl_dspi *dspi)
 	return txdata;
 }
 
+/* Push one word to the RX buffer from the POPR register (RX FIFO) */
+static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
+{
+	if (!dspi->rx)
+		return;
+	dspi->dev_to_host(dspi, rxdata);
+}
+
+#if IS_ENABLED(CONFIG_DMA_ENGINE)
+
 /* Prepare one TX FIFO entry (txdata plus cmd) */
 static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
 {
@@ -481,14 +493,6 @@ static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
 	return cmd << 16 | data;
 }
 
-/* Push one word to the RX buffer from the POPR register (RX FIFO) */
-static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
-{
-	if (!dspi->rx)
-		return;
-	dspi->dev_to_host(dspi, rxdata);
-}
-
 static void dspi_tx_dma_callback(void *arg)
 {
 	struct fsl_dspi *dspi = arg;
@@ -589,8 +593,6 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 	return 0;
 }
 
-static void dspi_setup_accel(struct fsl_dspi *dspi);
-
 static void dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
@@ -722,6 +724,18 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
 		dma_release_channel(dma->chan_rx);
 	}
 }
+#else
+static void dspi_dma_xfer(struct fsl_dspi *dspi)
+{
+	dspi->cur_msg->status = -EINVAL;
+}
+static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
+{
+	dev_err(&dspi->pdev->dev, "DMA support not enabled in kernel\n");
+	return -EINVAL;
+}
+static void dspi_release_dma(struct fsl_dspi *dspi) {}
+#endif
 
 static void hz_to_spi_baud(char *pbr, char *br, int speed_hz,
 			   unsigned long clkrate, bool mtf_enabled)

-- 
2.34.1

