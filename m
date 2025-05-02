Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D3822D4C8;
	Fri,  2 May 2025 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746181909; cv=none; b=Ji6s+Eews+X+DZ/QR/ikT2qfIn7qTt8dF/vBsTYLzg8S/yX1iDiv5kJqbl5E8vmXIY7YRJfKF/uT/4geOSEApwKZLSNlj5ZGwokC3EwMaZm2CtbUhHu6BNA+GQUJm2TzmBTOLb+kJM7M55eWuYP1ovO+VrLqdFp7EWuD9/qcZiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746181909; c=relaxed/simple;
	bh=ude+34SekGs1D0woRTY6kRCOUKBE+OC2Cp4Bvkd6jyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaPS3VClh94fhbxzVWIOjQr5dRyQQG+v+8XCHglQ/hQXFor4nn16VjX7XyJS6ds/0Jg1+iUAHYwzaFO1lRXZo6oHMli+hrHhKThYwG5GNL1mFnHRd+NoCkBbgKed6Q9bR8Y08VEaztUSYBsweE5FrVEChjOwpOXz2d+NtwZYyQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 69C78B4C2409;
	Fri,  2 May 2025 12:31:43 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 4/4] riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by boot loader
Date: Fri,  2 May 2025 03:30:44 -0700
Message-ID: <20250502103101.957016-5-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502103101.957016-1-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bootph-pre-ram hinting to jh7110-common.dtsi:
  - i2c5_pins and i2c-pins subnode for connection to eeprom
  - eeprom node
  - qspi flash configuration subnode
  - memory node
  - mmc0 for eMMC
  - mmc1 for SD Card
  - uart0 for serial console

  With this the U-Boot SPL secondary program loader may drop such overrides.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index f1dc45b98e1d..d2cdb2f276c3 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -28,6 +28,7 @@ chosen {
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x1 0x0>;
+		bootph-pre-ram;
 	};
 
 	gpio-restart {
@@ -249,6 +250,7 @@ emmc_vdd: aldo4 {
 	eeprom@50 {
 		compatible = "atmel,24c04";
 		reg = <0x50>;
+		bootph-pre-ram;
 		pagesize = <16>;
 	};
 };
@@ -268,6 +270,7 @@ &mmc0 {
 	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
 	assigned-clock-rates = <50000000>;
 	bus-width = <8>;
+	bootph-pre-ram;
 	cap-mmc-highspeed;
 	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
@@ -285,6 +288,7 @@ &mmc1 {
 	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
 	assigned-clock-rates = <50000000>;
 	bus-width = <4>;
+	bootph-pre-ram;
 	no-sdio;
 	no-mmc;
 	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
@@ -323,6 +327,7 @@ &qspi {
 	nor_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		cdns,read-delay = <2>;
 		spi-max-frequency = <100000000>;
 		cdns,tshsl-ns = <1>;
@@ -402,6 +407,8 @@ GPOEN_SYS_I2C2_DATA,
 	};
 
 	i2c5_pins: i2c5-0 {
+		bootph-pre-ram;
+
 		i2c-pins {
 			pinmux = <GPIOMUX(19, GPOUT_LOW,
 					      GPOEN_SYS_I2C5_CLK,
@@ -410,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
 					      GPOEN_SYS_I2C5_DATA,
 					      GPI_SYS_I2C5_DATA)>;
 			bias-disable; /* external pull-up */
+			bootph-pre-ram;
 			input-enable;
 			input-schmitt-enable;
 		};
@@ -638,6 +646,7 @@ GPOEN_DISABLE,
 };
 
 &uart0 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
-- 
2.49.0

