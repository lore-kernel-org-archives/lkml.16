Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76531A0BDB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813690; cv=none; b=rdRETyGSGSTIr5/GPHjcIeLz//YhmlKPUNvTJBfLiSz1M3CrL9aey3gqJxychGTj2JHxQ286z6032kGPq6OhNv8vpLqBOgRXuQpElE1Q/8lzqmJCsoEoAQB6u8aQsFo/CotwtcXoe9fHwcDtQiJNhHfAEzbDDOnuu8vr2gKIabY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813690; c=relaxed/simple;
	bh=rXcuTuH5zOkxqgN3Sr8pNB2ilF9JDsHkZP4wKqUejug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXYAlmZOJ2NNFlSqL52bCaqsP7YMzrxEuY5Hv2sN5ru92VOIkyJb/uTYKHekRrVunzVsYb1AzSUcgSUBx5Nm60SmtdhNqKF70mII+3Plnz9pE/fsqiIBmRMwDXXuxnB+TSZhfSuHSSBIvv0QSaXFaDgK/tph/1djyNx98h/Z8R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=wXQq+iyb; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="wXQq+iyb"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDC16C9753;
	Wed, 16 Apr 2025 16:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1744813684; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=O1l+l222XM8iXeSUvqOsHX7K81Z2KEzLTb1gWi+aKXM=;
	b=wXQq+iybqgWTN/cdYoLAjSa60rYJTwJaebxrzGGlhoeNiIy89i7DG4q93zMvImYOCGPr3S
	0NTfLx/SyCvZj8lPSj7NuDLphIS5+5b8UF09u612nZaxY8JXWLNbNXLPV8AX1lB9V7mTFu
	yVg7X0WyEB/EQMwbpYOko0tSXfslvxcGulrCEn1t4dLMZunsDlka5BD8dwLA2Ty4jpoxGr
	Fi4bE4n3hIs0u3PJhE4wOb1xA50gKqnsliRUUcz0wymwHGYsSB7KO9F++fZG9KG32osDOt
	1DTpn5qa8N2/zZeyfXr9Xe4zgx+lqadtxtP9vuHwIQGlaFLYRBBhU5EYg0ZgOA==
