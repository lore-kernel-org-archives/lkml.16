Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951FE29898E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927561; cv=none; b=jY/n0M1xBBB7T/RKvACqL9JVxPvwSvLBHU8u3qWAjbfdT3oOn6clEdBpFSZxM+jDKV6/MsFkOUbMdCOZHiBZewrjGKgQhFxa9ep8mB50GCbcAPTEr21ZGBED9YBBfSJlpO/8KW/oRKJcqoPzRCh002bNyxlLlLIDSgP/QwpfFkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927561; c=relaxed/simple;
	bh=Y+ZIWRJIaFCDYqP9ztV+rebpYEOFQHp2/9ollzHfZ14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGLINHhikRfFgo18QqA3RuEVbeKYQulB1q5N2NFBs+EAbSTKRCGpnXb34XU9rx6Y02gmLTk8iID4e/kMWVPlSyg2ARfDxJK07EbiGzlYxeqCnWzEmebSO+I0PzUVJQjOHtjZfZoHSCxUGGS5SVlIb6gkC1TIa4B9S/XKzcHckDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JGMbF8FK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JGMbF8FK"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23649faf69fso7507095ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750927558; x=1751532358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7ELbm8p4uk2UmpzZo8N27QzbL1eTZ8lDKvT434ttg0=;
        b=JGMbF8FKpggvL6aEgUnnHynmTu1CHrpL7cdgqDZGK/GBGygvaa5ADUJ914nD0MYK8m
         YzcaaIhUk3/0OV9GSH3XIuEt3EQZXCQpMcG8ZJVDEwrob6KSUelnSvul8Or6lf7hBwSI
         AXSOHd1Mo5Hk7rne+R8ku10L9d7U3OfmMWeqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927558; x=1751532358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7ELbm8p4uk2UmpzZo8N27QzbL1eTZ8lDKvT434ttg0=;
        b=jWGEng1XqZSox3H6kTqqxGs1s5qOMELpeLQF2YUITOXxuY3MVJ1mua3N1GETblGTEd
         1xsxzSxXU/jymBXKaX+VidOc1o0t/UHPR0Gul2U9GtAZAXNqj7xniozOQv0ljbODao9Y
         tl357/gwXbCPkIYqbq/MDRtVdZOXYnuE1HYp/fs1Qc2Tyoe2usyrIoOc9TuJkyesVcY2
         hieN4P68XFgjFkQlRk47IR1dQfcf7tzh6zl6hIAGHHDxGVUKi9I2Egmwf2ucXw/TiODh
         mhZLbFIUN061WI9Q10FSB+2Um/DAAeSV3LGxCLyKWuqJqQ2R4Hi9/Zc5NcvG9xko5vo/
         r03Q==
X-Forwarded-Encrypted: i=1; AJvYcCWE+2yfjq/LHn+nBj3Il8ReM1SlTJI95beGeY7Ddx29FiTV4B9Jvu756jeub+uhK/rkX3/MGiNTWkOV2wI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj4De4PXFuQh5e31UYo/1se0iUKrD2RMBNCnLZs8ohgYUcSz53
	UUDgkcNcmC8SuvHFkihMEtQL2EvUsa93NELLefv1YuKfy4r5RAlw/XOI43rqb2v/lQ==
X-Gm-Gg: ASbGncvKH9E9+wZS6XEV5K1saFQ3NN9WIEOQX+1+Kf/IWBg+FTA3KaDpwIP9e0j0Oq6
	AKH9m4pzTe0Mq4pv3J2+RfVAlJYJEx8JGvF+FG9yucTPZnvw63Tpj626jriZp+q5rJOPN089XFv
	tNnOhttOjD2b2e6bqezIrVeUDNPsSiqW9wCpMiHgSjEAPx4yBIJ2XlRItakxaB47mr/VW7o+BQD
	Qa3izEExhWwyRGLOjlHPT6blnAzgjAhj5Qa/iLTFnzqPU97TnwIRzy/i/T/j756cyvFtSH08sAn
	nUuz6U9tzC1tO7L4HIhw1tF8KbOfyoKgooIX+KzUTG91+ccZSJweF1M+9ASR28+6E9tNldoYj55
	AyXcrKWKVAjbWkoa6ik6Ji8OudfnE
