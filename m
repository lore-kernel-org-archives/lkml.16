Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208EC238C00;
	Fri, 11 Apr 2025 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368745; cv=none; b=YFlTfEOYuOhHxN0j4pVC1T71fubd04NDZsZmXODKR1n5ttI6Zj46sIxUKVYkbh/+R3tMpqjrVSyF9mUu95Zx29j2OrcC6bm4pBld4UpS2JeH+YlW9lmVbSkR3zpry8dfVrUw/PDMrbQ3Na8lmpH0ztPlGw2BNhZWNX0w9X3TGig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368745; c=relaxed/simple;
	bh=L2PThh7PZNkcbYB/OIWnXzVAMGF0OXQyZG/kC/PKKVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bm3GtMoRv3XBHkYEUsyGySyS+KEvsaK0awsDgklr2jn5fowKB4ZwreevRNW8RNGDx5MWfkKQSqN5FuDwji4NyiP85lYqusrmUqF9HjaIz4iYWjmb2Z4hHn+mBIwH17RdrH79f15xVsCD8QFmOO93WmKOl/4g/rQEyHuHUF1Vb/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=usak/lfN; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="usak/lfN"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BAq7pq1419992
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744368727;
	bh=clvvleoLHP626PSlzlzVO7YGDPkEhF6mXc6EuaQnEb4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=usak/lfNqi0nVeSpD7wosn8T5MuA+tP36Zjs2KunS0ND4Yj3EJG6AH26V9dmHlFfL
	 qjpby0OO1M49uquQbBTFioWAwPRpwOhEawk2QEgGqE3h/MXJLRqWLE7pNzh1txX4bC
	 sWey83b2fuVKRnvTENuPikcLRTEoIKStkcmINuOw=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BAq7VA010728
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 05:52:07 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 05:52:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 05:52:06 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BAq54D030155;
	Fri, 11 Apr 2025 05:52:06 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 5/7] arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP
Date: Fri, 11 Apr 2025 16:21:53 +0530
Message-ID: <20250411105155.303657-6-j-choudhary@ti.com>
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

From: Rahul T R <r-ravikumar@ti.com>

Add DT nodes for DSI to eDP bridge. The DSI to eDP
bridge is SN65DSI86 on SOM.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index 6adb2bbe4066..421c1468ba90 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -160,6 +160,30 @@ transceiver0: can-phy0 {
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
@@ -638,3 +662,31 @@ &c71_1 {
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

