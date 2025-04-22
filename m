Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06820EB;
	Tue, 22 Apr 2025 00:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745280541; cv=none; b=YO570Ezi+nfv1E8fCnAx/KOsS0/u5I/fskE5SC/dmGTBjT9YWCBQWpi6wLGj1tQc1V1P5SeOqhd76Mjl3+odjdXemjRTx1rxxSp03T4UDkI/kniM1RlGwDQ4w9W9gU6zXtvtL4N9J3tAwy95Vwv0LejJhD/sxEg0APpo3MOM13o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745280541; c=relaxed/simple;
	bh=6FOqDjqQLe0jjCIQS9fxjbBOWClLDWKLmzsSSX4yjM8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=md3e+HcE8rvjwU5p5F9u+HY4/OljVY8NMPOX28jMJyesZ75YdvFeGa0YnBWnF8ahlxQpLbQ+cAUyjHfBrvOD1+GkYMlzWYJkkDiGV7PxKnRItpS30urE8UtgBScaOgkUor8BhIAKRs5e8XALWsWKMoXbohKfUt3zKtWMWxQ4qo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=B1n3SKNi; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B1n3SKNi"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qQg1768576
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 19:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745280532;
	bh=WC4b1h4mzn1sPRPaCQpptY6ptDqtgB+E3FgGbeovusw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=B1n3SKNiskwrUCNhiKPqJrayVgWzpuc9rKm7HX2qsxk4Io/hP/CeQ80dCoZdmiwnw
	 T3MchAfGXTwFIM1TD4nXm5YfDumQFBBJlI0TbOrt05TL7i+uqnx5fca0ilBjl+GGrp
	 lvZxi+ofoNFO78ipkhbf8vOCSZADPEAMz88ytmjA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08q6b079766
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 19:08:52 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 19:08:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 19:08:52 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M08pDH065170;
	Mon, 21 Apr 2025 19:08:52 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] arm64: dts: ti: k3-am625-sk: Enable PWM
Date: Mon, 21 Apr 2025 19:08:51 -0500
Message-ID: <20250422000851.4118545-4-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422000851.4118545-1-jm@ti.com>
References: <20250422000851.4118545-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

PWM signals can be routed to the user expansion header on am625
SK and am62 lp sk. Enable eCAP0, eCAP1, eHRPWM1, and route the
output PWM signals to pins on J3 header.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index d52cb2a5a589a..20d1437f253d4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -303,6 +303,25 @@ AM62X_IOPAD(0x074, PIN_OUTPUT, 1) /* (U25) GPMC0_AD14.VOUT0_DATA22 */
 			AM62X_IOPAD(0x078, PIN_OUTPUT, 1) /* (U24) GPMC0_AD15.VOUT0_DATA23 */
 		>;
 	};
+
+	main_ecap0_pins_default: main-ecap0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01b8, PIN_OUTPUT, 3) /* (C13) SPI0_CS1.ECAP0_IN_APWM_OUT */
+		>;
+	};
+
+	main_ecap2_pins_default: main-ecap2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01a4, PIN_OUTPUT, 2) /* (B20) MCASP0_ACLKX.ECAP2_IN_APWM_OUT */
+		>;
+	};
+
+	main_epwm1_pins_default: main-epwm1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x019c, PIN_OUTPUT, 6) /* (B18) MCASP0_AXR1.EHRPWM1_A */
+			AM62X_IOPAD(0x01a0, PIN_OUTPUT, 6) /* (E18) MCASP0_AXR0.EHRPWM1_B */
+		>;
+	};
 };
 
 &mcu_pmx0 {
@@ -560,3 +579,24 @@ &mcu_gpio0 {
 &mcu_gpio_intr {
 	status = "reserved";
 };
+
+&ecap0 {
+	/* P26 of J3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_ecap0_pins_default>;
+	status = "okay";
+};
+
+&ecap2 {
+	/* P11 of J3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_ecap2_pins_default>;
+	status = "okay";
+};
+
+&epwm1 {
+	/* P36/P33 of J3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_epwm1_pins_default>;
+	status = "okay";
+};
-- 
2.49.0

