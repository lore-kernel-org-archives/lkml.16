Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247BC336775;
	Tue,  6 May 2025 02:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498164; cv=none; b=rVCfRMtivNTPxtfwEL1nxnabhzNTO6UhMNIFPLrdclRxrqmLTj95gSE4hbyYZ3Q0Mr2AlQY9xFjhPJGU3oyNEW5HaZvJGxEtyu+9xjAJI+Ie8GZAJtxk3xxNPhTrHCpOS9NvNH0IC6bt6OVQoftyP410eZpJdjApzLOUoSkr+t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498164; c=relaxed/simple;
	bh=dKF5cqv9nwsRP0Q+VO2CHb8JYRdezyAl8BkwSGE6dJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IgAMHcndAxv+5TzC1E1J4HPvUjcquIIwYJ0p0XzRxtXzW/aSggegesAFrdOsVJ8m1TzD2TYc0eWb9GrGZvnScYpxafcjHIvtvsycHYUeNf1LEO/+vBFrf4PrGBCKg24B1sp/FcU+zZwca93V5aJx779xTBfLy/vRL6DDL4P0H5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfK1bMis; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfK1bMis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF5DC4CEE4;
	Tue,  6 May 2025 02:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498163;
	bh=dKF5cqv9nwsRP0Q+VO2CHb8JYRdezyAl8BkwSGE6dJY=;
	h=From:To:Cc:Subject:Date:From;
	b=WfK1bMislzlVSHss/n2gdWKITgtyR0C3XHPm7Tr8R1z4ciN481xF1jcnCr5Id9+mk
	 BfyZps0mVivUj1hElijBN4GduS0xSPwjFVnkrcjIVmDUZvBUeY8PNE3MneZLKtytYJ
	 J6ErjQQQ6Tt4SeW+xPZIpOZlTxOsLGS71BbZkm5xmSF9xf6Esqq7CqCTeG8EVxf6Ow
	 XxfkqW5juKlNkCTZqN7kA7Ag0ZoNaigXAaeeDtUPBi014Azy5/CPOCi4QFf+7aaExv
	 4kXO67kXjqIFXztIZ3fwlZpVTJc03AAMc9QC+TV0HhpPra8CyC/NEtioQEONloMHc2
	 CstqL8cC0Wtsg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert faraday,fttmr010 to DT schema
Date: Mon,  5 May 2025 21:22:40 -0500
Message-ID: <20250506022241.2587534-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Faraday fttmr010 Timer binding to DT schema format. Adjust
the compatible string values to match what's in use. The number of
interrupts can also be anywhere from 1 to 8. The clock-names order was
reversed compared to what's used.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/faraday,fttmr010.txt       | 38 --------
 .../bindings/timer/faraday,fttmr010.yaml      | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
 create mode 100644 Documentation/devicetree/bindings/timer/faraday,fttmr010.yaml

diff --git a/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt b/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
deleted file mode 100644
index 3cb2f4c98d64..000000000000
--- a/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Faraday Technology timer
-
-This timer is a generic IP block from Faraday Technology, embedded in the
-Cortina Systems Gemini SoCs and other designs.
-
-Required properties:
-
-- compatible : Must be one of
-  "faraday,fttmr010"
-  "cortina,gemini-timer", "faraday,fttmr010"
-  "moxa,moxart-timer", "faraday,fttmr010"
-  "aspeed,ast2400-timer"
-  "aspeed,ast2500-timer"
-  "aspeed,ast2600-timer"
-
-- reg : Should contain registers location and length
-- interrupts : Should contain the three timer interrupts usually with
-  flags for falling edge
-
-Optionally required properties:
-
-- clocks : a clock to provide the tick rate for "faraday,fttmr010"
-- clock-names : should be "EXTCLK" and "PCLK" for the external tick timer
-  and peripheral clock respectively, for "faraday,fttmr010"
-- syscon : a phandle to the global Gemini system controller if the compatible
-  type is "cortina,gemini-timer"
-
-Example:
-
-timer@43000000 {
-	compatible = "faraday,fttmr010";
-	reg = <0x43000000 0x1000>;
-	interrupts = <14 IRQ_TYPE_EDGE_FALLING>, /* Timer 1 */
-		   <15 IRQ_TYPE_EDGE_FALLING>, /* Timer 2 */
-		   <16 IRQ_TYPE_EDGE_FALLING>; /* Timer 3 */
-	clocks = <&extclk>, <&pclk>;
-	clock-names = "EXTCLK", "PCLK";
-};
diff --git a/Documentation/devicetree/bindings/timer/faraday,fttmr010.yaml b/Documentation/devicetree/bindings/timer/faraday,fttmr010.yaml
new file mode 100644
index 000000000000..6f67ec0505bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/faraday,fttmr010.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Faraday FTTMR010 timer
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description:
+  This timer is a generic IP block from Faraday Technology, embedded in the
+  Cortina Systems Gemini SoCs and other designs.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: moxa,moxart-timer
+          - const: faraday,fttmr010
+      - enum:
+          - aspeed,ast2400-timer
+          - aspeed,ast2500-timer
+          - aspeed,ast2600-timer
+          - cortina,gemini-timer
+          - faraday,fttmr010
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 8
+    description: One interrupt per timer
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Peripheral clock
+      - description: External tick clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: PCLK
+      - const: EXTCLK
+
+  resets:
+    maxItems: 1
+
+  syscon:
+    description: System controller phandle for Gemini systems
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cortina,gemini-timer
+    then:
+      required:
+        - syscon
+    else:
+      properties:
+        syscon: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    timer@43000000 {
+        compatible = "faraday,fttmr010";
+        reg = <0x43000000 0x1000>;
+        interrupts = <14 IRQ_TYPE_EDGE_FALLING>, /* Timer 1 */
+                    <15 IRQ_TYPE_EDGE_FALLING>, /* Timer 2 */
+                    <16 IRQ_TYPE_EDGE_FALLING>; /* Timer 3 */
+        clocks = <&extclk>, <&pclk>;
+        clock-names = "EXTCLK", "PCLK";
+    };
-- 
2.47.2

