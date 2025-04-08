Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F25826A08E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113654; cv=none; b=uChaBC7yb//EQCxXH/lKxW5GJz8DXd8zzgsU7MNtlq5evYC3bRBXVymtQBonOZ8jfGwIo4DaiofnK4zt8Z7txjLDCjLvdDhcGv1oL25D19mH3le5EtscgyUKtG5V4/U7loSuDmVZ46CBvFh9rRhx5Af0ILQ7Fmso6B9pPlxbj+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113654; c=relaxed/simple;
	bh=uURuyUTyytSYMJNGPupFetyuh35vrylqZdU9Re4s1aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XM1R0QSyNC1ANt+y2g1CB5cmCuB0hAJ58DrpHENPpbypSdQrlB0YLEikkl42pdWKBw95kkb9Bu57H2xmRv54JmV0AUsTjVrM7g00a80kS8XV+q2++StOvw/qDplfnFqFdkoV+GkGIZ9RPI507pS32HTdjKvGhAQ5ZGtt00f6rSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u27d0-0000js-Eg; Tue, 08 Apr 2025 14:00:30 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u27d0-003vQ2-0F;
	Tue, 08 Apr 2025 14:00:30 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u27cz-00GJS1-39;
	Tue, 08 Apr 2025 14:00:29 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Tue, 08 Apr 2025 14:00:24 +0200
Subject: [PATCH 3/3] dt-bindings: clock: add TI CDCE6214 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-clk-cdce6214-v1-3-bd4e7092a91f@pengutronix.de>
References: <20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de>
In-Reply-To: <20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744113629; l=4324;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=uURuyUTyytSYMJNGPupFetyuh35vrylqZdU9Re4s1aQ=;
 b=K4OMnI4y9egZSBvm+YcCLbmzWTT7hfJvzhqG1mLa0W7eEaCKAaxpCqFlVKNXBYBE8eNhDrqKv
 lk0/7v5kURTDuqaV52EZ4M808ihhoa1fmRdLabo5NHLL1z3pQI+1jCv
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
 .../devicetree/bindings/clock/ti,cdce6214.yaml     | 157 +++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
new file mode 100644
index 0000000000000..63e6c9d9b1771
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
@@ -0,0 +1,157 @@
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
+description: |
+  Ultra-Low Power Clock Generator With One PLL, Four Differential Outputs,
+  Two Inputs, and Internal EEPROM
+
+  - CDCE6214: https://www.ti.com/product/CDCE6214
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
+    items:
+      - const: priref
+      - const: secref
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  "#clock-cells":
+    const: 1
+
+patternProperties:
+  "^clk@[0-1]$":
+    type: object
+    description: |
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
+      ti,ref-xtal:
+        type: boolean
+        description: |
+          If true use input as XTAL input
+
+      ti,ref-lvcmos:
+        type: boolean
+        description: |
+          If true use input as LVCMOS input
+
+      ti,ref-diff:
+        type: boolean
+        description: |
+          If true use input as differential input
+
+  "^clk@[2-9]$":
+    type: object
+    description: |
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
+      ti,lphcsl:
+        type: boolean
+        description: |
+          If true enable LP-HCSL output mode for this clock
+
+      ti,lvds:
+        type: boolean
+        description: |
+          If true enable LVDS output mode for this clock
+
+      ti,cmosp:
+        type: boolean
+        description: |
+          If true enable CMOSP output for this clock
+
+      ti,cmosn:
+        type: boolean
+        description: |
+          If true enable CMOSN output for this clock
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ti,cdce6214.h>
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
+            clock-names = "priref";
+
+            clk@CDCE6214_CLK_SECREF {
+                reg = <CDCE6214_CLK_SECREF>;
+                ti,ref-xtal;
+            };
+
+            clk@CDCE6214_CLK_OUT1 {
+                reg = <CDCE6214_CLK_OUT1>;
+                ti,cmosp;
+                ti,cmosn;
+            };
+
+            clk@CDCE6214_CLK_OUT2 {
+                reg = <CDCE6214_CLK_OUT2>;
+                ti,lvds;
+            };
+
+            clk@CDCE6214_CLK_OUT4 {
+                reg = <CDCE6214_CLK_OUT4>;
+                ti,cmosp;
+                ti,cmosn;
+            };
+        };
+    };

-- 
2.39.5

