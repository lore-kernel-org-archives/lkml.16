Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA8D189916
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747276365; cv=none; b=tQ3ADoGX8XF8tWl0dO9dUPGpQvxRqWNqENrb+y2CPGUg5l6/URDGk42h6ztia1MG0Lbj53V4bMz9LuaKPVPsNugQwEvfwR7yc+y+0PxLzXx/2eyuHY+9emct9Cex1WgdaqzswwUCy7WV8KeSj9gcidsG0n9qP4aLKZM91aCkc6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747276365; c=relaxed/simple;
	bh=84v9gibVD3U7yDeP5uBGKM8oyZVBjPUiJjlCHZfE55M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFnVwzdgn+JDHjQZG8FLafO46i21jdsx78TIrzGuNPtHXajNfNZmdpOkng0p/OfBNDLCqFDjK/Fzl4sV5z92kCvgMJ7TwUpmz0No4epIwzEHsRzKbB/1CuPgEuFD6o4QSB6iZNEpcwflSo/QoF+NJtjW+geeUz58Oi4XdFZ6ea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8AxaeFHUiVoTonoAA--.6818S3;
	Thu, 15 May 2025 10:32:39 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMCxbsVDUiVo1PnTAA--.19913S3;
	Thu, 15 May 2025 10:32:38 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>
