Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ADA21FF54
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688242; cv=none; b=S8BnM4JpIhSoxtdknRk/hkxb9l1pri6eOUHY3PE7yCPnfZpts2wLIjwIoVxM7QCe9sKn4r0n+1dldqe/mmlGpQv4dEQ+HL1mQbvL4oH26+3fAdBEj7iMzG/GsjUNtuuMA6WxLrV2a/DFvwfQDiU/EQuNu7/164I7WC7SOB08eFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688242; c=relaxed/simple;
	bh=9YTGSyyEjJBWzKcv9X508Ju9+VcoznZB2wd8RCZhBIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJ+qmsKeaBvqWNynZ4GqmmDcMqgrSlE1Pv8+Tus3xLuWgZz1ibXuFoapIHLWVLALR8Q4TxHWRDwNYmapQv4aIFcavx1A4UXHsB4aFK3n+vWS/kJdWnFWYlbtm5Bb+deg1GIpby3zO/kZBnk5aDe317o9evD381Z5tlpnIRwm/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=loWh9646; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="loWh9646"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0b135d18eso348167f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688238; x=1747293038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCXJnaWqE0fAgUs100fVOe2mb9c5kJtvlpY1ACqYb3k=;
        b=loWh96468eHxNKBzmrfmj9mMf1mOPCu1nwNjIKHIf9b4OILe0Zvi4iYbufsf6zk+Uw
         Z7a3/tb7d2Q2eMH0ldGGB7gheXLsiDueQTJSWqGa6SYPyDrK0GKPBO1H92SdrL8U66MN
         4jf15cMvh8QDizaK+pudiQ1tK2xRQv5n3317ggbX91QsF6x69J1bKGKyQD2BtVsrvrtC
         iB322fhr1dEmP2qjcgZ9dxyNkVYv+EjTqeETXADsqJZegCelj9Ai4BmqxLzuWgsa5Kxz
         4/ARYShPWHFhvPQzawoYBqk/NMYEUpb0hRvAMd4YryVDp3j142sCGlVvhVgSIIXy5rWI
         diqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688238; x=1747293038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCXJnaWqE0fAgUs100fVOe2mb9c5kJtvlpY1ACqYb3k=;
        b=rRBgczEFw9pzGu9yXBs5aN3Pg1aed+QRZcgraeaiT6NuU9wHhbfwQKkmPhEz6MrAMQ
         toLEDNTAxB001Qm1qTAACkVRewNu7WY0XXyzASli+VRvaHJXQGsABQDFyaQ6trVmAVZI
         0z5qMiwp6esDq4JtqUcX78TXn4oXl36uQIxs7X1iMriO1xOyW9ROLuWD3k8mzialNobh
         H7t7HBpqxvKkN+ThpO+aF1GW3/orhLpSyZrort9r8cEaayPg1T1/+euHe2kuA13CEB72
         iaeX1WxkYfW5VNNxpy0izcVfblAPog0rlS1a1esaM8F2iNS2c7EptwMzYfZ6tyAPEJDl
         QGoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtV7RTNR0sswfYq6msXfbAIP/2LOPOWCIhtD7X9KOTNGVm12zZJ69xhDxb56kH/f8hciogZ5VYy5PuVkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS5gC7LJi2TeZ+/9qIyYEKOwbw36hB9OfVKyc8N6T0bDAUJ7IA
	TnF+usj/s6u/xnypekvF4AXuVR7A/2KuBZj9JjtnERmnnDsv8g7tqyPU2XgZTw==
X-Gm-Gg: ASbGncvdjS+BircDJs+5d+puMNx4gvkIISXc0AM2a3wKb9bHB2UX87jtvbvWFLPMIfz
	q0J/3n1QOiRxjw/m62TjleUp+l5K8npfPlhrh0wStYal7FbvmTw0Slhr8InFh6Ra4kt32WQbEza
	HMsg1EOJRzO6LjOhT9rvPMJtykcy4FkMhW5T+ik18jys4fAiFm6iqHW6s6w2Oi8sOIwgaBGo7Ax
	grd9Lxghpiwz+KjfiQGkm6jxvu5B0RwrZWPy0rlWx2ahkxz4Y7x0LhcVmJACvGuDrcd/c/ri1o8
	yuHfzTMf4k/6C2QGue5jZWePZ6lQ/dMhmjTsv2J8PUC85vOBdzWitjnI6Yte0Si4RFYn8q42INQ
	RbxTlPnT1tQg2Nsobdfeqf+Im1kI=
