Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D3204C0F;
	Mon,  5 May 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456352; cv=none; b=GdGGr4eO9NXXRY8sVZdrh+RUY7IJ9El1cNEkYv+hPmuMyq0rPaf3lSIyVQ7+C5k1ueWf51Qec8n4FSQgcWf0RkPneiTdd9Kg1kcCh324EzubTCBoIahtmsbG6jA/eqsoyreb87B72nzD+EnFpPHxuzoyumKo0JGYm2qkgU+zN0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456352; c=relaxed/simple;
	bh=T1FJDi2DwH9H96N0PLwVZFYHPpsXpJ6b69y9dVYu0+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jzg2kfAAnVExZ/wXnbO0WFam52BGNz+ZJv4K3MMxrIN0s+qMYq0hfwQkzWcqsc64edeCFQAH7hz+ik62y+FwDjqq4ge1wLt+0eLsR76+yL7u+UqcaeInOqHT41XFOALcFGvahJOKEcX7w8Wi5WIjc3RJlvysCrk00BoUQPeP8bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pBSlFEDp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pBSlFEDp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C82C4CEF0;
	Mon,  5 May 2025 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456352;
	bh=T1FJDi2DwH9H96N0PLwVZFYHPpsXpJ6b69y9dVYu0+g=;
	h=From:To:Cc:Subject:Date:From;
	b=pBSlFEDpXWQgC0uRBt4ZGWo8Rs9LKjcOEZmYY/LFk10oGR2JNF115fMXICKofJW6v
	 ypV+3oW1AiO5moOOxrLkR+eRKhPhq8vy8iwU0vFkciih9HmfrZpaVSzhpO34gpZ8xE
	 RHMbuS3paYsCy99oEtvyoCPWjV2m7+a6CewRr2gOFOQkCACzGfmHh0WlfD32gtaASp
	 xDk3po9ArQtlGfKTsDQiAdBc7fsCj3xVVk3sVRA2Z4HvIlvtft+kNIfSfWwjM4JDO9
	 Fz0qKjE3YZ6J/xNkE5h8ac/46CEqTE6QYLb6RflfaJCrw6y6eZIg5V2Y1Kq+6S/aGS
	 2bpcd7uViVSkg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Talel Shenhar <talel@amazon.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert amazon,al-fic to DT schema
Date: Mon,  5 May 2025 09:45:47 -0500
Message-ID: <20250505144548.1286525-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Amazon FIC interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/amazon,al-fic.txt    | 27 -----------
 .../interrupt-controller/amazon,al-fic.yaml   | 46 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 47 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
deleted file mode 100644
index c676b03c752e..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Amazon's Annapurna Labs Fabric Interrupt Controller
-
-Required properties:
-
-- compatible: should be "amazon,al-fic"
-- reg: physical base address and size of the registers
-- interrupt-controller: identifies the node as an interrupt controller
-- #interrupt-cells : must be 2. Specifies the number of cells needed to encode
-  an interrupt source. Supported trigger types are low-to-high edge
-  triggered and active high level-sensitive.
-- interrupts: describes which input line in the interrupt parent, this
-  fic's output is connected to. This field property depends on the parent's
-  binding
-
-Please refer to interrupts.txt in this directory for details of the common
-Interrupt Controllers bindings used by client devices.
-
-Example:
-
-amazon_fic: interrupt-controller@fd8a8500 {
-	compatible = "amazon,al-fic";
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	reg = <0x0 0xfd8a8500 0x0 0x1000>;
-	interrupt-parent = <&gic>;
-	interrupts = <GIC_SPI 0x0 IRQ_TYPE_LEVEL_HIGH>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml
new file mode 100644
index 000000000000..26bc05dee0bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/amazon,al-fic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amazon Annapurna Labs Fabric Interrupt Controller
+
+maintainers:
+  - Talel Shenhar <talel@amazon.com>
+
+properties:
+  compatible:
+    const: amazon,al-fic
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
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller@fd8a8500 {
+        compatible = "amazon,al-fic";
+        reg = <0xfd8a8500 0x1000>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 0x0 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..27b9c62f94bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -940,7 +940,7 @@ F:	include/linux/altera_uart.h
 AMAZON ANNAPURNA LABS FIC DRIVER
 M:	Talel Shenhar <talel@amazon.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml
 F:	drivers/irqchip/irq-al-fic.c
 
 AMAZON ANNAPURNA LABS MEMORY CONTROLLER EDAC
-- 
2.47.2

