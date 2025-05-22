Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD928E5FF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925580; cv=none; b=tOtCdPnKPZFUGRhJX/TDMqWHIQN0qbE6d0AacMqMQLs09oVbf12+wZEQfWYyEYlJBD38a4/hYN3/D3Ah4nafMfEN3WjiI434cOJmir/be3dkWdSgEFt0KELTQ9ndWu3A7AdRe21My4Lmj9Suh0wxgAVnavjdkPM8lNagXVmyOK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925580; c=relaxed/simple;
	bh=elThI93HwB4PxLZjW2S1nGNED80rFcrhaDTiQgygkCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSH7QPSzcXzx37nb/HgwlKRHJxSjgvcZRD0HmxIL6SNKXeTgBJVGbKPEe4sp0qRC7tnYCSEAfIZ1O79suGpccDuNzXCJ7Y2szvkftL369kNnKHgEzP4r6Kqkee7/MJ9rfaQOvs6VPCzBwJyd1GEVpHmkVFop3g2RIAwu7sk/8Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sj7pAaf6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sj7pAaf6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf680d351so55577185e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925574; x=1748530374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQcMbg+mj75exB6fMqaj4+6mofUOuhQ1ONizqDxy1LQ=;
        b=Sj7pAaf6CjWXFhuohXHo/iest4HI0rE3o6T+j5or0vQhuf1CWfHunZEBcrhJC4zRYu
         PmZK5EIjK6Ey1+G5V6OepQ2KichrrD+MUtKKrV6HPQ1UNBXq702OgiHMhetQYWAs6wC2
         5ao5z+lsyykvyVq9DgcegaUwEpe37pR/ZA8x7No9VODQZlgIGbhdk//HRleapUk28x3/
         qhaXFOW8kYyc2hX/Su5ZwWV4CtJRuFiS5Sm8IxfIPe1mpn4F5bIWF+zmaBsAFdHUSS4y
         GEDV/pJag4bvsnOLLY/mqGOnU+UijJbjSPUwdZrweMeSiosKy7BcTTMpAimvAmfl84Nh
         D/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925574; x=1748530374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQcMbg+mj75exB6fMqaj4+6mofUOuhQ1ONizqDxy1LQ=;
        b=CynFwQWUGo0Hwj0U6w8pPRFk0gSDEWnBOkJNPlgoUs/4Cv6XFpy4FzNbrlUN3v08hg
         CJKIYvvi1Mn0G4hRTbu6PJ/Y3mTWXgl0AVr3iILT8yCBca0xGEjOVLD4EDuixJzabOPx
         TbNT11jX5mDV/mquCQF5mUGnBWb3zjhPzX1mMGY9xm9c1XoOoLXbu1uUyEAaupyDdN7u
         aPFh+M+I3E4/C9W+612C7LxvjN4eBqAAr379yFLaQOPZGN+9zf3FLUMV0cM9Jg2yZWgG
         fqnjd8y9etHq9QZV3yiF7pDih7ALr2YL63Ksf5p1iCMFX/W3gE2koRUfkRMh8Nu9fD9q
         xaUA==
X-Forwarded-Encrypted: i=1; AJvYcCXDwfPQF13grc5EPfWuwdEd4VTpzOKDh5TKTGZnA0OVmXThqhCFJoj9H3+cQyhRk8m9wk+QM9bBg7VP2Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YynI4lCvn69OLBT37xXJLmu+Z9Fq4kRJXMVtVzdqtjWwuxxnD3X
	djXNpwQ7M6t0fm7rURXN+kNvLvKvS+c3JcnwEe58rGnkRtga7dL3v5vF+7LuDE3oxTiP0ukTC1P
	8RU2QUPGBXw==
