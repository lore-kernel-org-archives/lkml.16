Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B652E9EB2;
	Mon, 30 Jun 2025 23:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751326000; cv=none; b=FTqw6hQn+zlc+Pc0EkA/7pl4nn9Dfyhl8OFqNlCTGlpg4XSjnKyLPsDCx+tqBdigeWVlliu4TBeliup7sCrreB/0c2iTiovu8Q5OLjbncNJn8fs/eZb02uqO3kUynnANhHKYqRBeVQSvjKOJDCLdUEjL/I7vtjDsFSNYRxFaz8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751326000; c=relaxed/simple;
	bh=dPy4FTclmyey5C/UXVRXo0shEX5PkEkUjxtYrWNFLjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RxBQlKU0O9ioepPjHwGns9G9LJjrc09S5+upkJSpLvnkFObmKNXqPPhG8NnO5bwkqYK9BajrlgEkqQaRyBWPDSTh3l0mJtKgya3TWAeo5v3dNaphKOdhy/jZ/69Q6xoGrYKA/aZt52SHnVQ/u+kk7Xa00PUd8+VB6McCVPgNZuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpo71Zc1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpo71Zc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CC1C4CEE3;
	Mon, 30 Jun 2025 23:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751326000;
	bh=dPy4FTclmyey5C/UXVRXo0shEX5PkEkUjxtYrWNFLjw=;
	h=From:To:Cc:Subject:Date:From;
	b=qpo71Zc1siywcNs3uogPdQV4RdCgsFoXML9VNJ4izMd1MfHVuRcLQ9XDBsKs1kWPQ
	 vnn8Kvff/1zXfdJ5OjyNFXaJx0X1EYlLDTkgpiUgE1oAkIPBix40FRNEt9V+YTtToq
	 YzWxCvaygkNsT9UhH6MgKY/wdqQOoiQtVvcM7tcX4YDrFovUsUfJeEjeEPgyIi248T
	 pffu8+5pxK+LAz2ih12uDrP6JEdxzv5LGmAUj7wfPwIf+u2s2YFPWh+ycH5pCRkDKY
	 f97vkulYJAIS/C0dCeIt7MiHHt3XYPlCyvSqOLCDnKkx+VMXCmt9om3nFG35GtIxjz
	 OwecLDMnH8LEg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert nuvoton,npcm750-clk to DT schema
Date: Mon, 30 Jun 2025 18:26:36 -0500
Message-ID: <20250630232637.3700584-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/nuvoton,npcm750-clk.txt    | 100 ------------------
 .../bindings/clock/nuvoton,npcm750-clk.yaml   |  66 ++++++++++++
 2 files changed, 66 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
deleted file mode 100644
index f82064546d11..000000000000
--- a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
+++ /dev/null
@@ -1,100 +0,0 @@
-* Nuvoton NPCM7XX Clock Controller
-
-Nuvoton Poleg BMC NPCM7XX contains an integrated clock controller, which
-generates and supplies clocks to all modules within the BMC.
-
-External clocks:
-
-There are six fixed clocks that are generated outside the BMC. All clocks are of
-a known fixed value that cannot be changed. clk_refclk, clk_mcbypck and
-clk_sysbypck are inputs to the clock controller.
-clk_rg1refck, clk_rg2refck and clk_xin are external clocks suppling the
-network. They are set on the device tree, but not used by the clock module. The
-network devices use them directly.
-Example can be found below.
-
-All available clocks are defined as preprocessor macros in:
-dt-bindings/clock/nuvoton,npcm7xx-clock.h
-and can be reused as DT sources.
-
-Required Properties of clock controller:
-
-	- compatible: "nuvoton,npcm750-clk" : for clock controller of Nuvoton
-		  Poleg BMC NPCM750
-
-	- reg: physical base address of the clock controller and length of
-		memory mapped region.
-
-	- #clock-cells: should be 1.
-
-Example: Clock controller node:
-
-	clk: clock-controller@f0801000 {
-		compatible = "nuvoton,npcm750-clk";
-		#clock-cells = <1>;
-		reg = <0xf0801000 0x1000>;
-		clock-names = "refclk", "sysbypck", "mcbypck";
-		clocks = <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
-	};
-
-Example: Required external clocks for network:
-
-	/* external reference clock */
-	clk_refclk: clk-refclk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <25000000>;
-		clock-output-names = "refclk";
-	};
-
-	/* external reference clock for cpu. float in normal operation */
-	clk_sysbypck: clk-sysbypck {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <800000000>;
-		clock-output-names = "sysbypck";
-	};
-
-	/* external reference clock for MC. float in normal operation */
-	clk_mcbypck: clk-mcbypck {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <800000000>;
-		clock-output-names = "mcbypck";
-	};
-
-	 /* external clock signal rg1refck, supplied by the phy */
-	clk_rg1refck: clk-rg1refck {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <125000000>;
-		clock-output-names = "clk_rg1refck";
-	};
-
-	 /* external clock signal rg2refck, supplied by the phy */
-	clk_rg2refck: clk-rg2refck {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <125000000>;
-		clock-output-names = "clk_rg2refck";
-	};
-
-	clk_xin: clk-xin {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <50000000>;
-		clock-output-names = "clk_xin";
-	};
-
-
-Example: GMAC controller node that consumes two clocks: a generated clk by the
-clock controller and a fixed clock from DT (clk_rg1refck).
-
-	ethernet0: ethernet@f0802000 {
-		compatible = "snps,dwmac";
-		reg = <0xf0802000 0x2000>;
-		interrupts = <0 14 4>;
-		interrupt-names = "macirq";
-		clocks	= <&clk_rg1refck>, <&clk NPCM7XX_CLK_AHB>;
-		clock-names = "stmmaceth", "clk_gmac";
-	};
diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
new file mode 100644
index 000000000000..694dac68619c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nuvoton,npcm750-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM7XX Clock Controller
+
+maintainers:
+  - Tali Perry <tali.perry1@gmail.com>
+
+description: >
+  Nuvoton Poleg BMC NPCM7XX contains an integrated clock controller, which
+  generates and supplies clocks to all modules within the BMC.
+
+  External clocks:
+
+  There are six fixed clocks that are generated outside the BMC. All clocks are of
+  a known fixed value that cannot be changed. clk_refclk, clk_mcbypck and
+  clk_sysbypck are inputs to the clock controller.
+  clk_rg1refck, clk_rg2refck and clk_xin are external clocks suppling the
+  network. They are set on the device tree, but not used by the clock module. The
+  network devices use them directly.
+
+  All available clocks are defined as preprocessor macros in:
+  dt-bindings/clock/nuvoton,npcm7xx-clock.h
+  and can be reused as DT sources.
+
+properties:
+  compatible:
+    const: nuvoton,npcm750-clk
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clock-names:
+    items:
+      - const: refclk
+      - const: sysbypck
+      - const: mcbypck
+
+  clocks:
+    items:
+      - description: refclk
+      - description: sysbypck
+      - description: mcbypck
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@f0801000 {
+        compatible = "nuvoton,npcm750-clk";
+        #clock-cells = <1>;
+        reg = <0xf0801000 0x1000>;
+        clock-names = "refclk", "sysbypck", "mcbypck";
+        clocks = <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
+    };
-- 
2.47.2

