Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A03286429;
	Wed, 18 Jun 2025 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243203; cv=none; b=IjUT+DRkVhshSRZzxrvqT2SPUOOPs3GeS8e4TMnjilnDGtnc2ZzU2BzT481J8ilRin6qNnPzEzB3jVqJg1JEN2Oge6t2SXayXiCOXyHh7XnaW7VIkko+Dhpyr6DJZk7mevz6drEALurr2aS1A50uhVnq5hDsWFexEYGaSeyYEqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243203; c=relaxed/simple;
	bh=22QQErwPxlBAJ0KnPlU2RXCt44GQ9my/mq7QEIY/+/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WGhR9Q5/cx33vZdJpT/Wur4h8kvJUQ2ySO13flIaK5RqZn0hgMApLzqNqoRe1ypJlbUZaLuqPPV7/vyx7Gm7t5k14ffT1MOUA11djmIukcMm1eWM22DWQRU1SqV8sM2sE99T8PxI+wJSKHWjDzwL+2ILO2IoF1bcSBoHsNCD90k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=kXyzDwqV; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kXyzDwqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750243201; x=1781779201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=22QQErwPxlBAJ0KnPlU2RXCt44GQ9my/mq7QEIY/+/4=;
  b=kXyzDwqV5I0QVl4gpLoSBJ8Sm5NTblmcmBBv5bcpbES5vm6yFs8Ivfgk
   w091BLrzt5Mk4ORpZJcBh6vCRcDWjpbB6R8b5FZF6HNBEfthV0TrKuPzG
   uBAz80Cr1feYhlehtvYUhXzPdkMOwE0FvJVl4+dP51R121JCDFdIzELrp
   1Dr4DqN9/RQ9QIowEe8N/0Hme1OgSjfFBpdG8f/aLL6pryycvBqZ2+e6x
   sbNaZYpewKWb92IZUY2tVcBYP09Q/Ctm4imp/ZguSnjsr7gCwjMaUYSEv
   ljlfmSYHJv1ko+XFXQ6gFZLz0Dl6ckekDlth2xJT3wqXXJtCpfjuNVxeF
   Q==;
X-CSE-ConnectionGUID: 7wtXBdA6TE+fk4S1pxqqTQ==
X-CSE-MsgGUID: 4zCq3BxjQdmbuXuDHew4Mw==
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="42469512"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jun 2025 03:40:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Jun 2025 03:39:29 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 18 Jun 2025 03:39:27 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 2/2] ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
Date: Wed, 18 Jun 2025 13:39:14 +0300
Message-ID: <20250618103914.2712-3-mihai.sain@microchip.com>
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
[    0.171425] cacheinfo: Unable to detect cache hierarchy for CPU 0

After this patch:
[root@sama7g54eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l1-cache
-r--r--r-- 1 root root 4 Jun 18 12:39 cache-level
-r--r--r-- 1 root root 6 Jun 18 12:39 compatible
-r--r--r-- 1 root root 4 Jun 18 12:39 d-cache-size
-r--r--r-- 1 root root 4 Jun 18 12:39 i-cache-size
-r--r--r-- 1 root root 9 Jun 18 12:39 name
-r--r--r-- 1 root root 4 Jun 18 12:39 next-level-cache
-r--r--r-- 1 root root 4 Jun 18 12:39 phandle

[root@sama7g54eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l2-cache
-r--r--r-- 1 root root 4 Jun 18 12:39 cache-level
-r--r--r-- 1 root root 4 Jun 18 12:39 cache-size
-r--r--r-- 1 root root 0 Jun 18 12:39 cache-unified
-r--r--r-- 1 root root 6 Jun 18 12:39 compatible
-r--r--r-- 1 root root 9 Jun 18 12:39 name
-r--r--r-- 1 root root 4 Jun 18 12:39 phandle

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7g5.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..a3c8bbf5d1d8 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -38,6 +38,22 @@ cpu0: cpu@0 {
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

