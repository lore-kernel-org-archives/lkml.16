Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9219C25A322;
	Tue, 24 Jun 2025 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753597; cv=none; b=seSG8PGj4tOz/SjkQcRLKEJLbBVcH0u+6am+CqCC9bITAsNg8SBwHWRYpH9CqvOFgVqZvmVQWZtsq+NlBwZXjojS77dRjLzwClE9kRlk6GKATWHQzrop9FLDodUM3x/9tZzPYyFis0WmTO6s1Kj1Zk0JCjck99MLI7wXw3LAoTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753597; c=relaxed/simple;
	bh=A3l7R0IWVrAHMhZMau3Hjy1DgtsbcH0K28G/2X6Obkw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e3LQemYZI5peSSRXr7c97duwtdheFm54kMXzAnbhzj3eEv0f3sdloAAujgMT8jJI3nm3wyWLCQFph9Y9cQvLGXIsrJOl/erYB2pHGOzuAQ7gJ1phQ+ptHzbfWcuEGXy6s2wjaUZ0N2i5EY1u0L6+w1mub0gUTh9FMDaPe3mJs9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O09GFdJg; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O09GFdJg"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O8QUDV1822889;
	Tue, 24 Jun 2025 03:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750753590;
	bh=7KzJ5Qco/8YjiW625uFztCg7U/MXSrARbViW0C4Ef1s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=O09GFdJgi6MIPsLNTGPYiYbE1NhmldZKW4FI6cXP+GEvU+rDM9iZSDvGVrFdO4nmd
	 OIi3v/9r5dcNEinPtb/tUh7FILQ6j/k/gLfV2kQ4YfuazceaoC0MzSeoPz1vSwiChH
	 BvLD2ztBPjdhWh8J4OaXYODjj2i9ivZHSDCqpBs4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O8QTUQ4039832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 03:26:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 03:26:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 03:26:29 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O8QSmZ1448045;
	Tue, 24 Jun 2025 03:26:29 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 5/7] arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP
Date: Tue, 24 Jun 2025 13:56:17 +0530
Message-ID: <20250624082619.324851-6-j-choudhary@ti.com>
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

Add DT nodes for DSI to eDP bridge. The DSI to eDP
bridge is SN65DSI86 on SOM.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index 54fc5c4f8c3f..b4fc669a36ae 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -152,6 +152,30 @@ transceiver0: can-phy0 {
 		#phy-cells = <0>;
 		max-bitrate = <5000000>;
 	};
+
+	vsys_io_1v8: regulator-vsys-io-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_io_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vsys_io_1v2: regulator-vsys-io-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_io_1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	edp1_refclk: clock-edp1-refclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <19200000>;
+	};
 };
 
 &wkup_pmx0 {
@@ -630,3 +654,31 @@ &c71_1 {
 	memory-region = <&c71_1_dma_memory_region>,
 			<&c71_1_memory_region>;
 };
+
+&main_i2c4 {
+	dsi_edp_bridge: dsi-edp-bridge@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+
+		clock-names = "refclk";
+		clocks = <&edp1_refclk>;
+
+		enable-gpios = <&exp_som 5 0>;
+
+		vpll-supply = <&vsys_io_1v8>;
+		vccio-supply = <&vsys_io_1v8>;
+		vcca-supply = <&vsys_io_1v2>;
+		vcc-supply = <&vsys_io_1v2>;
+
+		dsi_edp_bridge_ports: ports {
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
+};
-- 
2.34.1

