Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C2214229;
	Wed,  5 Feb 2025 20:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787474; cv=none; b=ql5tqeAAvbYPAztJCF8UWmCynBYNMbdY0m6EENMSdD4Xnam+1q5sp8So9HWx+MOScIHNrFdkB1GP/0HJP/xmgGBQWHvQ7dGp0R00HUggN5JFjRpydOrWhyWr8CfZzI2lCMmm/fxbgxsinWB4tbl5ZvJ2miUM9kU083Se/UHXfys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787474; c=relaxed/simple;
	bh=oDW0q6UhwKBSg9roqxYIPpIEyscfxmVc2xO0PcvuO5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bOJvOsSH2O+crww2k3clIqxM3/vjAM7tDQIlkzZfr2VJNg8CvlwT2X3ouhAKDWVyqi7BHkL7pFq+MRG2Oy3214zLAtckfnM4dSY0BDD4DI51caItlTZ9ywThOppDDbihEs+6eoADtqfVqcknzYJR8i+/uUl7BJP+44WtheCTfrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOklcMcD; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOklcMcD"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc7eba78e6so451557a12.3;
        Wed, 05 Feb 2025 12:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787469; x=1739392269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR/C4glGJlL2MRTyAyhd442CyQPmsQZMdH1inPybOWg=;
        b=NOklcMcDr9EnNQ3cRQcGJ0pdVktM6QWOv2iGhwFFypMzRJ7K+TRQPqZBxTbY033ARZ
         Rm7M66wAMlXnHnGqlpkUxku8wxNdoJGk3gG03DEKbBBoS+yH4bNj1Sy4DtM62sbXVTKu
         y0YtH8FXgIaxBVsyswwWwf1+kqFXOcZN7GbLLUlTiL40JqcPQ2vxGgU5Bb3iKygPr/wN
         QtHRQTe7vDsHWJm2Q83i4uhRTjSZ2Xo9lXdvJoaNcqD+xw0RK1kDZJh4oNiid2bRBjZs
         Njk2iqHCXP87KWFtL7QesJQY9e9z960XfKNZI4CMV9uZoq++AXT9talfCCYfTzNum56e
         K9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787469; x=1739392269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR/C4glGJlL2MRTyAyhd442CyQPmsQZMdH1inPybOWg=;
        b=csUiFE6AM96YsuQaeayu+ZX3PV2iHU4WyerdgNZzHkU7/OGstBv++zI+LrnQ4hzoPU
         eu7Vh5FKauVL/41fd3XdrzBCwyZqFd4s5lhJhuIQ5gMbhPSqqsin0BZvO0WC6rrdvv7p
         xHlfnu4gg4OLWgeb2hqjGFXcwp6ztE5xghuAshHOC5KS0xPtRg4dKTAIKSnPC0+fxm5B
         kgrficFmxAxZmmF+DbUJX+65SS/TtG9funVNtbAjSDK2Q/hzmne8BQoj3uoOM+K3ab7Z
         L6Ydu0i9rDsMOZ74mmU+2F6IZam3KUmcgAvchGnQpv3jShOcCZgv3fg7Lab5Z0wgx7gW
         v84Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDO8GwACNd697Z8fcA6/fSSywJAraR0x501E4i77FKeMZdbC1cAPx1R9XU4K0Q0m+AEt2SgRG8Khg82w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmEu7jBQ+XXKagsGsFLdl+MTWLxhVv1fSRg9EfiT/8o5P22Amh
	3SZc/4KHTIVE9HOQBcjfZvMfyCZdBMhIngbT6j9r4jBNn0OFUh6l
