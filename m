Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F111922E1;
	Fri,  7 Feb 2025 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945414; cv=none; b=b6uw2dGO3JcGWuxo0/SV+/HYHfw12EdktNDVO9oFxo7ujMXd4I2Nmd63exW5vZ5CFXTEnAkMMFvV9nAVhEmRfGVjZmDkmg6PXw2roEEHw1heQBbBzYRzjh74k+1ebZYVVEyGX0QQ9laSF863Bq5UpbY2ICI7VnkCuZA/h2Mu70k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945414; c=relaxed/simple;
	bh=Q7iJy6V6z9m4sgZ+K3T70CCG0JGlDwhlfpt8O2yQHnk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iHTvzUCpUN0lj+KweJq73fx6wc8dFdn2mK4DihT50JtocOEz1n/46x5x38kvmtpWGeLCK8qoOG34523uMWCjsrZyJRW36MJF91Jqm/aPLGbPndHXhiPu72WcsQ0VOoX0FxxBRV6KpGC5B97eDVY7BTQjBUFK907E31tMXET9ZOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+UkvJNa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+UkvJNa"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso15903505e9.0;
        Fri, 07 Feb 2025 08:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738945408; x=1739550208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/3DnB9E/SUGO1LHs6c+MDiiMiWlvH8J4A/911TorOg=;
        b=U+UkvJNaQqjs6YQY/K17i5dOsSbGgOxA/amncoFNpjbcsOJRuM2qQaaU2A5VIvWvzU
         +WnqOAA1AGhTmtlDbYUX2y2Sj8OFhraQzoaVLRCK6csS0x2RbqOz1sgvrRmSLqZi5fvP
         +cciMc6ZGfrgZtSID4nd01lOhuQ4UZiPI5Tke/YembXW83/vXDpuT5NdXzvB30R7LGZV
         vkTROBgHOTGL3KDfa68Kb95Vwaaccu8ihLKfq7O+tTgShfFa3O7XoCjIPNnGgho9ClJ8
         MKZ17NPYQG82NlW4RbRRXHoK4A83zLaLhmn8ixVDP+96eKdcObYjJ69E6h/pPIf+pLfM
         5KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945408; x=1739550208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/3DnB9E/SUGO1LHs6c+MDiiMiWlvH8J4A/911TorOg=;
        b=NyrnPym1Ij+DAwTdAm6VFSUra+GJVISs8BMK6vgJChFJLgKDq1f72pFzy3FOGHGDOn
         Je3+ufLQLOtNExnWlvcSqzrOYQko9ZiZ4weclEIP9ou89OeSzt7XlgYksxsEQlJ20gwI
         2CBCxLmxD7mWri6q8urUOX9NOwozSbRyMNdMyiGiBeowY7vR5XDcWyKiFgxT6ZHt0UP8
         KFkvSWR+GEwmaRchRVDKMHnSNPC1cFaY4lfLfdvKBdLcjVCFiP2IyV36OH9c7d+rWg9n
         EwN3FTitVduP/XOE3yMoNpD5tgui/XtUQTom252i3Z5OEfDqPn3EdRfWXyD1YB1NJQ/W
         jleQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/AkAPT74j4kCQaLwKphdwgVEDbjOvGzdJbeLPhA6y6ZbW3Jsl1kllTIaDHj4vZqECxmLJsjqsp7EbAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXm/JOYFT2dMXRAiw0oMCnnicsc7n0292+1f6cEPnt5onZ3Zfu
	s5f32SwcLeIce1CWJTjaJuvqGf6qrp/XV1dzkNn31gIaq7i1Afbh
X-Gm-Gg: ASbGnctlasDvPlfVYO+pTfOUQwo2c2lYk9NGZnS1J4nFQSfJ+M5IvmV6dCsxYryx5/J
	RqXjOWvvGL+uWj6rrWHYRwh+NCuA0U6K+cOCmv4vzIS7vQPlsN8E0wSFqFSjh/So9fnkDQGzWuK
	EY8YicQHqc8Jz3kADJ+Q7Xcm2Ki5VjPsIHXpHJmIP6KDPrQ9suMK9Fo/G74rXdVAz3dIQtn7G1m
	d2VVJlluQ2p6BD9NlEJkrReNQbZDzCfj5/mT0lthjgWh2GhD1xyBqThTw8Mn1vcCe4zqZ/a9z/x
	6pR3TR5hpkMiCAl1NoHpqqGJDg3wlUQtr4clD2Pd8/BrlMfIcJCHmA==
