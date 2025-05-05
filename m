Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584D82609CD;
	Mon,  5 May 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456468; cv=none; b=oKivls2xKiSgyxZNubL+RRlGQJFnE5erK5EF7VdYG5nOu8n3+7P0pl3f4xn0OZ5tiR3nwoyk1JNsrTfx1T++GsvskZ7uOVsQbGMb7qBF+LCd3S6af+PEgntVJTIAhft7gX0dTBqRmZfez5DC7wdb3ps2jh+Gve/ChIQs6oCqRxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456468; c=relaxed/simple;
	bh=gQrEtZTZVtkw39MnNwUUb2Lcl7M6KvGTPlRLa1TsId4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SooH1h2PX8F/eYBw/u16hqSKEFU0qi9FX9ClOzhOl75idedgGycTQxNEO+0sDRfJwndGW0Sk80YfReEVIXyxuRtNHFUNN13q0aYKfNURQDlFJqOubBjiLj5QW3wOKySd4rySVmmmEw8RXM8OGWguKydymV4y61UJHva0qbcu2nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p8gAoq9M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p8gAoq9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8833FC4CEE4;
	Mon,  5 May 2025 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456467;
	bh=gQrEtZTZVtkw39MnNwUUb2Lcl7M6KvGTPlRLa1TsId4=;
	h=From:To:Cc:Subject:Date:From;
	b=p8gAoq9MG9NPBbuh4RZhppqRhfacurgLpOILv9qWrecmP57Wg1wdBZC0RVg7Ui5Ay
	 NsFSAzPGmF3y/1ZJjPYfjI7BGS3Cacg5zMq/SXrDDCtqajrNjLNnKn84mmPziKrnzt
	 iXcGNndBfmLOH/tp91mnCqyJB/LuqdASetQZJrfFdGx1i5yvifBmZZp+eCECDHh/jy
	 Z+1xtR+Jt8xv+IaVd3YbJVa8xRj2MmRZTuyt3cV9t6SQ1CUYqvyIagP9gX7/dwmx+/
	 CCriiwy+DhRb0ZArm9FyNTbBW+uAE72/NF2AiSWTauIxak73/aQJ8uS5jEyeVgwRoZ
	 zE+YG01hMpYRg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert marvell,orion-bridge-intc to DT schema
Date: Mon,  5 May 2025 09:47:42 -0500
Message-ID: <20250505144743.1290672-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Orion bridge interrupt controller binding to schema
format.

marvell,orion-intc is already covered by mrvl,intc.yaml schema, so it
can be dropped.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../marvell,orion-bridge-intc.yaml            | 53 +++++++++++++++++++
 .../marvell,orion-intc.txt                    | 48 -----------------
 2 files changed, 53 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,orion-bridge-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,orion-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-bridge-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-bridge-intc.yaml
new file mode 100644
index 000000000000..d71ae877f488
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-bridge-intc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+---
+$id: http://devicetree.org/schemas/interrupt-controller/marvell,orion-bridge-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Orion SoC Bridge Interrupt Controller
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    const: marvell,orion-bridge-intc
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupts:
+    description: Bridge interrupt of the main interrupt controller
+
+  marvell,#interrupts:
+    description: Number of interrupts provided by bridge interrupt controller.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 32
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@20110 {
+        compatible = "marvell,orion-bridge-intc";
+        reg = <0x20110 0x8>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupts = <0>;
+        /* Dove bridge provides 5 interrupts */
+        marvell,#interrupts = <5>;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-intc.txt
deleted file mode 100644
index 2c11ac76fac9..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/marvell,orion-intc.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Marvell Orion SoC interrupt controllers
-
-* Main interrupt controller
-
-Required properties:
-- compatible: shall be "marvell,orion-intc"
-- reg: base address(es) of interrupt registers starting with CAUSE register
-- interrupt-controller: identifies the node as an interrupt controller
-- #interrupt-cells: number of cells to encode an interrupt source, shall be 1
-
-The interrupt sources map to the corresponding bits in the interrupt
-registers, i.e.
-- 0 maps to bit 0 of first base address,
-- 1 maps to bit 1 of first base address,
-- 32 maps to bit 0 of second base address, and so on.
-
-Example:
-	intc: interrupt-controller {
-		compatible = "marvell,orion-intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		 /* Dove has 64 first level interrupts */
-		reg = <0x20200 0x10>, <0x20210 0x10>;
-	};
-
-* Bridge interrupt controller
-
-Required properties:
-- compatible: shall be "marvell,orion-bridge-intc"
-- reg: base address of bridge interrupt registers starting with CAUSE register
-- interrupts: bridge interrupt of the main interrupt controller
-- interrupt-controller: identifies the node as an interrupt controller
-- #interrupt-cells: number of cells to encode an interrupt source, shall be 1
-
-Optional properties:
-- marvell,#interrupts: number of interrupts provided by bridge interrupt
-      controller, defaults to 32 if not set
-
-Example:
-	bridge_intc: interrupt-controller {
-		compatible = "marvell,orion-bridge-intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		reg = <0x20110 0x8>;
-		interrupts = <0>;
-		/* Dove bridge provides 5 interrupts */
-		marvell,#interrupts = <5>;
-	};
-- 
2.47.2

