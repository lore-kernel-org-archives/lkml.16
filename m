Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D2C265CDC;
	Mon,  5 May 2025 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456399; cv=none; b=dRyLEBdZVCrLiyG6Nmldzcgjh7I8PHE5ry5RhiFEDCBSoLtbt+rqvIB2wXWHdAbYIHIv9tHcbrNtnikEGMGPFKUDv1A/iI8Uiwu8H+c6z7lniMcbFLxzMf9jkhOKHl93jV34yS0PBDjDfSh2oJaoeN+X7qFEtL4B/Ir/hxi21mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456399; c=relaxed/simple;
	bh=oceEOdTpj2xuDwm2Zro+x2sCj0vKyJtn5PkWVpmd2JI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PppCc+YICU2KqtPV7gqe9zgY3ERgA4RqOgqNJrmNMw9SgCU1fvRjAGBttr9X8cAR/MGzpyu9rY/ERGdmyBKx6FSk4JJRjLntSoicLYfzbptFoKutZSctv7oG4ZRK5OAVyX7ehHwkZP0MnYD7GMK48tVvIetNC7vFoefZuyQn00U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeko2X6V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeko2X6V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCC9C4CEE4;
	Mon,  5 May 2025 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456399;
	bh=oceEOdTpj2xuDwm2Zro+x2sCj0vKyJtn5PkWVpmd2JI=;
	h=From:To:Cc:Subject:Date:From;
	b=aeko2X6VAxn0kkH+Pl19XkOr4kYw50V7iz3xghCJ69OlEWt2id4VJfzJrYPvmn1X9
	 0zvxtEsl+DadoK1yVh6RRx0hW0t8fKHmcoL/Fa9mLxrejwUuyfvi4qrm49V8Xbi5iw
	 b4A3Cz4kVF8+N8qBbWNbiJ6tPOyowx7LLk7HPYiAx7jopIkd0oOJkAjuUGptyNIDpZ
	 0etBMtH8i3LPdu2xoVCjpdI+i8XXwDqjIvZcctQyfhBx2f7OGpHYVNilK1P1UpmOoD
	 X6yP6szKopAaxT0fXueHRBZFeH7L9SDn3WgAEzLT0f0Vim6TsEv7BURCBgixh04oyL
	 rTea5bTZz0Wcg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert csky,apb-intc to DT schema
Date: Mon,  5 May 2025 09:46:35 -0500
Message-ID: <20250505144636.1288261-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the C-SKY APB interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/csky,apb-intc.txt    | 62 -------------------
 .../interrupt-controller/csky,apb-intc.yaml   | 54 ++++++++++++++++
 2 files changed, 54 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
deleted file mode 100644
index 44286dcbac62..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-==============================
-C-SKY APB Interrupt Controller
-==============================
-
-C-SKY APB Interrupt Controller is a simple soc interrupt controller
-on the apb bus and we only use it as root irq controller.
-
- - csky,apb-intc is used in a lot of csky fpgas and socs, it support 64 irq nums.
- - csky,dual-apb-intc consists of 2 apb-intc and 128 irq nums supported.
- - csky,gx6605s-intc is gx6605s soc internal irq interrupt controller, 64 irq nums.
-
-=============================
-intc node bindings definition
-=============================
-
-	Description: Describes APB interrupt controller
-
-	PROPERTIES
-
-	- compatible
-		Usage: required
-		Value type: <string>
-		Definition: must be "csky,apb-intc"
-				    "csky,dual-apb-intc"
-				    "csky,gx6605s-intc"
-	- #interrupt-cells
-		Usage: required
-		Value type: <u32>
-		Definition: must be <1>
-	- reg
-		Usage: required
-		Value type: <u32 u32>
-		Definition: <phyaddr size> in soc from cpu view
-	- interrupt-controller:
-		Usage: required
-	- csky,support-pulse-signal:
-		Usage: select
-		Description: to support pulse signal flag
-
-Examples:
----------
-
-	intc: interrupt-controller@500000 {
-		compatible = "csky,apb-intc";
-		#interrupt-cells = <1>;
-		reg = <0x00500000 0x400>;
-		interrupt-controller;
-	};
-
-	intc: interrupt-controller@500000 {
-		compatible = "csky,dual-apb-intc";
-		#interrupt-cells = <1>;
-		reg = <0x00500000 0x400>;
-		interrupt-controller;
-	};
-
-	intc: interrupt-controller@500000 {
-		compatible = "csky,gx6605s-intc";
-		#interrupt-cells = <1>;
-		reg = <0x00500000 0x400>;
-		interrupt-controller;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.yaml
new file mode 100644
index 000000000000..902648ead975
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/csky,apb-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: C-SKY APB Interrupt Controller
+
+maintainers:
+  - Guo Ren <guoren@kernel.org>
+
+description: >
+  C-SKY APB Interrupt Controller is a simple soc interrupt controller on the apb
+  bus and we only use it as root irq controller.
+
+    - csky,apb-intc is used in a lot of csky fpgas and socs, it support 64 irq nums.
+    - csky,dual-apb-intc consists of 2 apb-intc and 128 irq nums supported.
+    - csky,gx6605s-intc is gx6605s soc internal irq interrupt controller, 64 irq nums.
+
+properties:
+  compatible:
+    enum:
+      - csky,apb-intc
+      - csky,dual-apb-intc
+      - csky,gx6605s-intc
+
+  reg:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller: true
+
+  csky,support-pulse-signal:
+    type: boolean
+    description: Support for pulse signal flag.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#interrupt-cells'
+  - interrupt-controller
+
+examples:
+  - |
+    intc: interrupt-controller@500000 {
+        compatible = "csky,apb-intc";
+        #interrupt-cells = <1>;
+        reg = <0x00500000 0x400>;
+        interrupt-controller;
+    };
-- 
2.47.2

