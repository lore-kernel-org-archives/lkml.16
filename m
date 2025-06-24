Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C436C258CE7;
	Tue, 24 Jun 2025 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753593; cv=none; b=dqoJ1aexSPj55Yuc46Vaukldav/TzvLHhYyZWsosfgg6QNEC9H1teMEN8HJ4lUxa+5oz/+9yMDCpOONDtfkNljRTtZIhTTAilD1GJqvx0vo2EJDnZFHX5rbwdkeLiFZgaabx0ssNF8JhTSjgvClAz53QHHAFajV4L6D+KS6QJG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753593; c=relaxed/simple;
	bh=QRgX+NJ29rb6ZeO5bC+li4IIT4vc4Yswth1i3Citlic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CuoQY7RG35OlWEHQdu3oOrnH+wSCJJJRsajJPggSt78rN+zfd7+A+dA0NTw/mf8KF2T9/JpIWVIG6L7S/BS7QuqbSzlZBsmMUgtVobLOCnoh/6WytJvNakd0vSRM+UTObC9mHQFwA90IWfXiLJwBQvRrwub6PgYwaI1A6IdjB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FaKz7vu7; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FaKz7vu7"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O8QQ6l1822877;
	Tue, 24 Jun 2025 03:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750753587;
	bh=Hvp7xqhrJ8j09Apo35riMe04jFx18ro7DAZaWEWXE64=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FaKz7vu7Z0Iw/BPAs6Sbjn3LrXN44kbQm0FCTQDv+rWM3CAEeWzYHnkUtG7+iFsQ5
	 vSYDNXvEVNpPcEmiZyHlGOEDaKCVfN5WSKapWti8PkQgE+cq7V7WobAAigoP1GwHsU
	 FdlikZT6AaFdXort1WRpOMThh30UlRdJEDAocfUE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O8QQvt100529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 03:26:26 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 03:26:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 03:26:26 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O8QPxj1447994;
	Tue, 24 Jun 2025 03:26:26 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 3/7] arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
Date: Tue, 24 Jun 2025 13:56:15 +0530
Message-ID: <20250624082619.324851-4-j-choudhary@ti.com>
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

From: Rahul T R <r-ravikumar@ti.com>

Add DT nodes for DPI to DSI Bridge and DSI Phy.
The DSI bridge is Cadence DSI and the PHY is a
Cadence DPHY with TI wrapper.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
[j-choudhary@ti.com: disable dsi and dphy nodes, rename dphy node]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 83cf0adb2cb7..e17fffc36248 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1795,6 +1795,43 @@ main_spi7: spi@2170000 {
 		status = "disabled";
 	};
 
+	dphy_tx0: phy@4480000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x0 0x04480000 0x0 0x1000>;
+		clocks = <&k3_clks 363 8>, <&k3_clks 363 14>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 363 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 363 14>;
+		assigned-clock-parents = <&k3_clks 363 15>;
+		assigned-clock-rates = <19200000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@4800000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
+		clocks = <&k3_clks 154 4>, <&k3_clks 154 1>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 154 TI_SCI_PD_EXCLUSIVE>;
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
 	dss: dss@4a00000 {
 		compatible = "ti,j721e-dss";
 		reg = <0x00 0x04a00000 0x00 0x10000>, /* common_m */
-- 
2.34.1