X-Google-Smtp-Source: AGHT+IFuWEJHek09uHqAn7mLGBMvO/wj0j2g5ugUy4mAtTI6CHsGYM02EOomFsdZgaP1Egw4waVpOg==
X-Received: by 2002:a17:902:ea0c:b0:235:6e7:8df2 with SMTP id d9443c01a7336-2382406d28fmr105085715ad.41.1750927557780;
        Thu, 26 Jun 2025 01:45:57 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83fbe94sm152524875ad.86.2025.06.26.01.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:45:57 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Subject: [net-next, v2 01/10] bng_en: Add PCI interface
Date: Thu, 26 Jun 2025 14:08:10 +0000
Message-ID: <20250626140844.266456-2-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250626140844.266456-1-vikas.gupta@broadcom.com>
References: <20250626140844.266456-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic pci interface to the driver which supports
the BCM5770X NIC family.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
---
 MAINTAINERS                                   |   6 +
 drivers/net/ethernet/broadcom/Kconfig         |   8 +
 drivers/net/ethernet/broadcom/Makefile        |   1 +
 drivers/net/ethernet/broadcom/bnge/Makefile   |   5 +
 drivers/net/ethernet/broadcom/bnge/bnge.h     |  16 ++
 .../net/ethernet/broadcom/bnge/bnge_core.c    | 141 ++++++++++++++++++
 6 files changed, 177 insertions(+)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/Makefile
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b9e58aa296e0..196e317b608c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4853,6 +4853,12 @@ F:	drivers/firmware/broadcom/tee_bnxt_fw.c
 F:	drivers/net/ethernet/broadcom/bnxt/
 F:	include/linux/firmware/broadcom/tee_bnxt_fw.h
 
+BROADCOM BNG_EN 800 GIGABIT ETHERNET DRIVER
+M:	Vikas Gupta <vikas.gupta@broadcom.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/ethernet/broadcom/bnge/
+
 BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS
 M:	Arend van Spriel <arend.vanspriel@broadcom.com>
 L:	linux-wireless@vger.kernel.org
diff --git a/drivers/net/ethernet/broadcom/Kconfig b/drivers/net/ethernet/broadcom/Kconfig
index 81a74e07464f..e2c1ac91708e 100644
--- a/drivers/net/ethernet/broadcom/Kconfig
+++ b/drivers/net/ethernet/broadcom/Kconfig
@@ -253,6 +253,14 @@ config BNXT_HWMON
 	  Say Y if you want to expose the thermal sensor data on NetXtreme-C/E
 	  devices, via the hwmon sysfs interface.
 
+config BNGE
+	tristate "Broadcom Ethernet device support"
+	depends on PCI
+	help
+	  This driver supports Broadcom 50/100/200/400/800 gigabit Ethernet cards.
+	  The module will be called bng_en. To compile this driver as a module,
+	  choose M here.
+
 config BCMASP
 	tristate "Broadcom ASP 2.0 Ethernet support"
 	depends on ARCH_BRCMSTB || COMPILE_TEST
diff --git a/drivers/net/ethernet/broadcom/Makefile b/drivers/net/ethernet/broadcom/Makefile
index bac5cb6ad0cd..10cc1c92ecfc 100644
--- a/drivers/net/ethernet/broadcom/Makefile
+++ b/drivers/net/ethernet/broadcom/Makefile
@@ -18,3 +18,4 @@ obj-$(CONFIG_BGMAC_PLATFORM) += bgmac-platform.o
 obj-$(CONFIG_SYSTEMPORT) += bcmsysport.o
 obj-$(CONFIG_BNXT) += bnxt/
 obj-$(CONFIG_BCMASP) += asp2/