X-Google-Smtp-Source: AGHT+IEytOQmm08ghcGD//DUieEQG+mcRaEM3l/lpBMtdDcv9mgwcSin1S4km/9xVlAV84Zt36mNtg==
X-Received: by 2002:a05:600c:4eca:b0:434:a852:ba6d with SMTP id 5b1f17b1804b1-4392498a1e3mr30888175e9.9.1738945407998;
        Fri, 07 Feb 2025 08:23:27 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm61260825e9.2.2025.02.07.08.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:23:27 -0800 (PST)
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
Subject: [PATCH v3 5/7] ASoC: SOF: imx: merge imx8 and imx8m drivers
Date: Fri,  7 Feb 2025 11:22:44 -0500
Message-Id: <20250207162246.3104-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
References: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
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
imx8m. As such, merge the driver with the imx8 driver. Furthermore,
delete the old driver as it's no longer useful.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/sof/imx/Kconfig  |   9 -
 sound/soc/sof/imx/Makefile |   2 -
 sound/soc/sof/imx/imx8.c   | 136 ++++++++-
 sound/soc/sof/imx/imx8m.c  | 567 -------------------------------------
 4 files changed, 134 insertions(+), 580 deletions(-)
 delete mode 100644 sound/soc/sof/imx/imx8m.c

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 4751b04d5e6f..92fdf80d6e51 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -32,15 +32,6 @@ config SND_SOC_SOF_IMX8
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
-config SND_SOC_SOF_IMX8M
-	tristate "SOF support for i.MX8M"
-	depends on IMX_DSP
-	select SND_SOC_SOF_IMX_COMMON
-	help
-	  This adds support for Sound Open Firmware for NXP i.MX8M platforms.
-	  Say Y if you have such a device.
-	  If unsure select "N".
-
 config SND_SOC_SOF_IMX8ULP
 	tristate "SOF support for i.MX8ULP"
 	depends on IMX_DSP
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
index be0bf0736dfa..852140bb8104 100644
--- a/sound/soc/sof/imx/Makefile
+++ b/sound/soc/sof/imx/Makefile
@@ -1,11 +1,9 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 snd-sof-imx8-y := imx8.o
-snd-sof-imx8m-y := imx8m.o
 snd-sof-imx8ulp-y := imx8ulp.o
 
 snd-sof-imx-common-y := imx-common.o
 
 obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
-obj-$(CONFIG_SND_SOC_SOF_IMX8M) += snd-sof-imx8m.o
 obj-$(CONFIG_SND_SOC_SOF_IMX8ULP) += snd-sof-imx8ulp.o
 obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 9a32ebe3eabc..7e08b239aac0 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -6,12 +6,34 @@
 //
 // Hardware interface for audio DSP on i.MX8
 
-#include <linux/firmware/imx/svc/misc.h>
 #include <dt-bindings/firmware/imx/rsrc.h>
+
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/mfd/syscon.h>
+
 #include "imx-common.h"
 
+/* imx8/imx8x macros */
 #define RESET_VECTOR_VADDR	0x596f8000
 
+/* imx8m macros */
+#define IMX8M_DAP_DEBUG 0x28800000
+#define IMX8M_DAP_DEBUG_SIZE (64 * 1024)
+#define IMX8M_DAP_PWRCTL (0x4000 + 0x3020)
+#define IMX8M_PWRCTL_CORERESET BIT(16)
+
+#define AudioDSP_REG0 0x100
+#define AudioDSP_REG1 0x104
+#define AudioDSP_REG2 0x108
+#define AudioDSP_REG3 0x10c
+
+#define AudioDSP_REG2_RUNSTALL  BIT(5)
+
+struct imx8m_chip_data {
+	void __iomem *dap;
+	struct regmap *regmap;
+};
+
 /*
  * DSP control.
  */
