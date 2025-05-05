Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1D2517AB;
	Mon,  5 May 2025 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456446; cv=none; b=nWYue4lltR4FD9miCufQ2baG7RIhOwzpUnCamQqtd9txR3EdK/W3ezH2wCorKhfOmdoznsLuAG1b/IcjJ7o97ah1Jky3GjteI7EotBdSp0knPE2i6p2LkgM3qHyzsSFKTxTLcUPUTkLEu67PEqbEQDzdKYrT/Nm4yc3liaePGO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456446; c=relaxed/simple;
	bh=9RNhJjFMGaTNC2nfrgfThFJH9VHsHkGsDk6M5Aup594=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bwdv/6J325UmKGXXSRTwg0p7XqrjbDhQKKbCf20Lw5/sulTi/OLBSp7dpXCGZLhh8A7kWiO7olB0w5zDc04BJUQ1TVzHrmPOyjALiz8flB4ZKLeorE+6BGF8MoclSU2EOIl/OrHDvMcUd6/RxDYIyupwxPbHArciFfRKGrqC8BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1ApsbiF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1ApsbiF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30552C4CEEE;
	Mon,  5 May 2025 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456446;
	bh=9RNhJjFMGaTNC2nfrgfThFJH9VHsHkGsDk6M5Aup594=;
	h=From:To:Cc:Subject:Date:From;
	b=n1ApsbiFRYVliLk3Rth8p5oyYZFJDKoUj5nfKKHULmttn+8F4kLp6Gjf7dzgxlK/9
	 sQ163KgsXLm5lxzsAGgB6EzwhIhS1jRkpvaB4441RN4Nh0U2lCB2LHxgMNPShRi64P
	 8yDuQGV1ZRVKo4VPJtZszwW1vkHUGIn1Ck60xhswzyLFLoEXqhUmb8C0d6IXVigaQZ
	 waYwXTSgiRnbkQQMFgIYdpBf48sc4bc/s9M2IfaPSYTSz0Oe94P8Ra76/o5nlz98+1
	 EB+KrOJ5sbpa7Smdx4cXXkGQPo4TnN/nrTfWSCoeHYAI1O5+VsazQ7UYO6kckeHeWf
	 fW4ET2U1EX5kA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert marvell,ap806-gicp to DT schema
Date: Mon,  5 May 2025 09:47:20 -0500
Message-ID: <20250505144721.1290068-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell GICP MSI controller binding to schema format. It's a
straight-forward conversion of the typical MSI controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../marvell,ap806-gicp.yaml                   | 50 +++++++++++++++++++
 .../interrupt-controller/marvell,gicp.txt     | 27 ----------
 2 files changed, 50 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,ap806-gicp.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,ap806-gicp.yaml b/Documentation/devicetree/bindings/interrupt-controller/marvell,ap806-gicp.yaml
new file mode 100644
index 000000000000..5faedd95b9a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,ap806-gicp.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/marvell,ap806-gicp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell GICP Controller
+
+maintainers:
+  - Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+
+description:
+  GICP is a Marvell extension of the GIC that allows to trigger GIC SPI
+  interrupts by doing a memory transaction. It is used by the ICU
+  located in the Marvell CP110 to turn wired interrupts inside the CP
+  into GIC SPI interrupts.
+
+properties:
+  compatible:
+    const: marvell,ap806-gicp
+
+  reg:
+    maxItems: 1
+
+  marvell,spi-ranges:
+    description: Tuples of GIC SPI interrupt ranges available for this GICP
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: SPI interrupt base
+        - description: Number of interrupts in the range
+
+  msi-controller: true
+
+required:
+  - compatible
+  - reg
+  - msi-controller
+  - marvell,spi-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    msi-controller@3f0040 {
+        compatible = "marvell,ap806-gicp";
+        reg = <0x3f0040 0x10>;
+        marvell,spi-ranges = <64 64>, <288 64>;
+        msi-controller;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
deleted file mode 100644
index 64a00ceb7da4..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Marvell GICP Controller
------------------------
-
-GICP is a Marvell extension of the GIC that allows to trigger GIC SPI
-interrupts by doing a memory transaction. It is used by the ICU
-located in the Marvell CP110 to turn wired interrupts inside the CP
-into GIC SPI interrupts.
-
-Required properties:
-
-- compatible: Must be "marvell,ap806-gicp"
-
-- reg: Must be the address and size of the GICP SPI registers
-
-- marvell,spi-ranges: tuples of GIC SPI interrupts ranges available
-  for this GICP
-
-- msi-controller: indicates that this is an MSI controller
-
-Example:
-
-gicp_spi: gicp-spi@3f0040 {
-	compatible = "marvell,ap806-gicp";
-	reg = <0x3f0040 0x10>;
-	marvell,spi-ranges = <64 64>, <288 64>;
-	msi-controller;
-};
-- 
2.47.2

