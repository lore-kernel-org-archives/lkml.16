Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EFB264612;
	Mon,  5 May 2025 14:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456501; cv=none; b=rfxuMESIi+kaoaCxkdEUwUyRdHVQdWGG6n3fZLkWhkZnb+TOJCkFsr71zNIJb6snEJfzZFZd1IN4Umc651zv4Feukde6DI28Ou1rrjpaXbH19eKK9cC1XJ940+XlwIOMueSCvqojNcCVBlm9qlaw4Uak2A9L9pSncfcsgIDbYLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456501; c=relaxed/simple;
	bh=7Fb9uvTtERt6y0wCUDSjGv761C6J2UXlp1dZyWd0VEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUlI8tKN15fMvDnUDYWXocmSVC1fUwlurC/NN6fXvrg2iRZD4h+o9O1jIEZCEr+I1YdBRQMunC0WbvBpEtZZlSunLaz8NHMAQw/2CRaPqImUZpzqipxfGsEPLWv8LOtc6RHaKb6I7aXfbFkg7y862rXlhIidzvxopVfz2Zyy7lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEfSnKXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEfSnKXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BDEC4CEE4;
	Mon,  5 May 2025 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456500;
	bh=7Fb9uvTtERt6y0wCUDSjGv761C6J2UXlp1dZyWd0VEA=;
	h=From:To:Cc:Subject:Date:From;
	b=SEfSnKXiDuTkCZvAiQtlkYTCBRSSaNc5DZQVvocoWBVMsZiUFpAXUqHqHqAUFH8Sf
	 8Lo0xkFiazOK/BOYpjeo+mLnzWImg0B+YIP2uC2eEK8/vCokSejzks+aYFFPSKDJWD
	 DW9CbZb/9k7AHDOZzkOSFug65wZfWG3lgBRjzZZKHpEKUor5tXBngWVPLUXxIIOFQX
	 V+Npl1NCpo8h214+8vKi53QgLFg2pk5kQreNP/WEAETX2DNqeBfYg/+jYiyUKf2kL2
	 czVzhkZFILmDrQrCO/up3JTpcCmltUt6KR3HExZJSXxdpeiGUSl0O3n4oV8RC2Vk+C
	 xj/j18QnJZLtg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alban Bedel <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert qca,ar7100-cpu-intc to DT schema
Date: Mon,  5 May 2025 09:48:16 -0500
Message-ID: <20250505144817.1291980-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Qualcomm Atheros ath79 CPU interrupt controller binding to
schema format.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../qca,ar7100-cpu-intc.yaml                  | 61 +++++++++++++++++++
 .../qca,ath79-cpu-intc.txt                    | 44 -------------
 2 files changed, 61 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
new file mode 100644
index 000000000000..ab32a91af4c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/qca,ar7100-cpu-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Atheros ath79 CPU interrupt controller
+
+maintainers:
+  - Alban Bedel <albeu@free.fr>
+
+description:
+  On most SoC the IRQ controller need to flush the DDR FIFO before running the
+  interrupt handler of some devices. This is configured using the
+  qca,ddr-wb-channels and qca,ddr-wb-channel-interrupts properties.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: qca,ar9132-cpu-intc
+          - const: qca,ar7100-cpu-intc
+      - items:
+          - const: qca,ar7100-cpu-intc
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  qca,ddr-wb-channel-interrupts:
+    description: List of interrupts needing a write buffer flush
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  qca,ddr-wb-channels:
+    description: List of write buffer channel phandles for each interrupt
+    $ref: /schemas/types.yaml#/definitions/phandle-array
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
+      interrupt-controller {
+          compatible = "qca,ar9132-cpu-intc", "qca,ar7100-cpu-intc";
+
+          interrupt-controller;
+          #interrupt-cells = <1>;
+
+          qca,ddr-wb-channel-interrupts = <2>, <3>, <4>, <5>;
+          qca,ddr-wb-channels = <&ddr_ctrl 3>, <&ddr_ctrl 2>,
+                                <&ddr_ctrl 0>, <&ddr_ctrl 1>;
+      };
+
+      ddr_ctrl: memory-controller {
+          #qca,ddr-wb-channel-cells = <1>;
+      };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt
deleted file mode 100644
index aabce7810d29..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Binding for Qualcomm Atheros AR7xxx/AR9XXX CPU interrupt controller
-
-On most SoC the IRQ controller need to flush the DDR FIFO before running
-the interrupt handler of some devices. This is configured using the
-qca,ddr-wb-channels and qca,ddr-wb-channel-interrupts properties.
-
-Required Properties:
-
-- compatible: has to be "qca,<soctype>-cpu-intc", "qca,ar7100-cpu-intc"
-  as fallback
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode interrupt
-		     source, should be 1 for intc
-
-Please refer to interrupts.txt in this directory for details of the common
-Interrupt Controllers bindings used by client devices.
-
-Optional Properties:
-
-- qca,ddr-wb-channel-interrupts: List of the interrupts needing a write
-  buffer flush
-- qca,ddr-wb-channels: List of phandles to the write buffer channels for
-  each interrupt. If qca,ddr-wb-channel-interrupts is not present the interrupt
-  default to the entry's index.
-
-Example:
-
-	interrupt-controller {
-		compatible = "qca,ar9132-cpu-intc", "qca,ar7100-cpu-intc";
-
-		interrupt-controller;
-		#interrupt-cells = <1>;
-
-		qca,ddr-wb-channel-interrupts = <2>, <3>, <4>, <5>;
-		qca,ddr-wb-channels = <&ddr_ctrl 3>, <&ddr_ctrl 2>,
-					<&ddr_ctrl 0>, <&ddr_ctrl 1>;
-	};
-
-	...
-
-	ddr_ctrl: memory-controller@18000000 {
-		...
-		#qca,ddr-wb-channel-cells = <1>;
-	};
-- 
2.47.2

