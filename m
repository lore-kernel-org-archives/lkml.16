Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E52C145FE0;
	Wed, 21 May 2025 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861690; cv=none; b=B3cCZPBfq0h0LcoOh6LWv7+yRWlhAUkLV54b3/R7svY+9psZ7jpxZHeU2W4OHm0Vq0PjnkR9v9ji7ij2u5yoNnKfPsifNwT+VUdjfMNaAcdnTyVLVQDInnWhNSe0R33kDc44h9ND3WcbBkg4UiTRIX+iYUA8t9WrcxEgmR6ohp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861690; c=relaxed/simple;
	bh=8CysIDEa8RwLMcwgrKv6Uy1ZkhyBK8+TPj0qP6iI/Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gtOjcJVRrcamS/a+0QjowxPE5Bteo2dm6yaIOkv5IUBwptP+BUXfhtppmjlBG5wxmLjRkzm2kMY5ldAI3nOtumtJnobwZ7NwwoErpdtbtS14Vd2dnLEc0UlaFopE39i1ftnBUCEDqNWOc0nzp0w5NNwMdZfIcQg0gNZuEsfCUIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSnKiixX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSnKiixX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CB1C4CEE4;
	Wed, 21 May 2025 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747861689;
	bh=8CysIDEa8RwLMcwgrKv6Uy1ZkhyBK8+TPj0qP6iI/Fs=;
	h=From:To:Cc:Subject:Date:From;
	b=lSnKiixX1CGsB3OXK0U8PoEmqhTlXqXQ7gJVTRW4NPlSASliMDKNY29BTz2bZoc3T
	 qq5Bv66/87zCZV9OWEADCLEc5E7TjawbyMUQPAYT7nKGMig8GJn0VPAupFfvi0zRBi
	 ucxDkMfSiaXpYorxtZgFlk1ZVc6NkesVE4dOrkVOmmjBA4GyxzMqmULhWf9g1tl9Bo
	 9c4jCOMavjBB9fBqRu8eu1IYAudnezqo/SX5j6CSHnrH4UNN73+Yq5mvEFTuLdk1vn
	 tX4014UnREOBd6q3Pm8ruoTDzS1qm9PgdlJ6sw6I5zsL0wIZf0nY1aX/IfoZt5r6S7
	 kHFikaUKlo0nA==
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
Subject: [PATCH] dt-bindings: clock: Convert marvell,armada-xp-cpu-clock to DT schema
Date: Wed, 21 May 2025 16:08:05 -0500
Message-ID: <20250521210806.61286-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Armada XP CPU clock binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../clock/marvell,armada-xp-cpu-clock.yaml    | 44 +++++++++++++++++++
 .../bindings/clock/mvebu-cpu-clock.txt        | 23 ----------
 2 files changed, 44 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,armada-xp-cpu-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/marvell,armada-xp-cpu-clock.yaml b/Documentation/devicetree/bindings/clock/marvell,armada-xp-cpu-clock.yaml
new file mode 100644
index 000000000000..f2ac6741da9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,armada-xp-cpu-clock.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+---
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+$id: http://devicetree.org/schemas/clock/marvell,armada-xp-cpu-clock.yaml#
+
+title: Marvell EBU CPU Clock
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - marvell,armada-xp-cpu-clock
+      - marvell,mv98dx3236-cpu-clock
+
+  reg:
+    items:
+      - description: Clock complex registers
+      - description: PMU DFS registers
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@d0018700 {
+        #clock-cells = <1>;
+        compatible = "marvell,armada-xp-cpu-clock";
+        reg = <0xd0018700 0xa0>, <0x1c054 0x10>;
+        clocks = <&coreclk 1>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt
deleted file mode 100644
index 7f28506eaee7..000000000000
--- a/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Device Tree Clock bindings for cpu clock of Marvell EBU platforms
-
-Required properties:
-- compatible : shall be one of the following:
-	"marvell,armada-xp-cpu-clock" - cpu clocks for Armada XP
-	"marvell,mv98dx3236-cpu-clock" - cpu clocks for 98DX3236 SoC
-- reg : Address and length of the clock complex register set, followed
-        by address and length of the PMU DFS registers
-- #clock-cells : should be set to 1.
-- clocks : shall be the input parent clock phandle for the clock.
-
-cpuclk: clock-complex@d0018700 {
-	#clock-cells = <1>;
-	compatible = "marvell,armada-xp-cpu-clock";
-	reg = <0xd0018700 0xA0>, <0x1c054 0x10>;
-	clocks = <&coreclk 1>;
-}
-
-cpu@0 {
-	compatible = "marvell,sheeva-v7";
-	reg = <0>;
-	clocks = <&cpuclk 0>;
-};
-- 
2.47.2

