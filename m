Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62C28D832
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925571; cv=none; b=L1GCLm/9nwxPSxzVNEGM51qs84aMjxbvG+RZ5m77J3KXFAFCMhgAMUrAev0Cm5yKM8Brn/nRUQSOjXAPXjICKnNi0ssoQpdf+apQYrmUyudz6lY613ahs2i+OLbPuHqOzMySG6ev0TP1uX7bbMKcMi7FsXnVSfcdyps8Dq807Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925571; c=relaxed/simple;
	bh=kiQBHy4um6xwGZLFuEKIAnVqksfWdYA3KIeB0asDiB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DIinPQfGLJSnDbl4knE87HtzISBRHDCVQkF5/8rAgsiQiSo1NGQ+BRHRAwriYbIzbctLGq1uIdB3kcaygnD4ucXVG4AiyOmxb5YYNDIwpKEMIJK6zt0UOpXGdXtXyHRQLI2JdpCujwWlMIDbF1zsbx92KpFg9EvAqYr+YQ3gTDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfZbf+Ch; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfZbf+Ch"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso63729745e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925567; x=1748530367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekxEvpWuS4igVbh6hI/u8pSgKuhpUkBiZlEGiziAPKA=;
        b=nfZbf+ChVFZ51K8/9doS+j4sHF5ONiAP7PT/WU9V60+8UIb8lD+0uNJr3OWEt9dff7
         ChETsLPj+qFb20UJ7Ks4FF4WPBQu4abGT32QdBg243HWyIbu92daT4kbCB2Pvap0vvHY
         wJFCsvwiZzlH2viGPuvEU7L6CUIHf94LsN2tjen19DsaORZkZ+fsQPG/+T32L/eCtNdk
         gl6EkHb42+vvZ1DmOBHWp2VGrtIYDswyOVgz9xbQPqevnOfXbQ3fRGCEgGt0WK7dZvAK
         AAo3pJVKw+sD/76sHPAvg2lg8XwF9W/c/9FxXzNh1T8opS64euY3AALhpFXtjN6jdpnD
         CmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925567; x=1748530367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekxEvpWuS4igVbh6hI/u8pSgKuhpUkBiZlEGiziAPKA=;
        b=kBWqYZ+sPo+u3JkITN4Rvs45NwyHqAWAOcy8ScJ1VWNXkbOwK6hanxZ8duxNoEWhEI
         imBz25VuaNwd3Kk3opsDDH78b2RWS3Mqz+YQZloaa+VVEgfvBW2+s6qBrBkRBuN9AwIq
         xWSENez17TZCmq/3GLbP0Ve57Pau5F7aUJdj9xq1CSCzXsst4p/NWwfZlKZQ94LDSpO/
         kQFcm+7SZjeAcBemaA7c/qn0xEPJxiYAMfrEKxHDcFjcfV4Ed0qzvxktpOh6MqSpk95r
         vtYtQ90eV/pbmrriEfzjGO0DgaTjDIPR5Yo8S3LsiEi+ky3/JSgAVdADqWDSlmwE+jnI
         PRcA==
X-Forwarded-Encrypted: i=1; AJvYcCUfDXNKP+T2CSXE9csQqVNSw/p9mfDgDVXkDBTCxrMD6MtvYJul5/eZFj4a03VGWaxU2tCrm9XE3v3+vL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYZJ8uCbZMRGu2PmUOqaA++q/o+s+YtZ2MGg3k67y8UT/q6a8R
	qsFYVOiJqllRdHwZB/Kk+mJ0HYIO5UcgaAwKbkdVjdiiMCfDS+aC3/Rc4vquw2Kt/h8=
X-Gm-Gg: ASbGncsHvk4szEz/aZ/XA68R3sEzrk6i9BK/JeqHasgg9pLWHf89KmRsbdXhiRtVpYu
	+aXUZl72O6ZbyEKUrUZMkHARHZxUnLpanlVpMZ3RfGW128/lfFYbSF7YR2X39yGteHrTxE2/CMM
	FArJvNjm3sVeb0xh5dVqUtv7zqg1dPqC5GmqYWESkt5L8h0Cv6Gl2U1cHS9mNVD0wuMPlnOKhUW
	0tojUuZnSGShRS7SEaIYEHPU2rwiZPA+yZ3sA55dnkazrEAoCEg0wWpcSgmRCocMovcBspKiNAB
	PbKvPTe/J1A5T775KV1OYTZM9Ped8nphYIDumhE2Lz7cWxz5O2OKLrHe1WzW
X-Google-Smtp-Source: AGHT+IEjdoLRI1UrwQMZZYK9VyQtOn7WHlwOVEzQNmbeaE/Kx2oQJzrZySZ4Otg4xaleKcsb0UIPug==
X-Received: by 2002:a05:600c:3e84:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-442ff029b73mr227361635e9.24.1747925566943;
        Thu, 22 May 2025 07:52:46 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:34 +0100
Subject: [PATCH v2 05/14] spi: spi-fsl-dspi: Define regmaps per device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-5-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Refactor the regmaps so they can be defined per device rather than
programmatically. This will allow us to add two new regmaps for S32G in
a later commit.

