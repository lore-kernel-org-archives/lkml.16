Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B7280334;
	Wed, 18 Jun 2025 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243199; cv=none; b=J8YFJhHAj647QY1m14Cu5/gQV/7BvPwi+KPxG/WzOat7frX09G9BroRBBRaSlZOyPcisK9hlvZ9ZdsaWjwR3VAbszacoEnLw/NfG/TpnLBVBKMozWH8+vjxheNYvR0MmVnfRNKoItFMkdMNdSpELmTYkzuN7Rkis71jTdxkPSWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243199; c=relaxed/simple;
	bh=t51JzSN9nadmrvg70cFMDoZAbxQwS0CqONWeM5DnWpo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TGvAkeuIZbwRJMP9GDkcscfI37O4m9kOgEb0FclKkX/9JoiAguNqXiHvn+h1qaBJqK0rDBc89FxbjCXLgD/CSTC7Mzqq/NuBCRq/TIRUCodYV//TfSylmu5ENjkJm04c8tBsMAcOpmHNIU/ER8NnoEfSbISkdwd0ImqJJpqdZic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=JLlv294l; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JLlv294l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750243198; x=1781779198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t51JzSN9nadmrvg70cFMDoZAbxQwS0CqONWeM5DnWpo=;
  b=JLlv294lv9xhcryh2sBDxBkUsJFz6PrdHxvuDyhlaYnzU9hRgKVEe8M2
   faxPJShvOY6tasjcZd03BggHpBoW6HcnFJIicNAYbFTGbcuRLItMQyznE
   +J2yJf8rJMY7dOEXsQsnWShcGLLE+wVjCnhu6er3TCuIEtowzGS9Yf2bY
   ZppMv0SFZc3xWXRcHS2hvdAc2gCrqVQHKX1nz7d+bGAANZBcbLd/P4War
   HG6ek2pxIuP9t0N6OW1STuYFw77tGo0PALyK7RhZ0YMaN57e9gp1GR1Oi
   A5ZkaImTdQvyU9dKnLeCucrCBQ6wHJIsRbUr6oJDqptf0pUmHLqsYpIvW
   w==;
X-CSE-ConnectionGUID: 4uH6+ir5SsWi7jPBO6gg/A==
X-CSE-MsgGUID: KZF84mskQl2lpJhI0kjZ9Q==
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="274330071"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jun 2025 03:39:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Jun 2025 03:39:27 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 18 Jun 2025 03:39:25 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 1/2] ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
Date: Wed, 18 Jun 2025 13:39:13 +0300
Message-ID: <20250618103914.2712-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250618103914.2712-1-mihai.sain@microchip.com>
References: <20250618103914.2712-1-mihai.sain@microchip.com>
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

Before this patch:
[    0.161955] cacheinfo: Unable to detect cache hierarchy for CPU 0

After this patch:
[root@sama7d65eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l1-cache
-r--r--r-- 1 root root 4 Jun 18 12:16 cache-level
-r--r--r-- 1 root root 6 Jun 18 12:16 compatible
-r--r--r-- 1 root root 4 Jun 18 12:16 d-cache-size
-r--r--r-- 1 root root 4 Jun 18 12:16 i-cache-size
-r--r--r-- 1 root root 9 Jun 18 12:16 name
-r--r--r-- 1 root root 4 Jun 18 12:16 next-level-cache
-r--r--r-- 1 root root 4 Jun 18 12:16 phandle

[root@sama7d65eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l2-cache
-r--r--r-- 1 root root 4 Jun 18 12:27 cache-level
-r--r--r-- 1 root root 4 Jun 18 12:27 cache-size
-r--r--r-- 1 root root 0 Jun 18 12:27 cache-unified
-r--r--r-- 1 root root 6 Jun 18 12:27 compatible
-r--r--r-- 1 root root 9 Jun 18 12:27 name
-r--r--r-- 1 root root 4 Jun 18 12:27 phandle

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index d08d773b1cc5..06a5aae93101 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -32,6 +32,22 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
 			clock-names = "cpu";
+			next-level-cache = <&L1>;
+
+			L1: l1-cache {
+				compatible = "cache";
+				cache-level = <1>;
+				d-cache-size = <32768>;
+				i-cache-size = <32768>;
+				next-level-cache = <&L2>;
+			};
+
+			L2: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <262144>;
+				cache-unified;
+			};
 		};
 	};
 
-- 
2.50.0

