Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B85226550
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963872; cv=none; b=iOomzEmlqe081D20Uc4Tr74X4yRF1JnsSvPJHqcr3LsTx2s/2BKo50dSor3Mb/UDnUYPkYp7Cy8/2LEQi2BQyWqJLgisBwer5uEKCpfiks+LhIGOzl2QZpLCnbuZR534zJXS/Cpq6IxQPrDgVh8iN5NwBZy26VSAmi2qbLUEhRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963872; c=relaxed/simple;
	bh=TZUicfeAMILEnwIxb9xEAO04I+RmJCZPazH+xJUDDoY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6AMw4w3822WQ7Go6rV4uG0EAT8YsZsEDzyx8yhs1kg1ysBe6K6+3V465lxXcl5+7UK+o2ZXSAavQOij1f1gb1RRoLLKyUJvgN+oDB+kTCCuxFh/1WqgWJ03I/jTWjjgkZR6vtV1Y7cUMKxJo0NqLsTmAVf1QbcbNVGi53wN23g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IsguQlAY; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IsguQlAY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa68b513abcso472781766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963866; x=1739568666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMUvbtsA5DsEuCVaRQsEVedbOqoTRGmICjeOt7R2GgQ=;
        b=IsguQlAYC283eGQbuQwmsxax2Idetel8fX/5JEN8vGsiUDw3BTSjHHoi0KtpwBXXLN
         Evz0nkGXpTrGPGt5WybKU1dHbUcq9HeQxP1rVTS8hXbN8XV0UfJ6HeumbcAjV0lcdSVz
         NYwIaEXaai0KXrsyb7QhB7+bTJEBdSdOgL6j8Aa5+FAfIm+XdsMc7j5LNiMt4e+CwnHO
         GitauW7yzX1uR4KU2gUgNgCyrmoka38SfZsXx7YAwsuYxO/YZuxxJYTu4YCxdhAl3zFB
         Ku+R1bLCnfk9iz/ceWamJiav1c0NmpDezy+7gLWYwbUHvf6/8Uk9s1hbQZo9H2Dw+K03
         zQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963866; x=1739568666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMUvbtsA5DsEuCVaRQsEVedbOqoTRGmICjeOt7R2GgQ=;
        b=l8n2dSDf+GgqT10F87sExLeaV01EDVnnnEIhbXUUqA2bney97BOoJRI+a7UgbrLD4S
         vYsLzwPYf2gvw/hSzckHQ0Qbk7ixwmMNrYSbdCSJCeLoUuuJZrvbTgElLP/kH1aZHrc1
         P3a8eRJ4LtgBsz+dM6l4/3A1TC0X46QCc8DGz9OFpGdoc0BvlvNfp1kWu2g07Eb1XkNn
         hiYCs1dQYz1n8bMFLmjpU9lf1DbUDeu7T5Rl+w3jB33KUyXYtkFMNPiCEYOAagCdHZF8
         NGwboM5uSezC6aFEFtFy4OP/40MqTLgMPiXklCuZ6bkPhxPJRsJ6ftxDqsiTTgnbYLZ3
         gV8w==
X-Forwarded-Encrypted: i=1; AJvYcCVvepdYTDZb3x2MpfQzITTJIeElHmAN6woMrYFpFwpAN9sQo1jcfFwsPu6wsOIZGmvekaJXIdDe1muNJIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7oO1H+piZ6zKv4omfCGJ4VWK+tSgJrPOl6ruMknJyB0bqm+LD
	HKP5cns/a8YZoGHa0MmU+G9ZSIPMGMNGJWNWAIUgPzvlO8ukvlsV2RH6Br8/0gs=
X-Gm-Gg: ASbGncs98uqq8EDTuX9eP0ZrwWsJRZe1wNq7vRBKxbi1oFvsGGN/0y+s0l4/ehHcFIH
	zJr2TRxDdkTrqQpT+4nN8Bo3yeo9rY3VI19hU7bG2vU0qPJwSXrvLQW6DP6b5VqMXT/dh15tVa6
	Y0CktiKBUIvYaqZh8hW8Mdyz8hvLde3q8+vbupxPfP2gGHcRdkcBf4Qe6492j97FRpil/6ZHwos
	TKFBzowK8qI+KnoJlRXVPnl8jmlZ0imqkm7v3loJ+jSw0A50Vrp5VlHGxg4/iIshl6c9oKlhe/R
	NwQOhFuFW8lmiQoV+DdmGpQO7rvUoAMCT0WpBZlA3EoAgBJbqQxmhOSecLI=
X-Google-Smtp-Source: AGHT+IGxw8RmkdWRiBOE+V4K6YhzQQBZN/f/qODYZupDZrZmgY7l+ROzD9QDKgrRus5KdQsC+ufcWg==
X-Received: by 2002:a17:907:2d13:b0:ab7:6d4a:a746 with SMTP id a640c23a62f3a-ab789c87f67mr561681666b.51.1738963865621;
        Fri, 07 Feb 2025 13:31:05 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78cd15ac3sm173925766b.126.2025.02.07.13.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:05 -0800 (PST)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 07/11] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Fri,  7 Feb 2025 22:31:47 +0100
Message-ID: <a3e6dc47b87a5e5ef64b03a54bc518eecd90ac4d.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
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
 MAINTAINERS                           |  1 +
 arch/arm64/boot/dts/broadcom/rp1.dtso | 58 +++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/MAINTAINERS b/MAINTAINERS
index f2ba6f565d30..4cb38064694e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19751,6 +19751,7 @@ F:	drivers/media/platform/raspberrypi/rp1-cfe/
 RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1.dtso
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..cdff061e2750
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target-path="";
+		__overlay__ {
+			compatible = "pci1de4,1";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			pci_ep_bus: pci-ep-bus@1 {
+				compatible = "simple-bus";
+				ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+				dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+
+				rp1_clocks: clocks@40018000 {
+					compatible = "raspberrypi,rp1-clocks";
+					reg = <0x00 0x40018000 0x0 0x10038>;
+					#clock-cells = <1>;
+					clocks = <&clk_rp1_xosc>;
+					assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+							  <&rp1_clocks RP1_PLL_SYS>,
+							  <&rp1_clocks RP1_PLL_SYS_SEC>,
+							  <&rp1_clocks RP1_CLK_SYS>;
+					assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+							       <200000000>,  // RP1_PLL_SYS
+							       <125000000>,  // RP1_PLL_SYS_SEC
+							       <200000000>;  // RP1_CLK_SYS
+				};
+
+				rp1_gpio: pinctrl@400d0000 {
+					compatible = "raspberrypi,rp1-gpio";
+					reg = <0x00 0x400d0000  0x0 0xc000>,
+					      <0x00 0x400e0000  0x0 0xc000>,
+					      <0x00 0x400f0000  0x0 0xc000>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+						     <1 IRQ_TYPE_LEVEL_HIGH>,
+						     <2 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+		};
+	};
+};
-- 
2.35.3

