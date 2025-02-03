Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D0220E718;
	Mon,  3 Feb 2025 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603163; cv=none; b=QZI6lcFuI97MWEcRRHwCKmohB4rOMS7CmoiLdpRnv5VrJbQv17Tv8Lif4/mymslvYCqEE/QYqLg18DD51yAhDDoF455EpA0qnLNk5adAuwbsUK3EG2D3kgGVnj94lGN8ecixWlm2JJX/AeUgH9S/6hN3uwfN3rflWS8RAko55GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603163; c=relaxed/simple;
	bh=btjqz5KUcQjdcm2IA5CnWxHSOfUI3My73mcGvWB+IMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h71QQMNTHxPVhXBIyvGbo56rtKUmcCvSq1CiicWXbzITo2DRfj1/VTfu5nD1EdEyikRwsn61IeJk+udeOxAQRIrzNxtsroIcw+K+O41IjQbSDAMb3uYLOSXZnZkc7RzoHfMUP5j2cPWgJD+LlNg4iLSJZ7uteQ8Kh7zjUnj/j8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRklyEoM; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRklyEoM"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab2aea81cd8so837309066b.2;
        Mon, 03 Feb 2025 09:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603159; x=1739207959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZ4lM6UxfL9Ok/xrPuvbDtbsSkBr/V1IbirDhtP9Bbk=;
        b=VRklyEoMMv90atzyvRBaI6fydMHnrSFiqSP2AGpFfXjNcUqTI5JHWsoErNt7fNvH9U
         ovxDEg2rQDfNbp4N5iTTv+8/Klli8FjHXrtVBPC+eX5jpiOIzCSmnBLf6aR6Oma4lNPP
         wvBjgxxRLODDEUuIvSE8ecgVWbogx1p3WsAiWW60Vm0SAafvZ0wcKyAL7YD70tjy50c+
         SH4uRNN/35cYnopU291BOyU23Y2a6h/avJrlhrbWl9uhbCl+y2pQ1SOhnyC4mIAMGozK
         YjyXkwHRzTbtx4uIKBgbuXpbtnvVle5DHLHUjsjj4OIUxYe717y+FdqgiedR1T99JcRx
         eC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603159; x=1739207959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZ4lM6UxfL9Ok/xrPuvbDtbsSkBr/V1IbirDhtP9Bbk=;
        b=C0HpukREO94dimSc0OLUYAAFZqDEHtRhjMXlO5q310XYk/h9PUm5TBI3nZa5LTmprC
         nqGAX2Qn5QLCvxt5WhmpePiDhT2oTJeyX4dv9pXusmaU5SQ5t1SdoBU6+bjrK9WiauLi
         vv62U3Qogd7RV56aiqDz7HRp0in+PqptY54Plr5aZ1BLtLE0G0RDz4ztWAmW7JMY25Rh
         +zL0MGcpV3lS8tKM/IEI+V4n79k75rNSpFgO2vS161oL7t7ccklFZ4f4fEIT9Q6K3aJD
         D4QalnDAQR3QgC+aZkN8YuoOcA2xPOeeSU2e0TQNDhQAMF9xqTuN+3fMrpEtGFDGs7kx
         rfvg==
X-Forwarded-Encrypted: i=1; AJvYcCWbm7HITmqsTKEYJHaeJH1SxwihvXLCvSAWaSuam5XusJ5BylMMxnzUX+KdDNinM0D/60Rp4pS7mb3L8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69hiZ6NxjWnyFsFIki5MwFLnRMKweLJBv6OqV2J1+UjPCmma8
	t7SdSfmaN15nBMU82zAqf/0G84qjV/u+fa5+aatLUSKx+YWbWVuk
X-Gm-Gg: ASbGncvY8Qw4zFJh3O5i+PR18caCKQviHmf3aTdQx/iBKontQRGtqdCYzxYtCNoAB5c
	X4vVt7YhcSrYd49c8A++k63TyQF1DnKEQeCwG+vjIgAV6/lnVN+CY78TyGPRSuRsj9cHzukoddS
	y8MGLgN8LdyMDn3XvoUeSlR1JTWkj2abKx4laCO2HojJUP0/zkVVwURx3ZQbsHxCP0gFD2G8Xrj
	/S/es9TMo/GHwz9pxE/R3eI5HN3g3xRb0wCRLAU9T7O4Go+sW53U6F7Up1I9zj0V6t6uLj04KCs
	ySl/WvCwlyks3bNLyG/dpWmhvJ3H0aW6KObvur4EFx736cKqsA==
X-Google-Smtp-Source: AGHT+IFgry0ftlapvrf7EtYFzbKt1bCPkjlJy/7aasV72LNddgtJ3tlNB2kZEN6pbuUX/L38gX3R4g==
X-Received: by 2002:a17:907:6ea3:b0:ab6:f4e0:c06 with SMTP id a640c23a62f3a-ab6f4e00fe4mr1796035066b.21.1738603158981;
        Mon, 03 Feb 2025 09:19:18 -0800 (PST)