X-Gm-Gg: ASbGncv9p6AoPy+Nf7xjshRp+zE1YyHBI3mXSe+uyeX2SbBZ8l5217IDfje1wM3dO5/
	SdvAKTEaBFlUkOZELeiL3ict9UIuv/UDgIaNqz/4Q+7N0ABcEfh2BQXEdQZvr9NCGpywQYNIwCA
	tCCpdWGmozYvCVkmoWiQqAytMuolWmlt89t1Q1c+iXLFGc+2HL5HUy4RVkTQ5Owz/+iiOfsggYJ
	KCLzSBQr6zbb1Kgryvq7l0uwMwrAXsMkZJCMfxqCOcOKQ2ofcvj+z7ji0uvNQwQbvr2OXa+gYn6
	dX0ipFzAhQTBpQga4mub6gv3qhpQ4elNkCYqafpxxj8mD/dcYahGJZkDThBvUTnMSPUtfYs=
X-Google-Smtp-Source: AGHT+IFcpjDviXjWNB7+EBIbhpiq2tpPR7sQlo7rFyrWtoBHLAjxGUQNW2PIVbs7fj19J7u5oXlJ7g==
X-Received: by 2002:a05:600c:a40a:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-442f84c2092mr260241495e9.3.1747925573711;
        Thu, 22 May 2025 07:52:53 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:53 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:38 +0100
Subject: [PATCH v2 09/14] spi: spi-fsl-dspi: Use DMA for S32G controller in
 target mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-9-bea884630cfb@linaro.org>
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
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

Switch to DMA for target mode otherwise the controller is too slow to
feed TX FIFO and UNDERFLOW occurs frequently. DMA can work only with 8
and 16 bits per word. 32bits per word is not supported, this is a
hardware limitation, so we keep the controller mode in TCFQ mode.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 24a51267cb4d..db5a2ed66f68 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -139,6 +139,7 @@ enum {
 	MCF5441X,
 	VF610,
 	S32G,
+	S32G_TARGET,
 };
 
 static const struct regmap_range dspi_yes_ranges[] = {
@@ -183,6 +184,7 @@ static const struct regmap_access_table dspi_volatile_table = {
 
 enum {
 	DSPI_REGMAP,
+	S32G_DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
 	S32G_DSPI_XSPI_REGMAP,
 	DSPI_PUSHR,
@@ -198,6 +200,15 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.rd_table	= &dspi_access_table,
 		.wr_table	= &dspi_access_table,
 	},
+	[S32G_DSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= SPI_RXFR4,
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &s32g_dspi_access_table,
+		.rd_table	= &s32g_dspi_access_table,
+	},
 	[DSPI_XSPI_REGMAP] = {
 		.reg_bits	= 32,
 		.val_bits	= 32,
@@ -296,6 +307,12 @@ static const struct fsl_dspi_devtype_data devtype_data[] = {
 		.fifo_size	  = 5,
 		.regmap		  = &dspi_regmap_config[S32G_DSPI_XSPI_REGMAP],
 	},
+	[S32G_TARGET] = {
+		.trans_mode	  = DSPI_DMA_MODE,
+		.max_clock_factor = 1,
+		.fifo_size	  = 5,
+		.regmap		  = &dspi_regmap_config[S32G_DSPI_REGMAP],
+	},
 };
 
 struct fsl_dspi_dma {
@@ -351,6 +368,12 @@ struct fsl_dspi {
 	void (*dev_to_host)(struct fsl_dspi *dspi, u32 rxdata);
 };
 
+static bool is_s32g_dspi(struct fsl_dspi *data)
+{
+	return data->devtype_data == &devtype_data[S32G] ||
+	       data->devtype_data == &devtype_data[S32G_TARGET];
+}
+
 static void dspi_native_host_to_dev(struct fsl_dspi *dspi, u32 *txdata)
 {
 	switch (dspi->oper_word_size) {
@@ -1426,6 +1449,9 @@ static int dspi_probe(struct platform_device *pdev)
 		dspi->pushr_tx = 0;
 	}
 
+	if (spi_controller_is_target(ctlr) && is_s32g_dspi(dspi))
+		dspi->devtype_data = &devtype_data[S32G_TARGET];
+
 	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
 		ctlr->bits_per_word_mask = SPI_BPW_RANGE_MASK(4, 32);
 	else

-- 
2.34.1

