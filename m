Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B22980CF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347935; cv=none; b=mPYcrTrCSmh192X8IQlrIEHXdY67H2R8YdYeeb5QYKHvoQWtnxq98gNUFmwhWDpbRzeVA4TUgOPktEtdUQCx8c13Y6CmEgjOB4SaUVncxneSdftK6mstKbMp1XX8wRgko806xUwiHmXp9micvAu6CXBfGCxNoT+sJAgGeWj09ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347935; c=relaxed/simple;
	bh=UTPvffIABUNhlGZVcA2XJgtcHh9OQXOBaQFZpX3Y43E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svvdQKq2YawAjyIvjdIW3/G5Gst+GckfEVwRhrDBsGj5tPDmdyLmyAHwhpjzitl46e5ZRObcbc1M7/N/RIXfvH2fRKQ/VfpHPlQZSLT7Rkh7CxMOJFTMzbi4jcRZWXLtY6g1iaLxFdiGIeeFss5TcYrBAGnOX1U0IzVWNCDAlRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BKzKzsmO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BKzKzsmO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0618746bso42603945e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347929; x=1745952729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZnx4j541acJM3Wm8RPUZeJrdc2b8jCDkdy37pgO734=;
        b=BKzKzsmOuR2dIqSK5PmlTIZ6IXxJ3awhQZcXmyEMueIwjXLUH+RjEdugd3JEpGN1MT
         87GoXrs/5ymXtmvpeqcgpfobtjNYMRgj6ETS3sl+NmqEP2ZGvPKrdcqDcNKls35tQfc7
         PhpWs5Zyrdjkl8JWoLyJMON4MrpIvSED+BpfgQAYhIREqz736DUQv4kCXUu3T4tz+/0+
         ZhB6USV+NCU08IqdNBWrQp2Aw8UXQa8JTrQQsHdyW2RRgPKWnoNcal9ewO9r96SbJ0Ki
         HSHqiXNxVcKvu4SMiuMwzLn15Zw/7xoVhRuPUzFr+pk3/bnHvPqA5es9WyBnMx50s7u1
         SahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347929; x=1745952729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZnx4j541acJM3Wm8RPUZeJrdc2b8jCDkdy37pgO734=;
        b=MH8DgS/HmoAdvHsdy7gKhVSNGRrkeEun47A8ctzfhfgRMh5gZNYlVZgJUFw/19qqzG
         AtLBQCPG/MJsCmlrtGWKf/RWJtB7NgN7OMjpr8td7euaEZ4nmyhp8Pzp6SMmiWA2/unc
         RBsZ+0L6DHvaSEPQpDLQqiDki7UGHpckjO6nNZsl/uAr8Ck7syEcxAxfpK4DChQUXAOT
         b8/KkJNtn3lQuGccsvbbtNiKjtv2261o0s859Zl15fVFn9gEgTSeNT0ZGWuwI5CeuNcB
         1fjJb3Dzxqh0RNVy5fqLblJPsISJiCYJJ5W7ZOPfdLtAw+qDWExHX0kEpW8HB0Vdda3y
         YZrA==
X-Forwarded-Encrypted: i=1; AJvYcCVrtYmN5GYaDR7KM63a2REBAR4sVyvvpLwU/TdGVFgMidpFA3VmrcSOO746x7zgCdUiELJLwDwM8ml+jtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzqw//Kw4Ip9jkC7gq5wRz2hf1TZUqsvJ/Kt65OzSO1GySxrQ
	ckhrjoAbPylmZNwwtreAIrAxjiUDqQ0Cq8MRusZeytJhCxGSabot8/IbWyYQ1jU=
X-Gm-Gg: ASbGncs6sBqrEN2rLUe0Ix+lgq3g2KIL66x71uJC34T/rdCtX8W1TZ3N6n76BrvuV1u
	f/s/OTfmv6kM1sBO212QOZDsYxq/PeJrVFX9Y21IzwAK7RYrKwP6Ls/Ys3V9DYtxtAISsbo92NX
	J9PR7L4IwUXLFPrSfjlJh9GbtghmqVBph7TcG3C07ykxhTi63jX6kJ2Z3DO3tglgRt8ZD2ZNy9H
	dUy6yh3lc0cdKzAqoZQRjOJcbR6dKDs6Bk4TA+3If9RJ5LIWbyHld8wkcWHUoiufbwzOg8koxku
	et0uCAn80bSf+gxgPixCvhqJHvjzB7bcCiznwu5GlbvTuvj8XPV5Y6FpcVdUXJoJiqi2Nd0=
X-Google-Smtp-Source: AGHT+IFg8Fki1LRM4fnnmh1iosi+KfKR/CqRtapkeYhOgAsRPRKq+DWMpLJJFhy6jDly7HRKgEDVxA==
X-Received: by 2002:a05:600c:a016:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-4406ac0a324mr132480095e9.21.1745347928949;
        Tue, 22 Apr 2025 11:52:08 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf2csm16237796f8f.51.2025.04.22.11.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:08 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v9 -next 06/12] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Tue, 22 Apr 2025 20:53:15 +0200
Message-ID: <5d47f8e7eaad76032e1b5f433516dec7640384c3.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RaspberryPi RP1 is a multi function PCI endpoint device that
exposes several subperipherals via PCI BAR.

Add a dtb overlay that will be compiled into a binary blob
and linked in the RP1 driver.

This overlay offers just minimal support to represent the
RP1 device itself, the sub-peripherals will be added by
future patches.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 MAINTAINERS                                  |  1 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 42 ++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi  | 14 +++++++
 3 files changed, 57 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 92b959b4d372..a941e1cfb22e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20364,6 +20364,7 @@ F:	drivers/media/platform/raspberrypi/rp1-cfe/
 RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
 F:	drivers/clk/clk-rp1.c
 F:	drivers/pinctrl/pinctrl-rp1.c
 
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
new file mode 100644
index 000000000000..5002a375eb0b
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+pci_ep_bus: pci-ep-bus@1 {
+	compatible = "simple-bus";
+	ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+	dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	rp1_clocks: clocks@40018000 {
+		compatible = "raspberrypi,rp1-clocks";
+		reg = <0x00 0x40018000 0x0 0x10038>;
+		#clock-cells = <1>;
+		clocks = <&clk_rp1_xosc>;
+		assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+				  <&rp1_clocks RP1_PLL_SYS>,
+				  <&rp1_clocks RP1_PLL_SYS_SEC>,
+				  <&rp1_clocks RP1_CLK_SYS>;
+		assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+				       <200000000>,  // RP1_PLL_SYS
+				       <125000000>,  // RP1_PLL_SYS_SEC
+				       <200000000>;  // RP1_CLK_SYS
+	};
+
+	rp1_gpio: pinctrl@400d0000 {
+		compatible = "raspberrypi,rp1-gpio";
+		reg = <0x00 0x400d0000  0x0 0xc000>,
+		      <0x00 0x400e0000  0x0 0xc000>,
+		      <0x00 0x400f0000  0x0 0xc000>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+			     <1 IRQ_TYPE_LEVEL_HIGH>,
+			     <2 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
new file mode 100644
index 000000000000..0ef30d7f1c35
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+rp1_nexus {
+	compatible = "pci1de4,1";
+	#address-cells = <3>;
+	#size-cells = <2>;
+	ranges = <0x01 0x00 0x00000000
+		  0x02000000 0x00 0x00000000
+		  0x0 0x400000>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+
+	#include "rp1-common.dtsi"
+};
-- 
2.35.3

