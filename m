Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BFD221548;
	Tue, 29 Apr 2025 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939707; cv=none; b=PmCrsFpyVHjvWbtiewNt+DnEOIC2obIJPSmoI6r9CDRY5tcbtMxjim6Kj7jebA+cs3Xb0dGYgxBE0ApWXh82ypEYdccNDohqSv+TAXPGWxOjxRsCcLm1qSX8Q194SMloKIxTKbZ/cRmQqbi/SkjTJ1SHV0jrEvgCQyXOJ2J/GPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939707; c=relaxed/simple;
	bh=ibvBUo1tgIQ4lzj5CAcnf2ssp/dwqEoXlDjUbndHAU0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0miFQuU+9NPXI+5J+FWC1Sm7fVe79BGbYNLHKEuBV8EDQydu0oQ7w0XzYAlTVyU089BbLzOmajwITkifyilARc6bp54YDA2QUBMI4EQ0VXV3noomJjgvO4ZcpTljRecLaPV0QbBwAFxnL/IwyqK0QtH0jhyulGCv9Q2qVMA6e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PFHfczJP; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PFHfczJP"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFEtm03706313
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745939695;
	bh=iNL6a0GWxA2dkZ05LdtJm5Jez0Oqtf8Q3PSdPHB/Smo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PFHfczJPj/469KbpDRdHpsMI2zj224SZxVNFCic9ZdaXJd7FRW4qIGrzrJHyShNPW
	 YcJaovFi+bR0IBHSj9kIgyOpQqGJxYv3rUS7PiDvTE87+t18DVA9S7lQ7Dcb1hN4XA
	 ECVIvWwn+yll723eEkws47RzMmEsAQGx34G535MQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFEtDR032994
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 10:14:55 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 10:14:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 10:14:55 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TFEslx129369;
	Tue, 29 Apr 2025 10:14:54 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        Udit Kumar
	<u-kumar1@ti.com>
Subject: [PATCH v3 3/3] arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC
Date: Tue, 29 Apr 2025 10:14:54 -0500
Message-ID: <20250429151454.4160506-4-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429151454.4160506-1-jm@ti.com>
References: <20250429151454.4160506-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Remove disable-wp flag for eMMC nodes since this flag is
only applicable to SD according to the binding doc
(mmc/mmc-controller-common.yaml).

For eMMC, this flag should be ignored but lets remove
anyways to cleanup sdhci nodes.

Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi               | 1 -
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts                | 1 -
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi              | 1 -
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts                       | 1 -
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                       | 1 -
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi                | 1 -
 arch/arm64/boot/dts/ti/k3-am642-evm.dts                       | 1 -
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts                | 1 -
 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi | 1 -
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                         | 1 -
 10 files changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index 55ed418c023b..e5be92aa1218 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -381,7 +381,6 @@ serial_flash: flash@0 {
 &sdhci0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc0_pins_default>;
-	disable-wp;
 	non-removable;
 	bootph-all;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 1c8b4d13fb49..72b09f9c69d8 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -835,7 +835,6 @@ &sdhci0 {
 	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&emmc_pins_default>;
-	disable-wp;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 147d56b87984..0d4115590b9c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -338,7 +338,6 @@ serial_flash: flash@0 {
 &sdhci0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc0_pins_default>;
-	disable-wp;
 	non-removable;
 	bootph-all;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 22be41d46eb5..c65ada5a22ab 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -634,7 +634,6 @@ &sdhci0 {
 	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc0_pins_default>;
-	disable-wp;
 	bootph-all;
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index ab06cc42b4f2..b89b7a779bcc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -482,7 +482,6 @@ &sdhci0 {
 	status = "okay";
 	non-removable;
 	ti,driver-strength-ohm = <50>;
-	disable-wp;
 	bootph-all;
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 7d249fd04561..c6c8a9d17fb5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -456,7 +456,6 @@ &sdhci0 {
 	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc0_pins_default>;
-	disable-wp;
 };
 
 &sdhci1 {
diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index f8ec40523254..5c6197ba842e 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -597,7 +597,6 @@ &sdhci0 {
 	status = "okay";
 	non-removable;
 	ti,driver-strength-ohm = <50>;
-	disable-wp;
 	bootph-all;
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index aa7139cc8a92..c30425960398 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -456,7 +456,6 @@ &sdhci0 {
 	bus-width = <8>;
 	non-removable;
 	ti,driver-strength-ohm = <50>;
-	disable-wp;
 };
 
 /*
diff --git a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi
index ae842b85b70d..12af6cb7f65c 100644
--- a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi
@@ -50,5 +50,4 @@ &sdhci0 {
 	bus-width = <8>;
 	non-removable;
 	ti,driver-strength-ohm = <50>;
-	disable-wp;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index b85227052f97..f28375629739 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -940,7 +940,6 @@ &main_sdhci0 {
 	status = "okay";
 	non-removable;
 	ti,driver-strength-ohm = <50>;
-	disable-wp;
 };
 
 &main_sdhci1 {
-- 
2.49.0

