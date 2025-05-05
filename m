Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D1526A0EB;
	Mon,  5 May 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456441; cv=none; b=NvmeW0deULNSaqg0tLafJGep03LI9u5K8tMCece8nfSDbBIBEywDvst4BAuOQ9PHZqE55pRxo+kUyfW4yX7xwbO/Q1Ci+juNkCZOrZL7lPdf5ZuYaMtAHFf4EMapKYnE4oHM8N+u/SM01QIGA1Hwn8QJkZWeyrr+0IUEjM/BiVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456441; c=relaxed/simple;
	bh=+b+0XBHUJSIdG3Bs/a9mdGqSH02tCA6OMNM/dRPargA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sq4nZmJtwzoSQa40Jpktd1mK+Oy0BF3KRdvKWsi9JtOaGb5KiCB9QGXXPmbgWw7GLe1wfeVYZBdaa6vrFTMOMUO4lsqDKwR0SXzalrNgUNVUkGQthaYPp4A9UVxVkGsgWdBViUM8u1GfTRfPu4HKu05bX+QNRzPWzKXE5tUCqUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enXZPHQo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enXZPHQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26791C4CEE4;
	Mon,  5 May 2025 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456440;
	bh=+b+0XBHUJSIdG3Bs/a9mdGqSH02tCA6OMNM/dRPargA=;
	h=From:To:Cc:Subject:Date:From;
	b=enXZPHQoWAx7MoKWnS5EX8rXO0EtZT5ZI0NiwLqgueBhyWNUPHha1yL/pczPS6+t8
	 2be0UdU/4KiN96+GCnJ+SX2WPMt+Azi1KdHzv7RSH95/LRzU5+xuJMzeiVouAyCwxf
	 lBmWytOvZhWRsHNAx4UOeCsgVL4wTkqd/KDUPXGDJf1N/vo7JHoYvg1uYqPTEWOO6Z
	 XNmIhy5QjKU5/DZHOZwvtv8cVvhqnevMDuHxK7sgMOnFsdHY7F2MsTsE4wRnKBMKnY
	 KOzlyFcvUcxvytJHHny/cZSfbXWvbzSRm80Hp9ed6sv6TX53G8vemrPQnavezlIztX
	 21SXtBMUeXGcA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert marvell,armada-8k-pic to DT schema
Date: Mon,  5 May 2025 09:47:14 -0500
Message-ID: <20250505144715.1289866-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell 7K/8K PIC interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../marvell,armada-8k-pic.txt                 | 25 ---------
 .../marvell,armada-8k-pic.yaml                | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.txt
deleted file mode 100644
index 86a7b4cd03f5..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Marvell Armada 7K/8K PIC Interrupt controller
----------------------------------------------
-
-This is the Device Tree binding for the PIC, a secondary interrupt
-controller available on the Marvell Armada 7K/8K ARM64 SoCs, and
-typically connected to the GIC as the primary interrupt controller.
-
-Required properties:
-- compatible: should be "marvell,armada-8k-pic"
-- interrupt-controller: identifies the node as an interrupt controller
-- #interrupt-cells: the number of cells to define interrupts on this
-  controller. Should be 1
-- reg: the register area for the PIC interrupt controller
-- interrupts: the interrupt to the primary interrupt controller,
-  typically the GIC
-
-Example:
-
-	pic: interrupt-controller@3f0100 {
-		compatible = "marvell,armada-8k-pic";
-		reg = <0x3f0100 0x10>;
-		#interrupt-cells = <1>;
-		interrupt-controller;
-		interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.yaml
new file mode 100644
index 000000000000..5a455f7353db
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/marvell,armada-8k-pic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 7K/8K PIC Interrupt controller
+
+maintainers:
+  - Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+
+description:
+  The Marvell Armada 7K/8K PIC is a secondary interrupt controller available on
+  the Marvell Armada 7K/8K ARM64 SoCs, and typically connected to the GIC as the
+  primary interrupt controller.
+
+properties:
+  compatible:
+    const: marvell,armada-8k-pic
+
+  reg:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt to the primary interrupt controller (GIC).
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller@3f0100 {
+        compatible = "marvell,armada-8k-pic";
+        reg = <0x3f0100 0x10>;
+        #interrupt-cells = <1>;
+        interrupt-controller;
+        interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.47.2

