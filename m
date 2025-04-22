Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44646376;
	Tue, 22 Apr 2025 00:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745280540; cv=none; b=PFe5E25qYvVffZF7st8/r1jumookwPztqynjUIZiHYKHv5ZcxbFCzkJDNBkBFhxDikZvJcSH8oLX158WVQrm/eaFThLFCnfstmZG86L5hlmmo++b6Co7kN3FOeSQtyEi8bFIoGKB95fgtcwUMovr4T2OIIpG1rwLSSl5TyzIK8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745280540; c=relaxed/simple;
	bh=BFI/FSyboXP4auv7wZLDW7xyGGcH/3lTPe/OiPyJwzQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QySB5tXgjocjgeJiT0uhz5E0c0gzHg7txNsuSAGe0lZYPP06AyFXrpGQ+XDykvOFMiO/jbf2ut2+w3rmluarr6eBN2hZLq4P63Xa15MfETwgBRrcIPUcwbSfr6C5bpWlGVdNf/dvtOjwgiqearGJlaOxjodZO3Iy50T2a2w8evY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dOEAwwm7; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dOEAwwm7"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qtt1058479
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 19:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745280532;
	bh=hFtrVBd/IPHzLs98dvYRdlS9honVwwUUU/xr84MDx3c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dOEAwwm7Yfp4h5yaC3HOFLiowvRxBRO/H+f8UU8kSRyc92VV6rG+CZg2WvHUlSByr
	 ackjZI0qqbBWrheNu9XYJuqJ8n5Rl7KkyFL43ruXPNfmgt9zBNuvMb3KqcAX/5aOYy
	 eLc6Mq+NhEX8175bmIVpZMPFEwsBVWuNKZUOleVE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qj2102107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 19:08:52 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 19:08:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 19:08:52 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M08pDF065170;
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
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62p5-sk: Enable PWM
Date: Mon, 21 Apr 2025 19:08:49 -0500
Message-ID: <20250422000851.4118545-2-jm@ti.com>
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

PWM signals can be routed to the user expansion header on am62p5
SK. Enable eCAP0, eCAP1, eHRPWM0, eHRPWM1 and route the output PWM
signals to pins on J4 header.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index d29f524600af0..c2f55cc5a8ebc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -356,6 +356,32 @@ wlan_en_pins_default: wlan-en-default-pins {
 			AM62PX_IOPAD(0x0124, PIN_INPUT, 7) /* (J25) MMC2_SDCD.GPIO0_71 */
 		>;
 	};
+
+	main_ecap1_pins_default: main-ecap1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x019c, PIN_OUTPUT, 2) /* (E24) MCASP0_AXR1.ECAP1_IN_APWM_OUT */
+		>;
+	};
+
+	main_ecap2_pins_default: main-ecap2-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01a4, PIN_OUTPUT, 2) /* (F24) MCASP0_ACLKX.ECAP2_IN_APWM_OUT */
+		>;
+	};
+
+	main_epwm0_pins_default: main-epwm0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01b4, PIN_OUTPUT, 2) /* (D20) SPI0_CS0.EHRPWM0_A */
+			AM62PX_IOPAD(0x01b8, PIN_OUTPUT, 2) /* (E20) SPI0_CS1.EHRPWM0_B */
+		>;
+	};
+
+	main_epwm1_pins_default: main-epwm1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01bc, PIN_OUTPUT, 2) /* (B21) SPI0_CLK.EHRPWM1_A */
+			AM62PX_IOPAD(0x01c0, PIN_OUTPUT, 2) /* (B20) SPI0_D0.EHRPWM1_B */
+		>;
+	};
 };
 
 &main_i2c0 {
@@ -683,3 +709,31 @@ &mcu_gpio0 {
 &mcu_gpio_intr {
 	status = "reserved";
 };
+
+&ecap1 {
+	/* P36 of J4 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_ecap1_pins_default>;
+	status = "okay";
+};
+
+&ecap2 {
+	/* P11 of J4 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_ecap2_pins_default>;
+	status = "okay";
+};
+
+&epwm0 {
+	/* P24/P26 of J4 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_epwm0_pins_default>;
+	status = "okay";
+};
+
+&epwm1 {
+	/* P23/P19 of J4 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_epwm1_pins_default>;
+	status = "okay";
+};
-- 
2.49.0

