Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E081917ED
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844507; cv=none; b=PYbEk+WRG9s1/kY+F72r6PI0L8dGW2Njfs/A/qHda2/+s6dlfgFwg/UYn4iWopFFY3/V8SDE9sVw9XlGHWPaAl2y1TPSQzMqt2qEBynO8n/+w0i2fwKXZSR9C6NyvSRAhqVZEk4aGAXYFJImH/yeXnGeHZA2kQ3oh2znh05uBq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844507; c=relaxed/simple;
	bh=jNs1DW8WFS2jTb8jujAUSvR9PUde07MAhf1TUqDFl/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilmANLIfVNsApJJQeDz5X2r2S+c5oRPEcqPkG576eOGqeNOOAaQOaxpnL0HDSk0pi36HajYB74W7bBQA5rF9WPSd5ESVs444tng7iAGnCS4muaBKIXPJT3xD/Oky7qoeMgn8gJ/S1Z9tvkno8+eVsPRAgMcKvc/u/+x4PV1L1ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 552680ue096234
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jun 2025 14:08:00 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 2 Jun 2025
 14:08:00 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v5 6/8] riscv: dts: andes: add QiLai SoC device tree
Date: Mon, 2 Jun 2025 14:07:45 +0800
Message-ID: <20250602060747.689824-7-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250602060747.689824-1-ben717@andestech.com>
References: <20250602060747.689824-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 552680ue096234

Introduce the initial device tree support for the Andes QiLai SoC.

For further information, you can refer to [1].

[1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
This patch depends on patch 2, patch 4, and patch 5.
Also, the compatible "andestech,qilai-ax45mp-cache" depends on https://git.kernel.org/conor/c/51b081cdb923
---
 MAINTAINERS                          |   2 +
 arch/riscv/boot/dts/andes/qilai.dtsi | 186 +++++++++++++++++++++++++++
 2 files changed, 188 insertions(+)
 create mode 100644 arch/riscv/boot/dts/andes/qilai.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 57a4b3789ef8..ceb51e1ecca0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20950,9 +20950,11 @@ F:	include/linux/irqchip/riscv-imsic.h
 RISC-V ANDES SoC Support
 M:	Ben Zong-You Xie <ben717@andestech.com>
 S:	Maintained
+T:	git: https://github.com/ben717-linux/linux
 F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
 F:	Documentation/devicetree/bindings/riscv/andes.yaml
 F:	Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
+F:	arch/riscv/boot/dts/andes/

 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
diff --git a/arch/riscv/boot/dts/andes/qilai.dtsi b/arch/riscv/boot/dts/andes/qilai.dtsi
new file mode 100644
index 000000000000..de3de32f8c39
--- /dev/null
+++ b/arch/riscv/boot/dts/andes/qilai.dtsi
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Andes Technology Corporation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <62500000>;
+
+		cpu0: cpu@0 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicntr", "zicsr", "zifencei",
+					       "zihpm", "xandespmu";
+			mmu-type = "riscv,sv39";
+			clock-frequency = <100000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&l2_cache>;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "andestech,cpu-intc", "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			reg = <1>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicntr", "zicsr", "zifencei",
+					       "zihpm", "xandespmu";
+			mmu-type = "riscv,sv39";
+			clock-frequency = <100000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&l2_cache>;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "andestech,cpu-intc",
+					     "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			reg = <2>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicntr", "zicsr", "zifencei",
+					       "zihpm", "xandespmu";
+			mmu-type = "riscv,sv39";
+			clock-frequency = <100000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&l2_cache>;
+
+			cpu2_intc: interrupt-controller {
+				compatible = "andestech,cpu-intc",
+					     "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			reg = <3>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicntr", "zicsr", "zifencei",
+					       "zihpm", "xandespmu";
+			mmu-type = "riscv,sv39";
+			clock-frequency = <100000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&l2_cache>;
+
+			cpu3_intc: interrupt-controller {
+				compatible = "andestech,cpu-intc",
+					     "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		interrupt-parent = <&plic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		plmt: timer@100000 {
+			compatible = "andestech,qilai-plmt", "andestech,plmt0";
+			reg = <0x0 0x00100000 0x0 0x100000>;
+			interrupts-extended = <&cpu0_intc 7>,
+					      <&cpu1_intc 7>,
+					      <&cpu2_intc 7>,
+					      <&cpu3_intc 7>;
+		};
+
+		l2_cache: cache-controller@200000 {
+			compatible = "andestech,qilai-ax45mp-cache",
+				     "andestech,ax45mp-cache", "cache";
+			reg = <0x0 0x00200000 0x0 0x100000>;
+			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <0x200000>;
+			cache-unified;
+		};
+
+		plic_sw: interrupt-controller@400000 {
+			compatible = "andestech,qilai-plicsw",
+				     "andestech,plicsw";
+			reg = <0x0 0x00400000 0x0 0x400000>;
+			interrupts-extended = <&cpu0_intc 3>,
+					      <&cpu1_intc 3>,
+					      <&cpu2_intc 3>,
+					      <&cpu3_intc 3>;
+		};
+
+		plic: interrupt-controller@2000000 {
+			compatible = "andestech,qilai-plic",
+				     "andestech,nceplic100";
+			reg = <0x0 0x02000000 0x0 0x2000000>;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
+					      <&cpu1_intc 11>, <&cpu1_intc 9>,
+					      <&cpu2_intc 11>, <&cpu2_intc 9>,
+					      <&cpu3_intc 11>, <&cpu3_intc 9>;
+			riscv,ndev = <71>;
+		};
+
+		uart0: serial@30300000 {
+			compatible = "andestech,uart16550", "ns16550a";
+			reg = <0x0 0x30300000 0x0 0x100000>;
+			interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <50000000>;
+			reg-offset = <32>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			no-loopback-test;
+		};
+	};
+};
--
2.34.1
