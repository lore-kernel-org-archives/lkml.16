Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FF91BCA0F;
	Mon, 10 Feb 2025 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173792; cv=none; b=T4EAI6lFiSppfDn9bZnSmIN1fWsxw3NgjagoD2s8c14XvKgf7Uo7cH1dJz8UXbfqP/e1g4CCTU2nkY/gMetL005OHOnRYrcehaVBlId4vxG+MhovVoRmxWUh9Oyd9JyRz7Ewfi+GacHUEG48xEQnGnjs1lDqCMnqTGId3xnIEpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173792; c=relaxed/simple;
	bh=HwBQSXUYexdEAc6nBWzhjPNubH97h6RTnUPAMjTr6Js=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fMiLK1KAp+eKRzsP+7+xssURc4adcZ7hwL6vSql4oHHXoXE9Bta409a9FsIwVgFANtK67+T1N5WavB0BWXQJ4U2S84k68KO4ZeyyWoTFCB2/qjB3sUooFov1lxgJGCuPL1q7y78fJwEywcuW6/w1ACRsi7YOri++5tQqZzGeBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mg/K7DQK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mg/K7DQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739173791; x=1770709791;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HwBQSXUYexdEAc6nBWzhjPNubH97h6RTnUPAMjTr6Js=;
  b=Mg/K7DQKRt4gFhl0yvSYXZEwh5tpoRmYGYpLbiomRWqR6W005AJtTtsF
   +C9fTz76nHjT3O68o2jqyWxVDY61Dnmt0KwRn5ZUSzK+tvtrj0zcIq6qI
   xc4Vlj3fVCjuapJ5gUQDkQu6DrRUQVHHcuWjU/SyzTvbH+AmnimXkIWJZ
   r+zX5JGyo6I6Wnkkzy0H8niGFqmnqvYlw5PscdakhCeN1dRfr4yhGNv8I
   073gvw3iBXrsAIDSCeSRsHE342rW1JmZ+UJiCSfZe9Ahopy/bngnQ7Y5A
   NqkVGGbzSxzD/vXpDLayNyoNM2umVJ7e5RGWXxmLe4sJeaS6j50UzN/eL
   w==;
X-CSE-ConnectionGUID: gO9GE7XwTR6ILpUUbfSunA==
X-CSE-MsgGUID: yH17G49aTA6VTJwum2gAuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39427001"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39427001"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 23:49:50 -0800
X-CSE-ConnectionGUID: c0HVo9DFTZOggYeHqRR2+w==
X-CSE-MsgGUID: YMl81dC+ScK0hev9CpqgVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142994908"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by fmviesa001.fm.intel.com with ESMTP; 09 Feb 2025 23:49:48 -0800
From: niravkumar.l.rabara@intel.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	niravkumar.l.rabara@intel.com,
	nirav.rabara@altera.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: socfpga: agilex5: add NAND daughter board
Date: Mon, 10 Feb 2025 15:46:04 +0800
Message-Id: <20250210074604.2410783-3-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
References: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

The Agilex5 devkit supports a separate NAND daughter card.
The NAND daughter card replaces the SDMMC slot that is on the default
daughter card thus requires a separate board dts file.

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 arch/arm64/boot/dts/intel/Makefile            |  1 +
 .../dts/intel/socfpga_agilex5_socdk_nand.dts  | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index d39cfb723f5b..33f6d01266b1 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -3,5 +3,6 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk.dtb \
 				socfpga_agilex_socdk_nand.dtb \
 				socfpga_agilex5_socdk.dtb \
+				socfpga_agilex5_socdk_nand.dtb \
 				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
new file mode 100644
index 000000000000..38a582ef86b4
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier:     GPL-2.0
+/*
+ * Copyright (C) 2025, Altera Corporation
+ */
+#include "socfpga_agilex5.dtsi"
+
+/ {
+	model = "SoCFPGA Agilex5 SoCDK NAND daughter board";
+	compatible = "intel,socfpga-agilex5-socdk-nand", "intel,socfpga-agilex5";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led0 {
+			label = "hps_led0";
+			gpios = <&porta 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led1 {
+			label = "hps_led1";
+			gpios = <&porta 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i3c0 {
+	status = "okay";
+};
+
+&i3c1 {
+	status = "okay";
+};
+
+&nand {
+	status = "okay";
+
+	nand@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		nand-bus-width = <8>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0 0x200000>;
+		};
+		partition@200000 {
+			label = "root";
+			reg = <0x200000 0xffe00000>;
+		};
+	};
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&watchdog0 {
+	status = "okay";
+};
-- 
2.25.1

