Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A869E1A9B23;
	Wed, 21 May 2025 05:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806235; cv=none; b=p8zBLRf5nS/Mune+5bEfpnMrSf66fUGNPQ90OsqmQC8uVdoMcF9q3gRv8ZKXS8Q3P4v2KFa9Q5Inxz0J+/8N/P5rrTX02g5S6ZBdm3GnnZOEfX1ISkksdwJj1d678ek5HkA3J3gUEeS8AXPutz6ME1vsn9ckECH5bKEIFHqLfSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806235; c=relaxed/simple;
	bh=EC21TXP6G5n52bTvnTrND4/c9M0afwyTeFu0AcKsBrw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KrZoixtMOHxqdQvYETSTTjot89DwYPyl8Xd7gtq7a9gQiF2wh8E9q7PtKmVHhZUoi5pdWqern98YiYoL/8iNMlq6gx2EbpJKcpo5hcpehhfldv/M8364mfZJjfiDMXYItzt6Zs3vBWzBFUpMZgb6SSjhiDKWnt8PE6yBDf3ohP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=2SJEumx8; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2SJEumx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747806233; x=1779342233;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EC21TXP6G5n52bTvnTrND4/c9M0afwyTeFu0AcKsBrw=;
  b=2SJEumx8AeVJJI6UAeYxaH6fxwzr765ESHBg5oKS3JdHWz6SH7ESy0FT
   b5WmqURS/OySNO/AYUvjpIM1Dc6I3yGDR5VyDK3uZjRG/3m1MPy/o9gwf
   0AMtjrUPQaasi7JJQYF3luf3zlmurzg1RindxJvbN4kHU8rAUSsGiM2Hn
   5anS8Yl7lz1KRbsxnlRHTNaBKVovlFPXOh7cloJaQ28RQsiOs/SEgKLpg
   cqPkqCS4BDf6xd/060KMvVJaVEW0v3wWL6ux2kzKErhIIwwJiSouITUZu
   m6+cPbImybpseh+T9WXpGX/Os2WNHp5rfCHywiEat3LS9kFRk420YGBZm
   g==;
X-CSE-ConnectionGUID: k0o2CMOdRGO0OGeppoCe8w==
X-CSE-MsgGUID: lw/LZ2bVSAGWY62L5J/plA==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="41428745"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2025 22:43:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 20 May 2025 22:43:21 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 20 May 2025 22:43:17 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v2 1/4] ARM: dts: microchip: sam9x60ek: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
Date: Wed, 21 May 2025 11:13:06 +0530
Message-ID: <20250521054309.361894-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The naming scheme for delay properties includes "delay" in the name,
so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.

Fixes: 2c0a1faa4da5 ("ARM: dts: at91: sam9x60ek: Set sst26vf064b SPI NOR flash at its maximum frequency")
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- add fixes tag
---
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
index cdc56b53299d..c1ff3248bd8f 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
@@ -609,7 +609,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
-		spi-cs-setup-ns = <7>;
+		spi-cs-setup-delay-ns = <7>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		m25p,fast-read;
-- 
2.25.1

