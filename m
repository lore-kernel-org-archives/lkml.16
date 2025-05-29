Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E1528EA43
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517743; cv=none; b=nRd6QGBtP2nkqunksNIk2kQkbjaeWyam4SmHv10Pdvrzhs9n28Y5Fm0N8oZ/EBF3b+P3Yk7C2qT6v0LOH/Hs05EY13rVY5oBdQcE0gFIIxTngcZGm8kWtjJ4ISXwqXUOrr7M5amKgyVaONT7vRRZG2IT8o8TlbgnSA9Z3+pObJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517743; c=relaxed/simple;
	bh=1k00ZPSbe+u73O93XUJQSZ9BJLlOaPaki/m1ZdOztYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p21dqf/YIuwzV7o48+x0GCqhJibnxtG2Hh+m0dSeG+xGW6MiW0cyMloKrAnkiA+rrpAs3Tf4w5RhNd212IQgoRgDK4vIwqa4yE0Y+XfY1Adm06NMuZWpmGdCerpf9fqRN/cSyd8TiEL34Ol3XVlPQ3KHj1bIlHcP5c5pYJE/iPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RCkKLX+J; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RCkKLX+J"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-604bde84d0fso1113806a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517739; x=1749122539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=RCkKLX+Jtzy/LaWuk72+ziSSOt3OydWfHgnEvUxsr63KbNwicc5+hITvxfX1YSfDCY
         sVEGDnDmaL3keyHvLWudokc36r1mmd/j3xBM19MnnuP24cnOpZMPROZPmfR7gnrqyA94
         NZ7JMyFNVLmh2L2PdpP4+c9b8h5/31TlR1QXMx32mkCyu+W2XeJDpBA5fldCR4ABOOjw
         ienolRaeIjWiDTN4lUy2pM2NoJkrUC0KOzSb+E/B0PML0yXjM95abx8pdV3BWoHFySV4
         rhSZhZOo2S0jkwTlPGLPlTA7xtqsxLwEJ+Pdy8rMss0agTAQ6I7xAaszTy51thA3daJv
         /c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517739; x=1749122539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=WlGkUv/S8uZNauodD2XumpJj5huvo76+4na3oNeDA620CagM8r4yGWI2EgQmizUwov
         Dc9l5sCa1rEXGl/lXu/+y/cKkhWgPjz4gMSUhPcjonlOL5yUmkPplc1B//iFkxYda/Q4
         PMAWPszrb7IsZRa9cp4fl1P3pNv1W8LJSvPNTU/IMhMCQwPL1FY4LAXlDTWk43UN5xPY
         2jxFOiE1gQ+GsLpPFla7p8q+xG0S/ECzI5mkuHtvZtC93faZHoFqre63vyyTyPDrlKv9
         8pQ5a8w3u7KYmZ6tQ/PabGw743odNTd8CCq4cLjv5pkMv9l59WzHpkvXi/rH8NiO0dOd
         hAvw==
X-Forwarded-Encrypted: i=1; AJvYcCXMZTtV3XawGomzWHOrZQVBbke+YeIGLX5jhK/uWXF7D6jia7z6HrVg6k4ZAZ8Uask1j7LWqa2pNtEh8sQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSyGkmjRH/cviRxvoQgjIlF0sHgiKYjwnBgm3VyA6slv3hFHly
	3ZJ8KimKTg9BKxxqlUkffDPPc2mni444yb2xnYSN7HXQfNW36w5oIiikgLvaXsyEPPo=
X-Gm-Gg: ASbGnctdwG3TfEJK0xZkn803R39/8aFq9mm0Q2BwIeHN9MUaO6yjdir76QcWuvt+Ast
	RXDfrIpTX4ZMGMTcKiGLzOVEq91YSdD6SoXFKDbpFwsdcWP7Ao/8fL51DbUaALdnsoMeSFG4VmM
	0R7MsZW+zbSmWRiIsaeNveBGp9nIxYBXnxT3in1qOuWfhuwu2EfYHccRIooXAlwnCjNju3ws0PJ
	fPSXbK3L6ne9DomNYKslnCW/vNlvm+tjvrbcrIaK2y9EtsN4jl+AYHje63Dw9WOrc/5oZNCSfXy
	soMd1/gIN3g6vW58N/G4SpJZ7dL31uxWRdt7ncZWPaEU3Jobz/q9G12N2XdYcscIAJxQxiTlQGW
	HVjgLrC3NRpG6DiHNx8UKdA==
