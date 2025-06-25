Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E2201017;
	Wed, 25 Jun 2025 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834207; cv=none; b=iO7zAeJu7pmR4bpKO+RWbgt+1Pie3K+15O9BUFKgRXUbyltuf7jDt3Vrf6C3I9TzkYGuuiPApx9POTSEevWjyfYOhfRgtqdtGFjZGgynSBQSv8SuPArnbKm+Oj1Ie87ceMGIoKY25tAirceZ5lRZNkRIez7sxg6Hz2JdC0NNglc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834207; c=relaxed/simple;
	bh=oY1HHv+Tb3nPaWt2I9NusdqqhMcQ7Dn/TzUoNK3kqmc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eo7LZ14cptJCbsGqeozlTiAT1aTV3xduAGCxgYPi9SEauaj09eTnhkYyf0yPKdDjMLBPx4FHIDTwcN+1FIMh1G0qfyx+0AxjjZu0g0Agkj6o8MmgqrgerrcC1xAxc7MiqZUPCL/4IJclWYPkKhReeFJcjg5cU2bVOk/20/L9RMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=SpOQa1cE; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="SpOQa1cE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750834203; x=1782370203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oY1HHv+Tb3nPaWt2I9NusdqqhMcQ7Dn/TzUoNK3kqmc=;
  b=SpOQa1cEiEmE95eKlc7EdqMW57avI2JxM6qznyWMOzopIb/eWkwUlp+z
   KWPrFsnk33GrTDwe/DDl/XisS5UG3wn82gVQ4NHsFqxL4Bqm2f9SfbhlO
   V1JjSsqOKEWrdt/wQQ3mh2dnNjAcjQFb0mRweKRRQvXFORs/NZjR0RKVr
   wBSVNnfAIjwY5L+eWONJcPnh8tUvoxfKuSqYE2hE3rVOJIiWbbE1HViAK
   fo5nTe/DW+xsC6vNG79VKBK1Qod8vybbYcudXu8ZwtCNyZF6A9JmS/XjX
   n+yiiGQoZLQmSKYgB+06IArNAcPv3HkqyEqpy9pmDzzysuTdtCmFcv6Wg
   A==;
X-CSE-ConnectionGUID: 4z1r6s7rR4GWDP9QOY3lYA==
X-CSE-MsgGUID: DrkzkN5ZRQ6wt4w4NRkS5Q==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="48271089"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 23:50:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 23:49:53 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 23:49:50 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 2/3] ARM: dts: microchip: sama5d3: Update the cache configuration for CPU
Date: Wed, 25 Jun 2025 09:49:33 +0300
Message-ID: <20250625064934.4828-3-mihai.sain@microchip.com>
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

Add the memory size properties for L1 according with block
diagram from datasheet:

- L1 cache configuration with 32 KB for both data and instruction cache.

[root@sama5d3 ~]$ lscpu
Architecture:             armv7l
  Byte Order:             Little Endian
CPU(s):                   1
  On-line CPU(s) list:    0
Vendor ID:                ARM
  Model name:             Cortex-A5
Caches (sum of all):
  L1d:                    32 KiB (1 instance)
  L1i:                    32 KiB (1 instance)

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama5d3.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama5d3.dtsi b/arch/arm/boot/dts/microchip/sama5d3.dtsi
index e95799c17fdb..00ba59ac1968 100644
--- a/arch/arm/boot/dts/microchip/sama5d3.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3.dtsi
@@ -48,6 +48,8 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a5";
 			reg = <0x0>;
+			d-cache-size = <0x8000>;	// L1, 32 KB
+			i-cache-size = <0x8000>;	// L1, 32 KB
 		};
 	};
 
-- 
2.50.0

