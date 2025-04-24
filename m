Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228819CCEA;
	Thu, 24 Apr 2025 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481822; cv=none; b=nEXwQTJIxtTG2Z/U2xJi7ER9cRJWNTV/AsGNqmQUw3e5VMWzcokZQDAIPRiB2blRlvz56F47o/6iPWy+lQozPK6cI4BxrXIA6SUZBw73Ev1Ql5/NwFU/EmWq58iClt2ioP6k3smPvzY0vDd0oav6yYa8lqXP58BBSfRgh9hba2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481822; c=relaxed/simple;
	bh=UuwUPwUSTGYxPTu1YkffEmfzAPXQ8DoDae6O5xuiLUw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b4js/icL+zbrvmvEccRj58RXpLwiSMs3/5SNbVKTRwdq3mOtpoWS68+SIELfWHLPMpczIfMnNaFuh0y9fbIjU4FCkI7k7slSOo1MS7d1QlnxoPfBHCwMSPcbQBG+qDRHbq5REUIo9O4eTaUxO6fUQ/mFxGCE6rsHeT5TmMAO+rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZH0uz0nq; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZH0uz0nq"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O83VRj2441366
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 03:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745481811;
	bh=L43dQiegPYpneLKcAtCosvHEVIgw9bb5bt2UjeqpDLo=;
	h=From:To:CC:Subject:Date;
	b=ZH0uz0nqyRN67KY2s63FBUrgw2kTt3gc8xVvLa8Nple2ewIcYPCxdF8q9Vv537bPG
	 pBk1dmbqxmGNUJOpIcxu46X1tZOOA8rOngmeglN2mV7nzUxb8BvZMnFyQdmu+RUPFp
	 t+W6zLksx/dv0Kg7VBHQoTGFLQ5QBh1nBwFoH4TY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O83VcK029688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 03:03:31 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 03:03:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 03:03:30 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O83TFc007282;
	Thu, 24 Apr 2025 03:03:30 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board-infotainment: Fix nodes for dtbs warnings
Date: Thu, 24 Apr 2025 13:33:28 +0530
Message-ID: <20250424080328.57671-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Fix hdmi-connector and tfp bridge node as per the bindings,
- remove 'digital' property which is required for DVI connector not HDMI
- Add 'ti,deskew' property which is a required property
- Fix ports property for tfp410 bridge
- Change node names appropriately

Redefine the ports for dss and for k3-j721e-common-proc-board.dts,
add reg property for the port (@0) to get rid of dtbs_warnings in
infotainment overlay when ports for dss are re-defined.

Fixes: 9c0fa304fa56 ("arm64: dts: ti: k3-j721e: Add overlay for J721E Infotainment Expansion Board")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 ...-j721e-common-proc-board-infotainment.dtso | 57 +++++++++++--------
 .../dts/ti/k3-j721e-common-proc-board.dts     |  6 +-
 2 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso
index 65a7e54f0884..e4e5f941f20b 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso
@@ -15,12 +15,11 @@
 #include "k3-pinctrl.h"
 
 &{/} {
-	hdmi-connector {
+	connector-hdmi {
 		compatible = "hdmi-connector";
 		label = "hdmi";
 		type = "a";
 		ddc-i2c-bus = <&main_i2c1>;
-		digital;
 		/* P12 - HDMI_HPD */
 		hpd-gpios = <&exp6 10 GPIO_ACTIVE_HIGH>;
 
@@ -31,28 +30,32 @@ hdmi_connector_in: endpoint {
 		};
 	};
 
-	dvi-bridge {
-		#address-cells = <1>;
-		#size-cells = <0>;
+	bridge-dvi {
 		compatible = "ti,tfp410";
 		/* P10 - HDMI_PDn */
 		powerdown-gpios = <&exp6 8 GPIO_ACTIVE_LOW>;
+		ti,deskew = <0>;
 
-		port@0 {
-			reg = <0>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
 
-			tfp410_in: endpoint {
-				remote-endpoint = <&dpi_out0>;
-				pclk-sample = <1>;
+				tfp410_in: endpoint {
+					remote-endpoint = <&dpi_out0>;
+					pclk-sample = <1>;
+				};
 			};
-		};
 
-		port@1 {
-			reg = <1>;
+			port@1 {
+				reg = <1>;
 
-			tfp410_out: endpoint {
-				remote-endpoint =
-					<&hdmi_connector_in>;
+				tfp410_out: endpoint {
+					remote-endpoint =
+						<&hdmi_connector_in>;
+				};
 			};
 		};
 	};
@@ -148,17 +151,23 @@ p11-hog {
 &dss {
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_vout0_pins_default>;
-};
 
-&dss_ports {
-	#address-cells = <1>;
-	#size-cells = <0>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-	port@1 {
-		reg = <1>;
+		port@0 {
+			reg = <0>;
+			dpi0_out: endpoint {
+				remote-endpoint = <&dp0_in>;
+			};
+		};
 
-		dpi_out0: endpoint {
-			remote-endpoint = <&tfp410_in>;
+		port@1 {
+			reg = <1>;
+			dpi_out0: endpoint {
+				remote-endpoint = <&tfp410_in>;
+			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 4421852161dd..e3d0ef6913b2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -804,7 +804,11 @@ &dss {
 };
 
 &dss_ports {
-	port {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
 		dpi0_out: endpoint {
 			remote-endpoint = <&dp0_in>;
 		};
-- 
2.34.1

