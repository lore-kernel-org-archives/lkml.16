Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C82526772A;
	Fri,  2 May 2025 16:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203182; cv=none; b=QOx0A87YO5p2jM9Ss9wUkcRgrntQUVypwtpiViLwu5FtdvjijFxPkWRq9YXwUIkcF8/RLp1u1EBJDx1jRd6VYnZx+IKpVCdU6EC0r7gxUtTxGB652Nq62TJEFfUKx32o1J9QHm/tT432l7E2R1o5iawpYV1mhghHKsMu84vj1gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203182; c=relaxed/simple;
	bh=QylBnlgHnGfVEutJuWqfV07AbfoifMMiy9mc+lSQ1HE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V0MN2ATWP8YhXtmMVSmIrN8V2sjuB3jOe1pB7anJVIED0wuTRr3AlrVlM2AOotyk5nu2V5unqr0bsXPpXXEDyZ2P+ecHSmuLZB7RWqhbOvWsLpwB2jfsZFsd+jdeYpsqaknSDeq+F7dauEswQVtUAcCvDMPCmtdRg7SB/CoqOpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=J8P9NANC; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J8P9NANC"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPu7m268300
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746203156;
	bh=36Kf5XVejWF+uquKt22aS/Ci0ZPLGS0PETWsE7ZHJ78=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J8P9NANCBqGGLQlkpqzyu6W9XUJkIKUF3tYS7r7w0TIgvtA93heBpFW9eXKseXYLF
	 bWyDhuA95TrSHYamEmsE7J9b8PEnZGSc0sFn7wIENp+uz+Lra4SnfmqVPd7U+Zaa2c
	 3ATCg2ivfKINWztVQQGbZUPKlvBvvGZmVXhX9d0M=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPus6118985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:25:56 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:25:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:25:56 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542GPex8028994;
	Fri, 2 May 2025 11:25:51 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v2 2/4] arm64: dts: ti: k3-am62x: Add required voltage supplies for IMX219
Date: Fri, 2 May 2025 21:55:37 +0530
Message-ID: <20250502162539.322091-3-r-donadkar@ti.com>
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

The device tree overlay for the IMX219 sensor requires three voltage
supplies to be defined: VANA (analog), VDIG (digital core), and VDDL
(digital I/O) [1].

Add the corresponding voltage supply definitions in the overlay so
that the same topography as dt-bindings is present in the DT overlay.

Link: https://datasheets.raspberrypi.com/camera/camera-module-2-schematics.pdf [1]
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
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

