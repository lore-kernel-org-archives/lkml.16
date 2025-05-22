Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB4728EA51
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925579; cv=none; b=r84Mc4fHVjqrNtC+TQkDjGcSeOa3WRMOhcLyGeRlF7APD9YWgNI+Rt1eIhDEFH7mNQnGHbtkljmZ+EqAtcSGMUEyUqmm0uR8A2VM9ApRRRKXg4TWpDTcoxgkBaWo0nH5mwPW1SD8A0hRG88gOE4Ff7rOpnPBYXi2euuSlwatmKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925579; c=relaxed/simple;
	bh=k0PcdAJ0HJ4xwSr8Ni1t6OBhIXBRFHDlIiZHG4Apiiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGHaCPgzBCicTBBtHf70GfxUD7yWCU9HCSmXWDoMNXDrqmoSKiUqJ0VN7rF1ZvF11SlBM/KgANCrVMXMqXk+2uo/Cq9BG0to+SXOSrMFbpgpxOdyEAA1QOil/X97nt8xeqeXe5gKECc06nG0OXPioOc4c7PQTYadixVhXJgjzE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xEniJUFD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xEniJUFD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4bdee0bf7so610018f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925575; x=1748530375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLFyEyvP8ZFrDRQwCY+ktHxPM5O5euwpWz07D5k+81M=;
        b=xEniJUFDXmGi6teLblwVfwo5TaN+v/muwN7FVywq86Vz4XABnHuN80Plj4xyCsMecO
         E/Jl4gwTKdJJl693OKP8tE76sbUbCn8tzQEMXjIppktCUh0SGbT0MeHowd/bvhKmto1X
         0MJ/buiJR4iU6/s9t4rkrcH230R9MrPjmipyMw/uTKeJcV7ebeaeKe9LkHgblio3FvlN
         veLjLUAbjamzZ1bBk7wYKt99GyMbx4qcI3+JqyqWMetkRDTUA7aAwV81WpZh/aN9v27j
         166pgmd5fTDP9xhBjJhUCcosJrAl10FPzmWn89EWhTRcdpVaalNLPP8QhnIUAOhciQlE
         lylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925575; x=1748530375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLFyEyvP8ZFrDRQwCY+ktHxPM5O5euwpWz07D5k+81M=;
        b=EQdVZWreve1eFB2e88beBK+qEF1jv6Rq+EyAXx/ezWdazZo3jqVxZ5beVCUtX0JZwp
         xN1wH1jwdZ6z68x64KgU+OfvyUrb0FiN8hpfvm4WdkYfBEJX3OaTb2Y8gqFDM6aNYuUP
         rha32n7erWFCPN9d9bytYNn4mparGFwdByVO3bI9YsdMCIENR/e9MQrhe9T9SIDAm8xA
         JtIwQBYacEcFMk23CFJVR3mSS2r5fL8HlND4PLApPIRTTcFtqLUS2oPB7wNC5GEn+l2h
         AVWeeSsY5KSZtgRAupkUOBV/TJ+AGzChVb9c2hpkz7eDUA2qeDCOhX2wZbtJo0le8OMs
         /fJw==
X-Forwarded-Encrypted: i=1; AJvYcCUZXCParo5v87MKVDKLAStq51Lk7LSb4X3nBqOVhTP2Mb9D7gh1mXH50NT/AxZgT1lI/mORaHbYIVb6AVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YytEkLVjKf7bSjewU4FCDqtFyT1YFkM4v8UMVAbltxegGhN1AUm
	/QURM/iO8XjxHfxrfm/zoxpEDvAPw5KN2bcdvSE97s5BUaraGykYClezsWu6n8V6k40=
