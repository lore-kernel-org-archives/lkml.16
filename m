Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41CA24503E;
	Tue,  1 Jul 2025 06:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350945; cv=none; b=Mxo4mm4SEDqjnf8xZlR3F/7uOklhelSot/QEnVrNIlqzDBUJTdlW7eATDcRDsVB0iDRHfBf0pvs5ZFLNU2u9nFw2f6mvzDNQF3fK0qX7a35mr+IOUn8UHVXPoPJ/KJeDYL9I4t3ihj38cBtkTYlTpyKav9hpKms1UD417HgeK2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350945; c=relaxed/simple;
	bh=DO/FC9eqbmHDsDOaTJpR7zYxi/QdSkoXPd6WTZ7eP5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltcis2/Jw4HdYbOBbzzdlkUPHnX3B1cZT8MmqvFanzBE0N1hXA4w8ee1hDiZf4/c464+tjPM2hZbf2RO1uSFgDmeP5QTZt9KEpYmiiwD3CgS84BZIX3MWkmArS15hoYTwY7PBN9VOREIT47a18dk1q9AIbu2kCWeSWm/pLlSwVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=IwXXSFLK; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=HoGaA2xH reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="IwXXSFLK";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HoGaA2xH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751350943; x=1782886943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kR9rfnoVOVe16EyLIxGv6T9MzhuL6wq8eecdODEGjBs=;
  b=IwXXSFLK+UQIElBMGZJjCRBVN73d4LC+0AH6QXhfFIrR4mdcOvYqeKZp
   /mWM6cOETZxEumoWU5h7NjIKD+pUy1GQvuTXhtBYS6mLqvAVdjpIjmfVb
   MkglKSvec3j0bc69OQqZrHucgIfLGhoUkRBGR0C+t4jxAXqAktq5bYdNn
   eTTYxdsnt/VQzrj5bViwo70klW/dWjpMcNC72riGFLNw+qrJLcEHBgN1X
   QvNcTMrr9Sv4LL3D+5+/0YrhCWd1VLX4BLJHGWs4qlgY4J36LG0AWMNk4
   bxfOFtJ7QpSk/RUVwvFFB38MNBYmSG28mkRHu3SogmunFmn5WJ2kOc773
   Q==;
X-CSE-ConnectionGUID: qDvpkikBQVqD4xT6d3HzGQ==
X-CSE-MsgGUID: +tlzL95wQu+Nu0ooHrAyGA==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943278"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:22:13 +0200
X-CheckPoint: {68637E95-51-F34124BF-F8CE6E96}
X-MAIL-CPID: 1DBD312352FCC5035A60DE205D2263D9_4
X-Control-Analysis: str=0001.0A006374.68637EA1.0059,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F9E3167F67;
	Tue,  1 Jul 2025 08:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751350929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kR9rfnoVOVe16EyLIxGv6T9MzhuL6wq8eecdODEGjBs=;
	b=HoGaA2xHrnI+dqY64XbGlGmCZJM00O40EPMWjDSgcwXrFoNDb4r5/iN+mQRBQq7EBxxJoK
	YcsMX9v6ZfCcaWVO0G5wN55WZmo5xdzIBynLnvUXYP65Ar78k03pH0kvstLYI5EHJ7BIGA
	qFyEOKod4oeXMHrhvyVDZZI5YIvnfYHC6toa9xiSPEffM7lZXWS48AMUwBRRwLbi/v9VI7
	9qQtTzlX5toi1S8WSigCQqIee3JYTfmb08ebgAJ4zYn7R0Kl8YWjLnt6v8sUA70YesYV21
	UbnB2/5+wKcqWqCXE7dD3yx6196cYWLtOpwboTBPhoEoFBGM7Tc6vUx+RXkyVA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: fsl-ls1046a: Add missing DMA entries for I2C & LPUART
Date: Tue,  1 Jul 2025 08:21:55 +0200
Message-ID: <20250701062157.514969-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062157.514969-1-alexander.stein@ew.tq-group.com>
References: <20250701062157.514969-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Only i2c0 had it's DMA channels configured. Add the missing one.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 0baf256b44003..d4681c491b33a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -523,6 +523,9 @@ i2c1: i2c@2190000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			scl-gpios = <&gpio3 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 36>,
+			       <&edma0 1 37>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -535,6 +538,9 @@ i2c2: i2c@21a0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			scl-gpios = <&gpio3 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 34>,
+			       <&edma0 1 35>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -547,6 +553,9 @@ i2c3: i2c@21b0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			scl-gpios = <&gpio3 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 40>,
+			       <&edma0 1 41>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -633,6 +642,9 @@ lpuart0: serial@2950000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 32>,
+			       <&edma0 1 33>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -643,6 +655,9 @@ lpuart1: serial@2960000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 30>,
+			       <&edma0 1 31>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -653,6 +668,9 @@ lpuart2: serial@2970000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 28>,
+			       <&edma0 1 29>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -663,6 +681,9 @@ lpuart3: serial@2980000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 26>,
+			       <&edma0 1 27>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -673,6 +694,9 @@ lpuart4: serial@2990000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 24>,
+			       <&edma0 1 25>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -683,6 +707,9 @@ lpuart5: serial@29a0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 22>,
+			       <&edma0 1 23>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.43.0

