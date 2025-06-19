Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB99B246799;
	Thu, 19 Jun 2025 07:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316835; cv=none; b=H52K71RXodfbVDw0/e0qpxkHYW9LLayfBAyDSj+o6alT56g1NvIypkhdDiHIHnulUP0PhgeOWolCnL8g/AL3SaGVhu0ttbMYXl0UESIR02KMf79+1PyqAkt5pcvzQEczlQ1Z7Z8f4Xbp0vIEoC5hdifZJ7ConyI1CrOsAhKk/jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316835; c=relaxed/simple;
	bh=a6Xv7ZZ6shJzK/0F5v3pecDxLl9giCPyL20Xa7pa8lo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XdNTwDl5yjnGsDAz3FEd4fJvRnWhode1+OjYOc679jLIiXFYE6xnDe9QfRu0XTvPXGEir4YoFwt/tlgD1yuNn6QMSkvE8S25DWVGKWxpqAqtwhrpFs1qmZNRPNHlrrb3W9cJtL+d8S4m7Wiho5wLZBn9qEuJOuNFfFdRoBMKUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=d9id/6Iw; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="d9id/6Iw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750316833; x=1781852833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a6Xv7ZZ6shJzK/0F5v3pecDxLl9giCPyL20Xa7pa8lo=;
  b=d9id/6IwWWGOt/w1z2ejXva1fgV8nyVm67pnJqiokG4iBqqBnkjYuyLy
   UJ2eoDZZmDWIyItmLvHtaiRPp8jui13jQfeaEIHJTAIMk6iBLyJpKlwtQ
   YGGcE9QpaPGhjMWSaMxn1a6nrROkjAmmJOeu1WyzywmdVvQq3KEbhcDMM
   RHfbXynUMiJz90p8KkDuvd66AhZqGfkMTz9r0Vlvi6mbgq4jOtUlrhgQa
   hTxg4sskuZwD52YqmDQRg8HQ9l4elYAGw9zhkjstl9/iTE5wDpIfow8oS
   RLF4C1usl0EuLC98sUHT2bBzuYr1h0GTRNRRoXz5v08Y3ocwD2w0/PwzK
   g==;
X-CSE-ConnectionGUID: PlQ5gDZlQHSrfxlUJA1/0Q==
X-CSE-MsgGUID: A0PB8EHXQX28o+AEtNDLlw==
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="48018363"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 00:07:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Jun 2025 00:06:49 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 19 Jun 2025 00:06:46 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 2/2] ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
Date: Thu, 19 Jun 2025 10:06:36 +0300
Message-ID: <20250619070636.8844-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619070636.8844-1-mihai.sain@microchip.com>
References: <20250619070636.8844-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Describe the cache memories according with datasheet chapter 15.2:

- L1 cache configuration with 32KB for both data and instruction cache.
- L2 cache configuration with 256KB unified cache.

Before this patch the kernel reported the warning:

[    0.171425] cacheinfo: Unable to detect cache hierarchy for CPU 0

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7g5.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..f28bcf6daf4e 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -38,6 +38,16 @@ cpu0: cpu@0 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
+			d-cache-size = <0x8000>;	// L1, 32 KB
+			i-cache-size = <0x8000>;	// L1, 32 KB
+			next-level-cache = <&L2>;
+
+			L2: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x40000>; // L2, 256 KB
+				cache-unified;
+			};
 		};
 	};
 
-- 
2.50.0

