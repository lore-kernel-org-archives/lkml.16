Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F1237A3C;
	Fri,  7 Feb 2025 08:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917458; cv=none; b=Z9SzHF3qZO8xJ+Jy7GCSUTy+EzQmhj1PlUMvRdaitk5uoNaEoYYj2SlrIxNn4vUbKbxAw0j/MRphKBDSgPsYkGoe/sfHJC1um3orsPsY8cozhdMqqdNNu+cdpUj9/hap/Bqa8OECGAAPiFvDcwap740L8uhTkOTP6L5Dsdlxh6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917458; c=relaxed/simple;
	bh=lFm+OYVBcdpKMX7LuQ/XlNAlu/G+6NKDdDeR8TozVT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OVisuH+TUf6Tqtg2HsiiAau34lQY8XDnzB6h9jt6dQRH1kGrtcO0bkaOajp91Btq0TFopCmAFfeUwjWbZl/rMBX89hjpgsLGJyS3XHLwmzclS2yQozoRMn/GvuR5mCJz5d55yZrqCEHucZE0cp5HLI3H/vp+gTlw5JJdyvB6LFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=CgOc7J3T; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ev4KZjp9 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="CgOc7J3T";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ev4KZjp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917457; x=1770453457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t+/k+qJKT8Tun/0VQisjpzHTf5jDj05SlOoD6w7l060=;
  b=CgOc7J3TFdg+Z2VH6xQNJ5sb53+ke03IMBYPEkoJr/nSlmS9+3zM2XbP
   kjaO3RUNt55QC0zGF/+S2vwr6QzIRFclhf2vB8N1X2bcHnPohxyKM3M75
   lQXdesR9ypLDmX940P5Hk7+Vhl/vvJF6BCkjoWRKS0BYPoahAtubFefmV
   ES+Ns6QglOQDwEwgxI+fnBTMwo9BVsAnurr3rmoeCcRvJo6jSr8WRh8vr
   EhTgTm1TT3mHFzfu/RYw2O42lEtGQieSmu122rBAj/kxSvOHIWQWZjnca
   ZNitUMtUNav8PkkSCX4pRXI4IJbcDnslrW19X1UIWgYjkA3nMxB5VnxE4
   w==;
