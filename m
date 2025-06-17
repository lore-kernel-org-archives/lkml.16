Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BCD2C08D3;
	Tue, 17 Jun 2025 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750157260; cv=none; b=PvfUXKCtXqP7CDx0WgX6oJjkOZ/8SPjM8jePtHC9m2irp5OTBx9IE72mw5hU7WT5PM2DA+wXoOdQ7SAWV09MSr2ne0ip5YE2lyApFm1fk25+cK4c6t4K/6aiOyKS+4D/78zNkP+4K7mIgUhg/P7FVhrhAVm0VjXTSoY8KOmcbGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750157260; c=relaxed/simple;
	bh=yufdxM6CMyGLalI/7A+e1Bisy8ha1AoJNLv1GLw18bA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TKtdGE+J/3KA/N/xn/UjEHUyASS2+nQ8y9QdRUP74aSMM5O/+zMYbqE0zMA7RKQmjWbkEMBHdqSYGkINMxbcdL5f5A31vm0/TqM2gLvvmfhKqjzrQTNpZckbOkPITZeMy/BiKKA2MytCeifWQ10fSQ8BAwP9evVBsyKtvHMqVqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=iV+S0G5h; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="iV+S0G5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750157260; x=1781693260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yufdxM6CMyGLalI/7A+e1Bisy8ha1AoJNLv1GLw18bA=;
  b=iV+S0G5hwj3SSCkw6mG9BbcNDhde5iLzyP+iL2djVJPPs4XelIgnjvGP
   befYuRKRK+GP7RkP0SldmoOzGcmeETgWe9AYqgUWoNEPKRtg92qDPzvXc
   4ylYJvcPavnDyv6W5T3QPHckeq5g1f8GdifxzOK++r12XzspaiFK+XBmU
   VnAbvv9BBajAQVvfBZnKlN4VGHJ3VtUtmFTfkO9fnwmHd8OktZ7Fsq5p+
   s07u/6pBNOdQJuZJ50fI9/5dFaU38fJEqLWZBQKCnzkm8xLAnJzivPTgu
   EoyRi8zNPRlDCTSTnlObNgwE3umDGHJ0n1bqDnZ/qjjf9Aky3GKMkrbFB
   A==;
X-CSE-ConnectionGUID: NlLJIgKaS1e8ItqRhu+KEg==
X-CSE-MsgGUID: aVM7kM2YQR2ta15yj2ds5Q==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="274279563"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 03:47:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 03:47:14 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 03:47:12 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 2/2] ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
Date: Tue, 17 Jun 2025 13:47:03 +0300
Message-ID: <20250617104703.45395-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617104703.45395-1-mihai.sain@microchip.com>
References: <20250617104703.45395-1-mihai.sain@microchip.com>
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
[    0.171425] cacheinfo: Unable to detect cache hierarchy for CPU 0

After this patch:
[root@sama7g54eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l1-cache
-r--r--r-- 1 root root 4 Jun 17 11:39 cache-level
-r--r--r-- 1 root root 0 Jun 17 11:39 cache-unified
-r--r--r-- 1 root root 6 Jun 17 11:39 compatible
-r--r--r-- 1 root root 4 Jun 17 11:39 d-cache-size
-r--r--r-- 1 root root 4 Jun 17 11:39 i-cache-size
-r--r--r-- 1 root root 9 Jun 17 11:39 name
-r--r--r-- 1 root root 4 Jun 17 11:39 next-level-cache
-r--r--r-- 1 root root 4 Jun 17 11:39 phandle

[root@sama7g54eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l2-cache
-r--r--r-- 1 root root 4 Jun 17 11:39 cache-level
-r--r--r-- 1 root root 4 Jun 17 11:39 cache-size
-r--r--r-- 1 root root 0 Jun 17 11:39 cache-unified
-r--r--r-- 1 root root 6 Jun 17 11:39 compatible
-r--r--r-- 1 root root 9 Jun 17 11:39 name
-r--r--r-- 1 root root 4 Jun 17 11:39 phandle

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7g5.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..70175a35dc3e 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -38,6 +38,23 @@ cpu0: cpu@0 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
+			next-level-cache = <&L1>;
+
+			L1: l1-cache {
+				compatible = "cache";
+				cache-level = <1>;
+				d-cache-size = <32768>;
+				i-cache-size = <32768>;
+				cache-unified;
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
2.49.0

