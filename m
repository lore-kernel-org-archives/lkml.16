Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A7A25A340;
	Mon,  5 May 2025 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456427; cv=none; b=ZcG2gmCJEUVRgZ6a0+9NQn+WDZtu1K5ZYSrK0lDH5mNYvVAfplxgoJU7ihw6/COzykqy2n7WO8YH8djVhwQa7Qiiv5PV2gmDzzsEmakgAA7kUIwfHlTO4Ss9TG3Vc/oh44XLN8yzXkxPI3aY2i8JAtsCt6PxPpbgyhO71iY28SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456427; c=relaxed/simple;
	bh=TzkCiRK2N5vOyQDkcnj4gmKPFysY8UHZSPIhur1N6k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GE0RtbBe1R4p9JIN9qDxI58U9NDmORAyB6isusBnycxjZ/A8klrs5AjpWZ/i80H78qGQn6/qGVfaLaeV4vC2ud4lUTdkTvdGx7SS0YKxR9xlqT4jMEC9St/ASSfyn4QazDXgDI8gRVZz4He3km9wOdDr5JxuHY9T5rgj4KF0nG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pp4O8INA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pp4O8INA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AF2C4CEE4;
	Mon,  5 May 2025 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456425;
	bh=TzkCiRK2N5vOyQDkcnj4gmKPFysY8UHZSPIhur1N6k0=;
	h=From:To:Cc:Subject:Date:From;
	b=Pp4O8INApeEbU2POIQdLCt4Xzc2pgR/DjPQASD+E2sKEJHtEKhS2BfXeczDYgoveT
	 iY1orWIMVcKtwBGyqFfOnJVzEe6k9PQiVIymFiKOzREBS0bpkO4yHnX474miBQCeOF
	 UfrmC+OQAiOqCJyHOvZdCgKQkOGF7UPE6WSppyZ+olSkFzI2cHvKT/067eHeeaAdm6
	 Qfn46tzpSX0aySJzUSoRcWtAhQ2bPgW5zhB28qpvr/Q6AjTDR7icUxn1CbiT+zFhYC
	 jU+1IG5cP1o9Dxg9J7sLu0r6TzE+VDM2dSoalw2/Q5hctvxEkFd0MtVwGjruG+sXeC
	 wkKapD0qWgDpQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hogan <jhogan@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert img,pdc-intc to DT schema
Date: Mon,  5 May 2025 09:47:01 -0500
Message-ID: <20250505144703.1289335-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ImgTec Powerdown Controller (PDC) interrupt controller
binding to schema format. It's a straight-forward conversion of the
typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/img,pdc-intc.txt     | 105 ------------------
 .../interrupt-controller/img,pdc-intc.yaml    |  79 +++++++++++++
 2 files changed, 79 insertions(+), 105 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.txt
