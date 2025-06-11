Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B32419F137;
	Wed, 11 Jun 2025 23:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749684388; cv=none; b=Ef1GaVodIFpRt3+F/qQSRgfH6qcaRymYCez2TYFJf8jgm2xIcIfX+FjOgsPm+PRGd0NYmnL1rzVmr1jrD/HBcM1NQr0AJLM7f+FdOAOwLA/cr4eh2hY2+zEAhLsbBqd8IAR1BH3tbhPnFTb9Vcwzs4bhgpK7ukUNd050SiYTle4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749684388; c=relaxed/simple;
	bh=X/+oyDEoqaRkX09TlYcCDPI625BN4451brmPqHD9wqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o6IkphCICH0TamzNWfD6BTuXzfpeTy8jFZ+zyR1cTbF9K2JefUskECBO9oLyb28jxRjnx+QngYmJFyijSCNqAzpPjgxte8wwRXTRIMkPvj1Atd+4TaTZuqUo6pbQBfCajk+66mjBMvle1ijY4j0jew9BueCzk6WBH4M5KmwigQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKoIx6yo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKoIx6yo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20ECC4CEE3;
	Wed, 11 Jun 2025 23:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749684387;
	bh=X/+oyDEoqaRkX09TlYcCDPI625BN4451brmPqHD9wqc=;
	h=From:To:Cc:Subject:Date:From;
	b=iKoIx6yoSMHJUWlHJfwCaWQ10+RJkWS+mhhJ49HNgvZyvjc+MLxX2NRjxD7snX37s
	 37ycZD0tvY4unAtvXVBmCNI70J1hy7Y5sE0MvbgLXyCiSvnoc52TxTTYaMCxJOKSfR
	 ioSDQi0h5QjIMwom6YKNUl2J8wpTozGFC1PUDNhZLSkbUUUDT7W2RJsAup19VE8nT9
	 ks7Nn8IPB0kWrPbay377jY90JC1rW7JQStHAIzMCsvhxz/PrKw8hXnWKb//tZxtVau
	 Z79mjrwjORRbRNoqTYNmkwsdYs/Wv4ey24KtqOGDJd147DdPVKWRVz1DbMKo036Osf
	 VO96mgFb6t35w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: timer: Convert faraday,fttmr010 to DT schema
Date: Wed, 11 Jun 2025 18:26:20 -0500
Message-ID: <20250611232621.1508116-1-robh@kernel.org>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Fix clock-names order in example
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
index 000000000000..39506323556c
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
+        clocks = <&pclk>, <&extclk>;
+        clock-names = "PCLK", "EXTCLK";
+    };
-- 
2.47.2

