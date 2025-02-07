Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D476238737;
	Fri,  7 Feb 2025 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917468; cv=none; b=Pr4a+k0cq5s/heIMp9Ov3iJSc7DaMu9tAuVnKbGPsIlWxlBxnEptMokNRRSRqOnHXLonyNHAgcCqZ9UmtUayvfIwSS+g3Cey9fR5vEOyC45h+CF9MBHXEygsmHQ5EB3790ee08ZIdfhH16eO6dcJKG3FQIipYNruBO4NJqbVcgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917468; c=relaxed/simple;
	bh=Nhl4VVbJfi1F7gkIOJezg6QazG/o80QdLHCO2TvJE/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kF5qrpIyMkOKSezNwrC5eRLGgcQVbeN1Ed+G4XSXAc/EoOMOti2jfxqzJMjN0mnVMVNShvODQ2Rtr2xZQ4jJTIRyjWYV3jCQakgiTT9ehol0PbK6kPc+K2ele3k84zIwEhz83hg9zGBuJ2L+Va8Q/L0LDPn+ioAPBul2BUvGAnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=BRNuIcN+; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=O11DvWf2 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="BRNuIcN+";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="O11DvWf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917468; x=1770453468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A08jsF72BGICjeJ6QNvNK9Z2aGqeVKtwYaxDuZyAP74=;
  b=BRNuIcN+mY5NMC4q5NbEcZZ7FBQPwTTKG2ALvvE0mzGfZWiUmJb/luwr
   x7p2C0VZuM4ZsTStVSAyKbb7y8Hf19pZwEobzthZ6NgkBxJCKRpmkOgNs
   2JIjLONjIwmh26HJ+wnSN3pV7OnYdMa06cxIA9T5gzAUOIfIUrR6JEiu0
   8t3HhWvZlvFN9L5lsPdVA53iiE38cx5VS9iEw2gH2c1iYRY8yOtFd2aUr
   jSr85wLUW+VZCJYwhb2WFVpJUx+9UuafCqa1R+I4eGxV+jOXSh9WAFrpZ
   rcwEgQgqcA8CV1mdn4EH73bPczp+eGcYXlZx/IXRS9atbqO6XeBQz+o3p
   Q==;
