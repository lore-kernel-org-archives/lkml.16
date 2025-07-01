Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77DE2594AA;
	Tue,  1 Jul 2025 06:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351135; cv=none; b=ah8h6MSz/ZYHpiTBmEsOJKJFco4lULcKhvP4j64e+2dfKHf+Sfx2x7X9NP2KutB1EWA5F/EQGfElx6O2iN8sYD/SEYxf0uBrg4U9iWUXIjLcbCq2XmNe2/LPMjvkaTSUfR+KkExMEp5LSKPiKRLEFhCUGliXrQgwU0GBRte0fDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351135; c=relaxed/simple;
	bh=nSGnsfdsZhbGs0QPUzBEU7dBHZSUpywdK3iGNwLtqaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJNTH30su+BLPpqj/FTnAXC5GWnrz5Lb94tNxO2yt6eTCh2xDtOu6ZgX8TiJPF21SpXXE9cmRB8bJLOMaiDbBP9L8UPOf8z6XtN4YIJvd0eYSRWXB+19J4hJvyrB/73cEUSYvPZcG88ViKOoDCvys0iwpeBYz+YWTe+FBpoAPOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=amNdvyOV; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cjO63h4S reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="amNdvyOV";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cjO63h4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351134; x=1782887134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e7lV+EdrJiHZUENL9nZ+vLpZffSX0le/6v3EV1toAGc=;
  b=amNdvyOV30ucGkioDwJvpbdUUf06H+TFAYKnHS0ptCBNXIXVTxO+2rNu
   acVrIUmufrZBiq95CKwe+hs6orrM4AvJypLUo4ZJ0JIdyUYb3S5NWHdfI
   tTEvCPiwZWzeqT78p2SfMTq+K7QU28ELC5XE5FXjfcozIZ4Ti1WJchZ2J
   6YOwp6t97uRq7F31N/M5HKkQ21JijtaadI0dB/PR2GZnIPKDGdqD1uMtB
   kjVZS1crjGpKyo7rZjpgU9SNC4BS+3etmCFDUhpZ7CX8ehwa1ui3X3G4m
   +WVO7f01vhD68UOOZhtdRjtZvvwECnv26KIk7noS38K3j/1F2TsuINMKH
   w==;
X-CSE-ConnectionGUID: 0RKO7NnNSJ+x7W/9+zamMQ==
X-CSE-MsgGUID: E0IA9g6BRdmBj+637XBcRw==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943378"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:32 +0200
X-CheckPoint: {68637F5C-2B-B6FA1C9B-ED1A9D03}
X-MAIL-CPID: EDF74480CD697FC205C2341381A821B7_2
X-Control-Analysis: str=0001.0A006377.68637F6A.0016,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43F9E16A551;
	Tue,  1 Jul 2025 08:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e7lV+EdrJiHZUENL9nZ+vLpZffSX0le/6v3EV1toAGc=;
	b=cjO63h4SEuKC+q1qWQhIztfxkIqB1N72p6lg0UiW348Pc9Dbu2vp131f2K8KR7FTCsZVHs
	cAz+lQ54jbhiOt+KD8emsCUAXs+bXc7LqculcIglCdSiY2Hx80nQ74372Unko9FaCRmoN2
	7keU9yjlXvlnJfJt61X1UKkGiDpIBwfUGYczLiErTWe+nHLXGr+LH5qOIT7bHYi1iK8NDr
	RKZX65cqa7Ov9l1JZRkCjcGb5ZInv4h5Eu2uXtaB5BcUZ0gSHFbbvHD6x6HMBO1Vu0bdt2
	C3U264oLAnwNdJebsVeDUY9jFuHS3iuYbXzH57706owzecHOwq4+MzofQyf4hw==
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
Subject: [PATCH 4/8] arm64: dts: tqmls10xxa: Move SFP cage definition to common place
Date: Tue,  1 Jul 2025 08:24:52 +0200
Message-ID: <20250701062500.515735-5-alexander.stein@ew.tq-group.com>
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

SFP is placed on mainboard, available to TQMLS1043A/1046A/1088A.
Provide it in a common place, disabled by default.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-ls1088a-tqmls1088a-mbls10xxa.dts      |  8 ++++++++
 .../freescale/tqmls1088a-mbls10xxa-mc.dtsi    | 16 ---------------
 .../dts/freescale/tqmls10xxa-mbls10xxa.dtsi   | 20 +++++++++++++++++++
 3 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
index e567918f6afc6..181eeab55aa07 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
@@ -53,6 +53,14 @@ &esdhc {
 	wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 };
 
+&sfp1 {
+	status = "okay";
+};
+
+&sfp2 {
+	status = "okay";
+};
+
 &sfp1_i2c {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi b/arch/arm64/boot/dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi
index 2471bb109e8e5..9d44f488c0836 100644
--- a/arch/arm64/boot/dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi
@@ -10,23 +10,7 @@
 #include <dt-bindings/net/ti-dp83867.h>
 
 / {
-	sfp1: sfp1 {
-		compatible = "sff,sfp";
-		i2c-bus = <&sfp1_i2c>;
-		mod-def0-gpios = <&gpioexp2 2 GPIO_ACTIVE_LOW>;
-		los-gpios = <&gpioexp2 3 GPIO_ACTIVE_HIGH>;
-		tx-fault-gpios = <&gpioexp2 0 GPIO_ACTIVE_HIGH>;
-		tx-disable-gpios = <&gpioexp2 1 GPIO_ACTIVE_HIGH>;
-	};
 
-	sfp2: sfp2 {
-		compatible = "sff,sfp";
-		i2c-bus = <&sfp2_i2c>;
-		mod-def0-gpios = <&gpioexp2 10 GPIO_ACTIVE_LOW>;
-		los-gpios = <&gpioexp2 11 GPIO_ACTIVE_HIGH>;
-		tx-fault-gpios = <&gpioexp2 8 GPIO_ACTIVE_HIGH>;
-		tx-disable-gpios = <&gpioexp2 9 GPIO_ACTIVE_HIGH>;
-	};
 };
 
 &dpmac1 {
diff --git a/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi b/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
index 65b4ed28a3d4c..40fa41eadd836 100644
--- a/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
@@ -47,6 +47,26 @@ reg_3v3: regulator-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
+
+	sfp1: sfp1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp1_i2c>;
+		mod-def0-gpios = <&gpioexp2 2 GPIO_ACTIVE_LOW>;
+		los-gpios = <&gpioexp2 3 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&gpioexp2 0 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&gpioexp2 1 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+
+	sfp2: sfp2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		mod-def0-gpios = <&gpioexp2 10 GPIO_ACTIVE_LOW>;
+		los-gpios = <&gpioexp2 11 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&gpioexp2 8 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&gpioexp2 9 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
 };
 
 &duart0 {
-- 
2.43.0

