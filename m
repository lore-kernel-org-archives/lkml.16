Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3F92EF2B1;
	Tue, 17 Jun 2025 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176534; cv=none; b=sR4PZMXt+Af22Rgtbuno8cRt5DZ5FEMEuJSzzq4V+UMGcWyowluciRscPuuj8Sq4MMgle37CO0GE93iWeDzdQcHU1DehdasB4zBHbDo5AiXC8Ebs41xbftCRK96fugZPGNgihm+acd472DWi8iBm8dB3vnrSAkN4H/PL3M++46s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176534; c=relaxed/simple;
	bh=nqsSXzEVo7LciP/E9QCITo+geSD6uCnlbwEd+v/NZZw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V7T9QQRv1SzJuH50BSVwuN2CohFCbniKFDfhy+QmE3ykesyK1xUd49ogmesrfx5oj4+tInGMWrx0s1/ZQ/hdT/Xw3cs0kj0RAgbMnXgV9aIXyfx8QOADSNvbs9D2J5jiCtDDILhtTNegiHqaKkH3pFumL7SVn6XXp6DaMWE6biM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=h9Y1DMTJ; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="h9Y1DMTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750176532; x=1781712532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nqsSXzEVo7LciP/E9QCITo+geSD6uCnlbwEd+v/NZZw=;
  b=h9Y1DMTJV3YGvV9JKcOs19EvydySD7kFDzi7z2eIDe4BfDbbLC0+kheW
   KttpA2HB6JRqEA1z2FC/6VuzA3UzRnmcu5KIVMyWMwnvFx08c6VkCX4kg
   eQnVCKsZT6ZetAToEUAciEerJd4wNhPZtdGgI3zQunRcR96CLl5fm8fbo
   EPnso+pGKlQVXrZFP4IPM1/ZExOj2gMnD0GqFLKozEY4t/ikpmYI3+CCO
   cSOmzq5AWdT2UWyZsqICIL4hw1lu5Hx+54/m85GPA1MA8ABO9v8ZCEl/M
   4YD7kzd17/J9oTKdUFddWhHNqKLvMWAP6V4cpCRl5CwiOTPWUHRQysJ+a
   Q==;
X-CSE-ConnectionGUID: nTbCTdliQ7eOQ0UC/OTqRA==
X-CSE-MsgGUID: FFAlFapsSs2WBQXKChchzw==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="210388675"
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
Subject: [PATCH v5 3/3] ARM: dts: microchip: sam9x7: Add clock name property
Date: Tue, 17 Jun 2025 09:08:42 -0700
Message-ID: <036518968ac657b93e315bb550b822b59ae6f17c.1750175453.git.Ryan.Wanner@microchip.com>
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

Fixes: 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for SoC")
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index b217a908f525..114449e90720 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -45,11 +45,13 @@ cpu@0 {
 	clocks {
 		slow_xtal: clock-slowxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "slow_xtal";
 			#clock-cells = <0>;
 		};
 
 		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "main_xtal";
 			#clock-cells = <0>;
 		};
 	};
-- 
2.43.0

