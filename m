Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672C320D51E;
	Tue,  1 Apr 2025 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522357; cv=none; b=EwH8bvqxUx+YjgdzBguETWOid/WnK7JZim3A/qzNZfO0dsM9G+/FF7K9yGwAVVmkDF2DcJEmU67emQtqbWM8ZUurn5tXcPVx+4fUVsEi1N4GiUti/HTgRI6BkA2ey0+EQOOLAHOGc2wlXOJstsGX8WKo1fxqJoJ5a4AzZF4vfls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522357; c=relaxed/simple;
	bh=F8NZNfXY+db76aNNrBJbSG7T5RVx6dAyulLZqrqB6lM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jY+R/G5jjIkm9csyPlW0VKXrQ2qiIAPK9Tt7wxJ6tTPgtnkWY5gfv4KxOr7CqZIVLsa+lr/VxpgKOwdcaZK37UZ+2+8THpPmD8awOO2JrtFojzHX4xJ0pbclqnT5/s9mcL7ViY1lM929NMhN8MX24eaTpQRzFxYac/z1WxAHXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1wgNUjW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1wgNUjW"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ac56756f6so4916660f8f.2;
        Tue, 01 Apr 2025 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522354; x=1744127154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=i1wgNUjWF0Q5fQlBwjB4YLVz/H4n/jSnIufeJl2HVeE0tJkZjTLdeEslKgcLLH5GuE
         HzWTt7AuI2dQ0PJbF6ZvCylh5/pCWe/6MqpuLRpVAf2kwUQkYkCy5ZRGizHHIzFYvE3o
         Fe/LNsvAK/WhhqYmwjNJEnIPnD8JQOk0FRAMG16h8vGcD/+WIkyOaOKIJVp2mAihpPCt
         bzspLwcszWsES2sYa5qItiHgK/YnRKkIOohXVYT88peEV6fPxMHI0RMLci1UYI8vAxIu
         chBhGaeU7DaQyRsfMImzmYroJb1+AzfkfOBjjJtLu7qtb2mDmWYSE49CgtjB9/aguUqF
         vK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522354; x=1744127154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=oBrm9Rf9lEqkhg3jexytTnT4XSv8e3qEDABaQRazWn1B7H+KqnkYoRm9niJykZLEX3
         eCiVjfOFGwlY6cXjTm8dFbKwylHQECdv4Vmk9+OdpDNXJ84KOCV0Mtt/jgpTaFqX68fj
         DGOr/vbY1bVMTqNmSukaDS0wmkDuKr/8ISSKj2zHAegoBI8B1I/1ZCTy84Bbfezfvmjs
         Un6ZBdttCbjpChzGT7AVDPRwuaVNlKzzf3fDQsV0a2PqFOD2IgkOVSQ5YM+/TP4a8vJV
         gGbA1Tov9EydB9XQDpKIRs2ko7dJnFDu9YwXpUlxXLlSELb5OIjcZJ7wWzMjjQyzjofF
         UjWw==
X-Forwarded-Encrypted: i=1; AJvYcCVDCrvuLTzhfGzYFpmL8/bM7SwtQzfsKqgNWEn2xFNCKrbxU7sXar6i2XAhUt7FAG5cUIBhBIYyjRuC@vger.kernel.org, AJvYcCWws9N2TGyvc3CYZMiWIYa48ATLG/BShlNNPP70KZShytW4m7QAlFoVieshaXwjgoVPYwHwKoV6/ULYfO0m@vger.kernel.org
X-Gm-Message-State: AOJu0YxnbAxLFGIqCkPvKKj5zPj20BCRg836OKQMKJvAqWiSCTcx68Zc
	jBYSJgYtc+KMCtY3EVx6zDBJgk6GRM74kmIfADkrqbGt+5VyRix8
X-Gm-Gg: ASbGncv1L0Od6s3eywJQocD90AuM/pv+IFM723G9N0gfOclntfSYIz8MxbS9d8xsPjh
	Nr7NafbwC7Bk7hBsoH8SJ1ubHIPcaM+NUtbdMiW2Br8bxgvJlcWib2gVZuRSVboiXfrEcZVYt9q
	4FkfiKUvMe2dUVn7U/wHMdUysfGo6tL6PIHEnh6ZUrwkZiCYYvNOMwy1RxmgXN/DK83xMkLPNIg
	dg5yLMD0VQBqW1f2j+FeemT/WSn2KLt1i05Tp9OigsBTw2SZjfw9fgijBGemWB6cdO/AYrj+zrr
	TKM7b8DjotE+DRTgd59Z2iIQupgkApRYE9U0RiLGf3G0nd31sDvaot1pvBWSryjbD9Kj0RZG5Wy
	rCqwa97c=