X-Google-Smtp-Source: AGHT+IHV1JSfv4qBQwupY4Va2+Wb9i9D07szr7SibcAfJ9Za0IJyccsIDSZGMhPonRwpb8x04FLbNA==
X-Received: by 2002:a5d:5988:0:b0:39e:e557:7d9 with SMTP id ffacd0b85a97d-3a0b49e9fa9mr4148948f8f.5.1746688238305;
        Thu, 08 May 2025 00:10:38 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:32 +0530
Subject: [PATCH v4 3/5] PCI: host-common: Make the driver as a common
 library for host controller drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-pcie-reset-slot-v4-3-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7440;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=9YTGSyyEjJBWzKcv9X508Ju9+VcoznZB2wd8RCZhBIA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjp1kFqMhXSTF/eBh/n6fZtF2vM5B0B0c5Ul
 nv49HMJlUuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9du0B/sGQkAQ1jOTMZmz5FNWat7V9HdLSW4K3BY3FD4mEBtb8jIpZDNiJTYBb085icKcXYPQ31M
 FICFZzr47/EPEyJr5oHdHiHCT8+qdsDKMOpTy2RdIU+iNDY9GUhOtVFVMU28cHFcQsNAtOKy2kx
 6Qf1JpijCSxiu+KVABIWBz/rhP8pvPTX2kP+U22LEeMkDtoPjU0HsKK9f3VWPQbHlWZlbO8zQtn
 G889qzgpaWL0nyW20O6LrdnY/6FAo53jRjxSzQvt9/ufEIqUyTj51abVn0y2cNfYfLC+v1SLdW7
 HtCcl1pwMCMjjs3Q5IGertLvu1r/cz+TfDDhWWGVtWqkYZCl
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

