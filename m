Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86E828C5B3;
	Tue, 17 Jun 2025 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750157260; cv=none; b=hNlh6NYRsyeohql3V2I3QFxonqCwzZaH21/GGn6cAGPO6n+fp4qSBdkBfGJ1DwrdPIrAg/+dN2LzqS1h1jaFYpfxAeMgogherGPTyZu5RbeS0ih/h2332D1knLaJ5IFXzJ99yoyl6NxaHBljPMwVHm+jNoWv2gkBJdi8Z1ZeofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750157260; c=relaxed/simple;
	bh=bn+2RdarbdkdqJ5iP1Xz+5dOF0kfroLJGSTElDuyoMM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DPmEDn55jTnWHvq1JVqqVNd1npCuRHUBy9QJZn6VScDnntvEhZATAyDBQq/VX9u1vv6mBz/PXOc5qlB1zVZPDwbnBlCRjfztmKENyM25cm9olkoVphXVUJfvCkF09VQ5IDu6Lr11Pkkq6R00O1bNh5gNBMGDHQptTIuVXj87tk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=1G9/8wGl; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1G9/8wGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750157259; x=1781693259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bn+2RdarbdkdqJ5iP1Xz+5dOF0kfroLJGSTElDuyoMM=;
  b=1G9/8wGlfDwAfPyGljUHUt4yhh7AyXcwcJT6ssM5Bcg3G8omHJuTZ4TD
   waB+p+OURvkNOdLiDVu2jb5R6nzfAsexLBfru4PCI9lBHmKSTQJIbW9xr
   xf0Es1VmPq8EI5HoIwa73egaZrm2L33njznJXH5beMP7dZ6/NUi9sAM3R
   VG36c/o58GKn+XPwlTXUrSrLtiRXd1Be9aCfZgQxPYf14QY7ZNpzmlYX2
   ZXzSpYTqDxGceOBwi6ohmWitRZGlscEWwotKU8VXBeszcL+adx5DALjI7
   L3R7bGu0qq+GzOVFRD5hrAdPf06+LVMIgOB0V2s4Kutark85ANQRHUrlw
   g==;
X-CSE-ConnectionGUID: NlLJIgKaS1e8ItqRhu+KEg==
X-CSE-MsgGUID: CL//+qZuS+emCwqcEVltoA==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="274279562"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 03:47:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 03:47:12 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 03:47:10 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/2] ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
Date: Tue, 17 Jun 2025 13:47:02 +0300
Message-ID: <20250617104703.45395-2-mihai.sain@microchip.com>
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
[    0.161955] cacheinfo: Unable to detect cache hierarchy for CPU 0

After this patch:
[root@sama7d65eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l1-cache
-r--r--r-- 1 root root 4 Jun 17 11:39 cache-level
-r--r--r-- 1 root root 0 Jun 17 11:39 cache-unified
-r--r--r-- 1 root root 6 Jun 17 11:39 compatible
-r--r--r-- 1 root root 4 Jun 17 11:39 d-cache-size
-r--r--r-- 1 root root 4 Jun 17 11:39 i-cache-size
-r--r--r-- 1 root root 9 Jun 17 11:39 name
-r--r--r-- 1 root root 4 Jun 17 11:39 next-level-cache
-r--r--r-- 1 root root 4 Jun 17 11:39 phandle

[root@sama7d65eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l2-cache
-r--r--r-- 1 root root 4 Jun 17 11:39 cache-level
-r--r--r-- 1 root root 4 Jun 17 11:39 cache-size
-r--r--r-- 1 root root 0 Jun 17 11:39 cache-unified
-r--r--r-- 1 root root 6 Jun 17 11:39 compatible
-r--r--r-- 1 root root 9 Jun 17 11:39 name
-r--r--r-- 1 root root 4 Jun 17 11:39 phandle

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index d08d773b1cc5..951d7af3ad1c 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -32,6 +32,23 @@ cpu0: cpu@0 {
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

