Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B24528134D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238491; cv=none; b=cyZgPb9ZJfrkZXbcj/gyDKluiS7jlkd+AvgDEXxBuE33Aj2ydDnz9peiRktILTqiSDDs5Q4S/SNjen59BcXKiCp7esGpDk1DPfyHNOimeQZNJJ1dQvazCj4h9Z2OTlpMYtU6BhP95vZNQIWqK3pxXGgEN9OyTAjBtYHqmT6HRMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238491; c=relaxed/simple;
	bh=zXZe+qJTLC6fo/1MoICek/b4HV3kkC9vbZuXJj7J3oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMlqMvmJniwBU5sGwlRJKLAqE0A/8oxv3oesVcwPUGlwZ1nUbq9Xyk9HYXpakjiFLALaD5VXEDekXN0OAta/bilkdtMubwWn9iYxOEH/qFb8tywhi6mTw28AoERHvivtevOaWCyVZHio1GydtG5/wqP/RHyy8uihpcwYP9S/lyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyr-0003Av-6q; Wed, 18 Jun 2025 11:21:17 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyq-004756-2P;
	Wed, 18 Jun 2025 11:21:16 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyq-005QWt-26;
	Wed, 18 Jun 2025 11:21:16 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 18 Jun 2025 11:21:12 +0200
Subject: [PATCH v5 1/4] dt-bindings: clock: add TI CDCE6214 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-clk-cdce6214-v5-1-9938b8ed0b94@pengutronix.de>
References: <20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de>
In-Reply-To: <20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750238476; l=3070;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=zXZe+qJTLC6fo/1MoICek/b4HV3kkC9vbZuXJj7J3oo=;
 b=4dbjlwJlJcp8zj7IImcRe3WIfzdJl2Id5r3+gj8wAGIfwipjuSU1PAkW4YWDweM4YITCNdKjS
 B8RjDUUD9lUDoqBLh09dmZRWhzWiYitN4IjMgn1lHBxgtD9ihZWXnZ7
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
Generator With One PLL, Four Differential Outputs, Two Inputs, and
Internal EEPROM.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/clock/ti,cdce6214.yaml     | 60 ++++++++++++++++++++++
 include/dt-bindings/clock/ti,cdce6214.h            | 25 +++++++++
 2 files changed, 85 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0a952b634079ec74bbf1114d1beb9fd5ee8682ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
@@ -0,0 +1,60 @@
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
+description: >
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
+    items:
+      - enum: [ priref, secref ]
+      - const: secref
+
+  '#clock-cells':
+    const: 1
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
+            #clock-cells = <1>;
+            clocks = <&clock_ref25m>;
+            clock-names = "secref";
+        };
+    };
diff --git a/include/dt-bindings/clock/ti,cdce6214.h b/include/dt-bindings/clock/ti,cdce6214.h
new file mode 100644
index 0000000000000000000000000000000000000000..ffe4c3cf83afdf5e58e31a5511ea998a5ec97878
--- /dev/null
+++ b/include/dt-bindings/clock/ti,cdce6214.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
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

