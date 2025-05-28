Received: from mail-m49251.qiye.163.com (mail-m49251.qiye.163.com [45.254.49.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF622741B3;
	Wed, 28 May 2025 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422818; cv=none; b=YdCoCDkqpetIa8tQL5WFiZen4C+jdpnnakgO4LEfHUlZHZoAEjq9h8RgFYUVbdtZ5UInqEiR+pkNJemNSXwEYPPzvFS6OduJeLZjzcXie2OkmXSTYg8sdAywATNtFJcP55zxHUhW9cx1NvH2QJowP7Tc7IAIAGsJHGnm3XOCSiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422818; c=relaxed/simple;
	bh=pdbyv71w/4yTol5fv2CkVwoNq9jKo4DHIM3zEzfG4ao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jTyLBcU++ViA+MMia67/Q1tuTRI42NWi+NVhFUAxmmRR8JOBj3C24iDTsFzdE+XK6RH7foUID8M+Qml5V/cUAefyKk2td/foZ2k8kWWL/3D9B1apzmuygoSDTBvRNGLZdyHvhuIm6srJBJWjOZBh7e1fE9V3SA4qxHBem7c3KoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Rm6aSCfC; arc=none smtp.client-ip=45.254.49.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="Rm6aSCfC"
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a630;
	Wed, 28 May 2025 16:54:58 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ge Gordon <gordon.ge@bst.ai>
Cc: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v1 6/9] arm64: dts: bst: add support for Black Sesame Technologies C1200 CDCU1.0 board
Date: Wed, 28 May 2025 16:54:57 +0800
Message-Id: <20250528085457.481372-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUwYVkgfSkwYHh0aHhpKHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97161a17fe09cckunm6c18a290397e60
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OS46TAw*STE0CEgrLg82OS0c
	ThMKCzRVSlVKTE9DT0lJT0JCTkpPVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUxIS0k3Bg++
DKIM-Signature:a=rsa-sha256;
	b=Rm6aSCfCg9tITzi1S3kXi7EX034ErJavdpJzIxWyKhvkxdB+hxQbMVe7ahf2zwc9+PfQaRbTMOvKVw1WrH4o2VGk/FMDztY3pv3qnrYu3iLTfnlNoxq44mnuUVlC5J41oZv/onbOGt8UN7I5wO79OoGT0qgs9D/OE6tKaJ3ZYVw=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=v5zGpkPvGr84zpKybTIRBthxazxJeY+bSbl9s+aYKIc=;
	h=date:mime-version:subject:message-id:from;

Add device tree support for the Black Sesame Technologies (BST) C1200
CDCU1.0 ADAS 4C2G platform. This platform is based on the BST C1200 SoC
family.

The changes include:
- Adding a new BST device tree directory
- Adding Makefile entries to build the BST platform device trees
- Adding the device tree for the BST C1200 CDCU1.0 ADAS 4C2G board

This board features a quad-core Cortex-A78 CPU, and various peripherals
including UART, MMC, watchdog timer, and interrupt controller.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/bst/Makefile              |  10 ++
 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  44 ++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 130 ++++++++++++++++++
 4 files changed, 185 insertions(+)
 create mode 100644 arch/arm64/boot/dts/bst/Makefile
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..135965288100 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -35,3 +35,4 @@ subdir-y += tesla
 subdir-y += ti
 subdir-y += toshiba
 subdir-y += xilinx
+subdir-y += bst
diff --git a/arch/arm64/boot/dts/bst/Makefile b/arch/arm64/boot/dts/bst/Makefile
new file mode 100644
index 000000000000..64fd43c98275
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/Makefile
@@ -0,0 +1,10 @@
+ifeq ($(CONFIG_SECOND_KERNEL), )
+
+# Enables support for device-tree overlays
+DTC_FLAGS := -@
+
+dtb-$(CONFIG_ARCH_BSTC1200) += bstc1200-cdcu1.0-adas_4c2g.dtb
+
+endif
+
+clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
new file mode 100644
index 000000000000..92915e7630ff
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "bstc1200.dtsi"
+
+/ {
+	model = "BST C1200-96 CDCU1.0 4C2G";
+
+	chosen {
+		bootargs = "earlycon=uart8250,mmio32,0x20008000 console=ttyS0,115200n8 rw";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@8c0000000 {
+		device_type = "memory";
+		reg = <0x8 0x10000000 0x0 0x30000000
+		      0x8 0xc0000000 0x1 0x0
+		      0xc 0x0 0x0 0x40000000
+		      0x8 0x254000 0x0 0x1000
+		      0x8 0x151000 0x0 0x1000>;
+	};
+
+	reserved-memory {
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		ranges;
+
+		mmc0_reserved: mmc0_region@5160000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x5160000 0x0 0x10000>;
+			no-map;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&mmc0 {
+	status = "okay";
+	memory-region = <&mmc0_reserved>;
+};
+
diff --git a/arch/arm64/boot/dts/bst/bstc1200.dtsi b/arch/arm64/boot/dts/bst/bstc1200.dtsi
new file mode 100644
index 000000000000..6ed2d8cbd720
--- /dev/null
+++ b/arch/arm64/boot/dts/bst/bstc1200.dtsi
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+/ {
+	compatible = "bst,c1200";
+	#address-cells = <0x2>;
+	#size-cells = <0x2>;
+
+	cpus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x0>;
+			freq-domain = <0x3 0x1>;
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x100>;
+			freq-domain = <0x3 0x1>;
+		};
+
+		cpu@2 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x200>;
+			freq-domain = <0x3 0x1>;
+		};
+
+		cpu@3 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2_cache>;
+			reg = <0x300>;
+			freq-domain = <0x3 0x1>;
+		};
+
+		l2_cache: l2-cache-1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	misc_clk: misc_clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0x0>;
+		clock-frequency = <0x3d0900>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		always-on;
+		interrupts = <GIC_PPI 0xd (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)
+			      GIC_PPI 0xe (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)
+			      GIC_PPI 0xb (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)
+			      GIC_PPI 0xa (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		ranges = <0x0 0x0 0x0 0x0 0xffffffff 0xffffffff>;
+
+		mmc0: dwmmc0@22200000 {
+			#address-cells = <0x2>;
+			#size-cells = <0x0>;
+			compatible = "bst,dwcmshc-sdhci";
+			reg = <0x0 0x22200000 0x0 0x1000>;
+			reg-names = "base";
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 0x90 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "IRQDWMMC0";
+			clock-frequency = <0xbebc200>;
+			max-frequency = <0xbebc200>;
+			mmc_crm_base = <0x23006000>;
+			mmc_crm_size = <0x1000>;
+			fifo-depth = <0x400>;
+			bus-width = <0x8>;
+			non-removable;
+			sdhci,auto-cmd12;
+			dma-coherent;
+			status = "disabled";
+		};
+
+		uart0: serial@20008000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x20008000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 0xd3 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <0x17d7840>;
+			reg-shift = <0x2>;
+			reg-io-width = <0x4>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@32800000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <0x3>;
+			#address-cells = <0x2>;
+			#size-cells = <0x2>;
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			ranges;
+			reg = <0x0 0x32800000 0x0 0x10000 0x0 0x32880000 0x0 0x100000>;
+			interrupts = <GIC_PPI 0x9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+			status = "okay";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+		cpu_on = <0xc4000003>;
+		cpu_off = <0x84000002>;
+		cpu_suspend = <0xc4000001>;
+	};
+};
-- 
2.25.1

