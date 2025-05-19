Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA46F27978B
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660333; cv=none; b=qEq1eoJnWhoKv3AzVtSi1Xj7vaTLARtrks2OxU82U0kE7KYcv+8ipMhHmDPlTn8lD9cFXJ+fN2E1G2ij2dbQKFpAUSoXioVkilJBSnzCwI9oQW9MDs/8o2d642iHQcFwDQOg42jOy+D7rtwBIVuwbDvlXXFGqTPVA7f14/ZbKHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660333; c=relaxed/simple;
	bh=lsLYg3RnmictSZ5P2uA+SU1RQfsDxhSdm2R2EC3CQcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DN0w3ZnA7VPAWPqMd8Ej5NBc7JrFi/R0s3SAOl0xFzf6UcR4spZxEt8IMKTxGMvDlfD3qyx4c3tYHskR9mKUv2ayM2Nqm3LT+osfFxSMjrIXDoGJFQZ+4yOjADApxMPX1yVt3k7QFpRlgn43I6pJutJuObEgAYJjEY0GHTI6wJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b=GPAGyXmi; arc=none smtp.client-ip=62.149.158.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b="GPAGyXmi"
Received: from polimar.homenet.telecomitalia.it ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id H0EluBSummHkSH0Emu8qzG; Mon, 19 May 2025 15:09:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1747660140; bh=lsLYg3RnmictSZ5P2uA+SU1RQfsDxhSdm2R2EC3CQcQ=;
	h=From:To:Subject:Date:MIME-Version;
	b=GPAGyXmidFOQjXFy1ac7G3g65mzMWomIVmeDmRqR2mlwLKFa86FP3ou4K5f850JKw
	 RZkGQtPzfV3E1nLdzGO+z8eOlMML10tHLd82RcgZB/NuXfDCMoUCTJrzTRQ9BlRgBj
	 6/EQPQvUZZZlhh5QwEhPLDNyBRYtSTJj4opbhZA1KirtzEQ1vSzzZxqZ3ONC6Cd/De
	 UAWR6eHFfOIX2Z4rJlbBxxft5aKaLrPFeyBujMc7JkD3xRWQ0pRZr2N7OcWbim72Jc
	 NGuKDEFKtAc9rTro/rXtgdMXjYS7OOtGaSvFesfcuhafhVZUsa7mTH0y5S2j7fZ6Me
	 EPWbjPwoq4wpw==
From: Rodolfo Giometti <giometti@enneenne.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Fourmont <eric.fourmont-ext@st.com>,
	Yann GAUTIER <yann.gautier@foss.st.com>,
	Rodolfo Giometti <giometti@enneenne.com>
Subject: [V1 2/2] drivers soc: add support for ST stm32mp13xx family
Date: Mon, 19 May 2025 13:08:59 +0000
Message-Id: <20250519130859.3389704-3-giometti@enneenne.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519130859.3389704-1-giometti@enneenne.com>
References: <20250519130859.3389704-1-giometti@enneenne.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMh/Fpk+pwBEkLTfzO4y4TYc9xaEfBudgO7tsUE0KkBxzid2iibSSSWCC/vQ7vakhsCbCw+9PNUaoJaD6+xay9nl/QAcuPtszO9sB8jayo0P0p87WSTR
 d2/i5HCoS0x0p1B/U8E0V+iM0d4LSTMNH9DzIU6nCW6UBgz/vmCRahhK3F0mtCQpOtKbpCLy1eR1kelAN7f14CjeOvZfbTTJqmVVECrwwCcAml4KbKNund29
 FWQqVHeOAQtXh7cIH8c9ikgF/opK/9qRMZL5BQqGlnHFbSqbC/H2dsyuu9yumnoEyq9J46SJ6XwcG/hXA1Vpw5KCI+S+qD3MFLqUMqlow4DIFC/e6luDWPgW
 LHq2P9DgotXjP5V5wZFPyKbWtZkLYp92EMa/vYC/tfpa6N1wAFEywtLJfNvwwiVxmFmafiGF

