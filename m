Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E4622126F;
	Tue,  6 May 2025 04:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507185; cv=none; b=JBw5T7JO6TcyYQEG4eRO8a8XXJZ5MGs0HKHoPchMY6GunzwYOEUDHmpJ+MeB7uVul5ddLvQvoLSh+bTTeog/oA92t32kWYXLpcX/Mnryn8vsat9idYSwTB1/Ulu7FZpgFd9jsK/G3wmleLAyjnNRsnS++3zYpm6l/e1mT0rrnCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507185; c=relaxed/simple;
	bh=5MQABaUjq2rgVHsNY3nE75pZSGIY9PMJTPz1I4gcB3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JO0Qfy/MN0SazE+o40N2VU3/EHIeuQ3Iv/fG48/3fz9RoEz7qhWq0EmJ/9oVHgKW72x/imQlpRHnMzo+wJ03yolnmE4bt6Mo09rXm1drE3jQK2EjrafK5RlX91IWYNzTv7hC/bhTuTmd2V7ODLW+L60u+nJRSzeelVOOnJYt//0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=B9mQhQE5; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B9mQhQE5"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5464qaXZ432003
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 23:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746507156;
	bh=rJOn37yRDbTPe5b/0F9se2Ztdw3k1VMDaIj9PshkTME=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=B9mQhQE5BO9YvihGpNsZEaWcp5OxQS1mYV1296/wdxkheMyWVS8mLtlUGeYKHDRkZ
	 jGDXKE9QcN2gxtyfMzEHRGKbIvJ1qMQdItpnljQf2VSr5BnHkF4Y2W5CbQbRaSw7ev
	 Nw3NBS4x5UWDILdYwWoW6sE4Yu4cf9YDBn/TKD6c=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5464qaGa100682
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 23:52:36 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 23:52:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 23:52:35 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5464qPcU069139;
	Mon, 5 May 2025 23:52:31 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <r-donadkar@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies for OV5640
Date: Tue, 6 May 2025 10:22:24 +0530
Message-ID: <20250506045225.1246873-2-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506045225.1246873-1-r-donadkar@ti.com>
References: <20250506045225.1246873-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The device tree overlay for OV5640 requires following voltage
supplies:

AVDD-supply: Analog voltage supply, 2.8 volts
DOVDD-supply: Digital I/O voltage supply, 1.8 volts
DVDD-supply: Digital core voltage supply, 1.5 volts

Add them in the overlay.

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../ti/k3-am625-beagleplay-csi2-ov5640.dtso   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtso
index 3b4643b7d19c9..000305c9e3662 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtso
@@ -15,6 +15,33 @@ clk_ov5640_fixed: ov5640-xclk {
 		#clock-cells = <0>;
 		clock-frequency = <12000000>;
 	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p5v: regulator-1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P5V";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
 };
 
 &main_gpio0 {
@@ -39,6 +66,10 @@ ov5640: camera@3c {
 		clocks = <&clk_ov5640_fixed>;
 		clock-names = "xclk";
 
+		AVDD-supply = <&reg_2p8v>;
+		DOVDD-supply = <&reg_1p8v>;
+		DVDD-supply = <&reg_1p5v>;
+
 		port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2rx0_in_sensor>;
-- 
2.34.1

