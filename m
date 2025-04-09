Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F38425E44F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197684; cv=none; b=TOQo7zA/UK+oJjySYZp6L49mGSDpctGWcpW3IpkiV8ckZ9A9iNMKxKmJxqp4+/9YceUirszCRCRml4w7HKkkBcjdfoIXsYJyyK8AZaM1aKY2+TwiSRuB+vbAarJL7RbDPMTxdNNKPDcpRQNUZV/lXa294U2r/jQKF/ABZfMctKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197684; c=relaxed/simple;
	bh=QZ4/7iZjXWocV3kcQ1ttuuIOPNJiSGsnOMihzwPBeqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUOvbTu3pAp4nZfT94OSFSP25IoH8jFNbYfzcYdJMS0Aknjxxi+EmY5sNoCqFiIBZiSMq9tiEf1o7bh8kAbE3OI7r4N6QMjWVMdMcZEuCrNK7VmyRTEVvduLkT4lp4J/NGIPqP2m0fbaBrnCFfPE26mxtUuA+BAsHRhl/KxxHJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2TUH-0007P7-9J; Wed, 09 Apr 2025 13:20:57 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2TUH-0045qY-00;
	Wed, 09 Apr 2025 13:20:57 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2TUG-00GOXj-2u;
	Wed, 09 Apr 2025 13:20:56 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 09 Apr 2025 13:20:58 +0200
Subject: [PATCH v2 2/3] dt-bindings: clock: add TI CDCE6214 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-clk-cdce6214-v2-2-40b25b722ecb@pengutronix.de>
References: <20250409-clk-cdce6214-v2-0-40b25b722ecb@pengutronix.de>
In-Reply-To: <20250409-clk-cdce6214-v2-0-40b25b722ecb@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744197656; l=5855;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=QZ4/7iZjXWocV3kcQ1ttuuIOPNJiSGsnOMihzwPBeqA=;
 b=3TI0/4gazNdC+cD4+atc2FrRlj8FIblUb+B/4Btk2Y29N5401KxVz3XcuieO/q0e88HVtnVzH
 pjyhx/dkJReC0vpdTmE5BYRm0qI5p9Dn+wwLrDkcHJYqo57+xpSlO1p
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
Differential Outputs, Two Inputs, and Internal EEPROM. This patch adds
the device tree binding for this chip.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/clock/ti,cdce6214.yaml     | 167 +++++++++++++++++++++
 include/dt-bindings/clock/ti,cdce6214.h            |  24 +++
 2 files changed, 191 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
new file mode 100644
index 0000000000000..957e40403100d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,cdce6214.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI CDCE6214 programmable clock generator with PLL
+
+maintainers:
+  - Sascha Hauer <s.hauer@pengutronix.de>
+
+description:
+  Ultra-Low Power Clock Generator With One PLL, Four Differential Outputs,
+  Two Inputs, and Internal EEPROM
+
+  https://www.ti.com/product/CDCE6214
+
+properties:
+  compatible:
+    enum:
+      - ti,cdce6214
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 1
+    items:
+      enum: [ priref, secref ]
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#clock-cells':
+    const: 1
+
+patternProperties:
+  '^clk@[0-1]$':
+    type: object
+    description:
+      optional child node that can be used to specify input pin parameters. The reg
+      properties match the CDCE6214_CLK_* defines.
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        description:
+          clock input identifier.
+        minimum: 0
+        maximum: 1
+
+      ti,clkin-fmt:
+        description: |
+          Clock input format. Available options are:
+          0 LVCMOS
+          1 XTAL
+          2 Differential
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 2
+
+      ti,xo-cload-femtofarad:
+        description:
+          Selects load cap for XO in femto Farad (fF). Up to 9000fF
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 3000
+        maximum: 9000
+
+      ti,xo-bias-current-microampere:
+        description:
+          Bias current setting of the XO.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 1758
+
+  '^clk@[2-9]$':
+    type: object
+    description:
+      optional child node that can be used to specify output pin parameters.  The reg
+      properties match the CDCE6214_CLK_* defines.
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        description:
+          clock output identifier.
+        minimum: 2
+        maximum: 9
+
+      ti,clkout-fmt:
+        description: |
+          Clock input format. Available options are:
+          0 CMOS
+          1 LVDS
+          2 LP-HCSL
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 2
+
+      ti,cmos-mode:
+        description: |
+          CMOS output mode. Available options are:
+          0 disabled
+          1 high polarity
+          2 low polarity
+          first array entry is for the CMOSP pin, second for the CMOSN pin
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        maxItems: 2
+        items:
+          maximum: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-generator@67 {
+            compatible = "ti,cdce6214";
+            reg = <0x67>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #clock-cells = <1>;
+            clocks = <&clock_ref25m>;
+            clock-names = "secref";
+
+            clk@1 {
+                reg = <1>; // CDCE6214_CLK_SECREF
+                ti,clkin-fmt = <1>; // XTAL
+            };
+
+            clk@3 {
+                reg = <3>; // CDCE6214_CLK_OUT1
+                ti,clkout-fmt = <0>; // CMOS
+                ti,cmos-mode = <1 2>; // CMOSP = highpol, CMOSN = lowpol
+            };
+
+            clk@4 {
+                reg = <4>; // CDCE6214_CLK_OUT2
+                ti,clkout-fmt = <1>; // LVDS
+            };
+
+            clk@6 {
+                reg = <6>; // CDCE6214_CLK_OUT4
+                ti,clkout-fmt = <2>; // LP-HCSL
+            };
+        };
+    };
diff --git a/include/dt-bindings/clock/ti,cdce6214.h b/include/dt-bindings/clock/ti,cdce6214.h
new file mode 100644
index 0000000000000..1b41060896cc3
--- /dev/null
+++ b/include/dt-bindings/clock/ti,cdce6214.h
@@ -0,0 +1,24 @@
+#ifndef _DT_BINDINGS_CLK_TI_CDCE6214_H
+#define _DT_BINDINGS_CLK_TI_CDCE6214_H
+
+/*
+ * primary/secondary inputs. Not registered as clocks, but used
+ * as reg properties for the subnodes specifying the input properties
+ */
+#define CDCE6214_CLK_PRIREF	0
+#define CDCE6214_CLK_SECREF	1
+
+/*
+ * Clock indices for the clocks provided by the CDCE6214. Also used
+ * as reg properties for the subnodes specifying the output properties
+ */
+#define CDCE6214_CLK_OUT0	2
+#define CDCE6214_CLK_OUT1	3
+#define CDCE6214_CLK_OUT2	4
+#define CDCE6214_CLK_OUT3	5
+#define CDCE6214_CLK_OUT4	6
+#define CDCE6214_CLK_PLL	7
+#define CDCE6214_CLK_PSA	8
+#define CDCE6214_CLK_PSB	9
+
+#endif /* _DT_BINDINGS_CLK_TI_CDCE6214_H */

-- 
2.39.5

