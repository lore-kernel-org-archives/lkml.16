Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5059725C82C;
	Mon,  5 May 2025 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456364; cv=none; b=YLbZ/tCCiDz9xpHuKbylZKvui+YxJLI5L7y9uDwDuBZwh1J58AuwvZOL0jYMprXiTvce0HGE27znJu/0opOO596u3hpR/MDtgCrnOra+wtJgfYrzI9yKqYJVGMq5UlzIEO43ZQj42aQ5/LfKET69RwZrqtOIQo9NkAjzR0op8ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456364; c=relaxed/simple;
	bh=dINDieKlBRIxVCiQTsOdn321MxARiD3/xa5alUeqyvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DV0/T/F9H9spAm79TAc+fH4ZbZ3sSW+VRpAk2j9O/+OeBFlT/pZQH9u8ZXMTDeFHZxI01wqeq66WshCcFHNCWTVhh0qyYDGCII+nDC3MDfhxAMUuoFLC/CtqG9nIPH61aAO6u8tSFpPtTR2ydFQdrHkPEzXULX9H0soLsbjI7co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BB0hc66K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BB0hc66K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90879C4CEE4;
	Mon,  5 May 2025 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456363;
	bh=dINDieKlBRIxVCiQTsOdn321MxARiD3/xa5alUeqyvg=;
	h=From:To:Cc:Subject:Date:From;
	b=BB0hc66Ko1y4gW0iJB0v1nHzWj/9DsKNlGRyeFKyM4yWe9DymUqj2ZQPQkMnJeru1
	 l1uWVTXO8ISndRT5otY77o0KBImZqe/AR+78o9JyRZKLPOocpcKYEuYMiFfpy7Y9KM
	 8U0hvnvvuKBTSmol2GjjI7hl3nVdfwyyt7PiXJuG4+JJCKlD6EveOCZUy8wjgSLkSL
	 gs6WiciNn6CqZuVpE/6CmjGJ4WEsNKByu2aOg/8ncN93DdIfJemF8iwXwmo0RgR2jM
	 hT+s2QGRVJ/F4cEV131Ah0HAFFJNwlBq//ubEyGAQpq5EEEcypGLVqbsREz2oS/3Zr
	 YyY2WlSzx4/WQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert arm,versatile-fpga-irq to DT schema
Date: Mon,  5 May 2025 09:45:56 -0500
Message-ID: <20250505144558.1286889-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Arm Versatile FPGA interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../arm,versatile-fpga-irq.txt                | 38 ------------
 .../arm,versatile-fpga-irq.yaml               | 61 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 62 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
deleted file mode 100644
index ea939f54c5eb..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-* ARM Versatile FPGA interrupt controller
-
-One or more FPGA IRQ controllers can be synthesized in an ARM reference board
-such as the Integrator or Versatile family. The output of these different
-controllers are OR:ed together and fed to the CPU tile's IRQ input. Each
-instance can handle up to 32 interrupts.
-
-Required properties:
-- compatible: "arm,versatile-fpga-irq"
-- interrupt-controller: Identifies the node as an interrupt controller
-- #interrupt-cells: The number of cells to define the interrupts.  Must be 1
-  as the FPGA IRQ controller has no configuration options for interrupt
-  sources.  The cell is a u32 and defines the interrupt number.
-- reg: The register bank for the FPGA interrupt controller.
-- clear-mask: a u32 number representing the mask written to clear all IRQs
-  on the controller at boot for example.
-- valid-mask: a u32 number representing a bit mask determining which of
-  the interrupts are valid. Unconnected/unused lines are set to 0, and
-  the system till not make it possible for devices to request these
-  interrupts.
-
-The "oxsemi,ox810se-rps-irq" compatible is deprecated.
-
-Example:
-
-pic: pic@14000000 {
-        compatible = "arm,versatile-fpga-irq";
-        #interrupt-cells = <1>;
-        interrupt-controller;
-        reg = <0x14000000 0x100>;
-        clear-mask = <0xffffffff>;
-        valid-mask = <0x003fffff>;
-};
-
-Optional properties:
-- interrupts: if the FPGA IRQ controller is cascaded, i.e. if its IRQ
-  output is simply connected to the input of another IRQ controller,
-  then the parent IRQ shall be specified in this property.
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.yaml
new file mode 100644
index 000000000000..8d581b3aac3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/arm,versatile-fpga-irq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Versatile FPGA IRQ Controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description:
+  One or more FPGA IRQ controllers can be synthesized in an ARM reference board
+  such as the Integrator or Versatile family. The output of these different
+  controllers are OR:ed together and fed to the CPU tile's IRQ input. Each
+  instance can handle up to 32 interrupts.
+
+properties:
+  compatible:
+    const: arm,versatile-fpga-irq
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clear-mask:
+    description: A mask written to clear all IRQs on the controller at boot.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  valid-mask:
+    description:
+      A bit mask determining which interrupts are valid; unused lines are set to 0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  interrupts:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupt-controller
+  - '#interrupt-cells'
+  - reg
+  - clear-mask
+  - valid-mask
+
+examples:
+  - |
+    interrupt-controller@14000000 {
+        compatible = "arm,versatile-fpga-irq";
+        #interrupt-cells = <1>;
+        interrupt-controller;
+        reg = <0x14000000 0x100>;
+        clear-mask = <0xffffffff>;
+        valid-mask = <0x003fffff>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 27b9c62f94bf..b830dfeaa05f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1918,7 +1918,7 @@ F:	Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
 F:	Documentation/devicetree/bindings/auxdisplay/arm,versatile-lcd.yaml
 F:	Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
 F:	Documentation/devicetree/bindings/i2c/arm,i2c-versatile.yaml
-F:	Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.yaml
 F:	Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
 F:	arch/arm/boot/dts/arm/arm-realview-*
 F:	arch/arm/boot/dts/arm/integrator*
-- 
2.47.2

