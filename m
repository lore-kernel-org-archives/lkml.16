Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28575482CD;
	Mon,  3 Feb 2025 01:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738546934; cv=none; b=SFD7O+VLpYcrOzqvMcXp8JQ8Zrh5JCYoPbP+JiqdpwsufXm5wN3AVSwSbeHAMye4vIfqFymA7JV78PrIFb32w3FXMvRSa7mITdcLIQNhRiaedeawDJ4Rndf3L/8uVmjpGAUjOl+OwBQpykW0eoiXfyI1tRZKrs+Fu1MG21aR1Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738546934; c=relaxed/simple;
	bh=hbILJRhOajjQvdIDuiAXO7pNMPa0AFHUFzVGGjg7iaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dF8BnvOaIFO1+vRu8w/reMjDqLcgs+Sx3zkOwWitJ6kiQem9l9Gan+51FiSvf5Py4DnoSNKEM3bBI6/W4jNklXaAV11hUWODGw29zMGP48sCNob4mk3noKGx/3mxiJG1Fcl6dQzJLgUZlBPQ9D8U6BFdeNwRN+VU1z+xFaxnYUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 4128BB2C1529;
	Mon,  3 Feb 2025 02:42:08 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by boot  loader
Date: Sun,  2 Feb 2025 17:37:11 -0800
Message-ID: <20250203013730.269558-6-e@freeshell.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250203013730.269558-1-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de>
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
  - uart0 for serial console

  With this the U-Boot SPL secondary program loader may drop such
  overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 30c5f3487c8b..c9e7ae59ee7c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -28,6 +28,7 @@ chosen {
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x1 0x0>;
+		bootph-pre-ram;
 	};
 
 	gpio-restart {
@@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
 	};
 
 	eeprom@50 {
+		bootph-pre-ram;
 		compatible = "atmel,24c04";
 		reg = <0x50>;
 		pagesize = <16>;
@@ -323,6 +325,7 @@ &qspi {
 	nor_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		cdns,read-delay = <2>;
 		spi-max-frequency = <100000000>;
 		cdns,tshsl-ns = <1>;
@@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
 	};
 
 	i2c5_pins: i2c5-0 {
+		bootph-pre-ram;
 		i2c-pins {
 			pinmux = <GPIOMUX(19, GPOUT_LOW,
 					      GPOEN_SYS_I2C5_CLK,
@@ -413,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
 					      GPOEN_SYS_I2C5_DATA,
 					      GPI_SYS_I2C5_DATA)>;
 			bias-disable; /* external pull-up */
+			bootph-pre-ram;
 			input-enable;
 			input-schmitt-enable;
 		};
@@ -641,6 +646,7 @@ GPOEN_DISABLE,
 };
 
 &uart0 {
+	bootph-pre-ram;
 	clock-frequency = <24000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-- 
2.47.2

