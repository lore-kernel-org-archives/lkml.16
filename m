Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281762E9749;
	Mon, 30 Jun 2025 23:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751326015; cv=none; b=ESnDKlpuPQeLAKof4kBEM9dRDejVgeD/KXGr60YXlpMYgtAlqm3TZtnKo2bdDi9MzUHbhTzREMBbWyActvtR5gUd59ucICK2NWswEvWW/uWsLXLzlqU3a7l7l+nTz3u/oI23a2ADc6Z5TOhu6CaM3h09lL7eAV+2M7lH8OOnBuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751326015; c=relaxed/simple;
	bh=WR89lVovHqF0TgIThGYwD0D56m3jLDdx1wIgwZQ9cKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TfmboaqtPcwVxax36BO38E7OuokFIzJOx1yOxs+jzLNqrjhQ8r7ymmWdlfuPel1UJTad+fo5iBsyszp7lAe4tUmsT2OCHTumSkJwr/4VLYUY/sC0W7ZnQ7Rw2FdDX1eEgYQOQwHVFALHwMt9WJbrjLCt8ERYQBpOz/jF+MPvkSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8qtIgUF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8qtIgUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04D5C4CEE3;
	Mon, 30 Jun 2025 23:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751326014;
	bh=WR89lVovHqF0TgIThGYwD0D56m3jLDdx1wIgwZQ9cKw=;
	h=From:To:Cc:Subject:Date:From;
	b=h8qtIgUFWfZYePkmCwXS/Q5SBcFxgb4eWxecewshLjgRio7ZPdDcV7MbPz+LzI1+d
	 riu/rQpAkdqa2zT4I5eRVzRgxFvjU1ab7fIOHs3F158pro4zx5Hv644d+3p1AKpfol
	 Wgchv11YuBZSie9eAnlcG1c5bkZdbEqbhD5D1s4wAeWwHiwix+4mQWFQzNpiDNC+ll
	 Engo1o1l9xeOtElYTPC6ebkocG5QEYmC85tzo9DXD5j7dZW/MWcwwVSAES5u8zIbv0
	 RbbGQMKdVObnb7jQaCCq/haHrTbfIIWLkZ1SfbO1Pcyw1sWpYbi3SFJvqWz354/KWN
	 cuCIxRI223Kqg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chandra Mandal <purna.mandal@microchip.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert microchip,pic32mzda-clk to DT schema
Date: Mon, 30 Jun 2025 18:26:51 -0500
Message-ID: <20250630232652.3701007-1-robh@kernel.org>
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
 .../bindings/clock/microchip,pic32.txt        | 39 ----------------
 .../clock/microchip,pic32mzda-clk.yaml        | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/microchip,pic32.txt
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,pic32mzda-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/microchip,pic32.txt b/Documentation/devicetree/bindings/clock/microchip,pic32.txt
deleted file mode 100644
index c93d88fdd858..000000000000
--- a/Documentation/devicetree/bindings/clock/microchip,pic32.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Microchip PIC32 Clock Controller Binding
-----------------------------------------
-Microchip clock controller is consists of few oscillators, PLL, multiplexer
-and few divider modules.
-
-This binding uses common clock bindings.
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible: shall be "microchip,pic32mzda-clk".
-- reg: shall contain base address and length of clock registers.
-- #clock-cells: shall be 1.
-
-Optional properties:
-- microchip,pic32mzda-sosc: shall be added only if platform has
-  secondary oscillator connected.
-
-Example:
-	rootclk: clock-controller@1f801200 {
-		compatible = "microchip,pic32mzda-clk";
-		reg = <0x1f801200 0x200>;
-		#clock-cells = <1>;
-		/* optional */
-		microchip,pic32mzda-sosc;
-	};
-
-
-The clock consumer shall specify the desired clock-output of the clock
-controller (as defined in [2]) by specifying output-id in its "clock"
-phandle cell.
-[2] include/dt-bindings/clock/microchip,pic32-clock.h
-
-For example for UART2:
-uart2: serial@2 {
-	compatible = "microchip,pic32mzda-uart";
-	reg = <>;
-	interrupts = <>;
-	clocks = <&rootclk PB2CLK>;
-};
diff --git a/Documentation/devicetree/bindings/clock/microchip,pic32mzda-clk.yaml b/Documentation/devicetree/bindings/clock/microchip,pic32mzda-clk.yaml
new file mode 100644
index 000000000000..a14a838140f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/microchip,pic32mzda-clk.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/microchip,pic32mzda-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32MZDA Clock Controller
+
+maintainers:
+  - Purna Chandra Mandal <purna.mandal@microchip.com>
+
+description:
+  Microchip clock controller consists of a few oscillators, PLL, multiplexer
+  and divider modules.
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-clk
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  microchip,pic32mzda-sosc:
+    description: Presence of secondary oscillator.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1f801200 {
+        compatible = "microchip,pic32mzda-clk";
+        reg = <0x1f801200 0x200>;
+        #clock-cells = <1>;
+        /* optional */
+        microchip,pic32mzda-sosc;
+    };
-- 
2.47.2

