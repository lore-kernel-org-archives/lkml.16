Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA26266B4D;
	Mon,  5 May 2025 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456561; cv=none; b=mpV+Hkb7tCAA0A220KqusAqjoMdkXeB6fFhWYBtXHPW1vzx+bJU4Xmo588uc4K3X0oiB8bUx43wHdr7sI3nYbRNJX2UvE9XB/ThuF9/6pJhvMpgpnZxyfjSVcjKygSZhZyEDbrq0bp/5OWSfOYFyMNKqt3hhkBWxZhU3eOkBfPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456561; c=relaxed/simple;
	bh=iD8CTkADMoNA9rW+HQeEF3zen6RjgxyPyyiXjPgv0Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l1vyx7GA2GSbymZgfnBeOmfMDJQcDhgrasGjY89TS6y+kL2/3obzE4IVcC8UsXjdCm4toEApylyo7HHD7LuBNE2aOj26axgvIVDfMGuNFRLLQhaf7pRQmRzLR1iHkWv5TAcv70at5qw4kHj5+HJ76KMe9IYZ9U5uJGojrdPiP/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCMPHEMt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCMPHEMt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB65C4CEE4;
	Mon,  5 May 2025 14:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456561;
	bh=iD8CTkADMoNA9rW+HQeEF3zen6RjgxyPyyiXjPgv0Ec=;
	h=From:To:Cc:Subject:Date:From;
	b=FCMPHEMt0wYQvhkl/I6hIvdLxJ3O2WLC+Pv9UHwkfAZSR3s8ReHff/g43eSSHxBCR
	 kytC65+Odzl7EEkRHVi+bD3Guvp5uqXyAUdFhxXnJYOikzIFgPnt2OU3EMRY4xRVUY
	 OqZ1drWZBuCOWe2vhjy1yXTsHICFhzKwvKZcGWXLlKTrNjR+eujd6ihAdEQmz8Df2Q
	 lDrLCZQoDSovVXbaXd/otMPe7ipu51RF+DWIUWrotLqmvOWv7oT024ty9DMkM+Yjxj
	 lumC1qq1iBWG8HDhRFYeCxSQ5lcNy+IQLfPbaLRatfFCKgPcLsLVftlu59XmpS3Glk
	 rr01vAnjWT+8Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert ti,omap-intc-irq to DT schema
Date: Mon,  5 May 2025 09:49:16 -0500
Message-ID: <20250505144917.1294150-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI OMAP2/3 interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

"ti,intc-size" property isn't actually used with "ti,omap2-intc", so the
2 bindings can be combined.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/ti,omap-intc-irq.txt | 28 ----------
 .../ti,omap-intc-irq.yaml                     | 52 +++++++++++++++++++
 .../interrupt-controller/ti,omap2-intc.txt    | 27 ----------
 3 files changed, 52 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,omap-intc-irq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,omap-intc-irq.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,omap2-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,omap-intc-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,omap-intc-irq.txt
deleted file mode 100644
index 38ce5d037722..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,omap-intc-irq.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Omap2/3 intc controller
-
-On TI omap2 and 3 the intc interrupt controller can provide
-96 or 128 IRQ signals to the ARM host depending on the SoC.
-
-Required Properties:
-- compatible: should be one of
-			"ti,omap2-intc"
-			"ti,omap3-intc"
-			"ti,dm814-intc"
-			"ti,dm816-intc"
-			"ti,am33xx-intc"
-
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode interrupt
-		     source, should be 1 for intc
-- interrupts: interrupt reference to primary interrupt controller
-
-Please refer to interrupts.txt in this directory for details of the common
-Interrupt Controllers bindings used by client devices.
-
-Example:
-	intc: interrupt-controller@48200000 {
-		compatible = "ti,omap3-intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		reg = <0x48200000 0x1000>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,omap-intc-irq.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,omap-intc-irq.yaml
new file mode 100644
index 000000000000..cb118180621f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,omap-intc-irq.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/ti,omap-intc-irq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP Interrupt Controller
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description:
+  On TI omap2 and 3 the intc interrupt controller can provide 96 or 128 IRQ
+  signals to the ARM host depending on the SoC.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap2-intc
+      - ti,omap3-intc
+      - ti,dm814-intc
+      - ti,dm816-intc
+      - ti,am33xx-intc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@48200000 {
+        compatible = "ti,omap3-intc";
+        reg = <0x48200000 0x1000>;
+        interrupts = <32>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,omap2-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,omap2-intc.txt
deleted file mode 100644
index f2583e6ec060..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,omap2-intc.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* OMAP Interrupt Controller
-
-OMAP2/3 are using a TI interrupt controller that can support several
-configurable number of interrupts.
-
-Main node required properties:
-
-- compatible : should be:
-	"ti,omap2-intc"
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The type shall be a <u32> and the value shall be 1.
-
-  The cell contains the interrupt number in the range [0-128].
-- ti,intc-size: Number of interrupts handled by the interrupt controller.
-- reg: physical base address and size of the intc registers map.
-
-Example:
-
-	intc: interrupt-controller@1 {
-		compatible = "ti,omap2-intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		ti,intc-size = <96>;
-		reg = <0x48200000 0x1000>;
-	};
-
-- 
2.47.2