This patch adds SoC support for the ST stm32mp13xx family. It also
adds the special attribute "secure" which returns the CPU's secure
mode status.

Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
---
 drivers/soc/st/Makefile        |   1 +
 drivers/soc/st/soc-stm32mp13.c | 253 +++++++++++++++++++++++++++++++++
 2 files changed, 254 insertions(+)
 create mode 100644 drivers/soc/st/soc-stm32mp13.c

diff --git a/drivers/soc/st/Makefile b/drivers/soc/st/Makefile
index 6c71607f6c89..c84bf510928d 100644
--- a/drivers/soc/st/Makefile
+++ b/drivers/soc/st/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_STM32_PM_DOMAINS) += stm32_pm_domain.o
 obj-$(CONFIG_STM32_RISAB) += stm32_risab.o
 obj-$(CONFIG_STM32_RISAF) += stm32_risaf.o
+obj-$(CONFIG_MACH_STM32MP13) += soc-stm32mp13.o
diff --git a/drivers/soc/st/soc-stm32mp13.c b/drivers/soc/st/soc-stm32mp13.c
new file mode 100644
index 000000000000..cf45dbeb926a
--- /dev/null
+++ b/drivers/soc/st/soc-stm32mp13.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Rodolfo Giometti <giometti@enneenne.com>
+ */
+
+#include <linux/cpu.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+#define STM32MP131A	0x6C9
+#define STM32MP131C	0x6C8
+#define STM32MP131D	0xEC9
+#define STM32MP131F	0xEC8
+#define STM32MP133A	0x0C1
+#define STM32MP133C	0x0C0
+#define STM32MP133D	0x8C1
+#define STM32MP133F	0x8C0
+#define STM32MP135A	0x001
+#define STM32MP135C	0x000
+#define STM32MP135D	0x801
+#define STM32MP135F	0x800
+
+#define BSEC_RPN	0x204
+#define BSEC_UID	0x234
+#define SYSCFG_IDC	0x380
+
+/*
+ * SoC attributes
+ */
+
+static ssize_t
+secure_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	u16 val;
+	char *str;
+	int ret;
+	struct device *cpu_dev;
+
+	cpu_dev = get_cpu_device(0);
+	if (!cpu_dev) {
+		dev_err(dev, "failed to get cpu0 device\n");
+		return -ENODEV;
+	}
+	ret = nvmem_cell_read_u16(cpu_dev, "encoding_mode", &val);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case 0b0000010111:
+		str = "open";
+		break;
+	case 0b0000111111:
+		str = "closed";
+		break;
+	case 0b0101111111:
+		str = "closed boundary-scan-disabled]";
+		break;
+	case 0b1111111111:
+		str = "closed JTAG-disabled";
+		break;
+	default:
+		str = "unknown";
+	}
+
+	return sprintf(buf, "%s\n", str);
+}
+static DEVICE_ATTR_RO(secure);
+
+static struct attribute *stm32mp13_soc_attrs[] = {
+	&dev_attr_secure.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(stm32mp13_soc);
+
+/*
+ * Driver init functions
+ */
+
+static int __init stm32mp13_soc_get_rpn_uid(u32 *rpn, u32 uid[3])
+{
+	struct device_node *np;
+	void __iomem *regs;
+	static const struct of_device_id devids[] = {
+		{ .compatible = "st,stm32mp13-bsec" },
+		{ },
+	};
+
+	np = of_find_matching_node(NULL, devids);
+	if (!np)
+		return -ENODEV;
+
+	regs = of_iomap(np, 0);
+	of_node_put(np);
+
+	if (!regs) {
+		pr_warn("Could not map BSEC iomem range");
+		return -ENXIO;
+	}
+
+	*rpn = readl(regs + BSEC_RPN) & 0x0fff;
+	uid[0] = readl(regs + BSEC_UID + 0);
+	uid[1] = readl(regs + BSEC_UID + 4);
+	uid[2] = readl(regs + BSEC_UID + 8);
+
+	iounmap(regs);
+
+	return 0;
+}
+
+static int __init stm32mp13_soc_get_idc(u32 *idc)
+{
+	struct device_node *np;
+	void __iomem *regs;
+	static const struct of_device_id devids[] = {
+		{ .compatible = "st,stm32mp157-syscfg" },
+		{ },
+	};
+
+	np = of_find_matching_node(NULL, devids);
+	if (!np)
+		return -ENODEV;
+
+	regs = of_iomap(np, 0);
+	of_node_put(np);
+
+	if (!regs) {
+		pr_warn("Could not map BSEC iomem range");
+		return -ENXIO;
+	}
+
+	*idc = readl(regs + SYSCFG_IDC);
+
+	iounmap(regs);
+
+	return 0;
+}
+
+static int __init stm32mp13_soc_device_init(void)
+{
+	u32 part_number, rev, chipid[3];
+	struct soc_device_attribute *soc_dev_attr;
+	struct soc_device *soc_dev;
+	struct device_node *root;
+	const char *soc_id;
+	int ret;
+
+	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+	soc_dev_attr->family = "STM STM32MP13xx";
+
+	root = of_find_node_by_path("/");
+	ret = of_property_read_string(root, "model", &soc_dev_attr->machine);
+	if (ret)
+		of_property_read_string_index(root, "compatible", 0,
+						&soc_dev_attr->machine);
+	of_node_put(root);
+	if (ret)
+		goto free_soc;
+
+	/* Get chip info */
+	ret = stm32mp13_soc_get_rpn_uid(&part_number, chipid);
+	if (ret) {
+		pr_err("failed to get chip part number: %d\n", ret);
+		goto free_soc;
+	}
+	switch (part_number) {
+	case STM32MP131A:
+		soc_id = "131a";
+		break;
+	case STM32MP131C:
+		soc_id = "131c";
+		break;
+	case STM32MP131D:
+		soc_id = "131d";
+		break;
+	case STM32MP131F:
+		soc_id = "131f";
+		break;
+	case STM32MP133A:
+		soc_id = "133a";
+		break;
+	case STM32MP133C:
+		soc_id = "133c";
+		break;
+	case STM32MP133D:
+		soc_id = "133d";
+		break;
+	case STM32MP133F:
+		soc_id = "133f";
+		break;
+	case STM32MP135A:
+		soc_id = "135a";
+		break;
+	case STM32MP135C:
+		soc_id = "135c";
+		break;
+	case STM32MP135D:
+		soc_id = "135d";
+		break;
+	case STM32MP135F:
+		soc_id = "135f";
+		break;
+	default:
+		soc_id = "unknown";
+	}
+	soc_dev_attr->soc_id = soc_id;
+
+	ret = stm32mp13_soc_get_idc(&rev);
+	if (ret)
+		goto free_soc;
+	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%X", rev >> 16);
+	if (!soc_dev_attr->revision) {
+		ret = -ENOMEM;
+		goto free_soc;
+	}
+
+	soc_dev_attr->serial_number = kasprintf(GFP_KERNEL, "%08X%08X%08X",
+					chipid[0], chipid[1], chipid[2]);
+	if (!soc_dev_attr->serial_number) {
+		ret = -ENOMEM;
+		goto free_rev;
+	}
+
+	/* Add custom attributes group */
+	soc_dev_attr->custom_attr_group = stm32mp13_soc_groups[0];
+
+	/* Register the SOC device */
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(soc_dev)) {
+		ret = PTR_ERR(soc_dev);
+		goto free_serial_number;
+	}
+
+	pr_info("SoC Machine: %s\n", soc_dev_attr->machine);
+	pr_info("SoC family: %s\n", soc_dev_attr->family);
+	pr_info("SoC ID: %s, Revision: %s\n",
+		soc_dev_attr->soc_id, soc_dev_attr->revision);
+
+	return 0;
+
+free_serial_number:
+	kfree(soc_dev_attr->serial_number);
+free_rev:
+	kfree(soc_dev_attr->revision);
+free_soc:
+	kfree(soc_dev_attr);
+	return ret;
+}
+device_initcall(stm32mp13_soc_device_init);
-- 
2.25.1

