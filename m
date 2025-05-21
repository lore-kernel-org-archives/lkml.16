Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D68171D2;
	Wed, 21 May 2025 00:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788412; cv=none; b=GIBddviUJrUXqJ5Sg/Yo1e+CJUaBf91zLnatT7+bXjZurfm6K5QJUB4NkvLJg2CdhlOI77t/XjxIR9q7lMp0FKX/RkYq2eYWGDMwGL3tzJ9g7nzu0oiyMzMq/no7PVIPN3th2xGiHMOhD25mK/iRgnQc6jwPB8GAlu6CnyDQk5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788412; c=relaxed/simple;
	bh=G2LNYEnxZxAcTJg97uOhjn1RbqcOVP6a1gqMCjz9igo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mH19vU8PbjaNkk/X1uaUX4Oya0tFldhkFUTz0acthLlZKNEi9WlXT4d0AKVanU5V/7+7QXEVh0UQINRZnTw8xC2FsgqsX4+UUmOQs+SXhvF84IwfxqJaM77IU009AcpI3cvYBgR/qHBxHcHSLGucWoi5U9p9zQBqBO0FjdY3CVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mK55q7E9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mK55q7E9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386B6C4CEE9;
	Wed, 21 May 2025 00:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747788411;
	bh=G2LNYEnxZxAcTJg97uOhjn1RbqcOVP6a1gqMCjz9igo=;
	h=From:To:Cc:Subject:Date:From;
	b=mK55q7E9NKvBo6UKle0HkelUY+deEgDSWSrd6IyPQAfn/OWutNvE5SAJb1lCknucf
	 jQTn1QmktIq6am+kK2Xb3fXLKi5DsZ4/WEONVVRGS/wOEUeAcclW2FjZcV/0o4Mtwu
	 y2aDrOiM40x3uEx/VpSaCOjsi+J99ru5mH/6M48fbRR/yw/S3/F1yB5KmNMNRpsRBE
	 tQEYaHFM0jnJSfRECorDKn8PLXcFHGGih82a3j5Vd1/QDujw4xv4qpQeZjwTYJcIpc
	 AI2ySZa2+7CwianIgBmuH5M0cHGBGVnXi1yapwetLxqZeWdy0rqZbtZlMiMO7DkJqO
	 m+8STxMd2s4EA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars Persson <lars.persson@axis.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert axis,artpec6-clkctrl to DT schema
Date: Tue, 20 May 2025 19:46:46 -0500
Message-ID: <20250521004647.1792464-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Axis ARTPEC-6 clock controller to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/clock/artpec6.txt     | 41 --------------
 .../bindings/clock/axis,artpec6-clkctrl.yaml  | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec6-clkctrl.yaml

diff --git a/Documentation/devicetree/bindings/clock/artpec6.txt b/Documentation/devicetree/bindings/clock/artpec6.txt
deleted file mode 100644
index dff9cdf0009c..000000000000
--- a/Documentation/devicetree/bindings/clock/artpec6.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Clock bindings for Axis ARTPEC-6 chip
-
-The bindings are based on the clock provider binding in
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-External clocks:
-----------------
-
-There are two external inputs to the main clock controller which should be
-provided using the common clock bindings.
-- "sys_refclk": External 50 Mhz oscillator (required)
-- "i2s_refclk": Alternate audio reference clock (optional).
-
-Main clock controller
----------------------
-
-Required properties:
-- #clock-cells: Should be <1>
-  See dt-bindings/clock/axis,artpec6-clkctrl.h for the list of valid identifiers.
-- compatible: Should be "axis,artpec6-clkctrl"
-- reg: Must contain the base address and length of the system controller
-- clocks:  Must contain a phandle entry for each clock in clock-names
-- clock-names: Must include the external oscillator ("sys_refclk"). Optional
-  ones are the audio reference clock ("i2s_refclk") and the audio fractional
-  dividers ("frac_clk0" and "frac_clk1").
-
-Examples:
-
-ext_clk: ext_clk {
-	#clock-cells = <0>;
-	compatible = "fixed-clock";
-	clock-frequency = <50000000>;
-};
-
-clkctrl: clkctrl@f8000000 {
-	#clock-cells = <1>;
-	compatible = "axis,artpec6-clkctrl";
-	reg = <0xf8000000 0x48>;
-	clocks = <&ext_clk>;
-	clock-names = "sys_refclk";
-};
diff --git a/Documentation/devicetree/bindings/clock/axis,artpec6-clkctrl.yaml b/Documentation/devicetree/bindings/clock/axis,artpec6-clkctrl.yaml
new file mode 100644
index 000000000000..a78269369df8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/axis,artpec6-clkctrl.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/axis,artpec6-clkctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axis ARTPEC-6 clock controller
+
+maintainers:
+  - Lars Persson <lars.persson@axis.com>
+
+properties:
+  compatible:
+    const: axis,artpec6-clkctrl
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: external 50 MHz oscillator.
+      - description: optional audio reference clock.
+      - description: fractional audio clock divider 0.
+      - description: fractional audio clock divider 1.
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sys_refclk
+      - const: i2s_refclk
+      - const: frac_clk0
+      - const: frac_clk1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@f8000000 {
+        compatible = "axis,artpec6-clkctrl";
+        reg = <0xf8000000 0x48>;
+        #clock-cells = <1>;
+        clocks = <&ext_clk>;
+        clock-names = "sys_refclk";
+    };
-- 
2.47.2

