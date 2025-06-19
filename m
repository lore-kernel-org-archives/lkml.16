Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7218F192B7D;
	Thu, 19 Jun 2025 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316833; cv=none; b=fBTZQ0lGqQtVaxwdTQeOOt4iNyj7jYUiawsej9ICk1JdqVUkVYrq6MCEHq5AbQwYDQraj5bFQV31ExQriKvd7qCVfTEL0wpBXxO4NIw2daMkZqZeTLT5HrXfRUATTALWQMSLLFJ2h+CjADk+wneMT11dPNBZVHVJC9Ts1EbRAqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316833; c=relaxed/simple;
	bh=C4QpgZkZ9IIpsWFHkaQ514mxLlArKqKI3Y9pvUN/FWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nymXZyBKRiGn+si3HRwNO0w32JnMJ6toYNH8dUbuuCSmhEJJY30EBPkf69GSICpjr6xo8dZ5GrSeyqTc6/EMo3pipYatXQFE83EmVWx8Jljhf5asCX4bJ63d1xUNvfrU5wJwApTfjwR7D/qlEF6UuCh8NR3Rls8ikWq1tZqt1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Ed9A7ROB; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Ed9A7ROB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750316828; x=1781852828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C4QpgZkZ9IIpsWFHkaQ514mxLlArKqKI3Y9pvUN/FWI=;
  b=Ed9A7ROBjeCgS07GzzUQaq2K7fPIPmoxp8MXf8kGIDCW+usPh+YVZ39a
   D5TbarSMwIbl9aNWkswtPzaGAl1JbFsM/AVBwYxQMk38N+tUMdoyDaXDg
   IUWM2yiXYlUo9G/niFYfCQpM6E34LN+HpCiHTafOb/gG2d4hpLuMh+Tt/
   FHiZWNBn6QZoJdf32hXXy38PPTqhK66VXzPVg4y3FkSC/frR5LJmIIorB
   Fpx3KGmkMtZTCOFHqOgBF0cRbxFpQh86TnAdpcGF/lyfg3hfvhlAdISqm
   Fz+QGDEgDqJ8P5QJoWJ5kCtqMA5CzR2bsVfFOOod5/5qiibH9fnXstKPY
   A==;
X-CSE-ConnectionGUID: PlQ5gDZlQHSrfxlUJA1/0Q==
X-CSE-MsgGUID: Gh79I1KERw++gOMSoTiWPQ==
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="48018357"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 00:07:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Jun 2025 00:06:46 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 19 Jun 2025 00:06:44 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 1/2] ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
Date: Thu, 19 Jun 2025 10:06:35 +0300
Message-ID: <20250619070636.8844-2-mihai.sain@microchip.com>
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

[    0.161955] cacheinfo: Unable to detect cache hierarchy for CPU 0

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index d08d773b1cc5..f123faaa2ef7 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -32,6 +32,16 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
 			clock-names = "cpu";
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

