Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65023236A;
	Tue,  8 Apr 2025 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126981; cv=none; b=huieB1paiy06wKJr+0/romEQ0E6E7ZRCFqfIPO/mDAyEpcYna3LyVBzC3fMEdq94gstvifL3jdcwMFxKUIsG0jrrTVDvd1wXRCWMSToye2EQO89jKNCQTgMF4pB9drJ/PaR99/mZeQr4xSDsk6hx5xI2OZlKa8To/+eIbJejtcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126981; c=relaxed/simple;
	bh=F8NZNfXY+db76aNNrBJbSG7T5RVx6dAyulLZqrqB6lM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jfCbzFw4r0qRC0ZmprkuXVChECRVt87a7YjTSuUqAulOatcAiaVV3zxNylulbZRvPAiykPPUWJ9OVNARlxZsBjDKc8+wKQEJKsCpPS+PdFHWaUtl5JMafPuPCwLFptJonPtGzcUW+fmERQU5hzWroR1Ee6b4X/84jvNZASDZRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWjjsS14; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWjjsS14"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3441083f8f.1;
        Tue, 08 Apr 2025 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126977; x=1744731777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=CWjjsS14RrLYbhF7maLh1YSaiLoO/Zp3etV8G6aOLmgipXbPAuG4aAzO29yERjUBnX
         5gR+zaS9RYVXSsp4dd17vE31Zms6Cqfzn/VcjwGfIz+RYa5hw7XUqOwgW5lb5XBjhV3e
         PFatJ7B8sOar7t2LfNBFvWCs4L3gFCrElJczb/g54uSyo0bscEX0EO5eQ0+wUg6LCU12
         EtU9ZppxNP6EzqxMw8R8YigXDQbmVLCdQ10IGgyM9Y6lPAzSaQOqRDPQNdRjX0rD+AVO
         OsZMOj0Vaw0nzz53HO01+JHgBzjrclCGcCiRKlaLb0WsIozlI8RNuygWJ+0D76dAsRnW
         YSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126977; x=1744731777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=i5RGb1BxNVz+7gJanX3Nfrzd5a6MoMm2MXagM/4D7+fZTrARPcLguhTJm9h0VaugcD
         I7/UrZOzkmDc9pGxTv19hP56O9EQBt+UlnkxLHteDtgyXRgPJnYk1lrjMG5N1DU/iabl
         3Go8pj9jG3qnjfUbteYNp+vlBo0LwICJV4IxxJH0qY2y0HaESW/glP5iTKCunZ9xWSZ0
         4DByMAEky0Edir/ROJEfQRb1dGsrSB8HMaMvbOKnC3SxLIKsH2p1IGGHylooyAOPikM8
         qsLub2h2tzmj0seCoi0iOt8FjndZYduLv/S3jO+19KpHElRFQ/jk1tlKM/jT9p/9VYO4
         d9+w==
X-Forwarded-Encrypted: i=1; AJvYcCUeCOWGax5NpeU5KJvdopONcMfj5FFaEHCOgGn8M+YVVfbfyRwt064x6/xojAj86hZKjTP86DTnhny2@vger.kernel.org, AJvYcCWet9BJPR/PYj4zNA7uCWaltKnK7f1Q2es5tk73cddWOYr0Yr4744bpL3rIATmM2LSLF/ewx9H90viBcIRH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjj4La54uqLOn+WeYC6WN1ZI4fzxHMk+yYdF6A/24B66R8h4xL
	19+fjT6yrjx6GLppUUXdR4eR67S5hfWGnOCfUGHk/H3cQ6zHZ4WpZ8IxnByK
X-Gm-Gg: ASbGncuWiYR3zc6Q4ZgfXbyBVcdQfMLMtghibG6BQrz/hN5UVscfyiG/+bvaqNctb9k
	HEelnoWoe6QJ9Ov8gTq3nM0dQ0VzlZuQKB7/kbRqP5yZgOxTydMWzeTBy+huEPElqYTue8cA8l2
	Cd4eDH/VjCG2m8TlXEGeD6GwXf9RsdGidEZKYkC5Di5YiAskKTbWacObolBt9+PQIbDkAaJIqGQ
	SVX+U3XcupjIqK2jVdc1dm2VR7vlDvqoocFYfXedcwLRIqDXlUeAD7YCwTfDHNS6ZJNZVNSe7VI
	v3VipmaKx4YvC1a1axS7jb5LzDuH03m+Uqq9aRwMGh4QmpRtVdpqnOfL7ZAsz5jjAuPDkkzw+WE
	SzgUipXkkUVYI95NVTA==
X-Google-Smtp-Source: AGHT+IG0AMxcw+cd08RKS5cdUE5DuDrHXtBsG7uCqS+Lpu1Nku8qrLyC5cK51TsZmHFhPyplpfJWLw==
X-Received: by 2002:a05:6000:290a:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-39cba93cf03mr14625191f8f.52.1744126977343;
        Tue, 08 Apr 2025 08:42:57 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:56 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Tue,  8 Apr 2025 11:42:33 -0400
Message-Id: <20250408154236.49421-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
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

