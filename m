Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F52F283FEF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238670; cv=none; b=oi2LhvcXvOgfyk4J55tf8k4v1RU2IoLgaa/AyGQ5+jlShDkGvzu7Mvh4hq1T9CF29sPgbmkwjC8mlhHa9K9GybcKErlQYgPEnV3mMqIhL+Oldr4J+mDuyfpVMQv/8OAn+Jx26jvSuK3tATcpNhLY3KSi0tC6GySPUhea/CB3ULQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238670; c=relaxed/simple;
	bh=/sdU1qMNoJ0bvwjvGOsGO9FBW5XHk0rY7exk3jbRQJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyiFHrbZCkbVVKOXQ7jSxQcYPUmRXPzH7NOsza5CWHSOLV2xzvSOxzu4u2aaAqfCMKwEFC/d+aHG78EzypkFITdy3zZB2sz7JNAlgj7KQv2fgei3ukuaSOeyLQXSmmZ+J8VS3d0I1dYzhIm99Da3lgx4FRMMbPgw4cwO6qsnFow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RO3jfgZJ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RO3jfgZJ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2f0faeb994so7705459a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750238668; x=1750843468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR7EzpOcm/lrExaQc9aOQ7ExvWUFWTwhRPcakxeEpQI=;
        b=RO3jfgZJr76BG0rYEG5Y07trnfmjedj0PI4nopsbu0S8jNhnZ7BNRoIeTlflNFWJeJ
         0FC13JWvosbY2QTepRPd65f9aSeNSgUPdaSQCzHTI5GJQGeJijBWb3apEt2ur0p+RqfL
         iWd6pgyB6i8MVCbRyL2tCJCKVHq3x80/lZb3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238668; x=1750843468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OR7EzpOcm/lrExaQc9aOQ7ExvWUFWTwhRPcakxeEpQI=;
        b=pumjy5dBz6EgyToHU9GfegroUUN1T7U90uT5D8lFMQ60hooMbE6zG8QuP6JOttbLc1
         tdvDjTzqBuS7zmpLptVNROVgQjqNIgu6Wyem+F/zNHRFZZuHkIFyMgGbgDa6HggM6pjf
         P4hGHV+BAMFpGYiEHXos3Qo21jLBLqhWiONePczVX6ijblMW8/gPE1Nw+rqmfc7KZJrh
         CO8X5c1w2MZAaGFgVzS4EGh5OdU6LENf8TBighzLPs5n3Qe6zFRyuAxMlPjtj1iPmCn9
         YtHpST7IW4GKCDIDJjveByAIuo43DcEFvkCTefbU0WTGXGyimf43n26EoCKJr8TnSqrp
         zenw==
X-Forwarded-Encrypted: i=1; AJvYcCWBpVaHgoUSw1Vj6UaaQYqJGMWvWCewupxJMaV+VwVZCxvaQzX53tm5GshXFhAAxaOlJLPgwJJM7dRGKxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgDiifgNBGigJmqaTZNF9/QZlyacUF6vCGB6grvSLfvIWQcKMS
	gxYdYbjgRkarq4Y6+mEB/9I5YI0v5w4PNALLCjs2Uj3p4dom0WiP075QyUZadiolAw==
X-Gm-Gg: ASbGncvWdFPlJFxLILtOJVK7qZwtf9j+QdtJ48zPVAv/2QJdg2jFJzlax/dSd+jVpdE
	TqAX7DPaepa/rcWS7tf2YYmrZZFAGtrk4MsqXhm2aO9whXzgJyEOLXbsuJcg23tTBz5f7o8BC3o
	6olh6s4MUx1maaowVXQxDKeK4/U43W/YiIrky1YgCGh03JaiERujH+fJXT6sLn70tGPuLzUQvSI
	cdDQdFUiY5HOMAlupz19Biy+9TlnMC5hMtKra+APomRfmPQH8r/jtaPLnMjomHXwZ89dMv+a+ck
	f1c4enX2jZr/dTrok6tmykNbYlZMagAoar3dvYjBw+Dkz2J0LWxiryblNelAQR3Ssa2xz+efveA
	SwYqMgI+Hxk/ie/9dggW7L2c0tOI7T9FtAz/sVcU=
X-Google-Smtp-Source: AGHT+IEp2uv85HMsESn8B73kJ6UnYjmTVcFq6xZRkuE3FQps1msK6SKzjFp4kBGKVza/Fo7XvWlUvQ==
X-Received: by 2002:a05:6a20:6f8e:b0:21e:f2b5:30de with SMTP id adf61e73a8af0-21fbd55aec5mr26724420637.12.1750238667947;
        Wed, 18 Jun 2025 02:24:27 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecd08sm10408993b3a.27.2025.06.18.02.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:24:27 -0700 (PDT)
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
Subject: [net-next, 01/10] bng_en: Add PCI interface
Date: Wed, 18 Jun 2025 14:47:31 +0000
Message-ID: <20250618144743.843815-2-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250618144743.843815-1-vikas.gupta@broadcom.com>
References: <20250618144743.843815-1-vikas.gupta@broadcom.com>
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
 .../net/ethernet/broadcom/bnge/bnge_core.c    | 149 ++++++++++++++++++
 6 files changed, 185 insertions(+)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/Makefile
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 507c5ff6f620..af349b77a92e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4854,6 +4854,12 @@ F:	drivers/firmware/broadcom/tee_bnxt_fw.c
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
index 000000000000..3778210da98d
--- /dev/null
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_core.c
@@ -0,0 +1,149 @@
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
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)) != 0 &&
+	    dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)) != 0) {
+		dev_err(&pdev->dev, "System does not support DMA, aborting\n");
+		rc = -EIO;
+		goto err_pci_release;
+	}
+
+	pci_set_master(pdev);
+
+	return 0;
+
+err_pci_release:
+	pci_release_regions(pdev);
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

