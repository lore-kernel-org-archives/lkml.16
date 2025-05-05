Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FED262FFE;
	Mon,  5 May 2025 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456385; cv=none; b=PiVaicdADHydCKElfVIuJJ7em8zSY2UGWPo3fbSbAV7JuecDVSb1G7qG4DpYI1WytSKQQZfvf62Hv/WtKtFS+aDWqqGuWU/BVRBpZqqq/0yagyfy/sE1eci5TMaci7Q17YdwzPy/IJadHTcQiZUChZ4Kw7n2ufZ8AZIX2zs70nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456385; c=relaxed/simple;
	bh=hUiSXGaS3zubKr4MGUM21JoSXF0VCi2rUwvC1j7tvgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xdbii3gCZlNpKYeLr9gMHz6AWPuNmu6h5twDUlSxPElpyFpKYiDfty96L5eX1ArQffJHJ73aukcv7lmvJu1YkcGxUGaVrsjG/rSwfZGWhKOsQArub5bx8x0iB7I27KpdrsVGGR9icKC+0QhydXN/+4XgY9urCY+SLZSQ/rF1SAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Req2rHen; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Req2rHen"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7997C4CEE4;
	Mon,  5 May 2025 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456385;
	bh=hUiSXGaS3zubKr4MGUM21JoSXF0VCi2rUwvC1j7tvgo=;
	h=From:To:Cc:Subject:Date:From;
	b=Req2rHen4078ppHlLz0AtIZTCjdqGLRjh17y+4UWYBsgBOHjrPjWjSJlyTzbHtn35
	 WysKzLkFlBFOTd00HcygeU+7HY6fwvVRE+UXUgzuqGbhi8/mh8g61sYFt9ZKCRg1S1
	 JPqZgt5N5MiRios44HaLAlSe8UGzxGdmFP6G1dqbFfOyAZf4z/a0MpWI4m0AG6vX9A
	 r8y63ijdHgLLV+tDZv2nKIBhLWyD+9hr5NnQwW3lXGVSeYTMAboJDAL+YJ9t2fh2fj
	 M1mvrXRYtI5scniAOR8YjkmCBg8BnJys6HVqt9sLP8z8lQko3KSzgkxc3m20OxL+ev
	 EO1Y/uWoGXdKA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Arlott <simon@octiron.net>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert brcm,bcm6345-l1-intc to DT schema
Date: Mon,  5 May 2025 09:46:21 -0500
Message-ID: <20250505144622.1287712-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Broadcom BCM6345 interrupt controller binding to schema
format.

The old schema indicated SoC specific compatibles should be present, but
there are none in use. So drop them.

The most number of CPUs on any platform seems to be 2, so document that
as the maximum.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../brcm,bcm6345-l1-intc.txt                  | 55 -------------
 .../brcm,bcm6345-l1-intc.yaml                 | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.txt
deleted file mode 100644
index 2bc19b1ac877..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Broadcom BCM6345-style Level 1 interrupt controller
-
-This block is a first level interrupt controller that is typically connected
-directly to one of the HW INT lines on each CPU.
-
-Key elements of the hardware design include:
-
-- 32, 64 or 128 incoming level IRQ lines
-
-- Most onchip peripherals are wired directly to an L1 input
-
-- A separate instance of the register set for each CPU, allowing individual
-  peripheral IRQs to be routed to any CPU
-
-- Contains one or more enable/status word pairs per CPU
-
-- No atomic set/clear operations
-
-- No polarity/level/edge settings
-
-- No FIFO or priority encoder logic; software is expected to read all
-  2-4 status words to determine which IRQs are pending
-
-Required properties:
-
-- compatible: should be "brcm,bcm<soc>-l1-intc", "brcm,bcm6345-l1-intc"
-- reg: specifies the base physical address and size of the registers;
-  the number of supported IRQs is inferred from the size argument
-- interrupt-controller: identifies the node as an interrupt controller
-- #interrupt-cells: specifies the number of cells needed to encode an interrupt
-  source, should be 1.
-- interrupts: specifies the interrupt line(s) in the interrupt-parent controller
-  node; valid values depend on the type of parent interrupt controller
-
-If multiple reg ranges and interrupt-parent entries are present on an SMP
-system, the driver will allow IRQ SMP affinity to be set up through the
-/proc/irq/ interface.  In the simplest possible configuration, only one
-reg range and one interrupt-parent is needed.
-
-The driver operates in native CPU endian by default, there is no support for
-specifying an alternative endianness.
-
-Example:
-
-periph_intc: interrupt-controller@10000000 {
-        compatible = "brcm,bcm63168-l1-intc", "brcm,bcm6345-l1-intc";
-        reg = <0x10000020 0x20>,
-              <0x10000040 0x20>;
-
-        interrupt-controller;
-        #interrupt-cells = <1>;
-
-        interrupt-parent = <&cpu_intc>;
-        interrupts = <2>, <3>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.yaml
new file mode 100644
index 000000000000..ca6a2ff43acd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm6345-l1-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6345-style Level 1 interrupt controller
+
+maintainers:
+  - Simon Arlott <simon@octiron.net>
+
+description: >
+  This block is a first level interrupt controller that is typically connected
+  directly to one of the HW INT lines on each CPU.
+
+  Key elements of the hardware design include:
+
+    - 32, 64 or 128 incoming level IRQ lines
+
+    - Most onchip peripherals are wired directly to an L1 input
+
+    - A separate instance of the register set for each CPU, allowing individual
+      peripheral IRQs to be routed to any CPU
+
+    - Contains one or more enable/status word pairs per CPU
+
+    - No atomic set/clear operations
+
+    - No polarity/level/edge settings
+
+    - No FIFO or priority encoder logic; software is expected to read all
+      2-4 status words to determine which IRQs are pending
+
+  If multiple reg ranges and interrupt-parent entries are present on an SMP
+  system, the driver will allow IRQ SMP affinity to be set up through the
+  /proc/irq/ interface.  In the simplest possible configuration, only one
+  reg range and one interrupt-parent is needed.
+
+  The driver operates in native CPU endian by default, there is no support for
+  specifying an alternative endianness.
+
+properties:
+  compatible:
+    const: brcm,bcm6345-l1-intc
+
+  reg:
+    description: One entry per CPU core
+    minItems: 1
+    maxItems: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupts:
+    description: One entry per CPU core
+    minItems: 1
+    maxItems: 2
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
+    interrupt-controller@10000000 {
+        compatible = "brcm,bcm6345-l1-intc";
+        reg = <0x10000020 0x20>,
+              <0x10000040 0x20>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interrupts = <2>, <3>;
+    };
-- 
2.47.2

