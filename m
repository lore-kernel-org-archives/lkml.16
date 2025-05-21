Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F8847B;
	Wed, 21 May 2025 00:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788419; cv=none; b=oSZW+OBB6F4CMdVS3V96dD8ArMkEOjJrKYht0799rjkMS024dlyU03ftxwwZBY1XgH1fQLMSSI1PfjtykF/3req6K5uuChmWk7I7oUgS/NlWYMZ3QoRjuEG/NSpN/rMryUWB3msjrsunPqMIcADGrr2xQnJZVguIzcwULLWNuX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788419; c=relaxed/simple;
	bh=ZGkeggx+ugOwP4YW2xK6vB80PuCAbo+qPxHZFAmkGnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=afU7NA6vy9GKj885x46UND5UkQAvRUpd8X9Vl86tWpbYpNW8GsxFIgNQy0IG0RkRnqf+y1E7Wzf9GPJPSXdw4I4PufbZ6nZIMwIp2oHRy8/jOAuHT9JjEfGv5OIkIPK21Ev7QP6i1578ngNi863pkbZ8VZRP7vsHsfnnIGBJMks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9p3iWz0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9p3iWz0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC634C4CEE9;
	Wed, 21 May 2025 00:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747788419;
	bh=ZGkeggx+ugOwP4YW2xK6vB80PuCAbo+qPxHZFAmkGnQ=;
	h=From:To:Cc:Subject:Date:From;
	b=O9p3iWz02QphmyFcM704dN+M8vWrcOyRR1Ws5J5LgK9z3H4qVxe/SD3dBjfFNBdov
	 inyNv9WoBEZCC9q0zUZ72nLGIR45HwJs2IfySQByoe4HgyOkIkjRwu3qjFzLyGhVda
	 zwEn+M3whTTjObQx5Qh6IhDuoeC/oss81rJOSjJ6KCbPVK14MqLbLeg3iEYhvKaUIW
	 a/Bu/1LJB4ppA4FYKgXFsyt5x6H3U+kstMziUF/8kWIucN1g4dZBcpLbscZXhckxLW
	 wUQLWW7A5Cf91ARuNjbAbcu+QWATpvKlouTajBG0IVNeHAake+6NDSm3UwAoz56AL8
	 WFaXZJ942wFWw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert APM XGene clocks to DT schema
Date: Tue, 20 May 2025 19:46:54 -0500
Message-ID: <20250521004655.1792703-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the APM XGene clocks to DT schema. The device clock binding is
a bit different from the others, so put it in its own schema file.
Drop the examples.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../clock/apm,xgene-device-clock.yaml         |  80 +++++++++++
 .../clock/apm,xgene-socpll-clock.yaml         |  50 +++++++
 .../devicetree/bindings/clock/xgene.txt       | 131 ------------------
 3 files changed, 130 insertions(+), 131 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/apm,xgene-device-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/apm,xgene-socpll-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/xgene.txt