X-Google-Smtp-Source: AGHT+IHU+6oQQTZ9UxWnG2j82M6XQTTflObv2BAkZ6txTGshS0NAeFEuAAS0pUeMB5MtDHKwkQcnlQ==
X-Received: by 2002:a17:907:1c19:b0:ad8:a935:b8f7 with SMTP id a640c23a62f3a-adacda5d3ecmr160376166b.12.1748517738653;
        Thu, 29 May 2025 04:22:18 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84e72csm124424366b.76.2025.05.29.04.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:18 -0700 (PDT)
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
Subject: [PATCH v10 03/13] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Thu, 29 May 2025 13:23:38 +0200
Message-ID: <7564a3bb528f3ca965e6e88b435aa8815fe0c2ea.1748514765.git.andrea.porta@suse.com>
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
Message-ID: <20250529112338.x4GAzGxRGbIPIdKIV5ZZTDJKtr5Rv1lZNMlEig_ReuA@z>

The RP1 is a MFD that exposes its peripherals through PCI BARs. This
schema is intended as minimal support for the clock generator and
gpio controller peripherals which are accessible through BAR1.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../devicetree/bindings/misc/pci1de4,1.yaml   | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
new file mode 100644
index 000000000000..2f9a7a554ed8
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 MFD PCI device
+
+maintainers:
+  - A. della Porta <andrea.porta@suse.com>
+
+description:
+  The RaspberryPi RP1 is a PCI multi function device containing
+  peripherals ranging from Ethernet to USB controller, I2C, SPI
+  and others.
+  The peripherals are accessed by addressing the PCI BAR1 region.
+
+allOf:
+  - $ref: /schemas/pci/pci-ep-bus.yaml
+
+properties:
+  compatible:
+    additionalItems: true
+    maxItems: 3
+    items:
+      - const: pci1de4,1
+
+  '#interrupt-cells':
+    const: 2
+    description: |
+      Specifies respectively the interrupt number and flags as defined
+      in include/dt-bindings/interrupt-controller/irq.h.
+      Since all interrupts are active high, only IRQ_TYPE_LEVEL_HIGH
+      and IRQ_TYPE_EDGE_RISING can be specified as type flags.
+      The supported values for the interrupt number are:
+        - IO BANK0: 0
+        - IO BANK1: 1
+        - IO BANK2: 2
+        - AUDIO IN: 3
+        - AUDIO OUT: 4
+        - PWM0: 5
+        - ETH: 6
+        - I2C0: 7
+        - I2C1: 8
+        - I2C2: 9
+        - I2C3: 10
+        - I2C4: 11
+        - I2C5: 12
+        - I2C6: 13
+        - I2S0: 14
+        - I2S1: 15
+        - I2S2: 16
+        - SDIO0: 17
+        - SDIO1: 18
+        - SPI0: 19
+        - SPI1: 20
+        - SPI2: 21
+        - SPI3: 22
+        - SPI4: 23
+        - SPI5: 24
+        - UART0: 25
+        - TIMER0: 26
+        - TIMER1: 27
+        - TIMER2: 28
+        - TIMER3: 29
+        - USB HOST0: 30
+        - USB HOST0-0: 31
+        - USB HOST0-1: 32
+        - USB HOST0-2: 33
+        - USB HOST0-3: 34
+        - USB HOST1: 35
+        - USB HOST1-0: 36
+        - USB HOST1-1: 37
+        - USB HOST1-2: 38
+        - USB HOST1-3: 39
+        - DMA: 40
+        - PWM1: 41
+        - UART1: 42
+        - UART2: 43
+        - UART3: 44
+        - UART4: 45
+        - UART5: 46
+        - MIPI0: 47
+        - MIPI1: 48
+        - VIDEO OUT: 49
+        - PIO0: 50
+        - PIO1: 51
+        - ADC FIFO: 52
+        - PCIE OUT: 53
+        - SPI6: 54
+        - SPI7: 55
+        - SPI8: 56
+        - PROC MISC: 57
+        - SYSCFG: 58
+        - CLOCKS DEFAULT: 59
+        - VBUSCTRL: 60
+
+  interrupt-controller: true
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - interrupt-controller
+  - pci-ep-bus@1
+
+examples:
+  - |
+    pci {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        rp1@0,0 {
+            compatible = "pci1de4,1";
+            ranges = <0x01 0x00 0x00000000  0x82010000 0x00 0x00  0x00 0x400000>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            pci_ep_bus: pci-ep-bus@1 {
+                compatible = "simple-bus";
+                ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+                dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+
+                rp1_clocks: clocks@40018000 {
+                    compatible = "raspberrypi,rp1-clocks";
+                    reg = <0x00 0x40018000 0x0 0x10038>;
+                    #clock-cells = <1>;
+                    clocks = <&clk_rp1_xosc>;
+                };
+            };
+        };
+    };
-- 
2.35.3

