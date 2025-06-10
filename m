Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF0E27A13A;
	Tue, 10 Jun 2025 06:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749538260; cv=none; b=bCeU0pmoPndtd/wMvaYFz9WuOmR5YhSMvJsiTYyIYDEf+tDX60VMeQs8Y8jmP54YOjcgUeIjm4DtGilBElttitawFj54iU6s7W7gLk1QHAIeex2U67uCgPNFjLML8U1uj8l8j694ClMvW2xIlMe1+TwaiR0O90qW34K2U8J0IWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749538260; c=relaxed/simple;
	bh=soyPmKOiyPuF13kTyA1g1EHVtL0HTpl2yGsgbJZwClc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UclhqjcbCm02EWvb32F/6PwUT+tb4qw9isf4mGNudBi9ME+87MZtDgm0MIypQCTNtka5srqglY9A/RoURomK4ex+dt5yVsZLHFmRKHygthBZKGxI61yPCWQaQfdxiwbaECavT2JIzXvRu/bul7kZFgdlW8EtaTMZTIXdSesZ2VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=YAKdNLp9; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YAKdNLp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749538258; x=1781074258;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=soyPmKOiyPuF13kTyA1g1EHVtL0HTpl2yGsgbJZwClc=;
  b=YAKdNLp9nzzinfboLcoIyX/rRVupMPFFYIaS7U9YbjgLwkQzUbU7697M
   oQ/mnRu1Y5+XjRMx+t336jKd139ZgIDwYSxmiLxADGifIU/mWrp/MRNvv
   dSZ5SfPjzov6eP/j/jFjjdoZRBmtgfa98hYgrQmuQ+WZzlYrHFbbjJQgT
   kfwsHqx7VovDVmEUjMi/jY4z+P8ASJRUi8D0706whdxqteFMPCrfSlxzj
   6YaZgo9qMuXd5YROj0bX+DD21aZW4BzcWt+mNPm/uJVWexIVCHp0bSB2G
   u+acixKUOo/gs+cfxP4U2RtI9Znsm/V8VVul6RrNqP/TawEoimi/iecwf
   w==;
X-CSE-ConnectionGUID: o/k/Usq3QdaIxjSukshv+w==
X-CSE-MsgGUID: NibftaXXSSmHn/JY2WykbA==
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="47577425"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jun 2025 23:50:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 9 Jun 2025 23:50:21 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 9 Jun 2025 23:50:16 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <andrei.simion@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH] ASoC: dt-bindings: atmel,at91-ssc: add microchip,sam9x7-ssc
Date: Tue, 10 Jun 2025 12:20:05 +0530
Message-ID: <20250610065005.64070-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add microchip,sam9x7-ssc to DT bindings documentation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---

This patch is a rework (adapting to the newly converted yaml file) of the
leftout patch sent [1] as a part of the series adding support for sam9x7 SoC
and sam9x75 curiosity board.

[1] https://lore.kernel.org/lkml/20241010120345.92844-1-varshini.rajendran@microchip.com/

---
 .../devicetree/bindings/sound/atmel,at91-ssc.yaml     | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml b/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
index a05e61431824..ce99c2d8c35d 100644
--- a/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
+++ b/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
@@ -16,9 +16,14 @@ description:
 
 properties:
   compatible:
-    enum:
-      - atmel,at91rm9200-ssc
-      - atmel,at91sam9g45-ssc
+    oneOf:
+      - enum:
+          - atmel,at91rm9200-ssc
+          - atmel,at91sam9g45-ssc
+      - items:
+          - enum:
+              - microchip,sam9x7-ssc
+          - const: atmel,at91sam9g45-ssc
 
   reg:
     maxItems: 1
-- 
2.45.2