deleted file mode 100644
index 5dc2a55ad811..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.txt
+++ /dev/null
@@ -1,105 +0,0 @@
-* ImgTec Powerdown Controller (PDC) Interrupt Controller Binding
-
-This binding specifies what properties must be available in the device tree
-representation of a PDC IRQ controller. This has a number of input interrupt
-lines which can wake the system, and are passed on through output interrupt
-lines.
-
-Required properties:
-
-    - compatible: Specifies the compatibility list for the interrupt controller.
-      The type shall be <string> and the value shall include "img,pdc-intc".
-
-    - reg: Specifies the base PDC physical address(s) and size(s) of the
-      addressable register space. The type shall be <prop-encoded-array>.
-
-    - interrupt-controller: The presence of this property identifies the node
-      as an interrupt controller. No property value shall be defined.
-
-    - #interrupt-cells: Specifies the number of cells needed to encode an
-      interrupt source. The type shall be a <u32> and the value shall be 2.
-
-    - num-perips: Number of waking peripherals.
-
-    - num-syswakes: Number of SysWake inputs.
-
-    - interrupts: List of interrupt specifiers. The first specifier shall be the
-      shared SysWake interrupt, and remaining specifies shall be PDC peripheral
-      interrupts in order.
-
-* Interrupt Specifier Definition
-
-  Interrupt specifiers consists of 2 cells encoded as follows:
-
-    - <1st-cell>: The interrupt-number that identifies the interrupt source.
-                    0-7:  Peripheral interrupts
-                    8-15: SysWake interrupts
-
-    - <2nd-cell>: The level-sense information, encoded using the Linux interrupt
-                  flags as follows (only 4 valid for peripheral interrupts):
-                    0 = none (decided by software)
-                    1 = low-to-high edge triggered
-                    2 = high-to-low edge triggered
-                    3 = both edge triggered
-                    4 = active-high level-sensitive (required for perip irqs)
-                    8 = active-low level-sensitive
-
-* Examples
-
-Example 1:
-
-	/*
-	 * TZ1090 PDC block
-	 */
-	pdc: pdc@02006000 {
-		// This is an interrupt controller node.
-		interrupt-controller;
-
-		// Three cells to encode interrupt sources.
-		#interrupt-cells = <2>;
-
-		// Offset address of 0x02006000 and size of 0x1000.
-		reg = <0x02006000 0x1000>;
-
-		// Compatible with Meta hardware trigger block.
-		compatible = "img,pdc-intc";
-
-		// Three peripherals are connected.
-		num-perips = <3>;
-
-		// Four SysWakes are connected.
-		num-syswakes = <4>;
-
-		interrupts = <18 4 /* level */>, /* Syswakes */
-			     <30 4 /* level */>, /* Peripheral 0 (RTC) */
-			     <29 4 /* level */>, /* Peripheral 1 (IR) */
-			     <31 4 /* level */>; /* Peripheral 2 (WDT) */
-	};
-
-Example 2:
-
-	/*
-	 * An SoC peripheral that is wired through the PDC.
-	 */
-	rtc0 {
-		// The interrupt controller that this device is wired to.
-		interrupt-parent = <&pdc>;
-
-		// Interrupt source Peripheral 0
-		interrupts = <0   /* Peripheral 0 (RTC) */
-		              4>  /* IRQ_TYPE_LEVEL_HIGH */
-	};
-
-Example 3:
-
-	/*
-	 * An interrupt generating device that is wired to a SysWake pin.
-	 */
-	touchscreen0 {
-		// The interrupt controller that this device is wired to.
-		interrupt-parent = <&pdc>;
-
-		// Interrupt source SysWake 0 that is active-low level-sensitive
-		interrupts = <8 /* SysWake0 */
-			      8 /* IRQ_TYPE_LEVEL_LOW */>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.yaml
new file mode 100644
index 000000000000..99e7a4281595
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/img,pdc-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ImgTec Powerdown Controller (PDC) Interrupt Controller
+
+maintainers:
+  - James Hogan <jhogan@kernel.org>
+
+description:
+  ImgTec Powerdown Controller (PDC) Interrupt Controller has a number of input
+  interrupt lines which can wake the system, and are passed on through output
+  interrupt lines.
+
+properties:
+  compatible:
+    const: img,pdc-intc
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description: >
+      <1st-cell>: The interrupt-number that identifies the interrupt source.
+        0-7:  Peripheral interrupts
+        8-15: SysWake interrupts
+
+      <2nd-cell>: The level-sense information, encoded using the Linux interrupt
+        flags as follows (only 4 valid for peripheral interrupts):
+        0 = none (decided by software)
+        1 = low-to-high edge triggered
+        2 = high-to-low edge triggered
+        3 = both edge triggered
+        4 = active-high level-sensitive (required for perip irqs)
+        8 = active-low level-sensitive
+    const: 2
+
+  num-perips:
+    description: Number of waking peripherals
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 8
+
+  num-syswakes:
+    description: Number of SysWake inputs
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 8
+
+  interrupts:
+    description:
+      First entry is syswake IRQ. Subsequent entries are 1 per peripheral.
+    minItems: 2
+    maxItems: 9
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - num-perips
+  - num-syswakes
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@2006000 {
+        compatible = "img,pdc-intc";
+        reg = <0x02006000 0x1000>;
+        interrupts = <18 4>, <30 4>, <29 4>, <31 4>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        num-perips = <3>;
+        num-syswakes = <4>;
+    };
-- 
2.47.2

