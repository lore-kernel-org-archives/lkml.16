Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88858289E12;
	Wed, 25 Jun 2025 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842619; cv=none; b=qRFStVhhFdcIXhMskBDg509rWDormWMNa7jYoD7cdTMRtK+UkrBevcXOR5E5Pp9JzL2a4acs6YVN/zCRg6/oDhiu4LMsQoE0mxadbTYahIk8gvBUKQuFXVWoqZDawbsgzJCGOZsIL7F3FPj38GDc41JG2TxJLqHqH587/xBTMwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842619; c=relaxed/simple;
	bh=atWXI272KosC+H1LcVLe8DaxkOffIpJ+2UQelLC0JuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=X8RWgtjZKSdSG2BIqCcwShlf0hsohYn5dl/Yltzereo9S//m+pluQkKAY7Yq7eT3TzzDvNlVMP/+MkxEsvTussN3le6IRXflv3DJq8YF2oTaArmyTNuUf+HsOcfDhe5gK6ZKPxPqRwqKrPMSSFsbeeeqmar10UACy26OnvYSAiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=n0OFNoiS; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="n0OFNoiS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750842617; x=1782378617;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=atWXI272KosC+H1LcVLe8DaxkOffIpJ+2UQelLC0JuI=;
  b=n0OFNoiSqFg8RKH3BM5PVH08Az8s8NfYAt5VK9DnbALqSfuCvTGfI03M
   NDCdNavJy8brlg8wdz4RMrl51F0PrGGJZHKdBf2XYR/cCojctgom8SyMo
   iskT5gxNZq491S/6uz52r7eEj2WEUzDlGlmrpsAvZTUYMCFLRh1bcbMIN
   pJTaz1Cutv6iYdEE4c5IdMTe5nHZHvl0l26xC249Otai0uqQDyvzYBJUr
   mi914YPxXm4mpWXzgnlXEvaOq0UOmFHCBLdz+5Xiy1/XsZ/YPP6CUGRUO
   3z+lMe1v1RmmFOSgxknh8utIdTzlFuNdBk7AJV14ff4Lxwu5Cocz0u8aP
   g==;
X-CSE-ConnectionGUID: sxBLGQKwQuaA8VjKmi+wng==
X-CSE-MsgGUID: BMrW+8k5QGqrjaSZ5e4Xvg==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="43794891"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2025 02:09:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 25 Jun 2025 02:08:53 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 25 Jun 2025 02:08:49 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 14:38:45 +0530
Subject: [PATCH] ARM: dts: microchip: sam9x7: Add LVDS controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-b4-sam9x7-dts-v1-1-92aaee14ed16@microchip.com>
X-B4-Tracking: v=1; b=H4sIAJy8W2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNT3SQT3eLEXMsKc92UkmJdU5PEJCNDY2NLkyRDJaCegqLUtMwKsHn
 RsbW1AFX2L6VfAAAA
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842526; l=1095;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=atWXI272KosC+H1LcVLe8DaxkOffIpJ+2UQelLC0JuI=;
 b=DM1uwXN9vq1EFJdLT42C8y5Vx4i/g8XY8kgFhPfIPjKVE0Nj1ox5fdWU+bOjosWjWnI6UU6ol
 uoT6GUrbLVBCDyvYGbtMzgHX42f1bo6qTVOj1AyFVhQu6Q3E0eHdmbM
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

Add support for LVDS controller.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 2063507d0c50..66c07e642c3e 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -1115,6 +1115,15 @@ AT91_XDMAC_DT_PER_IF(1) |
 			};
 		};
 
+		lvds_controller: lvds-controller@f8060000 {
+			compatible = "microchip,sam9x75-lvds";
+			reg = <0xf8060000 0x100>;
+			interrupts = <56 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 56>;
+			clock-names = "pclk";
+			status = "disabled";
+		};
+
 		matrix: matrix@ffffde00 {
 			compatible = "microchip,sam9x7-matrix", "atmel,at91sam9x5-matrix", "syscon";
 			reg = <0xffffde00 0x200>;

---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250625-b4-sam9x7-dts-54ab213394b1

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>

