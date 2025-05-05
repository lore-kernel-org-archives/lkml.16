Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A352641EA;
	Mon,  5 May 2025 14:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456391; cv=none; b=qUYq0+zyL8+nzuxHIPw4q8JKimGa4i70OCUdbzBHb6cSuKRxtI0OqSq7NfVjU6AyLH02UmNnIXB+Ceo2sVdamNb0sK9PIitxRfbyZ/olKchyq1DQenxgs1nYv1ON2nDzUiA3ppvyEiEjgO/VNlcAwUXdNxRFxTHXR+6WUnyyMeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456391; c=relaxed/simple;
	bh=pcb3PzyzAH+py91SttXCcoeHaJ/yPDYGs6NL6bZ1Evg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKHGD5Atow0b1BHUjarb5dRsfu1JeDtVVhZnXESDREMNncrCJ67fKbfMdS2UiQnuf6XUoyfS/1HptFXm6zd8VdiDJXvBgsDPCLhzRIXxEKIcF+SmU5hYSvk9nla54cj6Xk1Ma2juKsObAoIan8mFovTPixfj18q1Wv1L0kxeiUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tndJVzyP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tndJVzyP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2928CC4CEEE;
	Mon,  5 May 2025 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456390;
	bh=pcb3PzyzAH+py91SttXCcoeHaJ/yPDYGs6NL6bZ1Evg=;
	h=From:To:Cc:Subject:Date:From;
	b=tndJVzyPW54kK6N//Bl9C4xWLRtESS5GZ8wHP3DZRW1aEJkwlC+bSAuEgPdwkvCyz
	 mY1h2RjpkU40kH5dFYozdeRnAeNGBsQAo8P3hDjWaWkuHBbPcLODJjYJMwCsdEekOt
	 bVfpobsfhz+6kZWboNa/1QKZ7WPUlhDnSvg0evZjyCYysLkZdqYOJluOSKPBMHrBPU
	 qRmo4zsiNblm1tMG9YY3g+cnJbucKTrdKmcht6yZliDCFnjBOr/qTD8Xgj/9SbPsLj
	 u4cewsZND07yi+IKsPQzSCOZqjHDUhcjomTW12C0sUZ9GcnstsppQE4WSQwVwp38+f
	 hyIubxjscwrVw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert cdns,xtensa-{mx,pic} to DT schema
Date: Mon,  5 May 2025 09:46:25 -0500
Message-ID: <20250505144626.1287879-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Xtensa interrupt controller bindings to DT schema. Both only
vary by the compatible string, so combine them into 1 schema doc.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/cdns,xtensa-mx.txt   | 18 -------
 .../interrupt-controller/cdns,xtensa-pic.txt  | 25 ----------
 .../interrupt-controller/cdns,xtensa-pic.yaml | 50 +++++++++++++++++++
 3 files changed, 50 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-mx.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-mx.txt b/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-mx.txt
deleted file mode 100644
index d4de980e55fa..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-mx.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Xtensa Interrupt Distributor and Programmable Interrupt Controller (MX)
-
-Required properties:
-- compatible: Should be "cdns,xtensa-mx".
-
-Remaining properties have exact same meaning as in Xtensa PIC
-(see cdns,xtensa-pic.txt).
-
-Examples:
-	pic: pic {
-		compatible = "cdns,xtensa-mx";
-		/* one cell: internal irq number,
-		 * two cells: second cell == 0: internal irq number
-		 *            second cell == 1: external irq number
-		 */
-		#interrupt-cells = <2>;
-		interrupt-controller;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.txt
deleted file mode 100644
index 026ef4cfc1d5..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Xtensa built-in Programmable Interrupt Controller (PIC)
-
-Required properties:
-- compatible: Should be "cdns,xtensa-pic".
-- interrupt-controller: Identifies the node as an interrupt controller.
-- #interrupt-cells: The number of cells to define the interrupts.
-  It may be either 1 or 2.
-  When it's 1, the first cell is the internal IRQ number.
-  When it's 2, the first cell is the IRQ number, and the second cell
-  specifies whether it's internal (0) or external (1).
-  Periferals are usually connected to a fixed external IRQ, but for different
-  core variants it may be mapped to different internal IRQ.
-  IRQ sensitivity and priority are fixed for each core variant and may not be
-  changed at runtime.
-
-Examples:
-	pic: pic {
-		compatible = "cdns,xtensa-pic";
-		/* one cell: internal irq number,
-		 * two cells: second cell == 0: internal irq number
-		 *            second cell == 1: external irq number
-		 */
-		#interrupt-cells = <2>;
-		interrupt-controller;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.yaml
new file mode 100644
index 000000000000..6773207fee01
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Max Filippov <jcmvbkbc@gmail.com>
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/cdns,xtensa-pic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xtensa Interrupt Controllers
+
+maintainers:
+  - Max Filippov <jcmvbkbc@gmail.com>
+
+description:
+  Xtensa Interrupt Distributor and Programmable Interrupt Controller (MX) and
+  Xtensa built-in Programmable Interrupt Controller (PIC)
+
+properties:
+  compatible:
+    enum:
+      - cdns,xtensa-mx
+      - cdns,xtensa-pic
+
+  '#interrupt-cells':
+    enum: [ 1, 2 ]
+    description:
+      Number of cells to define the interrupts. When 1, the first cell is the
+      internal IRQ number; when 2, the second cell specifies internal (0) or
+      external (1).
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "cdns,xtensa-pic";
+        /* one cell: internal irq number,
+         * two cells: second cell == 0: internal irq number
+         *            second cell == 1: external irq number
+         */
+        #interrupt-cells = <2>;
+        interrupt-controller;
+    };
-- 
2.47.2