X-Gm-Gg: ASbGncuSCusA5C6as9eXuNTCwrt7Sk09X6J4MabLYQw/DczplT45ygX7Ko5HNDLv3at
	IA6XKdmuj9Wq0P2mC+OtfKswv+8IL3k3NnT/O0PijIZgR952m28o1c4mLmwfyrHLh+xOel4fiY8
	Vn5/y58WvA6coSm5zW6rDMnVOGG3+kOLAf0VUP57zI6qTnZZHUgrJ6wh6tw1M7jgMdGBL4WrbKr
	aiGqx4niQxv8Z4hM+uYF7Sjf9qv1Jk0sY2oVOpbT+t1KV1HoqIjA1Kt52LKAd0d/nG+xp6rQWYX
	IxOgVnJE8vBqcLdaHz6t1DBgqsEco6CSczpXPFRqI3zEH0dTGz1PtA==
X-Google-Smtp-Source: AGHT+IHWYP9PTyBXkYy22Yx8l83mq71p5dWKQbYl32FTsiEx+7oJG0RARp5qBFirZD2DGQmiNMg1kw==
X-Received: by 2002:a05:6402:27c9:b0:5dc:752f:fa9f with SMTP id 4fb4d7f45d1cf-5dcdb77f7d6mr5206731a12.28.1738787468444;
        Wed, 05 Feb 2025 12:31:08 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:31:07 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 7/8] ASoC: SOF: imx: merge imx8 and imx8ulp drivers
Date: Wed,  5 Feb 2025 15:30:21 -0500
Message-Id: <20250205203022.2754-8-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Now that the common interface for imx chip has been introduced,
there's no longer a need to have a separate platform driver for
imx8ulp. As such, merge the driver with the imx8 driver. Furthermore,
delete the old driver as it's no longer useful.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/imx/Kconfig   |   9 -
 sound/soc/sof/imx/Makefile  |   2 -
 sound/soc/sof/imx/imx8.c    | 113 ++++++++
 sound/soc/sof/imx/imx8ulp.c | 520 ------------------------------------
 4 files changed, 113 insertions(+), 531 deletions(-)
 delete mode 100644 sound/soc/sof/imx/imx8ulp.c

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 92fdf80d6e51..2edf9de2c886 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -32,13 +32,4 @@ config SND_SOC_SOF_IMX8
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
-config SND_SOC_SOF_IMX8ULP
-	tristate "SOF support for i.MX8ULP"
-	depends on IMX_DSP
-	select SND_SOC_SOF_IMX_COMMON
-	help
-	  This adds support for Sound Open Firmware for NXP i.MX8ULP platforms.
-	  Say Y if you have such a device.
-	  If unsure select "N".
-
 endif ## SND_SOC_SOF_IMX_TOPLEVEL
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
index 852140bb8104..36a3a67c6efb 100644
--- a/sound/soc/sof/imx/Makefile
+++ b/sound/soc/sof/imx/Makefile
@@ -1,9 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 snd-sof-imx8-y := imx8.o
-snd-sof-imx8ulp-y := imx8ulp.o
 
 snd-sof-imx-common-y := imx-common.o
 
 obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
-obj-$(CONFIG_SND_SOC_SOF_IMX8ULP) += snd-sof-imx8ulp.o
 obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 859355eababa..d4bf92982eae 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/firmware/imx/rsrc.h>
 
+#include <linux/arm-smccc.h>
 #include <linux/firmware/imx/svc/misc.h>
 #include <linux/mfd/syscon.h>
 
@@ -29,6 +30,16 @@
 
 #define AudioDSP_REG2_RUNSTALL  BIT(5)
 
+/* imx8ulp macros */
+#define FSL_SIP_HIFI_XRDC       0xc200000e
+#define SYSCTRL0                0x8
+#define EXECUTE_BIT             BIT(13)
+#define RESET_BIT               BIT(16)
+#define HIFI4_CLK_BIT           BIT(17)
+#define PB_CLK_BIT              BIT(18)
+#define PLAT_CLK_BIT            BIT(19)
+#define DEBUG_LOGIC_BIT         BIT(25)
+
 struct imx8m_chip_data {
 	void __iomem *dap;
 	struct regmap *regmap;
@@ -49,6 +60,11 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
 	IMX_SOF_DAI_DRV_ENTRY("micfil", 0, 0, 1, 8),
 };
 
