Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8997B234987;
	Fri,  7 Feb 2025 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917434; cv=none; b=ZvRyhCXPTsUQDulfe9A8hwvVddWxDtqy0G5rceOZ6CoTNtuhnmE1SwLZjXl9Ujd6QgM4ozcXNMOt/4YqTmIOFrS8biX2Ned8XUohJlvRogBBnLylLVk8TsolRTOmkEtKpVXN6RIWfQZGI1t0piDR2fjV3WQmkHJ4SdPQ6i/64ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917434; c=relaxed/simple;
	bh=l4f9w/XRgnLoTtm6SHKb4DaDbPCIAwnEOOOkTrx26a4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K6FsZwkf+4Onyhr9OZ1BT0tv25nViozSsDi3kHfo1Vk5WhRbwNQ9IHOLR34jWL2ciqC7PAmq0Ir/NX3dh0SidxyLKCjh8aXC0+bpSwToSZ+XxKAVPrKzBF1IhyIK5U6YG5kmNPB7RZOpjJ6+wy+6ggIo+CPstF/8otJkD19wjQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=N6lmEbgf; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rG6gDhm+ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="N6lmEbgf";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rG6gDhm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917433; x=1770453433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KlSOdiWqUFd/qMNgBzgsVr9GSLb1yHuwpQFNiE93zxA=;
  b=N6lmEbgf5sVkmwCgufOTWUKhvV09leCTn6nKCt1yNI1f6EbrqoGatoHK
   blRRhloORcU+Z//JGznij0IpN451BReEIlZOSqFVlUI8dKMtnCbv2TUn3
   TfFAA79j6f4XH4O2FoJ+whIZKo3xXlfYG6jKhQpX5ysTzQKn0u9FtfsNT
   oBWwA3tPZsew8WqYtDhscXbXJSzuE0jv+KlTmFA1pGrIMp7VnNBO1+ewy
   GDZ/0BtQuvdjzNI1JG/w9AThRL40fvZlvBPTTU6mHIFGMFGKVu9iOqN3y
   jizj9hXB5xyqWbXvbX0V4DJP025A993KZmc1nf6EA6ruh6WO9hD1YFbNJ
   A==;
X-CSE-ConnectionGUID: AVJcsTXrQVmlXrTi5pMN+g==
X-CSE-MsgGUID: LudbVcSIST2ZyjWG+DRFjg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636083"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:49 +0100
X-CheckPoint: {67A5C620-11-8F72533B-EF5B5974}
X-MAIL-CPID: B16014F1042DBAB2C8FE6C97933F6F75_1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACF7D168336;
	Fri,  7 Feb 2025 09:36:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KlSOdiWqUFd/qMNgBzgsVr9GSLb1yHuwpQFNiE93zxA=;
	b=rG6gDhm+646H4cQlpSn7OJX8kmP/XTfURE8sMWXwph4Y4l+9OQai7XQFFfM5fA16GVjKSM
	Qx+6r5TWJQP2HKb4A9QvcTBnh8yawtlX+T8B5cd8ak+KnWsbXrHxhJlNwRpbdlcx7jd3yC
	JWVChdUKgvSKqQhb1Ek8UqRokhUsUa8bBy3OpLtEp5cgjNEmGv/HsJovhhLVqzcRGfOz42
	vcmY4T6r4ZOer3nap5QJ6aKY4Su68LrHv/JfF3IRMiCkgdsdeIcHCxBFZPBC7Ji2PRKXBT
	a0Dn5WD2Oz7sHzO3XGKTVg7BU0MF72ikDmrtz7/tQUdIVDKvulUYB8ZlKBCHXQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller references
Date: Fri,  7 Feb 2025 09:36:09 +0100
Message-Id: <20250207083616.1442887-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Mark ocotp as a access-controller and add references on peripherals
which can be disabled (fused).

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5dd..ee6c3a4be87fd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mn-ocotp.h"
 #include "imx8mn-pinfunc.h"
 
 / {
@@ -431,6 +432,7 @@ easrc: easrc@300c0000 {
 					firmware-name = "imx/easrc/easrc-imx8mn.bin";
 					fsl,asrc-rate = <8000>;
 					fsl,asrc-format = <2>;
+					access-controllers = <&ocotp IMX8MN_OCOTP_ASRC_DISABLE>;
 					status = "disabled";
 				};
 			};
@@ -571,6 +573,7 @@ ocotp: efuse@30350000 {
 				clocks = <&clk IMX8MN_CLK_OCOTP_ROOT>;
 				#address-cells = <1>;
 				#size-cells = <1>;
+				#access-controller-cells = <2>;
 
 				/*
 				 * The register address below maps to the MX8M
@@ -1053,6 +1056,7 @@ fec1: ethernet@30be0000 {
 				nvmem-cells = <&fec_mac_address>;
 				nvmem-cell-names = "mac-address";
 				fsl,stop-mode = <&gpr 0x10 3>;
+				access-controllers = <&ocotp IMX8MN_OCOTP_ENET_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1091,6 +1095,7 @@ mipi_dsi: dsi@32e10000 {
 				clock-names = "bus_clk", "sclk_mipi";
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_DSI>;
+				access-controllers = <&ocotp IMX8MN_OCOTP_MIPI_DSI_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1195,6 +1200,7 @@ mipi_csi: mipi-csi@32e30000 {
 					 <&clk IMX8MN_CLK_DISP_AXI_ROOT>;
 				clock-names = "pclk", "wrap", "phy", "axi";
 				power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_CSI>;
+				access-controllers = <&ocotp IMX8MN_OCOTP_MIPI_CSI_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1225,6 +1231,7 @@ usbotg1: usb@32e40000 {
 				phys = <&usbphynop1>;
 				fsl,usbmisc = <&usbmisc1 0>;
 				power-domains = <&pgc_hsiomix>;
+				access-controllers = <&ocotp IMX8MN_OCOTP_USB_OTG1_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1288,6 +1295,7 @@ gpu: gpu@38000000 {
 					       <400000000>,
 					       <1200000000>;
 			power-domains = <&pgc_gpumix>;
+			access-controllers = <&ocotp IMX8MN_OCOTP_GPU3D_DISABLE>;
 		};
 
 		gic: interrupt-controller@38800000 {
-- 
2.34.1

