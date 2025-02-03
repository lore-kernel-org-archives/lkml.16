Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0961C2036F0;
	Mon,  3 Feb 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738582817; cv=none; b=VKDRGPo4Fg85aPFpnrnKNJM6Yfgzuec0F1Cn86MOdHHS/IOb6WBy2VHBEe3qqwj1GnTcUNpxE42TqO6XQ+yZZw2YD1mlupwZHAt9/wBqcdGongRsgu9xu1HtudqL6CAOg39xb9avmE9RCyoWLfEyi9GlkLTM7WfbxlwtZh+LqzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738582817; c=relaxed/simple;
	bh=Pznr0Bts4D0FtUDtSu2Wtdp7OSNmccFCgV9QhrjQAow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOc+Y6dNTmP5ABQ1gu6RhikcD8iLzLTRr1aj0+HtwYJItnnVFWlmw29kkD8V3cy1WM29QvggFJtJBXd6nXAHGUR/cleJWlc07K1wgh9jkt5cwzo8E4qWIzIe2LwMHtNiAVhBO0HhA0anO/2kn0uNV65rfFoHeQOdmgftyG8f5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcCl1/u4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcCl1/u4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21649a7bcdcso71394165ad.1;
        Mon, 03 Feb 2025 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738582815; x=1739187615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gduqE5+XkKRgfOuTSHYpyohOphdvP2oewiQ8WxF2r4=;
        b=DcCl1/u44nbVAM2qO7ejBfRPJHvXEHDrqxhPbGiGrXf5P0YlomfbP3i1F0a9E3uxTj
         JdG3Np7Y/CmNpeXqy4qv0egCNPViyEGYZMjxeiW15BNcsKTXfNHKKyy9l4MiiYLXal4D
         Y7sllhG4RwsI1LGpx73eF8ORRJ9nCFxcB2z89WC0eE6Y3vs2ut6I+cZX/WZs08wM7FpA
         ySPAvKMC8ndl/WhGnFciuB9yGKKeDEHp2odxHbLKTPjIRsJIIRSqdVNSxdbcX2Cnqeep
         CByjkj4HYo6ZtWn1d+9ZT7MWaKMATdEUPkfiCdwzveuFRXeYGU0W9MBBv5VdC3yN4Mry
         4I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738582815; x=1739187615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gduqE5+XkKRgfOuTSHYpyohOphdvP2oewiQ8WxF2r4=;
        b=dg0XUwCJD4MJHj/DatYkwju6uyV9Fg1fGa9rtIRwyj4bKy/pGZCxWFJE/5sxKV8q5H
         NI/7SHu1N9IGq3UAtdl27juQqNCL2sQzzOqSfrXyh8W41L4HJ2kiEivb6aXXjl3a8m2R
         jEXFgrGr4juMD0JJJE0KBVUB6IlC0rxK3osp+m+/yDhN8E872rWGmue0E1bwE85g1h1x
         Gw1aG9An9PKFmAxD2FAJ7JDmC/WUR+A+sJN4NqkPYzWoDwvL0eJsWv70xozfMVqRX1zz
         fBnKdbUaJKbeAvsX+yBQNeWFy6MXiBEmeFn/VnGVUeCFgiRzG4divru1zWH1l1FyK0aD
         r1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVMQXxvt6M5DiBl6BsCGMhMBm38tU3oPceIXKVP7IHSed3FgMrwA0jfZtnINuKMga9Nm7WZNPEMPIcpNlct@vger.kernel.org, AJvYcCXyuWV6P9OZB2vqjGjyFwLNxtcnytCbtN7t5bkTPiljfrftN5a1242gO3YHOACQrnEkf3nHrG+BJ+5b@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPmBWJpwYV4YNrfHWYzIb/nQMzhfXM0OiY223QKbaeaW/vA5x
	8H2iHrQLkWEVgCurt+FqnrDCQ0UPb51EuFyvkPwwvhZesy0k08Tj
X-Gm-Gg: ASbGncvDv6hqSTrFJGdm26Cd91JSacYtXCN3fAUrPYxYgfPCUuu6khjfr55utK4cfMY
	ylx1BArnlmn3e75q2c02R9Ukrf/usuagdyEBd8DpozwFPkmN/aZDs1CZ5WIwljL7sGTq4SgU478
	sLVblSXvZ06Jx/UNZFboqL2vcFJmNG35CepGTlodPtWAFd6/Qm2hj19xzpfZUILGSRJA9xKFG14
	nTeO7UP323Lq3+ZaGm1huA2PsP2RIVNrkoq9CamY8LbdgZr2t3Xa7h2/Ot3C3Str/6zKKRZudP/
	xhNaiGJM1tChbENZ
X-Google-Smtp-Source: AGHT+IG/voCx4BoOF7MZR1nPTGgCOf7e1n+k46BNNiWJ1p0YoUYHkwqU6ASyPIUVLd/56kA/7gIkAA==
X-Received: by 2002:a05:6a20:d809:b0:1e0:df27:10b5 with SMTP id adf61e73a8af0-1ed7a6e0e6bmr38809210637.29.1738582814998;
        Mon, 03 Feb 2025 03:40:14 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acec04796d6sm7721614a12.55.2025.02.03.03.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:40:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 RESEND] arm64: dts: apple: Split s8000/s8003 SoC DTS files
Date: Mon,  3 Feb 2025 19:38:31 +0800
Message-ID: <20250203113949.14760-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Despite what the code comments said, the DTS files were not split properly.
Since these two SoCs are now known to have minor differences like in
latencies for cpufreq state transistions, split the DTS files now.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---

