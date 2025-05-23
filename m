Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CADF1F4190;
	Fri, 23 May 2025 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748031868; cv=none; b=DtIyr5X5udkzK/VX26+6Xnnry4znZwDYtoZFPMjbB6nW75ORpENxmuyiwyB+dePxZVcTywW3JLLQIAmsy9Uzh56dbjeo6EMr4CKIiMN2mCAL9FMZIj5HagnsHktwC1eGEfx8Bnmy2ZudJXbxzJ3gtynDFKhi9kPxu46vwJyhFHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748031868; c=relaxed/simple;
	bh=T16CVZSw9nb0NLF0XOWGUQhmHT+IUu+xaiZrOhiAFUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ES321F7E+XPFwOR7IAepmOxh1Bllufj02lZ1w2g9mrN066PDag4nejsTeE6x5wPs1QZAQR/gkfeaFha7SIn+0DVzYMullC9syog+/DYek0apu2wGgrtcnoNXE3/K1ghjDoNMuNNi2Nu02pgTmelqDOsxFMnVeRx3v+mHfUfIIa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Hkey3fSe; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Hkey3fSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748031866; x=1779567866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T16CVZSw9nb0NLF0XOWGUQhmHT+IUu+xaiZrOhiAFUM=;
  b=Hkey3fSeSdmKMFNavoMStBPmLMBliYkWFC4wHzxSfkiHqg6+SyKcZhNk
   Dxws9Xdwo94+MN1k5W8fJ4UHKRIH8efNLpdZugXvZpsjbsC082Z3IJGzF
   2gNMTQkg6ENBY4csFuuVkV9KorV+UC8rP3uTpFej/BNc/smSA3hT+v0pX
   36jXCAmNS6IZu/C+TKsRo7LyU7SQXyOmK2BVb4qTZ6lJkq5c7kL6B2NqZ
   E0KH4Qja9jspPZuA2BycfU+DATDloT1uxF+FVXiZg/NkJXxwmHVNz/3Sd
   hXZva3cTJMi4UytkmDjxey4VQ9AksZ1fF+Q5dzUhUC+Zt039FR5dLCFcB
   A==;
X-CSE-ConnectionGUID: KBUIaMEtQL+E9GaMz9Liiw==
X-CSE-MsgGUID: zeZPN2CZSeiEhqUn3L0sQQ==
X-IronPort-AV: E=Sophos;i="6.15,309,1739862000"; 
   d="scan'208";a="46850858"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 May 2025 13:24:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 23 May 2025 13:23:58 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Fri, 23 May 2025 13:23:58 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 1/2] ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
Date: Fri, 23 May 2025 13:24:30 -0700
Message-ID: <569e194346975ac3bb5786c02dc6681625771c00.1748030737.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748030737.git.Ryan.Wanner@microchip.com>
References: <cover.1748030737.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Adjust clock xtal phandles to match the new xtal phandle formatting.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  6 ++++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 2543599013b1..79bf58f8c02e 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -35,16 +35,6 @@ aliases {
 		i2c2 = &i2c9;
 	};
 
-	clocks {
-		slow_xtal {
-			clock-frequency = <32768>;
-		};
-
-		main_xtal {
-			clock-frequency = <24000000>;
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -512,6 +502,10 @@ spi11: spi@400 {
 	};
 };
 
+&main_xtal {
+	clock-frequency = <24000000>;
+};
+
 &gmac0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -917,3 +911,7 @@ &vddout25 {
 	vin-supply = <&vdd_3v3>;
 	status = "okay";
 };
+
+&slow_xtal {
+	clock-frequency = <32768>;
+};
diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..411db7e375a6 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -117,13 +117,15 @@ map1 {
 	};
 
 	clocks {
-		slow_xtal: slow_xtal {
+		slow_xtal: clock-slowxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "slow_xtal";
 			#clock-cells = <0>;
 		};
 
-		main_xtal: main_xtal {
+		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "main_xtal";
 			#clock-cells = <0>;
 		};
 
-- 
2.43.0

