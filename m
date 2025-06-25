Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5645A1F8937;
	Wed, 25 Jun 2025 06:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834203; cv=none; b=MlixBxStvcQ2htXInpNOwcfE9FrhF5rVsW6MWwTQ2gFiFODobmFr4AkKvZaLjXvUzaEX2254CVDRbwcqgf8O00y5Vvl+5d5jvBa6EaNbIZpLbTdHRjKjXQj49O7iriznQV6j8dDHMeHT9NoIHdp8eKQi4zAQWuVoN9MZ6L42A/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834203; c=relaxed/simple;
	bh=R5rzPg0wfSfqPhNBHCdCHLzVY3mQVHFGvqdhIG839og=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kbMEJ/2CeBThHK6oclm7wcbac9K6EckSXLa/aeAzvHOagyKzcJ1yP7Vh7VH/yH8L5SELD+KxEZ55KQxICJhsNCWxpcXlLSmI38/vDshlZsogZwcex8JpZxiX32E5vac4Mt7PfoyJQ0/WGQp4BClQsp7oAj2zrjIGpnNcYu/vKt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ipbA75QQ; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ipbA75QQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750834201; x=1782370201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R5rzPg0wfSfqPhNBHCdCHLzVY3mQVHFGvqdhIG839og=;
  b=ipbA75QQLQY8w23aGZ/B+C6HB3fw3WX6RM2CeCClyUayx6aKWTx3Z3It
   OBBU0hwZLoqkHInZ/rClPCzYyH82jxsC7EOBQ2/JvTwv1Uf3mzjSUtk1M
   U3QksNE63REvQC4WJ8hnZowGMArdfA+86rLdSh8MRcdUtmE0OdcNslo1v
   YuN4Zxx9snLeDP8ZC/4PMiv0n++iLqyJkrn4zGNQALJY3Xa/YJNrem20F
   pepjwuaG1YcOVKMlHTQ5E6fTyzLi+TjjmdIghkyXWF5bZacWFnDMF/ZoI
   LaISoXl829U9qcnGE5e0HKjLK3f/OzGoQZmJ6mIp0FCpl8ry+kKC4vmdG
   Q==;
X-CSE-ConnectionGUID: 4z1r6s7rR4GWDP9QOY3lYA==
X-CSE-MsgGUID: 93f+6zGoRKaRypgVE7vjKg==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="48271088"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 23:50:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 23:49:50 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 23:49:48 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/3] ARM: dts: microchip: sama5d2: Update the cache configuration for CPU
Date: Wed, 25 Jun 2025 09:49:32 +0300
Message-ID: <20250625064934.4828-2-mihai.sain@microchip.com>
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

[root@sama5d2 ~]$ lscpu
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
 arch/arm/boot/dts/microchip/sama5d2.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama5d2.dtsi b/arch/arm/boot/dts/microchip/sama5d2.dtsi
index dc22fb679333..17430d7f2055 100644
--- a/arch/arm/boot/dts/microchip/sama5d2.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d2.dtsi
@@ -32,6 +32,8 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a5";
 			reg = <0>;
+			d-cache-size = <0x8000>;	// L1, 32 KB
+			i-cache-size = <0x8000>;	// L1, 32 KB
 			next-level-cache = <&L2>;
 		};
 	};
@@ -160,6 +162,7 @@ L2: cache-controller@a00000 {
 			interrupts = <63 IRQ_TYPE_LEVEL_HIGH 4>;
 			cache-unified;
 			cache-level = <2>;
+			cache-size = <0x20000>;		// L2, 128 KB
 		};
 
 		ebi: ebi@10000000 {
-- 
2.50.0

