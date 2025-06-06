Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFC020330;
	Fri,  6 Jun 2025 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215438; cv=none; b=Dy53dWpL1MgQTZ6Cx8/BuQTOkalx3XAKx5gy4PBTYONIx0TR6HNuJrt9UxvZOfSii7VjsRaaKz0+PolGJ38/+u0zu/vKiSyZxQtkayqhh8zA7rMKbt5LsFJZSKZjUsG9r81UZHaPKZPJUdSfb8/ztuZIuv1qQ5rlZrLNYhGyfn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215438; c=relaxed/simple;
	bh=37z7SKqOfqgqoDLNZYBJd8RKrqH73AtwnVrwoq/OZNM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOQfhx9FOBF2zt07ooRDFQjbivPz4WPH70CsI2RJMDXQnS+umZtg4xQ1PZf8P9Ou34xQehFxsMAPq8cbSpj8/B15cPT/G0dIdCgcR6BtOxV7+N5baYQrPalCjw6+yT5hBWfyEaxEe3f1CuVM2Gi772/5p0Cg6gTCabXigCyi8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 9A0E2B4C4432;
	Fri,  6 Jun 2025 15:04:19 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v1 1/3] dt-bindings: memory-controllers: add StarFive JH7110 SoC DMC
Date: Fri,  6 Jun 2025 06:02:36 -0700
Message-ID: <20250606130253.1105273-2-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606130253.1105273-1-e@freeshell.de>
References: <20250606130253.1105273-1-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document bindings for the JH7110 SoC DMC as implemented in downstream
U-Boot driver starfive_ddr.c

Signed-off-by: E Shattow <e@freeshell.de>
---
 .../starfive,jh7110-dmc.yaml                  | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml b/Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml
new file mode 100644
index 000000000000..299c86893db1
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/starfive,jh7110-dmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 DMC
+
+maintainers:
+  - E Shattow <e@freeshell.de>
+
+description:
+  JH7110 DMC as implemented by U-Boot boot loader driver starfive_ddr.c
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jh7110-dmc
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pll1_out
+
+  clock-frequency:
+    enum: [2133, 2800]
+    default: 2133
+
+  resets:
+    minItems: 3
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: axi
+      - const: osc
+      - const: apb
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-frequency
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      memory-controller@15700000 {
+        compatible = "starfive,jh7110-dmc";
+        reg = <0x0 0x15700000 0x0 0x10000>,
+              <0x0 0x13000000 0x0 0x10000>;
+        clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
+        clock-names = "pll1_out";
+        clock-frequency = <2133>;
+        resets = <&syscrg JH7110_SYSRST_DDR_AXI>,
+                 <&syscrg JH7110_SYSRST_DDR_OSC>,
+                 <&syscrg JH7110_SYSRST_DDR_APB>;
+        reset-names = "axi", "osc", "apb";
+      };
+    };
-- 
2.49.0

