Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15FF263C6A;
	Tue,  1 Jul 2025 06:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351157; cv=none; b=Js99nKPm9mpc2gytmEBbrGOeUNFKqs4U79Y1TemU80++CHxuRyMER7lHJLOKPgAPi9ZyT5Q+KtRectZdnNwR+T2kWyifGFWtcZmLTUJMxrXq0Iqt5V2MF0CVuDyoHgiQmW2PgG3kEcI5haB9ZhiRasgyfaGCApvSJIOeZVtwyVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351157; c=relaxed/simple;
	bh=VADQ6MwbWj3js/zVYNuKSW3x5CmxDSYekTsOCj8p9iU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/dRc8ozUOeRF5TL7Pn38tw17UGyrNXKZjC2RyLf4lEwF0Ef/P4+dKjmpf8CX2Ls37Jp3sHZJhWLCKJAx8iPTlNN679LeX9O8VXAnEE/Xz4iPjtrv1e0QitHt5UpUcY836d+h9Jz2mMgOzKRcXN2/8AW74yFxyaa+r2c5+BHwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=jUYShg5e; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oABy/B+x reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="jUYShg5e";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oABy/B+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351155; x=1782887155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6NkF+N0UTMUAuCV32wzpvbEEFJ7QOlBg6lBSc9eDzN4=;
  b=jUYShg5ecFJV/+YAJiSvJjb1mAzBWCq8i18QxoiVDWIHg/uiUL7PA1j6
   Q0svyfw46482yXd5plCi/kgbCygAL9vreWxokbCoKlK7DiwZKsWhRgGH6
   GrutUCN6BFsUz5sAaBRcja3uWADtyJGm7NfqCZUYNPDS+p7e8qLoKlTKP
   ibzthikhkDH9Kd8b6Yqs1KjHZlrhY67qCoqLBaoYDCLBZsjYv/Pvtskhh
   zr5I6iOOdPehYxPptZWTYZwE+hmsjP80ESxXF0dDId8Y8t2kuUeNhx85Q
   g1DUdorpEXYgnpKvORByE703wrkJKQXsKsph3qmYUEgzfn2bDVw8Lk2uz
   w==;
X-CSE-ConnectionGUID: 4ELenKTjQHCpdQmFjYVtEw==
X-CSE-MsgGUID: P6lS5ylOTCykmUzLB5Vl8A==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943391"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:53 +0200
X-CheckPoint: {68637F71-46-497D558D-EBA6F5A1}
X-MAIL-CPID: 05F84F041D6AE13DEE7297BF9477E7D2_3
X-Control-Analysis: str=0001.0A006378.68637F8D.001C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45F0916A623;
	Tue,  1 Jul 2025 08:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6NkF+N0UTMUAuCV32wzpvbEEFJ7QOlBg6lBSc9eDzN4=;
	b=oABy/B+xOExrtUzf9jDLKkdHAW6oOE9sq083m6MstFeKcEKypWM+21acdRu2SCvNE3C0Rl
	SJHmkT8xjAJjsVBISKENbSU7cGD1HQdlxpZ2Ejgr7N0IoK8h8xdcnacQsgvIoVADV3L0yn
	ClA0UhKz/4Qce+9f5yLqzzkf+Q1ob0bcg/eexKftv7bPRXSc+XIn7aSGSrO9+W0EGiCil6
	ibnL2nzq5749gH4pFFo9f2o1gODm7Lh7E9mAGRiqtPF58nIgytLC65twPnut335C7WY9qc
	3a2upIpckF9XEvHF9MRdXvgDNv619XbAYON+i/A80BiizymxfMHB8y+Gb1eT4g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 8/8] arm64: dts: freescale: tqmls10xx: Add vdd-supply for spi-nor flash
Date: Tue,  1 Jul 2025 08:24:56 +0200
Message-ID: <20250701062500.515735-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi             | 8 ++++++++
 4 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
index e39eaa1759365..257d90bb9c206 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
@@ -20,6 +20,7 @@ qflash0: flash@0 {
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vcc1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
index cafb35f674aa4..fa543db99def6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
@@ -20,6 +20,7 @@ qflash0: flash@0 {
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vcc1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -36,5 +37,6 @@ qflash1: flash@1 {
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vcc1v8>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
index 66a7aff893b32..b8a213df238a5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
@@ -20,6 +20,7 @@ qflash0: flash@0 {
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vcc1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -36,5 +37,6 @@ qflash1: flash@1 {
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vcc1v8>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi b/arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi
index 138f8778afde6..7da1bfd83cca2 100644
--- a/arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi
@@ -8,6 +8,14 @@
  */
 
 / {
+	reg_vcc1v8: regulator-vcc1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
-- 
2.43.0

