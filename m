Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8DF298CD2;
	Fri, 11 Apr 2025 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368749; cv=none; b=DEp1tb0xQB5tR97XiZveqG42FoNrjxKUu9QlmaH0dCkCcINraEvKnApY3HzMtogDuawhf2VSgglSdmf/KCW+10kARU2jP9tqOmwhsWkouQmGpTukCv/tHuvGHOCRAfxqEL5H8S1B8F/12v5BaqAkC0sECoIE0N/edygRlJX3qOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368749; c=relaxed/simple;
	bh=CA9f6uG5e1L00xTZqKrQK4QGKvscDkYS7Y2BVR35qEk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rKws0hmGp24IJKT0/5ZgXs9ajOc/ogJb5H9U9THweemM3axXH3fplcjKK2FYsTS/11u2AfuBeRVjww+aiNxLugag76YXF8guiSgsbjvDi0Oj+7CpWnhifHHBYTEgWpAI7v8u6WkjCQkD0fFnBjO3h8P4ZUbrwvLtWpGdvsb0hlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VJpu9zT3; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VJpu9zT3"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BAqBbw1419998
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744368731;
	bh=5vDmJxWuHoUIeDIDNdZ4MMxNukdrL5wS55g9tJpGWw0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VJpu9zT3jl1mZ4xNlWu08aRM/uh/AOkG7iekcTuKhR9OfhrkdS6wT+FnceiAJUbMS
	 ZJbFazVzpSXiWb/ZG/A+RzYvnGx6EA9b/SFbJcAKJaXQApdjqlU4+RZq/+qBiLnWTI
	 CCti3R7lt/nGFAyXzWLSdkckd20ff6EF8Kdx+L+8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BAqB2e011658
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 05:52:11 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 05:52:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 05:52:10 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BAq9Fj046776;
	Fri, 11 Apr 2025 05:52:10 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 7/7] arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0
Date: Fri, 11 Apr 2025 16:21:55 +0530
Message-ID: <20250411105155.303657-8-j-choudhary@ti.com>
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

Enable DSI support for AM68-SK platform.

Add DT node for DSI2eDP bridge. The DSI to eDP bridge is sn65dsi86
on the board.

Add the endpoint nodes to describe connection from:
DSS => DSI => SN65DSI86 bridge => DisplayPort-0

Set status for all required nodes for DisplayPort-0 as 'okay'.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../boot/dts/ti/k3-am68-sk-base-board.dts     | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 11522b36e0ce..df54de2d8236 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -124,6 +124,35 @@ transceiver4: can-phy3 {
 		max-bitrate = <5000000>;
 	};
 
+	edp0_refclk: clock-edp0-refclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <19200000>;
+	};
+
+	dp0_pwr_3v3: fixedregulator-dp0-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "dp0-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&exp2 2 GPIO_ACTIVE_HIGH>;     /*P0 - DP0_3V3 _EN */
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	dp0: dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+		dp-pwr-supply = <&dp0_pwr_3v3>;
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&dp0_out>;
+			};
+		};
+	};
+
 	connector-hdmi {
 		compatible = "hdmi-connector";
 		label = "hdmi";
@@ -594,6 +623,39 @@ exp2: gpio@20 {
 		gpio-line-names = "HDMI_PDn","HDMI_LS_OE",
 				  "DP0_3V3_EN","eDP_ENABLE";
 	};
+
+	dsi_edp_bridge: dsi-edp-bridge@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+		clock-names = "refclk";
+		clocks = <&edp0_refclk>;
+		enable-gpios = <&exp2 3 GPIO_ACTIVE_HIGH>;
+		vpll-supply = <&vsys_io_1v8>;
+		vccio-supply = <&vsys_io_1v8>;
+		vcca-supply = <&vsys_io_1v2>;
+		vcc-supply = <&vsys_io_1v2>;
+
+		dsi_edp_bridge_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dp0_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dp0_out: endpoint {
+					remote-endpoint = <&dp0_connector_in>;
+				};
+			};
+		};
+	};
 };
 
 &main_sdhci1 {
@@ -688,6 +750,15 @@ dpi_out0: endpoint {
 			remote-endpoint = <&tfp410_in>;
 		};
 	};
+
+	/* DSI */
+	port@2 {
+		reg = <2>;
+
+		dpi0_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
 };
 
 &serdes_ln_ctrl {
@@ -745,3 +816,28 @@ &usb0 {
 	phys = <&serdes0_usb_link>;
 	phy-names = "cdns3,usb3-phy";
 };
+
+&dphy_tx0 {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+};
+
+&dsi0_ports {
+
+	port@0 {
+		reg = <0>;
+		dsi0_out: endpoint {
+			remote-endpoint = <&dp0_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi0_out>;
+		};
+	};
+};
-- 
2.34.1

