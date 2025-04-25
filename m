Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8236119BBC;
	Fri, 25 Apr 2025 05:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745557875; cv=none; b=T3DyUkjLVijcj0dVIkPKGnuWRDMnXSbZBU9KD6HO8mhnPErIG0m1YlSI3+iAcgsHNmX3SC2N3+5FWPIK7pRmLgAStsTbMictEl8e5LJ4A6a9XG9eAiDjS4s4GxFOblOq6gL1m+aGqmIn/J784VKn/bBFoIaHm+48U3Ta6Ln5jfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745557875; c=relaxed/simple;
	bh=6WN9cyjlvfOr39m4fAWpRRHRs8xivuebzEa12pwf6e8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHmNUHnRkFnFhjzUHWaL8KnFd3a39OJV0dAVm+0mJGrr3/AisMAeqJV6SrBRzgWQD9xkFiu9J0RFwhOQSA9wkwSbWkSadYoqZVEbkXywmYgYNOjPHjFIDqu7FKJlak5l30xSeJQY9gRhsTyVTuoyR4UM1Ewe/ANYgH0lD4yXtC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Fh750DE1; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Fh750DE1"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53P5B14E2044806
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 00:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745557861;
	bh=wfpXcxJojNNTMz4jhhaqXspq8LKU95JPsOwHtHrtKQI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Fh750DE1sof4gHHoaS1Kp1SyHXNctevl5M3pjft7MnCFWWxCJnDut0clUNUayclgZ
	 TyGi6ZD2wNPNmtp8QrAmozFZJJuRzbUN2yvHsuvbh+MGPJM/PU85rV40huZzAr9NYC
	 b2CbDN3HuOC8+tReJK88TYThyma+dTwTbFwSANdQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53P5B1jL024896
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 00:11:01 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 00:11:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 00:11:01 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53P5B0tN011224;
	Fri, 25 Apr 2025 00:11:00 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <srk@ti.com>, <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <c-vankar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Roger
 Quadros <rogerq@kernel.org>
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-am62p*/k3-j722s: Add bootph-all property to enable Ethernet boot
Date: Fri, 25 Apr 2025 10:40:55 +0530
Message-ID: <20250425051055.2393301-3-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425051055.2393301-1-c-vankar@ti.com>
References: <20250425051055.2393301-1-c-vankar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Ethernet boot requires CPSW nodes to be present starting from R5 SPL
stage. Add bootph-all property to required nodes to enable Ethernet boot
for AM62P5-SK and J722S-EVM.

Reviewed-by: Roger Quadros <rogerq@kernel.org>
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

Link to v2:
https://lore.kernel.org/r/20250302153502.181832-3-c-vankar@ti.com/

Changes from v2 to v3:
- No changes.

 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 +++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                | 2 ++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts                | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 7b65538110e8..11f484f88603 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -50,6 +50,7 @@ phy_gmii_sel: phy@4044 {
 			compatible = "ti,am654-phy-gmii-sel";
 			reg = <0x4044 0x8>;
 			#phy-cells = <1>;
+			bootph-all;
 		};
 
 		epwm_tbclk: clock-controller@4130 {
@@ -730,6 +731,7 @@ cpsw_port1: port@1 {
 				mac-address = [00 00 00 00 00 00];
 				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
 				status = "disabled";
+				bootph-all;
 			};
 
 			cpsw_port2: port@2 {
@@ -751,6 +753,7 @@ cpsw3g_mdio: mdio@f00 {
 			clock-names = "fck";
 			bus_freq = <1000000>;
 			status = "disabled";
+			bootph-all;
 		};
 
 		cpts@3d000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index d29f524600af..5b2f0945a9eb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -227,6 +227,7 @@ main_mdio1_pins_default: main-mdio1-default-pins {
 			AM62PX_IOPAD(0x0160, PIN_OUTPUT, 0) /* (F17) MDIO0_MDC */
 			AM62PX_IOPAD(0x015c, PIN_INPUT, 0) /* (F16) MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	main_mmc1_pins_default: main-mmc1-default-pins {
@@ -496,6 +497,7 @@ &cpsw3g_mdio {
 
 	cpsw3g_phy0: ethernet-phy@0 {
 		reg = <0>;
+		bootph-all;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 34b9d190800e..93d770c5792e 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -310,6 +310,7 @@ mdio_pins_default: mdio-default-pins {
 			J722S_IOPAD(0x0160, PIN_OUTPUT, 0) /* (AC24) MDIO0_MDC */
 			J722S_IOPAD(0x015c, PIN_INPUT, 0) /* (AD25) MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	ospi0_pins_default: ospi0-default-pins {
@@ -344,6 +345,7 @@ J722S_IOPAD(0x0140, PIN_OUTPUT, 0) /* (AF24) RGMII1_TD3 */
 			J722S_IOPAD(0x0130, PIN_OUTPUT, 0) /* (AG26) RGMII1_TXC */
 			J722S_IOPAD(0x012c, PIN_OUTPUT, 0) /* (AF25) RGMII1_TX_CTL */
 		>;
+		bootph-all;
 	};
 
 	main_usb1_pins_default: main-usb1-default-pins {
@@ -388,6 +390,7 @@ &cpsw3g_mdio {
 
 	cpsw3g_phy0: ethernet-phy@0 {
 		reg = <0>;
+		bootph-all;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
-- 
2.34.1

