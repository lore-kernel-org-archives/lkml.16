Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF6F2BD59F;
	Wed, 21 May 2025 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861727; cv=none; b=MRK/oRuWONQ5T7yDBL3/cSl9g379MdEr1P0mYVoQtcQ+kJwVPoGtrMjW2aR/5Mt0T6f0D3asU7YVUYddtOb5DNIM6cRBaGSG8Gcx5K1aitROyETFl3HDjcyV0JRCQnP44zQbphujt/QvYv2Pzg7HhnyDGU96A1AP/0nwKe9NXls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861727; c=relaxed/simple;
	bh=xcLos6exQOgpj2JwKIyRbvBSr4JVBTN74lH6y2VSTJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SO9JHV4fuNduOyUfO3rgNJbdWGh0n2zky5Tb4y1nKusmXdn29ddWiAqRKwUZkohb2+p0pBK3gof4606rJSWr+cz90L87Bhsy/ajyQya77AadZIIuMLy6fPuSZ8ofdOt5gRYoUCKimtAQfAzPItk+ScN7NmaxtWTRrVcdCmC1ahU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzqJ0NzJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzqJ0NzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C239C4CEE4;
	Wed, 21 May 2025 21:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747861727;
	bh=xcLos6exQOgpj2JwKIyRbvBSr4JVBTN74lH6y2VSTJ0=;
	h=From:To:Cc:Subject:Date:From;
	b=GzqJ0NzJobkvj27Q2VTkKzX/wGBnA0F/7OunK93AKt53OcU6wfNceNUnnt49kba5C
	 duxczwzudK8ZXuEx2MBOAbt7vdUUO6Tt4D2ONGOeRwWNpvp8s0WOz57L44upY8jeee
	 xOG5rFdI/wi1OrWqPF7UqqPXWUmgerDJTX9wkVTVl/hjAW2llKutDZKbpzBEV0PEkW
	 904VSzlmfRtVbjNhD4UYbNeQb8J42DLeK+izAKucf/Soim1jvwuQL8vaVsVigZMfnH
	 dK+wzJeugPiXq+LMzNkIFtVqLPEW7K5T+fjuYvQ9UKjOHPtx1NwCBB/+BZQ3gQHGC9
	 lxTvSQh+cqPag==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert marvell,mvebu-core-clock to DT schema
Date: Wed, 21 May 2025 16:08:43 -0500
Message-ID: <20250521210844.62613-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell SoC core clock binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../clock/marvell,mvebu-core-clock.yaml       | 94 +++++++++++++++++++
 .../bindings/clock/mvebu-core-clock.txt       | 87 -----------------
 2 files changed, 94 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,mvebu-core-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/mvebu-core-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/marvell,mvebu-core-clock.yaml b/Documentation/devicetree/bindings/clock/marvell,mvebu-core-clock.yaml
