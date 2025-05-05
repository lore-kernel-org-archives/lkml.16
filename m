Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3168F264A6D;
	Mon,  5 May 2025 14:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456505; cv=none; b=kj8XjN4VhNa/CwIzn9pxVQQzbRctdpiTdxcAf00AFmyg250QAWJYcNN0Ohf3lScZ59OvHB//6SK4vTAfQ1HYJJ86syTP6TDm2pTgCoJ6qY+ztPcXvmdPkgYD8JksJB7ZZjsgffHBxpHZkcZG7pmB3y57s6GzrszenL5ruJLSXV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456505; c=relaxed/simple;
	bh=1EZyDIL5mZmIfOxtW9pAsNtAkKGpD9D94OZvI2EUxpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c89IaEWwgK+6FUHtOjLz+8KyiL8uhvraQNRXg1Xenw9X16AZEn9whIkcQYsfyi1NNWhQ9Mqd13IMm7o4Ia5vlLAP7L6qw55RfQ0cfEWpm3kvUF1rY+W8uqzqJQ1JRJrvyULoZ+w8jGgdiOn+R7lOdmWY70AX1kF1fpY/rVAt32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcT8R9vY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcT8R9vY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA734C4CEE4;
	Mon,  5 May 2025 14:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456504;
	bh=1EZyDIL5mZmIfOxtW9pAsNtAkKGpD9D94OZvI2EUxpU=;
	h=From:To:Cc:Subject:Date:From;
	b=kcT8R9vYfWkDM1uCfXLD98/UTEGRvulrb7zTYmrDdlvgzgsoJb/dR+97vbeLVorUT
	 lZnQNEfp5Rm2zTfirUD5B6HRd8H63uTgQA9Ecf8GV5bbQzQWaJC9roGHAwwmJ8o+po
	 oc87NxYyUzBHP4QDCTb3WH/VE12yhZCtGGyXq1w4SO3ZXgKoUzPXQPWDa06UOJHPEh
	 C079cKl7teUU7f3uVZQCcPS+Jzkn/C6Mfy9akIC0kjkG+19wTKMArD8lv8aRdYivOA
	 P38Qos/r/fJd01dCx9LkPS0mTcEIichVwMZPujxJNur1NA28DD0LxcD2raRDordqTb
	 OWhsCKpq9K0rA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alban Bedel <albeu@free.fr>,
	Alexander Couzens <lynxis@fe80.eu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert qca,ar7100-misc-intc to DT schema
Date: Mon,  5 May 2025 09:48:20 -0500
Message-ID: <20250505144821.1292151-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Qualcomm Atheros ath79 Misc interrupt controller binding to
schema format.

Adjust the compatible values to match what's actually in use.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../qca,ar7100-misc-intc.yaml                 | 52 +++++++++++++++++++
 .../qca,ath79-misc-intc.txt                   | 45 ----------------
 2 files changed, 52 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-misc-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-misc-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-misc-intc.yaml
new file mode 100644
index 000000000000..ae813189f5ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-misc-intc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/qca,ar7100-misc-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Atheros AR7xxx/AR9XXX MISC interrupt controller
+
+maintainers:
+  - Alban Bedel <albeu@free.fr>
+  - Alexander Couzens <lynxis@fe80.eu>
+
+description:
+  The Qualcomm Atheros AR7xxx/AR9XXX MISC interrupt controller is a secondary
+  controller for lower priority interrupts.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: qca,ar9132-misc-intc
+          - const: qca,ar7100-misc-intc
+      - const: qca,ar7240-misc-intc
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
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+examples:
+  - |
+    interrupt-controller@18060010 {
+        compatible = "qca,ar9132-misc-intc", "qca,ar7100-misc-intc";
+        reg = <0x18060010 0x4>;
+        interrupts = <6>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
deleted file mode 100644
index ad70006c1848..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Binding for Qualcomm Atheros AR7xxx/AR9XXX MISC interrupt controller
-
-The MISC interrupt controller is a secondary controller for lower priority
-interrupt.
-
-Required Properties:
-- compatible: has to be "qca,<soctype>-cpu-intc", "qca,ar7100-misc-intc" or
-  "qca,<soctype>-cpu-intc", "qca,ar7240-misc-intc"
-- reg: Base address and size of the controllers memory area
-- interrupts: Interrupt specifier for the controllers interrupt.
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode interrupt
-		     source, should be 1
-
-Compatible fallback depends on the SoC. Use ar7100 for ar71xx and ar913x,
-use ar7240 for all other SoCs.
-
-Please refer to interrupts.txt in this directory for details of the common
-Interrupt Controllers bindings used by client devices.
-
-Example:
-
-	interrupt-controller@18060010 {
-		compatible = "qca,ar9132-misc-intc", "qca,ar7100-misc-intc";
-		reg = <0x18060010 0x4>;
-
-		interrupt-parent = <&cpuintc>;
-		interrupts = <6>;
-
-		interrupt-controller;
-		#interrupt-cells = <1>;
-	};
-
-Another example:
-
-	interrupt-controller@18060010 {
-		compatible = "qca,ar9331-misc-intc", qca,ar7240-misc-intc";
-		reg = <0x18060010 0x4>;
-
-		interrupt-parent = <&cpuintc>;
-		interrupts = <6>;
-
-		interrupt-controller;
-		#interrupt-cells = <1>;
-	};
-- 
2.47.2