+static struct snd_soc_dai_driver imx8ulp_dai[] = {
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai5", 1, 32),
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai6", 1, 32),
+};
+
 static struct snd_sof_dsp_ops sof_imx8_ops;
 
 static int imx8_ops_init(struct snd_sof_dev *sdev)
@@ -208,6 +224,68 @@ static int imx8m_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int imx8ulp_probe(struct snd_sof_dev *sdev)
+{
+	struct imx_common_data *common;
+	struct regmap *regmap;
+
+	common = sdev->pdata->hw_pdata;
+
+	regmap = syscon_regmap_lookup_by_phandle(sdev->dev->of_node, "fsl,dsp-ctrl");
+	if (IS_ERR(regmap))
+		return dev_err_probe(sdev->dev, PTR_ERR(regmap),
+				     "failed to fetch dsp ctrl regmap\n");
+
+	common->chip_pdata = regmap;
+
+	return 0;
+}
+
+static int imx8ulp_run(struct snd_sof_dev *sdev)
+{
+	struct regmap *regmap = get_chip_pdata(sdev);
+
+	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
+	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, 0);
+
+	/* Reset HiFi4 DSP Debug logic: 1 debug reset, 0  out of reset*/
+	regmap_update_bits(regmap, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
+
+	/* Stall HIFI4 DSP Execution: 1 stall, 0 run */
+	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, 0);
+
+	return 0;
+}
+
+static int imx8ulp_reset(struct snd_sof_dev *sdev)
+{
+	struct arm_smccc_res smc_res;
+	struct regmap *regmap;
+
+	regmap = get_chip_pdata(sdev);
+
+	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
+	regmap_update_bits(regmap, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
+
+	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
+	regmap_update_bits(regmap, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
+
+	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
+	regmap_update_bits(regmap, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
+
+	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, RESET_BIT);
+
+	usleep_range(1, 2);
+
+	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
+	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
+	usleep_range(1, 2);
+
+	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_res);
+
+	return smc_res.a0;
+}
+
 static const struct imx_chip_ops imx8_chip_ops = {
 	.probe = imx8_probe,
 	.core_kick = imx8_run,
@@ -224,6 +302,12 @@ static const struct imx_chip_ops imx8m_chip_ops = {
 	.core_reset = imx8m_reset,
 };
 
+static const struct imx_chip_ops imx8ulp_chip_ops = {
+	.probe = imx8ulp_probe,
+	.core_kick = imx8ulp_run,
+	.core_reset = imx8ulp_reset,
+};
+
 static struct imx_memory_info imx8_memory_regions[] = {
 	{ .name = "iram", .reserved = false },
 	{ .name = "sram", .reserved = true },
@@ -236,6 +320,12 @@ static struct imx_memory_info imx8m_memory_regions[] = {
 	{ }
 };
 
+static struct imx_memory_info imx8ulp_memory_regions[] = {
+	{ .name = "iram", .reserved = false },
+	{ .name = "sram", .reserved = true },
+	{ }
+};
+
 static const struct imx_chip_info imx8_chip_info = {
 	.ipc_info = {
 		.has_panic_code = true,
@@ -272,6 +362,19 @@ static const struct imx_chip_info imx8m_chip_info = {
 	.ops = &imx8m_chip_ops,
 };
 
+static const struct imx_chip_info imx8ulp_chip_info = {
+	.ipc_info = {
+		.has_panic_code = true,
+		.boot_mbox_offset = 0x800000,
+		.window_offset = 0x800000,
+	},
+	.has_dma_reserved = true,
+	.memory = imx8ulp_memory_regions,
+	.drv = imx8ulp_dai,
+	.num_drv = ARRAY_SIZE(imx8ulp_dai),
+	.ops = &imx8ulp_chip_ops,
+};
+
 static struct snd_sof_of_mach sof_imx8_machs[] = {
 	{
 		.compatible = "fsl,imx8qxp-mek",
@@ -313,12 +416,18 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
 		.sof_tplg_filename = "sof-imx8mp-wm8962.tplg",
 		.drv_name = "asoc-audio-graph-card2",
 	},
+	{
+		.compatible = "fsl,imx8ulp-evk",
+		.sof_tplg_filename = "sof-imx8ulp-btsco.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
 	{}
 };
 
 IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx8_ops_init);
 IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx8_ops_init);
 IMX_SOF_DEV_DESC(imx8m, sof_imx8_machs, &imx8m_chip_info, &sof_imx8_ops, imx8_ops_init);
+IMX_SOF_DEV_DESC(imx8ulp, sof_imx8_machs, &imx8ulp_chip_info, &sof_imx8_ops, imx8_ops_init);
 
 static const struct of_device_id sof_of_imx8_ids[] = {
 	{
@@ -333,6 +442,10 @@ static const struct of_device_id sof_of_imx8_ids[] = {
 		.compatible = "fsl,imx8mp-dsp",
 		.data = &IMX_SOF_DEV_DESC_NAME(imx8m),
 	},
+	{
+		.compatible = "fsl,imx8ulp-dsp",
+		.data = &IMX_SOF_DEV_DESC_NAME(imx8ulp),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sof_of_imx8_ids);
diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
deleted file mode 100644
index 0704da27e69d..000000000000
--- a/sound/soc/sof/imx/imx8ulp.c
+++ /dev/null
@@ -1,520 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-//
-// Copyright 2021-2022 NXP
-//
-// Author: Peng Zhang <peng.zhang_8@nxp.com>
-//
-// Hardware interface for audio DSP on i.MX8ULP
-
-#include <linux/arm-smccc.h>
-#include <linux/clk.h>
-#include <linux/firmware.h>
-#include <linux/firmware/imx/dsp.h>
-#include <linux/firmware/imx/ipc.h>
-#include <linux/firmware/imx/svc/misc.h>
-#include <linux/mfd/syscon.h>
-#include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#include <linux/of_reserved_mem.h>
-
-#include <sound/sof.h>
-#include <sound/sof/xtensa.h>
-
-#include "../ops.h"
-#include "../sof-of-dev.h"
-#include "imx-common.h"
-
-#define FSL_SIP_HIFI_XRDC	0xc200000e
-
-/* SIM Domain register */
-#define SYSCTRL0		0x8
-#define EXECUTE_BIT		BIT(13)
-#define RESET_BIT		BIT(16)
-#define HIFI4_CLK_BIT		BIT(17)
-#define PB_CLK_BIT		BIT(18)
-#define PLAT_CLK_BIT		BIT(19)
-#define DEBUG_LOGIC_BIT		BIT(25)
-
-#define MBOX_OFFSET		0x800000
-#define MBOX_SIZE		0x1000
-
-struct imx8ulp_priv {
-	struct device *dev;
-	struct snd_sof_dev *sdev;
-
-	/* DSP IPC handler */
-	struct imx_dsp_ipc *dsp_ipc;
-	struct platform_device *ipc_dev;
-
-	struct regmap *regmap;
-	struct clk_bulk_data *clks;
-	int clk_num;
-};
-
-static void imx8ulp_sim_lpav_start(struct imx8ulp_priv *priv)
-{
-	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
-	regmap_update_bits(priv->regmap, SYSCTRL0, RESET_BIT, 0);
-
-	/* Reset HiFi4 DSP Debug logic: 1 debug reset, 0  out of reset*/
-	regmap_update_bits(priv->regmap, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
-
-	/* Stall HIFI4 DSP Execution: 1 stall, 0 run */
-	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, 0);
-}
-
-static int imx8ulp_get_mailbox_offset(struct snd_sof_dev *sdev)
-{
-	return MBOX_OFFSET;
-}
-
-static int imx8ulp_get_window_offset(struct snd_sof_dev *sdev, u32 id)
-{
-	return MBOX_OFFSET;
-}
-
-static void imx8ulp_dsp_handle_reply(struct imx_dsp_ipc *ipc)
-{
-	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
-	unsigned long flags;
-
-	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
-
-	snd_sof_ipc_process_reply(priv->sdev, 0);
-
-	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
-}
-
-static void imx8ulp_dsp_handle_request(struct imx_dsp_ipc *ipc)
-{
-	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
-	u32 p; /* panic code */
-
-	/* Read the message from the debug box. */
-	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4, &p, sizeof(p));
-
-	/* Check to see if the message is a panic code (0x0dead***) */
-	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
-		snd_sof_dsp_panic(priv->sdev, p, true);
-	else
-		snd_sof_ipc_msgs_rx(priv->sdev);
-}
-
-static struct imx_dsp_ops dsp_ops = {
-	.handle_reply		= imx8ulp_dsp_handle_reply,
-	.handle_request		= imx8ulp_dsp_handle_request,
-};
-
-static int imx8ulp_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
-{
-	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
-
-	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
-			  msg->msg_size);
-	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
-
-	return 0;
-}
-
-static int imx8ulp_run(struct snd_sof_dev *sdev)
-{
-	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
-
-	imx8ulp_sim_lpav_start(priv);
-
-	return 0;
-}
-
-static int imx8ulp_reset(struct snd_sof_dev *sdev)
-{
-	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
-	struct arm_smccc_res smc_resource;
-
-	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
-	regmap_update_bits(priv->regmap, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
-
-	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
-	regmap_update_bits(priv->regmap, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
-
-	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
-	regmap_update_bits(priv->regmap, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
-
-	regmap_update_bits(priv->regmap, SYSCTRL0, RESET_BIT, RESET_BIT);
-	usleep_range(1, 2);
-
-	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
-	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
-	usleep_range(1, 2);
-
-	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_resource);
-
-	return 0;
-}
-
-static int imx8ulp_probe(struct snd_sof_dev *sdev)
-{
-	struct platform_device *pdev = to_platform_device(sdev->dev);
-	struct device_node *np = pdev->dev.of_node;
-	struct device_node *res_node;
-	struct resource *mmio;
-	struct imx8ulp_priv *priv;
-	struct resource res;
-	u32 base, size;
-	int ret = 0;
-
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	sdev->num_cores = 1;
-	sdev->pdata->hw_pdata = priv;
-	priv->dev = sdev->dev;
-	priv->sdev = sdev;
-
-	/* System integration module(SIM) control dsp configuration */
-	priv->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,dsp-ctrl");
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
-
-	priv->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
-						      PLATFORM_DEVID_NONE,
-						      pdev, sizeof(*pdev));
-	if (IS_ERR(priv->ipc_dev))
-		return PTR_ERR(priv->ipc_dev);
-
-	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
-	if (!priv->dsp_ipc) {
-		/* DSP IPC driver not probed yet, try later */
-		ret = -EPROBE_DEFER;
-		dev_err(sdev->dev, "Failed to get drvdata\n");
-		goto exit_pdev_unregister;
-	}
-
-	imx_dsp_set_data(priv->dsp_ipc, priv);
-	priv->dsp_ipc->ops = &dsp_ops;
-
-	/* DSP base */
-	mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (mmio) {
-		base = mmio->start;
-		size = resource_size(mmio);
-	} else {
-		dev_err(sdev->dev, "error: failed to get DSP base at idx 0\n");
-		ret = -EINVAL;
-		goto exit_pdev_unregister;
-	}
-
-	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
-	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
-		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
-			base, size);
-		ret = -ENODEV;
-		goto exit_pdev_unregister;
-	}
-	sdev->mmio_bar = SOF_FW_BLK_TYPE_IRAM;
-
-	res_node = of_parse_phandle(np, "memory-reserved", 0);
-	if (!res_node) {
-		dev_err(&pdev->dev, "failed to get memory region node\n");
-		ret = -ENODEV;
-		goto exit_pdev_unregister;
-	}
-
-	ret = of_address_to_resource(res_node, 0, &res);
-	of_node_put(res_node);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get reserved region address\n");
-		goto exit_pdev_unregister;
-	}
-
-	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
-							  resource_size(&res));
-	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
-		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
-			base, size);
-		ret = -ENOMEM;
-		goto exit_pdev_unregister;
-	}
-	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
-
-	/* set default mailbox offset for FW ready message */
-	sdev->dsp_box.offset = MBOX_OFFSET;
-
-	ret = of_reserved_mem_device_init(sdev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to init reserved memory region %d\n", ret);
-		goto exit_pdev_unregister;
-	}
-
-	ret = devm_clk_bulk_get_all(sdev->dev, &priv->clks);
-	if (ret < 0) {
-		dev_err(sdev->dev, "failed to fetch clocks: %d\n", ret);
-		goto exit_pdev_unregister;
-	}
-	priv->clk_num = ret;
-
-	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
-	if (ret < 0) {
-		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
-		goto exit_pdev_unregister;
-	}
-
-	return 0;
-
-exit_pdev_unregister:
-	platform_device_unregister(priv->ipc_dev);
-
-	return ret;
-}
-
-static void imx8ulp_remove(struct snd_sof_dev *sdev)
-{
-	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
-
-	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
-	platform_device_unregister(priv->ipc_dev);
-}
-
-/* on i.MX8 there is 1 to 1 match between type and BAR idx */
-static int imx8ulp_get_bar_index(struct snd_sof_dev *sdev, u32 type)
-{
-	return type;
-}
-
-static int imx8ulp_suspend(struct snd_sof_dev *sdev)
-{
-	int i;
-	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
-
-	/*Stall DSP,  release in .run() */
-	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
-
-	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
-		imx_dsp_free_channel(priv->dsp_ipc, i);
-
-	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
-
-	return 0;
-}
-
-static int imx8ulp_resume(struct snd_sof_dev *sdev)
-{
-	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
-	int i, ret;
-
-	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
-	if (ret < 0) {
-		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
-		return ret;
-	}
-
-	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
-		imx_dsp_request_channel(priv->dsp_ipc, i);
-
-	return 0;
-}
-
-static int imx8ulp_dsp_runtime_resume(struct snd_sof_dev *sdev)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D0,
-		.substate = 0,
-	};
-
-	imx8ulp_resume(sdev);
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static int imx8ulp_dsp_runtime_suspend(struct snd_sof_dev *sdev)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D3,
-		.substate = 0,
-	};
-
-	imx8ulp_suspend(sdev);
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static int imx8ulp_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = target_state,
-		.substate = 0,
-	};
-
-	if (!pm_runtime_suspended(sdev->dev))
-		imx8ulp_suspend(sdev);
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static int imx8ulp_dsp_resume(struct snd_sof_dev *sdev)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D0,
-		.substate = 0,
-	};
-
-	imx8ulp_resume(sdev);
-
-	if (pm_runtime_suspended(sdev->dev)) {
-		pm_runtime_disable(sdev->dev);
-		pm_runtime_set_active(sdev->dev);
-		pm_runtime_mark_last_busy(sdev->dev);
-		pm_runtime_enable(sdev->dev);
-		pm_runtime_idle(sdev->dev);
-	}
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static struct snd_soc_dai_driver imx8ulp_dai[] = {
-	{
-		.name = "sai5",
-		.playback = {
-			.channels_min = 1,
-			.channels_max = 32,
-		},
-		.capture = {
-			.channels_min = 1,
-			.channels_max = 32,
-		},
-	},
-	{
-		.name = "sai6",
-		.playback = {
-			.channels_min = 1,
-			.channels_max = 32,
-		},
-		.capture = {
-			.channels_min = 1,
-			.channels_max = 32,
-		},
-	},
-};
-
-static int imx8ulp_dsp_set_power_state(struct snd_sof_dev *sdev,
-				       const struct sof_dsp_power_state *target_state)
-{
-	sdev->dsp_power_state = *target_state;
-
-	return 0;
-}
-
-/* i.MX8 ops */
-static const struct snd_sof_dsp_ops sof_imx8ulp_ops = {
-	/* probe and remove */
-	.probe		= imx8ulp_probe,
-	.remove		= imx8ulp_remove,
-	/* DSP core boot */
-	.run		= imx8ulp_run,
-	.reset		= imx8ulp_reset,
-
-	/* Block IO */
-	.block_read	= sof_block_read,
-	.block_write	= sof_block_write,
-
-	/* Module IO */
-	.read64		= sof_io_read64,
-
-	/* Mailbox IO */
-	.mailbox_read	= sof_mailbox_read,
-	.mailbox_write	= sof_mailbox_write,
-
-	/* ipc */
-	.send_msg	= imx8ulp_send_msg,
-	.get_mailbox_offset	= imx8ulp_get_mailbox_offset,
-	.get_window_offset	= imx8ulp_get_window_offset,
-
-	.ipc_msg_data	= sof_ipc_msg_data,
-	.set_stream_data_offset = sof_set_stream_data_offset,
-
-	/* stream callbacks */
-	.pcm_open	= sof_stream_pcm_open,
-	.pcm_close	= sof_stream_pcm_close,
-
-	/* module loading */
-	.get_bar_index	= imx8ulp_get_bar_index,
-	/* firmware loading */
-	.load_firmware	= snd_sof_load_firmware_memcpy,
-
-	/* Debug information */
-	.dbg_dump	= imx8_dump,
-
-	/* Firmware ops */
-	.dsp_arch_ops	= &sof_xtensa_arch_ops,
-
-	/* DAI drivers */
-	.drv		= imx8ulp_dai,
-	.num_drv	= ARRAY_SIZE(imx8ulp_dai),
-
-	/* ALSA HW info flags */
-	.hw_info	= SNDRV_PCM_INFO_MMAP |
-			SNDRV_PCM_INFO_MMAP_VALID |
-			SNDRV_PCM_INFO_INTERLEAVED |
-			SNDRV_PCM_INFO_PAUSE |
-			SNDRV_PCM_INFO_BATCH |
-			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
-
-	/* PM */
-	.runtime_suspend	= imx8ulp_dsp_runtime_suspend,
-	.runtime_resume		= imx8ulp_dsp_runtime_resume,
-
-	.suspend	= imx8ulp_dsp_suspend,
-	.resume		= imx8ulp_dsp_resume,
-
-	.set_power_state	= imx8ulp_dsp_set_power_state,
-};
-
-static struct snd_sof_of_mach sof_imx8ulp_machs[] = {
-	{
-		.compatible = "fsl,imx8ulp-evk",
-		.sof_tplg_filename = "sof-imx8ulp-btsco.tplg",
-		.drv_name = "asoc-audio-graph-card2",
-	},
-	{}
-};
-
-static struct sof_dev_desc sof_of_imx8ulp_desc = {
-	.of_machines = sof_imx8ulp_machs,
-	.ipc_supported_mask     = BIT(SOF_IPC_TYPE_3),
-	.ipc_default            = SOF_IPC_TYPE_3,
-	.default_fw_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof",
-	},
-	.default_tplg_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
-	},
-	.default_fw_filename = {
-		[SOF_IPC_TYPE_3] = "sof-imx8ulp.ri",
-	},
-	.nocodec_tplg_filename = "sof-imx8ulp-nocodec.tplg",
-	.ops = &sof_imx8ulp_ops,
-};
-
-static const struct of_device_id sof_of_imx8ulp_ids[] = {
-	{ .compatible = "fsl,imx8ulp-dsp", .data = &sof_of_imx8ulp_desc},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, sof_of_imx8ulp_ids);
-
-/* DT driver definition */
-static struct platform_driver snd_sof_of_imx8ulp_driver = {
-	.probe = sof_of_probe,
-	.remove = sof_of_remove,
-	.driver = {
-		.name = "sof-audio-of-imx8ulp",
-		.pm = &sof_of_pm,
-		.of_match_table = sof_of_imx8ulp_ids,
-	},
-};
-module_platform_driver(snd_sof_of_imx8ulp_driver);
-
-MODULE_LICENSE("Dual BSD/GPL");
-MODULE_DESCRIPTION("SOF support for IMX8ULP platforms");
-MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
-- 
2.34.1

