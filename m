Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28D25DD12;
	Mon,  5 May 2025 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456422; cv=none; b=heiApXMzIvQMtEjmubklhzpgeAjEnbosE1OOJeXECGPEX2TLptI/sMeNicyHw9x1sJTErHO09Hdsl6zRu3AXUCz6ETpiEHOqMPAcnKc3e1e8A9g3U/O1SMw9hpHad3q+5oFm2bDal74rrb5qU5XUabhWLh8V6hdf03hza1uOaw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456422; c=relaxed/simple;
	bh=sCRHeskU9O4xvSjm7D7JJecKm6Ba1vuI/R6tX3Lcw6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHyZv8vn8ndokX3rH4zXIQKJcTjWyHkniN9arOXrytQkBqYJwlLw+j9rHrBQonmjO7Uqve124FN5VTEwEju3OxSvAREk6tPcAhdC0rHAmWEaVXXGks+ap58xJEMUP1exux4i+yBuXSXaEEPiWVN2tubsqR/+bdHMVy5W3ZbYDA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThpBgDVD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThpBgDVD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46894C4CEE4;
	Mon,  5 May 2025 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456421;
	bh=sCRHeskU9O4xvSjm7D7JJecKm6Ba1vuI/R6tX3Lcw6g=;
	h=From:To:Cc:Subject:Date:From;
	b=ThpBgDVDht7Exl3FKn7f5ajSAg3JSneFCUjpEnNbx0s/90wexy+xBFCV0xHgaGKTS
	 P0yPCAF+JQEccAL9YXfWaBKl+tt+GNpuxGr8aCwNUmgzMvIkReCtNymsfDOgoBm8ab
	 U1C/1o4+N2l8TeAmFpoLAOeQymYq5X2AMc79RMdLwBEXE9f/ZXxKNkAgVcY/mq9DUX
	 gwBp5t0ol/3yN35flcyF53xkXC/vIPocO4oA+1ZR2kWQz+1fAFcH+dAxLXYmQ25k/X
	 PorR4c2ZFsggzcYgQT+wlFvGdrXNPxMmxU0dyAvelT1ZfyuPm4aFgUFWv2TNAScfCF
	 JFcQCjIldZO4g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miodrag Dinic <miodrag.dinic@mips.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert google,goldfish-pic to DT schema
Date: Mon,  5 May 2025 09:46:57 -0500
Message-ID: <20250505144658.1289158-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Google Goldfish PIC interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../google,goldfish-pic.txt                   | 30 ------------
 .../google,goldfish-pic.yaml                  | 47 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 48 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
deleted file mode 100644
index 35f752706e7d..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Android Goldfish PIC
-
-Android Goldfish programmable interrupt device used by Android
-emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-pic"
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example for mips when used in cascade mode:
-
-        cpuintc {
-                #interrupt-cells = <0x1>;
-                #address-cells = <0>;
-                interrupt-controller;
-                compatible = "mti,cpu-interrupt-controller";
-        };
-
-        interrupt-controller@1f000000 {
-                compatible = "google,goldfish-pic";
-                reg = <0x1f000000 0x1000>;
-
-                interrupt-controller;
-                #interrupt-cells = <0x1>;
-
-                interrupt-parent = <&cpuintc>;
-                interrupts = <0x2>;
-        };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.yaml
new file mode 100644
index 000000000000..ac3c3c3ca186
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/google,goldfish-pic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish PIC
+
+maintainers:
+  - Miodrag Dinic <miodrag.dinic@mips.com>
+
+description:
+  Android Goldfish programmable interrupt device used by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-pic
+
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+
+examples:
+  - |
+    interrupt-controller@1f000000 {
+        compatible = "google,goldfish-pic";
+        reg = <0x1f000000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupts = <2>;
+    };
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index a792c5495d15..cf5d0b25e94b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1694,7 +1694,7 @@ F:	drivers/android/
 ANDROID GOLDFISH PIC DRIVER
 M:	Miodrag Dinic <miodrag.dinic@mips.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.yaml
 F:	drivers/irqchip/irq-goldfish-pic.c
 
 ANDROID GOLDFISH RTC DRIVER
-- 
2.47.2

