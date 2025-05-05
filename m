Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E602638A9;
	Mon,  5 May 2025 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456478; cv=none; b=XgGZrsqV7T3DewjBrysHaIK8Y4cSbn2KlEXRKyE9p58e2qtHqNkW5T/f+yiZV1rVY1WebmzKN0MNAcbCIl2BBDW1C51jCoLMGDYpQlAG80vqbModWt+s767HPZ/0tV9YsGh3QckXGdx531ZpAIQsBR1oBGK013rnEqShgUbWDsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456478; c=relaxed/simple;
	bh=t50fhT43Bfd8BmApJE0C1bDwCwK9ss1PApinceUQq3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R3MD12WyXXa6rxgqW1usOL2qjJ1SvxFpaMHD05qsjPlgEj0Fi+ACd/+02hngGg+4Ro/mJVylWn5IIlv/JvTd/kjfmxco0EgIYajMK8PgwQUfL3gJFUwcQWokf0k9+AWfARSswjSTVcVNQf7qsfRsmuhntZRkulZ45AWWWf3JMxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYyKI12R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYyKI12R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079EAC4CEEE;
	Mon,  5 May 2025 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456478;
	bh=t50fhT43Bfd8BmApJE0C1bDwCwK9ss1PApinceUQq3U=;
	h=From:To:Cc:Subject:Date:From;
	b=FYyKI12R2CSVcrH0SldWaOX+itbbwUmCF5nTpQe9DmhRKLK9v42kqmZH5AZSc8E+0
	 WTmFyGXyO4y8vHHphUTSG3w+M+7G3P9b9ZCDrhJToUZqTFeDogthrFiA4yoZRMMG6B
	 KAS1p8YrGrl981a85Nkz1YmsuQOjNxtsrJbJ3a5jYFd/JiDGriNKjiD2o2jaNIEOME
	 D6mC0fujcaj3VDlJRs9chqO7HFVGmSJrA1fuvIblCPQXi8O9J/gCZm7EZsoKD09s7z
	 r7AK4Pms1Tx+9I2X8fzTzWGulAu0fO3XIqa1fP4rvC3unAYlh9Gkqyr+62Cd4jx9Up
	 O9p9V+PY5ZNHw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Birsan <cristian.birsan@microchip.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert microchip,pic32mzda-evic to DT schema
Date: Mon,  5 May 2025 09:47:53 -0500
Message-ID: <20250505144754.1291072-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Microchip PIC32 interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../microchip,pic32-evic.txt                  | 67 -------------------
 .../microchip,pic32mzda-evic.yaml             | 60 +++++++++++++++++
 2 files changed, 60 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mzda-evic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt
deleted file mode 100644
index c3a1b37c4c35..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-Microchip PIC32 Interrupt Controller
-====================================
-
-The Microchip PIC32 contains an Enhanced Vectored Interrupt Controller (EVIC).
-It handles all internal and external interrupts. This controller exists outside
-of the CPU and is the arbitrator of all interrupts (including interrupts from
-the CPU itself) before they are presented to the CPU.
-
-External interrupts have a software configurable edge polarity. Non external
-interrupts have a type and polarity that is determined by the source of the
-interrupt.
-
-Required properties
--------------------
-
-- compatible: Should be "microchip,pic32mzda-evic"
-- reg: Specifies physical base address and size of register range.
-- interrupt-controller: Identifies the node as an interrupt controller.
-- #interrupt cells: Specifies the number of cells used to encode an interrupt
-  source connected to this controller. The value shall be 2 and interrupt
-  descriptor shall have the following format:
-
-	<hw_irq irq_type>
-
-  hw_irq - represents the hardware interrupt number as in the data sheet.
-  irq_type - is used to describe the type and polarity of an interrupt. For
-  internal interrupts use IRQ_TYPE_EDGE_RISING for non persistent interrupts and
-  IRQ_TYPE_LEVEL_HIGH for persistent interrupts. For external interrupts use
-  IRQ_TYPE_EDGE_RISING or IRQ_TYPE_EDGE_FALLING to select the desired polarity.
-
-Optional properties
--------------------
-- microchip,external-irqs: u32 array of external interrupts with software
-  polarity configuration. This array corresponds to the bits in the INTCON
-  SFR.
-
-Example
--------
-
-evic: interrupt-controller@1f810000 {
-	compatible = "microchip,pic32mzda-evic";
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	reg = <0x1f810000 0x1000>;
-	microchip,external-irqs = <3 8 13 18 23>;
-};
-
-Each device/peripheral must request its interrupt line with the associated type
-and polarity.
-
-Internal interrupt DTS snippet
-------------------------------
-
-device@1f800000 {
-	...
-	interrupts = <113 IRQ_TYPE_LEVEL_HIGH>;
-	...
-};
-
-External interrupt DTS snippet
-------------------------------
-
-device@1f800000 {
-	...
-	interrupts = <3 IRQ_TYPE_EDGE_RISING>;
-	...
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mzda-evic.yaml b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mzda-evic.yaml
new file mode 100644
index 000000000000..74bfc42693f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mzda-evic.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/microchip,pic32mzda-evic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32 EVIC Interrupt Controller
+
+maintainers:
+  - Cristian Birsan <cristian.birsan@microchip.com>
+
+description: >
+  The Microchip PIC32 contains an Enhanced Vectored Interrupt Controller (EVIC).
+  It handles all internal and external interrupts. This controller exists
+  outside of the CPU and is the arbitrator of all interrupts (including
+  interrupts from the CPU itself) before they are presented to the CPU.
+
+  External interrupts have a software configurable edge polarity. Non external
+  interrupts have a type and polarity that is determined by the source of the
+  interrupt.
+
+properties:
+  compatible:
+    items:
+      - const: microchip,pic32mzda-evic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  microchip,external-irqs:
+    description:
+      External interrupts with software polarity configuration corresponding to
+      the INTCON SFR bits.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
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
+      interrupt-controller@1f810000 {
+          compatible = "microchip,pic32mzda-evic";
+          reg = <0x1f810000 0x1000>;
+          interrupt-controller;
+          #interrupt-cells = <2>;
+          microchip,external-irqs = <3 8 13 18 23>;
+      };
-- 
2.47.2

