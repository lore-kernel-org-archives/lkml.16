Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE025D546;
	Mon,  5 May 2025 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456462; cv=none; b=dySCOasB90ZtvhNMlPlNOPJlCo91jhWNmkR8xhIShMzi8301vRH1mZl1qJ1tRgGY4YxOsb/j5VG7Bkd0UlEk2MMBDHvfQaSTRZUmlcWq8bhZ8kpF0xaTX/JVj2TIIBid1H3i4eX4WpcOQIClSg59SkaPiENVPjLm4vyEElWtLFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456462; c=relaxed/simple;
	bh=FJB5ysHSxLl04+JsVLF/D5egZ6HlUAx9WGel0yO+P0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i690vcjckoV8P+sk2oyc9ekPOY3ZFhevfSSAZCqBltX/PUP7qARxGS04R9u2qCiFaNQPB5i4AI9YggP1t05iEbUFzCABB5N8OQ2jlG9lSzgEVX0TdbhtootxbMKwn/xA1JaAv4qxC5ETRGe6J5w30r1of2ZdBL/X4a+lbjteHQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kb8kYO1N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kb8kYO1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6E5C4CEE4;
	Mon,  5 May 2025 14:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456462;
	bh=FJB5ysHSxLl04+JsVLF/D5egZ6HlUAx9WGel0yO+P0U=;
	h=From:To:Cc:Subject:Date:From;
	b=Kb8kYO1NVQ7rQZxeWdL/ln0N/3xlSP6KMAH51nwWYdQcAIYUTDtC86WSx1MxcXhsd
	 yJ8c8wOfE2Q6wcyiGo18UaGmZJkwm7UjAFcLBXIN9G2v7U88fr4NMmudRJvkrAYaIG
	 0iuqoyYtBq7CueImI64UW7Y3OqZzwcdGPfLTNfBXjuUZ+sE/Xa/uX5Z5XdrWriL9rV
	 jslBI3o0Qianx8k9LLYLtsyKBmIcvAOZxV85iT/hKyRlahbL6YFyOKugYWWmAfer6Y
	 FoxX9pyc07j3tYXqSku5UIk4rx1otcVBeDItqxpdFxNcrpfr+9CYvXKa/II3ulXSZV
	 XsXV8GDttn6Sg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert marvell,odmi-controller to DT schema
Date: Mon,  5 May 2025 09:47:26 -0500
Message-ID: <20250505144727.1290271-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell On-Die Message interrupt controller binding to
schema format.

Drop the 'interrupt-controller' property which isn't relevant for an MSI
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../marvell,odmi-controller.txt               | 42 ---------------
 .../marvell,odmi-controller.yaml              | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt
deleted file mode 100644
index 0ebfc952cb34..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-
-* Marvell ODMI for MSI support
-
-Some Marvell SoCs have an On-Die Message Interrupt (ODMI) controller
-which can be used by on-board peripheral for MSI interrupts.
-
-Required properties:
-
-- compatible           : The value here should contain:
-
-    "marvell,ap806-odmi-controller", "marvell,odmi-controller".
-
-- interrupt,controller : Identifies the node as an interrupt controller.
-
-- msi-controller       : Identifies the node as an MSI controller.
-
-- marvell,odmi-frames  : Number of ODMI frames available. Each frame
-                         provides a number of events.
-
-- reg                  : List of register definitions, one for each
-                         ODMI frame.
-
-- marvell,spi-base     : List of GIC base SPI interrupts, one for each
-                         ODMI frame. Those SPI interrupts are 0-based,
-                         i.e marvell,spi-base = <128> will use SPI #96.
-                         See Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
-                         for details about the GIC Device Tree binding.
-
-Example:
-
-	odmi: odmi@300000 {
-		compatible = "marvell,ap806-odmi-controller",
-			     "marvell,odmi-controller";
-		interrupt-controller;
-		msi-controller;
-		marvell,odmi-frames = <4>;
-		reg = <0x300000 0x4000>,
-		      <0x304000 0x4000>,
-		      <0x308000 0x4000>,
-		      <0x30C000 0x4000>;
-		marvell,spi-base = <128>, <136>, <144>, <152>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.yaml b/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.yaml
new file mode 100644
index 000000000000..9ec1ed4a5155
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/marvell,odmi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell ODMI controller
+
+maintainers:
+  - Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+description:
+  Some Marvell SoCs have an On-Die Message Interrupt (ODMI) controller which can
+  be used by on-board peripherals for MSI interrupts.
+
+properties:
+  compatible:
+    const: marvell,odmi-controller
+
+  reg:
+    description: List of register definitions, one for each ODMI frame.
+
+  msi-controller: true
+
+  marvell,odmi-frames:
+    description: Number of ODMI frames available. Each frame provides a number of events.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  marvell,spi-base:
+    description: >
+      List of GIC base SPI interrupts, one for each ODMI frame. Those SPI
+      interrupts are 0-based, i.e. marvell,spi-base = <128> will use SPI #96.
+      See Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+      for details.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+required:
+  - compatible
+  - reg
+  - msi-controller
+  - marvell,odmi-frames
+  - marvell,spi-base
+
+additionalProperties: false
+
+examples:
+  - |
+    msi-controller@300000 {
+        compatible = "marvell,odmi-controller";
+        msi-controller;
+        marvell,odmi-frames = <4>;
+        reg = <0x300000 0x4000>, <0x304000 0x4000>, <0x308000 0x4000>, <0x30C000 0x4000>;
+        marvell,spi-base = <128>, <136>, <144>, <152>;
+    };
-- 
2.47.2