Changes since v1:
- Drop PMGR nodes file rename. This is now the first patch and other series
that modifies Apple A9 DTS files now depend on this series. This avoids
less than ideal situations like adding a file only for it to be renamed
immediately.

Link to v1: https://lore.kernel.org/asahi/20241206135051.56049-1-towinchenmi@gmail.com/T

Nick Chan

 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 140 ++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s8000.dtsi    | 133 +---------------------
 arch/arm64/boot/dts/apple/s8003.dtsi    |  10 +-
 3 files changed, 146 insertions(+), 137 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3.dtsi

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
new file mode 100644
index 000000000000..082e5b1733d0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple S8000/S8003 "A9" SoC
+ *
+ * This file contains parts common to both variants of A9
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/apple-aic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/apple.h>
+
+/ {
+	interrupt-parent = <&aic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "apple,twister";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "apple,twister";
+			reg = <0x0 0x1>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		nonposted-mmio;
+		ranges;
+
+		serial0: serial@20a0c0000 {
+			compatible = "apple,s5l-uart";
+			reg = <0x2 0x0a0c0000 0x0 0x4000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,s8000-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl_ap: pinctrl@20f100000 {
+			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0f100000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_ap 0 0 208>;
+			apple,npins = <208>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_aop: pinctrl@2100f0000 {
+			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x100f0000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aop 0 0 42>;
+			apple,npins = <42>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 119 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wdt: watchdog@2102b0000 {
+			compatible = "apple,s8000-wdt", "apple,wdt";
+			reg = <0x2 0x102b0000 0x0 0x4000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that A9 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+/*
+ * The A9 was made by two separate fabs on two different process
+ * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
+ * the S8003 (APL1022) on 16nm. There are some minor differences
+ * such as timing in cpufreq state transistions.
+ */
diff --git a/arch/arm64/boot/dts/apple/s8000.dtsi b/arch/arm64/boot/dts/apple/s8000.dtsi
index 6e9046ea106c..c7e39abda7e1 100644
--- a/arch/arm64/boot/dts/apple/s8000.dtsi
+++ b/arch/arm64/boot/dts/apple/s8000.dtsi
@@ -7,138 +7,11 @@
  * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
  */
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/apple-aic.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/pinctrl/apple.h>
-
-/ {
-	interrupt-parent = <&aic>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			compatible = "apple,twister";
-			reg = <0x0 0x0>;
-			cpu-release-addr = <0 0>; /* To be filled in by loader */
-			enable-method = "spin-table";
-			device_type = "cpu";
-		};
-
-		cpu1: cpu@1 {
-			compatible = "apple,twister";
-			reg = <0x0 0x1>;
-			cpu-release-addr = <0 0>; /* To be filled in by loader */
-			enable-method = "spin-table";
-			device_type = "cpu";
-		};
-	};
-
-	soc {
-		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		nonposted-mmio;
-		ranges;
-
-		serial0: serial@20a0c0000 {
-			compatible = "apple,s5l-uart";
-			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-			reg-io-width = <4>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>;
-			/* Use the bootloader-enabled clocks for now. */
-			clocks = <&clkref>, <&clkref>;
-			clock-names = "uart", "clk_uart_baud0";
-			status = "disabled";
-		};
-
-		aic: interrupt-controller@20e100000 {
-			compatible = "apple,s8000-aic", "apple,aic";
-			reg = <0x2 0x0e100000 0x0 0x100000>;
-			#interrupt-cells = <3>;
-			interrupt-controller;
-		};
-
-		pinctrl_ap: pinctrl@20f100000 {
-			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
-			reg = <0x2 0x0f100000 0x0 0x100000>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_ap 0 0 208>;
-			apple,npins = <208>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 42 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 43 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 44 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 45 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		pinctrl_aop: pinctrl@2100f0000 {
-			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
-			reg = <0x2 0x100f0000 0x0 0x100000>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_aop 0 0 42>;
-			apple,npins = <42>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 115 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 116 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 117 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 118 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 119 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		wdt: watchdog@2102b0000 {
-			compatible = "apple,s8000-wdt", "apple,wdt";
-			reg = <0x2 0x102b0000 0x0 0x4000>;
-			clocks = <&clkref>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
-		};
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt";
-		/* Note that A9 doesn't actually have a hypervisor (EL2 is not implemented). */
-		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
-	};
-};
+#include "s800-0-3.dtsi"
 
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
- * the S8003 (APL1022) on 16nm. While they are seemingly the same,
- * they do have distinct part numbers and devices using them have
- * distinct model names. There are currently no known differences
- * between these as far as Linux is concerned, but let's keep things
- * structured properly to make it easier to alter the behaviour of
- * one of the chips if need be.
+ * the S8003 (APL1022) on 16nm. There are some minor differences
+ * such as timing in cpufreq state transistions.
  */
diff --git a/arch/arm64/boot/dts/apple/s8003.dtsi b/arch/arm64/boot/dts/apple/s8003.dtsi
index 7e4ad4f7e499..807e3452f8a7 100644
--- a/arch/arm64/boot/dts/apple/s8003.dtsi
+++ b/arch/arm64/boot/dts/apple/s8003.dtsi
@@ -7,15 +7,11 @@
  * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
  */
 
-#include "s8000.dtsi"
+#include "s800-0-3.dtsi"
 
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
- * the S8003 (APL1022) on 16nm. While they are seemingly the same,
- * they do have distinct part numbers and devices using them have
- * distinct model names. There are currently no known differences
- * between these as far as Linux is concerned, but let's keep things
- * structured properly to make it easier to alter the behaviour of
- * one of the chips if need be.
+ * the S8003 (APL1022) on 16nm. There are some minor differences
+ * such as timing in cpufreq state transistions.
  */

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1

