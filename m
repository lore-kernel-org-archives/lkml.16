Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7DE264A8E;
	Mon,  5 May 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456513; cv=none; b=BBdEKmjJIIVR7vjNg8coebuMw1qBg98ITO4kg3PmlqWHbtQvo0CQAjYYCK/6+669IV9FgaM5zGNq/efrULiEWn+wtjL+Hb3WILfMSOiAZqcGN00TJTwcHa8AkSj4PjQwLD/J7+3eRnKsZ5792vfKo7JGkKp5A/+KVOpfNcgJw1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456513; c=relaxed/simple;
	bh=OqbGJoUOj8Ika39G6fy9AeTSyJC3yzUd2A6RtIZgu40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qtig+8U20a12uQHAizdBpsC6xs9ZQMGGJRdqA/nhIrDbyEnF3+EB2ECZIt/S7r0S+XV+A/iYpfywiGXQkNMczGyjxy3Gq6vrehjejn19b9Z5GlRsScH5+ZhoDOOb0kYSTFtl6V3vXf4JIgQvpnATwPWihSnnRuMsaNm1mahRnDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYxfZQi6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYxfZQi6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D466FC4CEE4;
	Mon,  5 May 2025 14:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456513;
	bh=OqbGJoUOj8Ika39G6fy9AeTSyJC3yzUd2A6RtIZgu40=;
	h=From:To:Cc:Subject:Date:From;
	b=SYxfZQi6KH8f2bQ/bF/PWoWGfiW0hASqLeP2mxUSo0g44HvXCn7692ctYZYrwdv9a
	 FtNzkKrj5RJ+9+49nuCUPv9RB8LCRdMP7Tej/jLhA12y5N0QdHeJTnq0QA8ok2QZ5d
	 NnYrPhwEf9XwnbTds3ADqYGsUs7ESuHHzJXuJFiez8cF597tuOxFuXUyKujA322ofJ
	 viDWTL4HOjiA7zg8Irqiac65yQigAQwGRuq5d7ijngWUPzlIaGT0IWNVbmEN+9JGh4
	 o8eC1Zzexnv5GlY7Y5I7dwC+0Xm4eYVj1xS8EbUaNLOgDWzzJ2T4kXDcFJRr3aDC2t
	 d6HMspywzN/ug==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert snps,archs-idu-intc to DT schema
Date: Mon,  5 May 2025 09:48:29 -0500
Message-ID: <20250505144830.1292495-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ARC-HS Interrupt Distribution Unit interrupt controller
binding to schema format. It's a straight-forward conversion of the
typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../snps,archs-idu-intc.txt                   | 46 ------------------
 .../snps,archs-idu-intc.yaml                  | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
deleted file mode 100644
index a5c1db95b3ec..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-* ARC-HS Interrupt Distribution Unit
-
-  This optional 2nd level interrupt controller can be used in SMP configurations
-  for dynamic IRQ routing, load balancing of common/external IRQs towards core
-  intc.
-
-Properties:
-
-- compatible: "snps,archs-idu-intc"
-- interrupt-controller: This is an interrupt controller.
-- #interrupt-cells: Must be <1> or <2>.
-
-  Value of the first cell specifies the "common" IRQ from peripheral to IDU.
-  Number N of the particular interrupt line of IDU corresponds to the line N+24
-  of the core interrupt controller.
-
-  The (optional) second cell specifies any of the following flags:
-    - bits[3:0] trigger type and level flags
-        1 = low-to-high edge triggered
-        2 = NOT SUPPORTED (high-to-low edge triggered)
-        4 = active high level-sensitive <<< DEFAULT
-        8 = NOT SUPPORTED (active low level-sensitive)
-  When no second cell is specified, the interrupt is assumed to be level
-  sensitive.
-
-  The interrupt controller is accessed via the special ARC AUX register
-  interface, hence "reg" property is not specified.
-
-Example:
-	core_intc: core-interrupt-controller {
-		compatible = "snps,archs-intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-	};
-
-	idu_intc: idu-interrupt-controller {
-		compatible = "snps,archs-idu-intc";
-		interrupt-controller;
-		interrupt-parent = <&core_intc>;
-		#interrupt-cells = <1>;
-	};
-
-	some_device: serial@c0fc1000 {
-		interrupt-parent = <&idu_intc>;
-		interrupts = <0>;	/* upstream idu IRQ #24 */
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml
new file mode 100644
index 000000000000..286a964f23e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/snps,archs-idu-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARC-HS Interrupt Distribution Unit
+
+maintainers:
+  - Vineet Gupta <vgupta@kernel.org>
+
+description: >
+  ARC-HS Interrupt Distribution Unit is an optional 2nd level interrupt
+  controller which can be used in SMP configurations for dynamic IRQ routing,
+  load balancing of common/external IRQs towards core intc.
+
+  The interrupt controller is accessed via the special ARC AUX register
+  interface, hence "reg" property is not specified.
+
+properties:
+  compatible:
+    const: snps,archs-idu-intc
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description: |
+      Number of interrupt specifier cells:
+        - 1: only a common IRQ is specified.
+        - 2: a second cell encodes trigger type and level flags:
+            1 = low-to-high edge triggered
+            4 = active high level-sensitive (default)
+    enum: [1, 2]
+
+required:
+  - compatible
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "snps,archs-idu-intc";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
-- 
2.47.2

