Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97931E3787;
	Fri,  6 Jun 2025 13:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215078; cv=none; b=kmFU6nd7D28dX5+8Ed6YNqLnL0aM2Tu1VuPdYdHGfQhX9KinhhMsRz7G9gH5XQHn+5hIvG7FZva58dmgUXfZzIiD/6iU1yym5L1+WJo3XqwFKkMyhxrw5/JhBMeUnDSKqB+bsOWiT1+qiQrSVrCAkmTL8TfY6udj7gcp6p4oRJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215078; c=relaxed/simple;
	bh=jTSNMcwQcnd09ekHunIb6JTUWDhAjp5JQVTJVZEc7Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnXmjoldg8ovEOXqJUxDCCNoqL2x8CTH4RnHeuiC3Iu6oasf2Myv9dUyjUYvHHP5yYJtYwMJsh0teyRrz4Nny+pD04pNh5rUaYWPCZ4f6eNCQJJu/rUfLJopIHqm0jQdJsvBAgEhoVXQsuXWMcp4r4qAbINz6+b10MtIVo0wNz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 6810BB4C4439;
	Fri,  6 Jun 2025 15:04:31 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: E Shattow <e@freeshell.de>
Subject: [PATCH v1 3/3] riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot loader
Date: Fri,  6 Jun 2025 06:02:38 -0700
Message-ID: <20250606130253.1105273-4-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606130253.1105273-1-e@freeshell.de>
References: <20250606130253.1105273-1-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bootph-pre-ram hinting to jh7110.dtsi:
  - CPU interrupt controller(s)
  - core local interrupt timer
  - DDR memory controller
  - oscillator
  - syscrg clock-controller

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 6fdeac3e0aff..8a56e8b91b61 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -35,6 +35,7 @@ S7_0: cpu@0 {
 
 			cpu0_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
+				bootph-pre-ram;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
@@ -68,6 +69,7 @@ U74_1: cpu@1 {
 
 			cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
+				bootph-pre-ram;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
@@ -101,6 +103,7 @@ U74_2: cpu@2 {
 
 			cpu2_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
+				bootph-pre-ram;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
@@ -134,6 +137,7 @@ U74_3: cpu@3 {
 
 			cpu3_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
+				bootph-pre-ram;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
@@ -167,6 +171,7 @@ U74_4: cpu@4 {
 
 			cpu4_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
+				bootph-pre-ram;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
@@ -321,6 +326,7 @@ mclk_ext: mclk-ext-clock {
 
 	osc: oscillator {
 		compatible = "fixed-clock";
+		bootph-pre-ram;
 		clock-output-names = "osc";
 		#clock-cells = <0>;
 	};
@@ -354,6 +360,7 @@ soc {
 		clint: timer@2000000 {
 			compatible = "starfive,jh7110-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0x10000>;
+			bootph-pre-ram;
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
 					      <&cpu1_intc 3>, <&cpu1_intc 7>,
 					      <&cpu2_intc 3>, <&cpu2_intc 7>,
@@ -376,6 +383,7 @@ memory-controller@15700000 {
 			compatible = "starfive,jh7110-dmc";
 			reg = <0x0 0x15700000 0x0 0x10000>,
 			      <0x0 0x13000000 0x0 0x10000>;
+			bootph-pre-ram;
 			clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
 			clock-names = "pll1_out";
 			clock-frequency = <2133>;
@@ -893,6 +901,7 @@ qspi: spi@13010000 {
 		syscrg: clock-controller@13020000 {
 			compatible = "starfive,jh7110-syscrg";
 			reg = <0x0 0x13020000 0x0 0x10000>;
+			bootph-pre-ram;
 			clocks = <&osc>, <&gmac1_rmii_refin>,
 				 <&gmac1_rgmii_rxin>,
 				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
-- 
2.49.0

