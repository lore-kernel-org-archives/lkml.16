Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B06266563;
	Mon,  5 May 2025 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456551; cv=none; b=QQtvZztakI5S/MH7a6d4sKHl1dXBLmqOocfwH9ovpA0YpJxPd3cRPVjNrG5dwgMixEEeVpebvoMzO4LzqkEk/tLPrqf5WWfzZZPYfis/lcYCwTpCyyt0XRBCPWDVSfRxdYCYkF/o73pUXCjBL3KfXxKOT/0IRpZx7T9Z7bgAMTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456551; c=relaxed/simple;
	bh=c9Qm87ml3WCMEWGCO8iGEERxYrWtpPcnCdAktgeuZ6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2WcEA+W8YsmWkQ/JNX5+Ft+iZ8n/bsA+0lnitO9Q54iSaytCgGjo9OsKmbX1yuUbZJY9cw8q9+UqgLGq7h1hVnJ+2m6+Wq5UgRxiwf9OZ80X/Grl2NdiH4SgGaifCzEEt0B+BWiTJ4N9NzQIn2GLCtxMjyjtJHgYY5/aSTxAAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWTkgZNe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWTkgZNe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B046C4CEE4;
	Mon,  5 May 2025 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456551;
	bh=c9Qm87ml3WCMEWGCO8iGEERxYrWtpPcnCdAktgeuZ6k=;
	h=From:To:Cc:Subject:Date:From;
	b=QWTkgZNe1YsQ9P9J2/jB+BZMlxnYFCNAG/6WxDcX02eW0kuEXywLms4/9P3kEfSIS
	 /oGhyVlbG26h/X3OfY3tn1BctJx2B5XhRFpdi1CKh9VsvHYqW2Yk5AR0y7AA+jJh0b
	 yndd2i+EsYevbsPKxXK4HrZLTje4G7V74HLu//C+XYwoJXdhqVUlrT4I6yiCyc9E4h
	 vtpwQjBZjAtAQS1QP9CjZTV4xn858WE9N/JBCG2th1821otaWLJ/liTHj7DFHHZxhE
	 My4SpJ8QDEjpI8nZtb0+LGL/Jg99VaTkrb09SdpfsATlPO90qGRuXG7HYq0OyyHldr
	 jf9AC53wXXnng==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert ti,keystone-irq to DT schema
Date: Mon,  5 May 2025 09:49:07 -0500
Message-ID: <20250505144908.1293785-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI Keystone 2 interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/ti,keystone-irq.txt  | 36 -----------
 .../interrupt-controller/ti,keystone-irq.yaml | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.txt
deleted file mode 100644
index 5f94d7739d8d..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Keystone 2 IRQ controller IP
-
-On Keystone SOCs, DSP cores can send interrupts to ARM
-host using the IRQ controller IP. It provides 28 IRQ signals to ARM.
-The IRQ handler running on HOST OS can identify DSP signal source by
-analyzing SRCCx bits in IPCARx registers. This is one of the component
-used by the IPC mechanism used on Keystone SOCs.
-
-Required Properties:
-- compatible: should be "ti,keystone-irq"
-- ti,syscon-dev : phandle and offset pair. The phandle to syscon used to
-			access device control registers and the offset inside
-			device control registers range.
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode interrupt
-					 source should be 1.
-- interrupts: interrupt reference to primary interrupt controller
-
-Please refer to interrupts.txt in this directory for details of the common
-Interrupt Controllers bindings used by client devices.
-
-Example:
-	kirq0: keystone_irq0@26202a0 {
-		compatible = "ti,keystone-irq";
-		ti,syscon-dev = <&devctrl 0x2a0>;
-		interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
-		interrupt-controller;
-		#interrupt-cells = <1>;
-	};
-
-	dsp0: dsp0 {
-		compatible = "linux,rproc-user";
-		...
-		interrupt-parent = <&kirq0>;
-		interrupts = <10 2>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.yaml
new file mode 100644
index 000000000000..27d448d1786a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ti,keystone-irq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Keystone 2 IRQ controller IP
+
+maintainers:
+  - Grygorii Strashko <grygorii.strashko@ti.com>
+
+description:
+  On Keystone SOCs, DSP cores can send interrupts to ARM host using the IRQ
+  controller IP. It provides 28 IRQ signals to ARM. The IRQ handler running on
+  HOST OS can identify DSP signal source by analyzing SRCCx bits in IPCARx
+  registers. This is one of the component used by the IPC mechanism used on
+  Keystone SOCs.
+
+properties:
+  compatible:
+    const: ti,keystone-irq
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,syscon-dev:
+    description: Phandle and offset to syscon device
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to syscon device control registers
+          - description: Offset to control register
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+  - ti,syscon-dev
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller@2a0 {
+      compatible = "ti,keystone-irq";
+      reg = <0x2a0 0x4>;
+      ti,syscon-dev = <&devctrl 0x2a0>;
+      interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
+      interrupt-controller;
+      #interrupt-cells = <1>;
+    };
-- 
2.47.2

