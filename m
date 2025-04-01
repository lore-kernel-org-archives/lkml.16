Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B3C1FDE07;
	Tue,  1 Apr 2025 11:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507703; cv=none; b=ukGnetJgiVfedc2I8pzOZCaMQPhKUlmBtfcw5O+GOfNhPORCo403mV5u6e758BxNUk8wvOBDTWcuGhDuJzhLwJj4LmpfODEo8YM8dBdBTyQxZDP3ZN8t9vUXgFJCnZKxiuwkeVqJemdC5QKTaU1QhOvypJ97sm3ACKNjpbJeWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507703; c=relaxed/simple;
	bh=mFxbcEcJK5mXXrxhzDFdtvBmv9WiV780Rfpl/cehQZk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UcHT0bmrLhc0adFXX9RtoyhFv0FEHlCy1BOILpAgrSD0O2HBNkrl14DRsDs+I1Z7FHrNxTXbPwYu+RNK6zdhI59ZOLGquwCLrBD454REIsnLql5g1Q0/zCltlbLLOlfgeoA+2/KhpE0mge1m1mYxgm9RVvBkvRV1acCPOLpBbn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PE5Q8jaG; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PE5Q8jaG"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531BfIS42944054
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 1 Apr 2025 06:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743507678;
	bh=TLGX6SQ0Fayxabbc/NePJCcKcTirZ+RKWJn3EJSTPRQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PE5Q8jaGXz7n8XHqsa7IWy2FQUTZ6SGjYvt7NODv0Ww7svX97wxf/Gd/H0tLAIPSq
	 /JXa7KSotGO20Z0dclMCpTwRzUk+7ZvvmObiZbjP/fOCjQ5NHfNF/ykbOUCJf/nJ+O
	 tSL5nH2yuKwcrN+9sbdN6bJ9vqaxd6/P0F+OZhfQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531BfInt020967;
	Tue, 1 Apr 2025 06:41:18 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 06:41:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 06:41:17 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531Bevm3099961;
	Tue, 1 Apr 2025 06:41:14 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH 3/5] arm64: dts: ti: k3-j721e-sk: Fix dtbs_check warnings in IMX219 overlay
Date: Tue, 1 Apr 2025 17:10:51 +0530
Message-ID: <20250401114053.229534-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401114053.229534-1-y-abhilashchandra@ti.com>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The device tree bindings mandate three regulator nodes for the IMX219
sensor: VANA (analog), VDIG (digital core), and VDDL (digital I/O). Add the
necessary regulator nodes in the device tree overlay and also the device
tree bindings do not include a clock-names property. Remove the incorrectly
added clock-names entry to avoid dtbs_check warnings.

Fixes: f767eb918096 ("arm64: dts: ti: k3-j721e-sk: Add overlay for IMX219")
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 .../dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  | 35 +++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
index 47bb5480b5b0..4eb3cffab032 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
@@ -19,6 +19,33 @@ clk_imx219_fixed: imx219-xclk {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vdd_sd_dv>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_sd_dv>;
+		regulator-always-on;
+	};
+
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vdd_sd_dv>;
+		regulator-always-on;
+	};
 };
 
 &csi_mux {
@@ -34,7 +61,9 @@ imx219_0: imx219-0@10 {
 		reg = <0x10>;
 
 		clocks = <&clk_imx219_fixed>;
-		clock-names = "xclk";
+		VANA-supply = <&reg_2p8v>;
+		VDIG-supply = <&reg_1p8v>;
+		VDDL-supply = <&reg_1p2v>;
 
 		port {
 			csi2_cam0: endpoint {
@@ -56,7 +85,9 @@ imx219_1: imx219-1@10 {
 		reg = <0x10>;
 
 		clocks = <&clk_imx219_fixed>;
-		clock-names = "xclk";
+		VANA-supply = <&reg_2p8v>;
+		VDIG-supply = <&reg_1p8v>;
+		VDDL-supply = <&reg_1p2v>;
 
 		port {
 			csi2_cam1: endpoint {
-- 
2.34.1