X-Gm-Gg: ASbGncslcA+mQIBWtEBTrtXhGG0iuM1y1I5b0ZzyvlqfEprm5XX39R99qT5XOStjTaI
	thY4+Ubx4Y4JOiEyBgj1tMQbq7hGkdRVuV7WzIHQc1MVEzGaM1yMmkAaokiCHWFXZ88oh4neJ6/
	6fGhlgNu6Q845BOkqtVIysrpvjO6SAjQTXpImjHsxlghn8EMSTLrRL4OFrKHx2S0YmDQldsU1za
	9ytjs11ceTfStdW4cTlt9FVpnSvngPCAgURM/uRQMMMVPU6OMDxRUJyjjkWgzKQHC7o2fCiO6Zo
	bDBuznUItAG9s1kdkdnYK/0Vw3ZV5y6QZaOkxn/S7adz/d3Pgn5EOamC5v8U
X-Google-Smtp-Source: AGHT+IHpujM/0/34jM6P3ZaQZmGH/9lm4oq4PRVyuyvqdp8HN5RGOmpnF0//KC96gVkhdqXMaCEYdg==
X-Received: by 2002:a05:6000:1889:b0:3a3:7e01:d2fa with SMTP id ffacd0b85a97d-3a37e01d307mr9061150f8f.28.1747925575135;
        Thu, 22 May 2025 07:52:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:39 +0100
Subject: [PATCH v2 10/14] spi: spi-fsl-dspi: Reinitialize DSPI regs after
 resuming for S32G
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-10-bea884630cfb@linaro.org>
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
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

After resuming, DSPI registers (MCR and SR) need to be reinitialized for
S32G platforms.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 77 +++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index db5a2ed66f68..a3efe1bd3b37 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1284,41 +1284,6 @@ static const struct of_device_id fsl_dspi_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_dspi_dt_ids);
 
-#ifdef CONFIG_PM_SLEEP
-static int dspi_suspend(struct device *dev)
-{
-	struct fsl_dspi *dspi = dev_get_drvdata(dev);
-
-	if (dspi->irq)
-		disable_irq(dspi->irq);
-	spi_controller_suspend(dspi->ctlr);
-	clk_disable_unprepare(dspi->clk);
-
-	pinctrl_pm_select_sleep_state(dev);
-
-	return 0;
-}
-
-static int dspi_resume(struct device *dev)
-{
-	struct fsl_dspi *dspi = dev_get_drvdata(dev);
-	int ret;
-
-	pinctrl_pm_select_default_state(dev);
-
-	ret = clk_prepare_enable(dspi->clk);
-	if (ret)
-		return ret;
-	spi_controller_resume(dspi->ctlr);
-	if (dspi->irq)
-		enable_irq(dspi->irq);
-
-	return 0;
-}
-#endif /* CONFIG_PM_SLEEP */
-
-static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
-
 static int dspi_init(struct fsl_dspi *dspi)
 {
 	unsigned int mcr;
@@ -1354,6 +1319,48 @@ static int dspi_init(struct fsl_dspi *dspi)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int dspi_suspend(struct device *dev)
+{
+	struct fsl_dspi *dspi = dev_get_drvdata(dev);
+
+	if (dspi->irq)
+		disable_irq(dspi->irq);
+	spi_controller_suspend(dspi->ctlr);
+	clk_disable_unprepare(dspi->clk);
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static int dspi_resume(struct device *dev)
+{
+	struct fsl_dspi *dspi = dev_get_drvdata(dev);
+	int ret;
+
+	pinctrl_pm_select_default_state(dev);
+
+	ret = clk_prepare_enable(dspi->clk);
+	if (ret)
+		return ret;
+	spi_controller_resume(dspi->ctlr);
+
+	ret = dspi_init(dspi);
+	if (ret) {
+		dev_err(dev, "failed to initialize dspi during resume\n");
+		return ret;
+	}
+
+	if (dspi->irq)
+		enable_irq(dspi->irq);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
+
 static int dspi_target_abort(struct spi_controller *host)
 {
 	struct fsl_dspi *dspi = spi_controller_get_devdata(host);

-- 
2.34.1

