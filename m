Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141DB266B5A;
	Mon,  5 May 2025 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456556; cv=none; b=ixEKJ34V14kIjkCvAVBzfrjrdeqPqyKCvWQZAIKn4qDZr70hyIb0SYqm3BQb/zukddXEce/4L4L5bkJDPP/2MmGTUzPk/1FSKiyTGfcF5Lv0k3EIHteI/6RKqgWdJ3UEYx6Bnxhhm6/ycKNExQ8Y5x4VvulOrq1UczukqFWyOG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456556; c=relaxed/simple;
	bh=zSL7vwfwCNUBbYNBRV1FVhxBy1cqHbXwOkpzSSyyG78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yae3XjyiRF8RgNIBPjE7iD37IMljlz5XYHvopkUtnir5QBONp/rvgfPP6k+kql/cFYTgbDlyYXcnfhv7J3CNaeF40uDjp5n/eudt+lslObk2tIb0jZUjO619Z0ugOmyEP4uIYL3x4PZy2EstiI3WvygM5CHfYZbRl6hDhU3gosY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuSe3Fsk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuSe3Fsk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06FBC4CEE4;
	Mon,  5 May 2025 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456555;
	bh=zSL7vwfwCNUBbYNBRV1FVhxBy1cqHbXwOkpzSSyyG78=;
	h=From:To:Cc:Subject:Date:From;
	b=YuSe3FskWlVYCYwnmBbgNeyQhhstq6f1fSB6HRkYbxjTUZCUnJ0NCsiHuNOPKxk0a
	 siRBNOE46U1hWcVrkyhm8Gqj96iwm/3Vzcz8d9QqJrQsThIkFhnZcreHB9f0oTvtmT
	 hZMbzcrgGTYHoO81pNCnPmRtD4GwVRVPfNERWH/CyplHoImn8Rtj1p9bteAxmzkhZk
	 iCvOv5Im9lq/L/0BL51BrSIv5NmzJRxX0+pPE3o2Rc+mk7v3NVL8ym6Yd3bENsd4oP
	 4WdcxvM1PLLBsk/8/U7e8s2XmUaD764Y/4cYqiqAkPy7iaQAOpb6qJBRJ4nhxcZTQD
	 TVeJt5Y2nvTdA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert ti,omap4-wugen-mpu to DT schema
Date: Mon,  5 May 2025 09:49:12 -0500
Message-ID: <20250505144913.1293967-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI Wakeup Generator interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../ti,omap4-wugen-mpu.txt                    | 31 -----------
 .../ti,omap4-wugen-mpu.yaml                   | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu.txt
deleted file mode 100644
index 422d6908f8b2..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-TI OMAP4 Wake-up Generator
-
-All TI OMAP4/5 (and their derivatives) an interrupt controller that
-routes interrupts to the GIC, and also serves as a wakeup source. It
-is also referred to as "WUGEN-MPU", hence the name of the binding.
-
-Required properties:
-
-- compatible : should contain at least "ti,omap4-wugen-mpu" or
-  "ti,omap5-wugen-mpu"
-- reg : Specifies base physical address and size of the registers.
-- interrupt-controller : Identifies the node as an interrupt controller.
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value must be 3.
-
-Notes:
-
-- Because this HW ultimately routes interrupts to the GIC, the
-  interrupt specifier must be that of the GIC.
-- Only SPIs can use the WUGEN as an interrupt parent. SGIs and PPIs
-  are explicitly forbidden.
-
-Example:
-
-       wakeupgen: interrupt-controller@48281000 {
-               compatible = "ti,omap5-wugen-mpu", "ti,omap4-wugen-mpu";
-               interrupt-controller;
-               #interrupt-cells = <3>;
-               reg = <0x48281000 0x1000>;
-               interrupt-parent = <&gic>;
-       };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu.yaml
new file mode 100644
index 000000000000..6e3d6e6d9e07
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/ti,omap4-wugen-mpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP4 Wake-up Generator
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description: >
+  All TI OMAP4/5 (and their derivatives) are interrupt controllers that route
+  interrupts to the GIC, and also serve as wakeup sources. They are also
+  referred to as "WUGEN-MPU", hence the name of the binding.
+
+  Notes:
+
+    - Because this HW ultimately routes interrupts to the GIC, the interrupt
+      specifier must be that of the GIC.
+    - Only SPIs can use the WUGEN as an interrupt parent. SGIs and PPIs are
+      explicitly forbidden.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: ti,omap5-wugen-mpu
+          - const: ti,omap4-wugen-mpu
+      - const: ti,omap4-wugen-mpu
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 3
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
+    interrupt-controller@48281000 {
+        compatible = "ti,omap5-wugen-mpu", "ti,omap4-wugen-mpu";
+        reg = <0x48281000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+    };
-- 
2.47.2

