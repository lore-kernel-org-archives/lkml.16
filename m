Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCB428C87D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925565; cv=none; b=PbXcrVYLHOGvMghEk1kFBgW7p0N4kk635rauvnSrGdRY7VI2XABt3xtrVbm+0GlWPHivuWO50KrBAQ+QqBNpp5FRWaiitnJJxm7a9ZE1veF1eo4S5tqXbCHa+gMnzJqEzdvyuDtYlBWyS3Ed6GKysI2Vl2tFSrNUdH5MsfOlwm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925565; c=relaxed/simple;
	bh=yddrBEmi1RYqf8QMPGgBcWKQg/oZLwzcf2KAxCgTLyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4dfXK8ZWNnyCa2pROaJ4QBgxJZ3jUdQlectIQxqGK3qxKhM1C0Db1iFHpo4FFeUgnynq/Fy5A9FxfJ41loUStd8CHlgaJ9pXA1kgrUlj/Jl2L/B/aEERe6eCt71nLlaVyfRllkuvseBoKcy1PhYqCePxGYTifj1DC8PaWZJE8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNSBDOs+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNSBDOs+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442f9043f56so47676845e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925561; x=1748530361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bX8Np3nsOAVhGpGTczqX2XujPUCRtkdhb7ZQQUV9YcY=;
        b=iNSBDOs+MMhuiLuDAcRdu9I+vI7gHLrc9jXE+Dt9dNoNgHG75a2KmijfrlXHp+g3ee
         +F3X2zb10n4dp81Ubp12RctJPondXf1OJfpJDkOxWnY6AIi7SY+8SIm8rADC7pYXeEVg
         ecicqkTPEoc8vXOHsrPJiac+Q90nyhieAdLJz5hVXulBrGEMvJ5PejeLylIzLelPaIAH
         EP+qGdTiRnB8kzpIn+I7wUN3Vgbw65gpkb88b8P3umP+AOMLUdhDRXZbopebyaLyI6oj
         GJda2rjaus+SS+0rKkostd2tdluXWJVJzaqOC8SXffZIY5y1uF4btCke8iwQylPVBqCr
         arBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925561; x=1748530361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX8Np3nsOAVhGpGTczqX2XujPUCRtkdhb7ZQQUV9YcY=;
        b=aUIrzCshjXx5v99R25qBRaF7fqNKoEgVoC5eKXhje5KDcpqfsFMqI4QRplABwT1OaS
         1BD4Rgf4xsX8L57/yKzCkTyryi7tgclV2y8z0ye9L0hQfZqsxn9a0RbNbLQG/Xm483eC
         34eWd5Eq41SLcDbTfbfwR0R0IzEb69uZX69B7RXeypOBn5BDlV6XLTET4r24urGLetR9
         WkWwXoZS5sUK065HTxdc8HwF/3mOpCPux3/V4NHtCbmZKB86PL2/wINuQRP7TvxRS7pl
         BTRhZHb+sI+Mge5RXxKtc33gJtGLyh4MWZWJppm/TsJehiDsUPrAP+H16eHD40E1Y27k
         1LAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaFC0RPErxmcNxmDcTorVvLu663N0ARaeSea8K34WYeKwq5avdeZPNmTHr5YFgEHz7/PWEViZeNMIFkX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzQveNZzEYerQXVilWHgcD6eeePp09jtDYio+Y6m3L9OXbEs7l
	0BPeqglo59VmnDsnNZPCtEIi183+vOZ0g/0SspO0fBB8sAU6Yx7/AIz5kZ+/lRLS4f8=
X-Gm-Gg: ASbGncu3I5hnEcbmt+Eg+v707vXUt9i7DsQbrKFNLV8LF94RnWO8LT5NZbwSjR3QBQD
	l/5FYd40UOWhlm+UwjFCzRIxkN5dmXNIRUvrjgl8OxPbmL1aul7mp1O6Ql+2j5dZtKj3Azxzr5V
	Lj94DRUbCkLaelh+MXIeOwKcAAACE/4mR3oDNz8Sf8bhsLjXtshcBY3tBIRTTN+7gxMfinEIjQa
	+EA6pGuzKoqPdiJoArE91BihZcyjZ2zcdZUPcvihdtJK+ux0P8/sRxo3/tb1GINAcAplyhNvK5a
	wS8vtvDvqlpabEfIKZ/343LQ4+ggJZpX4J6tzytf2wcgWS+HnwJ53scV9clg
X-Google-Smtp-Source: AGHT+IHkwaJ6gHJgvWiPzVxDv2dV6i3HHkhWCA1c5/mCAe/0o4MB5fUJzCgJeRD5hGESr2V3uBRYRg==
X-Received: by 2002:a05:600c:4ed2:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-442fd67504emr191953925e9.28.1747925560426;
        Thu, 22 May 2025 07:52:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:30 +0100
Subject: [PATCH v2 01/14] spi: spi-fsl-dspi: restrict register range for
 regmap access
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-1-bea884630cfb@linaro.org>
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
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Xulin Sun <xulin.sun@windriver.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

DSPI registers are NOT continuous, some registers are reserved and
accessing them from userspace will trigger external abort, add regmap
register access table to avoid below abort.

  For example on S32G:

  # cat /sys/kernel/debug/regmap/401d8000.spi/registers

  Internal error: synchronous external abort: 96000210 1 PREEMPT SMP
  ...
  Call trace:
  regmap_mmio_read32le+0x24/0x48
  regmap_mmio_read+0x48/0x70
  _regmap_bus_reg_read+0x38/0x48
  _regmap_read+0x68/0x1b0
  regmap_read+0x50/0x78
  regmap_read_debugfs+0x120/0x338

Fixes: 1acbdeb92c87 ("spi/fsl-dspi: Convert to use regmap and add big-endian support")
Co-developed-by: Xulin Sun <xulin.sun@windriver.com>
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 067c954cb6ea..effb460d436d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 //
 // Copyright 2013 Freescale Semiconductor, Inc.
-// Copyright 2020 NXP
+// Copyright 2020-2025 NXP
 //
 // Freescale DSPI driver
 // This file contains a driver for the Freescale DSPI
@@ -1167,6 +1167,20 @@ static int dspi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
 
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
 static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
@@ -1184,6 +1198,8 @@ static const struct regmap_config dspi_regmap_config = {
 	.reg_stride	= 4,
 	.max_register	= 0x88,
 	.volatile_table	= &dspi_volatile_table,
+	.rd_table	= &dspi_access_table,
+	.wr_table	= &dspi_access_table,
 };
 
 static const struct regmap_range dspi_xspi_volatile_ranges[] = {
@@ -1205,6 +1221,8 @@ static const struct regmap_config dspi_xspi_regmap_config[] = {
 		.reg_stride	= 4,
 		.max_register	= 0x13c,
 		.volatile_table	= &dspi_xspi_volatile_table,
+		.rd_table	= &dspi_access_table,
+		.wr_table	= &dspi_access_table,
 	},
 	{
 		.name		= "pushr",

-- 
2.34.1

