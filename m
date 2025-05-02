Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F6623E35E;
	Fri,  2 May 2025 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183167; cv=none; b=K48/wc9SxY0sRUuBxhQbkaOonCqw9JeSCKl39NE1qv5BUja1Tw3BMZ5bfl0MXhRJh6ECwu+89c7RT2Iyjzw1x61BX1HBQ7vvEQSGdcjFbSL8jZYt5bAm7f1vIfuv2kr7fAa3zpsfhf1H9+CrZpF1RipNs2okE8mMypDHkwdBkbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183167; c=relaxed/simple;
	bh=Misc6jwAze7JH3nbACNwR9uMmc/qXFqVyYCZmCJzrco=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f8aR3ZKOlCn0mwp5vUq8jh/ejQf/XODbwhjLiZhjN1hzzWLu2z+MbEYgDA3KP6/+4KltyKSR5qg0fO9ObB4+gDYwJASZlPpft2fKDORbnC4jQGdc3Ug9nizubJRsGHRlY5MXVEdO6KPpZb7S48vWa1TnzjpsJHlz7m4T80Zywho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=dKbkka0m; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="dKbkka0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1746183143; x=1746787943; i=wahrenst@gmx.net;
	bh=sD2C/KwrLug1GlFwtgVjsmb7rNc0HG0Qt0zPdcATmoM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dKbkka0mCU05JHGUHcd7bXEboF2vJylGEExHrrnlKO/nhnLq5UiRLVqpw6EuHBHY
	 RzX6jtPx5iyqV9UjSUmwa2dwnL/H75M+tBrM3lG/jSvGR43+hDsdrS0lJmi0dX8WO
	 vJI0B4g6Lc3y6G5PR+lD/hdRB5eiqhYCdoRnBnQseyYaGSFCh6UpFyNNKOFxfYPXX
	 Q/TGs5+/1dhinctQDBp/skexZ93jBsd9Tck6PV8hldZvbvqEzSJmRvob6UcXefP0d
	 7XAP5+mMFzdSEyARp9hVGMkefVqItawN8LwhRdOQOaJQhoyvwJigrF6kQpWn/r1Te
	 M3dWa0BpjECfd/bvOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.209.218]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpJg-1ukPfY41uE-00bwhC; Fri, 02
 May 2025 12:52:23 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] dt-bindings: interrupt-controller: convert bcm2835-armctrl-ic to yaml
Date: Fri,  2 May 2025 12:52:13 +0200
Message-Id: <20250502105213.39864-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O6+f2MHYdTMYzFiswTCMVf91enatEYjBHV6EwyTIPlMJpBxogdJ
 zd8Xw8agCSh572n8ETGXowrEDhLZXIiVvyl3a9yOz55jTCTBpM3XsEVguIyuVUFaK8oTf2x
 eLNVs8eJhV1wOFkOG9x7Wjn4r2Kq9Ua+GPNJfFgNpPu7o+bAruIJYtW6VYr6PWpU4df2vVz
 1oEiNslLGqR6JmcGi3LSA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/rnRdxLSPwE=;vLxFK8gLVB+xNHRXD6apXUTO2nJ
 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

Convert the DT binding document for BCM2835 ARMCTRL Interrupt Controller
from .txt to YAML.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../brcm,bcm2835-armctrl-ic.txt               | 131 ------------------
 .../brcm,bcm2835-armctrl-ic.yaml              |  67 +++++++++
 2 files changed, 67 insertions(+), 131 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller=
/brcm,bcm2835-armctrl-ic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller=
/brcm,bcm2835-armctrl-ic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,b=
cm2835-armctrl-ic.txt b/Documentation/devicetree/bindings/interrupt-contro=
ller/brcm,bcm2835-armctrl-ic.txt
deleted file mode 100644
index bdd173056f72..000000000000
=2D-- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm283=
5-armctrl-ic.txt
+++ /dev/null
@@ -1,131 +0,0 @@
-BCM2835 Top-Level ("ARMCTRL") Interrupt Controller
-
-The BCM2835 contains a custom top-level interrupt controller, which suppo=
rts
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
=2D- compatible : should be "brcm,bcm2835-armctrl-ic" or
-                 "brcm,bcm2836-armctrl-ic"
=2D- reg : Specifies base physical address and size of the registers.
=2D- interrupt-controller : Identifies the node as an interrupt controller
=2D- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 2.
-
-  The 1st cell is the interrupt bank; 0 for interrupts in the "IRQ basic
-  pending" register, or 1/2 respectively for interrupts in the "IRQ pendi=
ng
-  1/2" register.
-
-  The 2nd cell contains the interrupt number within the bank. Valid value=
s
-  are 0..7 for bank 0, and 0..31 for bank 1.
-
-Additional required properties for brcm,bcm2836-armctrl-ic:
=2D- interrupts : Specifies the interrupt on the parent for this interrupt
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
-	compatible =3D "brcm,bcm2835-armctrl-ic";
-	reg =3D <0x7e00b200 0x200>;
-	interrupt-controller;
-	#interrupt-cells =3D <2>;
-};
-
-/* BCM2836, second level */
-intc: interrupt-controller {
-	compatible =3D "brcm,bcm2836-armctrl-ic";
-	reg =3D <0x7e00b200 0x200>;
-	interrupt-controller;
-	#interrupt-cells =3D <2>;
-
-	interrupt-parent =3D <&local_intc>;
-	interrupts =3D <8>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,b=
cm2835-armctrl-ic.yaml b/Documentation/devicetree/bindings/interrupt-contr=
oller/brcm,bcm2835-armctrl-ic.yaml
new file mode 100644
index 000000000000..6b66f5e5897c
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-=
armctrl-ic.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2835-armc=
trl-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BCM2835 Top-Level ("ARMCTRL") Interrupt Controller
+
+maintainers:
+  - Stefan Wahren <wahrenst@gmx.net>
+  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+
+description:
+  The BCM2835 contains a custom top-level interrupt controller, which sup=
ports
+  72 interrupt sources using a 2-level register scheme. The interrupt
+  controller, or the HW block containing it, is referred to occasionally
+  as "armctrl" in the SoC documentation, hence naming of this binding.
+
+  The BCM2836 contains the same interrupt controller with the same
+  interrupts, but the per-CPU interrupt controller is the root, and an
+  interrupt there indicates that the ARMCTRL has an interrupt to handle.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
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
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: brcm,bcm2836-armctrl-ic
+then:
+  required:
+    - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    intc: interrupt-controller@7e00b200 {
+        compatible =3D "brcm,bcm2835-armctrl-ic";
+        reg =3D <0x7e00b200 0x200>;
+        interrupt-controller;
+        #interrupt-cells =3D <2>;
+    };
=2D-=20
2.34.1