From: Frieder Schrempf <frieder@fris.de>
To: Peng Fan <peng.fan@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH 2/5] nvmem: Add i.MX OCOTP fuse driver using ELE S400 API
Date: Wed, 16 Apr 2025 16:26:21 +0200
Message-ID: <20250416142715.1042363-3-frieder@fris.de>
In-Reply-To: <20250416142715.1042363-1-frieder@fris.de>
References: <20250416142715.1042363-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The ELE S400 API is the only way to get full read and write access
to all OCOTP fuse registers. The other possible way through the FSB
is limited and currently provided by the imx-ocotp-ele driver
(misnamed as it currently doesn't use the ELE API at all).

This provides a separate driver that uses the ELE API to provide
an NVMEM device for the OTP fuses.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/Kconfig          |  11 ++
 drivers/nvmem/Makefile         |   2 +
 drivers/nvmem/imx-ocotp-s400.c | 195 +++++++++++++++++++++++++++++++++
 3 files changed, 208 insertions(+)
 create mode 100644 drivers/nvmem/imx-ocotp-s400.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b9..b7109637f47b 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -93,6 +93,17 @@ config NVMEM_IMX_OCOTP_ELE
 	  This is a driver for the On-Chip OTP Controller (OCOTP)
 	  available on i.MX SoCs which has ELE.
 
+config NVMEM_IMX_OCOTP_S400
+	tristate "i.MX On-Chip OTP support via S400 API"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on IMX_SEC_ENCLAVE
+	help
+	  This is a driver for the OCOTP fuses accessed through the S400 API
+	  of the Secure Enclave firmware.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-imx-ocotp-s400.
+
 config NVMEM_IMX_OCOTP_SCU
 	tristate "i.MX8 SCU On-Chip OTP Controller support"
 	depends on IMX_SCU
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5b77bbb6488b..96572fd7cd6e 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -22,6 +22,8 @@ obj-$(CONFIG_NVMEM_IMX_OCOTP)		+= nvmem-imx-ocotp.o
 nvmem-imx-ocotp-y			:= imx-ocotp.o
 obj-$(CONFIG_NVMEM_IMX_OCOTP_ELE)	+= nvmem-imx-ocotp-ele.o
 nvmem-imx-ocotp-ele-y			:= imx-ocotp-ele.o
+obj-$(CONFIG_NVMEM_IMX_OCOTP_S400) += nvmem-imx-ocotp-s400.o
+nvmem-imx-ocotp-s400-y		:= imx-ocotp-s400.o
 obj-$(CONFIG_NVMEM_IMX_OCOTP_SCU)	+= nvmem-imx-ocotp-scu.o
 nvmem-imx-ocotp-scu-y			:= imx-ocotp-scu.o
 obj-$(CONFIG_NVMEM_JZ4780_EFUSE)	+= nvmem_jz4780_efuse.o
diff --git a/drivers/nvmem/imx-ocotp-s400.c b/drivers/nvmem/imx-ocotp-s400.c
new file mode 100644
index 000000000000..b14d3a88f52a
--- /dev/null
+++ b/drivers/nvmem/imx-ocotp-s400.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Kontron Electronics GmbH
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/errno.h>
+#include <linux/firmware/imx/se_api.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+struct imx_s400_fuse_hw {
+	const bool reverse_mac_address;
+	const struct nvmem_keepout *keepout;
+	unsigned int nkeepout;
+};
+
+struct imx_s400_fuse {
+	const struct imx_s400_fuse_hw *hw;
+	struct platform_device *se_dev;
+	struct nvmem_config config;
+	struct mutex lock;
+	void *se_data;
+};
+
+static int imx_s400_fuse_read(void *priv, unsigned int offset, void *val,
+			      size_t bytes)
+{
+	struct imx_s400_fuse *fuse = priv;
+	u32 i, word, num_words;
+	int ret;
+
+	word = offset >> 2;
+	num_words = bytes >> 2;
+
+	mutex_lock(&fuse->lock);
+
+	for (i = word; i < (word + num_words); i++) {
+		ret = imx_se_read_fuse(fuse->se_data, i, ((u32 *)val) + i - word);
+		if (ret) {
+			mutex_unlock(&fuse->lock);
+			return ret;
+		}
+	}
+
+	mutex_unlock(&fuse->lock);
+	return 0;
+}
+
+static int imx_s400_fuse_post_process(void *priv, const char *id, int index,
+				      unsigned int offset, void *data,
+				      size_t bytes)
+{
+	u8 *buf = data;
+	int i;
+
+	if (id && !strcmp(id, "mac-address")) {
+		for (i = 0; i < bytes / 2; i++)
+			swap(buf[i], buf[bytes - i - 1]);
+	}
+
+	return 0;
+}
+
+static int imx_s400_fuse_write(void *priv, unsigned int offset, void *val, size_t bytes)
+{
+	struct imx_s400_fuse *fuse = priv;
+	u32 word = offset >> 2;
+	u32 *buf = val;
+	int ret;
+
+	/* allow only writing one complete OTP word at a time */
+	if (bytes != 4)
+		return -EINVAL;
+
+	/*
+	 * The S400 API returns an error when writing an all-zero value. As
+	 * OTP fuse bits can not be switched from 1 to 0 anyway, skip these
+	 * values.
+	 */
+	if (!*buf)
+		return 0;
+
+	mutex_lock(&fuse->lock);
+	ret = imx_se_write_fuse(fuse->se_data, word, *buf);
+	mutex_unlock(&fuse->lock);
+
+	return ret;
+}
+
+static void imx_s400_fuse_fixup_cell_info(struct nvmem_device *nvmem,
+					  struct nvmem_cell_info *cell)
+{
+	cell->read_post_process = imx_s400_fuse_post_process;
+}
+
+static int imx_s400_fuse_probe(struct platform_device *pdev)
+{
+	struct imx_s400_fuse *fuse;
+	struct nvmem_device *nvmem;
+	struct device_node *np;
+
+	fuse = devm_kzalloc(&pdev->dev, sizeof(*fuse), GFP_KERNEL);
+	if (!fuse)
+		return -ENOMEM;
+
+	fuse->hw = of_device_get_match_data(&pdev->dev);
+
+	fuse->config.dev = &pdev->dev;
+	fuse->config.name = "imx_s400_fuse";
+	fuse->config.id = NVMEM_DEVID_AUTO;
+	fuse->config.owner = THIS_MODULE;
+	fuse->config.size = 2048; /* 64 Banks of 8 Words */
+	fuse->config.word_size = 4;
+	fuse->config.add_legacy_fixed_of_cells = true;
+	fuse->config.reg_read = imx_s400_fuse_read;
+	fuse->config.reg_write = imx_s400_fuse_write;
+	fuse->config.priv = fuse;
+	fuse->config.keepout = fuse->hw->keepout;
+	fuse->config.nkeepout = fuse->hw->nkeepout;
+
+	if (fuse->hw->reverse_mac_address)
+		fuse->config.fixup_dt_cell_info = &imx_s400_fuse_fixup_cell_info;
+
+	dev_set_drvdata(&pdev->dev, fuse);
+
+	mutex_init(&fuse->lock);
+
+	nvmem = devm_nvmem_register(&pdev->dev, &fuse->config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem), "failed to register nvmem device\n");
+
+	np = of_parse_phandle(pdev->dev.of_node, "secure-enclave", 0);
+	if (!np)
+		return dev_err_probe(&pdev->dev, -ENODEV, "missing or invalid secure-enclave handle\n");
+	
+	fuse->se_dev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!fuse->se_dev)
+		return dev_err_probe(&pdev->dev, -ENODEV, "failed to find secure-enclave device\n");
+
+	get_device(&fuse->se_dev->dev);
+	fuse->se_data = platform_get_drvdata(fuse->se_dev);
+	if (!fuse->se_data)
+		return -EPROBE_DEFER;
+
+	dev_info(&pdev->dev, "i.MX S400 OCOTP NVMEM device registered successfully\n");
+
+	return 0;
+}
+
+static void imx_s400_fuse_remove(struct platform_device *pdev)
+{
+	struct imx_s400_fuse *fuse = platform_get_drvdata(pdev);
+	put_device(&fuse->se_dev->dev);
+}
+
+static const struct nvmem_keepout imx93_s400_keepout[] = {
+	{.start = 208, .end = 252},
+	{.start = 256, .end = 512},
+	{.start = 576, .end = 728},
+	{.start = 732, .end = 752},
+	{.start = 756, .end = 1248},
+};
+
+static const struct imx_s400_fuse_hw imx93_s400_fuse_hw = {
+	.reverse_mac_address = true,
+	.keepout = imx93_s400_keepout,
+	.nkeepout = ARRAY_SIZE(imx93_s400_keepout),
+};
+
+static const struct of_device_id imx_s400_fuse_match[] = {
+	{ .compatible = "fsl,imx93-ocotp-s400", .data = &imx93_s400_fuse_hw, },
+	{},
+};
+
+static struct platform_driver imx_s400_fuse_driver = {
+	.driver = {
+		.name = "fsl-ocotp-s400",
+		.of_match_table = imx_s400_fuse_match,
+	},
+	.probe = imx_s400_fuse_probe,
+	.remove = imx_s400_fuse_remove,
+};
+MODULE_DEVICE_TABLE(of, imx_s400_fuse_match);
+module_platform_driver(imx_s400_fuse_driver);
+
+MODULE_AUTHOR("Frieder Schrempf <frieder.schrempf@kontron.de>");
+MODULE_DESCRIPTION("i.MX S400 OCOTP Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.49.0

