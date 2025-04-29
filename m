Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733021ADC2;
	Tue, 29 Apr 2025 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941322; cv=none; b=j7DGd7wGpsgMieTC9ZcaUSAK3Ohg9yn4px8EDCQ71NMPLgKLgase3Ysbm2TFf8rBeejwFMCYpr1wMitLhE3euNtsFSrWE6fKO3HaI8nj96HiMlAmmx+WYOawEm6CImHP4hv07Aw0tRGTdbGHm09yvH4OyfL5IvBzZN9g/DwbDVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941322; c=relaxed/simple;
	bh=dsii4oi3H46e0QZ7ppmuIIVNb+nc35GjgaQSU1WGPy0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CIrkS585GAEfWDXQXh3/jeqKpSrQyM9RQlP20hn5mXl/suz5FOSDdgONkLeFKSTG1WP1weBbelUCpqoECzLYD6t2CztnNb87/7U2e4PNwZ2EwalP0k4MUTkroydwkutVffaR+1y2VFuuUNJsvQ3Wh4GOd2LgWswQTQ9QCccqDfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yA5Esrqc; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yA5Esrqc"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFfnMl3882267
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745941309;
	bh=9djZgw6Hj9gUyVv79ArAsFuTfqHYi4Rxedw6oJnHtNY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yA5Esrqc4sv17iUK44Pbns/57RK0u/2WJ8w9TD4enrHUlV387QyPlaoYkMJ5ED8se
	 wdrFUCET06nVSySIK5zD/FfZMPIcdaojI4VYJdtx7EN44U6HfB1Oles26DRTPHuxaZ
	 HUZpB3uzQb9okE+fOeZ6TL3QCQvrlWnBAIiZqnAM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFfnGd111701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 10:41:49 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 10:41:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 10:41:49 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TFfXVr030051;
	Tue, 29 Apr 2025 10:41:44 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v1 2/4] arm64: dts: ti: k3-am62x: Add required voltage supplies for IMX219
Date: Tue, 29 Apr 2025 21:11:31 +0530
Message-ID: <20250429154133.3377962-3-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429154133.3377962-1-r-donadkar@ti.com>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The device tree overlay for the IMX219 sensor requires three voltage
supplies to be defined: VANA (analog), VDIG (digital core), and VDDL
(digital I/O).

Add the corresponding voltage supply definitions to avoid dtbs_check
warnings.

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
index dd090813a32d6..149c59c071823 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
@@ -15,6 +15,33 @@ clk_imx219_fixed: imx219-xclk {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+	};
+
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+	};
 };
 
 &main_i2c2 {
@@ -40,6 +67,10 @@ ov5640: camera@10 {
 
 				clocks = <&clk_imx219_fixed>;
 
+				VANA-supply = <&reg_2p8v>;
+				VDIG-supply = <&reg_1p8v>;
+				VDDL-supply = <&reg_1p2v>;
+
 				reset-gpios = <&exp1 13 GPIO_ACTIVE_HIGH>;
 
 				port {
-- 
2.34.1

