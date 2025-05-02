Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956A82609F7;
	Fri,  2 May 2025 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203178; cv=none; b=movj9e15uMjscOe1VdpYjGnFo8/hyGYL3xfKteF5RJcRFvZ+UxfL/+p34oTTkx61SpPwmM8bfMz0dAnT5cLHO8njNZJl4qjKkz9kbgB8Mq2LLLOB3QAjOEzPxv9yzSSWDP//KkgwCkDlBfd09sGDRWvE0PQXhCWpr/mIIW+P8co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203178; c=relaxed/simple;
	bh=4iNIEE4y/RQ1nYh8BrYUSolMwW26mY5tQJXNooGYbEU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FR12OzM0Xp8omOY/Cb1b3xwRbQawkUt7BNXg9riGfPz1aUxD4FFxf488nYp+9JN25++i5DofbrjGCSpCEBRXzn8WR2+tr9px7aNsLbPHuBjRo+ESbUvcbRCB7nuNtHKO3f91QsKGJr8GRSm7enTQ+DMVj6B6WllyYsIL/yIoqCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wGI3abTR; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wGI3abTR"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542GQ6C8448894
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746203166;
	bh=Of8g9618ZH89TKBMPSTzOkja8KKZL8ustRn0kzQjYOk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wGI3abTR6DKUQtt4nY2aOSJN/ERwB1KBUFTS1GQ4km61wcjfW5Z+pY4OnQ5q+RHr5
	 rFO2X68plwNxfMS1OHCOdr4s+X0xHeHlBuzh1yYjtJxEpLDDiB6NbzejFT3PPtblQb
	 6K1PWJlN26uLLtEjXeF7GpqE+1l3rx7r16NPQAnc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542GQ63b031257
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:26:06 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:26:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:26:05 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542GPexA028994;
	Fri, 2 May 2025 11:26:01 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v2 4/4] arm64: dts: ti: k3-am62x: Add required voltage supplies for TEVI-OV5640
Date: Fri, 2 May 2025 21:55:39 +0530
Message-ID: <20250502162539.322091-5-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502162539.322091-1-r-donadkar@ti.com>
References: <20250502162539.322091-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The device tree overlay for TEVI-OV5640 requires following voltage
supplies as mentioned in the power section [1]

AVDD-supply: Analog voltage supply, 2.8 volts
DOVDD-supply: Digital I/O voltage supply, 1.8 volts
DVDD-supply: Digital core voltage supply, 3.3 volts

Add them in the DT overlay.

Link: https://www.technexion.com/wp-content/uploads/2023/09/product-brief_tevi-ov5640.pdf
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
index b6bfdfbbdd984..fe3bc29632fa9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
@@ -15,6 +15,33 @@ clk_ov5640_fixed: ov5640-xclk {
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
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+	};
 };
 
 &main_i2c2 {
@@ -40,6 +67,11 @@ ov5640: camera@3c {
 
 				clocks = <&clk_ov5640_fixed>;
 				clock-names = "xclk";
+
+				AVDD-supply = <&reg_2p8v>;
+				DOVDD-supply = <&reg_1p8v>;
+				DVDD-supply = <&reg_3p3v>;
+
 				powerdown-gpios = <&exp1 13 GPIO_ACTIVE_LOW>;
 
 				port {
-- 
2.34.1