Subject: [PATCH v2 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC MFD Core driver
Date: Thu, 15 May 2025 10:32:24 +0800
Message-ID: <778675bfe1040cd1bf4d281dc5c5f20edc4145c1.1747276047.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1747276047.git.zhoubinbin@loongson.cn>
References: <cover.1747276047.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxbsVDUiVo1PnTAA--.19913S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3JryfWFW5ur4kKw15Kw1fXwc_yoWxtFy3p3
	WxAay5GF4DJF17Wa93ur1UCFW3ua9aq3y5tay3JwnIya97Aa4kXw1ktFyavF9rJFyvgry2
	qF98Xr4UCan8JFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUc-VyUUUUU

The Loongson-2K Board Management Controller provides an PCIe
interface to the host to access the feature implemented in the BMC.

The BMC is assembled on a server similar to the server machine with
Loongson-3C6000 CPUs. It supports multiple sub-devices like DRM.

Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mfd/Kconfig       |  13 ++++
 drivers/mfd/Makefile      |   2 +
 drivers/mfd/ls2kbmc-mfd.c | 156 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 drivers/mfd/ls2kbmc-mfd.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 22b936310039..04e40085441d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2422,5 +2422,18 @@ config MFD_UPBOARD_FPGA
 	  To compile this driver as a module, choose M here: the module will be
 	  called upboard-fpga.
 
+config MFD_LS2K_BMC
+	tristate "Loongson-2K Board Management Controller Support"
+	depends on LOONGARCH
+	default y if LOONGARCH
+	select MFD_CORE
+	help
+	  Say yes here to add support for the Loongson-2K BMC
+	  which is a Board Management Controller connected to the PCIe bus.
+	  The device supports multiple sub-devices like DRM.
+	  This driver provides common support for accessing the devices;
+	  additional drivers must be enabled in order to use the
+	  functionality of the BMC device.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 948cbdf42a18..18960ea13b64 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -290,3 +290,5 @@ obj-$(CONFIG_MFD_RSMU_I2C)	+= rsmu_i2c.o rsmu_core.o
 obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
+
+obj-$(CONFIG_MFD_LS2K_BMC)	+= ls2kbmc-mfd.o
diff --git a/drivers/mfd/ls2kbmc-mfd.c b/drivers/mfd/ls2kbmc-mfd.c
new file mode 100644
index 000000000000..b309f6132c24
--- /dev/null
+++ b/drivers/mfd/ls2kbmc-mfd.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Loongson-2K Board Management Controller (BMC) MFD Core Driver.
+ *
+ * Copyright (C) 2024 Loongson Technology Corporation Limited.
+ *
+ * Originally written by Chong Qiao <qiaochong@loongson.cn>
+ * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
+ */
+
+#include <linux/aperture.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+#include <linux/platform_data/simplefb.h>
+#include <linux/platform_device.h>
+
+#define LS2K_DISPLAY_RES_START (SZ_16M + SZ_2M)
+#define LS2K_IPMI_RES_SIZE	0x1c
+#define LS2K_IPMI0_RES_START	(SZ_16M + 0xf00000)
+#define LS2K_IPMI1_RES_START	(LS2K_IPMI0_RES_START + LS2K_IPMI_RES_SIZE)
+#define LS2K_IPMI2_RES_START	(LS2K_IPMI1_RES_START + LS2K_IPMI_RES_SIZE)
+#define LS2K_IPMI3_RES_START	(LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZE)
+#define LS2K_IPMI4_RES_START	(LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZE)
+
+static struct resource ls2k_display_resources[] = {
+	DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "simpledrm-res"),
+};
+
+static struct resource ls2k_ipmi0_resources[] = {
+	DEFINE_RES_MEM_NAMED(LS2K_IPMI0_RES_START, LS2K_IPMI_RES_SIZE, "ipmi0-res"),
+};
+
+static struct resource ls2k_ipmi1_resources[] = {
+	DEFINE_RES_MEM_NAMED(LS2K_IPMI1_RES_START, LS2K_IPMI_RES_SIZE, "ipmi1-res"),
+};
+
+static struct resource ls2k_ipmi2_resources[] = {
+	DEFINE_RES_MEM_NAMED(LS2K_IPMI2_RES_START, LS2K_IPMI_RES_SIZE, "ipmi2-res"),
+};
+
+static struct resource ls2k_ipmi3_resources[] = {
+	DEFINE_RES_MEM_NAMED(LS2K_IPMI3_RES_START, LS2K_IPMI_RES_SIZE, "ipmi3-res"),
+};
+
+static struct resource ls2k_ipmi4_resources[] = {
+	DEFINE_RES_MEM_NAMED(LS2K_IPMI4_RES_START, LS2K_IPMI_RES_SIZE, "ipmi4-res"),
+};
+
+static struct mfd_cell ls2k_bmc_cells[] = {
+	MFD_CELL_RES("simple-framebuffer", ls2k_display_resources),
+	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi0_resources),
+	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi1_resources),
+	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi2_resources),
+	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi3_resources),
+	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi4_resources),
+};
+
+/*
+ * Currently the Loongson-2K0500 BMC hardware does not have an i2c interface to
+ * adapt to the resolution.
+ * We set the resolution by presetting "video=1280x1024-16@2M" to the bmc memory.
+ */
+static int ls2k_bmc_get_video_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
+{
+	char *mode;
+	int depth, ret;
+
+	/* The pci mem bar last 16M is used to store the string. */
+	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
+	if (!mode)
+		return -ENOMEM;
+
+	/* env at last 16M's beginning, first env is "video=" */
+	if (!strncmp(mode, "video=", 6))
+		mode = mode + 6;
+
+	ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
+	if (ret)
+		return ret;
+
+	ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
+	if (ret)
+		return ret;
+
+	ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
+	if (ret)
+		return ret;
+
+	pd->stride = pd->width * depth / 8;
+	pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
+
+	return 0;
+}
+
+static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
+{
+	int ret = 0;
+	resource_size_t base;
+	struct simplefb_platform_data pd;
+
+	ret = pci_enable_device(dev);
+	if (ret)
+		return ret;
+
+	ret = ls2k_bmc_get_video_mode(dev, &pd);
+	if (ret)
+		goto disable_pci;
+
+	ls2k_bmc_cells[0].platform_data = &pd;
+	ls2k_bmc_cells[0].pdata_size = sizeof(pd);
+	base = dev->resource[0].start + LS2K_DISPLAY_RES_START;
+
+	/* Remove conflicting efifb device */
+	ret = aperture_remove_conflicting_devices(base, SZ_4M, "simple-framebuffer");
+	if (ret) {
+		dev_err(&dev->dev, "Remove firmware framebuffers failed: %d\n", ret);
+		goto disable_pci;
+	}
+
+	return devm_mfd_add_devices(&dev->dev, PLATFORM_DEVID_AUTO,
+				    ls2k_bmc_cells, ARRAY_SIZE(ls2k_bmc_cells),
+				    &dev->resource[0], 0, NULL);
+
+disable_pci:
+	pci_disable_device(dev);
+	return ret;
+}
+
+static void ls2k_bmc_remove(struct pci_dev *dev)
+{
+	pci_disable_device(dev);
+}
+
+static struct pci_device_id ls2k_bmc_devices[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);
+
+static struct pci_driver ls2k_bmc_driver = {
+	.name = "ls2k-bmc",
+	.id_table = ls2k_bmc_devices,
+	.probe = ls2k_bmc_probe,
+	.remove = ls2k_bmc_remove,
+};
+
+module_pci_driver(ls2k_bmc_driver);
+
+MODULE_DESCRIPTION("Loongson-2K BMC driver");
+MODULE_AUTHOR("Loongson Technology Corporation Limited");
+MODULE_LICENSE("GPL");
-- 
2.47.1

