Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC1C25C80A;
	Mon,  5 May 2025 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456347; cv=none; b=kqSiNWrzC+FKSwa09NbU0C15JfG/tOlAM4CdBXGJnH+OSfTTgZDn0syIMJvFbRDumH71zTo43Lji2IrqQIOMZXQBbiMFHhqfQ7Mg7zHvGAeq/e55WSEzC/C6MFWtPEVvv1XzS7dlNGQeU0CJn0WNf+dtdUvuPc5Jl9b3udbqXFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456347; c=relaxed/simple;
	bh=opVSpiIzfD42UYZFrBuCaLU4LkUZwDRzk7Pb+PrAEq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BNWG+hniZp/mQ4fAXNf3hdeQaAUhfzLeTS+BbUJZcbDW0GuIfqo51J1YPhPdxqtkR53cT0QdqROY9gw+4t6qdZV/Q77lUqgTxGYeCMyuHrIUIzl9jR3xMFeHEv1RxNts2H2fMCBjXYEN/BXwev+Iv2ftuh1syKa4VXe896gzI6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3AQlt/z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3AQlt/z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12E3C4CEE4;
	Mon,  5 May 2025 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456347;
	bh=opVSpiIzfD42UYZFrBuCaLU4LkUZwDRzk7Pb+PrAEq0=;
	h=From:To:Cc:Subject:Date:From;
	b=Z3AQlt/z1wwln5rYJXRLlB1958leh3JF11OUj49GX/Af2SKOYVNl8pvO72RliBtjs
	 y38WY+aCkCsOKEycgyJDoAIyHSjUDoTR9JCJSLtGpZex+5drVSSUJgI+EJfnPp0qP3
	 5lkt0rKtu+8QOfupbrsWuN0lcBsDyXU1Wgbgtjo5v8x1fkLfXl21N1aXh2r/+AdSBp
	 GREBecDOMEFq7RmTaqGTu2meuki+z/3Enws5wOve6QYzHcsLDhG3kfERgk1HxyEsUq
	 md95kumavFPlrV98X8s2ieU1k8k0hP2Mrjc50hPEMR7ssA0cvkCfDeIEROU+32J5OS
	 bt/UcM5nWtFvg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert al,alpine-msix to DT schema
Date: Mon,  5 May 2025 09:45:42 -0500
Message-ID: <20250505144543.1286351-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Amazaon Alpine MSIX controller binding to schema format.

Drop the interrupt-controller property as the MSIX controller doesn't
provide interrupts. The interrupt-parent property is required in this
case for custom MSI mapping properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/al,alpine-msix.txt   | 25 ----------
 .../interrupt-controller/al,alpine-msix.yaml  | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/al,alpine-msix.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/al,alpine-msix.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/al,alpine-msix.txt b/Documentation/devicetree/bindings/interrupt-controller/al,alpine-msix.txt
deleted file mode 100644
index 5669764f9cc9..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/al,alpine-msix.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Alpine MSIX controller
-
-See arm,gic-v3.txt for SPI and MSI definitions.
-
-Required properties:
-
-- compatible: should be "al,alpine-msix"
-- reg: physical base address and size of the registers
-- interrupt-controller: identifies the node as an interrupt controller
-- msi-controller: identifies the node as an PCI Message Signaled Interrupt
-		  controller
-- al,msi-base-spi: SPI base of the MSI frame
-- al,msi-num-spis: number of SPIs assigned to the MSI frame, relative to SPI0
-
-Example:
-
-msix: msix {
-	compatible = "al,alpine-msix";
-	reg = <0x0 0xfbe00000 0x0 0x100000>;
-	interrupt-parent = <&gic>;
-	interrupt-controller;
-	msi-controller;
-	al,msi-base-spi = <160>;
-	al,msi-num-spis = <160>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/al,alpine-msix.yaml b/Documentation/devicetree/bindings/interrupt-controller/al,alpine-msix.yaml
new file mode 100644
index 000000000000..9f1ff8ec686f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/al,alpine-msix.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/al,alpine-msix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Alpine MSIX controller
+
+maintainers:
+  - Antoine Tenart <atenart@kernel.org>
+
+properties:
+  compatible:
+    const: al,alpine-msix
+
+  reg:
+    maxItems: 1
+
+  interrupt-parent: true
+
+  msi-controller: true
+
+  al,msi-base-spi:
+    description: SPI base of the MSI frame
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  al,msi-num-spis:
+    description: number of SPIs assigned to the MSI frame, relative to SPI0
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - msi-controller
+  - al,msi-base-spi
+  - al,msi-num-spis
+
+additionalProperties: false
+
+examples:
+  - |
+    msi-controller@fbe00000 {
+        compatible = "al,alpine-msix";
+        reg = <0xfbe00000 0x100000>;
+        interrupt-parent = <&gic>;
+        msi-controller;
+        al,msi-base-spi = <160>;
+        al,msi-num-spis = <160>;
+    };
-- 
2.47.2

