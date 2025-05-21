Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1702221573;
	Wed, 21 May 2025 05:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806284; cv=none; b=RwLDnH1JmP2Whq3/q/9QEq2flNI8iHC6dw9kKu3EhFlxLtaxNMyCqNo43ca2qAs/MWm/79ChL+P7B9Nj71onE4/bDzwGk4pkGuJm9qrZmEz2+Ejh3YmuMInzUCl4p48px5/+59fwcLcukJbY1OkzG1qkeoIAQRB+zuT8ZjOkcU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806284; c=relaxed/simple;
	bh=K7bMnq0n3jG5IfmeVwyzBiEB38kEhphyrlTYWLlNtKw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M9klPJKrPM2E7YIxwymzMVtZQmYygjnJEysfPWW+UgzIfPpahnXKouGoWYN401MYJcfVybuoz8REmUyfqjTjEML2SP6l8agKILTR0mUUc5kwvT2VkvbN3tlsCHvbTsQfsWl2BJIQA73ES19aalmyCaFWHDcKcJ9iVQ3dlkTBOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=1/3ow9bb; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1/3ow9bb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747806282; x=1779342282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K7bMnq0n3jG5IfmeVwyzBiEB38kEhphyrlTYWLlNtKw=;
  b=1/3ow9bbFTYuLiAdCNPx4CzZibAFXKgDWBEN5dbIsOVDKezScHVYfDWf
   vWll7FHiWxanJC7l+eQsFeUaV0+lEebdGaZ5do1ANwZKsH32vplGpQcDb
   IRDhkvF0JcXFTXsV0z3TKwt5+fWvdlgqkvHVBMEOe4t3fa/bfD6fE11jF
   IXjHexFaJV5SA15CzcuyILOMZ5NCtCjt9uSConhI3UV6BR/4p0Jr7T826
   qZTvBjkyVfLHthaoYj3kC+Ny+r3TN54XALn7L/iLgHySbQJPoOYmgRO1h
   6GEGE3qpmAbgfN5DEDkZZT0xmiJ561FxB0GxpB1vEZ+GnMWM145Y6TyGO
   g==;
X-CSE-ConnectionGUID: OHsW4HofReOO8QjhtcrDLg==
X-CSE-MsgGUID: 9ssiEkXmRVWT+8rHJ/me/g==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="41428790"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2025 22:44:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 20 May 2025 22:43:45 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 20 May 2025 22:43:40 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v2 4/4] ARM: dts: microchip: sama5d2_icp: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
Date: Wed, 21 May 2025 11:13:09 +0530
Message-ID: <20250521054309.361894-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521054309.361894-1-manikandan.m@microchip.com>
References: <20250521054309.361894-1-manikandan.m@microchip.com>
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

Fixes: 46a8a137d8f6 ("ARM: dts: at91: sama5d2_icp: Set sst26vf064b SPI NOR flash at its maximum frequency")
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- add fixes tag
---
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
index 9fa6f1395aa6..fbae6a9af6c3 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
@@ -714,7 +714,7 @@ flash@0 {
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