X-Google-Smtp-Source: AGHT+IE2m9aQ7hxMdL1hcSCVBaAL9i81WJkbAFdNTU9OkqMxfa+QpMQqlgxt2/QmZqWboPf3GEwH7Q==
X-Received: by 2002:a5d:64cc:0:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39c1211de8dmr10794398f8f.51.1743522353458;
        Tue, 01 Apr 2025 08:45:53 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Tue,  1 Apr 2025 11:44:01 -0400
Message-Id: <20250401154404.45932-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
configurations meant to restrict access to certain peripherals.
Some of the configurations include:

	1) Marking masters as trusted for R/W. Based on this
	(and the configuration of the accessed peripheral), the bridge
	may choose to abort the R/W transactions issued by certain
	masters.

	2) Allowing/disallowing write accesses to peripherals.

Add driver for this IP. Since there's currently no framework for
access controllers (and since there's currently no need for having
flexibility w.r.t the configurations) all this driver does is it
applies a relaxed, "default" configuration, in which all masters
are trusted for R/W.

Note that some instances of this IP (e.g: AIPSTZ5 on i.MX8MP) may be tied
to a power domain and may lose their configuration when the domain is
powered off. This is why the configuration has to be restored when the
domain is powered on.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/bus/Kconfig      |  6 +++
 drivers/bus/Makefile     |  1 +
 drivers/bus/imx-aipstz.c | 92 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 drivers/bus/imx-aipstz.c

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index ff669a8ccad9..fe7600283e70 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -87,6 +87,12 @@ config HISILICON_LPC
 	  Driver to enable I/O access to devices attached to the Low Pin
 	  Count bus on the HiSilicon Hip06/7 SoC.
 
+config IMX_AIPSTZ
+	tristate "Support for IMX Secure AHB to IP Slave bus (AIPSTZ) bridge"
+	depends on ARCH_MXC
+	help
+	  Enable support for IMX AIPSTZ bridge.
+
 config IMX_WEIM
 	bool "Freescale EIM DRIVER"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index cddd4984d6af..8e693fe8a03a 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
 
 obj-$(CONFIG_BT1_APB)		+= bt1-apb.o
 obj-$(CONFIG_BT1_AXI)		+= bt1-axi.o
+obj-$(CONFIG_IMX_AIPSTZ)	+= imx-aipstz.o
 obj-$(CONFIG_IMX_WEIM)		+= imx-weim.o
 obj-$(CONFIG_INTEL_IXP4XX_EB)	+= intel-ixp4xx-eb.o
 obj-$(CONFIG_MIPS_CDMM)		+= mips_cdmm.o
diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
new file mode 100644
index 000000000000..44db40dae71b
--- /dev/null
+++ b/drivers/bus/imx-aipstz.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#define IMX_AIPSTZ_MPR0 0x0
+
+struct imx_aipstz_config {
+	u32 mpr0;
+};
+
+static void imx_aipstz_apply_default(void __iomem *base,
+				     const struct imx_aipstz_config *default_cfg)
+{
+	writel(default_cfg->mpr0, base + IMX_AIPSTZ_MPR0);
+}
+
+static int imx_aipstz_probe(struct platform_device *pdev)
+{
+	const struct imx_aipstz_config *default_cfg;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(base))
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to get/ioremap AC memory\n");
+
+	default_cfg = of_device_get_match_data(&pdev->dev);
+
+	imx_aipstz_apply_default(base, default_cfg);
+
+	dev_set_drvdata(&pdev->dev, base);
+
+	pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static int imx_aipstz_runtime_resume(struct device *dev)
+{
+	const struct imx_aipstz_config *default_cfg;
+	void __iomem *base;
+
+	base = dev_get_drvdata(dev);
+	default_cfg = of_device_get_match_data(dev);
+
+	/* restore potentially lost configuration during domain power-off */
+	imx_aipstz_apply_default(base, default_cfg);
+
+	return 0;
+}
+
+static const struct dev_pm_ops imx_aipstz_pm_ops = {
+	RUNTIME_PM_OPS(NULL, imx_aipstz_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+/*
+ * following configuration is equivalent to:
+ *	masters 0-7 => trusted for R/W + use AHB's HPROT[1] to det. privilege
+ */
+static const struct imx_aipstz_config imx8mp_aipstz_default_cfg = {
+	.mpr0 = 0x77777777,
+};
+
+static const struct of_device_id imx_aipstz_of_ids[] = {
+	{ .compatible = "fsl,imx8mp-aipstz", .data = &imx8mp_aipstz_default_cfg },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, imx_aipstz_of_ids);
+
+static struct platform_driver imx_aipstz_of_driver = {
+	.probe = imx_aipstz_probe,
+	.driver = {
+		.name = "imx-aipstz",
+		.of_match_table = imx_aipstz_of_ids,
+		.pm = pm_ptr(&imx_aipstz_pm_ops),
+	},
+};
+module_platform_driver(imx_aipstz_of_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("IMX secure AHB to IP Slave bus (AIPSTZ) bridge driver");
+MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
-- 
2.34.1

