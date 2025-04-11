Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E9C298990;
	Fri, 11 Apr 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368736; cv=none; b=FLEGbDXCRvQq9MWqRgTFlxd+lb5aU45+fMPJ3MwmJxzY6loYf+5Dzeun1BQwiXQmjU0dF8Hrea4B0BKtmMe3frBfeex/petFvHj4zDnYUDy7aGpdrgJG9DiRfmortbjVQQw7JEnumKtp8+tXJu4xQYD7YnxiZ1MKg173kHkSg+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368736; c=relaxed/simple;
	bh=kKtwdSEtrzdq0JYEoU19r51JwWDvmF8Tm9qKOvHrmHk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gApieS8eENW6e6nvCxqYDyPtBVXHSAkCmfrDcKxtR0TOTnF141DzhsReaLD5LB980z/ck2ft3WTyf2UfFhWE9p8AdJ7BhRssrmTMb/HZEJIlUrecKntWGkaiO2f/GYTOjO0tXh8cJ0+exXjuPyxcVCvtWfEE24eKpKkySkk9ctE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YcMai6it; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YcMai6it"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BAq9IG1549508
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744368729;
	bh=NlSN/BKsvrONUwqTOlmGVRphxQpxVka8hmhvEVj/oew=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YcMai6itwSqi04uYslC4uaUSGZR5Qq8QJUpEOgni2pdnfgOoacwBenDjmDB78dnZx
	 +Z9vQnEFmEGOs4PwE2UoOekpeKfvD+VkQQoo7KtMPvabYekVs36Qx1x+hI2c8AoqAo
	 qjXeVBsCLORMJhwwUbaF5WGtdNyo/oI8nLQwkX24=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BAq9Hs010749
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 05:52:09 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 05:52:08 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 05:52:08 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BAq7lT030192;
	Fri, 11 Apr 2025 05:52:08 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 6/7] arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
Date: Fri, 11 Apr 2025 16:21:54 +0530
Message-ID: <20250411105155.303657-7-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411105155.303657-1-j-choudhary@ti.com>
References: <20250411105155.303657-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Enable DSI display for J721S2 EVM.

Add the endpoint nodes to describe connection from:
DSS => DSI Bridge => DSI to eDP bridge => DisplayPort-1

Set status for all required nodes for DisplayPort-1 as 'okay'.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../dts/ti/k3-j721s2-common-proc-board.dts    | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index f691ae4c19e6..15a7d9b813d3 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -93,6 +93,29 @@ vdd_sd_dv: gpio-regulator-TLV71033 {
 			 <3300000 0x1>;
 	};
 
+	dp1_pwr_3v3: regulator-dp1-prw {
+		compatible = "regulator-fixed";
+		regulator-name = "dp1-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&exp4 1 GPIO_ACTIVE_HIGH>; /* P1 - DP1_PWR_SW_EN */
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	dp1: connector-dp1 {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "full-size";
+		dp-pwr-supply = <&dp1_pwr_3v3>;
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&dp1_out>;
+			};
+		};
+	};
+
 	transceiver1: can-phy1 {
 		compatible = "ti,tcan1043";
 		#phy-cells = <0>;
@@ -560,3 +583,75 @@ &main_mcan5 {
 	pinctrl-0 = <&main_mcan5_pins_default>;
 	phys = <&transceiver4>;
 };
+
+&dss {
+	/*
+	 * These clock assignments are chosen to enable the following outputs:
+	 *
+	 * VP0 - DisplayPort SST
+	 * VP1 - DPI0
+	 * VP2 - DSI
+	 * VP3 - DPI1
+	 */
+	status = "okay";
+	assigned-clocks = <&k3_clks 158 2>,
+			  <&k3_clks 158 5>,
+			  <&k3_clks 158 14>,
+			  <&k3_clks 158 18>;
+	assigned-clock-parents = <&k3_clks 158 3>,
+				 <&k3_clks 158 7>,
+				 <&k3_clks 158 16>,
+				 <&k3_clks 158 22>;
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@2 {
+		reg = <2>;
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
+};
+
+&dsi0_ports {
+	port@0 {
+		reg = <0>;
+		dsi0_out: endpoint {
+			remote-endpoint = <&dp1_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi2_out>;
+		};
+	};
+};
+
+&dsi_edp_bridge_ports {
+	port@0 {
+		reg = <0>;
+		dp1_in: endpoint {
+			remote-endpoint = <&dsi0_out>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dp1_out: endpoint {
+			remote-endpoint = <&dp1_connector_in>;
+		};
+	};
+};
+
+&dphy_tx0 {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+};
-- 
2.34.1

