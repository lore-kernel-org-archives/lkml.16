Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5349C202983;
	Wed, 25 Jun 2025 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834216; cv=none; b=toJbFjtwoL2u7V26pe9CrBQC9b9WSAmNwYpOOFx+Qmo/dSfi2kr2dKXsMkIqifcZYsbdZ9IkcG620Rx4OPdTK2h/wk3xKX1VRMi3BC7lBJPJN/0i68KfDk0gS1VvSDwv4vxM9/Fer6ZsFJcpLL7KFHplz98Z7+RHz4Z6i7H0kmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834216; c=relaxed/simple;
	bh=ea1LBPyOvgGFO/YL0AUNxA/G1R2YdGQR14rWQgcjUKc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYwk8zW9PcsGxtDdiHORfwYyDNE8zSEUOy1GByzVwTMdc1udS1Ca7RS9uNgHvd2SsXxjLNmiHahB5PoGYuBsMKt4RCalFHb9JPRMV7X0T8ca+IsiBZmDvwzQNPZgl5FcDkaxlzG4EDN3r0Knqo++8kAARE6bDpFxwXWLmj+LEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=RYDw1zU3; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RYDw1zU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750834216; x=1782370216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ea1LBPyOvgGFO/YL0AUNxA/G1R2YdGQR14rWQgcjUKc=;
  b=RYDw1zU3IG1XXSuSMO892Q/rGvCatzewmBcGSq2lHpFJL0mkAvJIF8El
   /OAs9FRxDPao2qVQGRSbS5voU1Cx5+9SeUEfqDfcQJ6geG5A3DPBsu8mP
   z22U/Bu8uoBfqkt7uQQ0ii5py58SWz0csxXkpjPjKdZARG19wxZ6qtuFu
   ZDtXSkog86IWur+AMGbiSZrEK0TysVIRpkfb9N6Uj4ZG6u5EeebOsyCu4
   9HRhq0g97SdN8z0vptxiiv7ytJo8fKt6LU/BQmCwYwdABnWedxaENGBL8
   08+VPWpVKtrEQaQ9UGPhDlVPG02U8DbEDx+g/9mLl2vxMY4QhS95NfyH3
   g==;
X-CSE-ConnectionGUID: I6q3k54CR/y9OS0wbbtBHw==
X-CSE-MsgGUID: I+4Mc2cSSRqa4eb7nKUKsA==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="43193031"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 23:50:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 23:49:55 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 23:49:53 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 3/3] ARM: dts: microchip: sama5d4: Update the cache configuration for CPU
Date: Wed, 25 Jun 2025 09:49:34 +0300
Message-ID: <20250625064934.4828-4-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625064934.4828-1-mihai.sain@microchip.com>
References: <20250625064934.4828-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the memory size properties for L1 and L2 according with block
diagram from datasheet:

- L1 cache configuration with 32 KB for both data and instruction cache.
- L2 cache configuration with 128 KB unified cache.

[root@sama5d4 ~]$ lscpu
Architecture:             armv7l
  Byte Order:             Little Endian
CPU(s):                   1
  On-line CPU(s) list:    0
Vendor ID:                ARM
  Model name:             Cortex-A5
Caches (sum of all):
  L1d:                    32 KiB (1 instance)
  L1i:                    32 KiB (1 instance)
  L2:                     128 KiB (1 instance)

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama5d4.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama5d4.dtsi b/arch/arm/boot/dts/microchip/sama5d4.dtsi
index 59a7d557c7cb..ec1d68c640de 100644
--- a/arch/arm/boot/dts/microchip/sama5d4.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d4.dtsi
@@ -50,6 +50,8 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a5";
 			reg = <0>;
+			d-cache-size = <0x8000>;	// L1, 32 KB
+			i-cache-size = <0x8000>;	// L1, 32 KB
 			next-level-cache = <&L2>;
 		};
 	};
@@ -143,6 +145,7 @@ L2: cache-controller@a00000 {
 			interrupts = <67 IRQ_TYPE_LEVEL_HIGH 4>;
 			cache-unified;
 			cache-level = <2>;
+			cache-size = <0x20000>;		// L2, 128 KB
 		};
 
 		ebi: ebi@10000000 {
-- 
2.50.0

