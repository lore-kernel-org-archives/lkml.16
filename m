Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CDF1DDA14;
	Mon,  5 May 2025 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456343; cv=none; b=SADdDKcMuwaSM+Vz/wvc8PWPZzibxoCBuRE2kluZ+wZR9G6pWEGSWp2ut4X20EciP5wMp2DyYxlyU7LCYqNMw75og8zhareE2pRb87Ecxfaro4LidLaWWH2j+zgdQ7C4EJhqlDUvuAa49RCjmdF4JfqfWF1lWqMFd5cGVEhk1ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456343; c=relaxed/simple;
	bh=nTjZ0sIEEzNWFnFw9GoOO2zCjbr9kWvhezjWb2fQsQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jnHbNnShZrHAqw0NSbvWsW5ZRJgyX0YheEyap65+K0Bb8tAzi0i6LBMk+tBdyVi0kL1o4HleVuT0Bn5dw7Sg1FJZnfw7QQq3iH6oVZfCxJ8dnGkM6YLW/XYk3783Ca5RQQ4YbSERPz+CwLxKrvSaMVIvM1YdtT+zdTFhKbTmo7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NggjGD2o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NggjGD2o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A810C4CEE4;
	Mon,  5 May 2025 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456342;
	bh=nTjZ0sIEEzNWFnFw9GoOO2zCjbr9kWvhezjWb2fQsQk=;
	h=From:To:Cc:Subject:Date:From;
	b=NggjGD2o1o55xvCB7Hqw3n/us8MD3VdSfiGCiRKnCOLxqC0F+zjX2ZGTnm2y9Cu+0
	 1HOBpSzFlmE+dZkdzGk2JKcdTbGtuV15SNxkaAV3UPZCAg1OJslLLaPY7lbrI97tCU
	 iY1hIo3r1VdUObWZE22+AkLkwMdJMTM9V6njgV6tBzVZMU2/hNK+DkF21e/D0XVFVQ
	 fEzmaJ0tdBdz8GOD4ltQkEZEYdcQI/43psCRxQ0ASzLRxQEOCAosu/c5n32LWGYT26
	 P8MGSTNgYv+sESF3KzyZozxYFDS0kYCq/a9TC8UuUzRS5rf0e6vbea9/+EK9obQr9L
	 xOjZM2H7zwXOg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Ruppert <christian.ruppert@abilis.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert abilis,tb10x-ictl to DT schema
Date: Mon,  5 May 2025 09:45:33 -0500
Message-ID: <20250505144534.1286092-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Abilis TB10x interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../abilis,tb10x-ictl.txt                     | 37 -------------
 .../abilis,tb10x-ictl.yaml                    | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.txt b/Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.txt
deleted file mode 100644
index 5a4dd263fc12..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-TB10x Top Level Interrupt Controller
-====================================
-
-The Abilis TB10x SOC contains a custom interrupt controller. It performs
-one-to-one mapping of external interrupt sources to CPU interrupts and
-provides support for reconfigurable trigger modes.
-
-Required properties
--------------------
-
-- compatible: Should be "abilis,tb10x-ictl"
-- reg: specifies physical base address and size of register range.
-- interrupt-congroller: Identifies the node as an interrupt controller.
-- #interrupt cells: Specifies the number of cells used to encode an interrupt
-  source connected to this controller. The value shall be 2.
-- interrupts: Specifies the list of interrupt lines which are handled by
-  the interrupt controller in the parent controller's notation. Interrupts
-  are mapped one-to-one to parent interrupts.
-
-Example
--------
-
-intc: interrupt-controller {	/* Parent interrupt controller */
-	interrupt-controller;
-	#interrupt-cells = <1>;	/* For example below */
-	/* ... */
-};
-
-tb10x_ictl: pic@2000 {		/* TB10x interrupt controller */
-	compatible = "abilis,tb10x-ictl";
-	reg = <0x2000 0x20>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	interrupt-parent = <&intc>;
-	interrupts = <5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
-			20 21 22 23 24 25 26 27 28 29 30 31>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.yaml b/Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.yaml
new file mode 100644
index 000000000000..cd2c49670e7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/abilis,tb10x-ictl.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/abilis,tb10x-ictl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TB10x Top Level Interrupt Controller
+
+maintainers:
+  - Christian Ruppert <christian.ruppert@abilis.com>
+
+description:
+  The Abilis TB10x SOC contains a custom interrupt controller. It performs
+  one-to-one mapping of external interrupt sources to CPU interrupts and
+  provides support for reconfigurable trigger modes.
+
+properties:
+  compatible:
+    const: abilis,tb10x-ictl
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
+    description: A one-to-one mapping of external interrupt sources to parent
+      interrupts.
+    minItems: 1
+    maxItems: 32
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
+    interrupt-controller@2000 {
+        compatible = "abilis,tb10x-ictl";
+        reg = <0x2000 0x20>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <5>, <6>, <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>,
+                     <15>, <16>, <17>, <18>, <19>, <20>, <21>, <22>, <23>,
+                     <24>, <25>, <26>, <27>, <28>, <29>, <30>, <31>;
+    };
-- 
2.47.2