@@ -89,11 +111,83 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int imx8m_reset(struct snd_sof_dev *sdev)
+{
+	struct imx8m_chip_data *chip;
+	u32 pwrctl;
+
+	chip = get_chip_pdata(sdev);
+
+	/* put DSP into reset and stall */
+	pwrctl = readl(chip->dap + IMX8M_DAP_PWRCTL);
+	pwrctl |= IMX8M_PWRCTL_CORERESET;
+	writel(pwrctl, chip->dap + IMX8M_DAP_PWRCTL);
+
+	/* keep reset asserted for 10 cycles */
+	usleep_range(1, 2);
+
+	regmap_update_bits(chip->regmap, AudioDSP_REG2,
+			   AudioDSP_REG2_RUNSTALL, AudioDSP_REG2_RUNSTALL);
+
+	/* take the DSP out of reset and keep stalled for FW loading */
+	pwrctl = readl(chip->dap + IMX8M_DAP_PWRCTL);
+	pwrctl &= ~IMX8M_PWRCTL_CORERESET;
+	writel(pwrctl, chip->dap + IMX8M_DAP_PWRCTL);
+
+	return 0;
+}
+
+static int imx8m_run(struct snd_sof_dev *sdev)
+{
+	struct imx8m_chip_data *chip = get_chip_pdata(sdev);
+
+	regmap_update_bits(chip->regmap, AudioDSP_REG2, AudioDSP_REG2_RUNSTALL, 0);
+
+	return 0;
+}
+
+static int imx8m_probe(struct snd_sof_dev *sdev)
+{
+	struct imx_common_data *common;
+	struct imx8m_chip_data *chip;
+
+	common = sdev->pdata->hw_pdata;
+
+	chip = devm_kzalloc(sdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return dev_err_probe(sdev->dev, -ENOMEM,
+				     "failed to allocate chip data\n");
+
+	chip->dap = devm_ioremap(sdev->dev, IMX8M_DAP_DEBUG, IMX8M_DAP_DEBUG_SIZE);
+	if (!chip->dap)
+		return dev_err_probe(sdev->dev, -ENODEV,
+				     "failed to ioremap DAP\n");
+
+	chip->regmap = syscon_regmap_lookup_by_phandle(sdev->dev->of_node, "fsl,dsp-ctrl");
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(sdev->dev, PTR_ERR(chip->regmap),
+				     "failed to fetch dsp ctrl regmap\n");
+
+	common->chip_pdata = chip;
+
+	return 0;
+}
+
 static struct snd_soc_dai_driver imx8_dai[] = {
 	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
 	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
 };
 
+static struct snd_soc_dai_driver imx8m_dai[] = {
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai2", 1, 32),
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai3", 1, 32),
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai5", 1, 32),
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai6", 1, 32),
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai7", 1, 32),
+	IMX_SOF_DAI_DRV_ENTRY("micfil", 0, 0, 1, 8),
+};
+
 static struct snd_sof_dsp_ops sof_imx8_ops;
 
 static int imx8_ops_init(struct snd_sof_dev *sdev)
@@ -124,12 +218,24 @@ static const struct imx_chip_ops imx8x_chip_ops = {
 	.core_kick = imx8x_run,
 };
 
+static const struct imx_chip_ops imx8m_chip_ops = {
+	.probe = imx8m_probe,
+	.core_kick = imx8m_run,
+	.core_reset = imx8m_reset,
+};
+
 static struct imx_memory_info imx8_memory_regions[] = {
 	{ .name = "iram", .reserved = false },
 	{ .name = "sram", .reserved = true },
 	{ }
 };
 
+static struct imx_memory_info imx8m_memory_regions[] = {
+	{ .name = "iram", .reserved = false },
+	{ .name = "sram", .reserved = true },
+	{ }
+};
+
 static const struct imx_chip_info imx8_chip_info = {
 	.ipc_info = {
 		.has_panic_code = true,
@@ -154,6 +260,18 @@ static const struct imx_chip_info imx8x_chip_info = {
 	.ops = &imx8x_chip_ops,
 };
 
+static const struct imx_chip_info imx8m_chip_info = {
+	.ipc_info = {
+		.has_panic_code = true,
+		.boot_mbox_offset = 0x800000,
+		.window_offset = 0x800000,
+	},
+	.memory = imx8m_memory_regions,
+	.drv = imx8m_dai,
+	.num_drv = ARRAY_SIZE(imx8m_dai),
+	.ops = &imx8m_chip_ops,
+};
+
 static struct snd_sof_of_mach sof_imx8_machs[] = {
 	{
 		.compatible = "fsl,imx8qxp-mek",
@@ -185,12 +303,22 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
 		.sof_tplg_filename = "sof-imx8-cs42888.tplg",
 		.drv_name = "asoc-audio-graph-card2",
 	},
-
+	{
+		.compatible = "fsl,imx8mp-evk",
+		.sof_tplg_filename = "sof-imx8mp-wm8960.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
+	{
+		.compatible = "fsl,imx8mp-evk-revb4",
+		.sof_tplg_filename = "sof-imx8mp-wm8962.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
 	{}
 };
 
 IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx8_ops_init);
 IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx8_ops_init);
+IMX_SOF_DEV_DESC(imx8m, sof_imx8_machs, &imx8m_chip_info, &sof_imx8_ops, imx8_ops_init);
 
 static const struct of_device_id sof_of_imx8_ids[] = {
 	{
@@ -201,6 +329,10 @@ static const struct of_device_id sof_of_imx8_ids[] = {
 		.compatible = "fsl,imx8qm-dsp",
 		.data = &IMX_SOF_DEV_DESC_NAME(imx8),
 	},
+	{
+		.compatible = "fsl,imx8mp-dsp",
+		.data = &IMX_SOF_DEV_DESC_NAME(imx8m),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sof_of_imx8_ids);
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
deleted file mode 100644
index 3cabdebac558..000000000000
--- a/sound/soc/sof/imx/imx8m.c
+++ /dev/null
@@ -1,567 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-//
-// Copyright 2020 NXP
-//
-// Author: Daniel Baluta <daniel.baluta@nxp.com>
-//
-// Hardware interface for audio DSP on i.MX8M
-
-#include <linux/bits.h>
-#include <linux/firmware.h>
-#include <linux/mfd/syscon.h>
-#include <linux/of_platform.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/regmap.h>
-
-#include <linux/module.h>
-#include <sound/sof.h>
-#include <sound/sof/xtensa.h>
-#include <linux/firmware/imx/dsp.h>
-
-#include "../ops.h"
-#include "../sof-of-dev.h"
-#include "imx-common.h"
-
-#define MBOX_OFFSET	0x800000
-#define MBOX_SIZE	0x1000
-
-/* DAP registers */
-#define IMX8M_DAP_DEBUG                0x28800000
-#define IMX8M_DAP_DEBUG_SIZE   (64 * 1024)
-#define IMX8M_DAP_PWRCTL       (0x4000 + 0x3020)
-#define IMX8M_PWRCTL_CORERESET         BIT(16)
-
-/* DSP audio mix registers */
-#define AudioDSP_REG0	0x100
-#define AudioDSP_REG1	0x104
-#define AudioDSP_REG2	0x108
-#define AudioDSP_REG3	0x10c
-
-#define AudioDSP_REG2_RUNSTALL	BIT(5)
-
-struct imx8m_priv {
-	struct device *dev;
-	struct snd_sof_dev *sdev;
-
-	/* DSP IPC handler */
-	struct imx_dsp_ipc *dsp_ipc;
-	struct platform_device *ipc_dev;
-
-	struct clk_bulk_data *clks;
-	int clk_num;
-
-	void __iomem *dap;
-	struct regmap *regmap;
-};
-
-static int imx8m_get_mailbox_offset(struct snd_sof_dev *sdev)
-{
-	return MBOX_OFFSET;
-}
-
-static int imx8m_get_window_offset(struct snd_sof_dev *sdev, u32 id)
-{
-	return MBOX_OFFSET;
-}
-
-static void imx8m_dsp_handle_reply(struct imx_dsp_ipc *ipc)
-{
-	struct imx8m_priv *priv = imx_dsp_get_data(ipc);
-	unsigned long flags;
-
-	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
-	snd_sof_ipc_process_reply(priv->sdev, 0);
-	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
-}
-
-static void imx8m_dsp_handle_request(struct imx_dsp_ipc *ipc)
-{
-	struct imx8m_priv *priv = imx_dsp_get_data(ipc);
-	u32 p; /* Panic code */
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
-static struct imx_dsp_ops imx8m_dsp_ops = {
-	.handle_reply		= imx8m_dsp_handle_reply,
-	.handle_request		= imx8m_dsp_handle_request,
-};
-
-static int imx8m_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
-{
-	struct imx8m_priv *priv = sdev->pdata->hw_pdata;
-
-	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
-			  msg->msg_size);
-	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
-
-	return 0;
-}
-
-/*
- * DSP control.
- */
-static int imx8m_run(struct snd_sof_dev *sdev)
-{
-	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->pdata->hw_pdata;
-
-	regmap_update_bits(priv->regmap, AudioDSP_REG2, AudioDSP_REG2_RUNSTALL, 0);
-
-	return 0;
-}
-
-static int imx8m_reset(struct snd_sof_dev *sdev)
-{
-	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->pdata->hw_pdata;
-	u32 pwrctl;
-
-	/* put DSP into reset and stall */
-	pwrctl = readl(priv->dap + IMX8M_DAP_PWRCTL);
-	pwrctl |= IMX8M_PWRCTL_CORERESET;
-	writel(pwrctl, priv->dap + IMX8M_DAP_PWRCTL);
-
-	/* keep reset asserted for 10 cycles */
-	usleep_range(1, 2);
-
-	regmap_update_bits(priv->regmap, AudioDSP_REG2,
-			   AudioDSP_REG2_RUNSTALL, AudioDSP_REG2_RUNSTALL);
-
-	/* take the DSP out of reset and keep stalled for FW loading */
-	pwrctl = readl(priv->dap + IMX8M_DAP_PWRCTL);
-	pwrctl &= ~IMX8M_PWRCTL_CORERESET;
-	writel(pwrctl, priv->dap + IMX8M_DAP_PWRCTL);
-
-	return 0;
-}
-
-static int imx8m_probe(struct snd_sof_dev *sdev)
-{
-	struct platform_device *pdev = to_platform_device(sdev->dev);
-	struct device_node *np = pdev->dev.of_node;
-	struct device_node *res_node;
-	struct resource *mmio;
-	struct imx8m_priv *priv;
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
-	priv->dsp_ipc->ops = &imx8m_dsp_ops;
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
-	priv->dap = devm_ioremap(sdev->dev, IMX8M_DAP_DEBUG, IMX8M_DAP_DEBUG_SIZE);
-	if (!priv->dap) {
-		dev_err(sdev->dev, "error: failed to map DAP debug memory area");
-		ret = -ENODEV;
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
-	res_node = of_parse_phandle(np, "memory-region", 0);
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
-	priv->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,dsp-ctrl");
-	if (IS_ERR(priv->regmap)) {
-		dev_err(sdev->dev, "cannot find dsp-ctrl registers");
-		ret = PTR_ERR(priv->regmap);
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
-	return ret;
-}
-
-static void imx8m_remove(struct snd_sof_dev *sdev)
-{
-	struct imx8m_priv *priv = sdev->pdata->hw_pdata;
-
-	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
-	platform_device_unregister(priv->ipc_dev);
-}
-
-/* on i.MX8 there is 1 to 1 match between type and BAR idx */
-static int imx8m_get_bar_index(struct snd_sof_dev *sdev, u32 type)
-{
-	/* Only IRAM and SRAM bars are valid */
-	switch (type) {
-	case SOF_FW_BLK_TYPE_IRAM:
-	case SOF_FW_BLK_TYPE_SRAM:
-		return type;
-	default:
-		return -EINVAL;
-	}
-}
-
-static struct snd_soc_dai_driver imx8m_dai[] = {
-{
-	.name = "sai1",
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-},
-{
-	.name = "sai2",
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-},
-{
-	.name = "sai3",
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-},
-{
-	.name = "sai5",
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-},
-{
-	.name = "sai6",
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-},
-{
-	.name = "sai7",
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-},
-{
-	.name = "micfil",
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 8,
-	},
-},
-};
-
-static int imx8m_dsp_set_power_state(struct snd_sof_dev *sdev,
-				     const struct sof_dsp_power_state *target_state)
-{
-	sdev->dsp_power_state = *target_state;
-
-	return 0;
-}
-
-static int imx8m_resume(struct snd_sof_dev *sdev)
-{
-	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->pdata->hw_pdata;
-	int ret;
-	int i;
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
-static void imx8m_suspend(struct snd_sof_dev *sdev)
-{
-	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->pdata->hw_pdata;
-	int i;
-
-	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
-		imx_dsp_free_channel(priv->dsp_ipc, i);
-
-	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
-}
-
-static int imx8m_dsp_runtime_resume(struct snd_sof_dev *sdev)
-{
-	int ret;
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D0,
-	};
-
-	ret = imx8m_resume(sdev);
-	if (ret < 0)
-		return ret;
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static int imx8m_dsp_runtime_suspend(struct snd_sof_dev *sdev)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D3,
-	};
-
-	imx8m_suspend(sdev);
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static int imx8m_dsp_resume(struct snd_sof_dev *sdev)
-{
-	int ret;
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D0,
-	};
-
-	ret = imx8m_resume(sdev);
-	if (ret < 0)
-		return ret;
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
-static int imx8m_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = target_state,
-	};
-
-	if (!pm_runtime_suspended(sdev->dev))
-		imx8m_suspend(sdev);
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-/* i.MX8 ops */
-static const struct snd_sof_dsp_ops sof_imx8m_ops = {
-	/* probe and remove */
-	.probe		= imx8m_probe,
-	.remove		= imx8m_remove,
-	/* DSP core boot */
-	.run		= imx8m_run,
-	.reset		= imx8m_reset,
-
-	/* Block IO */
-	.block_read	= sof_block_read,
-	.block_write	= sof_block_write,
-
-	/* Mailbox IO */
-	.mailbox_read	= sof_mailbox_read,
-	.mailbox_write	= sof_mailbox_write,
-
-	/* ipc */
-	.send_msg	= imx8m_send_msg,
-	.get_mailbox_offset	= imx8m_get_mailbox_offset,
-	.get_window_offset	= imx8m_get_window_offset,
-
-	.ipc_msg_data	= sof_ipc_msg_data,
-	.set_stream_data_offset = sof_set_stream_data_offset,
-
-	.get_bar_index	= imx8m_get_bar_index,
-
-	/* firmware loading */
-	.load_firmware	= snd_sof_load_firmware_memcpy,
-
-	/* Debug information */
-	.dbg_dump = imx8_dump,
-	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
-
-	/* stream callbacks */
-	.pcm_open	= sof_stream_pcm_open,
-	.pcm_close	= sof_stream_pcm_close,
-	/* Firmware ops */
-	.dsp_arch_ops = &sof_xtensa_arch_ops,
-
-	/* DAI drivers */
-	.drv = imx8m_dai,
-	.num_drv = ARRAY_SIZE(imx8m_dai),
-
-	.suspend	= imx8m_dsp_suspend,
-	.resume		= imx8m_dsp_resume,
-
-	.runtime_suspend = imx8m_dsp_runtime_suspend,
-	.runtime_resume = imx8m_dsp_runtime_resume,
-
-	.set_power_state = imx8m_dsp_set_power_state,
-
-	.hw_info = SNDRV_PCM_INFO_MMAP |
-		SNDRV_PCM_INFO_MMAP_VALID |
-		SNDRV_PCM_INFO_INTERLEAVED |
-		SNDRV_PCM_INFO_PAUSE |
-		SNDRV_PCM_INFO_BATCH |
-		SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
-};
-
-static struct snd_sof_of_mach sof_imx8mp_machs[] = {
-	{
-		.compatible = "fsl,imx8mp-evk-revb4",
-		.sof_tplg_filename = "sof-imx8mp-wm8962.tplg",
-		.drv_name = "asoc-audio-graph-card2",
-	},
-	{
-		.compatible = "fsl,imx8mp-evk",
-		.sof_tplg_filename = "sof-imx8mp-wm8960.tplg",
-		.drv_name = "asoc-audio-graph-card2",
-	},
-	{}
-};
-
-static struct sof_dev_desc sof_of_imx8mp_desc = {
-	.of_machines	= sof_imx8mp_machs,
-	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
-	.ipc_default		= SOF_IPC_TYPE_3,
-	.default_fw_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof",
-	},
-	.default_tplg_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
-	},
-	.default_fw_filename = {
-		[SOF_IPC_TYPE_3] = "sof-imx8m.ri",
-	},
-	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
-	.ops = &sof_imx8m_ops,
-};
-
-static const struct of_device_id sof_of_imx8m_ids[] = {
-	{ .compatible = "fsl,imx8mp-dsp", .data = &sof_of_imx8mp_desc},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, sof_of_imx8m_ids);
-
-/* DT driver definition */
-static struct platform_driver snd_sof_of_imx8m_driver = {
-	.probe = sof_of_probe,
-	.remove = sof_of_remove,
-	.driver = {
-		.name = "sof-audio-of-imx8m",
-		.pm = &sof_of_pm,
-		.of_match_table = sof_of_imx8m_ids,
-	},
-};
-module_platform_driver(snd_sof_of_imx8m_driver);
-
-MODULE_LICENSE("Dual BSD/GPL");
-MODULE_DESCRIPTION("SOF support for IMX8M platforms");
-MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
-- 
2.34.1

