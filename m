Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC327511F;
	Mon,  5 May 2025 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456546; cv=none; b=KnZsliHg+lU+VjWHZMQ6levPXQHDtR28X5A3qm+r5bO3Gv3EzD7i/U1ufEJTyCWEUIHGXaTZlg4l0WoMbVm3hjbxzw9wC66nsT+lLUf3B4yaEAI+bRXq7lYS3bLwnUpIL3Dyr2toHO6fzDYKECUJCFG8H86PkvUlv5cRMXEWKxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456546; c=relaxed/simple;
	bh=f++R7onyGhztL2ppO2pM5iKx8EpcAYqPrcfJ8Kqk3sc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YWN2UxocBuRbpDBpcrPtUjwz+FY4wtNod19LgVrcmp7MUy6bQOHlx12y0B0vPMQ3dmctHhQ501Er+Sks31xpcXyMvCMJwz9s6yuWboLmP/SX2PXvW016Bgt7W2Bid1+T1vMxoL9nctZNA6a7LbFw3Kx9GQbR0BY5NfQQaQsJX80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sb7mlVoi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sb7mlVoi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED3CC4CEE4;
	Mon,  5 May 2025 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456546;
	bh=f++R7onyGhztL2ppO2pM5iKx8EpcAYqPrcfJ8Kqk3sc=;
	h=From:To:Cc:Subject:Date:From;
	b=sb7mlVoiE1QnY8Y3Cnez/74lIduA5sZVjVun81kXxvOhy/mL5J34IaXXt56Fiu2TW
	 dPVWtDgFTBZ6mjSOEmD+xdvPNpGEATQLu47HpkAQwl6nZ7ikyyq3etBif4otg6PY5z
	 6CidgFY+8SI2xI4tfc3YT846oRG5zbRsvjmC2drnbyVkD9kqmnGazTMrbt8yauzxZY
	 IxlglIfc9SH5tZqAWMCR3qdej3QZ2Mnhs5afLopF3HQbxJee3zrUDYvBuHRayHK0KX
	 jtLpBwcOqQtHqpfd4ua4avP6ho0PEK5BwpNI4+1za7x/inxrzdM70iSuQKX9V3x91L
	 A74KaCUE8X42Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert ti,cp-intc to DT schema
Date: Mon,  5 May 2025 09:49:00 -0500
Message-ID: <20250505144903.1293558-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the TI Common Platform interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/ti,cp-intc.txt       | 27 ----------
 .../interrupt-controller/ti,cp-intc.yaml      | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.txt
deleted file mode 100644
index 597e8a089fe4..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* TI Common Platform Interrupt Controller
-
-Common Platform Interrupt Controller (cp_intc) is used on
-OMAP-L1x SoCs and can support several configurable number
-of interrupts.
-
-Main node required properties:
-
-- compatible : should be:
-	"ti,cp-intc"
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
-		compatible = "ti,cp-intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		ti,intc-size = <101>;
-		reg = <0xfffee000 0x2000>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.yaml
new file mode 100644
index 000000000000..77d018d20f9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/ti,cp-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Common Platform Interrupt Controller
+
+maintainers:
+  - Bartosz Golaszewski <brgl@bgdev.pl>
+  
+description:
+  Common Platform Interrupt Controller (cp_intc) is used on OMAP-L1x SoCs and
+  can support several configurable number of interrupts.
+
+properties:
+  compatible:
+    const: ti,cp-intc
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description: Encodes an interrupt number in the range 0–128.
+
+  ti,intc-size:
+    description: Number of interrupts handled by the interrupt controller.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - ti,intc-size
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@fffee000 {
+        compatible = "ti,cp-intc";
+        reg = <0xfffee000 0x2000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        ti,intc-size = <101>;
+    };
-- 
2.47.2

