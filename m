Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BC7485;
	Wed, 11 Jun 2025 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633519; cv=none; b=J63aMmx5y4AnrKQvBjoVC/fjl0OPI9KIGTnpaiSSoyJV6+EAo3M8fmRVNV3jK2VvBV4HXqAZawZz1fLy4GDznWxXupwRowTt/ZHFWCGvqKHjQZ95n+htnlXbyxAwnpoys6dyekaVGQ4BSEk2B5nKx6HbvUt5n7vhLkHgOH9jryY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633519; c=relaxed/simple;
	bh=zuFDS2qosc9+A7o4k2d3GK8Kqp19epuzkmMM1ayLgZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Ydoj/3A+aYoETOew+gSE+aJUdgE3uBhpmyf8yKyhwnSO19q6lPKafsNJmqw07fBIFr0lGKQJSdJUJR/ZRojGxPHs0xUm1uBBLx08tymF5D/t0kYxloFgpQQFCEkrbvbxeKDp95kmqRuDFjvakU5ykTaRZBOPvbaeYnZ5+7zf5VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=uaPaRmT+; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="uaPaRmT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749633517; x=1781169517;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=zuFDS2qosc9+A7o4k2d3GK8Kqp19epuzkmMM1ayLgZA=;
  b=uaPaRmT+KnUkd8NkGMVaMZ3FU0umkIilveMuB6Nld/w85/WWjt+yju6f
   TPArCr4UzI5N6a/77oil311qc/81FAfIMxbejIhIC0xSrDdF26CeV4VGP
   zMc7WXVxAZoZescm2xKbJJfJvmd8RS+Fxwftr2SkaL/jRqevVgMiYmeir
   omUCpqHgq9HHEdaao3HwL7FofZ4SYxB1XU3YZOY/dIFKd0zmuVxGf4N/g
   LjChT05AQxZL3LBrXoFRwqNGMmL9zvxVJfn+4iCKz43LqkFOXonZlJhG8
   uEKJBPAI6Bb6J4sUpD+KCa4UiIy3gmMzbOAxQJl+C6CGc107qRNVY768K
   g==;
X-CSE-ConnectionGUID: jk5dQVZ/Qu6+T4XW2CUDVQ==
X-CSE-MsgGUID: YqaT/sAxRnyFlEkltMC/hg==
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="47643071"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 02:18:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 02:18:03 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 11 Jun 2025 02:17:59 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 11 Jun 2025 14:47:59 +0530
Subject: [PATCH] ARM: dts: microchip: sam9x7: Add HLCD controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250611-sam9x7-dts-v1-1-7f52fcb488ad@microchip.com>
X-B4-Tracking: v=1; b=H4sIAMZJSWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3eLEXMsKc92UkmJdsySTFAMzk8REE2MLJaCGgqLUtMwKsGHRsbW
 1AMNWB/ZcAAAA
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749633480; l=1485;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=zuFDS2qosc9+A7o4k2d3GK8Kqp19epuzkmMM1ayLgZA=;
 b=uKEcjxIheBSQni50Lhuk3q3FLrjHNUkiZFFh1uxs1zX7Myw26b2DJW4fpcVHYENS6HKenUsre
 2TKrvjoHKV6Bfx/h3zEG2MT1CjAOZP2z1XOm+7T2swbycJ1r4eQvr+u
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

Add support for HLCD controller.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index b217a908f525..d7b4b1310f31 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -983,6 +983,32 @@ pwm0: pwm@f8034000 {
 			status = "disabled";
 		};
 
+		hlcdc: hlcdc@f8038000 {
+			compatible = "microchip,sam9x75-xlcdc";
+			reg = <0xf8038000 0x4000>;
+			interrupts = <25 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 25>, <&pmc PMC_TYPE_GCK 25>, <&clk32k 1>;
+			clock-names = "periph_clk", "sys_clk", "slow_clk";
+			status = "disabled";
+
+			display-controller {
+				compatible = "atmel,hlcdc-display-controller";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+			};
+
+			pwm {
+				compatible = "atmel,hlcdc-pwm";
+				#pwm-cells = <3>;
+			};
+		};
+
 		flx9: flexcom@f8040000 {
 			compatible = "microchip,sam9x7-flexcom", "atmel,sama5d2-flexcom";
 			reg = <0xf8040000 0x200>;

---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250611-sam9x7-dts-6b4d064aa438

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>

