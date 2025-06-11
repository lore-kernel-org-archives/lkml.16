Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CCC26A0B3;
	Wed, 11 Jun 2025 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642238; cv=none; b=BtaVuqgyLtoDcpLBpDs9NLmtQlwmKRzES5YyQ8iqWHsTNrsmoI6suOTVMemF1fxCQxqQ7lz/XKwDoSvE0n0iMyicaY93l6LiELVrE1SQQZw+kU/dM6DpuHuqSunLg3A6fre667R1ChTHDaxfWkoivemQAxl4xsiGMrN42iBsky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642238; c=relaxed/simple;
	bh=qSYlkSm3EuzE+v8sbIzNpcUi01HjIbSE+5vzfbEQubA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sJXu4UDcmwntW/Pa0pfJlrtVBAM3MFHoZNf9eOFOuo3r3lvg4LZlpcU3u4mkGwJ4LhcY+9MZjmq5PRI+FIJ+LUiMh28tJNO2KfxOg1oLQsrWfgNU/YVlOVSnaQyCYx4F9ZmRAK/paIWS8FymwSFN7jtGQrbt+KtE1KDI5U+m1zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wubjjphT; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wubjjphT"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BBhlJa2576483;
	Wed, 11 Jun 2025 06:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749642227;
	bh=Of9BSL6Um1w9fb6I/aEuBtBUlJHILmr+goGt+k/YVGg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wubjjphTHqZiOKf/+ResQAvzgqRzIUdlbybP3dBTRxnNxTzVBJEqwDAQu3VVcyKUS
	 yRDJnHxfZ8WAfJe+rsZxpo9D/YRKXJhowKWbz8veVTJHqq+XgEx/t3KurZv6nsMmtW
	 +Q9GqGGLbKJpDPiTbE2Y2blM8zxmnFGr7tCKt4fU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BBhlYg2833102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 06:43:47 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 06:43:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 11 Jun 2025 06:43:47 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BBhavF270460;
	Wed, 11 Jun 2025 06:43:44 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 2/5] arm64: dts: ti: k3-am65: disable "mcu_cpsw" in SoC file and enable in board file
Date: Wed, 11 Jun 2025 17:13:33 +0530
Message-ID: <20250611114336.2392320-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611114336.2392320-1-s-vadapalli@ti.com>
References: <20250611114336.2392320-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Following the existing convention of disabling nodes in the SoC file and
enabling only the required ones in the board file, disable "mcu_cpsw" node
in the SoC file "k3-am65-mcu.dtsi" and enable it in the board file
"k3-am654-base-board.dts". Also, now that "mcu_cpsw" is disabled in the
SoC file, disabling it in "k3-am65-iot2050-common.dtsi" is no longer
required. Hence, remove the section corresponding to this change.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1 of this patch was 3 different patches which have currently been
squashed:
 https://lore.kernel.org/r/20250529133443.1252293-6-s-vadapalli@ti.com/
 https://lore.kernel.org/r/20250529133443.1252293-7-s-vadapalli@ti.com/
 https://lore.kernel.org/r/20250529133443.1252293-8-s-vadapalli@ti.com/

Squashing the patches is the only change since the v1 series, in
addition to updating the commit message accordingly.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi | 4 ----
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            | 2 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     | 1 +
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
index e5136ed94765..48e740eb0088 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
@@ -475,10 +475,6 @@ &main_i2c3 {
 	#size-cells = <0>;
 };
 
-&mcu_cpsw {
-	status = "disabled";
-};
-
 &sdhci1 {
 	status = "okay";
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 7cf1f646500a..cd0b796c5f8f 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -354,6 +354,8 @@ mcu_cpsw: ethernet@46000000 {
 			    "tx4", "tx5", "tx6", "tx7",
 			    "rx";
 
+		status = "disabled";
+
 		ethernet-ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index c30425960398..d2632d1f8eb7 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -606,6 +606,7 @@ partition@3fe0000 {
 };
 
 &mcu_cpsw {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>;
 };
-- 
2.34.1