X-CSE-ConnectionGUID: 9vat4LaKTv6vzbCnQ8mh5g==
X-CSE-MsgGUID: Frr9MB+pR22UVmGL6AAP6w==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636123"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:37:24 +0100
X-CheckPoint: {67A5C62C-2D-FED1349E-E4B4C63E}
X-MAIL-CPID: 0201588C6754BC6FD3182DDEA350AF5B_2
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6485B168349;
	Fri,  7 Feb 2025 09:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A08jsF72BGICjeJ6QNvNK9Z2aGqeVKtwYaxDuZyAP74=;
	b=O11DvWf2oPJqU3DCSHCFXOj6wXXKf7uCq85BIFsLjzqHRYBkzA72nECuCwqOiMqqJ6T9Fd
	kWHpeYQSGRmrsz3yuw0VfnoOqTK3ehNJyZ9xxdLArJAV3QYdj2RhlTHULFPJXUeTFi2T2v
	1m/Q8xaz/e/CUK5zywBnoWGzxq7siLU3iggsvWnJTgTTIRyYyYJ9qKL/2qzq2rs+r2DbZ9
	T3gSxkhjewIpMbMFZsVgbGaqgwBwmjmEun7Lth5qvBT1nPJm/2YsojOFwqxq7STMfinwTw
	fNF31R3yJjFIddnq0vbv9/60iPnxkqgR6pJHyx01aVp+GhrqGm+xMSJ73VX6ng==
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
Subject: [PATCH v2 10/10] arm64: dts: imx8mq: Add access-controller references
Date: Fri,  7 Feb 2025 09:36:15 +0100
Message-Id: <20250207083616.1442887-11-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index df8ba1d5391ae..95a40cccd46b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/interconnect/imx8mq.h>
+#include "imx8mq-ocotp.h"
 #include "imx8mq-pinfunc.h"
 
 / {
@@ -1275,6 +1276,7 @@ mipi_dsi: dsi@30a00000 {
 					 <&src IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N>,
 					 <&src IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N>;
 				reset-names = "byte", "dpi", "esc", "pclk";
+				access-controllers = <&ocotp IMX8MQ_OCOTP_MIPI_DSI_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1392,6 +1394,7 @@ mipi_csi1: csi@30a70000 {
 				fsl,mipi-phy-gpr = <&iomuxc_gpr 0x88>;
 				interconnects = <&noc IMX8MQ_ICM_CSI1 &noc IMX8MQ_ICS_DRAM>;
 				interconnect-names = "dram";
+				access-controllers = <&ocotp IMX8MQ_OCOTP_MIPI_CSI1_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1414,6 +1417,7 @@ csi1: csi@30a90000 {
 				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_CSI1_ROOT>;
 				clock-names = "mclk";
+				access-controllers = <&ocotp IMX8MQ_OCOTP_MIPI_CSI1_DISABLE>;
 				status = "disabled";
 
 				port {
@@ -1444,6 +1448,7 @@ mipi_csi2: csi@30b60000 {
 				fsl,mipi-phy-gpr = <&iomuxc_gpr 0xa4>;
 				interconnects = <&noc IMX8MQ_ICM_CSI2 &noc IMX8MQ_ICS_DRAM>;
 				interconnect-names = "dram";
+				access-controllers = <&ocotp IMX8MQ_OCOTP_MIPI_CSI2_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1466,6 +1471,7 @@ csi2: csi@30b80000 {
 				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_CSI2_ROOT>;
 				clock-names = "mclk";
+				access-controllers = <&ocotp IMX8MQ_OCOTP_MIPI_CSI2_DISABLE>;
 				status = "disabled";
 
 				port {
@@ -1566,6 +1572,7 @@ fec1: ethernet@30be0000 {
 				nvmem-cells = <&fec_mac_address>;
 				nvmem-cell-names = "mac-address";
 				fsl,stop-mode = <&iomuxc_gpr 0x10 3>;
+				access-controllers = <&ocotp IMX8MQ_OCOTP_ENET_DISABLE>;
 				status = "disabled";
 			};
 		};
@@ -1705,6 +1712,7 @@ gpu: gpu@38000000 {
 			                         <&clk IMX8MQ_GPU_PLL>;
 			assigned-clock-rates = <800000000>, <800000000>,
 			                       <800000000>, <800000000>, <0>;
+			access-controllers = <&ocotp IMX8MQ_OCOTP_GPU_DISABLE>;
 			power-domains = <&pgc_gpu>;
 		};
 
@@ -1725,6 +1733,7 @@ usb_dwc3_0: usb@38100000 {
 			phy-names = "usb2-phy", "usb3-phy";
 			power-domains = <&pgc_otg1>;
 			snps,parkmode-disable-ss-quirk;
+			access-controllers = <&ocotp IMX8MQ_OCOTP_USB_OTG1_DISABLE>;
 			status = "disabled";
 		};
 
@@ -1757,6 +1766,7 @@ usb_dwc3_1: usb@38200000 {
 			phy-names = "usb2-phy", "usb3-phy";
 			power-domains = <&pgc_otg2>;
 			snps,parkmode-disable-ss-quirk;
+			access-controllers = <&ocotp IMX8MQ_OCOTP_USB_OTG2_DISABLE>;
 			status = "disabled";
 		};
 
@@ -1778,6 +1788,7 @@ vpu_g1: video-codec@38300000 {
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
 			power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
+			access-controllers = <&ocotp IMX8MQ_OCOTP_VPU_DISABLE>;
 		};
 
 		vpu_g2: video-codec@38310000 {
@@ -1786,6 +1797,7 @@ vpu_g2: video-codec@38310000 {
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
 			power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
+			access-controllers = <&ocotp IMX8MQ_OCOTP_VPU_DISABLE>;
 		};
 
 		vpu_blk_ctrl: blk-ctrl@38320000 {
@@ -1839,6 +1851,7 @@ pcie0: pcie@33800000 {
 			                         <&clk IMX8MQ_SYS1_PLL_80M>;
 			assigned-clock-rates = <250000000>, <100000000>,
 			                       <10000000>;
+			access-controllers = <&ocotp IMX8MQ_OCOTP_PCIE1_DISABLE>;
 			status = "disabled";
 		};
 
@@ -1882,6 +1895,7 @@ pcie1: pcie@33c00000 {
 			                         <&clk IMX8MQ_SYS1_PLL_80M>;
 			assigned-clock-rates = <250000000>, <100000000>,
 			                       <10000000>;
+			access-controllers = <&ocotp IMX8MQ_OCOTP_PCIE2_DISABLE>;
 			status = "disabled";
 		};
 
@@ -1916,6 +1930,7 @@ pcie1_ep: pcie-ep@33c00000 {
 					       <10000000>;
 			num-ib-windows = <4>;
 			num-ob-windows = <4>;
+			access-controllers = <&ocotp IMX8MQ_OCOTP_PCIE2_DISABLE>;
 			status = "disabled";
 		};
 
-- 
2.34.1

