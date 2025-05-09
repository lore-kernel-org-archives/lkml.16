Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2C6291154
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788830; cv=none; b=r550pruvxkoGx1oJztZjhzFhqirrV3XhBUSwljmOULEom3e9O+BSzYPlT4R9YtwqUc5BZdwSLdJEj6QWoLt82YAfMLYrld2gHduqRIwGTbcjsU/XFYOTmnIqMzrKw1oQuYCpHmImSDB1e/jD86PbHX+PiB4huXBnBpBhlDBgQn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788830; c=relaxed/simple;
	bh=S/bLVRCZo0bzcqIxKXf/hzh5QW5OR0CMl07vRP4K15U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVjXED4SDoczFiac5QXHiv/tpFYPWS5mSt/80P35GvOv7KKauIYGtmuTqb7zTCjmSEWcpDF4SIaybI1xoTm4geqxAlnw49fdyGSj4gZF4s4Lqe2W6EQWc3++WBp6ibEZxgRsj3mHk/rDyvzQ3ChO+wEv49GJvGX7N4HLIjBd/B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcmkc4NY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcmkc4NY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so1154851f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788827; x=1747393627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEyehrM+Fx4o61r/yR0u4BgsTY9lmtx/SKx/NBJ8aCc=;
        b=fcmkc4NY3e06M3r35eJcaaQJvrglBrg2+8r5I4v18Qq1gGy52ko2ucK/R26ePMG9dU
         vq1sWhdRdgnILOA2bcPC6tONNH8hsZu0Xw5WOZhKbZK0KJES76T4Cv+R/MXPd52SXh8G
         zjhVE1s83JZfCXIEnAYo33slZ6GMqnjsk8YInsjZJEcvNVmWCrT1uklRkEuzmsvn1F5M
         t+aYIAGgDTBOeU62TTcF1ebW9NNm0owXqioMS91rO2FlldYXsGitBj3YCJFQ6lB27SXR
         Zsf3scFjYvik8nIu9PQndeNVMJQMc18QJFT5LSsPSmEgwWF9L0t7tZDbsboakbNYtuIm
         wnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788827; x=1747393627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEyehrM+Fx4o61r/yR0u4BgsTY9lmtx/SKx/NBJ8aCc=;
        b=D7ls7Xr6NzCgYyUUiecJfOYyz48Ooux49aweyVafydfPSFn1pMac5v3io8OvJK08cK
         KnGscASMr/B/wzaPkyNWg3VvXPtV9XctlCX3Z6nHyyegtOQNpcrVLxoUlFmLqKR/Chqx
         FTDw50+Btsqu/Jl18KHnr8JAORT2iV/yPp3AfOnNKX7awPgp+RzXOWwMCHvUZvetDZCb
         WO+noHJfq9BmNMrJ5ukQ5YfZgP5Vth6/MA4ugZUasZHyVGl98oGNSIs3wvTOFnCRF9Ka
         kFhqIt7tRA1hXUWDe3PuPpBl4itu7DRc8VDmFXZplPHY+rWyThWWwSWmPcpgQytccZNm
         spsA==
X-Forwarded-Encrypted: i=1; AJvYcCWt51tiuw7JIVSV3njcAiOWEaLMeo1V0YGXi805S5NluJXqRDEgtlAanij7MfzDC03x3H7MLSHNSuhHEoM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyjccb86WqQZB+aqBwMFOBWx+VT05Bjd/+YzXGyPEVcHsEzDfS
	QSz5S/TtRW+FYduz5FoYGYr3E1eg7ruBRPaUtuj29d5wWMwhiLirkTlvjhHWpTI=
X-Gm-Gg: ASbGncvIbteYgPuaGXFZK3ICEbz06nfnZR+lJRBUoCTMCIvP5Lu+j1AdmLOT/FsinTE
	5FCAZJTIDh2Gfn/9hALLzRa0VJfpbmLSVKZ1xIR0EMGoZk1ks7xF5TDzMOWyN13p55dn2jbhNsc
	wdsiQwd6YgsTTs/dxP2EDdTEhXxh5c4UTj9yTZnJ1UU2wi0Gb//8hZ8SLFXqtLvdGQGKx2OXFSX
	Z0yP/Y+Iq3snu1bNiCf/DCUwaw+msPTIGHPA5NAmPtcIJSZ99ZkXsccvrEwJWIgkCFuwfFbDGWC
	N+ETUARg/W3c3K2wCV2dLU66gxGKPV7pZmQfcb0WRVJ1yKc=
