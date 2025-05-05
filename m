Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301B525D1EF;
	Mon,  5 May 2025 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456417; cv=none; b=ObGqBAAal3Vw4GHEnuUwubBUnSCqeN3gvvYBA0ngIQCzWfZ+Dt8iAeh6B7i+snx8N3vHmZzyBhCd3UvpULbxkMhgQgueAHlQGf2gSNVNgnvfjGkCD2P3cFxTKRljuS5Yd+bMm4DYq6Nv/uU1IFbFg+YFp2QZ4Qkp8PI2YiYGPIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456417; c=relaxed/simple;
	bh=95acQvb2sVgVK83sphVyO2PdVAY5JPA6JA+VaCSLWg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwmVUgCIPipuG95GMNGeENwn/48Rnws0k8kbvEY8CINOcH+cx7JLyJghW59uSA8le/SRDbX6Jn8eGpLhXusp1ty4V8+5ritXhAx3kO/kslEIOjErP3U9TplEPcby1ebt+7/+7QQeFHKq+Q7m6aifBmZrwAKxydHHPs2sIdYqpX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFnkNPIN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFnkNPIN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE28C4CEEF;
	Mon,  5 May 2025 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456416;
	bh=95acQvb2sVgVK83sphVyO2PdVAY5JPA6JA+VaCSLWg8=;
	h=From:To:Cc:Subject:Date:From;
	b=bFnkNPINPadyyeBIt5i/mH/651CcQGO6HHa1bUWM9/IvydVQEF0cQvbkO09l3CY4T
	 cnIT8vJXs5zMAcq1XI+vbjwabSi8D/4hcPadw71lSVaee4q3tulkGUQu2cLJPgG0lp
	 uPaw5+Pn3FukJhWTKx4GZrgf2JHvJ539+hjIJF559YG4z8IUaEe8YQIP7zSB3FuMJ3
	 MK7PiLuZ97lFRIXHdBbPXNjJv70D+rR70pPtCyvTY760evBKwGDI9j6M+9vpBDCut1
	 nqJlVs0AhXAPyicI8F1iDL1uEycNooIfM/NvFKTlPk4nKJUw7e2LcfmAJc5Wn/6UdG
	 c6s2XpJq3HVmQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert faraday,ftintc010 to DT schema
Date: Mon,  5 May 2025 09:46:53 -0500
Message-ID: <20250505144654.1288979-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Faraday FTINTC010 interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../faraday,ftintc010.txt                     | 25 ---------
 .../faraday,ftintc010.yaml                    | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/faraday,ftintc010.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/faraday,ftintc010.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/faraday,ftintc010.txt b/Documentation/devicetree/bindings/interrupt-controller/faraday,ftintc010.txt
deleted file mode 100644
index 24428d47f487..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/faraday,ftintc010.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Faraday Technologt FTINTC010 interrupt controller
-
-This interrupt controller is a stock IP block from Faraday Technology found
-in the Gemini SoCs and other designs.
-
-Required properties:
-- compatible: must be one of
-  "faraday,ftintc010"
-  "cortina,gemini-interrupt-controller" (deprecated)
-- reg: The register bank for the interrupt controller.
-- interrupt-controller: Identifies the node as an interrupt controller
-- #interrupt-cells: The number of cells to define the interrupts.
-  Must be 2 as the controller can specify level or rising edge
-  IRQs. The bindings follows the standard binding for controllers
-  with two cells specified in
-  interrupt-controller/interrupts.txt
-
-Example:
-
-interrupt-controller@48000000 {
-	compatible = "faraday,ftintc010"
-	reg = <0x48000000 0x1000>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/faraday,ftintc010.yaml b/Documentation/devicetree/bindings/interrupt-controller/faraday,ftintc010.yaml
new file mode 100644
index 000000000000..980e5c45f25b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/faraday,ftintc010.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+---
+$id: http://devicetree.org/schemas/interrupt-controller/faraday,ftintc010.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Faraday Technology FTINTC010 interrupt controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description:
+  This interrupt controller is a stock IP block from Faraday Technology found
+  in the Gemini SoCs and other designs.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: moxa,moxart-ic
+          - const: faraday,ftintc010
+      - enum:
+          - faraday,ftintc010
+          - cortina,gemini-interrupt-controller
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  resets:
+    maxItems: 1
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
+    interrupt-controller@48000000 {
+        compatible = "faraday,ftintc010";
+        reg = <0x48000000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.47.2

