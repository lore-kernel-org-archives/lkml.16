Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2572505A6;
	Thu, 17 Apr 2025 14:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899680; cv=none; b=rhiPPrmng3oPMO9Z6EQFOP7WKvVeZk/rJZ3L6k+C3fLZopq0/IwWXcJSAf1GeiVgblZJ9GenfPF+kX64V8ClF4H4u1T4a1mrKyKLbcVa7439I/qPhDIN0M1xPoHLZqkmk3o6ufmmIv7V07UpgC3M8Hv8GVJHK6AR2juR0oabWKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899680; c=relaxed/simple;
	bh=QpPsC8T0JZuelBW5cDn8QrMJ9RtXSAtuNxVSGRHgdSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DwbADedBp+VZSmd9Ugqx9TrpCnnQ8DKZvxBVtGaz4pabFc4WJ9CvsdLkgKuVYc0hV0JRmgzD7GFQNAO9Ev6FltmXNbJy7T5RzyuWktWMw/cmZVy8aUuwsTb3P162KZmHyVr41Muf4ux02Z3zHm/dpMQkSksyMXEAGNUJQvg1zOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rH5vF7Ix; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rH5vF7Ix"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29CB3C4CEE4;
	Thu, 17 Apr 2025 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744899676;
	bh=QpPsC8T0JZuelBW5cDn8QrMJ9RtXSAtuNxVSGRHgdSY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=rH5vF7IxaQxt7Vhl/NGfPve4cE1hPhw/UMylGqO5gLzhkXeUaGS+mab6BLQjDmFYY
	 t75ti+tuFD2bBPEAB0PnxpoTK6L2q3EcRoBGM3odK/UInyFnD/M3WAOu/qo6Og1wtf
	 2fc+NTvUyUyHeDaxXe5bkMcuJgozoGlHphpBnUM2l9mFpVwwmGNuRoiIabiY+AtJgM
	 hBQ+q3FKoHvxeDyhW7cWfYFTk/cAp5VOh10+GBRaX9qiI8bGXRHFo4qeJ9i9uAY/gr
	 ywHB5JtwV33ZQHvc0g6/fd4s8IkVkq3+xw5RO2yj45n3brWoIdDssivzqqFwxRDlQM
	 SFpPZPdzOXOCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2073BC369C2;
	Thu, 17 Apr 2025 14:21:16 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 17 Apr 2025 16:21:14 +0200
Subject: [PATCH v3] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250417-fslpmc-yaml-v3-1-b3eccd389176@posteo.net>
X-B4-Tracking: v=1; b=H4sIAFkOAWgC/1WMwQqDMBAFf0X23JRkNdb01P8oPcS41oAaSSRUx
 H9vtIci7zQPZlYI5C0FuGcreIo2WDcmyC8ZmE6Pb2K2SQzIUXLEkrWhnwbDFj30TPHGlKqtbw1
 qSMbkqbWfo/Z8Je5smJ1fjngU+/vr5EKeOlGwNF7rXBa6kgYfkwszuetIM+yhiH+5EHiWMcmqM
 lwVlUaF4iRv2/YFwKU0SOQAAAA=
X-Change-ID: 20250226-fslpmc-yaml-90dc69fb7d2a
To: Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744899675; l=9529;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=bW43HEpOEpNYn4tTSUfgDCb0hz+VsjYccuCsnUP7S4E=;
 b=e3b7ZbB1tUs08gQNlDgkQ77uMl439G6Dh0v/xgO28/jOOwNCpeTRZxLj8QvGxt1obxUsTwKrU
 7ry8dzvcWb1CJYxXBBirrD40fcWhUnw4yjO2PFppoKJ3skf8FC8LWNN
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

This patch rewrites pmc.txt into YAML format. Descriptive texts are
expanded or shortened in a few places to better fit today's conventions.

The list of compatible strings (and combinations of them) is based on
existing device trees in arch/powerpc as well as compatible strings
already mentioned in the plain-text version of the binding.

