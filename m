Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE522262FD6;
	Mon,  5 May 2025 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456380; cv=none; b=lfLvbcFLoe4skzaRDmfMPVDCQniCxFjlWa1PbSVKyp+oBRtV9LjDGkO3wMki34YMh0sVUTb42BGOktuocn9lhWGuerX4zuZ3GjfJLxc/iPiYMbvbXlWR3P8CX5Y7jrZkTcZNWIPuqAJg5BVUpgDlyRrasBsvXfAomNJC0XaGWtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456380; c=relaxed/simple;
	bh=Ldw7UKcT0C7blDCLSjkpdIbw5wZg9xKCoqc9D/XMdsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tiRXc8m6qdBDQYOVv0Wzww7lO9gW70TbrcEz2BavtniUAqYglTysac1zhndRazx4g4cwdkDYY/axK+u0wPwqF/dGwS92NnwrS/In8u5XsrrSb2PAmL9JBDwJ7b5fIeZp8D3m4qnKbU05mtkYuXBFBaPHgZrL+456x5cr+WKaBRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tgj2G7kQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgj2G7kQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7274CC4CEF1;
	Mon,  5 May 2025 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456380;
	bh=Ldw7UKcT0C7blDCLSjkpdIbw5wZg9xKCoqc9D/XMdsY=;
	h=From:To:Cc:Subject:Date:From;
	b=tgj2G7kQCY8pFY+s70jFMmxdfdZ8SDq5H/XoIyWLIHFkj4/jITqN2VI8MQ7TsjfU0
	 MCfzWuneeZ04YRp3IO02L+GMupQgNLJ7WgDwR//DZT98wzlbj+6F7gtZ3/wW594KS1
	 tspkyokeuMaRcjfwlWMFR0RCU7xrFwh3pObvNYzFdENgJM0GfNqa2nDHWWtAtRjWEk
	 aBYdegIrGlasRc2uU8omPXdHXdL8AKRBCWZ5TpYHEKT23NbFJmfIkQETIvVzi1qw6Y
	 5AMAR2BFXWsfOnQBKQgEDYwJgWwHjBJyWwci0ISgt2gY9Zk4XYKnU5pkaxg0+abgr8
	 zwCmSwTFmD4UA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert brcm,bcm2835-armctrl-ic to DT schema
Date: Mon,  5 May 2025 09:46:16 -0500
Message-ID: <20250505144618.1287539-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Broadcom BCM2835 ARMCTRL interrupt controller binding to
schema format. It's a straight-forward conversion of the typical
interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../brcm,bcm2835-armctrl-ic.txt               | 131 --------------
 .../brcm,bcm2835-armctrl-ic.yaml              | 161 ++++++++++++++++++
 2 files changed, 161 insertions(+), 131 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
