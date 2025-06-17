Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87EC2EB5CE;
	Tue, 17 Jun 2025 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176532; cv=none; b=XW4+jlQvrROW16cW2EFIQ53vfKJKBapHbwibwEe9LHrw/IviL/LSc68GZRVAs/+z/YNflb+23KtY984Astz5c3OF+I2d89iOd6/XLgAGQNZmNlHEYcNcTXO2HnQrHhBTogtQE1D2vVdiq8/3M98LWsUYLtrzVcJ5DxEEClN/OMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176532; c=relaxed/simple;
	bh=4i2WXR/m+DKZimuqrflK/Htmu3/SzQoc8EbGnqOF56c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqYZpPWy6FZGA7+kiqk/ZMdA9mV8CQxbymlZDHaZqx0X3MjlN8ZY4Ccp1+v/JDwRRkKpEJ7sqpNsucp6cGozemIIsIEPRqYi9nr2uNov672KI13FFbt0jwW9M/ULOqU+hzRwtwWFO5S4d1C5UpcHCsISI+3Q10bFJgj0uTFfVLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=R+tG/LRY; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="R+tG/LRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750176530; x=1781712530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4i2WXR/m+DKZimuqrflK/Htmu3/SzQoc8EbGnqOF56c=;
  b=R+tG/LRYz0Mz3UOR7KOsDnRDo7pQkZdnZai9zOmJqLQnqvWjmtumN68Y
   KiCmPCgktlfXcuu2Dk4GlnbS5ugFvTGKG4t4b5qk1R2Ag6laTFj4SNwbS
   oLxQQ4NMB5792O9OcGsKktsSvSkWmPmfURcTVbO74zIhIUgSiM3qVAlRP
   Q/NUXCM0Wfjd0EfY6QHHCnQ+K23m8vzILYcDWSdyOaReimmFIF1PgeNH+
   kSQaScUmEQOd8RCmZQZZ/qZPXhNMrB8pVx+G9h8tEBoQyVte1vSOxVWRl
   25qLFw3tHgP2wWd1x16v9w3MH+V/kntH8F4mZv1uVKBzzurF8+H9nzg3K
   g==;
X-CSE-ConnectionGUID: nTbCTdliQ7eOQ0UC/OTqRA==
X-CSE-MsgGUID: B0b4be4rQZaj37P5HU+uOw==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="210388666"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 09:08:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 09:08:24 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 09:08:24 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 1/3] ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
Date: Tue, 17 Jun 2025 09:08:40 -0700
Message-ID: <8a9ece664958d07b1be73b4b6676a2a2ee397a94.1750175453.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175453.git.Ryan.Wanner@microchip.com>
References: <cover.1750175453.git.Ryan.Wanner@microchip.com>
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
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  9 ++++++---
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 2543599013b1..3924f62ff0fb 100644
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
 
@@ -556,6 +546,10 @@ &i2s0 {
 	pinctrl-0 = <&pinctrl_i2s0_default>;
 };
 
+&main_xtal {
+	clock-frequency = <24000000>;
+};
+
 &pdmc0 {
 	#sound-dai-cells = <0>;
 	microchip,mic-pos = <MCHP_PDMC_DS0 MCHP_PDMC_CLK_NEGATIVE>, /* MIC 1 */
@@ -885,6 +879,10 @@ input@0 {
 	};
 };
 
+&slow_xtal {
+	clock-frequency = <32768>;
+};
+
 &spdifrx {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spdifrx_default>;
diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..e128074137e0 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -117,19 +117,22 @@ map1 {
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
 
-		usb_clk: usb_clk {
+		usb_clk: clock-usbclk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-output-names = "usb_clk";
 			clock-frequency = <48000000>;
 		};
 	};
-- 
2.43.0