One thing I didn't handle are soc-clk@... nodes as seen in
arch/powerpc/boot/dts/fsl/pq3-power.dtsi. They are also ignored
by Linux drivers.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v3:
- Combine two compatible strings into one "enum"
- Remove sleep consumer (sata@19000) from example
- Fix reference to example for soc-clk@... nodes, and explain why they
  are not modeled
- Link to v2: https://lore.kernel.org/r/20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net

Changes in v2:
- Rebase on v6.15-rc1
- Link to v1: https://lore.kernel.org/r/20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net
---
 .../devicetree/bindings/powerpc/fsl/pmc.txt        |  63 ---------
 .../devicetree/bindings/powerpc/fsl/pmc.yaml       | 152 +++++++++++++++++++++
 2 files changed, 152 insertions(+), 63 deletions(-)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/pmc.txt b/Documentation/devicetree/bindings/powerpc/fsl/pmc.txt
deleted file mode 100644
index 07256b7ffcaab2ba57b33cf279df45d830ce33b3..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/powerpc/fsl/pmc.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-* Power Management Controller
-
-Properties:
-- compatible: "fsl,<chip>-pmc".
-
-  "fsl,mpc8349-pmc" should be listed for any chip whose PMC is
-  compatible.  "fsl,mpc8313-pmc" should also be listed for any chip
-  whose PMC is compatible, and implies deep-sleep capability.
-
-  "fsl,mpc8548-pmc" should be listed for any chip whose PMC is
-  compatible.  "fsl,mpc8536-pmc" should also be listed for any chip
-  whose PMC is compatible, and implies deep-sleep capability.
-
-  "fsl,mpc8641d-pmc" should be listed for any chip whose PMC is
-  compatible; all statements below that apply to "fsl,mpc8548-pmc" also
-  apply to "fsl,mpc8641d-pmc".
-
-  Compatibility does not include bit assignments in SCCR/PMCDR/DEVDISR; these
-  bit assignments are indicated via the sleep specifier in each device's
-  sleep property.
-
-- reg: For devices compatible with "fsl,mpc8349-pmc", the first resource
-  is the PMC block, and the second resource is the Clock Configuration
-  block.
-
-  For devices compatible with "fsl,mpc8548-pmc", the first resource
-  is a 32-byte block beginning with DEVDISR.
-
-- interrupts: For "fsl,mpc8349-pmc"-compatible devices, the first
-  resource is the PMC block interrupt.
-
-- fsl,mpc8313-wakeup-timer: For "fsl,mpc8313-pmc"-compatible devices,
-  this is a phandle to an "fsl,gtm" node on which timer 4 can be used as
-  a wakeup source from deep sleep.
-
-Sleep specifiers:
-
-  fsl,mpc8349-pmc: Sleep specifiers consist of one cell.  For each bit
-  that is set in the cell, the corresponding bit in SCCR will be saved
-  and cleared on suspend, and restored on resume.  This sleep controller
-  supports disabling and resuming devices at any time.
-
-  fsl,mpc8536-pmc: Sleep specifiers consist of three cells, the third of
-  which will be ORed into PMCDR upon suspend, and cleared from PMCDR
-  upon resume.  The first two cells are as described for fsl,mpc8578-pmc.
-  This sleep controller only supports disabling devices during system
-  sleep, or permanently.
-
-  fsl,mpc8548-pmc: Sleep specifiers consist of one or two cells, the
-  first of which will be ORed into DEVDISR (and the second into
-  DEVDISR2, if present -- this cell should be zero or absent if the
-  hardware does not have DEVDISR2) upon a request for permanent device
-  disabling.  This sleep controller does not support configuring devices
-  to disable during system sleep (unless supported by another compatible
-  match), or dynamically.
-
-Example:
-
-	power@b00 {
-		compatible = "fsl,mpc8313-pmc", "fsl,mpc8349-pmc";
-		reg = <0xb00 0x100 0xa00 0x100>;
-		interrupts = <80 8>;
-	};
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml b/Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..276ece7f01dbafe0accbb9d884f5611e75193ca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Power Management Controller
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+description: |
+  The Power Management Controller in several MPC8xxx SoCs helps save power by
+  controlling chip-wide low-power states as well as peripheral clock gating.
+
+  Sleep of peripheral devices is configured by the `sleep` property, for
+  example `sleep = <&pmc 0x00000030>`. Any cells after the &pmc phandle are
+  called a sleep specifier.
+
+  For "fsl,mpc8349-pmc", sleep specifiers consist of one cell.  For each bit that
+  is set in the cell, the corresponding bit in SCCR will be saved and cleared
+  on suspend, and restored on resume.  This sleep controller supports disabling
+  and resuming devices at any time.
+
+  For "fsl,mpc8536-pmc", sleep specifiers consist of three cells, the third of
+  which will be ORed into PMCDR upon suspend, and cleared from PMCDR upon
+  resume.  The first two cells are as described for fsl,mpc8548-pmc.  This
+  sleep controller only supports disabling devices during system sleep, or
+  permanently.
+
+  For "fsl,mpc8548-pmc" or "fsl,mpc8641d-pmc", Sleep specifiers consist of one
+  or two cells, the first of which will be ORed into DEVDISR (and the second
+  into DEVDISR2, if present -- this cell should be zero or absent if the
+  hardware does not have DEVDISR2) upon a request for permanent device
+  disabling.  This sleep controller does not support configuring devices to
+  disable during system sleep (unless supported by another compatible match),
+  or dynamically.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: fsl,mpc8315-pmc
+          - const: fsl,mpc8313-pmc
+          - const: fsl,mpc8349-pmc
+
+      - items:
+          - enum:
+              - fsl,mpc8313-pmc
+              - fsl,mpc8323-pmc
+              - fsl,mpc8360-pmc
+              - fsl,mpc8377-pmc
+              - fsl,mpc8378-pmc
+              - fsl,mpc8379-pmc
+          - const: fsl,mpc8349-pmc
+
+      - items:
+          - const: fsl,p1022-pmc
+          - const: fsl,mpc8536-pmc
+          - const: fsl,mpc8548-pmc
+
+      - items:
+          - enum:
+              - fsl,mpc8536-pmc
+              - fsl,mpc8568-pmc
+              - fsl,mpc8569-pmc
+          - const: fsl,mpc8548-pmc
+
+      - enum:
+          - fsl,mpc8548-pmc
+          - fsl,mpc8641d-pmc
+
+    description: |
+      "fsl,mpc8349-pmc" should be listed for any chip whose PMC is
+      compatible.  "fsl,mpc8313-pmc" should also be listed for any chip
+      whose PMC is compatible, and implies deep-sleep capability.
+
+      "fsl,mpc8548-pmc" should be listed for any chip whose PMC is
+      compatible.  "fsl,mpc8536-pmc" should also be listed for any chip
+      whose PMC is compatible, and implies deep-sleep capability.
+
+      "fsl,mpc8641d-pmc" should be listed for any chip whose PMC is
+      compatible; all statements below that apply to "fsl,mpc8548-pmc" also
+      apply to "fsl,mpc8641d-pmc".
+
+      Compatibility does not include bit assignments in SCCR/PMCDR/DEVDISR; these
+      bit assignments are indicated via the sleep specifier in each device's
+      sleep property.
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  fsl,mpc8313-wakeup-timer:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      For "fsl,mpc8313-pmc"-compatible devices, this is a phandle to an
+      "fsl,gtm" node on which timer 4 can be used as a wakeup source from deep
+      sleep.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,mpc8349-pmc
+    then:
+      properties:
+        reg:
+          items:
+            - description: PMC block
+            - description: Clock Configuration block
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,mpc8548-pmc
+              - fsl,mpc8641d-pmc
+    then:
+      properties:
+        reg:
+          items:
+            - description: 32-byte block beginning with DEVDISR
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmc: power@b00 {
+        compatible = "fsl,mpc8377-pmc", "fsl,mpc8349-pmc";
+        reg = <0xb00 0x100>, <0xa00 0x100>;
+        interrupts = <80 IRQ_TYPE_LEVEL_LOW>;
+    };
+
+  - |
+    power@e0070 {
+        compatible = "fsl,mpc8548-pmc";
+        reg = <0xe0070 0x20>;
+    };
+
+...

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250226-fslpmc-yaml-90dc69fb7d2a

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>