+obj-$(CONFIG_BNGE) += bnge/
diff --git a/drivers/net/ethernet/broadcom/bnge/Makefile b/drivers/net/ethernet/broadcom/bnge/Makefile
new file mode 100644
index 000000000000..0c3d632805d1
--- /dev/null
+++ b/drivers/net/ethernet/broadcom/bnge/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_BNGE) += bng_en.o
+
+bng_en-y := bnge_core.o
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
new file mode 100644
index 000000000000..b49c51b44473
--- /dev/null
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2025 Broadcom */
+
+#ifndef _BNGE_H_
+#define _BNGE_H_
+
+#define DRV_NAME	"bng_en"
+#define DRV_SUMMARY	"Broadcom 800G Ethernet Linux Driver"
+
+extern char bnge_driver_name[];
+
+enum board_idx {
+	BCM57708,
+};
+
+#endif /* _BNGE_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_core.c b/drivers/net/ethernet/broadcom/bnge/bnge_core.c
new file mode 100644
index 000000000000..514602555cd1
--- /dev/null
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_core.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2025 Broadcom.
+
+#include <linux/init.h>
+#include <linux/crash_dump.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "bnge.h"
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION(DRV_SUMMARY);
+
+char bnge_driver_name[] = DRV_NAME;
+
+static const struct {
+	char *name;
+} board_info[] = {
+	[BCM57708] = { "Broadcom BCM57708 50Gb/100Gb/200Gb/400Gb/800Gb Ethernet" },
+};
+
+static const struct pci_device_id bnge_pci_tbl[] = {
+	{ PCI_VDEVICE(BROADCOM, 0x1780), .driver_data = BCM57708 },
+	/* Required last entry */
+	{0, }
+};
+MODULE_DEVICE_TABLE(pci, bnge_pci_tbl);
+
+static void bnge_print_device_info(struct pci_dev *pdev, enum board_idx idx)
+{
+	struct device *dev = &pdev->dev;
+
+	dev_info(dev, "%s found at mem %lx\n", board_info[idx].name,
+		 (long)pci_resource_start(pdev, 0));
+
+	pcie_print_link_status(pdev);
+}
+
+static void bnge_pci_disable(struct pci_dev *pdev)
+{
+	pci_release_regions(pdev);
+	if (pci_is_enabled(pdev))
+		pci_disable_device(pdev);
+}
+
+static int bnge_pci_enable(struct pci_dev *pdev)
+{
+	int rc;
+
+	rc = pci_enable_device(pdev);
+	if (rc) {
+		dev_err(&pdev->dev, "Cannot enable PCI device, aborting\n");
+		return rc;
+	}
+
+	if (!(pci_resource_flags(pdev, 0) & IORESOURCE_MEM)) {
+		dev_err(&pdev->dev,
+			"Cannot find PCI device base address, aborting\n");
+		rc = -ENODEV;
+		goto err_pci_disable;
+	}
+
+	rc = pci_request_regions(pdev, bnge_driver_name);
+	if (rc) {
+		dev_err(&pdev->dev, "Cannot obtain PCI resources, aborting\n");
+		goto err_pci_disable;
+	}
+
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+
+	pci_set_master(pdev);
+
+	return 0;
+
+err_pci_disable:
+	pci_disable_device(pdev);
+	return rc;
+}
+
+static int bnge_probe_one(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	int rc;
+
+	if (pci_is_bridge(pdev))
+		return -ENODEV;
+
+	if (!pdev->msix_cap) {
+		dev_err(&pdev->dev, "MSIX capability missing, aborting\n");
+		return -ENODEV;
+	}
+
+	if (is_kdump_kernel()) {
+		pci_clear_master(pdev);
+		pcie_flr(pdev);
+	}
+
+	rc = bnge_pci_enable(pdev);
+	if (rc)
+		return rc;
+
+	bnge_print_device_info(pdev, ent->driver_data);
+
+	pci_save_state(pdev);
+
+	return 0;
+}
+
+static void bnge_remove_one(struct pci_dev *pdev)
+{
+	bnge_pci_disable(pdev);
+}
+
+static void bnge_shutdown(struct pci_dev *pdev)
+{
+	pci_disable_device(pdev);
+
+	if (system_state == SYSTEM_POWER_OFF) {
+		pci_wake_from_d3(pdev, 0);
+		pci_set_power_state(pdev, PCI_D3hot);
+	}
+}
+
+static struct pci_driver bnge_driver = {
+	.name		= bnge_driver_name,
+	.id_table	= bnge_pci_tbl,
+	.probe		= bnge_probe_one,
+	.remove		= bnge_remove_one,
+	.shutdown	= bnge_shutdown,
+};
+
+static int __init bnge_init_module(void)
+{
+	return pci_register_driver(&bnge_driver);
+}
+module_init(bnge_init_module);
+
+static void __exit bnge_exit_module(void)
+{
+	pci_unregister_driver(&bnge_driver);
+}
+module_exit(bnge_exit_module);
-- 
2.47.1

