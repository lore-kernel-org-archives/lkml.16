Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B6725B69E;
	Tue, 24 Jun 2025 08:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753602; cv=none; b=CGQiLnA9obohU47S5nDOemxE18vtfBjcRUgxySc+gvGdaF9sozVVeSG/EL2PPwub/Ac/ag73omgOFrayNBSEqlg03ZEXH8+QrUvdlVDDxgbiRs3Elemnhf7abv12M52VD+SXkBryoeD0dtK7eNDsDB1IrXxYx98DzWsoVmKjd4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753602; c=relaxed/simple;
	bh=6wtA51BHfj1zoQDFIKn8iTKkrIsgpYOYDirF5wXZINs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kn5N1Z902ZpaaFwjnIsGB+XcyQzp9nisKjZHm/eWoS4FekWLbPp7+LkMAA88WMFKTcUNo2FN1YBez7Rtk88I4Mot6N7IGGP0wlGifQLoR8/QiJVA87dVn/vXaKP2+yD10ZOHl+bxMwurDQiyGwUP30C6vnhl96RmEHITmXJlA/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=luz111WH; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="luz111WH"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O8QMfQ1108940;
	Tue, 24 Jun 2025 03:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750753582;
	bh=ARenIHQDE4fGP/l8dHN4HTvBydXiczlX76prE7G/63o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=luz111WHsBLS7m2xm3GyeD1CxhVR7JEdmpm+nK9N5+gY/8GafP3gXmd9/gTjHi5ny
	 oGYSQCmYX2nMGdhKOgoVjUHmcfOhkPfyCC1nlJt51yUZFhiRMmCJA1/M2+yGxEapyd
	 ehOBG8k+UkUri9/KhuCMMQyc8ne47NCPprveLzuM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O8QMPZ1551240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 03:26:22 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 03:26:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 03:26:22 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O8QLTk1183544;
	Tue, 24 Jun 2025 03:26:22 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 1/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
Date: Tue, 24 Jun 2025 13:56:13 +0530
Message-ID: <20250624082619.324851-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624082619.324851-1-j-choudhary@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add DT nodes for DPI to DSI Bridge and DSI Phy.
The DSI bridge is Cadence DSI and the PHY is a
Cadence DPHY with TI wrapper.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 363d68fec387..2413c4913a8b 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2517,6 +2517,43 @@ watchdog18: watchdog@2550000 {
 		status = "reserved";
 	};
 
+	dphy_tx0: phy@4480000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x0 0x04480000 0x0 0x1000>;
+		clocks = <&k3_clks 402 20>, <&k3_clks 402 3>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 402 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 402 3>;
+		assigned-clock-parents = <&k3_clks 402 4>;
+		assigned-clock-rates = <19200000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@4800000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
+		clocks = <&k3_clks 215 2>, <&k3_clks 215 5>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 215 TI_SCI_PD_EXCLUSIVE>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+			};
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	mhdp: bridge@a000000 {
 		compatible = "ti,j721e-mhdp8546";
 		reg = <0x0 0xa000000 0x0 0x30a00>,
-- 
2.34.1

