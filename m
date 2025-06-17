Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE82ED153;
	Tue, 17 Jun 2025 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176532; cv=none; b=UoCEUpQMtJZ33clvO61PiJg/blVoTxoFE4sjwhSBDWM1Kbz7Umcm5khE5xGWD0L0WsD9hsz5qMucaCvfLMV/45HeRAsK0n1gsfQm5AbjqNororPPDQ6Z3dlztvNsJMqubpc+DvmgKTzSD8onZ9As7qo9vINdQiHr43zpWlQNCe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176532; c=relaxed/simple;
	bh=EB5X8t9uCWFld+ZhEZJ+i1WeKs1OXWAYq6WKGW2AoXU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3KG/e0EYnvrufTasZgyHqEhPogHh9Pb5EaUPB8HSnKXsQC+ts21RsCHPoTmTgdhPyoGvFqjlS5gZ642TUxckPDRTsEJE98ZTE+y/0XeJl8dfPglBMXGvBt+zL4xq3CW1VP0+gvzko4yJs5PNc8fE1WHtf37Lf+yDciXNs42T1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=isSM6mrr; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="isSM6mrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750176530; x=1781712530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EB5X8t9uCWFld+ZhEZJ+i1WeKs1OXWAYq6WKGW2AoXU=;
  b=isSM6mrrInpWzXIZFEqHRaobgsQfISZSDPU0gwsa1xn0kshVISrp+zoV
   eN6CZROEY23glb9Nm3gv8ZIEQUWq/fBURrnqOfLMbEgPxI0m+5wceGxHC
   WBp+96AWIGlqM7zBj8M/m99qxz0QUnnFkkwzO9LCWV/9ZFFFA2Mqs0zvq
   zxUoiS+gB9nGP4z2nf2cqcVS9xAyWkwyixfOUS3s9TFhqvc9AP/7NKWeN
   gFGe/PTUy0GdVf3XDdFyoeLlxfXUIybQRbiWblvlv6agCinfXG8zlUuLe
   9+nuBaxmzu9WVDKpbbey7jw3Jci24Jg04R1X/3ZgoLPfkn/ymj2T3EHfR
   Q==;
X-CSE-ConnectionGUID: nTbCTdliQ7eOQ0UC/OTqRA==
X-CSE-MsgGUID: L+mGEzq9Q8uyf7PV/8cibw==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="210388674"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 09:08:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 09:08:25 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 09:08:25 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 2/3] ARM: dts: microchip: sama7d65: Add clock name property
Date: Tue, 17 Jun 2025 09:08:41 -0700
Message-ID: <3878ae6d0016d46f0c91bd379146d575d5d336aa.1750175453.git.Ryan.Wanner@microchip.com>
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

Add clock-output-names to the xtal nodes, so the driver can correctly
register the main and slow xtal.

This fixes the issue of the SoC clock driver not being able to find
the main xtal and slow xtal correctly causing a bad clock tree.

Fixes: 261dcfad1b59 ("ARM: dts: microchip: add sama7d65 SoC DT")
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index d08d773b1cc5..f96b073a7db5 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -38,11 +38,13 @@ cpu0: cpu@0 {
 	clocks {
 		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "main_xtal";
 			#clock-cells = <0>;
 		};
 
 		slow_xtal: clock-slowxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "slow_xtal";
 			#clock-cells = <0>;
 		};
 	};
-- 
2.43.0

