Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB1C262FCB;
	Mon,  5 May 2025 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456473; cv=none; b=OgebxeUh9LplX8Jq89l5M5YD+PCk0vPyzGZ5XRwEsdnu6XIqViHvQrpyq4tuuqnBK2MruzDUAcQj9JoC6F9beXCF9kbRKY9WO3UtqTOabUacht4FvBfwfjboON5dGY1YwyC1LT/hKxmxJwPYzXtyZN0yUh5J745xcl/IHqJiDkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456473; c=relaxed/simple;
	bh=UNFNbP2gnsTFjdeH8i/cb+RVTy/dKyv+yCt7G6uYIt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RYUGeS2jawq6Z3pvSHbbsfwmn4Sak7ScAjFfSPl11hetULseigv66+joib3TY3bCpBg6M1orGtkHaTkSY4OUQv9Q413ipzq/q3dtU3jL6WiWXgpo6/v+vV7s8gszFNBKPR8xjLPRVQpSgfbhUso6K5qXao1cIlqv7h+/lwCPyrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iigFV+hw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iigFV+hw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6FCC4CEEE;
	Mon,  5 May 2025 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456473;
	bh=UNFNbP2gnsTFjdeH8i/cb+RVTy/dKyv+yCt7G6uYIt0=;
	h=From:To:Cc:Subject:Date:From;
	b=iigFV+hwPCPaNnsA7d8c6jpmDTGjRL6WNK0wAcToAIXbli6xHZsyd9WMs8xJGF817
	 bH6mI9Sfir4MWkngCpsOh/YF65CRvavoktHl77Iif0S60R03UHjq5WNR5ZOb/bwCR1
	 o8Ql3WLIgEpGpmIDoShTVuXDbI3bd69rL+T6vaJBkz6jLULc8byVZCd2FZeYsEifaY
	 RypACjY3DZ4ZyQZ8wUvgXW/XPhjseVf8gi1crfHR1uszW3qJm8sXO/lN3U2ims4WoT
	 7vhrbX9y1ELbOo7oZzzHcIt4Y/c6gQNtCBqzPtcuvnsMo6++/i8Z4Qu6ptPLRli2do
	 GHy22dDiLoIJA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert marvell,ap806-sei to DT schema
Date: Mon,  5 May 2025 09:47:48 -0500
Message-ID: <20250505144749.1290862-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell SEI interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../marvell,ap806-sei.yaml                    | 58 +++++++++++++++++++
 .../interrupt-controller/marvell,sei.txt      | 36 ------------
 2 files changed, 58 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,ap806-sei.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,ap806-sei.yaml b/Documentation/devicetree/bindings/interrupt-controller/marvell,ap806-sei.yaml
new file mode 100644
index 000000000000..e812f9a86307
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,ap806-sei.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/marvell,ap806-sei.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell SEI (System Error Interrupt) Controller
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+description: >
+  Marvell SEI (System Error Interrupt) controller is an interrupt aggregator. It
+  receives interrupts from several sources and aggregates them to a single
+  interrupt line (an SPI) on the parent interrupt controller.
+
+  This interrupt controller can handle up to 64 SEIs, a set comes from the AP
+  and is wired while a second set comes from the CPs by the mean of MSIs.
+
+properties:
+  compatible:
+    const: marvell,ap806-sei
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller: true
+
+  msi-controller: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-controller
+  - msi-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller@3f0200 {
+        compatible = "marvell,ap806-sei";
+        reg = <0x3f0200 0x40>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+        #interrupt-cells = <1>;
+        interrupt-controller;
+        msi-controller;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt
deleted file mode 100644
index 0beafed502f5..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/marvell,sei.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Marvell SEI (System Error Interrupt) Controller
------------------------------------------------
-
-Marvell SEI (System Error Interrupt) controller is an interrupt
-aggregator. It receives interrupts from several sources and aggregates
-them to a single interrupt line (an SPI) on the parent interrupt
-controller.
-
-This interrupt controller can handle up to 64 SEIs, a set comes from the
-AP and is wired while a second set comes from the CPs by the mean of
-MSIs.
-
-Required properties:
-
-- compatible: should be one of:
-              * "marvell,ap806-sei"
-- reg: SEI registers location and length.
-- interrupts: identifies the parent IRQ that will be triggered.
-- #interrupt-cells: number of cells to define an SEI wired interrupt
-                    coming from the AP, should be 1. The cell is the IRQ
-                    number.
-- interrupt-controller: identifies the node as an interrupt controller
-                        for AP interrupts.
-- msi-controller: identifies the node as an MSI controller for the CPs
-                  interrupts.
-
-Example:
-
-        sei: interrupt-controller@3f0200 {
-                compatible = "marvell,ap806-sei";
-                reg = <0x3f0200 0x40>;
-                interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-                #interrupt-cells = <1>;
-                interrupt-controller;
-                msi-controller;
-        };
-- 
2.47.2

