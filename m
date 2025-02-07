Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4418B463;
	Fri,  7 Feb 2025 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945416; cv=none; b=RkpyRSXFSUqftkepUTiRJy2hVaj1P+t8Hw/Ct1vb0KjnE90B64af++7ITUp8Hxu6qRryhDzzw3uqxeEJFNP/7DMtWpaAqEe4TFR8htHlytbxyXKoqVfu/aFx5auElSQUU8RHB5ai/ZrZuTTjgMJQNq1oPGSLR/KDSw1E232c+v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945416; c=relaxed/simple;
	bh=zZASAU4sdBBq785nmA4kIBRJ49R4E94H2J/yq9hQJmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PHTyXkLFtYMzl7hf7wFa54PfA+M3RiYCmwua4E8ME5st+1HeFW+tA9BaOb/WsMMdkRir+RsaGtMOxhwmaiFLtbIxIHmGXzysC9FTIlD9EP9NYGYOKD+6Eie09w7MdK3wSa63JlU5YPK5Q7JzZnX6eTm+3jlxQn+FoTYGbGVdcxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJl4f5Ed; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJl4f5Ed"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1193086f8f.3;
        Fri, 07 Feb 2025 08:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738945413; x=1739550213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMCPFhDyZYkrbJvic77bbS2Bo/r1oG3Os1Kys3I7qps=;
        b=EJl4f5EdsKAbl/ec5ZscihuK8z98d9rNyj2zRQpW6IFivrGED+3HORbsBaXLrQZs3H
         UjdGqwEZOBxH6wExRAogm9Krjo7Mgae6BH1rNi4VbyRrMHRDoNXsw9Jsa+XC9o+1vyaT
         S8dhPzZzN07zmoYWQKFQFOLFs4mmD3N5BlLh5q+HQKFHpXXre9cVeBvB0tgcwFj+Xh3g
         ANDtYzSzSlW5DMMRTqJcM28ZsPNw2wjtBro0E239srmbdtTKkyLVO6PkLPBkD9nH44Dv
         +TX5omL6UqmJhDWwUTokW2om6GyoUEvXwVuDGbg7MZnOtjor0/C+LrLD7ow13PgN01xi
         rIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945413; x=1739550213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMCPFhDyZYkrbJvic77bbS2Bo/r1oG3Os1Kys3I7qps=;
        b=ZFk2yiDoqQV64lFDus7LSaNjgfrFY0KF9BOOzk/yV23g6CsgbD7jk0jb2f9albumH4
         74uunQSDFuSuJuqV3Ls6oTosrZKNYEQj5Z5P5s2tpqUj77tMguKliwEWFQrjZc7BIfuD
         8uXk1j6Tiz+6JwAgJGNZFasV72aJFvlGRvgQjW5BC22CDZKfEkZGZ0fKjbtjGIKJ9vPh
         ACm2ZH/22O4H6zwDtq0K//vwypGYj0zWjUCPhSbzVlmPQFTdTXwtkQnzFmXyx5TbD0lw
         28o8CshGZRfM46vRQCeZm9ZlRspHDKrcn2MyjAz9lDrvOsy4s+WAHY9SdmMYC4Isz8Ai
         F6qA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Tw4gz2ZCWnO2GlmQ5Put+CA++eRu23lNzXNNUKvcz2J982nodsHp3oxlP+qfaezck84q2Is9cLsZ+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAaxMD1OR83qf4FfmduhN0mDTNmowtlGkOOuHNKIGcSGSxPx4S
	HhS5QS35Crt/x+U3CKmz56C49PbPU5PWiwWqT/ctnVtyyqutsTud
X-Gm-Gg: ASbGncuuVIzhVckDX48XcSChwK6cDUtKLMA/34Wf8qM/SwPs+J2CMb6xq5jqNPd7S+k
	i9zn/otXyi8JOpDXISptR7xZTV2a/IlLgG9OFKCDFmSCmpiIAczHeUNY+UoXsbHb+jFM6cf6jlO
	I+cklLFJygqvrh9MmBDdKfyyk2yAvryuqXjtEA6wW9VyNrQuzOIw5jlbwcxEOJicIJIDQUJWp6h
	07kWiJ7cvm6U0vc73M/i21JBCrECyyfmmwnlSB1f9J2crHElPZE5uEkOvI5R473KHhTQNWGoJbW
	dd5EcYCqf9vPou88CABzGFJs3xUHOabzelME175qs32dstq0N4W7iA==
X-Google-Smtp-Source: AGHT+IHswa39pRzzIapV73OP7tXt1uLC8Jw3/bOqBxZifaNYc159cr5+c5VMnjMPfJEEtBu9/S52vg==
X-Received: by 2002:a05:6000:1ac5:b0:38d:b57e:71e0 with SMTP id ffacd0b85a97d-38dc8da7a56mr2231522f8f.4.1738945412616;
        Fri, 07 Feb 2025 08:23:32 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm61260825e9.2.2025.02.07.08.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:23:32 -0800 (PST)
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
Subject: [PATCH v3 7/7] ASoC: SOF: imx: add driver for the imx95 chip
Date: Fri,  7 Feb 2025 11:22:46 -0500
Message-Id: <20250207162246.3104-8-laurentiumihalcea111@gmail.com>
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

Add SOF support for the imx95 chip. Although the support is just
for the imx95 chip, the driver is intended for all chips in the imx9
family.

Note that the imx95 support could have just as easily been added
to the imx8 platform driver but a new platform driver was created
because the intention is to keep the families in separate drivers.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/sof/imx/Kconfig  |   9 +++
 sound/soc/sof/imx/Makefile |   2 +
 sound/soc/sof/imx/imx9.c   | 137 +++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
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
index 000000000000..598675d4350a
--- /dev/null
+++ b/sound/soc/sof/imx/imx9.c
@@ -0,0 +1,137 @@
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
+	sof_imx9_ops.drv = get_chip_info(sdev)->drv;
+	sof_imx9_ops.num_drv = get_chip_info(sdev)->num_drv;
+
+	return 0;
+}
+
+static int imx95_chip_probe(struct snd_sof_dev *sdev)
+{
+	struct arm_smccc_res smc_res;
+	struct platform_device *pdev;
+	struct resource *res;
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
+	.drv = imx95_dai,
+	.num_drv = ARRAY_SIZE(imx95_dai),
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

