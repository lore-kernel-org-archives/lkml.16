Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B5E2116E0;
	Thu, 17 Apr 2025 23:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744932650; cv=none; b=q31aCUufwX760sIGrEeOuHZLprKUUhSSUDXu3fCpa+k7kqORpF6+VStmnp+nsXAyVpHTnoorLpAFfPD5ffibFn423QPTbMt/cOLVv8gNvnbOs25oSsLf88xpk4o/IelnF0VHqDGrbWKMkXDekGflBbIZPIChvNvM+W/oJfM1J7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744932650; c=relaxed/simple;
	bh=rpszKideZPcl4PnxosYFAiekHU3Yf3PYWLiMSd78ay8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gqeq2iBW1M2LC53TXFy901GkTwNhKOjHnOd5JjGNQSSzgnNfA58ja+VpmIyPdsAiKn9V82EoY379ljSKgO3nvhFu2a6rp4xti0AfBAUfjo7YBB4jPehIlsIlf72oxQJs60Aj4/1fH5Zc4ki303AFVLhlj215AhIo4lbW8yOx6/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tzhuhoVC; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tzhuhoVC"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HNUeGx781176
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 18:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744932640;
	bh=qiPMqmNG/TeQwwx/tFLkhEr5+h2kFf2737NmSXGhJFk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tzhuhoVChAqaXr/kp72Ngpt0EVrbmG23mOQ1V37RABO9LMrmxNKlGPzRxsOUQPAiR
	 hDKFRX4TPMkwbIiFW3RnIyJNCRrXCo50E9XS/Kt5lAooJ7jFpGewML23SJKrXdCeHR
	 bd8phhrlzdCJcABw8aw7jLd1nMAZxhge7/+IiHAU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HNUeYj003888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 18:30:40 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 18:30:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 18:30:39 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HNUePg023286;
	Thu, 17 Apr 2025 18:30:40 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v2 2/5] arm64: dts: ti: k3-am6*: Add boot phase flag to support MMC boot
Date: Thu, 17 Apr 2025 18:30:37 -0500
Message-ID: <20250417233040.3658761-3-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417233040.3658761-1-jm@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

For eMMC and SD boot modes, voltage regulator nodes, io-expander
nodes, gpio nodes, and MMC nodes need to be present in all boot
stages, so add missing bootph-all phase flag to these nodes to
support SD boot and eMMC boot.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 8e9fc00a6b3c7..aafdb90c0eb70 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -69,6 +69,7 @@ vddshv_sdio: regulator-4 {
 		gpios = <&main_gpio0 31 GPIO_ACTIVE_HIGH>;
 		states = <1800000 0x0>,
 			 <3300000 0x1>;
+		bootph-all;
 	};
 };
 
@@ -77,12 +78,14 @@ vddshv_sdio_pins_default: vddshv-sdio-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x07c, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO0_31 */
 		>;
+		bootph-all;
 	};
 
 	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x01d4, PIN_INPUT, 7) /* (C13) UART0_RTSn.GPIO1_23 */
 		>;
+		bootph-all;
 	};
 
 	pmic_irq_pins_default: pmic-irq-default-pins {
@@ -118,6 +121,7 @@ exp1: gpio@22 {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
+		bootph-all;
 	};
 
 	exp2: gpio@23 {
@@ -229,6 +233,14 @@ &tlv320aic3106 {
 	DVDD-supply = <&buck2_reg>;
 };
 
+&main_gpio0 {
+	bootph-all;
+};
+
+&main_gpio1 {
+	bootph-all;
+};
+
 &gpmc0 {
 	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 1c9d95696c839..7de4a9f139ad4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -313,6 +313,7 @@ AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (AC1) MMC0_DAT5 */
 			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (AD2) MMC0_DAT6 */
 			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
 		>;
+		bootph-all;
 	};
 
 	main_mmc1_pins_default: main-mmc1-default-pins {
@@ -615,6 +616,7 @@ &sdhci0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc0_pins_default>;
 	disable-wp;
+	bootph-all;
 };
 
 &sdhci1 {
-- 
2.49.0

