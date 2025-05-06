Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DAE1FA178;
	Tue,  6 May 2025 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746561938; cv=none; b=nD0s6zhGcPt0oIk3RLCu07YJnRQ3kLLfKT/YYUp4pMLErI/qfEqtlB8SvGM2i0sKNT6RAA/8hG5t8kWc/qZ1Ze7fd7C8LTx6M/UKdGmAf1a1xgtgMA+jrDfuO+4zYO3Z7WvZ778Q1zf2d7X+fJGZ29Pbo6otpuYG5PwHxK4GAtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746561938; c=relaxed/simple;
	bh=jfgSiqLCqwkZI4qYAO/dSdiUYlqbnqAIsGKA2fS7izw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PoYbSxd5Mbl7IYDqvLgfHc4RW5NKBQ/aoXoT+fRmKA9lSrxfpUoCxRlXqQYeOJp++L+XSlV6fXVSrtiy4dAHrAxg05gKuQVpJ47ToNb45F74SiWO0U4RFiBed4GkPTEK22MA8BhR0hsQ7L+z1kMZHVDr2YqgjQBSj7x3iy1fy+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xnInx0XX; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xnInx0XX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746561937; x=1778097937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jfgSiqLCqwkZI4qYAO/dSdiUYlqbnqAIsGKA2fS7izw=;
  b=xnInx0XXrLTPWCuPj38ji8G/z+GU/Oj0UgXc5lD1tS3OmD/BV6CS+91O
   4KDpt8iXPnRDIU0ThFVMg2Hnax9P69qvWmCAE6GqVkTIqQj4ooSa5kV/U
   1MjNw1jYhDj3+nijmI34+sSwd9XaoyawJRfuWXBpVRyv20AbbjWHzAunx
   24QFd3v5G+imkVyppZWeD3KJkoAy4eAV9xKjkqKQLvDIx2EUpHGUTR/0Y
   zcgk6L/tZpFJ2A/B1Ag9jriJXNitE5S2Jv2Yuha+8ob2iD6GqWgNTnnLs
   0McFFlKl5wAQzK//5cC/pPTtDPgVp0NC59UDbfANozbYBMFP8NQtQbTET
   Q==;
X-CSE-ConnectionGUID: dUBqohHAQlqcpEGq8j09lg==
X-CSE-MsgGUID: BzcJr+ljReaz+1R4R6gYiw==
X-IronPort-AV: E=Sophos;i="6.15,267,1739862000"; 
   d="scan'208";a="208799764"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 May 2025 13:05:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 6 May 2025 13:05:12 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 6 May 2025 13:05:12 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v3 4/4] ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
Date: Tue, 6 May 2025 13:04:59 -0700
Message-ID: <c4c12d7cb6dbd1cb025d159c2fa1985616dd387c.1746561722.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746561722.git.Ryan.Wanner@microchip.com>
References: <cover.1746561722.git.Ryan.Wanner@microchip.com>
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
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  4 ++--
 2 files changed, 10 insertions(+), 12 deletions(-)

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
index 17bcdcf0cf4a..250c9e98a8bb 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -117,12 +117,12 @@ map1 {
 	};
 
 	clocks {
-		slow_xtal: slow_xtal {
+		slow_xtal: clock-slowxtal {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
 
-		main_xtal: main_xtal {
+		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
-- 
2.43.0

