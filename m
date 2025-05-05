Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C859025D216;
	Mon,  5 May 2025 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456437; cv=none; b=MnWMjLj4OtyKlRqKxqNta9MD/iCUUmuJHmP6UYJzaqLjFYbpjfdjuo6PQKqqPC5V0BFkDOnCrhEkElf8uSM904/EgXZuqUAzn7gTBQ0TDJcWwZI5mBmLrpTH/jcBrPSHnCjupr8F/2PY53exgiF5l/w6Ck+ekYHxZD2V0WNxBtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456437; c=relaxed/simple;
	bh=STnXTlZr84cUS33MAMIAbReD/oespH9o2ryhVqXt13w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e2DQWpZKNGTchm3GsLjHOWpP9sUNjZFfOkZslTa8F4WsvrlB1jcKo4hIUjI1UzG/8gdrfr3HJJiXcTtdZF8zCo9RI8lZYAccOcRmVIFugGj+o93mK2uoQ3uy7xHWaTq8xZmptsl0MMsjfJi05++A/W9xa6WsRyBMmLleCDycnYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Czh5ZhlH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Czh5ZhlH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B495C4CEE4;
	Mon,  5 May 2025 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456434;
	bh=STnXTlZr84cUS33MAMIAbReD/oespH9o2ryhVqXt13w=;
	h=From:To:Cc:Subject:Date:From;
	b=Czh5ZhlHQ+mBn0y/nSiQ5R1iB2O8OlCVmzNQNLydRIKfZ0NjtD0eg+/I1F9Gluc1a
	 OSMTVbhGynhir5QMDpXegzDJgAwAba+g0R+fQBf09Hlq/qhxnNe+t2SI+qj1oqHJuc
	 tiCSOYPNNfAOBAKsMhTaqaCv+gF2vKiDfdUNirTIeTfrOO6tz9o1cgZ4Mnv8P/3w8Q
	 OG0mo4gxKd7yMs8l+qLSOweJa0DlZhhkKfObs4jYB/0MqRmww7dOXlzYzmNg2GwyXj
	 KZ8yiJ2GLJCUdPMbVq4d04SLV/fNBQRg0Z+da51gIqS3zgQhfcYJtARuuViQ/Nv3vy
	 8cg7aJJgCCgYg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Tang <dt.tangr@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert lsi,zevio-intc to DT schema
Date: Mon,  5 May 2025 09:47:10 -0500
Message-ID: <20250505144711.1289677-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI-NSPIRE interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

'#interrupt-cells' was missing from the property list, but used in the
example, so add it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/lsi,zevio-intc.txt   | 18 --------
 .../interrupt-controller/lsi,zevio-intc.yaml  | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/lsi,zevio-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/lsi,zevio-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/lsi,zevio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/lsi,zevio-intc.txt
deleted file mode 100644
index aee38e7c13e7..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/lsi,zevio-intc.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-TI-NSPIRE interrupt controller
-
-Required properties:
-- compatible: Compatible property value should be "lsi,zevio-intc".
-
-- reg: Physical base address of the controller and length of memory mapped
-	region.
-
-- interrupt-controller : Identifies the node as an interrupt controller
-
-Example:
-
-interrupt-controller {
-	compatible = "lsi,zevio-intc";
-	interrupt-controller;
-	reg = <0xDC000000 0x1000>;
-	#interrupt-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/lsi,zevio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/lsi,zevio-intc.yaml
new file mode 100644
index 000000000000..e66b25f579c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/lsi,zevio-intc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Daniel Tang <dt.tangr@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/lsi,zevio-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI-NSPIRE Interrupt Controller
+
+maintainers:
+  - Daniel Tang <dt.tangr@gmail.com>
+
+description: |
+  TI-NSPIRE interrupt controller
+
+properties:
+  compatible:
+    const: lsi,zevio-intc
+
+  reg:
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
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@dc000000 {
+        compatible = "lsi,zevio-intc";
+        interrupt-controller;
+        reg = <0xdc000000 0x1000>;
+        #interrupt-cells = <1>;
+    };
-- 
2.47.2