X-Google-Smtp-Source: AGHT+IEQntKAHHe5FBbl7TvKgw8FWGCOZDWYXdtRsViQGulRTo3e/GMO/aV0MJn1nNmDeMFHI32nUQ==
X-Received: by 2002:a05:6000:2506:b0:3a0:a0e5:d28b with SMTP id ffacd0b85a97d-3a1f6421ecemr2453655f8f.3.1746788827070;
        Fri, 09 May 2025 04:07:07 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:06 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:56 +0100
Subject: [PATCH 09/14] spi: spi-fsl-dspi: Reinitialize DSPI regs after
 resuming for S32G
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-9-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

After resuming, DSPI registers (MCR and SR) need to be reinitialized for
S32G platforms.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 73 +++++++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 50cec3b94322..0613642d769d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1258,6 +1258,39 @@ static const struct of_device_id fsl_dspi_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_dspi_dt_ids);
 
+static int dspi_init(struct fsl_dspi *dspi)
+{
+	unsigned int mcr;
+
+	/* Set idle states for all chip select signals to high */
+	mcr = SPI_MCR_PCSIS(GENMASK(dspi->ctlr->max_native_cs - 1, 0));
+
+	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
+		mcr |= SPI_MCR_XSPI;
+	if (!spi_controller_is_target(dspi->ctlr))
+		mcr |= SPI_MCR_HOST;
+
+	regmap_write(dspi->regmap, SPI_MCR, mcr);
+	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
+
+	switch (dspi->devtype_data->trans_mode) {
+	case DSPI_XSPI_MODE:
+		regmap_write(dspi->regmap, SPI_RSER, SPI_RSER_CMDTCFE);
+		break;
+	case DSPI_DMA_MODE:
+		regmap_write(dspi->regmap, SPI_RSER,
+			     SPI_RSER_TFFFE | SPI_RSER_TFFFD |
+			     SPI_RSER_RFDFE | SPI_RSER_RFDFD);
+		break;
+	default:
+		dev_err(&dspi->pdev->dev, "unsupported trans_mode %u\n",
+			dspi->devtype_data->trans_mode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int dspi_suspend(struct device *dev)
 {
@@ -1284,6 +1317,13 @@ static int dspi_resume(struct device *dev)
 	if (ret)
 		return ret;
 	spi_controller_resume(dspi->ctlr);
+
+	ret = dspi_init(dspi);
+	if (ret) {
+		dev_err(dev, "failed to initialize dspi during resume\n");
+		return ret;
+	}
+
 	if (dspi->irq)
 		enable_irq(dspi->irq);
 
@@ -1293,39 +1333,6 @@ static int dspi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
 
-static int dspi_init(struct fsl_dspi *dspi)
-{
-	unsigned int mcr;
-
-	/* Set idle states for all chip select signals to high */
-	mcr = SPI_MCR_PCSIS(GENMASK(dspi->ctlr->max_native_cs - 1, 0));
-
-	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
-		mcr |= SPI_MCR_XSPI;
-	if (!spi_controller_is_target(dspi->ctlr))
-		mcr |= SPI_MCR_HOST;
-
-	regmap_write(dspi->regmap, SPI_MCR, mcr);
-	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
-
-	switch (dspi->devtype_data->trans_mode) {
-	case DSPI_XSPI_MODE:
-		regmap_write(dspi->regmap, SPI_RSER, SPI_RSER_CMDTCFE);
-		break;
-	case DSPI_DMA_MODE:
-		regmap_write(dspi->regmap, SPI_RSER,
-			     SPI_RSER_TFFFE | SPI_RSER_TFFFD |
-			     SPI_RSER_RFDFE | SPI_RSER_RFDFD);
-		break;
-	default:
-		dev_err(&dspi->pdev->dev, "unsupported trans_mode %u\n",
-			dspi->devtype_data->trans_mode);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int dspi_target_abort(struct spi_controller *host)
 {
 	struct fsl_dspi *dspi = spi_controller_get_devdata(host);

-- 
2.34.1

