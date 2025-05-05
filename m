Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1AE25CC42;
	Mon,  5 May 2025 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456530; cv=none; b=vEr89myck5rHbWHENBWgofKwoMIavPiQQc4EVQuPYB0nwr2dEORGsVBlR80bTs3vkDZZswfGqQrDfSFZUuw+DxTq2RG9WBwWDX9F2onkH01SoLuW2WhG4YfqnaqqDCrmO4ZCTnuvRHTdk/H5cUs3dKHJfs3sEd0hEyoIMrXIfEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456530; c=relaxed/simple;
	bh=9zZBzLaqVt0S99WcRk3WxkhHRhq4ungnb0NHSPN82R4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dzfg1JaYhPzGlmfsVrCzEYV0t1qJo+2qvbgcm6iXHdFQ0bFh/fip+0MXC39nOxZ2hGqMeLIwOvTEatDU/yeIYcCVfNEkzRWsYpzZY3HLwunPOd4Rph3myuX5BMi/N+zekpXByaJ0ffZqzdVFJizRDg7467TDRTP6G3NjMHKWEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f55Wdt53; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f55Wdt53"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE0EC4CEE4;
	Mon,  5 May 2025 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456529;
	bh=9zZBzLaqVt0S99WcRk3WxkhHRhq4ungnb0NHSPN82R4=;
	h=From:To:Cc:Subject:Date:From;
	b=f55Wdt539OfPMCOeeBZEey1+yRNzPu/gbXqk2hVhuKoifbYem0TbBpf7mb5Hw1qJV
	 rzpll9i09aX8G0HsXPg9VeLdpfQaeZES77mbU/YIQkG8+xG91YjkG0dZaYmvSrJZQN
	 AtwSM9CgHFHiTp1O96yQkvUV8qLa7urhLcVJYEod82neZAUfjlLbycZfgYfbaW0vAX
	 j/rR6Q0Z7AWmcI54uIdnqdsweSrDufi0YNj9BtyNWrLOpCAUlKZ7umPom6QB8nOC5B
	 0gNC3nPtEoDQqXo7hhzUnCwPnuoa9Kfkmmp0AYUXei8QOjIDQMFLDSnf4OJu59tr0E
	 XJM8iDzEcwmhA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Zhen Lei <thunder.leizhen@huawei.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert snps,dw-apb-ictl to DT schema
Date: Mon,  5 May 2025 09:48:37 -0500
Message-ID: <20250505144842.1292840-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Synopsys DW-APB interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/snps,dw-apb-ictl.txt | 43 -------------
 .../snps,dw-apb-ictl.yaml                     | 64 +++++++++++++++++++
 2 files changed, 64 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
deleted file mode 100644
index 2db59df9408f..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-Synopsys DesignWare APB interrupt controller (dw_apb_ictl)
-
-Synopsys DesignWare provides interrupt controller IP for APB known as
-dw_apb_ictl. The IP is used as secondary interrupt controller in some SoCs with
-APB bus, e.g. Marvell Armada 1500. It can also be used as primary interrupt
-controller in some SoCs, e.g. Hisilicon SD5203.
-
-Required properties:
-- compatible: shall be "snps,dw-apb-ictl"
-- reg: physical base address of the controller and length of memory mapped
-  region starting with ENABLE_LOW register
-- interrupt-controller: identifies the node as an interrupt controller
-- #interrupt-cells: number of cells to encode an interrupt-specifier, shall be 1
-
-Additional required property when it's used as secondary interrupt controller:
-- interrupts: interrupt reference to primary interrupt controller
-
-The interrupt sources map to the corresponding bits in the interrupt
-registers, i.e.
-- 0 maps to bit 0 of low interrupts,
-- 1 maps to bit 1 of low interrupts,
-- 32 maps to bit 0 of high interrupts,
-- 33 maps to bit 1 of high interrupts,
-- (optional) fast interrupts start at 64.
-
-Example:
-	/* dw_apb_ictl is used as secondary interrupt controller */
-	aic: interrupt-controller@3000 {
-		compatible = "snps,dw-apb-ictl";
-		reg = <0x3000 0xc00>;
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		interrupt-parent = <&gic>;
-		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	/* dw_apb_ictl is used as primary interrupt controller */
-	vic: interrupt-controller@10130000 {
-		compatible = "snps,dw-apb-ictl";
-		reg = <0x10130000 0x1000>;
-		interrupt-controller;
-		#interrupt-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml
new file mode 100644
index 000000000000..6b59b600a037
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/snps,dw-apb-ictl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare APB interrupt controller
+
+maintainers:
+  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
+  - Zhen Lei <thunder.leizhen@huawei.com>
+
+description:
+  Synopsys DesignWare provides interrupt controller IP for APB known as
+  dw_apb_ictl. The IP is used as secondary interrupt controller in some SoCs
+  with APB bus, e.g. Marvell Armada 1500. It can also be used as primary
+  interrupt controller in some SoCs, e.g. Hisilicon SD5203.
+
+properties:
+  compatible:
+    const: snps,dw-apb-ictl
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupts:
+    maxItems: 1
+    description: >
+      Interrupt input connected to the primary interrupt controller when used
+      as a secondary controller. The interrupt specifier maps to bits in the
+      low and high interrupt registers (0⇒bit 0 low, 1⇒bit 1 low, 32⇒bit 0 high,
+      33⇒bit 1 high, fast interrupts start at 64).
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller@3000 {
+        compatible = "snps,dw-apb-ictl";
+        reg = <0x3000 0xc00>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+    };
+  - |
+    interrupt-controller@10130000 {
+        compatible = "snps,dw-apb-ictl";
+        reg = <0x10130000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
-- 
2.47.2

