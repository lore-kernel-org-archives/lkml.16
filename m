Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67706265CAF;
	Mon,  5 May 2025 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456535; cv=none; b=O3zCXzW9fn1XoyC9KVc3VUbaUftvJ+ejYpucz471ISqkq5OwyGXh3k+TmeIRJ6SRGiqjPexPI40Q0jtTgw4XWfBbQVEBblrQqxayEgZyHoRXdnK7kmp34DxC9u3U/USuKgYV1bIaTYHlu53VzG/HSfr3DWV7Eb1hwxvPb1dbMzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456535; c=relaxed/simple;
	bh=T7UZFbjIpNpa2PCnI3E8CNiqBgdb1SekLgRMQ/lfCro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOpOj14JMlrQfZEhU01gXBBwk3ewgxrhLchBvyc4fItafvelZ6pXNaY1GgUAScNRPvoiEBJxAM/MvhCFiamRPsBDZWzxu+39Zw+hiuX74eWIZSv3QoER6MDGU33DVH2r2OkhifsUesilYUeva2fc3i7W4F4jBVEpvEcubjeKLdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbR0e0cY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbR0e0cY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD5BC4CEE4;
	Mon,  5 May 2025 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456534;
	bh=T7UZFbjIpNpa2PCnI3E8CNiqBgdb1SekLgRMQ/lfCro=;
	h=From:To:Cc:Subject:Date:From;
	b=DbR0e0cYDbTliA3WxegjtFxbyTwa/BzXijMZSZEz1D+VwPC78+ivTdHKUeRUFSyzD
	 DnNNWzhw+4ZNEAZxlmEYPlfE6no5dBCDE/5MgqUmULsw0GgE3eMWEVvJtSG9b/6cTn
	 fETH0j40Hl/Z2feoE4tugKcNN1nooYNbbLBQjsbzg4uiuvf/49VgiLYlG9yhvz1743
	 dUMYW6kHHC6Im8QVm8mxt7LJCS3sufMp7k7pXo/vWimkNjCFbKQxmXGYOjp0NCyU6C
	 MVlfaHO4ghvkk+LFWXxKPhalTdhUIRkSudH4xHGq86XqNFxSwb7qCsQRfEAXmcjf+4
	 +ji20YWa2qH9A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert st,spear3xx-shirq to DT schema
Date: Mon,  5 May 2025 09:48:50 -0500
Message-ID: <20250505144851.1293180-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the SPEAr3xx Shared interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../st,spear300-shirq.yaml                    | 67 +++++++++++++++++++
 .../st,spear3xx-shirq.txt                     | 44 ------------
 2 files changed, 67 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/st,spear300-shirq.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/st,spear3xx-shirq.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,spear300-shirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/st,spear300-shirq.yaml
new file mode 100644
index 000000000000..27d36173366a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/st,spear300-shirq.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/st,spear300-shirq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPEAr3xx Shared IRQ controller
+
+maintainers:
+  - Viresh Kumar <vireshk@kernel.org>
+  - Shiraz Hashim <shiraz.linux.kernel@gmail.com>
+
+description: |
+  SPEAr3xx architecture includes shared/multiplexed irqs for certain set of
+  devices. The multiplexor provides a single interrupt to parent interrupt
+  controller (VIC) on behalf of a group of devices.
+
+  There can be multiple groups available on SPEAr3xx variants but not exceeding
+  4. The number of devices in a group can differ, further they may share same
+  set of status/mask registers spanning across different bit masks. Also in some
+  cases the group may not have enable or other registers. This makes software
+  little complex.
+
+  A single node in the device tree is used to describe the shared interrupt
+  multiplexer (one node for all groups). A group in the interrupt controller
+  shares config/control registers with other groups. For example, a 32-bit
+  interrupt enable/disable config register can accommodate up to 4 interrupt
+  groups.
+
+properties:
+  compatible:
+    enum:
+      - st,spear300-shirq
+      - st,spear310-shirq
+      - st,spear320-shirq
+
+  reg:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    description: Interrupt specifier array for SHIRQ groups
+    minItems: 1
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - '#interrupt-cells'
+  - interrupt-controller
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@b3000000 {
+        compatible = "st,spear320-shirq";
+        reg = <0xb3000000 0x1000>;
+        interrupts = <28 29 30 1>;
+        #interrupt-cells = <1>;
+        interrupt-controller;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,spear3xx-shirq.txt b/Documentation/devicetree/bindings/interrupt-controller/st,spear3xx-shirq.txt
deleted file mode 100644
index a407c499b3cc..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/st,spear3xx-shirq.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-* SPEAr Shared IRQ layer (shirq)
-
-SPEAr3xx architecture includes shared/multiplexed irqs for certain set
-of devices. The multiplexor provides a single interrupt to parent
-interrupt controller (VIC) on behalf of a group of devices.
-
-There can be multiple groups available on SPEAr3xx variants but not
-exceeding 4. The number of devices in a group can differ, further they
-may share same set of status/mask registers spanning across different
-bit masks. Also in some cases the group may not have enable or other
-registers. This makes software little complex.
-
-A single node in the device tree is used to describe the shared
-interrupt multiplexor (one node for all groups). A group in the
-interrupt controller shares config/control registers with other groups.
-For example, a 32-bit interrupt enable/disable config register can
-accommodate up to 4 interrupt groups.
-
-Required properties:
-  - compatible: should be, either of
-     - "st,spear300-shirq"
-     - "st,spear310-shirq"
-     - "st,spear320-shirq"
-  - interrupt-controller: Identifies the node as an interrupt controller.
-  - #interrupt-cells: should be <1> which basically contains the offset
-    (starting from 0) of interrupts for all the groups.
-  - reg: Base address and size of shirq registers.
-  - interrupts: The list of interrupts generated by the groups which are
-    then connected to a parent interrupt controller. Each group is
-    associated with one of the interrupts, hence number of interrupts (to
-    parent) is equal to number of groups. The format of the interrupt
-    specifier depends in the interrupt parent controller.
-
-Example:
-
-The following is an example from the SPEAr320 SoC dtsi file.
-
-shirq: interrupt-controller@b3000000 {
-	compatible = "st,spear320-shirq";
-	reg = <0xb3000000 0x1000>;
-	interrupts = <28 29 30 1>;
-	#interrupt-cells = <1>;
-	interrupt-controller;
-};
-- 
2.47.2

