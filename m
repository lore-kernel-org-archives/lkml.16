Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2135372601;
	Tue,  1 Jul 2025 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350942; cv=none; b=REWU6EYjCMcqeUTXRy/c9zoamuOa1iir332MJp9jCZ+qrflfwgbNUo9wa0i+rkY1tsC2noDdSToOM3oV3fNj8GvtkWUf72i+11jlK2FQa8nbtMbCXaBjYqSAKSxpJp6SgGhe9Az5ccwt198RvO8BEy0HOVZDWfc8GO/Fe7+vnzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350942; c=relaxed/simple;
	bh=DgD4QQS+mG+zLpzFPCLStAWQKq1H0HzqNOx5ljMAres=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fw6GlIoZfnDqoectakm14+VticHoSePoZ0HVcKhF4pgJVTEvpEXRaFL5juGcyGOKuzU6STeSi7wJvFG/t50EdnAnw9UA4J09sf7o7LC0J7LqWaZ5tQ8m4erx/VBloHL5IjVoeXD6t7mSMFoISxVlrXf2+GFGGH90BuTxxfG6YjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=haD+6Se7; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WQU/G5rj reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="haD+6Se7";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WQU/G5rj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751350939; x=1782886939;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MjSMNcZZ2ete1GWczfUi5IrEuGAKczh4J5IOTIEWugw=;
  b=haD+6Se7tGcb4MNdK46pD72c6uSDkOCQYTkyioVOzVhkbO+8qicpsUkc
   Aae0L/KOhiDYTKln+a1t3vMCOGJ69/vN4z9ZWEDB0vh+VJpTPVYHvcMk8
   6jFUT77MFEtC1faDgiC8d0Jqne7IY+n+p9/st8OhHv0qTh4fHJ9ZVwfH6
   F8NG5P0hAZZy854e0nNCDVfAUevHtDNGcLFbS0gazm0bZfEwfhEkYKOpR
   4XysIasp6AkahxrTOGMsfvV+9c5rIkPAZRVWZqUuR5k2zbkonMHNzTE1Q
   Rog1yqm5un1lekgsGoVEnRKfv5RzkEhYIjevxhsorfUv6/Ooya6SAfs9f
   Q==;
X-CSE-ConnectionGUID: dHZb3B1ySyuege6VeV3y6A==
X-CSE-MsgGUID: zxMUaGSqTsy5KQbFdKQa9g==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943273"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:22:09 +0200
X-CheckPoint: {68637E91-12-468F1319-EAD2FB43}
X-MAIL-CPID: 234CE97BDF3128C75316C14566837CCC_0
X-Control-Analysis: str=0001.0A006374.68637E9D.0022,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D2501613A2;
	Tue,  1 Jul 2025 08:22:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751350924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MjSMNcZZ2ete1GWczfUi5IrEuGAKczh4J5IOTIEWugw=;
	b=WQU/G5rjLQgX08HWWPHfri3RGMKs2e0YRbSH0K18xOjkA4C/8/oPgEsYtvlWEBy+uGdtl/
	Ty8aij/nVbp5gcSHABoq6SPVDYbEenh1z0ofR9/aH5PoqRylKabn4C9GqPzGF8QmYLhbLY
	nsBKKtN7xuBbWG4ICCbtPTbtO+e037kqRnfsQKPAoSiGLRFz5LoQ6I6eRiiVZnOmnIsLZt
	PL1OoDBsmYs5r1oEQndYo3DehHsMrZaDrAP1na7KNpYenSQMbT4oupL7bRU4oupM+oIWuj
	saT8vP82zQ8InxK6ieaXGsMj4d6PUUyoUyBbMAsfSETqYL95/1LT2FPGAX0qbA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: fsl-ls1043a: Add missing DMA entries for I2C & LPUART
Date: Tue,  1 Jul 2025 08:21:54 +0200
Message-ID: <20250701062157.514969-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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
 .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index c0e3e8fa1e794..26bea88cb967c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -550,6 +550,9 @@ i2c1: i2c@2190000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			scl-gpios = <&gpio4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 36>,
+			       <&edma0 1 37>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -563,6 +566,9 @@ i2c2: i2c@21a0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			scl-gpios = <&gpio4 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 34>,
+			       <&edma0 1 35>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -576,6 +582,9 @@ i2c3: i2c@21b0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			scl-gpios = <&gpio4 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 40>,
+			       <&edma0 1 41>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -717,6 +726,9 @@ lpuart0: serial@2950000 {
 			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen QORIQ_CLK_SYSCLK 0>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 32>,
+			       <&edma0 1 33>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -727,6 +739,9 @@ lpuart1: serial@2960000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 30>,
+			       <&edma0 1 31>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -737,6 +752,9 @@ lpuart2: serial@2970000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 28>,
+			       <&edma0 1 29>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -747,6 +765,9 @@ lpuart3: serial@2980000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 26>,
+			       <&edma0 1 27>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -757,6 +778,9 @@ lpuart4: serial@2990000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 24>,
+			       <&edma0 1 25>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -767,6 +791,9 @@ lpuart5: serial@29a0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 22>,
+			       <&edma0 1 23>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.43.0

