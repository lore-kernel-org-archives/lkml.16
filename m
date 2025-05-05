Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30A425DCEC;
	Mon,  5 May 2025 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456356; cv=none; b=rb83YzR7XbwfXhIXF+siTqoEhPwGuB78fiVgBG9iHocjYgMMc1ZaAaCk4QoxJUeNDSn1PM7CazNhnC7OtETzC5wYP8P30oTU6wu3bo8CISOuKOGOk9lJpgV3/W3QwjVGlhyxMKDgPJMUwjHLjyMi3m2FtdeTu6aJq+Es9GdGVjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456356; c=relaxed/simple;
	bh=fKAlH0COBtcvA534/uIpuUZmrqtLH0HvPv4RDf7USbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aHU+hWSpEjXLEeEJyqfqPDawSLKw7ZYsUn3IVwiG+bvJ3pWi6Mo4Qh5plTyM+uYFrz1e1IIjmGduzX3xgtXDhlQ7o65VEOVTD40k0X+B4lspVV5nz1xf9byEBcjf6vtPCpxR433ktIbaHmRQ7mDPCiFfmL20d4jogw3MGX6FUug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6+4Ps5K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6+4Ps5K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBD9C4CEEE;
	Mon,  5 May 2025 14:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456356;
	bh=fKAlH0COBtcvA534/uIpuUZmrqtLH0HvPv4RDf7USbA=;
	h=From:To:Cc:Subject:Date:From;
	b=P6+4Ps5KypfCdMzMUoiQyJJreIfJJS7Yex2iEUgYJqZkG0fvysuAaUxVoIPrwUD9M
	 OjDA0OhZkuV+SCCmT/LUVy5zVvX21SANZm2N8ZfFSiY2le9ZeWz2EX5RM/B4yrQU8C
	 z0TfsWcXRBgsAntRPnnyJNj2pgPW0I12dFF08TJNMeITfyl9JGI8LmvcuHZhDsWVDh
	 Rw149/AjuovoTeuFrhxkQuVV+F3tbuMDfL5IdwSTBTxrWA0cKV0pwO4hI/GpOoZ3D1
	 mB7yb+fMIdP0c2zC00qiTIRKEQWCkLEHaBAiOrd1kmiwCFyc/UWLhq07ymZlaaQ4MY
	 l2kT3m6IpPMHg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert arm,nvic to DT schema
Date: Mon,  5 May 2025 09:45:52 -0500
Message-ID: <20250505144553.1286730-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Arm NVIC interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/arm,nvic.txt         | 36 -----------
 .../interrupt-controller/arm,nvic.yaml        | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,nvic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.txt
deleted file mode 100644
index 386ab37a383f..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* ARM Nested Vector Interrupt Controller (NVIC)
-
-The NVIC provides an interrupt controller that is tightly coupled to
-Cortex-M based processor cores.  The NVIC implemented on different SoCs
-vary in the number of interrupts and priority bits per interrupt.
-
-Main node required properties:
-
-- compatible : should be one of:
-	"arm,v6m-nvic"
-	"arm,v7m-nvic"
-	"arm,v8m-nvic"
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source.  The type shall be a <u32> and the value shall be 2.
-
-  The 1st cell contains the interrupt number for the interrupt type.
-
-  The 2nd cell is the priority of the interrupt.
-
-- reg : Specifies base physical address(s) and size of the NVIC registers.
-  This is at a fixed address (0xe000e100) and size (0xc00).
-
-- arm,num-irq-priority-bits: The number of priority bits implemented by the
-  given SoC
-
-Example:
-
-	intc: interrupt-controller@e000e100 {
-		compatible = "arm,v7m-nvic";
-		#interrupt-cells = <2>;
-		#address-cells = <1>;
-		interrupt-controller;
-		reg = <0xe000e100 0xc00>;
-		arm,num-irq-priority-bits = <4>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
new file mode 100644
index 000000000000..d89eca956c5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Nested Vector Interrupt Controller (NVIC)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description:
+  The NVIC provides an interrupt controller that is tightly coupled to Cortex-M
+  based processor cores.  The NVIC implemented on different SoCs vary in the
+  number of interrupts and priority bits per interrupt.
+
+properties:
+  compatible:
+    enum:
+      - arm,v6m-nvic
+      - arm,v7m-nvic
+      - arm,v8m-nvic
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 0
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description: |
+      Number of cells to encode an interrupt source:
+      first = interrupt number, second = priority.
+
+  arm,num-irq-priority-bits:
+    description: Number of priority bits implemented by the SoC
+    minimum: 1
+    maximum: 8
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - arm,num-irq-priority-bits
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@e000e100 {
+        compatible = "arm,v7m-nvic";
+        #interrupt-cells = <2>;
+        #address-cells = <0>;
+        interrupt-controller;
+        reg = <0xe000e100 0xc00>;
+        arm,num-irq-priority-bits = <4>;
+    };
-- 
2.47.2

