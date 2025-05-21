Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A844D2BCF71;
	Wed, 21 May 2025 21:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861716; cv=none; b=C6SSh3OIEf8tXq+SbqC4k1GO5vg+bzAhdSEocS1HcPEUrTy6MvK1ST7lTCMlSu1tjGuTyapU0JJexHEq5rGUDDevz801oYSfucEf3tLU1BYV9dYs/5U1063Y6hyz2VMFjWInF4/nWcZXJGs9PjOwWNFIZVsigyxi1UIOHCUexyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861716; c=relaxed/simple;
	bh=oF/9g6MJxB1PaDaHhkVJvPPR+gItAHITVye2afdRaq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i/+LdA/0ZF6qt1yzEmI0Tao8maQ7rmOv5ONN3vdv43QZtk18gJh7wEMpFOWyKZgHZN9dhKMxTnJ6VOxVUKz7HCZl8/RmlnVHDLpK4xQqVWeF6HRoPIUgGN0OLVBEKsvIgdwXZcviW1I7FpkirqdYbjOe7NN6kq6dfOv5diEprfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaCIaRbX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaCIaRbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA476C4CEE4;
	Wed, 21 May 2025 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747861716;
	bh=oF/9g6MJxB1PaDaHhkVJvPPR+gItAHITVye2afdRaq4=;
	h=From:To:Cc:Subject:Date:From;
	b=TaCIaRbXqFFgyltLbaGAHmu/kJwGHuz6VlgB5iDJiLBX0VCpkwNt1v1B0e7RrFzc9
	 2X0caGARKHa8u+QarfOVu8c7NsXqlyTz/XlhVyLcWdKbmv4K7ye6MTl91gyNhv1Ymo
	 jPDTc+1Z2tuBE37tr/2yInvoRCRYzaugOWdWk9qlGnqI9+0IqLL5eXiRZrMNSHQ+Rl
	 w4737hiarAcoBBeEoz4VcGC3L0SrHhSFreoZYTuH66kaN7dZYkIgScpf1Wf7ET5S/Q
	 C+4T0LiNFjeeGrgx8CHCwnajc5o8lCpLcTnwQUZYXrccNK4sAuX64zgwNxT8YCcr+n
	 +MQSHPWBvRbbw==
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
Subject: [PATCH] dt-bindings: clock: Convert marvell,dove-divider-clock to DT schema
Date: Wed, 21 May 2025 16:08:31 -0500
Message-ID: <20250521210832.62177-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Dove PLL divider clock binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/dove-divider-clock.txt     | 28 -----------
 .../clock/marvell,dove-divider-clock.yaml     | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/dove-divider-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,dove-divider-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/dove-divider-clock.txt b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
deleted file mode 100644
index 217871f483c0..000000000000
--- a/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-PLL divider based Dove clocks
-
-Marvell Dove has a 2GHz PLL, which feeds into a set of dividers to provide
-high speed clocks for a number of peripherals.  These dividers are part of
-the PMU, and thus this node should be a child of the PMU node.
-
-The following clocks are provided:
-
-ID	Clock
--------------
-0	AXI bus clock
-1	GPU clock
-2	VMeta clock
-3	LCD clock
-
-Required properties:
-- compatible : shall be "marvell,dove-divider-clock"
-- reg : shall be the register address of the Core PLL and Clock Divider
-   Control 0 register.  This will cover that register, as well as the
-   Core PLL and Clock Divider Control 1 register.  Thus, it will have
-   a size of 8.
-- #clock-cells : from common clock binding; shall be set to 1
-
-divider_clk: core-clock@64 {
-	compatible = "marvell,dove-divider-clock";
-	reg = <0x0064 0x8>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/marvell,dove-divider-clock.yaml b/Documentation/devicetree/bindings/clock/marvell,dove-divider-clock.yaml
new file mode 100644
index 000000000000..7a8e0e281b63
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,dove-divider-clock.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/marvell,dove-divider-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Dove PLL Divider Clock
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+description: >
+  Marvell Dove has a 2GHz PLL, which feeds into a set of dividers to provide
+  high speed clocks for a number of peripherals.  These dividers are part of the
+  PMU, and thus this node should be a child of the PMU node.
+
+  The following clocks are provided:
+
+    ID	Clock
+    -------------
+    0	AXI bus clock
+    1	GPU clock
+    2	VMeta clock
+    3	LCD clock
+
+properties:
+  compatible:
+    const: marvell,dove-divider-clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
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
+    clock-controller@64 {
+        compatible = "marvell,dove-divider-clock";
+        reg = <0x0064 0x8>;
+        #clock-cells = <1>;
+    };
-- 
2.47.2

