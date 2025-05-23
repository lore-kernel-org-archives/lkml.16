Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A05F226520;
	Fri, 23 May 2025 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994141; cv=none; b=jXyzvHFEMV1HYmFtVtALusDiQfwo6gKjg7GJ3NrcWoZu0tesp7knKnwrX/tNhPPNm9z7nyp7D5d3F+I40mxUIfCFYBRenaRt+KcL4x9mlZlK0sfJ7TUsKFH+3VnDpW3lHpP5cUmZ48SDCfeG10ssvYifhAEVZUBsb+EtDuoPK7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994141; c=relaxed/simple;
	bh=xmcxm8zXlY3JxLhM6Le0g34yc0uuqIUg1cL1s1NW+gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiHMnbyRb1hZXp3rZjOgHME+KrYGvQLIl+Vlqhqdf8eI82WmMAPHDv80XfuY9iXJTaht+mw7P+tNTIyMLViujD9ePmGOrGau9SpzBsoN84l0aHf1yrvscDjJeeP5w+SBdIGc1zzv6KtWSVmlS0zW6YGTIsj1kfIUCU59p78+f74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=DHW2P26u; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="DHW2P26u"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E0D4E260B3;
	Fri, 23 May 2025 11:55:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPNLdbaquUsh; Fri, 23 May 2025 11:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747994130; bh=xmcxm8zXlY3JxLhM6Le0g34yc0uuqIUg1cL1s1NW+gQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DHW2P26utvklz6UtQ7pcQyTnEVw3XQPekH9iAoNyW0HwegG0ja6Lp52jXG/UOM8uJ
	 y55r9u/0U8r4LfoqNXqIPMB5cXO6J+Y4UKXV4PF3cywKwHpl3aAP7G81SMjUrdpJ1u
	 S/aFZ3qnqogOMvJGSRrl/gB3d+WldmmRIX5pIJAmd1/fQcwxuK6O0qFEanmxAkMGpn
	 PwceZwnRmojcXUjfTBLk7B7KQ389S0E0NzeJUBGVVsTU4+9SPbGDEkqYqB3K5eQk8S
	 VQkp9csxmjf0ZUSzG77Z8iP87GBHgqA71elkw3AEERPw6kAvgv00beeXyGbYfgf+so
	 MtS+2TBmU/Aew==
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yao Zi <ziyao@disroot.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH v3 3/4] LoongArch: dts: Add initial SoC devicetree for Loongson 2K0300
Date: Fri, 23 May 2025 09:54:07 +0000
Message-ID: <20250523095408.25919-4-ziyao@disroot.org>
In-Reply-To: <20250523095408.25919-1-ziyao@disroot.org>
References: <20250523095408.25919-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC devicetree for 2K0300 SoC, which features one LA264 dual-issue
core and targets embedded market. Only CPU core, legacy interrupt
controllers and UARTs are defined for now.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/boot/dts/loongson-2k0300.dtsi | 184 +++++++++++++++++++
 1 file changed, 184 insertions(+)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi

diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
new file mode 100644
index 000000000000..ce3574691aa9
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Loongson Technology Corporation Limited
+ * Copyright (C) 2025 Yao Zi <ziyao@disroot.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "loongson,ls2k0300";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "loongson,la264";
+			reg = <0>;
+			device_type = "cpu";
+			clocks = <&cpu_clk>;
+		};
+
+	};
+
+	cpuintc: interrupt-controller {
+		compatible = "loongson,cpu-interrupt-controller";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
+
+	cpu_clk: clock-1000m {
+		compatible = "fixed-clock";
+		clock-frequency = <1000000000>;
+		#clock-cells = <0>;
+	};
+
+	soc@10000000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x10000000 0x00 0x10000000 0x0 0x10000000>,
+			 <0x00 0x02000000 0x00 0x02000000 0x0 0x04000000>,
+			 <0x00 0x40000000 0x00 0x40000000 0x0 0x40000000>;
+
+		liointc0: interrupt-controller@16001400 {
+			compatible = "loongson,liointc-2.0";
+			reg = <0x0 0x16001400 0x0 0x40>,
+			      <0x0 0x16001040 0x0 0x8>;
+			reg-names = "main", "isr0";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>;
+			interrupt-names = "int0";
+
+			loongson,parent_int_map = <0xffffffff>, /* int0 */
+						  <0x00000000>, /* int1 */
+						  <0x00000000>, /* int2 */
+						  <0x00000000>; /* int3 */
+		};
+
+		liointc1: interrupt-controller@16001440 {
+			compatible = "loongson,liointc-2.0";
+			reg = <0x0 0x16001440 0x0 0x40>,
+			      <0x0 0x16001048 0x0 0x8>;
+			reg-names = "main", "isr0";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <4>;
+			interrupt-names = "int2";
+
+			loongson,parent_int_map = <0x00000000>, /* int0 */
+						  <0x00000000>, /* int1 */
+						  <0xffffffff>, /* int2 */
+						  <0x00000000>; /* int3 */
+		};
+
+		uart0: serial@16100000 {
+			compatible = "ns16550a";
+			reg = <0 0x16100000 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart1: serial@16100400 {
+			compatible = "ns16550a";
+			reg = <0 0x16100400 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart2: serial@16100800 {
+			compatible = "ns16550a";
+			reg = <0 0x16100800 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart3: serial@16100c00 {
+			compatible = "ns16550a";
+			reg = <0 0x16100c00 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart4: serial@16101000 {
+			compatible = "ns16550a";
+			reg = <0 0x16101000 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart5: serial@16101400 {
+			compatible = "ns16550a";
+			reg = <0 0x16101400 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart6: serial@16101800 {
+			compatible = "ns16550a";
+			reg = <0 0x16101800 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart7: serial@16101c00 {
+			compatible = "ns16550a";
+			reg = <0 0x16101c00 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart8: serial@16102000 {
+			compatible = "ns16550a";
+			reg = <0 0x16102000 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart9: serial@16102400 {
+			compatible = "ns16550a";
+			reg = <0 0x16102400 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		isa@16400000 {
+			compatible = "isa";
+			#address-cells = <2>;
+			#size-cells = <1>;
+			ranges = <1 0x0 0x0 0x16400000 0x4000>;
+		};
+	};
+};
-- 
2.49.0

