Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F261228F925
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517751; cv=none; b=dO0dFP4XhsxObB0cOsotLEuAI836k5YF54jUg70eg0ft9jxkhN5KstF3fbLP0gHAP8IKBNuLz+h3FbEdXAGLafyOxIXFJf8OPvsdN/MvTGFg5X6ncOP7+/y9ouJ4/8f9CTKWidjFUwxGvC6zJD5Xi0CcUusZ9xGuY+5DnbbNnj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517751; c=relaxed/simple;
	bh=QW7VTm572jmsB5I7p8SLx6Wb3evUoSSkHBGzBXDeejA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6/PPDGvgSfAL8fm/4RM0a861xIM2mfcFd3sjRrw/J90rGiZ0hTIQMYqZod+EwaGXl7KR/Tmd7leHK5LcGmB/P1e0XCgJlc8f3zCz+mm0nFAu/A3IMUEcHqEU7ACJHOiwCMguf15yQBieWFPz4kgA0/1ezPLN+jhvE6/Ixbfidk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YjWpLYOJ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YjWpLYOJ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso1423082a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517746; x=1749122546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZ7xUfAXguvsPdu5QAJbu8MyCaxUyBGB0j1AZF9I7as=;
        b=YjWpLYOJU6e5KrAx4GaXsuW2IpO1xUVt3j9Es7QmO0lx4n0GP9ad41AiJA1vwosTyU
         Ybhu8islDrJZa+GpHqyhcJdHUxC5DMeEvS0ZXJhNbyACceMeyVBZ2bvf+FpVoA4XWFM/
         2DgQsOo1M3k8uSFU2YZhAXivvKP5T13L08TYZgqpF0ls2w4qAuet7Ps9YzXV7+xuLIUc
         MHhrAgt9Kll3BViNwgFySPNMTRRioKAK2rebeO6W/g+vliZhH8MalUG5bfAUayId+C31
         KDUHZQNokbcuLw4HQdpSR6Csl9TFoOdmVkigtA2dCDGP4hkuyNL99NZ9NEZVRu9rm4WS
         PedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517746; x=1749122546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZ7xUfAXguvsPdu5QAJbu8MyCaxUyBGB0j1AZF9I7as=;
        b=N5e/L9DAQ+zQqqerFVm0LytXHZsd5qG1XRNYvlqRB810pn0Br86PKiYzM03wGhiBtx
         TYvuUg/FGeT+syKlQ61iCX04P3PuprRB7W36Pk3z2/20VKaJZCzZs915t/s/6IpwJq1u
         2lilp7Cb7IWFqra6Hr6e02CGNLtJRRHrmscyLJPsEa/mYbHj2yMhDcfiwRtDbh/I4iEv
         EFusIarnS88lB457n2LrEFtqvXAafPIDs/Q+hGG70HByhpqBzzLe9CXZ5cuwxTXNNlkU
         bSEElvm0NOHs+wowy5qBLeYOOYouNSmt1FD9Wc+Xt3/CwCUy4wDlDAVYKSpeUwB3Un8z
         MFtw==
X-Forwarded-Encrypted: i=1; AJvYcCVqJ8JysEPwfA/OxAlTuuOGOvB2zLnmqwekIt4qsTpntRVQLUsiQ1Tmt9EgD0H6GRuaVONLwQsH7sa6DXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/PRo0+hWQ0TzDsB7KqcRxZIP2n+7PO5ebRfvb7SuBhK7vL1B
	zcQ64CY8b97vPw95MN0O5L6quhl0mTQLkxKXiw7BsNpzOJZ6Cpze/upSpruVifVlfWg=
X-Gm-Gg: ASbGnct6SrlD3GK5lx6O9J3tyvo2mBIdwcSJ9y1qX8R9mMaB5iSqUhpFq/rzvl7+w0z
	FVk9vnZuC8Q6wq2jh+WXatXiJZKAMsBP/13SAYXOPSNyVGfVRNEwrY0GdCpu34AgJXTTdE2EZN1
	9Htln9CDST1nWPH+xeEb4q0DZvJm+a8HnjbGAGTZ2dsIigjqzIX3WxWYhIt45bnvgD7W2GQ6OYB
	dTCyY5TrTPiJPsbIZyjkPE5YStKrGdrtQN4spAkTfmV/whz6xC+/ERB6nxRpsgIGiewmUzsfRRY
	ExmM585ICcmiuGamcmL+yAc/WztpIHNb5OjQo+w8gZOjpUxsWHmS+FpeYszg+kG0aSRxSVTC5+2
	bc3WhtZQXYl0xaPfSobXM+Q==
X-Google-Smtp-Source: AGHT+IHtecpTnD1TAwMmT1dE1m+PYsE2FTOkCSnvxNYH9D/KfiKTw9urcCFZxd5bue15j4cWk/T1cQ==
X-Received: by 2002:a17:907:1c19:b0:ad8:a935:b8f7 with SMTP id a640c23a62f3a-adacda5d3ecmr160414166b.12.1748517745943;
        Thu, 29 May 2025 04:22:25 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e838sm124428566b.72.2025.05.29.04.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:25 -0700 (PDT)
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
Subject: [PATCH v10 09/13] arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
Date: Thu, 29 May 2025 13:23:44 +0200
Message-ID: <20250529112357.24182-4-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the fully populated DTS for RaspberryPi 5 which includes
the RP1 node definition. The inclusion tree is as follow (the
arrow points to the includer):

rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b.dts
                                               ^
                                               |
                                           bcm2712-rpi-5-b-ovl-rp1.dts