Received: from playground.localdomain ([92.120.5.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d21aasm784253866b.74.2025.02.03.09.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:19:18 -0800 (PST)
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
Subject: [PATCH 9/9] ASoC: SOF: imx: add driver for the imx95 chip
Date: Mon,  3 Feb 2025 12:18:08 -0500
Message-Id: <20250203171808.4108-10-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add SOF support for the imx95 chip. Although the support is just
for the imx95 chip, the driver is intended for all chips in the imx9
family.

Note that the imx95 support could have just as easily been added
to the imx8 platform driver but a new platform driver was created
because the intention is to keep the families in separate drivers.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 sound/soc/sof/imx/Kconfig  |   9 +++
 sound/soc/sof/imx/Makefile |   2 +
 sound/soc/sof/imx/imx9.c   | 135 +++++++++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)
 create mode 100644 sound/soc/sof/imx/imx9.c

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 2edf9de2c886..327e2df94a58 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -32,4 +32,13 @@ config SND_SOC_SOF_IMX8
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
+config SND_SOC_SOF_IMX9
+	tristate "SOF support for i.MX9"
+	depends on IMX_DSP
+	select SND_SOC_SOF_IMX_COMMON
+	help
+	  This adds support for Sound Open Firmware for NXP i.MX9 platforms.
+	  Say Y if you need such a device.
+	  If unsure select "N".
+
 endif ## SND_SOC_SOF_IMX_TOPLEVEL
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
index 36a3a67c6efb..74b5ecad8fe8 100644
--- a/sound/soc/sof/imx/Makefile
+++ b/sound/soc/sof/imx/Makefile
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 snd-sof-imx8-y := imx8.o
+snd-sof-imx9-y := imx9.o
 
 snd-sof-imx-common-y := imx-common.o
 
 obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
+obj-$(CONFIG_SND_SOC_SOF_IMX9) += snd-sof-imx9.o
 obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
diff --git a/sound/soc/sof/imx/imx9.c b/sound/soc/sof/imx/imx9.c
new file mode 100644
index 000000000000..b6ef8b044d0f
--- /dev/null
+++ b/sound/soc/sof/imx/imx9.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/arm-smccc.h>
+
+#include "imx-common.h"
+
+#define IMX_SIP_SRC 0xC2000005
+#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
+
+#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
+
+#define IMX_SIP_LMM 0xC200000F
+#define IMX_SIP_LMM_BOOT 0x0
+#define IMX_SIP_LMM_SHUTDOWN 0x1
+
+#define IMX95_M7_LM_ID 0x1
+
+static struct snd_soc_dai_driver imx95_dai[] = {
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai3", 1, 32),
+};
+
+static struct snd_sof_dsp_ops sof_imx9_ops;
+
+static int imx95_ops_init(struct snd_sof_dev *sdev)
+{
+	/* first copy from template */
+	memcpy(&sof_imx9_ops, &sof_imx_ops, sizeof(sof_imx_ops));
+
+	/* ... and finally set DAI driver */
+	sof_imx9_ops.drv = imx95_dai;
+	sof_imx9_ops.num_drv = ARRAY_SIZE(imx95_dai);
+
+	return 0;
+}
+
+static int imx95_chip_probe(struct snd_sof_dev *sdev)
+{
+	struct resource *res;
+	struct arm_smccc_res smc_res;
+	struct platform_device *pdev;
+
+	pdev = to_platform_device(sdev->dev);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
+	if (!res)
+		return dev_err_probe(sdev->dev, -ENODEV,
+				     "failed to fetch SRAM region\n");
+
+	/* set core boot reset address */
+	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, res->start,
+		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_res);
+
+	return smc_res.a0;
+}
+
+static int imx95_core_kick(struct snd_sof_dev *sdev)
+{
+	struct arm_smccc_res smc_res;
+
+	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT,
+		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
+
+	return smc_res.a0;
+}
+
+static int imx95_core_shutdown(struct snd_sof_dev *sdev)
+{
+	struct arm_smccc_res smc_res;
+
+	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN,
+		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
+
+	return smc_res.a0;
+}
+
+static const struct imx_chip_ops imx95_chip_ops = {
+	.probe = imx95_chip_probe,
+	.core_kick = imx95_core_kick,
+	.core_shutdown = imx95_core_shutdown,
+};
+
+static struct imx_memory_info imx95_memory_regions[] = {
+	{ .name = "sram", .reserved = false },
+	{ }
+};
+
+static const struct imx_chip_info imx95_chip_info = {
+	.ipc_info = {
+		.boot_mbox_offset = 0x6001000,
+		.window_offset = 0x6000000,
+	},
+	.has_dma_reserved = true,
+	.memory = imx95_memory_regions,
+	.ops = &imx95_chip_ops,
+};
+
+static struct snd_sof_of_mach sof_imx9_machs[] = {
+	{
+		.compatible = "fsl,imx95-19x19-evk",
+		.sof_tplg_filename = "sof-imx95-wm8962.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
+	{
+	}
+};
+
+IMX_SOF_DEV_DESC(imx95, sof_imx9_machs, &imx95_chip_info, &sof_imx9_ops, imx95_ops_init);
+
+static const struct of_device_id sof_of_imx9_ids[] = {
+	{
+		.compatible = "fsl,imx95-cm7-sof",
+		.data = &IMX_SOF_DEV_DESC_NAME(imx95),
+	},
+	{
+	},
+};
+MODULE_DEVICE_TABLE(of, sof_of_imx9_ids);
+
+static struct platform_driver snd_sof_of_imx9_driver = {
+	.probe = sof_of_probe,
+	.remove = sof_of_remove,
+	.driver = {
+		.name = "sof-audio-of-imx9",
+		.pm = &sof_of_pm,
+		.of_match_table = sof_of_imx9_ids,
+	},
+};
+module_platform_driver(snd_sof_of_imx9_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF driver for imx9 platforms");
+MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
-- 
2.34.1

