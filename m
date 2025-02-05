Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF24B2153C4;
	Wed,  5 Feb 2025 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750610; cv=none; b=HI41AJy7mL95a3DFNoj6jCwoNC5xRV6e7Fs51AqmJaKe2NlW9roxZV5SEYp8WCDp5jFbuhjgonmio26Dwoakaoj8GmAF6IaDmSbuWz/qYNJ5vz/wGl2WwkL8kwGgeTq5m3Tk2xPiB34oii6bYW1A+x1uS4hAEFp3f5MBed3Szko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750610; c=relaxed/simple;
	bh=vydupOYgQLn7D9Zdk646A6gMMATJBHEgyfilXMA8goQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=r3BtWtRqRt0iRVnLuknkQ86C+aG2cu87Fba9bbX8D7NznOK9AzsNMPu8Kh693fsGhY+3SoGCSSMQMiEkAd8gl0XkGSAL935DLTGiRwHTC1+4ejG10CM4WAvNQkOfcX68IxRUkhg+YyG0JmiUQJmykQ2EIKmgShjCxiwvc455ZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYBEWLjz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYBEWLjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738750608; x=1770286608;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vydupOYgQLn7D9Zdk646A6gMMATJBHEgyfilXMA8goQ=;
  b=jYBEWLjzBTat4Pq4TwfLy882u+HP0rEq//96Ei5OArvzeJor8udAkN71
   snSKINtocJvgwWWU1ZyweJhah/nEPlHdhYCga4UzDSRQrbNdSB0e9dAEK
   v5VP8DNwq6ekvw1ZxPMwoP4uiyLkPxJOTXM1wAfh/ENdlYSDklHw9qEoj
   e5iFSgo19n3MRWjgmtMhl80dbo80EiZpGirPp9BAO8/S3qCNcJTjDvrS2
   2ltKEU/5gY8wmNv3+8YCpYX1wk6Lo+YbIyEa60jaqrj5gZSnufCWMb81f
   8UskQbgg43x/MIqhA6y9saQYlAWcJsrCaLHsXDxSFrAo0txFG0fV2gV5l
   g==;
X-CSE-ConnectionGUID: 3kDPkAjfQyq35QzDIYyhxQ==
X-CSE-MsgGUID: fLoV/QwWSsaD/9kQ3M/oFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42145715"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="42145715"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 02:16:47 -0800
X-CSE-ConnectionGUID: JWpp0RjiR7mRtkyq7IgHog==
X-CSE-MsgGUID: 76h4i22cQXaXGY2STTMW9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115474286"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by fmviesa005.fm.intel.com with ESMTP; 05 Feb 2025 02:16:45 -0800
From: niravkumar.l.rabara@intel.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	niravkumar.l.rabara@intel.com,
	nirav.rabara@altera.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: socfpga: agilex5: add NAND board file
Date: Wed,  5 Feb 2025 18:13:18 +0800
Message-Id: <20250205101318.1778757-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
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

changes in v2:
 * Use nand flash node name according to dt bindings to fix dt build warnings.
 * Arrange node in sequence.

Link to v1:https://lore.kernel.org/all/20250107084831.2750035-2-niravkumar.l.rabara@intel.com/

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
index 000000000000..ccc9be2cd7c6
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
+	model = "SoCFPGA Agilex5 SoCDK";
+	compatible = "intel,socfpga-agilex5-socdk", "intel,socfpga-agilex5";
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

