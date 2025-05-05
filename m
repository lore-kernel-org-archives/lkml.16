Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8625DB09;
	Mon,  5 May 2025 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456407; cv=none; b=SVzA6P2tQDAZxEn7fuc0CZuwglpCXzLYIlaguxEANSFokNRr0zJGW0FjvCdVuvLtPuYFWnnI9kNkLAsFWHcWEMntPyL8XA8Chi7tl6Vo0zcSJI47zohI+EaXrSX7Apu7NqJFncYdvfD7oJhcUP57JPYKNNyDv0l4a2QdMoD3Oao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456407; c=relaxed/simple;
	bh=ERHiE7jfGbGlun1ZgZ2HCmXIpyxX1q5s9y081hy3rKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKXt0V1ghhBrXAI5h81j30RCZY8tkpiMdDo4+DuOrQ3bfX763OM5dt/QIfP+kX+gTPFpVuzw7cYfDsgRF/GihMMGQNDZMWqhR0Sq33S4WiE9qaTni3/IWVAYf5VfYZfRw8UeDhjzedv0wKOWHHYil+zzTEbyjJN+bT3M16Ode6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eqm3zwmd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eqm3zwmd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B55C4CEE4;
	Mon,  5 May 2025 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456407;
	bh=ERHiE7jfGbGlun1ZgZ2HCmXIpyxX1q5s9y081hy3rKg=;
	h=From:To:Cc:Subject:Date:From;
	b=Eqm3zwmd/yCKSUaVYeOY9/caSyMOp/lECJPoFIpkTyvxQ+AJ2xlMS+UdwR8Ns7nd9
	 Fk9OzT/PiavF+RercFPh8XjmXD6AsmOJ6TOtpYBq5MvcRhmx/05Of0G26gKTN89lLH
	 qGWrjnLDks6KV/2UN3RQj9FGbKFUEKGMNpnPyorxBWjgaUhBRWTRKBb251d3Z9vKJ1
	 43Ns6TmMaI3dGrNFNfCbCV82gNv4eJ+RAS1EiwwU9YE8de55CxI9gw3lcfABEtyZH5
	 tIVdoR5qyzgk3zOHiMfD5vhlkfUuidJTm2vfEk1Aq4v7u1Snu9FEmn0msft1iEUmLe
	 jQ+iLb2ZY3WkA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert cnxt,cx92755-ic to DT schema
Date: Mon,  5 May 2025 09:46:43 -0500
Message-ID: <20250505144644.1288617-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Conexant Digicolor interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/cnxt,cx92755-ic.yaml | 47 +++++++++++++++++++
 .../interrupt-controller/digicolor-ic.txt     | 21 ---------
 2 files changed, 47 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
new file mode 100644
index 000000000000..3f016cf47812
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/cnxt,cx92755-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Conexant Digicolor Interrupt Controller
+
+maintainers:
+  - Baruch Siach <baruch@tkos.co.il>
+
+description: Conexant Digicolor Interrupt Controller
+
+properties:
+  compatible:
+    const: cnxt,cx92755-ic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  syscon:
+    description: A phandle to the syscon node describing UC registers
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@f0000040 {
+        compatible = "cnxt,cx92755-ic";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        reg = <0xf0000040 0x40>;
+        syscon = <&uc_regs>;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
deleted file mode 100644
index 42d41ec84c7b..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Conexant Digicolor Interrupt Controller
-
-Required properties:
-
-- compatible : should be "cnxt,cx92755-ic"
-- reg : Specifies base physical address and size of the interrupt controller
-  registers (IC) area
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 1.
-- syscon: A phandle to the syscon node describing UC registers
-
-Example:
-
-	intc: interrupt-controller@f0000040 {
-		compatible = "cnxt,cx92755-ic";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		reg = <0xf0000040 0x40>;
-		syscon = <&uc_regs>;
-	};
-- 
2.47.2

