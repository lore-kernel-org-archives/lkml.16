Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A07025DB02;
	Mon,  5 May 2025 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456403; cv=none; b=ItUseNvZJwCMzjTGuhND/LnxGKLuBT7K4fkK3mMKbtj0myd2aeHvT9eVYUfEpWM9NLhLesRdZaJjda+2gm041lvghA2lxmEMc/t5iIhoYpwGjFtNS4I75hFOBnw3UneHbY0HcYRYYTefnO6enZyeNjh3HRJ92xCA9XHkLMV8XCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456403; c=relaxed/simple;
	bh=pyOvFuMD8C4oTY5PeHf5lb+a9f9S175JCHNvx48j63w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HeTJS8o69kKCMCtcU9T3jFSHSFQhmevcCX0glUds6Tk43eGIbNsntzIXP51cpbrbNrNKFm4ySWtFiMEGS43deg+2/bd2YhOGoEIa4N5/Sba7PVjsOT0d88AaXUfs6xEWuH2MCbveFbrnxWumMWY3ZYQtGDLs4fQvcHmvYaz9CxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBEn/1vP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBEn/1vP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F22AC4CEE4;
	Mon,  5 May 2025 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456403;
	bh=pyOvFuMD8C4oTY5PeHf5lb+a9f9S175JCHNvx48j63w=;
	h=From:To:Cc:Subject:Date:From;
	b=TBEn/1vPExlbbZmD+r6RMmK4M9nIBR1FjPrP3IfgnyL6N5G0tPv5E68wgmN6/NJjc
	 CYm3wK3WeGTEJZRRvidAEuRKyCjmUX7sBitj238XhA55yY+auZlTSBv68BXXUhwalE
	 VSpVoHYQbsiAxkiRlGuCgHmRH/9Fej2l0QM95vbduLviSMcOi8oxcwXSrmqlxSj+Ey
	 YwhfVfbdIyvcNkDp2UV//T31XICDzB7VzgrP33CH+XFdr+dcehj0e8iL1/ATt9XGkU
	 9qVN3AAV1og/3Gmb3Q5x6KAI89LsZ6QfzDAFAIgX3CSgR4ZBNOv8On/PGUtBWr7VM4
	 52zlaREkiJbaA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert csky,mpintc to DT schema
Date: Mon,  5 May 2025 09:46:39 -0500
Message-ID: <20250505144640.1288458-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the C-SKY Multi-processor interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/csky,mpintc.txt      | 52 -------------------
 .../interrupt-controller/csky,mpintc.yaml     | 43 +++++++++++++++
 2 files changed, 43 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
deleted file mode 100644
index e6bbcae4d07f..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-===========================================
-C-SKY Multi-processors Interrupt Controller
-===========================================
-
-C-SKY Multi-processors Interrupt Controller is designed for ck807/ck810/ck860
-SMP soc, and it also could be used in non-SMP system.
-
-Interrupt number definition:
-  0-15  : software irq, and we use 15 as our IPI_IRQ.
- 16-31  : private  irq, and we use 16 as the co-processor timer.
- 31-1024: common irq for soc ip.
-
-Interrupt trigger mode: (Defined in dt-bindings/interrupt-controller/irq.h)
- IRQ_TYPE_LEVEL_HIGH (default)
- IRQ_TYPE_LEVEL_LOW
- IRQ_TYPE_EDGE_RISING
- IRQ_TYPE_EDGE_FALLING
-
-=============================
-intc node bindings definition
-=============================
-
-	Description: Describes SMP interrupt controller
-
-	PROPERTIES
-
-	- compatible
-		Usage: required
-		Value type: <string>
-		Definition: must be "csky,mpintc"
-	- #interrupt-cells
-		Usage: required
-		Value type: <u32>
-		Definition: <2>
-	- interrupt-controller:
-		Usage: required
-
-Examples: ("interrupts = <irq_num IRQ_TYPE_XXX>")
----------
-#include <dt-bindings/interrupt-controller/irq.h>
-
-	intc: interrupt-controller {
-		compatible = "csky,mpintc";
-		#interrupt-cells = <2>;
-		interrupt-controller;
-	};
-
-	device: device-example {
-		...
-		interrupts = <34 IRQ_TYPE_EDGE_RISING>;
-		interrupt-parent = <&intc>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.yaml b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.yaml
new file mode 100644
index 000000000000..3df7739e31c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/csky,mpintc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: C-SKY Multi-processors Interrupt Controller
+
+maintainers:
+  - Guo Ren <guoren@kernel.org>
+
+description: >
+  C-SKY Multi-processors Interrupt Controller is designed for ck807/ck810/ck860
+  SMP soc, and it also could be used in non-SMP system.
+
+  Interrupt number definition:
+    0-15  : software irq, and we use 15 as our IPI_IRQ.
+    16-31  : private  irq, and we use 16 as the co-processor timer.
+    31-1024: common irq for soc ip.
+
+properties:
+  compatible:
+    const: csky,mpintc
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - "#interrupt-cells"
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "csky,mpintc";
+        #interrupt-cells = <2>;
+        interrupt-controller;
+    };
-- 
2.47.2