new file mode 100644
index 000000000000..215bcd9080c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,mvebu-core-clock.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/marvell,mvebu-core-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell MVEBU SoC core clock
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+description: >
+  Marvell MVEBU SoCs usually allow to determine core clock frequencies by
+  reading the Sample-At-Reset (SAR) register. The core clock consumer should
+  specify the desired clock by having the clock ID in its "clocks" phandle cell.
+
+  The following is a list of provided IDs and clock names on Armada 370/XP:
+   0 = tclk    (Internal Bus clock)
+   1 = cpuclk  (CPU clock)
+   2 = nbclk   (L2 Cache clock)
+   3 = hclk    (DRAM control clock)
+   4 = dramclk (DDR clock)
+
+  The following is a list of provided IDs and clock names on Armada 375:
+   0 = tclk    (Internal Bus clock)
+   1 = cpuclk  (CPU clock)
+   2 = l2clk   (L2 Cache clock)
+   3 = ddrclk  (DDR clock)
+
+  The following is a list of provided IDs and clock names on Armada 380/385:
+   0 = tclk    (Internal Bus clock)
+   1 = cpuclk  (CPU clock)
+   2 = l2clk   (L2 Cache clock)
+   3 = ddrclk  (DDR clock)
+
+  The following is a list of provided IDs and clock names on Armada 39x:
+   0 = tclk    (Internal Bus clock)
+   1 = cpuclk  (CPU clock)
+   2 = nbclk   (Coherent Fabric clock)
+   3 = hclk    (SDRAM Controller Internal Clock)
+   4 = dclk    (SDRAM Interface Clock)
+   5 = refclk  (Reference Clock)
+
+  The following is a list of provided IDs and clock names on 98dx3236:
+   0 = tclk    (Internal Bus clock)
+   1 = cpuclk  (CPU clock)
+   2 = ddrclk  (DDR clock)
+   3 = mpll    (MPLL Clock)
+
+  The following is a list of provided IDs and clock names on Kirkwood and Dove:
+   0 = tclk   (Internal Bus clock)
+   1 = cpuclk (CPU0 clock)
+   2 = l2clk  (L2 Cache clock derived from CPU0 clock)
+   3 = ddrclk (DDR controller clock derived from CPU0 clock)
+
+  The following is a list of provided IDs and clock names on Orion5x:
+   0 = tclk   (Internal Bus clock)
+   1 = cpuclk (CPU0 clock)
+   2 = ddrclk (DDR controller clock derived from CPU0 clock)
+
+properties:
+  compatible:
+    enum:
+      - marvell,armada-370-core-clock
+      - marvell,armada-375-core-clock
+      - marvell,armada-380-core-clock
+      - marvell,armada-390-core-clock
+      - marvell,armada-xp-core-clock
+      - marvell,dove-core-clock
+      - marvell,kirkwood-core-clock
+      - marvell,mv88f5181-core-clock
+      - marvell,mv88f5182-core-clock
+      - marvell,mv88f5281-core-clock
+      - marvell,mv88f6180-core-clock
+      - marvell,mv88f6183-core-clock
+      - marvell,mv98dx1135-core-clock
+      - marvell,mv98dx3236-core-clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clock-output-names:
+    description: Overwrite default clock output names.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt
deleted file mode 100644
index d8f5c490f893..000000000000
--- a/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt
+++ /dev/null
@@ -1,87 +0,0 @@
-* Core Clock bindings for Marvell MVEBU SoCs
-
-Marvell MVEBU SoCs usually allow to determine core clock frequencies by
-reading the Sample-At-Reset (SAR) register. The core clock consumer should
-specify the desired clock by having the clock ID in its "clocks" phandle cell.
-
-The following is a list of provided IDs and clock names on Armada 370/XP:
- 0 = tclk    (Internal Bus clock)
- 1 = cpuclk  (CPU clock)
- 2 = nbclk   (L2 Cache clock)
- 3 = hclk    (DRAM control clock)
- 4 = dramclk (DDR clock)
-
-The following is a list of provided IDs and clock names on Armada 375:
- 0 = tclk    (Internal Bus clock)
- 1 = cpuclk  (CPU clock)
- 2 = l2clk   (L2 Cache clock)
- 3 = ddrclk  (DDR clock)
-
-The following is a list of provided IDs and clock names on Armada 380/385:
- 0 = tclk    (Internal Bus clock)
- 1 = cpuclk  (CPU clock)
- 2 = l2clk   (L2 Cache clock)
- 3 = ddrclk  (DDR clock)
-
-The following is a list of provided IDs and clock names on Armada 39x:
- 0 = tclk    (Internal Bus clock)
- 1 = cpuclk  (CPU clock)
- 2 = nbclk   (Coherent Fabric clock)
- 3 = hclk    (SDRAM Controller Internal Clock)
- 4 = dclk    (SDRAM Interface Clock)
- 5 = refclk  (Reference Clock)
-
-The following is a list of provided IDs and clock names on 98dx3236:
- 0 = tclk    (Internal Bus clock)
- 1 = cpuclk  (CPU clock)
- 2 = ddrclk   (DDR clock)
- 3 = mpll    (MPLL Clock)
-
-The following is a list of provided IDs and clock names on Kirkwood and Dove:
- 0 = tclk   (Internal Bus clock)
- 1 = cpuclk (CPU0 clock)
- 2 = l2clk  (L2 Cache clock derived from CPU0 clock)
- 3 = ddrclk (DDR controller clock derived from CPU0 clock)
-
-The following is a list of provided IDs and clock names on Orion5x:
- 0 = tclk   (Internal Bus clock)
- 1 = cpuclk (CPU0 clock)
- 2 = ddrclk (DDR controller clock derived from CPU0 clock)
-
-Required properties:
-- compatible : shall be one of the following:
-	"marvell,armada-370-core-clock" - For Armada 370 SoC core clocks
-	"marvell,armada-375-core-clock" - For Armada 375 SoC core clocks
-	"marvell,armada-380-core-clock" - For Armada 380/385 SoC core clocks
-	"marvell,armada-390-core-clock" - For Armada 39x SoC core clocks
-	"marvell,armada-xp-core-clock" - For Armada XP SoC core clocks
-	"marvell,mv98dx3236-core-clock" - For 98dx3236 family SoC core clocks
-	"marvell,dove-core-clock" - for Dove SoC core clocks
-	"marvell,kirkwood-core-clock" - for Kirkwood SoC (except mv88f6180)
-	"marvell,mv88f6180-core-clock" - for Kirkwood MV88f6180 SoC
-	"marvell,mv98dx1135-core-clock" - for Kirkwood 98dx1135 SoC
-	"marvell,mv88f5181-core-clock" - for Orion MV88F5181 SoC
-	"marvell,mv88f5182-core-clock" - for Orion MV88F5182 SoC
-	"marvell,mv88f5281-core-clock" - for Orion MV88F5281 SoC
-	"marvell,mv88f6183-core-clock" - for Orion MV88F6183 SoC
-- reg : shall be the register address of the Sample-At-Reset (SAR) register
-- #clock-cells : from common clock binding; shall be set to 1
-
-Optional properties:
-- clock-output-names : from common clock binding; allows overwrite default clock
-	output names ("tclk", "cpuclk", "l2clk", "ddrclk")
-
-Example:
-
-core_clk: core-clocks@d0214 {
-	compatible = "marvell,dove-core-clock";
-	reg = <0xd0214 0x4>;
-	#clock-cells = <1>;
-};
-
-spi0: spi@10600 {
-	compatible = "marvell,orion-spi";
-	/* ... */
-	/* get tclk from core clock provider */
-	clocks = <&core_clk 0>;
-};
-- 
2.47.2

