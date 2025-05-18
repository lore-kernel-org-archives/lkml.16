Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F8A1FF1C9;
	Sun, 18 May 2025 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555523; cv=none; b=WXbRVzUggTO125ZK0RCFFmDLFSqFyI+U0eUhUzWko/L4aKogUKu8fhItrM5xbG88OCHpknymNx5qake8tkYTgDiKX+hlPE2MkamlZeyNTqSN0MGJC3KfnPON826/KsJZy5HtZ0Lwb+6L3lzQrC4ZR95QaMYnE2uFAio+M4mmPa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555523; c=relaxed/simple;
	bh=kyjrt2gVQm0QUSTC0VroF3yfPupvMlqBv7Ib8FAXvGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvy+GVpa1Uz9vo0n1f6IHtFqiiCdmy8sNfllfI5VJzZeVJ6gfI7OUJkxHwAbFSYMF6rv7bFwu0Yyj9gIzeHpyqKTbqut8G3RY/2u7TZCrtE7lAqPzv4MkTfiqEwsCZrhOEy48j7cfFECZ4GJTYywEMRu3KRrImVnivqzd8etNa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=bGaX4cPy; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="bGaX4cPy"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8E109260B0;
	Sun, 18 May 2025 10:05:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqwnw0caStk5; Sun, 18 May 2025 10:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747555519; bh=kyjrt2gVQm0QUSTC0VroF3yfPupvMlqBv7Ib8FAXvGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bGaX4cPyHYPr+7opKgf8zoGolHBcYMRC5BqTr0+lksAjbAYcegzl7eTzQzyPJp6xs
	 C6gkswymvb/388jkHFvJi//okoZvtNIyMEpRqXMs6yoY+H8nR+cZKsto25r0XHDssw
	 R6wkZbNYHKRx39D5YfRLDpGpLcAh9H3gpfU/97GudpF7IYQMvdvRtFz7NkhwXHKrss
	 ENGM2lmbESPseNJrZp8htwgZNG0nnTkEDe4muLvk9ndGL5f2bmr5lL6qSAOwpEjUNx
	 J9lZhQ4kCBzLK8rvl+A6+ti4qEgximm17lZNnYtvV9SJeGGImf7eCUk97huF0YvNM8
	 lcM8LDKKd32bw==
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
Subject: [PATCH v2 3/4] LoongArch: dts: Add initial SoC devicetree for Loongson 2K0300
Date: Sun, 18 May 2025 08:03:55 +0000
Message-ID: <20250518080356.43885-4-ziyao@disroot.org>
In-Reply-To: <20250518080356.43885-1-ziyao@disroot.org>
References: <20250518080356.43885-1-ziyao@disroot.org>
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
index 000000000000..17974f793947
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
+	soc {
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