This common library will be used as a placeholder for helper functions
shared by the host controller drivers. This avoids placing the host
controller drivers specific helpers in drivers/pci/*.c, to avoid enlarging
the kernel Image on platforms that do not use host controller drivers at
all (like x86/ACPI platforms).

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/Kconfig                    |  8 ++++----
 drivers/pci/controller/dwc/pcie-hisi.c            |  1 +
 drivers/pci/controller/pci-host-common.c          |  6 ++++--
 drivers/pci/controller/pci-host-common.h          | 16 ++++++++++++++++
 drivers/pci/controller/pci-host-generic.c         |  2 ++
 drivers/pci/controller/pci-thunder-ecam.c         |  2 ++
 drivers/pci/controller/pci-thunder-pem.c          |  1 +
 drivers/pci/controller/pcie-apple.c               |  2 ++
 drivers/pci/controller/plda/pcie-microchip-host.c |  1 +
 include/linux/pci-ecam.h                          |  6 ------
 10 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 9800b768105402d6dd1ba4b134c2ec23da6e4201..9bb8bf669a807272777b6168d042f8fd7490aeec 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -3,6 +3,10 @@
 menu "PCI controller drivers"
 	depends on PCI
 
+config PCI_HOST_COMMON
+	tristate
+	select PCI_ECAM
+
 config PCI_AARDVARK
 	tristate "Aardvark PCIe controller"
 	depends on (ARCH_MVEBU && ARM64) || COMPILE_TEST
@@ -119,10 +123,6 @@ config PCI_FTPCI100
 	depends on OF
 	default ARCH_GEMINI
 
-config PCI_HOST_COMMON
-	tristate
-	select PCI_ECAM
-
 config PCI_HOST_GENERIC
 	tristate "Generic PCI host controller"
 	depends on OF
diff --git a/drivers/pci/controller/dwc/pcie-hisi.c b/drivers/pci/controller/dwc/pcie-hisi.c
index 8904b5b85ee589576afcb6c81bb4bd39ff960c15..3c17897e56fcb60ec08cf522ee1485f90a2f36a3 100644
--- a/drivers/pci/controller/dwc/pcie-hisi.c
+++ b/drivers/pci/controller/dwc/pcie-hisi.c
@@ -15,6 +15,7 @@
 #include <linux/pci-acpi.h>
 #include <linux/pci-ecam.h>
 #include "../../pci.h"
+#include "../pci-host-common.h"
 
 #if defined(CONFIG_PCI_HISI) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
 
diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index f441bfd6f96a8bde1c07fcf97d43d0693c424a27..f93bc7034e697250711833a5151f7ef177cd62a0 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Generic PCI host driver common code
+ * Common library for PCI host controller drivers
  *
  * Copyright (C) 2014 ARM Limited
  *
@@ -15,6 +15,8 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "pci-host-common.h"
+
 static void gen_pci_unmap_cfg(void *ptr)
 {
 	pci_ecam_free((struct pci_config_window *)ptr);
@@ -94,5 +96,5 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
-MODULE_DESCRIPTION("Generic PCI host common driver");
+MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
new file mode 100644
index 0000000000000000000000000000000000000000..d8be024ca68d43afb147fd9104d632b907277144
--- /dev/null
+++ b/drivers/pci/controller/pci-host-common.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Common library for PCI host controller drivers
+ *
+ * Copyright (C) 2014 ARM Limited
+ *
+ * Author: Will Deacon <will.deacon@arm.com>
+ */
+
+#ifndef _PCI_HOST_COMMON_H
+#define _PCI_HOST_COMMON_H
+
+int pci_host_common_probe(struct platform_device *pdev);
+void pci_host_common_remove(struct platform_device *pdev);
+
+#endif
diff --git a/drivers/pci/controller/pci-host-generic.c b/drivers/pci/controller/pci-host-generic.c
index 4051b9b61dace669422e5a6453cc9f58a081beb5..c1bc0d34348f44c9fdd549811f637fb50fe89c64 100644
--- a/drivers/pci/controller/pci-host-generic.c
+++ b/drivers/pci/controller/pci-host-generic.c
@@ -14,6 +14,8 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "pci-host-common.h"
+
 static const struct pci_ecam_ops gen_pci_cfg_cam_bus_ops = {
 	.bus_shift	= 16,
 	.pci_ops	= {
diff --git a/drivers/pci/controller/pci-thunder-ecam.c b/drivers/pci/controller/pci-thunder-ecam.c
index 08161065a89c35a95714df935ef437dfc8845697..b5b4a958e6a22b21501cad45bb242a95a784efc1 100644
--- a/drivers/pci/controller/pci-thunder-ecam.c
+++ b/drivers/pci/controller/pci-thunder-ecam.c
@@ -11,6 +11,8 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "pci-host-common.h"
+
 #if defined(CONFIG_PCI_HOST_THUNDER_ECAM) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
 
 static void set_val(u32 v, int where, int size, u32 *val)
diff --git a/drivers/pci/controller/pci-thunder-pem.c b/drivers/pci/controller/pci-thunder-pem.c
index f1bd5de67997cddac173723bc7f4ec20aaf20064..5fa037fb61dc356f3029d1b5cae632ae1da5bb9b 100644
--- a/drivers/pci/controller/pci-thunder-pem.c
+++ b/drivers/pci/controller/pci-thunder-pem.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include "../pci.h"
+#include "pci-host-common.h"
 
 #if defined(CONFIG_PCI_HOST_THUNDER_PEM) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
 
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 18e11b9a7f46479348815c3f706319189e0a80b5..edd4c8c683c6a693401b47f5f056641c13ae89f8 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -29,6 +29,8 @@
 #include <linux/of_irq.h>
 #include <linux/pci-ecam.h>
 
+#include "pci-host-common.h"
+
 #define CORE_RC_PHYIF_CTL		0x00024
 #define   CORE_RC_PHYIF_CTL_RUN		BIT(0)
 #define CORE_RC_PHYIF_STAT		0x00028
diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index 3fdfffdf027001bf88df8e1c2538587298228220..24bbf93b8051fa0d9027ce6983eae34cad81065e 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -23,6 +23,7 @@
 #include <linux/wordpart.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-plda.h"
 
 #define MC_MAX_NUM_INBOUND_WINDOWS		8
diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
index 3a10f8cfc3ad5c90585a8fc971be714011ed18fe..d930651473b4d0b406e657a24ede87e09517d091 100644
--- a/include/linux/pci-ecam.h
+++ b/include/linux/pci-ecam.h
@@ -93,10 +93,4 @@ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PCIe */
 extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
 extern const struct pci_ecam_ops loongson_pci_ecam_ops; /* Loongson PCIe */
 #endif
-
-#if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
-/* for DT-based PCI controllers that support ECAM */
-int pci_host_common_probe(struct platform_device *pdev);
-void pci_host_common_remove(struct platform_device *pdev);
-#endif
 #endif

-- 
2.43.0