diff --git a/Documentation/devicetree/bindings/clock/apm,xgene-device-clock.yaml b/Documentation/devicetree/bindings/clock/apm,xgene-device-clock.yaml
new file mode 100644
index 000000000000..b27bcb2a9ee0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/apm,xgene-device-clock.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/apm,xgene-device-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: APM X-Gene SoC device clocks
+
+maintainers:
+  - Khuong Dinh <khuong@os.amperecomputing.com>
+
+properties:
+  compatible:
+    const: apm,xgene-device-clock
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    items:
+      - enum: [ csr-reg, div-reg ]
+      - const: div-reg
+    minItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
+  csr-offset:
+    description: Offset to the CSR reset register
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+  csr-mask:
+    description: CSR reset mask bit
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0xf
+
+  enable-offset:
+    description: Offset to the enable register
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 8
+
+  enable-mask:
+    description: CSR enable mask bit
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0xf
+
+  divider-offset:
+    description: Offset to the divider register
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+  divider-width:
+    description: Width of the divider register
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+  divider-shift:
+    description: Bit shift of the divider register
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - clock-output-names
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/clock/apm,xgene-socpll-clock.yaml b/Documentation/devicetree/bindings/clock/apm,xgene-socpll-clock.yaml
new file mode 100644
index 000000000000..bdd4a6b92bbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/apm,xgene-socpll-clock.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/apm,xgene-socpll-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: APM X-Gene SoC PLL, PCPPLL, and PMD clocks
+
+maintainers:
+  - Khuong Dinh <khuong@os.amperecomputing.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apm,xgene-pcppll-clock
+          - apm,xgene-pcppll-v2-clock
+          - apm,xgene-pmd-clock
+          - apm,xgene-socpll-clock
+          - apm,xgene-socpll-v2-clock
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - enum: [ csr-reg, div-reg ]
+      - const: div-reg
+    minItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    enum: [ pcppll, socpll ]
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - clock-output-names
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/clock/xgene.txt b/Documentation/devicetree/bindings/clock/xgene.txt
deleted file mode 100644
index 8233e771711b..000000000000
--- a/Documentation/devicetree/bindings/clock/xgene.txt
+++ /dev/null
@@ -1,131 +0,0 @@
-Device Tree Clock bindings for APM X-Gene
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be one of the following:
-	"apm,xgene-socpll-clock" - for a X-Gene SoC PLL clock
-	"apm,xgene-pcppll-clock" - for a X-Gene PCP PLL clock
-	"apm,xgene-pmd-clock" - for a X-Gene PMD clock
-	"apm,xgene-device-clock" - for a X-Gene device clock
-	"apm,xgene-socpll-v2-clock" - for a X-Gene SoC PLL v2 clock
-	"apm,xgene-pcppll-v2-clock" - for a X-Gene PCP PLL v2 clock
-
-Required properties for SoC or PCP PLL clocks:
-- reg : shall be the physical PLL register address for the pll clock.
-- clocks : shall be the input parent clock phandle for the clock. This should
-	be the reference clock.
-- #clock-cells : shall be set to 1.
-- clock-output-names : shall be the name of the PLL referenced by derive
-  clock.
-Optional properties for PLL clocks:
-- clock-names : shall be the name of the PLL. If missing, use the device name.
-
-Required properties for PMD clocks:
-- reg : shall be the physical register address for the pmd clock.
-- clocks : shall be the input parent clock phandle for the clock.
-- #clock-cells : shall be set to 1.
-- clock-output-names : shall be the name of the clock referenced by derive
-  clock.
-Optional properties for PLL clocks:
-- clock-names : shall be the name of the clock. If missing, use the device name.
-
-Required properties for device clocks:
-- reg : shall be a list of address and length pairs describing the CSR
-         reset and/or the divider. Either may be omitted, but at least
-         one must be present.
- - reg-names : shall be a string list describing the reg resource. This
-               may include "csr-reg" and/or "div-reg". If this property
-               is not present, the reg property is assumed to describe
-               only "csr-reg".
-- clocks : shall be the input parent clock phandle for the clock.
-- #clock-cells : shall be set to 1.
-- clock-output-names : shall be the name of the device referenced.
-Optional properties for device clocks:
-- clock-names : shall be the name of the device clock. If missing, use the
-                device name.
-- csr-offset : Offset to the CSR reset register from the reset address base.
-               Default is 0.
-- csr-mask : CSR reset mask bit. Default is 0xF.
-- enable-offset : Offset to the enable register from the reset address base.
-                  Default is 0x8.
-- enable-mask : CSR enable mask bit. Default is 0xF.
-- divider-offset : Offset to the divider CSR register from the divider base.
-                   Default is 0x0.
-- divider-width : Width of the divider register. Default is 0.
-- divider-shift : Bit shift of the divider register. Default is 0.
-
-For example:
-
-	pcppll: pcppll@17000100 {
-		compatible = "apm,xgene-pcppll-clock";
-		#clock-cells = <1>;
-		clocks = <&refclk 0>;
-		clock-names = "pcppll";
-		reg = <0x0 0x17000100 0x0 0x1000>;
-		clock-output-names = "pcppll";
-		type = <0>;
-	};
-
-	pmd0clk: pmd0clk@7e200200 {
-		compatible = "apm,xgene-pmd-clock";
-		#clock-cells = <1>;
-		clocks = <&pmdpll 0>;
-		reg = <0x0 0x7e200200 0x0 0x10>;
-		clock-output-names = "pmd0clk";
-	};
-
-	socpll: socpll@17000120 {
-		compatible = "apm,xgene-socpll-clock";
-		#clock-cells = <1>;
-		clocks = <&refclk 0>;
-		clock-names = "socpll";
-		reg = <0x0 0x17000120 0x0 0x1000>;
-		clock-output-names = "socpll";
-		type = <1>;
-	};
-
-	qmlclk: qmlclk {
-		compatible = "apm,xgene-device-clock";
-		#clock-cells = <1>;
-		clocks = <&socplldiv2 0>;
-		clock-names = "qmlclk";
-		reg = <0x0 0x1703C000 0x0 0x1000>;
-		reg-name = "csr-reg";
-		clock-output-names = "qmlclk";
-	};
-
-	ethclk: ethclk {
-		compatible = "apm,xgene-device-clock";
-		#clock-cells = <1>;
-		clocks = <&socplldiv2 0>;
-		clock-names = "ethclk";
-		reg = <0x0 0x17000000 0x0 0x1000>;
-		reg-names = "div-reg";
-		divider-offset = <0x238>;
-		divider-width = <0x9>;
-		divider-shift = <0x0>;
-		clock-output-names = "ethclk";
-	};
-
-	apbclk: apbclk {
-		compatible = "apm,xgene-device-clock";
-		#clock-cells = <1>;
-		clocks = <&ahbclk 0>;
-		clock-names = "apbclk";
-		reg = <0x0 0x1F2AC000 0x0 0x1000
-			0x0 0x1F2AC000 0x0 0x1000>;
-		reg-names = "csr-reg", "div-reg";
-		csr-offset = <0x0>;
-		csr-mask = <0x200>;
-		enable-offset = <0x8>;
-		enable-mask = <0x200>;
-		divider-offset = <0x10>;
-		divider-width = <0x2>;
-		divider-shift = <0x0>;
-		flags = <0x8>;
-		clock-output-names = "apbclk";
-	};
-
-- 
2.47.2