This is designed to maximize the compatibility with downstream DT
while ensuring that a fully defined DT (one which includes the RP1
node as opposed to load it from overlay at runtime) is present
since early boot stage.

Since the preferred board DT is the fully populated one, name it
bcm2712-rpi-5-b.dts and move the previous one into
bcm2712-rpi-5-b-ovl-rp1.dts.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/Makefile         |   1 +
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 121 ++++++++++++++++++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 118 ++---------------
 3 files changed, 133 insertions(+), 107 deletions(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 01ecfa304184..031875a277d7 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-rpi-5-b-ovl-rp1.dtb \
 			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-2-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
new file mode 100644
index 000000000000..6ea3c102e0d6
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "bcm2712.dtsi"
+
+/ {
+	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
+	model = "Raspberry Pi 5";
+
+	aliases {
+		serial10 = &uart10;
+	};
+
+	chosen: chosen {
+		stdout-path = "serial10:115200n8";
+	};
+
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
+	/* Will be filled by the bootloader */
+	memory@0 {
+		device_type = "memory";
+		reg = <0 0 0 0x28000000>;
+	};
+
+	sd_io_1v8_reg: sd-io-1v8-reg {
+		compatible = "regulator-gpio";
+		regulator-name = "vdd-sd-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-settling-time-us = <5000>;
+		gpios = <&gio_aon 3 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>,
+			 <3300000 0>;
+	};
+
+	sd_vcc_reg: sd-vcc-reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
+ * labeled "UART", i.e. the interface with the system console.
+ */
+&uart10 {
+	status = "okay";
+};
+
+/* SDIO1 is used to drive the SD card */
+&sdio1 {
+	vqmmc-supply = <&sd_io_1v8_reg>;
+	vmmc-supply = <&sd_vcc_reg>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-ddr50;
+	sd-uhs-sdr104;
+};
+
+&soc {
+	firmware: firmware {
+		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		mboxes = <&mailbox>;
+		dma-ranges;
+
+		firmware_clocks: clocks {
+			compatible = "raspberrypi,firmware-clocks";
+			#clock-cells = <1>;
+		};
+
+		reset: reset {
+			compatible = "raspberrypi,firmware-reset";
+			#reset-cells = <1>;
+		};
+	};
+
+	power: power {
+		compatible = "raspberrypi,bcm2835-power";
+		firmware = <&firmware>;
+		#power-domain-cells = <1>;
+	};
+};
+
+&hvs {
+	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
+	clock-names = "core", "disp";
+};
+
+&hdmi0 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+};
+
+&hdmi1 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 1850a575e708..adad85e68f1b 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -1,113 +1,17 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/dts-v1/;
-
-#include <dt-bindings/gpio/gpio.h>
-#include "bcm2712.dtsi"
-
-/ {
-	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
-	model = "Raspberry Pi 5";
-
-	aliases {
-		serial10 = &uart10;
-	};
-
-	chosen: chosen {
-		stdout-path = "serial10:115200n8";
-	};
-
-	clk_rp1_xosc: clock-50000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "rp1-xosc";
-		clock-frequency = <50000000>;
-	};
-
-	/* Will be filled by the bootloader */
-	memory@0 {
-		device_type = "memory";
-		reg = <0 0 0 0x28000000>;
-	};
-
-	sd_io_1v8_reg: sd-io-1v8-reg {
-		compatible = "regulator-gpio";
-		regulator-name = "vdd-sd-io";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-		regulator-settling-time-us = <5000>;
-		gpios = <&gio_aon 3 GPIO_ACTIVE_HIGH>;
-		states = <1800000 1>,
-			 <3300000 0>;
-	};
-
-	sd_vcc_reg: sd-vcc-reg {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc-sd";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		enable-active-high;
-		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
-	};
-};
-
-/* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
- * labeled "UART", i.e. the interface with the system console.
+/*
+ * bcm2712-rpi-5-b-ovl-rp1.dts is the overlay-ready DT which will make
+ * the RP1 driver to load the RP1 dtb overlay at runtime, while
+ * bcm2712-rpi-5-b.dts (this file) is the fully defined one (i.e. it
+ * already contains RP1 node, so no overlay is loaded nor needed).
+ * This file is not intended to be modified, nodes should be added
+ * to the included bcm2712-rpi-5-b-ovl-rp1.dts.
  */
-&uart10 {
-	status = "okay";
-};
 
-/* SDIO1 is used to drive the SD card */
-&sdio1 {
-	vqmmc-supply = <&sd_io_1v8_reg>;
-	vmmc-supply = <&sd_vcc_reg>;
-	bus-width = <4>;
-	sd-uhs-sdr50;
-	sd-uhs-ddr50;
-	sd-uhs-sdr104;
-};
-
-&soc {
-	firmware: firmware {
-		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		mboxes = <&mailbox>;
-		dma-ranges;
-
-		firmware_clocks: clocks {
-			compatible = "raspberrypi,firmware-clocks";
-			#clock-cells = <1>;
-		};
-
-		reset: reset {
-			compatible = "raspberrypi,firmware-reset";
-			#reset-cells = <1>;
-		};
-	};
-
-	power: power {
-		compatible = "raspberrypi,bcm2835-power";
-		firmware = <&firmware>;
-		#power-domain-cells = <1>;
-	};
-};
-
-&hvs {
-	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
-	clock-names = "core", "disp";
-};
+/dts-v1/;
 
-&hdmi0 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
-};
+#include "bcm2712-rpi-5-b-ovl-rp1.dts"
 
-&hdmi1 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
+&pcie2 {
+	#include "rp1-nexus.dtsi"
 };
-- 
2.35.3

