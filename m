Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130571E0E1A;
	Fri, 23 May 2025 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997295; cv=none; b=pSkLJstdLmVPEEf8y2ouTWgUB7CoNAb/pgq+IHWdVAoNzs+UVi8l7qmwpDMwUiNaE5fL979etgwOoOm8fxNBIiE/8if5TbXwBofSA9bw+1fHlOCLJ1RrKYBqn9aRkyXDOlputRwI6K8AfO2zb803+N6hLAqPYYHecocI7LnR4QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997295; c=relaxed/simple;
	bh=RDSQaJMIl4s52JXv/6rsXVa1hW+rLPRn4tt6o4Hu6oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/m5kfY8xIeQ4sN+TANoOFQqmpP/X/yhWxPCGn4EC5dT/T5gjj7ssV17fU3eRl1WguK842fNWzJjpmhp+YKXOKiXsO44/TjcZbMRrJkam2CmJhIGT151uGIupgdvEnTgwE4IvjqRSL9EJaI3P18k0G1mxspupE5L10IUvFfX0PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=eqGcF60w; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="eqGcF60w"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8531F2609A;
	Fri, 23 May 2025 12:48:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyF6jddWwMZo; Fri, 23 May 2025 12:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747997292; bh=RDSQaJMIl4s52JXv/6rsXVa1hW+rLPRn4tt6o4Hu6oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eqGcF60we91T0+xfG1y3ly6frYiY8tzQOWap7KO2E3r7bzI8HcMoj0VGZd+s/QeF2
	 A/JqJV3oK1BoZ/gi+x8z83PX/sGpF9eRxY+coVQel5f34l33yeFW9Fu2IhIOvGnk67
	 fktVULfv6zlplDE0vNSoFAlwOlT2rC8/36aOw+NsCUCfuWpPfYKJ2WTcc/sHvLA8Z5
	 wqCN0Mptw9O16F+0Ce6jgoJDNF3mAV+3md4WEkS+X/RLTf+nqqO6ObQ2H9RAZBLVzL
	 Goe5A7H35026AXmFc4ETou3NiBr1GrQQLsBj9g885/PlpRDRYQx+YqXjRh2j4RXImK
	 Hbndh1DR2dDhw==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 7/8] LoongArch: dts: Add clock tree for Loongson 2K0300
Date: Fri, 23 May 2025 10:45:51 +0000
Message-ID: <20250523104552.32742-8-ziyao@disroot.org>
In-Reply-To: <20250523104552.32742-1-ziyao@disroot.org>
References: <20250523104552.32742-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the clock controller integrated in Loongson 2K0300 SoC and
clocks for UARTs.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/boot/dts/loongson-2k0300.dtsi | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
index ce3574691aa9..44e37d6f8e98 100644
--- a/arch/loongarch/boot/dts/loongson-2k0300.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/clock/loongson,ls2k0300-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
@@ -21,7 +22,7 @@ cpu0: cpu@0 {
 			compatible = "loongson,la264";
 			reg = <0>;
 			device_type = "cpu";
-			clocks = <&cpu_clk>;
+			clocks = <&clk LS2K0300_CLK_NODE_GATE>;
 		};
 
 	};
@@ -32,9 +33,10 @@ cpuintc: interrupt-controller {
 		#interrupt-cells = <1>;
 	};
 
-	cpu_clk: clock-1000m {
+	refclk: clock-120m {
 		compatible = "fixed-clock";
-		clock-frequency = <1000000000>;
+		clock-frequency = <120000000>;
+		clock-output-names = "refclk_120m";
 		#clock-cells = <0>;
 	};
 
@@ -46,6 +48,14 @@ soc@10000000 {
 			 <0x00 0x02000000 0x00 0x02000000 0x0 0x04000000>,
 			 <0x00 0x40000000 0x00 0x40000000 0x0 0x40000000>;
 
+		clk: clock-controller@16000400 {
+			compatible = "loongson,ls2k0300-clk";
+			reg = <0x0 0x16000400 0x0 0x100>;
+			clocks = <&refclk>;
+			clock-names = "ref_120m";
+			#clock-cells = <1>;
+		};
+
 		liointc0: interrupt-controller@16001400 {
 			compatible = "loongson,liointc-2.0";
 			reg = <0x0 0x16001400 0x0 0x40>,
@@ -87,6 +97,7 @@ liointc1: interrupt-controller@16001440 {
 		uart0: serial@16100000 {
 			compatible = "ns16550a";
 			reg = <0 0x16100000 0 0x10>;
+			clocks = <&clk LS2K0300_CLK_APB_GATE>;
 			interrupt-parent = <&liointc0>;
 			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
-- 
2.49.0