deleted file mode 100644
index bdd173056f72..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
+++ /dev/null
@@ -1,131 +0,0 @@
-BCM2835 Top-Level ("ARMCTRL") Interrupt Controller
-
-The BCM2835 contains a custom top-level interrupt controller, which supports
-72 interrupt sources using a 2-level register scheme. The interrupt
-controller, or the HW block containing it, is referred to occasionally
-as "armctrl" in the SoC documentation, hence naming of this binding.
-
-The BCM2836 contains the same interrupt controller with the same
-interrupts, but the per-CPU interrupt controller is the root, and an
-interrupt there indicates that the ARMCTRL has an interrupt to handle.
-
-Required properties:
-
-- compatible : should be "brcm,bcm2835-armctrl-ic" or
-                 "brcm,bcm2836-armctrl-ic"
-- reg : Specifies base physical address and size of the registers.
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 2.
-
-  The 1st cell is the interrupt bank; 0 for interrupts in the "IRQ basic
-  pending" register, or 1/2 respectively for interrupts in the "IRQ pending
-  1/2" register.
-
-  The 2nd cell contains the interrupt number within the bank. Valid values
-  are 0..7 for bank 0, and 0..31 for bank 1.
-
-Additional required properties for brcm,bcm2836-armctrl-ic:
-- interrupts : Specifies the interrupt on the parent for this interrupt
-  controller to handle.
-
-The interrupt sources are as follows:
-
-Bank 0:
-0: ARM_TIMER
-1: ARM_MAILBOX
-2: ARM_DOORBELL_0
-3: ARM_DOORBELL_1
-4: VPU0_HALTED
-5: VPU1_HALTED
-6: ILLEGAL_TYPE0
-7: ILLEGAL_TYPE1
-
-Bank 1:
-0: TIMER0
-1: TIMER1
-2: TIMER2
-3: TIMER3
-4: CODEC0
-5: CODEC1
-6: CODEC2
-7: VC_JPEG
-8: ISP
-9: VC_USB
-10: VC_3D
-11: TRANSPOSER
-12: MULTICORESYNC0
-13: MULTICORESYNC1
-14: MULTICORESYNC2
-15: MULTICORESYNC3
-16: DMA0
-17: DMA1
-18: VC_DMA2
-19: VC_DMA3
-20: DMA4
-21: DMA5
-22: DMA6
-23: DMA7
-24: DMA8
-25: DMA9
-26: DMA10
-27: DMA11-14 - shared interrupt for DMA 11 to 14
-28: DMAALL - triggers on all dma interrupts (including channel 15)
-29: AUX
-30: ARM
-31: VPUDMA
-
-Bank 2:
-0: HOSTPORT
-1: VIDEOSCALER
-2: CCP2TX
-3: SDC
-4: DSI0
-5: AVE
-6: CAM0
-7: CAM1
-8: HDMI0
-9: HDMI1
-10: PIXELVALVE1
-11: I2CSPISLV
-12: DSI1
-13: PWA0
-14: PWA1
-15: CPR
-16: SMI
-17: GPIO0
-18: GPIO1
-19: GPIO2
-20: GPIO3
-21: VC_I2C
-22: VC_SPI
-23: VC_I2SPCM
-24: VC_SDIO
-25: VC_UART
-26: SLIMBUS
-27: VEC
-28: CPG
-29: RNG
-30: VC_ARASANSDIO
-31: AVSPMON
-
-Example:
-
-/* BCM2835, first level */
-intc: interrupt-controller {
-	compatible = "brcm,bcm2835-armctrl-ic";
-	reg = <0x7e00b200 0x200>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
-
-/* BCM2836, second level */
-intc: interrupt-controller {
-	compatible = "brcm,bcm2836-armctrl-ic";
-	reg = <0x7e00b200 0x200>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-
-	interrupt-parent = <&local_intc>;
-	interrupts = <8>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml
new file mode 100644
index 000000000000..4edc4c3ff6bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml
@@ -0,0 +1,161 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BCM2835 ARMCTRL Interrupt Controller
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: >
+  The BCM2835 contains a custom top-level interrupt controller, which supports
+  72 interrupt sources using a 2-level register scheme. The interrupt
+  controller, or the HW block containing it, is referred to occasionally as
+  "armctrl" in the SoC documentation, hence naming of this binding.
+
+  The BCM2836 contains the same interrupt controller with the same interrupts,
+  but the per-CPU interrupt controller is the root, and an interrupt there
+  indicates that the ARMCTRL has an interrupt to handle.
+
+  The interrupt sources are as follows:
+
+  Bank 0:
+    0: ARM_TIMER
+    1: ARM_MAILBOX
+    2: ARM_DOORBELL_0
+    3: ARM_DOORBELL_1
+    4: VPU0_HALTED
+    5: VPU1_HALTED
+    6: ILLEGAL_TYPE0
+    7: ILLEGAL_TYPE1
+
+  Bank 1:
+    0: TIMER0
+    1: TIMER1
+    2: TIMER2
+    3: TIMER3
+    4: CODEC0
+    5: CODEC1
+    6: CODEC2
+    7: VC_JPEG
+    8: ISP
+    9: VC_USB
+    10: VC_3D
+    11: TRANSPOSER
+    12: MULTICORESYNC0
+    13: MULTICORESYNC1
+    14: MULTICORESYNC2
+    15: MULTICORESYNC3
+    16: DMA0
+    17: DMA1
+    18: VC_DMA2
+    19: VC_DMA3
+    20: DMA4
+    21: DMA5
+    22: DMA6
+    23: DMA7
+    24: DMA8
+    25: DMA9
+    26: DMA10
+    27: DMA11-14 - shared interrupt for DMA 11 to 14
+    28: DMAALL - triggers on all dma interrupts (including channel 15)
+    29: AUX
+    30: ARM
+    31: VPUDMA
+
+  Bank 2:
+    0: HOSTPORT
+    1: VIDEOSCALER
+    2: CCP2TX
+    3: SDC
+    4: DSI0
+    5: AVE
+    6: CAM0
+    7: CAM1
+    8: HDMI0
+    9: HDMI1
+    10: PIXELVALVE1
+    11: I2CSPISLV
+    12: DSI1
+    13: PWA0
+    14: PWA1
+    15: CPR
+    16: SMI
+    17: GPIO0
+    18: GPIO1
+    19: GPIO2
+    20: GPIO3
+    21: VC_I2C
+    22: VC_SPI
+    23: VC_I2SPCM
+    24: VC_SDIO
+    25: VC_UART
+    26: SLIMBUS
+    27: VEC
+    28: CPG
+    29: RNG
+    30: VC_ARASANSDIO
+    31: AVSPMON
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2835-armctrl-ic
+      - brcm,bcm2836-armctrl-ic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description: >
+      The 1st cell is the interrupt bank; 0 for interrupts in the "IRQ basic
+      pending" register, or 1/2 respectively for interrupts in the "IRQ pending
+      1/2" register.
+
+      The 2nd cell contains the interrupt number within the bank. Valid values
+      are 0..7 for bank 0, and 0..31 for bank 1.
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2836-armctrl-ic
+    then:
+      required:
+        - interrupts
+    else:
+      properties:
+        interrupts: false
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@7e00b200 {
+        compatible = "brcm,bcm2835-armctrl-ic";
+        reg = <0x7e00b200 0x200>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+  - |
+    interrupt-controller@7e00b200 {
+        compatible = "brcm,bcm2836-armctrl-ic";
+        reg = <0x7e00b200 0x200>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <8>;
+    };
-- 
2.47.2

