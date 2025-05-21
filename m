Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18DD2BD595;
	Wed, 21 May 2025 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861721; cv=none; b=GQ4wo1UPpFYJSnaqeT6EWW1XzcZe7izOzhJm45lzg+tgtsC6791H3HrYpCfXXczDK67ZGcbTthfsMLqpDoqXeClVO5QmS/0VOAqlGuO1/aV5QRgUEpNhe06ATvqMRP4M0QrR0gLrkKGG4Be852WhdQtvXSkmpe8WiAonbr5u9DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861721; c=relaxed/simple;
	bh=gPV3r95Xri8dv8TjsCL5wRn46mB5JgnbKWVL9gFrrFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nc4q2dGOC+2YzpG0HnMbnsxptsakEhEmDrxWHyGyTdN3cMaGwdxbQ5v7LmhHJaCW8JRqsty7JSqFWNvOSUN8iyxLzklU2uAKPBKrfCuIykXliIW+PtO1xnziF5gHNQwBkFK8Iaud8N+0a8QKRuRD1pwSDcNdhaL7yWmhp9CwkSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qgdIR02F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qgdIR02F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5E8C4CEE4;
	Wed, 21 May 2025 21:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747861721;
	bh=gPV3r95Xri8dv8TjsCL5wRn46mB5JgnbKWVL9gFrrFI=;
	h=From:To:Cc:Subject:Date:From;
	b=qgdIR02FMEXkqgymZlmsjpee2JwzVQj/RfJsyutK0aHo+ISHWrIGlXbQcZ1q2afhW
	 z9ohCeJBL+bz36h8vuJviOLfqF7BV1q1diGA0tCLHYdKIVGiCwqr/DsLqVws4TJrC+
	 qsEajIuykTIAtcLg0NvgcAl0iQQB7GdxPom4trzmvKwJdMD1u5D6AZDjEtgJjLlFzw
	 dVla0a5WiaOND35eq60ZZAZGi/oaAwnbv3b1nLxL+dvjz1QiS8h+mZ/DMBotaqqfsR
	 4/63E1dk/M40ki8FD5gLx2ps25TleU7NrAbshme346fTfOpkL4GIEiwxzcSniimnrM
	 lxaIRJW42zUCg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert marvell,berlin2-clk to DT schema
Date: Wed, 21 May 2025 16:08:37 -0500
Message-ID: <20250521210839.62409-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Berlin2 clock binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/marvell,berlin.txt         | 31 -----------
 .../bindings/clock/marvell,berlin2-clk.yaml   | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/marvell,berlin.txt
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,berlin2-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/marvell,berlin.txt b/Documentation/devicetree/bindings/clock/marvell,berlin.txt
deleted file mode 100644
index c611c495f3ff..000000000000
--- a/Documentation/devicetree/bindings/clock/marvell,berlin.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Device Tree Clock bindings for Marvell Berlin
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Clock related registers are spread among the chip control registers. Berlin
-clock node should be a sub-node of the chip controller node. Marvell Berlin2
-(BG2, BG2CD, BG2Q) SoCs share the same IP for PLLs and clocks, with some
-minor differences in features and register layout.
-
-Required properties:
-- compatible: must be "marvell,berlin2-clk" or "marvell,berlin2q-clk"
-- #clock-cells: must be 1
-- clocks: must be the input parent clock phandle
-- clock-names: name of the input parent clock
-	Allowed clock-names for the reference clocks are
-	"refclk" for the SoCs oscillator input on all SoCs,
-	and SoC-specific input clocks for
-	BG2/BG2CD: "video_ext0" for the external video clock input
-
-
-Example:
-
-chip_clk: clock {
-	compatible = "marvell,berlin2q-clk";
-
-	#clock-cells = <1>;
-	clocks = <&refclk>;
-	clock-names = "refclk";
-};
diff --git a/Documentation/devicetree/bindings/clock/marvell,berlin2-clk.yaml b/Documentation/devicetree/bindings/clock/marvell,berlin2-clk.yaml
new file mode 100644
index 000000000000..8d48a2c7e381
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,berlin2-clk.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/marvell,berlin2-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Berlin Clock Controller
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+description:
+  Clock related registers are spread among the chip control registers. Berlin
+  clock node should be a sub-node of the chip controller node. Marvell Berlin2
+  (BG2, BG2CD, BG2Q) SoCs share the same IP for PLLs and clocks, with some minor
+  differences in features and register layout.
+
+properties:
+  compatible:
+    enum:
+      - marvell,berlin2-clk
+      - marvell,berlin2q-clk
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - enum:
+          - refclk
+          - video_ext0
+
+required:
+  - compatible
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        compatible = "marvell,berlin2q-clk";
+        #clock-cells = <1>;
+        clocks = <&refclk>;
+        clock-names = "refclk";
+    };
-- 
2.47.2