No functional changes.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 136 ++++++++++++++++++++++++---------------------
 1 file changed, 74 insertions(+), 62 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 09b2b25ed274..437a8db9fa2b 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -122,6 +122,7 @@ struct fsl_dspi_devtype_data {
 	enum dspi_trans_mode	trans_mode;
 	u8			max_clock_factor;
 	int			fifo_size;
+	const struct regmap_config *regmap;
 };
 
 enum {
@@ -137,60 +138,130 @@ enum {
 	VF610,
 };
 
+static const struct regmap_range dspi_yes_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_MCR),
+	regmap_reg_range(SPI_TCR, SPI_CTAR(3)),
+	regmap_reg_range(SPI_SR, SPI_TXFR3),
+	regmap_reg_range(SPI_RXFR0, SPI_RXFR3),
+	regmap_reg_range(SPI_CTARE(0), SPI_CTARE(3)),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
+static const struct regmap_access_table dspi_access_table = {
+	.yes_ranges	= dspi_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_yes_ranges),
+};
+
+static const struct regmap_range dspi_volatile_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_TCR),
+	regmap_reg_range(SPI_SR, SPI_SR),
+	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
+static const struct regmap_access_table dspi_volatile_table = {
+	.yes_ranges	= dspi_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
+};
+
+enum {
+	DSPI_REGMAP,
+	DSPI_XSPI_REGMAP,
+	DSPI_PUSHR,
+};
+
+static const struct regmap_config dspi_regmap_config[] = {
+	[DSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= SPI_RXFR3,
+		.volatile_table	= &dspi_volatile_table,
+		.rd_table	= &dspi_access_table,
+		.wr_table	= &dspi_access_table,
+	},
+	[DSPI_XSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= SPI_SREX,
+		.volatile_table	= &dspi_volatile_table,
+		.rd_table	= &dspi_access_table,
+		.wr_table	= &dspi_access_table,
+	},
+	[DSPI_PUSHR] = {
+		.name		= "pushr",
+		.reg_bits	= 16,
+		.val_bits	= 16,
+		.reg_stride	= 2,
+		.max_register	= 0x2,
+	},
+};
+
 static const struct fsl_dspi_devtype_data devtype_data[] = {
 	[VF610] = {
 		.trans_mode		= DSPI_DMA_MODE,
 		.max_clock_factor	= 2,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_REGMAP],
 	},
 	[LS1021A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS1012A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS1028A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS1043A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS1046A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS2080A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS2085A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LX2160A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[MCF5441X] = {
 		.trans_mode		= DSPI_DMA_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_REGMAP],
 	},
 };
 
@@ -1191,61 +1262,6 @@ static int dspi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
 
-static const struct regmap_range dspi_yes_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_MCR),
-	regmap_reg_range(SPI_TCR, SPI_CTAR(3)),
-	regmap_reg_range(SPI_SR, SPI_TXFR3),
-	regmap_reg_range(SPI_RXFR0, SPI_RXFR3),
-	regmap_reg_range(SPI_CTARE(0), SPI_CTARE(3)),
-	regmap_reg_range(SPI_SREX, SPI_SREX),
-};
-
-static const struct regmap_access_table dspi_access_table = {
-	.yes_ranges	= dspi_yes_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_yes_ranges),
-};
-
-static const struct regmap_range dspi_volatile_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_TCR),
-	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
-	regmap_reg_range(SPI_SREX, SPI_SREX),
-};
-
-static const struct regmap_access_table dspi_volatile_table = {
-	.yes_ranges	= dspi_volatile_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
-};
-
-static const struct regmap_config dspi_regmap_config = {
-	.reg_bits	= 32,
-	.val_bits	= 32,
-	.reg_stride	= 4,
-	.max_register	= SPI_RXFR3,
-	.volatile_table	= &dspi_volatile_table,
-	.rd_table	= &dspi_access_table,
-	.wr_table	= &dspi_access_table,
-};
-
-static const struct regmap_config dspi_xspi_regmap_config[] = {
-	{
-		.reg_bits	= 32,
-		.val_bits	= 32,
-		.reg_stride	= 4,
-		.max_register	= SPI_SREX,
-		.volatile_table	= &dspi_volatile_table,
-		.rd_table	= &dspi_access_table,
-		.wr_table	= &dspi_access_table,
-	},
-	{
-		.name		= "pushr",
-		.reg_bits	= 16,
-		.val_bits	= 16,
-		.reg_stride	= 2,
-		.max_register	= 0x2,
-	},
-};
-
 static int dspi_init(struct fsl_dspi *dspi)
 {
 	unsigned int mcr;
@@ -1305,7 +1321,6 @@ static int dspi_target_abort(struct spi_controller *host)
 static int dspi_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct regmap_config *regmap_config;
 	struct fsl_dspi_platform_data *pdata;
 	struct spi_controller *ctlr;
 	int ret, cs_num, bus_num = -1;
@@ -1388,11 +1403,8 @@ static int dspi_probe(struct platform_device *pdev)
 		goto out_ctlr_put;
 	}
 
-	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
-		regmap_config = &dspi_xspi_regmap_config[0];
-	else
-		regmap_config = &dspi_regmap_config;
-	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base, regmap_config);
+	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+					     dspi->devtype_data->regmap);
 	if (IS_ERR(dspi->regmap)) {
 		dev_err(&pdev->dev, "failed to init regmap: %ld\n",
 				PTR_ERR(dspi->regmap));
@@ -1403,7 +1415,7 @@ static int dspi_probe(struct platform_device *pdev)
 	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE) {
 		dspi->regmap_pushr = devm_regmap_init_mmio(
 			&pdev->dev, base + SPI_PUSHR,
-			&dspi_xspi_regmap_config[1]);
+			&dspi_regmap_config[DSPI_PUSHR]);
 		if (IS_ERR(dspi->regmap_pushr)) {
 			dev_err(&pdev->dev,
 				"failed to init pushr regmap: %ld\n",

-- 
2.34.1