X-CSE-ConnectionGUID: iqiMZF4gQCCDS611uhH//Q==
X-CSE-MsgGUID: oNkf5ptPSuOAMRgq+i9RWg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636116"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:37:13 +0100
X-CheckPoint: {67A5C620-11-8F72533B-EF5B5974}
X-MAIL-CPID: 6C932CBD313A6B9B526F29620C8032C8_1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36E9A168342;
	Fri,  7 Feb 2025 09:37:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+/k+qJKT8Tun/0VQisjpzHTf5jDj05SlOoD6w7l060=;
	b=Ev4KZjp9LOWOFeR5iPYKl3FERBXXi6yz9tdjO+eWcIihPF/FyDt8jZE47kecaQXpFvjgNC
	AiA7RnaJ+9sUA7p49qY71d2zTlywA8K1CXqS8H3jt3hvFT3u8O4g+89xmJCJ3e9voH6VAW
	cGgc3YHrBoc+1ltjUHbHzy6TBfVA2nobdDU5rnL0PgnmpcNoAYKewXRFSd5NoYx6JLbLpa
	LWr0md1QFzcUZIM10tzKMFw/Lf1XGME71Xy2kAmpmSCC95uL13zZjAeLfN2hpeF1XiJ+Ie
	rsixR54nSKApHbQQ4XgUUQraQbHOEmdTrmKL5av/hf+oWB39n6xeuktDJLvcXA==
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
Subject: [PATCH v2 08/10] arm64: dts: imx8mm: Add access-controller references
Date: Fri,  7 Feb 2025 09:36:13 +0100
Message-Id: <20250207083616.1442887-9-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 1b147a09f6fe8..51472313b8294 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/reset/imx8mq-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mm-ocotp.h"
 #include "imx8mm-pinfunc.h"
 
 / {
@@ -565,6 +566,7 @@ ocotp: efuse@30350000 {
 				/* For nvmem subnodes */
 				#address-cells = <1>;
 				#size-cells = <1>;
+				#access-controller-cells = <2>;
 
 				/*
 				 * The register address below maps to the MX8M
@@ -1108,6 +1110,7 @@ fec1: ethernet@30be0000 {
 				nvmem-cells = <&fec_mac_address>;
 				nvmem-cell-names = "mac-address";
 				fsl,stop-mode = <&gpr 0x10 3>;
+				access-controllers = <&ocotp IMX8MM_OCOTP_ENET_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1157,6 +1160,7 @@ mipi_dsi: dsi@32e10000 {
 							 <&clk IMX8MM_CLK_24M>;
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
+				access-controllers = <&ocotp IMX8MM_OCOTP_MIPI_DSI_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1187,6 +1191,7 @@ csi: csi@32e20000 {
 				clocks = <&clk IMX8MM_CLK_CSI1_ROOT>;
 				clock-names = "mclk";
 				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_CSI_BRIDGE>;
+				access-controllers = <&ocotp IMX8MM_OCOTP_MIPI_CSI_DISABLE>;
 				status = "disabled";
 
 				port {
@@ -1270,6 +1275,7 @@ usbotg1: usb@32e40000 {
 				phys = <&usbphynop1>;
 				fsl,usbmisc = <&usbmisc1 0>;
 				power-domains = <&pgc_hsiomix>;
+				access-controllers = <&ocotp IMX8MM_OCOTP_USB_OTG1_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1290,6 +1296,7 @@ usbotg2: usb@32e50000 {
 				phys = <&usbphynop2>;
 				fsl,usbmisc = <&usbmisc2 0>;
 				power-domains = <&pgc_hsiomix>;
+				access-controllers = <&ocotp IMX8MM_OCOTP_USB_OTG2_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1375,6 +1382,7 @@ pcie0: pcie@33800000 {
 			reset-names = "apps", "turnoff";
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
+			access-controllers = <&ocotp IMX8MM_OCOTP_PCIE1_DISABLE>;
 			status = "disabled";
 		};
 
@@ -1401,6 +1409,7 @@ pcie0_ep: pcie-ep@33800000 {
 			phy-names = "pcie-phy";
 			num-ib-windows = <4>;
 			num-ob-windows = <4>;
+			access-controllers = <&ocotp IMX8MM_OCOTP_PCIE1_DISABLE>;
 			status = "disabled";
 		};
 
@@ -1418,6 +1427,7 @@ gpu_3d: gpu@38000000 {
 			assigned-clock-parents = <&clk IMX8MM_GPU_PLL_OUT>;
 			assigned-clock-rates = <0>, <800000000>;
 			power-domains = <&pgc_gpu>;
+			access-controllers = <&ocotp IMX8MM_OCOTP_GPU3D_DISABLE>;
 		};
 
 		gpu_2d: gpu@38008000 {
@@ -1433,6 +1443,7 @@ gpu_2d: gpu@38008000 {
 			assigned-clock-parents = <&clk IMX8MM_GPU_PLL_OUT>;
 			assigned-clock-rates = <0>, <800000000>;
 			power-domains = <&pgc_gpu>;
+			access-controllers = <&ocotp IMX8MM_OCOTP_GPU2D_DISABLE>;
 		};
 
 		vpu_g1: video-codec@38300000 {
@@ -1441,6 +1452,7 @@ vpu_g1: video-codec@38300000 {
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>;
 			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G1>;
+			access-controllers = <&ocotp IMX8MM_OCOTP_G1_DISABLE>;
 		};
 
 		vpu_g2: video-codec@38310000 {
@@ -1449,6 +1461,7 @@ vpu_g2: video-codec@38310000 {
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>;
 			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
+			access-controllers = <&ocotp IMX8MM_OCOTP_G2_DISABLE>;
 		};
 
 		vpu_blk_ctrl: blk-ctrl@38330000 {
-- 
2.34.1

