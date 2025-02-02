Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4791D517E;
	Sun,  2 Feb 2025 09:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738489025; cv=none; b=QKwEdFABqD/Hw859LAYc8MsajyIFItOEcaHIzi0RcsOIsIJyA9y7Tt+PQwwq57gYc8cftOxNB6jD/U2AkF9/AW4vqLQq8qtQlfCvMkps0xRAEwFGcKbaXE/QXVhL3vRptyMOyVxMFV0PcZH9H40zTIX4mrnop9bkrAKgw+j2E44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738489025; c=relaxed/simple;
	bh=Fi2PrpG9/193wIkPZ4nbdcQkxKb5QLLpS3eKey5BzMg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m9ehb5d5saEC8IoYTxq8j7zViFnJD9VgEXbeCgRiqjQNtBWaCtXk8FpBBXTYieEzFk/w29gJpI03rfEqtiPomiHnlUEFOE+StDtGr9F8nka0bV+mF/k5AfTxkCEoBj9sOGPZnDUEgDaAC4spN02r7WRTzByYJ/6U90qqTkhlcDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aT7RhGqI; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aT7RhGqI"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5129aqpU2003168
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 2 Feb 2025 03:36:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738489012;
	bh=VyxT29djFvM3ntDkvLl+j0Q447hgH0lzb94/vho/PT4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aT7RhGqIkAn63V2CqOHxeRmOokBxADWMJyqDlGmV059XqKP4IFv/b98WaIB5k8lAL
	 hUzM1yKVhMFUZgcEGatNsaeHzsuOziqJj8d8lU5sMNwoBCA80oxkJbdQAo5a5kR1Is
	 6b8lX3Fy9xWj0+MwJuAd+SGkO1OSimAjdGo+11xk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5129aqdu086783;
	Sun, 2 Feb 2025 03:36:52 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Feb 2025 03:36:50 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Feb 2025 03:36:51 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5129abbl119794;
	Sun, 2 Feb 2025 03:36:48 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to enable USB0 Type-A
Date: Sun, 2 Feb 2025 15:06:30 +0530
Message-ID: <20250202093636.2699064-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250202093636.2699064-1-s-vadapalli@ti.com>
References: <20250202093636.2699064-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The USB0 instance of the USB controller on both the J742S2 EVM and the
J784S4 EVM supports a single USB interface at a time among the following:
1. USB3.1 Gen1 Type C interface
2. Two USB2.0 Type A interfaces via an on-board USB Hub.

By default, the USB3.1 Gen1 Type C interface is supported on both of the
EVMs. Enable the USB2.0 Type A interface by configuring the USB2.0_MUX_SEL
mux. Additionally, set the Dual-Role Mode to Host since a Type-A interface
is only associated with the Host Mode of operation.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  9 +++++-
 .../ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso  | 29 +++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index dbeb5d7401f7..019517c258ec 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -129,6 +129,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-pcie-ntb.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 
 # Boards with J742S2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
@@ -215,6 +216,8 @@ k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j742s2-evm-pcie-ntb-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-pcie-ntb.dtbo
+k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
+	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-pcie-ntb-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-j742s2-evm-pcie-ntb.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
@@ -223,6 +226,8 @@ k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtbo
 k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
+k3-j784s4-evm-usb0-type-a-dtbs := k3-j784s4-evm.dtb \
+	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-csi2-imx219.dtb \
@@ -253,10 +258,12 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j742s2-evm-pcie-ntb.dtb \
+	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-pcie-ntb.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
-	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
+	k3-j784s4-evm-usxgmii-exp1-exp2.dtb \
+	k3-j784s4-evm-usb0-type-a.dtb
 
 # Enable support for device-tree overlays
 DTC_FLAGS_k3-am625-beagleplay += -@
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
new file mode 100644
index 000000000000..ba15d72d86d6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT Overlay for enabling USB0 instance of USB on J784S4 and J742S2 EVMs for
+ * Host Mode of operation with the Type-A Connector.
+ *
+ * J784S4 EVM Product Link: https://www.ti.com/tool/J784S4XEVM
+ * J742S2 EVM Product Link: https://www.ti.com/tool/J742S2XH01EVM
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&exp2 {
+	p12-hog {
+		/* P12 - USB2.0_MUX_SEL */
+		gpio-hog;
+		gpios = <12 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "USB2.0_MUX_SEL";
+	};
+};
+
+&usb0 {
+	dr_mode = "host";
+};
-- 
2.43.0

