Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E4923D281;
	Tue, 10 Jun 2025 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571350; cv=none; b=uado+byaX4keELS5dcbBzptASfhYKSCxnAHNkRYIivbr7uojywfyz5qrlS5N+4FhwvspFU/9Czk7F2OLsUHyJ6lbN92xLtQi3cpr0cgicetpq1zB1dMBrLQiYhBQp7EqnaUBQmJsC9aBtDoKyo7A1zYq3h+avfbdEmsxGAVhcyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571350; c=relaxed/simple;
	bh=LUuMnTsPxCWGCQ1S7pwLEcQQ6RNEye6ZXCb6LSazH1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nQn0hsO4iQFlnrK6mM8p2FMxHefm/IdTNb6pYPp03cc3hfqm+U7PFDc87pBKQRYvRb6NtoYl+FxtfzbNMRIEEYp2pg9p5widXwVbC4S17/MOl5bHL1MwFrgrtgwkpZJIy/PJOmbTg2kL9dI2dYM+EE/sjGKnVQP7WYeSyCwgse8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mv11yS+a; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv11yS+a"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb79177so27811875e9.0;
        Tue, 10 Jun 2025 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571347; x=1750176147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67VEu7Em6E5HQaJhzv+j8FH2Rkd50dtS2qYsocCeLKg=;
        b=Mv11yS+aDP7LCytdiF9uMiwsavairugO1obX7re7pz6XREUhdZ0/Ugsv0RiVnyr1wq
         5soLRPHqPY4pe/pOMBvdc1Fkc/pOK46qCFQ7aMUlJIXa2tQegbHVDri68/oSW7aJ/G8G
         IzyQvfjZMxWfGwlVtbDMEHdMKGqQ+gxDOO+uKt8U0/0rINrLMIVIEFjwQE1F8tpt0ttw
         N/ft9zQaPLHYQx7NWzV0J10PhJPNDht+oYQvj4T4NaWgLCcxvmBKsOSmgZxkXh7rAz5X
         3qlYfXw5Fr/2fe57phOIe8jLbHsinduKEnxva4sPR9Gmt7QXnuQBNB7uOK/NeC9xNn9A
         PYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571347; x=1750176147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67VEu7Em6E5HQaJhzv+j8FH2Rkd50dtS2qYsocCeLKg=;
        b=EkFkp/HUkEseiVz5TVORx6I2LDBgVsaacIa4Z71lhZroo2PzVqbqU6r09WAWQzrsQX
         cIm3CALN0eCNm9w4oiiuf2jOM04ACNfuyvyhevl10L1K4xiAvDJZ7OpPONQnus6SjyAi
         qXjT40qGmPV4DNPy9y11cqj2q0bGEHbwpR0cGQrXrOVqcQAeeh00CSsDagxAiKzvHJ8s
         0xVjo3tV2oJnchgFWI1QLW8iBc0eHO5GVPn/FuVi0K94UHolgLYEuDj9yqq0PkzvAO80
         Ty6bwErs+xNVyYSSNf1dtF7v+K/KaH2pzGkZ5OWC+CiZ+Y08NeWte9aiZYdH4bDHdxqN
         XUAg==
X-Forwarded-Encrypted: i=1; AJvYcCUHWUx4DXtEnNPw0xcOtf1DmCYWsnKDjsJRpoHFJQJujpu25lxgHdwhZVogYkmHAxMB6iN5cNzzefLT@vger.kernel.org, AJvYcCW3iFhRnH+Ur001pe/sSW9EuizVt8ksvEA1UHagJqTDkX+Qkt6KQVakCzd489FhoRHEI90gdyZwssjOZW/4@vger.kernel.org
X-Gm-Message-State: AOJu0YxyjP6lBwC/HOC5HXVajoHbXXR7sMj69cL0KvifCIf0CJgjgz+K
	Bsm6yH3kffxAjXtOqgkg9ceiY8AqkDiw97tvC19LQxvKgBkuNhlo/a3V
X-Gm-Gg: ASbGncudOVpAg4YJQZ31Z/WMXe1b4MLp0zgckKnElfIguYO2+qHJygxoUaW81niOE9F
	rAgVK9j3QyrWSyv8PlFGX7e28NQBfZmvfuNeSrw4ifSZUGg8jui3WH+GwK/9IfIzWH9/ZJC0NMc
	3M3pj4Ia8qxY9LKTM4hIS5dc5k9xvYPESFf7EK5WZPIqDEliLVDtsYHfh8Td5jIkZZ/QUX3oTpQ
	tO+bhBgEV9xnW27vSfa7+mUWiVnvoIBThtM8wVAmi+mo4Os/cShXLT8+s68yfBtACPpUIKU1G2N
	m3+Jlu607Em6eOEmcQtctYrUnXxo8OIyvq5teir7qhfACoLdoP4L2fLFTZp7TuwM5LkbHaqpsot
	Z+Hq8KSlaw5SwsEkCkEdkkZ4=
X-Google-Smtp-Source: AGHT+IGHhW/p8zADhnFLJnKLHKJ98yUEXlzsMVwwzjxsFGqrs0N2We4X8hpm2okE6IPM60AODO77rw==
X-Received: by 2002:a05:6000:26d3:b0:3a5:2cb5:6429 with SMTP id ffacd0b85a97d-3a5319b5c98mr14820076f8f.43.1749571346552;
        Tue, 10 Jun 2025 09:02:26 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:26 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Tue, 10 Jun 2025 12:01:49 -0400
Message-Id: <20250610160152.1113930-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
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
 drivers/bus/imx-aipstz.c | 96 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
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
index 000000000000..6610251f41c7
--- /dev/null
+++ b/drivers/bus/imx-aipstz.c
@@ -0,0 +1,96 @@
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
+struct imx_aipstz_data {
+	void __iomem *base;
+	const struct imx_aipstz_config *default_cfg;
+};
+
+static void imx_aipstz_apply_default(struct imx_aipstz_data *data)
+{
+	writel(data->default_cfg->mpr0, data->base + IMX_AIPSTZ_MPR0);
+}
+
+static int imx_aipstz_probe(struct platform_device *pdev)
+{
+	struct imx_aipstz_data *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to allocate data memory\n");
+
+	data->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(data->base))
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to get/ioremap AC memory\n");
+
+	data->default_cfg = of_device_get_match_data(&pdev->dev);
+
+	imx_aipstz_apply_default(data);
+
+	dev_set_drvdata(&pdev->dev, data);
+
+	pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static int imx_aipstz_runtime_resume(struct device *dev)
+{
+	struct imx_aipstz_data *data = dev_get_drvdata(dev);
+
+	/* restore potentially lost configuration during domain power-off */
+	imx_aipstz_apply_default(data);
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

